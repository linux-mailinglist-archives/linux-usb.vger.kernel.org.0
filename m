Return-Path: <linux-usb+bounces-32985-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEwXHNhbgGlj7AIAu9opvQ
	(envelope-from <linux-usb+bounces-32985-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:10:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 311EAC9867
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 09:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 236DC3048892
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 08:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABF23148A6;
	Mon,  2 Feb 2026 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtV4qTtz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DF53191A4
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019554; cv=none; b=p5AVrGW8CxXeLZs0LCm4t5yGYrFuzdJXobbpPdg3t2oINfGo96//NRX/nWxNP42SmB3QgMOSqXnuuPTeODVpinmYNcDxy801m8sqVmPoAOf+x0LDqAKE6tvI9Ps6C/bhtAj6++O4KZMv/LzaR55FN6YMFPUp/L82AK/Muev5wnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019554; c=relaxed/simple;
	bh=NthgmsJEUbMoIJI99WoKA7oE7tr2kOG4g+HL24zjOhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggX6RXXOaU9L/ZDkQd7XqNvrBvZ3zcsrtW365D4KFNDkmaykbjWWhzm0pou2/2VZEqdW3vl+nGYpwk+4rh411dae9oKWkIV1KmVH5YZdlc93qt0yaeT/oOfYNrzKyt9LG2QqSOwojNXxQv7LF19FpBaFsPVqRtlWoR6CTTyWuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtV4qTtz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso42210655e9.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 00:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019551; x=1770624351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf4unyiRORlqIaPPXQybFDN9bhdoOYo19zL5kOSCjqE=;
        b=AtV4qTtzRycpMNDYybX6UD2WuLl99a15D7/LrppZ2/Tke8RfT1CCkhjvWFJGIIB7oe
         BH5VoGY8GaTeoqBe5c/y6Q0TT0zZ6LAaiwwTxX2S1R2tw/oYg1ICW3APykTpl3g5neWy
         g1nnWl1NWe5l1WkZuqaFt8bEmGur249h9e0LNRYegk7ASfIUjuejRcFLKOQtAEvhR3xC
         ZHo1caT3f9JbXz8b1bZ0+XI2vHl4uyW1sD3Jvt0m8Y/ifOSj2fojJt+Cer7QNSV3erGI
         tTgwicupGV3W2X2dwQwZk7AgJdyXHed/9NR8lp5cav87dktSKmZaBXa+qy+vRwfP+s3/
         dHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019551; x=1770624351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zf4unyiRORlqIaPPXQybFDN9bhdoOYo19zL5kOSCjqE=;
        b=Wbn3L1dAX3FuDpClJWOqf6vVXFt7RdlFsqK8FswlDPNzQTRGNBTGIP8EcosvZ0sGee
         33UTTepYb+TS3+ZkrU8i662Ln8xQVjkGdIDwmVN2q5Wu8BIz/Du4Fo2Y3kiWRiQExZpd
         hycLCtxfz58mrkp6pgj5gnOaSYd7rYO7qcGXyDBpoT1O+Is2R3cEtMsnK6Kj6L5wnmfa
         0o/eRZFQcNMCjeeAcc2w6MXEvQq5Mc0CYtgSPcN4hdU1E0HVioOhyxwgGCPxKXqFUvtY
         HD2ytbQJjEyxQJMO6b0G+ZY4nZwq4bcC33iTBp7w0El7e0smInQNPb6O+VwweEU9ci4+
         uAwg==
X-Gm-Message-State: AOJu0YzmDQO3/ue9+jZgqExa4SmeS8Ni5I9IBkMYNMXt7jtf20QYDKEF
	T8SBKAZEiiP2pkMGtMdyXUR5K3AC/AGSS1oxGtCUm8fY1jAPchoJBF/a
X-Gm-Gg: AZuq6aKY03DqbvxDNG7I7TA3R6r+TY5kZaYkODcu4V2TESVGZyXUxNbP+zXTJaLqVpV
	MiuoJ59PjA0lcvVLmSSN1HylOG3Rt1J4eQ7fdx+2hTsdsXusQFsJIa7c35rg76rvmygPrHQOLET
	KxNMi+MYd0TnpmOXhooUKHrtO+m2WIzgS47sg/uLrCmFOe5TMAl8G7RKeqBMvmISQTvF5dIwekZ
	uyFEau2YOHZRCTvXps3ug4aXlzlx4GAHaeBtBb1k9VspjkKh1ThP62qNb/GHe0QK2R1XpNEc4DT
	p4kEoVbpBZJ6Xfb6fSrD09VjWiaXKufvd+NKzQkToFsO/nR1K3oxFFi0iLB+g8cg6eIruNwrZh2
	BVyrNJ4iS61i87PjoKsrHqd3uMTFmunfyAjRNzbNX+qFXEoy7ls3oQHh0yqIp8xHF98p9ycZluh
	vr+xlQMn8YjEQ=
X-Received: by 2002:a05:600c:1e89:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-482db4ac0f4mr131691325e9.34.1770019550545;
        Mon, 02 Feb 2026 00:05:50 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:50 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] usb: phy: tegra: cosmetic fixes
Date: Mon,  2 Feb 2026 10:05:23 +0200
Message-ID: <20260202080526.23487-2-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-32985-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 311EAC9867
X-Rspamd-Action: no action

Change TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC to its literal value instead of
using the BIT macro, as it is an enumeration. Correct the spelling in the
comment and rename uhsic_registers_shift to uhsic_registers_offset.
These changes are cosmetic and do not affect code behavior.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 12 ++++++------
 include/linux/usb/tegra_usb_phy.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index effa767ec019..3a7a74f01d1c 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -48,7 +48,7 @@
 #define TEGRA_USB_HOSTPC1_DEVLC			0x1b4
 #define   TEGRA_USB_HOSTPC1_DEVLC_PTS(x)	(((x) & 0x7) << 29)
 #define   TEGRA_USB_HOSTPC1_DEVLC_PHCD		BIT(22)
-#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC	BIT(2)
+#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC	4
 
 /* Bits of PORTSC1, which will get cleared by writing 1 into them */
 #define TEGRA_PORTSC1_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_OCC)
@@ -169,7 +169,7 @@
 /*
  * Tegra20 has no UTMIP registers on PHY2 and UHSIC registers start from 0x800
  * just where UTMIP registers should have been. This is the case only with Tegra20
- * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers shifter by 0x400
+ * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers are shifted by 0x400
  * to 0xc00, but register layout is preserved.
  */
 #define UHSIC_PLL_CFG1				0x804
@@ -873,7 +873,7 @@ static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
 {
 	void __iomem *base = phy->regs;
-	u32 shift = phy->soc_config->uhsic_registers_shift;
+	u32 shift = phy->soc_config->uhsic_registers_offset;
 
 	return readl_relaxed(base + shift + reg);
 }
@@ -881,7 +881,7 @@ static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
 static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg, u32 value)
 {
 	void __iomem *base = phy->regs;
-	u32 shift = phy->soc_config->uhsic_registers_shift;
+	u32 shift = phy->soc_config->uhsic_registers_offset;
 
 	writel_relaxed(value, base + shift + reg);
 }
@@ -1469,7 +1469,7 @@ static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.requires_usbmode_setup = false,
 	.requires_extra_tuning_parameters = false,
 	.requires_pmc_ao_power_up = false,
-	.uhsic_registers_shift = 0,
+	.uhsic_registers_offset = 0,
 	.uhsic_tx_rtune = 0, /* 40 ohm */
 };
 
@@ -1479,7 +1479,7 @@ static const struct tegra_phy_soc_config tegra30_soc_config = {
 	.requires_usbmode_setup = true,
 	.requires_extra_tuning_parameters = true,
 	.requires_pmc_ao_power_up = true,
-	.uhsic_registers_shift = 0x400,
+	.uhsic_registers_offset = 0x400,
 	.uhsic_tx_rtune = 8,  /* 50 ohm */
 };
 
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 1a8843bd1e95..fbdd2dcb3a2b 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -24,7 +24,7 @@ struct gpio_desc;
  * requires_extra_tuning_parameters: true if xcvr_hsslew, hssquelch_level
  *      and hsdiscon_level should be set for adequate signal quality
  * requires_pmc_ao_power_up: true if USB AO is powered down by default
- * uhsic_registers_shift: for Tegra30+ where HSIC registers were shifted
+ * uhsic_registers_offset: for Tegra30+ where HSIC registers were offset
  *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on PHY2
  * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/PMOS driver
  */
@@ -35,7 +35,7 @@ struct tegra_phy_soc_config {
 	bool requires_usbmode_setup;
 	bool requires_extra_tuning_parameters;
 	bool requires_pmc_ao_power_up;
-	u32 uhsic_registers_shift;
+	u32 uhsic_registers_offset;
 	u32 uhsic_tx_rtune;
 };
 
-- 
2.51.0


