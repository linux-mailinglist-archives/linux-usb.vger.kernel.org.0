Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9973E281804
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 18:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388068AbgJBQfM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 12:35:12 -0400
Received: from mail-vi1eur05on2073.outbound.protection.outlook.com ([40.107.21.73]:38881
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733260AbgJBQfM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 12:35:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oixx7U/adOp2IWgNYpc7EU28HRIp7IW+9fcc7qiiAPQ7pqtVtCKfQhSXzOocE8O6S9gcmWj5+Hnqqzs3MFMZFYq4ADsY2SK+5buhZFCzAyuZA/IPzgKu2zlTYZCyqkdQymYT8CXaH2JM/gRKvu274JuhzQd0dkMiUDzsmyalkX9nqFic11HV8hGqQEYLm4JmDy6ben0Mc/xieZs4mMvTO619MuEPo+s43EYFn29lKV4ysRSMMA7LDJQTu0mFAQxLL6ohi7/VjPh50IUQ8kf5j6+IXMVxhV/RP/V4wYLP4yAgkxlgKp0HgdMAtRXe7B7hMbW5jNmWfFQC3uA/8gXbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1ZHb9nKC1jaMU0wzeDCWAt3Wlj7zGMTGS/Y2i2RtTs=;
 b=OKh2UYPNTUkCSO+gC68Y3xAm5TElfnintnKUJLc8uMEJAlgxjKEetu0si2qc/yipXgosytmZ0t9GO/iHG/KavN/8qvM5vlfb41aPUKITBN142+SkC1InDbpwB4TAArI0wsbFwXuFHsTEcjtT4dQVxeqQDEJoE5UzHpUfm0925fX78u6QKUEDLmV6BVOAdQdNyc790+LdCUtcyZ6wXBkri05bmEbfV0Jx9sapxCfVwXscM0Kho4mEDx5NhNZ5qvjxfmIVOver7w80udZ/E98Zbrbe9WJkmECW8QPgd7GjAL7D47qwLHWd2AS9s7dLL5s8GOXNq96sTLliXWevCp82jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1ZHb9nKC1jaMU0wzeDCWAt3Wlj7zGMTGS/Y2i2RtTs=;
 b=bvtQIjNjU7+sSXvbsNSoPq51/gEWXr18g4BKBEzZTC+OF82NfUIL7Aa6zVa2LuNq+CPhjGp+H7vy0XBAqcRXT5s3SABrmeAgjk4pRCuZlN7UoPM3ApfnJ6OgCP9GXYwcNIjuwe75xCCgnmgiK3ewl1JBOFwZ1PQSZdsxbrVOnus=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5213.eurprd04.prod.outlook.com (2603:10a6:803:54::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 16:35:06 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3433.035; Fri, 2 Oct 2020
 16:35:06 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/4] usb: dwc3: add imx8mp dwc3 glue layer driver
Date:   Sat,  3 Oct 2020 00:30:36 +0800
Message-Id: <1601656238-22232-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601656238-22232-1-git-send-email-jun.li@nxp.com>
References: <1601656238-22232-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0106.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::32) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0106.apcprd01.prod.exchangelabs.com (2603:1096:3:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3433.36 via Frontend Transport; Fri, 2 Oct 2020 16:35:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a3f3570-8740-473c-474e-08d866f11e96
X-MS-TrafficTypeDiagnostic: VI1PR04MB5213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5213CA3D205539BD90EBFE7289310@VI1PR04MB5213.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oaGn8K1u+HK44ZBMYGc3qDCmh8UyYpKIGLaiK8UYjqz64KLZo0rXtIFZ/srKXbucE6soyQElVHsQOEU0iG6LudxHhvcQZNVg4+p0ppJoV/QoMKd4XmQlH0Vdm/DGkfK0+RSiT+ymJ6iMnq3KrGo4LGYNNduOxXKmw/3rxs7GOs2KG/X6QEEPAsluuvNRfpMb3MgSz7b9egVbLaQYUNF2HhPv+gzAwY03i541yVYEUUOBOHiduLJZMONmGqOvP5gjo+xPcLG3ZW9Js1iwcF5m5AyPktj8oXOvvnISKmmKKVAkVfCnRLjXrC2Dm3s5Kc8axxYwO8xa1DeYMu0bqhp4th43yPVLNjeCcInVLLZHtKoMhjsS+OwTeekPyVRJIk1oMkbmwA3kotKu2vRUPfhcNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(6666004)(30864003)(52116002)(478600001)(8936002)(6506007)(16526019)(4326008)(69590400008)(6486002)(26005)(186003)(83380400001)(2906002)(956004)(316002)(86362001)(8676002)(6512007)(2616005)(36756003)(5660300002)(7416002)(66556008)(66946007)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: UQ4ZCvPLFCNUn/WqE7NLbMiWDNu9+ybwBPSvA1ld7hpe0dxXTCOJ2Gt4CIEW+nnF/IK3+XdIJxXUQd6tiXEiEtD0yz/5CONJ0xsgTMlu/q+2FjMa4EIc12XmqJId+2uyaC+vv7367wpjLmKQMmjA7XEUG1SI5y6LHPBRsThxWFgD8G8tICnr7qvxiBOiQ2vtVTcPHDw0QPl1nBuMYuRc6asHxnqNmddl/luf6lcMV3BH59CZ2Kr27J/DcxCxdVdBM3bbekZs9voJSJnG4cMQ6uco88Fjyfd9E45lCR8iPa7/aof5ElI8Td5GbGf9JjmBjPhDE4U72Dp2D6nX+hQT/TguBCgVIqMHPS1wiLJueGDdm8YCCbSdYuvMns6LhLDrT9aTEK06GBm/2TpqO+OYPbuDbs9Noyn1UaK1vpTagABqs+KQXWEjkLFcnj2CVqRSF3b2tTcAlg8eq/XUqnNS5oGZLpb0yTI2cZv5aNZ7oWM0F1uRwI2FbPAOvDEN7BC5PJe9P+O2rRvx4tMzkMdO63FaqCzfYn7M7PFhkeL6QnItaMasQGEn+kerQ8kT6bumiNZJBz1dDDntCEbqRr/Z2Ec4mSKSpFdlbcy2donAfcQ2fXHFsoluAVigVdjfZn3KAiXp13NANgyDKXkeKEPYqA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3f3570-8740-473c-474e-08d866f11e96
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 16:35:06.3969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnI32hn3TCvsXLCksb0GE8pEvpHFUuTiT3WAVhVRcZA71uIvu1IVX8Txogl9DA8C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5213
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

