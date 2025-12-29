Return-Path: <linux-usb+bounces-31809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D1CE7DC6
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 19:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88B273038058
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 18:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB4633A031;
	Mon, 29 Dec 2025 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="LxExKaDF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C543396FA
	for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033629; cv=none; b=WqjM5jB/8qj1nVJsn8RYYpM0wboVY9mLy/Qj4ZaL6IFiQnJfZtyyjDNJj7YYsQ7+X6x0oqL2xULnNMLgCJOxgGc8orjRhi1tidbMvDCAVWiHrcZ75P9DoIPOnNcC5ya4+FPg1EMOGSPuKmtKt8wWARfPB0GrMFJJMzJ4NHlgy+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033629; c=relaxed/simple;
	bh=FesjP41xiT0Kda2nCLhQhKtJNrqGgysPl3yJ23vj64A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJlthnzxZjlGdI/jJkOuG27JbqAuYRrlqhRO8ZISCnl3yQEDU6zOaRZA+OBT0FcXb8DaH3nD4OnIrFkhg7muxSD0IM/pLVme3lE88J4wNbdUxhXuUCSiXKhsGVAo1V/86wzbSiIwkJCGZOCvMByOXGsIoCh5rlHAgDtRoGiZObg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=LxExKaDF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477770019e4so78728765e9.3
        for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 10:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033625; x=1767638425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=LxExKaDFv6uraKbr+yups4L5dBCWndQ+BVeBeBthUnl/mH1kB4Ls9qNN/M3IYMPAeB
         7kliaa7Cr3EJ8W5qDWd9PWb+ZEaXk+HiIoJyIECYHKmRu34OFvZx/eQumReZG/4jfPVs
         ciQ8mZnqyCEXea8WhUxwJAkOL6ARc1YKP3d+MpkUSl8kuAd7McX033YEB5aETP95086G
         Smo1X2VH+HzwgbCOwr0Wqkyd2ETC2NVtxkCG7MV+59lO6D5d4cIjBoaYzPcHP1mfv2rL
         QRf6Wt9KFjJRrMVVPHbUmfwIZMAmyrBtexsip9mnS0FU/TNf8Mzcx4Zc67iLbTlJLTqE
         oS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033625; x=1767638425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=DE4iDHqCfA3cxsRPDWuUZJ2hPZe2Yv7mJSeFV6j6WhRCKcJ0zGISGlAYMqzDpfDqNg
         EPxaZhanxC+fP2ZssiB14MRg/uYgDXq72uBWMBb9/RFbJQ9zv81FliE9dvp2Ax++Q8ns
         sxlhzo4kIpg8r9RW4Giq9dU1Mzxe1GaSCddhuMAjdEPWoKD8WoMiFF/7rxcAWY82UXcr
         DeGKpVoFo3XGmBsIcDrcsTs6wLUm6LXlWtLa93wOH1sGPww5+rSPNfCaG4V7HYVvx+7Y
         wmYzdpaZEwInzuC+Q2UDLseW4/E4B/EOnvF8YGZ0tew/Ax7oQD6RJZrS2jRfoGJy/btp
         spEw==
X-Forwarded-Encrypted: i=1; AJvYcCUA1IxM9zmI5qeGcSu/k3ETvUBvrSSNsgb4G+y7enEVgGdtcuot4b9wWYBbYEoUKd6UpvmLcYD9/Po=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM9nlseFc/RlwMkzX4srK84RyulzsWi4bIY9e1qjfAWW+kW31D
	fEPrbOB8YKEbZlut2rvbMgTrvhp+zQajHWgln3pEKZHbWEkWuEqKzpu6s2T49vhQevQ=
X-Gm-Gg: AY/fxX55lzz0Pwt75d02wbf3ee+Ttj+1eZNqiNLXf8bF75s4DFAkYZyFx8JipzaaEwk
	jRnakk4d3CNrk4U4rMclL8FVcEikgveaY8VNhnV3toulA1XPVwKvTRheTIOgLQZLWkKBzhX7kBR
	tzxFKqrZLwniVC9oOfuOyePKPlhjev9FJ79sxNnqbuSdtKxGzxcjiuzs8CjHO8n/Oazy6uHJE2Y
	q+dGJEDIFKU9Wn02qIwFsCjB/GhAds4zt9lpsXsPFibcLrF9rn7z1xbCdvF+rqxNi7j+qc00cc1
	4mpXSfazb0Kr2Zvc5O6AZBKcl42qXnsv9k+CAbFphnTGvOlwEfb3KNpbFy23i5nINGB4oeslxPI
	kZmVm3mxyIwlUAvl1dXUCqh9c1rG/apOG1I7DoBxaGst1npIu9B3TEPHFfLAhgQIrENAzrD+0zM
	Rbxl/ShZxMAZg5KijbGxoDOyJ/i+I3YMims6Oro1g1HE+pSJ5RKRP/hvRlIyg/9rSUiq99xAciD
	gdQ+kEn0RTiBmI9kCraaBG80PcqN3NdtYoLMEs=
X-Google-Smtp-Source: AGHT+IE/qB6NEHP1QqGV5PfcwRRofx95tVM5do9NhE19foMR/57boxHx8KStBk+G0GxCGRT1W9RoKA==
X-Received: by 2002:a05:600c:444b:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-47d1953b77fmr317021115e9.5.1767033624761;
        Mon, 29 Dec 2025 10:40:24 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:24 -0800 (PST)
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
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 06/15] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Mon, 29 Dec 2025 19:37:47 +0100
Message-ID: <20251229184004.571837-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
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


