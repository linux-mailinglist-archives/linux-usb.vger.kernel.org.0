Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E9D250EC7
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 04:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgHYCNL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 22:13:11 -0400
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:56846
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726813AbgHYCNK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 22:13:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amNJWa8+xEyfotnQshaCNB1F42Aq25+Y1NKBTZ+vOWn+7rn75p7uG9d/gNaTXNe6Gk6U4AE95ky4wiP8d/HypD7qW7YTesSuflFr+UcR907BnTXDgr9MzHG1oVwuC+vBb9cz2FP+MLWQqjJryfAGRFkMTRmPYoEX6N8i8UdPSRdjQCcPl50YekT4vR3AblUUZ0/UIAZoIQ99ZtbF+yQTo3nkUOEdTQ//oatvY6VMjEzpqTco3DUCtDckMlhYHEhmuTVqAYV7Es8QbgBLuwMslNF4E80WEycEhjkkeXVzYVz8U+SaWIEmodsUDQXwZIZDRwVr0l+wi5UvvTpHk3l4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RKJvRbPhg8hhgp2R+GxiEmfeQO8O9p2ZNzoGMWysM0=;
 b=EDpLKBxYtqg3smITqUJvnqeAy90Lttc5cYpi0kAaXVifTvU//p13ZuHkwg8UtLfnx9FOujtoHVM4PIZfoP/DBFAe0XD6jaqUCQXnyedUiwoYpomwJsFnpUzcGQ2JSQfbfOrcQUzBn93cCfA96V41JqiQSxl2X2psd9xmyC3of/PKZ5UKvcxdUbCGQW453WfIaeMZ5ttodDbuqJfUeNyVUhAmSkWEa+JIJVp78gHQeMI1X8sGl4kRgNqOEZplEwI+3tZ3OBuCDV1kcHbI8jSRPde1gsgROuxl7f7Av4h3jzV6uFuJLRm80QsoTbRGLrC3tU5E/ZjvQoKSRE95XdWwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RKJvRbPhg8hhgp2R+GxiEmfeQO8O9p2ZNzoGMWysM0=;
 b=NN1vK+yc5CiD3LXD3+5Wdku4laf00Ey19lOSCwn9aQrEwfWmuyLJ3vEvrR0QcQLqptxtdQpB2Jb46/wxcpTq5QwVQwq4Fcc0fZ5YnjwB5nYpTcTI9PqmwNcAfv6vT1BWxbDHaLnOmqEIAnpfkxOmbolRwvNFR0FkTC2o8yqG1dg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0402MB2851.eurprd04.prod.outlook.com (2603:10a6:203:99::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 02:12:57 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 02:12:57 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v7 3/3] usb: cdns3: imx: add glue layer runtime pm implementation
Date:   Tue, 25 Aug 2020 10:11:20 +0800
Message-Id: <20200825021120.4926-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825021120.4926-1-peter.chen@nxp.com>
References: <20200825021120.4926-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0160.apcprd03.prod.outlook.com
 (2603:1096:4:c9::15) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0160.apcprd03.prod.outlook.com (2603:1096:4:c9::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend Transport; Tue, 25 Aug 2020 02:12:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 016bab36-53c4-47c0-ec47-08d8489c622c
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2851:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB285175BBC8EF815D11AB2CF28B570@AM5PR0402MB2851.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DAgTZAnRlfuDpue1fDgnth5zcD6XjOqrZmVuq0P+wDIhp+qZggCCjhXcIP/A0itMxhCX0EkLCjkyRyoBb8m/MUzjuSX9J3YevIu1b4JZDf+hD/o8i/XnIQYs+v4iILpGsH4AXN772mIYFSr28vvJWUGKHumF2O29EIXg0HmgMtdHAvBMcJQUdbU6N4ISjF0Jaay87mtp6M4LtM63pwmxG+XIKx7mylyRMdOXP2gSuDqJp4rFASSInJXBBgcGPMduP66IRRisAl45Y/Z2BFYsRcq8Ob9ExIO+DaXulZa5E4Yi8D03lcPKgkeF9gAXDoeWc+S3lwLSRntEmLrvEy1HYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(6512007)(6506007)(2616005)(4326008)(956004)(6916009)(44832011)(36756003)(52116002)(26005)(16526019)(186003)(478600001)(8936002)(1076003)(66556008)(6486002)(83380400001)(66946007)(2906002)(86362001)(8676002)(6666004)(316002)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: E6tSYH1POS7Lxogt41tkxCAqTfZxMc877KH5/FQ0X2bgk1Vmb3PfZ+MgnlhmiuBXXURCpaKQT9HpRDAQiLRyZs5OOSaLOo6Eqn58gMB+pxS3w7lOcYGJpCow6ej9K9045iZtPn8zKSR9jdpDdsvP6zwl60iHeezVisTKm3t5Fn0x+45foerg8tnGV+3KhfsZXSHfDZqaTfjvH698nDb6lII2+mUoCt0Ch0Loy7K1quJz56/WH3nvZqTp0LYe8KFqx8G3bTGe+B1H2OqJCY4P6DDDpIWR/BYMhuBBw7c2ons39BWsdClPovk3daqa5fxXjM/xmlCOb99ugcVXcwNSIep8XgZU3Bv39lNVELpNFLgOpWGDoqpK05IM4xpB+TwXYt8eNt0NakubUP915NlUj9HtmF7DkA9+zhmVY2fXkubBU6vb6LF6WpxqVnigxCCY6R2HAdcsf5uKzLXG9Ss9dL3xH2uj497SRBr7f3XxcV0gg5zZXXnsPujMvf2NB1XIHPSbFJyMFnjWj1TDF0HkgU51dxFy1q5YT80Z/mWBeEBEG5bXl+Bbqq/R7Q4KWml3wUMeF8Nb8S67/HX5iw3tyEmKAoM6VAzTeXM341oMA3aI7DE4xbnHgIk0eaiHBoxKOCf9S+5HJYTs9amYocsiEw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016bab36-53c4-47c0-ec47-08d8489c622c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 02:12:57.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT/pD51VCVw/WdK1pXggPeyKsA1SN846TzpKJS1HIjz58gVw5xLA1lRoA0Q72RJ2HrlodqoII7EADoyVoko50Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2851
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
index aba988e71958..a413df26e948 100644
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
+	void __iomem *otg_regs = (void __iomem *)(cdns->otg_regs);
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

