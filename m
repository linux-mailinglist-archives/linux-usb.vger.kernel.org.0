Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62AE343E259
	for <lists+linux-usb@lfdr.de>; Thu, 28 Oct 2021 15:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhJ1Nen (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Oct 2021 09:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhJ1Nen (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Oct 2021 09:34:43 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71A3C061570
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 06:32:15 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id a20-20020a1c7f14000000b003231d13ee3cso9393881wmd.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PZk6JFL+PMEwlKXRxZklRKHFN+eWFOBgIo8Rr0VffV0=;
        b=m+u84/yHscc2C+9S4PVKjSjuaX6el7lZFjO1LRLLGnNJwITNkj6KT+BPMjuUwILihN
         urbm/CzvfidQP0VGY3SDTGkLQz20dr1yQXmK179gZg3FYBHDV44SkK92xrdNJZFgl3kt
         k745u2MxFj+w4VwD9mrttvh70GfsDIzfeLwPa8ONkfIkpU/zeK0wnXM1EZs9eTWLazqX
         /NP3bYtvZQGbuqLDNrNiKV8fBh4JHeZtOLmESHW4lo9SwC0SYXMwXDLD6JBwrMukcfei
         QllhnY+M9KDjdVJn8dxz4MCgxdL16qnAzaRF8C+lf5OGMGz5CJsyuc/y7N1q18ZfQdu/
         3cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PZk6JFL+PMEwlKXRxZklRKHFN+eWFOBgIo8Rr0VffV0=;
        b=xToD9TK99cP+9ypQ09lV/UckfdyP2pi4sV+lQ98LN2QT9mTHSVKivmNV3ll3SAt6p5
         l7YLNCCvb0dLNALucZeFF6InzKuF4vtY383So8Eu3XsKlzj5IdnJEdDIhOc7oGLyC6Ep
         wSo+RfjzBzAC+Gnl0Nm/YTdtWzEsycNjXTifKKNmbinRVMp5Y/yYbkUhx2TbXn3ZFMcO
         nNQGgXcOnt8tYhBtrUP5wm09snqTyNaibkp3YNHgpKhnmYhjQYhRTC1XfD2FB8qgUJCn
         TnYNbID/a/2lq1Z2KyDxpcqGIP9I7He6S+Tx7uMoXvaqx44Nnm0qrNVMIpgvT5DrOXzU
         JJMg==
X-Gm-Message-State: AOAM5318+k5yzE5LbW08YDbAiygVEMOo8OagXQeBxOC/Or5mpCwaNq0X
        OdvOUWtGOwuKolsxtAszUJPDqg==
X-Google-Smtp-Source: ABdhPJySEojlpHasTikaWfxXQoez3qJG8EWRvik7F1wcMobpgMKZiwnmRw/hroxBQ9PWNavFtSW4Mw==
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr12627909wmb.89.1635427934330;
        Thu, 28 Oct 2021 06:32:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y23sm2774845wmi.43.2021.10.28.06.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:32:13 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
Date:   Thu, 28 Oct 2021 14:34:02 +0100
Message-Id: <20211028133404.826012-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
References: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a YAML description for the pm8150b-tcpm driver. The pm8150b-tcpm
encapsulates a type-c block and a pdphy block into one block presented to
the tcpm Linux API.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-tcpm.yaml          | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
new file mode 100644
index 0000000000000..6dd51a1dd944f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/qcom,pmic-tcpm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm PMIC TCPM Driver
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm PMIC Type-C Port Manager Driver
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8150b-tcpm
+
+  ports:
+    description: Remote endpoint connections
+    $ref: /connector/usb-connector.yaml#/properties/ports
+
+    properties:
+      port@0:
+        description: Remote endpoints for the type-c device
+
+      port@1:
+        description: Remote endpoints for the pdphy device
+
+      port@2:
+         description: Connection to role switch node
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/pd.h>
+    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h>
+    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h>
+
+    pm8150b_tcpm: pmic-tcpm {
+        compatible = "qcom,pmic-tcpm";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        status = "disabled";
+        ports {
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                pmic_tcpm_typec: endpoint {
+                    remote-endpoint = <&pmic_typec>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                pmic_tcpm_pdphy: endpoint {
+                    remote-endpoint = <&pmic_pdphy>;
+                };
+            };
+            port@2 {
+                ret = <2>;
+                usb3_role: endpoint@0 {
+                    remote-endpoint = <&dwc3_drd_switch>;
+                };
+            };
+        };
+
+        connector {
+            compatible = "usb-c-connector";
+
+            power-role = "source";
+            data-role = "dual";
+            self-powered;
+
+            source-pdos = <PDO_FIXED(5000, 3000,
+                           PDO_FIXED_DUAL_ROLE |
+                           PDO_FIXED_USB_COMM |
+                           PDO_FIXED_DATA_SWAP)>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    pmic_tcpm_ss_mux: endpoint@0 {
+                        remote-endpoint = <&qmp_ss_mux>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.33.0

