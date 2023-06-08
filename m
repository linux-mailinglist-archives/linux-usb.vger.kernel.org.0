Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B327275C4
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 05:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbjFHDeL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 23:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjFHDeI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 23:34:08 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2083.outbound.protection.outlook.com [40.107.6.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C6126A1;
        Wed,  7 Jun 2023 20:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYj3hqfsK80CtfzTaCAmhOsPSxVSdA01y/qF+H3yOf0g3F153u5SVrhL5ayY/ZYVfjTDuItnquYCLHw0pU8wm0P0psUHzakhbiHkSwwx43VKNde0HIWes9qL67kf8dAb9WS26dGwjZjEWgAe0mreziJcfDU2CDayPS+/lzOYT1wvFDTn48teoTRgNyO7a+MUa0Io0pIhT/5GbeRh1Uu3bf8Qiu/QXeX5tSjhBqbx5DgU6BAEiOJhaNXSDAj687VxIai9AF4UqXA6lDAAemvumvySulYV4oGfrV4LD2eXTCpZxPH4qwOl+PH5hlYGhgQuBLr5oxAbJy/rIcTdV8xqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7jd4XY8G6tbEiAKV05D99ZTYURynHgcOItwKO6OlLo=;
 b=VAwk1YjsZzsrIKvBsZPrIHNPzmneFfFuKFdKFB8pwl0W9d3/Itx0EXMXBLW6FIsyCJiVdUqz43Ihu8wUzLFx6WMzzqyKNIKpZp5Zl+ddHVSmF3mwURO1Q4wwf+VgpmQYoH8hcZf1AgSfh8Mx0EDbSCRjAt+oOdE4X4gX5+z7D9h3anYhkpw+RtZ9pTRscV6pm989C74H2NmfO1NSl9/5Yju8paMw8q7NlHNwnX+aNFd/VQwEJjrcEiuW6c41WBUoPhaUNg9T5ykLuTP2oOQoHDpVt8kWEp+sJN9Tcek0WrkeXzDNMW7kCL+S9/MssmLjhiwRiXyNi2elW15JwsPsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7jd4XY8G6tbEiAKV05D99ZTYURynHgcOItwKO6OlLo=;
 b=H8JTu2rjzz6YMa48erzuChOy6t1GexEkJXDW+q0QJ0B0nLuRQkXZuU4ox9EfCB8z6uz86CUETuxqy9b5nYtzT/p/7HsScFZ26rXH50yPATn9Pxvs/kz2oZJFZ+BI0DcMtM2l1RDzqm6rqAKBcsOZz7nENEXL5hDODVaMhmyTwdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB8344.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 03:34:04 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 03:34:03 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema format
Date:   Thu,  8 Jun 2023 11:36:41 +0800
Message-Id: <20230608033642.4097956-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AS8PR04MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 21708621-fe7d-4b4a-999e-08db67d13490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cntI8L5b2L2JBbLKIc/BaenCEsTouRb4ua4k/DpYh0m6npXJkWnHom8iPlv0XheLtDwuxrVh0ltV1tOAGf5Az2p07sFcKzmt0+DeK/hvohwPnNBOtWjTT3Rs3LPDMbtEg3N1xAgvEXsFhiUQBbioe/LFfV3ys2260pBJfjqCHsh1mTe2kiHmGrK215lxvbYOPF+YWarUGh0JrbZjEeNEwcpSMK8KE/Z8a10Tv0TMLda4640rwznchvrzSec1np9o5NN4MPxAHczBy7aKr1ytc6KWVL5wfyVdkXiYiwlcVn6S3AU5EMDkAorALx/zuQg58FTrNLGOZbDHFfBxgFzF9DDMsU1xsaxBOxan12Au+9sTjorZQWTJwK4p43A1QYlVF9XsCsU2FcoV6ecWZYQpohq78d5Q3b1GjQM7XhlP5rR5Gc87Col2/4OTNygMwqpcibIlcoHGzUBJ4ZJ2+lpR6oRUPpjP0+tjvY4xYuRdsR0sjlH8+rWujRE5ZrQFjc0sp3iKrC19Jjh7wE1qtGFvVIoXCZO8FkkQ2RsCpVkXLwWfbPG0yG6/+72Th7NkdEJx0pUWwoEX6IInq+wFZS4L2zsD/8Du+zij0Y1AOt+F18Mik/TGyuBV1pgDCDYS9HFQQe0BsLLmMgPFqd+F9A7O1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199021)(36756003)(1076003)(26005)(41300700001)(186003)(6512007)(5660300002)(6506007)(2616005)(83380400001)(8676002)(8936002)(478600001)(966005)(66556008)(4326008)(66946007)(6666004)(66476007)(6486002)(316002)(52116002)(38350700002)(38100700002)(2906002)(86362001)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gaoclo0KjtFISUCAsu9dHvc9imFEQqsSh7I8NySD6JGjXeHgiti2Nvmt1Hmq?=
 =?us-ascii?Q?9TYANJDKTPduego1iG0q4FhuNXTRCAN41+nwOKDw7JZj9laKdcpLhgRkNcWU?=
 =?us-ascii?Q?4N5WSgzOJFPQoMC6ozsP41WdyniYbVQCXPEb19l7Md2NjCBoMcMqpEz84Uqc?=
 =?us-ascii?Q?iJ6tGzC2g/n3sTSIsTeNzD/hfGKPS1Effso8GketTmIAwFqTrqf+691cM7+O?=
 =?us-ascii?Q?CUHX4363lLGOYrEi9swBNCUoyvKmqEvOojpIGdZPtLULJ+2MI1lpmz/qThqM?=
 =?us-ascii?Q?LPugTmK2jo8eOAsab+QDRlh9pwn1RTHiwTCeoyHCfZT4sCe917S1ztV9EniJ?=
 =?us-ascii?Q?2sKg5HCWQOrPMHQlXHa6tDuOPR0U6OtVpMAfPT6H3a6ODYXmhlx9WIZIQgen?=
 =?us-ascii?Q?r2QQZo04QZvAu79+qw6GuZ2QgqvFNCCwB45FzMfScFo57+d7ke8HT3AFsmZk?=
 =?us-ascii?Q?JnS+8VWo5Mc+tI85vCEXLbC9Ex9BdYURBqgMNgz3wimXdWojQUxFJ0oChfRN?=
 =?us-ascii?Q?jgQPBHMmrXZd0KqYFioATAflEC5SCp6cbhqLV0PUuEqhjc0XWR1Ckhgdcwu1?=
 =?us-ascii?Q?882TMSWeKSMTs+lzm6Y75nghHpO4H85T1eAk7bYALNuDSYY4jH+9PTBIcgKj?=
 =?us-ascii?Q?3k3ftNrwS2XIByWkoyddnVSaubwMGvmacNYwiGB5RQTU8ysSKp92q0z0a2g5?=
 =?us-ascii?Q?StiezUQn9M3g/H81uQFAt+nLjU7JCb48Z6RUFoYawdxCSgjSB6vlyM00ZyfN?=
 =?us-ascii?Q?uRTh9qn3rOFu8utA79Rw6qEOYutJPmHARJm63MpuYUKdsg/AURznO7fmU57N?=
 =?us-ascii?Q?uid/hYApXPpiV3KjeTj5CotLyMJX/Taem92XAgIrOZbztI8UB5s9koamzzRH?=
 =?us-ascii?Q?eU93c1n4LStD6R897x6+0l9NNJYGi9zM0AnNkTZtilrAB8JLutwfGJhcB9r/?=
 =?us-ascii?Q?DiT8T7YElTVhZnhBbIZ+8HYiBd1WHH7i8F1rGHzK4JZk9k9IFdMhPjRcPlh5?=
 =?us-ascii?Q?ENAp1AbjtnYI86AkQVqynSCkwBWfqfCzSaJaPUGqg3xAnljsRqYkvB/aXLqj?=
 =?us-ascii?Q?4ITYIG3Hd9oKKnsfoy7Q9j2KcYLZGCN6ZQVE1//Kb+28prsd47QYXkKo795Y?=
 =?us-ascii?Q?dJLsti2WiVmEeF2N5WNsQ8B8hYLdgtK/j/l3TldMGum4d2t04IoRhyF3TRlp?=
 =?us-ascii?Q?ojS5FhmMTySTCiSMC7yJ2FUo0bSMsY+2SSkOh85Y++oojFX/aXTIdKJ8HF05?=
 =?us-ascii?Q?avxeDIZRM566fVbc1Hp5AUsRIep8lukP/3JZ93L8391fKRWH8cKy/pGejsAI?=
 =?us-ascii?Q?uIo1SuhRSSWSrj1D3g4J3QeTIaN9B8+5xZNcWEO2acp3KddyETtqhvC9OYeo?=
 =?us-ascii?Q?AZOGWfXZ1E4ET1agEuaadGlObWGCTRZOBykkDHSgkE6xJCOd3bXshXt9Ocqu?=
 =?us-ascii?Q?XvwZUdT0ehLyerzC+DTREQfnt2OmYP6uEktiDBm8PychPJCDT1sFRRdR/w2F?=
 =?us-ascii?Q?tXcrHvShKJB79pIOZFvZ7dAJ4LfD8tN24k3Me4R0wjE+HXdiDKMP3/3rd2Jl?=
 =?us-ascii?Q?2SpRCreOBnqmJy+s6Ku/L5pQiKMrkYyAPb0dqAJ4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21708621-fe7d-4b4a-999e-08db67d13490
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 03:34:03.3096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwmzJqHs2s4OwecSIdHpAGSvyNl6V6WpbVqmONdgXXCLlfkuFY/zWmOQMHoI9jSVppjsN5t9/Aw2LCl2A2TTqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8344
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Convert the binding to DT schema format. Besides, this also add other
optional properties not contained in txt file.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - change filename to fsl,mxs-usbphy.yaml
 - add other optional properties
 - narrow fsl,anatop to imx6
 - use additionalProperties
---
 .../bindings/phy/fsl,mxs-usbphy.yaml          | 128 ++++++++++++++++++
 .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
 2 files changed, 128 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
new file mode 100644
index 000000000000..1b6b19fdf491
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS USB Phy Device
+
+maintainers:
+  - Xu Yang <xu.yang_2@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx23-usbphy
+          - fsl,vf610-usbphy
+          - fsl,imx7ulp-usbphy
+      - items:
+          - enum:
+              - fsl,imx28-usbphy
+              - fsl,imx6ul-usbphy
+              - fsl,imx6sl-usbphy
+              - fsl,imx6sx-usbphy
+              - fsl,imx6q-usbphy
+          - const: fsl,imx23-usbphy
+      - items:
+          - const: fsl,imx6sll-usbphy
+          - const: fsl,imx6ul-usbphy
+          - const: fsl,imx23-usbphy
+      - items:
+          - const: fsl,imx7ulp-usbphy
+          - const: fsl,imx6ul-usbphy
+      - items:
+          - const: fsl,imx8dxl-usbphy
+          - const: fsl,imx7ulp-usbphy
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  '#phy-cells':
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+  fsl,anatop:
+    description:
+      phandle for anatop register, it is only for imx6 SoC series.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  phy-3p0-supply:
+    description:
+      One of USB PHY's power supply. Can be used to keep a good signal
+      quality.
+
+  fsl,tx-cal-45-dn-ohms:
+    description:
+      Resistance (in ohms) of switchable high-speed trimming resistor
+      connected in parallel with the 45 ohm resistor that terminates
+      the DN output signal.
+    minimum: 35
+    maximum: 54
+    default: 45
+
+  fsl,tx-cal-45-dp-ohms:
+    description:
+      Resistance (in ohms) of switchable high-speed trimming resistor
+      connected in parallel with the 45 ohm resistor that terminates
+      the DP output signal.
+    minimum: 35
+    maximum: 54
+    default: 45
+
+  fsl,tx-d-cal:
+    description:
+      Current trimming value (as a percentage) of the 17.78 mA TX
+      reference current.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 79
+    maximum: 119
+    default: 100
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          oneOf:
+            - enum:
+              - fsl,imx6sl-usbphy
+              - fsl,imx6sx-usbphy
+              - fsl,imx6sll-usbphy
+              - fsl,imx6q-usbphy
+              - fsl,vf610-usbphy
+            - items:
+              - const: fsl,imx6ul-usbphy
+              - const: fsl,imx23-usbphy
+    then:
+      required:
+        - fsl,anatop
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usbphy1: usb-phy@20c9000 {
+        compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
+        reg = <0x020c9000 0x1000>;
+        interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+        fsl,anatop = <&anatop>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
deleted file mode 100644
index 70c813b0755f..000000000000
--- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Freescale MXS USB Phy Device
-
-Required properties:
-- compatible: should contain:
-	* "fsl,imx23-usbphy" for imx23 and imx28
-	* "fsl,imx6q-usbphy" for imx6dq and imx6dl
-	* "fsl,imx6sl-usbphy" for imx6sl
-	* "fsl,vf610-usbphy" for Vybrid vf610
-	* "fsl,imx6sx-usbphy" for imx6sx
-	* "fsl,imx7ulp-usbphy" for imx7ulp
-	* "fsl,imx8dxl-usbphy" for imx8dxl
-  "fsl,imx23-usbphy" is still a fallback for other strings
-- reg: Should contain registers location and length
-- interrupts: Should contain phy interrupt
-- fsl,anatop: phandle for anatop register, it is only for imx6 SoC series
-
-Optional properties:
-- fsl,tx-cal-45-dn-ohms: Integer [35-54]. Resistance (in ohms) of switchable
-  high-speed trimming resistor connected in parallel with the 45 ohm resistor
-  that terminates the DN output signal. Default: 45
-- fsl,tx-cal-45-dp-ohms: Integer [35-54]. Resistance (in ohms) of switchable
-  high-speed trimming resistor connected in parallel with the 45 ohm resistor
-  that terminates the DP output signal. Default: 45
-- fsl,tx-d-cal: Integer [79-119]. Current trimming value (as a percentage) of
-  the 17.78mA TX reference current. Default: 100
-
-Example:
-usbphy1: usb-phy@20c9000 {
-	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
-	reg = <0x020c9000 0x1000>;
-	interrupts = <0 44 0x04>;
-	fsl,anatop = <&anatop>;
-};
-- 
2.34.1

