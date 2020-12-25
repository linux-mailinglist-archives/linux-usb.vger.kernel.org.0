Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB802E2A59
	for <lists+linux-usb@lfdr.de>; Fri, 25 Dec 2020 08:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbgLYHy6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Dec 2020 02:54:58 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:33211 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729399AbgLYHy5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Dec 2020 02:54:57 -0500
X-UUID: 587eddb5383e45959de1aa45a27d3ba9-20201225
X-UUID: 587eddb5383e45959de1aa45a27d3ba9-20201225
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1847833142; Fri, 25 Dec 2020 15:53:00 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 15:52:59 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Dec 2020 15:52:57 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Min Guo <min.guo@mediatek.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: [PATCH v5 01/11] dt-bindings: usb: convert usb-device.txt to YAML schema
Date:   Fri, 25 Dec 2020 15:52:48 +0800
Message-ID: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Convert usb-device.txt to YAML schema usb-device.yaml

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v5: changes suggested by Rob:
  1. limit the pattern length
  2. remove properties description for hard wired USB devices in usb-hcd.yaml

    depends on series:
    https://patchwork.kernel.org/project/linux-usb/list/?series=399561
    [v6,00/19] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema

v4: no changes, update dependent series:
    https://patchwork.kernel.org/project/linux-usb/list/?series=399561
    [v6,00/19] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema

v3:
  1. remove $nodenmae and items key word for compatilbe;
  2. add additionalProperties;

  The followings are suggested by Rob:
  3. merge the following patch
    [v2,1/4] dt-bindings: usb: convert usb-device.txt to YAML schema
    [v2,2/4] dt-bindings: usb: add properties for hard wired devices
  4. define the unit-address for hard-wired device in usb-hcd.yaml,
     also define its 'reg' and 'compatible';
  5. This series is base on Serge's series:
    https://patchwork.kernel.org/project/linux-usb/cover/20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru/
    [v4,00/18] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema

v2 changes suggested by Rob:
  1. modify pattern to support any USB class
  2. convert usb-device.txt into usb-device.yaml
---
 .../devicetree/bindings/usb/usb-device.txt    | 102 --------------
 .../devicetree/bindings/usb/usb-device.yaml   | 124 ++++++++++++++++++
 .../devicetree/bindings/usb/usb-hcd.yaml      |  19 +++
 3 files changed, 143 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-device.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
deleted file mode 100644
index 036be172b1ae..000000000000
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-Generic USB Device Properties
-
-Usually, we only use device tree for hard wired USB device.
-The reference binding doc is from:
-http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
-
-Four types of device-tree nodes are defined: "host-controller nodes"
-representing USB host controllers, "device nodes" representing USB devices,
-"interface nodes" representing USB interfaces and "combined nodes"
-representing simple USB devices.
-
-A combined node shall be used instead of a device node and an interface node
-for devices of class 0 or 9 (hub) with a single configuration and a single
-interface.
-
-A "hub node" is a combined node or an interface node that represents a USB
-hub.
-
-
-Required properties for device nodes:
-- compatible: "usbVID,PID", where VID is the vendor id and PID the product id.
-  The textual representation of VID and PID shall be in lower case hexadecimal
-  with leading zeroes suppressed. The other compatible strings from the above
-  standard binding could also be used, but a device adhering to this binding
-  may leave out all except for "usbVID,PID".
-- reg: the number of the USB hub port or the USB host-controller port to which
-  this device is attached. The range is 1-255.
-
-
-Required properties for device nodes with interface nodes:
-- #address-cells: shall be 2
-- #size-cells: shall be 0
-
-
-Required properties for interface nodes:
-- compatible: "usbifVID,PID.configCN.IN", where VID is the vendor id, PID is
-  the product id, CN is the configuration value and IN is the interface
-  number. The textual representation of VID, PID, CN and IN shall be in lower
-  case hexadecimal with leading zeroes suppressed. The other compatible
-  strings from the above standard binding could also be used, but a device
-  adhering to this binding may leave out all except for
-  "usbifVID,PID.configCN.IN".
-- reg: the interface number and configuration value
-
-The configuration component is not included in the textual representation of
-an interface-node unit address for configuration 1.
-
-
-Required properties for combined nodes:
-- compatible: "usbVID,PID", where VID is the vendor id and PID the product id.
-  The textual representation of VID and PID shall be in lower case hexadecimal
-  with leading zeroes suppressed. The other compatible strings from the above
-  standard binding could also be used, but a device adhering to this binding
-  may leave out all except for "usbVID,PID".
-- reg: the number of the USB hub port or the USB host-controller port to which
-  this device is attached. The range is 1-255.
-
-
-Required properties for hub nodes with device nodes:
-- #address-cells: shall be 1
-- #size-cells: shall be 0
-
-
-Required properties for host-controller nodes with device nodes:
-- #address-cells: shall be 1
-- #size-cells: shall be 0
-
-
-Example:
-
-&usb1 {	/* host controller */
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	hub@1 {		/* hub connected to port 1 */
-		compatible = "usb5e3,608";
-		reg = <1>;
-	};
-
-	device@2 {	/* device connected to port 2 */
-		compatible = "usb123,4567";
-		reg = <2>;
-	};
-
-	device@3 { 	/* device connected to port 3 */
-		compatible = "usb123,abcd";
-		reg = <3>;
-
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		interface@0 {	/* interface 0 of configuration 1 */
-			compatible = "usbif123,abcd.config1.0";
-			reg = <0 1>;
-		};
-
-		interface@0,2 {	/* interface 0 of configuration 2 */
-			compatible = "usbif123,abcd.config2.0";
-			reg = <0 2>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
new file mode 100644
index 000000000000..7bb25a45427d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-device.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The device tree bindings for the Generic USB Device
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+description: |
+  Usually, we only use device tree for hard wired USB device.
+  The reference binding doc is from:
+  http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
+
+  Four types of device-tree nodes are defined: "host-controller nodes"
+  representing USB host controllers, "device nodes" representing USB devices,
+  "interface nodes" representing USB interfaces and "combined nodes"
+  representing simple USB devices.
+
+  A combined node shall be used instead of a device node and an interface node
+  for devices of class 0 or 9 (hub) with a single configuration and a single
+  interface.
+
+  A "hub node" is a combined node or an interface node that represents a USB
+  hub.
+
+properties:
+  compatible:
+    pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
+    description: Device nodes or combined nodes.
+      "usbVID,PID", where VID is the vendor id and PID the product id.
+      The textual representation of VID and PID shall be in lower case
+      hexadecimal with leading zeroes suppressed. The other compatible
+      strings from the above standard binding could also be used,
+      but a device adhering to this binding may leave out all except
+      for "usbVID,PID".
+
+  reg:
+    description: the number of the USB hub port or the USB host-controller
+      port to which this device is attached. The range is 1-255.
+    maxItems: 1
+
+  "#address-cells":
+    description: should be 1 for hub nodes with device nodes,
+      should be 2 for device nodes with interface nodes.
+    enum: [1, 2]
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^interface@[0-9a-f]{1,2}(,[0-9a-f]{1,2})$":
+    type: object
+    description: USB interface nodes.
+      The configuration component is not included in the textual
+      representation of an interface-node unit address for configuration 1.
+
+    properties:
+      compatible:
+        pattern: "^usbif[0-9a-f]{1,4},[0-9a-f]{1,4}.config[0-9a-f]{1,2}.[0-9a-f]{1,2}$"
+        description: Interface nodes.
+          "usbifVID,PID.configCN.IN", where VID is the vendor id, PID is
+          the product id, CN is the configuration value and IN is the interface
+          number. The textual representation of VID, PID, CN and IN shall be
+          in lower case hexadecimal with leading zeroes suppressed.
+          The other compatible strings from the above standard binding could
+          also be used, but a device adhering to this binding may leave out
+          all except for "usbifVID,PID.configCN.IN".
+
+      reg:
+        description: should be 2 cells long, the first cell represents
+          the interface number and the second cell represents the
+          configuration value.
+        maxItems: 1
+
+required:
+  - compatile
+  - reg
+
+additionalProperties: true
+
+examples:
+  #hub connected to port 1
+  #device connected to port 2
+  #device connected to port 3
+  #    interface 0 of configuration 1
+  #    interface 0 of configuration 2
+  - |
+    usb@11270000 {
+        reg = <0x11270000 0x1000>;
+        interrupts = <0x0 0x4e 0x0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@1 {
+            compatible = "usb5e3,608";
+            reg = <1>;
+        };
+
+        device@2 {
+            compatible = "usb123,4567";
+            reg = <2>;
+        };
+
+        device@3 {
+            compatible = "usb123,abcd";
+            reg = <3>;
+
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            interface@0 {
+                compatible = "usbif123,abcd.config1.0";
+                reg = <0 1>;
+            };
+
+            interface@0,2 {
+                compatible = "usbif123,abcd.config2.0";
+                reg = <0 2>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 9881ac10380d..56853c17af66 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -23,6 +23,18 @@ properties:
       targeted hosts (non-PC hosts).
     type: boolean
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^.*@[0-9a-f]{1,2}$":
+    description: The hard wired USB devices
+    type: object
+    $ref: /usb/usb-device.yaml
+
 additionalProperties: true
 
 examples:
@@ -30,4 +42,11 @@ examples:
     usb {
         phys = <&usb2_phy1>, <&usb3_phy1>;
         phy-names = "usb";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@1 {
+            compatible = "usb5e3,610";
+            reg = <1>;
+        };
     };
-- 
2.18.0

