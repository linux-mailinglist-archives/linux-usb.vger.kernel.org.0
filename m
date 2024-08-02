Return-Path: <linux-usb+bounces-12879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE553945AB8
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 11:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D27581C21F2B
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 09:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6411DAC47;
	Fri,  2 Aug 2024 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MurLZiPr"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013056.outbound.protection.outlook.com [52.101.67.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0DF1DAC4F;
	Fri,  2 Aug 2024 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722590218; cv=fail; b=J9n360VQdlZO2JErY9pRCBmfNGXpGPvvgZCuGNshSjOEj4d6lVfYiLTIvQijB3LdayN9WcrNAFuCQNuD+8W2orevTm9ZteK2Yz4uGEgsIaoLhMLHQXx96YJSimt+Ytu8RqUX/Q4mT3bzCaTgy2csMM1eoQbEtdeHicQCeEb5RaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722590218; c=relaxed/simple;
	bh=+ecjUQ8gCYGws7GBwVXhCvUp8jvOEUz7p6E/ATp5nRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UOpAAuCZVTT0ulCq7L83wQwAUbvS5va3MmQmwSvHzeTtEAEOv9/FrtTDVhaTkFCHETAo9QsHOrbW0aTiT7guK8CxWDpmUpQz7oJkhZvZuy9agcCZg/CYysIgtmDP1Nq+LNopVJ/I1P5fQTv7smh52oknAfQ9BUmGeILeriEdzmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MurLZiPr; arc=fail smtp.client-ip=52.101.67.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOr+w6WsBZ5nAG5trolWoTrUVrTby/UOjJsP/wBZ+MrVKe7qOlIj5tRH3tPsK7MVZ5lve3aRPxJsMgh2bZJRdmrXRIMw3p4oP+O+IVCgdvf8kiH63UQDbZ2yTzO9AzUAp3XVfwl2ZjEvnT4QpDlUh99heIH8PMbNmMKRIiQ9H06JyY2mr75oL804mtb/wugu6a2BjsNJB9pAByOHYeXWFM5/OSTlV8CBIfYqbADkqCrwtXEZ26YLPVJJyfrzz11IUFYmg2uH6YEzH7n5MYx4U24/yoharOhE6VO+cvNWulYtZzZrX8uOsM5ZJhI/jM9EGOsvW0bELl+zizJWH2ra1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip2bHsqjZX1Rl9vpaMBg1l2/rxhT8b1jIUsuj9HJrvY=;
 b=H7N+jIi3dNrCNNc0ESvMvO2TsutXWrNZmSL7kRn9teQkwL7Di2Xwy67tvkgSdfW87+IjMISEflVNHfq1IYQjVvm7BtlcUUcmIdkRRTXbjpIT3JRT5uTFm4s6HEhw6gpc4bITlGVA9MjdVBllzuWXMs1OtfOiKoUCTWaJXABekDlSqJtU2DJJPA1/pe84tBtWBASdUUrF1cOlm3YtDa/1bjptgHZ4tTEbi6mVk79yeNGibVdRniMrzHts25c/br17EANR7HMRdSP8iyPFLaZk1shbzl/Rb2yNo/Ip4kgYjH18cCjKZNWbRhUp8sHrwTRt0PocOIRwzvUB51KyYlOyAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip2bHsqjZX1Rl9vpaMBg1l2/rxhT8b1jIUsuj9HJrvY=;
 b=MurLZiPrBJEKX5Kluq5DAnrNjJN2hLwqUCKvJR1V7GoWUyg1Yi5xFcyMKYKJO7qIxcvVI803ptMdt+mg91vHeetkCKmZTfk7Xt3wf9vpAiwje66vCjykVUqp/lymVVC1zEbwGAUBesrP50SSxARWPQm2oHvTIwD6H6Y7AGYHLSZFSY3esf1rI6JVoDsVxuvKUx3rmR0wfQE2zKxZlIMKrCM3Ys9LBe2wxvQluoOBbXf4FyX4cbvub4Fnb7lisw1P9xWZ1/0dthZTdZoUCmfVDZTo6LmsV/sL4KykfCQ/2P8InxRG9NakU1PEhGQPyg/3uv/RNULett+0sgOf0NGgfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10577.eurprd04.prod.outlook.com (2603:10a6:102:493::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 09:16:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 2 Aug 2024
 09:16:52 +0000
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
Subject: [PATCH 3/5] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Fri,  2 Aug 2024 17:17:00 +0800
Message-Id: <20240802091702.2057294-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802091702.2057294-1-xu.yang_2@nxp.com>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e282605-8e7b-4317-9937-08dcb2d3d8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NLg73NX26NjrIlherJLWVV7YQKndeaT1I7TU54Ll5m4kApKVpKmNm8VeT3iZ?=
 =?us-ascii?Q?Ec6EUA+yF00Ij7DLBjK05xKXHuitkTf+Hug8YihCz+csJi6ZcccO/d3WrX9e?=
 =?us-ascii?Q?hyBut7tbcYQtkDHuJJpM0dj/gy/kW/hmDjVEz8iP2PMZBVFPEYARgJypfy9n?=
 =?us-ascii?Q?T3RX0S3G15YavM4nlMZGEwoPR4KpUQYDsL/gHtYzBJQWPlopom7YsEKMzF/x?=
 =?us-ascii?Q?8luDu6YWjRbDdvaGWEuqDPfQuMUqDyxqnmPJi/VcuGQW7VST89WTCQG31pYg?=
 =?us-ascii?Q?Otb28yxUWeNys+TEXFsuokGJrKbv3XKEKif8fl0NMzFbWm9ZpSzCq6TANXL9?=
 =?us-ascii?Q?HKLymjco7c++brfmMKdIf2L8b8i11M6JjNfnc11uaJcQlFmNlad4RXLsyiCI?=
 =?us-ascii?Q?wfRvrnbvH+JUlPgObcoU0OvAKwT5mF8xlKjxfsjWYjGDZeX0aTewpyKujCQB?=
 =?us-ascii?Q?pxkDaayy9pWEaSKUGy5UFL5iOOh8Ym80Y4NeLzxaVirHO7M8ViV7rsQi0S+P?=
 =?us-ascii?Q?BuMAnWW5BrFoNkPOkbLJMoLk0jpis1eYuBACi3f7bLwnQlDbNOGpoXZ0JlQ9?=
 =?us-ascii?Q?/XIKEsb0AZzfi0eXF0Azg44FEwpVC9Efi1JPen0X7/cuq8uIMnEoAx5LvJqx?=
 =?us-ascii?Q?O+ZYpLE+DqyC3Ar8nsC0XjIvZDcGkxAVJFE3x8WJSDJISWWYv/vzJrYZlGE5?=
 =?us-ascii?Q?4mt1UhSdvxD7MZKW3JqF7wDxKY/1t7g9hkQSVdEQO7jn2jUHunZaCX8Bucit?=
 =?us-ascii?Q?PDUKTuJFEQSSB+cKQpGTEOsHH8X4BhS2RFlwXOGuOddT26fySXmbY9raV4/B?=
 =?us-ascii?Q?QViWUwruoL88G1B0Ax5qZ/IvOPLeXaYIKvOV2/tpzICIjEH7NdnD4sWp1tUE?=
 =?us-ascii?Q?3RcyKZQp1VtLkrwhSnKh/zzDWCYdgLnIK6Pia8/o6jWDhRIQ8eJ9uAp/cgRa?=
 =?us-ascii?Q?Xx/E9i9kzunJ60+KqRm53RG7EDGg2nsUPG+NZFlLRWXUsV4XhfaB2aGD72YB?=
 =?us-ascii?Q?W/YYsMf5SrNo2gTyD3zI7bsTuNfwwIJVwiGQNoWbPru8RMX0wJO/HwKPhe+0?=
 =?us-ascii?Q?azNFO4k1ZfpsqSulVjtVLc0AHXqpNFpiBY8BE9gGTp+Gdq9hrAxQgdSz4p2H?=
 =?us-ascii?Q?p75Uj0qZkHxJvrQc9++pUzgWJKrowoGlLDLuzuMf+aOz8ENBOJpfUWejcnwJ?=
 =?us-ascii?Q?qIGny91LmZm8wF7sYa9QMT1YNjExnePBxlh0gfU/a4BL0lTX0VCK+bo0+Zx0?=
 =?us-ascii?Q?lYxoG2Qv2Wy4fxr74gt6Sjqjb/lJRNoFhqFlXl99TXUuJ/Qz2MLETcufp6E0?=
 =?us-ascii?Q?ACQOO1d1FYU72qhOgXlR69kU10spkOuFG1UGspQO2/Y4S4QXJ9VksmjR+Rz1?=
 =?us-ascii?Q?LnRB7OUOQtfS9gdEC32msA+JM/QgTosJBcMx6bP/ZnBKs2nErZZx7VyVm6ZU?=
 =?us-ascii?Q?SMAhdOeB2p0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EFNpn1wO9QEAnyuAfT30VbRnggqxHZ6kQJUwD6B36FMH573sEwgB7FZ+qCWT?=
 =?us-ascii?Q?J8sofuAsW4WVOzQ5Pst0nW+hUUOHW4DLIguHUDC3DpJqCyDzKDiF7HgHoLxP?=
 =?us-ascii?Q?ouAvx8SNimptgQA2fr/6eFjSjpVK+H7gQK+LxZrsG+Qfg5SuXKT/NqY99kFS?=
 =?us-ascii?Q?qIah/pEWnRWQ9ZPuqus5ajZu0C512057DESo8Wmtqa58vBDkNxz96oxDMpAc?=
 =?us-ascii?Q?9RceVQnebuqofnzq5UQpZdS84Na0/4ReVjuCAVfcZ2u9IGfJbKJ9ibocRH6B?=
 =?us-ascii?Q?424bF2f4fxcVWxNVV4ygQcNRpi1ScGkrnEwjnYvN1iOIxH8h69B862SJF0Yr?=
 =?us-ascii?Q?/FNyQBLwKjnxLXv8050XT+tLM0gV6TI+5mxPQtMR258hc37g4GRtJA0RTxaY?=
 =?us-ascii?Q?mpMVb/sYzhn9oS0NPl/Mq4xzBpVH39FtUNOl0SRsnWTaVhdA/gqFU9sl+eB6?=
 =?us-ascii?Q?S8B7WB1PXe0TzFtYpWAvs5v1wbMevZKbrNkS+rJM0+C3BZgK4fSnqyo07oG2?=
 =?us-ascii?Q?jH93gS+kXU524SzW1ajpYmCEyCJAoRKp3kr/r6KmE06GTU2RHKE+11BYX86W?=
 =?us-ascii?Q?fT1SsCj+LPkPmmzuc2BoA3fOIf4xq1w6sWb6ZnrvMwtL2zYvcc1l5GTdk1aR?=
 =?us-ascii?Q?sJK3PTJnU6kWnuskVQ7dcgY2o5X/ZYtEa74lbdJt74ZyHhhSr9LyxE66k1aS?=
 =?us-ascii?Q?ghCPbRwikWEtbHkO2EI3yEK/SprZGMACnj8HP/rbH/EOFVjcNdoXERICTPJV?=
 =?us-ascii?Q?MUK3P4QKVd/OIBc+0kTESpvopSd6GJt2qnxwMa4XvWDh7pI35Z/Txh1YWoXa?=
 =?us-ascii?Q?A1hhn6acjXVOVOZJphyTsH/B10uGWXOHfuD7wuiZVPYe5LXMCggniUm2GJEh?=
 =?us-ascii?Q?/uPW8HnBU9BmTk6AOBikZ0sRXHc8KYmTiTNqsrYOdH/42+SDvXS6v3j3RIEI?=
 =?us-ascii?Q?QJX0DFflDP4dX/CFVBNEklomarBMifBYHDZ9QcKxtteWl1IyQgPhuvg2hFjs?=
 =?us-ascii?Q?lnyYxIzndsIE72s9RBIphduTNTVNnxvVhQK68u2Hqzb++/skmvl8n8DhTzhf?=
 =?us-ascii?Q?UaRfGf35tOj5xPyTrkxJ/PsZE20HoCa1eRJa5DPcO+7l0zFmygesYi883DUX?=
 =?us-ascii?Q?jYtBn1cSPpdgyAN+t6oSFblaNQCS67l8tqT1EAQx0ie1uL8gllX+QyTOrpYB?=
 =?us-ascii?Q?N8oU2laJGNxSwS1OoSEkMyQ6vjWtfEUHyOEzPHbi3BtvtW2j4XyyNel5D+M0?=
 =?us-ascii?Q?EjpfXB3dKQ4qtsO82ijJwOgC6KZDzjHgd+bsONYzM0OagVFY6RVWICvoKCo3?=
 =?us-ascii?Q?6HVMmCVp0Kf6Qcbc6mEZvoGVOscocNogC6+m6eo6BYFxL7GIlwVU7LnAsvxh?=
 =?us-ascii?Q?b8/xx1RGSF137d9ZnsHHemktiFElbtI9UCxDUKDGQnWiA1HFgIghLIQcBf95?=
 =?us-ascii?Q?bwg52LMbY6GbAkY/P163dwPedI6aKUZxAU9ioAxNaujdVKKQMuhabwx1RYf9?=
 =?us-ascii?Q?MX4KIzQ6tG5ptHmYT2WZ2R5+O3ubMV0Y/IxFFMtxZvrjK2kk0wz2yUN2iYGH?=
 =?us-ascii?Q?dXh5vQ1pvPgZEkLXFTZ8+AGBB9J6VfMjtauv5Mwf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e282605-8e7b-4317-9937-08dcb2d3d8d9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:16:52.8494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O93nkoD/LfeOojGk8UDyfZ98V52cfVzmZwS4q6J3l6Jk7kfDT3rIcfppAVdEw7e6mqZxfVC7GukbzR2UVJfQqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10577

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
 drivers/phy/freescale/Kconfig              |   1 +
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 238 +++++++++++++++++++++
 2 files changed, 239 insertions(+)

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
index adc6394626ce..18d00cec0665 100644
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
@@ -64,6 +120,171 @@ struct imx8mq_usb_phy {
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
+static int imx95_usb_phy_get_tca(struct platform_device *pdev,
+				struct imx8mq_usb_phy *imx_phy)
+{
+	struct device *dev = &pdev->dev;
+	struct tca_blk *tca;
+
+	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
+	if (!tca)
+		return -ENOMEM;
+
+	tca->base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(tca->base))
+		return PTR_ERR(tca->base);
+
+	mutex_init(&tca->mutex);
+
+	tca->orientation = TYPEC_ORIENTATION_NORMAL;
+	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
+	imx_phy->tca = tca;
+
+	return 0;
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
@@ -315,6 +536,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
 
 	imx8m_phy_tune(imx_phy);
 
+	if (imx_phy->tca)
+		tca_blk_init(imx_phy->tca);
+
 	return 0;
 }
 
@@ -359,6 +583,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	 .data = &imx8mq_usb_phy_ops,},
 	{.compatible = "fsl,imx8mp-usb-phy",
 	 .data = &imx8mp_usb_phy_ops,},
+	{.compatible = "fsl,imx95-usb-phy",
+	 .data = &imx8mp_usb_phy_ops,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -398,6 +624,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(imx_phy->phy, imx_phy);
 
+	if (device_is_compatible(dev, "fsl,imx95-usb-phy") &&
+			imx95_usb_phy_get_tca(pdev, imx_phy) < 0)
+		return dev_err_probe(dev, -ENODEV, "failed to get tca\n");
+
 	imx8m_get_phy_tuning_data(imx_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
@@ -405,8 +635,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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


