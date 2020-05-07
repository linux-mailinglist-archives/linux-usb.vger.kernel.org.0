Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A1C1C9DC7
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 23:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgEGVrD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 17:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgEGVrC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 17:47:02 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35F8C05BD09
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 14:47:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id m12so3291884wmc.0
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QwFcGxpDmnR9Gjl2d/B8qf+n7pZq43GAcPc3+BCIIos=;
        b=Zqd3M8ujrUsKmU1qmBvjrfndEAJaq7s4r13grgk7WfShoPK03iBafHgZGfH7hkU8Wg
         1DhXx6ibr+A7ogAp23bnHNfkbGJBIhx+sAiIv2x8R5HRWeCeXhP9reG5sxIer5EuzAV5
         tUg2wcmnW6jiUWtMbH9MW/7N7rcHq/wuE4ciujg0LeBRGag+wl0eG4T1AbsZJPbPijLo
         pY2kt3hPpIpFg2z3LhIY0qo7eLNfBmTmLJuwsxE7O9eNaibEEOxWDTBLbDMmyAKnRmWY
         wZ4rTq3uiN3FAKS9M+QYpXiwBXPFG3E3t5UkBRP52jrzK8PJE/iYGg4XM4L8hDGjnaKv
         mnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QwFcGxpDmnR9Gjl2d/B8qf+n7pZq43GAcPc3+BCIIos=;
        b=NZjLej+mVXrFtVzz/rT53gofG9/qZAXgAxt2fvuvHjW8iVTS1aT19GqvR/UJiXzaHp
         TroFOGLEY9U6v/YK4gATBTjqCL7AEzoJS9xgAufKEVdu5QGXCpjGpd1ffeM1sXdaKJJp
         IT76mdTlbf9+qdttVP+h/85IU2CUg3xSDVeitxBPGqWgWcnppIdAEh4isCyttBndizsg
         58hdcP+FJOtqa2a9A8uV3b7kt/3SNWDQ5wpPwwQSICPw10A/9cYFifzcSK+LAIlWjF3f
         i8eLO0tcZh1iY1uxQ6Ynyw7jQI8wPnO80UChcBkU8W53VBvy+IxsX/qc86EI7clG3Y0F
         dvdg==
X-Gm-Message-State: AGi0PuZtfyZ+zStlz8f4f7w6tUGoM4BUQaEx+eU1cY9RSsFF8hUY4c2a
        2kvLjc4gVSI3R6nqg+666fmLZw==
X-Google-Smtp-Source: APiQypIe57ikdXgULkZNSPpYK4kNU1OzkL6pxob1CcDDLeam4Q9pN4bmvma4mjnnMwnIXj7ATrBOjw==
X-Received: by 2002:a1c:4085:: with SMTP id n127mr13358271wma.163.1588888020384;
        Thu, 07 May 2020 14:47:00 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a10sm6653538wrp.0.2020.05.07.14.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 14:46:59 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        nikolaus.voss@loewensteinmedical.de,
        andriy.shevchenko@linux.intel.com, garsilva@embeddedor.com,
        keescook@chromium.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: usb: Add TI tps6598x device tree binding documentation
Date:   Thu,  7 May 2020 22:47:32 +0100
Message-Id: <20200507214733.1982696-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507214733.1982696-1-bryan.odonoghue@linaro.org>
References: <20200507214733.1982696-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add device tree binding documentation for the Texas Instruments tps6598x
Type-C chip driver.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/usb/ti,tps6598x.yaml  | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,tps6598x.yaml

diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
new file mode 100644
index 000000000000..8eaf4b6c4735
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/ti,tps6598x.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments 6598x Type-C Port Switch and Power Delivery controller DT bindings
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Texas Instruments 6598x Type-C Port Switch and Power Delivery controller
+
+properties:
+  compatible:
+    enum:
+      - ti,tps6598x
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: irq
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps6598x: tps6598x@38 {
+            compatible = "ti,tps6598x";
+            reg = <0x38>;
+
+            interrupt-parent = <&msmgpio>;
+            interrupts = <107 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names = "irq";
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&typec_pins>;
+
+            typec_con: connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+                port {
+                    typec_ep: endpoint {
+                        remote-endpoint = <&otg_ep>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.25.1

