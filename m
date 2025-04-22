Return-Path: <linux-usb+bounces-23291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C402CA9621A
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 10:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDAED3A92C8
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 08:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114CD2980BE;
	Tue, 22 Apr 2025 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="geVCaNVv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA7C2980A1
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310618; cv=none; b=YZkPXXkDsEgccJ3+wCKKAbIz7ChisR/L0hTDaHIEip3MtmQGjxrCcWI0UhGF2Nx4nHnJ2KqwRIJTd6GgbhjVb3u4YlMLqsFs/FJNEzBmA3MDYh8aJ6h5DtrdwsH33QuDBTEMatIld5GEUQCj/fahQ3r+SgbIZdtRorZyx0sMVcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310618; c=relaxed/simple;
	bh=mxkGjy74EQbDXjJNT5mOuVxMkvs+6xBiyP2rOL0F1RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkakxEryRxhl1/N+jOn8OuyNp/ahxceosyQfbwS5nSuSGFUVeZkPl3aqfndx9MaQuqq9AarEJVvV9Wdg5JdekkoHIja9pgdIFXDh/dPyeockSuqaKHCxqfO36KoBQ3hBQzjWbybfLWc/c655YpsUmSbxQXpiV1c84QL2/qityW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=geVCaNVv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7376dd56f60so3439792b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745310616; x=1745915416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MvplzL87H/4ihBut+ua8FE1FYMETCy70fkGX4prNlk=;
        b=geVCaNVviqD2Xuo2KtoRHS3e/kH9HRrbW3YAIxGOsZyzHZxSXNbPGN2a17flByESIT
         fyfyURSn9bQMJtdTAxuRxF8eh6Rdg90Vz6JSyx1ZAbXTTtkHCoVDgXbZ7qBKo+5oG0VM
         Shk4ygUQZzakH1a9GnDr9fF2XfJTwBd8LBg2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310616; x=1745915416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MvplzL87H/4ihBut+ua8FE1FYMETCy70fkGX4prNlk=;
        b=gZF5cLOXPGRjUCJ81PQVvg422caQtKTSOyxGusXKy/NrxJVnv3+eqVmtc3jvMcNpv8
         idinGih8NkKTQa6sXy990KTR/g8bnsyPNmB/VomXBOKPpEe1kVzR7SiCegEITsLvNXvd
         X5bIYGqa7wNf9goApxuPtc7XyTomQbDZ8rRs6RsrOsC4aSCbgJwZ4vuD8YPy08aVFOKe
         vVIfB6wIRCqTjISBg4ng2XfrmbhtEimumkBnPkR+wcoUddlAXwc0YcIV+SHjD4Q7mpq2
         DAJHElxUcBX9J8rrg4LDljKqeISOh06pDZsI1mHxdidYgF6TzM72Ud7ppyik5+T8mqy/
         yn0g==
X-Forwarded-Encrypted: i=1; AJvYcCU7j1Ds/I0+XXMX1od+upct5OjKKjCL5fFkhmbBXWlsNojOI7aJpPRl9UyHQpMIm2NLwioKBiTMWms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZEtr8HqXK0Nc2F2QCSafsWVCPcEv3v20+/zj8252uLlRtuLf
	0JT4CWdmBOYvHKpudKE7S9r7ot02gkcaCEPDcXbjBZs1+R5MJ4qKvW5+vZt7CA==
X-Gm-Gg: ASbGncua+AyvONFOCLmjKGJ162YEehCS2mSnX3mnJjltaMk/I+1EH4+Qqdt9Cu/9uEn
	3VT9yFTqyhmR9HUPFAkT5jnpwVGsQ9r3tqZ/UNxJbJ9ES5T60y3OgIEAjfrXBTvETFiMqZDC+zB
	YFqJCxu8ZzAW8flAmj1szKbtcQUBy6lMyglYCztvAN6k3PrMg2yjUTytZbGzSzI3drkxSJDVJE7
	Hp6hChHwz3iincZvu6geuufUrtDSqbdgqSc6EQ1+THxcRj8+B5hNAgA3qas2sD3zfWyAfm2DMuv
	ClsRn7apxUpdnyvV2eS7GDXLsfT9zSUfs2dMXPBRhjIeJRpnKoIEc0KkQFkg783y
X-Google-Smtp-Source: AGHT+IHELay4Fe7ScimI0hCKyiKwYc7S7OtU/xOLpm2AArEqdrf4gn0UkIULLKLNLVAOqFO0noMvEw==
X-Received: by 2002:a05:6a00:32ce:b0:736:3954:d78c with SMTP id d2e1a72fcca58-73dc14a11b9mr18582101b3a.6.1745310616207;
        Tue, 22 Apr 2025 01:30:16 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:90d6:56e4:9d90:9df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm7993576b3a.49.2025.04.22.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:30:15 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
Date: Tue, 22 Apr 2025 16:28:29 +0800
Message-ID: <20250422082957.2058229-4-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250422082957.2058229-1-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inherit usb-hub.yaml and remove duplicated schemas.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v3:
- Remove redundant schemas
- Update the schema for downstream ports and devices

Changes in v2:
- New in v2

 .../bindings/usb/realtek,rts5411.yaml         | 52 +++++--------------
 1 file changed, 13 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
index 6577a61cc07531..a020afaf2d6e7a 100644
--- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Matthias Kaehlcke <mka@chromium.org>
 
 allOf:
-  - $ref: usb-device.yaml#
+  - $ref: usb-hub.yaml#
 
 properties:
   compatible:
@@ -19,61 +19,35 @@ properties:
           - usbbda,5411
           - usbbda,411
 
-  reg: true
-
-  '#address-cells':
-    const: 1
-
-  '#size-cells':
-    const: 0
-
   vdd-supply:
     description:
       phandle to the regulator that provides power to the hub.
 
-  peer-hub:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandle to the peer hub on the controller.
+  peer-hub: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          1st downstream facing USB port
-
-      port@2:
+    patternProperties:
+      '^port@':
         $ref: /schemas/graph.yaml#/properties/port
-        description:
-          2nd downstream facing USB port
 
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          3rd downstream facing USB port
+        properties:
+          reg:
+            minimum: 1
+            maximum: 4
 
-      port@4:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          4th downstream facing USB port
-
-patternProperties:
-  '^.*@[1-4]$':
-    description: The hard wired USB devices
-    type: object
-    $ref: /schemas/usb/usb-device.yaml
-    additionalProperties: true
+additionalProperties:
+  properties:
+    reg:
+      minimum: 1
+      maximum: 4
 
 required:
   - peer-hub
   - compatible
   - reg
 
-additionalProperties: false
-
 examples:
   - |
     usb {
-- 
2.49.0.805.g082f7c87e0-goog


