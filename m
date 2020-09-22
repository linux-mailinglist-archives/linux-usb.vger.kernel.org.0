Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32C9274008
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgIVKyb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:54:31 -0400
Received: from mail-eopbgr60072.outbound.protection.outlook.com ([40.107.6.72]:65518
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726621AbgIVKyb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 06:54:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdnGnQqMVFABELJAshjw5OJAwBWX6o9c/Ctn2SZ7Iv+ZqIdMKOnTTeVeATw9+XUY6iYFBqwhTAh4Ci2Jz0OXjeCluzthC7b3DQgEZhGqzxAOtyRK199fCT+3fH95b/tcvijEur55qHXBHjmiDRnH6C/5nGlsDERmLy7JKIdvYdjmR/oi8I3yx83jHVvssyHaQofIFNLD1ggz/y2CO9fNLoGGqwyQCdrVcbDzUGDt8HbXKTOT9YsEfFUH+ykY5YIe3Vfd1zRNypTNfxeMqV+zeGL2RIc7ZUvLq9oBO7ovPtziKNhsSkfNO8t2ky00Qs/vxGRbvSPmKg8f6b8dH3LFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h+RW2S95s26pL+s4RUgXNZ94U1YMXzUOAY36hkE7aw=;
 b=QDT5cEjYvMLVxyxrkA2WK7qryCST071ctGGSqtikeyZMV/mDLEhDocQnSfYnjdF/79gWwOMV/ES9+Ao+YE4IrIa9D/ACNd8a9nod2+NO2AHRzNpQNzOqm23XU/S41Q+72oW8n99vSe25jlsx+V56diWatG4E1yurYJJ+3I+12hlxyNdlOhUcPPnFR9JldKjMsRgvIj13MtbMKXRF9NH8vFrDQ6iKanrNJoH0n5PMwQDL1ibgTiGz2CNtnryWgsbHee71XBEvbPfUZ5Zwb6KANfxeMNLhd7LKPCfiI27zvnz+QY96G7NVrklcOsTr7UA2F0m+BX/GGCPowmKvJBWTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h+RW2S95s26pL+s4RUgXNZ94U1YMXzUOAY36hkE7aw=;
 b=ouD0sMR1bekObJByTv1JZTUzEz352+54e5qCwbklj/XP2Zw6Fk3uFjEY2YD4dC1Aut1koF8G55ZVD9ClTEhCxs+/tb9tkyzYXXz8o2e2+KmDmUB0HfF04JLPNImLVYIm6kd27KBDig/WL6TIE8oRdXaitF7cO6VYP8p+AC7H1T8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4255.eurprd04.prod.outlook.com (2603:10a6:803:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 22 Sep
 2020 10:54:25 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3391.025; Tue, 22 Sep 2020
 10:54:25 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, qiangqing.zhang@nxp.com,
        horia.geanta@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/6] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3 glue bindings
Date:   Tue, 22 Sep 2020 18:46:49 +0800
Message-Id: <1600771612-30727-4-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:3:1::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.66) by SG2PR0401CA0017.apcprd04.prod.outlook.com (2603:1096:3:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.13 via Frontend Transport; Tue, 22 Sep 2020 10:54:20 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e25ad223-71c1-43e6-5eaa-08d85ee5dee7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42558A3615E0B3DB5449E386893B0@VI1PR04MB4255.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AhXtzMkp4UAWfBs/G3jN1W7IJNV8GIR+K+AzZY7UKjWg47AwZn/tWhZyNxmeDxm+xUQHKmDooCqTOkZXD95Nbnfm2OESnH2H0pL/8yB6c5oEpqqUBVsFeKY2Ne/DdrTAhJW3DYPsMNlE4qyqoIPXtfnWX64Nv2s4dlfiqfRgYPBcTdnRsQaZiPet9Nrnf3Z7Ntf/cgPQTbYhLKwXdMRJCABeI38yVmbjZVlO8xlFxxTlq3k7ZghrvwB3SNpj2u1vlRSuQ2AbgW/vYSvgo+wgMhWndZKz/Kxmsq7TDaPBuY1ZWyf3YaOgvjGBD14oIsVqAElkvDQGib/R6AWRU0aE28/Od6QHLJQKLWO4dFxOhZxwbu8xI6kictPzedkI2UTJexuGouWZdYE7cpH2a+4lm7m1XZEjJvRrkn5v48sV/ilEoqLrCekq+GmnJpWeU9U+cufOlxLDazixfmgtep4tDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(316002)(16526019)(86362001)(956004)(2616005)(478600001)(8936002)(26005)(52116002)(83380400001)(5660300002)(8676002)(6666004)(186003)(66476007)(66556008)(16576012)(966005)(4326008)(66946007)(2906002)(6486002)(36756003)(7416002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XNb/QbklvHM4K6mERjSdwjZLTjIWV+NKh4k9XMN0+KXQvjBb/VZshzo/GNOfAKoK1qe9sJ8kjuH9CbbNch74XyDWReegZa7cqRkdatcrHC9xDTd6BkNI0if4L21NSSWNIVMBru9+wKyjMxq/ZUfx0FR0dK4IvzittltMV+3O82vjJr8gF8H4+B25FnZqlql+PTPse88ehMEsotMsquLG70EswMkTPf8H753cIqPlldDmjninf/m7IVzfRabLVWAPo/Bn9n5uhUtwFDEpCpDSlK4C3O4TYTmTg07Orf2rd/UiraGzZVzBoksmDiJ0J5M9iVp7DFplrqLVArZHc32JRGEAgPEYLT6NO/OAK/AR5vSCEzxMhnUwmPmQY1IthqtjGOVuv5qP/qQSqcbhTgB6FzGRDxc8c4Blx1Vrq1e7JFQA+ndldDaLljVk+ioO3+9s1u/Qb0R7+X50ajTGJlgxkNivvhNKV+2GrmF8fpex4y5WATALPnONLGkjKoFPvVFm95m7lSMJ/FbVO35h3RmGIFPdAi1I1Y1IsNAnTbCT1GtQSzTiXRNorFpe+YEAdqllJau18rEDpjPF4UhC2a4ItNU0EWiHkXYlyK4S7Z9fZyZ4bC5infm7h6D2uGtv31PKqwz37Dgt7xQ674Uo21YN/w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25ad223-71c1-43e6-5eaa-08d85ee5dee7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 10:54:25.5530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/mTV44C39LarwO4CFTS+7DVj+XeiELYz5/SjHcs3U2G+0Bf1nTbzOpNmmEqGmig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4255
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

NXP imx8mp integrates 2 dwc3 3.30b IP and add some wakeup logic
to support low power mode, the glue layer is for this wakeup
functionality, which has a separated interrupt, can support
wakeup from U3 and connect events for host, and vbus wakeup for
device.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
new file mode 100644
index 0000000..a5d5566
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP iMX8MP Soc USB Controller
+
+maintainers:
+  - Li Jun <jun.li@nxp.com>
+
+properties:
+  compatible:
+    items:
+    - const: fsl,imx8mp-dwc3
+
+  reg:
+    maxItems: 1
+    description: Address and length of the register set for the wrapper of
+      dwc3 core on the SOC.
+
+  "#address-cells":
+    enum: [ 1, 2 ]
+
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+  ranges: true
+
+  interrupts:
+    maxItems: 1
+    description: The interrupt that is asserted when a wakeup event is
+      received.
+
+  clocks:
+    description:
+      A list of phandle and clock-specifier pairs for the clocks
+      listed in clock-names.
+    items:
+      - description: system hsio root clock.
+      - description: suspend clock, used for usb wakeup logic.
+
+  clock-names:
+    items:
+      - const: hsio
+      - const: suspend
+
+# Required child node:
+
+patternProperties:
+  "^dwc3@[0-9a-f]+$":
+    type: object
+    description:
+      A child node must exist to represent the core DWC3 IP block
+      The content of the node is defined in dwc3.txt.
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    usb3_0: usb@32f10100 {
+      compatible = "fsl,imx8mp-dwc3";
+      reg = <0x32f10100 0x8>;
+      clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+               <&clk IMX8MP_CLK_USB_ROOT>;
+      clock-names = "hsio", "suspend";
+      interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      dwc3@38100000 {
+        compatible = "snps,dwc3";
+        reg = <0x38100000 0x10000>;
+        clocks = <&clk IMX8MP_CLK_HSIO_AXI>,
+                 <&clk IMX8MP_CLK_USB_CORE_REF>,
+                 <&clk IMX8MP_CLK_USB_ROOT>;
+        clock-names = "bus_early", "ref", "suspend";
+        assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI>;
+        assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+        assigned-clock-rates = <500000000>;
+        interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&usb3_phy0>, <&usb3_phy0>;
+        phy-names = "usb2-phy", "usb3-phy";
+      };
+    };
-- 
2.7.4

