Return-Path: <linux-usb+bounces-2359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5277DBE98
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 18:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEEF51C20AF9
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 17:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FD51945C;
	Mon, 30 Oct 2023 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dnkuBXmB"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E619469
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 17:14:02 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E87B3
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 10:14:00 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a7ed6903a6so49052837b3.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698686040; x=1699290840; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8iKDVNsfQwoRxvvaiYCTHXcr4RTujdFfq5CMELZsH0=;
        b=dnkuBXmBEng6TyQi9oKbkeeiXz7SZVRKOHuqElRgAZQy+14HPuTf4oUstfyka50zht
         B2WX87SkdQQD6IdvwD+miiJHLvg0u4d5+aVDO0vBu1hXEwOtlpWqEcSsx8be5pZPHmY1
         dCCJYU5xmWzVb0OxJ2N/ojYorcCuuahlUH+d09sVTwkm04PYgSIEEGs7gvYZRyN4N1eP
         e3bv+yX6xuDLUfvIHG1nmv5PDkstz7KoiMAKe/47yPsM3P1hn7GzJ2XZ2veppQr0kEN+
         n5W2F/BfIWBaYh1ZC19Yi/j9h2ACUIXLJJjvMI9JVfxE9z6nLiFWvNYy8nghTdjLYU8J
         qBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698686040; x=1699290840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8iKDVNsfQwoRxvvaiYCTHXcr4RTujdFfq5CMELZsH0=;
        b=cyGVF/EJIJ782dCp2lMAt2jg68CMJbJcAwEThK1Nr/pJpe2KuNHC4X0f52/zDojDKX
         fD7dsUOduMWaUKXdRX62xTukZ+yshnohN4JwGqdTqhDucewH+NqR35xInFKO//yhrmtO
         cRTDSYa4lIIqaXh6fu18MmJKNmKkvo0zDG1YbcR8ogUGVrsHKQAHEPieBhgQo4NzPza8
         hx1HMM8rhWabHwKJDZ0ZGruEPHRIBeyK6wMcmSfZzOK2CGr1BBc0kJZDZ8QxJlcnZRii
         +HuLA5k1n/HNjTxcNGK7O47Sw6GOkpAiv4yk+PSpS+OPxBrva8jlQ9Hzl3vIIaRQ9TW6
         LSJA==
X-Gm-Message-State: AOJu0YwahLG+sE/tbDsy0aychx/mxwJCJn/p4W3vGVx62nNYD4M3rbD2
	JFgetQmU6FnMwltff13oQZtEH95vicza
X-Google-Smtp-Source: AGHT+IFCobSs7f7lUn7grteQL7zVQdPUD6EkBGNh9TaVbwF6QkbcBHQPOXcg4Ka4yeDKsnRZpGaTk4xXD+dN
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:99ae:e3b5:518:c5b4])
 (user=kyletso job=sendgmr) by 2002:a25:9841:0:b0:d9a:3a14:a5a2 with SMTP id
 k1-20020a259841000000b00d9a3a14a5a2mr212052ybo.13.1698686039808; Mon, 30 Oct
 2023 10:13:59 -0700 (PDT)
Date: Tue, 31 Oct 2023 01:13:47 +0800
In-Reply-To: <20231030171348.600621-1-kyletso@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231030171348.600621-1-kyletso@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231030171348.600621-2-kyletso@google.com>
Subject: [PATCH v3 1/2] dt-bindings: connector: Add child nodes for multiple
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

Define a child node "capabilities" to contain multiple USB Power
Delivery capabilities.

Define a child node with pattern (e.g. caps-0, caps-1) under
"capabilities". Each node contains PDO data of a selectable Power
Delivery capability.

Also define common properties for source-pdos, sink-pdos, and
op-sink-microwatt that can be referenced.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
v2 -> v3
- Updated the commit message
- Remain unchanged for the comments about the property/node refactor

.../bindings/connector/usb-connector.yaml     | 80 +++++++++++++------
 1 file changed, 57 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 7c8a3e8430d3..d7ece063cb2c 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -120,28 +120,10 @@ properties:
   # The following are optional properties for "usb-c-connector" with power
   # delivery support.
   source-pdos:
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
+    $ref: "#/$defs/source-pdos"
 
   sink-pdos:
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
+    $ref: "#/$defs/sink-pdos"
 
   sink-vdos:
     description: An array of u32 with each entry, a Vendor Defined Message Object (VDO),
@@ -167,9 +149,7 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   op-sink-microwatt:
-    description: Sink required operating power in microwatt, if source can't
-      offer the power, Capability Mismatch is set. Required for power sink and
-      power dual role.
+    $ref: "#/$defs/op-sink-microwatt"
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
@@ -231,6 +211,30 @@ properties:
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
+
+        properties:
+          source-pdos:
+            $ref: "#/$defs/source-pdos"
+
+          sink-pdos:
+            $ref: "#/$defs/sink-pdos"
+
+          op-sink-microwatt:
+            $ref: "#/$defs/op-sink-microwatt"
+
+        additionalProperties: false
+
+    additionalProperties: false
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
@@ -238,6 +242,36 @@ dependencies:
 required:
   - compatible
 
+$defs:
+  source-pdos:
+    description: An array of u32 with each entry providing supported power
+      source data object(PDO), the detailed bit definitions of PDO can be found
+      in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
+      Source_Capabilities Message, the order of each entry(PDO) should follow
+      the PD spec chapter 6.4.1. Required for power source and power dual role.
+      User can specify the source PDO array via PDO_FIXED/BATT/VAR/PPS_APDO()
+      defined in dt-bindings/usb/pd.h.
+    minItems: 1
+    maxItems: 7
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  sink-pdos:
+    description: An array of u32 with each entry providing supported power sink
+      data object(PDO), the detailed bit definitions of PDO can be found in
+      "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
+      Sink Capabilities Message, the order of each entry(PDO) should follow the
+      PD spec chapter 6.4.1. Required for power sink and power dual role. User
+      can specify the sink PDO array via PDO_FIXED/BATT/VAR/PPS_APDO() defined
+      in dt-bindings/usb/pd.h.
+    minItems: 1
+    maxItems: 7
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  op-sink-microwatt:
+    description: Sink required operating power in microwatt, if source can't
+      offer the power, Capability Mismatch is set. Required for power sink and
+      power dual role.
+
 allOf:
   - if:
       properties:
-- 
2.42.0.820.g83a721a137-goog


