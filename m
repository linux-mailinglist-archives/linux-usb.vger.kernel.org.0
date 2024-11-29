Return-Path: <linux-usb+bounces-17906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F789DA677
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 12:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 249A32833A7
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 11:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183751F428D;
	Wed, 27 Nov 2024 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ek/iInXD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350A01EC001
	for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705308; cv=none; b=ecHZK2GQnX/A7obVCsXG/i61un4d3RRpbKRRK0YiRRSVkPoiN543OiIOx67VOVjLM3eRUyVYPpczU0Z/kcDGMTJjAqkbcCEZmYakwgxxbHQf7/esdIMpe/ANmOPEPofIKBa0NHONrnNZAjNjQSVYu3YS3E4poW8dD6futD6nkK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705308; c=relaxed/simple;
	bh=bBXu9c7nBHpZKJ9tgZ+XFFWkeWIErIUAUyFvGXzCs78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yw70S28xG4CAMuIk1S8tkP09M99HSKsYhB/lPMlPklRl0pMuhyXlAqqzm+bHrpQ+qmi0dXNRoUmhNqO28xwVthK1cfpwFxKCAYHy8r4Br/THLPcOQHzNvWxF/+UEyTe4aCqF2+ML6mwfed6kkMNMlF0S6QuwmkEBVsLrf5+1bW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ek/iInXD; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa52bb7beceso554640066b.3
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 03:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705304; x=1733310104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4erez+OR7MplArQbIopexB2PZBOe/GVnXjpG92loz8=;
        b=Ek/iInXDPa10EYC1+Qwd3jtui+ru3GP9vYb8vVBcViImFE4VyJYb8MKXaFZppA8yJ1
         8eiExOfBdu5rGv7QyTEIarZNhXrPbIJ7o8jPWGxpCojessVj7wyZABVEjYLqVlEENfj1
         8LhINXCnnb4lh6wzp8Wa4MjYCae9Yp7Ll9UwP44P4qAa4BO4+xldb/vkotwtWtpPgPye
         2Oh65X+IKpHQ6cUnk7G4mjMKBof4PaMwrCA7VL0IuoeTJVt9iXYextPiAv6ZKTjAhSo7
         hinCcVd2qr1V5CkAOR1UYRgZb4CW4PzCNKgqBCk0vWhi5tEJkrsa9hgG2xoEQMM3FAcK
         SxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705304; x=1733310104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4erez+OR7MplArQbIopexB2PZBOe/GVnXjpG92loz8=;
        b=N8JlNmFgbqUzRo3xT9ESMs1iJzOqXAejmx7NRs0us3j5klgtVFh0OOdXQ5zTARH8Fz
         LmXlZMYYfKRaJJ59Xw6t6nrlX3UBRN5stctoB2NooGkzUhUQBUMdO8XFwxX3zsr9vAsp
         VcQ8zW7NfzICtclEUc+6GLIHzcnMn3bWiUaPH/UtlRrcRH+0exBhqqGpvHemo++BuLSX
         E0xOGscR2CMhkjy43aOPX+4N3RimNQtUe124jPYLh1X24nRBArN73wOFQgTjsq1OAyiH
         +udmjrBY+g3e7wYcxvHrvVMlrEE7ANgM0m2XrQVEkhew/z7Sf3Y66DGiDyKRDLelcbXF
         /+9g==
X-Forwarded-Encrypted: i=1; AJvYcCXyNnTJd415Gw0UxjGamPdZuoYvl6QqrWqOX1kUmfpejfG0wjIhecExKnjY55VQjT75SRSXf1DY8Zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmaL7l6vSn4PvceepKQwZ2Jvs/SnL6wBObNrpl1W3Ewq7Cx0D
	oVRXg2pZEpUv4BldwWPOdptuTeXaQLU9m4h4EhE5hsR72VW2daFDWhsMdnQkSdI=
X-Gm-Gg: ASbGnct+VnuqsC6tqCxwQsNKBWGuBebggSi8CAWHx4h0BRaHaOppWQmiBCzMI1ig7Dd
	Vd3dtpgtMXA16vPUGKLTVkPn0FqtEjj9I876TtEQLOqmoqgX478UhXIqSiegq6ANInShp3x597S
	Ggy8J4Ez+ibgLC5a/g1zokNcHmFwVDC9vd8xsx2aB+V71zw7L6c/ghzQERGPO5pxg+1acYnAGRM
	IxuKx4xhfykN5f1MwFkSMaTIloj0SvUd8mgNdMQuXYZYQqytDcKwh9nbffdmpch++I6QSeykfRM
	xDgN6rCJ0xyds+G2/Knnedj3n+hfNMNnHw==
X-Google-Smtp-Source: AGHT+IGqpdrPnW3Rg6CugXIox+EqlkbBd+gvIfh6uKjWCcF5TRZPn4bamon8RUhLocSTA4S61CGyGQ==
X-Received: by 2002:a17:906:18a1:b0:aa5:3663:64be with SMTP id a640c23a62f3a-aa581028c94mr151558766b.43.1732705304136;
        Wed, 27 Nov 2024 03:01:44 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:44 +0000
Subject: [PATCH 6/6] arm64: dts: exynos: gs101-oriole: add pd-disable and
 typec-power-opmode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-6-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

When the serial console is enabled, we need to disable power delivery
since serial uses the SBU1/2 pins and appears to confuse the TCPCI,
resulting in endless interrupts.

For now, change the DT such that the serial console continues working.

Note1: We can not have both typec-power-opmode and
new-source-frs-typec-current active at the same time, as otherwise DT
binding checks complain.

Note2: When using a downstream DT, the Pixel boot-loader will modify
the DT accordingly before boot, but for this upstream DT it doesn't
know where to find the TCPCI node. The intention is for this commit to
be reverted once an updated Pixel boot-loader becomes available.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 5f7be0cb7418..ef9ccd149b6f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -107,7 +107,6 @@ connector {
 			self-powered;
 			try-power-role = "sink";
 			op-sink-microwatt = <2600000>;
-			new-source-frs-typec-current = <FRS_5V_1P5A>;
 			slow-charger-loop;
 			/*
 			 * max77759 operating in reverse boost mode (0xA) can
@@ -146,6 +145,12 @@ VDO_DFP(DFP_VDO_VER1_1,
 						0, 0, 0x18d1)
 					VDO_CERT(0x0)
 					VDO_PRODUCT(0x4ee1, 0x0)>;
+			/*
+			 * Until bootloader is updated to set those two when
+			 * console is enabled, we disable PD here.
+			 */
+			pd-disable;
+			typec-power-opmode = "default";
 
 			ports {
 				#address-cells = <1>;

-- 
2.47.0.338.g60cca15819-goog


