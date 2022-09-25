Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 790815E9324
	for <lists+linux-usb@lfdr.de>; Sun, 25 Sep 2022 14:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbiIYMhy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Sep 2022 08:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbiIYMhw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Sep 2022 08:37:52 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29FE2EF0F
        for <linux-usb@vger.kernel.org>; Sun, 25 Sep 2022 05:37:50 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so6957069lfb.6
        for <linux-usb@vger.kernel.org>; Sun, 25 Sep 2022 05:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=UJRF0CXygrWoxUVGL/DvpJUno6RbREkoO61yXQO1vz4=;
        b=o5lnuTkpL38PwhVZixzlG4auslr48wrZtVYUKXVLZZvC7qblq4c4erO0o+q8TmrDRn
         /oH//KRN/Hq+9nzM3UYChpFxXvXExms/qW6t50BJQJlXCoEoTGhJm1LBNSTArAFsnuqa
         yWC09lIW8BsIsLwsV7eyYvW09rJFgpSPTUFcwGCiPDQLB0iLYfjUT14NP+yETRjkCUH9
         FyWYAtwh9OiCT/sC2NJlTHAfi3GBl7QHlzTBVMp4tEfCCiG32jSa4cSQO3Oq63gk4eJQ
         o23ap7y/lrFpDcQbLqq4A1oSYE8/+iKeB5RPLk/qmycXjKN5DImrDp3zz3HUAfbqaFfc
         UbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=UJRF0CXygrWoxUVGL/DvpJUno6RbREkoO61yXQO1vz4=;
        b=LhsIw3faNq86h/hMXgZS7hCjSsm830x+xB1aZOQQgXQiqinJdS0nRYCmgDCNRgo45r
         NOlZArj1ilUzvERIWvfjbxbAF9hB+Iy/bLnaBaDHN0JqpYRVNEtW+HWgUpGb1aCY3z39
         qnrvgWRJUo1F2cc9ULaWZxUL+4eRy2xulWGso1MuSkkMT+BFesHpVe3uaKKnQhdyxaIh
         vJO7Ak3qt/j3wSC9QJRuqS7z95hm64arNRogPu/zn/77oDa8sEJnJnob9R2Z+xyebERw
         O+OEJbikrgzBV43YLc9pjFiKG9oHKEIgXRysHtfkX3PHA2oTTpCk+15N8PPLjOGH4eLK
         U5lw==
X-Gm-Message-State: ACrzQf3RrbuMXQwfpW/6U+ey6Q+yvjArnGYaLZW8gBMWMX6mLXktPqxE
        LhrayvnL76GgqgHQF44Can3RAA==
X-Google-Smtp-Source: AMsMyM4gZboutge0FffYxBQgEmndGJF+dMo1dPahGFistabPzUC8I8jYGiG7uKgF4m7m8iOSb1ZnoA==
X-Received: by 2002:a05:6512:3d1a:b0:499:c00f:d95f with SMTP id d26-20020a0565123d1a00b00499c00fd95fmr6957618lfv.575.1664109469191;
        Sun, 25 Sep 2022 05:37:49 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s12-20020ac25c4c000000b00498f23c249dsm2211151lfp.74.2022.09.25.05.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 05:37:48 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: [PATCH] dt-bindings: usb: Convert FOTG210 to dt schema
Date:   Sun, 25 Sep 2022 14:35:46 +0200
Message-Id: <20220925123546.770843-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This converts the Faraday FOTG210 OTG USB controller to use
a YAML schema. We add all the right includes for OTG controllers
and make it possible to specify dr_mode and phy.

Cc: devicetree@vger.kernel.org
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/usb/faraday,fotg210.txt          | 35 ---------
 .../bindings/usb/faraday,fotg210.yaml         | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/faraday,fotg210.txt
 create mode 100644 Documentation/devicetree/bindings/usb/faraday,fotg210.yaml

diff --git a/Documentation/devicetree/bindings/usb/faraday,fotg210.txt b/Documentation/devicetree/bindings/usb/faraday,fotg210.txt
deleted file mode 100644
index 06a2286e2054..000000000000
--- a/Documentation/devicetree/bindings/usb/faraday,fotg210.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Faraday FOTG Host controller
-
-This OTG-capable USB host controller is found in Cortina Systems
-Gemini and other SoC products.
-
-Required properties:
-- compatible: should be one of:
-  "faraday,fotg210"
-  "cortina,gemini-usb", "faraday,fotg210"
-- reg: should contain one register range i.e. start and length
-- interrupts: description of the interrupt line
-
-Optional properties:
-- clocks: should contain the IP block clock
-- clock-names: should be "PCLK" for the IP block clock
-
-Required properties for "cortina,gemini-usb" compatible:
-- syscon: a phandle to the system controller to access PHY registers
-
-Optional properties for "cortina,gemini-usb" compatible:
-- cortina,gemini-mini-b: boolean property that indicates that a Mini-B
-  OTG connector is in use
-- wakeup-source: see power/wakeup-source.txt
-
-Example for Gemini:
-
-usb@68000000 {
-	compatible = "cortina,gemini-usb", "faraday,fotg210";
-	reg = <0x68000000 0x1000>;
-	interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&cc 12>;
-	clock-names = "PCLK";
-	syscon = <&syscon>;
-	wakeup-source;
-};
diff --git a/Documentation/devicetree/bindings/usb/faraday,fotg210.yaml b/Documentation/devicetree/bindings/usb/faraday,fotg210.yaml
new file mode 100644
index 000000000000..c69bbfbcf733
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/faraday,fotg210.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2022 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/faraday,fotg210.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Faraday Technology FOTG210 HS OTG USB 2.0 controller Bindings
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: usb-drd.yaml#
+  - $ref: usb-hcd.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: faraday,fotg210
+      - items:
+          - const: cortina,gemini-usb
+          - const: faraday,fotg210
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: PCLK
+
+  resets:
+    maxItems: 1
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the global Gemini system controller on
+      Gemini systems
+
+  dr_mode: true
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb2-phy
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/cortina,gemini-clock.h>
+    #include <dt-bindings/reset/cortina,gemini-reset.h>
+    usb0: usb@68000000 {
+        compatible = "cortina,gemini-usb", "faraday,fotg210";
+        reg = <0x68000000 0x1000>;
+        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&syscon GEMINI_RESET_USB0>;
+        clocks = <&syscon GEMINI_CLK_GATE_USB0>;
+        clock-names = "PCLK";
+        syscon = <&syscon>;
+        dr_mode = "host";
+    };
-- 
2.37.3

