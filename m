Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D462222E4D
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 23:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgGPV7e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 17:59:34 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46118 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbgGPV7e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 17:59:34 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A615A4010A;
        Thu, 16 Jul 2020 21:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936773; bh=X1aNhzrA8/gpcPGlqubujRxScJg0ddfdcsD+KFUmCJg=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=l21V+Kh0PEiIf3JxhXnogYWjrhaiOj/MJ2oCkG2tBgaZQD+Ut57MiX7kCHxt2npIr
         4kTeFvvncEXoiHdl6b0HmSjSKQk7q9Vki+mbONUYf4XefeVnV2KZbKLNYFgR4qmZ5A
         dNOTPspT28eBFqgp+q8kb+4hl/+GNB+CWqe7czIXVEAjx/6FZh1S9gV+zkkTnG/YUq
         /H34Z8NzEDvoVkUgdig6oCBH19ID3Fg00pTQnmbKHKzOLpIcWtdjuCkD0EZfh7A7U9
         ZFv++5D7MY69lxR5nlDyRyinMtLSAQ0eqLBE9feR6kx5JcuWuB2jNeXRkCJGM/H+wP
         9WkbLpiJOLP9w==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 8ECCCA0258;
        Thu, 16 Jul 2020 21:59:32 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:59:32 -0700
Date:   Thu, 16 Jul 2020 14:59:32 -0700
Message-Id: <634bc730b3209698bdb6057513e409889fb0e98e.1594935978.git.thinhn@synopsys.com>
In-Reply-To: <cover.1594935978.git.thinhn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 10/11] usb: dwc3: gadget: Track connected lane and sublink speed
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
 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 92ab65a46771..63178549428d 100644
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
index 01bdd51f6b47..87a69a096b57 100644
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

