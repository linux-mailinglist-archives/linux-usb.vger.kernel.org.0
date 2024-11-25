Return-Path: <linux-usb+bounces-17833-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF1D9D8329
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 11:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF21528BC62
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 10:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3443E195808;
	Mon, 25 Nov 2024 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hCw6r4Ed"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2059.outbound.protection.outlook.com [40.107.241.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29A1946B9
	for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 10:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529426; cv=fail; b=pXTEP3jufurZjm/274fuNhC3easxKK8dh543E5PbkkilPVE3GhNIKtdaElTaKsb1QRe0M5Y32D5JbBY/fbmhZEuE4Vz+LcWZmZiGkZp97lA96VDhW1CdScXoN54vRdCAzQLuyLxZEF9NE+zEth5yZr1plEeYrKrJjyIITSY65X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529426; c=relaxed/simple;
	bh=lpBeQXIlVuU+c5fmLUNl7LW3kIcNF1/9Kb7TF21kqjA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YI/z5c8tE1bGpkdNKC7rvGsmWKgwhOla/+JL5774Myoo8s8HWGKRx2ivBypWG9VoKM+0nO0GzWyexzqQ6nY3PP2RgOPNPxnmjNudxWWJJaKQRUo9lQhd4SrwAm0pP0SG+66n5YTKZ8gqppCBBiIrwIpkZ+FWM/UHMoK8MX8Mw2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hCw6r4Ed; arc=fail smtp.client-ip=40.107.241.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9x6snDzWFTzaWHf+hKJs2/HC0CcFaf/msY3sFc21P/Bm6d2ZUDTtWEGehuB1fp6PZQil2VfuZjIxRMjnRNv2TJUa8n8Yg1LjJv8DPgsyBp579x8DDOOAGSiK0rYupRDLICg9dfSdM2HC/ybb8mDW3zYJP3cbwUukCC9SLDcyUh7J4qxI3Vxl5Mw8QeFekBkryzQxpQDwCPmg4OwwuDYPPwzixSF6hO5YfsYttU1mPTokcy363PHJfjARQZN5hyYkrumfWsDq/JyGumbt+VAykfOxtyMFPk1GCEMK76VwrihUa0gsScDFX9/YkZxrNFeV0+ouvJgzbpHZhzBauLegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVGYA7mo/jcwnyrXRTXfhggNwF4mQNsbqIMjuimExB4=;
 b=N8uKQehwZdE9CWtByTVuohUiD8d/xSjK0e9EsyZfUknQgKwQZORZtBOJ4bVQUP0jGy8fXkdxe/fQCpMWVq0OhKr80HZG+16iCAjVEmMk7Q5ZbcgYmgYCtiS/L8bcnHS3In9Ee+YuIYzmAd4o9NhMqc2YpG5IauNNDNhNn7/88pmjTGDyvplD4wtpf5O7ZNOIRMGp3KPSnDjCD5P/CR1JRwgiUjWEKKqGRIYjLnPg0GaBrCRAjs6gc3I7npdwuFpnxp6+iB4cTth5Ypi18DMtcMxnN0OjWA/ppvTLg8Xc3n/V0SUNkU0qQcjB1TXZtjIPv5Yp1pgmRqYbZrl/g9VV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVGYA7mo/jcwnyrXRTXfhggNwF4mQNsbqIMjuimExB4=;
 b=hCw6r4Ed5JMGpHuT6CxhiZVq1yRvMKNmtRhsrlwpUX/VMe2Z4LGCatGEQ7FYaNOdEBdqF51EwtioEtLDTOz4Ps71QweVF+q0w481COPnSCDcKJ8QPaRZwyqn9WtnqgYbNq43ZTp3wEuMhD87dLbrqMc2FA/zmkR0esGFMCJZnqmkzEx2RzKUbYgU6mvE0OxBnSUmk7/xWmB3eXCDS3EeC+toS0tinliRoR9bwmYhuJNfxzD+9A1/uS9WJXevdLSpU8NaT7IMNrOYw65GgmlPrmg0nd/WvwQiT7wha5xBvXFMSzLZ8g61lXCVEaEnxT+eumiSbMl0N05gLbrpPf1X/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10440.eurprd04.prod.outlook.com (2603:10a6:800:218::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 10:10:21 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 10:10:21 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: dwc3: imx8mp: fix software node kernel dump
Date: Mon, 25 Nov 2024 18:10:17 +0800
Message-Id: <20241125101017.2398904-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10440:EE_
X-MS-Office365-Filtering-Correlation-Id: c70d206b-2d92-40d0-14bc-08dd0d395eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AFv8mQIVm1nukfIjkxTc8ual/EvQNPRmhk2OIlMxMCKbsO/i8qoFJz80dr8R?=
 =?us-ascii?Q?T8HQ1dMDVdGhHij8Zyb7TWGtMxZiY29GIvOrZC8GJxzYG2ZtSoYNoZ+tlvWQ?=
 =?us-ascii?Q?YdfYOdrFMSAiXS7hj9yj+Tqx1zYYmKGrNHtZyuCiwgKoEleU+jO6kxd2rgSf?=
 =?us-ascii?Q?0tzQhWKCYjzYbkEzF1UFIAUcnK5n7oVdr3FZcA904fO1f4w0T1qPhUIBo63P?=
 =?us-ascii?Q?6BKwhnM90DpTWTe4JwUDAgDqM+G5J/z1UmKTYONoNFQPBLbiySfQz+kPAhYu?=
 =?us-ascii?Q?uUfsJ1pp7Ab707kyEJJMHP/0/69hxffkC0S1NabvgJHu1hlcFqIjFEs2riy1?=
 =?us-ascii?Q?o8HWrNFs9vQLnGmZ46Lpy1VK7CaXcmj69EkuSmXTOfsURBa8M0kPoebRTcBy?=
 =?us-ascii?Q?6K4KEXB2HzzEj77I6iuM9fcUaxBwHfKaB2j5H35KQPoKU9gv7fCaBlcfJVPH?=
 =?us-ascii?Q?prRqAoI1b/GjM1E5wftXJAWnqxP6L9EXVgAaduJf5ZDzUA/SHmCNibPz0aLB?=
 =?us-ascii?Q?Q1Y3NVUMQ6NSO71yc+kivMmC+nYXeorfmNySbSH6q3slnOMaE2c+JdKnHsTg?=
 =?us-ascii?Q?Ep8EOftHyeBZssyD6WAHqtFkgE+omRRu/Z0NT/XSYkS7kTp7P8vIN1Cdl9bx?=
 =?us-ascii?Q?SfweJJP4XryVGLKZKjJKeFuuLFly3Cn/4DwCrKHoxCeKjy+zGITDlUDk1EOg?=
 =?us-ascii?Q?bAZ3eaYo7G4Ls0UEK2uIgjiPbP+s7L7jQhWk5xGPM1xANzrnBZ2oRnEQNFJ4?=
 =?us-ascii?Q?62VHAS+AlfB9zq1j8cuBBs+jIZMyYW0oEei0OZqYW03cMeGuoWc3bDK2kgVA?=
 =?us-ascii?Q?JM1tKJFK58v2pw+EpBWEfkJaQvqJ6wJPuJCrPtJy2jKkvEHjjSR42/G/xUMF?=
 =?us-ascii?Q?UvP7G0CxQYVdnK430+xtPUWBNH7e1BPRygkxB5X3y9ZYKdxdLYKiIplWrmfF?=
 =?us-ascii?Q?eC8Zx6ueb9suqGxi3D42BsDsbhaxNmlx5J3mwH3V7G3ElM0f5UXJuZhyxZVu?=
 =?us-ascii?Q?yq8/8XLFf/iNw6gjnD+wOtZH7+Jpo7o7/hofrGmwmN6wKpykM+yfzLFbt4xH?=
 =?us-ascii?Q?lIwuhkDcx4IA2/qObromsgsEBrEoY83kpsID1tUqez6D5RlwEjEt+xebKYUV?=
 =?us-ascii?Q?cVd2Ws75wD5PSvL3Xs+DDvxX7P1mH0u0D7NYU60O5fd/qDm+bja+EyLpnipp?=
 =?us-ascii?Q?+vfFRecPbUm7BsPtJUqmccDnF3apvvSTG4XC6P+lyMDn6S3M7yS0G+svDLyS?=
 =?us-ascii?Q?aSbdPTjePTDRaRKtZQleufYKu9F8MawvY76EOT5ISSt5u1ipKPJJLH7Su9Oe?=
 =?us-ascii?Q?DrLGsNFYuqK7iGHqlCqJrMBX3F3m6mzocBGJQr/T42fbGl1N2Mo5Xfl0T93F?=
 =?us-ascii?Q?SX8jVmce19GqSfzwEiDeH4ckFMtIXirjhpHiWFCUiAEQYAVD0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C0SIM+VmiL6aKio537uJzAGfw98xYU5z7cPGYHRhdsfsv02I4AgYfxN/U5SC?=
 =?us-ascii?Q?cXJp6etlzDsMm2sZRrp9OddPv5LUBO2lHPS6I0bRx9Ec3TFIOSHXkIHKTh+n?=
 =?us-ascii?Q?cLpUzZ2n96ubQB2jy2731GG+z6G7/KF+PRHZO3SoKIRJx5eSP+2tb2Jsbg7W?=
 =?us-ascii?Q?GMqxb6eDCfu89/+7TNx9xEAgwbRBqwoOlDR6W3xkCk8oKv2R+GJ/LVCaWvMf?=
 =?us-ascii?Q?S+wtlLDE8DhrBLxvVdFijnH/3igc6V2qSZxf7qhLAmjPi4Qve86jJRA72DdU?=
 =?us-ascii?Q?f5ra2mDVxrIJK+/SQLcsh+PUdIQfbC5RrHFRojVFj+hcIK5hU1Il9oFEP2B8?=
 =?us-ascii?Q?icCiaTbd6ArR/lN7+nxcmV5kR97EkU7aBZa4I3B/sr2BoE9k05LqBekpPHNN?=
 =?us-ascii?Q?ggAA27Pauc53QJbYm+/HdS2RNufUtagkP64KV9saWLzqdp/nBfMKgjrAdShL?=
 =?us-ascii?Q?DjXePRjvEfMvqHLdRg068A77cSpg6TQdjnQCIKoMbZTXqiI4DxhIpztmqyXs?=
 =?us-ascii?Q?5CKrTZ2/xK47fEPze5qkRPxspFJ4R5OJGoDDeLpFF5xIQg7TC9yvSTR3prvp?=
 =?us-ascii?Q?DDGOUu3P+lTZ23K2ABZ9jlQ0JeW4ykY8ahCdlSBlXjBnkAYiJDMxhytoP5ts?=
 =?us-ascii?Q?g6xmM3EF77zSbGJ66TcVVG9fdoc2HtR7x3FvTrgb/R9z2GMHddO6GVLr/5Yo?=
 =?us-ascii?Q?40ijRc234Li8LXCG8jnHjTIMybKSD8ACb2rIsoX6fGE9bPqhZkShBjxlQ+Br?=
 =?us-ascii?Q?e+v8gF7b8Sco2NjYUnT59izhcU+ncZxBWkfEbHCNN7jqXFz5ARyRYqe/j68y?=
 =?us-ascii?Q?eOnFY5BXTsB3+SHme0UmCmW8GLCFAZos84K1exxqOIMR9hhLdDojnwc+7cTH?=
 =?us-ascii?Q?1HN3DwfNtEJTNeeQos6jaVvPeQF2xIuozfkn/a1bYgic8FF+lzDs7DE6Y+2n?=
 =?us-ascii?Q?QWQ7odIKc2LIicIAZdLan/2MoCG5U1l9Dz1ZQJJauPjTF7wns7giX0wKqxIa?=
 =?us-ascii?Q?sZjxQ9MMtGHH7jDMqsHo8E0wc4nrtIJ2iU9WdJ1iHSjYR6amK4Xa+DiYIhPE?=
 =?us-ascii?Q?VowOcbREWCS+YlJaWa3HjQLeWOfiRmZfU3YUM8LLlGAHez4ohSYDZaVZSRTd?=
 =?us-ascii?Q?eIRsSgWjsWNQRfSS9H1fZb9/HZhvhp3YegPOSigidzwFP5vyLedqJ0lJj7Yx?=
 =?us-ascii?Q?4+AUhvk/przKAvvRteASB9krUoFX34l9XqbsgQ1eqLFC3QeNKRmqaiBy+xGr?=
 =?us-ascii?Q?h57NeIR0Q3Qkl5sJ8843Ph8v429XDO7ALpA2wPWO2zGDZXdyD5JXvJIVAtk8?=
 =?us-ascii?Q?Pf6S979TpgjnKyNCr7WfrhLQ9ZT3RxFXsRlaG3kb0iUmoBK3Z1z8SMUbKXxI?=
 =?us-ascii?Q?hjeVJJ9dG8vsv1YUsxVr6YLc5pJc8XMdHu1O1bCE+9juPrfyQ2HGlkZRmdGI?=
 =?us-ascii?Q?53yv71ERNHGEaRH7tCOspNgAvtrJ6Vof0xyMmzQN4976Xna8inHF12BM7gMf?=
 =?us-ascii?Q?EWsi1v5A8J5NwCATZYkckiuYT7Hxvddzg0MN5F8ST+JOSr6U5zGrva4zS3jH?=
 =?us-ascii?Q?FizOwX923vmoBsLuLHAlnwf8vagKMZ08Jykb94Zn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70d206b-2d92-40d0-14bc-08dd0d395eb5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 10:10:21.2779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlcGGJSEh6mm3t04dfjapJDUgbqpeTKrLPnRFt95SH3Ldg2HK2u0XW3pPLJVZHGzr+Y9RYmBohouqesOxq798Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10440

When unbind and bind the device again, kernel will dump below warning:

[  173.972130] sysfs: cannot create duplicate filename '/devices/platform/soc/4c010010.usb/software_node'
[  173.981564] CPU: 2 UID: 0 PID: 536 Comm: sh Not tainted 6.12.0-rc6-06344-g2aed7c4a5c56 #144
[  173.989923] Hardware name: NXP i.MX95 15X15 board (DT)
[  173.995062] Call trace:
[  173.997509]  dump_backtrace+0x90/0xe8
[  174.001196]  show_stack+0x18/0x24
[  174.004524]  dump_stack_lvl+0x74/0x8c
[  174.008198]  dump_stack+0x18/0x24
[  174.011526]  sysfs_warn_dup+0x64/0x80
[  174.015201]  sysfs_do_create_link_sd+0xf0/0xf8
[  174.019656]  sysfs_create_link+0x20/0x40
[  174.023590]  software_node_notify+0x90/0x100
[  174.027872]  device_create_managed_software_node+0xec/0x108
...

The root cause is the '4c010010.usb' device is a platform device which is
created during initcall and it will never be removed. So the software node
will never be removed too even using device_create_managed_software_node().
This will use device_add/remove_software_node() to improve the logic.

Fixes: a9400f1979a0 ("usb: dwc3: imx8mp: add 2 software managed quirk properties for host mode")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 356812cbcd88..edd544c6e1c1 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -129,6 +129,16 @@ static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)
 	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 }
 
+static const struct property_entry dwc3_imx8mp_properties[] = {
+	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
+	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
+	{},
+};
+
+static const struct software_node dwc3_imx8mp_swnode = {
+	.properties = dwc3_imx8mp_properties,
+};
+
 static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 {
 	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
@@ -148,17 +158,6 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 	return IRQ_HANDLED;
 }
 
-static int dwc3_imx8mp_set_software_node(struct device *dev)
-{
-	struct property_entry props[3] = { 0 };
-	int prop_idx = 0;
-
-	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk");
-	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
-
-	return device_create_managed_software_node(dev, props, NULL);
-}
-
 static int dwc3_imx8mp_probe(struct platform_device *pdev)
 {
 	struct device		*dev = &pdev->dev;
@@ -221,10 +220,10 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto disable_rpm;
 
-	err = dwc3_imx8mp_set_software_node(dev);
+	err = device_add_software_node(dev, &dwc3_imx8mp_swnode);
 	if (err) {
 		err = -ENODEV;
-		dev_err(dev, "failed to create software node\n");
+		dev_err(dev, "failed to add software node\n");
 		goto disable_rpm;
 	}
 
@@ -268,6 +267,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(dev);
 	of_platform_depopulate(dev);
+	device_remove_software_node(dev);
 
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-- 
2.34.1


