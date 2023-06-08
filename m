Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A35672773C
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 08:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234673AbjFHGZm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 02:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbjFHGZi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 02:25:38 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2058.outbound.protection.outlook.com [40.107.241.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD752688;
        Wed,  7 Jun 2023 23:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0F8GjtOOw5Imltne56djGrMKrls7givQXFJByePaDrhamBx98/0+CspDwYo4CVsQD3d9Bitc9iWUmNLPQB3jf6l7Pdx0K3Rk5hEMXmo5qqc/KlIhb3bEL0gEBFfszLkwDYA4k1zXtM+SYUSYDTxgAnpd3/zyjzvidyGK5N+8RR48KEsN60F5csWox9Z0Qs7ul9u1mzFWvNuQRlEbWrbfv82W55o+aCxGZ6hzbP/0+XlOxKAzFZNsAIGbzpuCu8VFWUpnzHRy19O/qdeo01zouaGspM+mQN/5tUWH5w00ZLgKAZ6feI7IGlgfS9mbSb/mLk2JZd7Gy/MaMGaiQEv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0pZ2Z3gcmk4HqnzQEpwDRiNWTBvIoL+lKGu/Vf1hiw=;
 b=Rz3O/5Uhe8CicQ05OQdwkpkciN1I/udyZUu/NBla79fDQfFCvZL3xqVudLY6DqHv+RlJL2wD1uBd4ISkRLgAYz7OWx2bbRsVSl5bUuyytFp344ElJ+fJCXDi/w6L3Up1qJMYzO/WfIlKE5Q74cWVY2lP0+ksp9Ut1bLI/twAqhMQQ0Vz0S2IrTtROSZb2z2mnKIXcUKPYMERJr/hFlc2NqkRR5TOoQSCCffFNZlC/tqvZDwsuQKQGFitNPjz/Aks7kT7RfBdntLr0Fe2pnBZR5MMwJ+gjTGw/hm3ikrhkWc2y5RbCPoMmMibZz9nwNciWGJRuma66oyHJl4hNxcSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0pZ2Z3gcmk4HqnzQEpwDRiNWTBvIoL+lKGu/Vf1hiw=;
 b=HX25IACMZboLSYxCiiMTBhhXcLDkUIqEAzcmMAxqij7zSyYefLlgmg1OukfNWF4hH8UIQlZIMppRv4lmjzFp5+r3/8QJW+RhrhiRH1W5I0I5uCrCXy9AI1+1V7dFQEIg2J5IbjMOF2XISZSzKMfPoGud7Rb2baYJxMBBgBMzKJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB9596.eurprd04.prod.outlook.com (2603:10a6:102:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Thu, 8 Jun
 2023 06:25:31 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:25:31 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v3 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema format
Date:   Thu,  8 Jun 2023 14:28:41 +0800
Message-Id: <20230608062842.4171157-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PAXPR04MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: f30e5161-7681-4189-64db-08db67e928c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BGiFwM5dOFOKvjStJxlK+LvOUQb1qFV5hc6bgQJCAqu4G4hs6Y5aLIj84GWCvkDLQeKgwX4KG2VuY3Zf6nV+wmVFxIBi9Fa8zUddtrEqt1YkTjgv46ttAx73uK90pmOS0alunH98/YZxnGAPMOGXV7CVS2trrukm1/PmVEKGuAQashWKaScKMBVJqF+Q4UurL67uoOl/cpswWjShcaMJktikEpOtqSI18GlZxMffnqq7nhAfaIWjbHElj78HnbxYZyZWrtfTVnpG7PbPOPp8PSjXjhl7jLb1qfTUXoRlLNie9fBcImUSfS+jths60TBpaWyOsFNt57L/nUUovXb/kpb00dppZLVPsFEfMRWRAeQApf3bBusIkHp2blWGaWex4RGFJn03G7MRcM0LT3yicuUm2r2NipiwA5wfxaF9prcEsTsUo/y+0/WbSKA8lP+VxiEZNVTfWbKSymFk3HVthWwf/k4tHqqXgJEBX2hIThnnWJeFhBc0E6Gig5xK7axvbBiL9dEY8K9cRHo27tZhsrqTPa9nnPt666E/b4U6+8Ji0L3mzuAfIu1kEORfxXyB8vagKoQnht/uOwj/9qr6DsGfwV3dHUmg39Lb/pKyFODZoYDDUbEOnck/UjEHlTpmgCjJRStKxekAKsmBPOT2gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(2616005)(26005)(6512007)(1076003)(6506007)(83380400001)(38100700002)(41300700001)(38350700002)(52116002)(6486002)(6666004)(186003)(966005)(478600001)(66556008)(66946007)(66476007)(4326008)(316002)(7416002)(5660300002)(8936002)(2906002)(86362001)(8676002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?thI1T7MKuWwe/oxS0d74i4e/u8rb1jovu8rSoq8R/tV4aPQI0x8Nz/ra8SGj?=
 =?us-ascii?Q?oQ4sHoAzLQla8bq0sJKKcluqUapV7pGm6uPBEf3nndAqBhiCcw/JiEtUdAzr?=
 =?us-ascii?Q?Qaal7GBEaNdUXFlbj+oMfy5K1Mk0dsU4IYLRTz9ToAOUD17eDaL53bUXAmDJ?=
 =?us-ascii?Q?BtJP4j4tULXpExVmSCd82Rhy3bjWLYBkSUVJmVmRw9GEeizIA9Nj/4ppBquL?=
 =?us-ascii?Q?cVOpun4hazTNBkiULJnYN476DIGKOJbyc1PUv/nLkG4U19K9Zb5NCf4l2Dz3?=
 =?us-ascii?Q?RufDjI20/sZQj7IJqzgVXiVK2dNWHoipZn/DZqJF5qr02nLZkPQU6TJE6A67?=
 =?us-ascii?Q?3CLzOcF4JcpmEt3H9H1ZaWFYJ4frw380DoupBRA86hpXuFwgzl2xCVHx8HTx?=
 =?us-ascii?Q?8Lt3K2Iqz4bbM5WIf8J+MBzwau6wSPCT/p1z6qv1VVnZgvZ7uVgGfMxnQ9EA?=
 =?us-ascii?Q?AeJf9XpBgksrMiuzclHa4pHNuopgLQXrPnLHcLCJVeCTwWfOJ47ABujekrHu?=
 =?us-ascii?Q?Fuwh/L6WITwsEwpohtY1a58Frn3HVRzcG73n+ydkNSvnNblxN3d7bphnyKVa?=
 =?us-ascii?Q?/ulUbC8MFN6o8ETqbZlUtpg8iidASgKECrfRz9KZbx85G2I6A/EH9d7QRt1b?=
 =?us-ascii?Q?1PC7e8xu2+KKheKvym4WKmI4qKAntSUtPKMoOrA8xNaUSAmMJvYg1ORJ1Wmy?=
 =?us-ascii?Q?N2RZ07TyT43szD3DW9kg1ea9ZiMRPPRED9u8LOeIUJ0opbzwEtaiq39mSzQe?=
 =?us-ascii?Q?sc06qQy2HG/GWMMJekd49tA9D+0FeRFUpIa9tg82a4fDuk0nkkZBzFe9Z0EG?=
 =?us-ascii?Q?PVLZk+VY/Vy6PF+MhyfVQTP8CFfuw/mLM1ugsy+dEkn0DCzLWS5Yqq19bubM?=
 =?us-ascii?Q?rnGl6XdMhZHHA4lWKLUgwFRbhLPowMvgkX0VwHQDpdVrQlot17zSdKxoUSNG?=
 =?us-ascii?Q?RkSpJDS7OB8U+Jg9EHKTodQMLOJEeMPeU5M2W6xOsXM/I9S/eAVJZMhpFJ3q?=
 =?us-ascii?Q?XfkzALPPEjziEnOchl+nqVSigFRTaivCFCbRcvg5by9l/y/r+KmCPKLZOn21?=
 =?us-ascii?Q?+67Ga0PDFOw0ZzvauhhHpE+btIOCSxznB7zdxfCoKyxImmf23QIQ+s+shTNo?=
 =?us-ascii?Q?SXgMG234f1Xv51EjriMVwBiluAjNoox94loVvNGToqsjl1oY1SwX1/z/5gUU?=
 =?us-ascii?Q?+WTcQY/WXjSV5dBU/AF9/ymZ3fqQegUbCn8js3DMbI8ME5K8N4Jn/HWqCFh3?=
 =?us-ascii?Q?REfB6uADrXoQO3AelkhTFJ/ypRQ99sNC5lymFIWTWf+HXttDwu3pF/AV3UX3?=
 =?us-ascii?Q?LlHgqq1BuLsImt0is8bepYZVAacRqL1sLYCygeB3YVgg5n74jQnfarp1Jfm1?=
 =?us-ascii?Q?H3MKuzaoiTFj6lFA8IovtTgQIiFjuxVGuUaSnHYD5p43RP9HiR3crH1Z7KTc?=
 =?us-ascii?Q?37WrzJeoktOObmYfw7XcaFKwW1yV+S4dUfmyoTemLaV94x8Y1KIFmBNt26g8?=
 =?us-ascii?Q?DIEZuBd42rFruHK9TdMiAPMyWf7QpAfheEq6Z55+ZWQ+sUTl8z2wMHUh73LE?=
 =?us-ascii?Q?mbd/mtKdTckOXUlaRr1wnrbh23o9oh+fZu6jul8e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30e5161-7681-4189-64db-08db67e928c2
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:25:31.3950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSOZiCqrbqsz/f6MvVu8Hpe4xyZeHUPwpZnk8RNpznz4Ui7SmGyWb9vC7Mz7BQgCm867MLFV2ZvL92cl9qTnow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9596
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
Changes in v3:
 - fix indentation
 - add clocks property to example
---
 .../bindings/phy/fsl,mxs-usbphy.yaml          | 130 ++++++++++++++++++
 .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
 2 files changed, 130 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
new file mode 100644
index 000000000000..9b89a8891c5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
@@ -0,0 +1,130 @@
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
+                - fsl,imx6sl-usbphy
+                - fsl,imx6sx-usbphy
+                - fsl,imx6sll-usbphy
+                - fsl,imx6q-usbphy
+                - fsl,vf610-usbphy
+            - items:
+                - const: fsl,imx6ul-usbphy
+                - const: fsl,imx23-usbphy
+    then:
+      required:
+        - fsl,anatop
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    usbphy1: usb-phy@20c9000 {
+        compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
+        reg = <0x020c9000 0x1000>;
+        clocks = <&clks IMX6QDL_CLK_USBPHY1>;
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

