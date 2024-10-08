Return-Path: <linux-usb+bounces-15834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E1993F2F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 09:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45522B22FDB
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 07:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3192D1DED50;
	Tue,  8 Oct 2024 06:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YYZ2GrNo"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBED1DE4D9;
	Tue,  8 Oct 2024 06:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728368803; cv=fail; b=YHIESBfot5fU6ZYLyKeKVb4IcEJzOhnMyrzBSTvMy3MTaQiubpc1iWX4D8u6qoTi5ZY9Y7P2WyAaeDZhexBxZ1PAdiKLpqVisXfKGWNeWBu4xdNi1Q5vNLxX/g8TqDQaTy6ZLlpjOILTA4z1YHBtZOlyviixihSqUCJvtYAt3YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728368803; c=relaxed/simple;
	bh=dtvn4k5ZiCvI7MWihjZLHwVLzEi9yPK/UPhAMA36Ju4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WrBXaoOfG8UThJdrGWYa2itBgjSPGcdUemXIiNoAtG0rwWUMBpcm/XKwXi2/IjMZqJOd3ixCIjKAVKlEJPNdCfdGN97Squ1VpS9uymvubLWt+wNpL0u8gEqLjWp/rlj8iyHEhxbni4nWtbVdi3khfssow4OYTTBMtFBzh3ywRP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YYZ2GrNo; arc=fail smtp.client-ip=40.107.22.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaNicbri1h5f6ZhCpBStDNDHublmNIwRAzM27FmDW0ZR61+IMKQsFrID0Fp4mRyPHuzuZsSYpOua3YSDImRQrWs2nsQKRp+EVUgqq341vulDONFLo0Lsblh18K9sGCGMUR6oFbM1PKFxXCIcCy15FLaLzGKH8ixeStDxrdUK++VAXoMj74h3fS6zGdM45GbXnT2SKGyYvxgp4Tol0FtdJuN+zYBW5XDP6Vm4BS8epJx4RCtp+VzqDkuDuNKMOSdiYXFxmmilW/tVrRO5nq7VFfswh7zgPskaI1ugYqIAZC5H57cY1q6qYOiduCPShlv64GU0Kht33XP6y3zSuqPilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOb3Bvml0rbY4M17NHrFn1D5X2+lYe+HZ416KcsNvWo=;
 b=uVfsCNiHExqGiU5cRw1CGkxe1TuNUg3xkaAG1QGd9e8sm+z6PqdLKS1wi3y4OVlleICTL9Y/+hcAGNGPF5fxeGgeXAT6W68cXGM0yKFbF6PJF8pvqO/dtSLMLFas6qCQlOAGIxWp/U5oxNgEGMHtIG7CALC/NXzfZmeZzRG21hoJoNIjeKv2qXB8sa9J0rF1qik2EBrdrD+NrZSjmbMir6QsB8Y+wJWsNK2oZQCEbDcbWG2iSJ/RIKCcJGonFyKEudg1bjSz6Swko74amopluATOdiNWztonSj4bn9YDCHtYxVsdoWJ22DNVrdvkSp5Yq0IqFTW/Rk31jzvcYCMJjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOb3Bvml0rbY4M17NHrFn1D5X2+lYe+HZ416KcsNvWo=;
 b=YYZ2GrNoPhg+/a3Km0ee5fja+fb0cKJR4POIUF7WgOXElNtsD+iJhuEmhYmE3vo71PtpHjWa2HETtwkMMPw41aqRRUdLDPuRt8qJqdQfuJEpENokZV3KOMxgn0WiHbE/MUZI3MW3blKzPGB4AgRJN1SD0AX47b6PAAgtrVUTeI86X6cfbjPakYf48OjCrn9FCkqK/2xvgFvfM78/2c7GcayqdeveZn1BuL3h5q1TVQ3ESDR5K3knVCeHGQbzIBz1YmHnTuK1Z4BWHs2zapZm/9x1d3WpOFRJSNmfrPbxEc96ZVJz8vZfy7hiXQbvYVBl7Ff7TEDFziHYY4lML25erQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB8PR04MB6956.eurprd04.prod.outlook.com (2603:10a6:10:11b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 06:26:38 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:26:38 +0000
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
Subject: [PATCH v6 1/3] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Tue,  8 Oct 2024 14:27:42 +0800
Message-Id: <20241008062744.2211539-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB8PR04MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: a75678dc-6054-4a90-1b0e-08dce7622a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rsTtcG87qAwtED6WTShBMbjYJxn5U8japZNu/sYC1+i2+jJLNrD3dnF4r5v1?=
 =?us-ascii?Q?Vy01Hwkey+k+/3RLVT3sDnh7kKwnxY/NMyVv9q68cV9g0IrCVfnThf8yhU5h?=
 =?us-ascii?Q?axVe3ootUnqRa5Qx4kPg8p53K4MYwHu5UkYGojSk8rVmuQuOVVkHO/LmKO91?=
 =?us-ascii?Q?oeVT22OPGITy71m4DJi9MKVpBeedlX6eMfvP0lcqULxMn3zzYR/tjLOVkcjn?=
 =?us-ascii?Q?nMsErEhHkRlm0Pc6SuyWsAlsNdFklobljTzyjsRxt33NUa6Ru6iD8TxyNW1v?=
 =?us-ascii?Q?aXdGIy9wkIIUPCcD1o4W6zXx6OJDe9fmtttshjFycsKEy1G3hE6WQ/lkarT2?=
 =?us-ascii?Q?wQZby0a7eo7tWIL57Ru9Cbxi4DAjuuyaGZBoeSNVqdYGOTC9KJV5anrGUpy/?=
 =?us-ascii?Q?qODy/tSKdVL7ZvGVWlzgCb5bub4TTok4pA+HMMsLLYfvqPv/LC1YDmClQbM8?=
 =?us-ascii?Q?XVwZ1jaThuIpjq/aAIMQztb1r03E2nBA4jJ7QkzeDnHlk7ZBeej0easkgCbo?=
 =?us-ascii?Q?d5rZQU1ZkbRR+bQ0QGMXtkR6YKSpFxowD513FGET9GIejCBiwH0bbyOyG3K0?=
 =?us-ascii?Q?2DtxAxY3KJiEATcS96CUTkf3pkFJWEeLeGWbahf6indY18rjiqiXIpgIYD+J?=
 =?us-ascii?Q?dtzIYrEOAz3ANojUknWQTTWYnFOIC73AoaX9cQ65S7Pe4bc+851oZk/S3JwV?=
 =?us-ascii?Q?bMve5ssdtDb8qWe9ffL0sETIJ+MBpmx3UzEM1ZqcyaJ1uUubsi79+IU7x5+T?=
 =?us-ascii?Q?tlE4UtPwgWwjcK4H+D4VxrhvWucrJgjZiPYqbbrrcOX/5h8Nr4sAzLYNUyWU?=
 =?us-ascii?Q?AdgijeFzjiy/jaQtzShhLLE3dGRbHU7Ev1YfO1bJBzzq4KAQBxSMD1GAJxiE?=
 =?us-ascii?Q?kxvsI950Dj4tFko03NOiXcsYPUk9/aDyKrcA48PmZyoaI+o2T1AwgvfII2Ca?=
 =?us-ascii?Q?+IhvnY/QID7sXecsBK2DySdTjjRrE5NJjLpu7K9rUJ+a2wdC5C+y0xvNkT7c?=
 =?us-ascii?Q?w4J5w7Ua4UgxUwJJKGdmylS+94JQps+MuwFIh/ekt6NaWDSTQoBESAn7MYnh?=
 =?us-ascii?Q?uBtJBYDSrKJ73n/EyoU4y3obi3bg3sWFPqzOnJVT7VbHHD0LV7Gmm70GUpHX?=
 =?us-ascii?Q?upxnV98Lurx9RcVMks3zfqwCngmd/HUnpd96SCyKnHxkKSAMheBsVjTCerQ8?=
 =?us-ascii?Q?nD9Jpuc3oKXvnVkTCiuYKNMpKcO7TD5bQoJaV4KS98IRBv2WcYwToDsEYKBH?=
 =?us-ascii?Q?AqUwiStPeOlu69CrQDt+vTED8RB4azcwRThy1uanm1lw+1ekq9S0SG2vhVu6?=
 =?us-ascii?Q?YIRVcOCd0zOjLaAwb8W1Ct3fiN0CoJTQ84JswnMkJCqZHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kJy1yNUV6pPuJyQhD3u1r+w8Jywn3L5EniAcVV6ztX3hqTuKXmzksTTbh8p9?=
 =?us-ascii?Q?OhoO4hcG9sSfYyXfdhF+oFIoDYKMAnEyRJvPwv0SfF63n7ubxbGRfXlppz3H?=
 =?us-ascii?Q?56RBp8lY9AMCFnNOLmW/u5pcdW9kaz8P83A4mkBlI53bh8I/5J4jCamw3P9E?=
 =?us-ascii?Q?PKzVw2KBT0ySYmXDKxE7YMTEHmOnK72nCJ4wAN3hxEI99q7k77GOOuxCqKPu?=
 =?us-ascii?Q?IDwZg7drDPGeWc3Y73fk2WM1kaZzJu0DuE1oV8DlmnzqhsxXrx10Ay7mL6Mz?=
 =?us-ascii?Q?qwaXVP3g1P44u6ScpP4VULGjIgZ4LF6gkiPGBjztJ+1Rkl7BiIXmzAmb39Pk?=
 =?us-ascii?Q?ec74oMUBKrk6jh0qpPQGpIrAaID9/sFUBXDs/HTUbk7tSaZRpAar25BYkTns?=
 =?us-ascii?Q?VtH6KNwXt5xq5qqg4pv3ZFZwPq00yZNwYQAbOgHLHpFx5Z/eiXt1sIDLe5de?=
 =?us-ascii?Q?Ry+HpbVyotqcP8O2t9gLPCVpbGF86N46AtSR08sZD1oNL328iEDGVH8R9mf7?=
 =?us-ascii?Q?K8CKgYaQ5PHJNID3HpB7pW5bbDphy0j0hdNoZHdvOUpmtw1CEmPhk6MOGweN?=
 =?us-ascii?Q?MYkQYmA9AA6FdruXNqqE1++JxqCOAQ4k8yO1hV2X3atViRCrUXAa+7FiSnf6?=
 =?us-ascii?Q?aep7A5Khds3MQm0AP+iKRvOESxs+VAjRWLP1MGKjK0r5EuMcTipdlG+Y7nOz?=
 =?us-ascii?Q?TKLlN1jlIJKtWf8D7MDbNH/VFshhsGDoYz/FVuzv7XbigLtBD1kHS0fQhVYV?=
 =?us-ascii?Q?en39a297vx/jyYMgVMr4pTWD4vcIqkA7+iyAJJG8UT/StJhFVwrFh4hWO7fP?=
 =?us-ascii?Q?JTqGuiZRyRhttLWzvUaFsLeRtnRtLN9w3UvgPjY0tEIF2pYueo7XID7U3DOu?=
 =?us-ascii?Q?87OlJUrCbFG6kn5xFBETFP3kC8XIngCrt2V3vUAsQxwtMgl0jjdtHJJDxlUO?=
 =?us-ascii?Q?x8PfVwCu3kaG6+YagDtUsMzPEf0Db+EWKZDs4rSBHCgALVqZKGjfq9uiorTt?=
 =?us-ascii?Q?fKKvYjgLS+1qnv2Ha6kJg7YccXVPbZrXN4onMOY9alhyL/9SsY8IfLvKAiaO?=
 =?us-ascii?Q?dn5xhRWFM4oh9PPYCjPHdjy46CO8FdgAs9oCqmYpcA/aJNDbnxixceZl6QTi?=
 =?us-ascii?Q?sqhCQun4RJkVunzKGp1rPpBIYVttLLabOv5txhJ4EZyNvZzpPWPjWBjx29KW?=
 =?us-ascii?Q?Y3JGr2B5O6LW6BZJPTmGsmq4LVQRKUjyuaZxNRVPxYJ5PLmIVvq+FVyq7j/b?=
 =?us-ascii?Q?Dx7vFh+kUGIAeq+8TKhZyt8MH6t2nu3Ifl33H2r5vGWf0c1ABJTXcrU46hH7?=
 =?us-ascii?Q?oaVjuLqL911WXFSFv/A/zEtwmDnUkgGxKv3NxAj9rhvMWcga8B11M5VDXKUd?=
 =?us-ascii?Q?1zZdJ1/nHfOnESx15Ldj+7yLUd/TszssMmeHT5iRJQ6p1Qj1XlLIryZc/pa1?=
 =?us-ascii?Q?s0PRJ9qRATE4YptJdap/tjYF7QTeQGXOMkJIhqmmo13qRKSiV7HKEaeJ+wV6?=
 =?us-ascii?Q?paOIr7h+QyaK6Cey9i0GJNh56MaVBLS90t6THlu+/qQQnR6tiCzTs1VKBr0/?=
 =?us-ascii?Q?EseHwXOiRIAlIWTUITSqY2eqrDX8b+9yWUjyC7CK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75678dc-6054-4a90-1b0e-08dce7622a0d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:26:38.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCJcZtlpJy2ovadUPaU6MdbBD30De1HhGNRjY0BLpWfrH+VaTuqBK7gLpEsaYCNauizxRO9dkQExsp30ZJzevg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6956

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
Changes in v4:
 - remove compatible check for imx95
 - check whether tca register region exist or not, yes means has tca,
   otherwise skip tca setup
Changes in v5:
 - no changes
Changes in v6:
 - no changes
---
 drivers/phy/freescale/Kconfig              |   1 +
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 243 +++++++++++++++++++++
 2 files changed, 244 insertions(+)

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
index adc6394626ce..f97f86644b2c 100644
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
@@ -64,6 +120,175 @@ struct imx8mq_usb_phy {
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
+	struct resource *res;
+	struct tca_blk *tca;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res)
+		return 0;
+
+	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
+	if (!tca)
+		return ERR_PTR(-ENOMEM);
+
+	tca->base = devm_ioremap_resource(&pdev->dev, res);
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
@@ -315,6 +540,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
 
 	imx8m_phy_tune(imx_phy);
 
+	if (imx_phy->tca)
+		tca_blk_init(imx_phy->tca);
+
 	return 0;
 }
 
@@ -359,6 +587,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	 .data = &imx8mq_usb_phy_ops,},
 	{.compatible = "fsl,imx8mp-usb-phy",
 	 .data = &imx8mp_usb_phy_ops,},
+	{.compatible = "fsl,imx95-usb-phy",
+	 .data = &imx8mp_usb_phy_ops,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -398,6 +628,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(imx_phy->phy, imx_phy);
 
+	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
+	if (IS_ERR(imx_phy->tca))
+		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
+					"failed to get tca\n");
+
 	imx8m_get_phy_tuning_data(imx_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
@@ -405,8 +640,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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


