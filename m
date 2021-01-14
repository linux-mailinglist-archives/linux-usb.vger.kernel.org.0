Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1F02F58BD
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbhANCyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:54:41 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54746 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726903AbhANCyk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 21:54:40 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2B60AC00EE;
        Thu, 14 Jan 2021 02:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610592820; bh=qoQaTQxnj9t3RSpThZ24T18s6vZtKp1b4iKEdruM/K4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=MDZvVpkv9pTapZhpdTUv7cybuWkZRmm8xzDeenSfNfALgOEPPeqMMqi/P7bwqZyYO
         HyL1EvuI29TnxjxISAvgZw3NmOCbwvxym5dMEFQ0xfzCy0xMR134zTFC139O0m92ZF
         JY/vBAjlcEYtOLKpQCVRB6yEtlqNmCYqk5xbscm4Kn7URY6h5O3ICcWiBXdUEqTb2M
         qrh+mprE0AboHDIQIs+aOEo6BSFI/O2H7FJtQPWmAJ3Hb9QDkMzEuW49aBiNDdAlqS
         Ei9KsrcWG0LjUHfZNOK0DkVD3uprRYUCpzHhvOoXCLKuaCnfTMvTWDNIYAqvuas1TN
         3TBfWBrhfloow==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id F0845A007C;
        Thu, 14 Jan 2021 02:53:38 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 18:53:38 -0800
Date:   Wed, 13 Jan 2021 18:53:38 -0800
Message-Id: <1bbbb6cd0d80696c0b1c112a225dad0b0efe8b91.1610592135.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v6 09/11] usb: dwc3: gadget: Implement setting of SSP rate
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Implement gadget ops udc_set_ssp_rate(). This allows the gadget/core
driver to select SSP signaling rate and number of lanes to for DWC_usb32
controller.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v6:
- Update to use usb_ssp_rate enum
- Rebase on Greg's usb-testing branch
- Update to match with the latest flow in dwc3 for setting speed
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- None

 drivers/usb/dwc3/core.h   |  5 +++++
 drivers/usb/dwc3/gadget.c | 47 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 363c1b84f45f..8f6e71052c6c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -386,6 +386,8 @@
 #define DWC3_GUCTL3_SPLITDISABLE		BIT(14)
 
 /* Device Configuration Register */
+#define DWC3_DCFG_NUMLANES(n)	(((n) & 0x3) << 30) /* DWC_usb32 only */
+
 #define DWC3_DCFG_DEVADDR(addr)	((addr) << 3)
 #define DWC3_DCFG_DEVADDR_MASK	DWC3_DCFG_DEVADDR(0x7f)
 
@@ -965,6 +967,8 @@ struct dwc3_scratchpad_array {
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
  * @max_ssp_rate: SuperSpeed Plus maximum signaling rate and lane count
+ * @gadget_ssp_rate: Gadget driver's maximum supported SuperSpeed Plus signaling
+ *			rate and lane count.
  * @ip: controller's ID
  * @revision: controller's version of an IP
  * @version_type: VERSIONTYPE register contents, a sub release of a revision
@@ -1129,6 +1133,7 @@ struct dwc3 {
 	u32			maximum_speed;
 	u32			gadget_max_speed;
 	enum usb_ssp_rate	max_ssp_rate;
+	enum usb_ssp_rate	gadget_ssp_rate;
 
 	u32			ip;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 494e4eca5460..7f06baac8b62 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2038,10 +2038,40 @@ static void dwc3_stop_active_transfers(struct dwc3 *dwc)
 	}
 }
 
+static void __dwc3_gadget_set_ssp_rate(struct dwc3 *dwc)
+{
+	enum usb_ssp_rate	ssp_rate = dwc->gadget_ssp_rate;
+	u32			reg;
+
+	if (ssp_rate == USB_SSP_GEN_UNKNOWN)
+		ssp_rate = dwc->max_ssp_rate;
+
+	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg &= ~DWC3_DCFG_SPEED_MASK;
+	reg &= ~DWC3_DCFG_NUMLANES(~0);
+
+	if (ssp_rate == USB_SSP_GEN_1x2)
+		reg |= DWC3_DCFG_SUPERSPEED;
+	else if (dwc->max_ssp_rate != USB_SSP_GEN_1x2)
+		reg |= DWC3_DCFG_SUPERSPEED_PLUS;
+
+	if (ssp_rate != USB_SSP_GEN_2x1 &&
+	    dwc->max_ssp_rate != USB_SSP_GEN_2x1)
+		reg |= DWC3_DCFG_NUMLANES(1);
+
+	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+}
+
 static void __dwc3_gadget_set_speed(struct dwc3 *dwc)
 {
 	u32			reg;
 
+	if (dwc->gadget_max_speed == USB_SPEED_SUPER_PLUS &&
+	    DWC3_IP_IS(DWC32)) {
+		__dwc3_gadget_set_ssp_rate(dwc);
+		return;
+	}
+
 	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
 	reg &= ~(DWC3_DCFG_SPEED_MASK);
 
@@ -2476,6 +2506,17 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
+static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
+				     enum usb_ssp_rate rate)
+{
+	struct dwc3		*dwc = gadget_to_dwc(g);
+	unsigned long		flags;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	dwc->gadget_ssp_rate = rate;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+}
+
 static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
@@ -2494,6 +2535,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.udc_start		= dwc3_gadget_start,
 	.udc_stop		= dwc3_gadget_stop,
 	.udc_set_speed		= dwc3_gadget_set_speed,
+	.udc_set_ssp_rate	= dwc3_gadget_set_ssp_rate,
 	.get_config_params	= dwc3_gadget_config_params,
 	.vbus_draw		= dwc3_gadget_vbus_draw,
 };
@@ -3906,7 +3948,10 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 		goto err5;
 	}
 
-	dwc3_gadget_set_speed(dwc->gadget, dwc->maximum_speed);
+	if (DWC3_IP_IS(DWC32) && dwc->maximum_speed == USB_SPEED_SUPER_PLUS)
+		dwc3_gadget_set_ssp_rate(dwc->gadget, dwc->max_ssp_rate);
+	else
+		dwc3_gadget_set_speed(dwc->gadget, dwc->maximum_speed);
 
 	return 0;
 
-- 
2.28.0

