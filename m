Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66284742009
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jun 2023 07:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjF2Fqm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jun 2023 01:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbjF2Fqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jun 2023 01:46:39 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AE73B294E;
        Wed, 28 Jun 2023 22:46:37 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 35T5k3Ey9016346, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 35T5k3Ey9016346
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 29 Jun 2023 13:46:03 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 29 Jun 2023 13:46:04 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 29 Jun 2023 13:46:04 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 29 Jun 2023 13:46:04 +0800
From:   Stanley Chang <stanley_chang@realtek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Stanley Chang <stanley_chang@realtek.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Douglas Anderson" <dianders@chromium.org>,
        Ray Chi <raychi@google.com>,
        "Flavio Suligoi" <f.suligoi@asem.it>,
        Matthias Kaehlcke <mka@chromium.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH v6 5/5] dt-bindings: phy: realtek: Add the doc about the Realtek SoC USB 3.0 PHY
Date:   Thu, 29 Jun 2023 13:45:13 +0800
Message-ID: <20230629054523.7519-5-stanley_chang@realtek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629054523.7519-1-stanley_chang@realtek.com>
References: <20230629054523.7519-1-stanley_chang@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-KSE-ServerInfo: RTEXDAG01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the documentation explain the property about Realtek USB PHY driver.

Realtek DHC (digital home center) RTD SoCs support DWC3 XHCI USB
controller. Added the driver to drive the  USB 3.0 PHY transceivers.

Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
---
v5 to v6 change:
    Drop the labels of example.
v4 to v5 change:
    1. Remove the compatible realtek,usb3phy.
    2. Add the default of the property.
v3 to v4 change:
    1. Remove the parameter and non hardware properties from dts.
    2. Using the compatible data included the config and parameter
       in driver.
v2 to v3 change:
    1. Broken down into two patches, one for each of USB 2 & 3.
    2. Add more description about Realtek RTD SoCs architecture.
    3. Removed parameter v1 support for simplification.
    4. Revised the compatible name for fallback compatible.
    5. Remove some properties that can be set in the driver.
v1 to v2 change:
    Add phy-cells for generic phy driver
---
 .../bindings/phy/realtek,usb3phy.yaml         | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/realtek,usb3phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/realtek,usb3phy.yaml b/Documentation/devicetree/bindings/phy/realtek,usb3phy.yaml
new file mode 100644
index 000000000000..1a6cdc1ee073
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/realtek,usb3phy.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Realtek Semiconductor Corporation
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/realtek,usb3phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek DHC SoCs USB 3.0 PHY
+
+maintainers:
+  - Stanley Chang <stanley_chang@realtek.com>
+
+description:
+  Realtek USB 3.0 PHY support the digital home center (DHC) RTD series SoCs.
+  The USB 3.0 PHY driver is designed to support the XHCI controller. The SoCs
+  support multiple XHCI controllers. One PHY device node maps to one XHCI
+  controller.
+
+  RTD1295/RTD1619 SoCs USB
+  The USB architecture includes three XHCI controllers.
+  Each XHCI maps to one USB 2.0 PHY and map one USB 3.0 PHY on some
+  controllers.
+  XHCI controller#0 -- usb2phy -- phy#0
+                    |- usb3phy -- phy#0
+  XHCI controller#1 -- usb2phy -- phy#0
+  XHCI controller#2 -- usb2phy -- phy#0
+                    |- usb3phy -- phy#0
+
+  RTD1319/RTD1619b SoCs USB
+  The USB architecture includes three XHCI controllers.
+  Each XHCI maps to one USB 2.0 PHY and map one USB 3.0 PHY on controllers#2.
+  XHCI controller#0 -- usb2phy -- phy#0
+  XHCI controller#1 -- usb2phy -- phy#0
+  XHCI controller#2 -- usb2phy -- phy#0
+                    |- usb3phy -- phy#0
+
+  RTD1319d SoCs USB
+  The USB architecture includes three XHCI controllers.
+  Each xhci maps to one USB 2.0 PHY and map one USB 3.0 PHY on controllers#0.
+  XHCI controller#0 -- usb2phy -- phy#0
+                    |- usb3phy -- phy#0
+  XHCI controller#1 -- usb2phy -- phy#0
+  XHCI controller#2 -- usb2phy -- phy#0
+
+properties:
+  compatible:
+    enum:
+      - realtek,rtd1295-usb3phy
+      - realtek,rtd1319-usb3phy
+      - realtek,rtd1319d-usb3phy
+      - realtek,rtd1619-usb3phy
+      - realtek,rtd1619b-usb3phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  nvmem-cells:
+    maxItems: 1
+    description: A phandle to the tx lfps swing trim data provided by
+      a nvmem device, if unspecified, default values shall be used.
+
+  nvmem-cell-names:
+    items:
+      - const: usb_u3_tx_lfps_swing_trim
+
+  realtek,amplitude-control-coarse-tuning:
+    description:
+      This adjusts the signal amplitude for normal operation and beacon LFPS.
+      This value is a parameter for coarse tuning.
+      For different boards, if the default value is inappropriate, this
+      property can be assigned to adjust.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 255
+    minimum: 0
+    maximum: 255
+
+  realtek,amplitude-control-fine-tuning:
+    description:
+      This adjusts the signal amplitude for normal operation and beacon LFPS.
+      This value is used for fine-tuning parameters.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 65535
+    minimum: 0
+    maximum: 65535
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@13e10 {
+        compatible = "realtek,rtd1319d-usb3phy";
+        reg = <0x13e10 0x4>;
+        #phy-cells = <0>;
+
+        nvmem-cells = <&otp_usb_u3_tx_lfps_swing_trim>;
+        nvmem-cell-names = "usb_u3_tx_lfps_swing_trim";
+
+        realtek,amplitude-control-coarse-tuning = <0x77>;
+    };
-- 
2.34.1

