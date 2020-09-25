Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E6D277E1C
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgIYCmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:42:53 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49624 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726764AbgIYCmw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:42:52 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 08AEAC0A94;
        Fri, 25 Sep 2020 02:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001772; bh=N8B/ahzlDKfLaa0JDHERNFsxnj+xAApFPjbboFlztJI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=e02anmTbT4gYe9ZmE4BH8ZqczUZ7bsPPi4L43zFwA0hssXloUDVNAsMjOLOyK4xjz
         Mf1E8GTv24abkMRQ/4ovDtmwDWqvxjqNsMJo92g0Fr/oxqbVkGxB33GMQBuQHZtJXA
         acsmd3rqHzLfWwE2NFIwClSA+1dQmDdrbtFg2eV3GgixwUTHv1apsUbrotG4N8sbG1
         sIz5AbdQ2FGvmPVqiTpfs7zImwUNJfrilUpgj1rQQolkD/t7PjNfJYI3WvAz4jPvgb
         mhnUHoSrED3M2Weo9+APYil66l8uP7FD1WNLTb1QuQvwf+blNuy5d7J3KtpZWf2jtJ
         I/kpvQP+oGmCA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CD875A01F1;
        Fri, 25 Sep 2020 02:42:50 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:42:50 -0700
Date:   Thu, 24 Sep 2020 19:42:50 -0700
Message-Id: <cd6bb1716f20f961033326807683adef98446383.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 11/12] usb: dwc3: gadget: Track connected lane and sublink speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Track the number of lanes connected in gadget->num_lanes and track the
current sublink speed attribute ID for super-speed-plus operations.

Note: if the device is running in gen1x2, set the gadget->speed to
USB_SPEED_SUPER_PLUS.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- None

 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f456de5f551c..d304acd5fce0 100644
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
index 12399abd12fa..66b4ea8473a6 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2379,6 +2379,10 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 		}
 	}
+
+	if (DWC3_IP_IS(DWC32) && speed < USB_SPEED_SUPER_PLUS)
+		reg &= ~DWC3_DCFG_NUMLANES(~0);
+
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
 
 	spin_unlock_irqrestore(&dwc->lock, flags);
@@ -3275,12 +3279,19 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
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
+	dwc->gadget->num_lanes = lanes;
+	dwc->gadget->speed_ssid = 0;
+
 	/*
 	 * RAMClkSel is reset to 0 after USB reset, so it must be reprogrammed
 	 * each time on Connect Done.
@@ -3295,6 +3306,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 		dwc->gadget->ep0->maxpacket = 512;
 		dwc->gadget->speed = USB_SPEED_SUPER_PLUS;
+		dwc->gadget->speed_ssid = DWC3_SSP_SSID_GEN2;
 		break;
 	case DWC3_DSTS_SUPERSPEED:
 		/*
@@ -3315,7 +3327,13 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 		dwc->gadget->ep0->maxpacket = 512;
-		dwc->gadget->speed = USB_SPEED_SUPER;
+
+		if (lanes > 1) {
+			dwc->gadget->speed = USB_SPEED_SUPER_PLUS;
+			dwc->gadget->speed_ssid = DWC3_SSP_SSID_GEN1;
+		} else {
+			dwc->gadget->speed = USB_SPEED_SUPER;
+		}
 		break;
 	case DWC3_DSTS_HIGHSPEED:
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(64);
@@ -3813,6 +3831,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	dwc->gadget->sg_supported	= true;
 	dwc->gadget->name		= "dwc3-gadget";
 	dwc->gadget->lpm_capable	= true;
+	dwc->gadget->num_lanes		= 1;
 
 	/*
 	 * FIXME We might be setting max_speed to <SUPER, however versions
-- 
2.28.0

