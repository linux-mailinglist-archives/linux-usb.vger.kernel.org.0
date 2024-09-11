Return-Path: <linux-usb+bounces-14931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F8974A45
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 08:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE2FC1C255EE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 06:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279247DA9C;
	Wed, 11 Sep 2024 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TAhAvhNS"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2042.outbound.protection.outlook.com [40.107.247.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF4B76C61;
	Wed, 11 Sep 2024 06:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035403; cv=fail; b=IGQjBP8eiB8RGWvplI60Ci9P9k7C1+xJtAHYQvlG7Q8KdpypiDXVuBIAVuazHMJafEaMgN0o04y3CE4JROP5rcdgoPDhxFAWVw9ydmhcNBy4+4CI7asYKcDlfG4aPD5WKAnaIbuUejsmGGV6M17q9FXrBLq3BGWm6xGyfn1dIz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035403; c=relaxed/simple;
	bh=yotd40rd+Qe8Nl/mbFVT/c2GD+w2ncOSiGM4/NH0hlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jnf6K6/G3jtSSiYhb8vIDEPpie5zpcFqSboOKv9zPIOb3ZQPTcHB4kW+BMFg9wpaWk6FQBNRGEC23LJQp0WvgS3ex6LGqtg1iVlm6HfNcjcfWnuwgGQnDjBKNlc4h35VJJFq6p7SUNdIhWVTB8Z0CDYoXQ4ot+8XzXkCY06lZzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TAhAvhNS; arc=fail smtp.client-ip=40.107.247.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tM3qD+82H0iKqoAOmQLBKpCzoQq39ua2b+hRhsKJ/I6VAAZYCiBop2dBAXXip/QsIMcR33qqYVo2+js1fAB6niNMWH4jWSqexZaOVWOTGICwlgeNuYkec/xACHb5qEJ9VH6V7rFrE/vMZEnFbiEie2Qn2tVhW1INEutcOgwq+KYx5Ym3/dcV8907wUjlS9Uuu1uawrWXi1VHiUkuxwCyjJ9atpD/1GQ5VEHssKkj5Rxn37efldAyCEs6dhnkmCdFFDUcIKFQW2sYbw1vDTzIUHy6Iw2+sxUuQWUfGLWE2fm5byWEUteAHlI+eDmoMu2uUDjcnU8SgeGM0Z+O4d2YCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5w+FOBCIpnBGrufAJOXY9hayxyY98hwCXhCsROkvEp4=;
 b=PrSHOBbzItUJP0/WndpmDkoTyBR3oOWaRLxb6prgJWfLjbsja1hKxpdiGXCi0VAH0hvKVWbtPjcXocZNW7c+SIV+kFq2HhUrXcJqvEdzq/Gcktmc19y1PC6TzvIwVV3SNUKeeF+Uh2Gb/8BF7r6LFxhzIhZZ4j2oApT602M09B8lDkIUCwOX3fMbr+p0zjZrmYGRjbYb1Ny5avuSfLlXaa1AVcUAq2y7rASzvP0oYkJpmPQjS4Z5bzzf2CpMLeNZtiTe9+vtSfCCs3B+Yh1WSdfzsfrtD+MCifDpMB9MJaV/bI6klCCGWDZkLROREg8WOYRcLv4FQi4LF61X1dbuCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w+FOBCIpnBGrufAJOXY9hayxyY98hwCXhCsROkvEp4=;
 b=TAhAvhNSqK3ZdSR4JwN1XmNmQsH9nkfGV87QPvQgWHawex/8oGTxmcC3RMBntSOQ5/NP4od+kgdlzPwBYONel3OvxJm6Wfvx69R03EQV6/fwujEvqXIBUjspHyDtCq6nUqaySYdzoWInMWKYNkE2/X8mefk030RW91Satyw3J5rPVYEA92Q4K+4opM+gNJ0VA2fbqIyYFc2zxMhJa3/6dZ68U6RiMABi4xcb6kcMtluWQuDBNRZZOM6D39wBFYgYn5sdiutfZfMRHkPZPMeuWIxxuHsNxUxeiMKukCkdpEuZRqHTbT4ff+xoPhxuOxXHVsfVH8g3cPgHGlyiQSw/pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10561.eurprd04.prod.outlook.com (2603:10a6:150:227::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 06:16:38 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 06:16:37 +0000
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
Subject: [PATCH v5 2/5] dt-bindings: usb: dwc3-imx8mp: add compatible string for imx95
Date: Wed, 11 Sep 2024 14:17:17 +0800
Message-Id: <20240911061720.495606-2-xu.yang_2@nxp.com>
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10561:EE_
X-MS-Office365-Filtering-Correlation-Id: e0897205-6ddd-4494-c530-08dcd2294b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P+2MrJNal7B9Qw8bIZPALvn3Em2OXHMQ4Yfx3axi6IGf/WWsz92FaZOWYwoW?=
 =?us-ascii?Q?q91TO9A+K2TsQxg8fCGcSllfWPS34TyHndyjDAhRZ9GYFN06j06i3iC15TXF?=
 =?us-ascii?Q?0h+KeTO6L+eP8BPmkrMk2slJrvUzIE3yeee0YTMEnxuD0LaGg9cg+ZF14uUv?=
 =?us-ascii?Q?EzIkdRMHkdmT7jREqd3M6lwkx4ik861YFM/cedaX4XOsmICDZtQ9H+kGO8Wi?=
 =?us-ascii?Q?9ZkxvAGgm8rckFfS4IPJa4a8m0cwMrLDGwSENv905RCgW17z7/IyWVKhKlHh?=
 =?us-ascii?Q?54XKMs8lYPoFWZAQliEVaDFLbUi3eUcAlLFUci+CBgFMdPG7H3T4wy6ZpBp4?=
 =?us-ascii?Q?DpIoNUdKW2Vr4fw43Mi3Xu2Xn6jTZ9pd88N1ckyK+uFhJZWL2aGeEk/1trAM?=
 =?us-ascii?Q?YZ6dtT2Wzs4nQDMmATtFYBzAKYBESv0z6j8ZTUub4qMZDcF4XiNB6xvLRHYm?=
 =?us-ascii?Q?bAuctlO4n7E8Ldc/ZSICJvPj04xxIbtAL3w+p4f1XullOZVBTN3j39BEcER1?=
 =?us-ascii?Q?f4Id6p3SANk3wdEVOrcDVO94m8yt9zYxvGBWSrpqbNP8P7AK7218QtACUwMS?=
 =?us-ascii?Q?94VTOilMnLIqasLXh5bKy+hzBgseHV7agvGn6jupHMll5oxprkxq7kxLqpTN?=
 =?us-ascii?Q?J3KSD8CIYuVmC4B6NaiwO8h/903arw1WnIal9uGi7E56cU+naHHq54lEEmJr?=
 =?us-ascii?Q?iZUXNI7l/7T6fuCrSJ2F5lcWz7PyIEQMZ0y6zpY8yJtLAYpRhDv+fRIp1Op+?=
 =?us-ascii?Q?2bCqp86gsSbVsFn29MWSoKR55p3Lld2899r7DWbldwxHaZ3sHniwi7i7J9Xi?=
 =?us-ascii?Q?vF82Mi5+rVbUh45UACZOdkgeUIdyFD+aY1jg8fvkFr7U2kBOvPNndpCVJmjS?=
 =?us-ascii?Q?/CsHlWOKN440VIwPwLKhVsGennMGTAdaskrSTQvHxbdSA5HH08u1/C77EGur?=
 =?us-ascii?Q?U+P4bAsUdh3BPWA6TnweCF5G88G3TwKwhmulyxA2LuXJoCcyKLnpeRsU36bR?=
 =?us-ascii?Q?MQhng/PXe+zPpoeLlQ6Ac9AAKEn9Yw909/EawJFBs8lHgRyEaOmWCFBj3Xwq?=
 =?us-ascii?Q?EETqOpJWY5lvMpFKHg4ntBCoofdTcUDbcxMtBar+hv5KdpmV+L/odXpDuq2x?=
 =?us-ascii?Q?ltvqccueMT4/KbCEdT1D5EsbmvRaJ7AiyRA9QBQr1G15RWkgZjwUdVOsZydW?=
 =?us-ascii?Q?Nlb1+SQgNSHmRkRAN6iPNkWt8piP36B/abGiWzmP27all/PyxQ0s2S6/Jxkn?=
 =?us-ascii?Q?EtY+xs86RQIoaoQqo86dl8+ZoUcwkUnTlTufd3UzFJjAHOWH8vV1F6z01Ijl?=
 =?us-ascii?Q?OETHQWuqVWuc4pxrDrSLKwvBXhlyVbUuzv9sIiRXjt3xNXrJEaUQ+YzLrm3S?=
 =?us-ascii?Q?gceAw7AcpHaHE3HTCygyGiP9K1iGLyqYOB/48T6scMkWVlssbJPzzfeTZ5kC?=
 =?us-ascii?Q?JRWV2QQDSow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PSut086YMPW7ADmPukEKmM/adqZGdQhsxxN1Yc2XN98Qm/a4m/6DBUM3cr39?=
 =?us-ascii?Q?/8M/xJkdr7Ex7sPM627DobfKQ5sJREdckhRnTyM8ttNmvcyDBd6s5f1G6ctC?=
 =?us-ascii?Q?GRSpk5lnlKXQSEBOCQcMhgcAR/Hnl5fVUAW6QjLnw6YU4WA0QpNwuo9cQ5RL?=
 =?us-ascii?Q?ZHerCJE7iCYQycDt8J1QwhJRu4SP7FR/KVl+t1KyMbaIvuFK5HM7nps5FSOV?=
 =?us-ascii?Q?kUNBhDqsFr1oUKSMjJbhQciKg0Ncmcb6ijUXqfmCzEbn7r8kjxfJ2Zrrhb/W?=
 =?us-ascii?Q?nhxe2DPfQEzTFivrd7NibZo/xkyGl2/KeYseDpwmv8bydLQzMpY5JFQXtNB8?=
 =?us-ascii?Q?WlOKTJjgcWYK0+ArSW7Fuz4maNThUQGAYCzrzBnHzn9atr8tahMoNJs7Pr+v?=
 =?us-ascii?Q?5+wpnFvAISRk5FPFG2X905GLaBL+JWe5EszZKirLT1QQOhlntf0MbPz1E5tL?=
 =?us-ascii?Q?FMKplr3+vXqJQ927WiUZQvrqHwMNlbGqmfCQgPcu2j+j0Lbcb3MdRP/KsBjw?=
 =?us-ascii?Q?gpaYySYcsEHH7gWimvvRabkE/KNbNT/2OP80T/JFxLjQppzt6YBvEmXeGVkT?=
 =?us-ascii?Q?xW8LuiPv92mbp/xfYDHtT6JdxCvm0/VD3X7SXKTt1B6tvsuCJj8TP/FXnIcJ?=
 =?us-ascii?Q?Skc8FHF3PiJxdLx9p1JbZT+X5YboAJ6iaDKT74d0OQHDB/DIYh4UAP5Pw66h?=
 =?us-ascii?Q?/vlNgedf2UNn+BtC1OsCio7sYCPutQ2I0Z0D6jxV6td6XShqLVOhSOB5KGOD?=
 =?us-ascii?Q?RKMFPLMrO+2clyOv5hSK9T9y7AU9oxoYitPBFrLsUuOLUZta6w+dePUKLvET?=
 =?us-ascii?Q?RVfdlMo4KGy6O9ZXbPwqeYOz6OzdSrHshvWmGztbwVi7gOf+iYa9XU3+UZQ9?=
 =?us-ascii?Q?QSCF9pF3UIWQ/+zkRyzFbn+3yzJdZMVSNrEq7HmOKL5sNFUvIqyCwmLmQb5o?=
 =?us-ascii?Q?pGp8VJixvFcBmrcI53K5AhJq29Il2ng8goZzfGIPR9gVKv29hMf22ksll0po?=
 =?us-ascii?Q?71x2C+VY0BLmZ/xK9fR1ah+WXwrCr1/VveGorHEJ9QKtPYU10Ch/YeodcJUj?=
 =?us-ascii?Q?zf0NTPHzFOvmfS4RdSbuqPuj+reurkoYSXDs/0tM2Zpxz2qt2LbHzQJ1zRWp?=
 =?us-ascii?Q?8OfdsOhL/5bTjlop8x3e6ewcFkxLicOvDpzkuuPmHbeNa7B2APGgJ9nwD4Io?=
 =?us-ascii?Q?IDkvvtahf5y7ibN5p7EI4jdEpYVOG+vd8xBTkZz2qXsmAp0r4sdnLvqPtVtC?=
 =?us-ascii?Q?aOU7Z62zRGySBIftIXlCsCICWSQfzXInfDm9pDnIQlkiQIl5qsbV51cwP7LL?=
 =?us-ascii?Q?qNXZo+I6bP6ArA1JAsONT6U9z0H/9Wl4LT9DU1PtjZlSsCIQ6r/JTwOCsd6/?=
 =?us-ascii?Q?LvjJ5M3cmrI7NHcSfInPzCOWzkOHLJBu6FYNTE3PxkGlpqR5uNI22eUAGscA?=
 =?us-ascii?Q?vTh1d4I7I/Oeonmc+Ishu12wt2xqfRpfbygBz9+kiEiSF6JCSv+c7vRxxRlD?=
 =?us-ascii?Q?34UrlZ/oqBWwfWQwkAHFDoNhSElCC1MuGfX8sRrR1C5G0kTCKfmfv2+yHz7d?=
 =?us-ascii?Q?2C7ft+qMGdh6O4uAxY0jqdhs5LTR5lANB2w1vGIQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0897205-6ddd-4494-c530-08dcd2294b0c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:16:37.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4g3PjldHbBhcvPxFKhywuEPNi95vd7/DreHS/nACIUlJ57zG7S9ZrhosZzjMTDhMsdWSDJ/QiHWRDDmT38u2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10561

The i.MX95 is compatible with i.MX8MP's usb controller. This will add a
compatible string "fsl,imx95-dwc3" for i.MX95.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Ack-by tag
Changes in v3:
 - no changes
Changes in v4:
 - no changes
Changes in v5:
 - no changes
---
 Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
index 9ea1e4cd0709..baf130669c38 100644
--- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -12,7 +12,11 @@ maintainers:
 
 properties:
   compatible:
-    const: fsl,imx8mp-dwc3
+    oneOf:
+      - items:
+          - const: fsl,imx95-dwc3
+          - const: fsl,imx8mp-dwc3
+      - const: fsl,imx8mp-dwc3
 
   reg:
     items:
-- 
2.34.1


