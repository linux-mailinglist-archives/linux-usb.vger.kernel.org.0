Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30AC75BD45
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jul 2023 06:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjGUEak (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jul 2023 00:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjGUEai (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jul 2023 00:30:38 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE3C268E;
        Thu, 20 Jul 2023 21:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689913837; x=1721449837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SMSltlRJcUIjE5hv1ouZljf9MkOyep77G+cMeXAgD3Y=;
  b=lwA4tJyghMlT/qzK+A8s8rYb0sDX7xI26ownYI4aiU7ANTXuO41XALWp
   OM/shY4NcWh+TYXBCmnsmbPmRzyqihLq7h5pR00cdRrq6tuGmWX5Rq2Tn
   iKXYFr9MCfxbbNMqBCRs4WRJfagLoEmP49vpP2k8Jy/dOcjM6AT93WyIr
   5zuonkAHCRzoFdfTa15LuAzBXEsk7Kd+WnDsPuvoudlC6/DuRYXKrl7hl
   tleVHvOYWEfuC89Yv/mMfmqMUGNul9nKMt3YG2ZM9kzLsNRKNBP2kVyeL
   B2uvrDge1Tnz1TRMQkFU5QChVAHrEL1PtVmdi8JavJjstCCC1V1pIHEd5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364399719"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="364399719"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 21:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848702340"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="848702340"
Received: from pgli4316.png.intel.com ([172.30.235.139])
  by orsmga004.jf.intel.com with ESMTP; 20 Jul 2023 21:30:32 -0700
From:   adrian.ho.yin.ng@intel.com
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de
Cc:     adrian.ho.yin.ng@intel.com
Subject: [PATCH 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller bindings
Date:   Fri, 21 Jul 2023 12:30:29 +0800
Message-Id: <68037e45970a9ef930c609c002d36863d96b39cc.1689913114.git.adrian.ho.yin.ng@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1689913114.git.adrian.ho.yin.ng@intel.com>
References: <cover.1689913114.git.adrian.ho.yin.ng@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 .../bindings/usb/intel,socfpga-dwc3.yaml      | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
new file mode 100644
index 000000000000..dedef70df887
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
@@ -0,0 +1,78 @@
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
+    const: intel,agilex5-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  ranges: true
+
+  resets:
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
+    #define AGILEX5_USB31_SUSPEND_CLK
+    #define AGILEX5_USB31_BUS_CLK_EARLY
+
+    usb1@11000000 {
+          compatible = "intel,agilex5-dwc3";
+          reg = <0x11000000 0x100000>;
+          ranges;
+          clocks = <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
+                   <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>;
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
-- 
2.26.2

