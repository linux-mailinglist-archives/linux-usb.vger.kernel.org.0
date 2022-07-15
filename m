Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0C4575C69
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jul 2022 09:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbiGOHdM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jul 2022 03:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbiGOHdL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jul 2022 03:33:11 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164307BE30;
        Fri, 15 Jul 2022 00:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657870390; x=1689406390;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=slT0zUpV9RfPM9uPTk2NhEc4i0611l7L6RhajXWI4dc=;
  b=Kp+ZYOfV5UFGDXjSLfVh7mrj2bU1edi3zHy6vI2c+0t9b3LSrGXwv61V
   Kadjp+8Ob4vl3RS1nVWysrmqzvzVWnei0K6mvD3Thjfx0+ZlUoaBeoW9H
   HXKowm8brABT9QBrllum+DNFzOSgEJL1++a34gcLNxlwSopEmIqJpijTO
   xZ3htWaMGlU9TYCO9SkhKHF5dW15Be20Dy1V6vt4tSNVcsLB9J57JFcV0
   dKYgYxT5ehkDOire8SMRuCLRP9BhaFB2S+By2kpplhoGAtz8liSAIcZMj
   moPoskykzvLlJAgFWcZrwq73s4VwQWqwoUy3el9EOCKrTvK7/95tWong5
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25068549"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Jul 2022 09:33:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 15 Jul 2022 09:33:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 15 Jul 2022 09:33:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657870384; x=1689406384;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=slT0zUpV9RfPM9uPTk2NhEc4i0611l7L6RhajXWI4dc=;
  b=qjU6c6kmyGIm9czuZNhbq1DnsBTAyvWdjf6Bs3VsWQhJ3eqlyGbEdc5s
   s/G0edcl6rfto9n7XipGvgvMoDpYapGOeoqmIuO51ZLpog9x6eLW1zfWO
   gbrY3oiP98uZnvjFYaWOfpPooK1YDVqM7SQ8nekSgh8c82+sEPGuNmSXB
   A5teuCELUKyNVzFO2berMkAS6XTYRwgdUVqQf0VGq6Dl6vFzx/S17mvUF
   XkcEFIaBiF+IJW8jy8x7xyrInNMwFxKoA6rlkRPlSp3hLRHq3oxtuCrPz
   J7NAsPmawTIDsaUTw6MErC+W0gLqRAz19g9Rn9uIY66FIlNfZhEHOz68M
   g==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25068547"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:33:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 79FBE280056;
        Fri, 15 Jul 2022 09:33:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: usb: Add binding for TI USB8041 hub controller
Date:   Fri, 15 Jul 2022 09:32:58 +0200
Message-Id: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The TI USB8041 is a USB 3.0 hub controller with 4 ports.

This initial version of the binding only describes USB related aspects
of the USB8041, it does not cover the option of connecting the controller
as an i2c slave.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Removed 'items' from compatible, it's just en enum now
* Rename reset-gpio to reset-gpios
* Use 'items' for reset-gpios
* Adjust description of vdd-supply
* Sorted required list
* Adjusted example

 .../devicetree/bindings/usb/ti,usb8041.yaml   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8041.yaml

diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
new file mode 100644
index 000000000000..7fe7416e2b51
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for the TI USB8041 USB 3.0 hub controller
+
+maintainers:
+  - Matthias Kaehlcke <mka@chromium.org>
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  compatible:
+    enum:
+      - usb451,8140
+      - usb451,8142
+
+  reg: true
+
+  reset-gpios:
+    items:
+      - description: GPIO specifier for GRST# pin.
+
+  vdd-supply:
+    description:
+      "VDD power supply to the hub"
+
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the peer hub on the controller.
+
+required:
+  - compatible
+  - reg
+  - peer-hub
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+          compatible = "usb451,8142";
+          reg = <1>;
+          peer-hub = <&hub_3_0>;
+          reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+        };
+
+        /* 3.0 hub on port 2 */
+        hub_3_0: hub@2 {
+          compatible = "usb451,8140";
+          reg = <2>;
+          peer-hub = <&hub_2_0>;
+          reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.25.1

