Return-Path: <linux-usb+bounces-31930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC2CF4AED
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 17:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C672A303ADC2
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 16:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F9D31AA8F;
	Mon,  5 Jan 2026 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPjcKII0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591932ED4E;
	Mon,  5 Jan 2026 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630272; cv=none; b=YJaOeXTSVA7+7Fxp9UHSPNGmdPv2U5E2csXKEnsQvoJ5WOO7CZs3JCszpVKKNJO5Wh9IFh7HVOAW+Rw+/hIHMgbZIEmTJE7LLfwyzthHRFEsYh31yXD1BhAfFXdJy1l/XvuE37A0VY12pTvGCqmGM7FE/ObXDdmqUlUvinghCCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630272; c=relaxed/simple;
	bh=lYCW3siDQNRZY+GsyMzVi9UL/1vFDJTQoDJqk5WeLXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUvhWZsGKme/FwOy8aOpJdL9YGVv1eIY9oSlV1unM22WFLtXOVElbMpydC7vhie17TmiHhvOTagLGVWkXiqnB45dLZh6IlSBI/GLmvtzxB2YJj9m7vB7UUQ0Y8xVvgP3AWUpGA84FvBk8PkDqYo5+WOXtjDBazm6mq7b5KiEOa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPjcKII0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B09C116D0;
	Mon,  5 Jan 2026 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767630270;
	bh=lYCW3siDQNRZY+GsyMzVi9UL/1vFDJTQoDJqk5WeLXk=;
	h=From:To:Cc:Subject:Date:From;
	b=GPjcKII0OHEUX4sJTxAE62ChobNYZmkA/Y73pMem5xTDSVO5jhPzKqBCMAVJTQRwm
	 7Yt1EsjtuZiZnM77g2ULdAc2Y7y9v9HO0v8QHt8Mb9zMCT5TULXuU1UT7O2UQQc+0a
	 LbqTZJ4M7wFSU6ZlyR67Ifn9LFgcfup5aOpCujbJLhzK2AgvPzeiG37W4iCOCC2SM9
	 cep0MaDn6gAKbW7AQVSS57ZwNb4iSGTLg57ur7j1PyZWNEZraKrvYsOpUfD2TlXCvX
	 OketC79ovpwhXE13BuTiCpBC82BUk2BzQTMsGiFBsBdS4yEs+FIB6gYNicUr7PalTg
	 tSudURb0MsIEA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
Date: Mon,  5 Jan 2026 10:24:16 -0600
Message-ID: <20260105162418.2842825-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Socionext Uniphier DWC3 controller binding is already in use, but
undocumented. It's a straight-forward binding similar to other DWC3
bindings.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Allow 1 phy entry for Pro4
---
 .../bindings/usb/socionext,uniphier-dwc3.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
new file mode 100644
index 000000000000..2b253339c199
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Socionext Uniphier SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
+  - Masami Hiramatsu <mhiramat@kernel.org>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: socionext,uniphier-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: socionext,uniphier-dwc3
+      - const: snps,dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Host or single combined interrupt
+      - description: Peripheral interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - enum:
+          - dwc_usb3
+          - host
+      - const: peripheral
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: suspend
+
+  phys:
+    description: 1 to 4 HighSpeed PHYs followed by 1 or 2 SuperSpeed PHYs
+    minItems: 1
+    maxItems: 6
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+
+unevaluatedProperties: false
+
+allOf:
+  - $ref: snps,dwc3.yaml#
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@65a00000 {
+        compatible = "socionext,uniphier-dwc3", "snps,dwc3";
+        reg = <0x65a00000 0xcd00>;
+        interrupt-names = "dwc_usb3";
+        interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+        clock-names = "ref", "bus_early", "suspend";
+        clocks = <&sys_clk 12>, <&sys_clk 12>, <&sys_clk 12>;
+        resets = <&usb0_rst 15>;
+        phys = <&usb0_hsphy0>, <&usb0_hsphy1>,
+               <&usb0_ssphy0>, <&usb0_ssphy1>;
+        dr_mode = "host";
+    };
-- 
2.51.0


