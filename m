Return-Path: <linux-usb+bounces-3722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773880456C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 04:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C28942812F5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 03:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2DE6AC0;
	Tue,  5 Dec 2023 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pLjwRiyP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F3CCE
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 19:01:24 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-db5404fdfb2so3275081276.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Dec 2023 19:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701745284; x=1702350084; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RVN/UyIKfUocTS971YedMZD71CaFzOVitN/DmVfXb7o=;
        b=pLjwRiyPofMjLt+dbqCNQIV8FiXFgjEgJV3ty7RRKj08Fq7RS8c1yzSEInk9fyWPfC
         0y190FA6IuDvTTein7GUb5D4UipMSzzx3CCpMYgbP8eABtLjW1nKavlXX1oxognqkCy6
         1iKWrFA19LBDFt/lS19N6PmUKcV+iOiWXV9JZoDck+hBqHmzxyaSHEXnVBZ/xLCQk9K1
         F8cVXZN9lV4+C0LsJoa+Y3rGKIYUY28zEUCfdHAyMZD+SX1bdJyzGuorCEGgkXS6jpJY
         Fm7rmRcjC4YG4QOV0tgUh74c4dgPKKfGdabZSJ9z2E+BDlQ8vzHql1c1pC6Z/ePiDkvw
         nLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701745284; x=1702350084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVN/UyIKfUocTS971YedMZD71CaFzOVitN/DmVfXb7o=;
        b=loI1Xg3lOnjbtIiARvid4u/VM3vW4OsP27JdnvHqwJNnKhk3YmYnPPOGpvGXTkFvoo
         vG33QbsMyWuHQzpE9IXzAnKgoqgdSc6hChb4BkFpFLYZ7Syqu+a3pHrfYSoXmma4nj60
         5WhCCIo1C2DvGS5Mw3Y/Je+tKdbqwlhJ29xZSmOF88qcb6aoz4Kp3hTDNO+lwieuFzAO
         CG0wvKKsgcgkx7D/BB1OtYskVfRlsWM/dq06CbkIf0YI/h+SuSPwjgNxIjvToWGG1Y/1
         bZZMT6Z+8toHFixhmfVexfDgiqJTmKCiI5v0Cwu+q12/Sid7rTVasdoUMN+hkGr9cD3r
         9mmQ==
X-Gm-Message-State: AOJu0Yzs5jszzfWJi6R/t7A8MVKTuqAZE7qg+MIjspCvAIK9iGOkoFrf
	5scOvCqb+j2HaV2YGXhHtKiz6gzpVkK2
X-Google-Smtp-Source: AGHT+IGr1CA0HYxMGxqnHV2w7hHHn8podQKfyMatY1A92sO17LKhvVGwcmkEByID4hmcE1VKawqjkCVaCxwa
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:ac51:a57:5e72:a957])
 (user=kyletso job=sendgmr) by 2002:a25:da49:0:b0:da0:6216:7990 with SMTP id
 n70-20020a25da49000000b00da062167990mr39881ybf.3.1701745283874; Mon, 04 Dec
 2023 19:01:23 -0800 (PST)
Date: Tue,  5 Dec 2023 11:01:13 +0800
In-Reply-To: <20231205030114.1349089-1-kyletso@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231205030114.1349089-1-kyletso@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231205030114.1349089-2-kyletso@google.com>
Subject: [PATCH v5 1/2] dt-bindings: connector: Add child nodes for multiple
 PD capabilities
From: Kyle Tso <kyletso@google.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB
Type-C") allows userspace to configure the PD of a port by selecting
different set of predefined PD capabilities. Define the PD capability
sets in DT for better configurability in device modules.

Define an optional child node "capabilities" to contain multiple USB
Power Delivery capabilities.

Define child nodes with pattern (e.g. caps-0, caps-1) under
"capabilities". Each node contains PDO data of a selectable Power
Delivery capability.

Also define common properties for source-pdos, sink-pdos, and
op-sink-microwatt that can be referenced.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
v4 -> v5:
- Fixed DT_CHECK errors

 .../bindings/connector/usb-connector.yaml     | 88 +++++++++++++------
 1 file changed, 59 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 7c8a3e8430d3..7945d09d1f59 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -14,6 +14,8 @@ description:
   of a USB interface controller or a separate node when it is attached to both
   MUX and USB interface controller.
 
+$ref: "#/$defs/capabilities"
+
 properties:
   compatible:
     oneOf:
@@ -67,6 +69,15 @@ properties:
       model it as a regulator. See bindings/regulator/fixed-regulator.yaml
 
   # The following are optional properties for "usb-c-connector".
+  source-pdos:
+    $ref: "#/$defs/capabilities/properties/source-pdos"
+
+  sink-pdos:
+    $ref: "#/$defs/capabilities/properties/sink-pdos"
+
+  op-sink-microwatt:
+    $ref: "#/$defs/capabilities/properties/op-sink-microwatt"
+
   power-role:
     description: Determines the power role that the Type C connector will
       support. "dual" refers to Dual Role Port (DRP).
@@ -119,30 +130,6 @@ properties:
 
   # The following are optional properties for "usb-c-connector" with power
   # delivery support.
-  source-pdos:
-    description: An array of u32 with each entry providing supported power
-      source data object(PDO), the detailed bit definitions of PDO can be found
-      in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
-      Source_Capabilities Message, the order of each entry(PDO) should follow
-      the PD spec chapter 6.4.1. Required for power source and power dual role.
-      User can specify the source PDO array via PDO_FIXED/BATT/VAR/PPS_APDO()
-      defined in dt-bindings/usb/pd.h.
-    minItems: 1
-    maxItems: 7
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
-  sink-pdos:
-    description: An array of u32 with each entry providing supported power sink
-      data object(PDO), the detailed bit definitions of PDO can be found in
-      "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
-      Sink Capabilities Message, the order of each entry(PDO) should follow the
-      PD spec chapter 6.4.1. Required for power sink and power dual role. User
-      can specify the sink PDO array via PDO_FIXED/BATT/VAR/PPS_APDO() defined
-      in dt-bindings/usb/pd.h.
-    minItems: 1
-    maxItems: 7
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
   sink-vdos:
     description: An array of u32 with each entry, a Vendor Defined Message Object (VDO),
       providing additional information corresponding to the product, the detailed bit
@@ -166,11 +153,6 @@ properties:
     maxItems: 6
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
-  op-sink-microwatt:
-    description: Sink required operating power in microwatt, if source can't
-      offer the power, Capability Mismatch is set. Required for power sink and
-      power dual role.
-
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: OF graph bindings modeling a data bus to the connector, e.g.
@@ -231,6 +213,20 @@ properties:
       SNK_READY for non-pd link.
     type: boolean
 
+  capabilities:
+    description: A child node to contain all the selectable USB Power Delivery capabilities.
+    type: object
+
+    patternProperties:
+      "^caps-[0-9]+$":
+        description: Child nodes under "capabilities" node. Each node contains a selectable USB
+          Power Delivery capability.
+        type: object
+        $ref: "#/$defs/capabilities"
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
@@ -238,6 +234,40 @@ dependencies:
 required:
   - compatible
 
+$defs:
+  capabilities:
+    type: object
+
+    properties:
+      source-pdos:
+        description: An array of u32 with each entry providing supported power
+          source data object(PDO), the detailed bit definitions of PDO can be found
+          in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
+          Source_Capabilities Message, the order of each entry(PDO) should follow
+          the PD spec chapter 6.4.1. Required for power source and power dual role.
+          User can specify the source PDO array via PDO_FIXED/BATT/VAR/PPS_APDO()
+          defined in dt-bindings/usb/pd.h.
+        minItems: 1
+        maxItems: 7
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      sink-pdos:
+        description: An array of u32 with each entry providing supported power sink
+          data object(PDO), the detailed bit definitions of PDO can be found in
+          "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
+          Sink Capabilities Message, the order of each entry(PDO) should follow the
+          PD spec chapter 6.4.1. Required for power sink and power dual role. User
+          can specify the sink PDO array via PDO_FIXED/BATT/VAR/PPS_APDO() defined
+          in dt-bindings/usb/pd.h.
+        minItems: 1
+        maxItems: 7
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      op-sink-microwatt:
+        description: Sink required operating power in microwatt, if source can't
+          offer the power, Capability Mismatch is set. Required for power sink and
+          power dual role.
+
 allOf:
   - if:
       properties:
-- 
2.43.0.472.g3155946c3a-goog


