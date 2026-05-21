Return-Path: <linux-usb+bounces-37824-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GRTNri7DmrBBgYAu9opvQ
	(envelope-from <linux-usb+bounces-37824-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:00:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A05A08EE
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C185C301C668
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 08:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8063A3826;
	Thu, 21 May 2026 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgbASl/4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D4A314D21;
	Thu, 21 May 2026 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350427; cv=none; b=p9glU1b6VkqyabvoUymXQGLO6Pwk7LhGZ62SL9EY1bGD3jM2QpVplyVDKRf2Ia/3nnugkahBirW3i49My2woYxGL5d9eExVpgx+vh20/0zIONsQIKnhJ9/wAU18K2/erWdxgPfdREvajG7rsgDL1AizShOFghqL+043BYNnHNiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350427; c=relaxed/simple;
	bh=7b9b+neL/Qk+olLAH66ucc7yKPUy5mho34W07ooG694=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfzNHyVDOwCUkWg88Y/JwT/C/X/Fa+wg8w3Mq0mmGT6j58KDJEI60D3q1D4Bgvnhk9Rgef4AETXX8YL0MvbvDMOBTxlW3GrybdeeoqDy44gmJjYhHou2HpmUoQzQMYDDNra+QnTicxTSMURSgd7a+gPOjbZEl/R0jT4Ey0k95Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgbASl/4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E53D5C2BCB9;
	Thu, 21 May 2026 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779350427;
	bh=7b9b+neL/Qk+olLAH66ucc7yKPUy5mho34W07ooG694=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jgbASl/4vwqHQTFzB201neSQjKaAImyyhSU7R/jeYe9TLm5PGBb6/b1D9m8xDHhp7
	 QcIjIG7ZjzaNEyTTaxGBfdgjJ7lOmHYPZEHrMAI3ViDK5JzbU3hAVbnpHDfTqjFoi3
	 yEL0VjYh8I+f/MmVLyiEqIVjP8dGXJQ+IYJ5e2+ChiMf2jFslgUvoG/z+oTapoNNn6
	 BK+noRgTVizzrf2kJ3xn24BmQJCLQ+uUh1BqAAX0IBGdQG5QGCWl3RmcmfWuTunnKg
	 KIp4QEjYTUGG644Es3uB4KY9N760MKf2nmk8ZPAMmhdRY3JE2mbpl/thq/Ez+sxf8Q
	 EZI9G4gIC7Z3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFEDCD5BAB;
	Thu, 21 May 2026 08:00:26 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Thu, 21 May 2026 10:16:23 +0200
Subject: [PATCH v9 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp compatible
 string
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-no_drd_config_v9-v9-1-2512cef10104@cadence.com>
References: <20260521-no_drd_config_v9-v9-0-2512cef10104@cadence.com>
In-Reply-To: <20260521-no_drd_config_v9-v9-0-2512cef10104@cadence.com>
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779351391; l=5213;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=aEGYxRlbH6so/Rcq6gM9uAtHD2TdYB9lVfqtKa4oDlw=;
 b=IrBb9TgdEMIWe9ygOquRluhb9IAOubXzcm5bnJidU/3DOEklleMP/Q5g6rZviQf1JX51lTgDn
 F3561MxwDYXD6Fj6YsKH2KF6RmBmk9eBkgSlo5JyYrmKLJUiZUuKU+A
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37824-lists,linux-usb=lfdr.de,pawell.cadence.com];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[cadence.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[pawell@cadence.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B69A05A08EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pawel Laszczak <pawell@cadence.com>

Introduce a new generic fallback compatible string 'cdns,cdnsp' for
Cadence USBSSP controllers to support hardware configurations where
the Dual-Role Device (DRD) register block is missing or inaccessible.

Following the maintainer's feedback, avoid generic property-like naming
(such as "-no-drd") and use a clean generic fallback. To keep the schema
resource-driven and strictly validated, define a two-string compatible
matrix using an empty schema ({}) wildcard. This allows future vendor
SoC compatibles to be prepended while safely falling back to the 2-resource
USBSSP configuration.

When 'cdns,cdnsp' is matched:
- The 'otg' register and interrupt resources are not required.
- The 'reg' and 'interrupts' properties are restricted to 2 items
  (host and device).
- 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.

The standard 'cdns,usb3' compatible remains unchanged, maintaining
backward compatibility by requiring all 3 resource sets (otg, host, dev).

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
v9:
- Dropped the "cdns,cdnsp-no-drd" string to avoid generic property-like
  naming as requested by Conor.
- Introduced the clean generic fallback "cdns,cdnsp".

v8:
- Update commit message to reflect schema changes.
- Removed 'cdns,no-drd' boolean property as per Rob Herring's suggestion.
- Introduced a new compatible string 'cdns,cdnsp-no-drd' for controller
  variants that lack the DRD/OTG register block.

v7:
- Rename 'no_drd' to 'cdns,no-drd'.
- Update commit message to reflect property renaming and schema changes.
- Simplify 'reg-names' using a single enum.
- Revert 'interrupt-names' to a list of constants.
- Move 'reg' item descriptions to if/else blocks for accuracy.
- Clean up 'if/then' logic (remove redundant checks).
- Add explicit 'items' list for 'interrupt-names' in the 'else' block.

v6:
- Fixed validation error for 'interrupt-names' by correcting
  the items definition.
- Adjusted 'minItems'/'maxItems' to properly support the optional
 'wakeup' interrupt.
- Fixed 'too long' schema error in examples.

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
 .../devicetree/bindings/usb/cdns,usb3.yaml         | 63 ++++++++++++++++++----
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index 2d95fb7321af..e8082c5c05a2 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -17,22 +17,24 @@ description:
 
 properties:
   compatible:
-    const: cdns,usb3
+    oneOf:
+      - const: cdns,usb3
+      - items:
+          - {}
+          - const: cdns,cdnsp
 
   reg:
-    items:
-      - description: OTG controller registers
-      - description: XHCI Host controller registers
-      - description: DEVICE controller registers
+    minItems: 2
+    maxItems: 3
 
   reg-names:
+    minItems: 2
+    maxItems: 3
     items:
-      - const: otg
-      - const: xhci
-      - const: dev
+      enum: [ otg, xhci, dev ]
 
   interrupts:
-    minItems: 3
+    minItems: 2
     items:
       - description: XHCI host controller interrupt
       - description: Device controller interrupt
@@ -41,7 +43,7 @@ properties:
                      cleared by xhci core, this interrupt is optional
 
   interrupt-names:
-    minItems: 3
+    minItems: 2
     items:
       - const: host
       - const: peripheral
@@ -93,6 +95,47 @@ allOf:
   - $ref: usb-drd.yaml#
   - $ref: usb-xhci.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cdns,cdnsp
+    then:
+      properties:
+        reg:
+          items:
+            - description: XHCI Host controller registers
+            - description: DEVICE controller registers
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
+          items:
+            - description: OTG controller registers
+            - description: XHCI Host controller registers
+            - description: DEVICE controller registers
+        reg-names:
+          items:
+            - const: otg
+            - const: xhci
+            - const: dev
+        interrupts:
+          minItems: 3
+          maxItems: 4
+        interrupt-names:
+          minItems: 3
+
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0



