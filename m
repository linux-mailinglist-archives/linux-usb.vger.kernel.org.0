Return-Path: <linux-usb+bounces-31456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCDCBF074
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 17:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66052309191B
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 16:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5CB3370F4;
	Mon, 15 Dec 2025 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="f/Uk4jf/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFCB335572
	for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816735; cv=none; b=RJQtslH+dIIlbJ+SLgleqM+0M6kvK6nM05TWrCpphJJdacW/xWjSXzy/O1EfAy6HyVIeiwT6fAlP6ZVBeBqFR3igTKjcIXGQaGIiEVw0SDs36VZWJnMKlHKQykI7Tj2XRUUrBVjdAqFO4uYIyTJwYjrZeUKsjLZc9+EhF4RWnf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816735; c=relaxed/simple;
	bh=scXnJzjuPLNSqcnBYVeFur/Bhfo2CWH8BsQkTIJqlg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KV37AwqI9D2JlK8vPYjlNO6ewB/Z5zFjyPCsf72wFL5EQ3jNvgDz0b/UJknHjFwwgHHoIVLb8eKUUkOT4JiZ30jICIIITFpUTf4bpkbBvUleQ3LVM8yWMF4d8Q0w/KNb7P5FGZsVz5dR/OX3y0wUc17So/S1H6NS2dhWF+zMAoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=f/Uk4jf/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47796a837c7so26844825e9.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Dec 2025 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816726; x=1766421526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPjIyKwQFm6/JfqeS/3dLKxm8lxQV1Fis85PngA8h68=;
        b=f/Uk4jf/MCQ7QC0/lGEeRSSR47tTDriJfcTMv27DyQbaioho2/kAASrIt4a5+bYcYp
         ZJgpkKLA0nJDcMozIad6cn7rJdLc8Tm2E1zkk7ff/1FaOdqF6orReOxSR6o9vC5O1ckZ
         lZ9v2aWwesGBbtKVw8svbs7pCmctke6m6FrgROnx6TyUHDH7tYZCV89BQ7uHWWPIfCyj
         4CPf0hQ7/AU3x6gjMkqA/nU8pR9spOwxinJhS1d59wtu9cEJrWe623vqvNQad+4XGDc+
         z0nYFmsZ5fenhMoFo4LqgmQjgdpmhimZkSqa2fAEsMpfbFFZXZ1Z/36xrTxv6Fyz1wuX
         7d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816726; x=1766421526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPjIyKwQFm6/JfqeS/3dLKxm8lxQV1Fis85PngA8h68=;
        b=kxUb94aDn5zCPMTjwgONHNbTlhl0SyYNQXu3h8AVmyhLLuKjoUcqPGDaMmiWCm5NNC
         6ib4BTW+F8ppE8kumFB9/uQikmQfH0vnfNz8WEddE6bqz7JVSCAnnGS74uCIwyNPE/lN
         c0hL0un0nXIUhKmBXuMEoA3lGMxmbvp55iR7+6imsq0v13/QqNaGYDvfokESmOq+A/Or
         /UyeUC+2gv74aOFhZwoctdEM+LfAXMiKqNh/rN5saehDSUxzWEdX0cuGISBxe59pd42+
         B6fmMmjl4duYo8yQfKvaBsUKM/Rvlv1XxgmjM0IMQYoeOLwXXxncDmq3r9ZvOWjHOCAC
         e19Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxNWVPLraNcfg1f/OHGL44Uo9aU2m1GHlmBJyZPMj/xvvgFbfF+VWyqL7nGcz+19DgZhlTBb/uH90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Dhs739DWOmMHtQDCvfOXL6p6Ynh2ULe8c65eKwN6EbcH9IjK
	RkRU7wZ49owIjV8Psf1dQaP7ieWOlA0H1CpsX8PXjdXIJ7pNUIkbR4d1iQhOFb9z+JU=
X-Gm-Gg: AY/fxX6oRderxUxfkpbFPJn5of+3fa5n4lS2DwMzCknNKgCVIRJUDN5o1p1/PcgoO0q
	rLVE88zvgyE3p1RzH/op+xbTvBK/icFiZwrMuK8KiOm3diynaTJGwt6N6qNuFDIUlCckldsGLVX
	SCkF+NgNmCZefTaDx8+gzznFSAhF55GRIA/hTT8ciDM1PNmWMOaLBmY07fmnlyHe8NODreGa8i7
	aZ2vPHWCD5hjRlRsSxvDxG/eCq7VJ4qASB/7B6AtVeBRliVbks9sbHvaNGibV8lt7ZwKnyFIWrO
	ir7VgVxeKoY10w44FawBXFlqIfr7EgpgSFuFvrJ4/pmb5xn43NBFIO5sEKh6zVtijkrkLoKgl1e
	BtqXjFuf5oql+axFIJgDO7yYGKU2eTITjzepP9vsce8lePbEPJ/Z+p+TtKnIUDzDSg1/KbbEBDM
	UK1VJCfCjZAw39y6xextdGE0DCncRWzUv9l01l3YpYogfS
X-Google-Smtp-Source: AGHT+IG3as62jY6VN+R9xsd44rJLyQGjfxg1Etzm6TzvOyKAMBySitGXaUcEuYOfJtLLJDAMKGWwPg==
X-Received: by 2002:a05:600c:1c29:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-47a8f917acdmr137389255e9.35.1765816725969;
        Mon, 15 Dec 2025 08:38:45 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:45 -0800 (PST)
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
Subject: [PATCH v2 08/19] dt-bindings: spi: at91: add microchip,lan9691-spi
Date: Mon, 15 Dec 2025 17:35:25 +0100
Message-ID: <20251215163820.1584926-8-robert.marko@sartura.hr>
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

Document Microchip LAN969x SPI compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
index 11885d0cc209..a8539b68a2f3 100644
--- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
@@ -19,6 +19,7 @@ properties:
       - const: atmel,at91rm9200-spi
       - items:
           - enum:
+              - microchip,lan9691-spi
               - microchip,sam9x60-spi
               - microchip,sam9x7-spi
               - microchip,sama7d65-spi
-- 
2.52.0


