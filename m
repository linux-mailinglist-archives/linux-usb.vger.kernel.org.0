Return-Path: <linux-usb+bounces-5253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D588324EB
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 08:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93A3D1F23953
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 07:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC685944F;
	Fri, 19 Jan 2024 07:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hIb3sLfX"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2050.outbound.protection.outlook.com [40.107.13.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08306FB1;
	Fri, 19 Jan 2024 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705648424; cv=fail; b=VFcqTlmkkKMMKYVeu4BlX01mqx25Eu7RRQuiWSZsTUyAfrg2JQi1mjq11U3XYdkHli4de/LLhcJUeJJBPNIajDhb4NeCSB/3G39BZAmM9YwKrself6SVgXLqT03z5w1+eXcBFOHlnhnzQymzt8jOPwbvfGgjkuaxvJ8LWkbyS7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705648424; c=relaxed/simple;
	bh=NGdqsWwQHAEW9n4PUGWOHwKFReKRqFiei+zIzDI/2TI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JOKAQFIxbwrq33tixs24NDeDLFXtl5zwTsmjQtWAwDiAtGJrXslyLIJyxsfhXIgyrDU5GZ+fnDiPmAObKkJ5I8D8KwhJ01D0bRq5LwQ1E5ZDj9enK95MH61nlNEQVQdVHrN+j4QzMgWNjreBHrgUNGvOxgJc60rFzGmbEYFgPHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=hIb3sLfX; arc=fail smtp.client-ip=40.107.13.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ex1xlBofN0tFA6nvxxcCA115rqvtqZwnLIDU37nzvyibpO8CzAho0Z7YW7/l4Q74Pd+XAXY0+rocoftfuWdDniLNszjk0Uhb8OzrOBsr41KrY7sU6nK/uNCIQ7Cb9PWRhz5TxysBz2/3lqiqRgD+BflRfw6aUAacBfPlmkF+v5DAPr36HiPfxVnmrCTahr7qKxKlOCn0QTfp0sAiND3icABaOA8N8Mpnwb3GVaHd0/mw2v5LmQIJCxoleXXJYjwwVHqojtI1kjMHDIF9qWTJDkPOs+B7sq1AIfp3QodAEl1wV8mNfPbnlz7qRgEUWCI0p27v1I8AJVCuV74X/TcE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhSRMY23yVBtKkq7EVou1L35ZmTub9FQjU0zy+qCynk=;
 b=IcAAks/HZBb3jn4pl7J/j6iGoZYYMezYF1zBJvypOYO1xkUK/ICTmam6yc+A8s2B0mPP9XWnuXZMleEIDy2cYt6/ACHpPZ8ywoktsPJvs/PLE0t8UnwRzvzDnx4vW/pV/ahdgtdip873dqTq0Ma4fQ/eEH1kf/Gl89EPn9us89jACPjqlXymdxAr9IrxFHFlDGy98YPO9jMPKFGn3Nn4WZVrjvhM4vGUQ/Wdx9m/dK9jrtNxgLogZi9wNJdAgwvYps2h+Eoa8ebjx/n/XYUx/nZK0i6vZvwmYNPjAOeGx9SB5UDAoh0Kg0uAqxyUpDhdJCDv5kbkZ4gIy1x/GEL35w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhSRMY23yVBtKkq7EVou1L35ZmTub9FQjU0zy+qCynk=;
 b=hIb3sLfXMHwKraBQZYTm2s2sWhYRBUT5icNrV9+bBTME2AuivxpAw0yK5dT2pGRtA82FGuZnXXJmqjrf7ASZUel5xt329GARGpl3Yb/bjkapkMEG8g+dHJwNsNHih6dJO002sgi+h+XWWi3yEq5uVrm72cfzfDKO/EEJBAHrssM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 07:13:39 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 07:13:39 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 6/7] arm64: dts: imx93: add usb nodes
Date: Fri, 19 Jan 2024 15:19:35 +0800
Message-Id: <20240119071936.3481439-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119071936.3481439-1-xu.yang_2@nxp.com>
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0dd06a-2fcb-4425-538b-08dc18be293f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qNKAbF/GFJ/Gy2y9fjCh7kZXbZdg8Ia+wIeciDuB2+1KxnhSLA86rSkyP+exKXyBypp2oi9e3aXj10Nc0hwFPxkThZNCelhAF+x4OnDwsheVOvZzhrumIm0tIFfwrSX9NvvCoptWROmJ8buvSVcboL3aiDmvmxzsqoxNxUnlvOEZ03jdJnlx2AKECMaewoi/kN1Qv+JvhH3ePhoUekTqluAdbBwc8yVVOhXcAhEAi0wgIHDiw9H1zNtE2ECfdlKl7vx4lIwiK7Qp8nzz7ViVsQuF/5xGAqytl6R/MAo9fol0/a6qw7t2sTRsct/HGQNvONm2/bD6IEPbtj26k9A9BXsF8niV+iYk8rwilUTl7uFsL2a8glGOm1pMrYW/lOEKLaPwoFc+r9bCtOILmoIWM8f4DQZQoMv3eToEDOJPJYRbFeMvA0+CuYXpsjy2wsU3OL5wdM9btKlGs872g+wbuWlhAnBTcCHON14r9ieWPfSc0y5Ogb4VIAfDSNjhBE91c9+XihSVOKTYYMRkFkFLavButmcrC16zRhGfcwpjM4peg35gFPY1eIqDQkjUpQSgJg5xxUeNMKRvq4/agxrChqGe5aKmOx1glzb/85XNdaprBWJH/IbAsM7tb5HeoiGE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(26005)(6512007)(83380400001)(86362001)(36756003)(38350700005)(4326008)(8676002)(5660300002)(8936002)(6486002)(7416002)(52116002)(2616005)(6506007)(1076003)(38100700002)(66946007)(66556008)(316002)(2906002)(66476007)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CRNH3bFvu7s6Le/M9j4n+wDODmNKtwEhwuoiZ4y9Nov5EYmIuXZl5u3NrMqU?=
 =?us-ascii?Q?vFlku8AnzOMP20NFwyF8v908KWBp5TiWXP8b5usYSrT/kqXL4u5xMg5SqrN7?=
 =?us-ascii?Q?cNPt4s1WbsgXO9arrR1fGV+nfzlCa8e94Oih7ZAhoMzZ0RCaKHikX42bZhFr?=
 =?us-ascii?Q?kJ6rq00Cs/Vp8g+igJlkyIX5HUTWBjPft6bTEsV2YZPuXWIyZsBK1BOgzZBJ?=
 =?us-ascii?Q?wsY3d6tVBHX4moYRd6itxwfd4nfeRJj4D0j+RBK/M4f0cPzXEgIY3fpF3/JF?=
 =?us-ascii?Q?Dy/YhpVFCS5h48M12O0Q+FACA7I6l7005qX6zzw7kR2QiKHdKSWLw4j6OJbp?=
 =?us-ascii?Q?uHBbQZPy5nVa2cDy7r0qa565NBHTfsiMX0wDXC2bOFp3O+cxGEeJ57PEW7V+?=
 =?us-ascii?Q?ebkyOy4off1FAqnSMc5p2IvJV90EHeIQY1pse0rO1yzsZ9k4BGE//Gn/ULhP?=
 =?us-ascii?Q?zEe2C8adEPYI8DrmUuwJaiNUOKHuwxL7kyci+5tbIlzLVSHuc5wDI/sQ9pQY?=
 =?us-ascii?Q?U6dhBGwhLEEjzQhcYShJle5arkDM7PhLjqDUivhsEAXoIzjyQEy11MBwWcL5?=
 =?us-ascii?Q?PxX/eSTm3+AFL52K+2teVyoRioT4fMUSgkVlnqCmkRU3CtgUtaG160HJ6s6M?=
 =?us-ascii?Q?Dv8LOlvG2Tq6Vs5BnkYzqpHDvBY0uhHZ3zcMa+gCZVKq6tct+Fo2h5/batus?=
 =?us-ascii?Q?dsw6X3uDVBl0jpnnCIGfRSEhgladVvILkPb8+Hku/3qxACQTxgG5Y50UreSt?=
 =?us-ascii?Q?m39PIs87XUk2HTuaaCwMFeSWxdJBN2MA7bmGeFLJSZAMcCo4hOQj7EqLS5GR?=
 =?us-ascii?Q?8zmC2JWu3jLFFVFBZarboE6R8xxhnX6XKvTUXIlS0U/+pC0yPJPuRviQQtvi?=
 =?us-ascii?Q?h/aRIB8prlBvKnMdSjakaedFcHjP/QYoU1vGG/WlQcat81USKAPF94YgQ3QZ?=
 =?us-ascii?Q?TrFFMqYjVMS0onCmsqfMMzMWBypE2Y9MWi3kC4dhr+p/A9oss6P2CNffbbkp?=
 =?us-ascii?Q?CCh5P9MQeyoeAhu9oiAx4frsLXvfeL/vFRsaAE6xGPP4pJEYI5y5K9Pfsru3?=
 =?us-ascii?Q?azVr19orK/BP7kdYHAZ0wIrvIqU8utpCglHWQt88SOYAySf92PF0EBeuFWmq?=
 =?us-ascii?Q?uYfgBsaKK168OwamAViy5IVM5KZR2JZnG/F0HCfT+54pIX+Kqakf2vwRt16E?=
 =?us-ascii?Q?8zz3NoOGQf18AaqTZdG18yZSKjhkpEBAtUMr6pb/oFSWqCGLazWHeu1Wc1Fi?=
 =?us-ascii?Q?oQtsJlZXYe7lELM0g5EUyzANo7c8UvL+LPZe3Vg6npZVC/C5K/4kTqccU/nn?=
 =?us-ascii?Q?PWAfZuLFEtzHJoeL1clHa9+73mzkqg2Vi8t6MveLsQPHwcXUrGyEgL3Uodmi?=
 =?us-ascii?Q?s2BLTQHG+6TCmqcAXBe8mtVnGRfWvPIONO0h5e1hpbQRbLmTyzJX1BVyWqNQ?=
 =?us-ascii?Q?CBvNpYH/SH56Y7hFNL4+ECBp9hra5qi4zh6BuQGypLTP2sxbGYa/LCx0q3su?=
 =?us-ascii?Q?A1eh8ZKcbmGbd1htGvKaW0U8lvv0d0yfV0PUBbH/D6xk63hokXqQu07y63D8?=
 =?us-ascii?Q?wf3Uvhf1sgHBri9tFJTYZMXTuJaelXQS2yg8X/+P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0dd06a-2fcb-4425-538b-08dc18be293f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:13:39.6788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0EYcfM84PCLfgBsGftdP1YGt6Hi1D7lqU+fd2YDKST7k1ZzUb622Q8gR5wAbg08Ijn49kEsuaXrjoYH3MFaAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

There are 2 USB controllers on i.MX93. Add them.

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa9352LA/CA
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - fix format as suggested by Alexander
 - change compatible from fsl,imx8mm-usb to fsl,imx93-usb
Changes in v3:
 - replace deprecated fsl,usbphy with phys as suggested by Alexander
 - reorder nodes
Changes in v4:
 - fix the alignment
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 34c0540276d1..dea0d14bbda0 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -171,6 +171,20 @@ cm33: remoteproc-cm33 {
 		status = "disabled";
 	};
 
+	usbphynop1: usbphynop1 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+		clocks = <&clk IMX93_CLK_USB_PHY_BURUNIN>;
+		clock-names = "main_clk";
+	};
+
+	usbphynop2: usbphynop2 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+		clocks = <&clk IMX93_CLK_USB_PHY_BURUNIN>;
+		clock-names = "main_clk";
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -1054,6 +1068,50 @@ media_blk_ctrl: system-controller@4ac10000 {
 			status = "disabled";
 		};
 
+		usbotg1: usb@4c100000 {
+			compatible = "fsl,imx93-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x4c100000 0x200>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
+				 <&clk IMX93_CLK_HSIO_32K_GATE>;
+			clock-names = "usb_ctrl_root_clk", "usb_wakeup_clk";
+			assigned-clocks = <&clk IMX93_CLK_HSIO>;
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+			assigned-clock-rates = <133000000>;
+			phys = <&usbphynop1>;
+			fsl,usbmisc = <&usbmisc1 0>;
+			status = "disabled";
+		};
+
+		usbmisc1: usbmisc@4c100200 {
+			compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc",
+				     "fsl,imx6q-usbmisc";
+			reg = <0x4c100200 0x200>;
+			#index-cells = <1>;
+		};
+
+		usbotg2: usb@4c200000 {
+			compatible = "fsl,imx93-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x4c200000 0x200>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
+				 <&clk IMX93_CLK_HSIO_32K_GATE>;
+			clock-names = "usb_ctrl_root_clk", "usb_wakeup_clk";
+			assigned-clocks = <&clk IMX93_CLK_HSIO>;
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+			assigned-clock-rates = <133000000>;
+			phys = <&usbphynop2>;
+			fsl,usbmisc = <&usbmisc2 0>;
+			status = "disabled";
+		};
+
+		usbmisc2: usbmisc@4c200200 {
+			compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc",
+				     "fsl,imx6q-usbmisc";
+			reg = <0x4c200200 0x200>;
+			#index-cells = <1>;
+		};
+
 		ddr-pmu@4e300dc0 {
 			compatible = "fsl,imx93-ddr-pmu";
 			reg = <0x4e300dc0 0x200>;
-- 
2.34.1


