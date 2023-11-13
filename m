Return-Path: <linux-usb+bounces-2820-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC07E9EA4
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F32F0280EF8
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8C621367;
	Mon, 13 Nov 2023 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SwUcstoM"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F335A210FC;
	Mon, 13 Nov 2023 14:27:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9301FD5E;
	Mon, 13 Nov 2023 06:27:02 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C3A21C0015;
	Mon, 13 Nov 2023 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699885621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSimQIqa/8SepKg3uis9mexXr+RooQka7AQUj0ZMCxM=;
	b=SwUcstoMkO51WegbzPUOXINPZ7NYGCDMsSX0TGQ1JTX8616YqGNMPNTIaMYNIdWQ35Dku+
	QmWV2FEHBVVZBsexgmEjdOmjFtlIq+ydInNn6XP2nZPQj55mglPNuuAyYqHwiITK75nWAC
	VzBCcYJvpz7H087K6HdZz5+obEe/2eOZnvxwUb5P0L65KMHQfR4r/KZrxmelOxS5Fvq9CQ
	NkXbPlSCOKL2S6v+1o1YlB9fCcBiQeDl5T+U4BF3PbBXFYe4Ud4wpofFGQK6Z+G2JjFI8E
	i07xwHxck7QCcudy3pCixOhdQW/ekohVwHujrytfq81jMmf0ctoZNe/43FdDLQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 13 Nov 2023 15:26:57 +0100
Subject: [PATCH 2/6] usb: cdns3-ti: move reg writes from probe into an
 init_hw helper
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231113-j7200-usb-suspend-v1-2-ad1ee714835c@bootlin.com>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
In-Reply-To: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.12.3
X-GND-Sasl: theo.lebrun@bootlin.com

The hardware initialisation register write sequence is only used at
probe. To support suspend/resume with a controller losing power, we
must redo this sequence of writes.

Extract the register write sequence to a new cdns_ti_init_hw function to
reuse it later down the road, at resume.

We keep the devicetree-parsing aspect of the sequence in probe & add a
new field in the private struct to remember the USB2 refclk rate code
computation result.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 76 ++++++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index 5945c4b1e11f..c331bcd2faeb 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -57,6 +57,7 @@ struct cdns_ti {
 	unsigned vbus_divider:1;
 	struct clk *usb2_refclk;
 	struct clk *lpm_clk;
+	int usb2_refclk_rate_code;
 };
 
 static const int cdns_ti_rate_table[] = {	/* in KHZ */
@@ -85,15 +86,50 @@ static inline void cdns_ti_writel(struct cdns_ti *data, u32 offset, u32 value)
 	writel(value, data->usbss + offset);
 }
 
+static void cdns_ti_init_hw(struct cdns_ti *data)
+{
+	u32 reg;
+
+	/* assert RESET */
+	reg = cdns_ti_readl(data, USBSS_W1);
+	reg &= ~USBSS_W1_PWRUP_RST;
+	cdns_ti_writel(data, USBSS_W1, reg);
+
+	/* set static config */
+	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
+	reg &= ~USBSS1_STATIC_PLL_REF_SEL_MASK;
+	reg |= data->usb2_refclk_rate_code << USBSS1_STATIC_PLL_REF_SEL_SHIFT;
+
+	reg &= ~USBSS1_STATIC_VBUS_SEL_MASK;
+	if (data->vbus_divider)
+		reg |= 1 << USBSS1_STATIC_VBUS_SEL_SHIFT;
+
+	cdns_ti_writel(data, USBSS_STATIC_CONFIG, reg);
+	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
+
+	/* set USB2_ONLY mode if requested */
+	reg = cdns_ti_readl(data, USBSS_W1);
+	if (data->usb2_only)
+		reg |= USBSS_W1_USB2_ONLY;
+
+	/* set default modestrap */
+	reg |= USBSS_W1_MODESTRAP_SEL;
+	reg &= ~USBSS_W1_MODESTRAP_MASK;
+	reg |= USBSS_MODESTRAP_MODE_NONE << USBSS_W1_MODESTRAP_SHIFT;
+	cdns_ti_writel(data, USBSS_W1, reg);
+
+	/* de-assert RESET */
+	reg |= USBSS_W1_PWRUP_RST;
+	cdns_ti_writel(data, USBSS_W1, reg);
+}
+
 static int cdns_ti_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
 	struct cdns_ti *data;
-	int error;
-	u32 reg;
-	int rate_code, i;
 	unsigned long rate;
+	int error, i;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -133,8 +169,6 @@ static int cdns_ti_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	rate_code = i;
-
 	pm_runtime_enable(dev);
 	error = pm_runtime_get_sync(dev);
 	if (error < 0) {
@@ -142,39 +176,11 @@ static int cdns_ti_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	/* assert RESET */
-	reg = cdns_ti_readl(data, USBSS_W1);
-	reg &= ~USBSS_W1_PWRUP_RST;
-	cdns_ti_writel(data, USBSS_W1, reg);
-
-	/* set static config */
-	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
-	reg &= ~USBSS1_STATIC_PLL_REF_SEL_MASK;
-	reg |= rate_code << USBSS1_STATIC_PLL_REF_SEL_SHIFT;
-
-	reg &= ~USBSS1_STATIC_VBUS_SEL_MASK;
 	data->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
-	if (data->vbus_divider)
-		reg |= 1 << USBSS1_STATIC_VBUS_SEL_SHIFT;
-
-	cdns_ti_writel(data, USBSS_STATIC_CONFIG, reg);
-	reg = cdns_ti_readl(data, USBSS_STATIC_CONFIG);
-
-	/* set USB2_ONLY mode if requested */
-	reg = cdns_ti_readl(data, USBSS_W1);
 	data->usb2_only = device_property_read_bool(dev, "ti,usb2-only");
-	if (data->usb2_only)
-		reg |= USBSS_W1_USB2_ONLY;
-
-	/* set default modestrap */
-	reg |= USBSS_W1_MODESTRAP_SEL;
-	reg &= ~USBSS_W1_MODESTRAP_MASK;
-	reg |= USBSS_MODESTRAP_MODE_NONE << USBSS_W1_MODESTRAP_SHIFT;
-	cdns_ti_writel(data, USBSS_W1, reg);
+	data->usb2_refclk_rate_code = i;
 
-	/* de-assert RESET */
-	reg |= USBSS_W1_PWRUP_RST;
-	cdns_ti_writel(data, USBSS_W1, reg);
+	cdns_ti_init_hw(data);
 
 	error = of_platform_populate(node, NULL, NULL, dev);
 	if (error) {

-- 
2.41.0


