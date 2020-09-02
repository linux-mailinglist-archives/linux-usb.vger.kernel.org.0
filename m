Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB24A25A904
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 11:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgIBJ6b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 05:58:31 -0400
Received: from mail-eopbgr00079.outbound.protection.outlook.com ([40.107.0.79]:13312
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726247AbgIBJ6a (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 05:58:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+FXixViRkqXZi19x5bnp1F1sUof8EyxxVYV65HsmzCCJAF6t7LP8VkfbjBAW/kbRUhoT3WSb+AMc/UrS9dqoQR9sVgmizy2agPf/7Hd0SEoFYZK/LB4WrTPcHfNAgpMDOMC7AK/S8wEtEjTyZkVRJLI4ulIX8nHJfNC2vjsYcw8cnQsvCiFmCZ4CyibwB/sC5ClpCJHseA/Urgn3FOtSwdAy+UDg2gWfclkRuIlJIG3rDzXW/xIhrGiYABzVPtjHKtP8488hfejFQ38yFOiL7DgdoAeh4m4TM9tXvOtXkHOjJxrlvKr3aQ9CxG4NrGFzvliV8AgvQZ4BsDmoxDjkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdETxFoyJJtyzkwxw2KelJkob86pDVqcXM3kyZIZv0g=;
 b=aeI7XbbbWujdquSaXmGsdhbX5pO/I2E1Oea/Xuj2XpFrgtQmWiv7zJZU6pIzBuohix8AvXTm2vC8Fm+b5oJcT3furFMK8It3bhosm8cnS87jI3OvkYsusU3hda+QN2bXRzxUr0Jfjsbi9gQW8szuz1bAy3e0ST3+UDpDdYFxprDShqk1D2c5wxORki6ZR76hTA7/UMtJOFHdk56LlOaDG9Pt9sOy88CMGZKFBQYrJTCT+ysHj2zV8d0tKukqtyEAa6A/8rjO9GF03RdK3K7U5zhWwRzK5NY/X9qqultkrXo8KflqKnnHdwwDfYAeczetUFwpuKzH0lSKmqyui5RwSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdETxFoyJJtyzkwxw2KelJkob86pDVqcXM3kyZIZv0g=;
 b=mleBFMK/Vfva00bhv+KL3ghn6QhYZmEOsXsMRUfcMPw6JQ+1fi2p2FY5s19/MKRVddSknfTaWJNadwQcBxwGf6/zD2eeabSDfs9fFvVTzsInNYCY2uYc/GGe3e1LzLjYdTMXBiCKR3X2tPZPitcLIooAMmeQdUVR1E0wSjeKSoI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0401MB2484.eurprd04.prod.outlook.com (2603:10a6:203:36::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 09:58:14 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 09:58:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v8 3/3] usb: cdns3: imx: add glue layer runtime pm implementation
Date:   Wed,  2 Sep 2020 17:57:33 +0800
Message-Id: <20200902095733.3453-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902095733.3453-1-peter.chen@nxp.com>
References: <20200902095733.3453-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0164.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::20) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by SG2PR01CA0164.apcprd01.prod.exchangelabs.com (2603:1096:4:28::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 09:58:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e8317bf7-8dda-4e8a-cb68-08d84f26b556
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB24841A58372588F9E53DA34C8B2F0@AM5PR0401MB2484.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F9AyCt1OdYCRz1ZgkGWhER3MSV6r6upXacgBGtA/od02dc9vI1rl+Inu4HttvCFoCK+BbzY71FdPbW8k78MF+spbRc2XMeyok7CGsm2PihKNvwTc4RbZbKv4aKFJphHCkaWA7Zrl5kvq6eeeIGoCbsBRuVuNlN6CGmsS2VsE5lvpnR4MiqWI/y+mzN/P5JNBnCqbOGYqiYh0tGr62uI3RD0GGYMEKgdZmqKSnWzkBEHoslwaV645K5Zvms+QHcrw3emvx+WO+UYjmN48Kng5qHcAVJ7ysvBRFGG9JsX4uhEhUav5wvuraWbSj65COxFcyCaLv+VjN4lTOyRSbybpvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(1076003)(956004)(26005)(8936002)(8676002)(36756003)(52116002)(2616005)(86362001)(44832011)(498600001)(16576012)(66556008)(4326008)(6486002)(83380400001)(6916009)(66946007)(66476007)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NPblivhXD/JhH08dLZSKTVRskb+wi7K9NSg+ZmVkEBJzR1SG3pIDFrAIGz6DY0mikjtLNDTACjQA8Dd49lMXJZK67bJ87ntNnYJ7iKf3v7VcIgSCGKpDRZwmmNtGKptqRPerB6bNQ0MbvA1DTBAzkoQSmm8rnziLCLFwKjj/qRzCtM0XgXK/gVLJkX54LMU6eS4y7LvXymS0fEseWGtYLdxiS+PKE8tCRswa6/e1wVoN6kbhQc4Az/ec9IIkghjGmtHGYB2/XyaTvzKER8WcX26hSjFgmfNfYnsdQfk3dhHWP38Y+/o6+iEUzM0tzwBke/Zud4K8yZcXHkbvmc4WcyYbjr1YhznrcoFhG/7fHBVmfhSuoLkCKaim0CyOVekyZXLJ9pOeQi3qjpAovF8cNxzhB0qZYrrh3lwbjNLyWWWZp2Srwe9tXfr0DPRcJQCKCzfjW0FsF610ZQzzc0wwvsZhaotgD7p+JPoMjsfsLi9mmj0gYaZZ9o3+HUmN7NTtm0KzipIpuBS+h3+H/rND81ctQ2foMmSHxfAm/G2X+4wuBted4oE3oy2U0d1kp3gGEt8J1oh+TP7ZIA2jkiVTC9QMl3gr9G77+UFFivaRXuN8OJnT1gY5+dLRxNhNTX6bR2y3T444KM1jLSWpENpo7A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8317bf7-8dda-4e8a-cb68-08d84f26b556
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 09:58:14.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHOHLBAbQZq+QrmX0VgeDO8/0W9wSoOnWhUJZKNPqRVMcNhKF/NBYfkF2aYE8jxyyOLPZDT3eMsv0xe/kZMNuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2484
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add imx glue layer runtime pm implementation, and the runtime
pm is default off.

Reviewed-by: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 191 +++++++++++++++++++++++++++++++++-
 1 file changed, 186 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index aba988e71958..54a2d70a9c73 100644
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
@@ -53,8 +55,8 @@
 #define LPM_CLK_REQ	BIT(28)
 #define DEVU3_WAEKUP_EN	BIT(14)
 #define OTG_WAKEUP_EN	BIT(12)
-#define DEV_INT_EN (3 << 8) /* DEV INT b9:8 */
-#define HOST_INT1_EN (1 << 0) /* HOST INT b7:0 */
+#define DEV_INT_EN	(3 << 8) /* DEV INT b9:8 */
+#define HOST_INT1_EN	(1 << 0) /* HOST INT b7:0 */
 
 /* USB3_CORE_STATUS */
 #define MDCTRL_CLK_STATUS	BIT(15)
@@ -66,11 +68,30 @@
 #define CLK_VALID_COMPARE_BITS	(0xf << 28)
 #define PHY_REFCLK_REQ		(1 << 0)
 
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
+
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
+static const struct of_dev_auxdata cdns_imx_auxdata[] = {
+	{
+		.compatible = "cdns,usb3",
+		.platform_data = &cdns_imx_pdata,
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

