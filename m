Return-Path: <linux-usb+bounces-3955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED06280C23C
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 08:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28F281C209A8
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 07:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D3F208C9;
	Mon, 11 Dec 2023 07:42:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEC8F3;
	Sun, 10 Dec 2023 23:42:46 -0800 (PST)
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 3BB7fYgV057623;
	Mon, 11 Dec 2023 15:41:34 +0800 (+08)
	(envelope-from xinhu.wu@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx07.spreadtrum.com [10.0.1.12])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4SpYSS3dgmz2PH8jY;
	Mon, 11 Dec 2023 15:35:36 +0800 (CST)
Received: from zebjkernups01.spreadtrum.com (10.0.93.153) by
 shmbx07.spreadtrum.com (10.0.1.12) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 11 Dec 2023 15:41:32 +0800
From: Xinhu Wu <xinhu.wu@unisoc.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <orsonzhai@gmail.com>, <baolin.wang@linux.alibaba.com>,
        <zhang.lyra@gmail.com>, <heikki.krogerus@linux.intel.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <xinhuwu.unisoc@gmail.com>, <zhiyong.liu@unisoc.com>,
        <peak.yang@unisoc.com>, <teng.zhang1@unisoc.com>,
        <bruce.chen@unisoc.com>, <surong.pang@unisoc.com>,
        <xingxing.luo@unisoc.com>, <xinhu.wu@unisoc.com>
Subject: [PATCH V2 2/2] dt-bindings: usb: Add an Spreadtrum pmic typec yaml
Date: Mon, 11 Dec 2023 15:41:20 +0800
Message-ID: <20231211074120.27958-3-xinhu.wu@unisoc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231211074120.27958-1-xinhu.wu@unisoc.com>
References: <20231211074120.27958-1-xinhu.wu@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 shmbx07.spreadtrum.com (10.0.1.12)
X-MAIL:SHSQR01.spreadtrum.com 3BB7fYgV057623

Add device tree binding Documentation details for
Spreadtrum pmic typec driver

Signed-off-by: Xinhu Wu <xinhu.wu@unisoc.com>
---
 .../bindings/usb/sprd,pmic_typec.yaml         | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml b/Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml
new file mode 100644
index 000000000000..e522ac02026b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/sprd,pmic_typec.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/sprd,pmic-typec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc SC27xx Type-C port controller
+
+maintainers:
+  - Xinhu Wu <xinhu.wu@unisoc.com>
+
+description:
+  Supports the typec found on these PMICs.
+
+properties:
+  compatible:
+    enum:
+      - sprd,sc2730-typec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  sprd,mode:
+    maxItems: 1
+      description: the number indicates src, snk or drp.
+      enum: [0, 1, 2]
+
+  nvmem-cells:
+    maxItems: 2
+      description:
+      A phandle to the 'cc resistance' trim data provided by
+      a nvmem device.
+
+  nvmem-cell-names:
+    items:
+    - const: typec_cc1_cal
+    - const: typec_cc2_cal
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - sprd,mode
+  - nvmem-cells
+  - nvmem-cell-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pmic_typec: typec@380 {
+            compatible = "sprd,sc2730-typec";
+            reg = <0x380>;
+            interrupt-parent = <&sc2730_pmic>;
+            interrupts = <8>;
+            sprd,mode = <2>;
+            nvmem-cells = <&typec_cc1_cal>, <&typec_ccc2_cal>;
+            nvmem-cell-names = "typec_cc1_cal","typec_cc2_cal";
+        };
+    };
-- 
2.17.1


