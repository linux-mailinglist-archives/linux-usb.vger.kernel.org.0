Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD69311C38F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 03:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfLLCtp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 21:49:45 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41544 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727809AbfLLCtp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 21:49:45 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7A718404D4;
        Thu, 12 Dec 2019 02:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576118984; bh=JcMHPO3J3DmumI9Xfnf/F0hXttQ9O+RlPiIxtP80YzE=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=I1zkywHsvu73Qh4KO8L1BpiZFZA2nauB8PSDB43R9pMHNpISN+Np5atKjMb4ny1UN
         DPs9CbYVSzrRamdN6uyfYK5QShHr4xscdmlsTvxY+a5YbtMcrYkwCu88O0DrnSZ4Ai
         yU+r4E390+GjAht4J9Ryl2JZ8EunQdgQ4kRydYpRto0e8s44tY7mrZ9r0RSiLnOfeE
         FI1xYNS1fedyO+r6dUC54wBKp8rvbmlw+1/JBjgRBU6DJHfCPr1KCIb8s5raTAuy25
         gO9YmLkqdjT3n2J//wAbdEGsfpBN3Ir6VnmsQfOALINrAEsps8W1/w1hBBGnKzTirc
         P7mOguCWJh1uw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 66D01A007B;
        Thu, 12 Dec 2019 02:49:43 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 11 Dec 2019 18:49:43 -0800
Date:   Wed, 11 Dec 2019 18:49:43 -0800
Message-Id: <808d8ad39fc584e2f85e20148d56bd49c50aebf6.1576118671.git.thinhn@synopsys.com>
In-Reply-To: <cover.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 07/14] usb: dwc3: gadget: Set lane count and lsm
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb32 supports dual-lane at different transfer rate. This patch
initializes the controller to use the maximum support transfer rate
describes by the dwc3 device property of lane count and lane speed
mantissa in Gbps.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c   | 36 +++++++++++++++++++++++++++++
 drivers/usb/dwc3/core.h   | 10 ++++++++
 drivers/usb/dwc3/gadget.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 0bae1beea8a6..d09e968644c1 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1297,6 +1297,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,usb3_lpm_capable");
 	dwc->usb2_lpm_disable = device_property_read_bool(dev,
 				"snps,usb2-lpm-disable");
+	device_property_read_u8(dev, "snps,maximum-lane-count",
+				&dwc->maximum_lanes);
+	device_property_read_u8(dev, "snps,maximum-lsm",
+				&dwc->maximum_lsm);
 	device_property_read_u8(dev, "snps,rx-thr-num-pkt-prd",
 				&rx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,rx-max-burst-prd",
@@ -1424,6 +1428,38 @@ static void dwc3_check_params(struct dwc3 *dwc)
 
 		break;
 	}
+
+	switch (dwc->maximum_lsm) {
+	case 5:
+		break;
+	case 10:
+		if (dwc->maximum_speed == USB_SPEED_SUPER)
+			dev_err(dev, "invalid maximum_lsm parameter %d\n",
+				dwc->maximum_lsm);
+		/* Fall Through */
+	default:
+		if (dwc->maximum_speed == USB_SPEED_SUPER)
+			dwc->maximum_lsm = 5;
+		else if (dwc->maximum_speed > USB_SPEED_SUPER)
+			dwc->maximum_lsm = 10;
+		break;
+	}
+
+	switch (dwc->maximum_lanes) {
+	case 1:
+	case 2:
+		break;
+	default:
+		if (dwc->maximum_lanes > 2)
+			dev_err(dev, "invalid number of lanes %d\n",
+				dwc->maximum_lanes);
+
+		if (dwc3_is_usb32(dwc) &&
+		    dwc->maximum_speed == USB_SPEED_SUPER_PLUS)
+			dwc->maximum_lanes = 2;
+		else
+			dwc->maximum_lanes = 1;
+	}
 }
 
 static int dwc3_probe(struct platform_device *pdev)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 7fde3c7da543..8e729d4cd5bd 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -376,6 +376,8 @@
 #define DWC3_GUCTL2_RST_ACTBITLATER		BIT(14)
 
 /* Device Configuration Register */
+#define DWC3_DCFG_NUMLANES(n)	(((n) & 0x3) << 30) /* DWC_usb32 only */
+
 #define DWC3_DCFG_DEVADDR(addr)	((addr) << 3)
 #define DWC3_DCFG_DEVADDR_MASK	DWC3_DCFG_DEVADDR(0x7f)
 
@@ -449,6 +451,8 @@
 #define DWC3_DEVTEN_USBRSTEN		BIT(1)
 #define DWC3_DEVTEN_DISCONNEVTEN	BIT(0)
 
+#define DWC3_DSTS_CONNLANES(n)		(((n) >> 30) & 0x3) /* DWC_usb32 only */
+
 /* Device Status Register */
 #define DWC3_DSTS_DCNRD			BIT(29)
 
@@ -946,6 +950,8 @@ struct dwc3_scratchpad_array {
  * @nr_scratch: number of scratch buffers
  * @u1u2: only used on revisions <1.83a for workaround
  * @maximum_speed: maximum speed requested (mainly for testing purposes)
+ * @maximum_lsm: maximum lane speed mantissa in Gbps
+ * @maximum_lanes: maximum lane count
  * @ip: controller's ID
  * @revision: controller's version of an IP
  * @version_type: VERSIONTYPE register contents, a sub release of a revision
@@ -973,6 +979,7 @@ struct dwc3_scratchpad_array {
  * @ep0state: state of endpoint zero
  * @link_state: link state
  * @speed: device speed (super, high, full, low)
+ * @lane_count: number of connected lanes
  * @hwparams: copy of hwparams registers
  * @root: debugfs root folder pointer
  * @regset: debugfs pointer to regdump file
@@ -1100,6 +1107,8 @@ struct dwc3 {
 	u32			nr_scratch;
 	u32			u1u2;
 	u32			maximum_speed;
+	u8			maximum_lsm;
+	u8			maximum_lanes;
 
 	u32			ip;
 
@@ -1159,6 +1168,7 @@ struct dwc3 {
 	u8			u1pel;
 
 	u8			speed;
+	u8			lane_count;
 
 	u8			num_eps;
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a6d562e208a9..c31144af3261 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2183,6 +2183,53 @@ static void dwc3_gadget_set_speed(struct usb_gadget *g,
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 
+static void dwc3_gadget_set_sublink_attr(struct usb_gadget *g,
+					 unsigned int lane_count,
+					 unsigned int lsm)
+{
+	struct dwc3	*dwc = gadget_to_dwc(g);
+	unsigned int	lanes;
+	unsigned long	flags;
+	u32		reg;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (dwc->maximum_speed <= USB_SPEED_SUPER) {
+		/* Fall back to maximum speed supported by HW */
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		dwc3_gadget_set_speed(g, dwc->maximum_speed);
+		spin_lock_irqsave(&dwc->lock, flags);
+
+		goto done;
+	}
+
+	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg &= ~DWC3_DCFG_SPEED_MASK;
+
+	switch (lsm) {
+	case 5:
+		reg |= DWC3_DCFG_SUPERSPEED;
+		break;
+	case 10:
+		reg |= DWC3_DCFG_SUPERSPEED_PLUS;
+		break;
+	default:
+		dev_err(dwc->dev, "invalid lane speed mantissa (%d)\n", lsm);
+		goto done;
+	}
+
+	/* Lane configuration is only available to dwc_usb32 and higher */
+	if (dwc3_is_usb32(dwc)) {
+		lanes = clamp_t(unsigned int, lane_count,
+				1, dwc->maximum_lanes);
+		reg &= ~DWC3_DCFG_NUMLANES(3);
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
@@ -2191,6 +2238,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops = {
 	.udc_start		= dwc3_gadget_start,
 	.udc_stop		= dwc3_gadget_stop,
 	.udc_set_speed		= dwc3_gadget_set_speed,
+	.udc_set_sublink_attr	= dwc3_gadget_set_sublink_attr,
 	.get_config_params	= dwc3_gadget_config_params,
 };
 
@@ -3383,6 +3431,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	dwc->gadget.sg_supported	= true;
 	dwc->gadget.name		= "dwc3-gadget";
 	dwc->gadget.lpm_capable		= true;
+	dwc->gadget.lane_count		= 1;
 
 	/*
 	 * FIXME We might be setting max_speed to <SUPER, however versions
@@ -3406,6 +3455,8 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 				dwc->revision);
 
 	dwc->gadget.max_speed		= dwc->maximum_speed;
+	dwc->gadget.max_lsm		= dwc->maximum_lsm;
+	dwc->gadget.max_lane_count	= dwc->maximum_lanes;
 
 	/*
 	 * REVISIT: Here we should clear all pending IRQs to be
@@ -3422,7 +3473,12 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 		goto err4;
 	}
 
-	dwc3_gadget_set_speed(&dwc->gadget, dwc->maximum_speed);
+	if (dwc3_is_usb32(dwc) && dwc->maximum_lsm)
+		dwc3_gadget_set_sublink_attr(&dwc->gadget,
+					     dwc->maximum_lanes,
+					     dwc->maximum_lsm);
+	else
+		dwc3_gadget_set_speed(&dwc->gadget, dwc->maximum_speed);
 
 	return 0;
 
-- 
2.11.0

