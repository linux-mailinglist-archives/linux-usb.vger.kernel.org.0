Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA78B12B1CF
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2019 07:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfL0GhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Dec 2019 01:37:01 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:54727 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfL0GhA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Dec 2019 01:37:00 -0500
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
Subject: [PATCH v3 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
Date:   Fri, 27 Dec 2019 14:36:42 +0800
Message-ID: <1577428606-69855-3-git-send-email-hanjie.lin@amlogic.com>
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

The Amlogic A1 SoC Family embeds 1 USB Controllers:
 - a DWC3 IP configured as Host for USB2 and USB3

A glue connects the controllers to the USB2 PHY of A1 SoC.

Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Yue Wang <yue.wang@amlogic.com>
---
 .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 57 +++++++++++++++++++---
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index 4efb77b..6103cc2 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -9,6 +9,8 @@ title: Amlogic Meson G12A DWC3 USB SoC Controller Glue
 
 maintainers:
   - Neil Armstrong <narmstrong@baylibre.com>
+  - Hanjie Lin <hanjie.lin@amlogic.com>
+  - Yue Wang <yue.wang@amlogic.com>
 
 description: |
   The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
@@ -22,10 +24,14 @@ description: |
   The DWC3 Glue controls the PHY routing and power, an interrupt line is
   connected to the Glue to serve as OTG ID change detection.
 
+  The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
+  host-only mode.
+
 properties:
   compatible:
     enum:
       - amlogic,meson-g12a-usb-ctrl
+      - amlogic,meson-a1-usb-ctrl
 
   ranges: true
 
@@ -37,6 +43,11 @@ properties:
 
   clocks:
     minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
 
   resets:
     minItems: 1
@@ -47,17 +58,22 @@ properties:
   interrupts:
     maxItems: 1
 
+  phys:
+    minItems: 1
+    maxItems: 3
+
   phy-names:
     items:
       - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
       - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
       - const: usb3-phy0 # USB3 PHY if USB3_0 is used
 
-  phys:
-    minItems: 1
-    maxItems: 3
-
-  dr_mode: true
+  dr_mode:
+    description: usb mode for G12A
+    enum:
+      - host
+      - peripheral
+      - otg
 
   power-domains:
     maxItems: 1
@@ -80,9 +96,9 @@ required:
   - resets
   - reg
   - interrupts
-  - phy-names
   - phys
   - dr_mode
+  - phy-names
 
 examples:
   - |
@@ -124,4 +140,33 @@ examples:
               snps,quirk-frame-length-adjustment;
           };
     };
+  - |
+    a1_usb: usb@ffe09000 {
+          status = "okay";
+          compatible = "amlogic,meson-a1-usb-ctrl";
+          reg = <0 0xffe09000 0x0 0xa0>;
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
 
+          clocks = <&clkc_periphs 36>,
+                   <&clkc_periphs 85>,
+                   <&clkc_periphs 2>,
+                   <&clkc_periphs 3>;
+          clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy",
+                        "xtal_usb_ctrl";
+
+          resets = <&reset 36>;
+
+          phys = <&usb2_phy1>;
+          phy-names = "usb2-phy1";
+
+          a1_dwc3: usb@ff400000 {
+                  compatible = "snps,dwc3";
+                  reg = <0xff400000 0x100000>;
+                  interrupts = <0 90 4>;
+                  dr_mode = "host";
+                  snps,dis_u2_susphy_quirk;
+                  snps,quirk-frame-length-adjustment = <0x20>;
+          };
+    };
-- 
2.7.4

