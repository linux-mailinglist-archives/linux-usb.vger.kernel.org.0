Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B424C49CBFE
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 15:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241992AbiAZON5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 09:13:57 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:61266 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241986AbiAZONz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jan 2022 09:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206435; x=1674742435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RV/5YeOGDAQg1u/U4sZSFk88Iu6qh0WQ/KjyJuEePj8=;
  b=DPSl8976WXI9KiA6uncpfXianTTtK3j6YEKhUNIMWJaMsgwxUNiAJoDM
   UCmPbECNGlUkaqegJq+HLjjdzXsiGgIRlGzRYU8Zt+EcCfNns1GD1AOmj
   OAWzelZOzH9SZznN66ejOgxuL9PFYkf8pBJLV/wVfgkGRXluWXFRujggC
   dCNNhT6doABZo0wEKEhUCLx34FOvWOaxR37BwTDXitPKp7a3mOrlGk4P0
   ofOXBb1Q9pA96lTHBPL1LK7AsfyGZgzLfuLf8xAH+oHMy/jHeukLaDTYg
   nYrTZqbkT1XPXSYwaAbPOlyPIBBPMwcBUXm6bQ6Vx7ixZ9kT8N8Pi0kpE
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725571"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 26 Jan 2022 15:13:51 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 26 Jan 2022 15:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643206431; x=1674742431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RV/5YeOGDAQg1u/U4sZSFk88Iu6qh0WQ/KjyJuEePj8=;
  b=DhiV6f5zZ0jymbJ/Q7zPtgnFR34msObm3eGrQo5klhhAGNTS4XbT4Ld9
   x376rWtUvnddsQ1IzshuMcMqNIQCbAUJO9Hw4seZNxMVXbzY4rPLY2aRo
   pzYVC7Dya3wt7zzrF8rTmArJuid9DtG4C4JaXKVPP/5ws7006R498AO6q
   0mmQkBbUDy0SgOt1f5YnwUjD9gRSUwlLLV3c1hOM4B/OV6+aW1spHa/7t
   xez5XH0W6dWlDSOcK6I15B4DWuLW3q3noVm/VuxRoAg3HwBCB5cA33eCt
   u93UBy2Rk2kF2X8yxCJtJvqWOkk6iQLwqrUXm7MNA6qa3Fyr+zGU94lz+
   g==;
X-IronPort-AV: E=Sophos;i="5.88,318,1635199200"; 
   d="scan'208";a="21725567"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 26 Jan 2022 15:13:51 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6C3AE28007C;
        Wed, 26 Jan 2022 15:13:51 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 3/4] usb: dwc3: imx8mp: Add support for setting SOC specific flags
Date:   Wed, 26 Jan 2022 15:13:39 +0100
Message-Id: <20220126141340.234125-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
References: <20220126141340.234125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The i.MX8MP glue layer has support for the following flags:
* over-current polarity
* PWR pad polarity
* controlling PPC flag in HCCPARAMS register
* permanent port attach for usb2 & usb3 port

Allow setting these flags by supporting specific flags in the glue node.
In order to get this to work an additional IORESOURCE_MEM and clock is
necessary. For backward compatibility this is purely optional.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 62 ++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 1c8fe657b3a9..5a96b66bf237 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -36,10 +36,22 @@
 
 #define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
 
+/* USB glue registers */
+#define USB_CTRL0		0x00
+#define USB_CTRL1		0x04
+
+#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
+#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
+#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
+
+#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
+#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
+
 struct dwc3_imx8mp {
 	struct device			*dev;
 	struct platform_device		*dwc3;
 	void __iomem			*hsio_blk_base;
+	void __iomem			*glue_base;
 	struct clk			*hsio_clk;
 	struct clk			*suspend_clk;
 	int				irq;
@@ -47,6 +59,42 @@ struct dwc3_imx8mp {
 	bool				wakeup_pending;
 };
 
+static void imx8mp_configure_glue(struct dwc3_imx8mp *dwc3_imx)
+{
+	struct device *dev = dwc3_imx->dev;
+	u32 value;
+
+	if (!dwc3_imx->glue_base)
+		return;
+
+	value = readl(dwc3_imx->glue_base + USB_CTRL0);
+
+	if (device_property_read_bool(dev, "fsl,permanently-attached"))
+		value |= (USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
+	else
+		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
+
+	if (device_property_read_bool(dev, "fsl,disable-port-power-control"))
+		value &= ~(USB_CTRL0_PORTPWR_EN);
+	else
+		value |= USB_CTRL0_PORTPWR_EN;
+
+	writel(value, dwc3_imx->glue_base + USB_CTRL0);
+
+	value = readl(dwc3_imx->glue_base + USB_CTRL1);
+	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
+		value |= USB_CTRL1_OC_POLARITY;
+	else
+		value &= ~USB_CTRL1_OC_POLARITY;
+
+	if (device_property_read_bool(dev, "fsl,power-active-low"))
+		value |= USB_CTRL1_PWR_POLARITY;
+	else
+		value &= ~USB_CTRL1_PWR_POLARITY;
+
+	writel(value, dwc3_imx->glue_base + USB_CTRL1);
+}
+
 static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
 {
 	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
@@ -100,6 +148,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	struct device_node	*dwc3_np, *node = dev->of_node;
 	struct dwc3_imx8mp	*dwc3_imx;
+	struct resource		*res;
 	int			err, irq;
 
 	if (!node) {
@@ -119,6 +168,15 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	if (IS_ERR(dwc3_imx->hsio_blk_base))
 		return PTR_ERR(dwc3_imx->hsio_blk_base);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res) {
+		dev_warn(dev, "Base address for glue layer missing. Continuing without, some features are missing though.");
+	} else {
+		dwc3_imx->glue_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(dwc3_imx->glue_base))
+			return PTR_ERR(dwc3_imx->glue_base);
+	}
+
 	dwc3_imx->hsio_clk = devm_clk_get(dev, "hsio");
 	if (IS_ERR(dwc3_imx->hsio_clk)) {
 		err = PTR_ERR(dwc3_imx->hsio_clk);
@@ -152,6 +210,8 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	}
 	dwc3_imx->irq = irq;
 
+	imx8mp_configure_glue(dwc3_imx);
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	err = pm_runtime_get_sync(dev);
@@ -252,6 +312,8 @@ static int __maybe_unused dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx,
 	dwc3_imx8mp_wakeup_disable(dwc3_imx);
 	dwc3_imx->pm_suspended = false;
 
+	imx8mp_configure_glue(dwc3_imx);
+
 	if (dwc3_imx->wakeup_pending) {
 		dwc3_imx->wakeup_pending = false;
 		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) {
-- 
2.25.1

