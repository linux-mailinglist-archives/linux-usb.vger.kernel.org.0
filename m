Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5EE237B1C9
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 00:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhEKWxi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 18:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhEKWxg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 18:53:36 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E23C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 15:52:29 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id c21so16812061pgg.3
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 15:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nPfjNGu0bWmZPxek0tP9ZZksfu5jEL2EIBrcRX1glfg=;
        b=jI7LM9aVM57XPnXPuJRJkxCqBEh6mrB7droxTox8SAa5ztFsAOv+AVq6skwDMupyfP
         otqJAg85fAbfowID2PIA+rZ9cccY1SPm2Ce+nBoiqk4Kje74zAqoLIpCN+u4SXJjxY4/
         kc6sEXFmF8M9/OF7sxXjvUcv00CRNH/qUQ3Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nPfjNGu0bWmZPxek0tP9ZZksfu5jEL2EIBrcRX1glfg=;
        b=PIRcdc9eieP1FlbgwfpZOCZKhDffhJd/xW1X8NO0d5/werQwmBGGyYGHMJnmiCc38X
         pK8AXyf2yexm3s27uQp8USnMpaXsI4EsnaAH/npXKNCgqMgPAeyvVQbcg9M3ZaQPdKO2
         c2tdvZQBKFUKLqH5VvD0VQVmGOhW/SyZ/n8pUSlFlfPozM1bje9WZU2hZaS7f3Y8jpQk
         v03LJqKr8GjGtKd55tNJbpnnxS0ARdF08n8yLk7Dv9hpyownwSEzO2TWM4FP8FqC3oER
         GwSLMXZjszE4yVdNu0yn8H9ZJ+v0AgARY21fBK0gDT0Cp4Y2zMxyEvXZ9bBM6W4t1p+7
         UOsA==
X-Gm-Message-State: AOAM533ce1UZG7VBhf+hKTYr6dXE/Jx9tp5PYVsbCEjytvYlo8xMtMNH
        4ESGdWmQX0DRe5u0UwXpQ8wTFvfq8G1f3g==
X-Google-Smtp-Source: ABdhPJy4yWZ/DcWMdmWwZpF8qxLQuvC1hUn0XzngT8Xx4R8juzOn0k4q8IijTPovE+rhsFXv+j+DFA==
X-Received: by 2002:a05:6a00:1ac6:b029:2ae:bde3:621c with SMTP id f6-20020a056a001ac6b02902aebde3621cmr22097698pfv.80.1620773549330;
        Tue, 11 May 2021 15:52:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:f1d7:673a:456e:c653])
        by smtp.gmail.com with UTF8SMTPSA id c24sm14198088pfi.32.2021.05.11.15.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 15:52:29 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 1/5] dt-bindings: usb: Add binding for Realtek RTS5411 hub controller
Date:   Tue, 11 May 2021 15:52:19 -0700
Message-Id: <20210511155152.v10.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210511225223.550762-1-mka@chromium.org>
References: <20210511225223.550762-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Realtek RTS5411 is a USB 3.0 hub controller with 4 ports.

This initial version of the binding only describes USB related
aspects of the RTS5411, it does not cover the option of
connecting the controller as an i2c slave.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v10:
- none

Changes in v9:
- added Rob's 'Reviewed-by' tag

Changes in v8:
- added entry for 'reg'
- marked 'companion-hub' as required
- changed node name of USB controller to 'usb'

Changes in v7:
- added type ref for 'companion-hub' property

Changes in v6:
- Realtek binding instead of generic onboard_usb_hub
- added 'companion-hub' property
- added reference to 'usb-device.yaml'
- 'fixed' indentation of compatible entries to keep yamllint happy
- added 'additionalProperties' entry
- updated commit message

Changes in v5:
- updated 'title'
- only use standard USB compatible strings
- deleted 'usb_hub' node
- renamed 'usb_controller' node to 'usb-controller'
- removed labels from USB nodes
- added 'vdd-supply' to USB nodes

Changes in v4:
- none

Changes in v3:
- updated commit message
- removed recursive reference to $self
- adjusted 'compatible' definition to support multiple entries
- changed USB controller phandle to be a node

Changes in v2:
- removed 'wakeup-source' and 'power-off-in-suspend' properties
- consistently use spaces for indentation in example

 .../bindings/usb/realtek,rts5411.yaml         | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5411.yaml

diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
new file mode 100644
index 000000000000..04ee255eb4f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/realtek,rts5411.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for the Realtek RTS5411 USB 3.0 hub controller
+
+maintainers:
+  - Matthias Kaehlcke <mka@chromium.org>
+
+allOf:
+  - $ref: usb-device.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - usbbda,5411
+          - usbbda,411
+
+  reg: true
+
+  vdd-supply:
+    description:
+      phandle to the regulator that provides power to the hub.
+
+  companion-hub:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description:
+      phandle to the companion hub on the controller.
+
+required:
+  - companion-hub
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* 2.0 hub on port 1 */
+        hub_2_0: hub@1 {
+            compatible = "usbbda,5411";
+            reg = <1>;
+            vdd-supply = <&pp3300_hub>;
+            companion-hub = <&hub_3_0>;
+        };
+
+        /* 3.0 hub on port 2 */
+        hub_3_0: hub@2 {
+            compatible = "usbbda,411";
+            reg = <2>;
+            vdd-supply = <&pp3300_hub>;
+            companion-hub = <&hub_2_0>;
+        };
+    };
-- 
2.31.1.607.g51e8a6a459-goog

