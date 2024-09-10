Return-Path: <linux-usb+bounces-14874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34000972A22
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 09:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58D5F1C23F01
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 07:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C3A17BB33;
	Tue, 10 Sep 2024 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="USQwu9yd"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92BF17B50A;
	Tue, 10 Sep 2024 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725951803; cv=fail; b=Bp1lhiyYDys++XBluAYhub5xTepxzs+kmC+KscIqLCR/hPVegPdE76ZzOgqGBHm2r7oZMJnFzetRHW3gmSzavBqRBVf5Zqx2ZKp4wt3vp6sT6sRPjt6QQqT3Y6USdkCkVvl+F8qZXIm+aan6fc+8A2627G4q8+ISDr7SHn6RJEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725951803; c=relaxed/simple;
	bh=S2Qmi5s7dclX+9QnrytrVExofiSsSuXkIEVB7YSbX0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XSfuRyXIax+0n4XWx9gbVtWwuQjXp1406U2D4fOKOg35zJjpnv3MehaYstr+tINE72Xhri4NiFx3t65bpi4COudZoJt6/j0Yls0N71oE5WHSMu2cGFENH6OYxmmB+ZGxOCSwBeC/m9dXsWklqy5kphNjOWGc79pD6l6OKl3a7xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=USQwu9yd; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGhRGwjb1wvJHhFJpy2wynIyy17Ef6rs0//WpmGsyDzNBbbvQIyZtMt+gTj6RgU7HDUQmL7i6XB2wM983bfoefqNEKT63kROppI5A5YqD9tTIsPuYyx5jHUpQd4db2FsMYlHjxy2RKqtMwKnGZlFq5UqHThBjptrYbE0pttuZU1RcybjV2n4tNGmRzpSJgskRiQiCMiYVBCV1T3biFJRwUGeIz3st/uhfr5f0lRx4R09bTxT8ydUR9XkOO8gWOlDICD5wt+u2vzAMkoZaFQcg7IlrV8k7gdcjKAzkOx3m7kjzg4he/sqB3RdPaLeWqxdeunfHGwVByJyeBMGZGZWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTKFb38ZQvGm7My4TTGzezkhwq5dmZGLsicGhKf6YA4=;
 b=xw13DksotjzOQo/xaW+g3cW1K0UZREAmJheM67iiHnjW5tXTKzsrVbJJIOYnmEhXpsSZz12XLZ9Da5gc2uFZNstryzCO6BiyyGQUeuRrqyeBHu07AUe6QSYHoG1ORFn2YSzmyjYImevbRj5rROATauLo/Ee33CJHsBWZ6Y7UNkNrNCnfBz7fNeTupangVVVfSME7ZEPkdZ1SnGjJLA/vb4EFcvtWyxDn2RIZlEi1z45ja8vjFTvcsEkVce0aw8OaqLDSVpyemvF1ZJ1gbE/yXkzZE5lv/Uz6fZ9DfjdCGX6LuEczN9x50mP5fIZMAfHMwYRfwzElQF8UZTAxgIUnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTKFb38ZQvGm7My4TTGzezkhwq5dmZGLsicGhKf6YA4=;
 b=USQwu9ydDjWhpXJp9pd8JXGMwa1gqH7SWXSuHBo+2y7ZLL7SslKElswcLMJXOy81Dz1jfv/FBq3mmKf4RzDEOmkKEm2EWahub2hSF7TtjE4p3NWuXandASL91bu/CEt1xfxpXnAAPt3g6zhrpOs0kTDNAyc3d+4JllSPgyDHTiDTWg9DfSI8mHG39ui7Ga1tlj9nip0lHrzuibbSYstgzz4Mtfl2cq2cpFMRsoiR1eNyL0SiZXnGZneArRa5F87GVUf3yMpElwn/u1k7gY+7KGSRfyXydgveYq2hbKGUQrYoXWiic7Pd1M22wMXF9NjPtXU7BZDssx3lWqaNMdFfcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB8PR04MB7099.eurprd04.prod.outlook.com (2603:10a6:10:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 07:03:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 07:03:18 +0000
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
Subject: [PATCH v4 3/5] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Tue, 10 Sep 2024 15:03:37 +0800
Message-Id: <20240910070339.4150883-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910070339.4150883-1-xu.yang_2@nxp.com>
References: <20240910070339.4150883-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB8PR04MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: de84f5fe-9878-4c12-ed2f-08dcd166a605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tD5Pz0Rg5xnL5XJaxD9+UqZCy18zjBRLRNvtzFAjpVJS26urBA3OG6gPKI4p?=
 =?us-ascii?Q?EZAOa9RzhNFNB0EpkuznbfmZSZIaKM34E53VTYOXE9+D9SLhH1H8OIv7ePgf?=
 =?us-ascii?Q?vx0WfFoswb0v+uV/eBuCUEZTE1/SUxvD8/XyGI1VPn1ZbK4GjN7Jge3UkUKn?=
 =?us-ascii?Q?K2Y4CTCq3VnmmPDjb9KDsQV6vqALAwwgaDdfQbV5iISKvZdAKy8VbZQjOdUB?=
 =?us-ascii?Q?FyAo3Azj74zMSMyCawc0eZZiZHyvry64m3LxggDAvgm/LtKkS9RWhzjgQRX8?=
 =?us-ascii?Q?mH+8VWqPDgkM15jlzDToYjFsBYYuiVVGDlJQBG48hWoR/E37+TqFRbsloHF3?=
 =?us-ascii?Q?yR1cfDMz1KaF515fEsKoQfauGXHEQgGYnMFCLawBvn2t8LlNNnyrytO1vlLq?=
 =?us-ascii?Q?RRiUCDCMektHVgFVTzQqoZNlpzTuRKvaY+ra3JtRFXTFIJ0MXfLpx6Vq27dV?=
 =?us-ascii?Q?U9UciyE6MqlpVZx74DwXxhmTjmXalKiZKo3NGvP+bxfSz+epmyCZWSjJDuWx?=
 =?us-ascii?Q?3gV4jY0IeQx3Qn5GdY+mKJ0DvTvXJpwIpopebkzpiUsVbphU6DpFEb3Aihre?=
 =?us-ascii?Q?STRImC7Rbl25m5Ud8u733Ag76Rgdc/MMw/qCU1ujZ+FRsi71nuWcomxueabt?=
 =?us-ascii?Q?2IzK9as3dr3hJMdcbqk+e4pS5sOkFHc9H7Ve8RwV0MQ6BSCtI9gxKpEeUUTO?=
 =?us-ascii?Q?bH8RPMySjFlepc6ovuhK11IWdRELM8SSMnEHIzk3iCdToIv18VCtfLtSyWI2?=
 =?us-ascii?Q?W7SbwKKIPNB+1X3SStcby1Jz6ZuF6Qyb2Zjru95zQIBzxhAWJ5kcR5TLcdt2?=
 =?us-ascii?Q?6BBPFhaMuD16zWSPpq/sqjaikbf2mVfY14XOjg2xbMAuWaBuNhMSuLYeU3JL?=
 =?us-ascii?Q?IZF61ROOFMd0mXID90R/VUuDTDE/aHfYBNsYJhBchYCC9qr816EcgAWqocA8?=
 =?us-ascii?Q?OTRvEELFZLi054lc9f2feae7unfG7p+UgmeBrZMe2GdVTbUjavbod26X01km?=
 =?us-ascii?Q?z5uc/V5F/0Pg0eOf7feDzbkDI0FJQp9WqULuBrH+3HHpcglww3yi7rMmsIEO?=
 =?us-ascii?Q?c5wbGmsNfNZOQdvjf+X+TbYWNyI4aqrWP3/MFMS1EayQAjOCc8QMU1cLXBDx?=
 =?us-ascii?Q?z8+5KxfFQR74tOmb49WcgZJhtdVJlynNCCAEu4SEsXel9HDfwiw6UtYDzbvU?=
 =?us-ascii?Q?kM9jncaJApXss5lMuYqHR8G1LKzYF/ko8J5zCZlfpNmyZFzfJGqJmNuumUt4?=
 =?us-ascii?Q?2KkiUUGVsHROrZxPRBy2nuVeiUJfFNPkFDDqmFhlAszBYk0bse/yR0BiSFUr?=
 =?us-ascii?Q?18b3/wuaewC6Zxg7O6XE0J0CbO2Z3gXy7W23dHqofwO7KDEPup0dJse8PhcD?=
 =?us-ascii?Q?IcVYRW9lU0mOLWL8Dn+UlW2sjDc62Gv7Vl8Mm7z0H6YhOm7HUSN0fw23MRrN?=
 =?us-ascii?Q?FSOO7bPnzYM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K5vyHeNyZVfpkFrlN8bhfBo5qj/d8GjGi+vf+VIGfBK3LpdBMqONuPfB+3GJ?=
 =?us-ascii?Q?s/O7hp0LKTVDfA/5cBlKaRpl1Uu0554ocEv/QapHDYml7TWRsHWnEEHSTwAb?=
 =?us-ascii?Q?oTTD3NQGMpadt39XjGIk/Wtxgjs4GVdWXYDMinCD3UPaFiA907dYktyofRwR?=
 =?us-ascii?Q?bHn/30IMOFY2RLkurR0yLxRqBzToNvBlFq8EYVE+CgEyPB3WFI4hN4JJHcUg?=
 =?us-ascii?Q?WIN2Xf1wbwk8SqEtQsu2ATv7V6TbZykdsakCedQdCEptv4qLZEWx8HgC+X6s?=
 =?us-ascii?Q?qfg6JWhWTbN77Esoh4ntN7TCGCn0XT4eH3BY5W1rEv/SVR3sWV+JysuNfoMx?=
 =?us-ascii?Q?i8suyjcGFjXvz9G9UNzrsOHgo5hg7LARmMIct2z9XOr3oTb+CDZmfNNJElsn?=
 =?us-ascii?Q?bvzZxf7g0P/SDU5oGopcxZCxxNbDj2auwCCjA0H/P7IzBoz+mEnPa5gde26X?=
 =?us-ascii?Q?p3ybHonJEmTiDpx6QmymenguSyThow2O28IS7fBpR5eamjtuX+KMiLCnYp/P?=
 =?us-ascii?Q?sEANlKUgH6csX21bzNkU/6fm4GWL9JALZqww6Erm4cGwe0ukgR/f7omC3N5f?=
 =?us-ascii?Q?p3UBGhlCMev6G1HSuLn+QLsEY340mvta/och4x+qeIQjffM1yPmeM08RtwTz?=
 =?us-ascii?Q?Qrd9/fHW+rbLfj8g2OPiXjOm6ymdjC71X+yGCzgdNV+ImcrFBzf9xFEhg+XZ?=
 =?us-ascii?Q?u1nNpYUktgp1Ct6OMMn7CON7+zm+JDxlU2N49V7JkSZ9xLr6Nn6/pguxMhaT?=
 =?us-ascii?Q?mUcTlsLn6WBSPLd3kAHvSEfqbG/IpJjbCTVxqtsGg0fg28v3+tAxoEeFBWsO?=
 =?us-ascii?Q?kNOa7do7jml2sDNdeFQ37leLqJfg/yAxjNLX7behpVznoThUf1cPFfK7+Ur4?=
 =?us-ascii?Q?CaIy26civkk+KjQBjs6ILwmqnfkHFCKTBLWbgKrjRZ6OgaJuU+1MkcDm0tNT?=
 =?us-ascii?Q?DPUSJlO6zLHoafpQI9GuswUJKFqMJ2rpXSSqjZcehTveBETfKe3UwTUwRzMn?=
 =?us-ascii?Q?xvjxMOROQlkfrbLAQsheTG+dp+N6VyKubCRydCnk6KsDDnWMkGt7XeZ+rBM8?=
 =?us-ascii?Q?xSoajjkhcKe5TGUA1TFIABFYDfxYQIgsnmUG2sVfKoQyQ9Ow0MY/Zk8K/Arn?=
 =?us-ascii?Q?59fwfZLWkqI0PWsbe2THPz4Tvaq6a/rhm7SPYqiUfis7hyReDHFkEvzMomLS?=
 =?us-ascii?Q?yOAvKmhWqeSOJfcargh+jYJ+wK04zMtQEDVChP+Vbu9uzXhYX5nGCSERt809?=
 =?us-ascii?Q?pl1Qr+MaYW7VZc50qF37yBXpx6DN0ur8qNL/vHJKbEXVsTvSldwIIFo9VF2H?=
 =?us-ascii?Q?SIwNvayT6KpvMbSOqtgpQdYFToWIGBr8/sl+0Rx9C3FHdh4WielurNCnfouH?=
 =?us-ascii?Q?GoYp6H85HGT34qUEz/TIeWAodMOIv0c0LjH1rmLILRZmk/VS+o5DL6P4PmyL?=
 =?us-ascii?Q?WNTAhSoNsP7iwdBjlxblVego8aNpPtZ5x61y2fC7R55PMTWtyvLE+fCsK48l?=
 =?us-ascii?Q?ShbGJJmaXbuAXj7JVPmQV7pxedqyImbJ1eMyr0oBl/5zCgeUBnUdJS1MtQ5Z?=
 =?us-ascii?Q?sb85JaIWpvRU9ZRoCHDfP2y0fpBZ+zuQkxVBsdSt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de84f5fe-9878-4c12-ed2f-08dcd166a605
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 07:03:18.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NsnoRkur/sWcr7iPEc/AAgfwpIEDXbbfyscImg51zALXp7sXjPLT5zQlYRttXaFxOzHE/zEoVRD2X+pAeEHYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7099

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


