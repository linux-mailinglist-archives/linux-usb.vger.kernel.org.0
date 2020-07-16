Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1620222262
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 14:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgGPMei (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 08:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727844AbgGPMei (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 08:34:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A474BC061755
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 05:34:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s9so6906762ljm.11
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 05:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1iaEx2TowHnQOgWk7SFBQ/9pxmgBVuY3x9nyiWcgUiI=;
        b=CzfWjqmIsRg/VcHAIRznYmhOpjuKQ/dfZTdbQN35l3GuDAiF5T+rr7zVp6eBNuTwNh
         iLKjE3KOH0iQBtQSUo4zXrcyaeeBFZ0m0ubankJF6cJpS/xNJZHRWNzUYytJ9OPH4SUv
         ZB8NKaZR6xl9PRycOfrV9ahyQZmYtDUOgZoWVGVLDfTyveD2WB9U8uE87bnWNsbjckfI
         jRxLYHJsjgZg1eKIZIIt7sPOpCd3+s/bL0e9GJEIOGlF6yXirPxcwMxRJ9B0JF14O6OV
         TMksS5slYVmPFFr8P1xZ2omoOrVmVAfN7fdck3c6HsESfJZdXg0qabbb6RdofmRb4Ivg
         bx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1iaEx2TowHnQOgWk7SFBQ/9pxmgBVuY3x9nyiWcgUiI=;
        b=I34t1xVco+pgrmevUujV8uWQLnYKNRzStChNY4Gpkz9UtOeYUnaJEHaMwQ1FSnhcyv
         HKtP3rIeqPLtfro1bvvSLxGcqLwNQF0DyJ0avQBU+0Zhk0SHSvNVzMU7E+cvs4l9w7n9
         IqKk1FgK2v4puMhUIo1/FefSl8QVNFyHSgs3s/URa/rrOi0po0ODsDxhqk1XBqrB5bFs
         44uHie7/aanbOApupOyyBxDrH/RraKJ25zsZxlpAPwSidwX3T4PkBWSyjbHYGM1eC+Q7
         rma1983zZlXYH9wTgSaOB6E9nuq62J9JjklMWnewKOLmhMhodfX/caYGI1zWLXZqHDWH
         8kRw==
X-Gm-Message-State: AOAM533eyGKKYWjyFL7LArvZQstI9QHPqDsqEvwjHH7g8RllzAGoc3nE
        wZR6ECxWqvDaolgCkhB2siF13A==
X-Google-Smtp-Source: ABdhPJxP21VpVKhYxelSOhgB+xWBTS3IZFw7e/i+ac0z1Yi+tSETPu7FMsF3EKbiRtU8gT0yEKFTpA==
X-Received: by 2002:a2e:9a47:: with SMTP id k7mr1947473ljj.96.1594902875557;
        Thu, 16 Jul 2020 05:34:35 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id p4sm320682lfk.0.2020.07.16.05.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 05:34:34 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 1/2 v2] usb: ohci-omap: Create private state container
Date:   Thu, 16 Jul 2020 14:34:32 +0200
Message-Id: <20200716123433.155854-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The OMAP1 was using static locals to hold the clock handles
which is uncommon and does not scale. Create a private data
struct and use that to hold the clocks.

Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fix up the error path to free the HCD *after* putting the
  stuff inside the state container.
- Also fix up the remove() path similarly.
- Use some reasonable names on errorpath labels we are touching or
  adding.
- Fix a tab alignment.
---
 drivers/usb/host/ohci-omap.c | 85 +++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index d8d35d456456..a4bdd2b7af83 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -69,22 +69,27 @@ static inline int tps65010_set_gpio_out_value(unsigned gpio, unsigned value)
 
 #endif
 
-static struct clk *usb_host_ck;
-static struct clk *usb_dc_ck;
+struct ohci_omap_priv {
+	struct clk *usb_host_ck;
+	struct clk *usb_dc_ck;
+};
 
 static const char hcd_name[] = "ohci-omap";
 static struct hc_driver __read_mostly ohci_omap_hc_driver;
 
-static void omap_ohci_clock_power(int on)
+#define hcd_to_ohci_omap_priv(h) \
+	((struct ohci_omap_priv *)hcd_to_ohci(h)->priv)
+
+static void omap_ohci_clock_power(struct ohci_omap_priv *priv, int on)
 {
 	if (on) {
-		clk_enable(usb_dc_ck);
-		clk_enable(usb_host_ck);
+		clk_enable(priv->usb_dc_ck);
+		clk_enable(priv->usb_host_ck);
 		/* guesstimate for T5 == 1x 32K clock + APLL lock time */
 		udelay(100);
 	} else {
-		clk_disable(usb_host_ck);
-		clk_disable(usb_dc_ck);
+		clk_disable(priv->usb_host_ck);
+		clk_disable(priv->usb_dc_ck);
 	}
 }
 
@@ -196,6 +201,7 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 {
 	struct ohci_hcd		*ohci = hcd_to_ohci(hcd);
 	struct omap_usb_config	*config = dev_get_platdata(hcd->self.controller);
+	struct ohci_omap_priv	*priv = hcd_to_ohci_omap_priv(hcd);
 	int			need_transceiver = (config->otg != 0);
 	int			ret;
 
@@ -235,7 +241,7 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 	}
 #endif
 
-	omap_ohci_clock_power(1);
+	omap_ohci_clock_power(priv, 1);
 
 	if (cpu_is_omap15xx()) {
 		omap_1510_local_bus_power(1);
@@ -305,6 +311,7 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 {
 	int retval, irq;
 	struct usb_hcd *hcd = 0;
+	struct ohci_omap_priv *priv;
 
 	if (pdev->num_resources != 2) {
 		dev_err(&pdev->dev, "invalid num_resources: %i\n",
@@ -318,34 +325,35 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	usb_host_ck = clk_get(&pdev->dev, "usb_hhc_ck");
-	if (IS_ERR(usb_host_ck))
-		return PTR_ERR(usb_host_ck);
+	hcd = usb_create_hcd(&ohci_omap_hc_driver, &pdev->dev,
+			dev_name(&pdev->dev));
+	if (!hcd)
+		return -ENOMEM;
 
-	if (!cpu_is_omap15xx())
-		usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
-	else
-		usb_dc_ck = clk_get(&pdev->dev, "lb_ck");
+	hcd->rsrc_start = pdev->resource[0].start;
+	hcd->rsrc_len = pdev->resource[0].end - pdev->resource[0].start + 1;
+	priv = hcd_to_ohci_omap_priv(hcd);
 
-	if (IS_ERR(usb_dc_ck)) {
-		clk_put(usb_host_ck);
-		return PTR_ERR(usb_dc_ck);
+	priv->usb_host_ck = clk_get(&pdev->dev, "usb_hhc_ck");
+	if (IS_ERR(priv->usb_host_ck)) {
+		retval = PTR_ERR(priv->usb_host_ck);
+		goto err_put_hcd;
 	}
 
+	if (!cpu_is_omap15xx())
+		priv->usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
+	else
+		priv->usb_dc_ck = clk_get(&pdev->dev, "lb_ck");
 
-	hcd = usb_create_hcd(&ohci_omap_hc_driver, &pdev->dev,
-			dev_name(&pdev->dev));
-	if (!hcd) {
-		retval = -ENOMEM;
-		goto err0;
+	if (IS_ERR(priv->usb_dc_ck)) {
+		retval = PTR_ERR(priv->usb_dc_ck);
+		goto err_put_host_ck;
 	}
-	hcd->rsrc_start = pdev->resource[0].start;
-	hcd->rsrc_len = pdev->resource[0].end - pdev->resource[0].start + 1;
 
 	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
 		dev_dbg(&pdev->dev, "request_mem_region failed\n");
 		retval = -EBUSY;
-		goto err1;
+		goto err_put_dc_ck;
 	}
 
 	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
@@ -370,11 +378,12 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 	iounmap(hcd->regs);
 err2:
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
-err1:
+err_put_dc_ck:
+	clk_put(priv->usb_dc_ck);
+err_put_host_ck:
+	clk_put(priv->usb_host_ck);
+err_put_hcd:
 	usb_put_hcd(hcd);
-err0:
-	clk_put(usb_dc_ck);
-	clk_put(usb_host_ck);
 	return retval;
 }
 
@@ -393,10 +402,11 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 static int ohci_hcd_omap_remove(struct platform_device *pdev)
 {
 	struct usb_hcd	*hcd = platform_get_drvdata(pdev);
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
 
 	dev_dbg(hcd->self.controller, "stopping USB Controller\n");
 	usb_remove_hcd(hcd);
-	omap_ohci_clock_power(0);
+	omap_ohci_clock_power(priv, 0);
 	if (!IS_ERR_OR_NULL(hcd->usb_phy)) {
 		(void) otg_set_host(hcd->usb_phy->otg, 0);
 		usb_put_phy(hcd->usb_phy);
@@ -405,9 +415,9 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
 		gpio_free(9);
 	iounmap(hcd->regs);
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
+	clk_put(priv->usb_dc_ck);
+	clk_put(priv->usb_host_ck);
 	usb_put_hcd(hcd);
-	clk_put(usb_dc_ck);
-	clk_put(usb_host_ck);
 	return 0;
 }
 
@@ -419,6 +429,7 @@ static int ohci_omap_suspend(struct platform_device *pdev, pm_message_t message)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
 	bool do_wakeup = device_may_wakeup(&pdev->dev);
 	int ret;
 
@@ -430,7 +441,7 @@ static int ohci_omap_suspend(struct platform_device *pdev, pm_message_t message)
 	if (ret)
 		return ret;
 
-	omap_ohci_clock_power(0);
+	omap_ohci_clock_power(priv, 0);
 	return ret;
 }
 
@@ -438,12 +449,13 @@ static int ohci_omap_resume(struct platform_device *dev)
 {
 	struct usb_hcd	*hcd = platform_get_drvdata(dev);
 	struct ohci_hcd	*ohci = hcd_to_ohci(hcd);
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
 
 	if (time_before(jiffies, ohci->next_statechange))
 		msleep(5);
 	ohci->next_statechange = jiffies;
 
-	omap_ohci_clock_power(1);
+	omap_ohci_clock_power(priv, 1);
 	ohci_resume(hcd, false);
 	return 0;
 }
@@ -470,7 +482,8 @@ static struct platform_driver ohci_hcd_omap_driver = {
 
 static const struct ohci_driver_overrides omap_overrides __initconst = {
 	.product_desc	= "OMAP OHCI",
-	.reset		= ohci_omap_reset
+	.reset		= ohci_omap_reset,
+	.extra_priv_size = sizeof(struct ohci_omap_priv),
 };
 
 static int __init ohci_omap_init(void)
-- 
2.26.2

