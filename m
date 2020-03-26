Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82FFC194010
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 14:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgCZNpX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 09:45:23 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35459 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbgCZNpV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 09:45:21 -0400
Received: by mail-wm1-f66.google.com with SMTP id m3so7066912wmi.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h4OQGeeefykddJTLyHhR+pmXKSb4WyyElXj03N7FWqg=;
        b=FtpRIc5lQGp8K83aq1yBJ9kHII2tvynMr9OZ1jinKDHRFhKu+pu1lRsB8/ypHmm0sB
         2rNd5Uf7wqk4JllPfjgUO4QdjbgiMucnOFVmi7JmOz7a5rEaxq+cwr+3OI1uMs7cZxS9
         V1xSKr5BaUH7tJA/Jaki3uukc35M2swP5S50gL7AQZFbitadAoEPF0HF4rSnQj09drKs
         Lw4xeykbulQmyPURhw+KjGVPnNniAoYdSZt9TQ/l0UFDnGdQ5FZyxqkvSMlbX+ybckzZ
         TlkvOdAxuQatyA/6VzLxIH1ChGhBZCnKbFceW3Y/6jZ0c67Ht4N0xzyGbnpfLEaI7vvj
         Oymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h4OQGeeefykddJTLyHhR+pmXKSb4WyyElXj03N7FWqg=;
        b=FqzQxYqmMECmePbIMb7EmYs90R82MV8FXk3OfKxi7mqsMPq2GiAt2wmMnmv5xF2mDY
         yC2F7YRCLqYb03YnGfLtEXoi0NPrHLQmOqoHHinYRW7e0W6gUI/3YcC4yHFX+q8iHOjr
         VXzLBXSY63FTARBqjOIM3ZT5sgVgJu6NFQPE90qUHKtRxDEgehqe57ja/OYiScewPnbt
         Tiq9jrdYj2r2imn+dKQjito+V0E9o+NTttJmORYFTDnn87xWjoJrEByGqNK9EEtbWlL9
         IEvuApUPnMXiqHu2Lue61QjYJ7lUhQyinP1B+frBu//sKfidSLRGYINF5Zb+U2Z1zn32
         S8Bw==
X-Gm-Message-State: ANhLgQ0KtBMtuDzwq72i2/jMWI7SNJfbj0xZqOcOC+lMVE+4ZtvLe/vS
        BXMiwkMwN6naQI3e5vdBF7zcmQ==
X-Google-Smtp-Source: ADFU+vtNV2p2MdHTs3Aw9mAjq2g8w1y4nKcuV9ppnHa1G0n4fScralNm+HVi6ta7Q/aw94MiqSd2kA==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr2519wmc.171.1585230318771;
        Thu, 26 Mar 2020 06:45:18 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 06:45:18 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/14] usb: dwc3: meson-g12a: refactor usb2 phy init
Date:   Thu, 26 Mar 2020 14:44:58 +0100
Message-Id: <20200326134507.4808-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Refactor the USB2 PHY init code patch to handle the Amlogic GXL/GXM
not having the PHY mode control registers in the Glue but in the PHY
registers.

The Amlogic GXL/GXM will call phy_set_mode() instead of programming the
PHY mode control registers, thus add two new callbacks to the SoC match
data.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 74 +++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 69381c42a6d3..328e74def56f 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -136,11 +136,21 @@ struct dwc3_meson_g12a_drvdata {
 	const char **phy_names;
 	int num_phys;
 	int (*setup_regmaps)(struct dwc3_meson_g12a *priv, void __iomem *base);
+	int (*usb2_init_phy)(struct dwc3_meson_g12a *priv, int i,
+			     enum phy_mode mode);
+	int (*set_phy_mode)(struct dwc3_meson_g12a *priv, int i,
+			    enum phy_mode mode);
 };
 
 static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
 					 void __iomem *base);
 
+static int dwc3_meson_g12a_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
+					  enum phy_mode mode);
+
+static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
+					int i, enum phy_mode mode);
+
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
@@ -148,6 +158,8 @@ static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.phy_names = meson_g12a_phy_names,
 	.num_phys = ARRAY_SIZE(meson_g12a_phy_names),
 	.setup_regmaps = dwc3_meson_g12a_setup_regmaps,
+	.usb2_init_phy = dwc3_meson_g12a_usb2_init_phy,
+	.set_phy_mode = dwc3_meson_g12a_set_phy_mode,
 };
 
 static struct dwc3_meson_g12a_drvdata a1_drvdata = {
@@ -157,6 +169,8 @@ static struct dwc3_meson_g12a_drvdata a1_drvdata = {
 	.phy_names = meson_a1_phy_names,
 	.num_phys = ARRAY_SIZE(meson_a1_phy_names),
 	.setup_regmaps = dwc3_meson_g12a_setup_regmaps,
+	.usb2_init_phy = dwc3_meson_g12a_usb2_init_phy,
+	.set_phy_mode = dwc3_meson_g12a_set_phy_mode,
 };
 
 struct dwc3_meson_g12a {
@@ -175,8 +189,8 @@ struct dwc3_meson_g12a {
 	const struct dwc3_meson_g12a_drvdata *drvdata;
 };
 
-static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
-					  int i, enum phy_mode mode)
+static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
+					 int i, enum phy_mode mode)
 {
 	if (mode == PHY_MODE_USB_HOST)
 		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
@@ -185,11 +199,41 @@ static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
 	else
 		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
 				U2P_R0_HOST_DEVICE, 0);
+
+	return 0;
+}
+
+static int dwc3_meson_g12a_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
+					 enum phy_mode mode)
+{
+	int ret;
+
+	regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
+			U2P_R0_POWER_ON_RESET,
+			U2P_R0_POWER_ON_RESET);
+
+	if (priv->drvdata->otg_switch_supported && i == USB2_OTG_PHY) {
+		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
+				   U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
+				   U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS);
+
+		ret = priv->drvdata->set_phy_mode(priv, i, mode);
+	} else
+		ret = priv->drvdata->set_phy_mode(priv, i,
+						  PHY_MODE_USB_HOST);
+
+	if (ret)
+		return ret;
+
+	regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
+			U2P_R0_POWER_ON_RESET, 0);
+
+	return 0;
 }
 
 static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
 {
-	int i;
+	int i, ret;
 
 	if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
 		priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
@@ -203,23 +247,9 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
 		if (!strstr(priv->drvdata->phy_names[i], "usb2"))
 			continue;
 
-		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
-				   U2P_R0_POWER_ON_RESET,
-				   U2P_R0_POWER_ON_RESET);
-
-		if (priv->drvdata->otg_switch_supported && i == USB2_OTG_PHY) {
-			regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
-				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
-				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS);
-
-			dwc3_meson_g12a_usb2_set_mode(priv, i,
-						      priv->otg_phy_mode);
-		} else
-			dwc3_meson_g12a_usb2_set_mode(priv, i,
-						      PHY_MODE_USB_HOST);
-
-		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
-				   U2P_R0_POWER_ON_RESET, 0);
+		ret = priv->drvdata->usb2_init_phy(priv, i, priv->otg_phy_mode);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -372,7 +402,9 @@ static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
 
 	priv->otg_phy_mode = mode;
 
-	dwc3_meson_g12a_usb2_set_mode(priv, USB2_OTG_PHY, mode);
+	ret = priv->drvdata->set_phy_mode(priv, USB2_OTG_PHY, mode);
+	if (ret)
+		return ret;
 
 	dwc3_meson_g12a_usb_otg_apply_mode(priv);
 
-- 
2.22.0

