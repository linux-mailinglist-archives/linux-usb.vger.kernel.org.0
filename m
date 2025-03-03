Return-Path: <linux-usb+bounces-21246-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0930CA4B6BE
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 04:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99FEE3AF57F
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 03:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057791E7C05;
	Mon,  3 Mar 2025 03:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EMwy2UaW"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FDD1E51F3;
	Mon,  3 Mar 2025 03:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972777; cv=fail; b=GoKLoymJ7h7Gyz15C9RTlQxHrK+Qg9gqc0Zh0lbfXx7JlrU8N1R2Gs9FcQKNUGZAZZ7cA+ut0QMW8BPVy1SOp8LGkY7ShwyeZtimHksyh5bjsYn3R4Ihvd0SoehbjNu1Hf4mxwxCanR4a7HDwfNqNktMblsUGU/KAWnKQ90RIOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972777; c=relaxed/simple;
	bh=jHruHMpNArZqciplrOBXo3edWdlrkfCtEzm7RR6RRGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PQzS41ioiSwUj2FsrjdsQiLyhSzVXUbHMapE+Y5ZgitPOVcVRdbdfJhOnEt5+zJIvRXidLKXmW1JTEthoS7wHw2vxBzCkP1Pq5WKLmMHEsCUPDOrH6vEkbltlymeGCqieVhzIC5wyG6sz0g1VjIBdKaoZRRbARzFxEMuoT42Nig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EMwy2UaW; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIaXji2UQFaayBB6smAzlagwUrSXGVeLbuiIZ+CAz01ux+npbqr11l0pWJ+zcQGJzHXu4fp0eyuKB26Xk3K9NHBtG/FAbGw75CjYmM7szt1BqswBI/Qr4dYJsXGMhoYyAw8NMuy2Hig0unvm+aRLR/J10H0l565h29wpXQAkSLbx9N9ORqcGV293EMyhaiEonJfLsd44rxbO1Udjl38vjN4lmH8g39HV1QtUN+vyR1CJ8ecGoVOU60N393FhFXzWQwD37f10Zb7UZhwKMBD8msZX4MncmT6RcNsllGcaCKeszv4+fefC37froY4Ir3noBBxWCIHV9qFpieAZFQVJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vrq0PCgaATYlSuW6Ei2d3jX1Xw78RKjsjYphVdlc6E=;
 b=UbraCaITY4Zau4XwY6UxwlQLQ2Ix41qsV1FoMomfSesvwQmhhzYR+hw2q7K7UPTFDv4iohdtmzOS6C4KfjftxntaBYi8u3HTJyX3tWCOFXLEZvRz+ESRUIJZey5QlG1IX6e8krsrhTsWzOrSazjOkrwr04j7GYl84Q/3Jq0xyyLcJfZcwYPTax0XOEkGyjFOcRrMUiGv3NBxpwr6WeJb+euICj/Dh0yi5mvPVXd2KkVrfFHmyv5EPYtCrPY6YrTVjc6go7tKA/utoJBRIHOyFRFFFfFIKMGF8yLGBg4YSYiT+cPeSLGQ7wF6EeKxJDG9p49lbW9ZzTeQWUnnpu4+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vrq0PCgaATYlSuW6Ei2d3jX1Xw78RKjsjYphVdlc6E=;
 b=EMwy2UaWxIehTKeERnkaXgPlcx8gAQYz+Lj+MMk7dS0Nws5+uEsAGBOa/fPXNzh0uFOGj023FUas6A6H/R4iPBLq21tykLtdPTDE+V0WX3Pml63YTLO1uma+1N90GVkQ6fHJfbu26V+cwW0l+pXXXslHlYhEkIqQginDpCV4+qyXnZAM2qPFCNiFtZIYHqRHadEpqPH6QUvJb8eo/I6aZWg6csvZ9DT/4/6D0ma5PK3yqZFzpExcD2+ON9nd6Cqvrcfzd0bbgnI72hygOKijKyQCoNG9AFukrW6C6lM35EkWJE4Ovoxkny5r1ar5VS6dUBIlev3/aniGRNnowXENgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 03:32:52 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 03:32:52 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v4 5/6] arm64: dts: imx95: add USB2.0 nodes
Date: Mon,  3 Mar 2025 11:33:43 +0800
Message-Id: <20250303033344.1251076-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303033344.1251076-1-xu.yang_2@nxp.com>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 770cc45a-b9f9-401d-83b7-08dd5a041412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IafBzDpP6RdgplZtcB5SKZsZqVixjTQy8xpw6113SjXbDDJSZAQTbz5lAexC?=
 =?us-ascii?Q?pb0beK50vRjSlZLQJrDQz38dyY2seaXZFnGhGhxxCxCyhOmeXLOA/+y6jbaV?=
 =?us-ascii?Q?dbAFspDlF+x39NiHqm86AvzjAlZKuI9uD9ESO8cDlj6Ad3X1mshIJE6rkBH7?=
 =?us-ascii?Q?sD2oiKZlBrdvLCFQYHx981fCMWydg8VvJl3dldw4QB8aVLgxyJfs1FxUb72n?=
 =?us-ascii?Q?Sbs5TOSnQB/SGvVAC+RTqVlDQyrJId2aSrF4n5tO6MD8o4HdE80qUEAX5/to?=
 =?us-ascii?Q?F+O+Z/r8IXbFEzo/Z1ug5DACogitnvxCQv+CnbhP6VXNVqos7y6E+w5b8qVp?=
 =?us-ascii?Q?eFNPRjmqeOCQVx+ChenyRS4HLVK7BbJN2jhCb7IwJYPXv+/MNzyRFJmpZFK5?=
 =?us-ascii?Q?93E1cfhPWlPNBbgHPl+ElXG/GP4tkGgpGMp3QnxjuRFVTJArZM0gfrfer4Rn?=
 =?us-ascii?Q?C2UUC0sJ6cSjhAovzUq4vjMv9vuFFzisG3gGTTZ+fnhI8cn6KUKwqfX5kQ6Y?=
 =?us-ascii?Q?BgzcwDY1nB6zmHdOB8d7vlP5+fsRChdoPyDnhDCLtFmihMD8miL723eFWzWv?=
 =?us-ascii?Q?/42DAwe7cUU9YZcddPYPYU0r4TAuLrgtIJ08QZiZzvh8utwiV+7qQfj6PAIN?=
 =?us-ascii?Q?p+Lr9d9eZq2D7U4OTQ665YeKt3VvHV6MgEZOCDzjevuzBY1D0HF4Hrk3nqDg?=
 =?us-ascii?Q?4cgM8qAhdq2uBw1nPLiwg1P7u+dE73YFJvLPE3xIQzfVK4LrtBg6F7ICGSlN?=
 =?us-ascii?Q?y0OeAlSSft/X+9tAFV3hqLH6JTRzOTzJwvIXrZc578viZXZeTDrVMwn2tuxr?=
 =?us-ascii?Q?vUw1y6Jhzp6/ZNb/N7c29GXfJzCuSW53q4lJo+LhJTKNkvgj0oWBbarh9R+n?=
 =?us-ascii?Q?908qHEZkCArrmyazmIbODWEpf9OLF/QN4r16k0XOmz3lOf4Wa4P+7Zg4/+BM?=
 =?us-ascii?Q?cGN08wFDkIwU23Mpr+Ml14clFDHkl7hyyazxPo1Q6nU2MN25y20papPzJXhL?=
 =?us-ascii?Q?5L67vFCiK7zNVYOFyTf4QmVfjTElvPGgaBKCmzOdbo4sY9+lUR6UifWQR3lY?=
 =?us-ascii?Q?oj71tZM05elpdLmk5kdyMfoHNcoGT4l+zJ7MvSI5M0MK8WKzh0FB602eqfQC?=
 =?us-ascii?Q?iVQsk6kEaRCO7VVGaLI7tj59iz9dYHNtR01e9MslAgMVJcpUTrNxH5FNS4oL?=
 =?us-ascii?Q?Dagzu4OtaD/+2RNo8iWWeC1T0gC84I6ouD26C9ruj7oKBlTOpX2fcJk11AKT?=
 =?us-ascii?Q?JhURQnBCHkcCTin4MhoKrd8/uLRNcqauDCoBM5vHqX6MisIPDOxmjhkFK4Br?=
 =?us-ascii?Q?lIDMMgCTPf+ymVL9k19s/24tFXZB/7pJlKa+BVCPtPGtVb2Xr3igJkPsGuCv?=
 =?us-ascii?Q?tGwV1xX2g8cnXDKAdwX2/1XLTdOr6Y/C7a4agEotUzx79vfEbAcMaBSWMWe6?=
 =?us-ascii?Q?9hT3TTEy0qoa4eAL9e3vQied7kYakvAH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i4eSwLN0tz8cruNtLGHDKTBYpDpjfF/uJGlPU1aIA45s+6/49guVs3H39VFN?=
 =?us-ascii?Q?UDttOHfOhEMGxWpnQeEAOSBkjGbF7oUyptxDm051k3fy87L56VNyVQDFibfS?=
 =?us-ascii?Q?0oKAzsxOmfu9ZZqi9galSvqspYlJtMCZIUWVW4hrrkMVBxrz4fnEmAAoKDMG?=
 =?us-ascii?Q?QLizefQY0YBnTDtpTv7SQf81Mu0jCHF6BaMNY08Tlpsj0FxgqrBh0/URtUvc?=
 =?us-ascii?Q?7/3OjkZmXpf7B3G7wO64i5OOxmg674p3xbmt3NPlEjVOL27lMU7L8mTT2XUY?=
 =?us-ascii?Q?GUg+q3ccVL/OWis7ecQ3/FYO10vWJQaD4Ecub000okLkHw1LlCLcPg2xuojE?=
 =?us-ascii?Q?k5ApDiAYgsTzJs5vP/SNsXv0gFhAluVnhfjCDubqeE7qrL14+EtJ2FomdIof?=
 =?us-ascii?Q?qOeQouIXLga1NSg+uwLU6ZiuLpT7NC2JpbRIum9BcSykHQxMYVE4BP/warbq?=
 =?us-ascii?Q?FyQJ48lT+n4sUJ0gx2EI8YZvQQGhVjZreI24p4wQprgysrUCy+pA86zapdwD?=
 =?us-ascii?Q?d4Onh65TK3LLBeTCQ4ySwsJ88nSDJLJvu3oHgRw6gtowGtVE4ovbCnyuaCEW?=
 =?us-ascii?Q?/d1T6TNFwvZofxBXAdhttM0fEfueBJYWmS5IYkhZcooLyuGA7F5IdawCmHuY?=
 =?us-ascii?Q?XAPjmMHHf7J9024HbnbtBHALbaCriqx3iafwA7G9IJmTOynAkMuYuq9cvRhR?=
 =?us-ascii?Q?bT54x7Mrtk1ta7meq90HWoBroTzt8nvnQeiqFoNlBdov/dcpsxc131rptgLc?=
 =?us-ascii?Q?oAmBXEt3B5bI5r1BFVVWNdTVQFNfefOBSBdeVYCLrZytFmT9rINzsgHN2M1J?=
 =?us-ascii?Q?UshENgdh1G+U1KVFyrzgiRKXfbpwzBXNWLKAzujWH0xTCJvS1LQJQNKx27ag?=
 =?us-ascii?Q?kErZLA20uBuq8CNDw8DjKfAtDYVRBDClyoTNwZYvIg1F6fYy7T3OiBwXQM/s?=
 =?us-ascii?Q?XuO+lYBM+Obnxg11AYwPvoIkaV7K4D4uSX1xk9JUDeodVK+BqnK++irF33KV?=
 =?us-ascii?Q?3a2T1rEmaC3vJ+brzZ9mG7+K6YnllTleyLVF4spjgZ66XHGjOyyeVh3wCxmu?=
 =?us-ascii?Q?RBrwHkHdiFhCZp33dbDp8TP5NNzXv+DwgCkaHIoizf06xADd7jiZg91AsOk1?=
 =?us-ascii?Q?Q/46S0Kqg6hq3gWmBp4aXAfcguVCAGKV/ZVdR/8QEY70PiavNTzwSh0kSB94?=
 =?us-ascii?Q?N3dsXWcN72dlIfwxRJTS4UsnGiSvYwj4UfNmvREvjTj09/ZV4JEh8ezIwi9j?=
 =?us-ascii?Q?HJNK2c+OoTD9gVKKMjNcOfYEiaOLLcqFpA19ZiXPCSpMDT8Tz13TYNpeK39k?=
 =?us-ascii?Q?HWsYwULawr6/jN9QtRsb+8sQVVH6sqal4VfZRgwwJKYkT8c5w+m3u63bP3iU?=
 =?us-ascii?Q?NFkjPgI5ZjisbNtdcLQa+ouBeGUzSWPRLrkj3+dD8sr10kyM7zqDO2M/8IHw?=
 =?us-ascii?Q?brcI7Ts8gHZP/xCbleczEiOCLIfeG72p45bDfIqQysA7uKJhMm/LXEskP8vX?=
 =?us-ascii?Q?nRqU+sCABV9jXrKcyZeuH7kWkCxOoc0Tu4rKrwirLERgBKeIHC9EYkOmxEF6?=
 =?us-ascii?Q?jqTcsBWGznhYncGrL1kax1nWvSUAYpuQq567hkhG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770cc45a-b9f9-401d-83b7-08dd5a041412
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 03:32:52.3720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJs8Mj/+YDnRjyq3BMnDwG3HxHRZgOZpqS4CuZh0NHXFanp2pNAAgvUboB3tiW4wM40zNyluGyD8VrKjYmy5fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

Add USB2.0 controller and phy nodes.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa95xxSA
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - add Tb tag
Changes in v3:
 - no changes
Changes in v2:
 - add Rb tag
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 3af13173de4b..48c2033971bf 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -463,6 +463,13 @@ its: msi-controller@48040000 {
 		};
 	};
 
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		clocks = <&scmi_clk IMX95_CLK_HSIO>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1579,6 +1586,29 @@ usb3_phy: phy@4c1f0040 {
 			status = "disabled";
 		};
 
+		usb2: usb@4c200000 {
+			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x0 0x4c200000 0x0 0x200>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>,
+				 <&scmi_clk IMX95_CLK_32K>;
+			clock-names = "usb_ctrl_root", "usb_wakeup";
+			iommus = <&smmu 0xf>;
+			phys = <&usbphynop>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			fsl,usbmisc = <&usbmisc 0>;
+			status = "disabled";
+		};
+
+		usbmisc: usbmisc@4c200200 {
+			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc",
+				     "fsl,imx6q-usbmisc";
+			reg = <0x0 0x4c200200 0x0 0x200>,
+			      <0x0 0x4c010014 0x0 0x04>;
+			#index-cells = <1>;
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
-- 
2.34.1


