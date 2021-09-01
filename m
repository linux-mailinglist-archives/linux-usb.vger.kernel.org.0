Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855A13FD68E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 11:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243569AbhIAJVB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 05:21:01 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:51177 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243566AbhIAJU5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Sep 2021 05:20:57 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6F365580B24;
        Wed,  1 Sep 2021 05:20:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 01 Sep 2021 05:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=NE9AUAjhoU4hV
        oBIJpvEmvndGMXYqbykLIA62gBCqIE=; b=pRlwnYEdf+7wSiJ6R1UnMt0jfhAAx
        iVpi7GmR4SvybcUbEsdeGpv9xBU4b/xQBi1yNDig3B8xtzf4slb1Q5kSeNx8lQP2
        F5/OsN8VhrZyGQwtgwMA+a7iYqqxXgQz34u0mvTXv+j5LwxdvvIbIWQI+tYSRK90
        gJ04zdFmwVp0pUd+CWV+aoSD+ani4DNo4viXv0J4glRaJUTOyah+2SCmacxGVypE
        BacgeN1iNGjX3fbceu9DCslRtiqnhtYOzYTexfzu41lJqB14yk0BA537IjDpjym/
        FNij1mAQ7y1zlMup0Cjf7lGMGOqkt9XQ+paVqUi50QrepA/KCxDQlWzKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=NE9AUAjhoU4hVoBIJpvEmvndGMXYqbykLIA62gBCqIE=; b=qg7Gg/Vr
        s0YSypUS/C4XP0ecBKzOm3aRX4lBRjvaA70XeWz3Us0e9flJpk1OOYRZjMR+zEQP
        oP8fBOhpN1UoGIrE//drKD5gWm9LxgBBN61un1Lu588kY4bde5sqs82PGN0xGVL8
        Fb6GFBQCbxMWPzXTsapuTIDWfwuVgDiPLhjhGQkO0YRbJ40uK0RigzrvQhU+3LEz
        i8+TtBXZ6VP3wCQtyMMonb0P+C4Wg9s20UUuQdHC6CTiJ1I+Y1+I7Ebj8QPb2sLB
        xqCm2MRgmuE0UQaTFQw4nDT4dA94fCToHzC+gG426/nTNn2mQbMGsNTObQHAmsws
        aXd367SEnbbD9Q==
X-ME-Sender: <xms:wEUvYTDd3GZg_7KknJLALkZ-9pyw8JXEURufBVeywbiNp6FVr-OJPw>
    <xme:wEUvYZhp-QqWbQWhyB_mnDD_ZUH37jeW5yvUEuKw2CPSfnAbx7jjQ0TDO1IXzQlLF
    yYBNEQ1SARZJeYqvMY>
X-ME-Received: <xmr:wEUvYendkOCaLUId4QD_4toymxyrrOaJhezieNcIsc2IJaPhIRuylDNA0agkJNURFK2KcRu-2_TzHXeUT5gCtsoQFGUpODgA1txw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
    fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
    igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
    fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
    gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wEUvYVw-vaoxzc2J43PipFp84V6RFxg_FubMjIdiAvozk1PwMEz19g>
    <xmx:wEUvYYT5rTmsitBBGIDWLfkICosc_NgK0BLytWm4q1_ZSO0eJnAHXA>
    <xmx:wEUvYYZx1ttXh1inMTCic22V10Uozs9mh9y4WjMEWIJt5bRrNarNAA>
    <xmx:wEUvYR-uTrPZYiftxFOW67HwxR8Q4kvWVwKFup8qC4333HPfovf7nw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:59 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dongjin Kim <tobetter@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 36/52] dt-bindings: usb: Convert SMSC USB3503 binding to a schema
Date:   Wed,  1 Sep 2021 11:18:36 +0200
Message-Id: <20210901091852.479202-37-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
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

