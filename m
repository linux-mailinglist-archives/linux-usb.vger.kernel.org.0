Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D12A177D26
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 18:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgCCRNM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 12:13:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47012 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730027AbgCCRL5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 12:11:57 -0500
Received: by mail-wr1-f65.google.com with SMTP id j7so5265491wrp.13
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2020 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x14DHuiChMvzSWsadrwnTIhfZ4wDDTTqWq8bf9unaaI=;
        b=Du9Qu22ztUZjSTVSiL24pPM+euHVU9XNSZ1i3LWBzI0AUSm/Ao+kgcYmbbdt5pvhsP
         6QC93teKVb/8161KXakzCUEOaIX2xn1MQivBG2gac2uWTIrf+taYOXXZ8FbSeLhFrMSH
         kMhpq4LM6M7QAG94hMiPypRM4D6JhfBSqJuP4BkKtGbuS18lYjuGbkB8lfsutFxN2oXm
         XR6AyM3z3migAlB1dadLIRI4pUI0qYk605ohUdyjVf+ZAHVmMnNksAXC1p+7ULdaPMQn
         wEh8nekBmI2nUIYS3KdAsKxyU+eT5VZuw5ZrYi7t0LUZMNcFKwtuewH2kmOpPdKlsUGF
         Fhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x14DHuiChMvzSWsadrwnTIhfZ4wDDTTqWq8bf9unaaI=;
        b=uMmWN42Olo82HM85lLJ/Wk9RncP3CTzihY3jMGOzz5cGhTcQgnz5SI2BArc6wIea+2
         kMNyaO8bu7AgeQOpDbf1LoJdB1qBy/SDRBnvYCYdH0BhKPwhLzhK6EpnVA+9ufiQew5B
         6vPC904JcGyfYvhJJYdF8lhWbo9SdF4fEBliXa58QYg3GTTu5OR7BSMHdxASWECfhDnO
         csirhNcmt8u/ADXJG+f38jvBzZslacLTzcgFBiEFAlWSnxZQV4rTCxmDaTzHcuYFK3h3
         rC1yYJ681VAy5L6SUrS/10/o4wnG8LsQhHED6L+Pi9mr8cfTOpI59Ilksk26MicjxNP8
         kalg==
X-Gm-Message-State: ANhLgQ1EWldRyaaxkXygSqHuHrnBT3JnM/43OQOq+6+Hiv2WeLVxUM/R
        d5X3FpzGNuQLFvyVy9JZJfl5Gw==
X-Google-Smtp-Source: ADFU+vvAPi7jejs+NNjZQAyc2iu811clxwle31yQJY1UjLIPta/ye65qm3YuHtGd6NdgYrCY6eJuEQ==
X-Received: by 2002:adf:9cca:: with SMTP id h10mr6767695wre.390.1583255516296;
        Tue, 03 Mar 2020 09:11:56 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:11:55 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 04/18] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date:   Tue,  3 Mar 2020 17:11:45 +0000
Message-Id: <20200303171159.246992-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Binding description for Qualcomm's Synopsys 1.0.0 SuperSpeed PHY. This PHY
appears in a number of SoCs on various flavors of 20nm and 28nm nodes.

This commit adds information related to the 28nm node only.

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
index 000000000000..bd1388d62ce0
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
+      - qcom,usb-ss-28nm-phy
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
+        compatible = "qcom,usb-ss-28nm-phy";
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
2.25.1

