Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B70C4FEDC
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 04:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfFXCBO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jun 2019 22:01:14 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55138 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbfFXCBO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 23 Jun 2019 22:01:14 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9BFF41A1013;
        Mon, 24 Jun 2019 04:01:11 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BB39C1A101F;
        Mon, 24 Jun 2019 04:01:04 +0200 (CEST)
Received: from mega.ap.freescale.net (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E33224030C;
        Mon, 24 Jun 2019 10:00:56 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     robh+dt@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, chunfeng.yun@mediatek.com,
        sergei.shtylyov@cogentembedded.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 2/8] usb: phy: phy-mxs-usb: add imx7ulp support
Date:   Mon, 24 Jun 2019 10:02:52 +0800
Message-Id: <20190624020258.21690-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624020258.21690-1-peter.chen@nxp.com>
References: <20190624020258.21690-1-peter.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At imx7ulp, the USB related analog register is located in PHY register
region too, so we need to control PLL at PHY driver directly.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 67 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 6fa16ab31e2e..70b8c8248caf 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -17,9 +17,11 @@
 #include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/iopoll.h>
 
 #define DRIVER_NAME "mxs_phy"
 
+/* Register Macro */
 #define HW_USBPHY_PWD				0x00
 #define HW_USBPHY_TX				0x10
 #define HW_USBPHY_CTRL				0x30
@@ -37,6 +39,11 @@
 #define GM_USBPHY_TX_TXCAL45DN(x)            (((x) & 0xf) << 8)
 #define GM_USBPHY_TX_D_CAL(x)                (((x) & 0xf) << 0)
 
+/* imx7ulp */
+#define HW_USBPHY_PLL_SIC			0xa0
+#define HW_USBPHY_PLL_SIC_SET			0xa4
+#define HW_USBPHY_PLL_SIC_CLR			0xa8
+
 #define BM_USBPHY_CTRL_SFTRST			BIT(31)
 #define BM_USBPHY_CTRL_CLKGATE			BIT(30)
 #define BM_USBPHY_CTRL_OTG_ID_VALUE		BIT(27)
@@ -55,6 +62,12 @@
 #define BM_USBPHY_IP_FIX                       (BIT(17) | BIT(18))
 
 #define BM_USBPHY_DEBUG_CLKGATE			BIT(30)
+/* imx7ulp */
+#define BM_USBPHY_PLL_LOCK			BIT(31)
+#define BM_USBPHY_PLL_REG_ENABLE		BIT(21)
+#define BM_USBPHY_PLL_BYPASS			BIT(16)
+#define BM_USBPHY_PLL_POWER			BIT(12)
+#define BM_USBPHY_PLL_EN_USB_CLKS		BIT(6)
 
 /* Anatop Registers */
 #define ANADIG_ANA_MISC0			0x150
@@ -168,6 +181,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
 	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
 };
 
+static const struct mxs_phy_data imx7ulp_phy_data = {
+};
+
 static const struct of_device_id mxs_phy_dt_ids[] = {
 	{ .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
 	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
@@ -175,6 +191,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
 	{ .compatible = "fsl,imx23-usbphy", .data = &imx23_phy_data, },
 	{ .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
 	{ .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data, },
+	{ .compatible = "fsl,imx7ulp-usbphy", .data = &imx7ulp_phy_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
@@ -199,6 +216,11 @@ static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
 	return mxs_phy->data == &imx6sl_phy_data;
 }
 
+static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
+{
+	return mxs_phy->data == &imx7ulp_phy_data;
+}
+
 /*
  * PHY needs some 32K cycles to switch from 32K clock to
  * bus (such as AHB/AXI, etc) clock.
@@ -222,14 +244,49 @@ static void mxs_phy_tx_init(struct mxs_phy *mxs_phy)
 	}
 }
 
+static int mxs_phy_pll_enable(void __iomem *base, bool enable)
+{
+	int ret = 0;
+
+	if (enable) {
+		u32 value;
+
+		writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_SET);
+		writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_CLR);
+		writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_SET);
+		ret = readl_poll_timeout(base + HW_USBPHY_PLL_SIC,
+			value, (value & BM_USBPHY_PLL_LOCK) != 0,
+			100, 10000);
+		if (ret)
+			return ret;
+
+		writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
+				HW_USBPHY_PLL_SIC_SET);
+	} else {
+		writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
+				HW_USBPHY_PLL_SIC_CLR);
+		writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_CLR);
+		writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_SET);
+		writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_CLR);
+	}
+
+	return ret;
+}
+
 static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 {
 	int ret;
 	void __iomem *base = mxs_phy->phy.io_priv;
 
+	if (is_imx7ulp_phy(mxs_phy)) {
+		ret = mxs_phy_pll_enable(base, true);
+		if (ret)
+			return ret;
+	}
+
 	ret = stmp_reset_block(base + HW_USBPHY_CTRL);
 	if (ret)
-		return ret;
+		goto disable_pll;
 
 	/* Power up the PHY */
 	writel(0, base + HW_USBPHY_PWD);
@@ -267,6 +324,11 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 	mxs_phy_tx_init(mxs_phy);
 
 	return 0;
+
+disable_pll:
+	if (is_imx7ulp_phy(mxs_phy))
+		mxs_phy_pll_enable(base, false);
+	return ret;
 }
 
 /* Return true if the vbus is there */
@@ -388,6 +450,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
 	writel(BM_USBPHY_CTRL_CLKGATE,
 	       phy->io_priv + HW_USBPHY_CTRL_SET);
 
+	if (is_imx7ulp_phy(mxs_phy))
+		mxs_phy_pll_enable(phy->io_priv, false);
+
 	clk_disable_unprepare(mxs_phy->clk);
 }
 
-- 
2.14.1

