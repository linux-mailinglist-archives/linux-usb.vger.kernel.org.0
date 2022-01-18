Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A848E4926EF
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 14:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242138AbiARNQn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 08:16:43 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:30777 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241721AbiARNQk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jan 2022 08:16:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511800; x=1674047800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n2wi0VyDHml3t8zyGPZu/XZ547LV3Cu4QkPHY8CA61U=;
  b=PZvIGzEk9qXFhEZ5YoEqoQaYFALAJ/mppu6ioR4UBEA2R4mOMMXZwfya
   QrQh5+OMMA8B9f0ie8pgN9HgJkzTtLhXYw3whg3Kq5xvtXfkDzrW0WPzh
   p4nl87morWnKVHyK/O5V3Bxcdvkwm5kqWVao7thP1BYhSpD8Ygntfjnx1
   Dwei66Eai2h6gNQB4akvXM/WP5i3OS+YLxZnRWjyeP6lsm/U4vwl9DnK8
   ZcC4lsaqGxfwX91vOMc7P59bjSu9gafX8wTCFrN7RQHIavFAT/YsjDRFY
   Oyeuh0SjykVmwtR/mZgHr7IHFThsBlDdg71GhHVhy12kbtkR5sT+rdmdb
   g==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564689"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 18 Jan 2022 14:16:37 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 18 Jan 2022 14:16:37 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 18 Jan 2022 14:16:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642511797; x=1674047797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n2wi0VyDHml3t8zyGPZu/XZ547LV3Cu4QkPHY8CA61U=;
  b=FgVJ8OK5d5qd3jRNM8IX+w7SnaGGlHDAbqvNayy+CLwHmeKiZPOn1uOm
   MZIVnvBLMhvCajaNxPL6AYaH4j0JwwHZw8yMuqCtKHDO8GkH/6qzjk/nG
   oWm12KptzewH6lBwRP+z193vofH1OZ17l6gN+Bdm14zGzReBMvv5BWZZf
   ByYcKpCkKIL40DoP4tUSqFj9TFw+lHkFasLwPy7OJ/qBEA4ElzWJIMDmf
   4HkCVdN+uaqdtD+rWnwEQJunniCzr60dthKFTXOpDIfsH2cAcboUjS/UC
   pFC2PIVH+xLt7BmT+VQaeD300+hPayVpvpM7BUSYNwqILjfsVhC0F8VUO
   w==;
X-IronPort-AV: E=Sophos;i="5.88,297,1635199200"; 
   d="scan'208";a="21564688"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jan 2022 14:16:37 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C33BA280075;
        Tue, 18 Jan 2022 14:16:36 +0100 (CET)
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
Subject: [PATCH v3 3/4] usb: dwc3: imx8mp: Add support for setting SOC specific flags
Date:   Tue, 18 Jan 2022 14:16:25 +0100
Message-Id: <20220118131626.926394-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
References: <20220118131626.926394-1-alexander.stein@ew.tq-group.com>
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
 drivers/usb/dwc3/dwc3-imx8mp.c | 81 ++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 1c8fe657b3a9..3df4313b3740 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -36,17 +36,66 @@
 
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
+	struct clk			*phy_clk;
 	int				irq;
 	bool				pm_suspended;
 	bool				wakeup_pending;
 };
 
+static void imx8mp_configure_glue(struct dwc3_imx8mp *dwc3_imx)
+{
+	struct device *dev = dwc3_imx->dev;
+	u32 value;
+
+	if ((!dwc3_imx->glue_base) || (!dwc3_imx->phy_clk))
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
@@ -100,6 +149,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	struct device_node	*dwc3_np, *node = dev->of_node;
 	struct dwc3_imx8mp	*dwc3_imx;
+	struct resource		*res;
 	int			err, irq;
 
 	if (!node) {
@@ -119,6 +169,15 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
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
@@ -145,6 +204,24 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 		goto disable_hsio_clk;
 	}
 
+	dwc3_imx->phy_clk = devm_clk_get(dev, "phy");
+	if (PTR_ERR(dwc3_imx->phy_clk) == -ENOENT) {
+		dev_warn(dev, "PHY clock missing. Continuing without, some features are missing though.");
+		dwc3_imx->phy_clk = NULL;
+	} else if (IS_ERR(dwc3_imx->phy_clk)) {
+		err = PTR_ERR(dwc3_imx->phy_clk);
+		dev_err(dev, "Failed to get phy clk, err=%d\n", err);
+		goto disable_suspend_clk;
+	}
+
+	if (dwc3_imx->phy_clk) {
+		err = clk_prepare_enable(dwc3_imx->phy_clk);
+		if (err) {
+			dev_err(dev, "Failed to enable phy clk, err=%d\n", err);
+			goto disable_suspend_clk;
+		}
+	}
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		err = irq;
@@ -152,6 +229,8 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	}
 	dwc3_imx->irq = irq;
 
+	imx8mp_configure_glue(dwc3_imx);
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	err = pm_runtime_get_sync(dev);
@@ -199,6 +278,8 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 disable_clks:
+	clk_disable_unprepare(dwc3_imx->phy_clk);
+disable_suspend_clk:
 	clk_disable_unprepare(dwc3_imx->suspend_clk);
 disable_hsio_clk:
 	clk_disable_unprepare(dwc3_imx->hsio_clk);
-- 
2.25.1

