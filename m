Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2E52E7016
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 12:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgL2LsZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 06:48:25 -0500
Received: from mail-eopbgr70073.outbound.protection.outlook.com ([40.107.7.73]:22087
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725964AbgL2LsZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Dec 2020 06:48:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja5QLKdG5k7faoiU9qJNoPxzSoJi9bTXcM9NyO13hOW374CWaCpZqV4zGXRhSkEoQhL5H8ASsrQ7bkCRLRifSCl1ZD4R78VO8HSjgyPIySZfh4FhzupZbBd9U5lZ4h8uoUAQumO2LmNTOWBUE1iWfgF7Ot7VTIzvfPEpTyx+xl/lmVy6baDp/+g6sUlSqn9u5wAPGq8YcWBhgV20bD3KiZpXokwme6noHKDcchR+8JDggJXFLbmPEPFT+zr9hDioKFR+Zihb2ia30I0PyrKpC44xpV2tpKABPU7yhQPkwF4FTacZPv4p94Oj15x8Yl56n1FJ3D2HaFBQwl1stjkKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi5IoNqCVSXu3k+yMSmyz1YTsW4xWzki+R20lI2sZqQ=;
 b=cGMkaf/LzFTCZteXyTCdpE+cUdpZQJhwGbFLqBZo/UxD5pX2Xh8N/rS69ETclRcwlr+7xnYCFykLNqqADUEvmTq7DvOWymzUnKd/XEIJIWSP/ZU3YYxIQRA8heP9OvVKlo0u2NrEq5Q50FWTDttKHcnsIM9IQNrUMvZzHK90agvcvjl76A9ZPpijhZtiqkZ4UFTZcyMPsFqK7eweJNee5R82IDy2DzSTKxFoWjV9BNmULfjaOGwUqrm6N7neTAOtK0GwpvzjQuLBLGJjJ2o2jCRxgZdk1ixnNRTwBqyZydq9kveo21xfoKRpSdnUuuNGJBZkz6tFXh47JPW2MjeZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi5IoNqCVSXu3k+yMSmyz1YTsW4xWzki+R20lI2sZqQ=;
 b=Bi3toXRPWtHPJ+4EXNvLJUHFGFx3ERJbRP7In/PNObdYfvRmb1gvYr41KRru2VlgboSTMpJxuN32D1kf2wNPmOjzJS0F1rr/o+LXwNCL+SuCyBVEzvvQ9+ARKNi1wRtQz9aAgGFVRZ1ugm3DB6VZj2GmcRsO++TMHZbnjlSUo1k=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6653.eurprd04.prod.outlook.com (2603:10a6:803:122::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 11:46:59 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 11:46:59 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     balbi@kernel.org, krzk@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, l.stach@pengutronix.de, jun.li@nxp.com,
        aisheng.dong@nxp.com, peng.fan@nxp.com, peter.chen@nxp.com
Subject: [PATCH RESEND v5 1/4] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3 glue bindings
Date:   Tue, 29 Dec 2020 19:37:43 +0800
Message-Id: <1609241866-9508-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609241866-9508-1-git-send-email-jun.li@nxp.com>
References: <1609241866-9508-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0173.apcprd06.prod.outlook.com
 (2603:1096:1:1e::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0173.apcprd06.prod.outlook.com (2603:1096:1:1e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 11:46:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5ee47d43-f8bb-4665-4431-08d8abef7358
X-MS-TrafficTypeDiagnostic: VE1PR04MB6653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB665326A68ECC5CB559EDFBB089D80@VE1PR04MB6653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PuCChEWFB0vmb0mVAHy5KTqnvs9yf0JVD6jLY7liimyqY9FBwHfM0hOIbUDB/A2lejlhNTSNWigJhG9WYeNoRv0ua09wYcJkwcwI4ftAbR67TBsACEtzlSMu1bflw3yP+BORUsUgXO0XYK42H8i3h25dLRk0P08u5xv/cRat+RwTTuHT2r9LwLl8rn7SeUWSLlDgQV9gKB1Ahmv0DW7/VDfna6/xPdS0dJ1OsDyC90/venCd0bviEd2OKBuKpHz7QT64AfBu5whFQLuNJ1tRX2bxik7VvVftF/FBCeiIbF/PGrdMa0hGv8zIaEeXrywOBWOH8Lw1GmaPFYVM89UI2uZZl3tNQoEsRFZjmi5Cb7XCKEGbo9UaCteUvGjnJKKdKTG93z48V855KsWWETQe7H1zcpcymQDn0IjN8SVTrrBAR226Ct5gJ+CAi7Lt16e+c1298oqGuXBwhhs4bpfxkmdMdAYoKPj8QaH1BklfK5oTZN+sGRUEJAevJ9SJHSERCkWgLVyBxy5XF4rnbV1r7YJJzX6d7GmXurhMW24KCTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6506007)(66476007)(4326008)(83380400001)(26005)(8676002)(66946007)(956004)(2616005)(2906002)(69590400010)(5660300002)(66556008)(966005)(16526019)(6512007)(498600001)(6666004)(8936002)(7416002)(52116002)(186003)(86362001)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JPLVHp5PRkX8gn7ncvnLSvr2pT2lD2KOdWvpykQsbsYI31rFYS/q4Rdxj8f4?=
 =?us-ascii?Q?H7+i/Fbaz2ULOzRv/GqoA7+uiay1b/NC7LrJZp8AGke99GdNB7c3WIBCCekc?=
 =?us-ascii?Q?30ZDW8jYTAFn2vufePfKqC0VkUwJtkF8frHOactl6hC3ftL7LoAjQ4hJHp7F?=
 =?us-ascii?Q?S9tdKya+2Fcj+uWPS1W9ooGv8ksdx7qBLGNbqaNwjDmRjtbnlkHrIBu9M9Ey?=
 =?us-ascii?Q?/X9meVB6wxMlNCjVV1M6Wo3AfmATelX4pkm4dZ4kLBta+lO/2L+57SD0QHqJ?=
 =?us-ascii?Q?o3paBGHLN/CLVuCtmY7yoLQ831K6ii0X08qqMBKgvQRn89yGOlHbyeR/FeSm?=
 =?us-ascii?Q?Iux8ExDdykhqoHaovoPhKNNcoMG8Ec2ybxD5uzdMGfZ1UlFFDKrT5xp1YTVh?=
 =?us-ascii?Q?I4b3lIsHUUVpyPgRIEtCFZ44mrO4VwbNNSqAB6cQqtbtGkuq8qMwb2QhJsB/?=
 =?us-ascii?Q?iDDC7UteiV/N0YCMmRJkFAzeaBTm51LiyxVhXy8U+XXYpU0pixc1qa7eb7QE?=
 =?us-ascii?Q?mhQoYva9q6gkfXjKj8BcFB1N6n5tK/SeJ/kqJUd/ANzQk6Nf2uLORIGgnMxp?=
 =?us-ascii?Q?cinuuAyh/m7zc7UbnTuh1adLqZKL1A0BB5AVkfwDBvV1cGWmmC6HhdyeFjD6?=
 =?us-ascii?Q?b6rCOg6py3XSnTzJylS97M49lYR8Htc8+NrlD2L7phuzsgbqXPuOod0ccxbj?=
 =?us-ascii?Q?2BLTOZAOCc1Npgws+ZHgk5C/0u7OsSbb0RwFz2fSseAwrWR1t1c39HTvjGIb?=
 =?us-ascii?Q?sDWocxULCNLXvi2Wu5i0mlxr5myBrgcNTJO/mb/YX/ewMliIJ4HUoUM8xdNM?=
 =?us-ascii?Q?DjT6K/SXJ+U8pimB59J6q0syGqLlnsdfjLXaROoxGbiLIAQ5daTpmGwp0AGL?=
 =?us-ascii?Q?dG6BEPxG1t7Pz16qiDV727i6Ede2DQhesnhIvK/czJ0ilDG4axY87OJ3o6R2?=
 =?us-ascii?Q?VJmaj+pmzQ8QxdC4xwpnTQnt4bXVB+XkGvZYYjhdV/x8WzO3btQUAb5S83kv?=
 =?us-ascii?Q?p4//?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:46:59.2653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee47d43-f8bb-4665-4431-08d8abef7358
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6dR2hgsTEr27tpW4BcAyxA/MbQHm1YVO3kPIjO5bxN2PiP5E9bP49SafENP5MUi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6653
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

NXP imx8mp integrates 2 dwc3 3.30b IP and add some wakeup logic
to support low power mode, the glue layer is for this wakeup
functionality, which has a separated interrupt, can support
wakeup from U3 and connect events for host, and vbus wakeup for
device.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
new file mode 100644
index 0000000..cb4c6f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -0,0 +1,105 @@
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
+    const: fsl,imx8mp-dwc3
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
+  dma-ranges:
+    description:
+      See section 2.3.9 of the DeviceTree Specification.
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
+  - dma-ranges
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
+      dma-ranges = <0x40000000 0x40000000 0xc0000000>;
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
+        snps,dis-u2-freeclk-exists-quirk;
+      };
+    };
-- 
2.7.4

