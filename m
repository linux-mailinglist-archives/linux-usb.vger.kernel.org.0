Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EEA24CB02
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 04:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgHUCuW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 22:50:22 -0400
Received: from mail-eopbgr70047.outbound.protection.outlook.com ([40.107.7.47]:23846
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726975AbgHUCuS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 22:50:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU2NZpM3FFe8+pS9ATRndmCP4HjEFhrftl80NoneC40TCDayArCjS32PvAqh4ZahLm/ntFKSRvURo9VYes8cJV0r/B70yGN8VbpHWt5jF6EtlI3d2idkXlnRRi55G1BTAgDomtoq2/mYjBWui3buusj85Bmm6WYzxOshvDZ2MEqUtb+fQbj97aLFCF1zPFZQ+P1+NyFC9t3t78Re0OHL63YxqGetWCj05+UHafcYwlBIfBlG6i/G33XSEGnxhWoUeQKoyHF6TFcnv3vofvkWWxrqQQ37dNJU8aJoYe2Iy7d0cwerSpmvQPxoqkNOPyM9UxJbjc9zhHlbSDLlzmyWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPzTgWlYol7DHq+8G12KBu/T32yoxf16NFluvHIqSds=;
 b=W4ES6E26CZAw9Tk7fKVdnxS2CQB/Q+w4M+xe6m6BRCqCNwdm6HDBdrOfOGhM7TeZHMtgaLe6YjZoF7DFvQIWN1tL4oBpxJT/AQbrZdfMXtlZNaGvpkzrdizIX+5XxZ1+mfH2woofCQMdR6T1ONUJ24q08XEJCQOa7wmylIRM6tAWakq7skSgt/3WIPLp5uyIAILW4SaVgEFoegx/HqN5nRADcQGmSCPD3WtaL3PZEwJ9OxhuN4z02okdvwv7DGcamcC1o+NzrcYF7OLyntqFBVDbcR9+jLE4MUlXCQVikXKlKzmef2nBnSgd4DQUmci+zFWBKE+hygXJ3v7M2FF2Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPzTgWlYol7DHq+8G12KBu/T32yoxf16NFluvHIqSds=;
 b=MlbB78Y7VOMhDPGdMZrORPcDaFhCMy/AnPRBEFrF3eEYhpTJYszTpEXm7XWN2KpwLANHRkp36qjogzQoVpOHAwT8pi4oife4ARB9QOU1IK5zr7OMREiDI2d3CY8ms0OJJZ9efHfkYsd9n/wj7JM/KG6QE8lduGbxQEeiL+vieBk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB5577.eurprd04.prod.outlook.com (2603:10a6:10:8a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 02:50:05 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 02:50:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v6 3/3] usb: cdns3: imx: add glue layer runtime pm implementation
Date:   Fri, 21 Aug 2020 10:48:36 +0800
Message-Id: <20200821024836.4472-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821024836.4472-1-peter.chen@nxp.com>
References: <20200821024836.4472-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27)
 To DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:50:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aeb116ec-95f3-41f7-2115-08d8457ce822
X-MS-TrafficTypeDiagnostic: DB7PR04MB5577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB557763AFB8752E9CE8045EDB8B5B0@DB7PR04MB5577.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UoMssjQuUpkvqXq3M+Bbf/BPBRpf/11/PKP+gIIUj/jnHT+b3JTXe4OHgQ2O5r9iH9cpd23kLy4IdZOvDowQ3T6PVrUJGxpUjg8hfqjK+uLJh+s3ycLND4jr/ic+hBCGv87trMtae77CYoKoY/0/OWLpy0t3CcDfW5aOTLeMyqphx+m4SCw672TwPlBo5wgP0MxmdLZ4liPyXghR66xBVywCFXf4oCCL8BRxqtox6IxE0ewtJoOcfYaD9dqFrIRCTATiW6nDtluQhkcx7lZ5A3krVIlQG27DCKOndQJ9EioKa76klQRhBFdm5uquhAqFna1hapPrQbQg0M8FeJxb9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(52116002)(66946007)(2906002)(8676002)(6486002)(4326008)(6506007)(478600001)(316002)(6666004)(44832011)(36756003)(956004)(26005)(66476007)(66556008)(2616005)(8936002)(1076003)(6512007)(5660300002)(6916009)(186003)(83380400001)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: MbbU3NwuY/orS6PV8I289h4/q8esVOOqlhqMCLSn5U0TUMXTkUIvfUNYw5y8OKlpZtMP81ZnOoxgbsfRod7wfhYnNE9fvezeJM9yeWtRCZBweXUtVX9Mhoc5AJXHE1IUKn56/ulT8JO4bIuE2qiUbBtF5prUa/zqb1J7rtEXtPu/f8h0T7WHkb5h/iEvP4O3ItRAvnGImjMt0nayG6tkmb/Hqfv3oRHEneLPOO5lfNLKzQz+zTJaIlcb53KA0l2+o6Nf6srL2FLXTMevn6V74dAo+L4DyefAwKlT8c9J9dBaw3yaTJt43Cw5PytXIiIi4c0OwUJQVGHJjUL+PULn/gcOdDCoeasDrLmOgssfPGryhBK863D3Il/NCDKWacLSPNeBbwXEqUwA6DU9Kv2+AhbC1huHWTK9RbSkvjoT3oiObs8R51DXgWPVPOPRzDBxNZz74U5fK8GLqR41ql60iIalpia5ueSgdaYIGIUXoSI1ZYWpfCfAse4CP83keNBdfyOCxsfgymiolXWdaDleDNPj2ZCNf61uojotqy5ue3M4WD24ey07EytXS5cf10CzSKygrq5rWXNsF3JLkwXrmZdkxBlJcU4gPlAWUBT30OkjXtvBUbC0HATkCCzu5dOqbWgQlRbm9o27Dlz6qxvg/Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb116ec-95f3-41f7-2115-08d8457ce822
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:50:05.0217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXk2VNdlV2FFyIOViRsUvQC9z2WYOnmNVIacav/rWBcKYSrQ+Zg4lMRQMgR5mBoO5iiLD9ZpV+cX1pt101NF2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5577
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add imx glue layer runtime pm implementation, and the runtime
pm is default off.

Reviewed-by: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 203 ++++++++++++++++++++++++++++++++--
 1 file changed, 192 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index aba988e71958..5d2a4e19fa83 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -15,6 +15,8 @@
 #include <linux/io.h>
 #include <linux/of_platform.h>
 #include <linux/iopoll.h>
+#include <linux/pm_runtime.h>
+#include "core.h"
 
 #define USB3_CORE_CTRL1    0x00
 #define USB3_CORE_CTRL2    0x04
@@ -32,7 +34,7 @@
 /* Register bits definition */
 
 /* USB3_CORE_CTRL1 */
-#define SW_RESET_MASK	(0x3f << 26)
+#define SW_RESET_MASK	GENMASK(31, 26)
 #define PWR_SW_RESET	BIT(31)
 #define APB_SW_RESET	BIT(30)
 #define AXI_SW_RESET	BIT(29)
@@ -44,17 +46,17 @@
 #define OC_DISABLE	BIT(9)
 #define MDCTRL_CLK_SEL	BIT(7)
 #define MODE_STRAP_MASK	(0x7)
-#define DEV_MODE	(1 << 2)
-#define HOST_MODE	(1 << 1)
-#define OTG_MODE	(1 << 0)
+#define DEV_MODE	BIT(2)
+#define HOST_MODE	BIT(1)
+#define OTG_MODE	BIT(0)
 
 /* USB3_INT_REG */
 #define CLK_125_REQ	BIT(29)
 #define LPM_CLK_REQ	BIT(28)
 #define DEVU3_WAEKUP_EN	BIT(14)
 #define OTG_WAKEUP_EN	BIT(12)
-#define DEV_INT_EN (3 << 8) /* DEV INT b9:8 */
-#define HOST_INT1_EN (1 << 0) /* HOST INT b7:0 */
+#define DEV_INT_EN	GENMASK(9, 8) /* DEV INT b9:8 */
+#define HOST_INT1_EN	BIT(0) /* HOST INT b7:0 */
 
 /* USB3_CORE_STATUS */
 #define MDCTRL_CLK_STATUS	BIT(15)
@@ -62,15 +64,34 @@
 #define HOST_POWER_ON_READY	BIT(12)
 
 /* USB3_SSPHY_STATUS */
-#define CLK_VALID_MASK		(0x3f << 26)
-#define CLK_VALID_COMPARE_BITS	(0xf << 28)
-#define PHY_REFCLK_REQ		(1 << 0)
+#define CLK_VALID_MASK		GENMASK(31, 26)
+#define CLK_VALID_COMPARE_BITS	GENMASK(31, 28)
+#define PHY_REFCLK_REQ		BIT(0)
+
+/* OTG registers definition */
+#define OTGSTS		0x4
+/* OTGSTS */
+#define OTG_NRDY	BIT(11)
+
+/* xHCI registers definition  */
+#define XECP_PM_PMCSR		0x8018
+#define XECP_AUX_CTRL_REG1	0x8120
+
+/* Register bits definition */
+/* XECP_AUX_CTRL_REG1 */
+#define CFG_RXDET_P3_EN		BIT(15)
+
+/* XECP_PM_PMCSR */
+#define PS_MASK			GENMASK(1, 0)
+#define PS_D0			0
+#define PS_D1			1
 
 struct cdns_imx {
 	struct device *dev;
 	void __iomem *noncore;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	struct platform_device *cdns3_pdev;
 };
 
 static inline u32 cdns_imx_readl(struct cdns_imx *data, u32 offset)
@@ -126,6 +147,20 @@ static int cdns_imx_noncore_init(struct cdns_imx *data)
 	return ret;
 }
 
+static int cdns_imx_platform_suspend(struct device *dev,
+	bool suspend, bool wakeup);
+static struct cdns3_platform_data cdns_imx_pdata = {
+	.platform_suspend = cdns_imx_platform_suspend,
+};
+
+static struct of_dev_auxdata cdns_imx_auxdata[] = {
+	{
+	.compatible = "cdns,usb3",
+	.platform_data = &cdns_imx_pdata,
+	},
+	{},
+};
+
 static int cdns_imx_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -162,14 +197,18 @@ static int cdns_imx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	ret = of_platform_populate(node, NULL, NULL, dev);
+	ret = of_platform_populate(node, NULL, cdns_imx_auxdata, dev);
 	if (ret) {
 		dev_err(dev, "failed to create children: %d\n", ret);
 		goto err;
 	}
 
-	return ret;
+	device_set_wakeup_capable(dev, true);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_forbid(dev);
 
+	return ret;
 err:
 	clk_bulk_disable_unprepare(data->num_clks, data->clks);
 	return ret;
@@ -194,6 +233,147 @@ static int cdns_imx_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static void cdns3_set_wakeup(struct cdns_imx *data, bool enable)
+{
+	u32 value;
+
+	value = cdns_imx_readl(data, USB3_INT_REG);
+	if (enable)
+		value |= OTG_WAKEUP_EN | DEVU3_WAEKUP_EN;
+	else
+		value &= ~(OTG_WAKEUP_EN | DEVU3_WAEKUP_EN);
+
+	cdns_imx_writel(data, USB3_INT_REG, value);
+}
+
+static int cdns_imx_platform_suspend(struct device *dev,
+		bool suspend, bool wakeup)
+{
+	struct cdns3 *cdns = dev_get_drvdata(dev);
+	struct device *parent = dev->parent;
+	struct cdns_imx *data = dev_get_drvdata(parent);
+	void __iomem *otg_regs = (void *)(cdns->otg_regs);
+	void __iomem *xhci_regs = cdns->xhci_regs;
+	u32 value;
+	int ret = 0;
+
+	if (cdns->role != USB_ROLE_HOST)
+		return 0;
+
+	if (suspend) {
+		/* SW request low power when all usb ports allow to it ??? */
+		value = readl(xhci_regs + XECP_PM_PMCSR);
+		value &= ~PS_MASK;
+		value |= PS_D1;
+		writel(value, xhci_regs + XECP_PM_PMCSR);
+
+		/* mdctrl_clk_sel */
+		value = cdns_imx_readl(data, USB3_CORE_CTRL1);
+		value |= MDCTRL_CLK_SEL;
+		cdns_imx_writel(data, USB3_CORE_CTRL1, value);
+
+		/* wait for mdctrl_clk_status */
+		value = cdns_imx_readl(data, USB3_CORE_STATUS);
+		ret = readl_poll_timeout(data->noncore + USB3_CORE_STATUS, value,
+			(value & MDCTRL_CLK_STATUS) == MDCTRL_CLK_STATUS,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait mdctrl_clk_status timeout\n");
+
+		/* wait lpm_clk_req to be 0 */
+		value = cdns_imx_readl(data, USB3_INT_REG);
+		ret = readl_poll_timeout(data->noncore + USB3_INT_REG, value,
+			(value & LPM_CLK_REQ) != LPM_CLK_REQ,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait lpm_clk_req timeout\n");
+
+		/* wait phy_refclk_req to be 0 */
+		value = cdns_imx_readl(data, USB3_SSPHY_STATUS);
+		ret = readl_poll_timeout(data->noncore + USB3_SSPHY_STATUS, value,
+			(value & PHY_REFCLK_REQ) != PHY_REFCLK_REQ,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait phy_refclk_req timeout\n");
+
+		cdns3_set_wakeup(data, wakeup);
+	} else {
+		cdns3_set_wakeup(data, false);
+
+		/* SW request D0 */
+		value = readl(xhci_regs + XECP_PM_PMCSR);
+		value &= ~PS_MASK;
+		value |= PS_D0;
+		writel(value, xhci_regs + XECP_PM_PMCSR);
+
+		/* clr CFG_RXDET_P3_EN */
+		value = readl(xhci_regs + XECP_AUX_CTRL_REG1);
+		value &= ~CFG_RXDET_P3_EN;
+		writel(value, xhci_regs + XECP_AUX_CTRL_REG1);
+
+		/* clear mdctrl_clk_sel */
+		value = cdns_imx_readl(data, USB3_CORE_CTRL1);
+		value &= ~MDCTRL_CLK_SEL;
+		cdns_imx_writel(data, USB3_CORE_CTRL1, value);
+
+		/* wait CLK_125_REQ to be 1 */
+		value = cdns_imx_readl(data, USB3_INT_REG);
+		ret = readl_poll_timeout(data->noncore + USB3_INT_REG, value,
+			(value & CLK_125_REQ) == CLK_125_REQ,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait CLK_125_REQ timeout\n");
+
+		/* wait for mdctrl_clk_status is cleared */
+		value = cdns_imx_readl(data, USB3_CORE_STATUS);
+		ret = readl_poll_timeout(data->noncore + USB3_CORE_STATUS, value,
+			(value & MDCTRL_CLK_STATUS) != MDCTRL_CLK_STATUS,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait mdctrl_clk_status cleared timeout\n");
+
+		/* Wait until OTG_NRDY is 0 */
+		value = readl(otg_regs + OTGSTS);
+		ret = readl_poll_timeout(otg_regs + OTGSTS, value,
+			(value & OTG_NRDY) != OTG_NRDY,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait OTG ready timeout\n");
+	}
+
+	return ret;
+
+}
+
+static int cdns_imx_resume(struct device *dev)
+{
+	struct cdns_imx *data = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(data->num_clks, data->clks);
+}
+
+static int cdns_imx_suspend(struct device *dev)
+{
+	struct cdns_imx *data = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(data->num_clks, data->clks);
+
+	return 0;
+}
+#else
+static int cdns_imx_platform_suspend(struct device *dev,
+	bool suspend, bool wakeup)
+{
+	return 0;
+}
+
+#endif /* CONFIG_PM */
+
+static const struct dev_pm_ops cdns_imx_pm_ops = {
+	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
+};
+
 static const struct of_device_id cdns_imx_of_match[] = {
 	{ .compatible = "fsl,imx8qm-usb3", },
 	{},
@@ -206,6 +386,7 @@ static struct platform_driver cdns_imx_driver = {
 	.driver		= {
 		.name	= "cdns3-imx",
 		.of_match_table	= cdns_imx_of_match,
+		.pm	= &cdns_imx_pm_ops,
 	},
 };
 module_platform_driver(cdns_imx_driver);
-- 
2.17.1

