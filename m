Return-Path: <linux-usb+bounces-5340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7340835E6A
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 10:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A7261C22CF4
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 09:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDE439AEE;
	Mon, 22 Jan 2024 09:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MghA8fCp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2239FE9
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705916654; cv=none; b=s/B6+HnqPADnOA5szcTEmEwQ5uAsnu7uHkvyWQGGOmFJ1zX/XkE+NQFhQ29LqERDhGb0chNsp3dS7riHWVbPdg7/itJuuKmsmJYZXnhBiF4Al42AhlUCWzp161/4vityjdTJRetP2VFqo8KC012oLBlKV1yl8mi8vJb4L+SYSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705916654; c=relaxed/simple;
	bh=hB8g5YkR7Sld/uhp8W4eAEYyFbFhiu2UNkWnfpYjh4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jPI115bmrUNd+PD9MdacLMVNgrMn08cPFD5T8efqhkAYqSUfvTgN07kecw/wpKvEepXpMHX4LsvBF2yV7bYN984UWT0ZBwwuoYiYGOjCDRP7sbELcUOa3/M4BGHGdKf6GPkIit4TeRRA86uqZ7Y1BRSPXW6vFBxdzghmkXTpJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MghA8fCp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e5afc18f5so33062985e9.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705916649; x=1706521449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyskIm+mWWi2cKlcJh017DM9BpiO7GgRCHqUYIzx2oA=;
        b=MghA8fCpGFDCRDKH97bXBZz0/CLlQK0fSzY3vxB/61L5mgGjZ5yD0lvxD5kfaVrimV
         qioUQ71pOHtrrLiSPLmIuGn1L3oWfvZX4pJ7IYtfT+RBEjvGLkzALy8rJXKBvlEjnsDY
         S6VieROb8tTDfxhceWFFSEpf06imxmI0R1FbO26KI8XyeABe3WxqKSWgEoBTYvKfcau8
         GgPBuoaH7A+TysgLANOhZ2OaRZLZ/dnjSOxSd67VPQ8zvuX2tkWVQK3HiW+fADIwG4QD
         Avb2MLMveJGjoVTyNnbKnIfH+11dASHjL1k1ju4ecOgZ81tGI4b6nCxezMHHzjaOzh3I
         EX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705916649; x=1706521449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyskIm+mWWi2cKlcJh017DM9BpiO7GgRCHqUYIzx2oA=;
        b=Swa31W4HEjwk9jDxdfsmZRcyfp3qGHAGO+3o7KRXzxlSw24m0V5LMf1cJGQwoGjoWT
         TaBa+WxnbGoTC4P4IPyJK2aWD2sTFAnwdXQnrJkS4HN029mp3mjBLp2zhUv2SKukoSWx
         VTF1h8OcWY/C06aIFlvlvof4yAdqpttyCnd3XX/j0LR+dLZS8ZBLG689vQ0ns66qsA94
         AJ6WIGm6MI9JGKDLJXtS0fp9mXn4UaLc/9ypoBynIOJpkhy/YxVaHI27V9NGeQicfbpx
         ca/jEOAkZ4l3tCI1x+o6yDbdx6lwqycCoKLgWFfdKMbpv8Y3fYaUwSAZ6GTOuFdUAIVy
         Dh9g==
X-Gm-Message-State: AOJu0YzE2kxYLBPMeVPLh/GfQT206JvYOyVEVsmLmQzw7X2rqM8ZOiJC
	t+qLyhNqJiSF8oC68MSPhOhRBfqZxwfc5N0uEfv7mqxg2rfV5twGtNHeZOuoGpM=
X-Google-Smtp-Source: AGHT+IGav0UAB/Grh4y4yBbUmzGU7vmiQBDd+GRdQyMB9teQXJrum3ZAhKWom3R6HtYu2x7//yrCGg==
X-Received: by 2002:a05:600c:5491:b0:40e:a964:e6f8 with SMTP id iv17-20020a05600c549100b0040ea964e6f8mr1194790wmb.17.1705916649136;
        Mon, 22 Jan 2024 01:44:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c3b9500b0040eaebc4e8fsm2093368wms.1.2024.01.22.01.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 01:44:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: usb: add common Type-C USB Switch schema
Date: Mon, 22 Jan 2024 10:44:06 +0100
Message-Id: <20240122094406.32198-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several bindings implement parts of Type-C USB orientation and mode
switching, and retiming.  Keep definition of such properties in one
place, new usb-switch schema, to avoid duplicate defines.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix language typos handle->handler (Luca)
2. Drop debugging left-over (Luca)
---
 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 12 ++--
 .../devicetree/bindings/usb/gpio-sbu-mux.yaml | 12 ++--
 .../devicetree/bindings/usb/nxp,ptn36502.yaml | 12 ++--
 .../bindings/usb/onnn,nb7vpq904m.yaml         | 13 ++--
 .../bindings/usb/qcom,wcd939x-usbss.yaml      | 12 ++--
 .../devicetree/bindings/usb/usb-switch.yaml   | 67 +++++++++++++++++++
 6 files changed, 92 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/usb-switch.yaml

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index f9410eb76a62..8b25b9a01ced 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -27,13 +27,8 @@ properties:
   vcc-supply:
     description: power supply (2.7V-5.5V)
 
-  mode-switch:
-    description: Flag the port as possible handle of altmode switching
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  mode-switch: true
+  orientation-switch: true
 
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
@@ -79,6 +74,9 @@ required:
   - reg
   - port
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index d3b2b666ec2a..88e1607cf053 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -33,13 +33,8 @@ properties:
   vcc-supply:
     description: power supply
 
-  mode-switch:
-    description: Flag the port as possible handle of altmode switching
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  mode-switch: true
+  orientation-switch: true
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
@@ -54,6 +49,9 @@ required:
   - orientation-switch
   - port
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
index eee548ac1abe..d805dde80796 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
@@ -20,13 +20,8 @@ properties:
   vdd18-supply:
     description: Power supply for VDD18 pin
 
-  retimer-switch:
-    description: Flag the port as possible handle of SuperSpeed signals retiming
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  orientation-switch: true
+  retimer-switch: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -49,6 +44,9 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml b/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
index c0201da002f6..589914d22bf2 100644
--- a/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
+++ b/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
@@ -21,14 +21,8 @@ properties:
     description: power supply (1.8V)
 
   enable-gpios: true
-
-  retimer-switch:
-    description: Flag the port as possible handle of SuperSpeed signals retiming
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  orientation-switch: true
+  retimer-switch: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -95,6 +89,9 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
index 7ddfd3313a18..96346723f3e9 100644
--- a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
@@ -35,13 +35,8 @@ properties:
   vdd-supply:
     description: USBSS VDD power supply
 
-  mode-switch:
-    description: Flag the port as possible handle of altmode switching
-    type: boolean
-
-  orientation-switch:
-    description: Flag the port as possible handler of orientation switching
-    type: boolean
+  mode-switch: true
+  orientation-switch: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -63,6 +58,9 @@ required:
   - reg
   - ports
 
+allOf:
+  - $ref: usb-switch.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
new file mode 100644
index 000000000000..da76118e73a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB Orientation and Mode Switches Common Properties
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+description:
+  Common properties for devices handling USB mode and orientation switching.
+
+properties:
+  mode-switch:
+    description: Possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Possible handler of orientation switching
+    type: boolean
+
+  retimer-switch:
+    description: Possible handler of SuperSpeed signals retiming
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the device to a TypeC controller for the purpose of
+      handling altmode muxing and orientation switching.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Super Speed (SS) Output endpoint to the Type-C connector
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Super Speed (SS) Input endpoint from the Super-Speed PHY
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 1
+                maxItems: 8
+                uniqueItems: true
+                items:
+                  maximum: 8
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
+
+additionalProperties: true
-- 
2.34.1


