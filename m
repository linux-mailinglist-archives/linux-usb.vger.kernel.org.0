Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83495281802
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 18:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388034AbgJBQfF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 12:35:05 -0400
Received: from mail-vi1eur05on2059.outbound.protection.outlook.com ([40.107.21.59]:5312
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733260AbgJBQfF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 12:35:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iivO7H9HWNbAEECc/pAZFPxSPFIVU3LVIzvHk3d6I454cCjcVu0bqiLENv50z+OXDu6cTKrybhiwATm1z8qzC9eJ0W6b+L/xeAc90MMRPkBHcM4+YyUcnJIIDARyABOnID25pbiYX8SsFiZjh01qjav0J7qOluHRbzEj+XZkB9uVzjw2dqCeLSZ/O0zNo3kFqEO8CvtgmLWgzP8Rj/SI6CwHaJ2nu/jXJP4phbtEmj/dP/o8nMYTCBmvBcDNxrBDWZVc2kqOScfx6Rz5KFbeOX/C3lQ4UujWP/IQRTO7EkA1wXHAeQUleICGw7ZVAeD1kBBhRaG/WZDjFCMEcbd6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDk7C19kuaMI/5I+0YF1/csKJqPOVWRZvu0PEdXJ6Mw=;
 b=kalJ5DyvC7vXEhpTP8d7erNaAMIg1vkEX2XpOD7pMTZbafs86Nh47/mZlyoPm+4ECSUozHUUiEbMM7mg5m/3Ax/qF+q22ErslX4LgRzAHDlma1iwucCkzlD24x5q6BF8r2EKvGeP8SBQSJto/MLQyBZKaKFHAs3eye01STyL+0XhGqN4SVhcAnsUbhOPOBplYog1PLvrVKRR+INcHjnX2hVVk7TfFVjnu0jFZKnjYOFZWTf29G4tMBpwbFEXX5GNzF69b5773wwl4zm/Sab3CgEJFZb+l4EVuaxZRy9VK+u7FMwXdxKgHNhsalAbqDCygLWYADZBOm8yiUt6JdocWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDk7C19kuaMI/5I+0YF1/csKJqPOVWRZvu0PEdXJ6Mw=;
 b=EmA6mPojXUax3m43P4TmUFqH3vZazmlF5NmMoF9nv/ZUWvPpFt0olpV6M6wOr6257VlMwPnj/qizhKDbe77RQ4uEg40wLXe9tB/K3vUOdkF+u79wAb+7vy3aE9gPMFLaCIMSR60EpAgG2S8V8z3o8lFMTmueeF2Ye2KIL8nP15Q=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5213.eurprd04.prod.outlook.com (2603:10a6:803:54::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 16:35:00 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3433.035; Fri, 2 Oct 2020
 16:35:00 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3 glue bindings
Date:   Sat,  3 Oct 2020 00:30:35 +0800
Message-Id: <1601656238-22232-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601656238-22232-1-git-send-email-jun.li@nxp.com>
References: <1601656238-22232-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0106.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::32) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0106.apcprd01.prod.exchangelabs.com (2603:1096:3:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3433.36 via Frontend Transport; Fri, 2 Oct 2020 16:34:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: acba30b9-8166-405e-e236-08d866f11aa4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB52133E9F8BF1E291AFC078D189310@VI1PR04MB5213.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ddKYH3cSIvMXe8CRTFFHBbZ0xHyxH6n2T23pdQf+htwpj005+aXlvRiNj/uldL7385HVXzyAeqdQPaOyjqDJbd2olQiA5lwp4xOEAB4ZJkvmKVYdsvR5RYrGWWDRJbHtTtV/7d2rqfg9Hju/8bJk2lkTCCOj7xtg1bLqZsfz0r9FdEzTLME1GJBsu0LRXF/tl8CFgct4vW2KgY5xAZdU7g3n2Tk8sEFRErZ672pOrNUb+PwdNxws5K02ETJBs59Ooz7ZiaRsPRSj9N+pMckEoUnjjLVqR7CTVG/zUTU27VUIVk38kyNg5Y7X9YnAxYwooZDvx10jYRQkaTPDKDhzCd4Dl1qvO341VVfUbthbiuocvG2DDDuaBYCqqHUqFXGXnRBRLZLkzfdehWi4u18JqSeMkKjhcvxxfwxrIFei7TpUjv2y7PK32FCnZiPVPHuh/Zlft9UhZMf6f+Xe8uNfKquy+Bl4HXdS0CizLwtIMwg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(966005)(6666004)(52116002)(478600001)(8936002)(6506007)(16526019)(4326008)(69590400008)(6486002)(26005)(186003)(83380400001)(2906002)(956004)(316002)(86362001)(8676002)(6512007)(2616005)(83080400001)(36756003)(5660300002)(7416002)(66556008)(66946007)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: i6nRHOaIDelM3MTpErx0JngBwoOFR6qULsgINkbT2WLiSitzDNINUSGubwemlSk9024mQebGxyds+Fhi9PQeEHkkqYuM1k0s6oozIBy8jWBqGZuRpODBhtPpV171iC50fSb4BpLX2E+L+GEc2EdEyxZXd1feKoPoQmsALyy0NSzg3B9bw5x0CyH1YBGp6o7tffLHmkcvt4oXM+NYGfD4q1xayXA3WJb+D5IDMuHGShPuVO8VpnqHCu66+5QecSNSAc0//rh3wBv+zkCRxL4OJGz+WdYuYKhiBG2y7teNmo/7kmXQWbLBPEs8FHpM3pKltb3VMsm3Qwmfq6VrQCldrZkfNU5J9aZjR34x3DjgL4Zmk+xnH/DoFcBaB15sC1Y3rYeQNsD2yOiE3jC5bzHRUOtPQxP28sIbXxfbq4Jkz8kLei/3gmECYvn5g8SMWPU2AwpNR8UFdBnzR8ZeAoSrXUF+m3YNptWLxVTLNxv+U2ggGZJRB7KQxhVAnrDtaLu+CZidkYCUno9dNKZTjaSocIMWH3wwqqE28o7RLfAsOj3grmTUASQGoGvyMyTNrIZg0n9IEFHnrmCFJ+K5oM7rPX9PjttKEw9IKt+HedRoydApSxfiTooQFEw9oyKUw1uK0uyO3gCegRtW3b7MJ/YZaQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acba30b9-8166-405e-e236-08d866f11aa4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 16:35:00.6722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tppWEdjgZW7IFIiHQb0KtJdxVqY5Pl4yWiZO85/r3ifYW1ioHf2fRJu61RwLSsal
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5213
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
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
new file mode 100644
index 0000000..c16c94c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -0,0 +1,106 @@
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

