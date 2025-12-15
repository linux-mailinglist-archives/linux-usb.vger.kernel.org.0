Return-Path: <linux-usb+bounces-31461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16327CBF1DA
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 18:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF5153023EB5
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 17:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555C233C1A5;
	Mon, 15 Dec 2025 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="HO5Ey94d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062ED33A000
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816752; cv=none; b=M9f6ZzhoiTKaY5vzvGXqzC+Dv8gj8e1qR6yPz0T6rwt8OG2BbywUpVmTR8/YY5qYLzp0kVT0ZLCJHfthFMpGgPNVaNvXmEu3paeIHoYj53QHZLmFTMIKv2KDF3g242X2PealiU4QxZpCN4irNj+QXUokusfyXPzISvYcrcQEi4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816752; c=relaxed/simple;
	bh=aWtpS5ukM6OTjJwDQlBjaGNr3tNfLPWIVyHdFTQw0ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=derYdny4cq5hKs5F3t7bLPl+LQCG+edcImXUZBe29NSYU0T0Uv300xBQ14hDlNIfb8GTf0ghriwKIk7tKgJ/jfha40SpgJ3fM1l1sMKQuO6SPM+Lhsw/+1Z5rQUt+aCGcnsAorM9TsGIpCsDvaq+J45HFwPH8Hnl8gUB1G2hU60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=HO5Ey94d; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso28048755e9.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816738; x=1766421538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzTS/0ZyMqSoKPg7ITuPysU9ip6EyV6+iAiPmDW2/tU=;
        b=HO5Ey94dpj6zWOoz0L5L0y8X69hFWvbeT04BkwlyT15jYCnbM2FPY47xRyxUSuPqq0
         CJYW5lrSNVziP6MP42xtzYz38MBnBl+eQurdkmVKST3mU2BBuppssWyfRd1DJcAkyG5o
         nLiKHlcX3Ds2BaedHt4ULkda+iLUJ7HgaENTayK0zbAufiulvaxMUHf/zJoJY50jgaPy
         vf3yqbvNxTUMYaeue/9jMOH6gOiWO9r5tXQDeePfB6H6ovEP277cbCOC+Se54QTf2bvp
         Q52StpqomWhNzdtWO6Nw007VnuvwxvRYkKBjjmLU5SY5IHblpNiPFHBan2jxZDCBPbZF
         zUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816738; x=1766421538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NzTS/0ZyMqSoKPg7ITuPysU9ip6EyV6+iAiPmDW2/tU=;
        b=MLduFMK42OoeyUktFByyG3LwikAJjjJgYXJ5D6qJZpTheu03PzMGCYWt+af+JsGXUn
         YlsosmKZJt/DKk5MX08MKW0+XlMdzFeXk1zSlSWWaT64DL2zYj7I6WZAgiTE0wxnak82
         Gbf1ywV/oPPxdbJ/YZ5fSxLptAyiQazVEmrNj5s0D017dBuewEpjvYn2M8VMWJ5rYCpO
         n03nujZMDh9/cytpbbmc/j1Eg139sODQPRZ/Pfp5uTBTPGnG1mr5bvNO0VaEedlZfgVn
         pTPZgwxGN8XVVPz9PdQS29JQeFYu6amoZtRTaQ2+gKcO9qhcw88Uo0KMPsaIRovCEmLv
         b6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgA2wCvh+JJUFJN8hLDHjuhjhvSKeyEknez3f7VHTKBdhJAkr0izpZlwWlIckfAiDIriGx7A55zTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ4qgk0ktetwMMQUvvv/qClXK70U9N9zVwvlaywwcKIzVmS1RJ
	2zwVni8rwlXcnz5mAkcHXta2MsgXHg7BDnUSqfQz65vKjq+eGoJoGwfjgKCVYWA6t/Q=
X-Gm-Gg: AY/fxX5gozLMyjrxnYcXCAQrg1R5yKP/cBLWjVc3DgVeGm1eDveEXF4Hx/ASr9bfvg5
	+ZDV3sUK+L37MreBbUDh3LBQga27yF3VutDLd/law/wn/EpHBXs10QKFBW+0tghk1ERnPIQnb3b
	1wqWKCCWrK90JffKxBBtDDH5Yt2yipBQRRkP46HaRXBgUNjEB7hibGyjtqBgLBoAh4q/SRjIu5M
	k0SWsQBouSsQvM/IORd+ar07H8Kio5fD91qKiydg0ZDENJboYLmDiswHMlcbCV2GXB/GbVBcwFY
	SSWevzltil3av1VAx3yVr7IGrIzrJOqVThUd8lvqmutJWRSc0Hldz94LscRppfz2DuUrj2rDH7w
	IGNLSa7K3R1FU8C1ccB5MTqKWka+00ThtFESMgU6fqJV8pm5MztqXWD5tUXDa5bGcvhMwvKn3Lb
	OB6jx4T3zhIi3KhA1Ill3f47yB6YLtTlCfwBgFLsuMbSerdecsSqQfkcY=
X-Google-Smtp-Source: AGHT+IH2I2yw55Q0CXhaNIPIXzNi6FBLabOFndmnwZCutK6Ow3Ht3tHRyLRJOxKZGFug1XR5+KxRHw==
X-Received: by 2002:a05:600c:3b8d:b0:477:55ce:f3c3 with SMTP id 5b1f17b1804b1-47a8f89c8a3mr129879935e9.5.1765816737723;
        Mon, 15 Dec 2025 08:38:57 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:57 -0800 (PST)
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
Subject: [PATCH v2 13/19] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Mon, 15 Dec 2025 17:35:30 +0100
Message-ID: <20251215163820.1584926-13-robert.marko@sartura.hr>
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

Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 73fc13b902b3..b0802265cb55 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -32,6 +32,10 @@ properties:
               - microchip,sam9x60-dma
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
+      - items:
+          - enum:
+              - microchip,lan9691-dma
+          - const: microchip,sama7g5-dma
       - items:
           - const: microchip,sama7d65-dma
           - const: microchip,sama7g5-dma
-- 
2.52.0


