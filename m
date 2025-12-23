Return-Path: <linux-usb+bounces-31731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 289BDCDA899
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 21:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DBC030A7BCF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC9C3570D9;
	Tue, 23 Dec 2025 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="vAEdXO3r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF273563FF
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521290; cv=none; b=Q+sXRsyeUp5p9qjO0Bqzux/Qvv3835QA8LhOXn/4hn8cyWn1tOWnpJ3eEL34rcee8MOlnzpVARBFfafL62KOnouiGxVGzTBCWc58+ygSz//E8oijtreQHU7qWSVsXxGAuZbu+vba/d/GPM8Rk0bDmklEfQ3PFucWRgYRr/7/68g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521290; c=relaxed/simple;
	bh=Q1obzpbb74AZt0ukfBT7/Xcte4bERP/uv0lOi/h0us8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixlFSzOmDXPI571CrLoKatWPm7s0DljkaAByw1S7T1+pgcrKXFQjwzQDGp/BeOvkwjTPac1mFBaKFuHXEZj7INEhoU9yy2LpzgMR6mP7h8rFqvq/jNdmT7d6IwA/6V1s95OVq/buMU6Sz6VHtOemswD4Ns0Y2eCcNpIQaceLO58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=vAEdXO3r; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so6112888b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 12:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521286; x=1767126086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=vAEdXO3ra/1bm20X8T+iXv1DGUZqKx6guXdgGYlEe09deRwfl5bXIa86Eb9PSV+d1g
         89yhFC4l5+p3HDHL9B4t3HraCiFP2Abre+g5OOymalREUL4ViCVjaMatLcQOi73KgoaO
         su9Z87NmLUKhMW1Z4N3LrDbyJ/2M/2Y3Ff4tCAv8WODcWixujph097B2TZm09bAiaL+z
         5RusNCbtacBZhsJzqltsEvBQ/ROehlt9LNDXxG8a0iqZnYUEOZo/smkMaGNsonZqVIvW
         oB5htBh9H/x4y6/cNqzQFEF9xiV9o1T5FsZ+snE4miTlvCzGO78Af/4SYd4c74sDMOq0
         AwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521286; x=1767126086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=QvzwylhrUX2C+ZeScLpUud7OWJn77RL/eajzxwSLuzI2vgWMhOFtOj4vLXYer6kUDa
         c6Dv4XtmM4zXnsdxHXl6lk6djJ00gvEgn572xFwJoWHADXmcZ4PavnB1XoC1BsVrPEOC
         xzKRZMQkUe6F1rQnEBspd2pe1FC4rMvedjqDkVZE9hlpPhrpB1A695I1daS6wAYEFGHL
         /sko5ti3ifsqTgKUiAFHQt2r4bSvcUoC2+NWFbTyUIT3K/4Y9ULOIf0bbBo/TaZBRubG
         JT75CVRWo4mjLOIblMDedPX6YKBd7NQTxGo+N/uv8z28QFjeWTiAcUDfU01wZAKTvA91
         Ftew==
X-Forwarded-Encrypted: i=1; AJvYcCUdN1cFb33lB/REoOu0XImj/9WGgYnYqpTNiNURjuake1KwXOmSbTY6w8Em1x+qYj/ueQLMf3oe9m4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+bDR6T1EgVGzm5R4y0hSb9QAB22+5J73sduPY6T4sK3nQLvu
	DCzmj3jhjG6egYd6hi07lYkR3xGxbnEmIj3vzX9CBJN+t+QE7S5kDwdGP/QZXY8LczY=
X-Gm-Gg: AY/fxX7qeGkgIbULKdmW7kkc93swuul9/B619kDh6orcT58snx3GT1r2mHaAC8mmn+F
	AJz+arJXitssjEOuDuNjg5vvPqd2M6bbsz8nxsbYrTra2c3/aaf6zsKoi5PlBw3xh1NhgP753MX
	5sOTBdNQ/84sNUK+bn37jNJ1Bh1/r7rCbLop18iG7q7HnQf03twyN0axxmoCQVZo8xHZ9wWCLjX
	6pkHJVZDvnBKrcBs80O3sNQCH0mMemGPENuKzBpP+xJ/69gK7jqibwTKA6pAOI6VN+WenFQKnw2
	vZBn88LcL7yjm+6r8JDwnbgwWaspifNdOdwC2o4urVbC2bQ0apYbYEo5+9g1ebYeq/gU4SvmZPx
	NuRViypdo2NBIweVTyyEqOtvx8DIDReIKvSKInJ4bfWHkgqpC8uYFrH6wMpufIfAsqpIUrnkBO6
	uVhTIA7XuTM1kn8AQyq+hcNsz83gb7gqN/S8Cm49ieBOGjmovz8uLD4QJck4WNOyY+fZSzmYQ3D
	Z9IdV5Uo+3EUuh8Zx8=
X-Google-Smtp-Source: AGHT+IGKTAqrl4PGe4SFW7qu0192lJdQVYEzpdtaZXHZbcUYB4ioIiqnmVp7I/qce4lXwOMNJA61Eg==
X-Received: by 2002:a05:6a20:e293:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-376a9de5b1fmr15092285637.41.1766521286558;
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
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
Subject: [PATCH v3 12/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Tue, 23 Dec 2025 21:16:23 +0100
Message-ID: <20251223201921.1332786-13-robert.marko@sartura.hr>
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

Document LAN969x compatibles for SGPIO.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index fa47732d7cef..9fbbafcdc063 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -21,10 +21,15 @@ properties:
     pattern: '^gpio@[0-9a-f]+$'
 
   compatible:
-    enum:
-      - microchip,sparx5-sgpio
-      - mscc,ocelot-sgpio
-      - mscc,luton-sgpio
+    oneOf:
+      - enum:
+          - microchip,sparx5-sgpio
+          - mscc,ocelot-sgpio
+          - mscc,luton-sgpio
+      - items:
+          - enum:
+              - microchip,lan9691-sgpio
+          - const: microchip,sparx5-sgpio
 
   '#address-cells':
     const: 1
@@ -80,7 +85,12 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: microchip,sparx5-sgpio-bank
+        oneOf:
+          - items:
+              - enum:
+                  - microchip,lan9691-sgpio-bank
+              - const: microchip,sparx5-sgpio-bank
+          - const: microchip,sparx5-sgpio-bank
 
       reg:
         description: |
-- 
2.52.0


