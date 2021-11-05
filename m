Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A210445EB2
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 04:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhKEDgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Nov 2021 23:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhKEDgm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Nov 2021 23:36:42 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671E8C061205
        for <linux-usb@vger.kernel.org>; Thu,  4 Nov 2021 20:34:03 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id w29so93533wra.12
        for <linux-usb@vger.kernel.org>; Thu, 04 Nov 2021 20:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lhqgd3DToNAI8CEkZ8YF5NvSXYG7OMrxu1WLFPVO2rk=;
        b=mXE8Q0uGgaB/sqQru3B6TsxyXlgdh2VNQ1PDvumPEnEc4akYBreQxr1IRRyyeYYLCj
         PBdB2r5wIqrDJa3NzA3NKOY7c4PPEG8+wu0/xPbXbhm9xrsvo731P6gxHRfLSmnKY/fH
         vh8FVyfmn0RkByZu6z4Cpqa6zO+mbfNF9CbU8PpSJgRad/N7qmk3b1uRAlymgVDfcFDk
         R+FKO1OIeLAxqKeDOP4J2206HFuwsG+9JXCouXWByse93lxXtUbXFevFYaWzwCXCLg16
         iB/eH9lZMMXSdGJBeLxpgDNCCvYCWqDKtvnF+WvsfIckhfZsAUWh+gv8oxjzhg4XSWRu
         5KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lhqgd3DToNAI8CEkZ8YF5NvSXYG7OMrxu1WLFPVO2rk=;
        b=JJ43a4TDpaZtafM9Kcg3ynrhebz2JsPMjwabvO0BsN2jQt7meC7xd53FE+gIA/LfrP
         JhJJOxbmmCC2eNYUsMaktSVWLAT4tsFSG21HY+Q54l8Io0vIPjTnjv/RRmhtFHiZZu7Y
         In4DFpb7EloHX7bLh/RBJ2MeOeqd5NHzoRtG/fFduL6Us/mSiWXZHIHEuyWr1VvGIOjQ
         /LUd98GEzJrYqA9aqpvN/1XELop993fwXXCk3VqnpX3RKMA63UKuR69uiS2HYqMknxQF
         9uzmCTA2ljFqAGUFknkUgFAYNynl6cZ9GjA8FmaGV8/PIx6tK4iMpECg75gX5xx7hoXW
         RxTg==
X-Gm-Message-State: AOAM530whmVvDLaVouGt4gAxpCG+booc0wEc4Vo0k0MXcDGbPj3WAgJH
        n7GSSRSpfQ5MTH1MxdmMO1ydAw==
X-Google-Smtp-Source: ABdhPJySZAj8LTU/Bpy78ibiDmGWtcrKnAuW1kkFvMguIassoLQ8Yw0Z1weO+fQjpprtCfzLalR5fQ==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr13110322wrr.223.1636083242075;
        Thu, 04 Nov 2021 20:34:02 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l15sm2546296wme.47.2021.11.04.20.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:34:01 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/7] dt-bindings: usb: Add Qualcomm PMIC type C controller YAML schema
Date:   Fri,  5 Nov 2021 03:35:53 +0000
Message-Id: <20211105033558.1573552-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a YAML binding for the type-c silicon interface inside Qualcomm's
pm8150b hardware block.

The type-c driver operates with a pdphy driver inside of a high level
single TCPM device.

Based on original work by Wesley.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-typec.yaml         | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
new file mode 100644
index 0000000000000..bbe07269e92b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm PMIC based USB type C Detection Driver
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm PMIC Type C Detect
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8150b-typec
+
+  reg:
+    maxItems: 1
+    description: Type C base address
+
+  interrupts:
+    items:
+      - description: Bitmask of CC attach, VBUS error, tCCDebounce done and more
+      - description: VCONN Powered Detection
+      - description: CC state change
+      - description: VCONN over-current condition
+      - description: VBUS state change
+      - description: Attach Deteach notification
+      - description: Legacy cable detect
+      - description: Try.Src Try.Snk state change
+
+  interrupt-names:
+    items:
+      - const: or-rid-detect-change
+      - const: vpd-detect
+      - const: cc-state-change
+      - const: vconn-oc
+      - const: vbus-change
+      - const: attach-detach
+      - const: legacy-cable-detect
+      - const: try-snk-src-detect
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h>
+    pm8150b {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8150b_typec: typec@1500 {
+            compatible = "qcom,pm8150b-typec";
+            reg = <0x1500>;
+            interrupts = <0x2 0x15 PMIC_TYPEC_OR_RID_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 PMIC_TYPEC_VPD_IRQ
+                          IRQ_TYPE_EDGE_BOTH>,
+                         <0x2 0x15 PMIC_TYPEC_CC_STATE_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 PMIC_TYPEC_VCONN_OC_IRQ
+                          IRQ_TYPE_EDGE_BOTH>,
+                         <0x2 0x15 PMIC_TYPEC_VBUS_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 PMIC_TYPEC_ATTACH_DETACH_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x15 PMIC_TYPEC_LEGACY_CABLE_IRQ
+                          IRQ_TYPE_EDGE_BOTH>,
+                         <0x2 0x15 PMIC_TYPEC_TRY_SNK_SRC_IRQ
+                          IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "or-rid-detect-change",
+                              "vpd-detect",
+                              "cc-state-change",
+                              "vconn-oc",
+                              "vbus-change",
+                              "attach-detach",
+                              "legacy-cable-detect",
+                              "try-snk-src-detect";
+        };
+    };
+...
-- 
2.33.0

