Return-Path: <linux-usb+bounces-4278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FF58158B7
	for <lists+linux-usb@lfdr.de>; Sat, 16 Dec 2023 11:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8DA91F25A61
	for <lists+linux-usb@lfdr.de>; Sat, 16 Dec 2023 10:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192111798A;
	Sat, 16 Dec 2023 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jSuT57tB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABE1798C
	for <linux-usb@vger.kernel.org>; Sat, 16 Dec 2023 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1d1e2283b6dso18816205ad.2
        for <linux-usb@vger.kernel.org>; Sat, 16 Dec 2023 02:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702723600; x=1703328400; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0q+Zfqxq2/R8EkmwJGu4avOaoQHM8BsDRaRgTFlf+Us=;
        b=jSuT57tB7m70zlOiU106UdPa3/FsCHFMcws2mzGChsxXZBBC1VY8TaLSk7/x86FdbA
         JOLgUxyTBYH9aPXvZEbFautPOnjuZlzn8B5ALjqt2y5YZTReeKwQW3nFdBZDLHPylBSu
         7zlYZ6VdyjbAqgYCLHSSAI1L5AQ0UBL1G/nFT7lsoILBXBqIsK6SWHofxyRnU7RvIQLm
         hcH0nMXypaPpRHsT6VPtuLiO36TGb4eCzx9240YdHsKhzQ2og6TNVuQ1REG+fjYD2Cmt
         0zxohk8NpLpyJrz3Pf8j4Y4R6eh75HPn+xr3scRDvHRxF0RytN0SmT9w5aKbj6Vtc8pQ
         /Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702723600; x=1703328400;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0q+Zfqxq2/R8EkmwJGu4avOaoQHM8BsDRaRgTFlf+Us=;
        b=Yq5bFM0/xBQaTzhS913//lSrdLOc9rWko1dZHBfqOWfBwkQ/33p3DGB5PZliDLs3Au
         jevFWCOYFslKfBuR/DTKQVreXk4c6ciq1IhjaohaM7rp1/B1S4wzTgKP4ztOuQ6SrGIV
         dhtgwkPDGUOKYDsvG+WE4rKDJdzbVy34SnKabN0xpVwwEDRrlnCFEbPUVF68fqDqIQBe
         pGMJjx0LjQyE5RhQQFyKDcv2UbicdRJwakGNCxdTx0iZfelFdLvsptWgGSScAFXe3LoD
         0Es68hDlR6T1d6aIL/XqsdC9dsKx1hmEn9PeAObSvQEqOqHvltBYHgS+oCnzPZCw5dhE
         D4ig==
X-Gm-Message-State: AOJu0YzcUjgQ1+rfHO+KyAXCWAxm5XsbCwMXyF2o99qTkvfqB9M0rPVw
	MYkJzUqipzopy0oT40cpMnTdd/zHNV7N
X-Google-Smtp-Source: AGHT+IEN0TVakGsmf0aEqYEvqxP6CCJgxrPE13UXNLaoi+YtzlafK4M84Pd9Xyxtj2IUoWujx8G8APDzQiZw
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:dd61:6f37:fe44:8be9])
 (user=kyletso job=sendgmr) by 2002:a17:902:e881:b0:1d3:8ed4:dddf with SMTP id
 w1-20020a170902e88100b001d38ed4dddfmr169842plg.11.1702723600354; Sat, 16 Dec
 2023 02:46:40 -0800 (PST)
Date: Sat, 16 Dec 2023 18:46:29 +0800
In-Reply-To: <20231216104630.2720818-1-kyletso@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231216104630.2720818-1-kyletso@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231216104630.2720818-2-kyletso@google.com>
Subject: [PATCH v6 1/2] dt-bindings: connector: Add child nodes for multiple
 PD capabilities
From: Kyle Tso <kyletso@google.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>, Rob Herring <robh@kernel.org>
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
Link: https://lore.kernel.org/r/20231205030114.1349089-2-kyletso@google.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
v5 --> v6:
 - Rob did some changes. So I directly cherry-picked it from the git: https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=0d3a771610d0e155c9aa305f142f84dda5030fae

 .../bindings/connector/usb-connector.yaml     | 81 ++++++++++++-------
 1 file changed, 50 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 7c8a3e8430d3..5a93cdb9fdbc 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -66,7 +66,6 @@ properties:
       Particularly, if use an output GPIO to control a VBUS regulator, should
       model it as a regulator. See bindings/regulator/fixed-regulator.yaml
 
-  # The following are optional properties for "usb-c-connector".
   power-role:
     description: Determines the power role that the Type C connector will
       support. "dual" refers to Dual Role Port (DRP).
@@ -119,30 +118,6 @@ properties:
 
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
@@ -166,11 +141,6 @@ properties:
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
@@ -231,6 +201,20 @@ properties:
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
@@ -238,7 +222,42 @@ dependencies:
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
+  - $ref: "#/$defs/capabilities"
   - if:
       properties:
         compatible:
@@ -267,7 +286,7 @@ anyOf:
         - typec-power-opmode
         - new-source-frs-typec-current
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   # Micro-USB connector with HS lines routed via controller (MUIC).
-- 
2.43.0.472.g3155946c3a-goog


