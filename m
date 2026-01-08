Return-Path: <linux-usb+bounces-32061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58872D024B4
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 12:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF5B53069201
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 11:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E860E3EF0C6;
	Thu,  8 Jan 2026 10:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b0Foe8W/"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24A44E038;
	Thu,  8 Jan 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868455; cv=fail; b=Lao+77p9/UswJEB3SddvCNVbOf6Bzm1mHC7Bx1CXPW4oYs3rxORVUsIyXp7EwZf98oc4wNdrQH8Fjq6fgdV+fww/3sHQvEyA6EGDqkL61INhAD8l3uJUalkxDFNJ0VWniCDmJ49feyxM+So7UW7Ofd1GVT4Wa2NSdADHXPyfuSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868455; c=relaxed/simple;
	bh=0ETAwnN8aC6p70ftb8BaG+xH/XcP88L51grfqaC6FPg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fI6Cu2QJi++LE4eUng2sRYwRKPVkih9B6tkthisE3Ip0LHsF3EcmkfCj1HlcFJg5Gw+smnrHUX5beD5qqVjjaFWXMruTHeFqZfkcocBhKoUcw5jcJszHpe47BSd8HMT2KjhgxiFnZTgsoKUwdVRHU6taZXwEkoFT99y3jpNAxeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b0Foe8W/; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgin8ys9/oQSpaz00DEqn2ufpxr32qT9917phBLOoFH0I1IwnZKDOABzMXAmSOMAFSnCcwh2lyBbJGo8cXMCLlNuzCqO79jEioiMbLP2QbJ95uYxlrgrfCj9KLwvUWcSdBfr5R3oyVnTHbD2VvRX5ZnLqQhp9RYLP24dF56p+qTKIyxpG8Bk5RgHlZRi1ymXooebTLj/nGbMi6V/kUpg8JJ2PKwnKcAa8LqPWJrVtCJBMb96TK40n0buRK9H6gOIErB7DpDjl1nw+yD6crCt5QLqYPxPRd2DKO859X1XfxLfDqqv1uGvhsgmG9fUCQhVPNPdt2sebPOiI1Dz5PwlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnf2muTLweWl2GbXBhZPNfgPgREBpokQwZJ5qJygHbI=;
 b=D3dfxFylvtFe26ybxzLRf28X/pocrX+dlNzkZZ8Nz+DiOg4myU2tviYhZyyBN/ps/afsH19+9TXKcoF5hoJGHyGnOUZJm5mugdl89eSE0II8UHz4nqbyDiLjQUdgS6uWtRELZTaw0HrrCHHZrZSFtP6HyawInI/KRpqSyoUhnWO0ORAt9/UFeCS/eyAJiqY9glCOjJDRFQc6CFE/q+FGeoA4IgAqAphdjMqW4QXNBayXcI1UOxmhWYIFZ3JQYrpciMcR/kSEH92EaFcMlsH8A1u+qowHmV33aX9FypCsI1RrOfmvYDc/DzGA2jZYPCuTrT7X9QNfkT45IaW3f0kT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnf2muTLweWl2GbXBhZPNfgPgREBpokQwZJ5qJygHbI=;
 b=b0Foe8W/qhtbiMbI1xC1lPKUUQX45Wb9MZbuza79Z7oag4gF0HOwuYzlInt6JzGLKS5DkQ9XyqhLPbfamudQOJJ8YLCt3anjJ+XE7iCi7zyh60pcy0TaYW22suBiyE68rXOzyIYQbLCKuH8BOeAwLEkJ8UI5L2wRlwdJz4L2stFAzGbkTHOI2r0vvTAJ2EanMPlMJnWvXC8aZpFovTLKFi1B9t6WOZ3OMmyNvbMtV6TeOOlCmqa1uuYej0Juq1Yulrp9T+fvU9t2RVBlpbURU0s/xMpGDaAlOvofwBsd/DQ6oW1i6eZOymbxHLT4e7pTECrT0nM9UpwxW9P3hRea3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 10:34:04 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 10:34:04 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH] usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for wakeup interrupt name
Date: Thu,  8 Jan 2026 18:35:21 +0800
Message-Id: <20260108103521.2139824-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: a44a2d67-2580-4b6f-40a7-08de4ea171b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|19092799006|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zsSMxU/5ioZq5QbVJWGM9506LnPirb3WtQzoz/1N6gM1Z/kBn8hA4I0FdihU?=
 =?us-ascii?Q?kcmwFFhT99Us1tJZmJtx06tZKHCox40bKFACQbvIsrfBiNFKIBSpRyuvrd+L?=
 =?us-ascii?Q?smqGKcbdYQeaQCVw2OZMMFeLgxy7w28JSDpllL64NzrnakwzfnlmzmeJKeAV?=
 =?us-ascii?Q?CVzGynvRDlxi0mv51EDZz2oRstE/SXhL9C5sKccBR6XTo5LPPqQLw6Cfe5yA?=
 =?us-ascii?Q?lVOGnIRUCYEGC/4vtlchoxbakZiSQ1aRly+9L+p76MMLpvEVPuN/xTdxN8tO?=
 =?us-ascii?Q?L1vAheeod2JUNh7MOTNxvmP3yXNvqQZaHkuF3ygh4IrE5gwccWHJaRhFwZwY?=
 =?us-ascii?Q?cuYiUBUk3atWZgCTwD/mI9dzyPDeVgrbD8S02PpzENwT+7bdR6XXB2qLueJ9?=
 =?us-ascii?Q?qHpgHUNezQFith1Pcg/hdmPjacpwIQZR4URYDKEnLcuSbOY/yF6Yw0dRSwu/?=
 =?us-ascii?Q?D4xeDLfukV4h+tntTExHBuZrfLH8piq+euvfOflv9aIlKeO1orB7i2Y7YR6m?=
 =?us-ascii?Q?HvYIySdvqTWygdSbZOvfkpkhLHD04n+rZam/aD290TJt0CgtzEyz9onO9kWq?=
 =?us-ascii?Q?AfICvZnZYPJefPnWFfciS0OPUO3E/B6gB/Z2qFgG7Dar6ovERDMXGTcnp8oD?=
 =?us-ascii?Q?ZkA50T/sRsJ2CzTqtezFl4ek8fkxjrhJhh4cNhlWa865fmYIIREeDZrSE3aj?=
 =?us-ascii?Q?6sTwXVMPxCkKQwDc5egwoOdTYQPymYEpqoqRQwvamtwBUrJDRU+1iED7+Y3b?=
 =?us-ascii?Q?mHpQBxad1PwJiZ4lH+VjIxoEkKtpadlPfMMpPtCjk4++P7Mz+6if8oClEhXV?=
 =?us-ascii?Q?gpFEjp0wnaU1h/BqyMTGVVdb2+isir0rAsq7dCCH/dEYuW1EZFRNv6CBTktu?=
 =?us-ascii?Q?Pp0e8vPLbMtPPDVsFF+gJYwU8NvLA6wTUGTiflb5RSNUPUYqH5dBGM7QHM+b?=
 =?us-ascii?Q?X/mlgXXYJTHpy9RY8oz+TC7b3xbJ8XdxDKhMlnyy7rqaRNYt15SYJ2ced6C+?=
 =?us-ascii?Q?nXggiDC0onRHoc/HKy/u5nBYiosAc06XX7VEueU8DOZzcBN45VJATtX1MQGB?=
 =?us-ascii?Q?afCanrmHsuKeqkfr5YgQG2sRngH/zHpLfxymaAxOJUpzWQJhjpwuehcXNQKS?=
 =?us-ascii?Q?oi+ujg/FHVn8iNN0IBmwcWrNYNEH91HxQJPkPxAjQpeKk5Jz8kBaEY9nPnl4?=
 =?us-ascii?Q?aJnVY19lvQklomOTzMJ2PlwvCG26IOZSFuP5R9KxAMejvQB0Uy1kdRf45EGf?=
 =?us-ascii?Q?FCh3AdojjJiVn44FvJ3x/RdShwo9t05lgc0ObsVST5FRA6F7nCU28qRp4sth?=
 =?us-ascii?Q?gA7T9wicOBU+Z162aJ/+G+l6XCibHaEYMne4DLxjqnkKdlBOnp2rk+lYPa6g?=
 =?us-ascii?Q?FwneOPNxif5EnfCAYd1q/HF/ky9lM0yEmSMPLDxf0Wew7Xz62xi1W93toG+B?=
 =?us-ascii?Q?88KX7rRD+o2RWKcH631heX4mcqUMhPCzxR+xT4b7YUZ+pI84IUOqlKuy6p9T?=
 =?us-ascii?Q?QkpejKgjjLz8oBn6ImeBAyN95R6g+hUAptek?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2xgTJaadnUaOMMutJ9tV5b43C16QJWr0fTUr1CA4hhmKBBGP9aLgBYJyTfrx?=
 =?us-ascii?Q?RHe9z7a25iDW2naAP89+k9MDXSozMJCqXGVeQZwjzKvkq/PZLC8TOkJAYpNv?=
 =?us-ascii?Q?v854+dANHd0FtRHlyo+xFlTk8b5KUQWq5IULwlZdQX2A0TjI2jqLWoH1yxAO?=
 =?us-ascii?Q?1S8ACXqbAGUF14eii8GKN8jmrXdTUQebCP3vkgy5Wyk1t/8HZcWx7NEsPs1V?=
 =?us-ascii?Q?NvHTY6+RdrfU5WaBy3fbDMMwk+6RGb87j0APwzVC86SwNb7fqAYnaMIHrtFV?=
 =?us-ascii?Q?SKIx4rr5GbGrHBWXdIkroDMva/1+aGmGV4dhF9SlbIGFd6ObOETY+ceYN5+P?=
 =?us-ascii?Q?zlD6BENksUvrt924bq69snaqDEfDp6Yw0Vk3l5ToPoupDp+AG2KAyIFL+KTP?=
 =?us-ascii?Q?gSFpEJJrDT0rMmbJxnxjt9iPfWNekyUhfkvhVe6KGqtXB9xpX9n3xrFXvsnn?=
 =?us-ascii?Q?DSCqPtRjVZ0w8xNQzJbHy+yDuCWeA8MYwllklMB8DNwwC5WL6Tvnepjo0tuv?=
 =?us-ascii?Q?4n1FSh+OMzbxcCvvOrkmmr6kdUZk9NkxG29O6Fjt+VvmE9/qh6U65Us2zg3J?=
 =?us-ascii?Q?I5fZNL+Ax6dZR75RShu+RNTz/NoUnu8UYv3xm1MDlVxoz+18AYHUhzV6HyIs?=
 =?us-ascii?Q?qPfu7pLnYBNd6CIkytZ4gMT4NY/RmxL+j9tZ0APCeHBvwPhD0kTBQqu7Lzhg?=
 =?us-ascii?Q?y6GAMjiPdo3nTus/MzzMK41ZZnBUo3sDCCZA9WW4Dtllj5dXDp4mJaRRjNfy?=
 =?us-ascii?Q?4EybULomZuOX6UupmvGa9f5pQvry4JlVd0MY+ANJaJYVHoQezVwn5oSo7RBT?=
 =?us-ascii?Q?c338mNP3hCHB/dwaA6x9CF6s+V/SQ8VccW6Lwy6Fmf9ByTsaQI5MuqOOeGqJ?=
 =?us-ascii?Q?5CQa6yT1hyw7aU7+SlyGpMW0CWPv3Qg0VBuNsN4zE5bpBZNRvw8YLxPi+Pnd?=
 =?us-ascii?Q?bKfvBS9kHGLGEQRS+xUOXYX/E0IukJiYAZKf/A1lqxMzj5RMUu2VuQeB0dU+?=
 =?us-ascii?Q?vNpxyGl4fZcTykexYViSKeySvttAqAZ72txlnQ80BLsyfnvwE2OLWcT6BTZR?=
 =?us-ascii?Q?o6JL1Bf7jS8S9kZnjx8KTAPr8fQOBmIfr0wsCVPRDOLtf2y8CYlPsHrGpn05?=
 =?us-ascii?Q?BQlr3Lbek5NO/EjB/4Pm/+FfZ4Uag/22Lc4So2qlpR8paKZGcQZjKPaIJFhd?=
 =?us-ascii?Q?IR7YuvAkmsqFEOJteDBOCf/EiGWCOhwHgZSxIJoQbtm+7Ld7fB7IZESJzQqj?=
 =?us-ascii?Q?EKy+1HYUA48hjf69iS8LCDBUWVBncBKnfEv3YwzgEjPzYpedb6Vr0QZmZexA?=
 =?us-ascii?Q?D/AXnZx/csijNri3fVQy5Ey+8MT9BssAOehzuBR2m9V3Qjwzu1HeO+dMWKqz?=
 =?us-ascii?Q?5ZSI5ayWyTi1MgQJPbefxY+m96nyYgeNMhkR/5rwosfS748e38kEdWckCOyB?=
 =?us-ascii?Q?Bp1MBtk29rRqPafR9cH0UA1CFywPmxCpTqkLj3ky6R7cZCJjJkd81Xo0gJub?=
 =?us-ascii?Q?uLnrXoLCdJv5wqnfK0G6ZxkCh69MqgO5555jp2khNjc2vogrY3MTyUKUeVDY?=
 =?us-ascii?Q?oOxK62jL37U63OdjwunFgqqcvsMNeR5I5xkrsjQ3znqIBz8fC2M64YTsWr9i?=
 =?us-ascii?Q?WiwCukVFEwYolytUvU2eg6Kc8ZHgDKjpKqqUIcAdLVZu6VlHE4ow4sM5oR4m?=
 =?us-ascii?Q?gLfbAYC4SRz3Ufb9l3OptxWbMBP9XU5RKFM15d9Zaa0crKPd4XUeHAMohx4g?=
 =?us-ascii?Q?mz49dHZUIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44a2d67-2580-4b6f-40a7-08de4ea171b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:34:04.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bokW1uyok5RDVYhlb+7arP4Fd9Fhjwn3e0k6i4b6QwF+Ur63T0ymBWeZ1/YSuUOpOVxhiSA+CTlr0ybnAkFYWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355

Currently the wakeup and controller interrupt name are same. It's not
easy to find the correct one in /proc/interrupt at the first glance.
Rename the wakeup interrupt name for better distinction.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index d4ee9e16332f..e4345e0eea59 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -385,6 +385,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
+	const char *irq_name;
 
 	imx_platform_flag = of_device_get_match_data(&pdev->dev);
 
@@ -525,10 +526,11 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
 	if (data->wakeup_irq > 0) {
+		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
 						NULL, ci_wakeup_irq_handler,
 						IRQF_ONESHOT | IRQF_NO_AUTOEN,
-						pdata.name, data);
+						irq_name, data);
 		if (ret)
 			goto err_clk;
 	}
-- 
2.34.1


