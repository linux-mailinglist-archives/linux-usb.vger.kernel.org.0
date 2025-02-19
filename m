Return-Path: <linux-usb+bounces-20816-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8078BA3BA37
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 10:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D6C61881532
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 09:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BECF1E285A;
	Wed, 19 Feb 2025 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ckSUUfts"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2049.outbound.protection.outlook.com [40.107.104.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361E91E1A3B;
	Wed, 19 Feb 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739957465; cv=fail; b=e2SMKd5/nbhcywvL1VLVvYo8wLQRGJ4s5EjpGo191eQn5Lfk6JVxGn9dxJ2DGRA+MUCXqUkLhkDyf4HVCxDFgfMX20xu0W3VuqccXdZeswaOzJHILWDTtCJnEBGiVGXA0sTl93uaDkuMZM1i7AwbNHs62dq5fgaoiDwzhGKeGH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739957465; c=relaxed/simple;
	bh=f+oQguLLgUA5ZEv3xTMDs3uETlXRpSdItwWwPxFHxgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AvJiYdeYjOprlvvRCr1uZ7X0x7E1/XrwV9/w7yDpsKZThBG4EUOMik1D76Mh8pXwxpEeNqqrhoET17hW4oq/pbIxoe+2WhyBhO99xItBlNjXyWwE3u1w3ymuJA5NyMcUv13+8jI5d+O5kRClUex4tn+wuyY0KWD5sY1oKuB6x7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ckSUUfts; arc=fail smtp.client-ip=40.107.104.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iW26L1X5rtzxQqY3J6I7qo6blvLLfFO5RapcPREnmAS+Tl1GyCV5ThlbWmn4Nb8KvCdTcw8QhCDD18URklM2cPeLVH7UTcFgBZ/t4QHRriitISMIwgxQs5gLxpM1xC6ABOfPRP1kAPvY/wFHEw1eO3VT5YdyyLZsjj6BCC28n273+umbuX575W8fSG2tXhcO3Fz0MxTCu71Y/3DJ01XHS9bO6T9X1krvu1BvU98hba9/VRYX5fhM0eKXv196jviNtYaKDZYb1RsKa3iYO6N10iJKI/H4KMCEBFHWejfsLX15eTmGAC7JGxmzW+jBxTjkyw9uf1N6eFwgmkIRscry7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytZ9Cg2qJYWzVYhlwS/HvBNWMG3PrzSWuSMEXhFbIgI=;
 b=fuzSwfa/87Gfes8CjQx/gKw8dT/kH3FX+acI9xUj9Wwikhg9fEwUHjSdYRkwqtZhU524u+uMqI0UETEDL6rFNSt7x4iQQdYZsRKziG2TKJoQOCmGVnlvqf3IxD2KPTrqKrymd+4M30xNvThLeLVjkXPkvPb1DexQjdD0o8yUqXx9NPD9hJJo9LwCqZ7eDRu7TxNbgbWd3YJFZTfrsTdBWtqbwAq1GFXfDitiXsscvvhdic0E1ASBOb3ubYEyzWxbsS2z2olukAKNIF0FrGwv/e6L4gF5TVGoVBUTa8i+XMcLmOzRcHB7iIY+nuCRSIMmuXjdUukIW0B+ozQxQuXqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytZ9Cg2qJYWzVYhlwS/HvBNWMG3PrzSWuSMEXhFbIgI=;
 b=ckSUUfts5W8x3Dzmh4DfJmMYL3MZgJkTkmBieQr9+6XalYirCZ9O7PaG3Ax8H2mfYRh8VuIwgvrgc28f9o8f/klQj2/BgLBy3tzj2c3drr1see0S0yp+5UoiV1M+UM7h55mKtxRPaaqv9mw772Ij8ZKRSs7Ih1lZsZlISuGOxa8ngMJKp7Be2HBf+Tuq9Os7tPGab10isgPSYu/sDm611vM9eAWTcLK30cY2FpsoWkDoQDCtW4qiwwtea+3E6Mmsk73eCb3Z9VBrD4eA2X1KuALWJO1/7yQD6r2ehLSCzSLe0ndpEi4B1AnJO3eZgHb1x9fLAAP+BSSk3KxJNKv9Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS4PR04MB9550.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 09:31:01 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Wed, 19 Feb 2025
 09:31:01 +0000
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
Subject: [PATCH 5/6] arm64: dts: imx95: add USB2.0 nodes
Date: Wed, 19 Feb 2025 17:31:03 +0800
Message-Id: <20250219093104.2589449-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219093104.2589449-1-xu.yang_2@nxp.com>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS4PR04MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e29cba1-9e01-409f-2d7a-08dd50c81fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ot9xmzoTsUyXiL4tMKwn506IPN/88fbkQjCuVN2AuAQNqqGWH9mtmX6r4bKo?=
 =?us-ascii?Q?BKL5ZQC/pNP2J0XImX41z0ejh2CLRR/WNwnbz+ILgunfm6YIez+oWqsBBzgD?=
 =?us-ascii?Q?GVyhR9zPacH4nYATpKJ80pEtZYUt6M37oRia1Wku7ackoiC/VoAl+nlZHuWY?=
 =?us-ascii?Q?05cFBawl/GJvXBp4KBpJ7Cn4sC9UJekBHD+r8cxhuDJ9DcYe3jpRJYdZlCvf?=
 =?us-ascii?Q?U3SDtEmSSAkroUBQIle7uUlMDCU51Ej1I4I2wsnrbGmHopoVKR+cXxXnRDxM?=
 =?us-ascii?Q?DWCQm9XzRvytzra9vxrm+i6QZtqWGBGRknGyVyb5wSYMfZq5+25vHSgzW1le?=
 =?us-ascii?Q?+nJu2YrsTzOiT9CwhswYEWCK5T8Jsxi/bWFXFpToxuJXlFOORZ0p0NcVkkF+?=
 =?us-ascii?Q?12BV6QIbytz58GmNNzvJCDFUDVIg86wMdKMpS3p4GAG9Ho+7jN0XD54U/GD2?=
 =?us-ascii?Q?vNN8mmC7vL/wAd8QFAFG0qspxIyXR1dRyUb28LttYL5zk3MbB9kijMFUUyL/?=
 =?us-ascii?Q?8LKlNigW6SwtM4BEOhwfCRxjavPmi4JGDBtSIfHGdVKsUMECSuPl33sGiyoZ?=
 =?us-ascii?Q?Q1H5UtJ2W1rerEvLoIFn2R7pTKshDahdjzpUgMGeYsS83S48UCs50xU16Lua?=
 =?us-ascii?Q?lclhhVG0pPVsMNSepmxR3HIw04Rn80R7zcVQE0fk833kIsiUnqK1bMgZf19R?=
 =?us-ascii?Q?Iqr0rlLXBm9gz+s415qMS6cPy130OGtusmswvRJ8JbBBXfK4XFrFvC9lGv5/?=
 =?us-ascii?Q?xEVoGz+zwJwT1DbrE/A7CY63Aval4YrpF0wHf6nuPmex5uLPwPrNhvyW4r3N?=
 =?us-ascii?Q?Aw67DEmVUK1WMGs0WIltB5hP3GU9amePddZS6LEgEDiu3oPrGn8AWpZBHCRn?=
 =?us-ascii?Q?YDsqcSJWngOmQKikXW5ajhen4peWIWp+9epOQG7zdTDzya4lrs20/ndrz/No?=
 =?us-ascii?Q?9v96ZUq0RNbuSK8dNiyDWWfoaSmvHybKExwfZBOKu9fPE+2myy3Zi2wUUtQ/?=
 =?us-ascii?Q?oTCGLoKwpXxO2rHek0DD5jj0hY326KB86NWeDbIiNohNsP15u7y9/9N2MpCG?=
 =?us-ascii?Q?vdphGKPxvUMRMN4nPpSSa/sJgVQ2YvGRlrjEDHxjhmtRm+eePolMXEKBgtnd?=
 =?us-ascii?Q?L4zXc1uuJ4fDB3xWu6QuuvKBAQLUWy7veyi6w4ni6r0FKM26htfLKVUu8pBI?=
 =?us-ascii?Q?4M6rvP3Mhh5Q0uc6atG9nooUyCED0k8JlxrGAMgCH2Ev3rI8yUEKRIEatd/J?=
 =?us-ascii?Q?n3kF5tAPyAsSNkW2bWRLgP5+peqmHAPmYD28e4Xkb6qt5Qf9LDIQ5n1cdxvq?=
 =?us-ascii?Q?xr4jl0nQnyOCCCyL0I2xdSXkbuVs+uO6bxKsLnmPh1ouMZUQI95UgRmG0sK8?=
 =?us-ascii?Q?oqyqlbD/L/7UojWuirxoIsUI79K5s7fTuqTDoAr/hqIl47cCsc0UuT8qkvLS?=
 =?us-ascii?Q?076SYl7OP4Q0cLJ+/SMx/gWbwzHeoFlS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1fuwWPmXh+7mrOdfHNgAHK5shJza5XW3K1YeCk9auE9WAKDMLISmcj1l9EDt?=
 =?us-ascii?Q?I2n4uGU01THj2yssIS+dNJYVkF2pr9qCHLJiq+/jZyeTIA/B5eKgBxpHCbeZ?=
 =?us-ascii?Q?CngBdXxFQhVerPCwqEx+YpUibYU/hgxrSe6NkvNjZTO7kKgl+GxTVDUja3oM?=
 =?us-ascii?Q?Jkr8h5MhGvt1x22FfYV+qjN+Y5Y+1VywAWAHISr+a3LQBw/Kk135wSlzYMN+?=
 =?us-ascii?Q?N2CQZlAa5l6Y9fZBptcsk/57ElqvzigIop1cADTzp9tNScAhDCOXL+ElT9lb?=
 =?us-ascii?Q?N1v2On+JmDWXnVdmzhlVycrHuGWdx1OzRIMZQiv2XTGSqHJC1w5CMd7XGoY3?=
 =?us-ascii?Q?CNm62i7BDrZWoK2HFWvC06rppjlzeu6P/iiSl0Mg8AkulsSuCS/TumsphwYO?=
 =?us-ascii?Q?HfQOR9Q2tFdqwtYKC2s6qFHG1Elsl60Q7bQL5AArklmWP60vc6f3le1cbigl?=
 =?us-ascii?Q?JBpAn4m6XuDJfL+WNTiCoNI4IUfVgZKnFt7Zc0ctNL2tXSau5Itk6MFxp9yW?=
 =?us-ascii?Q?roxsUYRTwv0//bj/d7EQfY0NdLxXpqEx5iTFxNRcIYmxm3CYi0zW2H6GJjhG?=
 =?us-ascii?Q?VQXfvxfEHHZSpRrTRHI12Eke4xGZYRrK5FJjvUXnyJaEmX/HFhvflk9sFObh?=
 =?us-ascii?Q?nh5YU4zagPWrkotAd73NINAM3zw6xhvflLM+7So/ZICJ/j8lqn1sXqSiYtmM?=
 =?us-ascii?Q?hovQcE2u0MK4hnJSo9wjTM4Ev2UB5khNbXm0MBRdsgFqEuDNlo+X4eOUT+Jp?=
 =?us-ascii?Q?4N4w8R9/5oC5GEswisHunS7YTAusGgDGeEyw7ru/pkisJxd+ielmUCxhBpKT?=
 =?us-ascii?Q?7fEz/s6cWpnsZAe9pPpOMAyTqycsvW7dPq/Y4WL6NqttzVyp/M7NqavFnDtH?=
 =?us-ascii?Q?HZ31Nj/SVa2cMncmZqrjddoBxtM5/4bRoQPoSS9SvRar9lflFdbsNds04e8L?=
 =?us-ascii?Q?jLoFrDBF9Fx/TgUxSzwRsorzIReDaRhzjWBrOz8bA6IEohPP7yhTyN4BW89A?=
 =?us-ascii?Q?5JdO5y1gguFo2J/zUbMJf9unDGvQbN2dHhsXsQGuLt8HBJYmq2Uo+clLxISe?=
 =?us-ascii?Q?bVHTzFWU2P+WSuQ3Yu1N7knom5gwljJiNwC0GNvCTXVtW1PQFPASjHRMiEiK?=
 =?us-ascii?Q?gZoMHSVitdVeVxFIcotDnhUXvIb7KeZUbLsvubR/CsKAvlxKa6SW+/RZ1nWl?=
 =?us-ascii?Q?vZg6QrlkPBQViE304pHQ5ERDBcn+IDhh5cVl/2t/ELpQQ9mpFqvSIjaVdqS6?=
 =?us-ascii?Q?tbaGmSgoI3m3YI2fZfpxJLsuSfcCXTRAQ6YaWHZNQBforS/LrhaP+m0PoYeq?=
 =?us-ascii?Q?H+VwgWc2vbOGsUClMHYTtN//M5RfhQwLVsjBpjakPoLvJ/tSGklXyO/rz3hW?=
 =?us-ascii?Q?j4nlox8iGkKdemmF+zPaTuQJoGb7NUvh2Gxw7hhfpAKmovi8s4J9suNPC7bf?=
 =?us-ascii?Q?hy+Na6JTqeoTCTvUrS+8Xbv6b7FkwS+6MbIR7GkY5EThQv4fXOoWp21lEtLi?=
 =?us-ascii?Q?/sPSwa22tzxUxNHD6bWWaIkt8Gb0tbxmWELjhmgKtRmrFTcQqiKlBcVHZf5H?=
 =?us-ascii?Q?J1ySHjlKokYFoqFNOMeVOAhoXr+2jQqPEqQomuSx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e29cba1-9e01-409f-2d7a-08dd50c81fa2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 09:31:01.8051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rjv2KMMxmQWsedrw7UqRcBZYZythR3WpKTJfMRPkOiNDWS2iETi4EF4GmjhASwOlO1x6zIcGy6k/FyEaW0VS4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9550

Add USB2.0 controller and phy nodes.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 0b64a1df3c7a..a7c87b9843bd 100644
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


