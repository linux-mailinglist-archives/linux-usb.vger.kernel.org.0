Return-Path: <linux-usb+bounces-14875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3C972A25
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 09:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7F051C217B3
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 07:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C842D17BEC8;
	Tue, 10 Sep 2024 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LlSB0aai"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888D417BEAB;
	Tue, 10 Sep 2024 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725951809; cv=fail; b=I4XyADSp5qf6gJRvW6av3bfrzE/v4SanGkta7fXBeeeh52V1d54q4OTRaYLGfouysYXNaJRMTiHZpp0uCgDorBkvPKpA0SUIQmczPJGacq2G2Td5mClNYD+Qc5m8xWm0EuKy1drW8jo4qTFqTaFIyX26Q98oBB2nP+xLfiHYJEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725951809; c=relaxed/simple;
	bh=smI28JW7G/dhHtMKX70FYGRvi4t5tQUh3ZCaAwdUOK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jCp7/TaZ0nQevf1IAbE844q8HzjsatOlEyEc2b2ylQRYNr24yPS7xoNAKo9/eecvJerPVoBR7xi9lHwal9x5Awd0Q94qfzWbrY86FP3dbJYAZShsx4CcZ/mj7Lr1dB/3sRXNCaHfyX099sEIk7lFCv3uzCPABOvJDnj/T9+395g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LlSB0aai; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKVB+tnZUxO7NEzdKS8936sFqBVYisKVcubW52yj3zwNQiVBDbVWVluHJl8tojl/eRQyqkDtVagqMKIxa+cKuuE9MYvcGIYSof4IR7Q91b+TqUWQZVwv4HF3o1/ZH0kpNy3jELX0YA81xP0hfxpbdbCkHQiL5H/le62wQmPi2Vv32Z0XZxOlXkXQX/GqX9tLwMOSsmsC9w/2yeIqo09k3pc9Mo4ELvcxKFxlKIGN4nlWxdAQr30pixAt+plU14ZMsFzOLLFAOicOdAcyigDPATYDWbITcGyQE0srYdNy9NNnm0TxVJREKERXOV1m6MQtb7+z2WuyXVpCq+p8flfylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UB+g6Y9ivCIfSOKB5q7xaHJAeN1teWuFBYHjovJMUEI=;
 b=L58mqHQpl+PMAEMd5Wo0V39D847z5y7pfwJbaGZlDLtYljkLGO99Bry3pHYRt0EE/1A5DXZXc9CfwlCAE8XCysqoV96hLUj9Vjgwr9OS2StqnaFZ7GvauvVmTml+hY332rV6OTPp0rQzu0gUwKZjMqIScA02rW5h41CtYiXS1qWNpX5ZY4HVE0/JV4d3u8ejrUmGGbScFhlKoc048nInkZ2uSESHsd1CkrN1TYTywPrZPXydSZKwF7tIHKJkq4Kejpvbl4pbYavqJsr36RTnYcfd7a2tofnaI9zbm4+YSBPboj2guLztTtBTXNwecPYlar+uvUDTowPuFxWQ560wmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB+g6Y9ivCIfSOKB5q7xaHJAeN1teWuFBYHjovJMUEI=;
 b=LlSB0aaiBtrvp1IOJ80dllA0WcB3STHZTyKbYgqGP7OmwA77Pgr5wPJ6HJdPbJIgoy4F20b66PxminxY3qeVxf6/xlbETWEhQrXvVC1qFkDVQhRnomVrJWK2bcpPQ35Roo0d2GpeGhYnM76XMint4jWx/yrVTcyXLtUeSbgL4ojYeU0k2aEdg87aVFow1LGWx1Dg9HZAm95ajS5kd/yyqwvNdag5uTNF5LqQuqflCOxX2NCHn3ocam4Y7svt6W6eBUiv38VkeeF8vhdAcuTyce0DFNdhwRY3JEhZ/vgrzt6/p4lUxuafOEsjbpZtc7FhGN9IoGfzdw3G2mRq7yRLfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB8PR04MB7099.eurprd04.prod.outlook.com (2603:10a6:10:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 07:03:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 07:03:24 +0000
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
Subject: [PATCH v4 4/5] arm64: dts: imx95: add usb3 related nodes
Date: Tue, 10 Sep 2024 15:03:38 +0800
Message-Id: <20240910070339.4150883-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910070339.4150883-1-xu.yang_2@nxp.com>
References: <20240910070339.4150883-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB8PR04MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 4304f3f2-10fd-4e52-dbaf-08dcd166a9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pP9QkXcos4B95Tu1PLE5Tb9LquxKspIZtuNs1jtU4Oh65ZoIZMaDF6glIX8u?=
 =?us-ascii?Q?wEkqEexOWacyoUsZrgbnnzZ95JvFL4yA+KHPmP/wyzRH3SNjrfnMee8NlSWP?=
 =?us-ascii?Q?6thg4CXPonx6ZaiIVQm/lUiW8o0s2xiOlt+4OO03zX1ieufHKgX9fyqK6fVW?=
 =?us-ascii?Q?xBLb2P3cTrbQuk0YYAHzmFYGaOkv0miPRpUACuX8iDqQbrlvrG9kAdcPvqNf?=
 =?us-ascii?Q?WWSeBdYgVdw7m2bAI/Fjm1q0GX+KQN1MtWFNjUP/P2DUsQygaASkeDEx/3KV?=
 =?us-ascii?Q?HZK3x/IFlv+KbXL4+3Q+50wfLSXiu17IVIL8KJ/ydIhJ8iKARrag+nWMmgsS?=
 =?us-ascii?Q?rwhuU0WMZuFd06f6wciTOrMDINZYXZkBjkI7DJmskq1YHCWXFwsD7UbwB1rI?=
 =?us-ascii?Q?7n+69AL2PTwJXUFU6i1OzGZy/gfb3isVMcx4Llz0NPiQI96G1w2NsI0+FfHr?=
 =?us-ascii?Q?56708IkoJmvrip41ni2iOQH/w/+7hKijsrTmT0ShMqRacyW4rPXZLer04/uo?=
 =?us-ascii?Q?uJPSrTo9M3gSKo+O2uHFVALQyNwI/yvUPH4LscTZLQNIzK0RRSmfcQmnqSPw?=
 =?us-ascii?Q?i9vjVYaONod2pl34oWLPwrH1yv5dHORBgFCZKTv8guUF01p2wYL+rNCC2Gq9?=
 =?us-ascii?Q?4/1ACU6Pcbmp7NdTN7ZGXCIlrK8QnidzGfQR7afasIey01sjsxZ8x9p9KFP0?=
 =?us-ascii?Q?5jr4ENqLFOhTVnRI7w0GcOyJZNlehcU6HTiPwTmhI6CWd2hQzFtUZgJik9Bv?=
 =?us-ascii?Q?KrO5FNJCTqGUo0BPk+uDNRGgsD8KMfwLCubnC2G0murUU2CUPH1dS2QA26SB?=
 =?us-ascii?Q?JVCCyKFl3YYYBRfuAiNE8J5Q2wamAfNnyOXoNIgy3pL8tbzP3vqkRZ9JtjSn?=
 =?us-ascii?Q?QIrkow+3Kr1p76B+sNYe1XRipe9JFh8q2+mSnDzKGlqGe5VFJQSm4zwll+oi?=
 =?us-ascii?Q?iEb/3Wad7XOPZOw5fh5YwtKrwhYaDyxTbCbnbS7jubTVJguK+aMZVVqHw9xq?=
 =?us-ascii?Q?nCbBkNaHtaoZrYr3Q1p9KSv925HQ3Almr7KXyHcWeN4MMLz9s/2fnpkseyg5?=
 =?us-ascii?Q?xQ9y6s+/J0YDtBC7alrs8pLmIQ927SjuSvhaiS8h4DsEHNCUbdBci0kVx61U?=
 =?us-ascii?Q?ireL2MchGCdbIDyhRH5IMWaG9gxXRyoHKzx8bicAYuZC6B3LnOWQfVrzzQ+b?=
 =?us-ascii?Q?l7bk8vOvlYBDgPw6THwneFjJTgdqSqfdnBi1nG+r4HXj3REclQyH7gC/D36H?=
 =?us-ascii?Q?eKMeOzsL84SH9k3+VQmnL/KEAMJCiQsCtROx1ql7t+L9Si4uIvR4RK2P9cAb?=
 =?us-ascii?Q?NOhwpJVOCx9Q3XQdnT46FfchDUDZ57Yl8v/xtE5PuLKXJcvT6EUBWRbN1Zm+?=
 =?us-ascii?Q?6keX2ygxTr4c4hc0JQgBobLSo6wR0BMCPZ9pEQ+4cAJhQ+J3dIXgnFdTbcWw?=
 =?us-ascii?Q?svl08kDooGs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PXdU1d/qX5PiwwuJr27Do8kdOWVMyoBG4lRorr1yT9LsNgm7rw19mDEgq8Hu?=
 =?us-ascii?Q?yb2xUve9ztRQ7sHwxfzfmzkK/vnOVJHynmh4P0MYPsc3AeiKB+I/SKP4BE5F?=
 =?us-ascii?Q?T5K2nu3Mv0qR/ZlKPN90l2C+ZFVSiuYUyVnaiMLdnT4jS3mEpC+R5hIj4I1b?=
 =?us-ascii?Q?9dvMWQ65TPkW4gHOGgi8rk/TK+xyzPKzLhnaIZ2hjVfNqR+7mNR3kC6ss+kX?=
 =?us-ascii?Q?RbtfRHdENifGB/eI7+SXH+04XeAEtk3cXm4wjODADOEx8GrG+3W8GJfeqoGG?=
 =?us-ascii?Q?QehD0LQpOglidJ3akOHuTk8hkHBTGI0FO3pqiC5NiqO1fgCnensYTTDOgWWk?=
 =?us-ascii?Q?HhVnXHZe+g9aLcB0eN1xaFh4Ccvvm4vOLFnxACgSymyjkpouDm9hhAYXBYY9?=
 =?us-ascii?Q?qJErfD9BHkEFsNqqd3eeJo5mWKbPvX93EHOtfNnrv9hRMqtGl/0cX3vk+UG1?=
 =?us-ascii?Q?ZPqxZgGArCI0FPmX+lpH4eh05zsZsLK5xUbn03iy+3Jbk/bpVLrJhSdWJtiJ?=
 =?us-ascii?Q?KWqlVRcFyI1pXBpTpnKGHJ3NuCmiB50da2rvodguYjvEcnGeYdjEmTW6NBHo?=
 =?us-ascii?Q?PQmPzHut+oLciJAS6yzIkj5t+1jICLNOsKMlnxZxKySpthAMot4xYTqhLD55?=
 =?us-ascii?Q?DM8wHichablbbgTBGx7vWqsvmBHIv2cJkFnS54jGu3PFY/tgqSk1TdPYauct?=
 =?us-ascii?Q?F+EgCLqVdNo8Ea6mWLmfIH3VlIxlwah29qbAIdmPQ/dzh5aMfKwybLxjQlQ0?=
 =?us-ascii?Q?GcSoeva15/XUiZn9JCdU3zgmx4fKvy8IviheWIxomprn7YDfaLNkZBrEAfbr?=
 =?us-ascii?Q?yFydeKIG8yJYfRP/qGtGkvMfMkyK2i6vT77Qpgx687i4FigX8Y3Cmyhio/iv?=
 =?us-ascii?Q?ChJU9nOjL9qOHy9+cW9XXAhERydH+7F/JBQgjOQ/V78xTM2UaeuAZ56muWwA?=
 =?us-ascii?Q?luDkCOgLdbn3EizLU50T/xmgXJ+VgvvFYQEX6taUAc5bYwprKKR5M4VrS8T1?=
 =?us-ascii?Q?fNTtzVe6j1KmrinWJ2aL2jZ5Au5LcU1Ctk69VTiaDMRTNnxwknaJ/tt8y3QE?=
 =?us-ascii?Q?6ACqE+qKaxYbkwCvH1IspEUirqkZkOf2zTKG9WWlxlyQlK8g7uRReeVjpnFz?=
 =?us-ascii?Q?/q+01/8KDYZ8/C/vSV1QQfe38+qq7sk3E5BHyBrl77S8j0YjI7Y66gct9pEC?=
 =?us-ascii?Q?Wp+8YaJnqx8aul5FWKkzhQmcAKi+45U93DEDSTatGbt/lJQtx8ucIcrbQAs0?=
 =?us-ascii?Q?QAxnhmewzBhSUhpE5Ws4izJwE3EXXQxP9nRMO0fuXDkjkfXCohkfCdvjOZq5?=
 =?us-ascii?Q?WwuRLVdZ9ppMAsey/u0hNPKX0KPkNdfQPG/I8bmMEs5OG+6N+RBLxKm6gf1z?=
 =?us-ascii?Q?YHPR39vBvNMTMmreQ1TyI3aaGHuockRT4vLV8O79K5VdyZIbxDKO5lPOaDdp?=
 =?us-ascii?Q?xamFC7enYStP64at8Z7BmaCPx86wuX3nU9GsyPkO0caigYm5cnhCNqEnhhFq?=
 =?us-ascii?Q?H+JdwTl1nlgLvOoyzUrMEVCBlbHDokTTv6+Jn4NB2o9TDzJeiryR0JMXH58+?=
 =?us-ascii?Q?jsdX+YiI4jBeTIFkZ7IQ2Jrcm6NZ3lxBrS1qaj4w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4304f3f2-10fd-4e52-dbaf-08dcd166a9b3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 07:03:24.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/Y2isj89W0u0kqCRDszicSdBLHtju6Rx13zhnX1J374lN5ZkYnYjC62VHzaS4fhXNHpL6b1bvtWsa7I1R40MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7099

Add usb3 phy and controller nodes for imx95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - reorder nodes
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 425272aa5a81..2377b3ade95a 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1188,5 +1188,48 @@ pcie1_ep: pcie-ep@4c380000 {
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
 			status = "disabled";
 		};
+
+		usb3: usb@4c010010 {
+			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
+			reg = <0x0 0x4c010010 0x0 0x04>,
+			      <0x0 0x4c1f0000 0x0 0x20>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>,
+				 <&scmi_clk IMX95_CLK_32K>;
+			clock-names = "hsio", "suspend";
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+			status = "disabled";
+
+			usb3_dwc3: usb@4c100000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x4c100000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_HSIO>,
+					 <&scmi_clk IMX95_CLK_24M>,
+					 <&scmi_clk IMX95_CLK_32K>;
+				clock-names = "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy>, <&usb3_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+				iommus = <&smmu 0xe>;
+			};
+		};
+
+		usb3_phy: phy@4c1f0040 {
+			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
+			reg = <0x0 0x4c1f0040 0x0 0x40>,
+			      <0x0 0x4c1fc000 0x0 0x100>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>;
+			clock-names = "phy";
+			#phy-cells = <0>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			orientation-switch;
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1


