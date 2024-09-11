Return-Path: <linux-usb+bounces-14932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD4974A47
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 08:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9A31287F4D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 06:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA14824BD;
	Wed, 11 Sep 2024 06:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VWPE/MmK"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0318D1DA5E;
	Wed, 11 Sep 2024 06:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035409; cv=fail; b=mKBfENSRTgGFcBM6B4w9i3VT0dZZl7FkrTi4wKqG/mU9JQzf6+2GBlSi7YLoaG3DaA4J+UNxHEOUYgAO+lBYnDk2a2XsYGrzXxEbZ+uc3Wb5YQ+tBPBn8knrUbfNCjv1l1eX7ztVTQxa7129iairq2AyuDgVxNMuhIfPxaSAPz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035409; c=relaxed/simple;
	bh=hPNt7HrlF44PgGfA55Jn9XW5b1m+JgI1/XKTL8pr584=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vqc4wb3eWC8ZaXayUGbmid3dmO2IKWPwftvnVIv8Pu74bmQ8S0/MguPY362RXNpjDhB2414cZctPutY6EbP4ut1tST1zlxA/L7PNSnopazU9TIeUL6S/EQH0mx0wSYK8ZtDzIKqtHE9RqWaSFOwLwf9ZmGIKZaPYzDr2CzSWWKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VWPE/MmK; arc=fail smtp.client-ip=40.107.20.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwyD+MiHnFd+MpIv1pCMovXK2d7QKyOgqTLdvj8mH1tBpnn1GVa3wBDxNWJ3amrDEYggiLsgOhBd0GkMko0MY/sw5FbShYegLySw7N1onRUeXX0gLbkXfaayfOGHNmpJaWBQdqscaOM8QLiH77nS6HSrtYEiFuR+CcoB2t0tJAUnYs/r+DDsyKtIVSAc+ejgfwddZGOHyEoU2urpNE0APHBtE3fZn/Jo8Q7QLWd+Bs+jaYfCzKNRU0FA912eODT31WvsNpNXNoywaUIt+t3+2b18yAaQFBy7T/9Dyw3C7JG/chxNm7MfIuDstO7Bb5TXFFHF1TwOTT8PTP70VxOmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHjdUHh4sjWrICd5p3QlPzAa2C9HiIrX8YNyz4dm3jU=;
 b=TN2vZNxEC0cNdzC7V0pKRCKIYYhnvSB9GcHh2kyiVqhYkLohz3OaY6RLeTjun12mfa0JBAiYcIeC/gjIw46rLRkCtTYNU8iGAf9wQpFDAzkMw3xF/GheQq9Ibuvy57CZpjtvpY+FgHlW4iNgZ6fwa18YDRmBvqpOxPTe9zYylpeA4Lbrtc85H4sH9RW+7IyFrhVkSpZ/rhsQLn9X9jiEVeH6SCFgfgMiODXQAjqpzzWuG1iQjCTQI7r+upfXNYy3FhWK3vJSK0AN8Xo98IYm+tfkYVy9D28dKuIpYFRxxagaKC8hMRtOPfdajGbYqHeXVAYWkBlkb2pmlbAf9+Mupg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHjdUHh4sjWrICd5p3QlPzAa2C9HiIrX8YNyz4dm3jU=;
 b=VWPE/MmKeFQgjtZJuWQYuuWP1P0DVypZyNZjwmLyrjw/Wf3FSvhYd7y9ConuYJnDPXkYf9B4w15oCTK7PYTBIDKyQIU4AY9Ys0AQ40cEu4r34jEuKpyDvlQ4WT7KQ/FHIhBmPXG10WLZ64unliGbuewNJTsLwkFgzG4FcoLJuOLAXoWHTzJPgpLFGwapZ5cvI/qxweXcRGwrGUpncB7IcWwhIeF5RcuK6qOmzMeIydkZhNjAb7EOj7K5+95rN08HnjPAFawyYuGgAsPWElVKrdu4zeelGpra9megoY5X/H7t75QEnfykyNoZnpZ/2J7is1+TGdYl/Ok4hczy4iN54g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6878.eurprd04.prod.outlook.com (2603:10a6:803:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 06:16:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 06:16:44 +0000
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
Subject: [PATCH v5 3/5] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Wed, 11 Sep 2024 14:17:18 +0800
Message-Id: <20240911061720.495606-3-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2bde6e6f-9142-42af-4147-08dcd2294eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pcq6m91yj3GsKwPqOrb24JiZEYdjUcpvW4Of8LCNjEqvf5h1LYLuhkqIVCsM?=
 =?us-ascii?Q?vI44qG232LdR3/poU70d4gA5BmYmDdrXAbPzVcj4sl/xNeDkcDuUcaoRddY2?=
 =?us-ascii?Q?EyIfJ1LzS2Vfyow1sVSKc0tqzEqNUuQm9TvQSRUj1IpsU7i76NPBO/pYRzfp?=
 =?us-ascii?Q?Rweb0fJ2/J7DSVFITQNYR0h73NYI+oEaGvjHoQTHiTV0jvmhqa2hqZwghSPD?=
 =?us-ascii?Q?J+e8FL8uPW2NygDW668ugoTBbe6j507SX93WV0YJJ77WnCkHmY4qU2PRp5DA?=
 =?us-ascii?Q?m9LAtXSP0sZZ06x34zac/wODTWRaHVddjO+U/H/co77wUpwZDFkELYQE1Xi3?=
 =?us-ascii?Q?Ud+BpRhXNgmjdJVHbguoNj4J4rW6VsVXrX1EmLohCfe0MbBo4n5fPhY+Jxp6?=
 =?us-ascii?Q?3Jbk8PcE64DQ0UB/1T+Yef2bxsVwPaO8u2d2DLIjO6z2QHyU7ZkVCkRGTJXq?=
 =?us-ascii?Q?gyzAWPqnP6L43y2PCvEUEDaio8cW84OIRLZUN+d1acCrcI4Xm101Fc9xgY7g?=
 =?us-ascii?Q?8NwFr6Pl1hwWaceeuL1Rw4IDz8MpMGgwWrzMe+8g7JmrJ7sMU1K5gGc1TGcl?=
 =?us-ascii?Q?9QdglolZF8aWTOcTwq7hyyj4z6OpOWe69Xt88O3SUtZ9amyBq2+0BvcSFkvK?=
 =?us-ascii?Q?fVDkJtG6szXxkq2XHk1Qtf0vS+hQaBqC0qqlz/fL2OuSov/fxOgXemyM/5LD?=
 =?us-ascii?Q?YG5mOE3kWrqcN7rr6b2MNEn6j294Xph2oBbzKTT8vZVqgQBKMNDQjFo160U7?=
 =?us-ascii?Q?WylBsFCuor0fG8H2ZE3qzbwjhfC4btc5C+ESprQ+Y6pvXdPpDpTjEkRGBy4O?=
 =?us-ascii?Q?W1qPqr6MJNQuM722Lpit0NIoL0HHRZZaZvxA3o0Mq6nOruzhpDjBW9/1QOhv?=
 =?us-ascii?Q?94DwfLXp8Q4q4vHYJ93+ZHVsa67rJcchqRG8BOUeTap96fWobwZEyXFCP0ty?=
 =?us-ascii?Q?Iqgkg3aTpJaf0RSaKrfAlSUHiV5ZwcjO5Ngl11adFf+Uf0uj0oEF9M7QbyQl?=
 =?us-ascii?Q?UKHuoT4HLVNXLCdmQMNj0U9rxX/gs25KKtauyDjC96mKKW4Zph5r+ikTUm49?=
 =?us-ascii?Q?6j848BKRdyQPJ5oUnxv66R4/Y3wHN3oyECg72sOU4Hkpp6tt2XzY2fC5BmFF?=
 =?us-ascii?Q?wpc139wtFBTwc6BDSEDm2yy3fW2Vudm91pTiT0IoLRmGjMKGWuLbCBeM5IuL?=
 =?us-ascii?Q?ns4QeiQCV73Fd8Mx5RjOAq5Cm16LKys5TuiB4/oV5BiUP58Dxy4Biui3EKq8?=
 =?us-ascii?Q?kD+7uOuLLgeDzNmEiv892mcBAhZQQ/bvDx9e/0LUo7E01SAB2LhTC+0qvQVW?=
 =?us-ascii?Q?XSQ4OQjIFnoc6oT+51BuEyWfOJ0d8KdCF7i5lemDrjtFIlpKOuotVKsjbRWG?=
 =?us-ascii?Q?lzxFXJS2eQH3OCHqL2TDgZs3YMy6PL4NMtTw77amSBT1HcHcQ/qTjj5RihK7?=
 =?us-ascii?Q?EruuV2n5BbA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PEbZwlYNxOPRYKPypOcSG7xIPe6ElW9asVPp0AZ7f8oIauBPFQd6RxUx4+n9?=
 =?us-ascii?Q?Kshg8qQjaaZIrjbWH267LK2rImASkbCwQ7DdEaN563gyJhXe5tXkq/G3BdEt?=
 =?us-ascii?Q?42wdUudJNtrSfqo/jnl2/gsvwBoJ8MDpp//Wv4pVlrQRoeyMgdyZE0LkCGqI?=
 =?us-ascii?Q?DpplUfA1cyBaEv6iA/PGyJeizMbnMlgLEbErnDrPIQ445u4h2d/zypJuxxo9?=
 =?us-ascii?Q?K/JvTG7phS5ch6nUC12mtcYkdaerCylUMI5Jhmr03Fi2uFaOq9q4oCzrfGG4?=
 =?us-ascii?Q?eanQtjpCaGRfkVMZx3C/iQwvW6qkyzfVogX6CoUjLcmezJ3frvqHJC73wptG?=
 =?us-ascii?Q?4Vo9wI1bl7LaE+3PqFO8Ze//IEpRciKoRip7l3C6hMO98w69Kjthd2uJdCuZ?=
 =?us-ascii?Q?hVOb+MxdLJ0chOjczqYuGNpg3BEILCeLG0We/sDdVIJty5tcq5LuFJKSFtRb?=
 =?us-ascii?Q?T0ZKYGzi4S7WIMTQhdje9oOqV0exDgc7VNa3Lb0PZp7EYoo/61hOqtJzCbk5?=
 =?us-ascii?Q?R3GIn/eug3dJ9lfDfjyk2w5k49vKa6LNydYBVsBrmqtk7s2c4goaW0GHOHL0?=
 =?us-ascii?Q?O8BWOCySoQ1GrAskIwWdn9J8YmqYCZd4HFdKHnaiukW4cVEpMFfWII+TsNpP?=
 =?us-ascii?Q?f43o8eVhTkE3vBm17//b7gEgn1WkOBhBRLrQ6eKqzFo25qhcmyI0z/zK3Liy?=
 =?us-ascii?Q?lRWFswyqDAD+Cu4BRTksf8CT5yhPp4DxVc030gbpPBRPyrHrA/ZFiuc/ipxq?=
 =?us-ascii?Q?2RZ3r/xnqYVFS0+xjDjWk1wwnHSxWNcCiKQC+g+ps17+j9Vkk2Rkx9Jxx4Rg?=
 =?us-ascii?Q?lkaDvvMRnbpfNOX/I7NaZPTPZuAfEm6JGUpvV7wNYO0nJj5KqxH5vJc1u6uJ?=
 =?us-ascii?Q?sZHe7EOdlVYk7gMX4PbfPoLK5zuFaAt2x04VECk0IXGgBR0jd0f4taibMNcx?=
 =?us-ascii?Q?cCpI+o3N9906shB65p345dAXMpNa1rO9gsI07NwCa8CKZgWiuWx2c9Aqkjeu?=
 =?us-ascii?Q?/Lv9kna+feG180fCcwYv+lgQCUrZTgqp9MO8wEXuKfxWzneLwXupIeCVyWZp?=
 =?us-ascii?Q?gS7qkpDcfyIR+w2s44FGuZcUEEQnklO7/m9L3vYtxYbGCcc2QvVnU8jml0sX?=
 =?us-ascii?Q?gyAd4ufJMosSr3qVL4t1mPS/isQv0E42CpSlL64Tu8YfoFv2Fya68kDr2Ybw?=
 =?us-ascii?Q?UmTdEvj3ioTXSNwkQQQFUyzxGeXIbF0A0n+T1iOhqz06GmU6fbcXCAGAA7RS?=
 =?us-ascii?Q?HJkr9WG0HWkYrE7jvjraggkNC1At5t7SbnTKaoeGzi/T14GHezqlmDadRkBM?=
 =?us-ascii?Q?5VpX9iFui7EX7X89cQPmXUX53Nbo39AMMvC23Yh0NUoOjs1HnHTqbW4NXTOC?=
 =?us-ascii?Q?I6lGG26wZKcCJDxfa49N9quWZZDfCV6F7FliYwNcuG7pXLxz3Cqg2lFhl2Nn?=
 =?us-ascii?Q?z7HXokVkkvBqZfRWBHRiJi2hQnWn8/Zj2Rx1rpRj9Mnvi/g1aYdwwie7mK6B?=
 =?us-ascii?Q?G1XoftRR3IazpcppGs8KOuOkhBJpCgrcsbkYq4IbSzBt+tlBSibY0SMWpIJ6?=
 =?us-ascii?Q?zolCv/qc0HufmqeO6fkgkYE/roA1kfZDIinpYIMC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bde6e6f-9142-42af-4147-08dcd2294eeb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:16:44.2509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/9rGm51Qt/8j70BB7X3QVEhUq7HDUwaDDtJXi7v0KEquG3arUnKUJubpjvMqESSKLO+xV+shNHsHPcne6tl+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6878

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
index adc6394626ce..f97f86644b2c 100644
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
+		return 0;
+
+	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
+	if (!tca)
+		return ERR_PTR(-ENOMEM);
+
+	tca->base = devm_ioremap_resource(&pdev->dev, res);
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


