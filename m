Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA0E2E7011
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 12:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgL2LsN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 06:48:13 -0500
Received: from mail-db8eur05on2086.outbound.protection.outlook.com ([40.107.20.86]:50497
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725964AbgL2LsM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Dec 2020 06:48:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiG+mc0DgyCS+htbQ/NAiqHxAh4E1IaEJU8+RbgViGbeI56kjC2mJzFM3GOco7Lg8Dpdd+43nKk+QRMX3ffm/99pOM/xnbw+ttsOYxMAIpkJyOUnyHVDKhuI+QNs6/oG6RBV+lKpwEA4kcYDkosXEll448nrYB87c5Lq7VvseCSbOPH83uWSD4OTYlvlIolbVg58+Q7gZDvjaQxFd3tCLkOpDiD50Ag/cr0+4PSa8Lmcp7f84Ft4flR2Q5NHkTvjU9YHxaxeLzykFxCn/NfCHJglc0z9db68lkOofa6ZqI2m54iqS/WoJ/qYS1ndkUAHkDvXGQmgxVRW0g9uq8iBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1ZHb9nKC1jaMU0wzeDCWAt3Wlj7zGMTGS/Y2i2RtTs=;
 b=RnKF3DQKzwDDGjat9Zblpndt8XLb3iXHISHRsme60xqLKZ6/Dx1kbISVdjR5oGImt4cW1FYYXf1LWACx8GnPUW7eWLKXdzSnVsZSZemGmyLZ7aYGlW92RSasvKhU7/r2w0zEfoDp3lrcSBPs39SZhwXFHO7sSQDQlna42ZKkCn4wAXEAvcKLPGlgVCQpmZfyWdpRSQ8Omq+6kQ5D7JfLtyeENBGS/kufAmlfUNbH2UTVpvku1wHbSEcLQ48R/SHh5YaPSTvJZfa09AumBdnDZxZOyuZz/RX/7TvpxUm7HUCrPGTjGA1P8uxxs6GXDRtwG5CniKn8WmLDahwp68E1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1ZHb9nKC1jaMU0wzeDCWAt3Wlj7zGMTGS/Y2i2RtTs=;
 b=DzwkFFs95ezlYsvYDV9dAyriQg11UFiEiggASHfV2qOXb3+Umf+Q8fu5xb1Jy1WPOz7uX52BpW9AEl+MJ40Mm0eVVHUKOBtL6oZ9kxYO9Nx2r2pXqTf1A79MkmapvsD+xfCJrOfzTc1qU9r6cntcs2vmIN6xT5SAzQB+kCIPz2g=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6653.eurprd04.prod.outlook.com (2603:10a6:803:122::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 11:47:04 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 11:47:04 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     balbi@kernel.org, krzk@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, l.stach@pengutronix.de, jun.li@nxp.com,
        aisheng.dong@nxp.com, peng.fan@nxp.com, peter.chen@nxp.com
Subject: [PATCH RESEND v5 2/4] usb: dwc3: add imx8mp dwc3 glue layer driver
Date:   Tue, 29 Dec 2020 19:37:44 +0800
Message-Id: <1609241866-9508-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609241866-9508-1-git-send-email-jun.li@nxp.com>
References: <1609241866-9508-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0173.apcprd06.prod.outlook.com
 (2603:1096:1:1e::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0173.apcprd06.prod.outlook.com (2603:1096:1:1e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 11:46:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81fdc84d-ba4e-4eb8-b1f8-08d8abef765a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6653DED0E3929A79E52E7DFD89D80@VE1PR04MB6653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zjMiEJf38qLOkZEUxGKAaip0tK78MYyGQMn+/DCGAAKs6ndmXzrwKxCPztFdqOPlqa6eJBbl6EVMWQqPQ+DfPUc5kD3P5u6zMqyWtwKyvZogFfs2j4RUROCxHbegVxYJoigcIkSmDZ+yBNto7ke1/MtvjmaoeGhNO85e4g8ltzat0pQ5PGccnHydq0PuB2vUbSfIyGveXDp0YXupS4+40mn+nEyRebZnDpld9u0dcwmoWHHM0feEvMx+yzU7t+/9+4Ts5+Z8N3z64I+KzvItzR8zaYjPbkynz63+zaYH6TzbS8icRygcLf8nJyvQOz1vRGV4AvJkWwXFDw5IqqtTcSPW03NchjGUkAGYIjHpsDq3YJRUkVxte+5IkU6bNYKhUfAiA9bPs0QA7F/m9hF8nSbtuRobKFzEYSJFm+WxE4n+8NMGDwMqU83ClvzU4gL3tOYk3+jxKn2ffli29Md0LMrpjvKgulRLY8p4gCozq8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6506007)(66476007)(4326008)(83380400001)(26005)(8676002)(66946007)(956004)(30864003)(2616005)(2906002)(69590400010)(5660300002)(66556008)(16526019)(6512007)(498600001)(6666004)(8936002)(7416002)(52116002)(186003)(86362001)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2CAOiZDUz+YuQgsNOslkp07nZ8ejbl9l5m1ixg8DzlY014rcFN7hXJfM2WtJ?=
 =?us-ascii?Q?vGlWFzvtOFaCrvjcltDJweUM6MRwF/yLFRqnm4WHeAPyV3HfmGFoUg1RqqHU?=
 =?us-ascii?Q?lqhrJbZa/b10mLFrzBRp/NBjNXpof+geXtYSmmnBtKmJmSISwzm45RwVFRcs?=
 =?us-ascii?Q?aUwu1fDjAftFz/nJeJmIeCLdsIADNG736DOkBmppRXrehIJodVACxJwWRgTr?=
 =?us-ascii?Q?wCr7fM77VwXtXUVTmxmXynWo5rnDvNK4aTu3KRimSDgEOJAxOX2WMscbWpyq?=
 =?us-ascii?Q?KvtFM//b1UYlMeUXUDoEJosVnWS6krehB/qX+Mrg/JfO7bIw6mr4df346PVU?=
 =?us-ascii?Q?YMlsjitK7dmK8pvh5GWjZK4sVLgIixcB/JjNej80wa7srgzGzi236pEKle4n?=
 =?us-ascii?Q?8FslBdFSANsJQCX+InepcrUB+WjfamkZg+kIEMDPqMDRNSaH/x9xe5Cjd+mU?=
 =?us-ascii?Q?aes9IFiClyC4u2AZml+kZMS25knE2nzNJ+LFO2Oax1wKUASbQHYNLZjG13U1?=
 =?us-ascii?Q?6ehNYK94zYIyJXGiRT95YAspL4uiPDQvWoenWfNf149H0E7es5hiGMmh8FCf?=
 =?us-ascii?Q?4SRI2FD268k8N31q8uDhTwWs87w60QFaV7QtZ1bKhA8oRgTJkTsBnXgCDEuE?=
 =?us-ascii?Q?WbiGXoxpZGqs8vkVh1KbuzuyJfUSPD2CgAVLb6bVlaFzPZI+n2wOFZMllbQq?=
 =?us-ascii?Q?WMCVmldcHQPQbDL8myGJNb8ewxmRhgKxCgKNb3ekkiGb6ikax3OPPb9gHR7L?=
 =?us-ascii?Q?5PJwWTmE9LsbMuQAErjFkPWDhDk21zsuf1a5UWiasn9LMpM+Mo8+dFtWwcuI?=
 =?us-ascii?Q?lhoXL2VZ01A7D/mhqTxiDsCDpUIJ0VNl8+Nu17bCS7l2+DRC8zBYmhRPM6vi?=
 =?us-ascii?Q?2d/P14gBB/mS6Is6a6Y8m8y0WgDtStotB+j7Y+USLS4wGCFFZy3wMNv8Qm4R?=
 =?us-ascii?Q?eujI4IQUrBIdahXYHv8MvqTzS53sIuoXJd+9OM762a6W2jHV4b5IxHgibbEC?=
 =?us-ascii?Q?8PKR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:47:04.3214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fdc84d-ba4e-4eb8-b1f8-08d8abef765a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGYDdUIpbvBNa3tajveQxdecfhk1ioY6B8NYoFT8AdVGzlg+2RRveEFbXiQFc79D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6653
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
 drivers/usb/dwc3/dwc3-imx8mp.c | 363 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 374 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 7a23045..2133acf 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -139,4 +139,14 @@ config USB_DWC3_QCOM
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
index 0000000..75f0042
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -0,0 +1,363 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * dwc3-imx8mp.c - NXP imx8mp Specific Glue layer
+ *
+ * Copyright (c) 2020 NXP.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
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
+	struct clk			*hsio_clk;
+	struct clk			*suspend_clk;
+	int				irq;
+	bool				pm_suspended;
+	bool				wakeup_pending;
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
+	dwc3_imx->hsio_clk = devm_clk_get(dev, "hsio");
+	if (IS_ERR(dwc3_imx->hsio_clk)) {
+		err = PTR_ERR(dwc3_imx->hsio_clk);
+		dev_err(dev, "Failed to get hsio clk, err=%d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(dwc3_imx->hsio_clk);
+	if (err) {
+		dev_err(dev, "Failed to enable hsio clk, err=%d\n", err);
+		return err;
+	}
+
+	dwc3_imx->suspend_clk = devm_clk_get(dev, "suspend");
+	if (IS_ERR(dwc3_imx->suspend_clk)) {
+		err = PTR_ERR(dwc3_imx->suspend_clk);
+		dev_err(dev, "Failed to get suspend clk, err=%d\n", err);
+		goto disable_hsio_clk;
+	}
+
+	err = clk_prepare_enable(dwc3_imx->suspend_clk);
+	if (err) {
+		dev_err(dev, "Failed to enable suspend clk, err=%d\n", err);
+		goto disable_hsio_clk;
+	}
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
+		goto err_node_put;
+	}
+
+	dwc3_imx->dwc3 = of_find_device_by_node(dwc3_np);
+	if (!dwc3_imx->dwc3) {
+		dev_err(dev, "failed to get dwc3 platform device\n");
+		err = -ENODEV;
+		goto depopulate;
+	}
+	of_node_put(dwc3_np);
+
+	device_set_wakeup_capable(dev, true);
+	pm_runtime_put(dev);
+
+	return 0;
+
+depopulate:
+	of_platform_depopulate(dev);
+err_node_put:
+	of_node_put(dwc3_np);
+disable_rpm:
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+disable_clks:
+	clk_disable_unprepare(dwc3_imx->suspend_clk);
+disable_hsio_clk:
+	clk_disable_unprepare(dwc3_imx->hsio_clk);
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
+	clk_disable_unprepare(dwc3_imx->suspend_clk);
+	clk_disable_unprepare(dwc3_imx->hsio_clk);
+
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx,
+					      pm_message_t msg)
+{
+	if (dwc3_imx->pm_suspended)
+		return 0;
+
+	/* Wakeup enable */
+	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc3_imx->dev))
+		dwc3_imx8mp_wakeup_enable(dwc3_imx);
+
+	dwc3_imx->pm_suspended = true;
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx,
+					     pm_message_t msg)
+{
+	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3);
+	int ret = 0;
+
+	if (!dwc3_imx->pm_suspended)
+		return 0;
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
+	else
+		clk_disable_unprepare(dwc3_imx->suspend_clk);
+
+	clk_disable_unprepare(dwc3_imx->hsio_clk);
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
+	if (device_may_wakeup(dwc3_imx->dev)) {
+		disable_irq_wake(dwc3_imx->irq);
+	} else {
+		ret = clk_prepare_enable(dwc3_imx->suspend_clk);
+		if (ret)
+			return ret;
+	}
+
+	ret = clk_prepare_enable(dwc3_imx->hsio_clk);
+	if (ret)
+		return ret;
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

