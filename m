Return-Path: <linux-usb+bounces-31730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE10BCDA9E0
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 21:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAE2330BA98F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA79B3559ED;
	Tue, 23 Dec 2025 20:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="TqO1SVDy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D2A3557F4
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521281; cv=none; b=aTLF51oz3nYONgMzE2GvKaseAOPUZIY8F/Y75l4eBI2DZQIJ2+uNnGTSGo1nRjWVvAPb+Xdf8OxQbqQc7bPez2MADhC9Jgyxo6/yVybxVdX3bTFxnzoMGhrD4yLi69tadJ74fV33l6wK0H6GmKAMKc5mBf5tA2BDX5E+0H9t8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521281; c=relaxed/simple;
	bh=omWUVkHfDgWK8/wVYsqR1gmKx3uRcWW/S7wsFlqvQZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSGZFkC4a0W06lw4veAtkp8JHIg5zQKdPWJPk8aIe/My0Vh8/6NfE0AASu7Uk+OGPSrSl6tRqlqEIznBAn5mGBJBwTUGQW98y+sR+Xc4EP+Gm9s7D2D97Tv++R60xwt8JoLA12JSN9b5qo5kB3wPxSQRAL27E5wtfMtCS0zcfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=TqO1SVDy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34b75f7a134so4090265a91.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 12:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521278; x=1767126078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=TqO1SVDyDPy6oeM2rbEwUbThg0ZMdnWKh7T7VD8KZSzOa/J3kT4ROyy/pl8C/wyVsx
         87KW2ws4VZeH2LmCpVD56F3zdAx5JXs6BVI4CuP0krQwFRfdL5t80ZUQoSqx/9VjCZ93
         2xHRYX+ZNHO4M/4rPr+tVC07JSbvH9LFNrnBQ7xv2se4nRY89nnVpeQCvPP5R7bR74dN
         8ViTbRe6BIWhzI31DQmgEro4hW0FWUc++XgR7MG6fQJ7WiTyuHPokC+8mh/pV6Sq6piW
         ZgBIqf3KQjUSOvTNzk6HjjuoWV62KCEhAtinLcS332mSds9tBcYhX9IcAH44WscTKXwf
         1cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521278; x=1767126078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=sCfWJTNGzZKEuR/4BNHYypND5lcaGCkaY2qR5QORCirdnaGw1S9Ld5/ihB//dqD0lo
         lw6XHeOhqvovjnuzOEfiLw916ppNfdoNkyKpYqQ+xICnm1VTz7E9gz5UUa4Cr4lY/LgH
         LnyeEHI5B9cjwVdUxgSrqKxfGAgV8DuhE/K2ymIPDrzMKIbM8kFi+OlA7Ku2EjDhn36N
         I8lrCaQe+5gcus7d2TnuBg2L8Cd+IT+L3yhMao0yCcmR2Yp23IrpXNF7+sOtf0GnB3eJ
         CtRLoduJ9mEgu5V2M86u3gwbI6zM1RnA9nTiwaEjJNxgjewron8yaySoSSM27fnMYzMr
         FuFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLcy9wFJDZFgtNb8rATt0TU1p+uuis6nH6M/PJzCv4q7AYkoOAQMgCGeyNIeBwH4/IkY9BSZCj53E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZnGp5ttWG9ejxmz/PhKJxI34bPiSTQPfZ6oxygyKcs+x2rFtE
	9faNIV97DEe6+aCU0eGrrCwVgfbJdul2v0BO5+HOjK18QNBqqF6Tte0fVakq5DKsNzM=
X-Gm-Gg: AY/fxX6uHHxvtBWwSG/jpQZsap/HbLCBYOcDwjPCuz5kJxJvnHQjSkMtIvJTw1SZMTn
	j38f8EA8pK+pxv1AnZr8O0tumXwKrbFXfy0mDdJ0g1byFcFlKzTyLf8YYC4xEGNPqr1jBAWoqGX
	0m7nFSgNPWWTrytijH+U8/Mq1WO2YF+Q9bs6UiBQxaKPhFIYtUx7cVyp3VRdbmOy+uz8uZe57QE
	/EpUNfwxuoRbZWh0FtZJVI04AAplkJBpoXTxe0JootbIQ9beZWe3A1iHLGB48ibXbM9INp4mG8/
	qUdwBXUAt9UtczaTuEYqEgglyaGec0NOrYEi+3aan1OW58zmAd4Z8S2Af4PHp10Ve4frQH9Ux1D
	V0Mb2ODp8B/OZ7a4pk1RB1CB3jV6IJgwP/CxAf5ol8q+Un38G8qiibZSYaFNlosedBnKCpj/8En
	kML3MnMqZyquG/TbNKludsBXiKtWaBgj6RVgt4BQAq2JzVa8tAjoGegUAZtV73F7VoK9NP7uAwd
	MQ6B+xD
X-Google-Smtp-Source: AGHT+IHeRAtPKwVz6qoPOdL+Osxtu3PLTheDOvUOr8YysaVV8Js4PDKym39wxYhmLqVHZ9ksN45wJw==
X-Received: by 2002:a17:90b:3c4e:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-34e921131a2mr14020700a91.6.1766521277662;
        Tue, 23 Dec 2025 12:21:17 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:17 -0800 (PST)
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
Subject: [PATCH v3 11/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Tue, 23 Dec 2025 21:16:22 +0100
Message-ID: <20251223201921.1332786-12-robert.marko@sartura.hr>
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

Document Microchip LAN969x MIIM compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/net/mscc,miim.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,miim.yaml b/Documentation/devicetree/bindings/net/mscc,miim.yaml
index 792f26b06b06..2207b33aee76 100644
--- a/Documentation/devicetree/bindings/net/mscc,miim.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,miim.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mscc,ocelot-miim
-      - microchip,lan966x-miim
+    oneOf:
+      - enum:
+          - mscc,ocelot-miim
+          - microchip,lan966x-miim
+      - items:
+          - enum:
+              - microchip,lan9691-miim
+          - const: mscc,ocelot-miim
 
   "#address-cells":
     const: 1
-- 
2.52.0


