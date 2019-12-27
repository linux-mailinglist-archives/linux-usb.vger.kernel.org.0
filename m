Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 761AA12B1A5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2019 07:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfL0GFm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Dec 2019 01:05:42 -0500
Received: from inva020.nxp.com ([92.121.34.13]:50758 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfL0GFm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Dec 2019 01:05:42 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D32F71A0DF4;
        Fri, 27 Dec 2019 07:05:39 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CE6561A0E00;
        Fri, 27 Dec 2019 07:05:36 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0FAC2402DA;
        Fri, 27 Dec 2019 14:05:32 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     kishon@ti.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] phy: freescale: imx8qm-usb3: add imx8qm USB3 PHY
Date:   Fri, 27 Dec 2019 14:02:26 +0800
Message-Id: <1577426546-31423-1-git-send-email-peter.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This USB3 PHY is used to support USB3 controller at imx8qm and imx8qxp
SoCs.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/phy/freescale/Kconfig               |   8 +
 drivers/phy/freescale/Makefile              |   1 +
 drivers/phy/freescale/phy-fsl-imx8qm-usb3.c | 254 ++++++++++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8qm-usb3.c

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 320630ffe3cd..4282f07784f8 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -14,3 +14,11 @@ config PHY_MIXEL_MIPI_DPHY
 	help
 	  Enable this to add support for the Mixel DSI PHY as found
 	  on NXP's i.MX8 family of SOCs.
+
+config PHY_FSL_IMX8QM_USB
+	tristate "Freescale i.MX8QM USB3 PHY"
+	depends on OF && ARCH_MXC
+	select GENERIC_PHY
+	help
+	  Enable this to add support for the USB3 PHY as found
+	  on NXP's i.MX8QM family of SOCs.
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index 1d02e3869b45..dcab710fb90d 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
+obj-$(CONFIG_PHY_FSL_IMX8QM_USB)	+= phy-fsl-imx8qm-usb3.o
diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-usb3.c b/drivers/phy/freescale/phy-fsl-imx8qm-usb3.c
new file mode 100644
index 000000000000..19ab6aa3271b
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-usb3.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2019 NXP. */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/delay.h>
+
+/* PHY register definition */
+#define PHY_PMA_CMN_CTRL1			(0xC800 * 4)
+#define TB_ADDR_CMN_DIAG_HSCLK_SEL		(0x01e0 * 4)
+#define TB_ADDR_CMN_PLL0_VCOCAL_INIT_TMR	(0x0084 * 4)
+#define TB_ADDR_CMN_PLL0_VCOCAL_ITER_TMR	(0x0085 * 4)
+#define TB_ADDR_CMN_PLL0_INTDIV	                (0x0094 * 4)
+#define TB_ADDR_CMN_PLL0_FRACDIV		(0x0095 * 4)
+#define TB_ADDR_CMN_PLL0_HIGH_THR		(0x0096 * 4)
+#define TB_ADDR_CMN_PLL0_SS_CTRL1		(0x0098 * 4)
+#define TB_ADDR_CMN_PLL0_SS_CTRL2		(0x0099 * 4)
+#define TB_ADDR_CMN_PLL0_DSM_DIAG		(0x0097 * 4)
+#define TB_ADDR_CMN_DIAG_PLL0_OVRD		(0x01c2 * 4)
+#define TB_ADDR_CMN_DIAG_PLL0_FBH_OVRD		(0x01c0 * 4)
+#define TB_ADDR_CMN_DIAG_PLL0_FBL_OVRD		(0x01c1 * 4)
+#define TB_ADDR_CMN_DIAG_PLL0_V2I_TUNE          (0x01C5 * 4)
+#define TB_ADDR_CMN_DIAG_PLL0_CP_TUNE           (0x01C6 * 4)
+#define TB_ADDR_CMN_DIAG_PLL0_LF_PROG           (0x01C7 * 4)
+#define TB_ADDR_CMN_DIAG_PLL0_TEST_MODE		(0x01c4 * 4)
+#define TB_ADDR_CMN_PSM_CLK_CTRL		(0x0061 * 4)
+#define TB_ADDR_XCVR_DIAG_RX_LANE_CAL_RST_TMR	(0x40ea * 4)
+#define TB_ADDR_XCVR_PSM_RCTRL	                (0x4001 * 4)
+#define TB_ADDR_TX_PSC_A0		        (0x4100 * 4)
+#define TB_ADDR_TX_PSC_A1		        (0x4101 * 4)
+#define TB_ADDR_TX_PSC_A2		        (0x4102 * 4)
+#define TB_ADDR_TX_PSC_A3		        (0x4103 * 4)
+#define TB_ADDR_TX_DIAG_ECTRL_OVRD		(0x41f5 * 4)
+#define TB_ADDR_TX_PSC_CAL		        (0x4106 * 4)
+#define TB_ADDR_TX_PSC_RDY		        (0x4107 * 4)
+#define TB_ADDR_RX_PSC_A0	                (0x8000 * 4)
+#define TB_ADDR_RX_PSC_A1	                (0x8001 * 4)
+#define TB_ADDR_RX_PSC_A2	                (0x8002 * 4)
+#define TB_ADDR_RX_PSC_A3	                (0x8003 * 4)
+#define TB_ADDR_RX_PSC_CAL	                (0x8006 * 4)
+#define TB_ADDR_RX_PSC_RDY	                (0x8007 * 4)
+#define TB_ADDR_TX_TXCC_MGNLS_MULT_000		(0x4058 * 4)
+#define TB_ADDR_TX_DIAG_BGREF_PREDRV_DELAY	(0x41e7 * 4)
+#define TB_ADDR_RX_SLC_CU_ITER_TMR		(0x80e3 * 4)
+#define TB_ADDR_RX_SIGDET_HL_FILT_TMR		(0x8090 * 4)
+#define TB_ADDR_RX_SAMP_DAC_CTRL		(0x8058 * 4)
+#define TB_ADDR_RX_DIAG_SIGDET_TUNE		(0x81dc * 4)
+#define TB_ADDR_RX_DIAG_LFPSDET_TUNE2		(0x81df * 4)
+#define TB_ADDR_RX_DIAG_BS_TM	                (0x81f5 * 4)
+#define TB_ADDR_RX_DIAG_DFE_CTRL1		(0x81d3 * 4)
+#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM4		(0x81c7 * 4)
+#define TB_ADDR_RX_DIAG_ILL_E_TRIM0		(0x81c2 * 4)
+#define TB_ADDR_RX_DIAG_ILL_IQ_TRIM0		(0x81c1 * 4)
+#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM6		(0x81c9 * 4)
+#define TB_ADDR_RX_DIAG_RXFE_TM3		(0x81f8 * 4)
+#define TB_ADDR_RX_DIAG_RXFE_TM4		(0x81f9 * 4)
+#define TB_ADDR_RX_DIAG_LFPSDET_TUNE		(0x81dd * 4)
+#define TB_ADDR_RX_DIAG_DFE_CTRL3		(0x81d5 * 4)
+#define TB_ADDR_RX_DIAG_SC2C_DELAY		(0x81e1 * 4)
+#define TB_ADDR_RX_REE_VGA_GAIN_NODFE		(0x81bf * 4)
+#define TB_ADDR_XCVR_PSM_CAL_TMR		(0x4002 * 4)
+#define TB_ADDR_XCVR_PSM_A0BYP_TMR		(0x4004 * 4)
+#define TB_ADDR_XCVR_PSM_A0IN_TMR		(0x4003 * 4)
+#define TB_ADDR_XCVR_PSM_A1IN_TMR		(0x4005 * 4)
+#define TB_ADDR_XCVR_PSM_A2IN_TMR		(0x4006 * 4)
+#define TB_ADDR_XCVR_PSM_A3IN_TMR		(0x4007 * 4)
+#define TB_ADDR_XCVR_PSM_A4IN_TMR		(0x4008 * 4)
+#define TB_ADDR_XCVR_PSM_A5IN_TMR		(0x4009 * 4)
+#define TB_ADDR_XCVR_PSM_A0OUT_TMR		(0x400a * 4)
+#define TB_ADDR_XCVR_PSM_A1OUT_TMR		(0x400b * 4)
+#define TB_ADDR_XCVR_PSM_A2OUT_TMR		(0x400c * 4)
+#define TB_ADDR_XCVR_PSM_A3OUT_TMR		(0x400d * 4)
+#define TB_ADDR_XCVR_PSM_A4OUT_TMR		(0x400e * 4)
+#define TB_ADDR_XCVR_PSM_A5OUT_TMR		(0x400f * 4)
+#define TB_ADDR_TX_RCVDET_EN_TMR	        (0x4122 * 4)
+#define TB_ADDR_TX_RCVDET_ST_TMR	        (0x4123 * 4)
+#define TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR	(0x40f2 * 4)
+#define TB_ADDR_TX_RCVDETSC_CTRL	        (0x4124 * 4)
+
+/* TB_ADDR_TX_RCVDETSC_CTRL */
+#define RXDET_IN_P3_32KHZ			(1 << 0)
+
+struct imx8qm_usb_phy {
+	struct phy *phy;
+	struct clk *clk;
+	void __iomem *base;
+};
+
+static int imx8qm_phy_power_on(struct phy *phy)
+{
+	struct imx8qm_usb_phy *imx_phy = phy_get_drvdata(phy);
+	int ret;
+	u32 value;
+	void __iomem *regs = imx_phy->base;
+
+	ret = clk_prepare_enable(imx_phy->clk);
+	if (ret)
+		return ret;
+
+	/* Below bringup sequence is from PHY's User Guide */
+	writel(0x0830, regs + PHY_PMA_CMN_CTRL1);
+	writel(0x10, regs + TB_ADDR_CMN_DIAG_HSCLK_SEL);
+	writel(0x00F0, regs + TB_ADDR_CMN_PLL0_VCOCAL_INIT_TMR);
+	writel(0x0018, regs + TB_ADDR_CMN_PLL0_VCOCAL_ITER_TMR);
+	writel(0x00D0, regs + TB_ADDR_CMN_PLL0_INTDIV);
+	writel(0x4aaa, regs + TB_ADDR_CMN_PLL0_FRACDIV);
+	writel(0x0034, regs + TB_ADDR_CMN_PLL0_HIGH_THR);
+	writel(0x1ee, regs + TB_ADDR_CMN_PLL0_SS_CTRL1);
+	writel(0x7F03, regs + TB_ADDR_CMN_PLL0_SS_CTRL2);
+	writel(0x0020, regs + TB_ADDR_CMN_PLL0_DSM_DIAG);
+	writel(0x0000, regs + TB_ADDR_CMN_DIAG_PLL0_OVRD);
+	writel(0x0000, regs + TB_ADDR_CMN_DIAG_PLL0_FBH_OVRD);
+	writel(0x0000, regs + TB_ADDR_CMN_DIAG_PLL0_FBL_OVRD);
+	writel(0x0007, regs + TB_ADDR_CMN_DIAG_PLL0_V2I_TUNE);
+	writel(0x0027, regs + TB_ADDR_CMN_DIAG_PLL0_CP_TUNE);
+	writel(0x0008, regs + TB_ADDR_CMN_DIAG_PLL0_LF_PROG);
+	writel(0x0022, regs + TB_ADDR_CMN_DIAG_PLL0_TEST_MODE);
+	writel(0x000a, regs + TB_ADDR_CMN_PSM_CLK_CTRL);
+	writel(0x139, regs + TB_ADDR_XCVR_DIAG_RX_LANE_CAL_RST_TMR);
+	writel(0xbefc, regs + TB_ADDR_XCVR_PSM_RCTRL);
+
+	writel(0x7799, regs + TB_ADDR_TX_PSC_A0);
+	writel(0x7798, regs + TB_ADDR_TX_PSC_A1);
+	writel(0x509b, regs + TB_ADDR_TX_PSC_A2);
+	writel(0x3, regs + TB_ADDR_TX_DIAG_ECTRL_OVRD);
+	writel(0x509b, regs + TB_ADDR_TX_PSC_A3);
+	writel(0x2090, regs + TB_ADDR_TX_PSC_CAL);
+	writel(0x2090, regs + TB_ADDR_TX_PSC_RDY);
+
+	writel(0xA6FD, regs + TB_ADDR_RX_PSC_A0);
+	writel(0xA6FD, regs + TB_ADDR_RX_PSC_A1);
+	writel(0xA410, regs + TB_ADDR_RX_PSC_A2);
+	writel(0x2410, regs + TB_ADDR_RX_PSC_A3);
+
+	writel(0x23FF, regs + TB_ADDR_RX_PSC_CAL);
+	writel(0x2010, regs + TB_ADDR_RX_PSC_RDY);
+
+	writel(0x0020, regs + TB_ADDR_TX_TXCC_MGNLS_MULT_000);
+	writel(0x00ff, regs + TB_ADDR_TX_DIAG_BGREF_PREDRV_DELAY);
+	writel(0x0002, regs + TB_ADDR_RX_SLC_CU_ITER_TMR);
+	writel(0x0013, regs + TB_ADDR_RX_SIGDET_HL_FILT_TMR);
+	writel(0x0000, regs + TB_ADDR_RX_SAMP_DAC_CTRL);
+	writel(0x1004, regs + TB_ADDR_RX_DIAG_SIGDET_TUNE);
+	writel(0x4041, regs + TB_ADDR_RX_DIAG_LFPSDET_TUNE2);
+	writel(0x0480, regs + TB_ADDR_RX_DIAG_BS_TM);
+	writel(0x8006, regs + TB_ADDR_RX_DIAG_DFE_CTRL1);
+	writel(0x003f, regs + TB_ADDR_RX_DIAG_ILL_IQE_TRIM4);
+	writel(0x543f, regs + TB_ADDR_RX_DIAG_ILL_E_TRIM0);
+	writel(0x543f, regs + TB_ADDR_RX_DIAG_ILL_IQ_TRIM0);
+	writel(0x0000, regs + TB_ADDR_RX_DIAG_ILL_IQE_TRIM6);
+	writel(0x8000, regs + TB_ADDR_RX_DIAG_RXFE_TM3);
+	writel(0x0003, regs + TB_ADDR_RX_DIAG_RXFE_TM4);
+	writel(0x2408, regs + TB_ADDR_RX_DIAG_LFPSDET_TUNE);
+	writel(0x05ca, regs + TB_ADDR_RX_DIAG_DFE_CTRL3);
+	writel(0x0258, regs + TB_ADDR_RX_DIAG_SC2C_DELAY);
+	writel(0x1fff, regs + TB_ADDR_RX_REE_VGA_GAIN_NODFE);
+
+	writel(0x02c6, regs + TB_ADDR_XCVR_PSM_CAL_TMR);
+	writel(0x0002, regs + TB_ADDR_XCVR_PSM_A0BYP_TMR);
+	writel(0x02c6, regs + TB_ADDR_XCVR_PSM_A0IN_TMR);
+	writel(0x0010, regs + TB_ADDR_XCVR_PSM_A1IN_TMR);
+	writel(0x0010, regs + TB_ADDR_XCVR_PSM_A2IN_TMR);
+	writel(0x0010, regs + TB_ADDR_XCVR_PSM_A3IN_TMR);
+	writel(0x0010, regs + TB_ADDR_XCVR_PSM_A4IN_TMR);
+	writel(0x0010, regs + TB_ADDR_XCVR_PSM_A5IN_TMR);
+
+	writel(0x0002, regs + TB_ADDR_XCVR_PSM_A0OUT_TMR);
+	writel(0x0002, regs + TB_ADDR_XCVR_PSM_A1OUT_TMR);
+	writel(0x0002, regs + TB_ADDR_XCVR_PSM_A2OUT_TMR);
+	writel(0x0002, regs + TB_ADDR_XCVR_PSM_A3OUT_TMR);
+	writel(0x0002, regs + TB_ADDR_XCVR_PSM_A4OUT_TMR);
+	writel(0x0002, regs + TB_ADDR_XCVR_PSM_A5OUT_TMR);
+
+	/* Change rx detect parameter */
+	writel(0x960, regs + TB_ADDR_TX_RCVDET_EN_TMR);
+	writel(0x01e0, regs + TB_ADDR_TX_RCVDET_ST_TMR);
+	writel(0x0090, regs + TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR);
+
+	/* RXDET_IN_P3_32KHZ, Receiver detect slow clock enable */
+	value = readl(regs + TB_ADDR_TX_RCVDETSC_CTRL);
+	value |= RXDET_IN_P3_32KHZ;
+	writel(value, regs + TB_ADDR_TX_RCVDETSC_CTRL);
+
+	udelay(10);
+
+	return 0;
+}
+
+static int imx8qm_phy_power_off(struct phy *phy)
+{
+	struct imx8qm_usb_phy *imx_phy = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(imx_phy->clk);
+
+	return 0;
+}
+
+static struct phy_ops imx8qm_usb_phy_ops = {
+	.power_on	= imx8qm_phy_power_on,
+	.power_off	= imx8qm_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int imx8qm_usb_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct imx8qm_usb_phy *imx_phy;
+	struct resource *res;
+
+	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
+	if (!imx_phy)
+		return -ENOMEM;
+
+	imx_phy->clk = devm_clk_get(dev, "usb3_phy_clk");
+	if (IS_ERR(imx_phy->clk))
+		return PTR_ERR(imx_phy->clk);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	imx_phy->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(imx_phy->base))
+		return PTR_ERR(imx_phy->base);
+
+	imx_phy->phy = devm_phy_create(dev, NULL, &imx8qm_usb_phy_ops);
+	if (IS_ERR(imx_phy->phy))
+		return PTR_ERR(imx_phy->phy);
+
+	phy_set_drvdata(imx_phy->phy, imx_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id imx8qm_usb_phy_of_match[] = {
+	{.compatible = "fsl,imx8qm-usb-phy",},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, imx8qm_usb_phy_of_match);
+
+static struct platform_driver imx8qm_usb_phy_driver = {
+	.probe	= imx8qm_usb_phy_probe,
+	.driver = {
+		.name	= "imx8qm-usb-phy",
+		.of_match_table	= imx8qm_usb_phy_of_match,
+	}
+};
+module_platform_driver(imx8qm_usb_phy_driver);
+
+MODULE_AUTHOR("Peter Chen <peter.chen@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("NXP i.MX8QM USB3 PHY Driver");
-- 
2.17.1

