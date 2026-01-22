Return-Path: <linux-usb+bounces-32630-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIDYHSJAcmnpfAAAu9opvQ
	(envelope-from <linux-usb+bounces-32630-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:20:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E896898A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1005F3093A5F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 15:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84CB365A18;
	Thu, 22 Jan 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUEluEla"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9055235F8C8
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094716; cv=none; b=id8MheNasnhHCrySE/qZf1JtkXvYDQRa0iErijbzwvN8RkyacWlhlZV/r4Adi6vRacOG/2rp4O8T+12I4mxMGf8qjgmgE/iR2D9ksbt8Bk26vqCo/A+xiowXs4ryJzpSVOzWA9ZhDpmeaku+qm9OwKeTjVFJ18ByMD75Jw0YStI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094716; c=relaxed/simple;
	bh=Dalp9JKi9nYaLgLeQTdmZa2HRLGvhzfShJ2gOCw/juM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppmOvhlUf/OLT9jv87TJn6uXDMX84JZ11p7DQYTvnULI3wnyv1VYcyaWh1kAg+tFELX1fVP/A1F1WrFKAMQHPyMrHYG9tGTvORkoLBWl6Kwkp1quUn6c21KANnHgzHdtgaLJ46EDu23YtBsjYpoag/0XlvHXUvrXBV8RCro4eY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUEluEla; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so10994385e9.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 07:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769094712; x=1769699512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajF+9IIPti7bTMujtf2+9NWft5TDbxjTIxiEYSTjvHI=;
        b=BUEluEla2hQMsL49vKAI7RHU/Vgr6/lLubR9ZVi8XsYjtkGCKfZvYjM2HmNiZpT39x
         xuLtnikRaYw4GfihodqB1mqIJVQBTyEgg8nRfLVBdv4QZOPGuBv145+ZhA1gTWiHYGz9
         /0IOYPmW5GzMpA3sNDujhMATE81zAk429aF+hQd/YqjUgAP1ERkQDyMqePkbp3E6mykY
         huAaCxqC3mQy5POQWoP7CTC3tT8UWgGZ48XNogOXkApK2y8okgx8twpPvRvIWKDK7ycz
         UsQ3BT9Q/WnT6xUjSHLZfu9hSZUaePXEAM+3oxuUFafDrK9mUQx5deNv7l2aCcBdSEmq
         TRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094712; x=1769699512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajF+9IIPti7bTMujtf2+9NWft5TDbxjTIxiEYSTjvHI=;
        b=iyeyea2YvqhGh4tFApnqzjecSt4NV/9+KNh9sdacINsr6oZ/Ez+lXZNGdLdWgt+wMO
         BUD+QAWufcxV9PjM/NeiYUFTGWBl/Hf30qQTPkB8rr7CLQyFW2PAtVx/KKI6bweE8xej
         9DRxNQMD1Vx+rDw35El3DtJ3ENuPdQp+uhFkjuk+iNaq8dKn3nUiGj7U9n2nIOacqYoI
         s4yapsVZy5WBYFUJs82c07bYwFoI2wQ1neDb26jla6ilr7naR0Li3sNs5LvIDAPNX4nM
         DYO4vcFV95OYr87RygVfNJg4W1FjySmMoLziAAeh/IZiGTkZdantGLoEb8Ytsc/8TIg3
         c5kA==
X-Gm-Message-State: AOJu0Yy92PZIZizesDhb9YNhGMbJ9UmPXndD91LuCA8Q2ao9lv8RzDmj
	WrgfFJGunuXI0pgCoqNXEvNTj+a7tTc77Fgl918u5s//vqoHwrJHyYqt
X-Gm-Gg: AZuq6aJf+1j12PyB0H8+0z0Me6VwqakVEsJ0HClp+Efr4iwMFSLd7/RJCghe5EhVgVc
	nJ0vVbbS5cRN9GDuh/k1Z0AmOH2NXqO8wUFzbYpq9Si6rPrDtketlN2n4DwBtoEph1FUMvNGysq
	RZID7HlSAS9gxoVeAp0UJrTuwi8piYfMDzEpCp4bBnVSIOCnreExDYlOqZY/R06nlOAe39X5BKE
	Y5CPU44g/jRYOIZ5IQ8GqzZzl6c1ppf11rLfLyKpXWojYdjP+P3bMlm/l9z/C75X3VIY+bPeCSa
	MhzPcgwYcEfooJUBPm9D0O+b2LDcZ7oF/3O0MIvrbPOL33Usm95RuSGzsCKC0AYvOdUpyGBWv4t
	B+lbVXbWg0aq7MEkkxIG3DL07Y3Cow2xsEE+aG7VeQZ39P73jEtCodxe7B8P6FwrVUrO4yh4ioZ
	Ur
X-Received: by 2002:a05:600d:6450:10b0:477:58af:a91d with SMTP id 5b1f17b1804b1-480215e1ad9mr236546925e9.5.1769094711457;
        Thu, 22 Jan 2026 07:11:51 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804704b4e6sm74861705e9.7.2026.01.22.07.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:11:51 -0800 (PST)
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
Subject: [PATCH v3 1/2] usb: phy: tegra: use phy type directly
Date: Thu, 22 Jan 2026 17:11:24 +0200
Message-ID: <20260122151125.7367-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122151125.7367-1-clamor95@gmail.com>
References: <20260122151125.7367-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32630-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,nvidia.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7E896898A
X-Rspamd-Action: no action

Refactor to directly use enum usb_phy_interface to determine the PHY mode.
This change is in preparation for adding support for HSIC mode.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 51 +++++++++++++++++++------------
 include/linux/usb/tegra_usb_phy.h |  2 +-
 2 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 1f527fcb42f6..afa5b5535f92 100644
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
 
@@ -836,15 +845,24 @@ static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
 
 static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
 {
-	int err;
+	int err = 0;
 
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


