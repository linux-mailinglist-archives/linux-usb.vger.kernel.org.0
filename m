Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69B4811C27E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 02:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbfLLBmr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 20:42:47 -0500
Received: from mail-pj1-f52.google.com ([209.85.216.52]:34724 "EHLO
        mail-pj1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbfLLBmp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 20:42:45 -0500
Received: by mail-pj1-f52.google.com with SMTP id j11so328606pjs.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 17:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d5IhBp23ryMELmIbYMLe3sqyK/4LNM7fr/2bl3WTuCg=;
        b=raMTtuMOBRn5KhhTiB2f+cKZAxr9j94dux8XwBg+AdQkCEszcB2OukPcmMasMfVQ06
         obOieKjaUu1K6HpjLXsqBa8lKtiiUbw9JKGzh1vTkCJR9L4im0LQY6BuNMr5ET9fqipd
         NbyMlxiNyOUaan4utvYpFBN4yr7w+UxPKgbkXFLyK6HxJnuutbTleFouaTh9nevPuXUQ
         nbIlbU5Wc6+YzMdLxUN01dtD7Z6Zs0TwmqTLfw+zQx8+mWebDDRTS93U/2fmuBPbC0Gy
         A9F5wrvWUQDpg+Ixnzo0cMRkcfHHIALCeLm/WJUdzdL0BkxyF7vkJgeRMyh+5iuytXHU
         09Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d5IhBp23ryMELmIbYMLe3sqyK/4LNM7fr/2bl3WTuCg=;
        b=bYhWgbWA4Sy4WhqnNRMXvoojAZnM87eOdJod/bGPirv4vR8km7ayRRR1o9m0i/eGTu
         XjzIRzkxCH5wFQkl8f6x/sk50sVh0SfwseRNK3YpIxeve89DT/l1IJP1AHPsLN/HCmT3
         8oHOV2uJpoteO4AdXnKKyG5CVtN9jAbVuta2GIVlf0uKHrKrOSmhRA1qByp7gNaT+BOo
         Udm8fqsTd+00v10F7Ig76SajUcoADm1pcgAqMl6TkVmecJKoYhM7u1SImASfIYNdwxqs
         lifznaDTyaaMGgkn8Tg0YkSP9+UNHGlbOWatbCn2Yg4Y8atgaIz1hG1Wrn2B6KT5WtN3
         Vhvg==
X-Gm-Message-State: APjAAAVIMJ+M+vmSq0Oo050XGj8PkVXQgnIQe40zMvtqTejX3lWJSH/r
        lVxiIIEXohdLhqLdgzZZG9qwSw==
X-Google-Smtp-Source: APXvYqx4StIFuAQtmNTyT3ogARV1ggychWzi6oW+9zl7DfM3kHg2TvXG6rV3Qqhf7Sfk/eBtLVc2yw==
X-Received: by 2002:a17:902:d883:: with SMTP id b3mr6353801plz.231.1576114963862;
        Wed, 11 Dec 2019 17:42:43 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id p16sm4217996pgi.50.2019.12.11.17.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 17:42:43 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [PATCH v7 7/8] dt-bindings: misc: Add bindings for HiSilicon usb hub and data role switch functionality on HiKey960
Date:   Thu, 12 Dec 2019 01:42:32 +0000
Message-Id: <20191212014233.32799-8-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212014233.32799-1-john.stultz@linaro.org>
References: <20191212014233.32799-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

This patch adds binding documentation to support usb hub and usb
data role switch of Hisilicon HiKey960 Board.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Reworked as usb-role-switch intermediary

v7: Switched over to YAML dt binding description
---
 .../bindings/misc/hisilicon-hikey-usb.yaml    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml

diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
new file mode 100644
index 000000000000..1fc3b198ef73
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Linaro Ltd.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/misc/hisilicon-hikey-usb.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: HiKey960 onboard USB GPIO Hub
+
+maintainers:
+  - John Stultz <john.stultz@linaro.org>
+
+description: |
+  Supports the onboard HiKey960 USB GPIO hub, which acts as a
+  role-switch intermediary to detect the state of the USB-C
+  port, to switch the hub into dual-role USB-C or host mode,
+  which enables the onboard USB-A host ports.
+
+  Schematics about the hub can be found here:
+    https://github.com/96boards/documentation/raw/master/consumer/hikey/hikey960/hardware-docs/HiKey960_Schematics.pdf
+
+properties:
+  compatible:
+    items:
+      - const: hisilicon,gpio_hubv1
+
+  typec-vbus-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the typec-vbus gpio
+
+  otg-switch-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the otg-switch gpio
+
+  hub-vdd33-en-gpios:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the hub 3.3v power enablement gpio
+
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Support role switch.
+
+  port:
+    description: |
+      any connector to the data bus of this controller should be modelled
+      using the OF graph bindings specified, if the "usb-role-switch"
+      property is used. Note for this driver, two ports are supported,
+      the first being the endpoint that will be notified by this driver,
+      and the second being the endpoint that notifies this driver of a
+      role switch.
+
+
+required:
+  - compatible
+  - typec-vbus-gpios
+  - otg-switch-gpios
+  - hub-vdd33-en-gpios
+  - usb-role-switch
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    hisi_hikey_usb: hisi_hikey_usb {
+        compatible = "hisilicon,gpio_hubv1";
+        typec-vbus-gpios = <&gpio25 2 GPIO_ACTIVE_HIGH>;
+        otg-switch-gpios = <&gpio25 6 GPIO_ACTIVE_HIGH>;
+        hub-vdd33-en-gpios = <&gpio5 6 GPIO_ACTIVE_HIGH>;
+        usb-role-switch;
+
+        port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            hikey_usb_ep0: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&dwc3_role_switch>;
+            };
+            hikey_usb_ep1: endpoint@1 {
+                reg = <1>;
+                remote-endpoint = <&rt1711h_ep>;
+            };
+        };
+    };
-- 
2.17.1

