Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA9766514E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 02:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbjAKBxr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 20:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbjAKBxq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 20:53:46 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DC971AE4B;
        Tue, 10 Jan 2023 17:53:44 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B237016A3;
        Tue, 10 Jan 2023 17:54:26 -0800 (PST)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E762F3F67D;
        Tue, 10 Jan 2023 17:53:42 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bin Liu <b-liu@ti.com>
Cc:     Icenowy Zheng <uwu@icenowy.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, soc@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: [PATCH v5 03/11] usb: musb: sunxi: Introduce config struct
Date:   Wed, 11 Jan 2023 01:53:24 +0000
Message-Id: <20230111015332.172021-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111015332.172021-1-andre.przywara@arm.com>
References: <20230111015332.172021-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the probe routine explicitly compares the compatible string of
the device node to figure out which features and quirks a certain
Allwinner MUSB model requires. This gets harder to maintain for new
SoCs.

Add a struct sunxi_musb_cfg that names the features and quirks
explicitly, and create instances of this struct for every type of MUSB
device we support. Then bind this to the compatible strings via the OF
data feature.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/usb/musb/sunxi.c | 103 ++++++++++++++++++++++++++-------------
 1 file changed, 70 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index 4b368d16a73ad..9b622cd9b2bd5 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/phy/phy-sun4i-usb.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
@@ -67,6 +68,13 @@
 #define SUNXI_MUSB_FL_NO_CONFIGDATA		7
 #define SUNXI_MUSB_FL_PHY_MODE_PEND		8
 
+struct sunxi_musb_cfg {
+	const struct musb_hdrc_config *hdrc_config;
+	bool has_sram;
+	bool has_reset;
+	bool no_configdata;
+};
+
 /* Our read/write methods need access and do not get passed in a musb ref :| */
 static struct musb *sunxi_musb;
 
@@ -621,11 +629,10 @@ static const struct musb_platform_ops sunxi_musb_ops = {
 	.post_root_reset_end = sunxi_musb_post_root_reset_end,
 };
 
-/* Allwinner OTG supports up to 5 endpoints */
-#define SUNXI_MUSB_MAX_EP_NUM	6
 #define SUNXI_MUSB_RAM_BITS	11
 
-static struct musb_fifo_cfg sunxi_musb_mode_cfg[] = {
+/* Allwinner OTG supports up to 5 endpoints */
+static struct musb_fifo_cfg sunxi_musb_mode_cfg_5eps[] = {
 	MUSB_EP_FIFO_SINGLE(1, FIFO_TX, 512),
 	MUSB_EP_FIFO_SINGLE(1, FIFO_RX, 512),
 	MUSB_EP_FIFO_SINGLE(2, FIFO_TX, 512),
@@ -639,9 +646,7 @@ static struct musb_fifo_cfg sunxi_musb_mode_cfg[] = {
 };
 
 /* H3/V3s OTG supports only 4 endpoints */
-#define SUNXI_MUSB_MAX_EP_NUM_H3	5
-
-static struct musb_fifo_cfg sunxi_musb_mode_cfg_h3[] = {
+static struct musb_fifo_cfg sunxi_musb_mode_cfg_4eps[] = {
 	MUSB_EP_FIFO_SINGLE(1, FIFO_TX, 512),
 	MUSB_EP_FIFO_SINGLE(1, FIFO_RX, 512),
 	MUSB_EP_FIFO_SINGLE(2, FIFO_TX, 512),
@@ -652,31 +657,33 @@ static struct musb_fifo_cfg sunxi_musb_mode_cfg_h3[] = {
 	MUSB_EP_FIFO_SINGLE(4, FIFO_RX, 512),
 };
 
-static const struct musb_hdrc_config sunxi_musb_hdrc_config = {
-	.fifo_cfg       = sunxi_musb_mode_cfg,
-	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg),
+static const struct musb_hdrc_config sunxi_musb_hdrc_config_5eps = {
+	.fifo_cfg       = sunxi_musb_mode_cfg_5eps,
+	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg_5eps),
 	.multipoint	= true,
 	.dyn_fifo	= true,
-	.num_eps	= SUNXI_MUSB_MAX_EP_NUM,
+	/* Two FIFOs per endpoint, plus ep_0. */
+	.num_eps	= (ARRAY_SIZE(sunxi_musb_mode_cfg_5eps) / 2) + 1,
 	.ram_bits	= SUNXI_MUSB_RAM_BITS,
 };
 
-static struct musb_hdrc_config sunxi_musb_hdrc_config_h3 = {
-	.fifo_cfg       = sunxi_musb_mode_cfg_h3,
-	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg_h3),
+static const struct musb_hdrc_config sunxi_musb_hdrc_config_4eps = {
+	.fifo_cfg       = sunxi_musb_mode_cfg_4eps,
+	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg_4eps),
 	.multipoint	= true,
 	.dyn_fifo	= true,
-	.num_eps	= SUNXI_MUSB_MAX_EP_NUM_H3,
+	/* Two FIFOs per endpoint, plus ep_0. */
+	.num_eps	= (ARRAY_SIZE(sunxi_musb_mode_cfg_4eps) / 2) + 1,
 	.ram_bits	= SUNXI_MUSB_RAM_BITS,
 };
 
-
 static int sunxi_musb_probe(struct platform_device *pdev)
 {
 	struct musb_hdrc_platform_data	pdata;
 	struct platform_device_info	pinfo;
 	struct sunxi_glue		*glue;
 	struct device_node		*np = pdev->dev.of_node;
+	const struct sunxi_musb_cfg	*cfg;
 	int ret;
 
 	if (!np) {
@@ -713,29 +720,25 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	pdata.platform_ops	= &sunxi_musb_ops;
-	if (!of_device_is_compatible(np, "allwinner,sun8i-h3-musb"))
-		pdata.config = &sunxi_musb_hdrc_config;
-	else
-		pdata.config = &sunxi_musb_hdrc_config_h3;
+
+	cfg = of_device_get_match_data(&pdev->dev);
+	if (!cfg)
+		return -EINVAL;
+
+	pdata.config = cfg->hdrc_config;
 
 	glue->dev = &pdev->dev;
 	INIT_WORK(&glue->work, sunxi_musb_work);
 	glue->host_nb.notifier_call = sunxi_musb_host_notifier;
 
-	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb") ||
-	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
+	if (cfg->has_sram)
 		set_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags);
-	}
 
-	if (of_device_is_compatible(np, "allwinner,sun6i-a31-musb"))
+	if (cfg->has_reset)
 		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
 
-	if (of_device_is_compatible(np, "allwinner,sun8i-a33-musb") ||
-	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb") ||
-	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
-		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
+	if (cfg->no_configdata)
 		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
-	}
 
 	glue->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(glue->clk)) {
@@ -813,12 +816,46 @@ static int sunxi_musb_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sunxi_musb_cfg sun4i_a10_musb_cfg = {
+	.hdrc_config = &sunxi_musb_hdrc_config_5eps,
+	.has_sram = true,
+};
+
+static const struct sunxi_musb_cfg sun6i_a31_musb_cfg = {
+	.hdrc_config = &sunxi_musb_hdrc_config_5eps,
+	.has_reset = true,
+};
+
+static const struct sunxi_musb_cfg sun8i_a33_musb_cfg = {
+	.hdrc_config = &sunxi_musb_hdrc_config_5eps,
+	.has_reset = true,
+	.no_configdata = true,
+};
+
+static const struct sunxi_musb_cfg sun8i_h3_musb_cfg = {
+	.hdrc_config = &sunxi_musb_hdrc_config_4eps,
+	.has_reset = true,
+	.no_configdata = true,
+};
+
+static const struct sunxi_musb_cfg suniv_f1c100s_musb_cfg = {
+	.hdrc_config = &sunxi_musb_hdrc_config_5eps,
+	.has_sram = true,
+	.has_reset = true,
+	.no_configdata = true,
+};
+
 static const struct of_device_id sunxi_musb_match[] = {
-	{ .compatible = "allwinner,sun4i-a10-musb", },
-	{ .compatible = "allwinner,sun6i-a31-musb", },
-	{ .compatible = "allwinner,sun8i-a33-musb", },
-	{ .compatible = "allwinner,sun8i-h3-musb", },
-	{ .compatible = "allwinner,suniv-f1c100s-musb", },
+	{ .compatible = "allwinner,sun4i-a10-musb",
+	  .data = &sun4i_a10_musb_cfg, },
+	{ .compatible = "allwinner,sun6i-a31-musb",
+	  .data = &sun6i_a31_musb_cfg, },
+	{ .compatible = "allwinner,sun8i-a33-musb",
+	  .data = &sun8i_a33_musb_cfg, },
+	{ .compatible = "allwinner,sun8i-h3-musb",
+	  .data = &sun8i_h3_musb_cfg, },
+	{ .compatible = "allwinner,suniv-f1c100s-musb",
+	  .data = &suniv_f1c100s_musb_cfg, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_musb_match);
-- 
2.25.1

