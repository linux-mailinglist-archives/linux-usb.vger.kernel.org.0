Return-Path: <linux-usb+bounces-4957-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1307682BF11
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 12:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DCB6B24C69
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 11:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135AB6A00D;
	Fri, 12 Jan 2024 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Nub/A/9h"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2A67E66;
	Fri, 12 Jan 2024 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+THVR6WXiJMaP/UbBL3u0NVwZDx6xwmMuL6CebRLxOVutUT9RxjNpi9hdU1hwfTP1/+dPKVF+RbDu0jQb/pnCjNT1OvZDyItCCgGdiW35nqeWhc1RafPSuDEasb/RKC7mCeEVLAvmlFlurvmejhCJYP4l343CeHX7WrX3Cjzo63dNmkJoDatpmDH9LKVQL8Rgm3LORj98ilEP9deN8X1z+F5Hl2UrHGKRb8N3FKL+bQfFtUShRJ/YU9RB1U2ymW7zBRzr/Fsm+J63/9D+fZyRoYtNQp5cQtgXi9cTElAV3/xy+6Ql9DZ/k60BiKMgRM9gl34OJjIFOWPIIlIEIdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uos3BzBLBUtdmlkPucXiZvMvZ1Ekko7DwnJ0IgHzv4=;
 b=ReOwJACNjJrZwiOJHf5w4921Q7ihqXmT46/3Vw/5u1aDM0FwO2g6V83lmVwHLLW0ZdrikM5RYwl+Yx0bBs74Lme7i6/r0Ge/dl05BhTlIyOpRzCY9/0/vkU4ExPwB0jtu8J0pbNJ6uLE4JE+884EWJ6jjmizO9KFh8WWHD2ovrX4sacYiPilF+qe3ozAj3jOfY5WDutKmeKNfV7WhuI/+WEAilXKojU44itMSBo9u9sXXh12a4lc5TMuIjRPngaMoJn8E4HXpDi6YLoMLXco2160qGgDE7GhpYvMi5z1Ujs93/yf/t1e1g/RXAWRkvD1kCZNnQf4+1MZ+ZMAN/M+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uos3BzBLBUtdmlkPucXiZvMvZ1Ekko7DwnJ0IgHzv4=;
 b=Nub/A/9hXCoSyiGeQolLr8O4tXMGMgq/+IKkws9rJJUJBzt/CFuZXqXqtlqLIx4tFQqh4wVFa9f+/EUog1NSvV07NdqRxHuzc5vd9/FF5jJtgpV9UVmTaJ2XzTSzzNqpoLeoUqbVp+sun1LqHiTL27YeXa4DwGxGjlkOih1489A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB10010.eurprd04.prod.outlook.com (2603:10a6:10:4ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 11:11:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 11:11:58 +0000
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
Subject: [PATCH v3 6/6] arm64: dts: imx93-11x11-evk: enable usb and typec nodes
Date: Fri, 12 Jan 2024 19:17:47 +0800
Message-Id: <20240112111747.1250915-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112111747.1250915-1-xu.yang_2@nxp.com>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: 5641fe93-7e3a-45fe-61a8-08dc135f4b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rHACFMdQN91+faeP8gGXjMyodMmkNIPhaP8tiUkN731yDTm+EiYuv92yhp4PX2Zdhg5xchEMlB5pzr8lrQwGxmkegfLPioZTBUxOI4k2vxGHn3YPErH6lzpMyR2vhJVdqJuHO4m0tzGwnI+68Z5ND2uVdD6gHPQ5wDd2CGIfFUrfRjxQLRKZLvLzNA40+H6M25imPqxGqjM8+8cILhY4T5dniuxqaRYoALOtk8eUHS4MWnq14iM0M5o4sznZQOgvKXJu56V4RfxGFop+5FA6VeIcFt/PtkDIEEwZI5HcIDGlR1yDTuxb5vmInFj0LI+Qy/wroG9sGoQyThz00swch5ZOXDOp5o6tY5rFwBeTGVQ3T0zljALMpqwdZ/+AZ2kXRmL344HL4k+SBUNj+6OsrwtsCAwVU+fZoyE1Ypn4XT+Aj6YV8HbdBCCBMe6uKH7KpjevRWmjyBkNVNHyzChT0kxKiCl8Ec6zlm6ugzbwhUssQtD9cvtiodobgwc0Z455zV7HgtUNOoWIpzOFVKETli8uB/FZBwFSbKY4+Tv30arrJ6OIeLNH3Qt1o5Rvc7oTv484ZKw+4ZZa0Si8XT03SxaXmkCGo+vb1VZI9HfBYc8RcGPUv+UIXmhvBVp2pIEQxJG7A1EswBj/epLf13ZkQ7AfvRlKBW9vZ09Q9pWt2YI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230273577357003)(230922051799003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(38350700005)(83380400001)(26005)(478600001)(6512007)(1076003)(6666004)(5660300002)(8676002)(316002)(52116002)(6486002)(8936002)(66476007)(66946007)(66556008)(2616005)(7416002)(6506007)(2906002)(38100700002)(4326008)(86362001)(41300700001)(36756003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S+ZjRfB2EABN6YtVvLKeh4GWQ7zej2y1CbKTwLBjgq6H0JyqfU05FqsFdVSm?=
 =?us-ascii?Q?5XufpDbUCvPA930TootDfeMVsTsowxDEYPc6eB7PVkj2jn/JySKX6E2KztLf?=
 =?us-ascii?Q?jUtGsk9sMMYLNjGXovkwdnu+5Dia/9G3skbdOv7MPNg7tR71S1B3OcEZFE7L?=
 =?us-ascii?Q?MfAxPnW8cz3pdFuuad6hvhO6g9zJFyRUX5KnV1nm7nU/aJ5ADtAY+q/r/NXQ?=
 =?us-ascii?Q?UsOYKX8hi/QnhRmUm/BwLykOXOVE2j7fGd/CmcSMtLtrRWHUliBW9HUH6U4/?=
 =?us-ascii?Q?NEKplNmhYmGBBMnIROgmnz0mHY/900SdhfGLPdEp30dX+3XmCtVJ6Sc+Sk3m?=
 =?us-ascii?Q?MqLrbPGZ9ptFsYK4lUC3zHXVlBIAsVQLR52bySVcqV6G+d1C8NZ8ZjOBRG7E?=
 =?us-ascii?Q?XYyVNuQY9DPRC8QmPHdyJWlpoNrCjvi/UOXoh90AJTYBzbgcNZ2H2/RNly9n?=
 =?us-ascii?Q?tSzAkgaOC1Hlgn9QtkUeja1XcwPD/YwlkhttDNa6/aAbWTFHhhGz4keqdDIV?=
 =?us-ascii?Q?MwbCyMJU09xMVwswdY2nkRyr/Wr9Olp30RFVItAXxpVz+fXurJ/iJwdedH+A?=
 =?us-ascii?Q?byIwRybrB7DLUYHkOsqW8D3m2ws/Gc8Ec75vaaKLRIxSV8NlQ6BiHSkdm/GP?=
 =?us-ascii?Q?OTyfM4hTbjcB+5Tzdu4jt0t9Sg0MZH4mMr29QNh96s3T0agHc8H8SaZ1uL+0?=
 =?us-ascii?Q?ED/nxuD3Z/6T5++EV7il5+TszHbnoliu+iNCLgA9BhoMKq5d1qwqApxMtfaY?=
 =?us-ascii?Q?kAkhI4SUWKuRkkqhXwf8JE9jfC4Z7geLXC/JHE430tAIoY56Pzh7DQWjlofi?=
 =?us-ascii?Q?++D06obAipklvEGVKE3n6VQ0Y/UP2Utvm7GnQDE/7rREh5nZU7RDQR+EyYIt?=
 =?us-ascii?Q?ttxF8Hc8yyFjDIPVcjLvhrF1Kdyusd39L4USwt71mlu/bSo8t0YsZt83cwEK?=
 =?us-ascii?Q?i7m16E8M3kMCiDxorYNR08N845VAT258DIvmqnX5rAs/nXxEeRC7fWypVOLw?=
 =?us-ascii?Q?cTYK+1Ofsawxn5jewGoRZPRvVO5xrMy0v31HArMmUi+9FpdhFztVmckUrtIh?=
 =?us-ascii?Q?BNJah4I3PqNp2MdicxO7dMmZ+nxOCaKcmscKrTVoXt+Wd1Ok72M5psE0kkvB?=
 =?us-ascii?Q?lN8197F0MkFBy+fRv1mbvEhEwPgE7PSexcx1S5hvbYhlNt5w2WAuddrNIQ0k?=
 =?us-ascii?Q?XwZ/LW0KhD8cAMBflwH6+mcbjWgpl2Parud4cwOU4wqxJFRjOPSTUfZkc3Z+?=
 =?us-ascii?Q?DabWB94LjwJCYOLb6iA+7SiMvcj4KKnoMZdYnpfHT1Izi+xYJSL0eRVNdKal?=
 =?us-ascii?Q?Tmyt9QOyQIk4jMAFOjT7Lhjl7ZKyfrD5WrxMKZtLYU3rqjNHm4lzFUp7NUyF?=
 =?us-ascii?Q?xylIant5oIb/pMPMdFpsy2WLnjsLUH4keRoE/iv6kzO/ymQvB58AEi0Kr1Mu?=
 =?us-ascii?Q?Kyp3dFRCRw+IPaTZHK4a+7+TJKpD8pX50hzBPnYZBH7qCOtrGNLgvhBLBC9d?=
 =?us-ascii?Q?QFgHfwzJGWE0gjRuYJSmZ7eiYivadZ/ji4T7md2fhaGsdumFMkaCVfGc3vXP?=
 =?us-ascii?Q?bbe1mEfKe6gJ/it3qkcAJwrlVrd3V6RxsU31osTU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5641fe93-7e3a-45fe-61a8-08dc135f4b68
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 11:11:58.8879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9zr1nUgIzBjFZCE66My875cb+8fvzoAz/aj4y1a5K1Vih1scwQY+VghLGv9sQ4Vl7rnaIHvBosF7KjUoiqaEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10010

There are 2 Type-C ports and 2 USB controllers on i.MX93. Enable them.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - remove status property in ptn5110 nodes
 - fix dt-schema warnings
Changes in v3:
 - no changes
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


