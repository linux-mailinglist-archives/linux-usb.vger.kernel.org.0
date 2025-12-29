Return-Path: <linux-usb+bounces-31810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CFECE7DE4
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 19:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58B55304321B
	for <lists+linux-usb@lfdr.de>; Mon, 29 Dec 2025 18:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5A533987C;
	Mon, 29 Dec 2025 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="nrSYBFVg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B266339871
	for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033630; cv=none; b=gZfMi0PFwLNkZBc2RZmdrtrLBdDNwrS4FHN2zsZTZCf1OvYWdRYa9ei+M4ag76Mw9Tat/QXRO0PGo1mICODMFpGHWIiRed73o53C/He4QGuUnClGtY4wbWPWCIwdSzSW2+DRQS72iaQbxmKFV8Ijrh2mOsJG85lQPROSx8rztUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033630; c=relaxed/simple;
	bh=zUvrtsolEdengocgVlyXQxoSJXOg4mGPqcC0PLdIbPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cc+Vwoo7egipa1vEvkZGLm3vaP7xDqj7GhKLhiiG7MGSbcy+oQHXUV8wkV+xm7mi41YjvWocBxhVrIFeph2hxiYCSZ/yUvo/ClyZKnMjAt3hgJtIqvGZ9kE3UW+sqUVY/oQHbUafmXEIBBZAdQ83hQGjplLb95ofZzL2Ke2HZFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=nrSYBFVg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so68342905e9.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Dec 2025 10:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033627; x=1767638427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=nrSYBFVgIwnAefLeDPgYgl8LqPiDckGltKlnnW75XVRuK+1yY9xg3gh3tZq8mkufWc
         bhWiM36cUBWMUAHYQq5VxaauBN1JBIGM1CoAC8bv+EjP4ME/nR6R7Y2d1Atbm5cJQNSE
         YakDsZ/R1kZY+j4wBQsd5PAXPwYKwrwuFRZtmYDWxrtbnG27rLcX1oBpHJzbZkBOJeRG
         /O8465TNdb93NZorMxyrz+2AaTqkqW0Uztj86TFG1zFVqHK9e3/M7xA6e6pQgFYtDjDu
         S5XivWOem/+RsxE7b3hkn3aI+uUJz/5pGcDpvkkbhxo4xpt3Fb/AMTvy+Y9k6ba8G5Sh
         L9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033627; x=1767638427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XldW6lxnsgyAezmPBHgoeGUpbHtzZudWE9rMzsQl4gQ=;
        b=ug6YPycDU6U3dOYm6g55F5OIUvOYDpQk4eHUaK+FYLgSq+zIdA5Ve4MXW0VOhEfmL6
         35HNBSiRspXly60Dm/4V1HHdSi4FnH//TNM1m9GyoC+UDk+d0BnmpUJR6NGpalsfnamW
         dwq23zeKVtrV7kid5Madmu2y1R1S+nYphyHk13FAynmTN+njhu2AHeIwvmwnaqbztc3n
         cqQ+O1elr6GS3WXQzZh4rlKH/3SegMrIk6ztLPD1KcAbTKtLvrSYRBkLsAFumsPBmAsh
         OT/ju3jgGhkTqRWT3KqTaIhSQgjlvbVtOCzQ9fP+ts+Kw2R99Kdh8Der4COh0pufgLtM
         EJdw==
X-Forwarded-Encrypted: i=1; AJvYcCUfpo71x0By6v0wECVEtr34+VbsEFkoJUnd1uMmn7awZpHTRDwpWmPTkmL2Fe+oIIMvCKyvBQo5UvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnsw/VGqb/ey8o/CNeksk+ofVTrbZ3JgSLrzcLsr5Sdf5n8lH
	g9D4xPOEr8ZSxBaGEwjSHHDm5zWASnhXF3uxqGx3e9UeKbXpFZTZk1cOHQDT0JPbMwk=
X-Gm-Gg: AY/fxX5+Cqk+LpKfdgSEQ0AyGgaeKq0uu4AB7X1KmunkIhiJPjKH7yn/RSm1D30on/Q
	6TWCmSu981K3+mOtCES94bzyiPZcC7SUbjD43t+XgUnEQ6fsclx+6wMko/RIKpZcqTqIoSSVeTv
	3OhQZToVYu57lUJv+We24zoaU2KPOlcGmjlx+B9o6K4vi0UDaPQPtpBI8v4t2YoZcGZhVNgB1t1
	q2swKoW/oRGlpNSvfsWRze15zlKDXjNbRTwThXAEsmpbg+KMMw1LIFO+Go5Xxd8H8lVWhA4R7ok
	o47fCqsptDD3GchPyYP9zA+hOKSOmt4lBS1TKDDYdXOjg+mDy75urUs6LIIEZ8McHmtbhKipCti
	++lKqe+Kt/14/8+v/qncmhUcSa6x9QfZMtLAKT+sW3ifesF1bhlAXpW3cvy2kI0iq3ADDXbmWVE
	dgqyvFC5jiXbBLrbrAa924XqVseAxNf5zn0LJMr140EdT2kgFwW/3BXqKLXuYHi7WccbzvTgUIS
	yeVvEHARI4sHG/6Q4o5nE2pv/b0
X-Google-Smtp-Source: AGHT+IHcFjQCCkIHzURsiMd4ZffbXQCjBanKlfgaAMAIAjZSkOlosZ6OaPn7ElCbfUOqooZC1IjlJA==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr255230805e9.28.1767033626661;
        Mon, 29 Dec 2025 10:40:26 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:26 -0800 (PST)
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
Subject: [PATCH v4 07/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Mon, 29 Dec 2025 19:37:48 +0100
Message-ID: <20251229184004.571837-8-robert.marko@sartura.hr>
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

Document Microchip LAN969x AES compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
index 19010f90198a..f3b6af6baf15 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-aes
       - items:
           - enum:
+              - microchip,lan9691-aes
               - microchip,sam9x7-aes
               - microchip,sama7d65-aes
           - const: atmel,at91sam9g46-aes
-- 
2.52.0


