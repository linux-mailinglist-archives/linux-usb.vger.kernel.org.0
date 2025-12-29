Return-Path: <linux-usb+bounces-31813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8565ECE7D84
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 19:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19D2630028A0
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 18:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8111033B6CD;
	Mon, 29 Dec 2025 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="js20qBKl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218EA33B6C7
	for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033636; cv=none; b=X3wPVDbAZ3IsqL6IpbGF2a0m/qU7P5hPlJ0yPjUvX4H3xZrPjh0KfPEoG4nkNgvT1EIsTeX++jjbsqNE2DTjav5zhbVy2X1hm2EALpTuZmRZRTkGLN2OvdmVvfsvO+hpBpViuAiIy1JuubaEWrsutxkm8UwT2NUL8w1ntm7YieA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033636; c=relaxed/simple;
	bh=omWUVkHfDgWK8/wVYsqR1gmKx3uRcWW/S7wsFlqvQZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSm5aG1M65CIF2TglJviYynsxC74UwOzPEl6bMuJTtAWvBUVskx8/ty87HlVj/SQfogj1P4dmAUyZ8vmEq7sJhCnNo5oe/b5XlRU1u36/IE/WaCcYuiDnEEa/fJGV5RTYM+DpCKAvizMncApiyRNgOamQTqYSsk74eYjIQ1g9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=js20qBKl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so68343445e9.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 10:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033632; x=1767638432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=js20qBKlOIc8p7LAg3ojQzBrDVa9hnJ3iwdqCsfn32yFz3aInQM6QoNK5N/ROzBK2F
         7GGCtwcKHJrg81RR8yBIoLsUREQkvIHNvhSZ1Uyooa1SkWmuCNLxf1fM7yTIF/tSA5xd
         VFlGqY3EMA41aCFoQleCr+F/kX/Bxmhq53oqbmeTatA6OX82TeqOt3nsr2uNqBEqrl0k
         nBsY0OfjmzG0AqlPzNx6ENwwoGPvY0sYVSF5LPWB3Vob0xzKohW7DvCBZ7tTFFYgAJ6C
         HU5bjhYy+qoTsm16Nc5dGsdDMwZMnkSPDCi/zwej+DFJ6pcf+YNfvG9ROfUQuUhCz1pP
         LuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033632; x=1767638432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=l5NTgRMi/0I8g6IZtet4+JSMcJl75RX59GZ9eQE8HpQeVOoqav+hVpMzSAUHr9BBkI
         EbD8bdK29JxLsakD6Xsj7HIB7xHxSJoGMCR/v+KOvEm6r1w/Km6YKYvdMTfl+UWGZBfF
         Ky5SXDAFke1C1XMu9Bdh19V3vdcrQtkHLO5fY3C3aejbmLs2ACizfyLlAz+oQtuVF8o0
         xZZXnWS1LA7A+ZM1qYUH7XFC74o0uSynCP6s112u5BZQIVKKchlLhaGmNNXMbc6g1zQc
         ERxiZN1d10y/dkicEDtPzmAh9UCC9TB5StI27sVoQF+0b1M3rWBrJoG2udTy9127cR+N
         /lmg==
X-Forwarded-Encrypted: i=1; AJvYcCVHGJw01KrdMsq2vGFEIF4k1J1rXcZxkMqo8SMZ1vKQYW0t94Bk63QDOOTi31nu/DMh2A7Xcu4a07o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz//6UKYsDOgmcT+L1ArJRP1t2r3ZKLw5S8Ope/GRRYeWv3pwYz
	EsHAMDVgrOru0h41YhLa1dlcfYtCwx9S9ygnWD8iJqN2jX9wCTsxoQdPgWAcGl5MXtU=
X-Gm-Gg: AY/fxX5BJ5NrpDd+J44d2MtaDpzuk15lqenw4bMSb3Fd0AnFhcNNhVuM9WrvIy6JoZa
	RVH/9KMdFj+em4qWwusSqZnx+2fWeSixd/h03OaNbn+b05IYzsfEsM4FAPYmzqeZWM8KCr22mnN
	CdSClVK4upLJLGWQTk8nsfVLIfJAuzE3rkbRuYXdQ7Lps4HOUFhDW8S39eUd4bDSUmFmzNmJ3md
	H9t2Dm94ExSKFoYHCgMmBIohj5Si0AM1DVigymPcw5/eMz0oXuyxsbLVLfqgPIKzzMpjb7Q0NkP
	NuShKUXmSrMwu5zJU0A4E+YuBZfa5pGunu4zF2GWmUt0V0lS9u5sovMv0rO+b38nxISHwHA5HW6
	PbauQLCEVkLOK96TgKMosYqdfM7xwrFEv6iXY8pFXfXNJBiSsLmRg3cmbrXsOjzXN/eUFSJQqpn
	5wP/cRBcc7144N46e/0UCAww9SWR1aZHi80hf/4KK9gBzmw5N4hI7+8bwDF9SHZdUtRjIEHSegF
	RZHsntamr3wnL1XWVyU3aizSv8U
X-Google-Smtp-Source: AGHT+IHMeEPdVuxCEsr3HbzwXW9O9zK0z+wZ0vfJLANR2lbSoc703JFfFuycpKgytpooUs272ghcDw==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr255232695e9.28.1767033632356;
        Mon, 29 Dec 2025 10:40:32 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:32 -0800 (PST)
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
Subject: [PATCH v4 10/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Mon, 29 Dec 2025 19:37:51 +0100
Message-ID: <20251229184004.571837-11-robert.marko@sartura.hr>
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


