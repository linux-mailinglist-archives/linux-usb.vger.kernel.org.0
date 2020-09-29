Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B658027BAE6
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbgI2CkS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbgI2CkR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:17 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9335C0613D0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:16 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id h191so1838439qke.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=XU9TB0MbdK4T6ew5zcZQZKz72WjH0/UJM18rykIp9q8=;
        b=Tr0OaYML2KsyMs1LZzFN4INZrbT/4tHt2zkRu7ceHhGpZ/dbkIiUcZRxc+BV0dvDm5
         QzKtRtYQpXf+INj2DhTiT3/EsM2GLrsi0fgFA7eWrVKuCT12oMkOewBR4ux255dbrjEr
         iHhsUb23eOOG3YHBaJUyZDh+JZbygxXO0jLjYaHlT+I4O6YRC8HiPQQGMAPDyyGkoQqH
         m+JbiVvdN7GEPBFEIV3EGIrDZgD61WfP4D1/wx49iK72Gqtpk/ZJPUyooGQLMpgJM+6S
         Ua00/scfUC566pzMTdzW1Z1Umbjb5shTcVC6Syr2+xTkK+xmc/nWg6aorBZujpVuzjz0
         rLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XU9TB0MbdK4T6ew5zcZQZKz72WjH0/UJM18rykIp9q8=;
        b=TccrNLRg7vYNdHwhA0daAFYGHqv5HCZWYH6L6vA8I++/uNsjUdKsCEcHGQHhdafegM
         cWROMpc9mGyM/aZ/1G/g4iJic0HLI2NkECbFchnYuA5KWDRX8DtJlgUuHqe2TdrILs+q
         IOYaSYspvy3YtaqyVirtCFSPTaHUgL6mKcXkOvVKVdVA9ZIwkSeboDqmvvx0RMuKKKKm
         mqMzRr8SJUVm8SS4QrJqS8LjGZ5c9NKGEdZxp/9HkmFnJhkLRMgnJxTvaq67F/AElGIm
         No5DctHJdmpsdY4EmbKkXTID6jwPtmVS6fduv6DDqq9IpY4eos0gwqWDrqRvTsvP7a+n
         vuEQ==
X-Gm-Message-State: AOAM532mAMvxB613rm04BYgKf3Z4VEaMBcebvaLOO+VHze6e59Haws3a
        dOeVJe25bPnVJ05BWIz7P95iafGMwQs=
X-Google-Smtp-Source: ABdhPJx/2T57zw+2GSfwbdAZJR8LKvesRx+2nEH7J39MB66/ztZJGcHxNmGbxSPcCPr0zSMWx/3HCR8TzXU=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a0c:dd81:: with SMTP id v1mr2473509qvk.62.1601347215994;
 Mon, 28 Sep 2020 19:40:15 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:39:52 -0700
In-Reply-To: <20200929024004.244992-1-badhri@google.com>
Message-Id: <20200929024004.244992-4-badhri@google.com>
Mime-Version: 1.0
References: <20200929024004.244992-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v9 03/15] dt-bindings: usb: Maxim type-c controller device
 tree binding document
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add device tree binding document for Maxim TCPCI based Type-C chip driver

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.

Changes since v6:
- Migrated to yaml format.

Changes since v7:
- Rebase on usb-next

Changes since v8:
- Fix errors from make dt_binding_check as suggested by
  Rob Herring.
---
 .../devicetree/bindings/usb/maxim,tcpci.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,tcpci.yaml

diff --git a/Documentation/devicetree/bindings/usb/maxim,tcpci.yaml b/Documentation/devicetree/bindings/usb/maxim,tcpci.yaml
new file mode 100644
index 000000000000..f4b5f1a09b98
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/maxim,tcpci.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/maxim,tcpci.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Maxim TCPCI Type-C PD controller DT bindings
+
+maintainers:
+  - Badhri Jagan Sridharan <badhri@google.com>
+
+description: Maxim TCPCI Type-C PD controller
+
+properties:
+  compatible:
+    enum:
+      - maxim,tcpci
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: ../connector/usb-connector.yaml#
+    description:
+      Properties for usb c connector.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/pd.h>
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        maxtcpc@25 {
+            compatible = "maxim,tcpc";
+            reg = <0x25>;
+            interrupt-parent = <&gpa8>;
+            interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+            connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+                data-role = "dual";
+                power-role = "dual";
+                try-power-role = "sink";
+                self-powered;
+                op-sink-microwatt = <2600000>;
+                source-pdos = <PDO_FIXED(5000, 900,
+                                         PDO_FIXED_SUSPEND |
+                                         PDO_FIXED_USB_COMM |
+                                         PDO_FIXED_DATA_SWAP |
+                                         PDO_FIXED_DUAL_ROLE)>;
+                sink-pdos = <PDO_FIXED(5000, 3000,
+                                       PDO_FIXED_USB_COMM |
+                                       PDO_FIXED_DATA_SWAP |
+                                       PDO_FIXED_DUAL_ROLE)
+                                       PDO_FIXED(9000, 2000, 0)>;
+            };
+        };
+    };
+...
-- 
2.28.0.709.gb0816b6eb0-goog

