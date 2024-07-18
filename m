Return-Path: <linux-usb+bounces-12270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ADC934BA2
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 12:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ADB41C21835
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 10:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC7012D74F;
	Thu, 18 Jul 2024 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="NBVbMaic"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50598286D;
	Thu, 18 Jul 2024 10:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721298408; cv=fail; b=TPil/tU6BAXV98vVVWWESaOyng1WyKLfGCFCvGYIewko14hi46z8FlTXiNzOGwk2taYQa7fSV2G7hqCS5V8zbekvZvmzXqFWrJXpadzPZyk4z/KvO2TKWUlSeax+HRakn5qVbDjRJ+T3png1ePoc1jstkKBv4YY5L8dYduiNruM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721298408; c=relaxed/simple;
	bh=j6OXLi3e76Se58CsS6X63xBDPM2YXuge7bRquMf2HDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tqIyJJz/AXP0E4+4ay6LzoN3S//SA+2vw8N2ibnauXwPP2yhJZlGJTtZRr2rKYo24xH0nP1+W7kkRWiAAOVG2IS8N+5dXGkNSWBo5sz9YXj56LEuylNvEpR6MK0AwxiQffdSt2z7WPhuyM0FQz6TGQrjooLsV9Dlvc8HZAmMOlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=NBVbMaic; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+YJX/TSAvMO856EbQY6NnNsNSHd6xwypoI2+QRdfTg+JNNyry7IsWKHTIxuFAgbUYYep/HHU9116BybD3BEupUqcWUl+i5b6ISWN/BWR+ffZz9eb4Hf0UxuaGs7moHGarUB6tdou6jY43u+YpaK1RTBT3BMOnX5/K6KGYCDfx38QS2UTzLZn4PttXUKDt4W/3kvdXfH2UvwlGPo0VPZEo/oGU7gbpEU7bDHqGEx01H92LY/Hq8binUFAsJb2QqcbwqtioMfRm6lNcaNUxvjOJ/K7RQJrAqmD6tV2ypttMEYFrY/+n54LgYtUVoubM40yMwdqX8K4T8mb2UOOpfbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcvbzRl/VE/KFD8skHTI0HGO6I/l8lVE1KIxdLYGVHw=;
 b=cI5Ymd0sHpF92YQbjoc5lbyDz6Holrd6i/ltEkrhOTUmvlrh1RXjku30KfffLeEcDfA5wLcPK1CpfHwkmIx6L6d6H+bW0AsaJ15ilrdyMAw1pIj38xJYfdilIj89aqa+Xahhco71Jm4g7W5S9kRS25SOjFPSNW9qcF0NW6//gmG4h1uKxYr4q8SHTMr0xGf6pFDTmiHOBZUjwEjgQwZI3Lgb0z43kd9x5p2Ek47n+jW2ZHqaFQp3Mh+A/r75jwtn9SFjnMM6EJL3mB51zQwm5+zDlrzbV1P6IguQ1LlpkNnZyQ5B9HLS4RP8QLiGAYLOVb4X5oK0bXlCwZhJYH1KwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcvbzRl/VE/KFD8skHTI0HGO6I/l8lVE1KIxdLYGVHw=;
 b=NBVbMaic3R8hqekOtWhSjwc8fHB3neAT7rV57MXETHqzVNfA0Dc4UmWZX4j0HGcjfi/Tb9+Y8YVzlxCl/F7HXjENkpFFe//OgiUtzlErEgNW2ucr8C3xAbc4bZ7AUsd2oC4aIjIbAt0EU8y1BSPWZYB53PRGu25a+m13DD8u6h8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9886.eurprd04.prod.outlook.com (2603:10a6:102:37f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 10:26:43 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 10:26:43 +0000
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
Subject: [PATCH 4/6] usb: phy: mxs: add wakeup enable for imx7ulp
Date: Thu, 18 Jul 2024 18:26:35 +0800
Message-Id: <20240718102637.3964232-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718102637.3964232-1-xu.yang_2@nxp.com>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9886:EE_
X-MS-Office365-Filtering-Correlation-Id: 97484c2c-f7d1-4c1d-fe79-08dca7141e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Judc1rqP9Xh/qYBENu2gsJuVB3Tcaq9UNbpZ/9obYCQVX15t5XZC4lIzaARj?=
 =?us-ascii?Q?exL5jaTSsCCgA5HKN89m5wfNE+55Vy937y0OGkd6at9Xs6o6x2g3XsiXQEhQ?=
 =?us-ascii?Q?Cik2Y7e2f+PT/S8cBLkhIueH/zUXGkrP5miGp04bpZZDdnqJmsG6Aa17Ts5H?=
 =?us-ascii?Q?bNyUvlI9cBvjCNNgZxzAsvor5E7MCoT4CulslBwpVfa3BSnQDY3Exv1VH/3X?=
 =?us-ascii?Q?jwmHu62SH0LNn793R6eGUrvuJc746Y0lcOtgN9522zlp7lTszeaUmXaSqU/r?=
 =?us-ascii?Q?tvruKhcPMqpC/mHAG8NOky4z42RxtBbrdB+QafzWARuoeiq4F3MbXNTkcSfT?=
 =?us-ascii?Q?NK9NXVf+YRmIMks2R2yWUsIIqsEIWiJPEqrAiJd30tNdEAD23tK23fQQlUFT?=
 =?us-ascii?Q?03Z6gfUHVS7xyyGO53jfOdw8m4+7zsFNueS8/bSQF/ekfZvSI5RCod5nrJVv?=
 =?us-ascii?Q?K46ZMaUnWPiIGP5QUsiZrtS5LI6IMG93vkfyKvuCF2B1HeXxlQRRFQIEwHZS?=
 =?us-ascii?Q?eKtzvzOYK1Ak6O4ZGo526HwUdO8dAtgfuc469EsmrxUB6EIvUjmW0M0iR3y5?=
 =?us-ascii?Q?8GuWkotqHNM9u9rOpJKSs4TXu2XHx29fhlNXe4WRdqGQf+ybXwB/7LGMBRfs?=
 =?us-ascii?Q?uVo8lMkZQHn7eFiyQfWbfGyWl/tDZ34rGKWOQFuT341kYFlfbokPkcCXXPkc?=
 =?us-ascii?Q?ts4YPRPj7kmZt/GSv7d+R8Ek8QAHFew3D7xoxxIapzJpoLQWvvYMCxAMEZak?=
 =?us-ascii?Q?TxHh32BetSlp4iUOyQp3E1olwYldpj+X7lJHhsnxIc3gY/JSiNBgu58hGg8w?=
 =?us-ascii?Q?qxQRVfYDLhRZmUwk981v8kYUV1GLUk/6tszFtJqo8k+gnxpVPZXm8tshGNmA?=
 =?us-ascii?Q?xCoLV1XLgDjk/cdPrlN1LEGYaWxEzCpaCJuRoA4S0o0Nk2qiCRuBDyFNABNB?=
 =?us-ascii?Q?ATxwmkrWupPv1FkT5yoZWMKusVokHj541v7P5ovcCUC7bThg2+acajGmteRF?=
 =?us-ascii?Q?mhOxUZ5yVMhpePJrNzT1ZuGhp+jQudhtGaCCMvdtkbI9+KL+0rlCN7RqGXB/?=
 =?us-ascii?Q?rMXN82y3u6Q715bN7JBOLZPsbOBL3bldumA/CcYiXxvh0dCDvcVFY3mYT9w0?=
 =?us-ascii?Q?moeK1xq7J3vnL5BkL6VCLc4H8j9a4rOaGZy62HqW9N98e4EkQcYmOUjOVu0q?=
 =?us-ascii?Q?FLPzUbdIqF09TFGjNGYMiOxNPm7aIaTOy8rAZ/aiostKoeI7/YnRlGvUrntj?=
 =?us-ascii?Q?VdNx5HssINF99J2h14YPOc6FGewrfqsGsgW30GGZVObPBdTNBelgrH4mQa09?=
 =?us-ascii?Q?DN325ZF8Ii17CbNm2Z1eyEk+dFvegnM1KD5OpzScSpPQrrnAAMWIjUNMKdc5?=
 =?us-ascii?Q?E+yzNxju38MTFyXyRFr2H1ZfrGMBBELBD6DVBqjJwYIJocSEmMNEjLLX8a38?=
 =?us-ascii?Q?MB9Vy6tAflo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mZpvqDIwWFi+HUF/BNFBfXyTUOzOMIO8lMxzeQCkzAqnDgDGHQ/ZC6kkW19h?=
 =?us-ascii?Q?Z5t4W21oiAWiwKjz63fiCjb0nc94P3t3YUR1hPr1ojvlOPond+Z11+C4vd/k?=
 =?us-ascii?Q?06JGZfV+5RWmvAkvyU9SPmlES8PDIz7zmed2oPTjyFmWYxn86MBM5Qa/B802?=
 =?us-ascii?Q?6VlpfVA9jT8JwTBxIE9y4oT6zqX085Abxx2jY6/Gmj56AE6wcFn9Ub97rTx+?=
 =?us-ascii?Q?yPQoKsprVYygiN21ZGQnpdWrm5LrPcdeC4fDo5dvUN/hKRYZWIrDD7b/SvVr?=
 =?us-ascii?Q?vxNG7Jp+AqDSnBUweUYJQzAEEskPoIqa2huTBW4kfUq89ObhiYk/P9baXfG5?=
 =?us-ascii?Q?3uxaGpMWHTBPd6FAe8DVsgds+JCLsVm8ztjK1bc6IQJk5ypx2vJHnVGbahix?=
 =?us-ascii?Q?wqb1LSjWvUbLyHnNOpwNDNdTexvG1XvqgU9TpTzbwixQCv99qhyJgyVvwgGS?=
 =?us-ascii?Q?PN10tpLtR0TCGhR0CrR+wOZvYxAw2dqfZ2UtEoVYR8rIRRovTKwgCAdXQJF5?=
 =?us-ascii?Q?ZXlHTbJSdM3xv53DcnEjNoHs8pi/uyV6HrXVti++6cK5AqoPv4k8fsDUCvL2?=
 =?us-ascii?Q?36IsSSVqkW68e9Ac9ottJh2Sa/U1iv3pn7U2AZyLBSkeW6RNf6N39NPmjSum?=
 =?us-ascii?Q?mOfHzY3Wa2lM262NZw9EHuVA5K7IRkWE2FkanQn0RH9Z7SFrDI575HK9x+GM?=
 =?us-ascii?Q?zaUghPOZY9cmTQ6764dnep8g6sTeQ2qo7uaR/bK2nAjt0O6DB7221PAEqtjX?=
 =?us-ascii?Q?UOULVupZYzj7BP4VS3PW12XgiQYAQTkV3z2FuoQAFbJyQWOSJ3sXxdIQreQE?=
 =?us-ascii?Q?+hg50RTY0/JOoqzFofHXDX8Zhv6HA0ovGFMjd6ZRVVdEEXZZTix+1KphIFXD?=
 =?us-ascii?Q?gsHUA6j1f4ezRyAx9S0rRzFk8z+oToA7EjczCL63JwpurkqxakCUgbSdqunw?=
 =?us-ascii?Q?GREpMMZ8CeRQPGp3zqgQ+/uX/qhTFTzb7R2XWUJbVJ9Tin4FhKxNxhzlwaKo?=
 =?us-ascii?Q?rD5Y2W2hYwBeH4S9Gw/KrK1yO4PaJXZalpH5eWEWNZlsK8LViqJwHj92iV75?=
 =?us-ascii?Q?N2YBb2a/F6jhBl8GWAoTEFt9/u5ed0RJN5op1UnovFOJJpn8emJH1qDhRF4F?=
 =?us-ascii?Q?+zFzFSm+iqhd7BguJs87AsaHcgUgt6nP/Y8r4LKb2tWtkxKjlcBjp5JGXAiy?=
 =?us-ascii?Q?uy0KDYYChJPznBkpCLHVz0wrOup/cMCNkIR/l8JcLhPTlSdfsnhL6WR3V/FG?=
 =?us-ascii?Q?pMr4KcemQPX5FSc88SI/RaFHHVgkTm7PGv49vs1mAVl2aaHdU5tL+tVsFYgb?=
 =?us-ascii?Q?t4duIL1uOQiyWl3a0YLBrprijCkAogxa1IgWQrJ4Cjzr6m24vQe9idK6XjOZ?=
 =?us-ascii?Q?ECnDemPSFzUPliYtpmWwx2quzsBPqyrTYQehJNwomyBWcEbHF9CIIi3iGofO?=
 =?us-ascii?Q?+YklrC8ZJ5LMB711JaruW3/osNenschEdTuPhLVmTLF08Z+nPxCOQbqZmb0j?=
 =?us-ascii?Q?QC1wou4pqdlJV54h0PixuDvkocYffNbt9tpMxkn1ebJosD+onvFGPaXuVQRA?=
 =?us-ascii?Q?cxknYvJJnDfMRLZarxkQYPklU92gNtkrUBFJ+ucB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97484c2c-f7d1-4c1d-fe79-08dca7141e1d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 10:26:42.9183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSEHXxm4s79VvYqMP5pJ5WFZrwUYBRuw5DYiwLWSNXiM+t+Sv478A5u331UpKBZK4MiRNbQhF/PycfSaCzFNGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9886

This wakeup setting can enable USB wakeup function even the
controller's power is lost, and both A7 and M4 are in VLLS mode.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 41 +++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index b6868cc22c1e..627733a982d1 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -118,6 +118,11 @@
 #define BM_ANADIG_USB2_MISC_RX_VPIN_FS		BIT(29)
 #define BM_ANADIG_USB2_MISC_RX_VMIN_FS		BIT(28)
 
+/* System Integration Module (SIM) Registers */
+#define SIM_GPR1				0x30
+
+#define USB_PHY_VLLS_WAKEUP_EN			BIT(0)
+
 #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
 
 /* Do disconnection between PHY and controller without vbus */
@@ -215,6 +220,7 @@ struct mxs_phy {
 	struct clk *clk;
 	const struct mxs_phy_data *data;
 	struct regmap *regmap_anatop;
+	struct regmap *regmap_sim;
 	int port_id;
 	u32 tx_reg_set;
 	u32 tx_reg_mask;
@@ -772,6 +778,17 @@ static int mxs_phy_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* Currently, only imx7ulp has SIM module */
+	if (of_get_property(np, "nxp,sim", NULL)) {
+		mxs_phy->regmap_sim = syscon_regmap_lookup_by_phandle
+			(np, "nxp,sim");
+		if (IS_ERR(mxs_phy->regmap_sim)) {
+			dev_dbg(&pdev->dev,
+				"failed to find regmap for sim\n");
+			return PTR_ERR(mxs_phy->regmap_sim);
+		}
+	}
+
 	/* Precompute which bits of the TX register are to be updated, if any */
 	if (!of_property_read_u32(np, "fsl,tx-cal-45-dn-ohms", &val) &&
 	    val >= MXS_PHY_TX_CAL45_MIN && val <= MXS_PHY_TX_CAL45_MAX) {
@@ -856,6 +873,22 @@ static void mxs_phy_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
+static void mxs_phy_wakeup_enable(struct mxs_phy *mxs_phy, bool on)
+{
+	u32 mask = USB_PHY_VLLS_WAKEUP_EN;
+
+	/* If the SoCs don't have SIM, quit */
+	if (!mxs_phy->regmap_sim)
+		return;
+
+	if (on) {
+		regmap_update_bits(mxs_phy->regmap_sim, SIM_GPR1, mask, mask);
+		udelay(500);
+	} else {
+		regmap_update_bits(mxs_phy->regmap_sim, SIM_GPR1, mask, 0);
+	}
+}
+
 static void mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
 {
 	unsigned int reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
@@ -876,8 +909,10 @@ static int mxs_phy_system_suspend(struct device *dev)
 {
 	struct mxs_phy *mxs_phy = dev_get_drvdata(dev);
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		mxs_phy_enable_ldo_in_suspend(mxs_phy, true);
+		mxs_phy_wakeup_enable(mxs_phy, true);
+	}
 
 	return 0;
 }
@@ -886,8 +921,10 @@ static int mxs_phy_system_resume(struct device *dev)
 {
 	struct mxs_phy *mxs_phy = dev_get_drvdata(dev);
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		mxs_phy_enable_ldo_in_suspend(mxs_phy, false);
+		mxs_phy_wakeup_enable(mxs_phy, false);
+	}
 
 	return 0;
 }
-- 
2.34.1


