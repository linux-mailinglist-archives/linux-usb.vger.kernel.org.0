Return-Path: <linux-usb+bounces-14934-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C18CA974A4C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 08:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454031F272F5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 06:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93F27E107;
	Wed, 11 Sep 2024 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BG6hpKC4"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509F1DA5E;
	Wed, 11 Sep 2024 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035421; cv=fail; b=FGSKFVT0o8rOQA0j9mm51a93XYZGJRseAP6O/NvjtJLiwKjXiHw8fZ79fcKIAcIh6+wQCSEhnN2wX6wYQATT26KGJuDEnx3hvsFj87Caf4XogzZCpIjsu9bHI2TL3Z7Ss0X5ZRUl7ZtCa0A3WHc6UH5I114feZVeJrdV2yaSVsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035421; c=relaxed/simple;
	bh=UFhJ9s6pqsvbGa/kSBjLaPlGQ3zmm4rGAe9rN1WkqAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i8X4b4U8nxv9geIyq98u6TgdvgimJKtIx8uyUsQbNiTT/g1vl0ajTLsTuC4mhNTdawjlCa/80yRcXVmX+uNgi8733ClY+e5hLUEvoHpwnIb7Ciw85EFXJaSs0jMpCnakNkup4g67/E/QyaiLyij4AHWs7CirnjtGMji/peqvrYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BG6hpKC4; arc=fail smtp.client-ip=40.107.20.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpTBgfkS/p23kjXRJR5shURgJ+m0bCCLhVlMpGkl9HG1Kr8Ih9NOEXIF0IBuCFnqBa1cFxWJuh0biJEmLJ9npFUudA84/rEKuEYUVKKVJVUWkhEnIWthaAsuNKKFsQs6AADLbiCMcAM89xLRKEByu4d1mjKJS73CNMGjY9quvMPe4YFoffSILEjvLGgYSNmOSiM0/IVY8csNqZGbRDPvkup27K6ejXE88FQWImT1/F3K/AgC1W5x4CL2DwtwDUKMgA7mQ8/jE0MAGX0NRDYGv5/c9Wq6BE6QvvggZnl9bTn84HpjbdhsAF2Vx5aTxZWK1qiEYn3cHdCUIORsFBDgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQUQPzSk6lwtWHyQynAwPtRcQwkGUoLruTj17HUG9dw=;
 b=AVR4NAqKPynXFcCNusDXeDcEHlL2BLNkaxd4g7JGKQnV3Lt6l3aXdIk/bAOM/kEo9jOMthZCfjjYuU/R60lXwkiZAvFplDO25a+7jegK9YOTLtGOJ2wec0G5uBewV9lZ+LDX2kW642pyjGRx74eS6OQ1qmHrrgvwgXQgZ0aQhCB5MxxFuzxK9BH0XzRyEy5vbLetknqnDJHX/HlIeFzt3U/XwzvMBe2RvOk6ZIlT2pVOglcwtkVdBHV/nwtc5GhR0FBSK0O2X9olmRmp4cMNxe7Y34yHLT+7Ryxcb6TGlZW7yXy3ie6T/RpdfAPiPkUhbyHI8dyNwBzOuPEa4/HPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQUQPzSk6lwtWHyQynAwPtRcQwkGUoLruTj17HUG9dw=;
 b=BG6hpKC4N1MCfoDhOJ93sORlRqicWcCUcwpN2HYPrcSmgdQTl3diGMmmpt4Loz40CcFJGS35g6Akj59QPUS0YYG5TxIWFYUuMY9HutuPnF8CcuX4GrHIFRfIxkAOqbV39FAwphtMf37/9G3thLg7MJLekyv0Q+pJ1F+9D4hVq8a50qZqz/ir2tqmI0iQxqe2OY3vbwTUfWipul9iPSZBf8/9puc7m0IT2sEUP7B1fW7Q6pT9ZIaec2RdXiZO1nvyEQEiCO6vMzwXS9tkLxaslygnb0ZSV1jOilY/0gQR7RJmD4s8j7xPhyWprZbquHvjBCj2wfDAPvBJ9rxfwwupgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6878.eurprd04.prod.outlook.com (2603:10a6:803:12f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 06:16:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 06:16:56 +0000
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
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 5/5] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Wed, 11 Sep 2024 14:17:20 +0800
Message-Id: <20240911061720.495606-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911061720.495606-1-xu.yang_2@nxp.com>
References: <20240911061720.495606-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 20480720-c9e6-422e-2d31-08dcd2295666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DArKbWi037+kImz2dSjOZ1hkjaChgACukL1Gh9svfAAc7bW902QYYeGbDF2F?=
 =?us-ascii?Q?Zl45b24V1aQGPNtDXEiaPv/AvcOC1w7FCJ/inHvWqyeFkPq0r3+MicI6Ofc0?=
 =?us-ascii?Q?cZdcEwic8AipYRmNWPyCIkOGiRthBmCwiSF377MrMjmL5qu2/Pus2vsHKPUU?=
 =?us-ascii?Q?0eBLRBq5EtLYo4AwQNpN8Vw5EdM87sNGGagFoZ8bsF2ps+Fzk9nzGlRAO2fA?=
 =?us-ascii?Q?3liCczB8MoBSzzOOuF8t0gmUX3CUfE5k9wFmeeB7MvqHuAaWZdASlg8TNgSk?=
 =?us-ascii?Q?5TEooxieEJJadC/XY+rbYMI0k+NKmM3FCpBALjC4FBuh+fRD+U6WDtv+2HZ1?=
 =?us-ascii?Q?cWs7V0+6d1TgaEmRqR9AJcYhqZp7/wE3QFfdJS4C9g93PWE9deLwrbyLY0Rr?=
 =?us-ascii?Q?2AhtDEWDeK0jcFzX6az1aJKmsKWftvX/HNgx4LbfAe+I9T6jyNv7LX8JqARD?=
 =?us-ascii?Q?J0dqhnFShMboyFVCfCEct2LbaE9M+shvxYFs4NI7b5QyRZAdRqKZkl0+K3/g?=
 =?us-ascii?Q?+sjBPAK2n+B2ka4tmavaw07Y6YYvfCtjEpEfcGcgnGKpyll5fr+we1QVhXK+?=
 =?us-ascii?Q?tAY8eh0DXgX/CbOTO1zVls7A/Xw7vTnu0Io9h2Kcm0rgpDFJVo10PBCsDXjL?=
 =?us-ascii?Q?My5dvjWDK7x1m3v0mUdh+m35XKJftC2ZTLyBfw1c9nuuK3afNXUjK1zHpJns?=
 =?us-ascii?Q?qv2rM+EcuICTrFB4q1+EZt65KiGnaN4+MtveaVjCg0LHqayaJC18l5/U5HvY?=
 =?us-ascii?Q?/GD5pezy03veyT6Ao8MBqNUSOHmvLBPClKEk08NvQPYjO1ebiVPmzX9Ve/WZ?=
 =?us-ascii?Q?5EBT052HzFka+GNLWksRN3ODyVTHmHD+JwJHJ3d/gwXCg3M6yCGT93d0dbSU?=
 =?us-ascii?Q?5zBL9rWh0wMKYmQJY6xA/cipSmpyydHwJWA4O1BTSflChdBD1Z/KuHgZWPfu?=
 =?us-ascii?Q?CIxechS22AxjexLSBG1hhHf1y3VxQqHWP04bjqXnvNxYs8aS4nIppBkkSjQo?=
 =?us-ascii?Q?w6omSdNytr+ndbsmo4/LHLKpKym2qf1qwhWX30jlzyTNSTUloM/seRgFdytU?=
 =?us-ascii?Q?8/4/qHPznmhxwaGuErRyfSGYFrwHrQwZte3mqKUE0Xkgci9jGAtQ8BR/vTfb?=
 =?us-ascii?Q?0T3XZXblje+DXFHafWACJFNdJGEhqwiwpZ6xf7fPsqnshFYq0ys6ycmUDDzW?=
 =?us-ascii?Q?wcs0h1bsOehfgLGPfvyodcy3JnbP6CSNprs29CeuyWJ2Q/KtASXWRHPKXrDQ?=
 =?us-ascii?Q?jwDsgnKu2uM9ECWFgMkhTtMsPnVA/nZujBXxCoVesNQYqyLJt5cbu7+VKvo0?=
 =?us-ascii?Q?+df+CVWlGssz3TLAZLy0kCU5TDx8bGJImOZJJO5q1ml1SYfbQBUtFEJHYwlt?=
 =?us-ascii?Q?ve58N6UpML4+FRJJSvB0QIEjj2k1f4bszVvQ82UD2SLAjmx2R4imM93s6ON7?=
 =?us-ascii?Q?z1LAFmM5Vh0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M7s8Z6doT1/itCKui+LIJSvI0lyAcSOgk6ERyoz8W/gXTcD+axwEd4B50fqK?=
 =?us-ascii?Q?mwhGYk1PIXxi0oIC1Dh7lw9eL8cW/M0+uE+RrUWpNPHSQPlOxwCS5K/hrYk1?=
 =?us-ascii?Q?U3aIecgIud5pWdOSlt9tPkqdyioMrdXJRH3qUYuG/X3B6eIOhmuBZvZ/5T2i?=
 =?us-ascii?Q?gLmP4JFMEvDQtN/MsxgBBLS4i5VMzIKoq189cXryMZlwbuPK39jBRm3W/4wV?=
 =?us-ascii?Q?36PDFMT75/iRMlpFe1h21o2dIFtQB8v8JzlpcET/fxeUBPOuHznBN3N5RwME?=
 =?us-ascii?Q?GDL4nnb4Gvx3VDl/tUmD4jUO4mI0bgKzus4A+Yk9GVpYtp+4fqB8DzZNeTeR?=
 =?us-ascii?Q?mPfiSsbR6B3jDIRWnCyPGbImVOKOCaoO07df17zCpEIJvoFw4vt4Il6Qhf9J?=
 =?us-ascii?Q?CgothZb5IoJGgo7zaCqweEXfH6a6y7Bkfpu5PYcZaB6cPqu9mTiORb+IQiyL?=
 =?us-ascii?Q?KjNLwftDNyNtvox6V9ix97JOmgSd4F1cEuqEN6atGNsdst7oL+eiryOjtk+/?=
 =?us-ascii?Q?3Jc5IB642Q3fMrChZr5MBQp+kB8N1iWGgZVQJ+1qzqT1HpOvi5naNx+Mc+xa?=
 =?us-ascii?Q?ItT3kYK/xBj7cR18ayrwRWbxMPDDrQLZgC1OM9bSwRreNKLV40NVfbUnb6dm?=
 =?us-ascii?Q?1jvxFnd2O7LpJUYB0NeoCUzTbSxkAYfqSZVXTZPxbww6O8SSxMAvFHnDJ97C?=
 =?us-ascii?Q?6eD6Dx/bTObOyNKFy4gN3zaVCaVDFISAvXUGxf8ngJDs6yCQ15nbGfxSKZ+q?=
 =?us-ascii?Q?yRljazXhokstS43gtSd29woAqpCl42dWiN4r2zFLOTNWNpN9vkqDck2Cr/vB?=
 =?us-ascii?Q?RHVjXaK29AJAiAdmVeN0TzRpKoY2bIbseKObyF9gr/BHTDUJZQxUu9jt6Dp5?=
 =?us-ascii?Q?FBXQ9I+Y0DpIW0NguJzyL8mJSYcEsurUN9DAb+IEA9YvQeoNgZnxpBdPcMAg?=
 =?us-ascii?Q?pagnPfU19R1TycSYaLS0DcHPVvzfuXyU2l1OfzWkOItzDyn5Uy10/+oAmBH/?=
 =?us-ascii?Q?HZPmpfvcqWryOdK5BNaiBPtSlNBOS2BIVDTYeGVWEpdED1llup08XFPOx9rE?=
 =?us-ascii?Q?J+7L7u66Qa6t6sYGlX8eIOCjQplDdJwPwvcAsljAseSb8EeBW5N1BsWtVAHI?=
 =?us-ascii?Q?3ZLoDEEfquxp6GGiiLPSG3YycsfZMRC3yMwvvdhsEFHX0dMvb0ZVKzHERpGn?=
 =?us-ascii?Q?idvO7QZF1TuuRSr6aJRsItw2NfcrL/sIeI8PxGf1QD6dgYWdcx5z9lChXpL0?=
 =?us-ascii?Q?oIVIKFx7geGTnnz0F3DLG+x5O9KHQ8cXdBt+N4LQc4wxb+p6ZCDrrUt+YfrF?=
 =?us-ascii?Q?BTUELAEf1F5/ViwYekPc7O25msEqdZwmPrMu8lRW3m+UtgNvhKnKY9P9OtAF?=
 =?us-ascii?Q?Cmbfw5Kn8ayJa1k7PpIBSV2dmd+lA7XElHU1B4Hb+xM4hVAH4Vl+Mj2jFPZE?=
 =?us-ascii?Q?zDsEpJ5OSL04g80viyuEFfbFUZGXiDWIQ2PVj5I9ZaqdMNQIPqa6SA7mUZyZ?=
 =?us-ascii?Q?LgfXIWKRVDsy9jjwqSrp2Poa5hJMzgl2dEPb8+Feq7rQobvkKvD6uBIiq58q?=
 =?us-ascii?Q?ARnXHt8GV5dAVEdVHOWswn5cr44KQfeIFBK84p+S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20480720-c9e6-422e-2d31-08dcd2295666
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:16:56.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYXC64Kz1EfxpZfV0oeV8t1269EatoTU6ErXTv08Q9yZjsz6FKl29k/p6+L96bG6mE86Rf1Pg6CYDFE2+JTTBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6878

This board has one Type-C port which has USB3 capability. This will
add typec nodes and enable usb3 node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - no changes
Changes in v5:
 - correct nodes order
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index d14a54ab4fd4..a6888fdb6c0a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
 / {
@@ -99,6 +100,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
 		interrupt-parent = <&gpio5>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -128,6 +171,38 @@ &pcie1 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -245,6 +320,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e
-- 
2.34.1


