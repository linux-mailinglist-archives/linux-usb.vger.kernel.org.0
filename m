Return-Path: <linux-usb+bounces-657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4D37B0AB6
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 18:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 0A377B20ABD
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 16:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B7949991;
	Wed, 27 Sep 2023 16:54:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541351BDE0;
	Wed, 27 Sep 2023 16:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3815BC433C8;
	Wed, 27 Sep 2023 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695833667;
	bh=OWCmuPebvFogsaXQ+UWO53mmD8IYPbNXCEUOxHi0SX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OS6UKmOIJ/EdftafGfIt8QW4UBwispRhzODgAANJ7P8uch/3it1bBEZWsLLigHDWD
	 zyjsBBapu3BDfr6Iszc4lUfcX1l5hwuHHagsjSiY25YT71V0mX53itbjZjYG/UDCCH
	 /h/y7TOD7R6dV+WE6mPfpwEMhgEOeGshLQ9CY6fIV+I9P5o+MCjXD4SE6rWu5cAMXk
	 rhJFkRpJbU8XJrjlVEKIfKjuUzYluje1/CETC0vP6ILLDEPXvolfdsHdGPGOI2H1AD
	 JWNOai2dCtkM+pSx3elaxzamyUpsoNNdG36u7/As+zMrOt9a/ECzE9PQgOwCesCXrg
	 YJH3WiMIm7j9A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: usb: Add T-HEAD TH1520 USB controller
Date: Thu, 28 Sep 2023 00:42:21 +0800
Message-Id: <20230927164222.3505-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230927164222.3505-1-jszhang@kernel.org>
References: <20230927164222.3505-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

T-HEAD TH1520 platform's USB has a wrapper module around
the DesignWare USB3 DRD controller. Add binding information doc for
it.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/usb/thead,th1520-usb.yaml        | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml

diff --git a/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
new file mode 100644
index 000000000000..afb618eb5013
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 DWC3 USB Controller Glue
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+properties:
+  compatible:
+    const: thead,th1520-usb
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: phy
+      - const: suspend
+
+  ranges: true
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+# Required child node:
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    $ref: snps,dwc3.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+
+    usb {
+          compatible = "thead,th1520-usb";
+          reg = <0xec03f000 0x1000>;
+          clocks = <&clk 1>,
+                   <&clk 2>,
+                   <&clk 3>,
+                   <&clk 4>;
+          clock-names = "ref", "bus_early", "phy", "suspend";
+          ranges;
+          #address-cells = <1>;
+          #size-cells = <1>;
+
+          usb@e7040000 {
+                compatible = "snps,dwc3";
+                reg = <0xe7040000 0x10000>;
+                interrupts = <68>;
+                dr_mode = "host";
+          };
+    };
-- 
2.40.1


