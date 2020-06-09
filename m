Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55431F3991
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 13:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbgFILXs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 07:23:48 -0400
Received: from mail-eopbgr20076.outbound.protection.outlook.com ([40.107.2.76]:15630
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727002AbgFILXq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 07:23:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6NfUFgetmGfNFO5SypJw42P3RmAg6zc0CCu+VKHJkcNhKcize6BYDK/MsHeJkKO7675UCiB6t4N3QnsG42njQufGBnAnZR3eMcHoShsvJTOblU/AdVTxfDYB29+g8jyjYxoHZdqyqfRewmoZcuP9s5fNhPnnb6mAanHNMtmPHA1vuGpvlF6sBWrP66Bm5bGScHdb0PQbihbC4y0em3ETa+NkkvJHKKyPC+L1pohADf3N8o6J5EE7POCsOtq+Gd9JU7CKfmUzcOiN1thq3DPj23ddm1Hh3RQTIeiVc/4TmAbyWoJzKOz7/vxJMcUeJo398BDLS0M9D4a2ua8iDF4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7kp8bj7T4nxJtCEHeWWp4HzvkwSChzVbMD6szEdH78=;
 b=eTC6uXm/y8pLwr3KmztsmFohGMM1Rph4TLF6me3LZOUMvBYkYSSqkxgf1MvWZQhbP9f9gXl6qNgYdqlwpcDX+NLuyL9YQmuY3q7cG48cUcyOJB03e70N/Fw+WQMWEfSBot7KDEDjY6SWV1PkQ6IXX4YaGKgnFqJanL6fwPXjJN6H8uzNdvbMfVS4YcuuXsfl2sqY3JAeX+QA7mcvLop6av33fcRexrDKUvdsHJ4ObDp15V76DdTTgYLhLC7B6iZVr1wCLy55468BfjvBItLISLqe6ebfAlxEYc6tnOrfzHn8jCTFhI/1b9Bv2r68E0+MSkU/mX3Kr7vmmEp5spymHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7kp8bj7T4nxJtCEHeWWp4HzvkwSChzVbMD6szEdH78=;
 b=E6zZCmcNvE91qLnKYzISUgrlMzO6f/uL2eYCZsF0qNlLIvSov263kyIEvWoR1bG0w08+uMYAD/Y5VLTP8agmjJHDSVOGeLHUZ0Kmg8pHg8LCRSOZaFritdw5zN/qIPEtvxxLbRun34QCoCNI700Iq/yZqkzVyZwHBCWwsqmNXu0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Tue, 9 Jun
 2020 11:23:41 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 11:23:41 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, peter.chen@nxp.com
Subject: [PATCH 3/6] usb: dwc3: add imx8mp dwc3 glue layer driver
Date:   Tue,  9 Jun 2020 19:12:42 +0800
Message-Id: <1591701165-12872-4-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0069.apcprd02.prod.outlook.com (2603:1096:4:54::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 11:23:37 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 86846476-5e28-4f17-6ad5-08d80c679008
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6589D39D0411E4E1F178C4C389820@VE1PR04MB6589.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7iD44GSsSB2/jV0mkLNynXnUVxXxyVQqjkv0HnvaQSREI52Wl2DrRUJ7YMDEggqNT5whGHZSLNg9Z6UsBi/w+qaxLAuSKK0HkG7kLhyQe4OT89LDuWtpdg2iMCcYaHv+xGiIjzlPglb3sIzMRH1oxVevOumR82+RqXIHpaopjis8wXWBIZvKqy39XcmoZ7Ub5SljECHeqc/8ClkeeN9x5EJmG6wEDa44mAaSEFW7Hazg5+oJyXmN1kzvOW9pkdLpWz5BFlraCTELFIysRzhZhYXRPNq3bo8couDT2yip3vcAedgjCElc5/Xqragu6xjqRYLQ1tbj8O2xWBUYtDibBymvuVsLQEXFJguvi+MbyiRBdkih6BKngGxe6m7W87uK6iT8YwWMfp5dbz6JweBjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(8676002)(4326008)(8936002)(66556008)(66476007)(5660300002)(66946007)(30864003)(86362001)(16526019)(36756003)(498600001)(6506007)(69590400007)(2906002)(6512007)(26005)(2616005)(6486002)(83380400001)(956004)(52116002)(6666004)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Oe2lld5WTWDUPVGgnUl9dzqHJiJIe08+M2YG88J6wh233BIF/+iMr6WYX8w3p8IpOvjf0PxRtkb6wkYcGqmUVPsEKdwhoZZrsqxxvHysI+38c1W/xico93AUrNj//xA1RUYLsp9GAS02TlOH5kHXAUU8tNmajshVcMBQ8aLzbalbzhU67Z2cZECCW7THV/43yU3OHK/2FVOtX9mwua6BzcGTdcJllZd5q5SdwG2p9LVJOAlznC5fcveO3p9GHdG9JZctBw/GVd8ugr8Ka8uxV3Rpc/+rk9ZQrbYFyEASCFcMU7agp2gafUk4kNPXXdZ3HoKu0jgH/+UPxKnqw6mmx5c08Izfk1G/H/WkjRCOCa4LXG+dkpcG0XI8JLPleNOTzoHfr8kFAFYZGkl8oFNiYxzJOGLvoqfW5aCKTHJEdvawkd8XugEVHY+lbjnbpZ2IHa53isvi9H48jkrX7brZc02dnZo9OAFQ+0LrVS2Bq+c=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86846476-5e28-4f17-6ad5-08d80c679008
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 11:23:41.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZZBXWXPQjjAUuZsLXXVulMwEkeubzYZd4mUvmoibVxyJq+TQsDlaltro2YjaiKw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6589
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

imx8mp SoC integrate dwc3 3.30b IP and has some customizations to
support low power, which has a seprated wakeup irq and additional
logic to wakeup usb from low power mode both for host mode and
device mode.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/Kconfig       |  10 ++
 drivers/usb/dwc3/Makefile      |   1 +
 drivers/usb/dwc3/dwc3-imx8mp.c | 352 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 363 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 206caa0..7ef2339 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -138,4 +138,14 @@ config USB_DWC3_QCOM
 	  for peripheral mode support.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_IMX8MP
+	tristate "NXP iMX8MP Platform"
+	depends on OF && COMMON_CLK
+	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
+	default USB_DWC3
+	help
+	  NXP iMX8M Plus SoC use DesignWare Core IP for USB2/3
+	  functionality.
+	  Say 'Y' or 'M' if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index ae86da0..2259f88 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -51,3 +51,4 @@ obj-$(CONFIG_USB_DWC3_MESON_G12A)	+= dwc3-meson-g12a.o
 obj-$(CONFIG_USB_DWC3_OF_SIMPLE)	+= dwc3-of-simple.o
 obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
+obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
new file mode 100644
index 0000000..d4e9e99
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * dwc3-imx8mp.c - NXP imx8mp Specific Glue layer
+ *
+ * Copyright (c) 2020 NXP.
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+
+#include "core.h"
+
+/* USB wakeup registers */
+#define USB_WAKEUP_CTRL			0x00
+
+/* Global wakeup interrupt enable, also used to clear interrupt */
+#define USB_WAKEUP_EN			BIT(31)
+/* Wakeup from connect or disconnect, only for superspeed */
+#define USB_WAKEUP_SS_CONN		BIT(5)
+/* 0 select vbus_valid, 1 select sessvld */
+#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
+/* Enable signal for wake up from u3 state */
+#define USB_WAKEUP_U3_EN		BIT(3)
+/* Enable signal for wake up from id change */
+#define USB_WAKEUP_ID_EN		BIT(2)
+/* Enable signal for wake up from vbus change */
+#define	USB_WAKEUP_VBUS_EN		BIT(1)
+/* Enable signal for wake up from dp/dm change */
+#define USB_WAKEUP_DPDM_EN		BIT(0)
+
+#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
+
+struct dwc3_imx8mp {
+	struct device			*dev;
+	struct platform_device		*dwc3;
+	void __iomem			*glue_base;
+	struct clk_bulk_data		*clks;
+	int				num_clks;
+	int				irq;
+	bool				pm_suspended;
+	bool				wakeup_pending;
+};
+
+static const struct clk_bulk_data dwc3_imx8mp_clks[] = {
+	{ .id = "hsio" },
+	{ .id = "bus" },
+	{ .id = "suspend" },
+};
+
+static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx)
+{
+	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
+	u32		val;
+
+	if (!dwc3)
+		return;
+
+	val = readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+
+	if ((dwc3->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci)
+		val |= USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
+		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
+	else if (dwc3->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
+		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
+
+	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+}
+
+static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)
+{
+	u32 val;
+
+	val = readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
+	writel(val, dwc3_imx->glue_base + USB_WAKEUP_CTRL);
+}
+
+static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
+{
+	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
+	struct dwc3		*dwc = platform_get_drvdata(dwc3_imx->dwc3);
+
+	if (!dwc3_imx->pm_suspended)
+		return IRQ_HANDLED;
+
+	disable_irq_nosync(dwc3_imx->irq);
+	dwc3_imx->wakeup_pending = true;
+
+	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
+		pm_runtime_resume(&dwc->xhci->dev);
+	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+		pm_runtime_get(dwc->dev);
+
+	return IRQ_HANDLED;
+}
+
+static int dwc3_imx8mp_probe(struct platform_device *pdev)
+{
+	struct device		*dev = &pdev->dev;
+	struct device_node	*dwc3_np, *node = dev->of_node;
+	struct dwc3_imx8mp	*dwc3_imx;
+	int			err, irq;
+
+	if (!node) {
+		dev_err(dev, "device node not found\n");
+		return -EINVAL;
+	}
+
+	dwc3_imx = devm_kzalloc(dev, sizeof(*dwc3_imx), GFP_KERNEL);
+	if (!dwc3_imx)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dwc3_imx);
+
+	dwc3_imx->dev = dev;
+
+	dwc3_imx->glue_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dwc3_imx->glue_base))
+		return PTR_ERR(dwc3_imx->glue_base);
+
+	dwc3_imx->clks = devm_kmemdup(dev, dwc3_imx8mp_clks,
+			sizeof(dwc3_imx8mp_clks), GFP_KERNEL);
+	if (!dwc3_imx->clks)
+		return -ENOMEM;
+
+	dwc3_imx->num_clks = ARRAY_SIZE(dwc3_imx8mp_clks);
+	err = devm_clk_bulk_get(dev, dwc3_imx->num_clks, dwc3_imx->clks);
+	if (err) {
+		dev_err(dev, "Failed to request all necessary clocks\n");
+		return err;
+	}
+
+	err = clk_bulk_prepare_enable(dwc3_imx->num_clks, dwc3_imx->clks);
+	if (err)
+		return err;
+
+	/* Double enable suspend clk to keep it always on  */
+	err = clk_prepare_enable(dwc3_imx->clks[dwc3_imx->num_clks-1].clk);
+	if (err)
+		goto disable_bulk_clk;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		err = irq;
+		goto disable_clks;
+	}
+	dwc3_imx->irq = irq;
+
+	err = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx8mp_interrupt,
+					IRQF_ONESHOT, dev_name(dev), dwc3_imx);
+	if (err) {
+		dev_err(dev, "failed to request IRQ #%d --> %d\n", irq, err);
+		goto disable_clks;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	err = pm_runtime_get_sync(dev);
+	if (err < 0)
+		goto disable_rpm;
+
+	dwc3_np = of_get_child_by_name(node, "dwc3");
+	if (!dwc3_np) {
+		dev_err(dev, "failed to find dwc3 core child\n");
+		goto disable_rpm;
+	}
+
+	err = of_platform_populate(node, NULL, NULL, dev);
+	if (err) {
+		dev_err(&pdev->dev, "failed to create dwc3 core\n");
+		goto disable_rpm;
+	}
+
+	dwc3_imx->dwc3 = of_find_device_by_node(dwc3_np);
+	if (!dwc3_imx->dwc3) {
+		dev_err(dev, "failed to get dwc3 platform device\n");
+		err = -ENODEV;
+		goto depopulate;
+	}
+
+	device_set_wakeup_capable(dev, true);
+	pm_runtime_put(dev);
+
+	return 0;
+
+depopulate:
+	of_platform_depopulate(dev);
+disable_rpm:
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+disable_clks:
+	clk_disable_unprepare(dwc3_imx->clks[dwc3_imx->num_clks-1].clk);
+disable_bulk_clk:
+	clk_bulk_disable_unprepare(dwc3_imx->num_clks, dwc3_imx->clks);
+
+	return err;
+}
+
+static int dwc3_imx8mp_remove(struct platform_device *pdev)
+{
+	struct dwc3_imx8mp *dwc3_imx = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_get_sync(dev);
+	of_platform_depopulate(dev);
+
+	clk_bulk_disable_unprepare(dwc3_imx->num_clks, dwc3_imx->clks);
+	clk_disable_unprepare(dwc3_imx->clks[dwc3_imx->num_clks-1].clk);
+
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+static int dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
+{
+	if (dwc3_imx->pm_suspended)
+		return 0;
+
+	/* Wakeup enable */
+	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc3_imx->dev))
+		dwc3_imx8mp_wakeup_enable(dwc3_imx);
+
+	clk_bulk_disable_unprepare(dwc3_imx->num_clks, dwc3_imx->clks);
+	dwc3_imx->pm_suspended = true;
+
+	return 0;
+}
+
+static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3);
+	int ret = 0;
+
+	if (!dwc3_imx->pm_suspended)
+		return 0;
+
+	ret = clk_bulk_prepare_enable(dwc3_imx->num_clks, dwc3_imx->clks);
+	if (ret)
+		return ret;
+
+	/* Wakeup disable */
+	dwc3_imx8mp_wakeup_disable(dwc3_imx);
+	dwc3_imx->pm_suspended = false;
+
+	if (dwc3_imx->wakeup_pending) {
+		dwc3_imx->wakeup_pending = false;
+		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) {
+			pm_runtime_mark_last_busy(dwc->dev);
+			pm_runtime_put_autosuspend(dwc->dev);
+		} else {
+			/*
+			 * Add wait for xhci switch from suspend
+			 * clock to normal clock to detect connection.
+			 */
+			usleep_range(9000, 10000);
+		}
+		enable_irq(dwc3_imx->irq);
+	}
+
+	return ret;
+}
+
+static int __maybe_unused dwc3_imx8mp_pm_suspend(struct device *dev)
+{
+	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = dwc3_imx8mp_suspend(dwc3_imx, PMSG_SUSPEND);
+
+	if (device_may_wakeup(dwc3_imx->dev))
+		enable_irq_wake(dwc3_imx->irq);
+
+	dev_dbg(dev, "dwc3 imx8mp pm suspend.\n");
+
+	return ret;
+}
+
+static int __maybe_unused dwc3_imx8mp_pm_resume(struct device *dev)
+{
+	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
+	int ret;
+
+	if (device_may_wakeup(dwc3_imx->dev))
+		disable_irq_wake(dwc3_imx->irq);
+
+	ret = dwc3_imx8mp_resume(dwc3_imx, PMSG_RESUME);
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	dev_dbg(dev, "dwc3 imx8mp pm resume.\n");
+
+	return ret;
+}
+
+static int __maybe_unused dwc3_imx8mp_runtime_suspend(struct device *dev)
+{
+	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "dwc3 imx8mp runtime suspend.\n");
+
+	return dwc3_imx8mp_suspend(dwc3_imx, PMSG_AUTO_SUSPEND);
+}
+
+static int __maybe_unused dwc3_imx8mp_runtime_resume(struct device *dev)
+{
+	struct dwc3_imx8mp *dwc3_imx = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "dwc3 imx8mp runtime resume.\n");
+
+	return dwc3_imx8mp_resume(dwc3_imx, PMSG_AUTO_RESUME);
+}
+
+static const struct dev_pm_ops dwc3_imx8mp_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_imx8mp_pm_suspend, dwc3_imx8mp_pm_resume)
+	SET_RUNTIME_PM_OPS(dwc3_imx8mp_runtime_suspend,
+			   dwc3_imx8mp_runtime_resume, NULL)
+};
+
+static const struct of_device_id dwc3_imx8mp_of_match[] = {
+	{ .compatible = "fsl,imx8mp-dwc3", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dwc3_imx8mp_of_match);
+
+static struct platform_driver dwc3_imx8mp_driver = {
+	.probe		= dwc3_imx8mp_probe,
+	.remove		= dwc3_imx8mp_remove,
+	.driver		= {
+		.name	= "imx8mp-dwc3",
+		.pm	= &dwc3_imx8mp_dev_pm_ops,
+		.of_match_table	= dwc3_imx8mp_of_match,
+	},
+};
+
+module_platform_driver(dwc3_imx8mp_driver);
+
+MODULE_ALIAS("platform:imx8mp-dwc3");
+MODULE_AUTHOR("jun.li@nxp.com");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("DesignWare USB3 imx8mp Glue Layer");
-- 
2.7.4

