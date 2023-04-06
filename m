Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5FE6D8D06
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 03:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234807AbjDFBwk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 21:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234096AbjDFBw3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 21:52:29 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11379769E;
        Wed,  5 Apr 2023 18:52:28 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9B53424E1B2;
        Thu,  6 Apr 2023 09:52:21 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 09:52:21 +0800
Received: from ubuntu.localdomain (183.27.97.179) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 09:52:20 +0800
From:   Minda Chen <minda.chen@starfivetech.com>
To:     Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Minda Chen" <minda.chen@starfivetech.com>,
        Mason Huo <mason.huo@starfivetech.com>
Subject: [PATCH v4 2/7] dt-bindings: phy: Add StarFive JH7110 PCIe document
Date:   Thu, 6 Apr 2023 09:52:11 +0800
Message-ID: <20230406015216.27034-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230406015216.27034-1-minda.chen@starfivetech.com>
References: <20230406015216.27034-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add StarFive JH7110 SoC PCIe 2.0 PHY dt-binding.
PCIe PHY0 (phy@10210000) can be used as USB 3.0 PHY.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../phy/starfive,jh7110-pcie-phy.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml
new file mode 100644
index 000000000000..1b868f75ddae
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/starfive,jh7110-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive PCIe 2.0 PHY
+
+maintainers:
+  - Minda Chen <minda.chen@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  starfive,sys-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to System Register Controller sys_syscon node.
+        - description: PHY connect offset of SYS_SYSCONSAIF__SYSCFG register for USB PHY.
+    description:
+      The phandle to System Register Controller syscon node and the PHY connect offset
+      of SYS_SYSCONSAIF__SYSCFG register. Connect PHY to USB3 controller.
+
+  starfive,stg-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to System Register Controller stg_syscon node.
+        - description: PHY mode offset of STG_SYSCONSAIF__SYSCFG register.
+        - description: PHY enable for USB offset of STG_SYSCONSAIF__SYSCFG register.
+    description:
+      The phandle to System Register Controller syscon node and the offset
+      of STG_SYSCONSAIF__SYSCFG register for PCIe PHY. Total 2 regsisters offset.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@10210000 {
+      compatible = "starfive,jh7110-pcie-phy";
+      reg = <0x10210000 0x10000>;
+      #phy-cells = <0>;
+      starfive,sys-syscon = <&sys_syscon 0x18>;
+      starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
+    };
-- 
2.17.1

