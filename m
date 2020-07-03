Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0082D213EFE
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgGCR7H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCR7H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:59:07 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4ABC061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:59:07 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c11so18947365lfh.8
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2WGN4yG0nEg0drnh+gOK4tXZi/zTWHJWqdGq3LW4Qo=;
        b=Jfk8OEAQzg60BJZWAPltXeKfZmdnixQUQNl3GQUItOCFFIZaa3vd90bm9NRQbejHwI
         j9R4XrLls+Pd4kjXCPbIUwXYL83fKwE5ov2ws8PvJY9QJBhF6c5GeAI6Vr2NGRGw3v+M
         P2zpimesxW62zaru7MBGgjLqcOH9qbGQEM1NmJo+/a2g3gAACKFmqWwA1xbvBxNBPuFq
         lSK+dJquvX0tWt2RumJahlMql7mgs3Cl1H7A2wPb0/yZDUnL1LYJZ/dyoNKBnIHxrAh6
         tidBwnl1Fc6riaTDD8Y7dkxIxzs1hIiVwsNWd2nQe0dYZ+TGMQXfPnBIT6EJ8T/bDdw+
         xbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2WGN4yG0nEg0drnh+gOK4tXZi/zTWHJWqdGq3LW4Qo=;
        b=HWXrkNxYIUOnb9pcgLf0ctZmp1VBTjIkHV5rLFAdYP3CSnXFYmswyPHtwtei0QW/2X
         2ppDJMwJ/0ZBkxq+4ofgry4eJh0pWPxngaiB9N2JXXLcD8WxBc1UAWcHcK6oitBzA/S0
         C9PxYzmjSULjxAIjdumEBoBJ0nl/Me4J7CjFbCJSjqShNve5VYv1zXWcuZozTN0EZiX3
         yJIj+95TPMinltMbR5+sfo6VtkHt1AOrUljkYo9reghHk/VY3J/9wntd+lvq0LvTYKay
         68nDnjgqoT/Q7b2ulAZ3LeFhIsynnbvRXHV3Z/8NGGHL9Iblz6e4bPjSb1fUEcxyd+iQ
         hLjA==
X-Gm-Message-State: AOAM5301mXe8LlL8ckENLLlu3/esc9j0O5ce9QBjPCcX6u0RmGtpdrt0
        lp3c+y8X4x0OXmiBnbphSipGrg==
X-Google-Smtp-Source: ABdhPJw6FFcZQaVb417XRvWnKvDLxp5CINLuG96YMaVtwR9quthSnlZtGD/t0LPzzaxipk2MypeXHA==
X-Received: by 2002:ac2:5217:: with SMTP id a23mr22789469lfl.115.1593799145385;
        Fri, 03 Jul 2020 10:59:05 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id a23sm4900795lfb.10.2020.07.03.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:59:04 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/2] usb: ohci-omap: Create private state container
Date:   Fri,  3 Jul 2020 19:57:00 +0200
Message-Id: <20200703175701.570446-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
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
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/host/ohci-omap.c | 73 +++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index d8d35d456456..add2eac53a98 100644
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
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
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
@@ -318,21 +325,6 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	usb_host_ck = clk_get(&pdev->dev, "usb_hhc_ck");
-	if (IS_ERR(usb_host_ck))
-		return PTR_ERR(usb_host_ck);
-
-	if (!cpu_is_omap15xx())
-		usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
-	else
-		usb_dc_ck = clk_get(&pdev->dev, "lb_ck");
-
-	if (IS_ERR(usb_dc_ck)) {
-		clk_put(usb_host_ck);
-		return PTR_ERR(usb_dc_ck);
-	}
-
-
 	hcd = usb_create_hcd(&ohci_omap_hc_driver, &pdev->dev,
 			dev_name(&pdev->dev));
 	if (!hcd) {
@@ -341,6 +333,21 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 	}
 	hcd->rsrc_start = pdev->resource[0].start;
 	hcd->rsrc_len = pdev->resource[0].end - pdev->resource[0].start + 1;
+	priv = hcd_to_ohci_omap_priv(hcd);
+
+	priv->usb_host_ck = clk_get(&pdev->dev, "usb_hhc_ck");
+	if (IS_ERR(priv->usb_host_ck))
+		return PTR_ERR(priv->usb_host_ck);
+
+	if (!cpu_is_omap15xx())
+		priv->usb_dc_ck = clk_get(&pdev->dev, "usb_dc_ck");
+	else
+		priv->usb_dc_ck = clk_get(&pdev->dev, "lb_ck");
+
+	if (IS_ERR(priv->usb_dc_ck)) {
+		clk_put(priv->usb_host_ck);
+		return PTR_ERR(priv->usb_dc_ck);
+	}
 
 	if (!request_mem_region(hcd->rsrc_start, hcd->rsrc_len, hcd_name)) {
 		dev_dbg(&pdev->dev, "request_mem_region failed\n");
@@ -373,8 +380,8 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 err1:
 	usb_put_hcd(hcd);
 err0:
-	clk_put(usb_dc_ck);
-	clk_put(usb_host_ck);
+	clk_put(priv->usb_dc_ck);
+	clk_put(priv->usb_host_ck);
 	return retval;
 }
 
@@ -393,10 +400,11 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
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
@@ -406,8 +414,8 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
 	iounmap(hcd->regs);
 	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
 	usb_put_hcd(hcd);
-	clk_put(usb_dc_ck);
-	clk_put(usb_host_ck);
+	clk_put(priv->usb_dc_ck);
+	clk_put(priv->usb_host_ck);
 	return 0;
 }
 
@@ -419,6 +427,7 @@ static int ohci_omap_suspend(struct platform_device *pdev, pm_message_t message)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
+	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
 	bool do_wakeup = device_may_wakeup(&pdev->dev);
 	int ret;
 
@@ -430,7 +439,7 @@ static int ohci_omap_suspend(struct platform_device *pdev, pm_message_t message)
 	if (ret)
 		return ret;
 
-	omap_ohci_clock_power(0);
+	omap_ohci_clock_power(priv, 0);
 	return ret;
 }
 
@@ -438,12 +447,13 @@ static int ohci_omap_resume(struct platform_device *dev)
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
@@ -470,7 +480,8 @@ static struct platform_driver ohci_hcd_omap_driver = {
 
 static const struct ohci_driver_overrides omap_overrides __initconst = {
 	.product_desc	= "OMAP OHCI",
-	.reset		= ohci_omap_reset
+	.reset		= ohci_omap_reset,
+	.extra_priv_size = sizeof(struct ohci_omap_priv),
 };
 
 static int __init ohci_omap_init(void)
-- 
2.25.4

