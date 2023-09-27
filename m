Return-Path: <linux-usb+bounces-658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 171247B0AB8
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 18:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 4AA78B20B64
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 16:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FDE4A547;
	Wed, 27 Sep 2023 16:54:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C131BDE0;
	Wed, 27 Sep 2023 16:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B43C433CC;
	Wed, 27 Sep 2023 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695833670;
	bh=pfq+SQ5jW2o9nXakRgvSgmaqn3orOhnaopBx/4PGPjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dI0YrIfy3jXCRX8+l+D2FjpPKNs3YV7+hSTiGlNtpGtV7CQS6bd586Pt3ZyMoUV7i
	 jICgsB1K+tZwYyfcHX3fcqS+EjQyqfKN56lB5rxmhPJY1u5C5yqAJzH2Y+Sh7GcCnA
	 Wsjh/mt9gs90sacL9QsJdnhEDORTDgAeSQlZkhrVAQHBgxfLa5jj1XVu8ZHqzgIdZB
	 zk0Ns+qhq+xNHB0bKRIrrb335lwvV5BvXwFSnl0oaVCz5cqX0mwtAQkzs+FzxjX+2m
	 gh/D3N+yoUM4HM2so+vq6e9HXDseLImFHeWW1gISm9LFOO+4RJWBhgwJur/o7zClzJ
	 ononDWm9zlqqw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] usb: dwc3: add T-HEAD TH1520 usb driver
Date: Thu, 28 Sep 2023 00:42:22 +0800
Message-Id: <20230927164222.3505-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230927164222.3505-1-jszhang@kernel.org>
References: <20230927164222.3505-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds TH1520 Glue layer to support USB controller on T-HEAD TH1520 SoC.
There is a DesignWare USB3 DRD core in TH1520 SoCs, the dwc3 core is
the child of this USB wrapper module device.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS                   |   1 +
 drivers/usb/dwc3/Kconfig      |   9 +++
 drivers/usb/dwc3/Makefile     |   1 +
 drivers/usb/dwc3/dwc3-thead.c | 119 ++++++++++++++++++++++++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 drivers/usb/dwc3/dwc3-thead.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..d55e40060c46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18481,6 +18481,7 @@ M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	arch/riscv/boot/dts/thead/
+F:	drivers/usb/dwc3/dwc3-thead.c
 
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 98efcbb76c88..1b02f4f55b47 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -178,4 +178,13 @@ config USB_DWC3_OCTEON
 	  Only the host mode is currently supported.
 	  Say 'Y' or 'M' here if you have one such device.
 
+config USB_DWC3_THEAD
+	tristate "T-HEAD Platform"
+	depends on ARCH_THEAD || COMPILE_TEST
+	default USB_DWC3
+	help
+	  Support T-HEAD platform with DesignWare Core USB3 IP.
+	  Only the host mode is currently supported.
+	  Say 'Y' or 'M' here if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index fe1493d4bbe5..9523a51dd279 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -55,3 +55,4 @@ obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
+obj-$(CONFIG_USB_DWC3_THEAD)		+= dwc3-thead.o
diff --git a/drivers/usb/dwc3/dwc3-thead.c b/drivers/usb/dwc3/dwc3-thead.c
new file mode 100644
index 000000000000..999b1e319c72
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-thead.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwc3-thead.c - T-HEAD platform specific glue layer
+ *
+ * Inspired by dwc3-of-simple.c
+ *
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "core.h"
+
+#define USB_SSP_EN		0x34
+#define  REF_SSP_EN		BIT(0)
+#define USB_SYS			0x3c
+#define  COMMONONN		BIT(0)
+
+#define USB3_DRD_SWRST		0x14
+#define  USB3_DRD_PRST		BIT(0)
+#define  USB3_DRD_PHYRST	BIT(1)
+#define  USB3_DRD_VCCRST	BIT(2)
+#define  USB3_DRD_RSTMASK	(USB3_DRD_PRST | USB3_DRD_PHYRST | USB3_DRD_VCCRST)
+
+struct dwc3_thead {
+	void __iomem		*base;
+	struct regmap		*misc_sysreg;
+	struct regulator	*vbus;
+};
+
+static void dwc3_thead_optimize_power(struct dwc3_thead *thead)
+{
+	u32 val;
+
+	/* config usb top within USB ctrl & PHY reset */
+	regmap_update_bits(thead->misc_sysreg, USB3_DRD_SWRST,
+			   USB3_DRD_RSTMASK, USB3_DRD_PRST);
+
+	/*
+	 * dwc reg also need to be configed to save power
+	 * 1. set USB_SYS[COMMONONN]
+	 * 2. set DWC3_GCTL[SOFITPSYNC](done by core.c)
+	 * 3. set GUSB3PIPECTL[SUSPENDEN] (done by core.c)
+	 */
+	val = readl(thead->base + USB_SYS);
+	val |= COMMONONN;
+	writel(val, thead->base + USB_SYS);
+	val = readl(thead->base + USB_SSP_EN);
+	val |= REF_SSP_EN;
+	writel(val, thead->base + USB_SSP_EN);
+
+	regmap_update_bits(thead->misc_sysreg, USB3_DRD_SWRST,
+			   USB3_DRD_RSTMASK, USB3_DRD_RSTMASK);
+}
+
+static int dwc3_thead_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct dwc3_thead *thead;
+	int ret;
+
+	thead = devm_kzalloc(&pdev->dev, sizeof(*thead), GFP_KERNEL);
+	if (!thead)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, thead);
+
+	ret = devm_regulator_get_enable_optional(dev, "vbus");
+	if (ret < 0 && ret != -ENODEV)
+		return ret;
+
+	thead->misc_sysreg = syscon_regmap_lookup_by_phandle(np, "thead,misc-sysreg");
+	if (IS_ERR(thead->misc_sysreg))
+		return PTR_ERR(thead->misc_sysreg);
+
+	thead->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(thead->base))
+		return PTR_ERR(thead->base);
+
+	dwc3_thead_optimize_power(thead);
+
+	return of_platform_populate(np, NULL, NULL, dev);
+}
+
+static void dwc3_thead_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
+}
+
+static const struct of_device_id dwc3_thead_of_match[] = {
+	{ .compatible = "thead,th1520-usb" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, dwc3_thead_of_match);
+
+static struct platform_driver dwc3_thead_driver = {
+	.probe		= dwc3_thead_probe,
+	.remove_new	= dwc3_thead_remove,
+	.driver		= {
+		.name	= "dwc3-thead",
+		.of_match_table	= dwc3_thead_of_match,
+	},
+};
+module_platform_driver(dwc3_thead_driver);
+
+MODULE_ALIAS("platform:dwc3-thead");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("DesignWare DWC3 T-HEAD Glue Driver");
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
-- 
2.40.1


