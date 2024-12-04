Return-Path: <linux-usb+bounces-18079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AF79E32F9
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 06:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8AFC285B2F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 05:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F72E183CC2;
	Wed,  4 Dec 2024 05:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AXIFWIHz"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6E155398;
	Wed,  4 Dec 2024 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733288951; cv=fail; b=VRpctMB+W9d2W+HXUz8mGlFkb9iUViGmOrfyjaiGb49ZW/MJaSaCnddGiLtKp0tgth/Ytbu6O13vcCX+f/ZE02SbdOYbrJL2NlWgrwIPdXv1Z30UHYs0cXpQrQ7B+GlqP9SyAaFrpnw2PziFpxqQoYZdnzKcfvFDtw28HXP6x90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733288951; c=relaxed/simple;
	bh=ZDQxl7y9fNNwO9LJr1vvaQDEkMjs1wNLqrNecmAbWfM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=m06lVfSPmm7vJI0wHyixNl/9HAd9MMBXXmhIo46bAB7w+NEl15+xeSbWOvEsI3GPQvemHMzIU+2XX0GHMJtPNcaQzrD7Qu7o96r0VgunkX7fXCQKJvNeiv7N39fq7K/KT0JsBEKbBsv7jjckyhClaHXhVYeBMoSXjx1EGCwbxy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AXIFWIHz; arc=fail smtp.client-ip=40.107.22.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DB6JLC5lcIfI+RdZHUFyS5A2hYh4Z+35wNezAsPkbyU/eCvl6ME0jcr9DBj0eP0PpiliCPoXbX4r9mGFWwHxym2YQOGiddgim+N0sFqShgBgnXqOfaLIyTk661vPQWzAPl7VIiv2IKDNYgrWTDF6obw9Ry6G/a1ZzAqvQw797ZfrTbiDBhFgqIz/ai2Rgpr8hguDz89GdWzsCsQ/r8xQbjHPU07wwixWlDLiWpbDA3SUhj+l78aLwlulbX8voSo3/Exg+uUyc4JhnZMWMHwiyB22BuW5nytLfjZI/mhiX30dMruyRlIHUgddlE29FhvGgSNlB7COj4OYhqcHINh99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KqikDUloqENd9lsgI6Ypk56NHyoicSnCUw05ccFDFM=;
 b=osmy7taStCYJQ4VJON8NmqLGnHGH7mcgt9BcUJ5tqQyRfia6UQ4A69e7x6Y2yA9V9oWU2lkH+5F/5QLMg05hWcVsJocyFT4gtaPFQYdNKQVRhZ/+mmePua73yoq+3FYjPJO8135hORmDFRPHh05UxxJYFnG3vyLWDeI36WhMGkVSlAWy8eKDqCqT4yyB6qEuTlvsiRUfYPHLUCwgB7gW4yTRMOFV7EiyBaKfYbmX9sAZCI3M4Fm2autrxDG8rWOUW8fhYCKoZ9gDm49btt0pQkw1+KzFkaAxh8D2ErjzXf0jsCL1PHz/2PlgBl65C4Uy0SVYiQ8ZdT56igOtKomSQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KqikDUloqENd9lsgI6Ypk56NHyoicSnCUw05ccFDFM=;
 b=AXIFWIHzI15pua73/EQ034qMEGJgSsGxWuCUKc5huVXDAfTllkAxtVYONMbj6eMoJNF6P3fVfdaqhQMfOyV3db0U2TjUZjzvCuxtvgNtw/DnPjqOsYjzBAYTYS+1+qIvnLBp+KmhB7u0pvghuNxuWvRwCRc4d9XNTJqVk96iDIBXen3AE1/tGuAz+QyhZsqahGvK0/c4TZQ8XGvaho7iK2CnIPOlOaGgCgPg7xGn8NZlhdSQqlK8ERogdKSFALh8WAfEua+Y1eNY/TvzbVzMjtWcz856LfJaSI2bz5+No9A5iF/o6ZYqMC58WIOSfBc9gTD4EUU5kUybDVygUtfUNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10435.eurprd04.prod.outlook.com (2603:10a6:10:568::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 05:09:06 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 05:09:05 +0000
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
	jun.li@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v11 1/3] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Wed,  4 Dec 2024 13:09:05 +0800
Message-Id: <20241204050907.1081781-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0235.apcprd06.prod.outlook.com
 (2603:1096:4:ac::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10435:EE_
X-MS-Office365-Filtering-Correlation-Id: a13c3e2d-1432-41aa-610c-08dd1421c643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VkO4xDW23yG2arMKvnaZ8ONGmFpKzv1PeH1ZLHmgZnLU77wjqJ5c5oBlG8Is?=
 =?us-ascii?Q?0o4wZSS/QBdNra5OMuslqmozijmrmT+Gdw1lh6xY/QbJzKJ9VI1ZQE9aAOFs?=
 =?us-ascii?Q?fQ/kOVpxJ9DVWBpsl9l8lO2c/ALeORP1oUppnuW8lTwMMDbV8rtQaln+W13/?=
 =?us-ascii?Q?BDdQ7CpoAiiTGpoU9yVeDXQ9RvSHoNJ9AVVtZTiiZFQwWaKMZXgObbfktKLR?=
 =?us-ascii?Q?IWhcx0gWGYjcj9t9R7H/Ku5iSGDtiBgA3i5vFcegTKjuy3ud/5nEpGPRAwuj?=
 =?us-ascii?Q?EPk0JhXsUOIJ1EkoQgBESMNBUaBeuMd5OAQzXqn2F4w31N9b7oXtguwqEWNH?=
 =?us-ascii?Q?+x475pn54v8os7I7kw6bHxl94kq8e62YhWxyaO/pmx+KO0CGLeaNY5nm3zwL?=
 =?us-ascii?Q?IyxsSper34fVC7c1pXJju0PivB3sdZ8d5O+NrrVWKTwlxhc1avRZzVDwazbI?=
 =?us-ascii?Q?IIod3eFE55yj2lqLAQHeZoWdPNYGI2pdRqkyYd+ZLEcqsfqEifGVsiOFj99L?=
 =?us-ascii?Q?G5BDcfrmbjq4Wg3zu6s0H23SO9HxwGCYfpOjLnLqSAu60NyPvW8zYZIc+9qv?=
 =?us-ascii?Q?lH8xmE8wNDeQbYLYxrLqedGU32VaY296lizNuLnNZ4wiw9ojd31VgWk8eXno?=
 =?us-ascii?Q?odoarMbOxjhNbTKLEeUYAbfFUlwGmWOjNL9M9K0JschsVuJ6mn+jZr5CrLJB?=
 =?us-ascii?Q?lcD9a0nwwFSL7w08MjA+zHW26L7MloDrCMPR81MwJk9x0CnB5rWRf4Bde+dd?=
 =?us-ascii?Q?W5aGdJGiBqGGiPGmUKiXJrwYRUUXW3few2a7LGa7q5tWOMAyC5W8gBcVhf9A?=
 =?us-ascii?Q?kvl1J1sNOfG127XaIfZ/JIouD7tIfAUlXHy94nMK5rQg2JY1uVfspchF5E90?=
 =?us-ascii?Q?RNvUSY9fHYsg80aOCl+0r4sgfGlcnKWn3ErL3OYbORtLhStdZc5TUz21WYyS?=
 =?us-ascii?Q?ABWDPdw5nDC4hqRAqsRnpX2WWIhTeZgBeSAHuw4dpqJdSCIsl9C5qU+5vv/2?=
 =?us-ascii?Q?pczEXgPL+YV9ml/HQ2XJG8NfA8ULy8korkPn+7GrvH+GKf5Sgu17NPkX5qcR?=
 =?us-ascii?Q?PQZfYxozhh7nXlW4FEnAXZb/kcMl0gCcRoE3pwtLjpOq3Ed19b3RGPhAl1DC?=
 =?us-ascii?Q?0RdJxvUUbbV8Gvkl3ZIHKFk6gP3krYzNhxfOyApw9awP+UpH5IjoS0pSWNq8?=
 =?us-ascii?Q?nQcOAdp5Da0Evh2wPY3VH3BV8DtyI6Wfqws/Aoq4J6E7RiJ6FtCS/gc2rYpm?=
 =?us-ascii?Q?YeaaGRpN4MJWcmvLFhj/2uU7r3MpCMpL2B0Kx7v1d9Ifz7SMBoc9/8jIm2dt?=
 =?us-ascii?Q?Zda2JL+dej2ziLSB6Lbht2sK/7BvS94ZJiAlbtqvoBhp9AbKGZAss9FYWyEt?=
 =?us-ascii?Q?wdhPB3sXyF1EN7oWqD6M2KM1UFyef0MWOZeaeefXyx0Qgg8WrWE/dsck0aiI?=
 =?us-ascii?Q?1f+2P2dKNdg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WFW8adR8XTP5HegVSLKD8QG+e3OgFx4Kh/aZgiJnEF9GsB71MzRogrMP0IHU?=
 =?us-ascii?Q?0DdLYyJZyPhW9sdoWoKmxwp3uaeGYIdLl9gb7Nvn/DQ6++Ib/IJBJ8XBZckY?=
 =?us-ascii?Q?8h07LNxEY+pyZqvbWhVcEZUYRrwemUSNh4obOP7cjGvaE6s6/4im/6AuCJed?=
 =?us-ascii?Q?hKdIkQJSQKuxwswuNUHdDCHe62yY2G5pkQykoAW93hLtye6K60vtduMZSoL8?=
 =?us-ascii?Q?0vrTolEurRFxR2785pAppYcOFLuAUlBXCf4BSh+YlnLeikkbu1iss8DPGz/r?=
 =?us-ascii?Q?foe+dWVMivo1vqkj8FwjhgA+N7wi8L8/GmuBzLFY1QQqNJQ9cEofbNsc6T+V?=
 =?us-ascii?Q?QjggWSOYtFLWjAwvUJ7tw8OjgGSa6r6xEEW7jbZ8Gctqh/d9voGSil6kJnVU?=
 =?us-ascii?Q?Q75gDw7JA5Xi76tdNl6jIkSdbNDKru82Y/Htmq/b1EL4A3HbQ9rd3K2jvAjN?=
 =?us-ascii?Q?aOSBx24vI5e0tN4t0rrhliYdFjSgGjNB3p/Hs8ke0dzkamprRjOvQVlUxvQ7?=
 =?us-ascii?Q?dBJ6W9i2VxcRXNcujusrwAxwIY6yzu5I26QpR/FCr/VL2lq77GCetzpnuhBt?=
 =?us-ascii?Q?ULFJY2vZiYKLx05y6EsJuUJfufF86+NKOPxBrUby5WBidk2m3CK77jgriy8C?=
 =?us-ascii?Q?piVaBgqs1+c0ZqvhfFmX8Q43+0knPWM4FKvpGk1svdoskWP76MDAlukNUvLW?=
 =?us-ascii?Q?bzPlaWO4963GltS195XEBIccGerNd/ZCgI5RVDsvh3sJ86hTn0Wy0WDHhChL?=
 =?us-ascii?Q?XEQlsZ2qvbv3eF3rg0nbP/YK1wNd4q3DMsN+SOl5HPNh8Ha1P45tlLiIwNKl?=
 =?us-ascii?Q?NNStjVegw57uMRgHtfpmPVbczQPyRaMXe82E5POLKem1g4FF3Sq/VSMmg74h?=
 =?us-ascii?Q?a6OwK0rrbQZD98Z8nyytetqpl2RSeNDQM1TzdQT1gqGFtkI9bKOHq3SXXCMK?=
 =?us-ascii?Q?odT99wEXxkMCHic7b5O0Gp0sqsZdE+hkPfnYUFW3KrMwhZqZensOHfp66LPs?=
 =?us-ascii?Q?afkRGx6aYMBhMf2+l+eaeFiEkDTQLFin/2ee68zNlnxnZUCYe0NCqzzNtLOi?=
 =?us-ascii?Q?NeFCQB9zS451mk4jM4YLRjGe7XJA6OZV5FYFV0ARtMld7JrwcoRpGJNICf3B?=
 =?us-ascii?Q?/1GG+pWcfp0t19walIDeJdv5kCs1dPghuGAiQlr0sy8t7rtbnyy4KN7hUdr3?=
 =?us-ascii?Q?dsD7SHhTgxIkvcOEk5nqB+WSoPmahgucOHRBywV+BxZxBeriW1drgjsADH+c?=
 =?us-ascii?Q?gk+w+kj7kpde2GFXiIlA61NXyyQ5CayaWTeac3XbHoH3A14Jv0Ku3Qjk1T0Q?=
 =?us-ascii?Q?RRRe5Tl33I8pTFCwINmfn2sC0Apg2WsEYbvG2oJmPusTFE1TWl48KcU2r2p0?=
 =?us-ascii?Q?yDtplfAs/23LEjTWchHj7alUO8/mlRgxIOXG18JnZOPvkh2GqlMj3r6Goupe?=
 =?us-ascii?Q?WDYe/WXm/3si0V1ZniaBV5VZ352jPOGTI/tjvv+usAGhAOULg6wxtziWBsMU?=
 =?us-ascii?Q?f0GPmV3ySYxyJ4GzIv2LsqsmU0wzHl1yy7fNmB/ZFw4zXdrYgc490vdmp4+1?=
 =?us-ascii?Q?65H7/B9Pp+3IuastFJtM8hyYeH/JJrTGEnaLyMDa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13c3e2d-1432-41aa-610c-08dd1421c643
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:09:05.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ereVzMZKxX7ixkW830dz4ra5bBNS9VuNyH7AkAKBq5+AJLp5GRQEujJI5iJI/UePur+PlqxefsHAW/Il7Jflgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10435

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
Changes in v7:
 - fix sparse warnings in imx95_usb_phy_get_tca()
Changes in v8:
 - #define TCA_INFO 0xFC -> 0xfc
Changes in v9:
 - no changes
Changes in v10:
 - no changes
Changes in v11:
 - remove some unnecessary readl() as suggested by Amit Singh Tomar
---
 drivers/phy/freescale/Kconfig              |   1 +
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 240 +++++++++++++++++++++
 2 files changed, 241 insertions(+)

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
index adc6394626ce..a974ef94de9a 100644
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
+#define TCA_INFO			0xfc
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
@@ -64,6 +120,172 @@ struct imx8mq_usb_phy {
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
+		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
+		writel(val, tca->base + TCA_GCFG);
+
+		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
+		writel(val, tca->base + TCA_TCPC);
+
+		goto out;
+	}
+
+	/* use System Configuration Mode for TCA mux control. */
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
+		return NULL;
+
+	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
+	if (!tca)
+		return ERR_PTR(-ENOMEM);
+
+	tca->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(tca->base))
+		return ERR_CAST(tca->base);
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
@@ -315,6 +537,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
 
 	imx8m_phy_tune(imx_phy);
 
+	if (imx_phy->tca)
+		tca_blk_init(imx_phy->tca);
+
 	return 0;
 }
 
@@ -359,6 +584,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	 .data = &imx8mq_usb_phy_ops,},
 	{.compatible = "fsl,imx8mp-usb-phy",
 	 .data = &imx8mp_usb_phy_ops,},
+	{.compatible = "fsl,imx95-usb-phy",
+	 .data = &imx8mp_usb_phy_ops,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -398,6 +625,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(imx_phy->phy, imx_phy);
 
+	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
+	if (IS_ERR(imx_phy->tca))
+		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
+					"failed to get tca\n");
+
 	imx8m_get_phy_tuning_data(imx_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
@@ -405,8 +637,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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


