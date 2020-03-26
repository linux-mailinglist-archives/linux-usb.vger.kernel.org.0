Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4779B194007
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 14:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgCZNpR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 09:45:17 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45149 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbgCZNpQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 09:45:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id t7so7799378wrw.12
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 06:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K9eFb8D2phR1YQNJRTJuZvG3GmqU7Jbt0/WyqKmz+bw=;
        b=oWILPA9p7zgoY1wf0zlh6GXe8ZRRFY/8EwWnOTVNji6p4fwPkPjwdQwSe4GxMkrUbM
         +GghmZZnkWrN9amFiQ14DTU0Nu5rreLb3ZddKS9HH2fe8M66EYpbMux/z7vai3lW/DKn
         TBQ0PQE6FMCLwLDtPvPz5JPQ1girW7B3m50WIBCdBoq/KYSYyszbVeuc3o1c2nuAoWFy
         AS7dYqMPVnRUC2M6bWUM1qlUqc6aFIjPj4lT8voW3zk0KAXbSfNj1JIciPwcIDDTHcYk
         qrhWxwz1pY6KIoKvdnQFcGAj3J5OEXI3b5kdxnhjeCx6FVahrrmpsZ4fA4xZBL+Xz7lR
         SIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K9eFb8D2phR1YQNJRTJuZvG3GmqU7Jbt0/WyqKmz+bw=;
        b=JkIH7mG10jXAC9KoZJM/Jy5IMu74TtFIbNtk3OpktviKqOAEXay1j9AneuAS3x0F1L
         y2xHGiw+T+ZpQZhywuvMW1rP9MB/kCki2LSj4UJGE/1k1+QTGnzK0gOWQJaqzTrXmTaE
         ILXyGK+tuLmnbPzmjZtry952KyCC0HTBChWJWw7+tSkKlLJ0feZfRhnoaOOaNzY8b5x0
         6kbeQws87tfTuQAvJCE+F7LAWL0FYlgGwpefGv/vmVUZjrq18YA5+mXEJLTgbfIyAwl7
         +JjooQmv9M40JuvQF6vZE5fq1HMbxVWpWkMCj+l3sXslRSoOql9X3yP/UCczIJ8UWhuo
         lfLg==
X-Gm-Message-State: ANhLgQ2cEEURmp7KWuNjgeNvj3QyMV7RW6MXwXeCidDVz334SWEDLA3U
        cZj5uE2d8JJ0BHq438jl6ouj3A==
X-Google-Smtp-Source: ADFU+vtM0R7NzPeN50a5ioxfIdmokzaZSGvJW1Jh6vLjUU1awtkchisbAhgq+T3/5PhaKBK5GWOieg==
X-Received: by 2002:adf:b35d:: with SMTP id k29mr9626299wrd.239.1585230312894;
        Thu, 26 Mar 2020 06:45:12 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 06:45:12 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hanjie Lin <hanjie.lin@amlogic.com>
Subject: [PATCH v2 02/14] usb: dwc3: meson-g12a: specify phy names in soc data
Date:   Thu, 26 Mar 2020 14:44:54 +0100
Message-Id: <20200326134507.4808-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To handle the variable USB2 PHY counts on GXL and GXM SoCs, add the
possible PHY names for each SoC in the compatible match data.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 47 +++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 902553f39889..d97ead5aee4e 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -96,16 +96,8 @@
 	#define USB_R5_ID_DIG_TH_MASK				GENMASK(15, 8)
 	#define USB_R5_ID_DIG_CNT_MASK				GENMASK(23, 16)
 
-enum {
-	USB2_HOST_PHY = 0,
-	USB2_OTG_PHY,
-	USB3_HOST_PHY,
-	PHY_COUNT,
-};
-
-static const char *phy_names[PHY_COUNT] = {
-	"usb2-phy0", "usb2-phy1", "usb3-phy0",
-};
+#define PHY_COUNT						3
+#define USB2_OTG_PHY						1
 
 static struct clk_bulk_data meson_g12a_clocks[] = {
 	{ .id = NULL },
@@ -117,22 +109,44 @@ static struct clk_bulk_data meson_a1_clocks[] = {
 	{ .id = "xtal_usb_ctrl" },
 };
 
+static const char *meson_g12a_phy_names[] = {
+	"usb2-phy0", "usb2-phy1", "usb3-phy0",
+};
+
+/*
+ * Amlogic A1 has a single physical PHY, in slot 1, but still has the
+ * two U2 PHY controls register blocks like G12A.
+ * Handling the first PHY on slot 1 would need a large amount of code
+ * changes, and the current management is generic enough to handle it
+ * correctly when only the "usb2-phy1" phy is specified on-par with the
+ * DT bindings.
+ */
+static const char *meson_a1_phy_names[] = {
+	"usb2-phy0", "usb2-phy1"
+};
+
 struct dwc3_meson_g12a_drvdata {
 	bool otg_switch_supported;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	const char **phy_names;
+	int num_phys;
 };
 
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
 	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
+	.phy_names = meson_g12a_phy_names,
+	.num_phys = ARRAY_SIZE(meson_g12a_phy_names),
 };
 
 static struct dwc3_meson_g12a_drvdata a1_drvdata = {
 	.otg_switch_supported = false,
 	.clks = meson_a1_clocks,
 	.num_clks = ARRAY_SIZE(meson_a1_clocks),
+	.phy_names = meson_a1_phy_names,
+	.num_phys = ARRAY_SIZE(meson_a1_phy_names),
 };
 
 struct dwc3_meson_g12a {
@@ -171,10 +185,13 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
 	else
 		priv->otg_phy_mode = PHY_MODE_USB_HOST;
 
-	for (i = 0 ; i < USB3_HOST_PHY ; ++i) {
+	for (i = 0; i < priv->drvdata->num_phys; ++i) {
 		if (!priv->phys[i])
 			continue;
 
+		if (!strstr(priv->drvdata->phy_names[i], "usb2"))
+			continue;
+
 		regmap_update_bits(priv->regmap, U2P_R0 + (U2P_REG_SIZE * i),
 				   U2P_R0_POWER_ON_RESET,
 				   U2P_R0_POWER_ON_RESET);
@@ -284,17 +301,19 @@ static const struct regmap_config phy_meson_g12a_usb3_regmap_conf = {
 
 static int dwc3_meson_g12a_get_phys(struct dwc3_meson_g12a *priv)
 {
+	const char *phy_name;
 	int i;
 
-	for (i = 0 ; i < PHY_COUNT ; ++i) {
-		priv->phys[i] = devm_phy_optional_get(priv->dev, phy_names[i]);
+	for (i = 0 ; i < priv->drvdata->num_phys ; ++i) {
+		phy_name = priv->drvdata->phy_names[i];
+		priv->phys[i] = devm_phy_optional_get(priv->dev, phy_name);
 		if (!priv->phys[i])
 			continue;
 
 		if (IS_ERR(priv->phys[i]))
 			return PTR_ERR(priv->phys[i]);
 
-		if (i == USB3_HOST_PHY)
+		if (strstr(phy_name, "usb3"))
 			priv->usb3_ports++;
 		else
 			priv->usb2_ports++;
-- 
2.22.0

