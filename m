Return-Path: <linux-usb+bounces-17543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC7F9C6A50
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 09:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E32E1F25909
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2024 08:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCBC189BBA;
	Wed, 13 Nov 2024 08:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l0sE1ozm"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2044.outbound.protection.outlook.com [40.107.249.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE35175D5D;
	Wed, 13 Nov 2024 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731485293; cv=fail; b=dXfNS/7seS+S2Cm0opCFr6LsdeUP83hFAi4rUvDBGKi9IDC3XewW4XlNMt5yzfcYmymm52Y37N1pNUuNe1+P7f2XfqLF8eQk+Wmk77WSY8ua+SOrQm6OXt14DqhHP8fXmkpLqhd5M5caik5hRq5kdiA1hmC2301TQ14+sQoMId4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731485293; c=relaxed/simple;
	bh=oeG6ugg2jgBdVVo1C/TnVGY+FLJT0veJPuFWf4mqHPw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Z0SCPe4FT4dybc6mZW7TGQSPUK5UaiGtu7CFaOvz+5ZnRmcyYHVXfqMV3/PFN9MEvPdCswMg3a840c4hiiB0+t7NxXHxHWOvJG7KmQQU3wgqPgdqKknl0jUUwVSJpbFes3u9pUGGQPtUq10V6LD34ASF4FdJHJAsx6F08yh2/rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l0sE1ozm; arc=fail smtp.client-ip=40.107.249.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFIFb35jVDFqgKBINjd0dD3S2uCAu8XsbOmotaPWeEAvCxlh8aUslZbTfvgpoUjbsTzLkWdOmnyZU1btuTQ3yvkS5zYiTYFgwMRLL8hVNFLBATfIT3dyZvDIrzY6rn9JHATVYf6hAv3dTfNnc+6jk0yJGidberTLnqcbMYbvu2jErFR+d32CewMLCYhp1JUyPKyqRiZm1IUMsqflSgY6J1ckY6fdEcaN9nfFI9U1g/rfgH7Muvh9E2Ca5X1c63HTNsZXZQnRWRjwTgZprmUSwgAInWoTOxlLrug45VML3vHUKNu6UscqhR3iygPADD7tNxAO4MhKV/f8/6J6aVXIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cdRO14VgoIS5H64PGmgFpT153i6GVh/y5bzFX1MhZc=;
 b=JqJ3ur8RNiMRf/0or69eejTFpyZyyNuHYxmF+y+330oucNhQAOHbWSVN3ix+GQhNcmXWvFc753kcphABxc4lT1hPEIpFjDcoH6N04+MzO47al2FA4CMKLhmpmqZkwjtRlCxt4W69/ANdE+0w+zP+kighpuaaJ48X7bz1dqqp+EL6P79cuFSHXNQM+ccVSrQ8x/lnTis7N9JRsqbfT1m6cCPIHeaamZhGLyLM5AmjmBEXBBfhSLs+wX3Hssc+GtMx38qR2iYBtQRxZj6YGnUyZqJQX7hD5DT82x3X8FxtTfianaBfWFbWeaf3hRMV+kjNZpSodCS6RpUaynfLWZ/Tkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cdRO14VgoIS5H64PGmgFpT153i6GVh/y5bzFX1MhZc=;
 b=l0sE1ozm35+XHUi5JSjacKXot8h5Ctz4iMHOOPtBOJq7ZJfYvt9Qqth/QnjNniYQi9jDvLDGbfPIAKKgpwZPGgdA1CkYKEE0IhRUbKUsHVRn77q6RCN7SUHETG+iZ9MPApb/V8MCD1UBs6zNnHuFU27jDZRffaAciUJ4+hZvyPpFCQ5wyWiU9bL3z4/Ce8C1CKRm/9XU44FL00te8g4zaVQwRwE2ilYBIOfwXNH1vUK7WXWXKPc/Io2Ol4C2/Ip/FNUqGxSVvJ48EsGa+r/hdQtJgzSxhUF1za0JIHEUMGchLddKOOeZtSqdLFfP/Q1IORydPFHRylRzCWNWNxhi8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 08:08:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 08:08:05 +0000
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
Subject: [PATCH v9 1/3] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Wed, 13 Nov 2024 16:07:43 +0800
Message-Id: <20241113080745.2300915-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdd4bf6-d0be-4257-e37f-08dd03ba4cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YoHv/hiDiZ3muD/kXKW4Db+Ks3zn5UaAObKYuk5nTrZOfLfS8skAsSxPPQ4k?=
 =?us-ascii?Q?KDV9sO1d95w8m3PYJ1p/wLZB5+SK4QAW99dIvnfCWpxqh+9+QOvlwjWgDHQQ?=
 =?us-ascii?Q?SCIbqFpPUAZRN8zf1Hzz1VzevWmN4AEETa6gdBQtqTSRpWmBbGD/9Rt7jxQG?=
 =?us-ascii?Q?id5rAcgBNZayeZ1QjLJDUU+Vf1Mf5NMngW2ANY2YqqGNgq7BGn/irKPy0wlj?=
 =?us-ascii?Q?OUQoWtD+jh+LzUSW9h0+0+4T93Co1e7hc6t0N5gQLwT7sLKiB+6OqOqq8Zoq?=
 =?us-ascii?Q?K1L88HU4J0OnVla9Ee+KjO5CF/wM2YRquPBiOcwysq7/4ppTr/Z9w1r8XzXy?=
 =?us-ascii?Q?giQ4liwXlo/WAaFFuCsKKTpxkbVB5E/42b2AQa84orR9JoEcCmHha9hRZ2bg?=
 =?us-ascii?Q?+NU4nG5fNNvMNZUAWLskcHkYKxYP8UaR4zlnGRRKG+g+Xn1uWl9WIuyb4AI/?=
 =?us-ascii?Q?N4vDZXPXTrvvGTLjkFO+CddBIh9ud+P3OKNybbnLsNo4pzp8AthqvGv0Ccml?=
 =?us-ascii?Q?DOhOxPm1nQuGc/Ni4AVburNmRzxTMb66H6e2OZtXsnZ9HkpiTCg+6XEmDbQo?=
 =?us-ascii?Q?h4sHQi5n5IzsSuAf568Wl89U9uhS0fdNw9a0Kin5cdS3mOCkuX4FsFUh3DhV?=
 =?us-ascii?Q?9zNCUydtQ3MXXmdzDpNWIVOuRDC4zjTn6tzPg4HLgEz3kbWHFSdLQefIjab4?=
 =?us-ascii?Q?8KFUIt3mVeircdViO6wiJ+RXN2nrjydsjwr12w/jU6/ggjdoDt99jkIFeY+j?=
 =?us-ascii?Q?kGveukA+N2c3rLKWHQOeFyozxS2rJK/m9dskjPumvubpABu/g9h9ge/pal/X?=
 =?us-ascii?Q?/qdUcR1Qm8/S8izjYI5VzaQVDrIPTaKF8BL2Nkjf1gz99TQtkx6Vdy2DcwmG?=
 =?us-ascii?Q?QaiLhttSF+C4eF9mr4bOgXpPhvaaeNULG7eyxHmGwyOnhuzMVNPGIuqFyKxO?=
 =?us-ascii?Q?4VRwxcsrRdh18J/kxT2Mx8QmDMOBi/HJJYtgJJ/6xoX29eLKn6n6Xg9aQ07V?=
 =?us-ascii?Q?1xvXE+WH8J8HK+WRGFTE8wbEWTN8P8CbGjQaMHHhHcken8rYAQOj6HwT8iCT?=
 =?us-ascii?Q?zTmy6J4cEL5WFLcrIwnmSWTbAiFpOBGooSVj9hccnKh91Y0gzgAlaZ0+dAlO?=
 =?us-ascii?Q?/2q0cbTsDnVCzTrn1hgQ5Uu8Y1nw//bX22IWTnFl2ht8FeM++xCjIhwVoLi0?=
 =?us-ascii?Q?RrNFrqc76XUuInucKsJCmlrNtHBsQCPVIQgjD09HR4oqU1Rf1cI4VOYlP9dF?=
 =?us-ascii?Q?8B/qjNq4DuWC7cvheiOhT6lq0XEvqdSST3qRBmVLS2lonTh6Iw7NATUTZZVY?=
 =?us-ascii?Q?L1AKx8hn2GBjUcplGO41bllBqo2mNtVxBkEqXysojG/GS+8Kz5JHZ7jxfZde?=
 =?us-ascii?Q?St9RR6D30pNYGqyI8LaVDnbv5crl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BIqxC4zAbBaEGN/ToNSMbgAczvHbUlemeOneBjjnJNr68zh6sDA85+S9htJv?=
 =?us-ascii?Q?GjVU1G1pXE+2+huBP37Vr5o1DW3YAAqKFrcnx9sah3viZmNEhfOwoeTd0X/1?=
 =?us-ascii?Q?zXq/Ktk7ocePNvvH7Tw5+OCPXbJ3VWgJ4lUNO/OqQbqW/1Euk94FYDQPDbpz?=
 =?us-ascii?Q?EY5jANBaeD+oAG4CjopHryJOgEa9SosakmGEsHueT/pYYVShQjSikfMaIvDa?=
 =?us-ascii?Q?rThDb07AOeUDrPMrgqqZbN9VDDFPg5hDt5tkPmBa71v9o4w3OPBYR5U4AwLI?=
 =?us-ascii?Q?d2WgzoUdSp87I3FjZCO9EUip+ak6zeiG/3OiK456QIINsjXY9rfKLfO8HizG?=
 =?us-ascii?Q?3gxlGtjnVGnoUon2h/ynvtN3fi/dCIpK3nFNb8DF6ZPOyTrVAJekBN0KKGil?=
 =?us-ascii?Q?9OzI3NuP0P3efowHfkAFrNjTaNt6SxNxD+O+hBsEGXgpX4bQXR/dTP9zg/jn?=
 =?us-ascii?Q?FFuEmcaG7c/JDWjDrbc0Kmkw9rDMScjlIHTswjWgb7U9DVi/boHsKh8ny4SV?=
 =?us-ascii?Q?456YqEqhU0/9v6wOOV1c+UIHdxnKNfjm0VB9vPPIviG25Dnzfs9865pFLwHM?=
 =?us-ascii?Q?4m9jGBak04tfylnMgWRs9hmwFJxJJdx+m0EFntGuMzVIafxbCBRQm4xV/4vN?=
 =?us-ascii?Q?e4lcB2JGHRuyzPcMrzhs6zytz3L2XXs2J9wRrELy5NBC7WLHfLskBfGU5HrL?=
 =?us-ascii?Q?sA4gOZ9aSD4skvD5nhQoPRr6X131b3mWaijHr84a+ZmyUuvFcHkrRgiLu9mN?=
 =?us-ascii?Q?pUOsa9r8AjBYrhXBk+uyHDY4QDN26oqYVQWXCdXy0uKBu0Xl4Tm287fEhFg/?=
 =?us-ascii?Q?haENdDAwQK1yI79NU/vCtShCJm3gGWywr7iWVqA0tCJnrBlNVOccR73Cu4wZ?=
 =?us-ascii?Q?T4Er9bSeJoQnh13ooz3zainwfzNvB4lzIN3uGTSYb6yzaI9Lmmm6iLLe3VCy?=
 =?us-ascii?Q?VtNXICMBL3+dgcYoW6l44Dgr34WvjZZNuNXmvXfDVoqSY12i50FNgCTvktHP?=
 =?us-ascii?Q?GUmuSEJTgsBAg5V5Dce96WF7c2SaCX+QzQBz1IYOhmhmvCE0VlJnNptgZuos?=
 =?us-ascii?Q?O0yo96fkxBgfg/fmocQxumtlHfDX8zGr5XTDWidV7pW7W0/qeay3hMOlR08w?=
 =?us-ascii?Q?hwm27/bYlC4z3lvO+wYa9Zd6EVTunpdtGgoYAyG9FYYxH2mIHxV0W7E+N2NO?=
 =?us-ascii?Q?BzkZXL37qzGFKNpdxxAMJcSEJLX3u/URQ/Rq0fcGIPw7jc8L8l0WBTzJ0zpS?=
 =?us-ascii?Q?16YDis2Cu8Gf394OAGZVeP17GwVEvpeWVLkGoK2N1ZgcnWMw02npF/1h39sZ?=
 =?us-ascii?Q?2PDtYzzdGg7QxKswkPCUMy7ZvGNJLXNJaiwQnPpk67KjKn+avgSZxn/LDWo5?=
 =?us-ascii?Q?Yhcaz/qy3qundf581EoQSetv0m52YR/OlDGVrSTlnOtgW1jNCKIQlQi3h/P4?=
 =?us-ascii?Q?ekKKA1Jl6axS4CluDTYBzr6M+zEKGPyvGdfglNW+rAhT1H+9zpTMovhZ/QjV?=
 =?us-ascii?Q?XfB+3GtED9Bac22QvkQXWLUD8sYB7uPpPbDamaM0XYqJoOqAO8nXx/JiGGu5?=
 =?us-ascii?Q?Uo1jvcB3hiQSG/O5pqy1zRegMh2i0lEU4tX+iHnM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdd4bf6-d0be-4257-e37f-08dd03ba4cf5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 08:08:04.9545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KT727gIfDpNHNUvAaZCgWsIYYnDZpI0/6XzPmzIHBc7huu76bcRzhlTNvc7GMLRd1G2Jd6MMLG1XgHHC1iUbNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

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
Changes in v9:
 - no changes
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


