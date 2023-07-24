Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C1875EBB1
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 08:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjGXGiW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 02:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjGXGiU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 02:38:20 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00641700;
        Sun, 23 Jul 2023 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690180675; x=1721716675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tj9DeThXMzDvfyzY6lifNuiXGvrNPL8ikzmqqCdeyxY=;
  b=D3EwcSAAwpGwJDfmQccOEH2AadU4+w8EHr6jNQLYMW0rCnsa6s5eNIbS
   ukxbPCIgOs5bFTcvin4GgXEKOPf9T3sA4gKrlmowo8Ddbmxk3WEFPd2yT
   +f/Awh7BOu1+PoVWphsjOBLTVhIqqn8qvS3YS9FR4UwBWcnrcdx2YU81g
   AOvyVwTS8+B5dLbbAI8hK+E8jso2kJ6hlbbdLwfEUPOn7d4Xd+NyY4yR4
   QE43S/zVzBmNqpNp0O261M7u3dlR9jqcagBRHmEXur5mIrcL4ABjI2AbS
   2bWTvBowk7Mic5DJlkHbyvE0v480O/ZNG2dbTlAkIBoaSvqMz2QS7vowe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="357363125"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="357363125"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 23:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="849507486"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849507486"
Received: from pgli4316.png.intel.com ([172.30.235.139])
  by orsmga004.jf.intel.com with ESMTP; 23 Jul 2023 23:37:03 -0700
From:   adrian.ho.yin.ng@intel.com
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de
Cc:     adrian.ho.yin.ng@intel.com
Subject: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
Date:   Mon, 24 Jul 2023 14:36:58 +0800
Message-Id: <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>

Existing binding intel,keembay-dwc3.yaml does not have the required
properties for Intel SoCFPGA devices.
Introduce new binding description for Intel SoCFPGA USB controller
which will be used for current and future SoCFPGA devices.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
---
 .../bindings/usb/intel,socfpga-dwc3.yaml      | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
new file mode 100644
index 000000000000..e36b087c2651
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/intel,socfpga-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel SoCFPGA DWC3 USB controller
+
+maintainers:
+  - Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - intel,agilex5-dwc3
+      - const: intel,socfpga-dwc3
+
+  reg:
+    description: Offset and length of DWC3 controller register
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Controller Master/Core clock
+      - description: Controller Suspend clock
+
+  ranges: true
+
+  resets:
+    description: A list of phandles for resets listed in reset-names
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: dwc3
+      - const: dwc3-ecc
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+# Required child node:
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    $ref: snps,dwc3.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/altr,rst-mgr.h>
+
+    usb@11000000 {
+          compatible = "intel,agilex5-dwc3", "intel,socfpga-dwc3";
+          reg = <0x11000000 0x100000>;
+          ranges;
+          clocks = <&clkmgr 54>,
+                   <&clkmgr 55>;
+          resets = <&rst USB0_RESET>, <&rst USB1_RESET>;
+          reset-names = "dwc3", "dwc3-ecc";
+          #address-cells = <1>;
+          #size-cells = <1>;
+
+          usb@11000000 {
+                compatible = "snps,dwc3";
+                reg = <0x11000000 0x100000>;
+                interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+                dr_mode = "host";
+          };
+    };
+
-- 
2.26.2

