Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C784313221E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 10:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbgAGJRB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 04:17:01 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:33756 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727696AbgAGJRA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 04:17:00 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0079DWUd030347;
        Tue, 7 Jan 2020 10:16:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=BDTYHjgWspO4059Si4TQFdiBJEuxi4FUDcYUcTXntkU=;
 b=xDcgsVsMTz+zCKgl2f5a4vJUM5iG28TsJTHm07TpHlSH7Njm+YKLf3Gz1PX5Rin+69HX
 z+FwnBADJ1r/MRg0Q1y6mSRD8uKJRMoIFvPOegKhNyrFMaAe2h7bYANSTNubTH6wCgaF
 sGwnEPPRHL92QLJ/bfz7Ek6OWXk2FvbI3MyFyzUYdS5u02+I+F3t86dqSdE8s0EFsagm
 F+10v2EsogWR/k1b1doiKxpW1+a7bdcs2YOZIOAhJvkCvNxhniIldRMS40uWrQmfrxBG
 /DtUHRlOv2UdwpqYt1FyVex6o3uvZYh14YSzJIQHdjT4VW/eY1Ei1UwcggNyOEg0nJay Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xakm5d0fa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 10:16:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CABA7100039;
        Tue,  7 Jan 2020 10:16:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3E362A7900;
        Tue,  7 Jan 2020 10:16:33 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 Jan 2020 10:16:33
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <kgene@kernel.org>, <krzk@kernel.org>,
        <hminas@synopsys.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <m.szyprowski@samsung.com>,
        <amelie.delaunay@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v3] dt-bindings: usb: Convert DWC2 bindings to json-schema
Date:   Tue, 7 Jan 2020 10:16:30 +0100
Message-ID: <20200107091630.12796-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_02:2020-01-06,2020-01-07 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Convert DWC2 bindings to DT schema format using json-schema.
DWC2 is widely use but a couple of compatibles and properties
(vusb_d-supply,vusb_a-supply) were missing in dwc2.txt, the
patch add them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
CC: Minas Harutyunyan <hminas@synopsys.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

changes in version 3:
- put Rob Herring as maintainer
- change the example to use one of the listed compatible

changes in version 2:
- put Minas Harutyunyan <hminas@synopsys.com> as maintainer
- remove type and description from phy property
- remove description from compatible items
- simplify samsung,s3c6400-hsotg compatible handling

 Documentation/devicetree/bindings/usb/dwc2.txt  |  64 ----------
 Documentation/devicetree/bindings/usb/dwc2.yaml | 151 ++++++++++++++++++++++++
 2 files changed, 151 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/dwc2.txt
 create mode 100644 Documentation/devicetree/bindings/usb/dwc2.yaml

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
deleted file mode 100644
index aafff3a6904d..000000000000
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-Platform DesignWare HS OTG USB 2.0 controller
------------------------------------------------------
-
-Required properties:
-- compatible : One of:
-  - brcm,bcm2835-usb: The DWC2 USB controller instance in the BCM2835 SoC.
-  - hisilicon,hi6220-usb: The DWC2 USB controller instance in the hi6220 SoC.
-  - rockchip,rk3066-usb: The DWC2 USB controller instance in the rk3066 Soc;
-  - "rockchip,px30-usb", "rockchip,rk3066-usb", "snps,dwc2": for px30 Soc;
-  - "rockchip,rk3188-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3188 Soc;
-  - "rockchip,rk3288-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3288 Soc;
-  - "lantiq,arx100-usb": The DWC2 USB controller instance in Lantiq ARX SoCs;
-  - "lantiq,xrx200-usb": The DWC2 USB controller instance in Lantiq XRX SoCs;
-  - "amlogic,meson8-usb": The DWC2 USB controller instance in Amlogic Meson8 SoCs;
-  - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
-  - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
-  - "amlogic,meson-g12a-usb": The DWC2 USB controller instance in Amlogic G12A SoCs;
-  - "amcc,dwc-otg": The DWC2 USB controller instance in AMCC Canyonlands 460EX SoCs;
-  - snps,dwc2: A generic DWC2 USB controller with default parameters.
-  - "st,stm32f4x9-fsotg": The DWC2 USB FS/HS controller instance in STM32F4x9 SoCs
-  configured in FS mode;
-  - "st,stm32f4x9-hsotg": The DWC2 USB HS controller instance in STM32F4x9 SoCs
-  configured in HS mode;
-  - "st,stm32f7-hsotg": The DWC2 USB HS controller instance in STM32F7 SoCs
-    configured in HS mode;
-- reg : Should contain 1 register range (address and length)
-- interrupts : Should contain 1 interrupt
-- clocks: clock provider specifier
-- clock-names: shall be "otg"
-Refer to clk/clock-bindings.txt for generic clock consumer properties
-
-Optional properties:
-- phys: phy provider specifier
-- phy-names: shall be "usb2-phy"
-- vbus-supply: reference to the VBUS regulator. Depending on the current mode
-  this is enabled (in "host" mode") or disabled (in "peripheral" mode). The
-  regulator is updated if the controller is configured in "otg" mode and the
-  status changes between "host" and "peripheral".
-Refer to phy/phy-bindings.txt for generic phy consumer properties
-- dr_mode: shall be one of "host", "peripheral" and "otg"
-  Refer to usb/generic.txt
-- g-rx-fifo-size: size of rx fifo size in gadget mode.
-- g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
-- g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
-- snps,need-phy-for-wake: If present indicates that the phy needs to be left
-                          on for remote wakeup during suspend.
-- snps,reset-phy-on-wake: If present indicates that we need to reset the PHY when
-                          we detect a wakeup.  This is due to a hardware errata.
-
-Deprecated properties:
-- g-use-dma: gadget DMA mode is automatically detected
-
-Example:
-
-        usb@101c0000 {
-                compatible = "ralink,rt3050-usb, snps,dwc2";
-                reg = <0x101c0000 40000>;
-                interrupts = <18>;
-		clocks = <&usb_otg_ahb_clk>;
-		clock-names = "otg";
-		phys = <&usbphy>;
-		phy-names = "usb2-phy";
-		snps,need-phy-for-wake;
-        };
diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
new file mode 100644
index 000000000000..71cf7ba32237
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/dwc2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DesignWare HS OTG USB 2.0 controller Bindings
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: brcm,bcm2835-usb
+      - const: hisilicon,hi6220-usb
+      - items:
+          - const: rockchip,rk3066-usb
+          - const: snps,dwc2
+      - items:
+          - const: rockchip,px30-usb
+          - const: rockchip,rk3066-usb
+          - const: snps,dwc2
+      - items:
+          - const: rockchip,rk3036-usb
+          - const: rockchip,rk3066-usb
+          - const: snps,dwc2
+      - items:
+          - const: rockchip,rv1108-usb
+          - const: rockchip,rk3066-usb
+          - const: snps,dwc2
+      - items:
+          - const: rockchip,rk3188-usb
+          - const: rockchip,rk3066-usb
+          - const: snps,dwc2
+      - items:
+          - const: rockchip,rk3228-usb
+          - const: rockchip,rk3066-usb
+          - const: snps,dwc2
+      - items:
+          - const: rockchip,rk3288-usb
+          - const: rockchip,rk3066-usb
+          - const: snps,dwc2
+      - const: lantiq,arx100-usb
+      - const: lantiq,xrx200-usb
+      - items:
+          - const: amlogic,meson8-usb
+          - const: snps,dwc2
+      - items:
+          - const: amlogic,meson8b-usb
+          - const: snps,dwc2
+      - const: amlogic,meson-gxbb-usb
+      - items:
+          - const: amlogic,meson-g12a-usb
+          - const: snps,dwc2
+      - const: amcc,dwc-otg
+      - const: snps,dwc2
+      - const: st,stm32f4x9-fsotg
+      - const: st,stm32f4x9-hsotg
+      - const: st,stm32f7-hsotg
+      - const: samsung,s3c6400-hsotg
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: otg
+
+  resets:
+    items:
+     - description: common reset
+     - description: ecc reset
+    minItems: 1
+
+  reset-names:
+    items:
+     - const: dwc2
+     - const: dwc2-ecc
+    minItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb2-phy
+
+  vbus-supply:
+    description: reference to the VBUS regulator. Depending on the current mode
+      this is enabled (in "host" mode") or disabled (in "peripheral" mode). The
+      regulator is updated if the controller is configured in "otg" mode and the
+      status changes between "host" and "peripheral".
+
+  vusb_d-supply:
+    description: phandle to voltage regulator of digital section,
+
+  vusb_a-supply:
+    description: phandle to voltage regulator of analog section.
+
+  dr_mode:
+    enum: [host, peripheral, otg]
+
+  g-rx-fifo-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: size of rx fifo size in gadget mode.
+
+  g-np-tx-fifo-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: size of non-periodic tx fifo size in gadget mode.
+
+  g-tx-fifo-size:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
+
+  snps,need-phy-for-wake:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: If present indicates that the phy needs to be left on for remote wakeup during suspend.
+
+  snps,reset-phy-on-wake:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: If present indicates that we need to reset the PHY when we detect a wakeup.
+                 This is due to a hardware errata.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+      usb@101c0000 {
+        compatible = "rockchip,rk3066-usb", "snps,dwc2";
+        reg = <0x10180000 0x40000>;
+        interrupts = <18>;
+        clocks = <&usb_otg_ahb_clk>;
+        clock-names = "otg";
+        phys = <&usbphy>;
+        phy-names = "usb2-phy";
+      };
+
+...
-- 
2.15.0

