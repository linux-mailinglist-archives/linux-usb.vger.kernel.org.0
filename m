Return-Path: <linux-usb+bounces-31468-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F6CBFEC7
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 22:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E36C43055BB4
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 21:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98C1327790;
	Mon, 15 Dec 2025 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSrHjL1N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFB132694E;
	Mon, 15 Dec 2025 21:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765833913; cv=none; b=RIrO8XkL4gY8w3tEc6KhQNLjdN/hUPtJzyJE3u4JX6xNs2diEYVNUlHDWMyJfNA8iRy82oQ0GXJkxG8B9rHfDwnYdoRuIpS+B7/2iYZisPOh2tsu3pOSfoDsecf303YS94XJF380/4Ddse+HxiuCR2LVFbTRlkytcszwERvvqRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765833913; c=relaxed/simple;
	bh=V7dIumNmjYaERbd0MD+B76a5NTQazRSqsfPFCXAda8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ol5RE+jfwlsWWb/IEg4nZVE9z/ewSugO+lJh9cSMpxoYIEzyGrcomJBMdtiivVWYad3gV9EjaxN51c61yuw2jT1+oxwfMxqugYIpx7u6GaqOYPorovbHmZ1rJmR+ZxxjZHlMWxw/bRkaGOR5FnjkHB0rTFErXYR02ij5E1v3gpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSrHjL1N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82340C4CEF5;
	Mon, 15 Dec 2025 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765833912;
	bh=V7dIumNmjYaERbd0MD+B76a5NTQazRSqsfPFCXAda8M=;
	h=From:To:Cc:Subject:Date:From;
	b=PSrHjL1NyaKYOCJLAbtqICw5Fa70sDSRWppz77LxTSMugaTuUuiMUbz1g/iuhYzX6
	 S2IiiiPYs/iguAMH+79tsAVkw0uuwGvDoTOgsq7ph06TP5zUeuS7SbfjyWRI1bjcEI
	 2QPnYf3pKy6nBBKJIfH0epLKaDP/x5FmKTtXofUzqCwD77DA2MkDtHNFf3P5q5FUo6
	 e5P2sI/mXeRN6WTF/R2YRYWpMZG/StrYOGBp/cdFFWZIXO3W+5oxg1FlU7qAEma3Gt
	 eJx+jZBgXj1G/LTljEYFrown1KAQbnej04ETwGVYsMztcoreRF5MC0yxqHelMClHEV
	 vTsBbNrrFGwpA==
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
Subject: [PATCH] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
Date: Mon, 15 Dec 2025 15:25:06 -0600
Message-ID: <20251215212507.3317805-1-robh@kernel.org>
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
 .../bindings/usb/socionext,uniphier-dwc3.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
new file mode 100644
index 000000000000..892ae3458c1b
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
+    minItems: 2
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


