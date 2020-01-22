Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10173145C10
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 19:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgAVS4V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 13:56:21 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40467 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbgAVS4U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 13:56:20 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so222717wrn.7
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 10:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8yLvveTTF6M79Bwe4ig420bjXyLBaOWcEk9QxX7j2oQ=;
        b=O9LtP5KOCR3Btz2J1w5lUKJbAQWFJk+lYglk/TiZC3RAFG0+z6SMPNPBnryqOeA9oF
         JjHQIpZ1TXnPFhuG5eJJW2us0GtF3TFdroHZ1dHLMmyO0pRiyh9VD2WxgRSz4sS9iEZv
         9+1fXO+zNIhaSS7nvgsrkzGdGDOAjCewwV5RZgN5QnXRKmf62W05vgTwMLhv6YbNydwW
         b9Aen1rUmGrYjCsxY0ZPeEZUIRQwVGQif9KGULw7yRWCYZxCwNVqnXCjdQK3GlsaLQld
         Iyni2iStVg0ubkXO01rP/7Mu2l2NlKJ1bzRZcV0xJEWj/JbVVk1P+7+LEGLJrgzXY+dO
         NHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8yLvveTTF6M79Bwe4ig420bjXyLBaOWcEk9QxX7j2oQ=;
        b=BaN2gk//49tsIGjcAZ0hO5zGgIrsLwg3c5JeXplS8kyg0uOiNrrsIPBOonN2HPbdsd
         GthrSTIzyGXZ2j04+FLtfnsVtEwyI4iWOaKGVdVDFerpTrTfAuQfvCRWdItJ194w/cjK
         RQhbM569VCkqSy0lCfbabsXF/eb6pblxMqh1DaV8ou05GWilpPmoYx4c0WBVfkLUstxG
         zzgolktPSTFTrll8iM0vgm/nZV5ImwwnBUFcR48QHGLDR75ZXDw1e4fGsDb+7DCHDPhI
         q5b21yNz98vP6Da6oeaOC7R3JD0UwdUkByhQKiPp5IC8Nrmb7LRuYLokTpijvRf8mAic
         r8zA==
X-Gm-Message-State: APjAAAX21rkj0KZDYmRXc2i0Js/n4yHUzHkKGfl8HgDxaU6/7I5Kgxaj
        PibD37IzJ05fBQsSKty0XtUqoA==
X-Google-Smtp-Source: APXvYqzz9iHxGUqvPYfu+biF9xpTStRLSp4QzX6HF4Q1ABZkNrIFVvBjS9BSwpXXtcl2F6tstT34Cw==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr12506776wrt.366.1579719377889;
        Wed, 22 Jan 2020 10:56:17 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:17 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 04/19] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date:   Wed, 22 Jan 2020 18:55:55 +0000
Message-Id: <20200122185610.131930-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed phy
controller embedded in QCS404.

Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
definitions.

[bod: converted to yaml format]

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/intel,lgm-emmc-phy.yaml      | 56 --------------
 .../devicetree/bindings/phy/qcom,usb-ss.yaml  | 75 +++++++++++++++++++
 2 files changed, 75 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml

diff --git a/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
deleted file mode 100644
index ff7959c21af0..000000000000
--- a/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
+++ /dev/null
@@ -1,56 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/phy/intel,lgm-emmc-phy.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Intel Lightning Mountain(LGM) eMMC PHY Device Tree Bindings
-
-maintainers:
-  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
-
-description: |+
-  Bindings for eMMC PHY on Intel's Lightning Mountain SoC, syscon
-  node is used to reference the base address of eMMC phy registers.
-
-  The eMMC PHY node should be the child of a syscon node with the
-  required property:
-
-  - compatible:         Should be one of the following:
-                        "intel,lgm-syscon", "syscon"
-  - reg:
-      maxItems: 1
-
-properties:
-  compatible:
-      const: intel,lgm-emmc-phy
-
-  "#phy-cells":
-    const: 0
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    maxItems: 1
-
-required:
-  - "#phy-cells"
-  - compatible
-  - reg
-  - clocks
-
-examples:
-  - |
-    sysconf: chiptop@e0200000 {
-      compatible = "intel,lgm-syscon", "syscon";
-      reg = <0xe0200000 0x100>;
-
-      emmc-phy: emmc-phy@a8 {
-        compatible = "intel,lgm-emmc-phy";
-        reg = <0x00a8 0x10>;
-        clocks = <&emmc>;
-        #phy-cells = <0>;
-      };
-    };
-...
diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
new file mode 100644
index 000000000000..3325b2f2e6a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom,usb-ss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Synopsys 1.0.0 SuperSpeed USB PHY
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm Synopsys 1.0.0 SuperSpeed USB PHY
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-ssphy
+
+  reg:
+    maxItems: 1
+    description: USB PHY base address and length of the register map.
+
+  "#phy-cells":
+    const: 0
+    description: Should be 0. See phy/phy-bindings.txt for details.
+
+  clocks:
+    maxItems: 3
+    minItems: 3
+    description: phandles for rpmcc clock, PHY AHB clock, SuperSpeed pipe clock.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: phy
+      - const: pipe
+
+  vdd-supply:
+    maxItems: 1
+    description: phandle to the regulator VDD supply node.
+
+  vdda1p8-supply:
+    maxItems: 1
+    description: phandle to the regulator 1.8V supply node.
+
+  resets:
+    items:
+      - description: COM reset
+      - description: PHY reset line
+
+  reset-names:
+    items:
+      - const: com
+      - const: phy
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    usb3_phy: usb3-phy@78000 {
+        compatible = "qcom,usb-ssphy";
+        reg = <0x78000 0x400>;
+        #phy-cells = <0>;
+        clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
+                 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
+                 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+        clock-names = "ref", "phy", "pipe";
+        resets = <&gcc GCC_USB3_PHY_BCR>,
+                 <&gcc GCC_USB3PHY_PHY_BCR>;
+        reset-names = "com", "phy";
+        vdd-supply = <&vreg_l3_1p05>;
+        vdda1p8-supply = <&vreg_l5_1p8>;
+    };
+...
-- 
2.25.0

