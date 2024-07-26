Return-Path: <linux-usb+bounces-12448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C3F93D257
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 13:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71D092820FE
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C1A17B40C;
	Fri, 26 Jul 2024 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YRm8oPMD"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6720417A598;
	Fri, 26 Jul 2024 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721993537; cv=fail; b=BwnBWLW7KkV4ROshTUfJfBfh3d8aUM1cCipwIIVp+ur5yubWG/oUiOxKrIJqtcH13jQ45/SWz0j0SZrjBDXCt1VxU5qBH+PToj8Nc5FepYXZSGl8BNNyKgWa0xzSwfGQA6S/kIND2Ti3RM4j8szDyI4lN+ecqpJYMZxK6WwGm3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721993537; c=relaxed/simple;
	bh=/KqYinQrLMTFy1/Gb9rNLBIGwCKengdInM1ywIFOqgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C+FMh87rUuproD/CeOhu+aVNRZkE+DzYt4Vcqgt8WDwSagca3L3wYmy052mcmVJVMbNgOw7tXBwjV7mSzjuz8maLTEVqmqG1ng146xqara8pf3mNOYvIaJBoU/D7CLftyH81UHBP7Br4loEGcpgL3gImut/t0aNpdOpqViK2Lag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YRm8oPMD; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3OCTXA6gV2ZuEI97oeHg5O42w+oRIUI7HNjyNRxujPXgdVDMs2X0tGdeSEsTpEBDsMWUASLtDQR7OPzt4OH5I/IPCDFW/iwoFxRtBBNKyMjSHmMA8wx8xz1Wgi3VAn4RVDsxBnszQjrr7IgmP/bSvlgrPfep3KsKHV8XDHf8+1tFPKjoTt4x/ZmMt+q14uoAKxJBsazaDv3szX4zIIFw/w7PwKTsA/WZAImEWN2aSuD4ZbujbV5hqXWy/f90EMMfceuu6P9LfUZmcDuhQIN0L60YD3WoyIiwUF5t/4KPQR5NUSYpCIf1OL5buO5TokA3zh4R3usvKTOJbWI/rjIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc8GqDn4aissjR0kH4vFaFrtaqYPqnSkoWdeaJsETiM=;
 b=FnlWsmbBMt0PA6F+iZ3G0RgGi/YX7ECjaCzZc4JDjhvyhYoSXl+BjcNHAzXRiVXwZ++4uxe1ZUveOnMy8aCVV9rrRFEx+oRXn91phMK6EW9B2jQsom8e0SJUnR8fSxwXO1Zwae8oSIq6qNJvXjsVg5FPJrlL/22K6g64Z/wSfKfCWMgn9F+hZW0RtaymeWm4jvJiGwdRBF+JL3FM8lP6jfqKlX4sl9LilOwzYyiOAeUCdC61tMRjyujeM9lmw2YogCcoABwCYlfu+KtIa4D9F+hL6qQzW/XsM7mrV292dcW9Fo73gqKGEKaXkkYicv+Gp6D36ZI1EpnE20r6IBA9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc8GqDn4aissjR0kH4vFaFrtaqYPqnSkoWdeaJsETiM=;
 b=YRm8oPMDzhdCfhcm9PA0Pr682nEbRz2VUoK+Au2g+5GWwUBB7bBvEvW36zHKcIInEVehbZiNjlIh2ZHesNvbpe8hoobvsDZNZbL04NBAhMCvPamFXmomWw0BYWCqznBTgJ31LDuuX4ISMDgSu2v3qrVHLM87/++M62mdT1Hiq+kJVQFADShfHHeXfQUdtKWKjtRAvQp/WPU6TQO8DbojfEPQqd+dmcdaASBeC25b6hY7T6q5jFFWZylbR5ijrOcBNdUuux79PlHRurLw6p09VctosLnO/fV0BwHyMJVGjQG4J3mCn7IJoD+Xzo1whOLcS0o5ZrYtPnk6hZ0QWKyUKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7875.eurprd04.prod.outlook.com (2603:10a6:20b:236::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 11:32:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 26 Jul 2024
 11:32:12 +0000
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
Subject: [PATCH v2 5/6] usb: phy: mxs: enable weak 1p1 regulator for imx6ul during suspend
Date: Fri, 26 Jul 2024 19:32:06 +0800
Message-Id: <20240726113207.3393247-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726113207.3393247-1-xu.yang_2@nxp.com>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b70f7c-2c6e-4070-1dc6-08dcad6697c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T3jb3f610K0D2x8TohSTbxaO8jx97HZDY2OCBE9FQNXeVsP0t5i7kqhdxAGL?=
 =?us-ascii?Q?xIB3AUEELm8lQD0YdhJuqwoKw3V7/Qqhqm24GZtDXXUR9yXrCDButjCRpLcA?=
 =?us-ascii?Q?iQHsy8GI9GesR4KLpMppK42PDyP1qQ25Yb7eydInVYO/tEIn8nsm9z6Hm8nJ?=
 =?us-ascii?Q?vu95WbP089ZJMwwHA4kIwpg5sK1nsM3MtXuCfUtscNFDwfLwwfeduBXazobR?=
 =?us-ascii?Q?UfRhmJjt2AzvIQlIc8tND5Q0LnaNJET1UfeBxncYfM/s3uLUFpckbbXa1HJW?=
 =?us-ascii?Q?CRnKTKZtB06LkxcSPc3z8/sUGiQcGP4k/nEsJfze4MCYkh/C5ylmBoK4hks8?=
 =?us-ascii?Q?blKFKzj4oxJT/ehFI/EmnTFIYuZLyoz1aqIft7Hppy/8PEFUm30x5TkHZJhB?=
 =?us-ascii?Q?ZWEz1Vc/S44dzgB84IVecaA2f5MiveXOkv93+BbVEvcgcMRYttBlOvKVVe21?=
 =?us-ascii?Q?bfE1e/2GvLNQabbiuPlDqQaU1ICPGm1D8qsXfQbVZwVgAvZ3TqX49jeYWgUa?=
 =?us-ascii?Q?Dnq+VINR07l3808NIRXDM+KxhCk2neD38vLkQVt8uyqVJWvhbGZ6/APGt3op?=
 =?us-ascii?Q?NEIzPZE4FQDkKqXCelkyQPvVJ+01rP76iI8aSUhO3iR7IxcdJMeaRCMipXU+?=
 =?us-ascii?Q?BKtICw2Z8LxLgo/1La/hSSF4lAOU/f/N9CpEsDSwOHfK1u754Jbmv9BAJM+T?=
 =?us-ascii?Q?+dBCfR/B2FPGwufjIvC+7CV2l4eCAKtHvc8OZJcxflTYrJ45fW7fLxxTkvkf?=
 =?us-ascii?Q?hZvBQgQwZj2+vES6t2GqmSeks1T2dkb1Mge+whln5tf4h296psyGHpuvZyTS?=
 =?us-ascii?Q?4JF7sUqKx9tPujTbOmnGfj7bqZCCpP9Gk3XLGu91FjchtNM7ZKbXHcQuiHig?=
 =?us-ascii?Q?ZwflzWyBfNerxiiJ4f0OrsdLois9++3lngDg8yNBDCx4Td08Rg7mF4DTNRgZ?=
 =?us-ascii?Q?QlJPWford1xgm+QaxKtBsKp6aAlaRchPv8S/z6NSrHwhtABmhpoGfBZu1ty1?=
 =?us-ascii?Q?aHc1+NnI2/qKysCrjnEfv+tqZ2+7uLqm31TmzWbsSAxzSeYZ5ZMA2GPZlvaM?=
 =?us-ascii?Q?3cEMQpxmFc0D0eEjFYyovp/EXS9ppoPSZK1+S5O1VFyoZgH5rDmOduMI5Mxm?=
 =?us-ascii?Q?5ReJhEDYaxNGBJkorlyeZ4T2JUTFYELQw0wyXPScH4MJZRMz38KCYBaihY4a?=
 =?us-ascii?Q?JIIwSGAj7BEDJx94YvtGMWwo+uNRXTDMKBWzl62C4GpOjfayIrNtFs19rYbR?=
 =?us-ascii?Q?LTgZHm37GD/luVh8J8c1Fm0LuezwhVCUlfcH9DK0BNatshVp4OdMP+hq8TaL?=
 =?us-ascii?Q?0T6TCi5RZL64M605cJGJF/JTK3B1adKIzhtxY1qWx/4Ci3Om2Wv6aDd+7svM?=
 =?us-ascii?Q?f9V+F5qZauW9iMfpG8gp+uMgiYWM2yVkNITJK9Bn0B06ybnoo9z2gURRvt9p?=
 =?us-ascii?Q?BRdyzyo4kxA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7j/wlND+iKHJp4P6H/HHfYoTS3A3XcbmJ2VenPBx4rzzeBpL/DujAcGr+dVE?=
 =?us-ascii?Q?si5Nl45l+Ss8oMxK6h2M59Y5JosxDU8X8wD7ungtwOt08RpnpTO58z/idIOD?=
 =?us-ascii?Q?XeBfZE7bxdKgkYE6oL2DCuRarCkDGWnE+2/5nEGc1BFsMI/r/nu+yHv2Nutv?=
 =?us-ascii?Q?SQh30DUq1EmxVjUvTufuPolQEbSmZTnd1ha9yFq6U9ktGowY9zP0r+n6aWFQ?=
 =?us-ascii?Q?No44l4494hcpLj8x1tyP5U1iFHMdxvfPerfhnG+rvXGHHRABFriuyY2Mc7Ld?=
 =?us-ascii?Q?jOgBkNsILfDCWvmhe67yKNsbv8/ppS7nTaRXyCE9f+5JgGY0timV6mVjA1EA?=
 =?us-ascii?Q?u5sMEx5fATZowAdOUKlyC2SnQV8O7w+EjAjOUFCTRYgms5TbuvEyEOJndmgd?=
 =?us-ascii?Q?WlFbjf9AB5yhIKso4zlJG+/rjCxM+0vP4CO1sgeGrpynIJ2v1OzWYahJ5JeK?=
 =?us-ascii?Q?MPSqtM8Lsi7TPbsj3F676tAYnyH9+hhnvWK5LNEcXql1ZNjmBfs7m0PxC5F/?=
 =?us-ascii?Q?J5CZCbw3RkMW2HdAz2Or+CKBVoIMWT/HLBK6+sKsoSiaicFeEgPpt/YMEgYD?=
 =?us-ascii?Q?pBtcNWHAXPqo0f+p4xnhRCHTYYuVImQp7+I6eo8SxPRhU5ypheNeK/Rp5tsd?=
 =?us-ascii?Q?8CXATMYYJWmb+CiLmEGxzdFeoYS3bS3iF72mXUguNTq9ju92pPLWsq4wfFN5?=
 =?us-ascii?Q?VIa2ZMfm1wIjnuMmT+tHOtnRnrGH9a3d9Np8SC7b3RLHCZamf2FzBqn9gT80?=
 =?us-ascii?Q?1LMkLUATM9Bqo1Z62vD3/yVsIwwqorHTH+QpHGDv+JnOCGrVrOKzH9nnm/7D?=
 =?us-ascii?Q?pzuTAkVubO2zjxPoo8mPVgaWJ+jArLKwDkIdf9lKrdWhgh+mLnRYcrRq+fuC?=
 =?us-ascii?Q?lVpmi3ExkTa1WlGz6kmPmC/VR4H0uDimrmRse3iDMOw0tZE0QBfsdk17CHYO?=
 =?us-ascii?Q?c06jEyHOlrbsPeDIuuf+h9sxI8OtqURWUcaPtvZROsWJ6DcbUqKz98lgYGVX?=
 =?us-ascii?Q?4oZXGnlY66gHpWkErVAVNqUbrtXIaN61bigqgg898nzOFw8jbsy6LW2BRNW7?=
 =?us-ascii?Q?4b7P5YU5T1zkFzmLPLNWhCJ+qNusZIFrB6rowGfXMpH8Lx4P3TfXyYKa+FhD?=
 =?us-ascii?Q?QzkMwQbHzRBCUi9nwuKiFfgyqv92CgBy4a2WWVzd1/gVTHwFFXs8O+LjO+WM?=
 =?us-ascii?Q?0f+mrtWCf9hfgzhGFIJ/VObldFtVdd8VhMhlvK54QjFLtsCB7WLqiQyKLGDU?=
 =?us-ascii?Q?UzCwduxFsR5eIU74awmaj3xgZCDP/dEN5+iAJwdO3Zg2nTCJnL5jPn7EndsK?=
 =?us-ascii?Q?eJE59tL+LBuxdKEfgEnEVDEOb0n0dLQExgDe/9SUA4dKIt7i5nPVgb+UD3z7?=
 =?us-ascii?Q?YyZk+OQk5cVN5u2lGfo17amcizyaaSNiHUnADKQD02Seu/Ckh3js6BjEV9DI?=
 =?us-ascii?Q?CnHILAdj9NsOeAj4vRHuojpWDeaMLP/Xlk0H6aAOagxIE+qSS+SwwYkadMkT?=
 =?us-ascii?Q?bekz69WYOxJgL4cCkebnmLHDg3hqBGzNZpH5R3M1EVi33mFxWU1GUyHB97rt?=
 =?us-ascii?Q?FuMNNW0Iwsb3jF26GdVQoSeWi42hVv8/ROpD40at?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b70f7c-2c6e-4070-1dc6-08dcad6697c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 11:32:12.5986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dxP1SW1KTQKFN5Y2baL35VcL7GS4acc+GLyT6Py5+kZn6+B/tngGtjeW7mGCkACZl72A2/d0KWvYbK9Gkatsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7875

1p1 is off when the system enters suspend at i.MX6UL. It cause the PHY
get wrong USB DP/DM value, then unexpected wakeup may occur if USB wakeup
enabled. This will enable weak 1p1 during PHY suspend if vbus exist. So
USB DP/DM is correct when system suspend.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify commit message
---
 drivers/usb/phy/phy-mxs-usb.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index acaae22df3ba..cc4156c1b148 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -71,6 +71,9 @@
 #define BM_USBPHY_PLL_EN_USB_CLKS		BIT(6)
 
 /* Anatop Registers */
+#define ANADIG_REG_1P1_SET			0x114
+#define ANADIG_REG_1P1_CLR			0x118
+
 #define ANADIG_ANA_MISC0			0x150
 #define ANADIG_ANA_MISC0_SET			0x154
 #define ANADIG_ANA_MISC0_CLR			0x158
@@ -123,6 +126,9 @@
 
 #define USB_PHY_VLLS_WAKEUP_EN			BIT(0)
 
+#define BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG	BIT(18)
+#define BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP	BIT(19)
+
 #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
 
 /* Do disconnection between PHY and controller without vbus */
@@ -196,7 +202,8 @@ static const struct mxs_phy_data imx6sx_phy_data = {
 };
 
 static const struct mxs_phy_data imx6ul_phy_data = {
-	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
+	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
+		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
 };
 
 static const struct mxs_phy_data imx7ulp_phy_data = {
@@ -241,6 +248,11 @@ static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
 	return mxs_phy->data == &imx7ulp_phy_data;
 }
 
+static inline bool is_imx6ul_phy(struct mxs_phy *mxs_phy)
+{
+	return mxs_phy->data == &imx6ul_phy_data;
+}
+
 /*
  * PHY needs some 32K cycles to switch from 32K clock to
  * bus (such as AHB/AXI, etc) clock.
@@ -884,18 +896,30 @@ static void mxs_phy_wakeup_enable(struct mxs_phy *mxs_phy, bool on)
 
 static void mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
 {
-	unsigned int reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
+	unsigned int reg;
+	u32 value;
 
 	/* If the SoCs don't have anatop, quit */
 	if (!mxs_phy->regmap_anatop)
 		return;
 
-	if (is_imx6q_phy(mxs_phy))
+	if (is_imx6q_phy(mxs_phy)) {
+		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
 		regmap_write(mxs_phy->regmap_anatop, reg,
 			BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG);
-	else if (is_imx6sl_phy(mxs_phy))
+	} else if (is_imx6sl_phy(mxs_phy)) {
+		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
 		regmap_write(mxs_phy->regmap_anatop,
 			reg, BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG_SL);
+	} else if (is_imx6ul_phy(mxs_phy)) {
+		reg = on ? ANADIG_REG_1P1_SET : ANADIG_REG_1P1_CLR;
+		value = BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG |
+			BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP;
+		if (mxs_phy_get_vbus_status(mxs_phy) && on)
+			regmap_write(mxs_phy->regmap_anatop, reg, value);
+		else if (!on)
+			regmap_write(mxs_phy->regmap_anatop, reg, value);
+	}
 }
 
 static int mxs_phy_system_suspend(struct device *dev)
-- 
2.34.1


