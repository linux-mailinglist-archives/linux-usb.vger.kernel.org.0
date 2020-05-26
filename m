Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2DC81BF63D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 13:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgD3LNZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 07:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726859AbgD3LNY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 07:13:24 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169C2C035494;
        Thu, 30 Apr 2020 04:13:24 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z6so1430435wml.2;
        Thu, 30 Apr 2020 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RS2ptxmKb3ffwIAhZDMnM3dCIs8tmDEdZCAAPTqFzQ8=;
        b=AgzgbEMK6+aKNgiOZiysWCU6EqSN2elrC1IeYQXw0odG0nE4azgH8H0VACwvDnmHBa
         lcpl6wPLJhxj53n6WvjjPLCiwhMTIrLaYUSp5mSlF6k/lPDqezdVF+iD8hNXIamf6K5x
         SQZbj2Y5TW/MKPBj0UayPQhUxal95AQoy3aRdM9T0vSxvH9IMOJCXq0IKXYEQViijCJu
         0V3gXuVmEwD4LXDO9i/lCFhNeHtAVMKb3Lie/lzLNWPA2ssso/aoRySFQPURJC4akC1/
         yXRezRLxN28Omi+d5Zs/diohxEgrUEJ7r1liFIE5YMwkkPQUNel/yw9QxAjlp4qPxPkl
         OpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RS2ptxmKb3ffwIAhZDMnM3dCIs8tmDEdZCAAPTqFzQ8=;
        b=PDONxUdhkKhVU/CfIAOH7etlz2a3ho4Wfrrsgf/ee2s3jLt+MntqRQc0ByNkfJmrfg
         cpz+6F8mKE7oCH3XgztNLS4SXO9EAPFxQFOGFS8xzLcvK4zLZJ7br1aEqSIcJKjMdfWB
         qcM/Vp8Pe8cKANSO/4R8YGwqFD7+lh9wCLiMoFQ0RWVa44/DgqPi6gzHNruk8bow8zZo
         vimQzSRomnq1I5qMX30Y4ap8RBRYl8KMtqfcVoK+a7f10c+9gPwjx8+F040KELP8DxS8
         BxuJrhk/q6qnxpC5TlOMHITS0DWoXX0h6afy/TEweKBizxtHQOl2RstOiG1hPL392P95
         7eog==
X-Gm-Message-State: AGi0PuY47oiRhjoyu0t/PsVNTlSEjgNCJ7C4OwseOJEk3RCo3h6tnzNx
        Fq+8KCpu2GUj/zcAWPsydUGlWmEzCpA=
X-Google-Smtp-Source: APiQypKXabAjkpVY+Mjud3bW9BWxhyAI6286nwgKoPv2myht9oSa4TPcgv1aMjvPJTMOBoAaLqI+kQ==
X-Received: by 2002:a1c:ba56:: with SMTP id k83mr2380898wmf.1.1588245199485;
        Thu, 30 Apr 2020 04:13:19 -0700 (PDT)
Received: from stbsrv-and-01.and.broadcom.net ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id 74sm3727077wrk.30.2020.04.30.04.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 04:13:19 -0700 (PDT)
From:   Al Cooper <alcooperx@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Al Cooper <alcooperx@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 1/4] dt-bindings: Add Broadcom STB USB support
Date:   Thu, 30 Apr 2020 07:12:55 -0400
Message-Id: <20200430111258.6091-2-alcooperx@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430111258.6091-1-alcooperx@gmail.com>
References: <20200430111258.6091-1-alcooperx@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add DT bindings for Broadcom STB USB EHCI and XHCI drivers.

NOTE: The OHCI driver is not included because it uses the generic
      platform driver.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/usb/brcm,bcm7445-ehci.yaml       | 59 +++++++++++++++++++
 .../devicetree/bindings/usb/usb-xhci.txt      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml

diff --git a/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml
new file mode 100644
index 000000000000..2a9acf2b5a64
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/brcm,bcm7445-ehci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom STB USB EHCI Controller Device Tree Bindings
+
+allOf:
+  - $ref: "usb-hcd.yaml"
+
+maintainers:
+  - Al Cooper <alcooperx@gmail.com>
+
+properties:
+  compatible:
+    const: brcm,bcm7445-ehci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: Clock specifier for the EHCI clock
+
+  clock-names:
+    const: sw_usb
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usbphy
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - phys
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    usb@f0b00300 {
+        compatible = "brcm,bcm7445-ehci";
+        reg = <0xf0b00300 0xa8>;
+        interrupts = <0x0 0x5a 0x0>;
+        phys = <&usbphy_0 0x0>;
+        phy-names = "usbphy";
+        clocks = <&usb20>;
+        clock-names = "sw_usb";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index dc025f126d71..23e89d798b1b 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -24,6 +24,7 @@ Required properties:
       device
     - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 or RZ/G2 compatible
       device
+    - "brcm,bcm7445-xhci" for Broadcom STB SoCs with XHCI
     - "xhci-platform" (deprecated)
 
     When compatible with the generic version, nodes must list the
-- 
2.17.1

