Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D20A7092
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 18:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbfICQZG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 12:25:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730261AbfICQZG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Sep 2019 12:25:06 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D15632343A;
        Tue,  3 Sep 2019 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567527905;
        bh=N3YSTQ638/t2CYnEWpV4wwKroGcApSY+Ppjvq/fSUjc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CGzhNh/Xkfxm7nZoBsDSxoEkkMKy+o53oGcfsc7QVmOTEuCIH0OnKy8uBzI8ffXoJ
         zu0fwFn92yvpcCBvnI1xYZNq7d+lh1aIDLFfynRTA3Fglk3uo7bo5tznn2MwLZhcm6
         9PRJsfA8mWB3pHlwAp5auNygKFd3f1fg9QlZZrrM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 16/23] usb: chipidea: imx: add imx7ulp support
Date:   Tue,  3 Sep 2019 12:24:17 -0400
Message-Id: <20190903162424.6877-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162424.6877-1-sashal@kernel.org>
References: <20190903162424.6877-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

In this commit, we add CI_HDRC_PMQOS to avoid system entering idle,
at imx7ulp, if the system enters idle, the DMA will stop, so the USB
transfer can't work at this case.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 28 +++++++++++++++++++++++++++-
 drivers/usb/chipidea/usbmisc_imx.c |  4 ++++
 include/linux/usb/chipidea.h       |  1 +
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index ceec8d5985d46..a76708501236d 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -13,6 +13,7 @@
 #include <linux/usb/of.h>
 #include <linux/clk.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_qos.h>
 
 #include "ci.h"
 #include "ci_hdrc_imx.h"
@@ -63,6 +64,11 @@ static const struct ci_hdrc_imx_platform_flag imx7d_usb_data = {
 	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM,
 };
 
+static const struct ci_hdrc_imx_platform_flag imx7ulp_usb_data = {
+	.flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
+		CI_HDRC_PMQOS,
+};
+
 static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx23-usb", .data = &imx23_usb_data},
 	{ .compatible = "fsl,imx28-usb", .data = &imx28_usb_data},
@@ -72,6 +78,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx6sx-usb", .data = &imx6sx_usb_data},
 	{ .compatible = "fsl,imx6ul-usb", .data = &imx6ul_usb_data},
 	{ .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
+	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
@@ -93,6 +100,8 @@ struct ci_hdrc_imx_data {
 	struct clk *clk_ahb;
 	struct clk *clk_per;
 	/* --------------------------------- */
+	struct pm_qos_request pm_qos_req;
+	const struct ci_hdrc_imx_platform_flag *plat_data;
 };
 
 /* Common functions shared by usbmisc drivers */
@@ -309,6 +318,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->plat_data = imx_platform_flag;
+	pdata.flags |= imx_platform_flag->flags;
 	platform_set_drvdata(pdev, data);
 	data->usbmisc_data = usbmisc_get_init_data(dev);
 	if (IS_ERR(data->usbmisc_data))
@@ -369,6 +380,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 			}
 		}
 	}
+
+	if (pdata.flags & CI_HDRC_PMQOS)
+		pm_qos_add_request(&data->pm_qos_req,
+			PM_QOS_CPU_DMA_LATENCY, 0);
+
 	ret = imx_get_clks(dev);
 	if (ret)
 		goto disable_hsic_regulator;
@@ -396,7 +412,6 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		usb_phy_init(pdata.usb_phy);
 	}
 
-	pdata.flags |= imx_platform_flag->flags;
 	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
 		data->supports_runtime_pm = true;
 
@@ -439,6 +454,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 disable_hsic_regulator:
 	if (data->hsic_pad_regulator)
 		ret = regulator_disable(data->hsic_pad_regulator);
+	if (pdata.flags & CI_HDRC_PMQOS)
+		pm_qos_remove_request(&data->pm_qos_req);
 	return ret;
 }
 
@@ -455,6 +472,8 @@ static int ci_hdrc_imx_remove(struct platform_device *pdev)
 	if (data->override_phy_control)
 		usb_phy_shutdown(data->phy);
 	imx_disable_unprepare_clks(&pdev->dev);
+	if (data->plat_data->flags & CI_HDRC_PMQOS)
+		pm_qos_remove_request(&data->pm_qos_req);
 	if (data->hsic_pad_regulator)
 		regulator_disable(data->hsic_pad_regulator);
 
@@ -480,6 +499,9 @@ static int __maybe_unused imx_controller_suspend(struct device *dev)
 	}
 
 	imx_disable_unprepare_clks(dev);
+	if (data->plat_data->flags & CI_HDRC_PMQOS)
+		pm_qos_remove_request(&data->pm_qos_req);
+
 	data->in_lpm = true;
 
 	return 0;
@@ -497,6 +519,10 @@ static int __maybe_unused imx_controller_resume(struct device *dev)
 		return 0;
 	}
 
+	if (data->plat_data->flags & CI_HDRC_PMQOS)
+		pm_qos_add_request(&data->pm_qos_req,
+			PM_QOS_CPU_DMA_LATENCY, 0);
+
 	ret = imx_prepare_enable_clks(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index d8b67e150b129..b7a5727d0c8a8 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -763,6 +763,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx7d-usbmisc",
 		.data = &imx7d_usbmisc_ops,
 	},
+	{
+		.compatible = "fsl,imx7ulp-usbmisc",
+		.data = &imx7d_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 911e05af671ea..edd89b7c8f184 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -61,6 +61,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_OVERRIDE_PHY_CONTROL	BIT(12) /* Glue layer manages phy */
 #define CI_HDRC_REQUIRES_ALIGNED_DMA	BIT(13)
 #define CI_HDRC_IMX_IS_HSIC		BIT(14)
+#define CI_HDRC_PMQOS			BIT(15)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
-- 
2.20.1

