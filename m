Return-Path: <linux-usb+bounces-32987-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AMEN/ZbgGlj7AIAu9opvQ
	(envelope-from <linux-usb+bounces-32987-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:10:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B2C986F
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A48D4301D300
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 08:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E31831A570;
	Mon,  2 Feb 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ic+NJa+V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755A31326B
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 08:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019555; cv=none; b=DAqrFQrk2FWaQjlYSmarhe3lSOFGAj9HkASK9Kjew44KSEbaDaXlGYLYb/usrpnFzYB2CxoZ35WcB3XczXO6r/ccJV/H9a874HlbasI63lQdiVa1VAOgAL2cuJvB65a4L8YcoSIIgymZ6gZBoBKHqSvml1P3NFpZtY4yGURCPC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019555; c=relaxed/simple;
	bh=4DLuHDpXAVSEadkbFoPphu57qatbcSuZfLy7Dg1mEiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOnXHqiMJ05Aw/izkDOR/v7pAFU24JtVU2Io1PAH/VX0BRQInTICrL40R/jQC74/74tn7xw7DNDSc6/om52qqBgAdirGG5mmal4IztZk84c+DMRC9T/EXeO2TTGcCXbyvlqUSwUK+7kpxQC19MS6yRM9iVWyVGWBzBfwpBnIhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ic+NJa+V; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so30299855e9.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 00:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019552; x=1770624352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9k1zjIr03iooF2YM3kRmAjERuwBowXr3HGt8AVXOiw=;
        b=Ic+NJa+V03sLjetxA/dH8u42g5eBTmgG+dMAFgpYxQyMSZq/i+UpgVL4jgu8f60iPH
         DQ+XA2y19M9nQNk7Fk8jPPMvb1k6PLS4L9oCYrt3VU/i6KGR+yQFQ4FcF+++fAqtf0fQ
         lfSTIpIIM1rWOA2j+/2iJ9ANcHAoX1Q76kcIj6DyJBNhRk6mGwEAsuIQJ3HPsQ3a9B0v
         BSr/qPRxonn5279mm56b6d8LGQwk1cmVlqM+GFXWrdrgEdBo0RXNbII8of+opeUA58rq
         JASeWkISpCRJm72gMzwn+2bA5pC/+Evtwh3IC1YQfHlr+4+LjXhnLS/eReBxkAK9mYhw
         Nn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019552; x=1770624352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W9k1zjIr03iooF2YM3kRmAjERuwBowXr3HGt8AVXOiw=;
        b=J2tImd2RF9dUecR5G5Z5hGSjMXg8pG+fSOe3kpIRsm4dPPExph++ZH+SKWgMbGA3Ta
         OYtoIWxQC3uU5zNx7MaQJGHOlHS01QIA/JuuEQBC+2sQDfA0mlqlQGpU+/qAa1/pDyN3
         gaXDVN7AWnAzHZYIFUSJ/UtVfj2qYwPM8zgPi+hnPHFu5IQWZhDr/RuQYfNw9dhb9fdf
         KrosXiTQI8h9InXFxcVUeE6J38lG4WndnhtQpb7VuugTtka5Vgdhba6EJiLfnxf51DR0
         oua8gysGHKRqbPoWajdjUksukVNI8Rk7Vclqv8sv6SSi9ZMeRYD3D0ePG+bnc3LjtLEA
         iaCg==
X-Gm-Message-State: AOJu0YwQZHozjP534zPcqB5u9TM7YYS3+j4nhI/3d/HNgtIUNAc3zEB3
	LQJgrT6razm+JCD0psviL3IkPPRLh27NT6VOrPycoa0YQHNDzZP4yf8R
X-Gm-Gg: AZuq6aJttPlax630YA9vhdxRvPDXlXwpHUkqqHvvuyD2Z+4P2HZoiTrMnmffy0KtyHi
	RHsrGYffOnL7bbwuWskHEc7QWJE4Y+GaiBc+a0vjoeJ7YOoHdTkdj+pkgPe8WhAaJyhEp3bZ0ow
	KiVyJ9G6wPRlFIgjf1S1zoaHv/HRNcDyVcI7ZT3Pj2ilC2FuGEDtY8/FD2C5xYjwGB4on3Z3NHo
	GD3GdLpTQe0yufueScGgBRcqyxncvEykCQaHBa9d3+BLI5LaWFpjaqq59xbYv8inrzAh0NFj4GL
	8M50QZFG7y6dhOyD5+8os0AP7u3nI9aqV50BNzU/DKCo5ptxtQdEj3B4bfxaaQ4ZFaQk+5Ks3AZ
	gA6U9hiuCqPSaI9gvma/o8cYi5K5yOO0jgpPB3sG4LE8MAVYqsC88o0LwRXC/wAIgjm5dCmjesG
	HLdGlxHAT3Mbs=
X-Received: by 2002:a05:600c:4e56:b0:480:53ce:45d3 with SMTP id 5b1f17b1804b1-482db47cdc5mr122394605e9.18.1770019552325;
        Mon, 02 Feb 2026 00:05:52 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:51 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] usb: phy: tegra: parametrize HSIC PTS value
Date: Mon,  2 Feb 2026 10:05:25 +0200
Message-ID: <20260202080526.23487-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202080526.23487-1-clamor95@gmail.com>
References: <20260202080526.23487-1-clamor95@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-32987-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,nvidia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 929B2C986F
X-Rspamd-Action: no action

The parallel transceiver select used in HSIC mode differs on Tegra20,
where it uses the UTMI value (0), whereas Tegra30+ uses a dedicated HSIC
value. Reflect this in the SoC config.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 7 +++----
 include/linux/usb/tegra_usb_phy.h | 2 ++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 6173b240c3ea..812d99443180 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -957,10 +957,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + USB_USBMODE);
 	}
 
-	if (phy->soc_config->has_hostpc)
-		set_pts(phy, TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC);
-	else
-		set_pts(phy, 0);
+	set_pts(phy, phy->soc_config->uhsic_pts_value);
 
 	val = readl_relaxed(base + USB_TXFILLTUNING);
 	if ((val & USB_FIFO_TXFILL_MASK) != USB_FIFO_TXFILL_THRES(0x10)) {
@@ -1474,6 +1471,7 @@ static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.requires_pmc_ao_power_up = false,
 	.uhsic_registers_offset = 0,
 	.uhsic_tx_rtune = 0, /* 40 ohm */
+	.uhsic_pts_value = 0, /* UTMI */
 };
 
 static const struct tegra_phy_soc_config tegra30_soc_config = {
@@ -1484,6 +1482,7 @@ static const struct tegra_phy_soc_config tegra30_soc_config = {
 	.requires_pmc_ao_power_up = true,
 	.uhsic_registers_offset = 0x400,
 	.uhsic_tx_rtune = 8,  /* 50 ohm */
+	.uhsic_pts_value = TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC,
 };
 
 static const struct of_device_id tegra_usb_phy_id_table[] = {
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index fbdd2dcb3a2b..81d9f22e58b5 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -27,6 +27,7 @@ struct gpio_desc;
  * uhsic_registers_offset: for Tegra30+ where HSIC registers were offset
  *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on PHY2
  * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/PMOS driver
+ * uhsic_pts_value: parallel transceiver select enumeration value
  */
 
 struct tegra_phy_soc_config {
@@ -37,6 +38,7 @@ struct tegra_phy_soc_config {
 	bool requires_pmc_ao_power_up;
 	u32 uhsic_registers_offset;
 	u32 uhsic_tx_rtune;
+	u32 uhsic_pts_value;
 };
 
 struct tegra_utmip_config {
-- 
2.51.0


