Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01535506ECD
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 15:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352485AbiDSNlj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 09:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352521AbiDSNlO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 09:41:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6649D381B1;
        Tue, 19 Apr 2022 06:38:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1C771B8197D;
        Tue, 19 Apr 2022 13:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A31C385AA;
        Tue, 19 Apr 2022 13:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650375495;
        bh=oZtauX33c1zFZCWuCbZTTaJ18jk9xVoX5IhxwTCNxww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TZAucFVWO41am0SQC0JdPxHsfpXAegfeSL0T5ZxjYhle79NFeZasi7CnlTRQ0kpDT
         RgJM48CCiZkSwr4OLl5xcJVMcoWUkzpDQ+b/HHC4/3BwGofVK53JoNPEDoPYfu3s0/
         x72kXCh33mfbDuG6tyL+6K0tZ9V1e1g5XAq/l+jHQMeIW99BJGZv3/09jXJgLVa6/U
         T9y58wvo3eiTOXnZahzwQj6xcZW39JaD0b53mh/EEoJgWFgbFV7lbhOfTelyFNZ6JU
         WcuMxrVRFRsUUAC/roo/+B34yzjcsMkJbIMP/ScuvmFAz2o/Fdbnk2IFbC7fFUY5ZA
         YUEvYSBt6/XRg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
        jmkrzyszt@gmail.com
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        Kevin Hilman <khilman@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Mark Brown <broonie@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-serial@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 05/41] fbdev: omap: pass irqs as resource
Date:   Tue, 19 Apr 2022 15:36:47 +0200
Message-Id: <20220419133723.1394715-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

To avoid relying on the mach/irqs.h header, stop using
OMAP_LCDC_IRQ and INT_1610_SoSSI_MATCH directly in the driver
code, but instead pass these as resources.

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/fb.c               | 19 ++++++++++++++++++-
 drivers/video/fbdev/omap/lcdc.c        |  6 +++---
 drivers/video/fbdev/omap/omapfb.h      |  2 ++
 drivers/video/fbdev/omap/omapfb_main.c | 16 +++++++++++++++-
 drivers/video/fbdev/omap/sossi.c       |  2 +-
 5 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap1/fb.c b/arch/arm/mach-omap1/fb.c
index 0e32a959f254..b093375afc27 100644
--- a/arch/arm/mach-omap1/fb.c
+++ b/arch/arm/mach-omap1/fb.c
@@ -17,9 +17,12 @@
 #include <linux/io.h>
 #include <linux/omapfb.h>
 #include <linux/dma-mapping.h>
+#include <linux/irq.h>
 
 #include <asm/mach/map.h>
 
+#include <mach/irqs.h>
+
 #if IS_ENABLED(CONFIG_FB_OMAP)
 
 static bool omapfb_lcd_configured;
@@ -27,6 +30,19 @@ static struct omapfb_platform_data omapfb_config;
 
 static u64 omap_fb_dma_mask = ~(u32)0;
 
+struct resource omap_fb_resources[] = {
+	{
+		.name  = "irq",
+		.start = INT_LCD_CTRL,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.name  = "irq",
+		.start = INT_SOSSI_MATCH,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
 static struct platform_device omap_fb_device = {
 	.name		= "omapfb",
 	.id		= -1,
@@ -35,7 +51,8 @@ static struct platform_device omap_fb_device = {
 		.coherent_dma_mask	= DMA_BIT_MASK(32),
 		.platform_data		= &omapfb_config,
 	},
-	.num_resources = 0,
+	.num_resources = ARRAY_SIZE(omap_fb_resources),
+	.resource = omap_fb_resources,
 };
 
 void __init omapfb_set_lcd_config(const struct omap_lcd_config *config)
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index d9a23f6cf7fc..d9731d12bd72 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -713,7 +713,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 	}
 	clk_enable(lcdc.lcd_ck);
 
-	r = request_irq(OMAP_LCDC_IRQ, lcdc_irq_handler, 0, MODULE_NAME, fbdev);
+	r = request_irq(fbdev->int_irq, lcdc_irq_handler, 0, MODULE_NAME, fbdev);
 	if (r) {
 		dev_err(fbdev->dev, "unable to get IRQ\n");
 		goto fail2;
@@ -744,7 +744,7 @@ static int omap_lcdc_init(struct omapfb_device *fbdev, int ext_mode,
 fail4:
 	omap_free_lcd_dma();
 fail3:
-	free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
+	free_irq(fbdev->int_irq, lcdc.fbdev);
 fail2:
 	clk_disable(lcdc.lcd_ck);
 fail1:
@@ -759,7 +759,7 @@ static void omap_lcdc_cleanup(void)
 		free_palette_ram();
 	free_fbmem();
 	omap_free_lcd_dma();
-	free_irq(OMAP_LCDC_IRQ, lcdc.fbdev);
+	free_irq(lcdc.fbdev->int_irq, lcdc.fbdev);
 	clk_disable(lcdc.lcd_ck);
 	clk_put(lcdc.lcd_ck);
 }
diff --git a/drivers/video/fbdev/omap/omapfb.h b/drivers/video/fbdev/omap/omapfb.h
index d930152c289c..313a051fe7a4 100644
--- a/drivers/video/fbdev/omap/omapfb.h
+++ b/drivers/video/fbdev/omap/omapfb.h
@@ -204,6 +204,8 @@ struct omapfb_device {
 	struct lcd_panel	*panel;			/* LCD panel */
 	const struct lcd_ctrl	*ctrl;			/* LCD controller */
 	const struct lcd_ctrl	*int_ctrl;		/* internal LCD ctrl */
+	int			ext_irq;
+	int			int_irq;
 	struct lcd_ctrl_extif	*ext_if;		/* LCD ctrl external
 							   interface */
 	struct device		*dev;
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 083388a4ceeb..b8fd509f11e4 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1624,7 +1624,7 @@ static int omapfb_do_probe(struct platform_device *pdev,
 
 	init_state = 0;
 
-	if (pdev->num_resources != 0) {
+	if (pdev->num_resources != 2) {
 		dev_err(&pdev->dev, "probed for an unknown device\n");
 		r = -ENODEV;
 		goto cleanup;
@@ -1643,6 +1643,20 @@ static int omapfb_do_probe(struct platform_device *pdev,
 		r = -ENOMEM;
 		goto cleanup;
 	}
+	fbdev->int_irq = platform_get_irq(pdev, 0);
+	if (!fbdev->int_irq) {
+		dev_err(&pdev->dev, "unable to get irq\n");
+		r = ENXIO;
+		goto cleanup;
+	}
+
+	fbdev->ext_irq = platform_get_irq(pdev, 1);
+	if (!fbdev->ext_irq) {
+		dev_err(&pdev->dev, "unable to get irq\n");
+		r = ENXIO;
+		goto cleanup;
+	}
+
 	init_state++;
 
 	fbdev->dev = &pdev->dev;
diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
index d3c755b293ea..ade9d452254c 100644
--- a/drivers/video/fbdev/omap/sossi.c
+++ b/drivers/video/fbdev/omap/sossi.c
@@ -639,7 +639,7 @@ static int sossi_init(struct omapfb_device *fbdev)
 	l &= ~(1 << 31); /* REORDERING */
 	sossi_write_reg(SOSSI_INIT1_REG, l);
 
-	if ((r = request_irq(INT_1610_SoSSI_MATCH, sossi_match_irq,
+	if ((r = request_irq(fbdev->ext_irq, sossi_match_irq,
 			     IRQ_TYPE_EDGE_FALLING,
 	     "sossi_match", sossi.fbdev->dev)) < 0) {
 		dev_err(sossi.fbdev->dev, "can't get SoSSI match IRQ\n");
-- 
2.29.2

