Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABD722D022
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 23:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgGXVBG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 17:01:06 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37410 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726527AbgGXVBF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 17:01:05 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 94C08C0086;
        Fri, 24 Jul 2020 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595624465; bh=4BW8ac6SGWc7gaUSIr74ZhLGz1XbiBafNo79vA2LqL8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=ecdAW3jzSaeJRV5GIoTAAUtsDBTqw1aHn433A84Pz3vqtyu7F54T6xjI8p5kRvLws
         3E1J2M1zmuQUG1SRieRQ/73S8cu6vCq0yRrpYQCjxJ7qhvMcpdHi4RYQKjXwUvfqk2
         Pw6Ckan8Fzh/AvQ3a+BciG774JK3taU2PoS5+NiIrABPklLETw7INK6Ax4PvuCs1oY
         bVASxEgaYeJmG2ALoUvDD1173PT6iELSUFwAnFdJQevM6fB1bpmiNN+G00zer+6SbE
         B8vB3z0sUHMN7OpbmxFE5xQJmdp3xc1hEcDDoxOjJAFTtKnneHF12p/k64HXpSU6zi
         7hPNlgGR9OIzQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id AFDE4A0096;
        Fri, 24 Jul 2020 21:01:02 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 14:01:02 -0700
Date:   Fri, 24 Jul 2020 14:01:02 -0700
Message-Id: <4aa1f6dd1d4d895fcf3d987323c1e37672a71680.1595624103.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595624103.git.thinhn@synopsys.com>
References: <cover.1595624103.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/2] usb: dwc3: core: Properly default unspecified speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the maximum_speed is not specified, default the device speed base on
its HW capability. Don't prematurely check HW capability before
validating the maximum_speed device property. The device property takes
precedence in dwc->maximum_speed.

Fixes: 0e1e5c47f7a9 ("usb: dwc3: add support for USB 2.0-only core configuration")
Reported-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 422aea24afcd..7f6f5567b118 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -930,13 +930,6 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	 */
 	dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
 
-	/* Handle USB2.0-only core configuration */
-	if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
-			DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
-		if (dwc->maximum_speed == USB_SPEED_SUPER)
-			dwc->maximum_speed = USB_SPEED_HIGH;
-	}
-
 	ret = dwc3_phy_setup(dwc);
 	if (ret)
 		goto err0;
@@ -1382,6 +1375,8 @@ bool dwc3_has_imod(struct dwc3 *dwc)
 static void dwc3_check_params(struct dwc3 *dwc)
 {
 	struct device *dev = dwc->dev;
+	unsigned int hwparam_gen =
+		DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3);
 
 	/* Check for proper value of imod_interval */
 	if (dwc->imod_interval && !dwc3_has_imod(dwc)) {
@@ -1413,17 +1408,23 @@ static void dwc3_check_params(struct dwc3 *dwc)
 			dwc->maximum_speed);
 		/* fall through */
 	case USB_SPEED_UNKNOWN:
-		/* default to superspeed */
-		dwc->maximum_speed = USB_SPEED_SUPER;
-
-		/*
-		 * default to superspeed plus if we are capable.
-		 */
-		if ((DWC3_IP_IS(DWC31) || DWC3_IP_IS(DWC32)) &&
-		    (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
-		     DWC3_GHWPARAMS3_SSPHY_IFC_GEN2))
+		switch (hwparam_gen) {
+		case DWC3_GHWPARAMS3_SSPHY_IFC_GEN2:
 			dwc->maximum_speed = USB_SPEED_SUPER_PLUS;
-
+			break;
+		case DWC3_GHWPARAMS3_SSPHY_IFC_GEN1:
+			if (DWC3_IP_IS(DWC32))
+				dwc->maximum_speed = USB_SPEED_SUPER_PLUS;
+			else
+				dwc->maximum_speed = USB_SPEED_SUPER;
+			break;
+		case DWC3_GHWPARAMS3_SSPHY_IFC_DIS:
+			dwc->maximum_speed = USB_SPEED_HIGH;
+			break;
+		default:
+			dwc->maximum_speed = USB_SPEED_SUPER;
+			break;
+		}
 		break;
 	}
 }
-- 
2.11.0

