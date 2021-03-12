Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E34F3382F4
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 01:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhCLA6x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 19:58:53 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:59788 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231406AbhCLA6v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 19:58:51 -0500
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7261340842;
        Fri, 12 Mar 2021 00:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615510731; bh=cEnKumWtYXU9j4isjQXGTgyLrE+E2KjH6OUeqrmY0Cg=;
        h=Date:From:Subject:To:Cc:From;
        b=QJVPeQfojxigl91iW6c1kJ2MrJhJU4nr3Zp9dlTDJx8oVYHVtFXV3YEVhlVir/Z58
         EX46SYqcW81Fhgx8ao+FZoGudYKI0wZrqYwDPrCW87yqi4h9hHciUMnktdHCahIceQ
         FMexVsKFtprtLk9vzo0Dr9E0aoTAZVxDc4DeWlJJ0ydaOlXZk9gBO1KeSFhhdPjNmn
         XGOvX4vmxG7iYyhu1yl/Y+27K3AV15ZHxFLkINvA+qNbH5C7swnOt19S1C/yFu3z4E
         fJuUi5Igoh5uLh5nVvz8Kj7EE6i9GqUh63PNHjZoiHcDd3YCNieM7QjxrmXa2OObvJ
         Gx7zGrB2wCCBQ==
Received: from lab-vbox (unknown [10.205.129.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 457D3A005E;
        Fri, 12 Mar 2021 00:58:50 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 11 Mar 2021 16:58:50 -0800
Date:   Thu, 11 Mar 2021 16:58:50 -0800
Message-Id: <258b1c7fbb966454f4c4c2c1367508998498fc30.1615509438.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Remove invalid low-speed setting
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

None of the DWC_usb3x IPs (and all their versions) supports low-speed
setting in device mode. In the early days, our "Early Adopter Edition"
DWC_usb3 databook shows that the controller may be configured to operate
in low-speed, but it was revised on release. Let's remove this invalid
speed setting to avoid any confusion.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.c   | 1 -
 drivers/usb/dwc3/core.h   | 2 --
 drivers/usb/dwc3/gadget.c | 8 --------
 3 files changed, 11 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 94fdbe502ce9..05e2e54cbbdc 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1394,7 +1394,6 @@ static void dwc3_check_params(struct dwc3 *dwc)
 
 	/* Check the maximum_speed parameter */
 	switch (dwc->maximum_speed) {
-	case USB_SPEED_LOW:
 	case USB_SPEED_FULL:
 	case USB_SPEED_HIGH:
 		break;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ce6bd84e2b39..4ca4b4be85e4 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -398,7 +398,6 @@
 #define DWC3_DCFG_SUPERSPEED	(4 << 0)
 #define DWC3_DCFG_HIGHSPEED	(0 << 0)
 #define DWC3_DCFG_FULLSPEED	BIT(0)
-#define DWC3_DCFG_LOWSPEED	(2 << 0)
 
 #define DWC3_DCFG_NUMP_SHIFT	17
 #define DWC3_DCFG_NUMP(n)	(((n) >> DWC3_DCFG_NUMP_SHIFT) & 0x1f)
@@ -492,7 +491,6 @@
 #define DWC3_DSTS_SUPERSPEED		(4 << 0)
 #define DWC3_DSTS_HIGHSPEED		(0 << 0)
 #define DWC3_DSTS_FULLSPEED		BIT(0)
-#define DWC3_DSTS_LOWSPEED		(2 << 0)
 
 /* Device Generic Command Register */
 #define DWC3_DGCMD_SET_LMP		0x01
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 47809835e163..95bf33720769 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2113,9 +2113,6 @@ static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
 		reg |= DWC3_DCFG_SUPERSPEED;
 	} else {
 		switch (speed) {
-		case USB_SPEED_LOW:
-			reg |= DWC3_DCFG_LOWSPEED;
-			break;
 		case USB_SPEED_FULL:
 			reg |= DWC3_DCFG_FULLSPEED;
 			break;
@@ -3456,11 +3453,6 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 		dwc->gadget->ep0->maxpacket = 64;
 		dwc->gadget->speed = USB_SPEED_FULL;
 		break;
-	case DWC3_DSTS_LOWSPEED:
-		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(8);
-		dwc->gadget->ep0->maxpacket = 8;
-		dwc->gadget->speed = USB_SPEED_LOW;
-		break;
 	}
 
 	dwc->eps[1]->endpoint.maxpacket = dwc->gadget->ep0->maxpacket;

base-commit: 60a35ba9141f06b67150ce3544bc595d049b0d83
-- 
2.28.0

