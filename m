Return-Path: <linux-usb+bounces-14081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57D95E9FB
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 09:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D04CB208C6
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 07:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA3A376E6;
	Mon, 26 Aug 2024 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A+zcxyoT"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1B3FE4;
	Mon, 26 Aug 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656121; cv=fail; b=H9L2AA7jjNM40XRHD9aV1NGUygXzO7/SMMz5SalEwnSr9Bvero0sFecX0EoRpj4IaDg9Jqj6f4QsfNz3AORwYiqH1rJexCoYp8QlKqEyu1RzV4vX0Oo6VUKfYGzO+k1e2CT6bE4GoGzB2TergjiqclO1hINF1EIBzjoPhG7PAEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656121; c=relaxed/simple;
	bh=ZWBb8/DKOLa1oq5SwphvdDjTB/d6RSUS17M+B3L/ncw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aUrZI/tjdAs0anlSULDE568bjryyeJy4V2zxsnT8DrpdA6Umx1akVoDzXK6zZ7aAo7YjXD/GgM/+JEWLfPaVpZesWIRBrP4uUvZtpgjcu8wNGB9cwZhpZxqsGKZk7C4lHCQIE+TdkYXN7Xu7DwuXveAcr89yYHBTj9wLxrSbD90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A+zcxyoT; arc=fail smtp.client-ip=40.107.104.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9OhwE/hGUtlTNNYMGi3mhGd/uba4OTk4YXGFBVyLfu0W0li/XxoT4Hm/bYecBOlAnr/qX8tpct+wR2ZwCmDV85bvgGoFq7T5RIQODaRttpLClfcB1C87S4Qbz3RXiRcI3uzQGGODQXv3MWvJ/DWjPNmOSJ1S+igyNQKn99WZvm4XyZVlY+C8n+DvY4tjnqGFGPkhokT22qTytRjUcVl7bSb9qkyp2kvAonxa2hRLGJ9iQ6q2yBuDdRmKKaqyUtQuNB7EDneO7ZYzWMapYbAzsyWTUAem6JMnxqAXU1rDS1wNHnaej12/ig1gmmKplgIf/SDGSJtGvBTrGuhXCt1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDBYO6MJ9p1yGkRX8zTIZh2SdlUV3N0E5+QdtlYlrFE=;
 b=t91hhpTXWMujTihk3dw71/OQ5a22xOdIFpwoFtnwwNTNt9nwqyvlZXJ62Gr8pRVKjI+WiQWnq127O71vC1x3TmOacaP9OlcN7cyN8w852Rji5aXwkNNgdDn86ByVT0ryD99AWEIpCl7IBOjZB1g52OzBN907HtgFlinKqOiL6U076RhPa33jpCnriOGRDMrTRiiieXqcON149jm3vYoR0MUgWx3nysNE5FnKUlUMiS9riDFTufUmvTJXqAZ0JpLV292cLJ+uIICnlWgqE2jeUpymwo/9sfQvF68iqn6xw2Loytuisv2CRydKXBqVKMg3LTvM+DOckflG5LFFt+BicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDBYO6MJ9p1yGkRX8zTIZh2SdlUV3N0E5+QdtlYlrFE=;
 b=A+zcxyoTz3244bAUjprbtZwM5vgBoH7z/2AZ8c3iNq4qMPh82xifHyKkTtkzJDwkOFWolubSCEYqCbu5ek7zGUp6wzmCcCfz+/yTnA6J8Bsj8+uvsZk9SyEPfPkdRSfoytiwvpXQz08/9kfle38ZDFqNdTR5Vw7wLihS65NnpR6qEoHwGMbX57Sbw58UjSAaewpnWu8U3jyU0gZk1zHZg7QmtmKu6Js8YSlLFB4loYlUyRl5QetOVquUywskYwZFqWUvJhvPpQhE/WZ+aze53oVth4ohpSavmK3A62jn0P9lnSpcBJQkyGdreXj8/wrQqUsbrSHDOOCjPhVJFcg+xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 07:08:36 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:08:36 +0000
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
Subject: [PATCH v3 3/5] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Mon, 26 Aug 2024 15:08:52 +0800
Message-Id: <20240826070854.1948347-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826070854.1948347-1-xu.yang_2@nxp.com>
References: <20240826070854.1948347-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f17188-c009-46ef-1064-08dcc59de731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?56cTFsm0mDrp3UKymHE4o1I3FM+Ghe55IfOWMdIukyvFUI349l/oLsCXBcle?=
 =?us-ascii?Q?pG6v4085v0+NdCHU5mmsUSLs3tvi0ujD8EqAPwVulmOUYIkkaqIQV4G6oEZf?=
 =?us-ascii?Q?dhCz7/7MPHfJHLLkf/zzy1H3nr/3Jl9Ggudkdfqz4krVLO9okWbgBAKj8J48?=
 =?us-ascii?Q?bPrEdRaBtcjYf+wBzJHg+ZkHegbuT9gsrgD7dGovRs0zCyIrjAjuUz/8Vf8E?=
 =?us-ascii?Q?icDEazY1PSDDwuVK6mcLsO8QlcK9W1E3I2HPkUVq9aE/IkB9casurElszZ0V?=
 =?us-ascii?Q?1/XFz4jIeQo8+2UffQqQKDthkapmGdTKbx5KNveZj9pGEBJvvi8irxQWFoEM?=
 =?us-ascii?Q?jp4liSz4hFxnaPhRSvLOx5a1nPERA5IOE7+1V7nFC8rP2P9ZCps6FZ8IU2oX?=
 =?us-ascii?Q?8BxEU0p1ZA7T/IrnFkJuXjEj+7tEDoz7F/yAYPjzxWTpouTwUqF/julUFcA5?=
 =?us-ascii?Q?XDSYOTDG7c7Qx+dvt2bluSmyAGqoeLjF/tzIC/rbgu6yRFvFZMPvUVP5s8c0?=
 =?us-ascii?Q?DBWbmV+azvxY3zQhVd87+jkxmBC6SmCQsGbMChHKeeT2dGnUBp5VYgXlaau5?=
 =?us-ascii?Q?qE0kSRqnF009wbvgncTZpSVSz6lAjFrhFg0h/iuiaMlbGKxDHr5yVmBZOijO?=
 =?us-ascii?Q?OrOxuCGDqgI/Alwrox17Nowf3jpb5m9xRZqZg8WL+A6JG30B7pN89ufmiLlE?=
 =?us-ascii?Q?DBXIFV9iypxsq7Xg/qt5Dyy3UVRJJ+GZlNriJVIYep4s3t6NOrcA2QqX7D7k?=
 =?us-ascii?Q?x7ohgso3TC7Me4WHwcTMeSvX/oAIaRVkt5D70OMSJiWpLnIh5ljdVGMWM+1C?=
 =?us-ascii?Q?ABjjD5aK15pxcI3XrWumx/I/jlSPhhIPimPhdEy7HNAT0FB6ryEWKtBL9rQv?=
 =?us-ascii?Q?UM7oWV1RsOVRp8kghKjtTaT+3XHtmLXH3+OKA4MThhs0ZxjPIAGsQWI9nHyO?=
 =?us-ascii?Q?kjQNldhCB0kE2GibrEtzsflF9lCCkc5dZ9BNUO5V4y8wWStRJbti7ihC9v5H?=
 =?us-ascii?Q?NxaXI67wiHq5JqKgU+o5BW5A9T9rBGx2JIOhCl73+s0t2nKfl6dleL6wvuWt?=
 =?us-ascii?Q?w0mqm9C5LJOKZ38KbUTwHUF6lILd+bwPQjTch8NsXbnsR6fx4cC7l6IOdqmp?=
 =?us-ascii?Q?tp3QcG7mi9mfluUkgbG6rK0P0MmJuTaLC6pOq/XNVmUiv3XuvDpGTojK1kUy?=
 =?us-ascii?Q?YuDMxrFaVIXzkuwwat+vLMZrkZ/zZbZaRCFTyys42g6mJazG7s0wJZH4m/UM?=
 =?us-ascii?Q?13IhS7q50YH1RqmRMGkt0qAJw3X13+61U+qVPutl5fPlbI45G8d8GZemRtZI?=
 =?us-ascii?Q?nDxQ5DMdNbYU1C3fjIv/OIPcBInKtPuST6psX6pxAqST89knzlDSllidvwd6?=
 =?us-ascii?Q?EDdQGUmvL5GXM0+Q2AwsB+JD6fFQ7n2LZ6QC0jDBCG4fqI4d4E5XZK62JPAF?=
 =?us-ascii?Q?km2c883IM3Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4uu7oZUBti+aS3x0q6/YGg/bWHpQPTPP0kvXsIKUcRqcTuE+S9mqZeRL2FP7?=
 =?us-ascii?Q?im0P+I6U3rtCgfkbS/N/jNqFix1yWf75aX+7CUw5jUmMhWP+MW2V2LvAwM8t?=
 =?us-ascii?Q?Td9wdRiJbWZHY2NOMw34vViozJlkf9DH9HClAuxwAEUi2DaVMfK7jxvfgzCS?=
 =?us-ascii?Q?hX47I2qTmh7zx2OxJgm9xsJSXK5+d+TnyZYn7jqnWhvg2sxTIc9gwfObUi8C?=
 =?us-ascii?Q?59L4jXXAq2TlfNKri3+V5oMha6a8CNI7unagQwGi4XVJkeikvs87ArIR4y7N?=
 =?us-ascii?Q?foZ+FfXvlpSMIACglmwxP1qDH6dJUR/0ksM2mkFFam4WGDmyUcS6SvEuiV9D?=
 =?us-ascii?Q?/xA8FexzCenYu0c24OxNGIPtiMdyx5UBHSbYYGbkZwxFa0kgQmkaPTv/CRmF?=
 =?us-ascii?Q?oSmKiUcm4JXtDnHzTgICniKgixMRWT+1RC8tcisGELeJTtghj8HbUdU2r1bU?=
 =?us-ascii?Q?J54W2GBOMt0fdmsgFYue9hduxW9CEc0lzGuRamXEpoMCYVnhUbWrJ8/wT7G/?=
 =?us-ascii?Q?2bViJOxX955NZuRFQci/SJ9+eMtd+EISB7gTychUSI4Vx6qx7DdR8iL7EFMY?=
 =?us-ascii?Q?u+ORFu5IlY6dCkndJGB1cSAevifZdhLWpLiAg7PuYHUkV7E843eCG0MXO5zE?=
 =?us-ascii?Q?U+1ckI2PyrnNQ8hF/GnNuwWUtrI2BrUbYO2be9EmL/er7n1zLeLKuqvsEHm9?=
 =?us-ascii?Q?IKLKC3H3PG48uefSNF7sxcWD1/tzAg9tgZAe/VeX4KMuOICUYyIocOvnS36w?=
 =?us-ascii?Q?hLz8BI3gP47g/KsiGbYnyflDmqArcsVrYKVhCSxxioYWLxhwxGu6Q+EgP80v?=
 =?us-ascii?Q?lQuTPviuE36bkdN4axCVwG9k+XRSNGS/DiUxm20oZfKaMrGzddHlY2xcrub7?=
 =?us-ascii?Q?rKHJtRpTRl4T7ONVloBGniAl7kQNAlW2NsvW4QAUDuI1MXpD434UZnU2czHC?=
 =?us-ascii?Q?8ytPPGUcciVr7wrr+Au68GIGNqniyNPd9e3Oj0oGgr/iGw5/Z3KL733OK0BM?=
 =?us-ascii?Q?LP3tLD9tSez1JqaXZE4SkwmzbCYuX7GnFPID3a6iK6217ILz3MuTJhJwK+26?=
 =?us-ascii?Q?RaSSGVL1dqVsfSbyk/qiegb22fG6x57148kllb4YaloZpRLrUbSQCpCkNXik?=
 =?us-ascii?Q?/XHT1z2LlEhUPzf29JN+6jjfIMPRBgrBODKPMJoSYyxZuwdmUip9IjvL8etQ?=
 =?us-ascii?Q?y/GaFcqz3xsCLj4g6nzlfJ3iye92Y2qO/dclJD8KJMpAl0bbrftCRD/kaOCW?=
 =?us-ascii?Q?LZSRf4iMc0R5jyVRL5j80tFUu2c57GbXCobw4PcNRztNoIo3/N1aVRpaxTsT?=
 =?us-ascii?Q?lWcOwA8Z4fdax6+4ujQW1V/peur03n6Cvz7dlMVB/OY5Zo7noHFN0ACF2RJ6?=
 =?us-ascii?Q?zr7SSafqixvWtv2ajgugcgt+pOPM/gy3LJDt+pTELeSipaPYZ8Oaml+nfKhx?=
 =?us-ascii?Q?VoZSeoDceiNRkdecQQl6Nq0pHDVRxSk7PTupQYnNSWNzo9YOIJO2mKcAHF/O?=
 =?us-ascii?Q?B89sT/x7NuYcPAJaNmfZWS9hviNWZ6/gAP97B9rOSR7OToUzOuodLMdicE58?=
 =?us-ascii?Q?1zwGFpkpDXcjqizBryLXNNuA+6ErEz5nMzNO+WUN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f17188-c009-46ef-1064-08dcc59de731
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:08:36.1794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH/H+mDuan+PmFprqm2Mg2EgP5Ix1kfdLiNqxYcqz+ecRxtw0/uHKLhAfPKJ433goih3dZyYnVhT4S5HpOYqyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

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


