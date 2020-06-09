Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A4C1F3995
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 13:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgFILYA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 07:24:00 -0400
Received: from mail-eopbgr60073.outbound.protection.outlook.com ([40.107.6.73]:54302
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728980AbgFILX5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 07:23:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjmSV/Lya2LnxEvvsfEPOkAHGcJgey4Iwj2Vcr5nvOHEjqWcDxZm5OWVpY0q+EzR60ZEcGzjj1yI3Ktohw47XNCXpm3dpzVA0PVBSECmJQ96plEmOV/wkD+QcSrCHVL5f3trABwKc/UcBk3NSVkyi13KtGDMUniRCfKTDkwIVPxUqFbqdPrYszxdHD5FObNoURFmsi2Gh9uxak8dJZWYgGSlCO3+Int8ik0Qqg4KjM6nkChtkQ0WVf6L4Vp0z0izlZyzG6q1QAXwvxihtqdZQuknFpWvdvyB4QFUQGtK0yjPZ8gfveIiYKqOO/BrB1bX6fQRayUDKu092+M1CTxt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb2iSjwpZHYsE3KCI9+2iTK60OIDs5FkpAvv2TiiRBk=;
 b=EMlik7tibEkS/KTskvIND0kSb6QxHTeCA4Wy3hiWJMhFb40sEw+DJM91nfoPHHVR2FRm/cL2UihjZrlwAJxjbq7ATkgM5otBlvGa0KDIvKt94dUbWmGzCLEc9KyCnBugSYjmwJjoSIVnafXNOzXsIqKo08/qb+JLaJvS4ro1jXCbM6tz27UHLBdwFEzqU2Sikwt6pdCRdqKgV3faDRVjkOVK/RnhU/3l/nXHqayLvBBMZRrMA4PdDGZH0wSKHsE+3pR3/FG+3Q8qkVcCaTOIsivCFm2l9PgcaPho8zlxIkjTcI1DSxiIowvzNluUa4xBf6Z5pFOkxG+RhYFTndNKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb2iSjwpZHYsE3KCI9+2iTK60OIDs5FkpAvv2TiiRBk=;
 b=IljScxy/uAEVOnpCEEnrwEewpJMVD4RFROlAkv03nJWX5b4ILMgaQijgHbjQqct6zr68VX1KXDI4lT3wOuQgojqvxuNlchNL+RbRNpChvG5oQOZ0ZCWgFt2RInjhsEoKreZNXza+fqMBiCBBcoz/QrUEWeiBwsrKYCzsC1L29QY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6622.eurprd04.prod.outlook.com (2603:10a6:803:121::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 11:23:52 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 11:23:52 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, peter.chen@nxp.com
Subject: [PATCH 6/6] dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3 glue bindings
Date:   Tue,  9 Jun 2020 19:12:45 +0800
Message-Id: <1591701165-12872-7-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0069.apcprd02.prod.outlook.com (2603:1096:4:54::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 11:23:49 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d8e4a52f-f952-48a7-1a59-08d80c6796c6
X-MS-TrafficTypeDiagnostic: VE1PR04MB6622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB662213F2BD924CCCACFEE78C89820@VE1PR04MB6622.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 75IXlFsjAFA8GMKdQdW60e/3+0tP2Hr1TMjbh896dfjBrhiGoSJ35Z7Z8GZodU7GnB4hEZvYoNCZXcgNQizMCiMU4FV5Gl5ChSeDtJzoqUPmGZ9sUrEerZkyidG4zwKKUADIkcwvqmYVCpLXaLgfJVWcwScLN9ivbE4Z5DTGImIagbWQpZ+LaqJfxqRqtQjrULUWGCLTDn7XKmQI3NNMNT6RDRGFxcvJ3mtpwb5K6UZzOLBGtfitLQbiBmwdt3SzwY+wzTP5SB+0LhkjZwAS3O+6kc1xBrXiYrbNxlXhnrau0oTrqTdqxH1fBy5PjJojG2Vpo8Vl+UUlkJ5qLGeRrcpxwDiZGNcd7pjRfQxD3g70TYfTViNeJ+M4MB6qs8AqMESoLkKvHR8Pc6FtTkdPnr4EBC7kG6d6hyH6LvYlKgeg+2CfX/Lhmu43xwHZZj6ut2s03FnBuvn95daJGlsYylqIHsdi5oCE6Whr9mzwg0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(26005)(186003)(8936002)(8676002)(16526019)(4326008)(83380400001)(86362001)(69590400007)(498600001)(5660300002)(66946007)(66556008)(6666004)(6486002)(2906002)(6506007)(36756003)(52116002)(966005)(2616005)(956004)(6512007)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 1jJfodwmo/x3L5t7kzK4I/qPsSkaiePyY/sTAAjsuXoumge8QfesHCi4iaeohaoyRkYCMhltsCSqkTTI714of106LU3s0FHSrstXVkW5GIdUUG73oj7DNNi1vkbjJKCdYm0WSRtsIUAFYxpPUjOBT3VKBPnsH5HlSB2jnMAWgax9HG4SRwj2iKLB+VZHm7cqhuiaKs01ZaNIhm6zYyzUineaYEDtc/C8eLswAcGTHQ/XGSs+1INP7ATRalqpsc7bu3BLu+CwMq+fxHEEqUumeZOtsS0ovQ152SPnH9XaMDvHE6yaK9yQo5+3utobnZaPGHN5WLc/h30H+6pbwUZj+9icD7uEkLat0eZLmWY2i7A/cPoSSRO2Ri9D5R84KoWRM0VZiGe4wXlNKVjQrxaqQLLv/1gUf/zz/HlklC4g+JyakZM7LZ5ACyNgQB6FjyHpMx9qo1s9tewyU7prw5fwREFEfF4kCkK2FOZlFv3msL0=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e4a52f-f952-48a7-1a59-08d80c6796c6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 11:23:52.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPfPrZz/2vef+Hdxde735Yuk+5KomyZV8CyTT58aiIzgWNerkNea/4x5HZs7ceZz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6622
Sender: linux-usb-owner@vger.kernel.org
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
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
new file mode 100644
index 0000000..823db058
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -0,0 +1,87 @@
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
+      - description: system bus AXI clock.
+      - description: suspend clock, used for wakeup logic.
+
+  clock-names:
+    items:
+      - const: hsio
+      - const: bus
+      - const: suspend
+
+# Required child node:
+
+  dwc3:
+    description: This is the node representing the DWC3 controller instance
+      Documentation/devicetree/bindings/usb/dwc3.txt
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    usb3_0: usb@32f10100 {
+      compatible = "fsl,imx8mp-dwc3";
+      reg = <0x32f10100 0x8>;
+      clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+               <&clk IMX8MP_CLK_HSIO_AXI_DIV>,
+               <&clk IMX8MP_CLK_USB_ROOT>;
+      clock-names = "hsio", "bus", "suspend";
+      assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI_SRC>;
+      assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+      assigned-clock-rates = <500000000>;
+      interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      dwc3@38100000 {
+        compatible = "snps,dwc3";
+        reg = <0x38100000 0x10000>;
+        interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&usb3_phy0>, <&usb3_phy0>;
+        phy-names = "usb2-phy", "usb3-phy";
+      };
+    };
-- 
2.7.4

