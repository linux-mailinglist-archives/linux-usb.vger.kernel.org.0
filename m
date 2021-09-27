Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABD6419010
	for <lists+linux-usb@lfdr.de>; Mon, 27 Sep 2021 09:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbhI0HhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Sep 2021 03:37:01 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:41189 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233239AbhI0Hg7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Sep 2021 03:36:59 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B54D1580BC8;
        Mon, 27 Sep 2021 03:35:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 27 Sep 2021 03:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=A3s6y6hwUMyIsQsNqVih3FBF+C
        v0Sh+tj8l+5TZsS2s=; b=gIapKDZrG8up5olyj6wbCLcBdEwo/Y5AgkwiJHh8CV
        QwSwdAawQGspb0vrbJ+avuIZETCo5ST1q4imPNocYQN3HEZtWUT1qD1zfiLC6veU
        0BoBnxdSBf4pCjGM4pgvsYYSSKEtJOtBy8YYwXD5JakpUVpAd0mK9JHaPt/wXd1R
        lF/QE2e4yJVJDsB+7DIIU+94/uuUPmAiLSDgcqQ1vIUjEyNVoHLp+yaiwbeacwpk
        Yt1OJO8/sgZJDoTsbGE5P4iIo1xsugHuup8XBvZ7yeEKiUISfNk+Kw5WI6SWMU5E
        8mmRciJnAjTJTL/uM4PL6OBVTKbLvZc+TefkzmQw9sBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=A3s6y6hwUMyIsQsNq
        Vih3FBF+Cv0Sh+tj8l+5TZsS2s=; b=jmliwDtCSclO1qYwqirLRNl+Fx5sM/YoX
        qQn9eDIP1uP9OEUgCDYezwk+viWGe1mzIJHNLYqvZdj9+RWASOKi7lMoaLvb95db
        dxqwnkuaVN9crhF4OEOYJQ7AqYIyyqTc7/yJkVrDIbs3eRTWTyTdf04eZiraoLoK
        36qU7dkpFykoBjnQCEXapIZ1q67yNzh8h3WvLtXOcCJGGxe0/fc3XOmbBOrT8Ygh
        GWcZbyM1+OomQ1eXTc9x8JJof060TO7VuOzO4cLs139nU/c0JcAOp2TMKdm2y1Ur
        +/QS1uJIQLszWy6wzR2DZWwK0YNTJr8bPkYDTAL5aq5lOR1cgHQnQ==
X-ME-Sender: <xms:NXRRYZUkcOjtjhDVUL9Q5h-soln_0KwE_doPBr5Sb4PCXijmVBLJcg>
    <xme:NXRRYZmN7-8o6O1UT-KdKO3AEiPQ9M14NJ38BEvzOA4Y9aG81iL_FxOZHBPfUzWTe
    48E_SHWw7H_UMmIjMo>
X-ME-Received: <xmr:NXRRYVYYo5DaoEGqDC4UUaXM1_SjSGiQe_PWK095UA5E9QWUQb7stYFoft8y26hxwBtYnhbrZim7ghvlqBjeW5yg0FMyxGYZPQqRNlz_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffo
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhephffhhfevtddthefg
    ieeigeffudehkefgtdeufedvtdduheduieekvddvfedvkeetnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NXRRYcUMemWCnBHzg5irGropUha8KLyN3eOKs90uY1ikFR20_P6FmQ>
    <xmx:NXRRYTkyULSVEhGtdErBvuhWHDZoj8H80FafG3JXqIQ7xBx6MANKqQ>
    <xmx:NXRRYZc0tw5CEClOD9Q0QtLNEjbOUUFT9uoCTyU96SbDtYJlaIB9iQ>
    <xmx:NnRRYcfE-xp-Ic7HmMVm0ttdhIZp2BGJ3--SHLh0r-m4f1DCnd3HQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 03:35:17 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-sunxi@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [RESEND v2 1/2] dt-bindings: usb: Convert SMSC USB3503 binding to a schema
Date:   Mon, 27 Sep 2021 09:35:13 +0200
Message-Id: <20210927073514.14334-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The SMSC USB3503 USB Hub Controller is supported by Linux thanks to
its device tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Dongjin Kim <tobetter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Added maximum number of items for clocks and gpios
  - Fixed the example node name
---
 .../devicetree/bindings/usb/smsc,usb3503.yaml | 108 ++++++++++++++++++
 .../devicetree/bindings/usb/usb3503.txt       |  39 -------
 2 files changed, 108 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/usb3503.txt

diff --git a/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml b/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
new file mode 100644
index 000000000000..39228a506b93
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/smsc,usb3503.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SMSC USB3503 High-Speed Hub Controller Device Tree Bindings
+
+maintainers:
+  - Dongjin Kim <tobetter@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - smsc,usb3503
+      - smsc,usb3503a
+
+  reg:
+    maxItems: 1
+
+  connect-gpios:
+    maxItems: 1
+    description: >
+      GPIO for connect
+
+  intn-gpios:
+    maxItems: 1
+    description: >
+      GPIO for interrupt
+
+  reset-gpios:
+    maxItems: 1
+    description: >
+      GPIO for reset
+
+  disabled-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 3
+    items:
+      minimum: 1
+      maximum: 3
+    description: >
+      Specifies the ports unused using their port number. Do not describe this
+      property if all ports have to be enabled.
+
+  initial-mode:
+    enum: [1, 2]
+    description: >
+      Specifies initial mode. 1 for Hub mode, 2 for standby mode.
+
+  clocks:
+    maxItems: 1
+    description: >
+      Clock used for driving REFCLK signal. If not provided the driver assumes
+      that clock signal is always available, its rate is specified by REF_SEL
+      pins and a value from the primary reference clock frequencies table is
+      used.
+
+  clock-names:
+    const: refclk
+
+  refclk-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Frequency of the REFCLK signal as defined by REF_SEL pins. If not
+      provided, driver will not set rate of the REFCLK signal and assume that a
+      value from the primary reference clock frequencies table is used.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+        
+          usb-hub@8 {
+              compatible = "smsc,usb3503";
+              reg = <0x08>;
+              connect-gpios = <&gpx3 0 1>;
+              disabled-ports = <2 3>;
+              intn-gpios = <&gpx3 4 1>;
+              reset-gpios = <&gpx3 5 1>;
+              initial-mode = <1>;
+              clocks = <&clks 80>;
+              clock-names = "refclk";
+          };
+      };
+
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      usb-hub {
+          /* I2C is not connected */
+          compatible = "smsc,usb3503";
+          initial-mode = <1>; /* initialize in HUB mode */
+          disabled-ports = <1>;
+          intn-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+          reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+          connect-gpios = <&pio 4 17 GPIO_ACTIVE_HIGH>; /* PE17 */
+          refclk-frequency = <19200000>;
+      };
+
+...
diff --git a/Documentation/devicetree/bindings/usb/usb3503.txt b/Documentation/devicetree/bindings/usb/usb3503.txt
deleted file mode 100644
index 057dd384d473..000000000000
--- a/Documentation/devicetree/bindings/usb/usb3503.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-SMSC USB3503 High-Speed Hub Controller
-
-Required properties:
-- compatible: Should be "smsc,usb3503" or "smsc,usb3503a".
-
-Optional properties:
-- reg: Specifies the i2c slave address, it is required and should be 0x08
-       if I2C is used.
-- connect-gpios: Should specify GPIO for connect.
-- disabled-ports: Should specify the ports unused.
-	'1' or '2' or '3' are available for this property to describe the port
-	number. 1~3 property values are possible to be described.
-	Do not describe this property if all ports have to be enabled.
-- intn-gpios: Should specify GPIO for interrupt.
-- reset-gpios: Should specify GPIO for reset.
-- initial-mode: Should specify initial mode.
-                (1 for HUB mode, 2 for STANDBY mode)
-- refclk: Clock used for driving REFCLK signal (optional, if not provided
-	the driver assumes that clock signal is always available, its
-	rate is specified by REF_SEL pins and a value from the primary
-	reference clock frequencies table is used). Use clocks and
-	clock-names in order to assign it
-- refclk-frequency: Frequency of the REFCLK signal as defined by REF_SEL
-	pins (optional, if not provided, driver will not set rate of the
-	REFCLK signal and assume that a value from the primary reference
-	clock frequencies table is used)
-
-Examples:
-	usb3503@8 {
-		compatible = "smsc,usb3503";
-		reg = <0x08>;
-		connect-gpios = <&gpx3 0 1>;
-		disabled-ports = <2 3>;
-		intn-gpios = <&gpx3 4 1>;
-		reset-gpios = <&gpx3 5 1>;
-		initial-mode = <1>;
-		clocks = <&clks 80>;
-		clock-names = "refclk";
-	};
-- 
2.31.1

