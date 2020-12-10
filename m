Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624B92D56D0
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 10:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388778AbgLJJTC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 04:19:02 -0500
Received: from mx.baikalchip.ru ([94.125.187.42]:36822 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731311AbgLJJS4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 04:18:56 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@synopsys.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-snps-arc@lists.infradead.org>
Subject: [PATCH v4 03/10] arc: dts: Harmonize EHCI/OHCI DT nodes name
Date:   Thu, 10 Dec 2020 12:17:48 +0300
Message-ID: <20201210091756.18057-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru>
References: <20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In accordance with the Generic EHCI/OHCI bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
nodes are correctly named.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arc/boot/dts/axc003.dtsi        | 4 ++--
 arch/arc/boot/dts/axc003_idu.dtsi    | 4 ++--
 arch/arc/boot/dts/axs10x_mb.dtsi     | 4 ++--
 arch/arc/boot/dts/hsdk.dts           | 4 ++--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index cd1edcf4f95e..3434c8131ecd 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -103,11 +103,11 @@ ethernet@18000 {
 			dma-coherent;
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			dma-coherent;
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			dma-coherent;
 		};
 
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 70779386ca79..67556f4b7057 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -110,11 +110,11 @@ ethernet@18000 {
 			dma-coherent;
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			dma-coherent;
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			dma-coherent;
 		};
 
diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 99d3e7175bf7..b64435385304 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -87,13 +87,13 @@ gmac: ethernet@18000 {
 			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			compatible = "generic-ohci";
 			reg = < 0x60000 0x100 >;
 			interrupts = < 8 >;
diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index dcaa44e408ac..fdd4f7f635d3 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -234,7 +234,7 @@ phy0: ethernet-phy@0 { /* Micrel KSZ9031 */
 			};
 		};
 
-		ohci@60000 {
+		usb@60000 {
 			compatible = "snps,hsdk-v1.0-ohci", "generic-ohci";
 			reg = <0x60000 0x100>;
 			interrupts = <15>;
@@ -242,7 +242,7 @@ ohci@60000 {
 			dma-coherent;
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			compatible = "snps,hsdk-v1.0-ehci", "generic-ehci";
 			reg = <0x40000 0x100>;
 			interrupts = <15>;
diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
index cbb179770293..90a412026e64 100644
--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
@@ -46,7 +46,7 @@ ethernet@18000 {
 			clock-names = "stmmaceth";
 		};
 
-		ehci@40000 {
+		usb@40000 {
 			compatible = "generic-ehci";
 			reg = < 0x40000 0x100 >;
 			interrupts = < 8 >;
-- 
2.29.2

