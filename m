Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D658211C390
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbfLLCtv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:49:51 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:38170 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727809AbfLLCtv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:49:51 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A373CC000E;
        Thu, 12 Dec 2019 02:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118990; bh=5f0rlhIYNa0lMqoRagwFtq64rz1J16NJVuCT1SrKKtE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=hmAlt0UvqeMdDwuI0g5vnb3ha/px0XfUrIEmQonPOeg4YzB7b2D85gtTpSbwbepYt
         JnBwqCloDioW4VdPB76RLHqhzmRe8C9BJ6Y6ViPFj6h+FxIBW7DWzaBL5769ZEFrUX
         elsbqz7fIZVDsK+rWr00ZyOO0wIO03vfGQorGiB0AoKqHWjUV8kfoSBqkx254JETzU
         qbLcq9cOTwWA0U1Kce5SbLjOjbrbeDGYSAOzPBrAFOCc9P3+SMioN6IXSCqzjpbab7
         V4RIn5MSaOBVzCTIbsJOJWbwxn5aAXDy8r1aH6Zy/2apGgr3L0JBGANxbYYApKoyWG
         f2RLCUBNTU3qA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 76AAEA006D;
        Thu, 12 Dec 2019 02:49:49 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:49:49 -0800
Date:   Wed, 11 Dec 2019 18:49:49 -0800
Message-Id: <3507900b56e2e296d325e0bd65c5465a2b8547ee.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 08/14] usb: dwc3: gadget: Track connected lane count and speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Track the number of lanes connected in gadget->lanes and track the lane
speed mantissa for SuperSpeed Plus devices. Also, if the gadget is
running in gen1x2, set the gadget->speed to USB_SPEED_SUPER_PLUS.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c31144af3261..06325e269234 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2907,12 +2907,18 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 	struct dwc3_ep		*dep;
 	int			ret;
 	u32			reg;
+	u8			lanes = 1;
 	u8			speed;
 
 	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
 	speed = reg & DWC3_DSTS_CONNECTSPD;
 	dwc->speed = speed;
 
+	if (dwc3_is_usb32(dwc))
+		lanes = DWC3_DSTS_CONNLANES(reg) + 1;
+
+	dwc->gadget.lane_count = lanes;
+
 	/*
 	 * RAMClkSel is reset to 0 after USB reset, so it must be reprogrammed
 	 * each time on Connect Done.
@@ -2927,6 +2933,7 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 		dwc->gadget.ep0->maxpacket = 512;
 		dwc->gadget.speed = USB_SPEED_SUPER_PLUS;
+		dwc->gadget.lsm	= 10;
 		break;
 	case DWC3_DSTS_SUPERSPEED:
 		/*
@@ -2947,7 +2954,12 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
 		dwc->gadget.ep0->maxpacket = 512;
-		dwc->gadget.speed = USB_SPEED_SUPER;
+		dwc->gadget.lsm	= 5;
+
+		if (lanes > 1)
+			dwc->gadget.speed = USB_SPEED_SUPER_PLUS;
+		else
+			dwc->gadget.speed = USB_SPEED_SUPER;
 		break;
 	case DWC3_DSTS_HIGHSPEED:
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(64);
-- 
2.11.0

