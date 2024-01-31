Return-Path: <linux-usb+bounces-5700-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A8843E90
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 12:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FFDD1C258D0
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 11:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50D278669;
	Wed, 31 Jan 2024 11:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="dTaV1mrp"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731E778662;
	Wed, 31 Jan 2024 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701048; cv=fail; b=UsBVqmHvGmLvKjHV8PQYT8VVKnaLcbJN2MXvsyztWyXuj9w+K+GLtWmURgvd6DEfvkdO3SJhbDWVbv9DDf9DjuvLG7ZaktfRwNpgjLqdobOKYL4k8o18xLOERzpyeSzCeWo2zVK3kAvtdstoyfahO/RqmukYZAGyCbB0LvZRsW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701048; c=relaxed/simple;
	bh=OZJ2CKCA96+Qrjkb2eZ4Serm0Q3/H70gK6ojeWysv90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bpVtaU10wEv2iYOjDqkM9GuO/3ZW8Nq1/3PPmPV+JH5ApVkcBJFUEnV99dbROzMDIwc1U5JCUn4t6cPEbyckrvp0zvU1zl64kHX7tnv953igh7s5YuQvlNmG7x6t7ERS8cVvOP5W0Az38d5jeU9XdZFjps3XwmSILoY6KuNveyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=dTaV1mrp; arc=fail smtp.client-ip=40.107.20.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8U4PXImH3fWIGEmE1unZ12MVuhVsD+JQp8S6x1d+Mi30FOotq2ynJZwwHeq8UX4YQIQbPYBEt8X+L/jGy8Emq6qMxor4NN1r5wNWYtOfStFpkB3LZDzM6bj5btbil/EGfnRPmptTJG7tq9mQqueOCpH+YRMEDLw+LGyWS8hOHVvsroLinfH1xdQaZnzY1QPrwjsotbPCEA8AskmHw7kv3mb3nvmuC0uqXwvuapiRpUTMIGWINZdGrdfPiK0R4QMOoHIHOoKj25hes6zrIaZXmYU0YFQedHaQFTR9l/W0YQR2EAVtNnMKPYEMlryIA5avZVnFTe4DGujkeLBvfXdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3fua5JHIPgX7TOr8oHxphmfBOaRHZbt6wHzb+FxRLQ=;
 b=OJyNxIRR5vyAu3knnFnr4qgeBUpLTt7Q31eb2SEYz20oYatwtxisD3n22CGYJfSAjA3dIjUYZ3z3QyKX9Qnw2vpzvF5465lqTCI+H3c3tkeNcAHSgUpxebSWereXapxe3JaD44+SMP0VpGP4EQkv9EQ135RLUVCQBN8jt5tJ32Ut+WKCtxgpYEge/D6SVF96A/6xx3Roy357GyaniwrsUp1aVmzffz7XhMtlD2dMU1v8NWj8LmnxmHyUStv4YI1M7fhmcHBNdsT7gvoKJBigjwlH8dTf0RbBDFTPXzPlIemlwJms8h2JatkME7+GfSDcmgwUXTkMjNmBjo2BT7NWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3fua5JHIPgX7TOr8oHxphmfBOaRHZbt6wHzb+FxRLQ=;
 b=dTaV1mrpB7oqR24++adiAeLCeP0py0qFex2xyaQxhc390rFs4xmqLzeT+wkr7IdSZQW/FB4+gLwGiZKPUD4olfowgYlwBuWQpjk3XqqhYBF2K0mLexlVoBGdSjweD0XgEotj2e7GBbR04XOUw+7JaT1x76l1I8xhL9KjIXMHEcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 11:37:20 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 11:37:20 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-imx@nxp.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 7/8] arm64: dts: imx93-11x11-evk: enable usb and typec nodes
Date: Wed, 31 Jan 2024 19:43:23 +0800
Message-Id: <20240131114324.3722428-7-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131114324.3722428-1-xu.yang_2@nxp.com>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: d8918f8c-80dc-4fe9-9670-08dc2250fbf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UIc4feIpYlj6Ov7dq2wR9KqwPWNIE3usiH82GgEbqLxz+b0lkCUECLKzKFIgcGaquO8lTzSsvUcV7h9bGhx8AbPkJDQvMIHIGpwg82ZxjcBL2l+NN8OPedzUDpNl5F9uEOUMYHV8wf9RXoqMTxQ3UTJ5KL7cwD88wu8RIywJ9YfFUwU3NN/H678psRGk+A7rLbptYMN246mVSh152cv6AIKQRFlwkbVa95tkASBbhVmoGVodNIJePrtcmS00O4PLxuTDUtGkDUv+VXH+rntMLHNcfTuvUMpqFBtFRP6w7YDnAMB+TiIA4f8gAXdWRBeBj6GEMb5t4yqdulgkm3dkM5Urjppz/wyhCTVq17g1JfBMqJ1xQuBQcx4K2jid1GTYgpsOcOzw3z6DzDCYtlmb1ZKkHBjJ/Pz3JTjDSp9SAL2ylRpa4yIby8wrpaOkM3ZRuNeA7xwM/doJe60mmYIU5JEJmsudEvBn35A5QdPd/QurxOGgUKvlfgJ5EXX0JsPld2BOy6Tr3ng850nEdjBRtfDsPWbYelRvhFp388waXkqEcalNtxNKLyJmWLnQ4FUebHOZ6enhq8RuPrG0b/0a63UoYE2ObX2EvKgM/s112jyWVq8xsL0I5Az8qWRBL/N/34JYXk3CgBybH2ayARoZabY4QlPj1fUwleEzXbCjpUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(1076003)(2616005)(41300700001)(38350700005)(316002)(66476007)(66556008)(478600001)(36756003)(6512007)(52116002)(6506007)(83380400001)(6486002)(38100700002)(66946007)(5660300002)(8936002)(7416002)(2906002)(86362001)(8676002)(4326008)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OFueK/6A2q7w/IqUUVHt/yiYLvmAiWONlDjrnYYfG2T5RYRvWv0fvilT+lke?=
 =?us-ascii?Q?S+YTBKEN/lbvIwcC/N5/PKMDMgb8Zdx8+M3SLVYRuBuL6/R55gzaz6gNj4nk?=
 =?us-ascii?Q?DuFKfyq7qP3bOxFWhwjEnO198Erlow28lwIT0Qj/NRrwFbPPFnwHZowhwLgW?=
 =?us-ascii?Q?Sr5HK/gSQi5cL+5k36BFV1BHX3LnL9IS0MgfY8yvqZ+3rmJm12kUtyx3U+4/?=
 =?us-ascii?Q?RXU3QhcZ5c3Df478GkRMM2yo/PvHJEmN71GNXSsXXoEhdFtphtKskHTeO14J?=
 =?us-ascii?Q?0N3RcB/n3tWNpmfVkhejG/fXhIZr/Zqp9Q5OKT9XKDKQi6VQl4oyekheo2lW?=
 =?us-ascii?Q?ajzUktuMaD9twXrLlcKzqVY1+EmsjNbzf6b9CN6NlwtjemtH1ESXgu33Oew/?=
 =?us-ascii?Q?WpH+9Erckwi2+1YBNMybyivMq7n/5aBfw/Dr0YB0gaGldb1bLX9LqkjCNTJl?=
 =?us-ascii?Q?r0iapARt3fU2PLEwEZhCWTpjoLIESqX5BJq3D2DN7sYZJ1VO6AgMH8zVK0DU?=
 =?us-ascii?Q?QYr9V7msJqXcxKSXyUkC53E7fCzPHh38XRorhqeDGxlXj92QcQYUWj9PqkHs?=
 =?us-ascii?Q?lHCXoFV31VIHjElwP009cnakszvZth35wboGKVvqTkuUhzYoCp56IFg4fhAh?=
 =?us-ascii?Q?LXmwMyF4PKoBB9KPRpVrvO4HU+6cwiHVJ5Datl+hDC3fzKFLk+3LNPh2VDlG?=
 =?us-ascii?Q?J40mq4CQiqM1KwEQ1DLZ9XqcTCVH9mulrSChMMAL39iTboxh7HYdbmsrVv6Y?=
 =?us-ascii?Q?VADTA0MLNqAGZxCdO5RtsvnRYkCRnlcG8+xlYau0/o7vVennsjhSt2dU3Yom?=
 =?us-ascii?Q?Nh3V39OYfTvt7/omKOOKXjuYr7xUn2p2wi6/aT5P2gLNW8UJ/3PUFRQxa8q9?=
 =?us-ascii?Q?4Wh24s7uD7vY0PlD3nQuDEnONpPdGzoOFobeoE/xXpXQ9dXPu1ynoP49Fd9U?=
 =?us-ascii?Q?OUb4D7VRX7E3Y0ANW1vlud5rDTrhnpcIFIMTo2HSuqYMOWFRsXyeS0Snj1ba?=
 =?us-ascii?Q?FhhnpXZg8XNWFpqs938l7sNeB85U4QeCCtfZvCYQYxQiOxaFX1BCYACwEaZj?=
 =?us-ascii?Q?Bajq2FvYS6NypqsXX71WcbJj2oV+5PQghy64B5hkHqUwf4TK/9LuTmIecmJ4?=
 =?us-ascii?Q?Q0fP4UtSUNftWq9wRjPy2Lq0L/xC/nyiyEZn9EB1749WLZfSBwSW5CaFOKs/?=
 =?us-ascii?Q?A5+302oylTPjlC90gzrTkD6zfopyQhgc+VJDBZtdtxf4YtTJhwd2LLNX1Z2p?=
 =?us-ascii?Q?NZ25V1XbnOBQaQsbG9YU7E1+3m9o0xjqc7He6eFUHmX4vhQIbVm5UDrBM9E0?=
 =?us-ascii?Q?hagUM3qj9wi1EVNkvYEU6fwSSjV67aWgJCqvnOB+wbWQzuCybVmEs1HfiO4V?=
 =?us-ascii?Q?NeroIp9QQl5sbpQz8Gd3XGBlgQ7rY/jAuqA9kNDjlH1rfRNIr2wX4kLkwSUL?=
 =?us-ascii?Q?629Khnv+35LIQj8cGolfuReVHnTg/09PORb8uPbSot0RZ40eejtJMriFROrF?=
 =?us-ascii?Q?A8CqI80j46Su8/C2Gh6TfyBdBKyl/JIu3T7RRSY+xNliSas1warKvkR6hCoj?=
 =?us-ascii?Q?FDGTDTJ534VG0HQDYgVtxAT89i/GQvfDfeWVmOyz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8918f8c-80dc-4fe9-9670-08dc2250fbf1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:37:20.1594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjBRZk+/Ag2mjK/IqzC78BKWsGQALNzKu4Jn1YBOMYa5qRYLtYsr2NtpMFB57zslffLagCpmkkNUcTExn6Im/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

There are 2 Type-C ports and 2 USB controllers on i.MX93. Enable them.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - remove status property in ptn5110 nodes
 - fix dt-schema warnings
Changes in v3:
 - no changes
Changes in v4:
 - no changes
Changes in v5:
 - no changes
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 118 ++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 9921ea13ab48..ec4cb50445fc 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
 
 / {
@@ -104,6 +105,80 @@ &mu2 {
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
@@ -156,6 +231,42 @@ &lpuart5 {
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
@@ -222,6 +333,13 @@ MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
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


