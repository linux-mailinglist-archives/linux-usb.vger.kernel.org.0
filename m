Return-Path: <linux-usb+bounces-5701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D626F843E99
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 12:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 078941C25960
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 11:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E11E7CF37;
	Wed, 31 Jan 2024 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="izWsS8B0"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDF678664;
	Wed, 31 Jan 2024 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701051; cv=fail; b=iYPKrwecrlx8hwjt980WDKS7kDC2oZz4pTH+eJtH7MeuuY0AqIl+oqRiDyGjp8krQ1c3sFaeFMJFT/zS1UDqmc2q3nDwo2mUduPYAU3CmZgfzuMwi2bCE7TdyK0/7cxp4s0TSgheXcvWR2pgHub4JCZZJOj/gSWFOo3LcqCT51w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701051; c=relaxed/simple;
	bh=Iwr7C8Mn6qVewGJBQMZqzBQfvWj92IQhtKW/ExIxedg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=prXMHH31+w6+jh7IjfkoTs9txV+f6JZnbFUktpu31IfK1kolqu9S7yllwaujaFXDnD0YUP2SiEz9VNUSLQyBMK1typXzCtXXaHYL7UHZ/3iSYpgDkf4giBM+0IXhKtaPDn1WHzt+up2MvUaXKM5MSCDWK+W0UaMJbWj0vJ0KJ2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=izWsS8B0; arc=fail smtp.client-ip=40.107.20.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW9hi+McF0pz6usjI6VSAtm0yzAwIgAr9chIKI6V+I+mkDmfypXiRmWSIEY0GASkfynJkCpW9PjVT3YFdy+AAwF3uU9LdVIuyYdcju8YV7GQMDx+WcX9SfiIBeFDPZzEeujya1KUqxf5BFWslcBciwrg9tVD2ZLQvFPJ8UC1WxUpt+QZvUrsaBTF7udG+2beLb36Bt7q1Pciwu0voUBqLf9/OcNKOKEKpN9seNYaErSRjfnsV72T0+yYNwodpzZQdEl49acP1jk7YCiWC2k7xB4wngCKilLWAynDiercXjC19+1Td13Seujn9nH2+G3JuhPmLrK1eBlnPfGW8a7MLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9V9IhEQhfSknBPe1rJfVBJniFJZCC2EB25NpQzVY5E=;
 b=nyPXZOx+1ECPNz9av20EJMZOZA5oScOeKxct5SLXB47j5Vd211KWobXAqwHFONbjt36J1alYa9pk1TtmSueZokHatpvyGJwqm7fUT2+88piMlO8o/uuCiVVazgAsk693CWHVv3c7xz6JU2eLaeZ92Ld6GiTczLYdGrJ2Q7ie7Wh8X1EQKrIu7+tMMcGK46ludMz64kjQCpfeO/BgZWbrVF2Cogx6PjJ+9eCN5J3YOfrv4sFOx/4W/gvjKvUO4MHlkfgbc5cPq8Md/CjXcaN3vY/V5pV5+FN0qsUsnFNeKcw8FYa2qO8kcHjMnaweGKWTlnFECrTJcrh2473wTue6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9V9IhEQhfSknBPe1rJfVBJniFJZCC2EB25NpQzVY5E=;
 b=izWsS8B0+XnuLhNeU2+StKqdsVdT5uneKvc3p9Lamm+ImIYD/bVW6PGJ29vwaerR2TdId3Lj25dAqxyKgCSK3N7Uh1R0jL0dUWSbY6EIi5HXbFGw+inI/l2Gc1AbvJC1Ju0xsRUOYzxxVHKLoRWUyowa2GJWZEbDTin23/BSZlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 11:37:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 11:37:24 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-imx@nxp.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 8/8] usb: chipidea: ci_hdrc_imx: align usb wakeup clock name with dt-bindings
Date: Wed, 31 Jan 2024 19:43:24 +0800
Message-Id: <20240131114324.3722428-8-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131114324.3722428-1-xu.yang_2@nxp.com>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: b22116df-9a1e-4f6a-a6c0-08dc2250fe8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4QMC/A2I4ZP4O695jJFrtpzoVO5NcQz6DtQDL9ny//Lnh/U9xEAH6vfaZhmI+3iOPBHOYZ+Q6YMjJL2CkJ3kiB2AgpXXINiJqIj+DFB8eTdI6u912CgMnrRHQQfF94IsWvoQZ6IFKMhsvi7sq83hpkas8xsp7+OnJyT/GeZ0BjwyE7HenKX0iYW6AmhWbgrrNRGmTQItBSyrXfiRLA3S511x3zRIPtkR/T+Q7xjItLP+R9Vu2TRUJlHsUhjB6fkJbKAHRGhmB6SK5NxrmqRznuc81UwhwdcfpKI2XnE/8z+VJIMEPCLbiEYy3VNsAtpCiPUFP36YnSRmUaeZbSwhkB5YZ2UO+m9Zo3rQgGURlv9SzIjiRenQyIeSebpKd6pvCxTDK4CTEhGprHAtkYHJEkDpSWnkUReSZSIg4pXWk5QEpMxoBGewbO2uizvoFMpXxIygSnhKpc+KeLkXJBT5CWu6ncng0rrRpE7OCwrK0H6pUryzYdUQNZKdDrwDgv5a4ezFqnIq+5hEkZ0lkiRpD+24xZlIodIbNPCLm8VGTa4M2g1epZIjZw4AK7lbmiRACQNeqSjpAI2ZZEN5hENm08nq6HNgo7lA6skD+10xQsHhtTmz70kFflPikM0Ev/H3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(1076003)(2616005)(41300700001)(38350700005)(316002)(66476007)(66556008)(478600001)(36756003)(6512007)(52116002)(6506007)(83380400001)(6486002)(38100700002)(66946007)(5660300002)(8936002)(4744005)(7416002)(2906002)(86362001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Br638Yb3OqS4JqlCeQoEuqMIWOah5fLn2GKF9qnjJzcxNELHoqLFO1KJzecK?=
 =?us-ascii?Q?b3fEQwryODVgLbtGjCatWOmUfQWS9RQw5Iiap1y3VndCtpow7O4HTeziWFfY?=
 =?us-ascii?Q?+JeF0wQe97JWfCCj9nm8IRQEpmSgL0AVxTR8U6KQlPxta8IMTlvLFY42lNMU?=
 =?us-ascii?Q?j+3ypcnYzkAUHN5/mHhQuww5Bd3O6Imrv4ZLCMlHwLPKIL5h5cjwKLihmhYj?=
 =?us-ascii?Q?hCwDLVemPBaWm4G7awGodYapopj6+50n1tZFN3iOMphoLTv4+h2i0JG1JdA9?=
 =?us-ascii?Q?hzjViA27PfQRYT8Mz6SiMrKB1bpZFHX64Ii4nwAFo8lidPufzhoJqC72sWDW?=
 =?us-ascii?Q?c478dEN4+Pbjd38x9xt7VLAwhbTl6t/XjqHGh10iN18fu3G82Erc91yTXP4A?=
 =?us-ascii?Q?Z92FbOhVc2ni3O8S3F60XfOZgPmL8jmjuJMXd+Z7QSSvMR2wXQqu6AGvrTKy?=
 =?us-ascii?Q?hlfNp5u71pV6dI2CyrX6T7b+5gHWRIx2j7Ki+7GAeGiufn0Eqzc8M9z8fG/9?=
 =?us-ascii?Q?8bxXrxvYFfT27gSOjkaRp77jhVRHRb19oiL87hXxIcP3JqMMvZC20RR3ASIE?=
 =?us-ascii?Q?j1QfKnpDpY/qX9dzDl4oKdf3Z3CCIvzFfsyxTmonsLCMvD/lQbhINlLDN4Sz?=
 =?us-ascii?Q?7qzjcHwEuu2BN9x2PFdN573lj0034IY1D8xzkk28Jn2/S1bQfhjgUrGNXKRB?=
 =?us-ascii?Q?A2ubcgII4MbNLbDaEi7TV/oNtIpTTu4fIs7bQpL67YVnGp0/g0sKLqfMXyRb?=
 =?us-ascii?Q?zdl9SQYLi6zNfEaCJHpjJu/0hk0ReHpC6UY4HGkFrOiy6RtCe/RXjPYQPNVX?=
 =?us-ascii?Q?aemgRR5P+43UwJSwWCpNlRWryXg6MyTHdZrUW3kUbpXz5ORNsEFbtJmsfA6G?=
 =?us-ascii?Q?aT7rf66SJ8XHvATVUA/StGtX93iDyeEaR5YzXv+1+KzII6A0GOM+NS15Frju?=
 =?us-ascii?Q?UZ0aEBDgrNOSbnpFE5gyRZ66xPRe8tZ7n1FoeNJwiu5rvhTHS9jQ1aQ0QIsj?=
 =?us-ascii?Q?mDZsRGPcHOd0xRM0T6klXsZ9o5VGkEfBigGZhgzwbze9mrCyiM85iF1HfC+L?=
 =?us-ascii?Q?rU1Md4LTejG+Fy3YxW/GTms8GYUEs0Obl/8WWM6cUtnWpkHGmYf07wgqwUq/?=
 =?us-ascii?Q?zxWqApgv8N08i4387lFp0S+GFtHqinhflu8G+Ym2G1gDlW1dIRqMqiUdg4U7?=
 =?us-ascii?Q?yvXNvcUDBtdKLXt7HjLp9/BPYDYeTl0Pc0EwUd55BpoVG/2OQbA7t8VWo0fo?=
 =?us-ascii?Q?HdFiHGzCUcbwU6hCBYcXPHmpkpNCrAI6vSR+jb3joLFGLYmIOUyLfogOBqT/?=
 =?us-ascii?Q?gOX9EzEbJOZz0sLsK7inQ4in7RVeUpWEyNgUGlRX9uOH0EPWUMdwes4jyzL/?=
 =?us-ascii?Q?6e03vpukh4MC1fQlHcpkrKuNeZq9CZEfzeGfVskPPtVBfu/L7l15Mlrd6wpE?=
 =?us-ascii?Q?/tb2GtUL4BNMrBLcedbU3bgXPVLKkjv8+S3H86vHodP020RZa7/C1wkGZnCO?=
 =?us-ascii?Q?8QSEqsK0UGiyNT3F35ko0epXDIpoXJK4tqWA9JVFArpQXNdLR0m3o4sy7wDR?=
 =?us-ascii?Q?edKsNL+zELP6KCs4WXjmA2L2a2AmhXxQb5XauYB4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22116df-9a1e-4f6a-a6c0-08dc2250fe8e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:37:24.6918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBjjd84QOjyQNCRh25eIoLIhZZoc0QIzLuHVEKwa5wLPej81rVjoHBCxsYmQO6DLyVgZgbW8G5IS/3t2ltVYHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

The dt-bindings is going to use "usb_wakeup" as wakup clock name. This will
align the change with dt-bindings.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - new patch
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index ae9a6a17ec6e..a17b6d619305 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -212,7 +212,7 @@ static int imx_get_clks(struct device *dev)
 		/* Get wakeup clock. Not all of the platforms need to
 		 * handle this clock. So make it optional.
 		 */
-		data->clk_wakeup = devm_clk_get_optional(dev, "usb_wakeup_clk");
+		data->clk_wakeup = devm_clk_get_optional(dev, "usb_wakeup");
 		if (IS_ERR(data->clk_wakeup))
 			ret = dev_err_probe(dev, PTR_ERR(data->clk_wakeup),
 					"Failed to get wakeup clk\n");
-- 
2.34.1


