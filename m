Return-Path: <linux-usb+bounces-23432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC51A9BF3E
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 09:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED8B1BA0FA8
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 07:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB05230BDB;
	Fri, 25 Apr 2025 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WEhm6XR1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830122FF35
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564936; cv=none; b=fa0eOVnGpBD8zS0QQ+pvbNAHHVlk7wA0YW5FD8oHk+/im0tdzKJRL4MW8GqOmLrsw8X9Ml5Zhiwz8n8JQJ4IPR7Mw+7Q9VGuZeoRqfQ//M/P3WRxjsvBaWvHXW3WQKeEzU1e2p/kudbFjnXDQRLYUlTQumXdS0FggebuVMFYYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564936; c=relaxed/simple;
	bh=X2Z23jKDJsecxCviqGVqQYUJRkbYk4LNa2v6qY+TyYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+FDmelsXRe+v0mOaiVcXMG94RQ+GpPpmWchppNKnARIe2b8FPe5TK7WGq+b8IvlFUECzzpDX1wNr5opmprs00DmRyBGD6aSLklx8hAtYIKtqg/OUBhv+SBhJrtVHFj6rOwopF51pbyV4kOmzKozA0Xnn0xTt11UsJBevvGQFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WEhm6XR1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso21181975e9.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 00:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564932; x=1746169732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9UsH/AGSSX6ZhEgS0KQAvySVPB6RHXjoHgehdLPar8=;
        b=WEhm6XR1vLsJ7Wy3zwHBAhFrVXySCqvmdQ1nUmO5djp9zn27Rc357jEFgnyM/2sVJh
         j3fk28TxHLz6FGhAXR0fZRASQlumM9bJPV8Txq3HfySNPymyYxE0i/miGWLGJD1KrI8v
         1AEl7ZfJvzFpukvarrZz4K3XwPBI/VeRzlWRfmZBzBKmz7XrwuDI4zNMtMCa2IoohTeZ
         oOieltvZCZEe3MAioVpANmH0dtnrEbt5zPV50UrNH0QHdtwM/pGNPhsAKgVd2fiyrmgj
         NzRGL07iqObNxlImWjSNwUIltIzQ9YBMDqg5C9ScnFGJhzNYXsO/O0SeKUWT97HQ759s
         I9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564932; x=1746169732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9UsH/AGSSX6ZhEgS0KQAvySVPB6RHXjoHgehdLPar8=;
        b=WVm1vrDNHhLHCKl45a9Ez/cYND+X2GEdWWPpOuJW6NIyrrL/1YMUnll42TFO78FG46
         fIeZL3Ohlu3xKBqpTy6dSMaDo8QUMySiDGm8tpCBVCzzJ3YjkQmIx9fzUCVF2eqPM7KF
         gyA4/IXAYTsG6oIzK43hwMPP/7+c8Y5b7ThvTBGsTjPS9bAbToHWOgEn0ihBKAv0JkzR
         jCEdlSn799qQQqGNil+D8/8OnL7c/ZoF/DDNwD4qViCOaYRxOXykQ7IhZ5CoSrtSIofI
         +rIOSFefgOu6XXT+fA/UR91NEZxDX8QFLqMsUAZsi9r4oWleNvQwE3vcsxTKwGYOu/Sw
         hy2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBgf4J/qHDD/uibqiXu7b3GCMpbkT2Rq3XSuNMX+7o2QIMp6ercknGufBoOXSOmdoNRLFDh7whZUs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr2LwZPu8eV6eZjAzil5LhjFPY4SDsI0kdhaG1LBExjPxAQ5y7
	0xwF2ZPBdFeVbwwTMwGkC7Gydi210SDFOFP56aX0GPYIPYJPnQvh5QrfMO9i1Og=
X-Gm-Gg: ASbGncuFdme55pVpTr0VMNSjXMWv57m98CV12HSvgvteeYYSnQSvczdTDK/D8we2qwb
	wyhGJfODq0LvYG6tgXH/+b9TwQgOORp6EIk8PPYNJ2n9HpVpSrwg0/R8s6JtyEB/Ugl3tC9srrz
	Px/0mILUUhsUvjSBRL54n7DVhUWt2DuwzlX174wxP2lt5oz0THvvaCt2ehjfWlnTZgpydh1EBI+
	GpJbTts6ax4ownD5NfRxGI7DDqWNCttMi/ZkwrFUwomg2qu3pOgkVd5G/r6k7uKHmM6wuwsrphI
	iJQpQlVtLeHhfepsDW2y+17RuqIB0DAT8wuWnEq4MThy2n6IM50xx4NTg1fWHQWc8nX0Cc04Ow8
	x2nhnGX8xkS9Qe284z8hMbHUxiB9AtJpaMPzg5PQCHKh57YDvhf2LALKP
X-Google-Smtp-Source: AGHT+IEWNtSZZVP35Vam0NTmvm1HOM6Y8YGU+5T5y5xZ0nRYsgjM+CCCJ4GSJzI2hQRQDGH0PBqSqQ==
X-Received: by 2002:a05:600c:3548:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-440a65fe6ebmr9397705e9.16.1745564932540;
        Fri, 25 Apr 2025 00:08:52 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 09:08:12 +0200
Subject: [PATCH v3 1/4] dt-bindings: usb: usb-switch: Allow data-lanes
 property in port
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-pmic-glink-dp-v3-1-cc9c2aeb42fb@fairphone.com>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The ref /schemas/graph.yaml#/properties/port forbids extra properties
which might be specified in subschemas, e.g. like in
usb/fcs,fsa4480.yaml.

Switch to port-base (and specify the endpoint with properties) to allow
such properties.

Fixes: fd2a052ccd69 ("dt-bindings: usb: add common Type-C USB Switch schema")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/usb-switch.yaml | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
index da76118e73a53c0e1c255ff115ff959d256816ba..89620191263023bec800dec114c0017c41b7c056 100644
--- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -26,11 +26,24 @@ properties:
     type: boolean
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     description:
       A port node to link the device to a TypeC controller for the purpose of
       handling altmode muxing and orientation switching.
 
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+        properties:
+          data-lanes:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 1
+            maxItems: 8
+            uniqueItems: true
+            items:
+              maximum: 8
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:

-- 
2.49.0


