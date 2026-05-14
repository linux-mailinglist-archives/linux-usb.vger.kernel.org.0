Return-Path: <linux-usb+bounces-37440-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDq3DnZhBWrsVgIAu9opvQ
	(envelope-from <linux-usb+bounces-37440-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 07:45:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7753E14D
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 07:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2877230117A0
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 05:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A266F3A4275;
	Thu, 14 May 2026 05:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILJD1W31"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DF5224FA;
	Thu, 14 May 2026 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737512; cv=none; b=NvXSaeO16+08pdwj4TgJDAjiE1brLrLf4JJMDA4K/Joul7KX0p4GXfQ90N4OnQG1fx6wMRISbtovDo7064oSaBynLGTxYV+Cf8V2cji338uzbpekMz1sRtb47PjulvSDeVqUH80fJGnPRicZWuekfT+IBsVNvoHQNRR/UdM8wV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737512; c=relaxed/simple;
	bh=LOEZH3XMolxuEp5jOuuEj1zWSprPdQ2jA9sLmCjNJn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mu+e/4nB77FSmEg8xF61UKAO2C2/BgcqND1an7Rvj7hUSJvOdOiBUEThqoCuKKeL7WlThwbqg9vGnEtGIKQMHFxb4SDfejdhmwBDOGoGMVbEBmZR5SXG6Js7eM4ix+guQV91G6HQ0ikxV9wRMhIl23Y34g9obeVF8aAwWv8Ek1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILJD1W31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B540C2BCC7;
	Thu, 14 May 2026 05:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778737511;
	bh=LOEZH3XMolxuEp5jOuuEj1zWSprPdQ2jA9sLmCjNJn0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ILJD1W312ofJEGVpV0QNIH+3JyjvanQ9l0Da0ECEELc4Mptrm12t9cuuBLlIsMs7x
	 KZ/w6hyaNteHy7IE0810aw1mB1JVTPJKFGp20WFl6ZCFMRb73KpBNao+j6+IaThXbq
	 16AvE8rci4K6tQnZ/5HFLmas6UGp/7AEvbcMp7hMvHI82V0pi6AU3UDCy7FFfnyMsb
	 mHUqQUx1GMX4q6SMBNOOwyWpX1vv3aAiwwAykrq2jeZKER6qhPw70gMst5jcUZURc6
	 gyBzVsKSzS1R6BuyIB8UqoQYJrCGqX9WjX/Pjcd7jfpoTqN1YhHx2d974ccQ6SqrS2
	 T6gXzA3w9enJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA2BCD4F39;
	Thu, 14 May 2026 05:45:11 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Thu, 14 May 2026 08:00:51 +0200
Subject: [PATCH v7 1/2] dt-bindings: usb: cdns3: Add cdns,no-drd property
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-b4-no_drd_config-v7-1-18cc40e363fd@cadence.com>
References: <20260514-b4-no_drd_config-v7-0-18cc40e363fd@cadence.com>
In-Reply-To: <20260514-b4-no_drd_config-v7-0-18cc40e363fd@cadence.com>
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778738460; l=4746;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=tbJcxqWliRwq9sOBLnSckORm/H18puu1GemD56Jsc9s=;
 b=yaW2SLS6nFayNCohlvSbaQa7f6LIdZFfX9fzVmiFw8rcN0B2aYBRSnT/3FhsAwAI/urKgSX6u
 SnOfW89s6NxCycqnk2NWaDxGO9SKtaWH+7Jop8NPHcFN+RpkctsqUGD
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
X-Rspamd-Queue-Id: CCE7753E14D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37440-lists,linux-usb=lfdr.de,pawell.cadence.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cadence.com:email,cadence.com:mid,cadence.com:replyto]
X-Rspamd-Action: no action

From: Pawel Laszczak <pawell@cadence.com>

Introduce a new boolean property 'cdns,no-drd' for Cadence USBSS/USBSSP
controllers to support hardware configurations where the Dual-Role
Device (DRD) register block is missing or inaccessible.

When 'cdns,no-drd' is present:
- The 'otg' register and interrupt resources are not required.
- The 'reg' and 'interrupts' properties are restricted to 2 items
  (host and device).
- 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.

When 'cdns,no-drd' is absent, the binding maintains backward compatibility
by requiring all 3 resource sets (otg, host, dev).

To achieve this, the schema is updated with an if-then-else logic
and 'reg-names' use enums to allow flexible
ordering during validation.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
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
 .../devicetree/bindings/usb/cdns,usb3.yaml         | 62 ++++++++++++++++++----
 1 file changed, 53 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index 2d95fb7321af..068fb55a5414 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -20,19 +20,17 @@ properties:
     const: cdns,usb3
 
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
@@ -41,7 +39,7 @@ properties:
                      cleared by xhci core, this interrupt is optional
 
   interrupt-names:
-    minItems: 3
+    minItems: 2
     items:
       - const: host
       - const: peripheral
@@ -79,6 +77,13 @@ properties:
     description: Enable resetting of PHY if Rx fail is detected
     type: boolean
 
+  cdns,no-drd:
+    description:
+      Indicates that the Dual-Role Device (DRD) register block is not
+      implemented or is inaccessible. In this case, the controller
+      must operate in a fixed peripheral or host mode.
+    type: boolean
+
 dependencies:
   port: [ usb-role-switch ]
 
@@ -93,6 +98,45 @@ allOf:
   - $ref: usb-drd.yaml#
   - $ref: usb-xhci.yaml#
 
+  - if:
+      required:
+        - cdns,no-drd
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



