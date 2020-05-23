Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE1D1DFBB6
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388131AbgEWXXL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:23:11 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388047AbgEWXXL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:23:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYzOm/KoNQ7iUGl6lPyhZ1Fer++K7P3+IUhtwMGIYEs93cyXShLgQXCqDyN0bveK1ueorS+zj4cKxuR1mbcCYj15loERboQxSyCxFE82UgC/GF3F83kXIzmp0Uu9C57jJFJIWqMiKgmJefaeT91hoREzhhH7NYr9c3juOF6xm6hXIyNWcjgQzurlvJYfWgVIC41QEningBKobpxwqreyTwzDNi8Q8rA6S6yPzanXiQacnP7o/cte/Y6VwqQajh/Ew4hqHEU/nd85x2r6Y7gg+XboH8K7RbojE2K4juaIvSVMUQ9K7rNuNbLGvo7/mDVJM7TEJpjhSLkLlWETP2TO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT+DKnQMSqid1P7HUGXEc7h60iy9sSbHaOr2UlWRZOo=;
 b=EKpiQIHieHe1vaMS73vCbOxjTnOn84PBzLZfgW/PLiiHjOOjD48xFssksH09yvMlodgJIb2nDjugnH/HOWMimHbAJmsPssTUAd5CLPwjb6uQUkWwd0SsxuOBtCVYh6iUESiOcdKmYEpwhlVaxa4x9VSft7r2eWKsroS/ibYCLdGkHbaoeV9xHdrtk9lBqANh31g0iAdPbsKCdpxgO4OgrJNCMVwbN9KPl1bvYXLxoRtA9sNmDOBlXHDPmuq1zXgNMjGzIm396PeBJvTB6ZuqdJL1PaGLRerlmVeqDLl1lB2PmRrBLwYWwJ80yq78Y6UWN3Idry3jUCltiF5nD0guhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT+DKnQMSqid1P7HUGXEc7h60iy9sSbHaOr2UlWRZOo=;
 b=Pp3pT63IoMSdxpGDy0vLwokmqFTr7EjuxBGUZn7o7rmjRxpjtGkkapRcMOAZ/ipDz26L63tUjhr2fV65E/ROg0GvvJ2tETr/ol6VA8iAeQkowwcXqqInmyuWqdMPSVZHVnCnjs2FCXLWoKpflv0nEvEZtQ+ZCPQV3E0GwOs+6YA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:23:01 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:23:01 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 3/9] usb: cdns3: imx: add glue layer runtime pm implementation
Date:   Sun, 24 May 2020 07:22:58 +0800
Message-Id: <20200523232304.23976-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:22:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dce2a399-7ba2-4295-a195-08d7ff703c46
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6918C7CEE7A18BAC29C02CDE8BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLmt16/BU7OvIv46uOIUpTx5x7jNNyKNH78UYzGXkRuS3CDEJIjILVObXTgJugAYJ02vaA/WjTWmQeuKAPfVYlAX9WcrX9wXdhYkyzZsVZhx9dLCjil4w2/hd/9xFiSSxW7OVLoKqGi5oMR01vzSpx1kKLnHlWFp/6BHLQjubmdbDRnSl5AnxiNusunn2+IeGV15sWmZGW3uhkgY5DJHnQnFk/mdUHcfDCxKM7i/2aZCTawKh07eLesmmQjflbjJ0m7CJ8svM+AiFMRIrA77LK4F40LkhMpQ2gEdI+pnn4lFa+d35NgGpPe6cZh4RJSjq7GKQm9DRpMwDQh2P4JoiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: IpapHXONqGFmhLUxMYyTxGl2rwJ1qVoYwvVh7ouLk1mCNSVhNZQvoo2CoxpFCf3WiEJX66fZ9B1FaHI9EEd2xpfB07jzmc9RqUIj9FGiDNVbXU2iiujb0vCbYmc4ZfK0985/FTikd5Zw2sjEhYsKFpOwWo5kElDY6rCwT52TXhFE8Crjkn+PHQbmYD7hSsH/dd64EIXQJf1/or3NBZJvYyFPdTV1X6qxsDBXDzurm5ZiW0PzY/o7+RL3EDBU7BGOtVObM4CmyWPWq523ni6y0aRA3my/N8W0gMWPRmRLo3iegFNPDR8llc2HCwU/FUFjKj0zGxfu8TdVsJwXkheGdiRnC5ppHZ92AHCNHhjr/11uR0xDLOifQJi7H/0KM4C+MSqAEzXYZAIM5QGDGOeHfQI68tYWsSknvfhRXdUcYGiIiU78z8031bcU5MEiDh/y8pOBuuNjEBs8+oFTlTFDr/nqpITfyUq1k+/60kksSPI=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce2a399-7ba2-4295-a195-08d7ff703c46
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:23:01.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvK41MOsKKaFack9IkpGIArKUaIhBknXFGIceXnoILA6HJa9iVVvyXDtFEGEYq1zgVHCQrOE2RUhRpaQA5aF3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add imx glue layer runtime pm implementation, and the runtime
pm is default off.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 179 +++++++++++++++++++++++++++++++++-
 1 file changed, 177 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index aba988e71958..9d247de8e7eb 100644
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
@@ -66,11 +68,30 @@
 #define CLK_VALID_COMPARE_BITS	(0xf << 28)
 #define PHY_REFCLK_REQ		(1 << 0)
 
+/* OTG registers definition */
+#define OTGSTS		0x4
+/* OTGSTS */
+#define OTG_NRDY	(1 << 11)
+
+/* xHCI registers definition  */
+#define XECP_PM_PMCSR		0x8018
+#define XECP_AUX_CTRL_REG1	0x8120
+
+/* Register bits definition */
+/* XECP_AUX_CTRL_REG1 */
+#define CFG_RXDET_P3_EN		(1 << 15)
+
+/* XECP_PM_PMCSR */
+#define PS_MASK			(3 << 0)
+#define PS_D0			0
+#define PS_D1			(1 << 0)
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
@@ -194,6 +233,141 @@ static int cdns_imx_remove(struct platform_device *pdev)
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
+		ret = readl_poll_timeout_atomic(data->noncore + USB3_CORE_STATUS, value,
+			(value & MDCTRL_CLK_STATUS) == MDCTRL_CLK_STATUS,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait mdctrl_clk_status timeout\n");
+
+		/* wait lpm_clk_req to be 0 */
+		value = cdns_imx_readl(data, USB3_INT_REG);
+		ret = readl_poll_timeout_atomic(data->noncore + USB3_INT_REG, value,
+			(value & LPM_CLK_REQ) != LPM_CLK_REQ,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait lpm_clk_req timeout\n");
+
+		/* wait phy_refclk_req to be 0 */
+		value = cdns_imx_readl(data, USB3_SSPHY_STATUS);
+		ret = readl_poll_timeout_atomic(data->noncore + USB3_SSPHY_STATUS, value,
+			(value & PHY_REFCLK_REQ) != PHY_REFCLK_REQ,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait phy_refclk_req timeout\n");
+
+		cdns3_set_wakeup(data, wakeup);
+	} else {
+		/* wait CLK_125_REQ to be 1 */
+		value = cdns_imx_readl(data, USB3_INT_REG);
+		ret = readl_poll_timeout_atomic(data->noncore + USB3_INT_REG, value,
+			(value & CLK_125_REQ) != CLK_125_REQ,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait CLK_125_REQ timeout\n");
+
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
+		/* wait for mdctrl_clk_status is cleared */
+		value = cdns_imx_readl(data, USB3_CORE_STATUS);
+		ret = readl_poll_timeout_atomic(data->noncore + USB3_CORE_STATUS, value,
+			(value & MDCTRL_CLK_STATUS) != MDCTRL_CLK_STATUS,
+			10, 100000);
+		if (ret)
+			dev_warn(parent, "wait mdctrl_clk_status cleared timeout\n");
+
+		/* Wait until OTG_NRDY is 0 */
+		value = readl(otg_regs + OTGSTS);
+		ret = readl_poll_timeout_atomic(otg_regs + OTGSTS, value,
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
@@ -206,6 +380,7 @@ static struct platform_driver cdns_imx_driver = {
 	.driver		= {
 		.name	= "cdns3-imx",
 		.of_match_table	= cdns_imx_of_match,
+		.pm	= &cdns_imx_pm_ops,
 	},
 };
 module_platform_driver(cdns_imx_driver);
-- 
2.17.1

