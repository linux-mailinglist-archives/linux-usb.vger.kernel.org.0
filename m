Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E054CBE91
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 14:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbiCCNMO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 08:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiCCNMO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 08:12:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22CD186B9F
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 05:11:28 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nPlEt-0004ws-1x; Thu, 03 Mar 2022 14:11:27 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nPlEs-00Evbs-Dh; Thu, 03 Mar 2022 14:11:26 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, kernel@pengutronix.de
Subject: [PATCH v2] usb: dwc3: gadget: move cmd_endtransfer to extra function
Date:   Thu,  3 Mar 2022 14:11:21 +0100
Message-Id: <20220303131121.3557729-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <85e85927-82cc-fa8f-86a1-d9a5205bb7cc@synopsys.com>
References: <85e85927-82cc-fa8f-86a1-d9a5205bb7cc@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the extra function __dwc3_stop_active_transfer to
consolidate the same codepath.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc3/gadget.c | 68 +++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 37dbf6132731b7..baddf6196ceee2 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1673,6 +1673,39 @@ static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
 	return DWC3_DSTS_SOFFN(reg);
 }
 
+/**
+ * __dwc3_stop_active_transfer - stop the current active transfer
+ * @dep: isoc endpoint
+ * @force: set forcerm bit in the command
+ * @interrupt: command complete interrupt after End Transfer command
+ *
+ * When setting force, the ForceRM bit will be set. In that case
+ * the controller won't update the TRB progress on command
+ * completion. It also won't clear the HWO bit in the TRB.
+ * The command will also not complete immediatly in that case.
+ */
+
+static void __dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force, bool interrupt)
+{
+	struct dwc3_gadget_ep_cmd_params params;
+	u32 cmd;
+	int ret;
+
+	cmd = DWC3_DEPCMD_ENDTRANSFER;
+	cmd |= force ? DWC3_DEPCMD_HIPRI_FORCERM : 0;
+	cmd |= interrupt ? DWC3_DEPCMD_CMDIOC : 0;
+	cmd |= DWC3_DEPCMD_PARAM(dep->resource_index);
+	memset(&params, 0, sizeof(params));
+	ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
+	WARN_ON_ONCE(ret);
+	dep->resource_index = 0;
+
+	if (!interrupt)
+		dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
+	else if (!ret)
+		dep->flags |= DWC3_EP_END_TRANSFER_PENDING;
+}
+
 /**
  * dwc3_gadget_start_isoc_quirk - workaround invalid frame number
  * @dep: isoc endpoint
@@ -1842,21 +1875,8 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 	 * status, issue END_TRANSFER command and retry on the next XferNotReady
 	 * event.
 	 */
-	if (ret == -EAGAIN) {
-		struct dwc3_gadget_ep_cmd_params params;
-		u32 cmd;
-
-		cmd = DWC3_DEPCMD_ENDTRANSFER |
-			DWC3_DEPCMD_CMDIOC |
-			DWC3_DEPCMD_PARAM(dep->resource_index);
-
-		dep->resource_index = 0;
-		memset(&params, 0, sizeof(params));
-
-		ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
-		if (!ret)
-			dep->flags |= DWC3_EP_END_TRANSFER_PENDING;
-	}
+	if (ret == -EAGAIN)
+		__dwc3_stop_active_transfer(dep, false, true);
 
 	return ret;
 }
@@ -3597,10 +3617,6 @@ static void dwc3_reset_gadget(struct dwc3 *dwc)
 static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	bool interrupt)
 {
-	struct dwc3_gadget_ep_cmd_params params;
-	u32 cmd;
-	int ret;
-
 	if (!(dep->flags & DWC3_EP_TRANSFER_STARTED) ||
 	    (dep->flags & DWC3_EP_END_TRANSFER_PENDING))
 		return;
@@ -3632,19 +3648,7 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	 * This mode is NOT available on the DWC_usb31 IP.
 	 */
 
-	cmd = DWC3_DEPCMD_ENDTRANSFER;
-	cmd |= force ? DWC3_DEPCMD_HIPRI_FORCERM : 0;
-	cmd |= interrupt ? DWC3_DEPCMD_CMDIOC : 0;
-	cmd |= DWC3_DEPCMD_PARAM(dep->resource_index);
-	memset(&params, 0, sizeof(params));
-	ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
-	WARN_ON_ONCE(ret);
-	dep->resource_index = 0;
-
-	if (!interrupt)
-		dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
-	else
-		dep->flags |= DWC3_EP_END_TRANSFER_PENDING;
+	__dwc3_stop_active_transfer(dep, force, interrupt);
 }
 
 static void dwc3_clear_stall_all_ep(struct dwc3 *dwc)
-- 
2.30.2

