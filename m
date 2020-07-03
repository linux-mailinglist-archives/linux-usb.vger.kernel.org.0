Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2590521341E
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgGCG1J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:27:09 -0400
Received: from mail-eopbgr150049.outbound.protection.outlook.com ([40.107.15.49]:37606
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726111AbgGCG1J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:27:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1BJZ1/LmkbfbjBu275Nzay00gNUWtyW05/MrVsEvCHvDOUcm+bPHBcl9SLejO8l84hQtGOumq2tnPhRdO5IHsQU8iFBKxuriIStBKUqUeKL7eBTC3975FLZEpE0HSerwfFn03hjuQG8T3DbaIIMp7+hzaiZu17354Q84ArPmEJaWsIwx5kcDq/0GfoTQSzXHGVY19qv32PWEvzuVk2FlX6bwabAyvzDVgH155B4lGtjdRev9CSSC1/7aj1UWMn3GFiAWrJADl+oeVfubGchHmhxt8uwEho3VMzM7Nmmhr0wfyswvNXO651+RoSKlLvPiJczFBZ0dln0NGnYTbYZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaAsMoFJYOA/tMdj6A0S+P9vqeVgHiJ7RbbQ+LUABW8=;
 b=Xo7aRVkBmQX/Y5LPMUDM9TUGXOH4fU1eheLwKzZTxFVy9xcQ1NN/6fRnHvquTWAezr9PLSR5llpyMEN0EN79nbPK8s20nbP38oMXe/Qyz8+BY4ukSeVNUVnyK42cDBerk9s84ZXMRWp7s4YF1pVwt5glNw3RorjzSMba7DVabdMFqx2YCBVTk3nl69vcD9QYZunxOzeb7ZDxf1azQYYg71Ri4WMDgI2yyOVMDTDP5r9xJCZJvgZVacjAKoTwLDN/DywxHROOr41cdILZB84DqgYRPKPZROgn125yYb9we4vef6P4TIyH58nbesLkDXspBwZ/8YKj40/9oH3cbqzXYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaAsMoFJYOA/tMdj6A0S+P9vqeVgHiJ7RbbQ+LUABW8=;
 b=cCg/fsKOONhHvvOvjUZL3BRrLaY0iTjHBu/cwwS7BktGj4CIJ4e4ZkkTJg6iV/ic++cqdve5d4p4n8ze4AQctCb99NkcMdYtAC9KO6xQkhkumwdiSygBxwkH24VklRU2ZvoqGTc7JJvhB+ah3mZmMmyfej37idRTd5I1WC3Wr8I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 06:27:04 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:27:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 3/9] usb: cdns3: imx: add glue layer runtime pm implementation
Date:   Fri,  3 Jul 2020 14:26:47 +0800
Message-Id: <20200703062653.29159-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062653.29159-1-peter.chen@nxp.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:27:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d6c9af9-1ed8-4bd7-dfc4-08d81f1a1a5a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4166FEA5E665D9057AED6A3F8B6A0@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tW8gJlC77nuygGZYFnW3dVw2ydkRIy1vHHI23quqCfpDAW8ZWd8O/2I+YziL2V/+T9vPhzeoaLsyLjiZSya8UwRKuRvFLJ7KoA8ZPkuAr23PZJAMwnIyI1g3W2fhNBFkhRUlHHWd6abiBeFCO8tpnlGJopO3Wjh4Bm71SyvQkCtD5EbgBq38A9hM1Hkx3AeW+pq8U0IZSPBwl1o8xx7M9TFS9AUB1ugxBwXjzttqNKZ+m2KwSDm0O3fiCsQcdtoPX8YqezjwLvF2LyEmVkbp6Eqai5ymigufW/+WFWtrxP7bWQU3mN1J5uiz4LVBdHTshwwgfpdYjO55IYuvtUOrhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(52116002)(6486002)(1076003)(8676002)(5660300002)(2906002)(8936002)(86362001)(186003)(6506007)(16526019)(44832011)(26005)(36756003)(316002)(478600001)(66476007)(956004)(6666004)(2616005)(66946007)(83380400001)(66556008)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: x9ha6PWtgOLXxSSVkzJhpQ/DULwyxNfvwJIguKSaymGEF9WKuhZJHpfxjHFGar8H3/0RoSLHwST+i2GAK2WuvR1/Llw2/yPjpOarfOPpu4KfvYVOlwRr1YsOwHS9DTFqzZXVStJHMGpK9CTQDdsk6xsf1M12xqXhgpDDkx8O1n7C6w7tBUxaHi4a5kYeVPuaIHA94eAQL4PSfF1WfvDCn9IOZdntnSoDJqo380rtJ4mcMIGEEU7WCqK7pgTYHSt358/xmZmIwY20mRe/j76wILvIT+waqb2L9Y7pUhw6idSaG1+iza4tJCQylgyiCMQAm3XjzmYT3P4QvQ61WhP9glQNKUVN7tkFhQenzIO8AaDHRsKb84mqlXko7SJ+mg4bWH9cdIHERzcDd7DtPHZAdnHs8IBo5+UnOoaHTPdONtp0lDhW2aBOvkRFuB6sQxALMQKXycUOwr6FVQ+m1CXDHxg/wn3riboJJhKVyiLlwbY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6c9af9-1ed8-4bd7-dfc4-08d81f1a1a5a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:27:04.6401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOGSVDstyAieDO/BxK5N0ZbxIGNpwiiWqf3UH3pb4BcfL6bKgeQKnOfvtQC1OZmivGps8ZDtdmcLGuUjPJIYcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add imx glue layer runtime pm implementation, and the runtime
pm is default off.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 203 ++++++++++++++++++++++++++++++++--
 1 file changed, 192 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index aba988e71958..b0254ecd9867 100644
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
+	void __iomem *otg_regs = cdns->otg_regs;
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

