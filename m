Return-Path: <linux-usb+bounces-4301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B881689F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 09:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9CBCB219ED
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 08:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7461097A;
	Mon, 18 Dec 2023 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ctqR+raa"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2058.outbound.protection.outlook.com [40.107.105.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F269010945;
	Mon, 18 Dec 2023 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgytHd1fnJxLNyCIcdXJr4LX0sJwcenJvk959lnfJgJVdxcsk7i3waQDkRXrDEIvzN53/LRR6xxKuRQaWNq3vKI8C1eB4KbS/3S0PROKtv52JdU/UqLRBS0606rLP3bpsEm7858HfsUSh8xQEXqZ+iSisw4r6NRd8OVbvx7bNfdrNi2ZMjotm+xzaRQ6zYTass8wLUZ2RqjPN+BjRsh+0Nd3DNEVGpM4P57EoU84Nmlry7oNzEKxPtciKBr0nD+mfNb77tK6NKZ3UmM8dQnJse1QQcE5IT1fpKVW4xI5I41Eb9I/4d12liuJwhaFyV5NA2CizFkvJkxsnTsIgRvvCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRrYZbH1/b1Im/s7G6R6eYdCwduO9PBuIxDPdz7B3Hc=;
 b=VthIwRAL6i1A3qgVwCgDpw7EeXGd8F5sdtygEHGH11ASD+VqEPFkeL6GAHwjkot7TU6R17e6tHA1Zczqaslm1mPQrtrCokNeNHJW/fFSOYtzytbZ5vyetnr7BTBqAIi/etGPyxpMjP5K+fXXNB704ymYmCQJT3tIPHgOTnPTeRnMsJ0pL6S/Y3dncidOI6wLbbnxgwetgkbc+cs7xTe65CzaNG0qAAQRRcHQTXksMXPutjn6FHmdc2rI8BkJmVSuYbOpwccCqGxOrQjWBfXP4UgZ0lEv3VMw8ulX9bbUc+czVyL9AxcQWrwYT44LbnNLo86vk2jgmGKvqHqZ4GCWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRrYZbH1/b1Im/s7G6R6eYdCwduO9PBuIxDPdz7B3Hc=;
 b=ctqR+raa0NYo/F5H5MR+erUImzCiSi1rX9I1UbRWT6vPBV2b+cUNrDo3/Tx25KrFE5mGAD5+ypU3gjrD6MkZNQUN6oPgUBloaFlLzqKrquR1eHajDjlF+3PhH1Fw//eifDSooI2t7ATYXy2fz+StZ3Us6mYRHBrKhgvuCKZ7Lvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 08:49:10 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:49:10 +0000
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
Subject: [PATCH v2 2/5] arm64: dts: imx8ulp-evk: enable usb nodes and add ptn5150 nodes
Date: Mon, 18 Dec 2023 16:54:53 +0800
Message-Id: <20231218085456.3962720-2-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7938dcd6-045d-40f2-6006-08dbffa633e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O6Uvz+6YUJNNt/DGOCATZQAjuMJSmV57LNRCKwJS/46M29PS5gGE5Uoeh5zQttr+d2d9ofy9FxpsQgePcDtf0ll10BimRiewOG6yd7DOPHZTi3OymSMRxWNeSnICBGrdVYwJdP3bZCnzrFhR3tXmvwM3jWwAIOJ6v9oFNTaRtv9RMA+h7YYkgrS6BxcHOFy6SRG+DMm9Ov8BIcU/3fdsZqWhLQcVVAevx7s9bUQesPgiZSIegc3gR1nbxYIEZTRDoM1Ba1GYRL2iWvaVdVP+3P0bC5NGBO8zDDPM38r+0fswMbQk072KBcqL7Col6C2LO6OUV7iOVEZ7FHiJx5nISCAWG45GbVJJOjcCLaSjDLbEcz+zqgEENOVu3oaGUGb8ISuwQ6Ly0it3BdV4imJbmHxpsUDyBgYqQQ/b5pBSlosBFw3jMBjUEA52Wzs+pF2y+3qd8okEXG+NNV0Yu+lcKXTwmqRiIDj780p8OpEkSX3wSX92KvfkK1whrVmF80wbJfhzElhPXFYaQ97o/gd3lBhkvCatKg4TwHNeLFK5ges9E1ka/Usetxu7Tpqz3lNts7iz0NWjEK2chtufy0FTrsDlEbvpS90WioqcHD1xLQsEM8dQXFfSOg1irHUXf7PAbPvr5zeRG1oR/i60W5bF9Dg/GxyTu25yIk6QWttp1M6XWmQ70X1pQR++VIJeyncI45WQe0NULR6fVVnIK8PX+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(6666004)(8936002)(8676002)(4326008)(1076003)(26005)(2616005)(478600001)(86362001)(83380400001)(6512007)(52116002)(66476007)(316002)(66556008)(66946007)(5660300002)(6506007)(38100700002)(7416002)(36756003)(38350700005)(41300700001)(2906002)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eBuzrFhnLl+0QnQZPEq8Ic/IYXyAsNC8QuaG3uZwUfbuy7/efN+sk8SbYjI/?=
 =?us-ascii?Q?2Y+dxjeuX7CNKXlb1FKuv6FkvHX1Q58lR2grcUJhwM1OskHT4qe6FNBbBeyU?=
 =?us-ascii?Q?EHSGh1e09H5VX5JILnLtnQffvAGYNXEmS0aLgpZ4Qa7c4EXxud0q9vBMGQNc?=
 =?us-ascii?Q?Z7uvWiVl+en8//8vjeUbzcbg6deXq8EYhGnTFlg0AXhjMnR0Avupb3WoxOIV?=
 =?us-ascii?Q?dZEt4OGzSf8NW1hVswNR02/fXWS2rBdyzJ+4IuuoDG3+9M6yVZ7WAwHR3vea?=
 =?us-ascii?Q?aBwP7rmlonl0dWyykM+b7SEP59KJ1BwXqDYcwuJvtogd4M6ipGs3DdXE2hII?=
 =?us-ascii?Q?+sWOl7YFgbD2NpSx3EVFcMEz1JMWYzFK4YPF2RQ56wEzveePWSOUNIxCoYhz?=
 =?us-ascii?Q?6bNHAoh/neKb4ptut2B4bXd8aogPf0/+0tsgftFXaF72WXFuEt2ZNa6RqFce?=
 =?us-ascii?Q?Na6QNw9dplkUPl73zyhMMZhKb3aFyeNK4677XgsOb2uqWmhvOHhvLqCNcl3d?=
 =?us-ascii?Q?Vo9yRpCL6KDofTuFxzbQSP/xMtwdKec92IG3M2TJ0+O5Y6Xdby3QWAcmK7YL?=
 =?us-ascii?Q?xsbSsv4/YaHegO03PZCPEehgQgZJYpWg78Gzoo+hnGesMSBVrgvhhAZ5tdKj?=
 =?us-ascii?Q?/ClTfzs7qk8Mtaajlkwr8FeEC311TbAT4X2xomBt9jdotI8kyRjOTBCasmab?=
 =?us-ascii?Q?/8ecP5Q8dhiKcnF1jVJ7T+aDkE6n98ibrK4QFfVxN5ca+cVxWTHIUsOowBSu?=
 =?us-ascii?Q?WdvRDaWsFWBrsIAEoIw9kElTZrwdkFl4+EXt89q18MZzfwMk3xQTzqWUiA+D?=
 =?us-ascii?Q?uM9Kr1lKqgUlUpveB8eQV4yEkKsjVsbRPQWKBQM5hdYH582JPgShEt0D3ucA?=
 =?us-ascii?Q?7hMecFNO8TESmmeyNw+WRShTpTSOa73ohX5a0LUcOj0JuzZWOgPjT/NW3hqv?=
 =?us-ascii?Q?qbVwpstue3WRyUt1j7Yab9G3Ne7p6E2xae5PMFMuiZSXaknocbZHcW86672y?=
 =?us-ascii?Q?frMZboQffR98yAge9zE+fI4mjO91XUpfjS0qhKuBH+mnfpUE7F1KcUH60NRd?=
 =?us-ascii?Q?Xpz6CvyPkKJzf84Q392OXnbN2SI+rlw3nitr4Ga5JSejAG1JBBbBx9pvEfEy?=
 =?us-ascii?Q?cFnjk0WbRpBL2Sn72GBFyY2diIKUtdm+vt1Mbt8WjjOro2OmbxcCbSSGgGdq?=
 =?us-ascii?Q?7eB4e1Pcq+i2ptiTNMN36KQMQ4a46hlbGuCo19lCmaMk35PU6VrcG4cTha5W?=
 =?us-ascii?Q?JkqbM9uN2use0v2W8pEiAcxogSdxEpBLH/1zkZysk4zQB/CJx2keQ8dM2EH0?=
 =?us-ascii?Q?vtWe9ynqKAguHTBPO0GwoLMJ33d0QdXaDHTv7Oc4T4sOihMzM/eL8pay9sbP?=
 =?us-ascii?Q?fM14L7eQP3LyyeA34yc5O1hMjjcVsedPcvFzHMFw3ZAv0M6eDR/2M6A/olxG?=
 =?us-ascii?Q?E3+ynz6BEJ+pUpvrD0tE9uNkZd7BezOS6fWvLfc1KA974dbg/6W+mVlnrPm+?=
 =?us-ascii?Q?S3ZtduXLeWo+vbqhPhsx1+Ude6iOPjDeIz0HwWaH0/kFMM+MNpfkqOEsgjzM?=
 =?us-ascii?Q?FKUMaktSEYxp/n3Ui/1JAZBfgD/keZvJG20Z1RXj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7938dcd6-045d-40f2-6006-08dbffa633e9
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 08:49:10.5840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87rOOjaA3rczNrmH6KPbo2Cj4PmBV9j2JQqG4czMo81qy1c4FmhK+vqOTKG3QU7SNEulRGWb3mSULaobgDiVFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803

Enable 2 USB nodes and add 2 PTN5150 nodes on i.MX8ULP evk board.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - fix format as suggusted by Fabio
 - add PTN5150 nodes
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 69dd8e31027c..bf418af31039 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -133,6 +133,64 @@ pcal6408: gpio@21 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	ptn5150_1: typec@1d {
+		compatible = "nxp,ptn5150";
+		reg = <0x1d>;
+		int-gpios = <&gpiof 3 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec1>;
+		status = "disabled";
+	};
+
+	ptn5150_2: typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		int-gpios = <&gpiof 5 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec2>;
+		status = "disabled";
+	};
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1>;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	over-current-active-low;
+	status = "okay";
+};
+
+&usbphy1 {
+	fsl,tx-d-cal = <110>;
+	status = "okay";
+};
+
+&usbmisc1 {
+	status = "okay";
+};
+
+&usbotg2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb2>;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	over-current-active-low;
+	status = "okay";
+};
+
+&usbphy2 {
+	fsl,tx-d-cal = <110>;
+	status = "okay";
+};
+
+&usbmisc2 {
+	status = "okay";
 };
 
 &usdhc0 {
@@ -224,6 +282,32 @@ MX8ULP_PAD_PTE13__LPI2C7_SDA	0x20
 		>;
 	};
 
+	pinctrl_typec1: typec1grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF3__PTF3           0x3
+		>;
+	};
+
+	pinctrl_typec2: typec2grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF5__PTF5           0x3
+		>;
+	};
+
+	pinctrl_usb1: usb1grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF2__USB0_ID	0x10003
+			MX8ULP_PAD_PTF4__USB0_OC	0x10003
+		>;
+	};
+
+	pinctrl_usb2: usb2grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTD23__USB1_ID	0x10003
+			MX8ULP_PAD_PTF6__USB1_OC	0x10003
+		>;
+	};
+
 	pinctrl_usdhc0: usdhc0grp {
 		fsl,pins = <
 			MX8ULP_PAD_PTD1__SDHC0_CMD	0x3
-- 
2.34.1


