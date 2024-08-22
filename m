Return-Path: <linux-usb+bounces-13900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C877195BA76
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 17:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 737B91F24170
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 15:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD601D1F6D;
	Thu, 22 Aug 2024 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eNET13nc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DE81D1F43
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340532; cv=none; b=XySXtbBTOq7K4m2M469aTYcpOxNCJuZBRTgPBSo7ju/Sx3yPdCpzyoMSv21kLuupgdnnvy3kLPQWtbNq7bC/iQM7j7AIFF54QE4MnctboxdbjeyD4Qtac+W/cJUAbJNBsRku4zztlr491q83uVh+EN+VGMroSQnJYjTU7+YeNhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340532; c=relaxed/simple;
	bh=EuKZSKvEQCXDCZNoMj0d43yKeS+Y83/X3kJnCx6rqMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BKlL1nflk7wQFLnqYy99KxFzCS7mRZLH+MVYj2LmfrtaKQB6nKbCMph3oE2rUe3Qa/LAJ9ERK1hR1+IrGOHlkYeRZDAaFf6hu72btVkHfJUpzFXNmNIQe2ewar/VuSKGp6ZIO4Cmwuvuv/Bts4O+WQSSh++p00HOnbCAOcqJ24M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eNET13nc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42ab99fb45dso9504755e9.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340530; x=1724945330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzzVJZseYqmAj3uluQhRMecpWI1dTsj4zEH1FZKD0d4=;
        b=eNET13ncH98OLgbcdG0m6G74QdeBkl8ixJZo/ljhZqeBccGQmKVF2xjxOfTCK9JqF6
         jskjXJaLSX7pARiTsCNZstW3xjf2GH+X03ldyAeJjGcAc5nUkmOy/mBnGw1utLurYAkS
         du7Rt4CBkpic6xozXZ6BCihFhHIHyfzVGS2u3PZghi9I7RI9OUHy8hAxENHmVmwZFFNC
         wpCTHMj97ffi4DP6tpXp34qtdAke1+gnCtc88qDa+74iGJCcSqaXI32t/7PDWlkTJIaG
         Qt2Px8RBAoaWVk72CUoWckj5vp6z5z0m1AE37fhec+fuSEdOy8R8oTCIfy31Tb/bF1Kw
         3uFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340530; x=1724945330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzzVJZseYqmAj3uluQhRMecpWI1dTsj4zEH1FZKD0d4=;
        b=LIhgASNorjzYhxM4pTuSMWHJWzIzXyAn7861cakrmXMYzV16NTvPrPsqilx1EzzAys
         VBrUD+2+UcYBRhYu+WV7XnxQE0BAI9CEliAFxpzO0r7vNc9JDncFJc1Dm6ZBHYgVzdUl
         Qxv/1iAXPXl54nCzVYIKhCJe+5bJEW2pOEhP0lmBWvYmj6y/AwvV4vAPJklzsgS2zIxu
         XQB4+EhzFY+oomizMB0pG8zlKwNx+0Dg55ypkcS5vJkQNROLX+h/G7j7/fqA0IIu2eog
         v3B6mKUEor8brczSS7lrqasT+g3iuWqadOKUU+dgVKEKHhu90SHmOOY5FkE/y9UzoeJn
         JisA==
X-Forwarded-Encrypted: i=1; AJvYcCWYJYzPWu918dr1mf4H5L83mAHK4ZlRWwLwDk/kO3FtryzhksPqMBwqRhi2k7euJwBCqZYFRR0N7k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzXTiNpS35KbMkjMZ83bOgreQbxPf3gCwdNV06wTyTT0RfpJjP
	aKyElKvVdN6e4JiKoIl2/E5xYDsnVkX/m1IUqERZFpzV1pYjKMrDxhILhxxeVL8=
X-Google-Smtp-Source: AGHT+IHCUCn+biQIAnOUlxWOCjXAVeKX8ey9d7uY1NWlOsuugSxvOZNpC2pcgsn0KfGk8KOYuf8lZQ==
X-Received: by 2002:adf:a416:0:b0:36b:3395:5363 with SMTP id ffacd0b85a97d-37308c1826emr1937317f8f.16.1724340529907;
        Thu, 22 Aug 2024 08:28:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:49 -0700 (PDT)
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
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 16/16] arm64: defconfig: Enable RZ/G3S SYSC reset driver
Date: Thu, 22 Aug 2024 18:28:01 +0300
Message-Id: <20240822152801.602318-17-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable RZ/G3S SYSC reset driver. This exports the control to 2 signals
(one for USB, one for PCI).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d32fca64996..4720367a41ea 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1510,6 +1510,7 @@ CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
+CONFIG_RESET_RZG3S_SYSC=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
-- 
2.39.2


