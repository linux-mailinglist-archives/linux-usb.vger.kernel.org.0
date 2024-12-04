Return-Path: <linux-usb+bounces-18081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 626259E32FD
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 06:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21FB8285E3C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 05:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BFE18871E;
	Wed,  4 Dec 2024 05:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ATasXh34"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FBF18872F;
	Wed,  4 Dec 2024 05:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733288962; cv=fail; b=UIiyT6Qt5QMyZWogtycZmOwwa7x/WndyuAJGwbtvVnvIWwXfA5HIj8ymeKMkfI191TojmoU5Kcw/EZN5hDOdNCcQV5YpQymL9HuUklsFwt1nAIom4fDHCubJCZiJ1jHmKoxwKo+tX3n3A8rvBqkNMCWsbcSAnKqCRmQ84CAcBO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733288962; c=relaxed/simple;
	bh=NcArKHhqijZ3zBR5EOzFS3R010SXAcOtW79LP2S+kcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rP7NTUPWC9Z/SbysPjpyyPul3nJeMN1mu8ZLJguTZl3pUTwwdHlCIX3MV4HXhfc2uhHwLzEP+EhnEJsDJwBaEcKeureUD+CxWYS91xtaiFTU7MJ/UVweo+0YHgo4EXvIhacZd8jCIZ1yKnrJ1n/cWg53Kp5DHEEQ9qLbIgCRyFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ATasXh34; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H74oHdKl/XjHd+FevOA9LhQj50dfN5ReYxZUH1sK9YI5t8M38uJMwteVRTCMXBAmDC+3+XWq6yV5VAEr3pT8K/VaarePHN1FxBW2a2WE8rjeh+cd4XamBvxhwV9je+7QZrGnZQgUbfu9Qg00Qg3emImjRrHuIkiklc7HIM+FKK3LtS7X+iE0qO9PATaj05W9jYAmHmE2caZuHzqKk+EW9L9rm54XOB2Y2uvDMt6PaPG9z6IwF2dGOo/0nvb/CaTZ3pqbi8B3BSURqxgk5F3nqLWputQN1im5IlwACllv1FcXlLoqg7L6wy8MJEajUEBWJdSE4MPeGjfMrv9+Z4oSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ucu1Uq6LBa13cy1DJBXpSyfMyV0l8vUPRjsUNVZGuEc=;
 b=BZ/ySGKvXoK3AWtoUh47kmQmQjlEe607cmomajZvKgeubmeJwYEK+3TP5BcaDa5j/SATSkuynbLZy0XMjrxwFzKk/sbubxVvGltqN1ePXoXLlJIqZHAgh4Tj205vdrokH+GzOI31mMa91EMHr6RfEIBZlUzzu8GmhJDEtswiok1Th8cYOPlkrwLF00Jm+dEv5Opdf3sfxKVONoRCoJI4OYCPoo2AA19AezCsXzoyFMqah40BCfJEEQ0WrWltU1OpCvuok5OIkuAC0jo2uoaROmoRkZThVk3UmZ5ZWLToJHMRwHTs/z217NqviH7cVwZrKbICUCGpJ2A/5zdjHvGSgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucu1Uq6LBa13cy1DJBXpSyfMyV0l8vUPRjsUNVZGuEc=;
 b=ATasXh342TLXfE6CMeqgGq1dT019rK86qylukQ0ymfQqTm7OetMhcCJStCf91OVaiy9BqJKynhp4HSpAyvsQms268GuLC8BX+PUJjUwQhtrv6D1vCbtnr0reZCMixUOTxLuiD1IXO2q70EzG1e99ypgSY0cN5TCNr5TQEefo7Y1Bq0/GojsKKZKL8PWj7L3VCHcLXPGN1LvcXWB4WDyJHIbM8tLETWfjmy7VXbkqwn+jxRuc3hB/BMFWGxnpw1xjwn148yvMVNEHt1uoWxND5393CXzqEh71Ouz6qF678rtwe8US62mo419OHBUNrBHtQwKHKPYM2XS3uc8x0grZvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10435.eurprd04.prod.outlook.com (2603:10a6:10:568::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 05:09:17 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 05:09:16 +0000
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
Subject: [PATCH v11 3/3] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Wed,  4 Dec 2024 13:09:07 +0800
Message-Id: <20241204050907.1081781-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204050907.1081781-1-xu.yang_2@nxp.com>
References: <20241204050907.1081781-1-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d4f9dc6e-b301-4ec4-3d81-08dd1421cd43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ITwXntoQ4HzqpBoG8wuHwm5SegPzZEJibmCP8Ev2XMr8MJ3vcaQ/hPsUy1VS?=
 =?us-ascii?Q?cFqnaqAoGcoMOz5pBTplfiFghyN5f5fQMv0zfGCMKeiinC7sRlBCTWkmYpww?=
 =?us-ascii?Q?I7bd6zYMMM7BPLGPpOJKaHCmwmr7v3GKhiyasenPECVXSxj9CAYa8dU9HA6B?=
 =?us-ascii?Q?ltn5UZckpQPzFDh6flJnuixxpZWamLIur0u312i24kWLihiEym8aFNd2pDvW?=
 =?us-ascii?Q?2IMgtwEGSxHTualbbiDH1zcOOYGlE2Q/F/al5VotVfeZQcbjcrGksB+pSGdz?=
 =?us-ascii?Q?lbox0hrDz9UsdzK9TZlNEF32O8fFwKdVuuAJkiXPUpMpao2b1KgJX2RH/GHW?=
 =?us-ascii?Q?KVMGDMsjYn2mbUNUEGS0wXostHtNZHxSufmHC9YBL2UFJTwsOkwm+VGNPNY2?=
 =?us-ascii?Q?aIVihw6g6CPQz+Ow1wJQUjjQ93jnt4lvzcg4h9bJfRHf1ehFJJGyYED3Hsie?=
 =?us-ascii?Q?rjOdG1FuyGWNRjVvI/8gP/LChcFwVtdXhuIydlIUhOzjiYRECpFvne5iGFTN?=
 =?us-ascii?Q?uXDZnoyvl5+HShf8H06vHGrLdRpCQ9o4C0+R+TNKhMMLhM16zwMDkkyDaEw0?=
 =?us-ascii?Q?MZA/9McrrwXWRjGOtzgkiQ3vQC4Ctrm9TSxfnJ4pMMr/uQv0k3tw5WJ8q9ea?=
 =?us-ascii?Q?KYP6Ee43vZzHZ978K6SjlkpJ7dUCw9+GKnjeRnbLzLTBpqS1MSB0074PcNQP?=
 =?us-ascii?Q?juOEimJsygblwlBphX2t/PJ5flVrqhP4ktp8b7aoAzhhKQdTPhhjCEWkfSVz?=
 =?us-ascii?Q?7SjgT7kH90XomJCSvjp4Go3HlBQsdUCXCdPTOvfo0FcIDlC222Y0Z8JzC+Qm?=
 =?us-ascii?Q?Px4gccoVSmHueJFDXtYu0+heC1R2kp+H/hVF4T8uVHfkKwi0B/IkOx06iH5m?=
 =?us-ascii?Q?frD7fKm89w6MLtMFiTccFi2JVgg3gZ8Gy5PLkKBhT5kI5B57AHqoH3kSnhEa?=
 =?us-ascii?Q?Dyx2CuSUAPeptJcszqNYa8lOZnRdedIlWiKv3n6/MIy8uyMeroJKHkK6Y5Yw?=
 =?us-ascii?Q?A0sdoI+jijGM6QiYtdBHYqUFaPJyzi70mrBzsDPO1+Df//3VAxSneV6qsZ1b?=
 =?us-ascii?Q?QqcqBF6gOoQKbHF7kbhn7KA94iFrd8dqJEgJltRfb4/X6KhGJfSdELpDXytb?=
 =?us-ascii?Q?GT+Q6jvS7X0MyFmUSaDIl+/0E8Q9pUsKaplyw6AH/MPgdPgvXabuLpXixK3Z?=
 =?us-ascii?Q?r56y/MA8GiqJhyWdS3/nPmiL79g/8rYeii9cb1ZNB702Rjneyj4Ui2gd68wu?=
 =?us-ascii?Q?FB+38ed+8EwYIiO4H6Smvd1DBs6SDNRPCdyBFIRfpnqXXcFZQurPXqr78SCT?=
 =?us-ascii?Q?kizGS3AJzfZ8h+Be0J1Y6PkSvQnGlUOrJfm9fUIOXOUutLiyJkpEx6PVqS5A?=
 =?us-ascii?Q?jjlmiguTND7gAv989VsDt9Ac/zMtUju0RK3sTcK36su1wkhRERupgRyLCjlN?=
 =?us-ascii?Q?LU27jlvbcq4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ExaJGOaTqKdtNsgz2q10NabFk6JAsXCyPF8eMfb2HYWF5pQj8GHZA8LPTakb?=
 =?us-ascii?Q?EwBTyMxT7an6UbwOE6GRaJO5ROkHM7lH4pfovjLUY4a3P/HsKNC/STqsAYwN?=
 =?us-ascii?Q?EBH6P+Rudxo/Izk2PNjnto6UrrKStL3Bq8OhKq35r+myKAzWvxcWk7/TcrKe?=
 =?us-ascii?Q?ocrgeQxXQvpVYhkLPLQ/kO4/9qiYL9CfW/yiyp4uLmC9wC2kkZ5TSzZu1Lcv?=
 =?us-ascii?Q?QxmEafU2cg4f7vlzQ6fZCLhnoconPjy5OBlr4i9oi/tH05Io8EbY4jHk7gip?=
 =?us-ascii?Q?eloGOTXnVjLQ2yq7tJQ1NHO0rogT5oFAupVrOuG4/ur7tcrLAzQpGRhJXdRV?=
 =?us-ascii?Q?bmc2J3lCNt4xQPj7NfMwV8sGrQ3bApovSLVd3vcHjbe14g7Dux0xAiQuEFSF?=
 =?us-ascii?Q?NMJw28pXZ20h9th2iMY81zoMa409BjGX+NQ6B6D4ztFR5jhRxYB7i6FvyN1o?=
 =?us-ascii?Q?xWm9wABIMOBvejxB8ZIH456sQADX2s1waHsXNImi4fO+DqIv+2fgk+pWeclS?=
 =?us-ascii?Q?grs/hteUwrNspZok3CHzbL6Z/7MrxBVlmdAtmu134FzCQDa2eUKX5pSjf4au?=
 =?us-ascii?Q?hH/Nd3IRmauB8gxzK3H1PaffIARQWIa1nmgZT8bzippUS7R8bg691FXp/CBN?=
 =?us-ascii?Q?4jUVL3vJet0Md3hRpF2NF/A67zuXARPs/yUQWZYMcI/svgIqa+XlR30T0Kne?=
 =?us-ascii?Q?wWuZdSdlfUXag49buotuFLYjUKcixRamXGfptpLA1/jDplC3jfbfVSL4ehq9?=
 =?us-ascii?Q?xNyoS/OvOptFsIxKnFliyZvMWxrM0g8XHiFTT2YO+33DlswSIQHtTZkwfyfa?=
 =?us-ascii?Q?jBuwZ0PeDvM+GnZ3NoqxPmgNOFazWzCNy8szZ3he0+phg4JLYFKzakwAkxRz?=
 =?us-ascii?Q?0MQ/ArHJsFMV5/6lsLAk2edtdPOOO2405obbZPjPprjogZya03kBoPXTDo8B?=
 =?us-ascii?Q?wbGEfXLu1Yz0GfAqzVdnwMsQqDvEc0Zz61U/mtJrRJlfd5bs4UkZqpF5FOxR?=
 =?us-ascii?Q?Q93bbEGM6pFu+6awgcBf1UNntGsqL5fGZeVWYzltO7FsrfvfjhK5XtrT2t2h?=
 =?us-ascii?Q?rc0twhYuccyyhItI6NZ6UoZ+WmbE4HZar3Ip0VsZI4RH9B4Pd3rf64rarJjX?=
 =?us-ascii?Q?QItnqcyyUOwEczguQc4WkFUwpg2PIWAX5LgXPbsvMlHUn6rg2KzKk0vlThpb?=
 =?us-ascii?Q?HP+xGQBWp3ZNdJW5n84ysYbdUWMc1+pcBdRaKRWAHZRjve4DYcff+u8GXSMC?=
 =?us-ascii?Q?I7bQm8EbNUsU8+bbBLBXswMQxTpmHiRwBBxj/6s9f+M80hEft+Kiixl5B6Zx?=
 =?us-ascii?Q?tJVyGgnqj6ZQIIMDb2sPq3qe56fZzyUaHNt9CpjroYN8ZhxZnoMf1870hxNL?=
 =?us-ascii?Q?LfiDpZNhlXreGlN7IDFRXs0GYmARFh6ssajHJEiBtSxYorpl489SsCD+XSNk?=
 =?us-ascii?Q?aiBlvmdH7AHQztRgBRnqBQuRxET2aey6MLVcEy+A7QVGHJW812fmY3njSRuj?=
 =?us-ascii?Q?wiuyNvr45vefeCb4dkaFmxgu0TtftB/MME83pmNk+cXS/wU9WIASev/N3F+j?=
 =?us-ascii?Q?Ft1IWMN7GYigb7J/Ar1uF1vLyjzzQQqHPFLtmfmy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f9dc6e-b301-4ec4-3d81-08dd1421cd43
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:09:16.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AroEbNZfXS5yLnDkBvntTuEkH6kS6aVd1t+niW5dheDolGpJ5/sLLhrx/PhHssWy67/mOJf4x+Uhrc70OWfVNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10435

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
Changes in v6:
 - rebase to latest
Changes in v7:
 - no changes
Changes in v8:
 - no changes
Changes in v9:
 - add tunning param for usb3_phy
Changes in v10:
 - move orientation-switch from dtsi
 - rebase to latest
Changes in v11:
 - no changes
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6086cb7fa5a0..68b2ae091279 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
 #define FALLING_EDGE			1
@@ -308,6 +309,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
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
@@ -390,6 +433,40 @@ &sai3 {
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
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	orientation-switch;
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
@@ -624,6 +701,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
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


