Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA4915505E
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 03:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgBGCAi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 21:00:38 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33416 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbgBGB7N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Feb 2020 20:59:13 -0500
Received: by mail-wm1-f65.google.com with SMTP id m10so2123192wmc.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2020 17:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uiB9oi1d6cb2tytj3R3C6lZe2r0DaI1xlBmtpgD+bqM=;
        b=Xgg6woM57hmJr4iXfd4nkjm6o9xnLTD5nNVaNQ7ArA1wNVbeYlBKb93436H+62szG3
         vlEK74d/uejUOdmXOI38yX7dPBlsr5m9n2Yu/ho8IyKdErxAHcR1w69cqVMICX/eiVYf
         I5RH9ei0QDjyN1h1eR3VKhFWp404gnfUNk4uAAtUbFHhRgp7XCj6eVKJ6GJw+4yxubOX
         QNDTeO3Wc1+Qq+Vki+DQg6DZoBIxI+kZbOAeodk867NCaVwR/pjZJiVXYFVU4VRUh5tU
         ZrqH9etazqXvVEa/AI+osvZQ79GNpcAurAE0CROltbdiraPgrIwPfizJS21O+2jLMaBU
         NNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uiB9oi1d6cb2tytj3R3C6lZe2r0DaI1xlBmtpgD+bqM=;
        b=nqdGastfaAwvKTpwcb8yNfM92ydjcMQe3jbjEBGf1qef+NiZBZVyXeyrXUYJj5Az+K
         qFC+0jc8rTabYjFHGHsAlThwSqZO43eufAltpyJEXt9fKXIYNXxIVGvKDQBcd7FEmWgJ
         iiDlNI2UePjQUrRjFQ3npCpAQC+RRVOX4nsLhnIyOe8SbwS/bwr8FaXr1+Zw9N8fyvLb
         mhFdsSaxGq9f6fTQtOA3N9mOIjWZF+LgwjvTd73bzRcXqLCyUaGHFlDb+10HOeGuiAOL
         bsGI05ZELfZcqemlMqFU9ka0SgB++/yzY7ezw+o8QQKQ+OSMN4GcPcotRJf+P0nN1ABW
         +GEQ==
X-Gm-Message-State: APjAAAU6u/2CGbS+ljP5Pdhawy1TGzYiE/i20JlR/98QYwduwCpcrKbY
        sTHR6aIGSuyHW/GCfToYg2gi4Q==
X-Google-Smtp-Source: APXvYqzZZokcswbNueE39cC9uHE92/zHoeVvkv70eaKx0sDTqO88vw1M81GS0hgjdK38X4DcmDClVw==
X-Received: by 2002:a05:600c:145:: with SMTP id w5mr902318wmm.157.1581040751787;
        Thu, 06 Feb 2020 17:59:11 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:11 -0800 (PST)
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
Subject: [PATCH v4 04/18] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date:   Fri,  7 Feb 2020 01:58:53 +0000
Message-Id: <20200207015907.242991-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed PHY. This PHY
appears in a number of SoCs on various flavors of 20nm and 28nm nodes.

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
 .../devicetree/bindings/phy/qcom,usb-ss.yaml  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
new file mode 100644
index 000000000000..377b9e1e39d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
@@ -0,0 +1,83 @@
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
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: rpmcc clock
+      - description: PHY AHB clock
+      - description: SuperSpeed pipe clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: ahb
+      - const: pipe
+
+  vdd-supply:
+    description: phandle to the regulator VDD supply node.
+
+  vdda1p8-supply:
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
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - vdd-supply
+  - vdda1p8-supply
+
+additionalProperties: false
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
+        clock-names = "ref", "ahb", "pipe";
+        resets = <&gcc GCC_USB3_PHY_BCR>,
+                 <&gcc GCC_USB3PHY_PHY_BCR>;
+        reset-names = "com", "phy";
+        vdd-supply = <&vreg_l3_1p05>;
+        vdda1p8-supply = <&vreg_l5_1p8>;
+    };
+...
-- 
2.25.0

