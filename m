Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB4D190AA5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbgCXKUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:20:53 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:32956 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbgCXKUu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:20:50 -0400
Received: by mail-wm1-f65.google.com with SMTP id r7so2129156wmg.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LAt+HdDto2gFeGUw4ztWf5Rpdip/FjGrs7cpqwQNhSQ=;
        b=r3YYIIXWo1CNzzCPPmO7j+2H6A7TCKHz2xQF9BT6aNiJNQ8RnNBzd1UxrAJccxqmmk
         krIOaubpkJtZtcEKW8weSa+9ZCtrw01enYSCqjI96lWPli3kDnvRBiosdpVYa4j4IYoQ
         VmvuGozP58hTOxpei3Y8J+b1AJuh3hd3s4ZsGeeCGGFlYtkZrv75/eV2NY3moeurf8uy
         ARM+QHrd8igOo7/Z3ZAgte1CJeEdhrm4ne90Gb5CMhkoNRYulqj2hnZrtUCtQ2PfAztS
         7yks/oclmXesLLhZyFAvyAhKM7HxS1KuICQXwpPx5ASEhBmLm99Pu4ux4DBCreOCuEfR
         ktOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LAt+HdDto2gFeGUw4ztWf5Rpdip/FjGrs7cpqwQNhSQ=;
        b=iUb5tIIdjgNZuS8itz7H+aS21EdnXqmff2eh/uI2OX6RaKzQuRlRlJnmG5oh/3uIMb
         IrKCnc1afEyGM6mLCwID4iycGYMkEs01x2qJVAsjNCzGTgCm38Y1yI/vongLk2zhLaHe
         1FHIfKUZzvYesm+Tu0i0YgAsB+DJAJQv5lEEc1aTlKGArsBadbEmbHNaXTVxTJr9n3q9
         Unc1eH3BInibDpP+8Zhdfg6PmHesTLtQhJaZq/uv3xdz1Vp5YFYqHSik9OauhrnbLgxx
         LH2x3z+qmL9cClLbJb8X5ZpfZSLgZxcTuAmIoKmRzBi6s4sx7KPaigZ9tFycgyDlfaHs
         wdZg==
X-Gm-Message-State: ANhLgQ1AIyFfNqkM6680bM6G35dvgw+d2dsPo1FJ/3jGv2AijLEzR4Qy
        j32j+M6p+tovl4gjJFwsxcxGsA==
X-Google-Smtp-Source: ADFU+vvrml3+ybJ3VeVfRgDYJVaxmt4+SDOcYN4kMnq4qe5+1jf3MqolpUDfWJHUw2xnpPJMQI+5bQ==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr4434252wmc.49.1585045247270;
        Tue, 24 Mar 2020 03:20:47 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:20:46 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] usb: dwc3: meson-g12a: support the GXL/GXM DWC3 host phy disconnect
Date:   Tue, 24 Mar 2020 11:20:24 +0100
Message-Id: <20200324102030.31000-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On the Amlogic GXL/GXM SoCs, the OTG PHY status signals are always
connected to the DWC3 controller, thus crashing the controller when
switching to OTG mode when port is not populated with a device/cable to
Host.

Amlogic added a bit to disconnect the OTG PHY status signals from the DWC3
to be used when switching the OTG PHY as Device to the DWC2 controller.

The drawback is that it makes the DWC3 port state machine stall and needs
a full reset of the DWC3 controller to get connect status to the port
connected to the OTG PHY, but not the other one.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 65c220b577d0..04ef70661711 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -123,6 +123,7 @@ struct dwc3_meson_g12a;
 
 struct dwc3_meson_g12a_drvdata {
 	bool otg_switch_supported;
+	bool otg_phy_host_port_disable;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	const char **phy_names;
@@ -147,6 +148,19 @@ static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
 
 static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv);
 
+/*
+ * For GXL and GXM SoCs:
+ * USB Phy muxing between the DWC2 Device controller and the DWC3 Host
+ * controller is buggy when switching from Device to Host when USB port
+ * is unpopulated, it causes the DWC3 to hard crash.
+ * When populated (including OTG switching with ID pin), the switch works
+ * like a charm like on the G12A platforms.
+ * In order to still switch from Host to Device on an USB Type-A port,
+ * an U2_PORT_DISABLE bit has been added to disconnect the DWC3 Host
+ * controller from the port, but when used the DWC3 controller must be
+ * reset to recover usage of the port.
+ */
+
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
@@ -282,6 +296,13 @@ static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv,
 					       enum phy_mode mode)
 {
 	if (mode == PHY_MODE_USB_DEVICE) {
+		if (priv->otg_mode != USB_DR_MODE_OTG &&
+		    priv->drvdata->otg_phy_host_port_disable)
+			/* Isolate the OTG PHY port from the Host Controller */
+			regmap_update_bits(priv->usb_glue_regmap, USB_R1,
+				USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK,
+				FIELD_PREP(USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK,
+					   BIT(USB2_OTG_PHY)));
 		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
 				USB_R0_U2D_ACT, USB_R0_U2D_ACT);
 		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
@@ -289,6 +310,12 @@ static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv,
 		regmap_update_bits(priv->usb_glue_regmap, USB_R4,
 				USB_R4_P21_SLEEP_M0, USB_R4_P21_SLEEP_M0);
 	} else {
+		if (priv->otg_mode != USB_DR_MODE_OTG &&
+		    priv->drvdata->otg_phy_host_port_disable) {
+			regmap_update_bits(priv->usb_glue_regmap, USB_R1,
+				USB_R1_U3H_HOST_U2_PORT_DISABLE_MASK, 0);
+			msleep(500);
+		}
 		regmap_update_bits(priv->usb_glue_regmap, USB_R0,
 				USB_R0_U2D_ACT, 0);
 		regmap_update_bits(priv->usb_glue_regmap, USB_R4,
@@ -421,6 +448,13 @@ static int dwc3_meson_g12a_role_set(struct device *dev, enum usb_role role)
 	if (mode == priv->otg_phy_mode)
 		return 0;
 
+	if (priv->drvdata->otg_phy_host_port_disable)
+		dev_warn_once(priv->dev, "Manual OTG switch is broken on this "\
+					 "SoC, when manual switching from "\
+					 "Host to device, DWC3 controller "\
+					 "will need to be resetted in order "\
+					 "to recover usage of the Host port");
+
 	return dwc3_meson_g12a_otg_mode_set(priv, mode);
 }
 
-- 
2.22.0

