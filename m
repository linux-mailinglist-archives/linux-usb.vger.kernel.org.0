Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C8426D8E6
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgIQKYP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgIQKTi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 06:19:38 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6E4C06178C
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 03:19:07 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id x191so1197800qkb.3
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=RX+6Qhr618+Jmg2ZrMqvcKnkrQM1L81+sxgM+9sQd8s=;
        b=mCzsehzbgob0T9s2K5+oEPxrF0SCZUTUzob4D9z9vOCUlBa8Zu4RaUQXWqPpt6TLEI
         IS4ciTbnS33Vha/W9PVDqOTLNCeyj4ux6G8h/JlO9prRAxR2H6l4xoDSVSjtxhcscMdp
         7kGEw+l4mBSlnXbHfvlmISaB+HnM2o8tFsNAKWCXnjgiJl2bNRNe0D4BbMWHZsEPbik9
         XCX4UcOIJuUgm2nxAB//89RCneQUopohLw04rO4b46QeYlKIE9CRo/7ryjPIcaH0FI/r
         aEcuRRG8v5CC+knFUmZk807LjRVVmLbNddT1h27MpSgEYRMSa6kDwjV649JeSmoOYlp6
         79og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RX+6Qhr618+Jmg2ZrMqvcKnkrQM1L81+sxgM+9sQd8s=;
        b=XPnUkGofZ/UKTo8kP74kGra045xAhyOGqiqPXyHieYMCHrpDYaRTvfCYQW6jl5Pe5d
         3ZN7kK2xJaDkANBJuGLDyh838E4hNBuFadtrEWOxgms1FTfujYVNU45z5KyDF0OQjJ3X
         LJguijyXvbDVNHG30nnCe6Lp6peYUJnuz8xPolXA9Tt6+R6gCQ1HngqiFzMqQAYR7lFw
         LGZNr56y7v+zbzWUg2X9Y2TpJG6iOYUQrLnlD31nMrG6nYpb/5Xfd89Ez6Etbp8sWWuY
         aDJ2zhY3AS1atcfbt/fxTzL/XknBjKQc1Xjvgq6z45+Vrg0bggpSUDKt51KO0DlLjAa7
         xtuw==
X-Gm-Message-State: AOAM533qPvCj1TdDFNV6BCnz57JvQweI1coPBFFg4mssOewk+LHNHp9G
        RsRGXgzgx2QfLgSkhhWaBhg3OyT2/XM=
X-Google-Smtp-Source: ABdhPJwxZ7NvJNv7Zuokgq3yxPc04wFAvBxhQCc5GSzzBIH72QbI7P3xWNXCleHOd6qqRCvRRbhlakFDg58=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a0c:8d84:: with SMTP id t4mr11496884qvb.36.1600337946327;
 Thu, 17 Sep 2020 03:19:06 -0700 (PDT)
Date:   Thu, 17 Sep 2020 03:18:48 -0700
In-Reply-To: <20200917101856.3156869-1-badhri@google.com>
Message-Id: <20200917101856.3156869-3-badhri@google.com>
Mime-Version: 1.0
References: <20200917101856.3156869-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [PATCH v7 03/11] dt-bindings: usb: Maxim type-c controller device
 tree binding document
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
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
---
 .../devicetree/bindings/usb/maxim,tcpci.txt   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,tcpci.txt

diff --git a/Documentation/devicetree/bindings/usb/maxim,tcpci.yaml b/Documentation/devicetree/bindings/usb/maxim,tcpci.yaml
new file mode 100644
index 000000000000..8e646b4483eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/maxim,tcpci.yaml
@@ -0,0 +1,63 @@
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
+  reg:
+    const: 0x25
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
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
+                                       PDO_FIXED(9000, 2000, 0)
+                frs-typec-current = <FRS_5V_1P5A>;
+        };
+    };
+...
-- 
2.28.0.618.gf4bc123cb7-goog

