Return-Path: <linux-usb+bounces-17866-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701F9D942C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 10:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 555911637B3
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 09:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D532D1CF2A5;
	Tue, 26 Nov 2024 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IirP2PBv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F931CBEA4
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612878; cv=none; b=MMIQaUHnBD+N1Hw7jDLvAzab6HjEDGPVhedtVoEy1iY1+QDvB4250biatzDjZ2GhqSc3tpbi52mX73UqjKz2BpaZ9W8qQBHxFhVps/eKrJC7CFzvyp7MBJCsXYrBGCzJdldMi7GFG63sb1DJr/G4bXmwzg3Agtp8QeZ8PFpblkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612878; c=relaxed/simple;
	bh=4F232ENECAOLomVUSY8tBxTq5zAbQQSu7jUMFMN+Pp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sGiGbQh0JHy7G6Ci/eV83BxKL4zAN4SD2JBqR5x6Px7XWkMj9uSD/S4xLoJfCN0DBUPaT9qI8szUB4gblYyZd8BcC2viKR3o+Lat1C3B5Ey79fyddr6KaKkETlIDCQcfYwR81YmZIujCoKtleGwXYsmApCnPZq096xs+7VgWagY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IirP2PBv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso67086825e9.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612874; x=1733217674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKW3EfLpg9xj1NAX34ulRBb1/poqN6qEBq3WFAZfenM=;
        b=IirP2PBvcho0H6iTKUBPqaFzZSLbr1s7FmnuIkmTtgERTsDdFAzdIRHukfAB2WgkpW
         3vGQapU8wAhXsndg+PAL+Mt3Y0nI5ePH+lHgwdVr29Lmf12twCqc0vR/ABqtQvET9ICv
         ZgXCMAPJdtcginb9Hy+pvQf6zGMIhJhbuv9PaNW3sS0SF4luQBW3CIvAN5+sHujMMCbZ
         DZjj1EBi/vf0xotjebPF8mbkXsZ/5+GtFUXqPEnnQ3XH9SxrlFxc1ceFghiUYRAnZvJR
         F6U9iXNYMBbXmP1x5wJbzMroauFk030pDfTT2bnCCa9snMx7W6fNONnlSsML246LhHnu
         wnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612874; x=1733217674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKW3EfLpg9xj1NAX34ulRBb1/poqN6qEBq3WFAZfenM=;
        b=sfWtT8bBT1y6+Z94ecukUsRAEwwrz6BUQTYM+toc87aP3Fsbm9QaowFvaAnJ39tNuu
         Ze73aUxtt5U5pNsYApxp0m2a1tnYcvjnXEsg1Ed12o3Rs63EjIY1Ku6hZbvr87+Xf+lq
         //FnUCcpljdGoRWckT+2giMUvV5mAlzLdAefaSyXRVjHsWdNraFUmNV83Vhc9FryhrEe
         QClXv3OYs6EbXoolF+N2loosbVlw9b8kLoz0IpfYeC4ihhjSxE5n9Ad8cHQn3wedjKhl
         nYFwbkFds7TfnrxNbVyqw4ekd2Mw4N6i5LCO+SefB58/vnBFJ4TbwmPF96YQ+NeI/vat
         IETw==
X-Forwarded-Encrypted: i=1; AJvYcCVhc4wkurYD7Mg50M0dUX8yWt8Q6U7v2ab4Plxo3RxlC+Ad+R5U4/rJ4qQPwdKD1qCuooYJvMAa5UI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjaEe1deeC7rrqGf2YqVEXsLrYIhfQvq6kXUN88s0U/oNptORB
	P6NR8aviT7cliPkwSCox6S2iN9CCYQNj8drZkkYq7ccopzMt+coB2333Cx0tPZY=
X-Gm-Gg: ASbGncvqDFjwIUehZlcg7A4dIoYCERoaRjMoaxM24N931BqUcTDaJwTjD5naw+Dvzy+
	i9Wpl3gG4QfIymcamq0rd6koHZxXVd/s07u74P7VOh5LjMuoVADWIcN1heo/Rgp3mGUSKkNc2qy
	sRzKoOvds6Rc/0b0HOvwBblEYYUhXfdxoAwRj1erHp1WeDYT4dSOBkRVt2H9NDLicv1mZpLIuKH
	IWMhxzKsd0IFhvt9pNJ2B4eoTib8swAFA2dbAsKRseMbf5Jxdeuem2QOyDDQHM4xly6JRbK8fpE
	nqE=
X-Google-Smtp-Source: AGHT+IE7w+dBoCGCxxbUApCfNcapHwRVn5rVPYIN6Suv5fX7t/i3bspO7Ak4XFCK5NYSFpFy53f9sQ==
X-Received: by 2002:a05:600c:5122:b0:428:d31:ef25 with SMTP id 5b1f17b1804b1-433ce41ffc9mr177417025e9.12.1732612874002;
        Tue, 26 Nov 2024 01:21:14 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:13 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 05/15] soc: renesas: rz-sysc: Move RZ/G3S SoC detection to the SYSC driver
Date: Tue, 26 Nov 2024 11:20:40 +0200
Message-Id: <20241126092050.1825607-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Now that we have SoC detection in the RZ SYSC driver, move the RZ/G3S
SoC detection to it. The SYSC provides SoC ID in its own registers.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this was handled though patch 05/16 in v1 
- provide SoC specific init data through the SoC specific driver

 drivers/soc/renesas/r9a08g045-sysc.c | 12 ++++++++++++
 drivers/soc/renesas/renesas-soc.c    | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index ceea738aee72..81970db300b2 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -11,6 +11,9 @@
 
 #include "rz-sysc.h"
 
+#define SYS_LSI_DEVID		0xa04
+#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
+#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
 #define SYS_USB_PWRRDY		0xd70
 #define SYS_USB_PWRRDY_PWRRDY_N	BIT(0)
 #define SYS_MAX_REG		0xe20
@@ -24,7 +27,16 @@ static const struct rz_sysc_signal_init_data rzg3s_sysc_signals_init_data[] __in
 	}
 };
 
+static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initconst = {
+	.family = "RZ/G3S",
+	.id = 0x85e0447,
+	.offset = SYS_LSI_DEVID,
+	.revision_mask = SYS_LSI_DEVID_REV,
+	.specific_id_mask = SYS_LSI_DEVID_SPECIFIC
+};
+
 const struct rz_sysc_init_data rzg3s_sysc_init_data = {
+	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
 	.signals_init_data = rzg3s_sysc_signals_init_data,
 	.num_signals = ARRAY_SIZE(rzg3s_sysc_signals_init_data),
 	.max_register_offset = SYS_MAX_REG,
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 172d59e6fbcf..425d9037dcd0 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -71,10 +71,6 @@ static const struct renesas_family fam_rzg2ul __initconst __maybe_unused = {
 	.name	= "RZ/G2UL",
 };
 
-static const struct renesas_family fam_rzg3s __initconst __maybe_unused = {
-	.name	= "RZ/G3S",
-};
-
 static const struct renesas_family fam_rzv2h __initconst __maybe_unused = {
 	.name	= "RZ/V2H",
 };
@@ -176,11 +172,6 @@ static const struct renesas_soc soc_rz_g2ul __initconst __maybe_unused = {
 	.id     = 0x8450447,
 };
 
-static const struct renesas_soc soc_rz_g3s __initconst __maybe_unused = {
-	.family = &fam_rzg3s,
-	.id	= 0x85e0447,
-};
-
 static const struct renesas_soc soc_rz_v2h __initconst __maybe_unused = {
 	.family = &fam_rzv2h,
 	.id     = 0x847a447,
@@ -410,9 +401,6 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R9A07G054
 	{ .compatible = "renesas,r9a07g054",	.data = &soc_rz_v2l },
 #endif
-#ifdef CONFIG_ARCH_R9A08G045
-	{ .compatible = "renesas,r9a08g045",	.data = &soc_rz_g3s },
-#endif
 #ifdef CONFIG_ARCH_R9A09G011
 	{ .compatible = "renesas,r9a09g011",	.data = &soc_rz_v2m },
 #endif
-- 
2.39.2


