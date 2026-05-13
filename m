Return-Path: <linux-usb+bounces-37369-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG80Njc2BGqRFwIAu9opvQ
	(envelope-from <linux-usb+bounces-37369-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 10:28:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55352FA87
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 10:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66ED6301C884
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 08:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77823DEAC2;
	Wed, 13 May 2026 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ob/qboL7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B1438D400;
	Wed, 13 May 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660757; cv=none; b=swXsAw88Npeo6mZ8uRGtg0B//R0ZC+Z8HuiGNXU72GSO4C41Z7Q14tWHC36ONOz3h4AVYMLJBH764bF8eMIRPXuOH5zWATu8Vq9WHgE449LK5wVN6c7Vb2ChgDAeoYy1nAWqwE79JENl6xqd1c2biN5WKLLeo/nHwRQkoAqeGxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660757; c=relaxed/simple;
	bh=g/yjgISQ3IZYpA5mFMZTndQ03GY3smIJhlOf0/Um/gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6nY9KVzfYZ9AsiLcbNir+IUB4HlT2oRVx19JluJVv8TKt2ns6nwB+CLJyI2qoa2CGqI6ACoclIt9vPA4nWlWoLSxsfHSlb9J1CxJZh8YoRoNIzGPnZOHf/wH2TuwFBL+SDJT3n/Fqal1+zE4B164KrwUzv8GYgZNxQ4pYsg7ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ob/qboL7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA3D8C2BCC7;
	Wed, 13 May 2026 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778660755;
	bh=g/yjgISQ3IZYpA5mFMZTndQ03GY3smIJhlOf0/Um/gw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ob/qboL7yjwGh6R+ZTAGLVJpIpAipY7vOlIevRTI2LNuQtbaFQVDjeynJuhTZp7Mc
	 rubsOxjmScKVwNLX5joHnDTpwxCLClrRqOHMgQYY1sdg5vyaArXTcNHviK+tLhzpIC
	 /SogCIuH6sdYLJiZTwhxXd07eoy/vLdJQVW5WP9q8xU241NSJcZK3P/THQOxKnAQ5N
	 rAKSUvMY3Ll79wfnoZMm/LeuC+1c4OJHs+h5yPFQ6ysOFy+Mpm7mtQTT05CUmSHOTP
	 5D5832KPHkmDUe2LcbZFwW42ACaUdL5pe5VKrR1hNoXgcguq68+Qf1wjaaQTNoVnSm
	 3QGjhatskKRmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91CDCD37B6;
	Wed, 13 May 2026 08:25:55 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Wed, 13 May 2026 10:41:21 +0200
Subject: [PATCH v5 1/2] dt-bindings: usb: cdns3: Add no_drd property
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-b4-no_drd_config-v5-1-1c633a4b9a29@cadence.com>
References: <20260513-b4-no_drd_config-v5-0-1c633a4b9a29@cadence.com>
In-Reply-To: <20260513-b4-no_drd_config-v5-0-1c633a4b9a29@cadence.com>
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778661701; l=4313;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=70m2WrB+gScioT1IsprmvK92HHYRKuQVzJyfW+KyZbY=;
 b=0l/te2BTU/L20Tg7xd22LeIKnJhrM7zr7sXKEDV+cBr/F0NB/K70bZm5bnK2HMGM6DeflAtmi
 VFDtaE0W8r3BVpjgjZMAcCHfxuiXYk3AWEDelRWQVydkw3dNqsPlLGg
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
X-Rspamd-Queue-Id: 2B55352FA87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37369-lists,linux-usb=lfdr.de,pawell.cadence.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pawell@cadence.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cadence.com:email,cadence.com:mid,cadence.com:replyto]
X-Rspamd-Action: no action

From: Pawel Laszczak <pawell@cadence.com>

Introduce a new boolean property 'no_drd' for Cadence USBSS/USBSSP
controllers to support hardware configurations where the Dual-Role
Device (DRD) register block is missing or inaccessible.

When 'no_drd' is present:
- The 'otg' register and interrupt resources are not required.
- The 'reg' and 'interrupts' properties are restricted to 2 items
  (host and device).
- 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.

When 'no_drd' is absent, the binding maintains backward compatibility
by requiring all 3 resource sets (otg, host, dev).

To achieve this, the schema is updated with an if-then-else logic
and 'reg-names'/'interrupt-names' use enums to allow flexible
ordering during validation.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
v5:
- Implemented strict conditional validation using if-then-else logic.
- Enforced 2 register/interrupt items and required 'dr_mode'
  (host or peripheral) when 'no_drd' is present.
- Enforced the standard 3 register/interrupt items (otg, host, dev)
  when 'no_drd' is absent to ensure backward compatibility.
- Updated 'reg-names' and 'interrupt-names' to use enums in the main
  properties section to support flexible resource ordering during
  validation.
---
---
 .../devicetree/bindings/usb/cdns,usb3.yaml         | 67 +++++++++++++++++++---
 1 file changed, 58 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index 2d95fb7321af..5d9bea62729c 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -20,19 +20,21 @@ properties:
     const: cdns,usb3
 
   reg:
+    minItems: 2
     items:
       - description: OTG controller registers
       - description: XHCI Host controller registers
       - description: DEVICE controller registers
 
   reg-names:
+    minItems: 2
     items:
-      - const: otg
-      - const: xhci
-      - const: dev
+      - enum: [ otg, xhci, dev ]
+      - enum: [ otg, xhci, dev ]
+      - enum: [ otg, xhci, dev ]
 
   interrupts:
-    minItems: 3
+    minItems: 2
     items:
       - description: XHCI host controller interrupt
       - description: Device controller interrupt
@@ -41,12 +43,12 @@ properties:
                      cleared by xhci core, this interrupt is optional
 
   interrupt-names:
-    minItems: 3
+    minItems: 2
     items:
-      - const: host
-      - const: peripheral
-      - const: otg
-      - const: wakeup
+      - enum: [ host, peripheral, otg, wakeup ]
+      - enum: [ host, peripheral, otg, wakeup ]
+      - enum: [ host, peripheral, otg, wakeup ]
+      - enum: [ host, peripheral, otg, wakeup ]
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
@@ -79,6 +81,13 @@ properties:
     description: Enable resetting of PHY if Rx fail is detected
     type: boolean
 
+  no_drd:
+    description:
+      Indicates that the Dual-Role Device (DRD) register block is not
+      implemented or is inaccessible. In this case, the controller
+      must operate in a fixed peripheral or host mode.
+    type: boolean
+
 dependencies:
   port: [ usb-role-switch ]
 
@@ -93,6 +102,46 @@ allOf:
   - $ref: usb-drd.yaml#
   - $ref: usb-xhci.yaml#
 
+  - if:
+      properties:
+        no_drd: true
+      required:
+        - no_drd
+    then:
+      required:
+        - dr_mode
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          items:
+            - const: xhci
+            - const: dev
+        interrupts:
+          maxItems: 2
+        interrupt-names:
+          items:
+            - const: host
+            - const: peripheral
+        dr_mode:
+          enum: [host, peripheral]
+    else:
+      properties:
+        reg:
+          minItems: 3
+        reg-names:
+          items:
+            - const: otg
+            - const: xhci
+            - const: dev
+        interrupts:
+          minItems: 3
+        interrupt-names:
+          items:
+            - const: host
+            - const: peripheral
+            - const: otg
+
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0



