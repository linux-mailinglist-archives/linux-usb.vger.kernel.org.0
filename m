Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 703C74C704B
	for <lists+linux-usb@lfdr.de>; Mon, 28 Feb 2022 16:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237447AbiB1PJ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 10:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbiB1PJZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 10:09:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26D452B07
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 07:08:46 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nOhdl-0001d6-0w; Mon, 28 Feb 2022 16:08:45 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nOhdk-003eZ7-AS; Mon, 28 Feb 2022 16:08:44 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, kernel@pengutronix.de
Subject: [PATCH 3/3] usb: dwc3: gadget: EP_DELAY_START is only handled for non isoc eps
Date:   Mon, 28 Feb 2022 16:08:43 +0100
Message-Id: <20220228150843.870809-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228150843.870809-1-m.grzeschik@pengutronix.de>
References: <20220228150843.870809-1-m.grzeschik@pengutronix.de>
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

Refactor the codepath for handling DWC3_EP_DELAY_START condition
only being checked on non isoc endpoints.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc3/gadget.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index b89dadaef4db9d..d09bd66f498a69 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1901,17 +1901,6 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 	if (dep->flags & DWC3_EP_WAIT_TRANSFER_COMPLETE)
 		return 0;
 
-	/*
-	 * Start the transfer only after the END_TRANSFER is completed
-	 * and endpoint STALL is cleared.
-	 */
-	if ((dep->flags & DWC3_EP_END_TRANSFER_PENDING) ||
-	    (dep->flags & DWC3_EP_WEDGE) ||
-	    (dep->flags & DWC3_EP_STALL)) {
-		dep->flags |= DWC3_EP_DELAY_START;
-		return 0;
-	}
-
 	/*
 	 * NOTICE: Isochronous endpoints should NEVER be prestarted. We must
 	 * wait for a XferNotReady event so we will know what's the current
@@ -1927,6 +1916,17 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 
 			return 0;
 		}
+	} else {
+		/*
+		 * Start the transfer only after the END_TRANSFER is completed
+		 * and endpoint STALL is cleared.
+		 */
+		if ((dep->flags & DWC3_EP_END_TRANSFER_PENDING) ||
+		    (dep->flags & DWC3_EP_WEDGE) ||
+		    (dep->flags & DWC3_EP_STALL)) {
+			dep->flags |= DWC3_EP_DELAY_START;
+			return 0;
+		}
 	}
 
 	__dwc3_gadget_kick_transfer(dep);
-- 
2.30.2

