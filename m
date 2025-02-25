Return-Path: <linux-usb+bounces-21001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBC7A434BF
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 06:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D555189CFBE
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 05:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5894C256C60;
	Tue, 25 Feb 2025 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eA1SdLmY"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201B82566EB;
	Tue, 25 Feb 2025 05:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740461955; cv=fail; b=rUHgCZ13BoChAtVElc3PsMZDi3PxYw4SSKV+kRGeopJim17nNy4e3fBpzqYpnQtLX/Xk0bexcmRDa9422PL7WFUyzgtO4ab0OWYMPsmhzHfjSwkttS9Tz97uqPPVmXccF0f98Dxyhzcu5FwEwh4cXJyAdHL2qvA3wpUCcz/hktQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740461955; c=relaxed/simple;
	bh=G/ebx4sifgzd1Rj+an/Cnxj++CkvU6arqJQTE+boH40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b1gC06FTTIPUYwFKZaY4yTJe9tshEsNoHF1KbZ9v5Ig2Kem4Rd46YqXYrxdYZhxyPd3dFzDRosIDW087mXpsEqPB4r4plBI1h7mdiChxVe/QanbApfXDsG5b8Qz3SrbvDR+5kI7IAju73jroyZ2DM1rkzjuEo/ESF+6psfY9jJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eA1SdLmY; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4+QYPKSfhJbj8bJsjMaNyiWMj5pu1OiCfKT6epYWTQqJDMWrt/UGyiJ5nFpoQIcrvNcQPlUKVXa0+nVdbQl8tNMjPXWiKiE+Ll+7NTiWCvEttjsfiHuwqaIViEO8GvEvRrCTYSyyHTzTmLgWkWlCmgX0FkCBb4QfPtrCE7YY/jINQJ21+EX7PsIBDMuj3FI4pkoghnpYseT51Ou5yoFOwqsLwL7PrXylj737VUKZe/1aS1euOKlLaI16iCwRJi35gaY6+QjfQPyNsXn5hprunBWWPFcCSXxsvVlM9FAO4VsI3+czcKqtNPDTC55H1v66lNYzk6bpxnVa6ZNfJNquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9NoEPk4mKgK6CJ5Ty0RpwxKLcn+9Ep3IgNAEmlBsvA=;
 b=P8L4b/k8+AQJPJe/Z8iU6dnH7zI6HBREG55sYsQ3UN8APP6E9oKUS2UEhvDrK4iyuitpyZCHe5UWLaZDFl+8e+UZKZh+BqvnYc7kwPEVrClapOD0AWbX0QELN/BymQz8Y3tJOdZYu/auiP/ZSBx27gZgtqfXujBLLdT2AYEkWjuEHrAucOh6I1++n9hzZFIOzj0u3vQi8GAkGZcfXeNdEoZqIfZQ3dmxexrdXWWcABh3Ohb1l0701tmJ8lSxipe+cLWvu6v9TT9vGGTIH6l2sW9pKCTjOLwqlZMnVKLljDIj+MDRy2vZtmlmjFUGQdCHhZPCe+f+jov+Maf/x5XjVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9NoEPk4mKgK6CJ5Ty0RpwxKLcn+9Ep3IgNAEmlBsvA=;
 b=eA1SdLmY6lM6xom/2zi1QlcKM+0m1rvfgNzVO0VitvSov10Va+FJmL/rV5/TUvky04dhTXJGoBS/uTP9Y31HChb/UXSaGJKZjg2xTF5HXherwQke/p3XdeHLez3ZZQN2BzGhnQ1okemeuXuwYdIyraLcmEi9fVFJORYFJ9Y7UMZFJbr7K15v4hKkBFv9pUoZKEupo11ralOQ+SyO81ae0XUcgW/AgGsugh2uCa3JKRxZTCiaKNPrys/UXGb7x+5ox8kpFSv/OX+hSCEllE6icoAfr363mJkHDOZM14P1WB/8jMADCu6nKCK5iydRGs9uWa+TZbh6NHBf148FYZGqgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB10714.eurprd04.prod.outlook.com (2603:10a6:800:26d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 05:39:12 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:39:12 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 5/6] arm64: dts: imx95: add USB2.0 nodes
Date: Tue, 25 Feb 2025 13:39:54 +0800
Message-Id: <20250225053955.3781831-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225053955.3781831-1-xu.yang_2@nxp.com>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI2PR04MB10714:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c80f59-d25b-4928-3623-08dd555ebbb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MwNqnZrNZrE5csOMIEi6xWi0IOz8RzHbNbqxrTaXLQsKHsnDStUaR4YmCJ1D?=
 =?us-ascii?Q?1Up7ViWLL3ewUT2vDpSpncjkfyQmkgUhuvPL7XcAeDpmITGyUdaleVJGnGTk?=
 =?us-ascii?Q?zcoGvfW78dLzfaIPUJdFWl/UTujDhbj+dAljfNOo3j24+lm+Ag5FypGLDLCt?=
 =?us-ascii?Q?Xlk+y1NOYKbSa+TcW64lWucfPPKiGyC48B8X4FtNI0zVSvTdLKsSkXdn6KXF?=
 =?us-ascii?Q?drP/I3TCSPMT+tEyTyI2vdEEW0do2Yh2SDzV/tMQmowcYQVjpole20xPTz7I?=
 =?us-ascii?Q?aZUkMLhXvzel9F7+KDgKTg40rZJSmzhyzjzVYZjWhRZoiiYW2u8hOdCBQd0N?=
 =?us-ascii?Q?ySR5tAUpWB3FtAW1C4INnZaJI4WPlI7esj3hYVziw0kqenVMbCNqVRmu8f92?=
 =?us-ascii?Q?bEW0GnxFB5XkpaP/c2CCzcQTDlFYhE0395G+ivwVXekKbkDyczJD/oA4rub6?=
 =?us-ascii?Q?BgHRNwoWVXmpvGypTBUF9AQiSqLTjpjFyFJexiG6P6+0CHPS8FiyyekZgTS5?=
 =?us-ascii?Q?fASjQIGLFn0N4RFvNkjHpyWdD7cLwwg/1TKiU4BGwTPqbSA6NX3cBlUJmI+u?=
 =?us-ascii?Q?Lg8w6p+PE1CNTwu47mgeTXyzjTCoDiiTYK6TdLoMOQvNnrUp0ruw/d5mrNYh?=
 =?us-ascii?Q?9AFwvBD1BUXE9SF6drKtQ1JFEhl8aLo/u82sEd7fgUAtAuH9+puqgbPOMNUR?=
 =?us-ascii?Q?e8qQlOo3d5PUEJkT3g2Ahs5WBMH7dpo6WYlmxKY+oTTFyMJuvmPOJlY4lx9G?=
 =?us-ascii?Q?2m8mS221kHHF3QCVUP1Zw/1dhShV80KEu7fEXUZFa+tCDrUaFPlJN8uT3bo0?=
 =?us-ascii?Q?M5HtfJe/vD+PsmIS3Du068bmxmPkx714VLyNLe39uuJBjkLcwuz/l7cruMO5?=
 =?us-ascii?Q?eURunA9hIWF0zIXoHdxa0RoQ+jR1s0kdu+9pxgnyI1HmGAV7ITkcRkKVzPWc?=
 =?us-ascii?Q?XLXYO/niN+7dCBcnTfnRO3SEHaEkds/H75ZqCEtW24Cdt8tqqaU35rhSN6AH?=
 =?us-ascii?Q?9p4SZsxyEOTDh8UbQTEXLpP3GqkeUZTNMR9WbPWv50nY4YogXinkj+2Lehh+?=
 =?us-ascii?Q?IEbsWqpOnlkXx74TrkJwRx640pJm8r6qUJ8pDYWq9PlJqY8m58AnfLzPxXvp?=
 =?us-ascii?Q?KLzKTg30X4AkaY+cLPop2WWLpQK7RP0YexkSG/QXAQ4NmVe7ye3Ep+U3F6i+?=
 =?us-ascii?Q?3GuMjRhJUXiZ/x/phzWmXGR91vbYKOamnNU3UvEeP8nDL9QaCsCwOrlEdLHR?=
 =?us-ascii?Q?qOji+NwXRB39MTwBKTZnhZLscXya4GtNrtpBXH2est+O1iEDTkP7qyzvWGDT?=
 =?us-ascii?Q?2VFK6h2MQCpg/+xnvMcU8ijWSGsaPkUeZe7gUo2Bbbsf81I+xvbjL/j3PKZy?=
 =?us-ascii?Q?VDYEqoqWuQmpCzzTFYp0mkkXqlNBaGvBAXCA/T6YMxOVZVBbTP77HkziCUwD?=
 =?us-ascii?Q?bUB1FcrUoXFcCOB0gJsg2V9wYKkAvXrn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sO1uK1dAJSlHhdIMwXisSJ0qTr1IpgTmSYXke4gBTWdntY5jxK0jgIzY3KwE?=
 =?us-ascii?Q?0sLrxfdhsFEAGbIK+Dm5aSWxS9gAp03j3Hqt9THko1YO520VcQpQwA3OJtJ3?=
 =?us-ascii?Q?nfvhWo8tx9nDwNWqY/jwAdmM1HCdhFca5NLOLAiS78KuJHDdULKaX2qeb88N?=
 =?us-ascii?Q?5kQDHByNGYl2fYAtxAFGK3/VvZBDLGC1kFjr4C1HPWNTZ6sntfAGEL6cci42?=
 =?us-ascii?Q?OPeCGGXAoRb05Wv4Ne/nXMhAvO/5LXy+9b8KbsJ3Pc2PjSGhXK+GG8rPPgnx?=
 =?us-ascii?Q?NhMoFoV+9w7MPkp9FPuB7Dy49gi0dGkCKsezr4p+kchIkHZR8IHSfO4i8Mb3?=
 =?us-ascii?Q?xpFhUbPUicFXkrcqTfTU42X7hNQ7NTowa0Kg4I6dAiaPl4SCEkrHsCnmGHzz?=
 =?us-ascii?Q?5LmO3FdPURsIyfzZl48VgGSSJYMCSdI/suH3Dk2DW6w8rEDf16f5rlIURbun?=
 =?us-ascii?Q?bWxJHsxUf5dTees2rAVg5X6SsUPLufXmuRASTCRmqQRYuvdZHO4OAUzx2mpl?=
 =?us-ascii?Q?XZQkT1v2PEcSpsNZTO5fNjy94bSlZokzHqctCXT5duuYfIvHoAwY/wtzskJM?=
 =?us-ascii?Q?YSPZE1M6l5hOV5njV6feLenKM7vh/Zi/68JbjigQbo4wXm/5qSyR59Rc8YtD?=
 =?us-ascii?Q?Vhitb7Vs1RjQPglfN0RPu9hqMnuy2PJ8j2CXIoA/YV2P//H2dDE/qGgcuom2?=
 =?us-ascii?Q?hTJ4C4EBzMeao4QfNN0zt8e/D0ZM3ZBIKIYajptNhR8ImPXqfDds/ctOvqoN?=
 =?us-ascii?Q?DKouHSxZrf7+wk16Be3RG+C68R6i3b5Z2rVf96/wTwfXyVx1howD7z3jPrZd?=
 =?us-ascii?Q?nlF0Yp/PvLdCroMXqBBXc3g7Qe99o6fTxOd2sGCLpQib0Nq8HPZE2+vwvN9/?=
 =?us-ascii?Q?KhibeVfkZHziMj0HLmSVpr2v08rUm0El+/GawO0I9Zzfdxm1WZ0j6/wlU7NO?=
 =?us-ascii?Q?f56GPnU22DYiYhA13+7kZ5Nyrnbh5GBFUh1DYY7DwxiOfCsm3YiCEF6HGP/l?=
 =?us-ascii?Q?CC2HHnD4NLavapamEfNfN1Nk/OuUbBoGLDetTuqm8sfeOcUjEAwJS9jD6/mb?=
 =?us-ascii?Q?xC0TuJIMtEBue9YBjXhyVVWTmEpjEojyPzgND47q0/VBa0j6KxDtEoh6d8uE?=
 =?us-ascii?Q?MHPHd49C8U7vKaQT+GYgQc6sVRBTOuzaPK0pnVYJC6qP9lGAfuiFBU3/y4hl?=
 =?us-ascii?Q?7d84/e4FaLQRW0DYCrxwSj6INKs1bqV9Giok91cQdMNaehFeMRKzFoYtZLm1?=
 =?us-ascii?Q?5huYkY4OZu7VeBIRddxLaSS/xQvcQHzrvGFc3UkQgrm0okZme4NZAdahl4SX?=
 =?us-ascii?Q?fwDceSHBNbZP9nDKUT1MNlrrWWuyFUr9cHnfLaui5ttfPwXtWQSuPNkl6sso?=
 =?us-ascii?Q?r+YtHlRbyUNiwc2J8Ti9Tk/8CnzBW41oo0mILRCB9BaotaKIl/uDoH+wqRSH?=
 =?us-ascii?Q?SVRD4AvgMj+b3gGWeJ6LoS7FVVuyvZ0cjwm1a/pm36SxanglKIHkYwMmP4JX?=
 =?us-ascii?Q?Hl4TqVnvYpsIG3UK5uM4MJjQtLtOKBaIVvPDmnRhf7yb+Dnbs2gGC+12TVUg?=
 =?us-ascii?Q?85gedR2FLl90NmE8reVQBU6D8dNCF6l3wDszK23E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c80f59-d25b-4928-3623-08dd555ebbb2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:39:12.4193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqqAXRGARPB1c+wlgKeNNUbIPIZIITb6xbjhjOOq/YL2yrol/zuLH5LeYWaghP3gIgnp3WuKuYdKf98d81yxZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10714

Add USB2.0 controller and phy nodes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Rb tag
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 3af13173de4b..48c2033971bf 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -463,6 +463,13 @@ its: msi-controller@48040000 {
 		};
 	};
 
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		clocks = <&scmi_clk IMX95_CLK_HSIO>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1579,6 +1586,29 @@ usb3_phy: phy@4c1f0040 {
 			status = "disabled";
 		};
 
+		usb2: usb@4c200000 {
+			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x0 0x4c200000 0x0 0x200>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>,
+				 <&scmi_clk IMX95_CLK_32K>;
+			clock-names = "usb_ctrl_root", "usb_wakeup";
+			iommus = <&smmu 0xf>;
+			phys = <&usbphynop>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			fsl,usbmisc = <&usbmisc 0>;
+			status = "disabled";
+		};
+
+		usbmisc: usbmisc@4c200200 {
+			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc",
+				     "fsl,imx6q-usbmisc";
+			reg = <0x0 0x4c200200 0x0 0x200>,
+			      <0x0 0x4c010014 0x0 0x04>;
+			#index-cells = <1>;
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
-- 
2.34.1


