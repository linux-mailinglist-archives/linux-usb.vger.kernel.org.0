Return-Path: <linux-usb+bounces-31725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78236CDAA37
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 21:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EEE9304841F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BB834E74D;
	Tue, 23 Dec 2025 20:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="LUNMGrbH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B72134E242
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521236; cv=none; b=doszpANV0/frIrK50lIuDnHMgoR6xtiVcGF5gRo+kYJX7yLUW0IIsuHvlqdUTKIpbM9lsvx+2VuDoA/xl5PU/dWFvKbs+KOtD/b8SOeuJnlWMMVSAz/+YhAtjKe0nUB+bF6W1trtQHIj75b61eVS5gssBjIBzk1KE/9I8YFLhRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521236; c=relaxed/simple;
	bh=fcTtzHF7gWsSvucVbLas/Xk6BXcFxykzA9hcJy3JeRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKzvcYWsoxrCmUqwyqHMfok8Z49Hyt+xuQMXQjqLd9GUjQBmmkzvY8wP2TDrMMucu9nWHw9MArNi5+0Tob6rBaYg8k28MJot+XuVOvx5oC+CBJ+KBzvp6ya2mZq6sjjmxz9HVJPTmDA154fQxfFKrCXDnt8UlNKnqnKdFv1AcXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=LUNMGrbH; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso5498118b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 12:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521233; x=1767126033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfrUlgr4mKAwpRgF31HqFmZ+jq2Qg/gWBBCl9WoQ4uk=;
        b=LUNMGrbHejcYyFw2a6c/kwd75fcTpoU1Txm3aDp5WPaRLflEN5x2KyQhCtoR9nYbgT
         G52WiWvsYMxeLN/e/NSOuMsHnDfXefk6LgHaMbT8DP/khfakpFdXf78tzEfqEQYq9umm
         8rUPkhi3lgUD8VCN0hh0xf5Tv1It8Rv1rO+V2kqbTcq9xtv6gqraS5r9CYDAF0oDXnwy
         A6H/V+0geM16PmRCt0ZWpCoe9tUowVQVnULVxxmuV0eluI1StV4l38cNFbXf7zru+Fid
         /S+ns2Pa9hMFFGRmLhFQ0nB62Ctm1T8/RBYKVCWZIl/75WNAdNzC5Bt5WKa2FK2zeCHI
         z4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521233; x=1767126033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfrUlgr4mKAwpRgF31HqFmZ+jq2Qg/gWBBCl9WoQ4uk=;
        b=IaDJ+99V9FKYVnjhN0LPFPO3MmFFQV++4EgGDwekp3qcTnFvcp+4q7ws+tHDW+fbt+
         56ekNynRJ2QqwUukM7bgiVP0O+3LPkJE95v7h7++TWxgmy3DIVTRJgkl9s1dgg0Q43kK
         KLNKi4X1gkUo+eF2fRyMjwK5UB857mSxSE3z3qYwonQQOKKhBnYzux0fU0vUMrZV0SOH
         u0t1ZUMAqac6h55bn02xx+eEmQphq7Nf4vITL5hGZgmh3inh/I9urhOynLmhMcxUPQmR
         V8ItsKMZPwiYlLhrchaR05eYVp/0XlczorcM/M3EqbNJC7+iBJ6/hRpQjz0U0n7Kuzn6
         8LDg==
X-Forwarded-Encrypted: i=1; AJvYcCVlJvRdIZbm2ncaWJPd0GHXrG1ielmLKCrdBGNYkYodmrrlGRgF1fCmHh4b6oAmvVjFLKuluWY8wo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8iXrpTTWQ6Xq/uPboe8MmLhQEOntvqqxK3sahgvbSXMzCum81
	vodidgDZ1z9DpiWG62pyThoYmgRIeqChXqgqsHFfuBFPwx7KrKWRJUexe11BIpH9uSo=
X-Gm-Gg: AY/fxX67UsoeEgBF0lU2CTuCHOv5vmhMV7pD8h7HVxy2rnTOmuH/gLTrO6yQETP/6SD
	5sro712WD6886PFO54mpUy04LnW1x7ExGXdK0TAx80jJIQDnBPZ7qIxBhxqUwypp8dweCvpLazu
	JJaG1FUAJ1ZOV+Cc6FSew3LNujezc9uCBrYqUi/nOqgdPY0Oi6iQFnnqF9jhWNlqPaDm6g7TGjD
	lyVyVQZu2hEopHhSAkhC6QT/4NWgB377QiPbHGXoHUAGfC6mT4PkefJmMb9ZPXiFMJO6mzOEcjN
	fmjCSTmWMFupZ8fP33NQJH9LXRSGI+ca9z5IlwBjifz6AsSieoG8nH+a3hk+X6M3GCefUBuXD94
	XLTJKcGCHFVABi3A5Y0YMsQYjl+tOu60tnJJI1nULSKvA4U+u9b3VcWhO/6ZYcud5LqeZXEocHH
	o9KyKzBxgAjEKV0GaSUXx9LieQUHIvnTw5tkuH6Yp75IhngBApzepl1296okTJp/OQLscLBiaV1
	4uKoeQ6
X-Google-Smtp-Source: AGHT+IH+vGo67Kz7b+8QZvoO1bYGr/XHDGO/seoLyNk1DncRQFKXbN1uskDp9cfikbL8HUPUhf7HaQ==
X-Received: by 2002:a05:6a21:32a3:b0:366:14ac:e1e1 with SMTP id adf61e73a8af0-376ab2e706dmr14672619637.71.1766521232584;
        Tue, 23 Dec 2025 12:20:32 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:32 -0800 (PST)
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
Subject: [PATCH v3 06/15] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
Date: Tue, 23 Dec 2025 21:16:17 +0100
Message-ID: <20251223201921.1332786-7-robert.marko@sartura.hr>
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

Document Microchip LAN969x I2C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index e61cdb5b16ef..c83674c3183b 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -26,6 +26,7 @@ properties:
               - microchip,sam9x60-i2c
       - items:
           - enum:
+              - microchip,lan9691-i2c
               - microchip,sama7d65-i2c
               - microchip,sama7g5-i2c
               - microchip,sam9x7-i2c
-- 
2.52.0


