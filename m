Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8D412B1CD
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2019 07:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfL0Gg7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Dec 2019 01:36:59 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:54727 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfL0Gg7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Dec 2019 01:36:59 -0500
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 27 Dec 2019
 14:37:17 +0800
From:   Hanjie Lin <hanjie.lin@amlogic.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
CC:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: [PATCH v3 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
Date:   Fri, 27 Dec 2019 14:36:41 +0800
Message-ID: <1577428606-69855-2-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.18.11.213]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the Amlogic A1 Family USB2 PHY Bindings

It supports Host mode only.

Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Yue Wang <yue.wang@amlogic.com>
---
 .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
new file mode 100644
index 00000000..2b2c526
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Amlogic, Inc
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,meson-a1-usb2-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic A1 USB2 PHY
+
+maintainers:
+  - Yue Wang <yue.wang@amlogic.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-a1-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: phy
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+     maxItems: 1
+     description:
+       a phandle to respective power domain node as described by generic
+       PM domain bindings (see power/power_domain.txt for more information).
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - "#phy-cells"
+  - power-domains
+
+examples:
+  - |
+    usb2_phy1: phy@40000 {
+      status = "okay";
+      compatible = "amlogic,a1-usb2-phy";
+      reg = <0x0 0x40000 0x0 0x2000>;
+      resets = <&reset RESET_USBPHY>;
+      reset-names = "phy";
+      #phy-cells = <0>;
+      power-domains = <&pwrc PWRC_USB_ID>;
+    };
-- 
2.7.4

