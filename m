Return-Path: <linux-usb+bounces-31454-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B3CBF017
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 17:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DA123018424
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 16:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A254C313273;
	Mon, 15 Dec 2025 16:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ZR2hFQ8E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F01732FA2F
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 16:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816729; cv=none; b=rWN/kVvWs+ywFwTE3hk/kUbU3UyNZHuTN8sYLewtp1iazXqqSdHm7q5qHbs2C/p8s9lAswMou3TXwYwb8F3XGXLMhJcL8d3uV1nzTkzRB2k5zDiswcTxFB7pgCyHOT9gAVUuyefmQA1ZfdtsVMHohe60QBek0EqELWHlY759qGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816729; c=relaxed/simple;
	bh=71vt4iyiLZEhN77G8cDPBZ3tS+ZW0JysnwtVg4Nk/+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbBu045j4tlJj2/iIBoYK1bEltWxZXIb/JN7QONPSJfRO11CqqWnRwn8YcXVxy3u6o4XDW1U2PpKn89QTfUK7Xh/qGzC3EmxOZd4KqARMMGj8PqmPnxokfbRPGtk1C0cJe5oYKNL6DEuSGLs8wUrqFaw6lW5gXO0TaMxAHG+yyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ZR2hFQ8E; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso29787465e9.3
        for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 08:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816724; x=1766421524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhZHb+UU/3uI1zhxQGkYOMy2iOjOd7yGE5qR+fmsO/o=;
        b=ZR2hFQ8EE14oGueyiW9ZKeCNVEf16QNkEo5WkatjheEPmXvl7ymhA8dsYlgoCoUFpO
         G0JBjD0my2hDkyDD1bKay7O2yESjV1Ycb4Oc9qR9az/UnPJtLuRIB3wvRkQNuarmafk/
         tmN9uxP/RDWnozUp9hseevemJsQHJnP8zSx9/LQM+LbL4ykX9dNQb2JgkWzSpf2CK6GA
         IKsPY0AxDee9H96Zz3+irzWfjg2suiTW4kRMPje2G2zRXF4+w9VDHE03DKZ4Lisf01Ct
         Pq3uyZeglNn8Ik3WHr/M0J+96bkPqLIcuMNMeP2ilD8gzxiDkxXUUxKDZbsIPMzS6smC
         OSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816724; x=1766421524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhZHb+UU/3uI1zhxQGkYOMy2iOjOd7yGE5qR+fmsO/o=;
        b=BjK+C5D9OqsVPI+STiYXWZ+kpzD0LciJXlsuxpehZhyRd5flw5YNc4npTv0FzgC3SN
         TtLzjyXa7CUBnNUFyla8v4HYmyGEjrejB15fvl3l3nvPGUdRNV/9g4FOPX1AMwuUvV7q
         oSM5LpMphIh3TaMFUDt6LFNhTO36RpA9k0ZUKPmU2XF9PKYXQcoWByeimm/jfn8Xbrqe
         3s+OqKfQVXvEMSvkatRiDsZo7rp5L6qe7GHSp/Gs+MTFOm4/OxldxlnAAHXLglDYMpbE
         Yb7felTZKxLKpzeKcSBNjgkMnAhXdO6PO97oP5FVCc9+isQKjywULXjgqMXDSrrP27vp
         IsNg==
X-Forwarded-Encrypted: i=1; AJvYcCXFZKMSRGehtvv7TraofxM4ihCVrV52RUMbDqexuPhKgcHL03IpT8dReYPZqxPxju7LbYNHRu1p520=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9sM2FzqNI04FSsjzvjewbUGeQ6L3/gnpk4d55cA17j0npOL45
	N5TWB3dd7iJnOu2BraX1NvfbRL9u/UCTnPkNNNUFTb57Hk9qZj7e6d9aeLJPDnzEbeE=
X-Gm-Gg: AY/fxX4nt3K37hFv32wqfZyfrw2oOusf0B1NmKeopAmNXfXzYT+Elt6fh4W8DsLTIdy
	nFWlBZ+mox4H41cST2cXol5snH/dgJ9bmhRgLeh4DPIf17V85gv6DZaA6yUl2TGaOdRWDdludJL
	MICM42RZc5lyMqvDNtdyD8Sl9/TN8GnTFBzSY5vdK8ZMVPtrK6dLuKnQi8mCixvHzUMBW/2967L
	Q9oZRWL95TI8V442SCRdXoJr3rV2eieyJ4W6raqzcMXFoD32WiPfaOmk6AMbhG6ei/fEphckIeM
	QQwz8f1oMLb1XkkNjNt6aUnyWUX4vTVZdwTjqwWQcqChmlCXjNbjbySwMKWR0q0+aMU4IP4KbZQ
	mZOHhNTcbDaEW3JGBjvFd3t2DA0Zn7FR8JE3jcTIdGeWCnj0UJEWE7sEmUxnQ4F6oQgUsOxYNHZ
	qbTmsgLAdgyH03R0X4E07JjDwRjWo1YqSdRY/GEY1EH1VO
X-Google-Smtp-Source: AGHT+IHtktJVK1XDeqQwSAII8bPqSZeOj9G+2EJJX5Ej20zke2p/ReS6z8A85crs/C2GxQTMQp3S7g==
X-Received: by 2002:a05:600c:46cb:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-47a8f8a7f0fmr122138175e9.8.1765816723603;
        Mon, 15 Dec 2025 08:38:43 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:43 -0800 (PST)
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
Subject: [PATCH v2 07/19] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Mon, 15 Dec 2025 17:35:24 +0100
Message-ID: <20251215163820.1584926-7-robert.marko@sartura.hr>
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

Document Microchip LAN969x USART compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
index 087a8926f8b4..375cd50bc5cc 100644
--- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
+++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
@@ -24,6 +24,7 @@ properties:
           - const: atmel,at91sam9260-usart
       - items:
           - enum:
+              - microchip,lan9691-usart
               - microchip,sam9x60-usart
               - microchip,sam9x7-usart
               - microchip,sama7d65-usart
-- 
2.52.0


