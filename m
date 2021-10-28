Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4529B43E68C
	for <lists+linux-usb@lfdr.de>; Thu, 28 Oct 2021 18:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhJ1QuR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Oct 2021 12:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhJ1QuQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Oct 2021 12:50:16 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62590C061570
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 09:47:49 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id y84-20020a1c7d57000000b00330cb84834fso760376wmc.2
        for <linux-usb@vger.kernel.org>; Thu, 28 Oct 2021 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PZk6JFL+PMEwlKXRxZklRKHFN+eWFOBgIo8Rr0VffV0=;
        b=DUwxeibwYyQa9WmZtgXkmGdqasxfixfDBdceDdiqzpzZxE3FXo9xLcYxgEs+u+pG5a
         3cz1O6bkPOyFg1iq89+kkEkEroM3NpOg/Bw7jZAlgAyHDN/l+2hUmsxX6/ZLR7J+1T65
         q1wLS7ME4pTpuZQX3BtaXoEx5nnJQfUk5I/9r7dxX+5wpHH85bU/ygT5YUt3HP+4qrDt
         O9IfzVt10Qiat0PlAeLDP944N8a4z8+wCQLZiOlPsTX/oPJuRycyfFxR8jI/oO0GsODc
         FQP/9NbKZoZnyAxkx3y4XwZFn1na9b3hmeKozJAVeBAhRERK2ul+fD4FgwfmfEmZbGms
         2hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PZk6JFL+PMEwlKXRxZklRKHFN+eWFOBgIo8Rr0VffV0=;
        b=o/6IQ1INEvRywW01yrvQCA/K0cszw+3sIaWKhbXBltv8UxNpsKgBVirK+zdVdhc0qJ
         mnCVWwcYr59KYeLIGVwSfRQTz+s06xervNl8c9KUPgWBrGiEa4T0lon1dAhujHdkJtKp
         Jt0bnr/mw2qVQfAYJf0clM1qihN14twiOTv2t25Ql91PZlgcdPRE60UNyu5Zy/sYn8Is
         wrsjSbc1Vj48aZK0wywC2yVKHSDtnICJwIBxOZKnAGKhuMJSh2ApwaZazMI0MFFVa8xz
         OgtAw4rc4PeCkhJYUYe9Ma76tll7D1i8AMajNXDiSBlVsybswRf1LJrKGAPclqU9laq2
         GZhA==
X-Gm-Message-State: AOAM530ZNhJehMekXOxDJ2pxlDVGZrH8EqtIEBqEDvqkBVwPlX03Cr2S
        Ukt0M/ots1uk9Rl3MXjZl2ibtA==
X-Google-Smtp-Source: ABdhPJzdYiZE7f+CWc1YeTE2iPYd2yEHoxgSMPv+l63dC9FyqMa3rgXQ2EOZOqGozinkldaXlgtXxg==
X-Received: by 2002:a1c:8096:: with SMTP id b144mr8515958wmd.20.1635439668021;
        Thu, 28 Oct 2021 09:47:48 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y8sm3601724wrq.77.2021.10.28.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:47:47 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML schema
Date:   Thu, 28 Oct 2021 17:49:39 +0100
Message-Id: <20211028164941.831918-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
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

