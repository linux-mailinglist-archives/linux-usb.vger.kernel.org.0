Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258B072DC80
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 10:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241154AbjFMIbg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 04:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235270AbjFMIbf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 04:31:35 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E12C9;
        Tue, 13 Jun 2023 01:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFZykcmJgM/fb7BYLnOHS+2meAthzPBF/FLF5eubTp5mCc+Ol6AZsTh9K7FNljbiddFYZEs251wG4ab7dO2JI1uuIN3lCDc/Gel6bBMXqohBf07pvWnXmy5bIfUZUkWDOUELKXb1aRqc0lzJT+RaRU+JYgvwMfxMhHTrZhwfnOJtIG24fUIHNiSx5RCx7TfFwe1fuTfVjR/VHWYcX3IiJ6y70SGNUpH1wfcWD3CD3/N584zL1bAhmGMt+ryCNR5Oz2kfkblIoV36yBe6akjpgIQwokK4R0cy1aHeQ9BaZN4VdeS0Ydt2zgUxMizNfoT61E0EhJJAIGjdI6IZNkc60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MgpDp0ZxJpBY8zXmgLRpihh6lEHvMDfQMHA5aKtjk8=;
 b=IIxlPqK56uecccgtIxKZVNOfhaTsOBR1H4n2T+X4eGaIoFBKWR8O9dRhhwp/8rU68AxrE2qC6nkp6IEi7GwKatuD4b7K07Ag58Wk3nPaIOroTLq7wBVydTPASevxtbZqPrtGmjHza/U/kGdPIpRggXKCn6oc7pO9iG9B0NzYDOlmqB2z0+TgaxXLwwhLNzWeVCWasJMPrsNeZvJc4MSQ0wos/xKoMow8b3mliif479DQQ3vmXYHeR5aWc37uOVlGd3Q5KsOpHcEGvAE9YPEPZPVOWPBv9AVlJqNxZuq7zD9wRBt7w8gsc6m/+6NZHT3C2ZG7ackQc3r06zkqFHldGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MgpDp0ZxJpBY8zXmgLRpihh6lEHvMDfQMHA5aKtjk8=;
 b=WN2e15nc+ALLp/om39XpDHOwGU1k4J+rWuKHd3cETrP2vLCZixQOlNG8oL1UzRJlVoC0rTMMqFN6GLi1YWPupjAmEonuv+aZ2EjQ6BtsE/d/MU1CflOuwQQQ4awjeDirZBtPb6wicm41nhlaf3f0kxvnvgeYTVy5YOWLiC59m0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DBBPR04MB7529.eurprd04.prod.outlook.com (2603:10a6:10:208::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.46; Tue, 13 Jun 2023 08:31:31 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 08:31:31 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v4 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema format
Date:   Tue, 13 Jun 2023 16:34:44 +0800
Message-Id: <20230613083445.1129137-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:3:18::14) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DBBPR04MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 969e06c3-1b3e-46df-c7ce-08db6be896e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OIOgHhVMjne2mpsqiJYgMczq8Vdll1TC/JVKMDoe6sloOWoPKxVoy4U8Hoh6YebUtevDlL3gg+hMT8aXvy31ZovlKvOb/66MfzFj0dxGmfzKJZs9aPKEKzGz2dqfTH+qdczTmbgKWMMA+TNVyhH4i0fJJNnX0pZtfC8jBASaLD7IxwQeed7a1PA5TKDJPD0WMnDHgYK9jPpXEn8DdGkX0tFP6V8SWt/wr/nEYL44Y5XA+E5EKQs6PX6Dpk1eM9EHiizND6FovB3Epz8ZU6vakDwdRN8cPZadgm6IAIW7jcYCYv+uy9ZxskJBr++f8NkESZKTkEBdelol+V9mSOedkMomqIGDwfPmOC8YpuGM3PciRrgz4IU0SQg9UYEFSXx1cd8ob9m5rzDIsUwneZfiF7XiXYjCXFQakuyVXy9mvM2URpjmPOy/jbUbvbyoyS+epwY2F2gg6RkgTRk8AwKSvqdTA5+nyV2yLDonZwbTSE1g+rwJx8+/aomldNgqbn2Pe8FuHZKrZR1BiA2U1PQeQiw7OFuhFhTUKQxf3/ALON75JSWihNXndVfbEAVRvVv7IpsuWGkM3ecZvG4Vuqnc8jghzyD7D5p0wn92o9JS6C+/iHxD+X7pOhQWB83zqgnH9lc+DyLez00b482Q4rSvoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(83380400001)(66946007)(26005)(6512007)(6506007)(6666004)(6486002)(1076003)(52116002)(966005)(186003)(2616005)(7416002)(478600001)(2906002)(8936002)(8676002)(66556008)(86362001)(5660300002)(36756003)(4326008)(41300700001)(38350700002)(38100700002)(316002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ECrgp2Hfxp0dx39kcEzIshJPkS9S0sYKcOOamfqwMmkVXPv/slbWn25rbd8W?=
 =?us-ascii?Q?RwT55vfQvZQjgQQKGTDR5MRzxtXWw6n7ra0RI7QVQuMz3jOi6D2JeBKNqqWT?=
 =?us-ascii?Q?fFdjRAgeu4Hrzn+nz0lcnlls69XZgfjwWV3REjO9FOZZ5ziHr2/QWp3Wzgzh?=
 =?us-ascii?Q?wSyAwFX4d4qisewM4xcnvfGt5hw7Gh9m/7qFVETTWXahIfhwhPeRrUAp68/U?=
 =?us-ascii?Q?PE3yg1qFu1Rf37ShRsMGGhIK426EzJSA+8ZC47q+khi0QJvAI4SRGbYnrr/m?=
 =?us-ascii?Q?Qb/t2T7aQZuQUobD0EL4ba9kgBgbKVLpHeYFYK5OUwuHzjQxlpHJtuqBjuZG?=
 =?us-ascii?Q?DUwMfRflhukzs1afLsz8Fsctzgu2CE64U4YxcoeDqZBU34xpaj0O8ocJJtqT?=
 =?us-ascii?Q?kJ46wCvTtfww6gT0SX4oeudquPROzZWhgn9cnSR5o2Dwp7I+Q8aSgJxlWfMV?=
 =?us-ascii?Q?Ws1D8kLmL/id2SdXRLgOpd7hlbizQSaqtn4WNym97ryQshWuzbH+pD8VN+8D?=
 =?us-ascii?Q?3KofkJKRuwU2Uu6ujWfGq3Ej9y6Vcre1x8IlO2zXKGCLk23FT17VODWEv+aW?=
 =?us-ascii?Q?C1zJJ7b75LU0/4XBbh1JW8fIR2RCGlugEvx24nZzJbYAKltTGK5exKGAemd/?=
 =?us-ascii?Q?fwULU/Gsjp4yDlRn9P5nqzIOP4i84kkKI93Fx3CfhTeLfdsBXXpiuYK1ogzM?=
 =?us-ascii?Q?PRPK/ye6yBhYTcbkCtH42sN1G5zSJHSuU/iZoipTF7RwBQ2AepLvkTr8QzFB?=
 =?us-ascii?Q?qhaqU2AJXthzARXGaPORZtr0mAMRhgeFwtDdwA0VNSSr0LGCbtkyqOOKvKmr?=
 =?us-ascii?Q?kqkQ7W1MbqMBTuSUTu7CvFqLnHS7FiBN+1+rAtSPSUIqe05WxSvQ9vwPvZ7e?=
 =?us-ascii?Q?3Z0acSv+Ca7LuMBKVFtwGLU3PKgaEqK8ZbCmf7+29WJbrMYhUpxAvWVHTgzc?=
 =?us-ascii?Q?raGSp1bTN+qUppJboNvNbXrkpsvu1L8CrAGlM6qOxMHv4xdTH4fKt1IVFjNS?=
 =?us-ascii?Q?yWhP+l/wuoY44wb1zGkNWbU80MvfjSleZ3SSTicibr6JD2wMM/edQcGilIfP?=
 =?us-ascii?Q?m8aRj6GXB5qOkKDC+vORu4ezaWlA3eheztQw/nr5+9BgBt/fn3UY3suNgsMS?=
 =?us-ascii?Q?hTyv4CvvZVmL9qYUcltVDema5qsTGeWEVEy1ABV0v8OfgvlzqINi7LjcDgCW?=
 =?us-ascii?Q?IP8nTjtan723KAt4S0bEoiZzkbLtME7ew+DJQrBFgaYoO3ZdHeAe0NWMQijL?=
 =?us-ascii?Q?EoE+ezHcCwcpT/L7GIRZTitPbsFdMrA91jp/L02GV6HRhXqQbRbj43vN6Zww?=
 =?us-ascii?Q?IoSoKeAKa6Q1a8vBLnKKh955Sgv/kzOz3VzPgOKIxpAJ5V3+3v+CxMEe7lhx?=
 =?us-ascii?Q?7Mq/nZRMO1gTw2qK2THZEbmmCWDAaXphZtAi2O/aaYqCxBPPWKZXlEA6u5ZQ?=
 =?us-ascii?Q?HuDz8R03lz8Okt8Xy+tanYDi6HgglacHh9n6AZNQuYViVq6asuZQhg+KIvLR?=
 =?us-ascii?Q?25xAKdqcLZMYXDDRXYL5lBqnz91GItAfey5GMMXe4CxrT/EQS9gc6LuGuQ1i?=
 =?us-ascii?Q?cIRZhAMl0vx+dLqDHxbK06sRs1gaIXxOx2Qt8Pko?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969e06c3-1b3e-46df-c7ce-08db6be896e1
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 08:31:31.2481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlAADNqyKRB0HPS4X3uyKxGJ1m3rtTSndjlFHg0p5iWIZwk/7i9R+7z01LF/PTC5hUs2N5rwklt5zUCcc5j0pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7529
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Convert the binding to DT schema format. Besides, this also add clocks,
'#phy-cells', phy-3p0-supply and power-domains properties which are not
contained in txt file due to txt file lack updates.

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
Changes in v4:
 - remove [fsl,imx7ulp-usbphy, fsl,imx6ul-usbphy]
 - limit item of reg and interrupts to 1
 - sort enum items
 - modify commit message
---
 .../bindings/phy/fsl,mxs-usbphy.yaml          | 125 ++++++++++++++++++
 .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
 2 files changed, 125 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
new file mode 100644
index 000000000000..cc9f2bc7e6fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
@@ -0,0 +1,125 @@
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
+          - fsl,imx7ulp-usbphy
+          - fsl,vf610-usbphy
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
+          - const: fsl,imx8dxl-usbphy
+          - const: fsl,imx7ulp-usbphy
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+                - fsl,imx6q-usbphy
+                - fsl,imx6sl-usbphy
+                - fsl,imx6sx-usbphy
+                - fsl,imx6sll-usbphy
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

