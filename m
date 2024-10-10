Return-Path: <linux-usb+bounces-15976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2209981A9
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 11:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7ACDB29A41
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 09:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4C31BE86E;
	Thu, 10 Oct 2024 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cJG+9+fI"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2089.outbound.protection.outlook.com [40.107.247.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8D11BD513;
	Thu, 10 Oct 2024 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551255; cv=fail; b=hB2pWc7vYRhLEoDfj9NqMD8Gn/vnfXepRINQf1sTnzoEfvXCrVb1AITRmdSDhKbIfdYHDsohCOfSKMWY5jZTdtCQQnlAKMKeaPRrbj38ZJy56geyESTemPuzp5TaJWtSU5y+cud06WxTJI/uERMibdNVMA+YMYXDSCmPbFiVozs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551255; c=relaxed/simple;
	bh=8ftqpo6wevp9jZUTCsiMiurYmcPMOdNLbCsxlzB7hVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Eb9MHClSoiQ/h+gjl73d+DWYfHzG/KjzYoyldrZqq9XSjFvp8pFRppZ0TvBPt0xWvLU1sbMSRANTWlqgh0041hQAo9qvEdHq+3UOC/t5eOnpQZUn4tP+vj8zYsL2o59ExAvU3q1w03iVJE1vjzhuiIqxeebz/H9XFWBFxWkQHJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cJG+9+fI; arc=fail smtp.client-ip=40.107.247.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZVzTLE6LclBL8zaHwR5LKp80YkAQrWQpxcQgpWfI9K6bgMAYgH1yucM6uiqxp8yzLI1ooyp42wcEgijv7H5wVbkskkDKAslgSsvxMuEHtdXAhVcNohinikWclSZgDdW0xuX3VFli+oiUwrVpOIXtgnIb5BaSE5YUWIxvfYzpXd1F//fq/2YyTWjYdKyKPd4nXbcBUOtcn+ZUK9rwkikDJS83tXoaKWUxcXQsb0EelMdTyF+DpSw7Qf6ck6ObIuX1oS/vV5alwp42pDJIHXJP51sfVpFnLy8wvttMQFYelUs5tnY19DkxEnGGpklgv05ePi9cpzSXRsjZoAl+5CUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+rsBZZC9zmDjNjvXt7xFGOuzWt9iuOBG3EX/9IP0Tw=;
 b=HQnMq8Zkfj8r1VJ144JjCXzPqO6ZL7RiW5pBUpzHqsa7q+Zec0L//IN4BntcbThXij84ykOqtXEntJ+ONZWw+WGZCO3FxCxmSzGMt2Qu7UBpHvdmB7OfHuNLtpu24HWftXPF2y1lEsN7BswmWH4QuFuerxdc3l8/P6Fz/J9fbwMJc/ojn7i6/2SatFDmJSA9dNkfsmX8/1bQqipR3CjW9IPijKbHKP4YnGwwAEyLfhaNycvT8nqG5qPk6MO3DDeLPgwmASJTrepOy7OI1k5tdnzn4+MnKBeLqJtDVEC+6hTL+bY57Yk+ZNJ4Y1/7tOzdn7ZMYdxhm3e8ibmVwzsB9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+rsBZZC9zmDjNjvXt7xFGOuzWt9iuOBG3EX/9IP0Tw=;
 b=cJG+9+fIMMVAnEvox1Evvs8ggW9FU+uoF+sdWTm6CV8nTyhM05f1DNOqdmwFQgaNMRNz6U/548GGd/LB9tzaQkeCiCqLQ1hjCIewhmiWYqe2J3FtgnKLNJ3Ascouzh7jeeYHmTux6gX4pKNeUlhCmTsoJqHvjKJBmF2rwAjl17UkCQSItwUTA+DoBFxKW8MrTkGIsO4ggdKfZYg0LtKBiwbyt78sFWikC1F1B/ShG0bxJzd7FGTmmtmxdBLE6XySm7uum2B9sf7LwIKEwE4IaUNWfHO1xmAaInnO8erXqXobKDYy7LI471THzVlInoTsINyEFsuVY5nc8B6x+OznLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB6851.eurprd04.prod.outlook.com (2603:10a6:208:182::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 09:07:31 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 09:07:31 +0000
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
Subject: [PATCH v7 3/3] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Thu, 10 Oct 2024 17:08:22 +0800
Message-Id: <20241010090822.3915064-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010090822.3915064-1-xu.yang_2@nxp.com>
References: <20241010090822.3915064-1-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 56d5c188-ef15-4143-1c23-08dce90af877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6WVUlBfhDeesghbRrjo4VPwJUQx18FxdiGvxUxrUYKm2ZFfcNFGjtWswudZd?=
 =?us-ascii?Q?yRC1au6cmw2CK4PTkQG7ikwVqaAnIFO/5WqhhSO4dJ71XboLnJoxp5/92QJv?=
 =?us-ascii?Q?xQxP7eA3gGV3ex5aiJH0U/RDzOerRyhSswlf5jFBboeinsdZn9ygbz7BXkXn?=
 =?us-ascii?Q?rbi81umZg8Jb4yqnj6HPXY//KcEA5Nw61A4Chw6Lx2ISZJSUJemkWXW6cJPv?=
 =?us-ascii?Q?KK2ChkueEcjhp3BmKMzsTmcZ0G3/fcDxwtZSw5L6zKodqBrBEnyq2obwwArr?=
 =?us-ascii?Q?dSEuJIO3262lzPBDILmjA1T0a+cLc8XrwpHF1vkyiPWxIPNourKU/xE68a0N?=
 =?us-ascii?Q?rBiXqTrM9Z+JtnIRV5ZbfBQzWvAoUkIWEgo+/Cjjx/2OYk1LoFniLKGHficY?=
 =?us-ascii?Q?X+ogWuwz6babLYsNiWjS9Calb4/oFlkEn0HGTXUmK0zCPNsVIu5CExGx5dB4?=
 =?us-ascii?Q?HWcbaHJOC13GE0vsoJEQf/6/ozn9ItYVPXXabKoeGK42Xb7Y1pY9sNam6HXr?=
 =?us-ascii?Q?kx8E7Xk6ANlEC0a5HDNZQOatTDAwWyJeybL2hqQlcVfzftLFIswLzoIm8INo?=
 =?us-ascii?Q?Ev/aSsMk+/1DCD26cOhvjzBrJsMcO+3ZYbZ2zKApr1ctLz/Cp4Zl8b+EumM8?=
 =?us-ascii?Q?DpuwfoMq+EEI/K2sjLhFeRDmGv8J26zqIJyvANd5YDiESRrJdZycUA13O2B3?=
 =?us-ascii?Q?6lbrQsFCNgf11BmJf/p+m5O//1TH9/913bKDL7QBpilNC6PqpEOI6XZ63nKn?=
 =?us-ascii?Q?hhJZS1Mj5ELMviKKr/kXnoY7pvQcWyNFDfrlzVp96PXzgHoKjN6Yt9oNQrrk?=
 =?us-ascii?Q?ZdrRPYBeyyu/OeYlF82As6BQ4qLeBex0hVK/wJcuKGuyK/vpeC0FdVCRNpeX?=
 =?us-ascii?Q?Z/aJheMw6jYh6g8Ax5oCZUkDgtLxIoRJ/s5ytLvsHzB4b3GNxzCbHsBolC4P?=
 =?us-ascii?Q?jAhXC4zzlO1B0RTCBDUTrcOfSH6fUoVu3RDrd3Q9SfHCC36SBUE30j7Lpr2J?=
 =?us-ascii?Q?M1vVFQZJgdKKv08YqI8r5SH9xKl/Q2S6KahZO+21ZKQKYndSkYhuwy/adO/N?=
 =?us-ascii?Q?tDsbJgmVMNGXHiAs/J8NBBqDqgXJg1+eQS4hnVPILmaHeegrgkO/KTtwE2y3?=
 =?us-ascii?Q?JeOdOB3Hoq7S3mMy+P4lZBzioyBrb61ucb4nnWCSqejHJM6MUkS/zFlPNQCf?=
 =?us-ascii?Q?uEO6O9h5DRWBcFKjotnoQGa0iQNv2XsO9ylTbcvtFZzh8lUyMbIRvKzWRpyb?=
 =?us-ascii?Q?QUryM7rxV5B4iQlYzOGYPC7gcRpaWu3FbGtN8IqNUy2Czu27hy3Yc40TspZw?=
 =?us-ascii?Q?yD1/6AMWgcTr31gagxEz5qBG+ibuqxRoZdh+glK/yhJDrzhbBQx2wnL5SB74?=
 =?us-ascii?Q?5L84+qQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TL6mP/hlhbSCJ6R0zvNI3JYyBxsa4jnqb5pvzJ6i2j18YMNiOsN0DeCmdUqT?=
 =?us-ascii?Q?Lx/eHoWIHLf/0322GGt2QSw03DOBZyjL2f1BBv8GaS64JanFu46gY8HTYVDX?=
 =?us-ascii?Q?vEEBXpoXWbL8cP40o0AlLYrzUqE/0Fw6rM/JtYb2vbdYVcbQpEf6MnQm0Bge?=
 =?us-ascii?Q?SSLlSMA0f8FpZyvzBdpEQSZYf++dAn1xkRX+aqT/ZruaFRZcKqzo8XUYZreS?=
 =?us-ascii?Q?hf7xi+GBmSDpLg1C7HVWEQAhlqZ5ZDYxzwsgnY/9mVzlczJUp2VcQ2SbEioQ?=
 =?us-ascii?Q?FlOzDKh8qsu4meouScnPk73e8DEHkn8CughyKen8CiQR2vX/AXwRki9uEeMs?=
 =?us-ascii?Q?g4WsBZa79TudFCTbK7gSw/er8Q7iIsGuX4kJPxwh1lcAX22F9elEZ3qLm3oI?=
 =?us-ascii?Q?l6NEMs9jZyO0j/ohg4QgnlHxxs7aJKVJyA3L5Yy+PmUEtEkB2FlKHyVjZW4z?=
 =?us-ascii?Q?lYSF22KdUQvRi/15VEhuuokh9ASHSBNxF36c/wQG6MaRuVUZmGtHU5TvsYBW?=
 =?us-ascii?Q?Kyq/VS90tuOEpje4gl+Ff/rlRcPlhr78TSAQq8M8wqvUWH2aw/PHMMat9cuX?=
 =?us-ascii?Q?RZlsay6ydMUViIUi1GQd7j/mhJEqJ1NxApkGFS+OA4Zvn9hE8vpToRLoBqSq?=
 =?us-ascii?Q?eIJmy+4UQ/xKQFzcYUkwDRsa2Gue0V69Da75LenErMKqP5KoppQlSxquX8fT?=
 =?us-ascii?Q?zPr+e2aQJjrjSlwkF/Am2bJ5IfwzwQO9EGfkfStwr3/911Tkcwmytvhh20Nd?=
 =?us-ascii?Q?yHxjyRl1nr/ZOKHhNYaR38sSLFLuBRtrUXmltoUPhu5C1TY3cPeIZXKW5THG?=
 =?us-ascii?Q?Wk56tdgUn8K0JUTnBuvifQHA9RFCf4AoXYEAyODaOUjXP3t7mhageh0YPm96?=
 =?us-ascii?Q?YoYrKujEb+7DG8mcj106swH0PKcR6Yng+/UzxHOLjJv4hxq9FTJhje0cvijk?=
 =?us-ascii?Q?99SqDo8SolxlheNAM0r6HAx7w4GIHHqfvZmL3KYM9hYttXVP5ysHlNUdoLiN?=
 =?us-ascii?Q?gKbymDiZSSH8nqobDuNMxthqkvU3L952FbeIBpEG1+a+R+WEM1sX3tDp/Lnf?=
 =?us-ascii?Q?vf3/IA6iPBLClhEWbDrFTVB22eKxPCsHAtZASJFfgM07pXB/hlJFT3fjXvY1?=
 =?us-ascii?Q?5J/Pc87+aC58dKtPF8nnSqrOXMeKgV4oPY4zYv00EsWoK6dBjEiSFAQXEbAN?=
 =?us-ascii?Q?Bevg8J+JGqMIQIRuCWt3WpCUxT0THcV1gooKsfOkD0i3yd41wvtB//QD6PDe?=
 =?us-ascii?Q?c2ctkPIvdj8mEFD+tzbK+l5qoNJWdLLHjCfZolCbFrAZiFDeQFNDKzW4K/Py?=
 =?us-ascii?Q?BLTytI5Gmlt3UTk6yepopzYzaZdEEzEJW/SOcd5HIclZ/lxKdBYwzi8kfulr?=
 =?us-ascii?Q?kf/DJnvwWP0m1Nk5HC6NZ5lq5dtwbj5+hRzD5R9d60NveOzMqC1l8eaUVSAw?=
 =?us-ascii?Q?q6aUQoLXCvR0Ovt001IkOqlXLzezVwvMbPof0SRUOzWw4QSDiRaMXNnpd5To?=
 =?us-ascii?Q?kGDfmIDSHuSPwgk1TWvWUPR3gePLnKH/s1OWffVJvGgkdl0dOAmPQjp8ToLT?=
 =?us-ascii?Q?357IIbo3Z1BI5+XqgYwF+PRe8K7XBkU50dP7TpBY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d5c188-ef15-4143-1c23-08dce90af877
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:07:30.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS2Otkssn7HMmC4UO1hmEhwroDfwiUAJPCd7N6yo8d0Kk5FRa9sI3LT3Q3upC/Z/ERGIqOpnHYz2JP6Blu0ZKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6851

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
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 37a1d4ca1b20..41a4ee4751ed 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
 / {
@@ -250,6 +251,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
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
@@ -332,6 +375,38 @@ &sai3 {
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
@@ -538,6 +613,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
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


