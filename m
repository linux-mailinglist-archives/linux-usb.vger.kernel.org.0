Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E46222E4C
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 23:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgGPV72 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 17:59:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:46110 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbgGPV72 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 17:59:28 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9188A4010A;
        Thu, 16 Jul 2020 21:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1594936767; bh=l2UeK9ZgGVTX4kMyT5/V6rLMh32+q2Ul8pP+EngZcK4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=hlGy5uyOKAX/6ofQl2CrHr+iRrZ/hfXsDFArXrBLB4jYf/XlJjerXS0Kcgp7slX47
         CRIp1o9UKYcZKO+7Uj3V5iwySpL1jdDTcJlArdRUXLGAHsaevAArhioWUv7IytwTMS
         6ubwZ4GY5kzBk5rMe/OpMIQ1T7zLo459w7auWDNkWB6KemuAJIxjfwsTA0nmsrAbmF
         MNYUgGfhTe5sSZlSlEa/MJIV+dNvfiutFZExhB5+KFYs0Jt3DGgR734HESFXzwK0iW
         h2KG+8gx8WZpoFGVtMpmz29OpQQIwOCbRv9R6hdzNQ7hnO6BE4PyjN9fWMEEljjQCy
         Siy/RKQ5TWO/w==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 7BB35A022D;
        Thu, 16 Jul 2020 21:59:26 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:59:26 -0700
Date:   Thu, 16 Jul 2020 14:59:26 -0700
Message-Id: <cba0199b76af6645c2ad5440958540de3883143f.1594935978.git.thinhn@synopsys.com>
In-Reply-To: <cover.1594935978.git.thinhn@synopsys.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 09/11] usb: dwc3: gadget: Implement setting of sublink speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implement gadget ops udc_set_num_lanes_and_speed. This allows the
gadget/core driver to select number of lanes to use and the sublink
speed the controller supports.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e346ae12e69e..92ab65a46771 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -389,6 +389,8 @@
 #define DWC3_GUCTL2_RST_ACTBITLATER		BIT(14)
 
 /* Device Configuration Register */
+#define DWC3_DCFG_NUMLANES(n)	(((n) & 0x3) << 30) /* DWC_usb32 only */
+
 #define DWC3_DCFG_DEVADDR(addr)	((addr) << 3)
 #define DWC3_DCFG_DEVADDR_MASK	DWC3_DCFG_DEVADDR(0x7f)
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 1ca57af23994..01bdd51f6b47 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2311,6 +2311,62 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
+static void dwc3_gadget_set_num_lanes_and_speed(struct usb_gadget *g,
+						unsigned int num_lanes,
+						unsigned int ssid)
+{
+	struct dwc3			*dwc = gadget_to_dwc(g);
+	struct usb_sublink_speed	*ssa = NULL;
+	unsigned int			lanes;
+	unsigned long			flags;
+	u32				reg;
+	int				i;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (dwc->maximum_speed < USB_SPEED_SUPER_PLUS)
+		goto done;
+
+	for (i = 0; i < g->ssac + 1; i++) {
+		if (g->sublink_speed[i].id == ssid) {
+			ssa = &g->sublink_speed[i];
+			break;
+		}
+	}
+
+	if (!ssa) {
+		dev_err(dwc->dev, "SSID not found (%d)\n", ssid);
+		goto done;
+	}
+
+	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg &= ~DWC3_DCFG_SPEED_MASK;
+
+	switch (ssa->mantissa) {
+	case DWC3_LSM_5_GBPS:
+		reg |= DWC3_DCFG_SUPERSPEED;
+		break;
+	case DWC3_LSM_10_GBPS:
+		reg |= DWC3_DCFG_SUPERSPEED_PLUS;
+		break;
+	default:
+		dev_err(dwc->dev, "invalid lane speed mantissa (%d)\n",
+			ssa->mantissa);
+		goto done;
+	}
+
+	/* Lane configuration is only available to DWC_usb32 */
+	if (DWC3_IP_IS(DWC32)) {
+		lanes = clamp_t(unsigned int, num_lanes, 1,
+				dwc->maximum_num_lanes);
+		reg &= ~DWC3_DCFG_NUMLANES(~0);
+		reg |= DWC3_DCFG_NUMLANES(lanes - 1);
+	}
+
+	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+done:
+	spin_unlock_irqrestore(&dwc->lock, flags);
+}
+
 static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.get_frame		= dwc3_gadget_get_frame,
 	.wakeup			= dwc3_gadget_wakeup,
@@ -2319,6 +2375,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.udc_start		= dwc3_gadget_start,
 	.udc_stop		= dwc3_gadget_stop,
 	.udc_set_speed		= dwc3_gadget_set_speed,
+	.udc_set_num_lanes_and_speed = dwc3_gadget_set_num_lanes_and_speed,
 	.get_config_params	= dwc3_gadget_config_params,
 };
 
@@ -3719,7 +3776,12 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 		goto err4;
 	}
 
-	dwc3_gadget_set_speed(&dwc->gadget, dwc->maximum_speed);
+	if (DWC3_IP_IS(DWC32) && dwc->maximum_speed == USB_SPEED_SUPER_PLUS)
+		dwc3_gadget_set_num_lanes_and_speed(&dwc->gadget,
+						    dwc->maximum_num_lanes,
+						    dwc->gadget.max_speed_ssid);
+	else
+		dwc3_gadget_set_speed(&dwc->gadget, dwc->maximum_speed);
 
 	return 0;
 
-- 
2.11.0

