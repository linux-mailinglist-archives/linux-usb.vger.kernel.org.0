Return-Path: <linux-usb+bounces-21135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC3FA47998
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 10:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9D0F165ABA
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 09:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427B0229B0B;
	Thu, 27 Feb 2025 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mSV0hovj"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2089.outbound.protection.outlook.com [40.107.249.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AAB2288CC;
	Thu, 27 Feb 2025 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649985; cv=fail; b=bysZlU04etIMHa5P7dOQUEUorhCCwpBKX90085QITDpCCEEdXCIEPSXDnIj0dgYaisirPZ5Ao/zdiDupJcowSZ2TOVXVeCZ/u0VmpbYHmnjwUg6fvZEx4nxWx8ebmWbA8TYiukg58bkENzuGfkY+Wys9vpTil31EPqoTXaMEeFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649985; c=relaxed/simple;
	bh=BCx1RqDjCw1HskdIatMCWTGkpEwSZY/Ck2AzuXn4eFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bzRHEnWCjTxvKn46bw+3xmLv0ldeDUcSN1pOIQnrkGNOU4tZZzG9c/oZZy3tloQ4f/uqZm6hflK+TAhl06poBqNcZaRf7vsxARHgRdkpDaHMuGTzS96f1oaI32mcHE4jVpfgn0/q+hOggJw9BWlNsgjvB1UzS9DCYhscApg+vuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mSV0hovj; arc=fail smtp.client-ip=40.107.249.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yl+9N4esbexjXqixTLOlu6DU+aldEBFDMAJEP5ASqc0td94o8h88FyBeA2glngmxw3saE6gheEGyuKFyKPhwY+B2VmUsZ8lRC7ZD88B5eCs0VbUYHJsTmars9mct3BikCb8vpGAeYEYlEJVnz/WZa+oi0sNO+tdKHpiDPBHs4jroDWTC3M/310NxDkUofpyJnHLQ0ciHPuuJovMCu1p/VK9yquEcdqQnAflM/g8PwWu3vd4+y7txRMnizp6CrG5K4XHy4IKhmefEVutgyL21O6pVqewBvKbGMqMMoJs/N97lt3onO5uh0FSo2F3/gmyvKxjj92T6cp0GoPi6DJIW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7E6gyam+ppY4Fus6pHrw2hn9eUOIxukXWhTg9n9gnU=;
 b=HhngaX7qa5bgQtYDslrqYg7Xu1qcwa1w1VxTACfFBew67kDkylLVA12tIZMmNWLXueAlnlyX1vWcsekTuUQvMm+qWyHzZTEeLrU/KVX2MKj0JWArlroPmyCB7yRmh9s54vLDdur2QIAJZkdD4rLrUPMpk0Fn0yWwbCRa4GwUCHYkFcJsiCzwQaq4nJt53RH1vR557aqFc+KnOyt1xLyk2CmmLf64MAIBkk0BFfs+Wq0T+/hRzKCP4S9T6YNVZzwNB6dK/9J0ic5NUtoSzrRrHw1i5IoHIel8URD4pEI7EhdciUB77pKxR3alC6OoFqsILLan228btte4IjNKTnb1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7E6gyam+ppY4Fus6pHrw2hn9eUOIxukXWhTg9n9gnU=;
 b=mSV0hovjEAnA6FfzLwJvyrjlo5pzbFCbxO72ovbW1jDzKgVg7EGYj9aifRhzFVSzEvATJVLGhatceuzwR/RMuGDhNJNL0N1GeGuPJl0GJBodgnfdWK6Vjgwm1z2ggSTb1tUM5E6Fd+I+vDiNTFrVwSPv+gRv2k9x5nznCD7l8VOUoXz2ATOpiUnpB3qJG4Ds0eQLvIfuebKsGr+VNKmmaHA74KugI5AvP9Kzyus9lMnLV50O6JxKjCUZTraNbbjMEI/TXPxGVCghF46zDQPHtJoKNP4X7EpfHwUmMzgHtk0Z3kUqBZcJVML5m21SR2wtCG+GWmL+zHE6AtfFVzG1nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 09:53:01 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:53:01 +0000
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
Subject: [PATCH v3 5/6] arm64: dts: imx95: add USB2.0 nodes
Date: Thu, 27 Feb 2025 17:53:47 +0800
Message-Id: <20250227095348.837223-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227095348.837223-1-xu.yang_2@nxp.com>
References: <20250227095348.837223-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f779d4a-92e0-44c3-845a-08dd571485cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oLaCOiPmv6GXFoqVTan2tTMdDbQ3IdCCAJ/MNVEr3Vr+P46A8IMlwJncbXSp?=
 =?us-ascii?Q?Xkip0w6j4EYIUVbIU4cQRruMwU+1znkqGgMHV7ghnNt64h0V7pGPEmq99kJi?=
 =?us-ascii?Q?NAHaG2BrQrkEcw92UmCstatUj1WeoKKITo3f2Tn+oIqzV8mDWqm6AsjlJMEy?=
 =?us-ascii?Q?7GpWdyaeW6Lzv+X/0sr+esF2KqSZAc0XOmacQdeGXMLC4fu3XkFnZuno6s8t?=
 =?us-ascii?Q?CEU4sIqsV4uZbprQrPA/inBESmB+aI7d+1F7XQy9aRoQyWwjVhq4B8OxssDG?=
 =?us-ascii?Q?pmuhCGaxSIuPZFrHLAz9YEQ9V0TB/PWnbQZLhVmPdnlspV4vRIq8dbQrv6FE?=
 =?us-ascii?Q?x18Y9VWOchw8h/kY52gE+2DA3jVHrYBkpQO6Y2llPk0dY1YHPC17cEH/Z21h?=
 =?us-ascii?Q?IiFNGq7GkYMZu9jC9pYHWSmEoqAxEOdBi+qbJ/KeEHXw8IvgUA066hlMmWNg?=
 =?us-ascii?Q?e1ZSG3PgmXcoQXiWJrV2YohVaiGXI7W1nv3V+yLI/bST9sANoeuQXrny3IjN?=
 =?us-ascii?Q?hmFgrYidBTFQIAkivaEI1A+CkZSP/zInVKmFME7MJkYUUGRm15yWAZtj4qPa?=
 =?us-ascii?Q?txi0JdNwfqKkLnySpjNdAHYGWuP5xbP3VydBcovFyy7OH6KDCYbtkAVeFwUc?=
 =?us-ascii?Q?3pSyfEGCk/pGiQyNGnJ+JDbTWf8hPCMRoXIGhN+LMK8O3A6bYPJfwlsWL5If?=
 =?us-ascii?Q?q2/My3LW5CEUniLY/KQCPBWd9dGwpgnpnS+ZoaZcOPm5WLwvg70v1TvLml7C?=
 =?us-ascii?Q?5ePs4JAqwPmtTDBxXkUNTjs2dnzGqwUatG4U0Bie4lMldoMk12XuxShaYYIZ?=
 =?us-ascii?Q?0SHJIGVPaZ6visn0EPOVURszrOG3yCd0Y3IiifhDM5C0hH44/9JgjjeuxQF/?=
 =?us-ascii?Q?p55Xk0K1AFq6WL7cPA8sdaO0UfZdl5M+UCp5Bzb00EPs63L4vK8Deg+OU6kn?=
 =?us-ascii?Q?w+L8LrMPv+8HagYKg5K7qzjNDnMqeFjKJLh3l4mjMTFaiYn+uVUFIIzRMdvc?=
 =?us-ascii?Q?3lf4j3OjS6XPMStHVwTesPqqrx7y1cFVbGWtfU/+TCKvwCo6d0Zo0kIpFFPv?=
 =?us-ascii?Q?aDQfwAPaeCGijqIh++ZxsttZIKeyA1pRQXVdt5KtWqbu4j7w37t2OCKCHJYR?=
 =?us-ascii?Q?xgEzGxEMMJP5has9R8bWK+KI0VDCtC2Bd0lKfN3Ai8/+Kqcp+SehK3Q0n//I?=
 =?us-ascii?Q?KFNEAitc8Tx9et0SO5fXMwKuLN+Vfheg5Cnx7gE58tWBunXlUrQo9SWTa3Qe?=
 =?us-ascii?Q?PkIzc+3HGklc7ApbyewdMhMGGMdkWHIh9hJZmZYBs+60egLbjnfd03a6tJmr?=
 =?us-ascii?Q?pLq3feNhOpBgQh56SWufFSLDNjNMfmTNflyXwE226gREHXGLqZFqoc6ljpED?=
 =?us-ascii?Q?rEcK7YL7Gqhk+xv2TFyk/7vP1roxA92g28I4No+kU4CORgulZBt4rcl7QKbW?=
 =?us-ascii?Q?eu6VSOfglWUNNbc/q6WL6PIl2qGBI1PS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ifFwCI0sxTmicg7TUiIKu6E+lC4nC9upwTE1+2ICtNe7FsrrVqBN1jHbp/5?=
 =?us-ascii?Q?nISM1SSD6IgOA+AYbIhcYh9yyr4xKI0zEFV0lVIW1JbpMmG35nERmD3L52ct?=
 =?us-ascii?Q?fN3WG6i5YqOG2k3Et8gDCYwsHE1m/gSsizh3ZGdBYHfJdK/YlxOQxZNRR2T+?=
 =?us-ascii?Q?Hm+o+d5aQdQqmgmaHesqzuI/ygJEBKOc+CZE4joT2bB3LwnbOCTk41PognHl?=
 =?us-ascii?Q?lHSxkZrOWwiOtZCO3+67tnZtd5z5PhFACt3O/iCIxxzhjyN1HW0lZ76kGMcQ?=
 =?us-ascii?Q?mOE/QjrASxC73gu3QeSeXqQHGa5ai/0s4pgDPk7kQhtMh0y7B4/hBFTIqfp+?=
 =?us-ascii?Q?BLgIt/Vxhi30md9kCws7OgODYqHUlqn/vq3QGiKGAzU0PyA0AvU88dlshWrX?=
 =?us-ascii?Q?R5lD6ubed6qdjYpiGyTIJmfCWfkmPk9RWZFsMsa/Nu0tHAT2ffwha01Fsdxp?=
 =?us-ascii?Q?xUa8BtNaZFrsamGgu6+OEaidn7RjDyEuhvZ+gdcenABM4gLrU1iDko8cb/A0?=
 =?us-ascii?Q?JJ5Do9JfgadcmF60zINzAfygqFkEnB1XseuZeXmRAgjDji28Lx5B/VcFWWr0?=
 =?us-ascii?Q?llfdE/K4T40A1HPoLKtCJ7lfUb9/vVVPnFRmtbpDHhXPbTd/2oZUSGR0HRWr?=
 =?us-ascii?Q?5XYe/7L4qfyUAwSMZIKFtrfwE+5L60lnfyBlXmbAPPr9v8AOuym3Ta98gJKd?=
 =?us-ascii?Q?JiY0KCd6+24etvh/uJ5EluW6O/DvJ+3fbhaRhsmZ8dp9EjDI3czRG5LRJ20w?=
 =?us-ascii?Q?1j+0lwdO1lxA/5sdc6QGRvGpqihTviT0CTtoA9Did3EBIh77FnIEvh5BAIug?=
 =?us-ascii?Q?GXrqBgyGUDw93uODGM9DZNMFaTSBsD9DcWxatVoydsQdeHWsgv9DoZY+gTQu?=
 =?us-ascii?Q?z5qtz4JwAHyjk3hzxrk8T+nizehzcGnL3xO2h/C0jkVDimev6b1rS2DRTbzW?=
 =?us-ascii?Q?XH6HLJMHV4nt/6HRZCa7q44HT9d+twfxAPmqwWjkASe1GsoZESYqvrN5bwBN?=
 =?us-ascii?Q?6gDF7gpnQw4YsCv/u5I4HY75uoCbXZ7ebeL32vxJmIm87EJ4YW7CPUQmOtwU?=
 =?us-ascii?Q?3JHmjvh7px+aNP/GGhcCqHqAhhqxVXSGxFCLknskG9vQOxHC1oDMpMaHH13q?=
 =?us-ascii?Q?w0btyZ46GoOFGX6eOe9f88Xsg4CcwygXQNUSTFfQbcNrbY0zdjkVtHKuDnbp?=
 =?us-ascii?Q?c+xQeN0b6OQUmyaxOhSCsq/tS7cTl05w1Hmdw3pHqRQP072wYqjBH2TbMNJ8?=
 =?us-ascii?Q?+hDW/O04UYC1OtpG5GP301Rzy4IK7j/C/lm3lbs5sqol15ELFFUhcGUmPN68?=
 =?us-ascii?Q?VhJ6mY6leNtcVgxQrvw7W1EJXD87aDrStyTUHr/Ww8wVKasOKzzdwWzrf8HT?=
 =?us-ascii?Q?heIzFs3hvw3uGRXpt+IOPmmZnNw0J9WdHxc2nawunK+uEZE3X3OVvOXkJ5R+?=
 =?us-ascii?Q?Bbf2jm7G9vG4GtqjEjW52OPPs1d2JMCA753L/5nw2LRatlyaHPWATmJgjLKG?=
 =?us-ascii?Q?yEr08a4hhrZJJ30zmLB46dL4xvBODyiTWob9K2XfMWjbUgbUuEjNzHlDnTop?=
 =?us-ascii?Q?8qgRePnnPbfKjvdAGUMVzUYxLM2yjwX5z7c31Nn5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f779d4a-92e0-44c3-845a-08dd571485cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 09:53:01.4300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTHFWEMT3QtNXGWIk08ZSAb2cWwUdNI1ftD7PXA+/y9PFNKUcg822LPEwrpnT32sbGamXbZJmVYb2h4iom3A2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

Add USB2.0 controller and phy nodes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
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


