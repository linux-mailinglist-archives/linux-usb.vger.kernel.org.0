Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E06E11C38C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfLLCtd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:49:33 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41532 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727811AbfLLCtc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:49:32 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 43EB1404D4;
        Thu, 12 Dec 2019 02:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118972; bh=/fG7ga0jpAMTxN/E7YU/Xfj+wVLUfvmPeJQPN1aWnHU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=BhJhWiZlVhjF7AyRQ0VTUNBeDpDJKQTJ57Q+6OLcjYyOizKXRCzHQE7f13IzB98rF
         jfHb7Zk5+dOR/6Ee2ce2shgePdBp/5QS4Wu/GiP+WguO9yNJxEyuvKG+lYIDtANePi
         wDREe7Dhz6ZF7Z5m84xqdUJm1w8xQfIS8+P4bl/r8Lk0ZcYq6NX/nNlmHoafhvkxrk
         TJyvfFrhRt/oDBP8oog4OKt5xWW/GTRi6ArZJ2Ps9rF7LpTzRqrWnogBsDHHn+793J
         QWYu+zyyio7nK/vGHQb8CglL5ccaFvO4dURm4mZLK1mT6GZZy7sFmbWaSt2iu9i8l/
         zDezaWAWRpp3w==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 302D0A007B;
        Thu, 12 Dec 2019 02:49:31 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:49:31 -0800
Date:   Wed, 11 Dec 2019 18:49:31 -0800
Message-Id: <a9781ccc256bdd59550e4847144424f18da67eb0.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 05/14] usb: dwc3: Update IP checks to support DWC_usb32
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add IP checks within DWC3 driver to support DWC_usb32. Note that these
conditions match the current checks for DWC_usb31 version 1.90a. Any new
and different behavior of DWC_usb32 are added in separate patches.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c   | 17 ++++++++++-------
 drivers/usb/dwc3/gadget.c | 32 ++++++++++++++++----------------
 2 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 694984a30c5f..0bae1beea8a6 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -257,7 +257,8 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 	 * take a little more than 50ms. Set the polling rate at 20ms
 	 * for 10 times instead.
 	 */
-	if (dwc3_is_usb31(dwc) && dwc->revision >= DWC3_USB31_REVISION_190A)
+	if ((dwc3_is_usb31(dwc) && dwc->revision >= DWC3_USB31_REVISION_190A) ||
+	    dwc3_is_usb32(dwc))
 		retries = 10;
 
 	do {
@@ -265,8 +266,9 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 		if (!(reg & DWC3_DCTL_CSFTRST))
 			goto done;
 
-		if (dwc3_is_usb31(dwc) &&
-		    dwc->revision >= DWC3_USB31_REVISION_190A)
+		if ((dwc3_is_usb31(dwc) &&
+		     dwc->revision >= DWC3_USB31_REVISION_190A) ||
+		    dwc3_is_usb32(dwc))
 			msleep(20);
 		else
 			udelay(1);
@@ -1009,7 +1011,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	 * the DWC_usb3 controller. It is NOT available in the
 	 * DWC_usb31 controller.
 	 */
-	if (!dwc3_is_usb31(dwc) && dwc->revision >= DWC3_REVISION_310A) {
+	if (dwc3_is_usb3(dwc) && dwc->revision >= DWC3_REVISION_310A) {
 		reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
 		reg |= DWC3_GUCTL2_RST_ACTBITLATER;
 		dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
@@ -1051,7 +1053,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 	 * Must config both number of packets and max burst settings to enable
 	 * RX and/or TX threshold.
 	 */
-	if (dwc3_is_usb31(dwc) && dwc->dr_mode == USB_DR_MODE_HOST) {
+	if (!dwc3_is_usb3(dwc) && dwc->dr_mode == USB_DR_MODE_HOST) {
 		u8 rx_thr_num = dwc->rx_thr_num_pkt_prd;
 		u8 rx_maxburst = dwc->rx_max_burst_prd;
 		u8 tx_thr_num = dwc->tx_thr_num_pkt_prd;
@@ -1371,7 +1373,8 @@ bool dwc3_has_imod(struct dwc3 *dwc)
 	return ((dwc3_is_usb3(dwc) &&
 		 dwc->revision >= DWC3_REVISION_300A) ||
 		(dwc3_is_usb31(dwc) &&
-		 dwc->revision >= DWC3_USB31_REVISION_120A));
+		 dwc->revision >= DWC3_USB31_REVISION_120A) ||
+		dwc3_is_usb32(dwc));
 }
 
 static void dwc3_check_params(struct dwc3 *dwc)
@@ -1414,7 +1417,7 @@ static void dwc3_check_params(struct dwc3 *dwc)
 		/*
 		 * default to superspeed plus if we are capable.
 		 */
-		if (dwc3_is_usb31(dwc) &&
+		if ((dwc3_is_usb31(dwc) || dwc3_is_usb32(dwc)) &&
 		    (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
 		     DWC3_GHWPARAMS3_SSPHY_IFC_GEN2))
 			dwc->maximum_speed = USB_SPEED_SUPER_PLUS;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e0652253ad27..a6d562e208a9 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1970,10 +1970,10 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
 	 * bursts of data without going through any sort of endpoint throttling.
 	 */
 	reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
-	if (dwc3_is_usb31(dwc))
-		reg &= ~DWC31_GRXTHRCFG_PKTCNTSEL;
-	else
+	if (dwc3_is_usb3(dwc))
 		reg &= ~DWC3_GRXTHRCFG_PKTCNTSEL;
+	else
+		reg &= ~DWC31_GRXTHRCFG_PKTCNTSEL;
 
 	dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
 
@@ -2164,18 +2164,18 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 			reg |= DWC3_DCFG_SUPERSPEED;
 			break;
 		case USB_SPEED_SUPER_PLUS:
-			if (dwc3_is_usb31(dwc))
-				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
-			else
+			if (dwc3_is_usb3(dwc))
 				reg |= DWC3_DCFG_SUPERSPEED;
+			else
+				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 			break;
 		default:
 			dev_err(dwc->dev, "invalid speed (%d)\n", speed);
 
-			if (dwc3_is_usb31(dwc))
-				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
-			else
+			if (dwc3_is_usb3(dwc))
 				reg |= DWC3_DCFG_SUPERSPEED;
+			else
+				reg |= DWC3_DCFG_SUPERSPEED_PLUS;
 		}
 	}
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
@@ -2222,10 +2222,10 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 	mdwidth /= 8;
 
 	size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1));
-	if (dwc3_is_usb31(dwc))
-		size = DWC31_GTXFIFOSIZ_TXFDEP(size);
-	else
+	if (dwc3_is_usb3(dwc))
 		size = DWC3_GTXFIFOSIZ_TXFDEP(size);
+	else
+		size = DWC31_GTXFIFOSIZ_TXFDEP(size);
 
 	/* FIFO Depth is in MDWDITH bytes. Multiply */
 	size *= mdwidth;
@@ -2268,10 +2268,10 @@ static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
 
 	/* All OUT endpoints share a single RxFIFO space */
 	size = dwc3_readl(dwc->regs, DWC3_GRXFIFOSIZ(0));
-	if (dwc3_is_usb31(dwc))
-		size = DWC31_GRXFIFOSIZ_RXFDEP(size);
-	else
+	if (dwc3_is_usb3(dwc))
 		size = DWC3_GRXFIFOSIZ_RXFDEP(size);
+	else
+		size = DWC31_GRXFIFOSIZ_RXFDEP(size);
 
 	/* FIFO depth is in MDWDITH bytes */
 	size *= mdwidth;
@@ -2756,7 +2756,7 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
 	if (!interrupt)
 		dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
 
-	if (dwc3_is_usb31(dwc) ||
+	if (dwc3_is_usb31(dwc) || dwc3_is_usb32(dwc) ||
 	    (dwc3_is_usb3(dwc) && dwc->revision < DWC3_REVISION_310A))
 		udelay(100);
 }
-- 
2.11.0

