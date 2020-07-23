Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D6722A526
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 04:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387780AbgGWCNO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 22:13:14 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34966 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387467AbgGWCNM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 22:13:12 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E7711C0086;
        Thu, 23 Jul 2020 02:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595470392; bh=ZkNjsqnNI9Dx//BEB5X9/zF/pTQ+dyPlA/7emtjltCs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=HGt8aNLgfwT0g3gyX4NFNiV5q0SxZ/wG69nrVEq4VY/QUALNmvDx/nm4cKkN1daF+
         Y0FmdePb4fRiu/9E3VQ6jDGEx72dWizMyll7M3Q8hs1mIyZy0FssBXEv1fNb2vhraS
         G954ULVP5Vz0iu58BLfc+tsjUZCVBSUo7+fMCrzDN0SH6AAwYGJknM01JpX1Qr9pxy
         omWO0dQ8GI4A55aHV7Ws/Zs5Go2/FLUX7yD7ErYpNy3J/k8d1cOACDCynbtdAG/CVm
         XgHemrRNvYrAKUgANjGLOxSC9nBgnoFY3M1BnPr4zcouve1T+DeBUH5KaljWXZiDOk
         6UL8WRAzQlHNg==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B880FA0096;
        Thu, 23 Jul 2020 02:13:10 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 22 Jul 2020 19:13:10 -0700
Date:   Wed, 22 Jul 2020 19:13:10 -0700
Message-Id: <b58a1b48f8b570b29b310f4268c78dd37976a3a9.1595468673.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595468673.git.thinhn@synopsys.com>
References: <cover.1595468673.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 11/12] usb: dwc3: gadget: Track connected lane and sublink speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Track the number of lanes connected in gadget->num_lanes and track the
current sublink speed attribute ID for super-speed-plus operations.

Note: if the device is running in gen1x2, set the gadget->speed to
USB_SPEED_SUPER_PLUS.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 Changes in v2:
 - None

 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 36407a8e67b8..84e2150c1c0a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -464,6 +464,8 @@
 #define DWC3_DEVTEN_USBRSTEN		BIT(1)
 #define DWC3_DEVTEN_DISCONNEVTEN	BIT(0)
 
+#define DWC3_DSTS_CONNLANES(n)		(((n) >> 30) & 0x3) /* DWC_usb32 only */
+
 /* Device Status Register */
 #define DWC3_DSTS_DCNRD			BIT(29)
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 5671a6762c83..2bc29d74e75a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2306,6 +2306,10 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 		}
 	}
+
+	if (DWC3_IP_IS(DWC32) && speed < USB_SPEED_SUPER_PLUS)
+		reg &= ~DWC3_DCFG_NUMLANES(~0);
+
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
@@ -3175,12 +3179,19 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 	struct dwc3_ep		*dep;
 	int			ret;
 	u32			reg;
+	u8			lanes = 1;
 	u8			speed;
 
 	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
 	speed = reg & DWC3_DSTS_CONNECTSPD;
 	dwc->speed = speed;
 
+	if (DWC3_IP_IS(DWC32))
+		lanes = DWC3_DSTS_CONNLANES(reg) + 1;
+
+	dwc->gadget.num_lanes = lanes;
+	dwc->gadget.speed_ssid = 0;
+
 	/*
 	 * RAMClkSel is reset to 0 after USB reset, so it must be reprogrammed
 	 * each time on Connect Done.
@@ -3195,6 +3206,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 		dwc->gadget.ep0->maxpacket = 512;
 		dwc->gadget.speed = USB_SPEED_SUPER_PLUS;
+		dwc->gadget.speed_ssid = DWC3_SSP_SSID_GEN2;
 		break;
 	case DWC3_DSTS_SUPERSPEED:
 		/*
@@ -3215,7 +3227,13 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 		dwc->gadget.ep0->maxpacket = 512;
-		dwc->gadget.speed = USB_SPEED_SUPER;
+
+		if (lanes > 1) {
+			dwc->gadget.speed = USB_SPEED_SUPER_PLUS;
+			dwc->gadget.speed_ssid = DWC3_SSP_SSID_GEN1;
+		} else {
+			dwc->gadget.speed = USB_SPEED_SUPER;
+		}
 		break;
 	case DWC3_DSTS_HIGHSPEED:
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(64);
@@ -3696,6 +3714,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	dwc->gadget.sg_supported	= true;
 	dwc->gadget.name		= "dwc3-gadget";
 	dwc->gadget.lpm_capable		= true;
+	dwc->gadget.num_lanes		= 1;
 
 	/*
 	 * FIXME We might be setting max_speed to <SUPER, however versions
-- 
2.11.0

