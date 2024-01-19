Return-Path: <linux-usb+bounces-5249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57ED8324E2
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 08:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 947C32854D5
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 07:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8B8944F;
	Fri, 19 Jan 2024 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LHcQb/Cv"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2042.outbound.protection.outlook.com [40.107.13.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57326AA0;
	Fri, 19 Jan 2024 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705648405; cv=fail; b=OVvcEIbDVmcXC+T2QM93nd6QY1ieoQYJoOHAwF9pD1vw7ak6z/m/QMsYsCZqQVG9EVPzQkg2cknjJjqSS0GT/Mjb5fSEtH4sHg8RXkDaFPWqPQScfULWdKsEnB6EfMi+ioC7aIWeZrNKcAgijWvzxfwzQRwBYh3gFMLnKluHSdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705648405; c=relaxed/simple;
	bh=MAcoF/rHcvdyRTqdOrmAW8soRdhV5dPFzWbN5kqIzuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TJJKqkOKo6NnV0y8lMS8ia1mvG52mDNrdQQYo6F1C5EJStudYTH++zdc1j2pUCw8Cw5CQkjP6hNzdpbKdr5vzYXr3WCrR3L/mUnr1qYSDIXgXWMoxumPsOuOEAZTDloAXayJROELAC3tp2e9xo/yvY7GDb5MABQMpNAEUoJDk68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=LHcQb/Cv; arc=fail smtp.client-ip=40.107.13.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rwx4l7+HLwBIozD3FsmhcYtgCHStx1STpE2hIuIGR+stmRKczp7F4v0eREwQacdyEAhnNDVf0kpV1pU8RWj0+BGUCeGrWkhMtCI2yGiifZMFf2pQqBFD4yXz4eHqC8/TU65XUox+ooh84sNhJdU+V3IlLY4VrNc9cdxw6iCaWOKXOF6zeFRObsRdB41YVa8DI19souCgUlqR0QInUhR6rfbaxhi/ugOCO+JUzThdTj754J8k0dBJROLMyPJds1hovytUpbrP8oPs50FcsiJW59Y/HPngz38caPlzuk/2YqLIG+HlGIGPqvqmMWrxahGdoDOwqo0we/NjgC+eC+8u7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFkn4RTjErJnqCYjVPhVl8+XOLXhdQSmRvKpPqlx0rQ=;
 b=RgDSkR84ZecJnW94DhoIt/l8JDJ2hz2aXwXKn5RlqIKcCCD1Kg98sluFyK9nId3DJ7Jiv1F09DSYvWwEEKKYVvfOi10noXCO59TSpC1LGrbWzwI3t9XB7gwEeYiqurCT1+ldnS82DGfXZHgfiBFiYk2UX4Oa8tIJFE75ejsstZEwDjYPqZokUaj1famVWu7kQnvP6gWfNjh+xtk71GBhZ4O6rrRg4pNSOpaqiPnRYxezAb4l2L5eUN5ad5xqlfjNrXfu9bkCgqSj4bKUwBKcqfoC9BLV9nSwZPNccHAQ8TddRwf3VIQmN1xPhiuc/IQNdNaXbLYTlDQpyhJpzDQaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFkn4RTjErJnqCYjVPhVl8+XOLXhdQSmRvKpPqlx0rQ=;
 b=LHcQb/CvAbgwU7zQeF+MMAhz1/K+z8qciD8tdy2O/PCGCXGY4EaWuY6g+Q5NIo1/wxuEn2Vyh9dcSAVR/5CyKzP7fsX+DkdkR4nSvLEVacujBNdjGC6/Lnel0mdAWW3S6CW6irGnMOGjphPp3KiqGMTxUoE6a2cJ6pUk8YIN4pw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 07:13:22 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 07:13:22 +0000
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
Subject: [PATCH v4 2/7] arm64: dts: imx8ulp: add usb nodes
Date: Fri, 19 Jan 2024 15:19:31 +0800
Message-Id: <20240119071936.3481439-2-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 591d89d5-7300-43d8-3fde-08dc18be1ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hQZhsgdwlxTl+oiHfLd78VldWpAmL1gZphrF22wcxKFCCRbl14jBVQjqmRURmtA9VKFBUiUbDTvMnsQNMHfEE6pBXJutBFjBPI38fdxNpxZBd1hsVqZa/QwPNy1MGwpS8LvRBaL2iQp3gs0q21mCyBExgSqFpB3bxYCYbqvMjfslTqV5M4hlSw1GOWcJLLgwDBsxn3nuaFeu3MqJCFaIEm0eYIqlzfA8/RfezBJm65RvlP3LVz2Q09rGHSVOHlrFPusVnX3alID2d1gtcZ4Houa8I2YwOYyvpu6rsIoZ0IhA4E0Gq9ZVlMOeajk6MfMJLeWWdcxoOUTocxO8VPxvgUBy33zOU+XZh1MLw9lTFLBvW3w/xlZzdk1d3lwm6PS6HXDP8U+YV1QuehSruzJK9ObnA4a09N+uAKhLP6GY/odIjDjHbWFo1nlUCXFU3B8CUWiBxeOI4o1Cp+LnOKW6pbL3nhDctpiKvvRz86s513evonwbaX87utghFdu2IsVH466NMGzHh4zBIgX0fm3ovTxsOcsJ9kpLUYgPe2fJ5RBV9T9HNJpjoQzzz636/0SdLrCMC9s8eiJcBEQOy8C33tiXulBag9oxFtftHIKfjSD2PT66I6YtcRUeDPL7LsT3ub5tfWnX4i2DIkLOE5ZtDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(26005)(6512007)(83380400001)(86362001)(36756003)(38350700005)(4326008)(8676002)(5660300002)(8936002)(6486002)(7416002)(52116002)(2616005)(6506007)(1076003)(38100700002)(66946007)(66556008)(316002)(2906002)(66476007)(6666004)(478600001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WS0WkGIjSk/4dErz6jMlB7DA5m+27kKpdCqQ00k/fmNBXsBT0wp/JB55vTEg?=
 =?us-ascii?Q?uy4gpA8ehIf4Lv3n9axx/rcRYIa/ucj5KWnE5uMuP00GsKvuyx/HK4zYJp58?=
 =?us-ascii?Q?IKrEkj4dcySEysgOmt0xX13S9eAvZm+33WorZI+oeE5kpxTIALDcc2fBLRIx?=
 =?us-ascii?Q?sl9OryOYjtuVsMcS3q2T54zBGwVXN1A8w/Mkyvi847UETZp3bN2VoVi6CNfu?=
 =?us-ascii?Q?+BPfJPzi1ccXYcb4/ps0pebYhcjlKV55PG+M0shIKOztQX5BrwFX1RxkpgTu?=
 =?us-ascii?Q?nBKXyelfZEeoghNIfcfaihFAOQAbo6gO3JveJKzTbZ2nktG8LE/62N6zSVav?=
 =?us-ascii?Q?4CXKXlMCnEfEB5FvxPkUE8OrXWQmll8epoUxP0qBNLkXbVeKYtPiv6Et867T?=
 =?us-ascii?Q?PjAh6fJHP5Ch+9YecogmO493hCDxKE/kAVMXp7dPquZoVpCssS4mqgLMR5xL?=
 =?us-ascii?Q?7sIFQpw2Ub3Tb5MJKoY4qplvQ5BKhgTFi+r5xMMu/EK6MLjSqerWl4J1NzTy?=
 =?us-ascii?Q?tfahTTSjs2Mqvqb0eXoUh0qTdWMzRIlmvzJumsaOSgfx3JNO22+VRSI5Taqs?=
 =?us-ascii?Q?Bt102zLFUvH14q1NlyJU34Ql6R1ilq6IvH+pf1VhBYBvF90W+sxsH52J8cjF?=
 =?us-ascii?Q?y/g7mEqP1CcoRBK9VYM4W9sj3Ht2JZJGybzyKO7URZB9UHw15DB1DyyUeq+m?=
 =?us-ascii?Q?j/7o7ROq2qr2V0LHUdbUYnJA2raABpo3gRwzPrYB0WlYg2JRGHU0JQeTv30I?=
 =?us-ascii?Q?wE7Rfc8w9D+YjAKhvp1JI8AytWWmbNO0xSXTdNLOKbkGLU9rNj5CUynDgcjL?=
 =?us-ascii?Q?sY+MKz1VED/RkqSvQLPYgkvUGpRY4Q8s0+6eFCHwquMikIw67+X1rhy8J43G?=
 =?us-ascii?Q?GHQ6zNnZrRBaXMLvDMT3nx7E32LvQgb6I9MtUgL65Yolue7RIZOyF6bAXIL1?=
 =?us-ascii?Q?m4IcZLVHeO9g5SpL9smZ9Tz23xNlOXex52vdYAjK0J3hnq3dTlDoNK2j+Khy?=
 =?us-ascii?Q?4tz48C6ux+JVsH5/QH18o/G16xC5uTUwZ4BcHjEsvB4P/upaVJCwV6VWa6xh?=
 =?us-ascii?Q?ozxX7mZPAhI2m8u4jbK64bkDobfP1yeJkolLM958iddlmUX94klGpocP98PO?=
 =?us-ascii?Q?Rorpq0Z6jeTD7z7Rl0cnHofySNN8doZtYNSsbMxZk5sJd7WfO8W4vx/U9aQX?=
 =?us-ascii?Q?kuVynLPR3YE1/8Sjj0kHHo1lGL2Rx3gCHzy4LnWKR/1JoGj4va4VYHPhekYz?=
 =?us-ascii?Q?Jle4SYUEE9kGhPdxjYXHXGiDA/DswAqC6HYvuAHpj9Gd3DNhNe7zC76G6BRT?=
 =?us-ascii?Q?ISb8wjgZm/dPVaLhM/akmHB2jMA7KDJJH1ZjjJpuVBzLw/QRQhejtC3z2QI9?=
 =?us-ascii?Q?tOp9ZCuQeuIEc6TpN1rdHTh/1YsSOMs2v/NCf8qtlUal1BjNOSS6ceOc3oqt?=
 =?us-ascii?Q?ibVFzWX/5lRmhIfTf28NEKSH9zPc+cMzmSTXJnNle7ZTumh90suK4X5zi961?=
 =?us-ascii?Q?3sWW5f68CszOEo28pYzfDYmfaWsXCQwCw3GtqhU59lan8Ntx+d2rG31PZgU6?=
 =?us-ascii?Q?BkxbTWyennsPHIeZhTLgjyFELOM0EQEMnTyprmYz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 591d89d5-7300-43d8-3fde-08dc18be1ed3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:13:22.1684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtoWSoxoO29/XSMHV+dCYa2D2LzDkV7lXIh7+v5JyGDXWY8QIjR6aD3olcMixIqVLm5KlIbDpREsi3w15P38ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

Add USB nodes on i.MX8ULP platform which has 2 USB controllers.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c4a0082f30d3..ead1f57e08ef 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -28,6 +28,8 @@ aliases {
 		serial1 = &lpuart5;
 		serial2 = &lpuart6;
 		serial3 = &lpuart7;
+		usbphy0 = &usbphy1;
+		usbphy1 = &usbphy2;
 	};
 
 	cpus {
@@ -472,6 +474,68 @@ usdhc2: mmc@298f0000 {
 				status = "disabled";
 			};
 
+			usbotg1: usb@29900000 {
+				compatible = "fsl,imx8ulp-usb", "fsl,imx7ulp-usb", "fsl,imx6ul-usb";
+				reg = <0x29900000 0x200>;
+				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc4 IMX8ULP_CLK_USB0>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_USB0>;
+				phys = <&usbphy1>;
+				fsl,usbmisc = <&usbmisc1 0>;
+				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x8>;
+				rx-burst-size-dword = <0x8>;
+				status = "disabled";
+			};
+
+			usbmisc1: usbmisc@29900200 {
+				compatible = "fsl,imx8ulp-usbmisc", "fsl,imx7d-usbmisc",
+						"fsl,imx6q-usbmisc";
+				#index-cells = <1>;
+				reg = <0x29900200 0x200>;
+				status = "disabled";
+			};
+
+			usbphy1: usb-phy@29910000 {
+				compatible = "fsl,imx8ulp-usbphy", "fsl,imx7ulp-usbphy";
+				reg = <0x29910000 0x10000>;
+				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc4 IMX8ULP_CLK_USB0_PHY>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
+			usbotg2: usb@29920000 {
+				compatible = "fsl,imx8ulp-usb", "fsl,imx7ulp-usb", "fsl,imx6ul-usb";
+				reg = <0x29920000 0x200>;
+				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc4 IMX8ULP_CLK_USB1>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_USDHC2_USB1>;
+				phys = <&usbphy2>;
+				fsl,usbmisc = <&usbmisc2 0>;
+				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x8>;
+				rx-burst-size-dword = <0x8>;
+				status = "disabled";
+			};
+
+			usbmisc2: usbmisc@29920200 {
+				compatible = "fsl,imx8ulp-usbmisc", "fsl,imx7d-usbmisc",
+						"fsl,imx6q-usbmisc";
+				#index-cells = <1>;
+				reg = <0x29920200 0x200>;
+				status = "disabled";
+			};
+
+			usbphy2: usb-phy@29930000 {
+				compatible = "fsl,imx8ulp-usbphy", "fsl,imx7ulp-usbphy";
+				reg = <0x29930000 0x10000>;
+				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc4 IMX8ULP_CLK_USB1_PHY>;
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
 			fec: ethernet@29950000 {
 				compatible = "fsl,imx8ulp-fec", "fsl,imx6ul-fec", "fsl,imx6q-fec";
 				reg = <0x29950000 0x10000>;
-- 
2.34.1


