Return-Path: <linux-usb+bounces-4304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209C8168A5
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 09:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94C40B223CB
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 08:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7C610977;
	Mon, 18 Dec 2023 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="s0N8ddIr"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2048.outbound.protection.outlook.com [40.107.105.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAAE1118B;
	Mon, 18 Dec 2023 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv0XIdZZ9E7efNGeU1S1gvr6DBIngyEOnOR8KzdmxHNWpyvgjg7kSUkmOrXejX4q+LPgdmNOZhFTl6txoko2D8FKiVt21Cp7UPx6idXWmQ6Jn2+6pf9nXPu0Z4A1mYQy6mL8wQ7rySgTcmLqkMU8rTiiETnECN7hQEAnsyytMRIlczg4JJN15bmYMS+JdUtxf9iSTcBpUQjxrcqzYNh0m3p5uQjQQqPCPWkVLbQR05D6a6C8ipL57wNlYG2ucGgq0NItKPr9q9lmYLSvf1nGhFqIjQFgwZwXVGWwA9Ny2az1CG5c1ZIQ0SYM1gSvnvHBoaiAZTj2QAAuIcboph/0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiBePQfElWtMmiU6rcmDdrc0VjXl6pR1IFiJB5RCGcU=;
 b=cwUPuEmCfXDqPGGJ8m8UzOus79k4OxHRHoZVfFf6E651jqvcXIhVdU13Ai0jWwsdTm8AgZCHrMD51mUeh0nOa3Grwgm1gPgwp0BS2KIsIsaDDoVW2ujnG9oJKVq/aScSEHTF4qVvmAWML7sq1eU+eG5jSR9uyao0/ePkpudYHqxV0t/K5hInqm5R+JunXVgZLBEHXc/qE4X7X4ixQ7N9CgDV9nM7TXouZAYybJtF0Ig8ZrQqaR7Tb8AvYtkPX3cy/s6umk9LsL+P/m4NikPjMog5MdjLsmBoN701uBwxprtHJFr3ShG7UJSALEY9RLJZqxLDzlgLYg+lb2qLJOD6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiBePQfElWtMmiU6rcmDdrc0VjXl6pR1IFiJB5RCGcU=;
 b=s0N8ddIr9odS4KajfxvcLHJR6imsl9V17uFG2ycjJX+0KAF3TkOJwGRJOypSnG1ZrlN5Oo3JYyYMVLoIUDZlndSKceUNNg057GGszgM6ojREIbDYf71YzTFuSGjsRMxHqtfNQacVg/fxf4v/lYOh+y9/Btr170UWEPogQVnDJww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 08:49:23 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:49:23 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: imx93-11x11-evk: enable usb and typec nodes
Date: Mon, 18 Dec 2023 16:54:56 +0800
Message-Id: <20231218085456.3962720-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218085456.3962720-1-xu.yang_2@nxp.com>
References: <20231218085456.3962720-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To DB7PR04MB5146.eurprd04.prod.outlook.com
 (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 454d1b41-bd87-401c-40da-08dbffa63b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	603TQZKcuF/0HoBFT9hYHLL67I//aH8bqkFRGP20YKEr+2ZPS0Y1S9S6H4Nzq+pvIJjYNhQIXaET+hgZfJOPSWpi3JZ/C35lZuyJOZwGDNcMYtvijKkL25mZ5BiIbDXem0FN36CppqBnAD8vkxs5i953544XpJOj8khFJZezRDNOX37AzRCewIRn5AsR02emOKHEyR9vGhYqkTGi4Iyh69EqJYspLjJCk6B4+iJ+5HltPxvIvQiE6m4DLIucheyMMbXhzpOpa+3cPxEae8dnnIZ8syY+/lJUNFIREVC6fsaQBCtbz/KWt3Il86wNEDBeUCFgxjUiredG82i8PoMPJtWh68BiJB2M3e/IfdheHM3+y82xXi9kpd99Aoze9Rv+zVFObAwS6Cix2kyPm1Rv6Xa743uI5KgD9n/+g0ufS0tiorQE2jf8tC2eFStY2QvcwDV1kET8X/EA4RefLqO3UHVqaAUbP073G7qq32tvyD7gGOXNBZuSFfFrYRP4X1Hhz7+ELc7TiI+toolLgt/hvbJsITDWUrf1VtcWB/I3joG9yYCHXQOVczmZta6LrxM4cw3fqSdcrdDap0fVraaCMtWYTgKag88mxASijNs9SB+711JKYZg3b2wxwO6w+gKAZJ5U+9RJ+WaRnTVjjscnZ3NgIjuAaxSQelPprxguFk/1l9t2o6opATPWo8hf6QZi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(1800799012)(186009)(451199024)(64100799003)(6486002)(6666004)(8936002)(8676002)(4326008)(1076003)(26005)(2616005)(478600001)(86362001)(83380400001)(6512007)(52116002)(66476007)(316002)(66556008)(66946007)(5660300002)(6506007)(38100700002)(7416002)(36756003)(38350700005)(41300700001)(2906002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?htDPQosi4CRb+scJZAiaeR/kX14grlK6qStPXgkmCEv5Zl4FiH+3jHCyGSfV?=
 =?us-ascii?Q?N/k3jFCiet4SjU1RUWe+gUV8KrwxK3gZAAKibjoJKo4rzs1R541Hh14Tnj/4?=
 =?us-ascii?Q?6CxpI9ScGqdNoPWlyAfnnZyVAH1bmNWnOUBWVZR/B6w+XrXd6Xfaz2XZLKkq?=
 =?us-ascii?Q?B9NZlltWlcN0rO6eWmk++IAr8quL7CQlzUFhlrpNvE15fjltRA+fjAkgofb9?=
 =?us-ascii?Q?zQqOwzGzyUkOqmhpShQW5AtwHN7yCq/7xXEsaVWbfFaAdUKCe5PrEhsow/+p?=
 =?us-ascii?Q?9phkimtjG88mrfPcYen9CU9nVn+v7d5ezaeWMICkTELwTLSaDEzHjWxUcmFu?=
 =?us-ascii?Q?pDlBHjpJJSBnCx/bMQBAtVgggR5T0v9ZzKU/0nafVXpkYbYXfFJd3HpjVJMp?=
 =?us-ascii?Q?FJZyRIVPkRwv61dTHkS1QMnk8p7Q7t4FzTNSmUKMhQeqKbsd2IFYZdzglFmv?=
 =?us-ascii?Q?JqHKlZbZFMx9zHlH0zOvvXIWp5AFxBclfUNb9zrBxbYqEzx2z28gAqmETXEM?=
 =?us-ascii?Q?xuBxdWVdh0dC3Y/w16d8tlVt3URZ9VgDIpOcHHcQxvl7D1BzbsiueqQjlctv?=
 =?us-ascii?Q?yjr2Qs7YHcqbgpSv9MugFcNdIiFQxOYNK1Xc0PoRVfvEvw529FzNoCQRYe3O?=
 =?us-ascii?Q?RslT8aCiWLWsFJ/GgTLMtmiFQMtxuAImJyWgmmiYRevXu90SFPW+NNoOBSh+?=
 =?us-ascii?Q?ALBv4h+iynpm0PkZUq0qPDHLCLVrPjWpuoNNBIN3Nfec38vmf8jBcHgb6D9G?=
 =?us-ascii?Q?XnwMNJNhcd6kWjUux+8xy0VaeOvRQVHx6QJ6jOCba273H7zc6wrZpPyLW7Fx?=
 =?us-ascii?Q?CaYKzizGvqwPpYwovr6+221Kf24tYYr4uljp0oursEOeBG1c5/u+sEpVXKsE?=
 =?us-ascii?Q?Qp8VDSLhchJphS5difyHa6HdMa1k+cxEVagBUVmZPEfs0an4awy2TlKr3CPj?=
 =?us-ascii?Q?D+b2M/+rj4LSHUB/bmqjHjQ4ubFJ5GiFyKHQFI3OvDbvIYZgdUVx4ardEZ4g?=
 =?us-ascii?Q?G//7JiX4gCUHcEvCAuzzDkWWnrCagKy/lcGWXCPix9E5JcQ73TrQpDdLTO5P?=
 =?us-ascii?Q?Sr0svmyQtXmLBGvJl3DKqc5Rcmh+dOoUkjXzmUitDmLhKHA2AQH4Xu65A+Pn?=
 =?us-ascii?Q?iCb3BHtFlmVkZ+qR2igzJk++0gNUXmRsCQvi3ZJLsoYL2hqw/r/W5BXGoQzC?=
 =?us-ascii?Q?7ajdaLian9SyLltLSi32DyxmMXQqb4ozqz2zhPSJVQdxw+m+r75XPgBppNNm?=
 =?us-ascii?Q?Q5Vc0X2R/EvGyz87Jgn2YQoMj0cNSL0IjWwXlwsp+laoiLkXN1UnhtTOfLqG?=
 =?us-ascii?Q?waTo7cZmP2luhGio2fsGICSB+TVQQ6OfoGnhWp//nFcHO6WJ1ZWUXqeGEjkk?=
 =?us-ascii?Q?eQ75o6GUXHQrIzT2+RR5MIqoT+1Ug2wTUEWlcb750cJL7VDw9jBMIpkOWKv5?=
 =?us-ascii?Q?eothrnGqDAOhnz3lc1tU5VettlSladax1GWrscsxHXFWXX3u4M/RUwxVfTKA?=
 =?us-ascii?Q?Aa4Vdrl9LyeU1J9jeZSYrooEKBzyQOwoEwnfCkn/YcOREV4BGUEtpVNzozna?=
 =?us-ascii?Q?fTMoaoY38EIV//nzMPxFkqMzTuXJOyqr+6/w1EYL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454d1b41-bd87-401c-40da-08dbffa63b66
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 08:49:23.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kg67pxiHSZlEDszwnr72qTVqSDqa4RLzjM6Eyu3zhjsjZXh4MPHorg/qwYBQmZ0I0HQBiwuG1O6E4m6Zu9WMjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803

There are 2 Type-C ports and 2 USB controllers on i.MX93. Enable them.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - remove status property in ptn5110 nodes
 - fix dt-schema warnings
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 2b9d47716f75..87c7cfacdc7b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
 
 / {
@@ -103,6 +104,80 @@ &mu2 {
 	status = "okay";
 };
 
+&lpi2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3>;
+	status = "okay";
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110";
+		reg = <0x50>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+		typec1_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					typec1_dr_sw: endpoint {
+						remote-endpoint = <&usb1_drd_sw>;
+					};
+				};
+			};
+		};
+	};
+
+	ptn5110_2: tcpc@51 {
+		compatible = "nxp,ptn5110";
+		reg = <0x51>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+		typec2_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					typec2_dr_sw: endpoint {
+						remote-endpoint = <&usb2_drd_sw>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -155,6 +230,42 @@ &lpuart5 {
 	status = "okay";
 };
 
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usbotg2 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb2_drd_sw: endpoint {
+			remote-endpoint = <&typec2_dr_sw>;
+		};
+	};
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -221,6 +332,13 @@ MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
 		>;
 	};
 
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.34.1


