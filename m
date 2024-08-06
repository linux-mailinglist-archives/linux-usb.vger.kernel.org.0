Return-Path: <linux-usb+bounces-13124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D277E9488CC
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 07:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 169AFB229BA
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 05:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFC01BC07C;
	Tue,  6 Aug 2024 05:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XVqgy8i+"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013023.outbound.protection.outlook.com [52.101.67.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7C1BBBEF;
	Tue,  6 Aug 2024 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920794; cv=fail; b=ALwcEMZkojQj9/Yzp8KtyeBOy+jc5tdWkru4V6HcoEz6Etvcei82k2QXQE9mTstTWXS1qCjTvaMNd3cV3VQSm4jG5miah3nBSxLtLGEm/kRbB/E/eF+aCIpJnGyXRl26eiJYHTUEYYsxC4CbgomeNnGl+bXkskpMzqB+pglMAdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920794; c=relaxed/simple;
	bh=GX9GfyDn1fmFYQxeuqXr5mxdcNr1Owly3isfF2jQ9bQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vaz1F2Gv+4TxAl1pmFotPVL6ThxdzDKeAnnXSP1chvGIUuZkohQupXLHVvbeFkDWR6DlxPxgxDNfw2icswz32hZEfj0XKx3eBV9ritpceAuiqqTUcEduDdS1mz1N/bggkviGj/06Die8EMl7L+LuEZZ0iKrQN5B21BNQFvUIAIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XVqgy8i+; arc=fail smtp.client-ip=52.101.67.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZnDiydOowlVDUmazHAxfxBUIv0L+2JOulV3Wseyj+6IEPEWqt6XMv+uGjQvUkLNUYObGbvOV5AoWcbrKTe4ou0YFb14r+jNcBEdEHqxrsFlEzZxi53cVjRy2B4Yg4H0MHui3HdJpv8UceB8jcFJCZETwD+jfADh+vL00vIgAXJosHUVpFkbiiodxacjFZxOa7Uq4sEKiOsf/wINLyB8z08sBA7wWRGqxRq5125FtsCMukdtyahYtFB3/tCW2AkFHLVhvKgcw6EZ1jJBGi6p+9ASesSRQfXoJ6EjnDF+LSqoupQ8jU4yoR2GssG51YVlfLSkPQtdLg05zqlqfQ3o+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXEfgmieagnCZ49FjC8cs0TBt1wAYYdBupL6+UXjdpY=;
 b=mxBuTrze/geh1ATfAnxRR8BmXlt6Htgr5ZhahglxTnNuq40RuP0J6azC7dOsEQwGAdxlEAmoDWIKINynatwG6LNxTKGhZUHnmj+FjvQ2BgqxZFVp0DJkQtIW305cSlC2GUQ3ppAE4ZAN2B80UbyYUsphRfGLSA5Wg0gOafjWpOnMzhNCZuxCvKdHiULZ0+GlvWIB5cogHKHmhJyT1SX+xYvgFOG/IqnVuPkt44/NpLZTz9kbTlWGSzyBfsfC3IMOLATj33Yl+L0SM+E89OX8QO1cIGSIUUqFVy3D8Fb4IkyinSBL2WOQGA9kFdrtz54RfMatmX8H0CvBAvirffQSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXEfgmieagnCZ49FjC8cs0TBt1wAYYdBupL6+UXjdpY=;
 b=XVqgy8i+lL47WAUexjJ+sfMtc3b4MVmzGpcSLmEfgVwu8GRMajh8NI27GmU/dffDIlRMh5lII+UruKtgZU5A6Cb6/1PSzzZhPNK3IvvcippGxPp8dczccOxSr7RFbPKai2fj4UXf1ilby+IERVrZgyTBFp+D+VdIorR/WghKsaHgFkqFsPVjC76g2BXDVNvVpt+T3D9xYt3k3K6qmwrjpdl+3u0EHWrtxU4VRV4bsWXhG/jUPY2IVGIItdqptCL9CKnWKoNtCS1VBMWhIY1rlFPpyxAX5olPV92XGxpWBl5Vbh65o+QyLAxL5RkXYL3eDj7ZgjtVGCd5ocJNtrlk5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10211.eurprd04.prod.outlook.com (2603:10a6:800:240::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 05:06:29 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 05:06:29 +0000
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
Subject: [PATCH v2 3/5] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Tue,  6 Aug 2024 13:06:37 +0800
Message-Id: <20240806050639.1013152-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806050639.1013152-1-xu.yang_2@nxp.com>
References: <20240806050639.1013152-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10211:EE_
X-MS-Office365-Filtering-Correlation-Id: cba50985-7b36-42d6-d271-08dcb5d587a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CT4hFvxMh4KGS8vd7X5W5Td4E7oSGr6YtAXDT0a5TL//ZFJ9l6lRMCo3h4O8?=
 =?us-ascii?Q?3i/7vbkA3ld6989JnKRSMv0MRM96/XbpC3dpGOSudQTqQuI9KNYN21CPBSTh?=
 =?us-ascii?Q?aX5f9r1kZ02izemhECTOk6tO2yg8+uHzJRpWuDA47Z7nXHN5E1cKRkN1OQkr?=
 =?us-ascii?Q?BtzKdg04OMLDvnVhY/nwchaZboAieQiSlsVhCz/71YPRktz9GzZ/9Kai/xA7?=
 =?us-ascii?Q?QPWyzhVoYSKJZJGZ8ap3V35+ytN0FwySstQsXwEhwrbOVkHDHz/IbW9D07oH?=
 =?us-ascii?Q?kFDLugOS5e6NAbo24aYRruE0Obl5xCg3URLnW3hqBga/DjVFdXviW9Qq5MZC?=
 =?us-ascii?Q?OiEHSAY75cVS6NbZQsWHeeZ0kwPI8AXNrdYloV4I43XtUdyIxBhOEHTF3oWM?=
 =?us-ascii?Q?5E+pquvVIQ5IqTHPf4dMN6xV0vW1CTBHQy81LzwW3dIUWJzMul7IXc4Hl2AV?=
 =?us-ascii?Q?ufowBetDkuz97JNcH62ITP6Hn0hWIFpfn/0ZIZAGzYnFT1AOHZ/oGdF7cDDW?=
 =?us-ascii?Q?8iLt2cUFCttdHLJl3QdGto+7RYA/axI9awB8fZaDPgxkuHb/ARWCTfFIxr0k?=
 =?us-ascii?Q?E7BPlj2Lq96A2phLIdEu3UOYVBHIJMjnWjOL7yiH+L1XL5MVoN0MUHSxzvig?=
 =?us-ascii?Q?G+Dz20gHPj32SUFyiUq69/m3Rl6JA9txVQqN3Rf+fEPkPlgAmu78izq453Rs?=
 =?us-ascii?Q?IM0LykEowNybcj7BvCuLXJSX3jQTZ52suekawChev0CkGbeGzyFxDmoN/wnc?=
 =?us-ascii?Q?vIj6+2GpgSvMo4+YqZrGA7Wmc+Mfi6aa7WvjUFYXuNDQt5aA3gyt62f0gtSk?=
 =?us-ascii?Q?brG4ycriGz1zPrY6LG45Vr3cL/uJyG3o8gkhAC8kOhMMSnT99jaZ3FzWvwj+?=
 =?us-ascii?Q?QMYy3zfdRECIeoi4UWzLnCGqWR+LK/qe0YcE3lSzus+xbXIpUAUrNigKEyNP?=
 =?us-ascii?Q?+SypADaaB793so4HaKopYnhIrUiplrbnig4hVyVtUQqiYNHTAwHDHKYLkXkF?=
 =?us-ascii?Q?/ud5D7SL/dnRa0pVt5M6Kg8dngs0PV7pGcdcC4g9o92BsiIUBPkrAVnyts/B?=
 =?us-ascii?Q?ltIbrb62ceMHL9/3Cg/lFICkSuMwvPaRgWWmmxHM0XKpc0zemTWLR8Pk+aVW?=
 =?us-ascii?Q?stnHOBagIVRxw82AEOEC6qazTF7Vu4bqSuLzyXdm7hpuqWcHyFXnwv+amL5l?=
 =?us-ascii?Q?SEhgtm80l/z0UT0RsTH1Hejl67GmJhfGshjcjVVIFy/OcbekiedW+tAKTMAL?=
 =?us-ascii?Q?jCscj2g14h7oPhv1gAqcEY6Ik6o1dQ8gSPqmmpVWz0URy6nD6+7QU29JlKZL?=
 =?us-ascii?Q?HRTxhfZ5UcV7Z920g7OE4i73eRnH74bgqbzhroWqFDJJoxazHz9OPhoPzFMZ?=
 =?us-ascii?Q?wKEuXrlmkDdNq31yz8SuZt+LiTJM/9sutIs6J7HzYPfEde94igxXyy0k1ypL?=
 =?us-ascii?Q?nHs6ugwPNdY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1kU68fAnWyVrU7eAfU8WGDRDAovJ46O+8N6Efh0hqiD5SuQ9Lgr6Rtx+e/FQ?=
 =?us-ascii?Q?gDJmvN/FuQrIZ3UwngTcZnR45M8at/syscUnVK2M4csoW+CRtlfMSm6gDrmm?=
 =?us-ascii?Q?J1Cw74nkrh23FwxwT0y0COVltgJJmsmqg5gDozyEyNp2kyVVYxoSCmv4hPlF?=
 =?us-ascii?Q?5RdtBWjV8ac1mlSD0lWGtXvxeE0nQ3niRr/xR7YpAOgU2tX6+xZu6wQrQ5aX?=
 =?us-ascii?Q?P52wcf70w5V8Y0wHotpSXJASTzKZ6jn5vCZ2m5xd0P5V59iMhIgBrnyx4jNB?=
 =?us-ascii?Q?vaz8UQXuoUkh7AHzGb2ztOQQ11YcJhtgyJVu5ozB0MZshWLaXk16nHObjiSD?=
 =?us-ascii?Q?LASqv7iKxsGFadBQVbtVSCzj32Ax8MqAtKDmKWS3cc1RP5tcBTXuWJgm/GH8?=
 =?us-ascii?Q?kFkkR6TJTboXm+fr5vIA97hnhj9F0vKV6o2MAiChvmJn5jZrKAJItkA19Hey?=
 =?us-ascii?Q?7bMon6LZLZA1sV56V+/UxGHDnVg2fnvDpvPFMfPLVY6lb1ATnZ5/AWQqcFCF?=
 =?us-ascii?Q?f3b+cyoymAPif2O4i1BdwdFBvA0QEzv9AtD5laoFBKY1o4O37XvFMEYhPRlc?=
 =?us-ascii?Q?JRoQy/6foLHxYGHvrHHHTmlHfNw151aEyp7Z38sVxKXUXl9Gtpe63JXKbIaH?=
 =?us-ascii?Q?kbFlyahZzP8Y6kR1jl5QZ1qaEnmjpBuYJkV80kV35Ykh6+vl35vRehtWv1Uu?=
 =?us-ascii?Q?trzf8JpEme7nrcesNeNef+t28fDDH68PmZPf0Esrk7rDYAZkGLJxxNJeV9yL?=
 =?us-ascii?Q?c07QzAhYh2G2WzXQ+LwBc+hopNStfYcBg1XC2G4ZBCG4MyAJz5MVtYXSQ9AB?=
 =?us-ascii?Q?rDUlj/QBbUf0ViXsQYTe0juL1vyrKtRQjqhk1yqtiJhKXUb7qrXP5TRQyXK4?=
 =?us-ascii?Q?7LlifpcBtHOa0f/IgeRJ56gw8Rc8bLkQsIe5ha//70YZPMt1jUGLelwfBwTZ?=
 =?us-ascii?Q?amhXdvCnwxHZJ5NF2hg7DRUubqX4/hq8lpydTbvC6wbjWr+WGi29DfaUqkwu?=
 =?us-ascii?Q?9QpHGyxVsZbfPtU8pcyASOGf0tVVAce+TZq7Gb7ZyHGfS+fiTOFSC7QpIGvk?=
 =?us-ascii?Q?+QJszIL+uEEAI/3aMQt89fzTmzSDrot4q+7Etmtu++pg9YL96dA1YA+SpbEq?=
 =?us-ascii?Q?F+jVqGnna/Mo6w5CCI4LqeXCTtDG012vJSZrFfucDnOlmTd9EVl/Hy1hDhL6?=
 =?us-ascii?Q?jqkoTteTf+Nc06V0Wk6lVRIDsLBkx56ECm8ioEZT7A2xomp6LDzx7UYsYyEa?=
 =?us-ascii?Q?1DuPLXnIT1pWMN2/6Kl1bw5JtnuqY57HvLC3PyrDeJdiVS8eu7JCAb1l/mZq?=
 =?us-ascii?Q?CYIFdgwKDDTIDkcTGHdNkRVHQQ6C90xMYmQDsd2UeL9USKtSivBgOkMyn8pO?=
 =?us-ascii?Q?HPsrowN66EV59E/4RM5zhMGAJbad3AULc/OQ5RwT2ztQ9URgmJqCAlD+le2v?=
 =?us-ascii?Q?6jEyCpdptfq3UryLu9iKdOPeuCIWXX2WGaNUGGtaUeteyNPkYIX83/YLcjNv?=
 =?us-ascii?Q?4dJ7jwNGS9bDqvYe0wIjzqmYzuIVhcRshW9vkupyBhHIAShKkacOEe+sz94C?=
 =?us-ascii?Q?u/Kr3DkCSOW/Aj5P2jshbUlufDjqURwaqosGucaE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba50985-7b36-42d6-d271-08dcb5d587a9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 05:06:29.0525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpAXoMIOl6QzChaiJhqiWqy9PIz4VcDFGV7W0ZL4yeHEdpYPl3DUpDeUE+ofNS3Wn5Eutkt2sBdPLxJ6RMLYxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10211

The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
two functional blocks (XBar assist and VBus assist) and one system
access interface using APB.

The primary functionality of XBar assist is:
 - switching lane for flip
 - moving unused lanes into lower power states.

This info can be get from:
i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.

This will add support for TCA block to achieve lane switching and tca
lower power functionality.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Reviewed-by: Jun Li <jun.li@nxp.com>

---
Changes in v2:
 - return the value of imx95_usb_phy_get_tca()
---
 drivers/phy/freescale/Kconfig              |   1 +
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 240 +++++++++++++++++++++
 2 files changed, 241 insertions(+)

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index dcd9acff6d01..81f53564ee15 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -5,6 +5,7 @@ if (ARCH_MXC && ARM64) || COMPILE_TEST
 config PHY_FSL_IMX8MQ_USB
 	tristate "Freescale i.MX8M USB3 PHY"
 	depends on OF && HAS_IOMEM
+	depends on TYPEC || TYPEC=n
 	select GENERIC_PHY
 	default ARCH_MXC && ARM64
 
diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index adc6394626ce..8bd6d91951a2 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -10,6 +10,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
+#include <linux/usb/typec_mux.h>
 
 #define PHY_CTRL0			0x0
 #define PHY_CTRL0_REF_SSP_EN		BIT(2)
@@ -50,11 +51,66 @@
 
 #define PHY_TUNE_DEFAULT		0xffffffff
 
+#define TCA_CLK_RST			0x00
+#define TCA_CLK_RST_SW			BIT(9)
+#define TCA_CLK_RST_REF_CLK_EN		BIT(1)
+#define TCA_CLK_RST_SUSPEND_CLK_EN	BIT(0)
+
+#define TCA_INTR_EN			0x04
+#define TCA_INTR_STS			0x08
+
+#define TCA_GCFG			0x10
+#define TCA_GCFG_ROLE_HSTDEV		BIT(4)
+#define TCA_GCFG_OP_MODE		GENMASK(1, 0)
+#define TCA_GCFG_OP_MODE_SYSMODE	0
+#define TCA_GCFG_OP_MODE_SYNCMODE	1
+
+#define TCA_TCPC			0x14
+#define TCA_TCPC_VALID			BIT(4)
+#define TCA_TCPC_LOW_POWER_EN		BIT(3)
+#define TCA_TCPC_ORIENTATION_NORMAL	BIT(2)
+#define TCA_TCPC_MUX_CONTRL		GENMASK(1, 0)
+#define TCA_TCPC_MUX_CONTRL_NO_CONN	0
+#define TCA_TCPC_MUX_CONTRL_USB_CONN	1
+
+#define TCA_SYSMODE_CFG			0x18
+#define TCA_SYSMODE_TCPC_DISABLE	BIT(3)
+#define TCA_SYSMODE_TCPC_FLIP		BIT(2)
+
+#define TCA_CTRLSYNCMODE_CFG0		0x20
+#define TCA_CTRLSYNCMODE_CFG1           0x20
+
+#define TCA_PSTATE			0x30
+#define TCA_PSTATE_CM_STS		BIT(4)
+#define TCA_PSTATE_TX_STS		BIT(3)
+#define TCA_PSTATE_RX_PLL_STS		BIT(2)
+#define TCA_PSTATE_PIPE0_POWER_DOWN	GENMASK(1, 0)
+
+#define TCA_GEN_STATUS			0x34
+#define TCA_GEN_DEV_POR			BIT(12)
+#define TCA_GEN_REF_CLK_SEL		BIT(8)
+#define TCA_GEN_TYPEC_FLIP_INVERT	BIT(4)
+#define TCA_GEN_PHY_TYPEC_DISABLE	BIT(3)
+#define TCA_GEN_PHY_TYPEC_FLIP		BIT(2)
+
+#define TCA_VBUS_CTRL			0x40
+#define TCA_VBUS_STATUS			0x44
+
+#define TCA_INFO			0xFC
+
+struct tca_blk {
+	struct typec_switch_dev *sw;
+	void __iomem *base;
+	struct mutex mutex;
+	enum typec_orientation orientation;
+};
+
 struct imx8mq_usb_phy {
 	struct phy *phy;
 	struct clk *clk;
 	void __iomem *base;
 	struct regulator *vbus;
+	struct tca_blk *tca;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -64,6 +120,170 @@ struct imx8mq_usb_phy {
 	u32 comp_dis_tune;
 };
 
+
+static void tca_blk_orientation_set(struct tca_blk *tca,
+				enum typec_orientation orientation);
+
+#ifdef CONFIG_TYPEC
+
+static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
+				enum typec_orientation orientation)
+{
+	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
+	struct tca_blk *tca = imx_phy->tca;
+	int ret;
+
+	if (tca->orientation == orientation)
+		return 0;
+
+	ret = clk_prepare_enable(imx_phy->clk);
+	if (ret)
+		return ret;
+
+	tca_blk_orientation_set(tca, orientation);
+	clk_disable_unprepare(imx_phy->clk);
+
+	return 0;
+}
+
+static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
+					struct imx8mq_usb_phy *imx_phy)
+{
+	struct device *dev = &pdev->dev;
+	struct typec_switch_dev *sw;
+	struct typec_switch_desc sw_desc = { };
+
+	sw_desc.drvdata = imx_phy;
+	sw_desc.fwnode = dev->fwnode;
+	sw_desc.set = tca_blk_typec_switch_set;
+	sw_desc.name = NULL;
+
+	sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(sw)) {
+		dev_err(dev, "Error register tca orientation switch: %ld",
+				PTR_ERR(sw));
+		return NULL;
+	}
+
+	return sw;
+}
+
+static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
+{
+	typec_switch_unregister(sw);
+}
+
+#else
+
+static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
+			struct imx8mq_usb_phy *imx_phy)
+{
+	return NULL;
+}
+
+static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
+
+#endif /* CONFIG_TYPEC */
+
+static void tca_blk_orientation_set(struct tca_blk *tca,
+				enum typec_orientation orientation)
+{
+	u32 val;
+
+	mutex_lock(&tca->mutex);
+
+	if (orientation == TYPEC_ORIENTATION_NONE) {
+		/*
+		 * use Controller Synced Mode for TCA low power enable and
+		 * put PHY to USB safe state.
+		 */
+		val = readl(tca->base + TCA_GCFG);
+		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
+		writel(val, tca->base + TCA_GCFG);
+
+		val = readl(tca->base + TCA_TCPC);
+		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
+		writel(val, tca->base + TCA_TCPC);
+
+		goto out;
+	}
+
+	/* use System Configuration Mode for TCA mux control. */
+	val = readl(tca->base + TCA_GCFG);
+	val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYSMODE);
+	writel(val, tca->base + TCA_GCFG);
+
+	/* Disable TCA module */
+	val = readl(tca->base + TCA_SYSMODE_CFG);
+	val |= TCA_SYSMODE_TCPC_DISABLE;
+	writel(val, tca->base + TCA_SYSMODE_CFG);
+
+	if (orientation == TYPEC_ORIENTATION_REVERSE)
+		val |= TCA_SYSMODE_TCPC_FLIP;
+	else if (orientation == TYPEC_ORIENTATION_NORMAL)
+		val &= ~TCA_SYSMODE_TCPC_FLIP;
+
+	writel(val, tca->base + TCA_SYSMODE_CFG);
+
+	/* Enable TCA module */
+	val &= ~TCA_SYSMODE_TCPC_DISABLE;
+	writel(val, tca->base + TCA_SYSMODE_CFG);
+
+out:
+	tca->orientation = orientation;
+	mutex_unlock(&tca->mutex);
+}
+
+static void tca_blk_init(struct tca_blk *tca)
+{
+	u32 val;
+
+	/* reset XBar block */
+	val = readl(tca->base + TCA_CLK_RST);
+	val &= ~TCA_CLK_RST_SW;
+	writel(val, tca->base + TCA_CLK_RST);
+
+	udelay(100);
+
+	/* clear reset */
+	val |= TCA_CLK_RST_SW;
+	writel(val, tca->base + TCA_CLK_RST);
+
+	tca_blk_orientation_set(tca, tca->orientation);
+}
+
+static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
+				struct imx8mq_usb_phy *imx_phy)
+{
+	struct device *dev = &pdev->dev;
+	struct tca_blk *tca;
+
+	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
+	if (!tca)
+		return ERR_PTR(-ENOMEM);
+
+	tca->base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(tca->base))
+		return tca->base;
+
+	mutex_init(&tca->mutex);
+
+	tca->orientation = TYPEC_ORIENTATION_NORMAL;
+	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
+
+	return tca;
+}
+
+static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
+{
+	struct tca_blk *tca = imx_phy->tca;
+
+	if (!tca)
+		return;
+
+	tca_blk_put_typec_switch(tca->sw);
+}
+
 static u32 phy_tx_vref_tune_from_property(u32 percent)
 {
 	percent = clamp(percent, 94U, 124U);
@@ -315,6 +535,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
 
 	imx8m_phy_tune(imx_phy);
 
+	if (imx_phy->tca)
+		tca_blk_init(imx_phy->tca);
+
 	return 0;
 }
 
@@ -359,6 +582,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	 .data = &imx8mq_usb_phy_ops,},
 	{.compatible = "fsl,imx8mp-usb-phy",
 	 .data = &imx8mp_usb_phy_ops,},
+	{.compatible = "fsl,imx95-usb-phy",
+	 .data = &imx8mp_usb_phy_ops,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -398,6 +623,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(imx_phy->phy, imx_phy);
 
+	if (device_is_compatible(dev, "fsl,imx95-usb-phy")) {
+		imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
+		if (IS_ERR(imx_phy->tca))
+			return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
+						"failed to get tca\n");
+	}
+
 	imx8m_get_phy_tuning_data(imx_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
@@ -405,8 +637,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+static void imx8mq_usb_phy_remove(struct platform_device *pdev)
+{
+	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
+
+	imx95_usb_phy_put_tca(imx_phy);
+}
+
 static struct platform_driver imx8mq_usb_phy_driver = {
 	.probe	= imx8mq_usb_phy_probe,
+	.remove = imx8mq_usb_phy_remove,
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,
-- 
2.34.1


