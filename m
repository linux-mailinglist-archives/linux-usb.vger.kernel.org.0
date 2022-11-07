Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B8961F488
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 14:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiKGNnG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 08:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbiKGNnE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 08:43:04 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1571B78D;
        Mon,  7 Nov 2022 05:43:03 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id CBBC380431;
        Mon,  7 Nov 2022 14:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667828581;
        bh=Uvklua98IeMmA8rxY0JxgX6wIphKs6jCdOd3FJAbZtw=;
        h=From:To:Cc:Subject:Date:From;
        b=He5QuMecipI0FPtg6rzyEAuo5/0g6OBnVeR9KtRR7AIKvXkLhn9hYU/mNUNETTmC6
         7MVGeJobdOBOW5VQxdupdw4s94oH7CGhF/Jxr6Z2WjR3CVJF2agh1ON5yfB4lCPrD0
         4Fumd1ZtC4SpXnDTHgSJzFL2u+q//Mzb4Dqg7Ez4Tn53Iq9gGIUsA0uXKE8P05yuSR
         3p0k+MOLAmd9bdb0cXHRJCK2G1pQ/DIm7OT3fnTGND4yEnUaCix1eZwiMfUHfOTSBC
         y4pNoXrC7PZwDz6a4Z18OxuzcdHTO/ewDqgbUrprPRG55C3YeoN59ahegi/NJSRwKk
         K7+tcAf51UEbA==
From:   Marek Vasut <marex@denx.de>
To:     devicetree@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v4] dt-bindings: usb: usb251xb: Convert to YAML schema
Date:   Mon,  7 Nov 2022 14:42:48 +0100
Message-Id: <20221107134248.21899-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Convert the usb251xb hub DT bindings from text to yaml schema so it is
possible to validate DTs against the schema.

Adjust the example to describe two different hubs at different I2C bus
addresses, to avoid I2C address collission in the example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Richard Leitner <richard.leitner@skidata.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
V2: - Switch from uint16-item to uint16 for all of vendor-id,product-id,
      device-id,language-id
    - Use default: to specify the default values of properties
V3: - Replace range descriptions with default:
    - Use generic node names in example, i.e. usb-hub
V4: - Replace unevaluatedProperties with additionalProperties
    - Add RB from Krzysztof
---
 .../devicetree/bindings/usb/usb251xb.txt      |  89 ------
 .../devicetree/bindings/usb/usb251xb.yaml     | 271 ++++++++++++++++++
 2 files changed, 271 insertions(+), 89 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/usb251xb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb251xb.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
deleted file mode 100644
index 1a934eab175ee..0000000000000
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ /dev/null
@@ -1,89 +0,0 @@
-Microchip USB 2.0 Hi-Speed Hub Controller
-
-The device node for the configuration of a Microchip USB251x/xBi USB 2.0
-Hi-Speed Controller.
-
-Required properties :
- - compatible : Should be "microchip,usb251xb" or one of the specific types:
-	"microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
-	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi",
-	"microchip,usb2517", "microchip,usb2517i", "microchip,usb2422"
- - reg : I2C address on the selected bus (default is <0x2C>)
-
-Optional properties :
- - reset-gpios : Should specify the gpio for hub reset
- - vdd-supply : Should specify the phandle to the regulator supplying vdd
- - skip-config : Skip Hub configuration, but only send the USB-Attach command
- - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
- - product-id : Set USB Product ID of the hub (16 bit, default depends on type)
- - device-id : Set USB Device ID of the hub (16 bit, default is 0x0bb3)
- - language-id : Set USB Language ID (16 bit, default is 0x0000)
- - manufacturer : Set USB Manufacturer string (max 31 characters long)
- - product : Set USB Product string (max 31 characters long)
- - serial : Set USB Serial string (max 31 characters long)
- - {bus,self}-powered : selects between self- and bus-powered operation
-	(boolean, default is self-powered)
- - disable-hi-speed : disable USB Hi-Speed support (boolean)
- - {multi,single}-tt : selects between multi- and single-transaction-translator
-	(boolean, default is multi-tt)
- - disable-eop : disable End of Packet generation in full-speed mode (boolean)
- - {ganged,individual}-sensing : select over-current sense type in self-powered
-	mode (boolean, default is individual)
- - {ganged,individual}-port-switching : select port power switching mode
-	(boolean, default is individual)
- - dynamic-power-switching : enable auto-switching from self- to bus-powered
-	operation if the local power source is removed or unavailable (boolean)
- - oc-delay-us : Delay time (in microseconds) for filtering the over-current
-	sense inputs. Valid values are 100, 4000, 8000 (default) and 16000. If
-	an invalid value is given, the default is used instead.
- - compound-device : indicate the hub is part of a compound device (boolean)
- - port-mapping-mode : enable port mapping mode (boolean)
- - led-{usb,speed}-mode : led usb/speed indication mode selection
-	(boolean, default is speed mode)
- - string-support : enable string descriptor support (required for manufacturer,
-	product and serial string configuration)
- - non-removable-ports : Should specify the ports which have a non-removable
-	device connected.
- - sp-disabled-ports : Specifies the ports which will be self-power disabled
- - bp-disabled-ports : Specifies the ports which will be bus-power disabled
- - sp-max-total-current-microamp: Specifies max current consumed by the hub
-	from VBUS when operating in self-powered hub. It includes the hub
-	silicon along with all associated circuitry including a permanently
-	attached peripheral (range: 0 - 100000 uA, default 1000 uA)
- - bp-max-total-current-microamp: Specifies max current consumed by the hub
-	from VBUS when operating in self-powered hub. It includes the hub
-	silicon along with all associated circuitry including a permanently
-	attached peripheral (range: 0 - 510000 uA, default 100000 uA)
- - sp-max-removable-current-microamp: Specifies max current consumed by the hub
-	from VBUS when operating in self-powered hub. It includes the hub
-	silicon along with all associated circuitry excluding a permanently
-	attached peripheral (range: 0 - 100000 uA, default 1000 uA)
- - bp-max-removable-current-microamp: Specifies max current consumed by the hub
-	from VBUS when operating in self-powered hub. It includes the hub
-	silicon along with all associated circuitry excluding a permanently
-	attached peripheral (range: 0 - 510000 uA, default 100000 uA)
- - power-on-time-ms : Specifies the time it takes from the time the host
-	initiates the power-on sequence to a port until the port has adequate
-	power. The value is given in ms in a 0 - 510 range (default is 100ms).
- - swap-dx-lanes : Specifies the ports which will swap the differential-pair
-	(D+/D-), default is not-swapped.
-
-Examples:
-	usb2512b@2c {
-		compatible = "microchip,usb2512b";
-		reg = <0x2c>;
-		reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
-	};
-
-	usb2514b@2c {
-		compatible = "microchip,usb2514b";
-		reg = <0x2c>;
-		vendor-id = /bits/ 16 <0x0000>;
-		product-id = /bits/ 16 <0x0000>;
-		string-support;
-		manufacturer = "Foo";
-		product = "Foo-Bar";
-		serial = "1234567890A";
-		/* correct misplaced usb connectors on port 1,2 */
-		swap-dx-lanes = <1 2>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/usb251xb.yaml b/Documentation/devicetree/bindings/usb/usb251xb.yaml
new file mode 100644
index 0000000000000..4d15308168178
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb251xb.yaml
@@ -0,0 +1,271 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb251xb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip USB 2.0 Hi-Speed Hub Controller
+
+maintainers:
+  - Richard Leitner <richard.leitner@skidata.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,usb2422
+      - microchip,usb2512b
+      - microchip,usb2512bi
+      - microchip,usb2513b
+      - microchip,usb2513bi
+      - microchip,usb2514b
+      - microchip,usb2514bi
+      - microchip,usb2517
+      - microchip,usb2517i
+      - microchip,usb251xb
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description: |
+      Should specify the gpio for hub reset
+
+  vdd-supply:
+    description: |
+      Should specify the phandle to the regulator supplying vdd
+
+  skip-config:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Skip Hub configuration, but only send the USB-Attach command
+
+  vendor-id:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    default: 0x0424
+    description: |
+      Set USB Vendor ID of the hub
+
+  product-id:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: |
+      Set USB Product ID of the hub
+
+  device-id:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    default: 0x0bb3
+    description: |
+      Set USB Device ID of the hub
+
+  language-id:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    default: 0x0000
+    description: |
+      Set USB Language ID
+
+  manufacturer:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Set USB Manufacturer string (max 31 characters long)
+
+  product:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Set USB Product string (max 31 characters long)
+
+  serial:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Set USB Serial string (max 31 characters long)
+
+  bus-powered:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      selects between self- and bus-powered operation
+      (boolean, default is self-powered)
+
+  self-powered:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      selects between self- and bus-powered operation
+      (boolean, default is self-powered)
+
+  disable-hi-speed:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      disable USB Hi-Speed support (boolean)
+
+  multi-tt:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      selects between multi- and single-transaction-translator
+      (boolean, default is multi-tt)
+
+  single-tt:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      selects between multi- and single-transaction-translator
+      (boolean, default is multi-tt)
+
+  disable-eop:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      disable End of Packet generation in full-speed mode (boolean)
+
+  ganged-sensing:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      select over-current sense type in self-powered mode
+      (boolean, default is individual)
+
+  individual-sensing:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      select over-current sense type in self-powered mode
+      (boolean, default is individual)
+
+  ganged-port-switching:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      select port power switching mode (boolean, default is individual)
+
+  individual-port-switching:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      select port power switching mode (boolean, default is individual)
+
+  dynamic-power-switching:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      enable auto-switching from self- to bus-powered operation if the
+      local power source is removed or unavailable (boolean)
+
+  oc-delay-us:
+    enum: [100, 4000, 8000, 16000]
+    default: 8000
+    description: |
+      Delay time (in microseconds) for filtering the over-current sense
+      inputs. If an invalid value is given, the default is used instead.
+
+  compound-device:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      indicate the hub is part of a compound device (boolean)
+
+  port-mapping-mode:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      enable port mapping mode (boolean)
+
+  led-usb-mode:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      led usb/speed indication mode selection (boolean, default is speed mode)
+
+  led-speed-mode:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      led usb/speed indication mode selection (boolean, default is speed mode)
+
+  string-support:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      enable string descriptor support (required for manufacturer, product
+      and serial string configuration)
+
+  non-removable-ports:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      Should specify the ports which have a non-removable device connected.
+
+  sp-disabled-ports:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      Specifies the ports which will be self-power disabled
+
+  bp-disabled-ports:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      Specifies the ports which will be bus-power disabled
+
+  sp-max-total-current-microamp:
+    maximum: 100000
+    default: 1000
+    description: |
+      Specifies max current consumed by the hub from VBUS when
+      operating in self-powered hub. It includes the hub silicon
+      along with all associated circuitry including a permanently
+      attached peripheral.
+
+  bp-max-total-current-microamp:
+    maximum: 510000
+    default: 100000
+    description: |
+      Specifies max current consumed by the hub from VBUS when
+      operating in self-powered hub. It includes the hub silicon
+      along with all associated circuitry including a permanently
+      attached peripheral.
+
+  sp-max-removable-current-microamp:
+    maximum: 100000
+    default: 1000
+    description: |
+      Specifies max current consumed by the hub from VBUS when
+      operating in self-powered hub. It includes the hub silicon
+      along with all associated circuitry excluding a permanently
+      attached peripheral.
+
+  bp-max-removable-current-microamp:
+    maximum: 510000
+    default: 100000
+    description: |
+      Specifies max current consumed by the hub from VBUS when
+      operating in self-powered hub. It includes the hub silicon
+      along with all associated circuitry excluding a permanently
+      attached peripheral.
+
+  power-on-time-ms:
+    maximum: 510
+    default: 100
+    description: |
+      Specifies the time it takes from the time the host initiates the
+      power-on sequence to a port until the port has adequate power.
+
+  swap-dx-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      Specifies the ports which will swap the differential-pair (D+/D-),
+      default is not-swapped.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      usb-hub@2c {
+        compatible = "microchip,usb2512b";
+        reg = <0x2c>;
+        reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+      };
+
+      usb-hub@2d {
+        compatible = "microchip,usb2514b";
+        reg = <0x2d>;
+        vendor-id = /bits/ 16 <0x0000>;
+        product-id = /bits/ 16 <0x0000>;
+        string-support;
+        manufacturer = "Foo";
+        product = "Foo-Bar";
+        serial = "1234567890A";
+        /* correct misplaced usb connectors on port 1,2 */
+        swap-dx-lanes = <1 2>;
+      };
+    };
-- 
2.35.1

