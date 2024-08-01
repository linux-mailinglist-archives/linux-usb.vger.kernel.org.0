Return-Path: <linux-usb+bounces-12814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADE09444BB
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 08:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 857FAB21931
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 06:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FAB158558;
	Thu,  1 Aug 2024 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D+sUSVmm"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777251BDC3;
	Thu,  1 Aug 2024 06:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722494937; cv=fail; b=h7PXfAEWLHrkzNtuESValxQ3e3dejErk2XdDcmBkzjQxcSg1hzicXqdW9vVKOP28KXpUupOXsIoDESaIZkZCiuP1f5rEUCfRzZcgwB8HjOKvuqQHYAqaDLoBXyqc4X6glU7YZnxdr3mZe+LLF3Oo0GCQFf17POFWMyfGhcmjiBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722494937; c=relaxed/simple;
	bh=N0GjfV9482mBEdHjtQJp623i0aGI/fXuajGCYmTVi0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F343PozCr+Tj4KL3g1AmUpHCNy5V+TRi7pkXyee68t8NyNgr2ADGl1ZrtnIT+rIsqL2pU1VGlviERmXYh08dvOkoOlyZaSA4Mg8GdmX7JGrGTba3e7T8fGn+yWwmBIugd9UYb7grWjGcDfICw144DHbYwHgz1hfB2U2sCAKkRiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D+sUSVmm; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/6hiisXLGGPnOp5TbqSKCO5FWOXX1bKrMxIVbih3BSv0ez3plIxzVkJibOTAy7KIaoqfBKBre7lkoU+rTVF0sBizrScVVfl2tQ2JowbHXeeghSwn59xPIuAbbS4mRI7Vj4rlOvgmgsMY+Re4z+Zfs4HyhdWFiprZhTIAR3KzjcmZLsfgFT7KPqWe1pJQ7fOyV5ZGZh33QBth8qmIuXCDlsady2gBa7HxwHUllRGw+no8SLmBXw6udFiNeq2Q08o2Lm6xVG75XCzDSk5A+x1If/x2oEMZBNMOKOpMlrmiXp3uBKRl6p3/dNfVMjogGYTk01Ai+dZ3m+7OwiP6as13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85WtmWXygpY1Ih2kxJ+mMaFCcimv54LMoRZLqTQvFmE=;
 b=uvp7zKC90IQePeM39PuP6v8IMdUlmXwa+GLn7wcbjgzhFWVYTklFS0Qoaf47lGw2Zedx4iY7YaHNliCoIjeU/+OuHZEYHW9/rt8dl32oQ1rL7Tsaj0y7aEU1qidXIQ34XO8mtL0ZwpaI5wLSrQXgk1BZl+OF8Oswrk7TMU3QNfwmxuTgd1e+vBtAwyfkCXhAZ9TtCNWplHQw/1xS6xPb3e/zfm5hw3KmNO5vO005ZW2AHibhvfRjAEEpNVj4KmdtVo4twxjMbvljg0QU+U9NMIH0YOa7A0X1zs6jiHTYrsKMprWRrGJTt27Bt+wj0TU0GXCcG168inIdhSdL/IZ5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85WtmWXygpY1Ih2kxJ+mMaFCcimv54LMoRZLqTQvFmE=;
 b=D+sUSVmmBPcw/XifFL9kvKQDUfRdvVU3a2isC3Bm1OuHfJ4wJ6omIr5elfKJH1mz9WlnoUqy2V24UBUY1txjBYve5U3Tb6NyaY/9EPV/lwa7I5RC8W1c+XUeVBGKVEL1LT+k/sIYQKZ6O8U8DdFR82ZtSGW+g05z/xSQHCuITZ5jnToa+/PvmabUefaUwjHEZ2bj3jSS3XYPe2Rf0C3uLMlmysjj75t+SS5X0iCWY7UnVzE3yU9phDV9CchSDu1TgvFUKuYvpGZqjoa9V83wedBVLugQmrELiK0IVNLMAjzYF2i+FxApl3dTHZgQ9dueMoF/zZwHHVgQmk8kIkfpuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8732.eurprd04.prod.outlook.com (2603:10a6:20b:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 1 Aug
 2024 06:48:51 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Thu, 1 Aug 2024
 06:48:51 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: andersson@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH v2 2/3] arm64: dts: imx8mp-evk: add typec node
Date: Thu,  1 Aug 2024 14:49:06 +0800
Message-Id: <20240801064907.3818939-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801064907.3818939-1-xu.yang_2@nxp.com>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c5b271-6678-4edc-cb27-08dcb1f600b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jbP7CzR0y7PybpOEc6d1dgr327qHclCMEM6tiB0YEtOqnKOi0b/qG1cgXedJ?=
 =?us-ascii?Q?8Qp3gMVmMFu2eTVXDoowM/IRBOchtHFAARNGTFsiz3YcQ+Dpai6o7fusKuGK?=
 =?us-ascii?Q?EsQ1dKCAq8INw6ZvPD9GPO6IFzbs72PXKyk/ZVbMNO5OUjQb9sthLPRCckP7?=
 =?us-ascii?Q?jz69ANb2b/D9dztfCeOqXoHlfRr3QM57ibp7clu6fYpgg6tyVLlZeR57d+VC?=
 =?us-ascii?Q?c2dbuXf7mZdYh/NoaecjHoPHnkS7Ol8b71fcVw4Z1FhIc75a4QzsCCs35cgS?=
 =?us-ascii?Q?d9+gURBh/7fGTZ5b5tXfYbH4SVcBJwrnsXhZV3nuG7Ejl0xAtnfN+vtMJhTk?=
 =?us-ascii?Q?dKTTpL+OATRGo6hzlOAKpiXSjcy8+/rV4fGuPEEMhFmdd0m9cSf2AZKpLmvJ?=
 =?us-ascii?Q?rcsJqneeTgkudq5Z1fUJC0irgmrefBedHB4E/xyysswomEsLr9oTY7Tj5Nkp?=
 =?us-ascii?Q?zjZ/LPuSWtCFDnzNMw3OxJ0Ych7pWb/sBL4IVlPOL4kWTQbidrBqR8KAVttf?=
 =?us-ascii?Q?+Dk+T1O2V3Y/1UrCvvQ1PakjXTXLPGn6LTVxHFmu04BB1WfUze+gkfnhSWJp?=
 =?us-ascii?Q?r0wDsi3M9EZazR731h9130Mb2rPE7J9eRHTW+wLTAemqwTF2B+SFkYEs/+bd?=
 =?us-ascii?Q?qixo6rqk0Ve2jWS63P1Pp8AHnB67qaKEtL/OK2Z+Lim2D6iu27pBynnIKIVu?=
 =?us-ascii?Q?6ziZvQbAa+IRwp+0SGJY0MkU8b6jYv7f/eAe96uWjuNjGxpsTXi2KaD9OOBT?=
 =?us-ascii?Q?GxhLPR9OmPH4x7KbSXU7p/jlLZMOCSYynN3SXGj3xhJUCc9fqBH2kaO8t1sG?=
 =?us-ascii?Q?Z4+7TQ7BYVLbnCJjVi0QkpoSZk2xpnFixLmgcD2iAUbQrNb1p5SxLuFtIWBh?=
 =?us-ascii?Q?3vxL9I4GBhLVdnweHPbSrbS1+Yz0uKJOKGzeY0IKRsGRR1KtE/sXYyemDn1h?=
 =?us-ascii?Q?X86d1E81G4FmtJkkl3NMwpQDowTkC8PcSCgFng7/BuD3T0NNyi4DE6sY+Vp6?=
 =?us-ascii?Q?psbSbq9odG5Xfvf7Yv6sxx9LjHCtVBpPpusUObzeIXyuwXkKDHzMN6F4I1xz?=
 =?us-ascii?Q?/UdlxaV9c0goDw1hcCwyLCEUdz5U8UAfHwLewDo5U/1HsWaGehm1dPav1X+s?=
 =?us-ascii?Q?hQI/qSZbZRKbh+UKeuvHaVhigA/3yJqeT7U7CN37mNKpNF34Vx97MO+amcdc?=
 =?us-ascii?Q?GC77IoSqn6rVZE8RzEW+WfX9IVWGorH26y0AKn5xYVHsLjXYFmDL6LdBfY2P?=
 =?us-ascii?Q?NpINXTBV4Afv+eIrcstizylJTLTcn4xPc0Sqa33e2/sejTeNzZF96LK+slMr?=
 =?us-ascii?Q?lHJYn8OyuNE6fRDf3fN5/iLLMBDmV7oU97ZyeGXEBejmYo90xxpCN8P720GX?=
 =?us-ascii?Q?hPg8/d5GJwYclNZCEVP0pTor8w8Gd0qjGDPhEAE45U8LTY96EA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kIWJSqjalVio++m/O94osq3Waj6GSOPYj/1/MAfbi3XX+Mn1mc8YMZ4TRsw3?=
 =?us-ascii?Q?f2/S1l2qlMPsc+RtTDOMPxmw0luzFJ4ctFHTzOBpbIJsY4+76WsVQuEBUzcu?=
 =?us-ascii?Q?Fr4dOV/SukDGA+JNTLEB81/djLLL3iq7FcwSS7r7fa2+IMjOz/viSic7zlSs?=
 =?us-ascii?Q?IfvxSkEbSAuq5/CU/aWiJT8EOnlGYPTW7ZsxuIOKt3v207GKjU7O9XQ4rvUx?=
 =?us-ascii?Q?nFD6lSoMoPn+4SpZYZ+31DGFflWtgZbzTJReevqTCwcSPvIAhfb0tvBJZ02q?=
 =?us-ascii?Q?5+K5WWWgYNwyHWj/NNewnc1SX5bKojBK+5Wz/6YLMkzuiPF7VWCwn+HjKPY4?=
 =?us-ascii?Q?jFwjCPiFrkSStSCVbkTENZxnAaKRmF9yG3X4wrwo9NK1JV5S8rb32a3Kt39m?=
 =?us-ascii?Q?keo5CvFlyNtFNLFmcj+u+kygX5yhES5wEqHYeUoeHh31QQG24x2WQvHO6W6C?=
 =?us-ascii?Q?5RZY9AcZIxQ6/oXZHl/zdbJcGoRx/dXtvq2UdpWouW0XLsgDmlxwjUTMhFyF?=
 =?us-ascii?Q?IovqUb3+63rDmkakyezzWMnJZkdqWfuJpDGxKacMHecxM6+fgrmikAJLnE/I?=
 =?us-ascii?Q?N+BuSu6KfOEfHsLipornbh56clSpVPTfuzZUSKPLeNt2wjh7gq2hUMwE1Y0C?=
 =?us-ascii?Q?TKV0OH/Ew1tDGg/0YDzZp6jBMDx5ulbAnt0ryE4VvAJbpOIF7yxA/cibg9B7?=
 =?us-ascii?Q?nPwCKJLY2sScjg7x55jNSLLfjej73+1qLEKzNIasRh/cyayorwSuJ8Qsskai?=
 =?us-ascii?Q?lAgMJrPAC/fgMwubbsII+6aHXJoldSricHxTQVkMuwmOVHVEFalP/u02Wr+o?=
 =?us-ascii?Q?r2EOO7dBooVFVmrj7//iZGwatI3AQY81qgLGhX18EEeKVn7z59Z+mSbYf5o3?=
 =?us-ascii?Q?YgkxY4Rtq9L3ZbNSbBzb3slxdTei+DmThjm31pX7pLO6IT7D3UFLdThcrroU?=
 =?us-ascii?Q?oD4kbTtb99Fy1vREsoohAXUUnOUm5bH6HQs3v3Z2uPWo3xhSTBRYWAXw4sWH?=
 =?us-ascii?Q?iD/kaLXNl+uDdXVCmr3TNq3dihxiocNis+oPs0i0cTOshCi4TahMobpE+Cn9?=
 =?us-ascii?Q?I4dYyRbC4x1vVwniK84kgQVzS2gL6kloEqnPddjK7lkppIsPfAa7iw0zQIuV?=
 =?us-ascii?Q?sLVETqHOSuv/eTx73/JaLfR1EeNM92GHc8WJC5P4Q0p2p1zyU6JySrvRisEx?=
 =?us-ascii?Q?XwUROS5VYXutBqWyJrG6DWmNt/E5ElHGyKnBcJ5uNel4ZF4OVtNDGAD2YVet?=
 =?us-ascii?Q?yrVoKBVEFAgLiUH73cFcMVXZ8opd/WeHFqz0u4YoD4hzOYaSfFumDLlToHzA?=
 =?us-ascii?Q?s5LQZN1i3n22uQbhHQ19GmlLzIfToFWjkindQO+b5XvoH3yc/mrWSee2K/SY?=
 =?us-ascii?Q?H539k9po94t4Mp/EDywY5Bfo2k6C5WC2q4y3qcU1Er+X8vzy6mfVC/bic/48?=
 =?us-ascii?Q?f6YtO9OJ3672eEIPyEVDc7xwtxVqeav7x7IMdhxnZIxia0g0v/mkstoyEqbv?=
 =?us-ascii?Q?RSyosgs1kvM/zuGhR3yEHz0Em0Cu9PIi5uqHFxyZSQShaY0Mo3UHEBB7/oFC?=
 =?us-ascii?Q?VDceD6juRUAsi7v7j+/nY4RXl5sd8F5OvmvakTNF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c5b271-6678-4edc-cb27-08dcb1f600b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:48:51.4597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bBJmSR+y8wOaDbBlGtbv0LHSFRYRNngVVzDqXbG1LGIZR7dP+ZKNHrhJbXygdcnLjBRC4UEiWj3FsCj8j2DiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8732

The first port of USB with type-C connector, which has dual data
role and dual power role.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify endpoint label
 - fix usb phy tunning property dtbinding warning
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 104 +++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 938347704136..ef9b821a0ae2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
 / {
@@ -26,6 +27,20 @@ backlight_lvds: backlight-lvds {
 		status = "disabled";
 	};
 
+	cbdtu02043: typec-mux {
+		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec_mux>;
+		select-gpios =<&gpio4 20 GPIO_ACTIVE_HIGH>;
+		orientation-switch;
+
+		port {
+			usb3_data_ss: endpoint {
+				remote-endpoint = <&typec_con_ss>;
+			};
+		};
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "hdmi";
@@ -535,6 +550,49 @@ adv7535_out: endpoint {
 
 		};
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
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
 
 &i2c3 {
@@ -704,7 +762,41 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	fsl,phy-tx-vref-tune-percent = <122>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1120>;
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
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
 &usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
 	status = "okay";
 };
 
@@ -986,6 +1078,18 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x1c4
+		>;
+	};
+
+	pinctrl_typec_mux: typecmuxgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20      0x16
+		>;
+	};
+
 	pinctrl_usb1_vbus: usb1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
-- 
2.34.1


