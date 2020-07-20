Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7524822615E
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 15:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgGTNzg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 09:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgGTNzf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 09:55:35 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABD7C061794
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 06:55:35 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u25so9766013lfm.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2020 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e3+JeUl3CpBB0FycooOayrLlEsJhXD+xmMJLv8bz46A=;
        b=G2UfyQJsn4FUEJth9lR4XmpvuqGoH6XnERRenXS20kQg1qLd/rkzwi8feuTReY08+K
         vRUl1RiBK5bAdDCE7+hqsD9XwPF7bIgr4/cQkAlITY9lLqpDhDHdhlVoOs4RhwHQ5uAO
         NFtwFvvB+grcxlCYZhmEfNO0HYcib50qGIKYVfhjuPB5zQylI5HNpI0VxpIrG5Mm56Bd
         Kme5/k1aWeXS1ntblsLzChwQvKYEFvha1tGWd8XprwGouGSyNLNbL6JvYTZTAGQxZ8S8
         rwmmtsTWBwaRKF1Klm4rJ109MDpxRx222eS1K/J69vTzYWLK7Q3yktHlVkGuhWUphmSq
         cEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e3+JeUl3CpBB0FycooOayrLlEsJhXD+xmMJLv8bz46A=;
        b=FeAoK/3efd0qEYhsvf8md+iip3kF20bM7LhluJN8F3gZXEt+PZ+1xZKwn/pzyuVCfZ
         LC9bo7dRsaDDV0yJ4A3XsU8JOJbwU3Y/LdEyeyzBCF55ViTWJLIs/oEtQmRvK+SCN90I
         ZHVjlUnnwckuPm7U1uyMGzxD2t05x/cUEXRr6MbWuTL47ehtNp/3slN0t1HN89rCc47A
         KNhAUAM1nZs8HezTuaj6pNg0uTRRE/Ew3ZQO/5URDqkIf3WCph5ohQXFVoZCKHHHRQIy
         3zAIcaizGgwNFpRlpc9BQxwH8NjxNld8djWkh44Huc/ytpgL+N0uJem0NWROsYCIMJmv
         HRTg==
X-Gm-Message-State: AOAM532UdxBimMAVl2dQzXSW9Uz4DRlgNWZJ5h8Mji6TexiSen0n2uv0
        vEbEAW2MlhaLqmHYsewpoMyhQ05PDgQ=
X-Google-Smtp-Source: ABdhPJxry2arX/0QrLFWirahYi23xci0w8mBBh3h+Cj2KYibitvBX/eXlVuI0b4MLtNlr/NLOI9UUw==
X-Received: by 2002:a19:c7d0:: with SMTP id x199mr5686680lff.205.1595253333816;
        Mon, 20 Jul 2020 06:55:33 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id b18sm648683lfp.36.2020.07.20.06.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:55:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 1/2 v3] usb: ohci-omap: Create private state container
Date:   Mon, 20 Jul 2020 15:55:23 +0200
Message-Id: <20200720135524.100374-1-linus.walleij@linaro.org>
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
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Collected Alan's ACK.
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

