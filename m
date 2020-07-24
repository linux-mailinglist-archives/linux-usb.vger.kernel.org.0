Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F6B22D253
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 01:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgGXXji (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 19:39:38 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:41910 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726592AbgGXXjh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 19:39:37 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 04011C0086;
        Fri, 24 Jul 2020 23:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595633977; bh=lZeGwT1yR2n2QFdZPG/ol7Ae+VgPq9BvRsNEb6xY9Ik=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=dRY1jjqTSPjuvYoJXi5UdAOuvBnphSBGtGYCChbuhZcaevwnUXvseDsUiIl8CdJUJ
         kK8OMz/XOo5HXOltHQR96DPkGuDxdiiZsAhTETZvtrXxErBYsCddKeKbhNZmovOQ+u
         GJu0vVYj5zCTkv0oBRZLJh88kpoGOFYxFwk6NUWS4qtysH4KEBCpz/5DXcFem+ZNij
         OVRdUgH+ocMD5dP1nYi5dL5TIKR0LbkxcGYQAG+aYCwPtOACQBVrBpniST4QWCw325
         vTZ3/XFcP+paypaUXTAUBmShg08GlSSFrGIg/fvpXP/seKD4e+9n950BDtcEp2XPcU
         lMgpRxpIyjhZw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id C8B20A006F;
        Fri, 24 Jul 2020 23:39:35 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 16:39:35 -0700
Date:   Fri, 24 Jul 2020 16:39:35 -0700
Message-Id: <5e58b7e96d10d039dc0394dfe9c3347e7b99d9c6.1595631457.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595631457.git.thinhn@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 11/12] usb: dwc3: gadget: Track connected lane and sublink speed
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
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 9466c4c36963..4a70b1e4d2a7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -460,6 +460,8 @@
 #define DWC3_DEVTEN_USBRSTEN		BIT(1)
 #define DWC3_DEVTEN_DISCONNEVTEN	BIT(0)
 
+#define DWC3_DSTS_CONNLANES(n)		(((n) >> 30) & 0x3) /* DWC_usb32 only */
+
 /* Device Status Register */
 #define DWC3_DSTS_DCNRD			BIT(29)
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index b7da4e1c81aa..05defaf0f745 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2328,6 +2328,10 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 		}
 	}
+
+	if (DWC3_IP_IS(DWC32) && speed < USB_SPEED_SUPER_PLUS)
+		reg &= ~DWC3_DCFG_NUMLANES(~0);
+
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
@@ -3199,12 +3203,19 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
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
@@ -3219,6 +3230,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 		dwc->gadget.ep0->maxpacket = 512;
 		dwc->gadget.speed = USB_SPEED_SUPER_PLUS;
+		dwc->gadget.speed_ssid = DWC3_SSP_SSID_GEN2;
 		break;
 	case DWC3_DSTS_SUPERSPEED:
 		/*
@@ -3239,7 +3251,13 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 
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
@@ -3720,6 +3738,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	dwc->gadget.sg_supported	= true;
 	dwc->gadget.name		= "dwc3-gadget";
 	dwc->gadget.lpm_capable		= true;
+	dwc->gadget.num_lanes		= 1;
 
 	/*
 	 * FIXME We might be setting max_speed to <SUPER, however versions
-- 
2.11.0

