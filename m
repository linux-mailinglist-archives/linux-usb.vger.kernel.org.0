Return-Path: <linux-usb+bounces-16227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 452D499E528
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 13:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF9DB282B09
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 11:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D831E490B;
	Tue, 15 Oct 2024 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Orhuf05O"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC221D4341;
	Tue, 15 Oct 2024 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990551; cv=fail; b=Us9TFXvGK8vClgOdFmFtRuWQRSLf/C5WnkXU3fQJw25/lw3t+dNwRbrol9gQJ2unc6hUXIMoSFny5cmefLTuJO7DQDD2gEuCii1PXYWl1tkv4ce3j6cX5P6iI0FzoxRS5hKNFnp//hkxHMsyQN2vPAmK8+u5p9X7+EuAGo1biGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990551; c=relaxed/simple;
	bh=pTUfaimh4t0RB6FSogAgjOME4sygksbnO3RDTXMUwQk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QI6oUPjOWWesC/CUq76BNAm9wdFhaXEMH3u9M5exovozqk4jW5hDy9FTyzf5MFJbC3q4zs26GiVoARt+g5DkCxS2PCWrEUrEgDY5UPR7VWN7H3jA3End3+nPMXFWrgkarFgCLKxsa1Spkf4VeSNmveccYp+xt7qtNCKPLCkw8C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Orhuf05O; arc=fail smtp.client-ip=52.101.65.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9s5k+/VxG2ilati91LWzB0ojb9ZAA7zH+vGUUIJJJfEwkofxZPibLokhLx7e4cDcD6TGXe6tyATtZwPYDu073NHKx5ARLD1KOkrI1Qz33A7RDDv73FYnTohQWpOmYXijkmn2ZyH/Bk8skk8AdKkIRMheEElygKFsi5kASFBKXeDvCTMU+Hcp98ol8maXhDeZEChpU+Y5TtVpBH5IFLT8bxsYEbxWe+qdVEV0tNfoHklsWjAzhSjmuM/HV/n15Axy7nP+CUf4dHk5eMjC2FKdQo1moomd3i2/C8x2A9XyrAmPMKkl2QJHsrXT1rUugjdv/ixo9flAFKdXsWfUCZkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7IqDHdpzCIKRAH+HHS5ld1fjo7FjJ9Q5KoBfc0nR/0=;
 b=nPMKNQVt5noDi5uQqk104BbaZ6/tIi067dkJe0w7tLIgE4SAYKIjwvgef8Lp1fxXMoqzuwhFtNc1kMB1GRmtLqaLL1JgjtULBu9ggd7FPNV3BSen1FZW27JUm5C4BLp6s/+lD6pqcOoc4/LIsqqzB/9cfP6lE1j6+CBvjj9zJF2fibjldsUsKgbTHx5J2ZFhRmrRMpkPK+Omk1/MVOE1VDnCSraNpxsHSmFWnn/IbaTY3k68v1KBiuXcaI0Fx22+954Rhed/r0/QZyXAvSpTUfb9VzOGHFok68WZh1FUObjuljNnCX2xoOMKOlgPtazRQJQHtSl9ZtzpTttfWnrDtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7IqDHdpzCIKRAH+HHS5ld1fjo7FjJ9Q5KoBfc0nR/0=;
 b=Orhuf05OeWQWM5ymcYB+OOS4J+FDcTsvs4pD3svlRoBgKEvmAoW0CJOXDxQbMhiU76wSKTco18j8402Fzu3SjbBh0+3UnnfjuI2x/1UwUQew+NaHdfCOxSd4fR9X5RYGI+uk1Qgky9ucvPzFF8uf6UGfq/4x2FvonHqJUS5i3D7fXRSsN9Fdsv7nFyvHP9GbK8/BJKprj6WZxFyfIGhZkDAtfFQnVwPIC9MP7TnjsKfrPcYLC3fjwrCIhlnvwjvTQW2OhZ76mgyhds6Bv6RjQLvj9/32Bi2M0tVM5giRLDBxUJedvsCHhEEk7xVy8XLkl7wk5iSeu9Aj/0Xp2os8Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7701.eurprd04.prod.outlook.com (2603:10a6:20b:293::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 11:09:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 11:09:05 +0000
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
	peter.chen@kernel.org,
	herve.codina@bootlin.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v8 1/3] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Tue, 15 Oct 2024 19:10:16 +0800
Message-Id: <20241015111018.2388913-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6c740f-5ba5-492f-3147-08dced09c827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uxyeNK69buILuy5rhveKp38uoVlw2d580M48POoc2HQ9/zhShyv4hGPAByzh?=
 =?us-ascii?Q?OmqJjNzQ8srxeL8ZWj6eyi/HkTto7HHk2Owz8nPmDTylZ/4m2l0+B2C5GQDT?=
 =?us-ascii?Q?2GFGQpfZsc5r9Y0iOK9gIb3tdij2+ThwXXri6cQt0VZdM1kDVLnGLfQjG1q2?=
 =?us-ascii?Q?6/X7y9OxZjIlDuK7GX4f7t8Bvq8E5SkSjVjRIVgIUNYjvSp5QySEVKi/z5dz?=
 =?us-ascii?Q?y6LfYxT4RKs05R8H/w0FZoitqxeYOui9wsw3Wf/IQHr8aOmhT9HRxy770BSO?=
 =?us-ascii?Q?VLWB2O5HE5iJBHYlEYF5Qo5YaemubYjX6BqeCMGf7TjXuobmKU5RhSDNfFgh?=
 =?us-ascii?Q?W8/sZPATwXgL00TKJEmv1reQa7WQ9KWIHjO1EccOSdQoLe6t7ZJRnNUBHdJA?=
 =?us-ascii?Q?g+9UrpBasKP/bcfxIgCq06ibYxPbfwJr8z+2MguxCsZbtmZ4Z3phaQ+s24Wg?=
 =?us-ascii?Q?Kr1OANQRxiyJGTe0nEPNSKNRqSMldM1qdEawugakOXnnV+vb0wPjt2fpawu+?=
 =?us-ascii?Q?4U9WvsmM1yV4zD9YXJR3d2D7h+z+i5sbYP61Q92HmRA9VnUUYPpT4ItIylHE?=
 =?us-ascii?Q?0mF8wFPg6wgoQimLguQ0CSWSczA6WslGshgKkeOviMxKplqFVH4R+kGeNJPH?=
 =?us-ascii?Q?W6zXLg5Et3bqQVPPR3LUOKRjdRhYm0lKz/IneMDz6GpmzRsU5Uv7f6Q2UPTh?=
 =?us-ascii?Q?CTkQ13I5M3YCAFbUKPPJO6I3q/L64uBHUESruboZs8m9iDBqpwmm3s4OgAR5?=
 =?us-ascii?Q?g0Wkri4dOx5dm3nDevf5CSBybiZL1Lk1Ds3YklMYaQYb8bgmVoFvgVWSxehm?=
 =?us-ascii?Q?tPsei09zx4x0Es6fswG0NcfWehBKx2JGqGwhJsFHSC4qU1fIqdtvXIwRrUW/?=
 =?us-ascii?Q?fXdNiRdGsBxGdtAn/1vzmLJtAybCUHjye20k7UUBpGhMi1kxMrffFcMwDQn2?=
 =?us-ascii?Q?akvYZeTTmUaxQpyRGse2qVMFzRusZtTh0TlD4D6u3Zipo2e0XtoO3VDZY0MS?=
 =?us-ascii?Q?9wdg5bF8f19bSFCrYXHUCrD/yt3JZ9l3bN5n6lNWSgMWxLqhlmpBjTT7xASS?=
 =?us-ascii?Q?CLPfH9169EklkQ7J3PDHa+xdeLL1HYEOZVa4PvvsqnY7KrhEGoYChzK104yo?=
 =?us-ascii?Q?dlIiLRPSLUXuu0+wlhH88ehvlvElpXezeepQ8X5zFjozGx6p3fQKHBOSpg03?=
 =?us-ascii?Q?e2cXIFa3B8tKzAQ2UIhEIingsf0k3TK+cCEmLOytyiWJO5A6shJCVFlgnvPX?=
 =?us-ascii?Q?o4Ai/juQezSBfgUY2NvCPZ1BFcQ5RlmYprU7RrJw9+OnJcSodqayBNhGT03L?=
 =?us-ascii?Q?DIo/rbkA0LXtz077aBKIvyz+P2d2KFUSP7xQmuSxtzuWjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2K73RsoLbFYf59J6wlT3PBUjEKWG63q4CzscVoqSGuNS0AcwoTrpT97W1u5G?=
 =?us-ascii?Q?ZGsWRrkuhWA55z8Sgh2yG3+Hfumz5cD2WoHdtlCcppl/VmZR6kc32CMj8n8k?=
 =?us-ascii?Q?kxx3t+YR+ZYgN5ckK8EuSeiuPUr3lqPGj278QBsnKRGDb9l5M4wHYCzlOyZu?=
 =?us-ascii?Q?ZSzu8ELNjzRR/ZiU8Yz0N0k6Dcc2tyMv7+TB1pFckixC6DPG8iwUk06Mb+AW?=
 =?us-ascii?Q?15w/C5tchejJLHxCs/Vakkkvie/Fq9Vsy65o2pPyXadFKqVSneNpTZb7Un4G?=
 =?us-ascii?Q?NNKhjfJ0SUswIt0qy/njxugK7IFyFYGinBH+NyHuz4RPCoT19IviLtSoNHWr?=
 =?us-ascii?Q?POmyqZjuheODOjtk5bxrx8CuvHWbVaWkvZS3nTsl3aoJRFWYDQ01YO531fFM?=
 =?us-ascii?Q?c3nzFS23U7mhtpXUZjB8GBE1q8lpZj7d3cCzl91k3qH3Q9vZNUX+itlQTcBw?=
 =?us-ascii?Q?HcD1EOJ0ZK7cuxa8V6klNJUBodOc4oFUsGI/H/dmju/sJaTsNK9Ammnk5uD3?=
 =?us-ascii?Q?k+LxbaBnt3exyeywPFXjJ1FsqO/W2gLTeTYLMcWABXnUdd947nFoRCfwwBIG?=
 =?us-ascii?Q?r+YQVsTaczq0pUYqiHwlWRhuJa000Tjv5B18/EDVocl3UaOZnCX0wR3n/4Da?=
 =?us-ascii?Q?feKfmjitqtryEEJXqHrdyUux9FPXYlRjsqy3xWhOgyrNsqwLpsJCCLFwbBRY?=
 =?us-ascii?Q?/+vXgR4GK+ZZrg/6DlxxsWX93c+20BhPDlog2HtfXtXn2K3KNZ/tbFjkEWxi?=
 =?us-ascii?Q?Rp2qPmh2zNTgceXIrjp/u2XWRlBcD9rVRCKTGo7G8l2xY9AMSom9cdOc99iL?=
 =?us-ascii?Q?dfv4U/hSNfPmwrR1+YGO+96coXAjsFrDy07rcma500s6dYz2WE84HZBOT4X7?=
 =?us-ascii?Q?E3OrCpKfueEth/yLL/2kuMj3J5DxttSviAD37DTol40qQtgdob2iV7vJK2h/?=
 =?us-ascii?Q?8iKpOxB/1iDtk656XfE8QFARdwEZQZBr9G9tP96rGOXNeRO+OGpwmbA4rj8S?=
 =?us-ascii?Q?bLFnZEofR2FeqVtFtB+JK92UCNVVPv8Yzi5St7QmmsAPrXRUdSAVXq1MO0bH?=
 =?us-ascii?Q?qNraVQj3ayaMGY9Q7ZfOKNwcZ7V6G2aOb83BitONINxQCp+cha6b8Qgb1V/p?=
 =?us-ascii?Q?RPW+HPtXpZfhnjfAD6W4JfiM7gKzA/+Hj3dGgtppeMCaLmC39bmK9h+SSh75?=
 =?us-ascii?Q?LblD8gHNZtUEPdYzeycFFV9BrsqkaTd0wZ4P7GVbukMw71Mcc+WhP13Gn+bm?=
 =?us-ascii?Q?8WxWOY8FYXvWRFTdaVNk/tylIdOXii8H8gDy8oC0rSLNHrN9Ulm6DbFYll7Z?=
 =?us-ascii?Q?QArDEhAdlikoTItitFi0VbxfXh6LQvboIGyF+b97SgRCAQKNXNPE1yqxvmiM?=
 =?us-ascii?Q?13t3hGtve3LQMzDvrpLrouIJ++vuvAnSnw/zY/VSC3c6qCzvzjfUUCjEQmlw?=
 =?us-ascii?Q?/G7EhH0pIjUv05mg3Rwo2zq+fbdvd8R9AIUhgw7HNN7TriVqTPoQbZUFypG2?=
 =?us-ascii?Q?lnTAjEFWlmo2RkK1aEWZUup/UeEhJtmoR1ps+79Rz+LVd5ifGkXNs60JNdyB?=
 =?us-ascii?Q?aXbg/iGfH+/xhemJqejbPdQR/jkipHDqvHa+1cdY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6c740f-5ba5-492f-3147-08dced09c827
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 11:09:05.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nigpec1Q58oZo4cIev7SNAnjvTaghiewz7pUNTiorCg/4fH3eN2aWn9jVavi9dCO7eAUUvw7na7eB88TROXihw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7701

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
Changes in v3:
 - no changes
Changes in v4:
 - remove compatible check for imx95
 - check whether tca register region exist or not, yes means has tca,
   otherwise skip tca setup
Changes in v5:
 - no changes
Changes in v6:
 - no changes
Changes in v7:
 - fix sparse warnings in imx95_usb_phy_get_tca()
Changes in v8:
 - #define TCA_INFO 0xFC -> 0xfc
---
 drivers/phy/freescale/Kconfig              |   1 +
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 243 +++++++++++++++++++++
 2 files changed, 244 insertions(+)

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
index adc6394626ce..f2b2da8cedc3 100644
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
+#define TCA_INFO			0xfc
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
@@ -64,6 +120,175 @@ struct imx8mq_usb_phy {
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
+	struct resource *res;
+	struct tca_blk *tca;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res)
+		return NULL;
+
+	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
+	if (!tca)
+		return ERR_PTR(-ENOMEM);
+
+	tca->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(tca->base))
+		return ERR_CAST(tca->base);
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
@@ -315,6 +540,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
 
 	imx8m_phy_tune(imx_phy);
 
+	if (imx_phy->tca)
+		tca_blk_init(imx_phy->tca);
+
 	return 0;
 }
 
@@ -359,6 +587,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	 .data = &imx8mq_usb_phy_ops,},
 	{.compatible = "fsl,imx8mp-usb-phy",
 	 .data = &imx8mp_usb_phy_ops,},
+	{.compatible = "fsl,imx95-usb-phy",
+	 .data = &imx8mp_usb_phy_ops,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -398,6 +628,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(imx_phy->phy, imx_phy);
 
+	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
+	if (IS_ERR(imx_phy->tca))
+		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
+					"failed to get tca\n");
+
 	imx8m_get_phy_tuning_data(imx_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
@@ -405,8 +640,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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


