Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C816250C42D
	for <lists+linux-usb@lfdr.de>; Sat, 23 Apr 2022 01:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbiDVW6A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 18:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234238AbiDVW5m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 18:57:42 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36783376692
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 15:21:58 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-e2442907a1so10057417fac.8
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 15:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zbrQJFqn/WJzFyNhh4+ufy40OrWo2hrMWxpSlAkPQWY=;
        b=sRUYTmbk06KsFnSSqgjMEjZLe/nW8hlf6MtX6VtMuQT4zBTl86+ruLHJuAEZv6OBMU
         vkdLDekFqfBxRCgm0nuOub8bHmQvKhek5rp802gDBOYLPdMnFlPJ5zuLJAwGmfjU88qp
         s5W/kH8rNbT7RwW9fTZHNZiYKdA7mLEkQ914U0CFsCBV699zopXiCUM20cNbg4g2q/ju
         kHcPxtahw+cJVwYWcI3VFzXPQ9upUcUhqhvl7OTeZZA8kaSmHFcCFSlZYJ3qajDVDV+K
         07iqwrDFjYwgoYpDUByoBX9a9aiOYadiN7GSfIOw69U8VKSE4Z4qdYO1OY06yD/PFgle
         iMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zbrQJFqn/WJzFyNhh4+ufy40OrWo2hrMWxpSlAkPQWY=;
        b=xVQVjm33vMJvYKI2zgl638lv7ddsdq+zFlfV1s0kwNoYKY4EsdhRGEKY/tw1otPGN4
         UJi9YiLl6EtRi/iGJcIW5tMN34OiHuY/sz23SzK6vQ3Wx43YT1bSuZpvJDepjJoE3ExG
         Z1i+YRqIEY/Jhe6mZDYkBCr+Le6B9xhqbFUV5n+uIPQY+LWWpOTIA6KxG6SpRcoweEUq
         CCtbd0bpJdxG5/BarezusR7KUyJAwtgAJ/Kufdn7rXqeZbMabQmlLilb9oVSdtVRgR9s
         r9ZSgNHu2JutNTpQbE9wwXEpwxvOZaXLRAfIyICmlC95JwFVMEVBXeArJMFwiWyfFxb6
         RsIA==
X-Gm-Message-State: AOAM533fBiWJEzMjlqF9JSGfV4loQzGSiWFXGEKo3viVjwY4CNOKcT8T
        f5y82EYbmlzf6ZOnyKo6MYzsQQ==
X-Google-Smtp-Source: ABdhPJwNrtkIBqCrhCqv28M2QWXDvRl/sQAPj3p6KYeo/awaC3wDWg5F9wMuMSThxywFlqVOUFlklg==
X-Received: by 2002:a05:6870:d0ce:b0:de:79e2:7ec7 with SMTP id k14-20020a056870d0ce00b000de79e27ec7mr2814583oaa.245.1650666117162;
        Fri, 22 Apr 2022 15:21:57 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id js4-20020a056870bac400b000e687cdf5adsm1049224oab.55.2022.04.22.15.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 15:21:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 6/7] dt-bindings: usb: Add binding for fcs,fsa4480
Date:   Fri, 22 Apr 2022 15:23:50 -0700
Message-Id: <20220422222351.1297276-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422222351.1297276-1-bjorn.andersson@linaro.org>
References: <20220422222351.1297276-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Fairchild/ON Semiconductor FSA4480 Analog Audio switch is used in
USB Type-C configurations for muxing analog audio onto the USB
connector, and as such used to control the SBU signals for altmodes such
as DisplayPort.

Add a binding for this hardware block.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- None

 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
new file mode 100644
index 000000000000..9473f26b0621
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: ON Semiconductor Analog Audio Switch
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - fcs,fsa4480
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vcc-supply:
+    description: power supply (2.7V-5.5V)
+
+  mode-switch:
+    description: Flag the port as possible handle of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the FSA4480 to a TypeC controller for the purpose of
+      handling altmode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c13 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fsa4480@42 {
+          compatible = "fcs,fsa4480";
+          reg = <0x42>;
+
+          interrupts-extended = <&tlmm 2 IRQ_TYPE_LEVEL_LOW>;
+
+          vcc-supply = <&vreg_bob>;
+
+          mode-switch;
+          orientation-switch;
+
+          port {
+            fsa4480_ept: endpoint {
+              remote-endpoint = <&typec_controller>;
+            };
+          };
+        };
+    };
+...
-- 
2.35.1

