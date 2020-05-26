Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6731AC117
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 14:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635473AbgDPMVz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 08:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635251AbgDPMTS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 08:19:18 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A064C061A41
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 05:19:18 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o81so4346824wmo.2
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 05:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jGB5cq+Z3DlBH7Q1dU3UzrTQmEPHELzeDKf4/5h1tYY=;
        b=E3N/f5JCC6MuZG2N0ETf1nK3o0YeivJllTmKw4MySeCopaMQl/K5kRc9jERhgDPX/J
         9iYeII8DD0X8X22RqCFjymNGj0asnDJLGcgE57BxGMqhsJdHN8FSzIaTf86NWc0Ubwjk
         HWZajbjra7Lq20PGRX00IQGC5as0IBwg6jPKpOYOGo6Vq988FjguozhOEcoblbwItveX
         BucqU2FbjOge4L9WZDPnu3hJI72fktlIv+Q3cEikTsIuLX9KAI+RDA7l6rFCvG+IrWp/
         B+5uUF2kFtreUFmwEuOFhANt8RM2WqYS9GIn8L1iQTAVg1Tj65UqzroRMWTgJap/zWI+
         CMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jGB5cq+Z3DlBH7Q1dU3UzrTQmEPHELzeDKf4/5h1tYY=;
        b=jxZsyRm2KvRx5DEOJhsZ8tc8O86yz5nlicxZLI33tPIS4OfO/Of5sJ+oTKdeJXJboh
         Gn1HNdEEFpLUeuWl8wVvo1GSLoV/DPq7hVZ90yRr6n53C8AtHv0zjBfN8nE1HzBEyg5h
         zkZR+E77hk2ZrBkCY5JsPMdiZ7ivRpa081J4QD7VtRzZpkOx/6zt8d8dt3Yv/gMeML3R
         I0zHmBOIYGIIMqN6nSfeokQZhgXbSMIgJel05ajBLXoZXP0t3LDZW5VcPy2YwAjc1WPJ
         Qqc3/4IVdmKA/D6J7Y+nhH8DY8qLSCmjd/yHt5dYnAdD779bFJgMnjYS3eeH5FjYCxi3
         /VIw==
X-Gm-Message-State: AGi0PuY2wpZ4e3U9b4Ue1tp2EPcQ2WEZ7W9oB78yr+CK+axzlJx7Drzf
        azTczZpajuop7lsa1MZldATmNg==
X-Google-Smtp-Source: APiQypL6UZwdxpiYHe9Lgge4dtKM9rLPpfAuHpY9C1/ZB0P1pZTcTbR8PMYECtU0CgARumYZ4gOt5w==
X-Received: by 2002:a1c:bd54:: with SMTP id n81mr4472758wmf.141.1587039556955;
        Thu, 16 Apr 2020 05:19:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id i13sm22035602wro.50.2020.04.16.05.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 05:19:16 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] usb: dwc3: meson-g12a: refactor usb init
Date:   Thu, 16 Apr 2020 14:19:03 +0200
Message-Id: <20200416121910.12723-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416121910.12723-1-narmstrong@baylibre.com>
References: <20200416121910.12723-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Refactor the USB init code patch to handle the Amlogic GXL/GXM needing
to initialize the OTG port as Peripheral mode for the DWC2 IP to probe
correctly.

A secondary, post_init callback is added to setup the OTG PHY mode after
powering up the PHYs and before probing the DWC2 and DWC3 controllers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 52 +++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 7027ee2ee4ab..e7a6d05f2a72 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -140,6 +140,8 @@ struct dwc3_meson_g12a_drvdata {
 			     enum phy_mode mode);
 	int (*set_phy_mode)(struct dwc3_meson_g12a *priv, int i,
 			    enum phy_mode mode);
+	int (*usb_init)(struct dwc3_meson_g12a *priv);
+	int (*usb_post_init)(struct dwc3_meson_g12a *priv);
 };
 
 static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
@@ -151,6 +153,8 @@ static int dwc3_meson_g12a_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
 static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
 					int i, enum phy_mode mode);
 
+static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv);
+
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
@@ -160,6 +164,7 @@ static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.setup_regmaps = dwc3_meson_g12a_setup_regmaps,
 	.usb2_init_phy = dwc3_meson_g12a_usb2_init_phy,
 	.set_phy_mode = dwc3_meson_g12a_set_phy_mode,
+	.usb_init = dwc3_meson_g12a_usb_init,
 };
 
 static struct dwc3_meson_g12a_drvdata a1_drvdata = {
@@ -171,6 +176,7 @@ static struct dwc3_meson_g12a_drvdata a1_drvdata = {
 	.setup_regmaps = dwc3_meson_g12a_setup_regmaps,
 	.usb2_init_phy = dwc3_meson_g12a_usb2_init_phy,
 	.set_phy_mode = dwc3_meson_g12a_set_phy_mode,
+	.usb_init = dwc3_meson_g12a_usb_init,
 };
 
 struct dwc3_meson_g12a {
@@ -231,15 +237,11 @@ static int dwc3_meson_g12a_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
 	return 0;
 }
 
-static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
+static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv,
+				     enum phy_mode mode)
 {
 	int i, ret;
 
-	if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
-		priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
-	else
-		priv->otg_phy_mode = PHY_MODE_USB_HOST;
-
 	for (i = 0; i < priv->drvdata->num_phys; ++i) {
 		if (!priv->phys[i])
 			continue;
@@ -247,7 +249,7 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
 		if (!strstr(priv->drvdata->phy_names[i], "usb2"))
 			continue;
 
-		ret = priv->drvdata->usb2_init_phy(priv, i, priv->otg_phy_mode);
+		ret = priv->drvdata->usb2_init_phy(priv, i, mode);
 		if (ret)
 			return ret;
 	}
@@ -284,9 +286,10 @@ static void dwc3_meson_g12a_usb3_init(struct dwc3_meson_g12a *priv)
 			FIELD_PREP(USB_R1_P30_PCS_TX_SWING_FULL_MASK, 127));
 }
 
-static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv)
+static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv,
+					       enum phy_mode mode)
 {
-	if (priv->otg_phy_mode == PHY_MODE_USB_DEVICE) {
+	if (mode == PHY_MODE_USB_DEVICE) {
 		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
 				USB_R0_U2D_ACT, USB_R0_U2D_ACT);
 		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
@@ -301,11 +304,12 @@ static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv)
 	}
 }
 
-static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv)
+static int dwc3_meson_g12a_usb_init_glue(struct dwc3_meson_g12a *priv,
+					 enum phy_mode mode)
 {
 	int ret;
 
-	ret = dwc3_meson_g12a_usb2_init(priv);
+	ret = dwc3_meson_g12a_usb2_init(priv, mode);
 	if (ret)
 		return ret;
 
@@ -327,7 +331,7 @@ static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv)
 	if (priv->usb3_ports)
 		dwc3_meson_g12a_usb3_init(priv);
 
-	dwc3_meson_g12a_usb_otg_apply_mode(priv);
+	dwc3_meson_g12a_usb_otg_apply_mode(priv, mode);
 
 	return 0;
 }
@@ -406,7 +410,7 @@ static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
 	if (ret)
 		return ret;
 
-	dwc3_meson_g12a_usb_otg_apply_mode(priv);
+	dwc3_meson_g12a_usb_otg_apply_mode(priv, mode);
 
 	return 0;
 }
@@ -555,6 +559,11 @@ static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
 	return 0;
 }
 
+static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv)
+{
+	return dwc3_meson_g12a_usb_init_glue(priv, priv->otg_phy_mode);
+}
+
 static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 {
 	struct dwc3_meson_g12a	*priv;
@@ -622,7 +631,12 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	/* Get dr_mode */
 	priv->otg_mode = usb_get_dr_mode(dev);
 
-	ret = dwc3_meson_g12a_usb_init(priv);
+	if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
+		priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
+	else
+		priv->otg_phy_mode = PHY_MODE_USB_HOST;
+
+	ret = priv->drvdata->usb_init(priv);
 	if (ret)
 		goto err_disable_clks;
 
@@ -640,6 +654,12 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 			goto err_phys_exit;
 	}
 
+	if (priv->drvdata->usb_post_init) {
+		ret = priv->drvdata->usb_post_init(priv);
+		if (ret)
+			goto err_phys_power;
+	}
+
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret)
 		goto err_phys_power;
@@ -741,7 +761,9 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
 
 	reset_control_deassert(priv->reset);
 
-	dwc3_meson_g12a_usb_init(priv);
+	ret = priv->drvdata->usb_init(priv);
+	if (ret)
+		return ret;
 
 	/* Init PHYs */
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
-- 
2.22.0

