Return-Path: <linux-usb+bounces-4019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 235C380E6D7
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 09:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DC28B2107A
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 08:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583925677B;
	Tue, 12 Dec 2023 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNj1gmPT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39C8E4
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 00:54:36 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33634d2e059so124031f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 00:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702371275; x=1702976075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwIi4D029egdLiupJw5r3s9j6EAW6mH+ojBzoU8pmYo=;
        b=MNj1gmPToiMgkb5WnMtCuAZCrHfmEnZcoxRywOpyYKRxoUIwKjjfjRA1mDFvI8M3mH
         IMQdd8LLxmqETMSQ0Na+0KMaa8pZggCA4MJzL7Wb7cwG7x45yV7NXIiscEs5+UoYtZmE
         T1tnPxwN7/bQuyhiS9pvQJBY+1Sy7gTMZ4hYAxnLLDcuJHFifbTu6/h2r38XKl1v/E+j
         Hk9LoVZBR6AdiBEKICmXRTRkSJ+OVFjFly0kJPzx+zV9bpirBCCMa6RR4KJtWwLRWnuw
         d25v9oDFIwo5KFCkCqeSENOiqzOh3Evr5JtNTcZPvYu/rRWoH2eUFyXL9mpKHSDi68N3
         bJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702371275; x=1702976075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwIi4D029egdLiupJw5r3s9j6EAW6mH+ojBzoU8pmYo=;
        b=TS9kqbNmd6z6zmRUYkgerO20Zu+9v5cJ68lcXgETx8Hu4cPD0xnAyGFoFMbMm/aMNq
         SMndibiol5WsLcnikqS07M5zZEL5mMBI6e+EN4MXR8V1RALaOR7j3mAznirf8eXUrCqe
         4/FeP+pWPWUJlmu1M4HRXn4qL34vX68VFrEetj4v8wVVMVPIOsG2Lc+RUuQZTPozdg7Q
         61S7bah3v5LPWdM0GuSe5f8PfGwo15dBPsuwCpHkFVcQ4CH9k+23sHzLncKKx90jTGXE
         uFu0yPK8X0R0XL5gxlZMm3hIYqMgb6xiJZMRBHU8suJVzEcirfQVZ1IB4MRgD4BKJjnw
         ALWw==
X-Gm-Message-State: AOJu0YwXhMgMd0oIDuiNcfVuI8hIj3MLCCWi+xetoKnroVFa4VJLbYBm
	1gDBQ7lUGzc31O1NMm8x2Yu03A==
X-Google-Smtp-Source: AGHT+IELErmDK3VCQUDBaIZTUnycgtj4nCzdO2BpmtRJTQmyCLnLlTf+IN7jGqPiFrUWlKti0CBL/g==
X-Received: by 2002:adf:e388:0:b0:333:179:d8d9 with SMTP id e8-20020adfe388000000b003330179d8d9mr2987342wrm.37.1702371275111;
        Tue, 12 Dec 2023 00:54:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d4644000000b003333bd63792sm10312155wrs.117.2023.12.12.00.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:54:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 12 Dec 2023 09:54:28 +0100
Subject: [PATCH v2 1/2] dt-bindings: usb: Document WCD939x USB SubSystem
 Altmode/Analog Audio Switch
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-topic-sm8650-upstream-wcd939x-usbss-v2-1-38961fea5867@linaro.org>
References: <20231212-topic-sm8650-upstream-wcd939x-usbss-v2-0-38961fea5867@linaro.org>
In-Reply-To: <20231212-topic-sm8650-upstream-wcd939x-usbss-v2-0-38961fea5867@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3878;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Db1epLGVNKw5pFK7cDcVlGWgqPBl4u+NnPdzy0TbpeQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleB/HP1dBNGo7lGhNuHxzo7onQ+VBWPgsfr1jAHrA
 rrcKaKOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgfxwAKCRB33NvayMhJ0VrvD/
 97iOfnzSBY6LhWRcdLOVTli4ra4sqCq3W/gnASJ0D7roWCr1tFZmjkxvU4NNlzSc4SenbbZYWuZZFG
 9kChkV82dEDDgeqDbr5AgOewG7390QYZAB2XOITfLL6ueoVZWHBOPGQ7cOHbXf8jPZTl86uPpmPThX
 /9BcE3rg6pZUCdYNiZPAmpMlF5l511zYMl8eNAKHlrm/E8NQjtJoXynVXCAEf4vjNw1E2uc0gAU3r4
 5hmW6MI8/Xcf6E/asE7JLVmJZ+qTfilHXmJT9E8r/EgJv5oxyf0CHY4gBICvZH6Fy+yaIIoI67yPnV
 /2MYquWas5RcnGCb7VizqtqeKoVnv28C3pOkexPgz7AqJBIe0Rgt5VisJLZAtajLe6SxO9j3c7V/fA
 WGDNVlOQcy+YVEbYl/vdhiHnmo9qQ4rAfw/weVg6e0+8r4pTS4sARbgGYxT9FYCylvbLrgnZEo3ZuZ
 xZzs+xXZkMazGQNZzywSpd0e0e1gEpP+x0n+yvNSFgvBdCk2RmdrzrwtnzCkbAx07SBXKXA1szzZvk
 /CkHtLU5eScJaPHcIeT0j3qdMTh7epTNEYKLJdj46E0rmLqqL3/fQYwJcoexUNfouKjpR23ZGu7G6h
 GsKudliwfrvVawjw32lBepk1Mehd969/qTe5oSrv6teuQ5z4JJRSKaFxN2iw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Qualcomm WCD9390/WCD9395 USB SubSystem Altmode/Analog Audio Switch
which is a separate USB SubSystem for Altmode/Analog Audio Switch accessible
over an I2C interface.

Since Audio Headphone and Microphone data path between the Codec and the USB-C Mux
subsystems are external to the IC, it requires a second port to handle USB-C altmode
& orientation switching for Audio Accessory Mode to the Codec SubSystem.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/usb/qcom,wcd939x-usbss.yaml           | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
new file mode 100644
index 000000000000..7ddfd3313a18
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,wcd939x-usbss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9380/WCD9385 USB SubSystem Altmode/Analog Audio Switch
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  Qualcomm WCD9390/WCD9395 is a standalone Hi-Fi audio codec IC with a
+  functionally separate USB SubSystem for Altmode/Analog Audio Switch
+  accessible over an I2C interface.
+  The Audio Headphone and Microphone data path between the Codec and the
+  USB-C Mux subsystems are external to the IC, thus requiring DT port-endpoint
+  graph description to handle USB-C altmode & orientation switching for Audio
+  Accessory Mode.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,wcd9390-usbss
+      - items:
+          - const: qcom,wcd9395-usbss
+          - const: qcom,wcd9390-usbss
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: USBSS VDD power supply
+
+  mode-switch:
+    description: Flag the port as possible handle of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          A port node to link the WCD939x USB SubSystem to a TypeC controller for the
+          purpose of handling altmode muxing and orientation switching.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          A port node to link the WCD939x USB SubSystem to the Codec SubSystem for the
+          purpose of handling USB-C Audio Accessory Mode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec-mux@42 {
+            compatible = "qcom,wcd9390-usbss";
+            reg = <0x42>;
+
+            vdd-supply = <&vreg_bob>;
+
+            mode-switch;
+            orientation-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    wcd9390_usbss_sbu: endpoint {
+                        remote-endpoint = <&typec_sbu>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    wcd9390_usbss_codec: endpoint {
+                        remote-endpoint = <&wcd9390_codec_usbss>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


