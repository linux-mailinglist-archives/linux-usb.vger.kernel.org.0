Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD50518748A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732671AbgCPVLr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:11:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37300 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732669AbgCPVLr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:11:47 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbxW043488;
        Mon, 16 Mar 2020 16:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584393097;
        bh=bOYFaETYWJVVuVd1WAFYcBndYT1yP3V30xHNURp1E7k=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=D4KK/aNyclgcjyVBS9PXkctMkJMmYg8rGOwgXRgSenHJIi1YC+UeI+3+ooMLUWCqX
         ciOB0kLP4wi8Kxq2BAW5HlR6t1n8GUw5exoCPHdDTobrRSDB7kDwVzu2hbml7jzIKi
         UevTtxmUgMwM3f7uLGCQLfTqY5JBOuYuH56LSJ6A=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbPa028885;
        Mon, 16 Mar 2020 16:11:37 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 16:11:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 16:11:37 -0500
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GLBbLe119954;
        Mon, 16 Mar 2020 16:11:37 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 2/8] dt-bindings: usb: Convert jz4740-musb doc to YAML
Date:   Mon, 16 Mar 2020 16:11:30 -0500
Message-ID: <20200316211136.2274-3-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200316211136.2274-1-b-liu@ti.com>
References: <20200316211136.2274-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

Convert ingenic,jz4740-musb.txt to ingenic,musb.yaml, and add the
new ingenic,jz4770-musb and ingenic,jz4725b-musb compatible strings
in the process.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 .../bindings/usb/ingenic,jz4740-musb.txt      | 32 --------
 .../devicetree/bindings/usb/ingenic,musb.yaml | 76 +++++++++++++++++++
 2 files changed, 76 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ingenic,musb.yaml

diff --git a/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt b/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
deleted file mode 100644
index 16808721f3ff..000000000000
--- a/Documentation/devicetree/bindings/usb/ingenic,jz4740-musb.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Ingenic JZ4740 MUSB driver
-
-Required properties:
-
-- compatible: Must be "ingenic,jz4740-musb"
-- reg: Address range of the UDC register set
-- interrupts: IRQ number related to the UDC hardware
-- interrupt-names: must be "mc"
-- clocks: phandle to the "udc" clock
-- clock-names: must be "udc"
-- phys: phandle to the USB PHY
-
-Example:
-
-usb_phy: usb-phy@0 {
-	compatible = "usb-nop-xceiv";
-	#phy-cells = <0>;
-};
-
-udc: usb@13040000 {
-	compatible = "ingenic,jz4740-musb";
-	reg = <0x13040000 0x10000>;
-
-	interrupt-parent = <&intc>;
-	interrupts = <24>;
-	interrupt-names = "mc";
-
-	clocks = <&cgu JZ4740_CLK_UDC>;
-	clock-names = "udc";
-
-	phys = <&usb_phy>;
-};
diff --git a/Documentation/devicetree/bindings/usb/ingenic,musb.yaml b/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
new file mode 100644
index 000000000000..1d6877875077
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ingenic,musb.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ingenic,musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic JZ47xx USB IP DT bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: '^usb@.*'
+
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4770-musb
+        - ingenic,jz4740-musb
+      - items:
+        - const: ingenic,jz4725b-musb
+        - const: ingenic,jz4740-musb
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: udc
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: mc
+
+  phys:
+    description: PHY specifier for the USB PHY
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - phys
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4740-cgu.h>
+    usb_phy: usb-phy@0 {
+      compatible = "usb-nop-xceiv";
+      #phy-cells = <0>;
+    };
+
+    udc: usb@13040000 {
+      compatible = "ingenic,jz4740-musb";
+      reg = <0x13040000 0x10000>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <24>;
+      interrupt-names = "mc";
+
+      clocks = <&cgu JZ4740_CLK_UDC>;
+      clock-names = "udc";
+
+      phys = <&usb_phy>;
+    };
-- 
2.17.1

