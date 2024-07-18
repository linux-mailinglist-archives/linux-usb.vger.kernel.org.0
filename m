Return-Path: <linux-usb+bounces-12267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B92934B9A
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 12:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 218A8B22424
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 10:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2002478286;
	Thu, 18 Jul 2024 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PjCbSg3x"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F91EA74;
	Thu, 18 Jul 2024 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721298391; cv=fail; b=JFKaPcp7K7LTJAi1Iw5CSeT6pvzt2Ma5UtEFd44gm1n4MLxtrwvS6kRJ8CAeq9HnoOqBVArKo4wvLrjtx1sxfJE5tUp8G6YN8v1xT6n9UlBZ8G7SiCgnRby61Y3iXBdYTKW/x91VLhsTqiDGIkKKRoubAt9Q+bg8M/8NydaknLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721298391; c=relaxed/simple;
	bh=GVyo+j6mLLy6TH3INgYUZRFD4Vt3UHY9ziG4s4lxl+w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ChthFru5bKQ5Dxzx+/vC/HZR9Gt6Jy+cycTtgKBAdFRiuYAiF5tS3xtmNOlQTj6HGt2tiWDdqQFCYMsm2EaTvam7Q2Pka2Uk9Ip9gEW/x1s7m4tqZK/ZNpaUA/iMGAntFbkyGDZoqwEDJn3yg0xR7/C1hLCpieWo231xm7awmZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=PjCbSg3x; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey0XvknHvDnmIg/LI7kPR9Q50YdmU6Ex++6AdukdGO6/teK0frrbWqSjamrgQbmpMMEOjM2w0W8fara+yZrFMVgqEVWtvtepN3hEnYSahmOiHNoBIxhbIW9+rETB7MIoGtUO+T9LADeeXsiDCokLdxMu6oOTs5ojfTGdjVNUL5VRnIK2BfvjmHcJ/3+R3PgX/eTZPFskZfMMgan7MS/KYwFg6/vVZOSbuqi1vdTa9fQajZZKHjSKnqbyn0hncJssMXJ9ElzCnHJxq9csvaMJ70lOiNlL0MVxzCrIfft4UiW5v5K12+nlh8wYWmiukQyAZc0VEQKh2P1hTRNPN8kV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ea3q8DGyqZWZT3weIDeXRJreBmnXAssnNCOmfCGdYPo=;
 b=GW0ySr8IbyiP2ScGzP2hyphQj3RetLy8zIbeM5vNydAOJN7622jFjoIIxbY+90Ayucmi2ycOojRA9N+UUEglPI6tmLIoe22wSNSnkNZ6SaetcbvNBGhozCwlzeGtRdzsCduWjm1nIMvvIahJSsTuf/8sibIjRPQDF/qjj8xa8ZkHjA9U4naa86GRRa8HyIfqxqfbuo5+XIFtx5pXFFa9bXlRJxn1dMr2MHXTIwcT7xr8Rp4SSvBQPQ9+7FK7mk6XwgXHdXJ41MsklJtmgSmjk8ErrefMl+LxHKdABagig9bMypEVDZ/f/LFx0Z4ojoKAXLjYPsNBaqzaIaTLAueZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ea3q8DGyqZWZT3weIDeXRJreBmnXAssnNCOmfCGdYPo=;
 b=PjCbSg3xWT1ZjFtPU3IEmc1DBtSiIgs9nKAbr6II9BErYCgeVlP/XYqLwBhST+Z5S9tv0xoPU325y0zezbOcWgK+MYAgNaGJE6KZvM1FEKBUq0DLgF28ZJzLP91ardXtqye0bGnGqU0AYoma0DDQN6SpP+TSAfMY2JpHe1MXQaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9886.eurprd04.prod.outlook.com (2603:10a6:102:37f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 10:26:26 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 10:26:26 +0000
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
Subject: [PATCH 1/6] usb: phy: mxs: Using regulator phy-3p0
Date: Thu, 18 Jul 2024 18:26:32 +0800
Message-Id: <20240718102637.3964232-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 0f1f90a5-9c82-40f8-8878-08dca714147b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?926EaJYAJqH0W/eItKhosfCdOzgTm4tJTIB1CufsqggR0Kout6COZvXepVPJ?=
 =?us-ascii?Q?UUj45BB7W/dvYtAGUV9tcAotbbJpOcrkKlXGNZjftpY4DoNokOhbgFlZ4bSp?=
 =?us-ascii?Q?jHcj3ZCKYsHiN26D3Ylzad4hwTtTl9q9yJH6SJD2BPcECBdw8/QwvIl2u/eP?=
 =?us-ascii?Q?W2/40wgvFfoRgk2bsy5rffENP+zMkzHEe9VkoPWjEiy7QjOTh2mNsmkX45oS?=
 =?us-ascii?Q?j3cAkKPbbsftmsHOufhFEsaiSEBC99ej+vZ6/wINHQHOUxKx6G87hWhAmIZj?=
 =?us-ascii?Q?6OugrTMH4xzk/xcfDK5GA7v72mR/kAqZvdeHPR5+HM+9XS90+lBt+yxEaeyj?=
 =?us-ascii?Q?8p3V5CxIJXhQJBYuisgmEp8vTEyyfC1zk09y7F0adztJR1kNfRiVBbYhw0oK?=
 =?us-ascii?Q?WZUaSWqDVT+L4PQsRzLyXAkyPpPL0rciZ08FJqf25RcmWQTVsmK5K2wp/IZk?=
 =?us-ascii?Q?xcf3EsSdbT/bfCUUwFCqCsEVzhO3l5Q0NPnPVCjYmI2k5tx87UKqAsx4ADRI?=
 =?us-ascii?Q?YeVFxXk+R3kQKOhruzsIWqEph0RrY6SvVAC7jm870tzS7pF1BkwdcmDHYykP?=
 =?us-ascii?Q?FtMCVJSsgR5GqKM/qS+LME7LtqkbJJ5wKaeLGw/0pbpvfjHhqnQ4rMEbPKFL?=
 =?us-ascii?Q?6I6Mjkq7PNoTd2TCa+XNrBwnA+XJQ1ynBwuuCdupxKRWm97bKrfH2fJLkacj?=
 =?us-ascii?Q?GixDR75M3AKyc6EL+mNQtfCz6dlqT7VtD5lpzOhEZ9PFnba93uTK9Thwql9c?=
 =?us-ascii?Q?a0Gg7Ag7NxNX4xd4Cz2Q0poAjjql7O9iqNYo/h+MStgA72lB1++Bc+Hk5qhb?=
 =?us-ascii?Q?2xHYqETIjqQrS1NJVQ1HZ9imVJcWfy6fgAyQbR+nWYNv19w0+uKl8RVPe4No?=
 =?us-ascii?Q?bRPqwglZNd4X8eJER+4dKSE91Sx0By8S9zFvqkB4qa2RR9geqMLKeJ/1mhQI?=
 =?us-ascii?Q?j3mwvOwwlV2GjflKIjtYDZimuhgDtXrQ+SC2mtu6IuzWpASGJqSXXFl6EM+j?=
 =?us-ascii?Q?fp+KA01B22ZgKc/Nlq9JBB0hj6WPKjwAnJ4vOPrADiouSnwLwL/tjharwdHW?=
 =?us-ascii?Q?KC+/hQQDtzSFbU0jANKkSL5/odbkSD+latMsNAiNXIbsWWOxEaXvlPDqpbpR?=
 =?us-ascii?Q?wug3I1nNdD6YBnye7TbEKKobtQulmTSkTbKbzB+ncFZX4jdUeGbjalrePA9r?=
 =?us-ascii?Q?rlWW0SN78kdLv3vdga3PMTn9TImZZQpTwr0/bTxuJFun1tPQBPhPlPNE7vBl?=
 =?us-ascii?Q?p4PQ+tMTQjiOEBZMHSuwkAUlN3YBEDJQvYsbrgA0oN//0gySqGZkIwRhW6Hs?=
 =?us-ascii?Q?j6b+Em8fMH4gaw3miZ7hLgRkTEA1iVNB9kOjq+vdGyWMl0jBsPmjGBp2NIvu?=
 =?us-ascii?Q?l1xYbObgGCzjt+EYvoiCwYXjGRUTAFmuuvkuAKh24yIZ6ag56D6AiiLTUeYk?=
 =?us-ascii?Q?BunIta0p404=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6JcRU8x5BjFxSGq4/CpJNJJ+HAt8x0oj08hkMlAJBkRd2e1G8OvtBscbp2FA?=
 =?us-ascii?Q?DKK2Nu0NwSmTdb/hnaJg1csyAlKfnHvFEaocNw6awRMizd4XseIDQIRFmOPp?=
 =?us-ascii?Q?gBN2QpaAVZjB02ydFaV+JgaaGNmoKdazIS+GKa6+tEaVWElvQ2WDMsV9IHIc?=
 =?us-ascii?Q?EB5H3KpMFRXSyWQctJmszieUo49spgcWiakC5HVbB1HjOV2Gs1vFVmaOB9sH?=
 =?us-ascii?Q?VjRaEOJ3gBqq6NgeuRx8aDFMReHBraEYgi6CHDzBy1do5BJI7zQuablp/r0I?=
 =?us-ascii?Q?vcVEA4D1JiC8ZfhzndDVBI4FkDWkglSfTfSpwtX3PBQQsVwp0d2z0oeIVFZj?=
 =?us-ascii?Q?ojqtSVfI9RMgAyNZqeWFPxDbXO1BdV+IxGJ8prlgmrIOenHTsCmhHq0nLaZn?=
 =?us-ascii?Q?w7SK5n5G/qz0AlURQk5jX1ilrGHMa9wNWpvW5MTIEJbFXLSSoht5Vt7fRGvu?=
 =?us-ascii?Q?AnnlLqZudYebC9QfmIOgAohgUzNnZA2ij2GLrOSy2BKrMTYSQkIaKHh37RKv?=
 =?us-ascii?Q?mPqfIMNvivYobUFMgKeHHlGPtbtSvoKzc1h73HoTa1Rk23bUqgU7/+gk9avy?=
 =?us-ascii?Q?NGZi0exprvApJH+MZipzDhLWUX+LMcY5B9+yrbUFmbA7LxwZs7k1Ap0pWTOR?=
 =?us-ascii?Q?eWXjFUvHv7BQt6lmdBwyD7MKLhYSzcTIiBnNQNYH2SKxk3e8g2E8rvM2vrTV?=
 =?us-ascii?Q?miqqDhSLI8EHCQUHVd80xPQs4fY3t2kskPNmI3H7wBbb5TT5NcZfgGGSdytW?=
 =?us-ascii?Q?OPz9EbavoljCpkYSUpLb++Okf1D3YEi3hUlAjQt5YXodPQpccVIkbcOH0T5W?=
 =?us-ascii?Q?4qDJvjZVYbqCM3/SD59flJJANaOkRd1Qy0DWIbUm2CJG1IGV+dlISnHCCyC3?=
 =?us-ascii?Q?ykD3H7DM+XhL3lJTWZXcuOYf2/42BDE5gZVGSbuyX9EpkJVeIuk2CXm5Gwj0?=
 =?us-ascii?Q?5dRNrXQwa+h3vYYkXu+cutMIlJh2fpp15pZynopStk50ao3YOD+uHBbKh7YA?=
 =?us-ascii?Q?WpeuLaY0u9Kekfd0zFKQffXOOsmfsTBEb26O+8baBcmqF1Go7a1b9oOneL3H?=
 =?us-ascii?Q?pvW0saZeKcFvi4NmNJJGKft/epFoRxc3X9ssN45xCKwIMlq7xh3Uyaxi8VvI?=
 =?us-ascii?Q?9TTcPJoHK8GK9QGzuZ286nFtv61SUdPdnz9lq4seSBfMnrf5UdMv292fOeNB?=
 =?us-ascii?Q?SD2ykCNSvVYVLh+bmsW9D97M9HuJB1dWXzoJaV4zJzlYh4EPf9zntInsOCLA?=
 =?us-ascii?Q?/z6ngVg1GYDOj9a1O+5NVgF0o4QAm6/IDdVfOTOU6ZGE/rxiJW6CbIR5/9DC?=
 =?us-ascii?Q?QoPcK0L6q+DTZ9HBVIYXIUnh+IHCEt0qcki6NdoSYuH2dDnB82+ULX+cot4c?=
 =?us-ascii?Q?UuJHeuabkK2ePm5S+4Po7eGo68nKJlaoUiOtidZ//0oipjMK+BGhPhMNiabK?=
 =?us-ascii?Q?jbPkeONg/+kB5HiPKOP+ihhstFDj4YZz+wvbqxiqj8y3xM30IfBPO0YmjbY9?=
 =?us-ascii?Q?ers1pALw2Tk2rTzB8/NplHNQQzCrt2k3dEO24mNmX75tSGnD27dSWq4GKn97?=
 =?us-ascii?Q?/Z1bGi1k5uGP3xdNE/OpF4F/H67pyPH/pWJR6Cfd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1f90a5-9c82-40f8-8878-08dca714147b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 10:26:26.7637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYY8R/yPk8tyfQ2QWtfoo2TZ/aVjeA+Imzs6E9+5UYZiBIst/rn31m3jE8oIZIK3IG5Gk/ZDQ8DKe2diaD7J/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9886

It is one of PHY's power, and we need to enable it to keep signal
quality good, and pass eye diagram test.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 920a32cd094d..42fcc8ad9492 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -18,6 +18,7 @@
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/iopoll.h>
+#include <linux/regulator/consumer.h>
 
 #define DRIVER_NAME "mxs_phy"
 
@@ -204,6 +205,7 @@ struct mxs_phy {
 	int port_id;
 	u32 tx_reg_set;
 	u32 tx_reg_mask;
+	struct regulator *phy_3p0;
 };
 
 static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
@@ -288,6 +290,16 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 	if (ret)
 		goto disable_pll;
 
+	if (mxs_phy->phy_3p0) {
+		ret = regulator_enable(mxs_phy->phy_3p0);
+		if (ret) {
+			dev_err(mxs_phy->phy.dev,
+				"Failed to enable 3p0 regulator, ret=%d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	/* Power up the PHY */
 	writel(0, base + HW_USBPHY_PWD);
 
@@ -448,6 +460,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
 	if (is_imx7ulp_phy(mxs_phy))
 		mxs_phy_pll_enable(phy->io_priv, false);
 
+	if (mxs_phy->phy_3p0)
+		regulator_disable(mxs_phy->phy_3p0);
+
 	clk_disable_unprepare(mxs_phy->clk);
 }
 
@@ -789,6 +804,21 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	mxs_phy->clk = clk;
 	mxs_phy->data = of_device_get_match_data(&pdev->dev);
 
+	mxs_phy->phy_3p0 = devm_regulator_get(&pdev->dev, "phy-3p0");
+	if (PTR_ERR(mxs_phy->phy_3p0) == -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (PTR_ERR(mxs_phy->phy_3p0) == -ENODEV) {
+		/* not exist */
+		mxs_phy->phy_3p0 = NULL;
+	} else if (IS_ERR(mxs_phy->phy_3p0)) {
+		dev_err(&pdev->dev, "Getting regulator error: %ld\n",
+			PTR_ERR(mxs_phy->phy_3p0));
+		return PTR_ERR(mxs_phy->phy_3p0);
+	}
+
+	if (mxs_phy->phy_3p0)
+		regulator_set_voltage(mxs_phy->phy_3p0, 3200000, 3200000);
+
 	platform_set_drvdata(pdev, mxs_phy);
 
 	device_set_wakeup_capable(&pdev->dev, true);
-- 
2.34.1


