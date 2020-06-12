Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277F41F7255
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jun 2020 05:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgFLDB0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jun 2020 23:01:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:2926 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgFLDBZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jun 2020 23:01:25 -0400
IronPort-SDR: 2/cEFwZ2VqoXrvPPPsl0dGhfx/jEIR36wgkDy144Xy3nx52y3QByFE/F7lmshNxmssREYsI4Zg
 GPzEqLhR7Xhw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 20:01:25 -0700
IronPort-SDR: zo88p/9E76JfpFoxXJB/+Wa/AYaDMmxlyL/Qb5PoBDF65/GT7aYrE3bSnCS8EmkvMqlKqux2Ii
 cx3rPgPSBOcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; 
   d="scan'208";a="275544795"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga006.jf.intel.com with ESMTP; 11 Jun 2020 20:01:22 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     linux-kernel@vger.kernel.org, balbi@kernel.org, robh@kernel.org,
        p.zabel@pengutronix.de
Cc:     gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, yin1.li@intel.com,
        andriy.shevchenko@intel.com,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v3 1/2] dt-bindings: usb: Add USB PHY support for Intel LGM SoC
Date:   Fri, 12 Jun 2020 10:59:40 +0800
Message-Id: <20200612025941.5484-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200612025941.5484-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200612025941.5484-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add the dt-schema to support USB PHY on Intel LGM SoC

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 .../devicetree/bindings/usb/intel,lgm-usb-phy.yaml | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/intel,lgm-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/usb/intel,lgm-usb-phy.yaml b/Documentation/devicetree/bindings/usb/intel,lgm-usb-phy.yaml
new file mode 100644
index 000000000000..0fc76cd23774
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/intel,lgm-usb-phy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/intel,lgm-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel LGM USB PHY Device Tree Bindings
+
+maintainers:
+  - Vadivel Murugan Ramuthevar <vadivel.muruganx.ramuthevar@linux.intel.com>
+
+properties:
+  compatible:
+    const: intel,lgm-usb-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: USB PHY and Host controller reset
+      - description: APB BUS reset
+      - description: General Hardware reset
+
+  reset-names:
+    items:
+      - const: phy
+      - const: apb
+      - const: phy31
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_phy: usb_phy@e7e00000 {
+        compatible = "intel,lgm-usb-phy";
+        reg = <0xe7e00000 0x10000>;
+        clocks = <&cgu0 153>;
+        resets = <&rcu 0x70 0x24>,
+                 <&rcu 0x70 0x26>,
+                 <&rcu 0x70 0x28>;
+        reset-names = "phy", "apb", "phy31";
+    };
-- 
2.11.0

