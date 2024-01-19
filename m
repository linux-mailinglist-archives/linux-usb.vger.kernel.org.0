Return-Path: <linux-usb+bounces-5254-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D63328324ED
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 08:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37B4BB2176D
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 07:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BF2D518;
	Fri, 19 Jan 2024 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="rg7WyPUs"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2087.outbound.protection.outlook.com [40.107.13.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C006FB1;
	Fri, 19 Jan 2024 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705648428; cv=fail; b=BjBMdHeQPgPKVaMV1J2716ujhy5YETciXZBS/cRBB5q7WhrADMWmDd7bXZdjqWVFyVSXYr150jiHLJQwwA2HryQhBwlgT/d/co+5CkhXSZABXS6jgCzUWF+anlPAmSXkQho74Wvc6VHdFyeaJzR81XWvknl3b/qpxKddIA9qmsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705648428; c=relaxed/simple;
	bh=o8xaxSqB1CJzC36eWJl+rxElj6oclh46CzvhQ+1FdUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SZq33MA1a03wgwabe2B/mZrxyE9GS5B9VssXLE320KIMKRu+yX+zpTbiiWD19U0Ew5agjR1GHl+dIaHKIT5tr+26tczQMhDYJEG9iF9wA5ZEJBZxMKLP0ceYYLcSR4mEwqB7iNObIjEgj7KRAzXgtT+KRULJ2M2pf6EJQJyhUOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=rg7WyPUs; arc=fail smtp.client-ip=40.107.13.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnyHJkhRrSpuHPnFwrDXXVjFKv16rJKEftza8DQFEvNE1WR3egkE+ADVf4xjQzyU04CErpPhtom5uR0drkgSvMAgnBAkMD4oXcEbEOReCy0dxNB9dpeHseiEYEpvAt3sNdq3g9763o8QTdiwog9QSmwwmPCHSFYahDQZmJ1O1b3L/zpW7Omqcc/2tbjnkNnN4QjXDVhbZNzi2gRKNLt7J7/C6mr6qrd3ssSl5lKAv5wmRXy2hN9liGq6WcdTStTes+/L7ycuLeLHZErKTuvL4i/Mv9CiCC7EKbc4nwX6az7jfQcVVt7BX1XXfViQIzVhmiXD82KQmXBRM4I+JYEcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9JAVRhV/LIvNuqU/Syq01QSEzHk5yIR5SsMmudWLX0=;
 b=CwzdJYaXGfCiwfrF6mTXqqg7vMum78I4v35DP2jhvs0k2vOKaatc3P/ZrDLFwa7MRnhcAgEbH1pjCRHAV1yySMLjJJRguzAFu5KH799e6HAj4+lGs2NFR7buwj3eQ3iZsXScfN0rI4GLYhskG7Wl5BkvEvI7I/IaWpT80vqauPtBQt2T6z0CRsORc5miAoSfWuxYyspKMARbnz/PtQ5KxheMW6v6W+a45702c4BP6zwThWduYrKGCNS9GLeQ4F1bn8bZLDZVKfc4ppDI3HXym49OsuPF/yzf1jTYIkP1QCRjNILORUfn/s3oJEqS6g5k34qj9sHDA5HEmeiWksi0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9JAVRhV/LIvNuqU/Syq01QSEzHk5yIR5SsMmudWLX0=;
 b=rg7WyPUspGPPiYi3c7J0M73xiluBPSefjdn1CDlBH13Sovf9/AzZSHFtFuw2jugFMGl4zvQKKJr61+p2D1oaSJOReHNT/JOXaLUWxQMPjh8ucoul9wOY9LjBD95dT7CuLyMyKouIDGUTRWfS8y/0H8lMkDkamxb4HJ+R/Rp1hRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 07:13:43 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 07:13:43 +0000
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
Subject: [PATCH v4 7/7] arm64: dts: imx93-11x11-evk: enable usb and typec nodes
Date: Fri, 19 Jan 2024 15:19:36 +0800
Message-Id: <20240119071936.3481439-7-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119071936.3481439-1-xu.yang_2@nxp.com>
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 08423638-abab-4c47-b892-08dc18be2bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3wU+BGAUu85+dG5K13eHkSApXt+WSVY2elYnCm8BcKCwdW983PHn9p0VEpTv6XO6KlLo/sTV0Feft6FNoUFO/n+dpCpjrRLzexX69jREObi08eChkCHtIW3JHo4sEJbLrk2Dtn8TCrSdeb+PcBEXNrGSjVlwQRAV2KOYRccQdOugBq0VW10Uebqqbgb7XaI7ONs1UNZFyGpQV9RMOu54cNBh22mGv77SjMWDCSxeJfFVNni2HAKtunan6/XgD9F+vFEvdafM9lbzNl9AeSP5SDolBJYPYbW34Xr1CcWNHucj7NqVSYhzxEXfhbt16XSTakZnv/mOBUqcr3AkhPRfXRqoHP02w5K63qXYGBYYCHbb6PguXpKEFxooQrPKtdwlZ0xqJ5QKsbBIPMcZRbfUkmgQApgB8iGU93btCpIlacdSKqe8WC8Ok1KWV+DgEA3nimG+lxNqX38lUJitBvErkaY8XiMEILuvLajS4UWQHaZr1QvGxaPvD39UziKebLcGHVMkfMzQN8oruPoVwO8x4Xu7qmiL7qX8n1L/8kKimWOXyGtTqBA4eg0qkWeXwix0riMtW3Jw0yEsZVQicD2o06Mc7LwWAurZZTqVj7X2w3z847tD+l7TqSjPfmD+NtO1jTdiBhVAB/nbC2yzcRiCuAmx2WKJcSLC5tIAxXTj94A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(26005)(6512007)(83380400001)(86362001)(36756003)(38350700005)(4326008)(8676002)(5660300002)(8936002)(6486002)(7416002)(52116002)(2616005)(6506007)(1076003)(38100700002)(66946007)(66556008)(316002)(2906002)(66476007)(6666004)(478600001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v2XKOJC+922bRU6F0fYJ5IZyuNCyPRLxvUhj8onCWJsRIPbVFYtts8Hygjf8?=
 =?us-ascii?Q?lCHuDfin7o6cWefPJILgGUhaKelbpxjDn2CKyBx4zlnmJjBTwG0sELBT5OaP?=
 =?us-ascii?Q?ZAQm3NltyarwUOnCXAkUKZ6AixoGro80DsHSxQhvTAjpWkk51l5vmgXMUkKi?=
 =?us-ascii?Q?a7qMvp1Kv2ao6CS5MiOr8vIfcmKUa6PgIQeblTECzm9u3McYF1fERDHU6NOW?=
 =?us-ascii?Q?Efm6Gs47uFbk7daDtrwYjdQix0pQHCYDPZFIi80uxbwMe99ZzCXbpqO8tDV6?=
 =?us-ascii?Q?U5c2Cqv+Cmfr8e+I4/KsrYt+QvPy4n3/YI26wlaoTK2IhArXDVTVbcM9Nh13?=
 =?us-ascii?Q?xoKlLrAuWcu5IKgHw7xgj6XD4ru805NH9N17fCqvL8K0vJN3HJ+SeOoAa8NP?=
 =?us-ascii?Q?ldQkWMjU0jJnO9s4JvHWAhhsFt8Nvm1Hd9wv5lexBJBw9Ia5ctUcEc311b57?=
 =?us-ascii?Q?IFV3FGqBTRFQpDkWCUonhkoVZQDSn08ICYXJkVyymqg1Bo8t3V1ugVjPAWFu?=
 =?us-ascii?Q?SPWhvsvqaRukADAkWUyyd4kkXzTCc6e+nmoDnm8BKFMSzaXFPnSxnoIMVPgG?=
 =?us-ascii?Q?wQTQGV4MGh4HuoRz4saTD1c1jKHwGjox9o8rnrXMcG5RFQsRWDEsno65rWID?=
 =?us-ascii?Q?K9iyn4eVoErYR64yKcuj/SO01SFSgCPKbLRdNa4U6sIsGsZyfPcFmoy9FKo9?=
 =?us-ascii?Q?AcWRAZuclIZ0Cs8+dOxAH2rYdRjWMEIPmSeS5iDofEFVqlalhWMzIJtDxzk7?=
 =?us-ascii?Q?MKdrVQMppvl+YXqBW1Gma5/gx8OaDNqQ3W7BdZvhzO9fXVWmaM4kAFm+iQpj?=
 =?us-ascii?Q?MN0PmhghTO60SvCBxoPnbRN55k29xKQnsAcr1hUzRrmg0FK9F36Bao6Q3+6f?=
 =?us-ascii?Q?lCjA103W7Hdo2Hi/AHV8gw7FaRilogycDBhlEGYJZPQfbUEsXKnlFQk7F2up?=
 =?us-ascii?Q?2dXSgO0e52vI+14ypW2ZpS29vKSV27JoD7dUOHGoAN5BokcHORSNWxjDlV7L?=
 =?us-ascii?Q?K3jQotILNl76AYlpA7nDjlwwpB4pV9SLB19BzRWlWfq8QtwvmHJO94bHb8jK?=
 =?us-ascii?Q?id3MvombfHOTyAiR3BA12BoMc7lV7a+ZZcRSqDaI6pq2K6YE7PLkrS8XCIR4?=
 =?us-ascii?Q?f09QB1314Gj0AwwSEbLYww0wqCtltIOtRrvVjq3V3bGs3iL/3OyXKetavoi5?=
 =?us-ascii?Q?ojVkUfgiYobZ07PmkBe4RieA8ka8xqE797FoUOl0jrRKa8JCnZvAWKe4OBXy?=
 =?us-ascii?Q?lcwELFvyOHuwVQeRKZ5vhJK9Zjp+AHwAhNeBRJmxPHssAUDcbF3Kjp2SBmWr?=
 =?us-ascii?Q?bHb1uyXxK89z1wKXiSchbkUaaglRWNx2eynYAx9nQug3Cmfj7mN9TSodhta4?=
 =?us-ascii?Q?/XHwOM0cobjTx26ZvfPHaq1MY2T5cNjq1J2vPqLY85a1jBnxRuMqJSyjoyAj?=
 =?us-ascii?Q?50XsCr7ePflAc0nY42a94isDuCBF+Zys1fwFBn1CDviz7j5n5Izk5kx3wUq/?=
 =?us-ascii?Q?Jc8OESX2w8pBFvc+RMRX0o246Z+urqN3Q/w0sTSL52986SUGqF4PgyQKltD2?=
 =?us-ascii?Q?VWMAUmPF7ecolfVTk5ZOC/Z0mL+78uPAxziF6/ts?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08423638-abab-4c47-b892-08dc18be2bc0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:13:43.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxF4sjdB++FrBJZc0PXzJu28ynJQKbR1sfPWNcOvgWGGspfLfb5z29xbChcK/LvLU0LYWjLLtKNgq8WVkst9ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

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


