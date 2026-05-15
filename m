Return-Path: <linux-usb+bounces-37506-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HtmDHwEB2pNqwIAu9opvQ
	(envelope-from <linux-usb+bounces-37506-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 13:33:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5C154E86A
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 13:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC0A30B3A49
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0120C478E41;
	Fri, 15 May 2026 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scfxYMLU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCC444D685;
	Fri, 15 May 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843336; cv=none; b=ELYMfsasZ4xPxrKafUiJxWlbGZWUVLwtqGUG6Ir28Ueqkz6JZ6RVtlZHI3pDCUj9SML05ltcUee3FD/RGeLcmDU5/lfMZ1/A7PuGTX8m1YsLRT8kvNwzBTk8Oh+i/u/F6dAhHE9gxJZ0sjrWztUQxBQLRTWgFMXUMvIBnYS/4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843336; c=relaxed/simple;
	bh=r0iKObg1kHEbK/CoY9Tc79Jo1GDSrvLTJNtqhQKmugY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h50vs4Gt2QaihiO9Tb1DYDOsHuJ69rjv9MP6GMz0ko0nosS0RAXlOk+16MMMa/KFPEDfZ54WIeIBm6NlbFr9ySBpjXP008HXE3HONwhgCC//l8Lb72e9jZwX3PaIeiWJoATP1HdRkVyN4omJ1MDo4PS4SOAk211A87EkG7jkefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scfxYMLU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18E1FC2BCB7;
	Fri, 15 May 2026 11:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843336;
	bh=r0iKObg1kHEbK/CoY9Tc79Jo1GDSrvLTJNtqhQKmugY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=scfxYMLUZ+7KJHAsnGGT0ZFV1jBUyQcnQ3g6MYHvMBcNH7qwjeqByxvQG1ZglFjJH
	 4nzjo9akLGRA0rfu7q8GZQcoGeHdMicr0ys6DEdfrP+d9TxaCZapHZo7TWFb8JLrfM
	 VZUpMkYWPiPr6HN5EQ+8AGHlfAcfNQnuDs/qw19x44eykveyZtYKfN+xGvT+lJBgZP
	 SeDgijHbg0iflG2uxk9fQFUoN3lwaA0sCg64A+VbJoFXZhLawJNtozrSFU4f9AQY0j
	 4PdvjBme8m46lrVWMmo8c+k1rub/FvtVmZVnrZIdHJ/7pNCbc3PaIQMOArgirCkJ0u
	 +PfaBqE934fXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A04FCD343F;
	Fri, 15 May 2026 11:08:56 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Fri, 15 May 2026 13:24:38 +0200
Subject: [PATCH v8 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp-no-drd
 compatible string
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-b4-no_drd_config-v8-1-75cb05317679@cadence.com>
References: <20260515-b4-no_drd_config-v8-0-75cb05317679@cadence.com>
In-Reply-To: <20260515-b4-no_drd_config-v8-0-75cb05317679@cadence.com>
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844286; l=4748;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=9OjoKia9GP/4VD0yZsSfoVSr7ysfUvwbj1KOdwE6clY=;
 b=qttmCHxFnq4qkLQdhHjrB2G23Xp7tir4LGrvyp0zwBJIHZG/TYVBRAgn7ZY7DYWUzPQBxjg5z
 50tPC07bKXCDAhQRM11HbMsNsIzLLH9MknfH77tXbpIC2O0lxV6eztJ
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
X-Rspamd-Queue-Id: 7D5C154E86A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37506-lists,linux-usb=lfdr.de,pawell.cadence.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Pawel Laszczak <pawell@cadence.com>

Introduce a new compatible string 'cdns,cdnsp-no-drd' for Cadence
USBSS/USBSSP controllers to support hardware configurations where the
Dual-Role Device (DRD) register block is missing or inaccessible.

This change follows the recommendation to imply hardware limitations
directly from the compatible string rather than using a dedicated
boolean property.

When 'cdns,cdnsp-no-drd' is used:
- The 'otg' register and interrupt resources are not required.
- The 'reg' and 'interrupts' properties are restricted to 2 items
  (host and device).
- 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.

The standard 'cdns,usb3' compatible remains unchanged, maintaining
backward compatibility by requiring all 3 resource sets (otg, host, dev).

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
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
 .../devicetree/bindings/usb/cdns,usb3.yaml         | 60 ++++++++++++++++++----
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index 2d95fb7321af..7b0aa9c4a2bd 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -17,22 +17,22 @@ description:
 
 properties:
   compatible:
-    const: cdns,usb3
+    enum:
+      - cdns,usb3
+      - cdns,cdnsp-no-drd
 
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
@@ -41,7 +41,7 @@ properties:
                      cleared by xhci core, this interrupt is optional
 
   interrupt-names:
-    minItems: 3
+    minItems: 2
     items:
       - const: host
       - const: peripheral
@@ -93,6 +93,46 @@ allOf:
   - $ref: usb-drd.yaml#
   - $ref: usb-xhci.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: cdns,cdnsp-no-drd
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



