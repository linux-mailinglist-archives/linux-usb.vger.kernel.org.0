Return-Path: <linux-usb+bounces-6876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24B785F2E4
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 09:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930C4B24195
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 08:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792B71B7E6;
	Thu, 22 Feb 2024 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xpTbwESL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430DC1862A
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708590507; cv=none; b=BEPfU3TGFup7j5DDcz1AeN7SkTuXhi0Rxl4UvxGkQdWyK7M0sF9AvoQ3nnrZzKZEYqCNfQWgaefe5iYdn5dfh4GTeT36svDCiP51sf2GKMO8Cy6sqhfuqVBEQJg1z4Jevy0mu29iX1uJjRch3HkLVtsccF1iQWK5tYBenORomek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708590507; c=relaxed/simple;
	bh=EvteK50wyl2kprR8zyPWEQOJdijQCkbQp/sp4jSnARc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hI+A+mgLaq8EuM5F0xQ3RUtyoCXLQ60/63RPcuiE5fasAiHy8XtftfKu+PO2LFfn7RoF6qIzSZv2y5Ll7YfY79OOGvtRKadT74Mcc0MbNHHxjv0ka8G7E2QgWXcglRB8y61iITVU9AHOfqkBTVC3QDP2IC1ScI5wGMX7Cp9UTR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xpTbwESL; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3f829cde6dso39649366b.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 00:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708590503; x=1709195303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0K0y7mMwQ6eINvxBjtceE3os6xVsWexBerMPUbtyFps=;
        b=xpTbwESLemYSup/R3juAirb3bJPYOF7B1ZcUO1Z2OE7nUNBJkfUSywLntAEKPiOxU3
         GSEzjwIM979u9w0J7uIwRwKqnm/9yKmVnVNRj64ouQb7WvRPp1Ckrw/3xbMJ9cUGEPQM
         WD3J+X9GCXGVvYE1XP1ehgqgmqkv0cb14pWvTlRUxcWXzS03b4yBxcixk3oJfgfoQwuh
         3WTRbNnbNvuWAon1BIG5ro23l/L7YKe36nVCn4J2/FOJhV91z9S9xaLbTsTCDMsaQyUc
         ikbRBdXpMB72cubkJu5RJWKsbax9sT7hfAsBwVICPHju4u6GlJ45WAq3ZdU1mHz+Y67b
         EvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708590503; x=1709195303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0K0y7mMwQ6eINvxBjtceE3os6xVsWexBerMPUbtyFps=;
        b=t8xI45smKoHu3QYFp4NzcLBGp68rqNvAGqhRbD8kmL8Mhslec0vQ13JkluEA4EcQ9I
         N3TRSAAKCKmMSNqoBroMn6z3C+G+t59CyhLcflPLrkp/MD0kNyjLv3jwxHVDLPvJm+67
         MLUQtWUSrrvOk9XgckPdmI5sYvL9QbzrxSXmcIzcJiK5fPRfAuw0AQWVGh6sZSpWOLXr
         7u6bYh60pwrDR1fRcTLpT5NXD0MaRvVUWB0Ij/VcIhCCHzN86EJXhOxAyU621P6dStG+
         ++BKjTLNMyHesS07a/hOFjVwk6NA8Dr8s6Oe/cxN5budlXWuVsPrdOV0Td8jRGG4BU0i
         vqFg==
X-Forwarded-Encrypted: i=1; AJvYcCXFAN5A+7oMjbCMOHMzxXJajHOnpzsFvrGKtyaPns1N3eEwdSCAC6ep4sa14U+RBgiOhoDgE6+O+vhIKN9ZrAYYKIwSsrfsUokt
X-Gm-Message-State: AOJu0Yz/wUavY1SLcqkTWKgnEQPNTBpgibPi3IjcWlRaEyBKZ8W9zD1m
	tKrg3txGVtdMbzl/6sGgKLx6X3Z64RW9KpRVr0aMmF2+FEWpb9qEk4ZAh2tbNTw=
X-Google-Smtp-Source: AGHT+IH7dW5lx5ijk4XY4dgNzFesrot5udC3LHg/4tTUdJiIgWdnAJqUyV96hgU+dShciHbxpbF27Q==
X-Received: by 2002:a17:907:375:b0:a3f:6b7f:11fe with SMTP id rs21-20020a170907037500b00a3f6b7f11femr1200803ejb.66.1708590503535;
        Thu, 22 Feb 2024 00:28:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id vh8-20020a170907d38800b00a3f28bf94f8sm1600210ejc.199.2024.02.22.00.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:28:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xin Ji <xji@analogixsemi.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] dt-bindings: usb: analogix,anx7411: drop redundant connector properties
Date: Thu, 22 Feb 2024 09:28:19 +0100
Message-Id: <20240222082819.10321-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding references usb-connector.yaml schema, which lists all
allowed properties and ends with unevaluatedProperties:false, so we can
simplify analogix,anx7411 binding by dropping everything covered by
usb-connector.yaml.

Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/analogix,anx7411.yaml   | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
index e4d893369d57..3f5857aee3b0 100644
--- a/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
+++ b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
@@ -23,24 +23,11 @@ properties:
   connector:
     type: object
     $ref: ../connector/usb-connector.yaml
-    unevaluatedProperties: false
-
-    description:
-      Properties for usb c connector.
 
     properties:
       compatible:
         const: usb-c-connector
 
-      power-role: true
-
-      data-role: true
-
-      try-power-role: true
-
-    required:
-      - compatible
-
 required:
   - compatible
   - reg
-- 
2.34.1


