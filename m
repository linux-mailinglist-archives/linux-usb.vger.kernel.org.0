Return-Path: <linux-usb+bounces-31726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D26CDA980
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 21:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181FE30B446A
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E99E34F465;
	Tue, 23 Dec 2025 20:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ZccbyyzW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DEE34EEEB
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 20:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521245; cv=none; b=Hc073lWx5fgLqWTEjfLEMwDBYg0V8vN+UlpoS2zVOYTziOdcU9+bFolIzSZgTLDi0syQ4m7FqOHPeY8b7oG+ndvRoWgnVElPKdMr9swlMjf75fP4c3mOanLDAzYClmZ/Iw7O2I63AVlfS55T4PnzvSB89KM8Wwv43UPgzuSNVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521245; c=relaxed/simple;
	bh=FesjP41xiT0Kda2nCLhQhKtJNrqGgysPl3yJ23vj64A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKmqFDDkXIRyBvGfBVVGtWntTO/CBAt/jfcpKx0yxrrzY70KV1enRmF56icVlRbQtkqLFvtt91VQGmKlzx4uuau15RMHohvsxIyqQBFXD6W+Fd6g9DD3j2iWZnrcYAKE77zsQsn49HOHnRIUUtGfHXtGjccpF9E8zEBcxibX70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ZccbyyzW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so5735196b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 12:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521241; x=1767126041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=ZccbyyzW2lxJMbJYlm/wBafWsE2XB2bAypOFFnOukvOGI4F8bnHvNijeGAjtavqUGB
         p0NANjErF7ofDVkrLy/JmBZttd7li18QNaynTXMtfLOpiv0nuWEKeVd6DYSHktO1ISNl
         6HyxFIVBPwLfGivhk+/vTFkVzBO162ZkHkA0Jkp141/OWZ4XiUFeOAFelEoZvX1rskGB
         Wmk7CX8M65WvlFHXo4cHRpqzkjaDkKV3yp4+zvmH9jj17QAzZ6OaiuFPVXcNUQshasmH
         a2wdlKOVQBgvLOgq5SEy9w7xvNTCfKQBAhS5xqnESy2htUeDknWhV2G8qFo/rgWWwYNn
         KE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521241; x=1767126041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=clmXNaawk3xzJeXb11komfD1IyoVM3vBvcjEYc2jHPg6WRv8GqX1FCYbz8SfMete+g
         1Jk51g6c+J42jEADMS54vLSFjH8Ha1VDv74cRWkto4QNnW1GwlSdjQEwhkP8j/S0fj2R
         q2aosAoMDcJeRZqMsycaEOSP0mhs40HWs6D9eE0s6sTcZ1n56DD5iwrwbaC5Km8TC2iE
         SqilOyT34BxKFosK+DvYgTOao/MUuwgapdWqbPggcQWWN/ZRrUc/HXioaFwLNRDW2fwm
         xtKGreFNRpIAmjVlrrsId5cKsM0rvowtTT5loSTCthjWzYIDoWjAZMraTIGhjSY3MlnR
         MuWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/LSfKxc6/ixK/sBh9GrVioQjjXfb0lUEwUBQxQFG/dfY5erZrjJgn8ZqFsE/eUtW8MUwh5HJCMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsHpNQuIuFPfB7taImKLkFCLCAGhTmv3u+UWxRTPTJ/Vwc5vFg
	XtPznD/CR5aMFJU0mtb4DAJPx7w4VNXE4AbwG8JiQVhfAN2ILn9kM9fUgJgT8EP+AZ4=
X-Gm-Gg: AY/fxX573NHVpiaZBbL1H++a8ZRvSiqMKE3rqZnsH9WDBvgBrhAzHAu1UGJQg/2awJQ
	ZjNhrEOImoq2Rh6m4AzADeecCm9l6MwyhDbxipGgNtMv29F/f0Y7Sr3NhJZ0xSoqBzBoKunf2Tw
	3oau4TG9tudkl/msER+uZd5c94J4toz4Dali6tClp1hvdWVcGATy624xP7p8SAbNtzpfJkwfB6d
	pl/21yYst63X2pYcVgY2k1oZo23JJPXorjq2q7SVWw7Xlv21VCcX1GvS7JKF/7Qu4G7wqDUUHq4
	vL767ct4yaNYNSeN8eSVxI7J7r3EJYabn29pL8hPRcP+bYeTsuDNJD8t7poqthbCW/Vgfd+dM44
	bB0zbx4Ne+wojKHRNlEJDo4g5i8Y8zX6A00+WFbKEcCE4X2veXbBLaG2HuL/SwXTNdtQtfDo6mT
	FOR8X3Nh/IORhPGLKG/M2LBm6+d+t+TFvaA0cahnEg3OTjXtF/DmAx41IrSYot4+nTo1cxSx0FX
	ElInsP0
X-Google-Smtp-Source: AGHT+IGuoAHYa6yGZT2xpCk4O6bUCM8poDOiYCaAoun2Nvyagb0buXaCaJOvoitd+kEUFeEHxHKv2w==
X-Received: by 2002:a05:6a20:9185:b0:343:af1:9a57 with SMTP id adf61e73a8af0-376aa8e98d6mr14530108637.56.1766521241361;
        Tue, 23 Dec 2025 12:20:41 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:40 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 07/15] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Tue, 23 Dec 2025 21:16:18 +0100
Message-ID: <20251223201921.1332786-8-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Microchip LAN9696X TRNG compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
index f78614100ea8..3628251b8c51 100644
--- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
@@ -19,6 +19,7 @@ properties:
           - microchip,sam9x60-trng
       - items:
           - enum:
+              - microchip,lan9691-trng
               - microchip,sama7g5-trng
           - const: atmel,at91sam9g45-trng
       - items:
-- 
2.52.0


