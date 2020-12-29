Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BFE2E7523
	for <lists+linux-usb@lfdr.de>; Wed, 30 Dec 2020 00:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgL2XGj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 18:06:39 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:35289 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbgL2XGj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Dec 2020 18:06:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609283174; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qPSGGbSQ/whpFm0CGfEW2fSmc4Ym/F/rF5YoPwodicU=; b=LV7glgY9+29a/sjCWonzmhNJXyKr9OyKaYQEpVZP/pXMIWZLP1ResoeQpFJzT8H3G6ExEAob
 8sZceuIsh5PT26zHU9Nh2+WyktJqKCJRoJ53K8NvS/nLs7fFdpdYxlYwrsQeHzuchgrIRJ2w
 dd6yUOqksTojjIFzPsE00RBbjzA=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5febb646e61d77c9716c718d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Dec 2020 23:05:42
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76729C43461; Tue, 29 Dec 2020 23:05:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9EBF1C433C6;
        Tue, 29 Dec 2020 23:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9EBF1C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v2 2/2] usb: dwc3: gadget: Preserve UDC max speed setting
Date:   Tue, 29 Dec 2020 15:05:36 -0800
Message-Id: <1609283136-22140-3-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609283136-22140-1-git-send-email-wcheng@codeaurora.org>
References: <1609283136-22140-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB gadget/UDC driver can restrict the DWC3 controller speed using
dwc3_gadget_set_speed().  Store this setting into a variable, in order for
this setting to persist across controller resets due to runtime PM.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/core.h   |   1 +
 drivers/usb/dwc3/gadget.c | 108 ++++++++++++++++++++------------------
 2 files changed, 58 insertions(+), 51 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 2f04b3e42bf1..390d3deef0ba 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1119,6 +1119,7 @@ struct dwc3 {
 	u32			nr_scratch;
 	u32			u1u2;
 	u32			maximum_speed;
+	u32			gadget_max_speed;
 
 	u32			ip;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index babf977cadc0..c145da1d8ba5 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1941,6 +1941,61 @@ static void dwc3_stop_active_transfers(struct dwc3 *dwc)
 	}
 }
 
+static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
+{
+	u32			reg;
+
+	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg &= ~(DWC3_DCFG_SPEED_MASK);
+
+	/*
+	 * WORKAROUND: DWC3 revision < 2.20a have an issue
+	 * which would cause metastability state on Run/Stop
+	 * bit if we try to force the IP to USB2-only mode.
+	 *
+	 * Because of that, we cannot configure the IP to any
+	 * speed other than the SuperSpeed
+	 *
+	 * Refers to:
+	 *
+	 * STAR#9000525659: Clock Domain Crossing on DCTL in
+	 * USB 2.0 Mode
+	 */
+	if (DWC3_VER_IS_PRIOR(DWC3, 220A) &&
+	    !dwc->dis_metastability_quirk) {
+		reg |= DWC3_DCFG_SUPERSPEED;
+	} else {
+		switch (dwc->gadget_max_speed) {
+		case USB_SPEED_LOW:
+			reg |= DWC3_DCFG_LOWSPEED;
+			break;
+		case USB_SPEED_FULL:
+			reg |= DWC3_DCFG_FULLSPEED;
+			break;
+		case USB_SPEED_HIGH:
+			reg |= DWC3_DCFG_HIGHSPEED;
+			break;
+		case USB_SPEED_SUPER:
+			reg |= DWC3_DCFG_SUPERSPEED;
+			break;
+		case USB_SPEED_SUPER_PLUS:
+			if (DWC3_IP_IS(DWC3))
+				reg |= DWC3_DCFG_SUPERSPEED;
+			else
+				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
+			break;
+		default:
+			dev_err(dwc->dev, "invalid speed (%d)\n", dwc->gadget_max_speed);
+
+			if (DWC3_IP_IS(DWC3))
+				reg |= DWC3_DCFG_SUPERSPEED;
+			else
+				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
+		}
+	}
+	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+}
+
 static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 {
 	u32			reg;
@@ -1963,6 +2018,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on, int suspend)
 		if (dwc->has_hibernation)
 			reg |= DWC3_DCTL_KEEP_CONNECT;
 
+		__dwc3_gadget_set_speed(dwc);
 		dwc->pullups_connected = true;
 	} else {
 		reg &= ~DWC3_DCTL_RUN_STOP;
@@ -2325,59 +2381,9 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
 	unsigned long		flags;
-	u32			reg;
 
 	spin_lock_irqsave(&dwc->lock, flags);
-	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
-	reg &= ~(DWC3_DCFG_SPEED_MASK);
-
-	/*
-	 * WORKAROUND: DWC3 revision < 2.20a have an issue
-	 * which would cause metastability state on Run/Stop
-	 * bit if we try to force the IP to USB2-only mode.
-	 *
-	 * Because of that, we cannot configure the IP to any
-	 * speed other than the SuperSpeed
-	 *
-	 * Refers to:
-	 *
-	 * STAR#9000525659: Clock Domain Crossing on DCTL in
-	 * USB 2.0 Mode
-	 */
-	if (DWC3_VER_IS_PRIOR(DWC3, 220A) &&
-	    !dwc->dis_metastability_quirk) {
-		reg |= DWC3_DCFG_SUPERSPEED;
-	} else {
-		switch (speed) {
-		case USB_SPEED_LOW:
-			reg |= DWC3_DCFG_LOWSPEED;
-			break;
-		case USB_SPEED_FULL:
-			reg |= DWC3_DCFG_FULLSPEED;
-			break;
-		case USB_SPEED_HIGH:
-			reg |= DWC3_DCFG_HIGHSPEED;
-			break;
-		case USB_SPEED_SUPER:
-			reg |= DWC3_DCFG_SUPERSPEED;
-			break;
-		case USB_SPEED_SUPER_PLUS:
-			if (DWC3_IP_IS(DWC3))
-				reg |= DWC3_DCFG_SUPERSPEED;
-			else
-				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
-			break;
-		default:
-			dev_err(dwc->dev, "invalid speed (%d)\n", speed);
-
-			if (DWC3_IP_IS(DWC3))
-				reg |= DWC3_DCFG_SUPERSPEED;
-			else
-				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
-		}
-	}
-	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
-
+	dwc->gadget_max_speed = speed;
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

