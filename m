Return-Path: <linux-usb+bounces-15974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7256199819B
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 11:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93BE51C20C84
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 09:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3B31BD01E;
	Thu, 10 Oct 2024 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PGW0KHzY"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2047.outbound.protection.outlook.com [40.107.247.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874C1BC066;
	Thu, 10 Oct 2024 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551246; cv=fail; b=jQU94VBinJAW+aE8gpZc83zgQem1t+joFUBTcGzlFJEtWQmmtonB1LWVJJ3BgGsUBelwvcFiEZzz9y510feBq6giOa0g0bPR3EmSqxHOKAIux/dog6T5ek6U266UvSPvGhAgK9CPQvnc9kpSZgET3a60TmJ/SQiLfS6CgBxXhYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551246; c=relaxed/simple;
	bh=xbjOur7PykQnGyWlib7x8HeMkDine7NdYpCVM9SSuOc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Jn3swEZuXh1osa5iGwE+LhQmbazXGEEl5iUGQr69/OEHyOn1TlPnSgG4ceww6HuaIa2z5ZuaiXiROhBGUbF8SEwPrP10BL/KZnlowRkMEuiZ8+QYOhLq1K9JZl9gjUj7MO8qKTeZOy3h6xIFFii3/ubYZRuewyt00PQljHJHYlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PGW0KHzY; arc=fail smtp.client-ip=40.107.247.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfylHdEFxHGd6OgW3BJNez/C0heU7d13bChNIQZHhAMRBieFKNzQtyhOs4/Wu1mqjfibJUNJ4ii5Sr8oAr6SeJAIMXYRkNAOGVmJmvzWrfC7H3jOUZNqInUChcDHx6NEN92/uUvi7UVWFLBkAdK4D/p0vT1XEoqEPqMGCbwIYPFMimsRzvw+g3+kVOFOqdzetgJN8rIHpSg2c753fXSRpAj0dpQj0SvMsIxX3c6YHhCx8gKQJy8E68X/L+Bam0JNEBLFW5SWIim2Z0vMDvBSTyBv9yfA/0hRppssjPDz09o2f5swlDC1fMzw7Oe5eQ0bUfUxkSNPltQIQt2jJPoZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSw1PHqUJralApoNZNue+nkDswjy14lMsTJvmmlEZnU=;
 b=cbUUl7WineNcmi+Z4xc1WdVwgLf5EHsxKCrI/erllWdcU/ZflnSBISA9x29IEEHuGtaQCoa9fv0k5nui00p3MmLFsrliQDweoZty6a49j2if6OPiB1XPcEj3nVLYkdQQ5hFrmr+Ms6Z0dOQTgoQADefHx5xRs55IPJgmsDNXLoI8L0p0wRG7gPVp7uEHh9/F7jJOmx2OOZWr69mpUVUz8Jqn7gvIcQBxVa9fjILDMjbQAlOg7UcgfgpQlrr9nu3lvSFjZfTDu+k+ZPPwDe8sJ0dRcJ2g3M78Om+OfNK7BCNuI1D+M1IZOD21oE3dW2AikOVuhr73Mrxil/pAKb068w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSw1PHqUJralApoNZNue+nkDswjy14lMsTJvmmlEZnU=;
 b=PGW0KHzY5KtCf9OndBlQY2tgfRm6UfIg71jwqNM71w4rxsCHcSof/Yv8L124kw98ZrlOq85G1I2zOqIpUlgW3OdTt9xZfR+xwGfPC6BmUu7ixlByeHA9/rwx1MU9v+jwqdv6P/o7Uj4ZtIPOuCh+69x+mNRpCmt/iNtmQBloz923hXxn7ptxbq1ZmSjjEg1zoThHohVbN2XWoKmNg2urKZZBvqm6PQcFImS9HQxQCoJLxP11n1kosSZ65OVt5nrtaUqanFwnithnqJtuMVTv1PMm9P2REEvNrs3x6qVErSkRPZtvwgrjuKWG85H6QEwb8DGp8Qns18FJXIVaoQg2iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB6851.eurprd04.prod.outlook.com (2603:10a6:208:182::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 09:07:20 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 09:07:19 +0000
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
Subject: [PATCH v7 1/3] phy: fsl-imx8mq-usb: add tca function driver for imx95
Date: Thu, 10 Oct 2024 17:08:20 +0800
Message-Id: <20241010090822.3915064-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0187.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM0PR04MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: c333f29e-21f2-4a24-fb56-08dce90af1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+SPJC54xWuqM1/b8XGBQAYUqBM7wcElwoOa8qImVr0QchePHbXxhjsBC+/F3?=
 =?us-ascii?Q?gbwr0881D6o6A0abZV2pHgceotiApDcsX6jpv3eBSFnLa7VQfXVVuQdI+5/I?=
 =?us-ascii?Q?CKdHYTUIxtUeqBAL8EmEk4zE8EeLZI7l05WomYT+mVoKt2DpVB0mqVfj+WhC?=
 =?us-ascii?Q?YrU1o2tpaysahFgAu+MVStvcy7fl7rE1gux4XDQvPEVkoAJnoYG5OcejDabL?=
 =?us-ascii?Q?Kyf//DeLfFk/WUtnXe4T8uAU3uF1JQ2y7+1/6in+CIECmJBxxfl9TV+SU+UG?=
 =?us-ascii?Q?c3LQun7BMzsH+YbyjEgyfIr/Pe4YNURsE3FwejcaYRc2scCRmSZWIRrD6+N5?=
 =?us-ascii?Q?5K3M4kr16lQbgtUjyCwe/ZrsMfOM7NbgL2OO1g//cocviIVCXUHS0WplaJ4r?=
 =?us-ascii?Q?ORM13j7/xOwMbfnk3WkWmjJ9Nyfrmh5Oey4gshIV/RWB/K7bpUOHM7QPmbb7?=
 =?us-ascii?Q?Ipz9jq5rtYtyTjskC1QTzXDZC+MAHTQ1URoGr8DtaiU4hblLE8Er9Nb9VFIb?=
 =?us-ascii?Q?Aw1zFptA/xfQVKvGh6fHfFKtd1uDEophmEUkeBYOfGS1Cp0htxgiQ+BUAlSU?=
 =?us-ascii?Q?kCucz7d7x61tr+oDtileZwxwZQCPKVw/mr+BVdd2neyWBTPgwMOlV45IJ/yG?=
 =?us-ascii?Q?vg1JMWi9ItYPu+9XZ+fHrXvodwhrgROQqBlCIwrb16bxbJMA6VvxomYayYlK?=
 =?us-ascii?Q?hjOmrdV3WUFd46EYu8W8WtBSYINzYgFhgYx8oGlIxaeqGrEjsRBRjbbzxu0b?=
 =?us-ascii?Q?Jb+ZXHIDvG6Ri0rgVKjSIQfiA1NQbYohrU14F6AUBwwAfM0crTCmYIdjIxLK?=
 =?us-ascii?Q?jnIVCn+Udzx2AEyhsCWVWPSoRrnzcKLJp+M+4QNGo7+SdoDa9MxPvb+GYKHg?=
 =?us-ascii?Q?edh00Px38Ws5oV22vyUjuAmCv7lfEddR6v5FeH95YXlzmggqpIfWHQpP5VUl?=
 =?us-ascii?Q?WgHV24+7wix8vnrh5KWp02H9MghnulzdTbEP5EEv/2IM8sQHYeumSNFVR373?=
 =?us-ascii?Q?6oYtAErOJQZBTo19caqMJFC2pjfsvL2C/ZlRhTDZlRRr1jcevSv3TpTmjIU1?=
 =?us-ascii?Q?cCLVPVAoLIjFBCRwOAQaAbzVpusfPhhH4NyB3PjAzP5G+qo55bfypi90s6Ik?=
 =?us-ascii?Q?2vEjQpGXN32v4X9lgPBOF8e8NOJ50gxhKWTLk9xK/zrEDldWvziVs/9wCTNE?=
 =?us-ascii?Q?Aq49tlcDk+dZe00cMv5QnaU7/GaPd/DcA05uvym9/I2OpYMfRhFbqu6Ndipf?=
 =?us-ascii?Q?31QiDJ7RMNTZYnftrY7BNIenAfXszga5nsCHsO5cn2LhZY5MqgJ7HXfDOqZt?=
 =?us-ascii?Q?qF0DZ2+Xk0nZGZg9e4rVyDAKaRUb3XX6wTeEA7imtKrc4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hvYRYfcgZ05r25kHTBOQYgHm9SP9Ohx6yScRWlVEbbzr1NoqB8yZvUrlVU3d?=
 =?us-ascii?Q?8U72sg54f40PSNfrKlfSXDLBxgIsYC3f8v0pyEOdtCZLW4D4vzV/kcxDGPG1?=
 =?us-ascii?Q?VuuK/KWigGbhtUgyYQyaCf3cLp/S+eYZhuVMLr2Zxb/SheY9dn5d9qLMWmQt?=
 =?us-ascii?Q?cEIUInLYU2YJNPYf98xYiwzm0L3WefxqHSX7ACEO+qgwjar9JUw9xWIfnDhb?=
 =?us-ascii?Q?Qpsq6WWtaLeKH9Wat0wLH2NEDgOcHkQ2d9jKHMcVtloVUmxNzOmFh5wJk1Dw?=
 =?us-ascii?Q?bCVgG3KFQewrWqq73ZXmQyWpUkRtyGBOKdUb0MPYTqyJBLSUd1NyeY+P9Tkx?=
 =?us-ascii?Q?Vg2SjZnIJ7wG3qFhSOSTYP/Uaz5fUEWzyDI1ReSnAc2SgMaPVyeoxuZNUvHJ?=
 =?us-ascii?Q?6PEmX85PIuB/mn6aYCH0I4H8IQJ9OaDECZOTYT2CCQWljxOyimaNeVLw0St4?=
 =?us-ascii?Q?CV/Mvodpcr6rk3x8dIpemT7IXS8l4JNu2miWmHjm4D27JNWzjtgM8jmSjGNY?=
 =?us-ascii?Q?ph2N0ataWAIOcj01r9MIsBO8RGesTBgPrWiRFlmum85Rwb7HNXAxs82h1LG4?=
 =?us-ascii?Q?ZtkjmI2oURoKRZTJMim6ReebtBcS05oA80OeosbqdjxSacLifxZNsdwJ9WN1?=
 =?us-ascii?Q?bDHpMQYzY5kYHpSe8nmWqPRsz0ogH8OlUvFy0widWgEMDPg2HNjoGszkZqD+?=
 =?us-ascii?Q?Zq41Xrq1hmgpdgKG4B2HMytoz+3lFUF1/+t3pnbBkT46irJvheH5JIms0U09?=
 =?us-ascii?Q?wTAxXCKT4Z+R2zY+4qqAU3K3NuMvP8VPTAaZ3zI16rLUXxyenbd101z/8xN+?=
 =?us-ascii?Q?y/2kt/0idhtARptZQIkDlvUPr6lLRL61qAIOFBfuLfpcSA6+P10XSMXpAaD6?=
 =?us-ascii?Q?uza6NhqHry8rI0AcFalUQ80DwCsDXmPH6eE+l9hAFhb0H1oJ2IUZMWz5tVPj?=
 =?us-ascii?Q?zxhMwkfsxnC3rGCI9q3DWBoHPsPJcJcVq2t+NyUZVBcPWVSPG4irKoFVd0hu?=
 =?us-ascii?Q?YlAGZB/8jI9/pboLeK8AK42l1FOP08i1cGdOvz85/iMMGnAbDc/XV3OWUmd7?=
 =?us-ascii?Q?NPT2cdDjKN4O080MtF470GclxxovNBTNWb3V2FtuqA4ypFUsbwSjvqB6LgiD?=
 =?us-ascii?Q?VTQgp8Pgmj0LJRDIrWHWMipbBBMV9IfYUCdDvjmSBBePHjwOSLnyW23/Htgs?=
 =?us-ascii?Q?bwiqune9TgqUrYEXzAxDhfKhI6XItXSSnLspOh4F1dzdCMJYPqxcI+XNlRcc?=
 =?us-ascii?Q?DkGjpfQe76H7Aci8lFX2tXl7ahHUjPSJNfs2mgx5vwQC8SDOx4H5S4ZWWKOl?=
 =?us-ascii?Q?R9UdAghf/x7W8HT/ipS6QNUQbCnaOHiHLguaoYyCnraBRyvue6HI3ZmazXjw?=
 =?us-ascii?Q?XwMM5IKwzCvJCqv73my64BUmjf4I8/JNSC/g1HVj3clLZmNTBWwwC1NzqVxx?=
 =?us-ascii?Q?a3g7yVRAccLuX5JlbDVQ+HwZPBKyClqnAqKdWgjiUcRLTNzPLro88Ho81tWs?=
 =?us-ascii?Q?dBBE/dhsWKVRzj9lQ+CjNj9KNguYcN+L/4pDH+uzS1TR0JZS+ZOppTKi7DOX?=
 =?us-ascii?Q?VP9Ed1GRw8Yz8WBxdbkssQKZytIe+UxzmpfsXR96?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c333f29e-21f2-4a24-fb56-08dce90af1d4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:07:19.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORungtjuV7YyDDWcImTJMXjUS2XGpIEPHg61KIx4PbTn+P1Vy1nkPy2a3UvmU4SmzzACUCd7pLJyPf0Tfl41rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6851

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
index adc6394626ce..661191276b27 100644
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


