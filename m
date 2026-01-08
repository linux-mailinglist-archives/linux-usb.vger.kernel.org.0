Return-Path: <linux-usb+bounces-32042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16153D019DB
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 09:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32164292B8F
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 08:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E703B8D6B;
	Thu,  8 Jan 2026 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ib292sPt"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C9D3B8D4A;
	Thu,  8 Jan 2026 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860031; cv=fail; b=tLBv279oV3GlZPFMILE4s0IM4YFsIMMN0uyLjlvboFPVr2pQltYnNUZNUAckkbOlSBZ9ZsY41rhxtrNaGACN63pUTloFL7+Y2ZF1nuxWBDP+q8Fujj+My8hbuxO/b1Wn84o4oFfim74Ab9xvQZpVDeS79RM/vRjogZ7AtPwANUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860031; c=relaxed/simple;
	bh=BPwHEjPAzvVrRnnNShLxYtYoreUFm15THptve4m2vEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sj63CaUKaPuhUBYLb0/Ra/BdqgfRjJppHxD4dELv8uu8sbKYD4ZUmljfOLhbQ4hLWILzeinyhfuxuBNnbJ6y4aXwHmxVEQS7q+xItijeXoXXBT0ALoMt5fXFi6fdmuh0pT27CWVmZpLFJPBOn6rjWCXquTXfQkFLKHylXZOMZho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ib292sPt; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dm6SJHMKDiRP6zlHuxlAYkelJ/2b1IT47QMfaJGAcExT4lGM7FRs4sGP42uIOCSSEzR/v6AIpPGzYzjuHzweeGPEORvgykXckorvZTKm2fnXdyH/1PS+4BWNDYGEhnBYkunScavZDr3phJMPSZvyzYo5UgvTYSXRc3ofbDgIAoZARJMQ6rn9E3N9eIB5T3AtX925GJNGMyJAxB7TJCbj53d52zTUSyjIAPCLBN9SzV3VbGFgkU36pWV28XPCF+MXuUmK+J2wm3aO80+enJaD+0o8NAak7qzDIQy2YumJJ0VMgNRUNQkQOrU+uvyI1RefXFnt7nAFgmvNVn0uouCvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UORYFDuWSy5FUGfXPPqIeYUWkvHU8amHkclphf6L+x4=;
 b=u1AYojdZYSOqw0aLaZlHo9VBbPdf0Qmq1eKnrLy/PLrEzgIf7K7iPSN79qkcpCiKNumBE/KONFZyAxPF9TZ53HqqZhOFE9C5u78uyMbASJCfLB2qJY2wttEZWv46pHW4W6OxRDkFTrtDbaVxXxhXkRBlEMhtMRM1IarsLJam69I9KaYxO/CXXbAoUZ/ftSaAQc8ZpyaGIwtwcGbpWYSFNL/AohsvaFGz+q7DEaNiPcRIpMqtxPoG8Rwb7x1LOV7NjK53YK4/uFCdfi1zLdMmXosidQrMQ7axxCylcp+4kU+NANAb624ua6p8Q/7dG8OnRuTzYmDw8HBvbaURyZKXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UORYFDuWSy5FUGfXPPqIeYUWkvHU8amHkclphf6L+x4=;
 b=Ib292sPtwQjSn7Y5l1KBdwu8tA02/3ydcD9HYmEgIQJrpeW/FoTxlCBo8Sn8lUjXXEL5wYxhx9SKtjS92vJ0TAR6sGj7263hQLhODvp+u8RR/UohYhRJ8JnwDbrLMq2Of7PcbsXwxc5P/f9Cj9DTKWuZYPMZf4KK+XhqScdfbEhcW3+usdz99ew2XFfPKjpqpRSQDJgQDLqQ8Lq/axsO4x4ZgVfhUewd9B3dC+MzpvcIL4rjRZjnEo4nG7hz5P6NFh2fJB6NUx42oUS3JJAuX1Yk67+yMK9mLuRjqbuu5iTS0BR5kXytkjY0CS/rX+rjd+ZBhVVMnjv9TIa4M+lAPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB11916.eurprd04.prod.outlook.com (2603:10a6:20b:6fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 08:13:20 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 08:13:20 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH v3 2/3] usb: dwc3: imx8mp: rename dwc3 to dwc3_pdev in struct dwc3_imx8mp
Date: Thu,  8 Jan 2026 16:14:32 +0800
Message-Id: <20260108081433.2119328-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108081433.2119328-1-xu.yang_2@nxp.com>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM0PR04MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fcd8723-cfaf-40ec-60a4-08de4e8dc8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cwm4YErIYmd3cbd3UrZsyTLkdesMTwFNOFbXsAT+EffzuhvVkthhwV7umvjy?=
 =?us-ascii?Q?UE5bTqwrkd0Y5RIM5NIpkcc3v34Ge0UZSecBqI90tTHlHx8Qz9rd9qMD2oA9?=
 =?us-ascii?Q?ijIdbRKRvtQbK8PXCTwP3v2aPlEFhmgnNXZ7tIO0cy7b/B6/R/iAl1zpbBx0?=
 =?us-ascii?Q?mpib9cFfkpp0ZO7x2FCtN8Tg/Y+MvHT+FUkHI9U0EU1f5Cxjk/EVzCu7EEcY?=
 =?us-ascii?Q?yHpLopZ05NUdDsB5lwWnKHYVIVOD3Y+7AvZ3I8cbnWXxUqQsJH7j/PiifgwR?=
 =?us-ascii?Q?cSK6W8otzLtfCejVJHUNzsf9StNhbbA0k2DTIhYvBaIaJbr+npouLdKr6ITT?=
 =?us-ascii?Q?2Visomv7podkLLBE77k/FSY9av/LsPP0L/4+dz/NIu0TbeJjlACNyadkQQgo?=
 =?us-ascii?Q?Nc3G1ojpQDRAGtd2TjURyH/WlGsF8jMIO2rYOwYLpGdkhdImuuANV6su9Fd4?=
 =?us-ascii?Q?xLs7Tzf0x88p1rq4GW9VK5vkAOfwuV/a+IFrgbiSIWJxEwYDnabGR03dM1xu?=
 =?us-ascii?Q?pabMl9LvZgUS4hB8gb0wXaFV8A0PdyKZBnkXr35Kz+oza9s8SVHJNNN1yOaO?=
 =?us-ascii?Q?KYLeraC6qu3sV7vGlNILf/1rQgR+/sxYf1QSRff0c6J5uQ9f7frGZ6IdMNB9?=
 =?us-ascii?Q?U+xIHHSqqTUxTxVk6B4K1Lm3acLfYFe8+2h98jx1TIMw7kMklgB0NDhj50vI?=
 =?us-ascii?Q?MpHgWuFo9OsnvT8sGNgUZo7aq8s+pvEgAGdgJQZQhzCRceOtG9vo9UvQuWVM?=
 =?us-ascii?Q?JcQEEtQd6VRgYSNK/lQmH/0o4AXQ5ZRXgZp8nzW8rsreVQHqshSDWPBinSVK?=
 =?us-ascii?Q?WElkY10zooP1wJzvIGfojpzqi5ajwbcS+HKJD0U8uhQyxuFoBbA+a+BQtQht?=
 =?us-ascii?Q?2y3n8FXSpWUepjVBglp6f6qeN3cjmg/JrD8vjkIvjqFo6eOoXdh4B2il2rJ4?=
 =?us-ascii?Q?KFNPjtdLU3WJwQ44iheRaUt24c5UECh4ry2kXzxy2xPI9ikyV/Upy6mFr1NC?=
 =?us-ascii?Q?hFdYKjgxLTtY9FV87sXhgA76setfsvDEBqIN5XT6eJwGZlRKdG876OHXbq3w?=
 =?us-ascii?Q?bS2R3UjTtLAolT6Ao2e6o8TPSc4Upddhp14kStXrbfcmtKpuAcPk7Gg4qSaO?=
 =?us-ascii?Q?n+C7n837+rOVrucmEAZXIBAZtIWHhvONG2rnvdzoXySigpz5LIVKqAucPprq?=
 =?us-ascii?Q?hdC8CDs+E1G2jOJfi7ziet1544fKl29Gf5kXi+tDS1zGojBzLrmQVsfLe0uM?=
 =?us-ascii?Q?xq8BYSE0VX8uTTpscO/h582ygxQ/CYq6KLr9E2IwB7OVT/slHEpi0tLCsVUR?=
 =?us-ascii?Q?he0iA5WPyd/8l+VHwvP9jKlgAfEUVkdSvVn12Sex6zNBm9ntMK/nrtmxUmDG?=
 =?us-ascii?Q?BNZTqetNOFR/A+8bIYi3lSYQcA64xFTDdudvn3oTHWgIBzumPyHErTYtv8Iw?=
 =?us-ascii?Q?JoO1OHORdnyhKXILfv9pEwvJOwI6ahys+SSRPwZA4tWotnpQ88bKslbI8xrV?=
 =?us-ascii?Q?qaCaTgle4vRRgrd+bwBGO9XUYR8eGONTFwE+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yZ2urrhnLm+7uaMZAKUlK7s1X/LAT/UBuONdf+gBIbq6Zj1scbUxSCKJNFgr?=
 =?us-ascii?Q?XdVJ0Vj1xzk01/muQ3lMhfjoJBtzdrkAilMVGpC2g2jdTfLu+cI7GkvkCyFA?=
 =?us-ascii?Q?IFkLG0AVOq+oYk/3SihQLhag9jDrqD0NSioomjQUGJLT4UHLmi3gsTVKCLGc?=
 =?us-ascii?Q?OTse8qJSRgtka/+XrDU4vit0rgcnBVNPFzwpfrvJyljN3f6UlKRbhHPDk702?=
 =?us-ascii?Q?/iYzwjkhDOKTAssdl1BQIn1PkOHoEQHV9SaShgzOZEckxNDsVbmkbBh+MlhJ?=
 =?us-ascii?Q?fryo+BqS9VcKdXjCXDeSOtvcWg9D1NgCUIVFDk6Y1zZI0Wn9CK0PWVJrAkqq?=
 =?us-ascii?Q?g+Kd9oDAa5F7O4WarcOiHzIH4NhcimFVlkoq8QxPHvrviorzVOBm9oiRfSFt?=
 =?us-ascii?Q?pnWDQxWn9UNNk5eA18jbfV83OZmJB3XCBF6B919p0jZT4DNkzA+wHgIRAZ78?=
 =?us-ascii?Q?aji5x9cq3UuU9M5rKWUS5z9E1KS+qIddULlO031F77Rwz4yV0pJ0fzzPZN5/?=
 =?us-ascii?Q?mhfiVo4Sh6F09jaD/Q22yBT7HgUiIv4vbbduEq5jLY93FiAffIl0cdjy+KAw?=
 =?us-ascii?Q?NiRNOF47mWN0uhACOSpfCLk5gJgBA1ZdrGy8ZhUZ91qe8nZHyKKZsb9HsSQ/?=
 =?us-ascii?Q?3y7cO0DZ4FCArYC6oIQZG6+EMgngNgOxRypCasa3gDRxqeQHaCPMjB3ZSbkG?=
 =?us-ascii?Q?Z3b/ZFVKaFgyFXPoyAhfRBnbR+4PRSPVH29mW4Uzz5nNduWvU1fvUr7Sf3tH?=
 =?us-ascii?Q?1+Hrrm83tki5HmfdpMamKraOUKkooLtcPRw4ML9ZKT7FPrppzee/sqvVd3W0?=
 =?us-ascii?Q?xFa0b4I/Ps0uyaXJMSK6hknAj2J+uQ0nUyAd56J5HKJIuKof3hMz409p3bLh?=
 =?us-ascii?Q?BfnvHntqqIWnRlsVmHQbJa3E3dzvlmj/2rhMoUB888UsXlckLIKtBPUuftG2?=
 =?us-ascii?Q?tzqnPh6DR+o8Vm2mMXcBSGUXyr5J3mFFJID+XBxxAZgDJmZd59vodTvtKlR9?=
 =?us-ascii?Q?lhWmi3yNiBZl/+PQW6OSdfZfhQa+tHX+9eIoSWxWDGHTMP6qNbPNtHgeOrY+?=
 =?us-ascii?Q?V7XVUEvc2uIYp8IZSGIB9PjKzqzgM3r3Q1ut6kjrNeRmg+4rMvJotEtX2VPL?=
 =?us-ascii?Q?YtOOCbTCEx09uwky1waDIxB7trAPI1Lnd+IqEwOlvB3FU0JiYRhopO0aOMKM?=
 =?us-ascii?Q?kW9WfmquISJsbKJ4Ih+1bslC4yToZyM6lsRBfCQVcTfI6PTv+Y16K1a9KbD7?=
 =?us-ascii?Q?Rd8ST68492YHZCPqlRUkWxhHAJNa41TBKyNO6UWXYn5qFYvF5yAz2KpmR1My?=
 =?us-ascii?Q?Hg2un3Rx7rlG/R2hmEXPjbd7bc3+NfPc5WTaKkqdLVWb3PxohPRyyKSJlMIu?=
 =?us-ascii?Q?OCwEneJk2D0TXOQSya7co46rryGo5/0+g4SFk3I3iiD19epmd6dl76gdpi3e?=
 =?us-ascii?Q?egYyw5DMzlPdG+f28UxA20vMcdINRIh3JOmy3wzwDrNr1Y3tKYKj+eqEYqCw?=
 =?us-ascii?Q?NUgwAtk3huSwelU1g6MxE/MGLwjAFcnN/LymL8UnUh4gEZEB8u+ggwx87sfL?=
 =?us-ascii?Q?xst4akwCvDQlTq4gfNZUYs1dYVHyOmoSzVvbFwYqUp9ZuGqV92C/FmYslu4I?=
 =?us-ascii?Q?DNIT1nUL9zhxyE13zpUFsJo+cieD4hB7rhlzmY9+au7ShCTb3Uet99ev9qdN?=
 =?us-ascii?Q?kdC4yQhMZ3bdEev/924IT1UxsEpaUxOR3fK1Coi3Au2nGCZOU3irLYTAcGaF?=
 =?us-ascii?Q?/t/FzqiPKQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcd8723-cfaf-40ec-60a4-08de4e8dc8cf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:13:20.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDd5qLXzPJl+GYcEbSWj1znYpZOYPRESmz1Kyryt0NUmCBt6EmEW3IUBhXPg34IcaPn3wuBuZODs8XkcO8hCDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11916

It's confuse to let "dwc3" represent a platform_device, because "dwc3"
may also represent a dwc3 core structure. Rename it for better
distinction.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - add R-b, A-b tag
Changes in v2:
 - new patch
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 45c276a31d84..b0f5266af954 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -51,7 +51,7 @@
 
 struct dwc3_imx8mp {
 	struct device			*dev;
-	struct platform_device		*dwc3;
+	struct platform_device		*dwc3_pdev;
 	void __iomem			*hsio_blk_base;
 	void __iomem			*glue_base;
 	struct clk			*hsio_clk;
@@ -100,7 +100,7 @@ static void imx8mp_configure_glue(struct dwc3_imx8mp *dwc3_imx)
 static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx,
 				      pm_message_t msg)
 {
-	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
+	struct dwc3	*dwc3 = platform_get_drvdata(dwc3_imx->dwc3_pdev);
 	u32		val;
 
 	if (!dwc3)
@@ -142,7 +142,7 @@ static const struct software_node dwc3_imx8mp_swnode = {
 static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 {
 	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
-	struct dwc3		*dwc = platform_get_drvdata(dwc3_imx->dwc3);
+	struct dwc3		*dwc = platform_get_drvdata(dwc3_imx->dwc3_pdev);
 
 	if (!dwc3_imx->pm_suspended)
 		return IRQ_HANDLED;
@@ -233,8 +233,8 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 		goto remove_swnode;
 	}
 
-	dwc3_imx->dwc3 = of_find_device_by_node(dwc3_np);
-	if (!dwc3_imx->dwc3) {
+	dwc3_imx->dwc3_pdev = of_find_device_by_node(dwc3_np);
+	if (!dwc3_imx->dwc3_pdev) {
 		dev_err(dev, "failed to get dwc3 platform device\n");
 		err = -ENODEV;
 		goto depopulate;
@@ -253,7 +253,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	return 0;
 
 put_dwc3:
-	put_device(&dwc3_imx->dwc3->dev);
+	put_device(&dwc3_imx->dwc3_pdev->dev);
 depopulate:
 	of_platform_depopulate(dev);
 remove_swnode:
@@ -270,7 +270,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
 	struct dwc3_imx8mp *dwc3_imx = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
-	put_device(&dwc3_imx->dwc3->dev);
+	put_device(&dwc3_imx->dwc3_pdev->dev);
 
 	pm_runtime_get_sync(dev);
 	of_platform_depopulate(dev);
@@ -296,7 +296,7 @@ static int dwc3_imx8mp_suspend(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 
 static int dwc3_imx8mp_resume(struct dwc3_imx8mp *dwc3_imx, pm_message_t msg)
 {
-	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3);
+	struct dwc3	*dwc = platform_get_drvdata(dwc3_imx->dwc3_pdev);
 	int ret = 0;
 
 	if (!dwc3_imx->pm_suspended)
-- 
2.34.1


