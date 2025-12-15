Return-Path: <linux-usb+bounces-31459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B83CBF3F5
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 18:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B31E7300F8BE
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 17:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E0733372B;
	Mon, 15 Dec 2025 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="OfUP/ICW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC473328E3
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816743; cv=none; b=R95QdIuyUCIZsnQyWAUfXmghD1CVh7Fn4tM/OyX2b8fevkzk6R+oQJdS8PwlHQ4zMSa4nqK478qEpwhGNhOF6kEJYdde9uNCyfJOutzHR7kME27Wj14BArmeKH+3qvksToaCxyU13J+oj7D3zbm8s3NO94SpDfHmfpPk70+tZ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816743; c=relaxed/simple;
	bh=h4KBW+OqWMvRHvXvtXgMj+kYkCK8alyetopM4+3I/yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1tQD+M606BoXIzqiC1t3WlsYLFOeQ22hew3wGbtTCwQ4URjJZ8zA4H+L8zXU95aeM8a6QHsexuNbetBkN8FPUuTwvVuNAjSjv7Wj2J2VgfUt0MMrkwyWbtkhKCeQs/wdZefMK8vGFTrJ4GAMdj2/Q23isu2pxQ1AiyXoZBubjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=OfUP/ICW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso40410725e9.3
        for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 08:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816731; x=1766421531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRhTYOFBvq7YVDoxsO44nCdQXJPNAFf/GkuN2Aepibs=;
        b=OfUP/ICWkdj/41RG3vUqj76mrUf7etPXv1VDW9TPrcx/pbN/0ZqaNMYefTovfAq9wV
         3gSG8GDVlA8WGkb4XennljmZKT9Z/RdE+rgKupgAE9ynOzGJbZlqiPGhmpSai8gk0W3p
         uYYzMMBKoc7UHytUUyzTeNkoN4zNudPYqNyIVoShBl8b7/SGacT6NopHVw28SMw8Hx0l
         LaHRh1t8Lr9jeU95EHQ8koV0ig+m7rOB4Pq9EG96Z4e3cdYVBy6PsiQXH+aHWKdYkqMb
         /inS/mpHbUwzNkk2NjXNQBGHfdxT78IO7GvrhvprYOc7qAzItPVRLil2MBBtGeAJ1g0U
         0ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816731; x=1766421531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRhTYOFBvq7YVDoxsO44nCdQXJPNAFf/GkuN2Aepibs=;
        b=Qdj/6eD8ybdM17pcmpY3ak4C5mb28EU6kJBtsPHSjtkjCxCQXLFG9+0MsBF7c7qoNB
         PZe6hFsyAk+lli5TyJhz1cP0rckLam4SaO3t39YJHybMjxnF/2JiL7uRvRF6DjTfk6Wf
         2BuIbAFalIErcnDbUOkOZ7GYfMtIf0nzIvagpkTY2Q9pjzsv0Fvh94OBpehZ2kY9ZGrZ
         +rQZaoo2ENomSpnm6KTsT4BvF9c5rQHu+lM5uGdzI664WoIL8ychag7kw0i/6lnGZGmm
         llrRecht7r/LuW9Cs+AXtv2TMGA5QgjDQoIj2qtzPLnEO8rD6pnhCewcYG9FSy3pVVqi
         VK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6PlzXY5ZPjTjAXRurDFjrJjBBR+fJC6Cht/6HvsTl9bYGiaV2GjgkZx8Rknzh3Llzd40w0M/5S6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG42L7BfWuHbSDQS5hDip+4x7v4lf/FNMzDyUWKGkBAbACLfCy
	/0ru0sv+7ph8zqvnMtMUafwQorB9M3SWt4OS8UqXnbj4hH9V+lWTjnuGG1a6FO2pZ5o=
X-Gm-Gg: AY/fxX6gdbAyh4u+VdXKbyEtW3OKahPZrZIcEVJHff9xKtC5agk2b80lKJuAIpn14Sx
	0qPRt1ESyiHiQFJPDelZVKHCZBUFuU4f3nNGHgcfDMypBTkbHwudt57xCetUe7HBKdj+eR5Zc73
	FhGuq5K6Sw5FHHLbzldSDnwlMN0Sw9yCwmsz/W1fb/Qnmyh6+2MldwoGRWmAlQ9fOBDoIr9G6Un
	U5nkpJ8aZEvfa9pu3gdum76GiVfvSyo0UPGCMk3rvxtCHY2v1glMqPY1zTL4yfZGWNpzyl2vAXP
	46EWCVT9QTaY64zkcQl5r6v4QsXjKUigGrJ/lzBIV5lQJB7GYz7QHPtJMint6zNnHxcLwWK5Grg
	HCFUcDW+ID3NE+Q7RAcz8QXdsd1WVkX5WMErrZnhUJR9dfSJ6fOQFWC+LmKPDgA35QdhlnuhyJz
	iIBW79xNsQqb/mrvTnD6Hn3zifYsiQ1RYVlGB0L4c6UF9W
X-Google-Smtp-Source: AGHT+IH8ueFxxMMyV68FeFfRx9NsSwNlL/Ao6Q/rQdEFzAIzqPflgAc/QenJHtj3S1aXhik6vqKjfQ==
X-Received: by 2002:a05:600c:3489:b0:477:95a0:fe95 with SMTP id 5b1f17b1804b1-47bd466121emr3483595e9.24.1765816730643;
        Mon, 15 Dec 2025 08:38:50 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:50 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 10/19] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Mon, 15 Dec 2025 17:35:27 +0100
Message-ID: <20251215163820.1584926-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215163820.1584926-1-robert.marko@sartura.hr>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Microchip LAN9696X TRNG compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
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


