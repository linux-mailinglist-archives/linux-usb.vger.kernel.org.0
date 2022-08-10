Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C10058F3AB
	for <lists+linux-usb@lfdr.de>; Wed, 10 Aug 2022 22:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbiHJUpT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Aug 2022 16:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbiHJUpR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Aug 2022 16:45:17 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5B418B1D
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 13:45:15 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id y10-20020a9d634a000000b006167f7ce0c5so11426699otk.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0jz01lGJEb0t3lu10zSjIgJPn+MnHrxkIduNnoao9H4=;
        b=GeyWze8A/Hj6zZTRKWs43aYe2s2c2hOLFuen/89ktPtJe/C0cZIvHbaw8dVdRS21zT
         z+tYFsbYoQKV1lQdgPQQmljNT2/lJcoBBksJ+wGbfMCVOL3YJnLFxjehw7RFSyNQtFZh
         QT5V1hruB1vcoQV796EbHngJ+k4GkMTbamPR2OWGINtEGQPKj1skB1SzGZx2mxXn/jix
         ApRVTeqf9G1o51ZH3sR3cPUToyEiToCUDcO7h5bmMFzPfPVCU8duDCfeJWWi/h4DkBH6
         mXnxA0Q38v2xoW7YpN6It+DoreRLALYLviMbDGzRgNhc6/nwIaSFwjwjH55fnU/6QW45
         tI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0jz01lGJEb0t3lu10zSjIgJPn+MnHrxkIduNnoao9H4=;
        b=yshmddVcC2HL/Yh4bbE6t58nADwTgCEFtFZfjH+BYl08F9rNoKUZDEL7DYsmKbgLag
         Tu9Ge2Z1uYQylEdQZ0l5qGaZ1anLpGikUHg5TElhsVgrae8jGqwEIr7yc5GNYA0G6kUw
         RxrZvsGYUc8IqQ2gfd7Z/ivRX/qcpEAVbY5sMQHXZsZBBYi4NoqorXcba3P7WO9v8vDG
         oj0rkpjyjeODv2EsM6WQifuziFBhJakPEm0y62/OFOJyCZg3Lr+wzOYWZkYPfk1BFKfs
         /ZfRjHoUNacKontp5if/mjdOWnWWUXp97Pd/PPmVVk25bT8vzoYAMCwRcPokwIteUK95
         0QhA==
X-Gm-Message-State: ACgBeo3XmNC9sZwh5dFtNKKF16PMs1ZK3tvpr8FYcAm9GQz2kQkC0rbB
        xG5ImlCPnGlW24x+lYZ9HmMltA==
X-Google-Smtp-Source: AA6agR4FNziH2P6cq4N36i/TFPUjoiNAxeZK4Lo3AxFzZPDeuO3auzQOKNEPXW3fcfLEX6WnV8yqKg==
X-Received: by 2002:a9d:6314:0:b0:614:d56f:c7a with SMTP id q20-20020a9d6314000000b00614d56f0c7amr11273906otk.281.1660164314682;
        Wed, 10 Aug 2022 13:45:14 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f12-20020a056870548c00b000f2455e26acsm3968218oan.48.2022.08.10.13.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 13:45:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: usb: Introduce GPIO-based SBU mux
Date:   Wed, 10 Aug 2022 13:47:49 -0700
Message-Id: <20220810204750.3672362-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810204750.3672362-1-bjorn.andersson@linaro.org>
References: <20220810204750.3672362-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introduce a binding for GPIO-based mux hardware used for connecting,
disconnecting and switching orientation of the SBU lines in USB Type-C
applications.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/usb/gpio-sbu-mux.yaml | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
new file mode 100644
index 000000000000..7d8aca40c7ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: GPIO-based SBU mux
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  In USB Type-C applications the SBU lines needs to be connected, disconnected
+  and swapped depending on the altmode and orientation. This binding describes
+  a family of hardware which perform this based on GPIO controls.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - onnn,fsusb43l10x
+          - pericom,pi3usb102
+      - const: gpio-sbu-mux
+
+  enable-gpios:
+    description: Switch enable GPIO
+
+  select-gpios:
+    description: Orientation select
+
+  vcc-supply:
+    description: power supply
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
+      A port node to link the SBU mux to a TypeC controller for the purpose of
+      handling altmode muxing and orientation switching.
+
+required:
+  - compatible
+  - enable-gpios
+  - select-gpios
+  - mode-switch
+  - orientation-switch
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    sbu-mux {
+      compatible = "pericom,pi3usb102", "gpio-sbu-mux";
+
+      enable-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+      select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
+
+      mode-switch;
+      orientation-switch;
+
+      port {
+        endpoint {
+          remote-endpoint = <&pmic_glink_dp0_sbu>;
+        };
+      };
+    };
+...
-- 
2.35.1

