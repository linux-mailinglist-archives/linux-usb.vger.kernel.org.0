Return-Path: <linux-usb+bounces-31812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1DCCE7D8D
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 19:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6379C3019554
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 18:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D200F33B6E6;
	Mon, 29 Dec 2025 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="u7HmGPkA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A733986D
	for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033633; cv=none; b=SptmB+RqFT4hMBJ8dYU1GBNoZL+xHdK0GIGvALz7q4k/L0gEnpAjmBzQiG9t8F6zoxm7xrBiNTDvvyvqG4fiV4v+b3JnLpJw9YjrB+Vrx5sprhzHzhYX5LGzsJjwWOOfn1dwkdCxy8SRrwWC6bHARTi/QND4h4ZzXPfHv5du1nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033633; c=relaxed/simple;
	bh=7jtkvldmPSo6tJBxZSibRZu5hmUTyLaiO8iQq/Sa4wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyXrvpx5JVjyhbxAkCHWLmDpKvjQgsKKgNAblcrgOFkEsmtrUc2ru7npTBdJgnhn6XaWfzbpWqjP0WUqKQdgCZ36pkwnUuiXwp8WsTncIpJ/rvsoJW+GRAmYhcnSRVKX8FoiFJrO4eMAutgBFbOnwmGeb9mcCvUbR7aSh09wcm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=u7HmGPkA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47774d3536dso74515475e9.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 10:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033630; x=1767638430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=u7HmGPkAkdP3R7rcUekjuNxY1rqjuIdNyca9I/XGM9QnG+kfzr1RniY05coFnav3Ng
         RYHUu+lqU0wDiflHit52ZG0t1bmh/XBC+sQTV348FEuYagsi0eLdDABPMr2PVkaD7inJ
         smarDUYRZ7OjWsdOyQ7pkBVYoLoQKrRfREcBHdttYvdam13AsICcjYpaIixihY848NF0
         4+AVUcKCS1vvv6tkvlnLJv5CroC9pr3VorsPqY0IGKUkVt2HWY+/PhFxoJpOM5MxrRZR
         rn0bKm0ktUYeG/Ov+a8MT9JGcL8LG7NbpQ5e7zQAkwYV+aLTTb3hvAKTdGWO/w9MZ01Q
         gN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033630; x=1767638430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=ofODVdS6P95Ige6477s+EyWylZO+ela2HTgZFMw+hn9AeJAlnxbWqpNXI8szrXA6sZ
         XW6pTrB4SKui29KHpzknFWhlH4B7nSM1fBjldv9xleZ4xVUyhNiE3TQ1Fqczbm6eRy6j
         YF5O0S0WoaqHFBwTnmEwmrQ0wPy6Qol21y1Pudtzi4EjuPA2roVRN2buOJdF0iSbkq+s
         Z8K3Eqy8DfB7WiPKHmrMhhzI9b/OTU+cosLHqMxZHp4r8i8AhYFzgKaa1m1PwSz4VpgL
         sqJw5WS3zk9XhvtGttc6dXP57VZPhIXv0EKNOqwfy2+AYAbOp28f/dlsYjtnanPvE2Bi
         kCmw==
X-Forwarded-Encrypted: i=1; AJvYcCVBytfHM19YxEc+bMLZBuUttWLZriAkqobN91O7iJIm7XZ3NrfbyLPtSysM/VsIotsuoQEDHD+A4N4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl8+BMviH51qDma/He6jmsfbaSAFtFcpdeQczdu0ROrAnybdGG
	pDf89xlcBpsaJ3uFK/y941LM6XyotrH2tYdjC7TJ7uYL3vgCS+aFH7K/nnXQM7n6Gbc=
X-Gm-Gg: AY/fxX5TrWwG32eOzZfiqM3YDNYQ2uWK9TI4VilwJ0NB+4j/O1wUe0HbHiRmUwGoWs5
	G/hrMRgsfdGmnseJpys1PIflN2R75Di4V8H8Fh/SSC0oZuUA7cd7YFQfG0eVLSAy5ZPJmWU6Pwp
	Cd8/5RDMUVL/VN6F7QVyawFFd9vVt3SRgheW4m98YSbRIHimBH85ZYidaO0/JBlSDShAFElj4+W
	pxP6Pr+dbGiRu0TUjVCWB5I3OvFkfVVL0O+hZohZK4RINMFS96rXAxU/AJGXUbj2nj/zHY0oQLj
	ZLjRKexZbhUjMkpqBOafGu8KVE0S3bUjCGYn6U1bhv0fVnFhu63vxe1xS6KH8i3aTVLs48lTRlX
	Xl2T+zR6B4xTDFTHErbvXeCSWikq6Kz1sCn57twF7sdJyfRFUfdXIyWRADtOQ7ICqcMbpwkX2wj
	QOHVqgcmW+lmzaGFBfI8Ulgx5cOyo3lcPpSBifULwj3E8p8qIvt8dHoI0cAdBIx4IvGgGcQYgXa
	qFNt88OqC9XFbPHgs8ZTwepP2hV
X-Google-Smtp-Source: AGHT+IHU5TUgf1GXiZLlNhFvhk9NZs5LXOVfATsL4H0x67DGWgTd0xHPjLFDLe/wLhfc9aOjmrDYdA==
X-Received: by 2002:a05:600c:8b11:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47d2d273999mr360424715e9.15.1767033630467;
        Mon, 29 Dec 2025 10:40:30 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:30 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 09/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Mon, 29 Dec 2025 19:37:50 +0100
Message-ID: <20251229184004.571837-10-robert.marko@sartura.hr>
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

Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Merged with microchip,sama7d65-dma since that also falls back to
microchip,sama7g5-dma

 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 73fc13b902b3..197efb19b07a 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -33,7 +33,9 @@ properties:
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
       - items:
-          - const: microchip,sama7d65-dma
+          - enum:
+              - microchip,lan9691-dma
+              - microchip,sama7d65-dma
           - const: microchip,sama7g5-dma
 
   "#dma-cells":
-- 
2.52.0


