Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 997A04399AF
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 17:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhJYPJg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 11:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233811AbhJYPJf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 11:09:35 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18D4C061348
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 08:07:12 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5so1326537wmb.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PZk6JFL+PMEwlKXRxZklRKHFN+eWFOBgIo8Rr0VffV0=;
        b=fYsLKKkiuC741W+vVH0UfwDKfBf3VEhXeorb9U6ePGUlzPNyju2MR36F11MwK4CFft
         /TKKQ7Y/pV/qfOAaKqnWa4L7WduqJ5pLDuGuKmIZ10W4JX/aP3Nq7d8V1tBF0rCURnm/
         EJBZV41cA+lggHO0HqIy5hnzXjpfTwmVvVOv4uuv0lwayUf5Takee9eSzJsyxTeDHUAJ
         bSFFmzlMzO8v4TTlxYSGG0sNoMqgUem6BjVXyAzkS2XACWBxC2zaYLzi7FTI/cgyeEPI
         wincsQs4V04vovlZ9xbcVb5WRFetVLDXeatWaLWUAAbWjZKDqFMUslSKl3FeDoOfWn2K
         AV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PZk6JFL+PMEwlKXRxZklRKHFN+eWFOBgIo8Rr0VffV0=;
        b=4/JI1lmfsnDnCDeY28puZK0JnYrNHWugHOcq5riJdEE/fA3lQquCM7qpGGHdO++cv8
         9kzV+JZaUj+Z7LwCJBXuvYVtowwNosxRPANaH9wg6zS9aUp6XMe8KIchKfI7+FJzVMiO
         aWmmFkK8PHXjh/sLjqOWusD2sxE85g8uDfz2fIf7vG+U6P/1mf1XwJZy7DZChorrnQkc
         Xsv3xzYoBeOn1vIE88xwmomOlq+kHHxMmEuXjFrZQZCpwEpsZKMK7faSh+6XDvW6jms+
         6vYUWx+9kff0/N1iSGsYr4nOhR1gIm5ZO8FK6/mucbCFcp8e7e1th1HTXOvtS7s7YLWN
         7TjQ==
X-Gm-Message-State: AOAM5335jHLlvmbQefOS4fVvN8r7CD2spls0x5jnHZeChwf1wrrFjHsB
        wto/JNw1J9ubWJRKqJg4jotVFQ==
X-Google-Smtp-Source: ABdhPJwnN8W1sMzrRsnjq2au3ywYZK3/d2U54wTVkLK2bUT0Ailf7bl1fG9dC8/58/PtBUGys7iKjA==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr49746486wmb.155.1635174431349;
        Mon, 25 Oct 2021 08:07:11 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f20sm19173554wmq.38.2021.10.25.08.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 08:07:10 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH 5/6] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
Date:   Mon, 25 Oct 2021 16:09:05 +0100
Message-Id: <20211025150906.176686-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
References: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
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

