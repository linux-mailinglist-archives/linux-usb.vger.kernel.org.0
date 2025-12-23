Return-Path: <linux-usb+bounces-31697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EDFCD8A71
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 10:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A9463016CC6
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 09:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE4D32B98A;
	Tue, 23 Dec 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+QInOhJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED232AAA6
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483143; cv=none; b=Z8N8LWZQGqzoguzk03vSJ3DOO1MTKdiq1bDIdlF1nIGzPbK1R8Fg9ccrdqJoGFa3aDgzl6UoItN9SugEGYiZIXKSCqXQD5I75vgvfp/xuhlrSIazHJ0E7Pf6EuInajWV20GtKGaT/Qqy7SqDBd3ZJsox9gTsgmGRHre2XiMMyr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483143; c=relaxed/simple;
	bh=DKeetzW3ONgxZzrSbR0sHWi+YgHN+BQmgsjoHD3eC64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRQDk6nb9Ql7utEHjZt8H8i65dSPjvjq6LrjRQkQU8OMXmEwdghIVxL1oycgzhdgTuJyugAgzu3W7Uj5gBL/PBWKJpJ5QIkOYIil1rngMTDb5/DOz7Zrvanrk9Gu7fR3Pky8MNXCIJM331r5PvwRravlT8D8qL1Kgc0y8Nl7l50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+QInOhJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbc544b09so3615198f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 01:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483140; x=1767087940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4gxDi6v3H2DADeHS72LcwIC06VwKI575ueVFsSjhfU=;
        b=j+QInOhJSE8fbnpMSJSMVtWsb6AhsPwNpiK/HAVbz7t8/wFMDLxWOpCNjVQmvPkgvw
         GorloCZ1Pt/GIhrP24PLgbOC0DskbZF9p1gCr4O9ey3uiIpFmIBwLI24hq4OZbQjkTOm
         mQpdgA3E4vMCToVoIAivu5vdQh5qdjf0Ho9CWuScvy4Om1e1snl3rXGfHxZ/duUrIrrV
         FviR44dE375y1+S687vsQ7VltBh7ZjBUpp6VhLWxDIxiPzRzDMo9MinokcUnJzBr/Gz6
         tmJn1ImyKqlWLEulV7U5+Qg4U1tJtxUYBfRJXa6Irki4Kkaa3XvIR+mHCrL/MmnwV09z
         9ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483140; x=1767087940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d4gxDi6v3H2DADeHS72LcwIC06VwKI575ueVFsSjhfU=;
        b=p2B4gxoY6Kk4otHSTPitWSUVREyEcI+k/HoPwQzY1zNeb2tDwIprS5bvPvMnAxEVX4
         A+SJ9rlaUOeApqKmxtsLGfKt3NsPUDYHqT+HX9xJDXk6jeSl/OEl2k7Pzj6Z+bWOCkwi
         t+2ry1YdrXCs8YeLmakzY1asxnKxUnQJh7EWBnQ77pX6Ua42hJGuZbKcYO/nuXR7idEn
         zqj3a9NKpQ+T+75bbvrbi9q4foq12umoEpRMeVy3tG3HzQZBUT8MyhvGYeeH2WS0x+Xq
         SqsbRb7AGBhKsGWeTlCCjXT/K6LTzCxrLSfXSLDPadhqIyGHPAPPwiiGiF6PcKNvP/cv
         juSA==
X-Gm-Message-State: AOJu0YwUGhwH2fuprI4RMKdGdgPU+c1ah56Egfu7puusacGPMFeUW2w2
	Ya2aW6+vLftTqZjKL7Bs311ooIiwY4Ecv2laYTALtOsD9bOsj0S2WR0P
X-Gm-Gg: AY/fxX6I6hzcPOiULG7U+B/OY7d6biTIZJDPQtprJ3bmrCA3vtYQCkb7APJIXGVBSr1
	P3efDipy+piBr3HCnWn103/Ay+Q3H/MsND5mzU0wDjiii3NNXlq46Oj/c8duAbtstE2wXoUDvfe
	gJMQw7puNThHiAuIV5S7AzBcqJj3r7GtAQYUSSxWeKaednoHPAJqf4LlCFoORQ5okYnCqOW5geR
	ZqcJQznCEsYbON75Ad16dcGtARwZn1dGHpDBEm88omYi3jwfc3vXjJDebpVQ+U/5HYvTov8fJIi
	xIwQKB9LN2KYrL/eKgIsp/CmaU0W/Qo2RTXULJPSXAas7hyz2RCvsWzQzv+SJicSDQ2o0imKgKb
	h7Soi7pvuuPcpkhq2CYuhlEDX2YNVh82fFu0MtWZ8N+j4gN/Atj06Rdo6QYW28vCuXggflqTOrF
	RK
X-Google-Smtp-Source: AGHT+IGjtntSpEM/XfblJzXJtwYQ7LvnZlKwUDhjMjjIEG2BTcu9fpyPlUzavrUxiMQLMRU/++RUmg==
X-Received: by 2002:a05:6000:2586:b0:430:fcda:452d with SMTP id ffacd0b85a97d-4324e4cbd79mr15227367f8f.22.1766483140047;
        Tue, 23 Dec 2025 01:45:40 -0800 (PST)
Received: from xeon ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1ae12sm25759024f8f.6.2025.12.23.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:45:39 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
Date: Tue, 23 Dec 2025 11:45:28 +0200
Message-ID: <20251223094529.7202-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223094529.7202-1-clamor95@gmail.com>
References: <20251223094529.7202-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor to directly use enum usb_phy_interface to determine the PHY mode.
This change is in preparation for adding support for HSIC mode.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 49 +++++++++++++++++++------------
 include/linux/usb/tegra_usb_phy.h |  2 +-
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 1f527fcb42f6..13232b074649 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -814,15 +814,24 @@ static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 
 static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
 {
-	int err;
+	int err = 0;
 
 	if (phy->powered_on)
 		return 0;
 
-	if (phy->is_ulpi_phy)
-		err = ulpi_phy_power_on(phy);
-	else
+	switch (phy->phy_type) {
+	case USBPHY_INTERFACE_MODE_UTMI:
 		err = utmi_phy_power_on(phy);
+		break;
+
+	case USBPHY_INTERFACE_MODE_ULPI:
+		err = ulpi_phy_power_on(phy);
+		break;
+
+	default:
+		break;
+	}
+
 	if (err)
 		return err;
 
@@ -841,10 +850,19 @@ static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
 	if (!phy->powered_on)
 		return 0;
 
-	if (phy->is_ulpi_phy)
-		err = ulpi_phy_power_off(phy);
-	else
+	switch (phy->phy_type) {
+	case USBPHY_INTERFACE_MODE_UTMI:
 		err = utmi_phy_power_off(phy);
+		break;
+
+	case USBPHY_INTERFACE_MODE_ULPI:
+		err = ulpi_phy_power_off(phy);
+		break;
+
+	default:
+		break;
+	}
+
 	if (err)
 		return err;
 
@@ -863,7 +881,7 @@ static void tegra_usb_phy_shutdown(struct usb_phy *u_phy)
 	usb_phy_set_wakeup(u_phy, false);
 	tegra_usb_phy_power_off(phy);
 
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmip_pad_close(phy);
 
 	regulator_disable(phy->vbus);
@@ -1049,7 +1067,7 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 		goto disable_clk;
 	}
 
-	if (!phy->is_ulpi_phy) {
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI) {
 		err = utmip_pad_open(phy);
 		if (err)
 			goto disable_vbus;
@@ -1066,7 +1084,7 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 	return 0;
 
 close_phy:
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmip_pad_close(phy);
 
 disable_vbus:
@@ -1104,8 +1122,6 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 	struct resource *res;
 	int err;
 
-	tegra_phy->is_ulpi_phy = false;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!res) {
 		dev_err(&pdev->dev, "Failed to get UTMI pad regs\n");
@@ -1280,7 +1296,6 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct tegra_usb_phy *tegra_phy;
-	enum usb_phy_interface phy_type;
 	struct reset_control *reset;
 	struct gpio_desc *gpiod;
 	struct resource *res;
@@ -1342,8 +1357,8 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	phy_type = of_usb_get_phy_mode(np);
-	switch (phy_type) {
+	tegra_phy->phy_type = of_usb_get_phy_mode(np);
+	switch (tegra_phy->phy_type) {
 	case USBPHY_INTERFACE_MODE_UTMI:
 		err = utmi_phy_probe(tegra_phy, pdev);
 		if (err)
@@ -1369,8 +1384,6 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		break;
 
 	case USBPHY_INTERFACE_MODE_ULPI:
-		tegra_phy->is_ulpi_phy = true;
-
 		tegra_phy->clk = devm_clk_get(&pdev->dev, "ulpi-link");
 		err = PTR_ERR_OR_ZERO(tegra_phy->clk);
 		if (err) {
@@ -1410,7 +1423,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 
 	default:
 		dev_err(&pdev->dev, "phy_type %u is invalid or unsupported\n",
-			phy_type);
+			tegra_phy->phy_type);
 		return -EINVAL;
 	}
 
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index c314fad5e375..e394f4880b7e 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -73,7 +73,7 @@ struct tegra_usb_phy {
 	struct usb_phy *ulpi;
 	struct usb_phy u_phy;
 	bool is_legacy_phy;
-	bool is_ulpi_phy;
+	enum usb_phy_interface phy_type;
 	struct gpio_desc *reset_gpio;
 	struct reset_control *pad_rst;
 	bool wakeup_enabled;
-- 
2.51.0


