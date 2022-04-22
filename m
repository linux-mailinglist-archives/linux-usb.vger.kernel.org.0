Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720C850ADB9
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 04:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443311AbiDVCZo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 22:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443283AbiDVCZo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 22:25:44 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E194B1D9
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 19:22:52 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A4E1441EE3;
        Fri, 22 Apr 2022 02:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1650594172; bh=Zzp3rYSPLA2bmbfpZsG5OMOzRb23Mmexjz/qmmuI+E4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=U6n/9iN0KFb8TXe9GHXX4+KWlpR/HqxXVWGpFesDo/mJbdqDk4PRAEb+KaCvJzcwY
         sMhLeVIyA8i1TUNhgAVVs4n85XaKKnTBemX9SRTTw7LUjmMG1V6GK9eYt05PWuS2Bg
         x+hknuf/9f92rGCG+77DV822dTntZHx9o6JiqlA+6AbHhmNO+zRs+GMRHw6qp4komK
         Z5VdrfcbH1ueZRru5YG+2s0NG2magPEnLqdYSq7rlk6ypA05vakV7Vbj48t77FH3hm
         sA93t4c5q8+B+RzGx6/k0hjsUlp3EL0V0kuvrmkgzx9qLW9jO4A6f9/HY28KNCT3AN
         quL33j2gxa1Bg==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 4920AA00AC;
        Fri, 22 Apr 2022 02:22:50 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Thu, 21 Apr 2022 19:22:50 -0700
Date:   Thu, 21 Apr 2022 19:22:50 -0700
Message-Id: <6bacec56ecabb2c6e49a09cedfcac281fdc97de0.1650593829.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 4/6] usb: dwc3: ep0: Don't prepare beyond Setup stage
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since we can't guarantee that the host won't send new Setup packet
before going through the device-initiated disconnect, don't prepare
beyond the Setup stage and keep the device in EP0_SETUP_PHASE. This
ensures that the device-initated disconnect sequence can go through
gracefully. Note that the controller won't service the End Transfer
command if it can't DMA out the Setup packet.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/ep0.c    |  2 +-
 drivers/usb/dwc3/gadget.c | 29 +++++++++++++++++------------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 1064be5518f6..c47c696316dd 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -813,7 +813,7 @@ static void dwc3_ep0_inspect_setup(struct dwc3 *dwc,
 	int ret = -EINVAL;
 	u32 len;
 
-	if (!dwc->gadget_driver)
+	if (!dwc->gadget_driver || !dwc->connected)
 		goto out;
 
 	trace_dwc3_ctrl_req(ctrl);
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a86225dbaa2c..e5f07c0e8ad9 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2505,6 +2505,23 @@ static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
 	spin_lock_irqsave(&dwc->lock, flags);
 	dwc->connected = false;
 
+	/*
+	 * Per databook, when we want to stop the gadget, if a control transfer
+	 * is still in process, complete it and get the core into setup phase.
+	 */
+	if (dwc->ep0state != EP0_SETUP_PHASE) {
+		int ret;
+
+		reinit_completion(&dwc->ep0_in_setup);
+
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		ret = wait_for_completion_timeout(&dwc->ep0_in_setup,
+				msecs_to_jiffies(DWC3_PULL_UP_TIMEOUT));
+		spin_lock_irqsave(&dwc->lock, flags);
+		if (ret == 0)
+			dev_warn(dwc->dev, "timed out waiting for SETUP phase\n");
+	}
+
 	/*
 	 * In the Synopsys DesignWare Cores USB3 Databook Rev. 3.30a
 	 * Section 4.1.8 Table 4-7, it states that for a device-initiated
@@ -2537,18 +2554,6 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 		return 0;
 
 	dwc->softconnect = is_on;
-	/*
-	 * Per databook, when we want to stop the gadget, if a control transfer
-	 * is still in process, complete it and get the core into setup phase.
-	 */
-	if (!is_on && dwc->ep0state != EP0_SETUP_PHASE) {
-		reinit_completion(&dwc->ep0_in_setup);
-
-		ret = wait_for_completion_timeout(&dwc->ep0_in_setup,
-				msecs_to_jiffies(DWC3_PULL_UP_TIMEOUT));
-		if (ret == 0)
-			dev_warn(dwc->dev, "timed out waiting for SETUP phase\n");
-	}
 
 	/*
 	 * Avoid issuing a runtime resume if the device is already in the
-- 
2.28.0

