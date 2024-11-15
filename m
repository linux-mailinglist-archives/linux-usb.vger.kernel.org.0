Return-Path: <linux-usb+bounces-17612-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E72B9CDBA7
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 10:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAAC9B24716
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 09:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6BD18F2DF;
	Fri, 15 Nov 2024 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QJwSa2aU"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2044.outbound.protection.outlook.com [40.107.105.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C51186E20;
	Fri, 15 Nov 2024 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731663233; cv=fail; b=O0smN/OkWjaxBHNKQI+orSN9XKeKi77x0v3O8BimONOLK0kxnkn4U0cRLUn6ABlujtGHz8N7ph/5Ni7EzWYds4SrBr4l0q+8bNdKoWBBAPwdKyJ0EB9UavrKRBSWJse+g0tDOkZg8KmbQVzQb6UzUQ2VDRd3xg5wcYGBy69CAfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731663233; c=relaxed/simple;
	bh=EqNENrfeeKfqLp7UkpUQjQC0+wbRbDSzMLGqqlLRgbc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YaCuW5eR+W2QnHEo57kCZ2HcBs9lKPyQKl+WvGEo77U0XRSEuh02rJByN2ErEaAFe+j7IKR2slCuRFHYYmm7/VStnIoZrPOzcPpCmUKaMnjARUamKcRMeXsI1XbL8zxwhHSyhFY7XdnBslmRmkx8NTu2WYiNdrQK61t5gAvpULk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QJwSa2aU; arc=fail smtp.client-ip=40.107.105.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BohTBG9fosClIU+vffCjWGBchR8awAqZYsatIxpdMKDj3zOXFElERLse4if/W/vHHztmL/guBDHcilKY2M1fbYbw4Jrlo1RA8qiIfTa+LvddYzt+gkuecVg3MKAJ4FxHZOfaLLkJm+IymJIpN93gPlgTby8jJ5Rj1UWofoiFRWD88RIdym+4GK+QSpZA8mkDY26DEr1NRROT3u6QPMu1fv2zesaJ6Y5go4eDGpeGNLOSZfQcolReFM8aLb49e/6BvvOm/6HAs69Obwd85kkMw3u6uFYTJBGmjiLD1qL+eKenhKFdw+44/r+tH1jQm316NqJhSEDDwSs5rTAajNjHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGRrgCsDCt5sb+D1yQ8jr2O08GGcF/A82DrSvj013Ok=;
 b=uQTHZyIiRMLUqPm5qANWcNMpbSFSxAOkohbPe8/Qxq89shduQIVm81duZcqPLhw6gCyUnRj5/JLVKgFNqf2t07aOcjUZ6qnYqFTZLSBzpWWl6Kpep/DMmx5SoQiOQd4Cr9+SaYL7W7AEqUnWXMrXWpQGWbuejrgrTRhXOsbGBJI1gj1KWIcHczgsCo4oEjVND2HbAN2bRWufdnTPQ5AaO5q4kzeSlF4z1TvtIlw6GdKIvEwQyKdGfVIDBzAaKxR3Y/GaF3njyBe4ApjUVsBXOB2gc3SgpJtsqg++r88Hm6p6CD7uOIvC7mugM5LlhgApfQC36+egK+X5T9YgGN7zIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGRrgCsDCt5sb+D1yQ8jr2O08GGcF/A82DrSvj013Ok=;
 b=QJwSa2aUD9H8o6NcSAKb0Ikyvw5Gs0saJNiSNDXSPpIPNv5B0JnqbcoYAS8i8dOm5i/iAsUetqikis7jFFT+B3oJ3Dq79/9qzhqvf83M7VKpppIa50R3lQQLLNUfpUEPW44O3y4nsyPS3wo36mXnOLo4+0tJNgufxgOs5P++Wcw+buPYNoV8xktrwfXSHdr3adszeLwuw2UtqEy8TCLGHC/IB7h8z7QMh9xp2GYiewcHi/8r+nECdy57lZ1br29vdRICOWYxuIDmVWLSKob3K0HhJNbJj1OuEkpCorEXvCK47ZF8Ow1WEIVPi+r4TbMayStzAHFgSXS1EV3SRFMmKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9743.eurprd04.prod.outlook.com (2603:10a6:102:384::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 09:33:47 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 09:33:47 +0000
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
	jun.li@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v10 1/3] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Fri, 15 Nov 2024 17:33:10 +0800
Message-Id: <20241115093312.3407815-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:4:91::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c50778-04b5-48b8-3a53-08dd05589afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M6oaem38+eux80KYelsYl2TICvpop3cjk2S5q3mysV9m5u1/dQtfxzUQanUd?=
 =?us-ascii?Q?gD2btvyXIs/b6RbX0CQ/LJysaef0gWdw4K5dMEo3BFj7pnCu/oFmf06J2Nqc?=
 =?us-ascii?Q?HRHWGdGv3JEvqjxIAF9EK9Ni1py6UpaWnpIwTHSrJMhwlNW3P4N+1eK2MOnH?=
 =?us-ascii?Q?7XYv0fecxJnqwqP2+mt0RAMc8i4bSl/sUabIJLCnwVY5ABStxswT2AmObBFZ?=
 =?us-ascii?Q?+ihGuDPmM9DlCz57d5XoThfvVGtGcnbnPr3fZYNMxMqr1o/UfHEKnaCH55e3?=
 =?us-ascii?Q?Wi8HJTXkOpYX8oyd6XzLG0hRaWIBDXsIjNuAJFepR71l08Z/yVJGD0wLzDuH?=
 =?us-ascii?Q?Rt3GEluTDZrpDqOlBVIx9VK5ntwYlX7VZhoWUZ/8X0R8UNId8evMNUDG1qwY?=
 =?us-ascii?Q?zRjnIafkf8z0CnG6v/M3u2fS68gwwSq7uvchVutpjJ2MIF2asT4P92OvNqSp?=
 =?us-ascii?Q?HZrbKTnlmE8C5okSjrqYYcMicc4muQxljBW5n53h8LGB+W8w2S9H2B3HAhMz?=
 =?us-ascii?Q?jhqQTm8cEW1Yg1UTep8onhDTYPd7JreaLKKze3uQcKVkNleoKWWmA6uvujY0?=
 =?us-ascii?Q?abq78QUvNXb4fsX/yPv48Z2DEKtszfatm0UUMrx7fCX+ttvFDXCc1iJijyfG?=
 =?us-ascii?Q?FSls/u86PatV7CnY7B4GtJZUWyjYFD6BIcJNwUEI6fwEfMWrimPV6h0OJu8r?=
 =?us-ascii?Q?gVcKc0DcILZhouYDKNWH9LrnQiY12FtDZYuqstGpOi4QTl0atWz2MnwxHVUE?=
 =?us-ascii?Q?QON/xvrDuicdoQ1V/7V7FNfK1cHk9gih8SObV4L4AllOQlFc/AFsnMtqv8n1?=
 =?us-ascii?Q?ftCmLJ/uQG4r9iajKH4UuslFqCjMusxBmbXw7UE0G9mT4USq/E+VsdSrmvZG?=
 =?us-ascii?Q?zFxgW7roJbaTj7YkwPDJL/21Ol9u+CTjuKtlamVh/6NvAeBqvcTaQlxGwVSs?=
 =?us-ascii?Q?Qtm/1Rh8HmBhZg+oAtL90BwmARmeHxg0BVuPP+rFiPQviOUEDYLUkHBRpZGv?=
 =?us-ascii?Q?4kwZv+4m347BDjdSy5kwCCCmmWhZsoRC1iyVSDpJKRR2GcrIucWCp7nt9rwm?=
 =?us-ascii?Q?db/xUyWfVsw4ek282m55og4x5kuUol8Dx3kr5CN0/mM6d0Dk1yecHEcv8Hzq?=
 =?us-ascii?Q?oTi7ryCT3otPksXbQuZ2T53jhIWcB5wtV4QgB4dMmtnNW7H8aQ3A0UaOiVbG?=
 =?us-ascii?Q?SNgHIsMypoxCVVP68PEQOabPy5/NUEOcg+Kw1mXK8VDf/eGNuUdAPWNcuCgl?=
 =?us-ascii?Q?jvY9VNkp0itwiozTsc001JxqKZqBCvRCPkgIyVUJBrE/NWA2O1UA1qjs4A2O?=
 =?us-ascii?Q?NiCmhzNfV2kNbWD5Q56PNg5JxRRQuFimlYthr8kfQwoUWXI+AQJf2e4Wvxix?=
 =?us-ascii?Q?sttYaUsxfqtUeR67+X7Rf28mpYkn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xtX/H2ZpKNNzlF26AjUPV9xOChZLkGt/Y7KqWFfVUoFMIiZZ/mYfipErBj3R?=
 =?us-ascii?Q?wGWpYZSQnpTa4mDTeeMFJ1savcZuJlayB5H56EHeG1TavLBRImJrIstl6ors?=
 =?us-ascii?Q?lKqErCWJ614i0rX3VY8ygltCfC7Hd8JrEqdz87Tt6a1taS/9rOU2zAmqnLqP?=
 =?us-ascii?Q?ecedx8NJ+UBZFTE5tM9odw8DCNyAjOZUOtUoKi2wXuVdt/J+YGsNNmYIJcXf?=
 =?us-ascii?Q?xSa4p5AiZyHAam2UBjrqgpRuO4CjmDIwasmeqiW99Ajj2N4I6VYX7hW4aPVS?=
 =?us-ascii?Q?lVfT9lyItb4AnOnVkky2LSJEZR8Z5VeFhQFjAUt9yis3/JpnLkIyfc33zoNT?=
 =?us-ascii?Q?dQOTp/8In51ErDci5A6p8TZuyCgpV0eV322J2SF4zNTHNsgZoFsYG2i4wrSM?=
 =?us-ascii?Q?pvke3kMv72e/njqpjQUHP83Vd8xmep3AfXWEz3ZTKsyDfLmkjPC0QswsFxtZ?=
 =?us-ascii?Q?+GvJYAHscuVmlNq5hGxplD0FYzBXtXKHTWFP9eA/GntDXQ8mHmxL8sn3/MHg?=
 =?us-ascii?Q?c2cNrnyxRnwjn8nkRWvMrIOMKcQfGEu41kCIjAmEBQNLP3oAt8oWAQiCaNlA?=
 =?us-ascii?Q?GqXchUJmoI6HWufF5yiqtZRoa/baugY+OMu8re0a6ZLkyuCT9s2ydt0A+BCK?=
 =?us-ascii?Q?gAkPZ7oD5/Foby5ZqfbJXP8aS1x559mUUyDNORl2SUE3jc4j87QHxGHx0tc2?=
 =?us-ascii?Q?ZBFwHq5l35snZ2dc6MPzAmxKX2mZfGYdOG5OhPCUS4W35HJ5GRbkFIwJ3PFg?=
 =?us-ascii?Q?9NFHp+3lg9KAfSyAu54ehP1IbhNu+mLeA2xA8fDiOVkKbsmH54W2phW/ephk?=
 =?us-ascii?Q?+R81l6bri7X0EkPYkmjnA6k+ug7jPcAvrKsBltJBVXxy60HxwQA+darEyzLB?=
 =?us-ascii?Q?ToEiTFUc6VkBky/v2m3Zf7DJN99Bt6S+WtujY9uraLB6XZGU9dPG7tEqkmS5?=
 =?us-ascii?Q?ykmvD0034A7PDTttTNwBzF/rQ95xIJPQhiUVEXNngjAptiQHRynpDU6ZwM/R?=
 =?us-ascii?Q?lIp0dZ3aGbrI27vHwZ5tZ1IkQ+4BPKVsCv/38Wsm+otvTlrNTRnJA6XBnh6J?=
 =?us-ascii?Q?akMQ8fghHelcicSBEw0KGqZs0mXy9LzkCjeE+WhnQKyKtcQLgtKdGBtPIERT?=
 =?us-ascii?Q?WgHYMIAVGchzi8LhyfJSLwNXgSwOhzLor8EVw2SgqbJgulAKZ9V6RpSzhE7k?=
 =?us-ascii?Q?AzDLQ3KB8mBa9ry9QFP4S/ulMxXallfmS5Q7n60ZkZVOip2sKfjayXqZmoVs?=
 =?us-ascii?Q?4xRP3KV9AKBBaoSuwxl2gzsdHo980yCrwaH6tvr3oW1btkImGPwHyDncgsfm?=
 =?us-ascii?Q?BAuUO6zWuSNBJMO71I1XWigQ9t29eCCSFnTbx35a6Sirw0JUqw2yaZpN8R4V?=
 =?us-ascii?Q?4W1se2hsz6pX8KuhGlWEJEGgk0EawELlOSFZ4QlYBAebcloOoDG4S7flcS21?=
 =?us-ascii?Q?H57XSIfz2J7Rx8Gcpgiibd4GOfK0DLP6nZJ4FlOWQGF49PKXasKHig8owwKF?=
 =?us-ascii?Q?KDCDY7UYA4xZPcqhVvvNgqeZHQ+4BFObFCQMw5Y3NvbCfJHSzfTW0RdwK3sw?=
 =?us-ascii?Q?Z6yigbyn2wJjLIjoK5oQMDk1D5BMOx+0f2j311/I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c50778-04b5-48b8-3a53-08dd05589afd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 09:33:47.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OZn2Z0dtOyUTsSe+dVBtTbTRL2pm7KghzZy1Y9ZHQFI37x7h1m5HKieFIWVFZvbW6an/QIM4sPrLphey4Yxqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9743

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
Changes in v10:
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


