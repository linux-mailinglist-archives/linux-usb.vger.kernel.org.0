Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99CA019400A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 14:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgCZNpY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 09:45:24 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39702 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbgCZNpX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 09:45:23 -0400
Received: by mail-wr1-f68.google.com with SMTP id p10so7859720wrt.6
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADzYgjGOgHOtUw/QufLYo/yFk6QQng/fuo3s/mdjUtc=;
        b=1s2evVvNNcsCiZwNF+IKILngbPXtpEtC60KEFj75x7JmCErDv4LrIl6nC3rJz3LP8p
         jAKd/Oi+fcgckOsneV6gQF/QcR//pdLAhqjnxXaSBYUshH+qYVVPEJ8PBs+ujKpEEr/C
         yAxKrykeRL/tjZNXpUNPScltaieME7HBUgOQLfZIVFM51jADa6ZRzy2tqcMbfL6QGA6y
         dL4aqpAW17F5BZQz2quzRcXe650GxzVMh8eqL2BI9DYHyUbxvGlQ62Ci1mCNC6mrpFee
         4U67t5ZLabg1dztYg+po0LWhru7Om/H3pL66V9I7wlcOotrZuoT+5Qo6e9wPKpp3hDiL
         Y+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADzYgjGOgHOtUw/QufLYo/yFk6QQng/fuo3s/mdjUtc=;
        b=Ux4A9VK+hj8cHv0Z0XsLdeQUgjF74SZp7tGrI9xHW+Vlqp2/cdDhbC2g1/E5CFZN54
         T98QWT3DZChRyAy+zUVoA/o9BFovcIgvSQM5m3cXvtzpBfgMsKcMEyxma86zVqsehDMc
         SACKHhsbdKjeCUurW21DBbkVvE2Nxktmxa0TVkTagu/hwPqPOom+HiiJF6cDi0rhE7UD
         5wz4FzhINAdMylaM7zNBm0mMGcidySPJVNt8MgKb5lESmMg95pPHIeCgsPISyDzM37IN
         4Hd0QYAapX7X2ecc/YSPBdxGPGMgiCx44o0s4n7D/wNqpk/7VZG2iJjVqDVBKMyx8lqZ
         3uuQ==
X-Gm-Message-State: ANhLgQ2+irabWhW7sXSAl38U3NQtJ9kh8V5UdcM5tRa/dlV9EE814mqk
        UdrK0pD2M+rjVdduLl7KGOZ/0A==
X-Google-Smtp-Source: ADFU+vtfhKfdRRfS/g5hPSgJvWSebA28iSEs/QoA3gp5cLK3H+Astw/T4q2ZHHg33v0wi8RW8gyAXA==
X-Received: by 2002:adf:9022:: with SMTP id h31mr9259345wrh.223.1585230319979;
        Thu, 26 Mar 2020 06:45:19 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 06:45:19 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/14] usb: dwc3: meson-g12a: refactor usb init
Date:   Thu, 26 Mar 2020 14:44:59 +0100
Message-Id: <20200326134507.4808-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
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
the sub-nodes probe.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 46 +++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 328e74def56f..43b398b7b1f7 100644
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
@@ -553,6 +557,11 @@ static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
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
@@ -620,7 +629,12 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
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
 
@@ -642,6 +656,12 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_phys_power;
 
+	if (priv->drvdata->usb_post_init) {
+		ret = priv->drvdata->usb_post_init(priv);
+		if (ret)
+			goto err_phys_power;
+	}
+
 	ret = dwc3_meson_g12a_otg_init(pdev, priv);
 	if (ret)
 		goto err_phys_power;
-- 
2.22.0

