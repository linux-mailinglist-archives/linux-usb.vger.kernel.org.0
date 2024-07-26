Return-Path: <linux-usb+bounces-12447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708EF93D255
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 13:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 267832821E0
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 11:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6D817A93B;
	Fri, 26 Jul 2024 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N26crSOa"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013067.outbound.protection.outlook.com [52.101.67.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DCF17921D;
	Fri, 26 Jul 2024 11:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721993533; cv=fail; b=sT24zotO5ygbxdhsg38kH54PUy3LLXzsOiJSKdsiXZLdK91g/Q4DXKBtyJ8xN+8G7JGd8Z1DkXMGQXUXLltg9ZwSNSKvrAcK+ZQZ5+1NGvI3kzlyQ339mSMkqZLsLJllDdzTD4/ZJ8CPkJFUh5mG1Fxa7RlO/a9GN/bj0x31o3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721993533; c=relaxed/simple;
	bh=mx8S5Y+sovolL8BCcjq3tlzQkPCTxz055aVq/z14pNs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h3to+3SlCYtFSayh8RXE9XlL6L7tjMagF1T3dCoVPVSka+AhjTpQ9kvBR17JT6FW18H5PM/6kHzYPgysYxaTqeAXMk2xQk7dfZWZjuEZIZFcylRHVNI1djJSL6lbh9NWOfdGxb20c3/gmk9ONBbkCQq21DsjbSU0KCvyeHoXdcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N26crSOa; arc=fail smtp.client-ip=52.101.67.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJEn5bafGQLiaQ7Xmw6NHuilmQ3HsGh1CW5e2yqQ8f1PG3Zujt5FwyBkJ+H8M6hNs+v5hICedgm3U+8RzS/sDJvuna4EdpZD4v/nDdsgSQvuKMXDtwcIKr2l1y1LlmQckmeOZfLiqzNy1uYi1KYCwhbPVH+n+nTc2LZgT6txvzC5O2DF4zCiSleX8dT7FWE8DcVe3/tyFi/aJYXqnFrAs6CwneT3zNsb160pA2SqlvAEcpmW6u8IPI8C0CyK+9OJ3cux9xBxcbrXg1eWeronnY9JWf8JqC8sbSpmrRkVEemxTmhrkSrrHEWndPkccHppOpIhv3CTlTQ1ybUGG+q1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGcrTMWZl87AnWcW8f2fAeml0prGEvCgvMx018WqKUQ=;
 b=xvAMoAHZCOozrXB2j92XckKv3Xs4s7N/hvClbLwGcm0yOCmz2HSYHL1ELtgkPpA1zqHEZv+qYq94cpaEvjIKlRQKtOF29baFg5rasWO87wFMuf3mq2ipVUEy/R9mUO4MSD5Jm8NnEwz+v3YL4vwu/YXGwV7TtIE1GD7QoDsJcC/7Xbos2SBU+bNp5tKkSjnxim8xUYU4ujaVbVIgD6Kh/Y1mYfIF3w3E9If4HkxfcDrAc071dTvc7XBxOtt531dv3MdDRWVsbMnmBvcQkNMmYKH9zm0fnYoCWh1YE0Unn+aNzN2E7o5kO7ROwJfhnHfvpukPJWDPfgiuZVwITa9pDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGcrTMWZl87AnWcW8f2fAeml0prGEvCgvMx018WqKUQ=;
 b=N26crSOa+x3DOk6OKY3EAx57G3S0hMvLEK9EneqgF4k+/HgsdjSKpzj5er/gLkUhx8mxQc5Lnvx+sdWno4AmxSNXCLDwWIcqIbtoF5IFfLrYbowyPSLw5g1+dUkErIklEkXOJWewxjJQaDMO3nPljej99x2p0gPYmt/QzB2y9usHqRwqVr0WbJB21hJkkMwWZco9FCrIFa3l5lEEfJ1ZPRDWF79C60xmeWA7hs0hhALoNEXYyD/0hcNVEja5HVaCyMbafvAWpkp4ir4rIvnRfen+nOezbebUT15wM7lVDMLgY/0AbRzT1DNT1H26LGRliYRKvWnC4Z1xTCmmgOeLUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7875.eurprd04.prod.outlook.com (2603:10a6:20b:236::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 11:32:07 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 26 Jul 2024
 11:32:07 +0000
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
Subject: [PATCH v2 4/6] usb: phy: mxs: add wakeup enable for imx7ulp
Date: Fri, 26 Jul 2024 19:32:05 +0800
Message-Id: <20240726113207.3393247-4-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ebdf9fa9-26a8-48e8-facd-08dcad6694ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K0I4lICzVcbEX8aoemka6eJt9eAROEG0HxsvJwwLCScd+kS/Lqq5PaoA1dcF?=
 =?us-ascii?Q?aR2coJ6/To4ihX+uhm6gvKY4RAWTo65V5hvFg8CVctvSjesCn0a5dA+UGszb?=
 =?us-ascii?Q?BFO/abgg/r23sc376p9enZgt8zWPhlvhFOpOlSjwQA9sHjAzBiZ1KC4bPVG+?=
 =?us-ascii?Q?JdL1Az2Z9/Fxo6NqltE5qVZ8SAw1Iy3vJDNj8KCRjsThrgLW2bknWyl7SeKo?=
 =?us-ascii?Q?3N14O+SrseBgOlKv5J43ju5eOeBqFvDK+F1R2nG4bt3niJkDwbrJplN4koYE?=
 =?us-ascii?Q?0Ke4R7OF/fUtQk10Eq4cJ0xbI+gfKAOXHcvZXvpFK929SujRmpCvOLP+byAa?=
 =?us-ascii?Q?QZnDZaS8ZFRB5pjurzGZPJO/LbtamJs0AlXh4OSFLFCy9u0b/TObjJKOgd8A?=
 =?us-ascii?Q?RwI0ZF6wWqhTgJpB4zw3nZgPjdndrnUgyPOxmpZ5R3Kk5/QxxewxQmLj0uO4?=
 =?us-ascii?Q?9CuUjAwCGmc6f4sub18bwspidLqB2scHMqoRdBQuI598Ot7LcgFtdi3e962V?=
 =?us-ascii?Q?Y6uz8RnUcexCTnklnrZKVoapz88+xe9dpuaEdgvPP4YNeof2i8Nvb7Mii/gL?=
 =?us-ascii?Q?Zyk9RhiRBejwvrpy4jvW4wuvGDaVo3wSf6Bul4Yt7n5r4nPZ77JqZ1J6qwnV?=
 =?us-ascii?Q?0s5B5y1WNrSaWUawx/MOy8wYDokXMtn7t5I1tz1CGPmU0jgz9RGTFKRsfMW2?=
 =?us-ascii?Q?OTUiJvPK5BgXhh1SFoNeQ0btD9QqVqdZgUvK9Me4eUc6175yODvpw8/UMMI0?=
 =?us-ascii?Q?ZnZ4gGueqy8PkjUNezcWTFL3oW6z7MtmxBn+QgUyYuCUWF1YxBni2mUBZ/0x?=
 =?us-ascii?Q?kre5kPj1FUlzmNZPi0kGjqVhiz3k1x2N4yyeDszpP7JQsNavqHZR2iT3G5Zt?=
 =?us-ascii?Q?fwS3KfrNKCYXtBO6UlIzIEMot3meQ8zWKzy0Zv9nZ6XNtJYfIyHoScSuXgWZ?=
 =?us-ascii?Q?lHAArXZN8REN2Hxjdf6bQnyegO4cr0SOqfwcogp1+IAtVGNY9IbGe4dhAEIJ?=
 =?us-ascii?Q?CjjHo7yJYBxfTffpwT57HJA9WZHbKMQ6Vnyri/lSgNuXYDyXdsA9f1t2ZFER?=
 =?us-ascii?Q?owHT8au6BGSBGot5pIt8ahRTTIel5KV2Vp9ctVqA//CzlHkfwXf7hIv3HNhp?=
 =?us-ascii?Q?V5m92iIij68FL1YQKCRft2ZQrkbNzdIo569QPWkolvplS0tqgH17XKX6R31T?=
 =?us-ascii?Q?MgmGYsK52VvWHSKCJZ2hCjjegbT+zj4PCXUSpt76qQpIR2nHkpxZnKPnuRu4?=
 =?us-ascii?Q?12+v7yHA7Cq7IRfTffQcjGZ4MW04K+81jI1A95F3fRP1BqmIz083LVPXO3Kl?=
 =?us-ascii?Q?zzC5SWa7Tujo0plLq8/5FeXfttcvMD5H4qAZkGNlbvJ/gFNN9ZGnbpGtxGNS?=
 =?us-ascii?Q?w8qpnJ6j3W7cl30JGoWgSAyTRYuJy2PdYyIOEHxvj0AU5YCeexIz36nK19La?=
 =?us-ascii?Q?Xm99lTKF2zk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FjCo+GdEyzXN0i/fDTDUS2ObBJ4UUdK3fav1zajZT6qwCnSNId/PUo7sxPHh?=
 =?us-ascii?Q?g9PNUs09f9LxapWA2EyNRJ1Xi7VyfwWWG8SrnKm/W27FeiUHtVXSiubieT/6?=
 =?us-ascii?Q?5svQiflBaCM5s9tqEMTjog6gjii7aQdN5PnqZRwuJq7KThyLEk47N7e3unxU?=
 =?us-ascii?Q?1OJ+cAxEIQoKUpt2Mkq6XFTYT9z0Rj2cxtmC8iDLQ9jXTttSwEzQdjoiXQq1?=
 =?us-ascii?Q?ejqxXlW0He16m5ojGvRaYKcS5crf9bLZBofMn40c9dvb+eP2Bm9JZgo20zVw?=
 =?us-ascii?Q?Xn8nZYns0G1r1Io4lB8XmNg799iE/vOEn6WszmmEMJL+ElJPrwQ9I57QYAOi?=
 =?us-ascii?Q?6v5T8x/4rTGKPW2Jkx3LqhfFHaawNtz4+odSPvV9IkpXfILjEIzGdsTAigIm?=
 =?us-ascii?Q?aXEKtKteL+kfhblUKFap+OXP3NSq4AxipFArS5YZwk5kapoZXmdLQyuHUuQT?=
 =?us-ascii?Q?2fPYb7jIBPt91RUR3n68nnoyHooMLQL5MHyOMlo1LuUIsxSeVJe5TMIAFbY6?=
 =?us-ascii?Q?wPilg0DskbaugDlypp4Y1H0rG+PIZlEuMdFP6xwQZ4lHBceBnz52ZxAuYf/Q?=
 =?us-ascii?Q?8vRWVmELZBUXTq0FhBx5sHi0axwocvHAum8oUDYDMjrRuVjgjdpLSH2EcD5z?=
 =?us-ascii?Q?8C1h4ZYFgFhjNfLASiV95a9DrEzKCIxeGgRFE79gsdd4e/DrM1O/TJqt1bhg?=
 =?us-ascii?Q?zsH5x2eds6HWK5kyp0V9zRHHzTIoOgPQw5t2LwsUliezYmyaqQv/IZqXIarU?=
 =?us-ascii?Q?wbPxkG/n94S09kUiP0R6kx7QdyrLsDUB8mdqn/VOLNlexl3EiJzV0TvK8ZZP?=
 =?us-ascii?Q?+Er4iYOgt2u3yTKz5FqBpiO0ObyvfBJoK9CFP6jWFAFVKxWoT7Pe/P0jL1qW?=
 =?us-ascii?Q?YiPviFcKCTLTrCKBfFZ3flm8+EVbwCJdYuCMg+HsAszwlYjJmTJBnGFza0ZS?=
 =?us-ascii?Q?WexNyy/UXhxZUhwN+2jJJz3MDlyzQBdGk6SNNmmbLHIenn8t9KQK3iwGHKRh?=
 =?us-ascii?Q?Xo1crHWUg0B3YYN+2VIpSxNERrl1NKewOnqPtnR+T5dWGNKtAErY3fUwwOfU?=
 =?us-ascii?Q?HZ54xm0JRVFvCzP0JHNvC/G1mMSSRgpjSD+XZhaTbEWq19gv2apsRgAzetYy?=
 =?us-ascii?Q?ZE3+CaYeNzl4poaas3jASAnkWzX8f12qb7UZj68N+R0fG5Z657Uw9sMHDFTd?=
 =?us-ascii?Q?oqaTI1oVomXftBG+gidyQO9sFBekNAiZe19vUsZym5tK1gqrmD7qJW8Yc3TJ?=
 =?us-ascii?Q?4eT68HIuL5fH3NEU4MlLmYSiSGqiyZSJEXryWgOSqP38eEgwGJK7bV+2MriT?=
 =?us-ascii?Q?JfMlRd5hZAHv+/1e/dLtfMJnoJ6gOiefQihgl1w/nKMdcXlHYHv91r80uO12?=
 =?us-ascii?Q?Ooi13ggP+SXn0Dbb9a95AaE8ShaVjKg44IZ+yoOjaiWl6IcMKw2zRtblNANR?=
 =?us-ascii?Q?zGqWjj8S7U+vWnovYiRHUQfkY/2U5VXkm6Hpe8aSV//O4O7BYSbm9iBPSjaY?=
 =?us-ascii?Q?7OF2+oF3tOZ8ziLbhM0vFcH1k3vMfNf7t0upx6lg9u8eBPoeI3D8XBPWTKk1?=
 =?us-ascii?Q?DxLo+TS4mPHelpu0YZ0cj31d2pK0Fahg5ZL1bPf9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdf9fa9-26a8-48e8-facd-08dcad6694ad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 11:32:07.4471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz+Lq9KJWlEhs5mRBTrGman7e0C/pA/Il8Opq+2KMo/n7/ZVej86mvs+Ewz1FdqtBDw5Qw5ZIQiFhirjoWgJJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7875

This wakeup setting can enable USB wakeup function even the
controller's power is lost, and both A7 and M4 are in VLLS mode.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
---
 drivers/usb/phy/phy-mxs-usb.c | 41 +++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index e172af75f602..acaae22df3ba 100644
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
@@ -214,6 +219,7 @@ struct mxs_phy {
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
@@ -849,6 +866,22 @@ static void mxs_phy_remove(struct platform_device *pdev)
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
@@ -869,8 +902,10 @@ static int mxs_phy_system_suspend(struct device *dev)
 {
 	struct mxs_phy *mxs_phy = dev_get_drvdata(dev);
 
-	if (device_may_wakeup(dev))
+	if (device_may_wakeup(dev)) {
 		mxs_phy_enable_ldo_in_suspend(mxs_phy, true);
+		mxs_phy_wakeup_enable(mxs_phy, true);
+	}
 
 	return 0;
 }
@@ -879,8 +914,10 @@ static int mxs_phy_system_resume(struct device *dev)
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


