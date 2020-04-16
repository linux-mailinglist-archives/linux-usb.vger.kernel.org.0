Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A611AC0EE
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 14:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635295AbgDPMTd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 08:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635256AbgDPMT1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 08:19:27 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F94C0610D6
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 05:19:19 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f13so4504673wrm.13
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 05:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/6E1kZxvTaKt+1NdwEoHBqnrhp7oByQnrNMutNIv6o=;
        b=zYzVI8Tw2aQsaeiyJc9hgEmPMyYn/eh8X5h/EFx3Z2rb30I4GJr1WHCHngDmMIFkZ5
         9TlwWr/9TAO6QFlVWoMCJhPbq6+vYr4GSeOhYwo26EfSWC1VumJWWrT8QI6I220cuwB1
         yrD/Ga9JcnbyCxrinS36c7mXozuPbN6S5MHxFABugldkparAH5vG0AayBUKqC8B7nfm2
         xXmjsjZL6WBiRrEY9H5MkoXlJFYO4pktH9TIp/4GO8GPfhfce+UKfDg0FUbvyab7s6P0
         MNjCgz+xMVx33cyANAeG03Kw2XsL3byzTjXu+MzeimLqNz0q58APL1XxoBFnt23eIF9V
         E4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/6E1kZxvTaKt+1NdwEoHBqnrhp7oByQnrNMutNIv6o=;
        b=UMx0xTzvNgdmk5jTS2qBFotnD9lIoFn9d7l56AJjq2lZ1WzGvqwd7pt2/Ttd5fltVN
         Im0fCtXfSxQQfLODWOjpogMRyzElnCNtfMCt6ehHx0iYMI/p9Tjs7SRLjxvYYxNvyi2p
         K9GNAwTc/jnNpWRC9Lv19VFz+NQuWg7+Eq5Go9LSq5IRkUJ6+fLWY5ay/4pGVSqwcqwd
         QAuF6CBsUooPeUlYrOOuecWGhC1ixRIeRYrRQ/uQO4xCtXSIDV9hA98t55VxC79tx44D
         XtT5qLmGD3xgR7kryde70EJINOYJAYjpHVsmK6dPbxKYOvh+/y8fek03yt5kXNRL0/8J
         HqNQ==
X-Gm-Message-State: AGi0PuZYuSzNuruLAEhwZ4BlV23lNWT37Q2X26AGknfQ177K+8qjFpsR
        CxxaJ2vFXSyKPOJsyIFb5btQoA==
X-Google-Smtp-Source: APiQypJGqH2Tdj4WHSywldhtDVODpXqD+hWWxSh/W7SxzRY7BFErW5p0n/kdLyhjmQbmjbBaZmcSqw==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr35778941wrx.185.1587039558481;
        Thu, 16 Apr 2020 05:19:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id i13sm22035602wro.50.2020.04.16.05.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 05:19:17 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] usb: dwc3: meson-g12a: support the GXL/GXM DWC3 host phy disconnect
Date:   Thu, 16 Apr 2020 14:19:04 +0200
Message-Id: <20200416121910.12723-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416121910.12723-1-narmstrong@baylibre.com>
References: <20200416121910.12723-1-narmstrong@baylibre.com>
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
index e7a6d05f2a72..cc0b8a253932 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -131,6 +131,7 @@ struct dwc3_meson_g12a;
 
 struct dwc3_meson_g12a_drvdata {
 	bool otg_switch_supported;
+	bool otg_phy_host_port_disable;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	const char **phy_names;
@@ -155,6 +156,19 @@ static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
 
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
@@ -290,6 +304,13 @@ static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv,
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
@@ -297,6 +318,12 @@ static void dwc3_meson_g12a_usb_otg_apply_mode(struct dwc3_meson_g12a *priv,
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
@@ -430,6 +457,13 @@ static int dwc3_meson_g12a_role_set(struct usb_role_switch *sw,
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

