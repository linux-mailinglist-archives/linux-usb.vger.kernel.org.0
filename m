Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7164142FFA
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 17:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729855AbgATQcd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 11:32:33 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33296 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729246AbgATQay (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 11:30:54 -0500
Received: by mail-wr1-f65.google.com with SMTP id b6so139489wrq.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2020 08:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b8/dS5tP31Iur5npp0surpmGJGT8VB8RlaqrYOLfhfM=;
        b=nE0CkDt5zupX8KbivDDY1kkbB3MrKNPCU8eYnB5s/nDahiRRMpnwjZGew0JxqmX5e/
         9MD9mjPIHBqCJNFnCg5/psqyFL+FtFwZeU/+jhc/UmVLys+AHtr6k5YH0IzANW0l3gQY
         GmeqXK5AxAJcFpHjXmqX2E8Vzv3MF6Ntp17EwklI6tT82b+uL3WXT5Vyz8rrHUWtiYvn
         BNHBlRDh0XGiOXfrLE4cz5pODQQbdE0lFbVRYVbGl+m0FmxMforO7ISEdQ8/zRoI/oZE
         bKBYGlFGZZuNxevgPr7ePwYvjXWgoqWen4JJwybCrnhti1j74MItL36tBiSzG7VSSYbQ
         XX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8/dS5tP31Iur5npp0surpmGJGT8VB8RlaqrYOLfhfM=;
        b=dxMig5kEIm/negQtG88Y5ZRCqBcSsfKdTmYwiGb3FJ3TITSzuYmA+vz3TixOknLKCv
         pjwkDiBJV1BHGTU24Naa7IFpnJQbeKx9AKatTpsQRmBmc9l0hLCGivIRBpWmlBMBZ6VH
         obtw0I1cT74bdePbAjmmLvcLDnTYC2b8tSS5wIbIppLeEZWMZs+X7MsKyBAblQBztcBF
         OnhI6nS8Xlz6dejkGx/dY5rqOaasm2Omne/8wDSij4tMvmeNKl5OHAj6Z/W2L4gaBjlr
         ruE5bzUGFkcEgoHui/0z6b+wUiI27o/z/h3cp3q5+Rd2ZVIypJtsInBP6aEYAbF90b3k
         D+uw==
X-Gm-Message-State: APjAAAVT3CRj8talylkaa7w1/W6GODtuE/ilkiAog9lxez3Tr927q4+r
        dh11dfsjIJRvsXDrnmITK3ypfw==
X-Google-Smtp-Source: APXvYqxttFdHokVsGizWadBv+/FjKvEaHQWtjXAIUVLiqaOv4alQBqNckpCOVavSsJDlvwhfHfVWJA==
X-Received: by 2002:a5d:6346:: with SMTP id b6mr331109wrw.354.1579537852256;
        Mon, 20 Jan 2020 08:30:52 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:30:51 -0800 (PST)
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
Subject: [PATCH v2 04/19] dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
Date:   Mon, 20 Jan 2020 16:31:01 +0000
Message-Id: <20200120163116.1197682-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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
 .../devicetree/bindings/phy/qcom,usb-ss.yaml  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml
new file mode 100644
index 000000000000..4206b8f36bdd
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
+      - const: sleep
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

