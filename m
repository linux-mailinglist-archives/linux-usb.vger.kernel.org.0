Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB4858234E
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 11:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbiG0JiX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 05:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiG0JiO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 05:38:14 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8014247B9A;
        Wed, 27 Jul 2022 02:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658914691; x=1690450691;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OzYJ1HAiwxCqKstvTbidtou/YL9g88MGig64r0nWnVw=;
  b=aNeaQNmmHY29thqsSw8GOw0fDq4B7lw7J82QrtKTYrrOAh2JYmbVmL9a
   7vNU9VAiS0rrx5fwKKxx+bUg3C2UdtOoj+ovqVQfPbusblPhQIXy4ryE5
   37BIKQp3Z4+Y58GxCAR2gUTeDIqw9XoREOAZrfHYFC1k2qTvZOV9psKPs
   G1Y/YPzUAYa1Cz7qjWCYOlrK8c1i/fWZvSHVdUXFFENqyBSekxTc1D8Eo
   ZOD62a9MhX73woMFLEguwyQEjZbqdxX9C8OR7iN+BWs2AlQVMNXxQxvrS
   uRAu0J95LNl7dTu4YF3/RSwPtPKZ07l44O8JojNIUWf1y6arRUs4g5j94
   w==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25289990"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Jul 2022 11:38:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 27 Jul 2022 11:38:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 27 Jul 2022 11:38:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658914685; x=1690450685;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OzYJ1HAiwxCqKstvTbidtou/YL9g88MGig64r0nWnVw=;
  b=FlSgKtPatqXzQybeO1M5i+vW3M+lts1fznYqlX/bnsNyvfB4OV0vG/gZ
   dvkO3dIVeqtle4Jb7OwQw4Ld6yPWTyNiXtG2SY/2mG8IoNLpXpbX2dd4r
   H6mczfS2/S75oqVfA3vV75nFy95v5WP8ohJ3rA4MUdM6G78zvbbyTlruz
   HvPiD2v7W4fnpgBDQbaezisQ8Vws835x3iHIKsjmr13KBg5l50fwYZgEO
   ZBs+h2KLtc22TUkSVrmMrv7jUE88HPWi5+nw5zW4gbKSrwsdzB+vifFX9
   KGWaHaKEsIzdmpNiS7A/cBeuetxbWPU1qBKmO8FEIfaRQKtJxRqkporsO
   w==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654552800"; 
   d="scan'208";a="25289987"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Jul 2022 11:38:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C6C12280056;
        Wed, 27 Jul 2022 11:38:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: usb: Add binding for TI USB8041 hub controller
Date:   Wed, 27 Jul 2022 11:37:59 +0200
Message-Id: <20220727093801.687361-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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
Thanks Matthias for your review.

Changes in v3:
* Put myself as maintainer
* Removed quotes around description

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
index 000000000000..e04fbd8ab0b7
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
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
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
+      VDD power supply to the hub
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

