Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9F13D10B4
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 16:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239121AbhGUNZC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 09:25:02 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:42809 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238344AbhGUNZB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 09:25:01 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 427E95809C6;
        Wed, 21 Jul 2021 10:05:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 21 Jul 2021 10:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=9qld0t2oYFxap
        sHbSnLOlGHHQQ9aYeesFXGzWd2oVnQ=; b=1aQFOlTU7VmB9cN5IrG9YI38Z/1oR
        5L5TjyxU2T2Po1hb8pby3ztmm/4INYk0vfU0W/6EATBVlcv5wEvw2DyVb6WG7XdU
        U4S1x2a2kElKeP3gIp/UECWoXEyvSGjW7eY5m9k38XbIpuXx8T8mW+UAjw/n6uYE
        Nbq2WXO6CmioM7SHaah6lnF2jaUr8npyUV3CojHjMWqLNhNIl/KrwS8gvnDVaAAk
        nouuh5stkQ5QKNqw1VjzPpH5DB7T+IQna60G5NTaxlnafBFUiuA0n+xfbTWNZoi/
        2ZtNzEOIyY6uVxjFDQgpH5V8Xw1Hv6WdcQPquYaUN8bE8khmNHCpvcESg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=9qld0t2oYFxapsHbSnLOlGHHQQ9aYeesFXGzWd2oVnQ=; b=meiIO82U
        fJ9UV4lilmOm38p41HsApKvIgZgFonWCIm1TWh7fKTPEp4b278H9Fj72aKVg+xml
        /UHCjLG45kc/vZDLoAFl1dXoXcAYwA5S/R0nEJQISzbW4zdPrHIGihTADTEghwJv
        l8e3ik2MgRLUTUYu2kvFSaQ3PXqbSGo/0Lg6oG3e8qajmF4bfoLySzzi8WGd8IBh
        3QgY0jBvHLFIE8Zk/MtP4ZRFRaFMurPUvpqHjExg9YnA0pqar48/AtwvsLy6YVz0
        uDUewytjZHmfqWWU03GnvzQet4nBLA5eT8fIPb3mT4W5F8Pir+oHQrTkqvow2BQq
        0LlrlSIeok4gWw==
X-ME-Sender: <xms:sSn4YKUguqFV3OnKnVlGc1haKq8ZTIUACpAE7HzbRCCNIAvFk0Ew3Q>
    <xme:sSn4YGlApovkWULy5POJ0vTFumuiAwnSgU6KL5RALHs6ABJhnJaOA7Y2LoArDbYl9
    PzGBTAnfxGMvhlMMU8>
X-ME-Received: <xmr:sSn4YOYa1DkvX9XKYqvFJAXq8SloTSrbZlrNHK82X-F10RAEKVLEawCcWYB-AUJPaLE936GT0qA8RXCCz0BaaZkEYQW-eWFt9Wn0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
    gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sSn4YBWEZbQSvWC663LVJ3BSuhEBOEkepRtjzgwBoz2gH-S9CeN8og>
    <xmx:sSn4YEnfgznT4GCu3umwbbNyEt9xB3MqPCMCYex4vG_UvR-qE9zM8g>
    <xmx:sSn4YGdE9J3-zdUuMPyGLgwcFgDvOj7iVlc2XyzMGLOKN_DcUXFclw>
    <xmx:sin4YBjUZ29zDEbjx3HFKd98IU-zWbQ_WaWOpJdcSMGDVu_Bnc_F0g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:37 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dongjin Kim <tobetter@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 34/54] dt-bindings: usb: Convert SMSC USB3503 binding to a schema
Date:   Wed, 21 Jul 2021 16:04:04 +0200
Message-Id: <20210721140424.725744-35-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/usb/smsc,usb3503.yaml | 104 ++++++++++++++++++
 .../devicetree/bindings/usb/usb3503.txt       |  39 -------
 2 files changed, 104 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/usb3503.txt

diff --git a/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml b/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
new file mode 100644
index 000000000000..0e5622e7df87
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
@@ -0,0 +1,104 @@
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
+    description: >
+      GPIO for connect
+
+  intn-gpios:
+    description: >
+      GPIO for interrupt
+
+  reset-gpios:
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
+          usb3503@8 {
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

