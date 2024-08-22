Return-Path: <linux-usb+bounces-13886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D041195BA21
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 17:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B4AF1C23107
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 15:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCFC1CCB2E;
	Thu, 22 Aug 2024 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aMPNvF6t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D451CCB36
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340503; cv=none; b=bwY8yRAYssJESACUWuYNIIYWSmyICiWmy+XH04w88LXpZRzKU/omwyzQsG6/bAoHu0ybSDKBKuVF2dBT4wIxkegG3HiHLRO+agTZkxGLtIRAYSZm//SpaMlSuwKwkc8g4Pm4guCXcyW7OkrR9bk02ONy5/nbP0DwEzEFDgbm7Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340503; c=relaxed/simple;
	bh=osweiIUhbbeltULTsJND2atipL+PT7sQYi1BW5J7EeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XdrxwjhK3RSpDB1oCEAj2N8Cr62S9fwflGcUqNsmaxW241qbk+WbhPkJ8gIknFa3yOO+8Xg/zK4sGteQJ/5RfLzTZJ2Clw6EU0VQkZApVlD6FJLtYCq0XrGDLK1Rwo6hK4f02YEDeZL8Bn/LdgTaw13tCCgtThrVMTsuHDyxBZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aMPNvF6t; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a869332c2c2so118805466b.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340500; x=1724945300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/Tria7vwi+NxmbhPx5iyMMpWnKPFvb0PWDauQE1PU8=;
        b=aMPNvF6tYVZanbqbeZz+ZnKuYXmdgfQ4HHyzR+ll+J1LksJ2d1QpaY3rFbu12OM3ya
         1B+L/PQ/n3wNdMjwMojleb5ptqlmCKOlI0T4mtmlQhK0WiUf9D91FRNZwRIRCzy9qP1/
         T/V2pxJ9l8BZI08f4C9YN+69YS2vzMtDZXmlrfhXiATDhU+ilfcugZ0JhtI21N2yRNjl
         mORqZeNXablIN0PPbBR/lG2l9inIeK4L/4jCWlRx80hyGfdmzOIRPA9BPDE1Lll/wIBp
         3/E9GfkBTl2/wMxDAD+xzrgYF/N8dlfbm1+UJeElQ6Q7SZo6tFi8PeqEpieTQqdjIBzP
         Mk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340500; x=1724945300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/Tria7vwi+NxmbhPx5iyMMpWnKPFvb0PWDauQE1PU8=;
        b=ill3SGfggJ9dD/uDqcOr36fqMUhwn1u1th+BMGv1R9Sb+q4UK1leE6jw27RpB4pwhU
         MCQ25z0Nc536HKvcKD1TWfdSt1tH1poQjSrghD/ttGaqhOXMCi9T5M5o5fKr1husyKY0
         1KzF5/ykl2EXSaCF9jWjT4DbpiShaFxeJ8LlvQ2ACi5SZuIi31i7de3FPR7sgRqUxpSn
         g3g7b5oVDQCZiR+1GxzrPGHEqIdRKUMvuo8uXT45q8ePogLzdocJi1nalBteate47VVf
         wJEVMBe3ZDwH/hsrtN536vud+G+aEnoVn/hxQNFTgVXQpD08Bb3X9J1W6BM0q6Jn6o+Z
         Lszw==
X-Forwarded-Encrypted: i=1; AJvYcCVNuD1vRkWHV8lLylK51PY7X2jlH3WopqB/+pvSDXaCUC1xtDEP6osgvP0Q5Hr3D5/EERZir+QuNuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi3pL1bRP+NjNP2bzwqLXJI4zQywJcA1PwIg8qdSX26Hk0rqTd
	YCMA/dIQV3gcjqzXkyfHQHBKxeBlmrxfvc55YpKvyFg+1hqr2vJe0IrzoXKJKqQ=
X-Google-Smtp-Source: AGHT+IEDGiFS9rTl2gT4mpF+7WDWt9rKV3W2mQ9PNVf1k+OndljloE3v+2XJ/Wih9mrH3Tadrpyqjw==
X-Received: by 2002:a17:907:9307:b0:a7a:a4cf:4f93 with SMTP id a640c23a62f3a-a868a97d6f2mr322799366b.32.1724340499945;
        Thu, 22 Aug 2024 08:28:19 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:19 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 02/16] dt-bindings: soc: renesas: renesas,rzg2l-sysc: Add #reset-cells for RZ/G3S
Date: Thu, 22 Aug 2024 18:27:47 +0300
Message-Id: <20240822152801.602318-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S System controller has registers to control signals that need
to be de-asserted/asserted before/after different SoC areas are power
on/off. This signals are implemented as reset signals. For this document
the #reset-cells property.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
index 4386b2c3fa4d..6b0bb34485d9 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
@@ -42,12 +42,28 @@ properties:
       - const: cm33stbyr_int
       - const: ca55_deny
 
+  "#reset-cells":
+    const: 1
+
 required:
   - compatible
   - reg
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-sysc
+    then:
+      required:
+        - "#reset-cells"
+    else:
+      properties:
+        "#reset-cells": false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.39.2


