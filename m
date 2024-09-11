Return-Path: <linux-usb+bounces-14933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C5974A48
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 08:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C420228219E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 06:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A7281AC8;
	Wed, 11 Sep 2024 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YAsQHIWy"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D211DA5E;
	Wed, 11 Sep 2024 06:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035414; cv=fail; b=IeRGLHRU/8z1t9a7Vd3W9kpiD/R/XRQj7Rp2K3gk8UpJJcDo/2zKrCR1FkSB/66aCOEJ406SSk3hwcTsVJPi/2+VvEHBtXp7ih5KSRZcOTojqpNt06OIZecDm9tEW4MVzxdK4lLpNvzZMmbtEz7CsKU1n6fN9OKep5BKuhp3wQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035414; c=relaxed/simple;
	bh=OOdgoMAhsa/EJOk7CSaysZe5hSkyC44qvNlo/fuzO88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QO5gzGZsyJBMM0McU8HrEsFqAaWIrK5uWOtphGHroKSQy3OeIxJ3J5a1Ag3Xp4KYJJYdCOPgfsAWz8usvKZWSCVODLfqQUiXoNqupY9hmAEaDZr8UmnqBX1xZaGwCux3HQYiqlhyD6z8m0QYuN15UfNtY4IKaQ6LCxqeEm9x6cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YAsQHIWy; arc=fail smtp.client-ip=40.107.20.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xATseL4/tp6ucWSDSIWVceFGhYIJgUl6ZF4J6iMxDaKAkTp8hHTWfCdFzwOOvMeJ4fMfYTTr1e9igAc8I9IjlKdjqEP1Xxus/Cfhf2ne9/AtWOgo4O4l6yTWH78DrPR3FO3bBljty/Cpkbpb3WDc2JxQssB7UgMDNQpNh8TPL76NYi5RG3m0Iunh4KQ9470SSECSFcWCUF8XdGMS59M8XA3cdKh1QNnrkvroJnuoT6EswNEWC9QAABev5VO0uzqbor1p/2+PDspK+6qw/P7Lf5fm6ucbGuBSsfLCXnwje5t7ZB3vvfgul4v5byDN7grJ0jSnFg5BKTGcnrGs1nJ/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfHQ2Leyuf8f+f78gKVAKywXXSn/RtpZFypjBT4h2rE=;
 b=fqUb3mVwN0IqmZ9h+r3Xv0lQyR+ImxQ9dkHCXBz0UlQfq0k7uIXK3BhuNF3hiF4nRROupc6qz5YIAyXL1mR4GcszjIBtZHu1LC/VZvbKDRMRUko0Ym6VrcabnBg3rYuCvJDgMEaDcVVmY5Nf35l6QDBgGM3rtZ9ME2VH+Y3EsTiD92TtT+W62wD6u5iRt/SW523H2xW0IUvV+l+HSkghuXLEkdNw7qamAyXrZIWqvhBcPdBm2PtLXN7dNT0Jp2rwKHStiSApc26n3omzyn1qIYSjaFtk3M2+zRi1YjsG/JQ7ga54RHUOu7vuz6K0yIkLCVAVNFudEUvQwQY+4PKXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfHQ2Leyuf8f+f78gKVAKywXXSn/RtpZFypjBT4h2rE=;
 b=YAsQHIWyQ0VjsRVPFcRftqHo1pL830D2V9xDkq7iiz18Oz/wAUNza8meIE9ac1EKVwFgIL5HhXeny4z1SUbPf+UmTvBUSkEXZ2e/C84kIa576Uy0Y/SbMbiPYTRouEDMCoEY0uJ8ZrLch1H9Hx8LJpungd8y6Ag6Z+0NyAKwlvjRkiYWHx0EniJIIOg4S2PrPho8ie6cSNeFuDpg8e0ZV4wjjBoohJLQRTIhfHRQF1sOOhrkS/pUkOpDjn/fKt/PxizLAgUPhCG6Bgy/IXrzc97uDg3HwPnqrmLnOFPX8y1jnymYE2LkBmWBOU8/FzqW50LvhyD/Ew1qyt4PsD/uKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6878.eurprd04.prod.outlook.com (2603:10a6:803:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 06:16:50 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 06:16:50 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 4/5] arm64: dts: imx95: add usb3 related nodes
Date: Wed, 11 Sep 2024 14:17:19 +0800
Message-Id: <20240911061720.495606-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911061720.495606-1-xu.yang_2@nxp.com>
References: <20240911061720.495606-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de58b5a-6253-44c0-e5d5-08dcd2295295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2sx1JJLMaKB83QOWOVt32ccPGP23gVrAsyIFor/jCt2BxTt0DBQ4crq9w00Y?=
 =?us-ascii?Q?a4hoEWm7WJ0pXxN1ECRwUm7eZ4HHeNLfVIPcVYtQhFKFTngnQ4z3dOL9ElBK?=
 =?us-ascii?Q?ZIlXH5WLwOrpv6yX6JZetqL5vF59A7tPZv8VrYlgBbR2Hve0BrNEn2j39CK2?=
 =?us-ascii?Q?+rB+WkOKv3IJg/OWcnN9Ex4inJ8jFStkTOAmhqr52fQKoOI5mugC2+6GSyoS?=
 =?us-ascii?Q?1OFT8mPUiZFO9coBkVDjiCJ3uMbA3J22T2ehuYSqSFr0U4oKPvaSF6IkzY+P?=
 =?us-ascii?Q?QO08f1UAMHt4EOS+1RwQ6uCfp2e54Xt5Ls6mActuYjlDbAy5zduoEHpSAqgf?=
 =?us-ascii?Q?imS+VspuJFjUIRo6Iuh6SAgovNwbi+Nx176FZzSgidiMe8cMp3jTE2ZWMjt8?=
 =?us-ascii?Q?G/eDsTcZnvmSSK46H0PO5QjTqs5albSLGoZyQwN7nLEQibTgaSqQcW1PGvgA?=
 =?us-ascii?Q?fV8b93lx+AbizxNoK6GN93d0whEJjg6EccMukXeogvxmPY1CzaudDQvCB4o1?=
 =?us-ascii?Q?lA6S0MigE5Z8cqPx1/J3rMw0/Rv95Ztear9V/b8gGeHQkBbaI8ZxKjAIvIO0?=
 =?us-ascii?Q?4Xwkj9GDVaEBOPIBYdeQDBQt5IgMp6lfloZVVB0tLhI2BlgTCgVYesucD5lE?=
 =?us-ascii?Q?IunTphdgrnEKFrHunH2kbh0Sj3NgHAJjm/7b9ekPGGajlwsctbRTSVhxvmid?=
 =?us-ascii?Q?N7JCXLf6H2N0LSDC9Z6ZVNdTRnX7vXpugGFKazvLmcNAP2L13Brt1fmdJuNJ?=
 =?us-ascii?Q?WPfWz1/U8pYoV+B/fabPb+6k6V6Wj7H7xzISubS5vBO5sA6Xjy2mA7GTA1Cq?=
 =?us-ascii?Q?0WV1yvkO0zneYqBLSNXJeXj3djpbOa07rGYy79Jk7pR6tBDU1ddZv+VsGLq6?=
 =?us-ascii?Q?jJGhAgJ8LGUEW3rrfKCUt2BClyKU9X2SlnUIT1VwXwGNv9AGFaC6vPtYdjrz?=
 =?us-ascii?Q?+IVZDEeKUbgNZyh205m4lafweEWDoMd/vfbhcRDNPjzcw5C3GU3HY695kH4U?=
 =?us-ascii?Q?wim3rIIDkKQ7pHoxljAFgfd1+Sqk98ns0+swise1f7TrRYeB0kdcITsD0+sE?=
 =?us-ascii?Q?eA3vfKm9Qor0aSIeLqPW7Yclwu73oRE1p/JtilUiAPQ5r4fBIglhcOS1A9yy?=
 =?us-ascii?Q?O2vV7lav2oAMfLxUMkTXZnwEwktLVN7bv5quS2MH0vLZdpm/eIHBUO8wtC/I?=
 =?us-ascii?Q?Rfc37fRNLwRtKTe6hne2EdF8e3Uy8htGektdq17NBGkl0eOpfQ1JxIhhGWWo?=
 =?us-ascii?Q?T3Kug+YXNQCnpDHd44HQRylV6pZG4kXFg0CUdNipIsZJ2YtblXp4ndZHRwqN?=
 =?us-ascii?Q?4qPncoptPI6C3uS0xBe/p32dZbos/a6wMNicSTAvfshaMJw7tDKcW+uMKa2c?=
 =?us-ascii?Q?hdEAggHwHITZOHLnzNUMhb7yxCfoK4LLd9hQFrJTHfg6mdePhuFL/ARlf5Sm?=
 =?us-ascii?Q?xqOuI0F4UbI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BjLhx0vxr7PLJDCor9r4o+S+Ae5LSZamI9102+oK6o16+psfoAfEi4LggWrF?=
 =?us-ascii?Q?WMbxo8DE+tieus8TKxEBBvx7nyzQSXpkaIhU0O7nBZjBVR+XKpxCQMJT0+n5?=
 =?us-ascii?Q?7KGbMEZcVb/pe8MiFuraFDgpaggsb6T8TszXNeb1jfq2VlmX7kqR6QrLj4Xa?=
 =?us-ascii?Q?f0GKhHADNxhdbcirc1D4N7NZrfZy1CPQ08HEQEd5mJ7mN/R/t749brC9ZbNf?=
 =?us-ascii?Q?H8vEjbDgHkFWidZ7SYWR+5kwheO2g0jZYm5rlkfjQhHNUsuo2Jjmt0Ogk5ZV?=
 =?us-ascii?Q?hnaZGjF/VPhJO3WMy8s07E1Ud8Z5HAsTpPs/cfV3RSqmHvQ/IkFh5Y7yEleJ?=
 =?us-ascii?Q?FqUyA5eyhX4+BHP2pav1i34O87qnqec5NFr9B76HDkyYO+8XcKSFu2jOipll?=
 =?us-ascii?Q?HOZhkSvEIIomQTSwDu7Y/CTyLiUNVeIE6qJiUC/f/AImriOldq0bdPCdnKW8?=
 =?us-ascii?Q?jVCBCiBj7UdAoXuPMzAfW1F6TpJRxclFqVigV+bxBrS2e3Xw1OreOGE2XZxQ?=
 =?us-ascii?Q?pQg4ccxZCfVoYxL+077lhhkquUrCVSZNd0yESzw34P2UZdHxAOwCDDyadU/1?=
 =?us-ascii?Q?uV7iWl7mkmLQnhwY609RPaoXdjc177ZlmXUWPFVk/M3IZezDbieaz1jdhNsq?=
 =?us-ascii?Q?C8dNF4B/PTnGSB9gQEeowGnUimVN30EzQUJVTs4b52TDwpVgOFZF5KPFp8JD?=
 =?us-ascii?Q?bAVwhME4cX1n9XkN1y/jHpL4nI2ueGrVFYUSt1VROe8r7RJcTfp1ScFrtjFD?=
 =?us-ascii?Q?tgSSC9H2sk2l1k/AKWeZ5u/siZ7wDyMEbsIEry7f4/Akq1zqWNvpuisjDTtj?=
 =?us-ascii?Q?hvAzsmhw4eJR4gwy6QAJQuE6TQa4DkMckirrvaLLkEuc3K0SHiE5sScCbMqa?=
 =?us-ascii?Q?8Qhvw6KmAXhYpxvl8yv6FKT0XuKhC0AzLjx6Hd1X516nDX8C37Z4TcqMhiOK?=
 =?us-ascii?Q?hjFG7LIbS/uAmDNw9Y6rqdjmSVgbzewkwkcUbRNZI7R/1PDiFZbkiklfBN/G?=
 =?us-ascii?Q?/BTvAbzub9+Qy18BdHYD6j1UzTYbDYznzluaO6Tp1UTSMryvM3Zdfh6TH56j?=
 =?us-ascii?Q?rQB04h4iDcVKqTqeWGO6DL8EHPcjO9z9I7Iu5E5stvkO00RETMoHMDSPWRWV?=
 =?us-ascii?Q?Uo7RrddEmVyBn5k9c1z0k5TLtun0OGcAR8NdfW6tU1g4hK6TLgSJydTkUjIL?=
 =?us-ascii?Q?SbBvzqwW4aTsLwR2W0mQ7sx8P2xxbPanzfRD4RcGI3WbYM2Hp0T8PtbDALQV?=
 =?us-ascii?Q?9kq4KzeE0n/Kh1lQRuXGmdPqBmZrqSBJE5GrTHYASTfhsFyNMTsYUFUGR91f?=
 =?us-ascii?Q?X9oyLSuyqykMtuaos11SwPaSipBD7lO5Ts8UXn5e8BrFzkW2LUKo55BR+XwW?=
 =?us-ascii?Q?tUxJ6h+ghiGSUcrdbphUyTf80SJsnDqxutfnxU1Z3wccmZfzBu8PPJkKzNDC?=
 =?us-ascii?Q?OfygMH1vNn1mItKETAP0DMwINYkI+T93zOxfg/b0Tr0vMsi4f6arYfzhtjuL?=
 =?us-ascii?Q?E4ODu29ivAp7BXloJUVhoHgyTvc6f9bsxW8Cclcwj2ltgsilvfEDKIL2YKxb?=
 =?us-ascii?Q?5FfHI8oNBs4mLMukClwmVb5ECSgk2zgwOajQOERn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de58b5a-6253-44c0-e5d5-08dcd2295295
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:16:50.2793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlkNN9lwaljZnDf0vqRo4m1Tobx041dUWEu42dPwOUtppCXpJCQWZ9hzAGXt+DTssUXX3hnel0pWBhbpk8MJKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6878

Add usb3 phy and controller nodes for imx95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - reorder nodes
Changes in v5:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 425272aa5a81..2377b3ade95a 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1188,5 +1188,48 @@ pcie1_ep: pcie-ep@4c380000 {
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
 			status = "disabled";
 		};
+
+		usb3: usb@4c010010 {
+			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
+			reg = <0x0 0x4c010010 0x0 0x04>,
+			      <0x0 0x4c1f0000 0x0 0x20>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>,
+				 <&scmi_clk IMX95_CLK_32K>;
+			clock-names = "hsio", "suspend";
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+			status = "disabled";
+
+			usb3_dwc3: usb@4c100000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x4c100000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_HSIO>,
+					 <&scmi_clk IMX95_CLK_24M>,
+					 <&scmi_clk IMX95_CLK_32K>;
+				clock-names = "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy>, <&usb3_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+				iommus = <&smmu 0xe>;
+			};
+		};
+
+		usb3_phy: phy@4c1f0040 {
+			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
+			reg = <0x0 0x4c1f0040 0x0 0x40>,
+			      <0x0 0x4c1fc000 0x0 0x100>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>;
+			clock-names = "phy";
+			#phy-cells = <0>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			orientation-switch;
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1


