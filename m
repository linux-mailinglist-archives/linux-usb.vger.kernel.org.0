Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D336219BFE
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 12:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfEJKxT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 06:53:19 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:61822 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727052AbfEJKxT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 May 2019 06:53:19 -0400
X-IronPort-AV: E=Sophos;i="5.60,453,1549897200"; 
   d="scan'208";a="15342236"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 May 2019 19:53:15 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9FE504170F2A;
        Fri, 10 May 2019 19:53:15 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] usb: renesas_usbhs: Use specific struct instead of USBHS_TYPE_* enums
Date:   Fri, 10 May 2019 19:48:43 +0900
Message-Id: <1557485323-3349-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a specific struct "usbhs_of_data" to add a new SoC
data easily instead of code basis in the future.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is related to the following Geert-san's comment.
 https://marc.info/?l=linux-renesas-soc&m=155747204111858&w=2

 I tested this patch on r8a7795-salvator-x board.

 drivers/usb/renesas_usbhs/common.c | 112 +++++++++++++++++++++----------------
 drivers/usb/renesas_usbhs/common.h |   5 ++
 2 files changed, 70 insertions(+), 47 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 249fbee..8ea5df7 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -535,53 +535,92 @@ static int usbhsc_drvcllbck_notify_hotplug(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct usbhs_of_data rcar_gen2_data = {
+	.platform_callback = &usbhs_rcar2_ops,
+	.param = {
+		.type = USBHS_TYPE_RCAR_GEN2,
+		.has_usb_dmac = 1,
+		.pipe_configs = usbhsc_new_pipe,
+		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+	}
+};
+
+static const struct usbhs_of_data rcar_gen3_data = {
+	.platform_callback = &usbhs_rcar3_ops,
+	.param = {
+		.type = USBHS_TYPE_RCAR_GEN3,
+		.has_usb_dmac = 1,
+		.pipe_configs = usbhsc_new_pipe,
+		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+	}
+};
+
+static const struct usbhs_of_data rcar_gen3_with_pll_data = {
+	.platform_callback = &usbhs_rcar3_with_pll_ops,
+	.param = {
+		.type = USBHS_TYPE_RCAR_GEN3_WITH_PLL,
+		.has_usb_dmac = 1,
+		.pipe_configs = usbhsc_new_pipe,
+		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+	}
+};
+
+static const struct usbhs_of_data rza1_data = {
+	.platform_callback = &usbhs_rza1_ops,
+	.param = {
+		.type = USBHS_TYPE_RZA1,
+		.pipe_configs = usbhsc_new_pipe,
+		.pipe_size = ARRAY_SIZE(usbhsc_new_pipe),
+	}
+};
+
 /*
  *		platform functions
  */
 static const struct of_device_id usbhs_of_match[] = {
 	{
 		.compatible = "renesas,usbhs-r8a774c0",
-		.data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
+		.data = &rcar_gen3_with_pll_data,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7790",
-		.data = (void *)USBHS_TYPE_RCAR_GEN2,
+		.data = &rcar_gen2_data,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7791",
-		.data = (void *)USBHS_TYPE_RCAR_GEN2,
+		.data = &rcar_gen2_data,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7794",
-		.data = (void *)USBHS_TYPE_RCAR_GEN2,
+		.data = &rcar_gen2_data,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7795",
-		.data = (void *)USBHS_TYPE_RCAR_GEN3,
+		.data = &rcar_gen3_data,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a7796",
-		.data = (void *)USBHS_TYPE_RCAR_GEN3,
+		.data = &rcar_gen3_data,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a77990",
-		.data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
+		.data = &rcar_gen3_with_pll_data,
 	},
 	{
 		.compatible = "renesas,usbhs-r8a77995",
-		.data = (void *)USBHS_TYPE_RCAR_GEN3_WITH_PLL,
+		.data = &rcar_gen3_with_pll_data,
 	},
 	{
 		.compatible = "renesas,rcar-gen2-usbhs",
-		.data = (void *)USBHS_TYPE_RCAR_GEN2,
+		.data = &rcar_gen2_data,
 	},
 	{
 		.compatible = "renesas,rcar-gen3-usbhs",
-		.data = (void *)USBHS_TYPE_RCAR_GEN3,
+		.data = &rcar_gen3_data,
 	},
 	{
 		.compatible = "renesas,rza1-usbhs",
-		.data = (void *)USBHS_TYPE_RZA1,
+		.data = &rza1_data,
 	},
 	{ },
 };
@@ -591,6 +630,7 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 {
 	struct renesas_usbhs_platform_info *info;
 	struct renesas_usbhs_driver_param *dparam;
+	const struct usbhs_of_data *data;
 	u32 tmp;
 	int gpio;
 
@@ -598,8 +638,15 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 	if (!info)
 		return NULL;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return NULL;
+
 	dparam = &info->driver_param;
-	dparam->type = (uintptr_t)of_device_get_match_data(dev);
+	memcpy(dparam, &data->param, sizeof(struct renesas_usbhs_driver_param));
+	memcpy(&info->platform_callback, data->platform_callback,
+	       sizeof(struct renesas_usbhs_platform_callback));
+
 	if (!of_property_read_u32(dev->of_node, "renesas,buswait", &tmp))
 		dparam->buswait_bwait = tmp;
 	gpio = of_get_named_gpio_flags(dev->of_node, "renesas,enable-gpio", 0,
@@ -607,19 +654,6 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 	if (gpio > 0)
 		dparam->enable_gpio = gpio;
 
-	if (dparam->type == USBHS_TYPE_RCAR_GEN2 ||
-	    dparam->type == USBHS_TYPE_RCAR_GEN3 ||
-	    dparam->type == USBHS_TYPE_RCAR_GEN3_WITH_PLL) {
-		dparam->has_usb_dmac = 1;
-		dparam->pipe_configs = usbhsc_new_pipe;
-		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
-	}
-
-	if (dparam->type == USBHS_TYPE_RZA1) {
-		dparam->pipe_configs = usbhsc_new_pipe;
-		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
-	}
-
 	return info;
 }
 
@@ -676,29 +710,13 @@ static int usbhs_probe(struct platform_device *pdev)
 	       &info->driver_param,
 	       sizeof(struct renesas_usbhs_driver_param));
 
-	switch (priv->dparam.type) {
-	case USBHS_TYPE_RCAR_GEN2:
-		priv->pfunc = usbhs_rcar2_ops;
-		break;
-	case USBHS_TYPE_RCAR_GEN3:
-		priv->pfunc = usbhs_rcar3_ops;
-		break;
-	case USBHS_TYPE_RCAR_GEN3_WITH_PLL:
-		priv->pfunc = usbhs_rcar3_with_pll_ops;
-		break;
-	case USBHS_TYPE_RZA1:
-		priv->pfunc = usbhs_rza1_ops;
-		break;
-	default:
-		if (!info->platform_callback.get_id) {
-			dev_err(&pdev->dev, "no platform callbacks");
-			return -EINVAL;
-		}
-		memcpy(&priv->pfunc,
-		       &info->platform_callback,
-		       sizeof(struct renesas_usbhs_platform_callback));
-		break;
+	if (!info->platform_callback.get_id) {
+		dev_err(&pdev->dev, "no platform callbacks");
+		return -EINVAL;
 	}
+	memcpy(&priv->pfunc,
+	       &info->platform_callback,
+	       sizeof(struct renesas_usbhs_platform_callback));
 
 	/* set driver callback functions for platform */
 	dfunc			= &info->driver_callback;
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 3777af8..de1a663 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -282,6 +282,11 @@ struct usbhs_priv {
 	struct clk *clks[2];
 };
 
+struct usbhs_of_data {
+	const struct renesas_usbhs_platform_callback	*platform_callback;
+	const struct renesas_usbhs_driver_param		param;
+};
+
 /*
  * common
  */
-- 
2.7.4

