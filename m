Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0F2497133
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236449AbiAWLRT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:17:19 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38518
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236321AbiAWLRF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:17:05 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B091B3F4B6
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936623;
        bh=EY00fcF86JGlObERH8+w8SsbFYrjNSJWFyQtAnjjq5Y=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=sCuuJpBjE/X0hCCq/tEYYgSvW2fyJxH2FUiU1r78pba7Ws6jGafk+hTMWG5kWOcDb
         H7uPx7ISUcUe6yf9T6eoe/DTMjcoYc4iN+wcNJqLWFvs810IyTFysht72GPAFuWE7y
         AaDh0IDAut/9gB1x0itsxHqOdjwDFumhNz0csMlp+8+lqg1fNSEt9v5kcoJ3an4nzr
         5O2gPrlbcDIftSFHPPZLvMZFhmZFXRK3uD8y4lDoheedDFl5ArHzW8Xn/Npdk8v23B
         TuYC+RjB6VuHQWUUw7YIlbBetGsZoypJQIpiXa0BURh3ZevL33VIq/CbKbPlXkLN+5
         y4oSKhkSE0Q7g==
Received: by mail-wm1-f70.google.com with SMTP id d140-20020a1c1d92000000b0034edefd55caso2639674wmd.4
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EY00fcF86JGlObERH8+w8SsbFYrjNSJWFyQtAnjjq5Y=;
        b=yjLfYh38VODR1tusrYOF7sOU0EpT1WFye7kxzT9tpwqOm5QcAVSbsstvCIMz+/t7nd
         B/G/sL9JJseJ3NCSpsF7coY+7JrtHGA+75o8tmuaE6JQzmAbqe1CU1/gI7Vwrm9J2C72
         aWm9eJdMXBCpEf0IYO2evU/gOQ61kBtrUHtLsxQQbc2yKG0p80AIaAO/4SZmjy6hsDty
         Eq0xzzPXJsJ2UPZvLEuAIwC7yAeAM02UghwKzyURRhiaS11gGPUJHFlHOj+sKZtcB80R
         pd3UM+LpPgq+ah6qUr1Yb57+1dWRHp9+Qls2E1ljEPpFlgx0G3f/rEC5fXPqhO3GWmaw
         WSdw==
X-Gm-Message-State: AOAM530lDEHW/Yt4gYJPdiyBPxll44KfF8IYLGxCoiskcyjYLQsjzIPq
        ZgDVFjtpoU8beSg75Fj9e8VBm2agsAeGU0c7gRinwbJQCoJCCA2oyp3hauvSTMgN/sdwMfrb1t3
        YCmpGZhI4808Cb+j1eFnmUZGA5WR63867Og12Sw==
X-Received: by 2002:adf:dc45:: with SMTP id m5mr10547736wrj.625.1642936623138;
        Sun, 23 Jan 2022 03:17:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsNM9NKLJfTsfQHi+oMgkh4hMNIzd9M7x4JIkzco0CcGHx4tgy+8mjHdxyr76nrcHJ2ddg/A==
X-Received: by 2002:adf:dc45:: with SMTP id m5mr10547721wrj.625.1642936622954;
        Sun, 23 Jan 2022 03:17:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:17:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] dt-bindings: usb: samsung,exynos-usb2: convert to dtschema
Date:   Sun, 23 Jan 2022 12:16:44 +0100
Message-Id: <20220123111644.25540-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Convert the Samsung Exynos SoC USB 2.0 EHCI and OHCI Controller bindings
to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/usb/exynos-usb.txt    |  66 ----------
 .../bindings/usb/samsung,exynos-usb2.yaml     | 117 ++++++++++++++++++
 2 files changed, 117 insertions(+), 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
deleted file mode 100644
index 61c03c0ef19f..000000000000
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Samsung Exynos SoC USB controller
-
-The USB devices interface with USB controllers on Exynos SOCs.
-The device node has following properties.
-
-EHCI
-Required properties:
- - compatible: should be "samsung,exynos4210-ehci" for USB 2.0
-   EHCI controller in host mode.
- - reg: physical base address of the controller and length of memory mapped
-   region.
- - interrupts: interrupt number to the cpu.
- - clocks: from common clock binding: handle to usb clock.
- - clock-names: from common clock binding: Shall be "usbhost".
- - phys: from the *Generic PHY* bindings; array specifying phy(s) used
-   by the root port.
- - phy-names: from the *Generic PHY* bindings; array of the names for
-   each phy for the root ports, must be a subset of the following:
-   "host", "hsic0", "hsic1".
-
-Optional properties:
- - samsung,vbus-gpio:  if present, specifies the GPIO that
-   needs to be pulled up for the bus to be powered.
-
-Example:
-
-	usb@12110000 {
-		compatible = "samsung,exynos4210-ehci";
-		reg = <0x12110000 0x100>;
-		interrupts = <0 71 0>;
-		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
-
-		clocks = <&clock 285>;
-		clock-names = "usbhost";
-
-		phys = <&usb2phy 1>;
-		phy-names = "host";
-	};
-
-OHCI
-Required properties:
- - compatible: should be "samsung,exynos4210-ohci" for USB 2.0
-   OHCI companion controller in host mode.
- - reg: physical base address of the controller and length of memory mapped
-   region.
- - interrupts: interrupt number to the cpu.
- - clocks: from common clock binding: handle to usb clock.
- - clock-names: from common clock binding: Shall be "usbhost".
- - phys: from the *Generic PHY* bindings; array specifying phy(s) used
-   by the root port.
- - phy-names: from the *Generic PHY* bindings; array of the names for
-   each phy for the root ports, must be a subset of the following:
-   "host", "hsic0", "hsic1".
-
-Example:
-	usb@12120000 {
-		compatible = "samsung,exynos4210-ohci";
-		reg = <0x12120000 0x100>;
-		interrupts = <0 71 0>;
-
-		clocks = <&clock 285>;
-		clock-names = "usbhost";
-
-		phys = <&usb2phy 1>;
-		phy-names = "host";
-	};
diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
new file mode 100644
index 000000000000..fbf07d6e707a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/samsung,exynos-usb2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC USB 2.0 EHCI/OHCI Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos4210-ehci
+      - samsung,exynos4210-ohci
+
+  '#address-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: usbhost
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 3
+
+  phy-names:
+    items:
+      enum: [host, hsic0, hsic1]
+    minItems: 1
+    maxItems: 3
+
+  reg:
+    maxItems: 1
+
+  samsung,vbus-gpio:
+    description:
+      Only for controller in EHCI mode, if present, specifies the GPIO that
+      needs to be pulled up for the bus to be powered.
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^.*@[0-9a-f]{1,2}$":
+    description: The hard wired USB devices
+    type: object
+    $ref: /usb/usb-device.yaml
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos4210-ohci
+    then:
+      properties:
+        samsung,vbus-gpio: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5420.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@12110000 {
+        compatible = "samsung,exynos4210-ehci";
+        reg = <0x12110000 0x100>;
+        interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock CLK_USBH20>;
+        clock-names = "usbhost";
+        phys = <&usb2_phy 0>;
+        phy-names = "host";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@1 {
+            compatible = "usb0424,9514";
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            usbether@1 {
+                compatible = "usb0424,ec00";
+                reg = <1>;
+                local-mac-address = [00 00 00 00 00 00];
+            };
+        };
+    };
+
+    usb@12120000 {
+        compatible = "samsung,exynos4210-ohci";
+        reg = <0x12120000 0x100>;
+        interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock CLK_USBH20>;
+        clock-names = "usbhost";
+        phys = <&usb2_phy 0>;
+        phy-names = "host";
+    };
-- 
2.32.0

