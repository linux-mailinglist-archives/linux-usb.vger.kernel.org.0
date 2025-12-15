Return-Path: <linux-usb+bounces-31452-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAE9CBEFFF
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 17:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF18A301BCFE
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 16:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B22335541;
	Mon, 15 Dec 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="v+T8RzjO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C33C332EDE
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816722; cv=none; b=Nsojw5xPncB5Md2DelEVG5n2bxfbm4P91VOwd2JMDlolNv0vvuAos4RC40YYAUizQPLC5kv79As06IkGYo6YinIEw6zqoQtEdxrdaLDnDZ5pBREXYPC2rs5eHLCBDXW3Qy20BeBDC5+p5rwXt8wi0uBr7rOKh9v9u3jGh0WHACA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816722; c=relaxed/simple;
	bh=KckEDwOpPTvVDuV6vEp85iQKEd6lVbIzeIrpO820OvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPCKOw2Bpsrpu7C56tIOVEVe2VfQUr9YyZVMcTU7t5oMSF4ZrYbPro4TuyUPmq2SCU6yF+IXB/l1AsW1ce7R2szDa3SWuDE90pLRCJwnI9cCR8Mo6N3N6Ylk2+wieEdZZ9CGTwuxFIz8VSfcBLtQPYXRCckrw+acqJ10HUOMhNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=v+T8RzjO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so41066765e9.2
        for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 08:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816717; x=1766421517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Glxh1+4wMOAEOdPMYe7TVA1/ll/sUwlQUZ1Z0+HONCM=;
        b=v+T8RzjODpQ2o7XMuoOGoo26SSMjx6obFhRx1WllniiTrhMuXJbcM//TfBZBcR/Ka/
         g+hDI8INtxekK1pvWAzhJ8ObK2Ja2zlYBIAtc11s2rFb9C2fvjzrSJQGl1ECLR1/c+ju
         ETmZ6hzDDCNv5aOrlTLwjlSTw5hurjSZRkI8/NxGcEo3hJPzHVk6amLwpNldSF9xjiu1
         zgahaIHce3vgT3My/TcIxJDCjVgozsuUB0rRsyTh9ocDsVFWmEgc2S/eT4pKaNeFpNos
         vFJjsEduyB0oLFdK4zLfbFY2OSLX7gBayxbx9cJs9PYlEin87d24+LCvdrMg0q6a+eZw
         Rdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816717; x=1766421517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Glxh1+4wMOAEOdPMYe7TVA1/ll/sUwlQUZ1Z0+HONCM=;
        b=CU1c2J7WmMJ8i3YeSM7T6wZ9Ms5J2dE7hjWCwUo/Jzjp2MQ+UcMT72czTvsXMbkbUR
         qrFvC/UvTA5PIAioHoQ9P4fsT5tkk/6sEOcIvpWO+dTLUb5Z+n78XR5I94wEJulmYfDF
         EBfIuqoopXe5mI/ZTAh4rVRmITg4msoPl7UUrZQrCoArdGV9NRyRXNIfKCp0g5ATFkh2
         8FLjHT/M6JnyilRnOeH/Jf1KRFNQ8z0fwAnS2jNgI/aFrkq6OMxrYXm2X9mOqZqGxRSM
         83xzA2t+KPFpG+egc0LwxyLjy2R0olQw4nUdgS8he0Z2ImE2KQVvDxe2shnpTNZtN/VJ
         tVVg==
X-Forwarded-Encrypted: i=1; AJvYcCW58WMC52MgYh+sUQPqbuwef55bjDY48bFILHzADhZCJtTxEXIUA7cu7JdJRdUm4LgpFXm3dy10Qyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDRbuwCMCGtUEKJ252DXD77+HZELodVf0ywmK7nmSzm89iue1n
	26Jx8uzIR1ApPD03an3OGay/kohOP4rY8Ckzy5yD3Jg78k6mD9kaWc7RmIEXNDEg9Ok=
X-Gm-Gg: AY/fxX7sBStYvviHUmq5w4qmb0d/V0Q/kNMX+8bnJurS5OPNZE0DPiULf63c/3COuMx
	HK4yON84xhFWyx/nk4LnSwCE8KBtPgs4BOOWVsxqC6edwZL6phyX2aD7xU/fZIBhz7PYEEPERzX
	dKlJn+f3CQ6We25eFjXAlLABedxjgCqn6fAWnwRn3wbfz1dIZp7j+x8cdhKc1f6akzjC5uu+mzv
	4D/IDWC9Qgn0kUmBl+u6lpLD344ykFrH/fvzDiUIQSmEmfLV12UR15AY+n8LqdDCwDy9BADBez0
	H4qfMDj5s05liWSLqJE/GxM0YwtLkUm1nf0OTKvkg6NEGScUMm60th/Yvr40azcETQBo3U7NgJR
	KNpStzXR8Mdpc3wi6YGYxU6AbLBDNGyHJKEIfuiF73ZQSngx5xiw/xbeWTGR5PmV1RzyjpjUnyC
	dgEA0AEEwOeET/pm6/aeGcLI0rJOlYNZj4moQgAsYk1B75
X-Google-Smtp-Source: AGHT+IET494SX2l9gCFBDAsNgva9GdCaocHF5w6Fqopjo065ROPc9sjb2/YbJQBUdoy8LPQteXLhmg==
X-Received: by 2002:a05:600c:a31a:b0:47a:9165:efc4 with SMTP id 5b1f17b1804b1-47a9165f157mr97992715e9.33.1765816716425;
        Mon, 15 Dec 2025 08:38:36 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:36 -0800 (PST)
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
Subject: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic Microchip binding
Date: Mon, 15 Dec 2025 17:35:21 +0100
Message-ID: <20251215163820.1584926-4-robert.marko@sartura.hr>
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

Create a new binding file named microchip.yaml, to which all Microchip
based devices will be moved to.

Start by moving AT91, next will be SparX-5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/arm/{atmel-at91.yaml => microchip.yaml}       | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/arm/{atmel-at91.yaml => microchip.yaml} (98%)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/microchip.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/arm/atmel-at91.yaml
rename to Documentation/devicetree/bindings/arm/microchip.yaml
index 88edca9b84d2..3c76f5b585fc 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/microchip.yaml
@@ -1,19 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
+$id: http://devicetree.org/schemas/arm/microchip.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Atmel AT91.
+title: Microchip platforms
 
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
   - Claudiu Beznea <claudiu.beznea@microchip.com>
   - Nicolas Ferre <nicolas.ferre@microchip.com>
 
-description: |
-  Boards with a SoC of the Atmel AT91 or SMART family shall have the following
-
 properties:
   $nodename:
     const: '/'
-- 
2.52.0


