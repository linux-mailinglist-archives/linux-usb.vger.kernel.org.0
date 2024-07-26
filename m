Return-Path: <linux-usb+bounces-12458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0393D599
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 17:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42B411F22D19
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA8917334E;
	Fri, 26 Jul 2024 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LZsYEu1B"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8341CBA53
	for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2024 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722006469; cv=fail; b=c6cK7REiZu6ieDyY0QHnDc2tsektS1svfPk7Ak5OPHlsgPb9CWKTLd33dqCG193jX/rX1Xz5RCoHYdaxoVFhNhLkOo+5dLr30NFDpsiihF4YeRn6n4FrWvii+4B5MMjsk2Xx120tc67VkK2SJNMYLLXxOBqVBE/TOvgQ/3FpSIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722006469; c=relaxed/simple;
	bh=FZRuazIFjQA6D2grIIz/KOAMqyrRXN4wHYNWjDr5zsk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Z1rVKO1HD8uip2isU0UGlOXiiXlZC568mRLUXdvpWoY0fAY62LDpGS1/D7E3NsqOthcYTha/9wr+f1MpPSLxQtrxelNLPu/QkpdQZZIjEgPB7czhBfZARhXhLAFoIb49kBM6Zdj10Ml6Rxj9DJ9/mwgIYZSpdzCVwhEoIhusS2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LZsYEu1B; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ry3b7oSLRZjWztHW/e6RlJyOx40aO2SAILOXZR0qaVu/kmCnTVH9hTXIc9fAgbiTEYzu0J66wt4SxwYW9SfPMTg7pwkBBgNAiGxQQ9gTkDHCimDcwQU1kBjV5skq625Jrk5MeLK2IwBSZrivEY2et6thlznYUdLSfFWjGsGL/IOfiFki6hI10fDf2BBgAeP7yreas6RmXVmk+URiRaS/YJ4Lgi3PwRUhbUKXaStesW5TmnejrzamTZMfEX9709gNRSU5EYYQW+ktAmR89Sz0xwk5QyYJhhx9JiZf0S8biPzhYFZMdiHRseEt66gt9PSgTsQ2EZB04PZ3f2psAHhBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/h9UdQUe6HKGksMkkotjo5BNj4tG+SgMb2q8cRKxS4=;
 b=NeshoxuY4g/WAfq/sfy3JKJYulSf8eMw+y/zCNBHzfx9W4PjuUBN80U+HKh8Qezb66CbfnsA2zxn3alou2cEC3TQJIZbtrzUlni9zeKJf6bIvX7CAvtkpAkviaDL71cQC1CZht2DB3d4VyJNpoExNchph57IVSgyNsVSw5CitAl5J8XYpCfSZBPWDkO1kjDPuLVYzj6ulYRlLOg+Ezp3mPVK/wOwY8UZMHtyHSmQzx4jpisg0tNAOnzX4nzXAxeN73xWlVEUzp3MUoKIn/rsqfRsLLADy8h+uaLul5LT9z1DG3TesY9gukYEMTjRi9omlqqdWw9yxH94lAAA5EgCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/h9UdQUe6HKGksMkkotjo5BNj4tG+SgMb2q8cRKxS4=;
 b=LZsYEu1BUEuMBgjCgt2qnZVSTDyL9KeTT3kQNK3YMLUMzCyNlOR5DEl1dMFl/yeW2sgx1ZuvS+qMZaxfAPMi47z3o3JpLRiDa1LyJcByLqXp6DNIsgW8/PHO6+HXRmsy2PZok+r1KfMZDJoF1NEPDZLdJpV4wRyU/P69fC2r94y+xg34ReSr0phMFtXt/cZNqfVhgcAwAPDMk7Fr8eH4G0wVHAWY3JqRbyteaQRrH9MUMI3wNCEvcp4qfakVi1ojGy1xY+BwnaDQRYMTPgGWNKUTs5mwJbQoR9hVCgjJFaAjJnPRN+t3Sqoptmb3V4WIk3CJGMnFeyH4Vm//ysxl2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU4PR04MB10717.eurprd04.prod.outlook.com (2603:10a6:10:584::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 15:07:44 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 15:07:44 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v2] usb: cdns3: imx: simplify system pm using _force_suspend/_resume
Date: Fri, 26 Jul 2024 10:07:31 -0500
Message-Id: <20240726150731.297443-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU4PR04MB10717:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8dff92-608d-4154-a6e3-08dcad84b3ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h3DD/eXwW1uWpGX5f0eaoXtCkHmVvipKdoQcAdxGPsZhX+r1w5R7ALDkOrI0?=
 =?us-ascii?Q?vPQ/UxHWoCC0Gs4iIl9ClzxFhl8zINL0N4GVn+63bakgDOtHX2xOVGU/jKwM?=
 =?us-ascii?Q?9yMJyzn0Pz1tLZUapbLEN7wQWv6SBTYiebauqxPfqekV5mgLqkdq2tc/EdU3?=
 =?us-ascii?Q?hOxAsZNO5nd6xPrF48sypNvK73G9m5iYL5YVOyWdb82aPtGHRxz/E+fiORUV?=
 =?us-ascii?Q?iRrUE7HQaKqBqf+2HNrZ3pt9R4Xh749CnsC5mC6qgI1/1Yu4wXt9QYWsVx65?=
 =?us-ascii?Q?+ap08dV8s2/7a1zdQjiXEw2I7uyeG3nF46HvOzsGLpiiEaHr9/nae7SZJH/O?=
 =?us-ascii?Q?ArSeIToPN4LaF85bP/NuYrS0g857XYBM60JHBnTeO2a7fv7emJzKVAdjC/YO?=
 =?us-ascii?Q?175x0nku/aH2zNX7laX11bHbmjJ5RWcXTNpxViVudpdgRUBJDd1uS+/vQnzh?=
 =?us-ascii?Q?evxrYsqBMTsOOoB2ZJ5n+UNBNVA8xhAR1J36PKPkeNY5a4QS0Vmns4y8MQmX?=
 =?us-ascii?Q?shxlphlYEtkbmeVdkedN0SZ60dxa7IaF8vnzh79/DoLve12zh6FdT90kA7PS?=
 =?us-ascii?Q?04Q3Xa40EncKVg3lOmDVWaQYziSd/k5d2VvtQbJ2g6h/q4zVBwUnMJM/G+28?=
 =?us-ascii?Q?J1XizGadgD3lMTvkUfEM5/hYQD9I1RWebUnUdXlgCIizDJVnlTgRpPRSOoLj?=
 =?us-ascii?Q?isuxzvaUKko9qb7X6FzdKweOUgDvqHGTSi4mVntX+OMzp1xOyHAzn8z2GTgO?=
 =?us-ascii?Q?tlDyu5Q2kUnIqqr9QSB4f58TQSu4PyiXbKra/CtDirJ7wmx++945M5bk/hSQ?=
 =?us-ascii?Q?UxFGIlT031+CgLXG7//ep7bdHVhgdE08UNG6on0yN+78YPSoYDSd3eizf/Ak?=
 =?us-ascii?Q?zuLbeOKtOyl1DblyHmqFjOWp6Qnt5cjGXmE/siYUvwgXFmtnCqEgoIRhfT/i?=
 =?us-ascii?Q?HrMg8m1wEtQv62cxz3rpVo2nOXL+xs7BOMCG8oVVKk5cqm7oQdwvMk+yz4fc?=
 =?us-ascii?Q?ldKeNgnzd8dk509oKaLN3z0m61ekjrF+WEabDmJG8cvh+LLeBMmelXhsSmIu?=
 =?us-ascii?Q?/J4JP/JeG69sDAXbh1WI/Kx40uqMuJwFscc/N+6fbU9r1M7FFuWsvVMgAYTb?=
 =?us-ascii?Q?KaUcUzD0oPssZTrez37OtfIGUJGPNwkuusBTQ8IsEzOZcec90s1AcPbuK6E6?=
 =?us-ascii?Q?/FVMCgge30NQFRd7swPw9SLaltjTcomW3gpB56eGVJwG+CePSeOnk3KumNCj?=
 =?us-ascii?Q?/tOdU0F0XCY0tZhgb1lrrDD0/kMVbHZ3Gs4clMz3epZPyO9mueEsC403FAtK?=
 =?us-ascii?Q?sAEF4cXA7sWR2yxxw3VryJm+UVIOqCJJK+YU6r8SsRGa9Xa16qPopSskpJc1?=
 =?us-ascii?Q?atIAru80unJKJISOlFB1L61A98zpDKuf4mwXKA3TI5v3J9M3zg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/ONt4f2GHLDsDffYVm6N5pUc7Y7YqcDgrwmbIJ3bKRG366PrsaLPyNO+kEyA?=
 =?us-ascii?Q?O3u0MlYrpEouZZFcKwf9nJjq0mGAWQ/1OJuYzwVPWm1J0O0FXmXAZ9NjfOri?=
 =?us-ascii?Q?tD4Qi8la5kkJ5k4xedd5POETDcwh4OnXUwSWhVRjmyDv6AmE8uNY8hl7b6WT?=
 =?us-ascii?Q?CNCdHrtbQrtm+lvta5d9n97wSch9O+fkH1+oeGtj6iHmv0GaDcHuLujCjJiU?=
 =?us-ascii?Q?0QiQr8HQcII60UO5sKB3rUnX8Bl8hmPNqMAH8AKU6TZz7Bdo/iArmNQ1+RqN?=
 =?us-ascii?Q?+DSPJzuj7j/kquS2F12vEp1PC+MMjAVTaF6nl///nEQVBBweuF/3hM07w8r4?=
 =?us-ascii?Q?yw7C6Z1IAERfChwxlfdQMn4kLPect3JKwnrqKU3K5v52qyliKAERCSFTEbvX?=
 =?us-ascii?Q?8H5iatqrc5cbYbCSx0NfEAAiHOYpQW7nZTbCul4IizvWAtccNtFOJMdJI64a?=
 =?us-ascii?Q?aQuj9n/Ogq8nVHE2B6YnICvAl70RFOrh1OwZavgVJHToJv/OBo7VN183bdQW?=
 =?us-ascii?Q?p7jkY8JF5clWRmTTXHJAehesS8tcUYSxKslKYCukKV59ld5ZGChfLxGfAXbO?=
 =?us-ascii?Q?kSkOOzevpC9rReSnZq0Pe1a7ACnPpgwZW0AAb1aOpwam9LUuQhGlLGtL5wKJ?=
 =?us-ascii?Q?5rTEgFREVXYqjGED9yYo08beoceJ9qa6y05RkkI4DMs3uIhbcJ9iKuWgwzYm?=
 =?us-ascii?Q?qPvOTY0Aej8A87WYHFBHX7oKwrX2bGRwiHwoQAtPbgzN1Pmux3Ilk3ZXYsUh?=
 =?us-ascii?Q?AijjN8S/xWLJsOx0my39tPwc5w/Xp7GEi+3qCq66+Re2wGK9/5ARdt/UiPO3?=
 =?us-ascii?Q?hoAPNk+G62QAezPaDWjxkjzauEpS9AMUn2ZYQDqMGHrR1xdyFnZfKXvYXbqt?=
 =?us-ascii?Q?fjKQAypo2MeTzkErqi8/iKo9nuuzYFbf+jf6XXRemJjMtvkK7+XTrduYFqIz?=
 =?us-ascii?Q?9pJx9dpJ1ZitQzUIR5Qig2yuBUxlnyO0AW4x6Dx9EK58HxUpH1nxfB3EdAV9?=
 =?us-ascii?Q?fMB09RA2OGPqs2doIE6XryI0HLumYdifCRRay5NlRtbaGQKXBffE2HAHoBXd?=
 =?us-ascii?Q?RyjOIxH6KvpEIFtf/bpIniXbdNreyxUnEjlrP3nOZM/rpbduuYVmvsoeIVsi?=
 =?us-ascii?Q?FOFEY38TMysOZi/WJ4fUFH7jt00nZnJNM+T11B1H5XFa+CMmC/aQ9zdWzy6/?=
 =?us-ascii?Q?0Xs9IMIEPaPh6c13kjQO97FhJDssxVoFjAMJvkl3/nHQnm1DKVPIebnxGjXc?=
 =?us-ascii?Q?u8jmZRDN4sMYBTVCRQLDwKLpVVaOkP6OvJzHCv3pnkpNRYQpY2dDJVAFWCff?=
 =?us-ascii?Q?vJaXU/P1y5wbF2jAe6XubBB+Pno3caQRbxU61+JZcgRvGHIevrBh1rKiSS3f?=
 =?us-ascii?Q?pO9Rj4gndGZU0hIIxrWxk9P5DQrrNFPrSAymr0SjxcoSxTA4OmhMIS/gFeXI?=
 =?us-ascii?Q?HDY8sKDgrjS1LvfuoKN9zhYxAXJMOwyHWuel8H3u2Haw6S4Q6wR8G2Nyz8rQ?=
 =?us-ascii?Q?Sw6F1h6OLsN3AuVW8hVDi3qLq/9M7Kb99tQhiQ1QcQ9k4NOtzSZ6UNahdo4j?=
 =?us-ascii?Q?oAfD89RzkWBw03QGdqaU7YdBfkfouw4kEzNW/7gx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8dff92-608d-4154-a6e3-08dcad84b3ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 15:07:44.8035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlQzSg7Wp4FEi2/eaYyij40fhM9CXvpxft3gGwlxHkbe2G99cWJv60uCr3CL/blBdCaoRCErcLMWlLauvLYVJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10717

By utilizing _force_suspend and _force_resume, ensures a more consistent
and simple approach to handling system sleep states. It also aligns the
driver's PM behavior with the other drivers' common practices.

Fixes: db3c4e366287 ("usb: cdns3: imx: Rework system PM to avoid duplicated operations")
Reviewed-by: Frank Li <frank.li@nxp.com>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
Changes in V2:
- revert the unneeded change of removing an extra blank line.

 drivers/usb/cdns3/cdns3-imx.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 281de47e2a3b..bb9b435c61b4 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -373,22 +373,18 @@ static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
 		return false;
 }

-static int __maybe_unused cdns_imx_system_suspend(struct device *dev)
-{
-	pm_runtime_put_sync(dev);
-	return 0;
-}
-
 static int __maybe_unused cdns_imx_system_resume(struct device *dev)
 {
 	struct cdns_imx *data = dev_get_drvdata(dev);
 	int ret;

+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0) {
-		dev_err(dev, "Could not get runtime PM.\n");
+	if (ret)
 		return ret;
-	}

 	if (cdns_imx_is_power_lost(data)) {
 		dev_dbg(dev, "resume from power lost\n");
@@ -397,6 +393,7 @@ static int __maybe_unused cdns_imx_system_resume(struct device *dev)
 			cdns_imx_suspend(dev);
 	}

+	pm_runtime_put_autosuspend(dev);
 	return ret;
 }

@@ -411,7 +408,7 @@ static int cdns_imx_platform_suspend(struct device *dev,

 static const struct dev_pm_ops cdns_imx_pm_ops = {
 	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_system_suspend, cdns_imx_system_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, cdns_imx_system_resume)
 };

 static const struct of_device_id cdns_imx_of_match[] = {
--
2.34.1


