Return-Path: <linux-usb+bounces-17902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6907E9DA683
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 12:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E701B25D9E
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 11:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079AC1EF0A8;
	Wed, 27 Nov 2024 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xNx8a5+B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615841EBFFF
	for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705306; cv=none; b=fNHJdTKqMLdyu37EJZ9rplioEoKFNnRAbPcZoDTV47aa7n7WRhO/0utrCS+HK5HyAiEWmI5jFeuXdSv3kYL8Pp1dE7pd+KtrFL6M95UAKlSCfGZRrIKCe3FfNic13zUsXG5cf9ONn/qJ74F8Rqxmn8YXmYLDjLZ2ipS0yUkKh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705306; c=relaxed/simple;
	bh=hOCe6cJ0obVm8UjxsiUQNLMPtCy8NJeg3v7RzQ3z6+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXkEwnAC49PMbfpt65yGvVgRd+DvQEW7owk7gvfC+UG94hwgmE4v4lRxOPFRFXRdvaKhxVcmx31l/0Z77t2qEXPW302o2boOhrkFyFAjUNeP2fALa8viapOZSzKzOh50aS3FbxFVhffs5K5JbZ4kv7b9jChnBKwEwDEpFYaycBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xNx8a5+B; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa51d32fa69so703017966b.2
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 03:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705301; x=1733310101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwFISXzC5YdjT7nYyo3FK0ynEMcXmWD+620yv0Db3ss=;
        b=xNx8a5+B8CdcMO3gctLMUXALIZb4dMFTo/pN/AH0HMm+ge4EWsvZApqW26HOrfX8V4
         AlIQKQECgGIdyQhHNNAIBQ17GB4rvpEhktqearre1KAa4nWgXwc+ZaLA9YyfOk+Qu7uP
         QwmIbk1TcosBLoxPS2j12an5rqeCcz9iX9G/uJw/Ho8Kv252a6Eynjaa6echUkV1EIQH
         OP8CJvNOVHDaiiQ28DxgX/zV0YFoMECK2LHo9MJ7gquqKmnfALH6Pg4/oDYVNVSW9Nmy
         duu4Kg/Prl1oVOnxzHAgeNnlXfsUwD4PYcZG/bMPhrDgfncdSm6VQQA7IYQIjhT7M2f1
         tqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705301; x=1733310101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwFISXzC5YdjT7nYyo3FK0ynEMcXmWD+620yv0Db3ss=;
        b=DqGsV+XHu3/OcqNZcAtViY3NYyZmjRCtALV4lmxYMhMyJlWWtwJ9E4ikB6WjCtMaNx
         6SMi7ZiQH3Bgt7YEKiYHPBBjjMoYHEUPPjgDV2VmI+EOpmQ/kegQixBKJWyx3NeR4Ajq
         Q3a4upF0CkfEAYDe0aoggZI7mGD20CLIY/bQtNGfvj5juRUKjZ2ZPaV7X/xQdUAoSxFN
         GYiYP8nnPNxaqJ+VC9I9SSeMfYOCzGp+KYtpgPmYMTbstOi6F+EOZgiHwpSqDFqdp4cH
         1JC492InKsnTjURZ7vnv15qblT8bG2V8H8z6lUYcV9VA12j/Xx1bJL1Da0Jx+jaKgNb0
         wApQ==
X-Forwarded-Encrypted: i=1; AJvYcCUodD5evvkj2bjXf0G/13UC1IHw5I8owaCnbU9pOekSygwuFrZxXG7WOp0/xtbnLRVbFjXwDEj3NwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8th+jKRwNghhXcZC5Kr0RmmGfOSaZutE5dKL3S8HC63bd+EB
	GKBjzAKTyu6flH5vqbJ0J82xwhPcpd/BRfx+pXgdeDKp7Jwug9yKGDJWKE94Ees=
X-Gm-Gg: ASbGncvQY1qlmLXgf2c5WPt4V/KjXP9/EOx8z1C4w1V3igSK4JKG6Lh2mwYY8ZbnM4o
	maQH0h/U4fyRcmy/6c7N0rdg6HQIrFmdc2XUWqLa9vrh/mC7XtWoWha3mMpaKLCFTsOdxd74XpS
	F6NgEF1HcjTqqAW9waL0CSOtGm7f0y9xq7jLac2KNNCNhDHgZQtSM5s4hEhDeu/Cdi+xA/Ll9+l
	J2fv8BWdyf4f/7QtF1mrFObmGLae/NMPLa9c1GQW77B12l729jvl3pVxYs9VaroXHIBa5TrQ2Hd
	S4yTZ7ChgemQuTzZ+iAvcde3VB0RDrnxPw==
X-Google-Smtp-Source: AGHT+IE4cyy/cDmo8WquVmKFdo7zSy462eB6By+Kdq+zP9Q+Ss+y6AajJ7PIBc5sONgo2uDxTZPy4A==
X-Received: by 2002:a17:906:2922:b0:aa5:639d:7cdb with SMTP id a640c23a62f3a-aa580f0ddfcmr151648066b.22.1732705301452;
        Wed, 27 Nov 2024 03:01:41 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:40 +0000
Subject: [PATCH 2/6] dt-bindings: usb: max33359: add max77759 flavor
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

On the surface, Maxim's max77759 appears identical to max33359. It
should still have a dedicated compatible, though, as it is a different
IC. This will allow for handling differences in case they are
discovered in the future.

max77759 is used on Google Pixel 6 and Pixel 6 Pro.

Add a dedicated compatible to allow for potential differences in the
future.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 20b62228371b..e11ede3684d4 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -13,8 +13,12 @@ description: Maxim TCPCI Type-C PD controller
 
 properties:
   compatible:
-    enum:
-      - maxim,max33359
+    oneOf:
+      - enum:
+          - maxim,max33359
+      - items:
+          - const: maxim,max77759
+          - const: maxim,max33359
 
   reg:
     maxItems: 1

-- 
2.47.0.338.g60cca15819-goog


