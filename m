Return-Path: <linux-usb+bounces-4300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1D581689D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 09:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A1B41F217CF
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 08:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2318D1094F;
	Mon, 18 Dec 2023 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="KGukwZqr"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2058.outbound.protection.outlook.com [40.107.105.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E52101D3;
	Mon, 18 Dec 2023 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGkizVtKkEYmFhTCF+/U74DpkliOKNmtfkLNJblQizBku+izjVHFhjiFkpTOLeCI9/7rNivalSp86wH5OAgSA71j9H6ZxLIYSNyfhqQMoXqLglWoJ3I5L8DpP36UjHOEqhkIuGSt4AZHfTph/m2QoAsRtT266Szi8BWQXpzmCFereGqdpkGn2p6fgfRDWXtVOa+fhglh7uZy6604420hVg1Q/ppqOiu8y4m5XMRa0eUfTDh4Rh0/uGI2Pa1l4BLP2+MFUcmC3M8fhl3C7xn8ZtRSNvGUFc4x9WC7eppG8Dbifm/GWIy8Qxj4jW/VzBfWHBMSj1SjuomdxKBa74sAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFg4H94pHd95T8ohAvWMuEjFvzu9CL1+5JDwRuWNXtQ=;
 b=M8H3YWHcERf8Xx3p7f2jwP8FBdoh+KCsl++e7NvezuBdSJSxZMpCl+QyAKGF4cDwXbt2naVQx29i/5zoY76eR4WDfznZtONYmeCYMKNaB99/Xz1CaoTkk7IZsdjK0DhpQLCW5Y+IRM9W50mdAIQDtI0y/gtPFC+BPiX2W29a0Umxp2oqiqhgItw7PHDc7A3NqoiKK/X5qjJFSlUnz7brNFeNfsNDaqu4GPN3qI7oqpcGpPQ31A39lkIh4mW4kHdI239w58Uy4hlBA7X1GqKNsp66+cC3XKS7bBaooBM9T3mkkw9/dFYYlhGQbZkhHtpsEHFm1KyrdzImF1G+E7A5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFg4H94pHd95T8ohAvWMuEjFvzu9CL1+5JDwRuWNXtQ=;
 b=KGukwZqrbeZ4wsL5jsYk8rc8gHii5exqnMgAx7NZDTX0ym9nEOm1+JZx+1knfsbRaarzKMOdt/oApp9GJLPOMPg9b9nefZrRPBwQwLQREk626LIqPYuyuqkXvVaXueFFP4s4LKkKb5LGpcxG8ICUjjFyJCI2LDSZz/55KsrCAT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 08:49:06 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:49:06 +0000
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
Subject: [PATCH v2 1/5] arm64: dts: imx8ulp: add usb nodes
Date: Mon, 18 Dec 2023 16:54:52 +0800
Message-Id: <20231218085456.3962720-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To DB7PR04MB5146.eurprd04.prod.outlook.com
 (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c29989-dd84-4057-2efe-08dbffa6316f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	52pHH35fhr+rqaTV+FDBrxegFAYBqSNCnE+LE/kvJo8ddYS13vKa1qvnTkTQRqwYue6eKp/Asg/TT2QOGXglIvd79ewPiypw9G1UjTduOfC6hPhOWnOyWNxBRUlEnlSqyuKODurN0tDEK9AUx8jUeyVqFqiATrd7JXnqv9FuBlnaSJvBFreGaCqEjUzFu4RQeqUpB54AkZVejXlb17t/a5VDpMAz7SJRNFcLNhFvztqawnkGPE7FtMFFnoRZdPGIU4G1Ca5WNIscjs0yQ16hpyP4xWvP/6O62ER/KMmYupR3NJ9k/DVYBbcCgvhD4DXpXx48bOw8Wt2m6NB0XRnIYGOHweHsgtppNturCrnanK2A58/K+m+peaGBdBsZNgIVmE2b6PLCgiNG5p9nbPw+fFWvF+auyTjLZ9z9f5ftNUJKkD6I7Wb+ghyKnGiJOgcw8SYnC+71ONGJ6JPABoHieRLr6wuje5h/dgjZY1WEKzVm9w+K3yjYJyzwtDp9UNgEJ5btsGiG67sukzHEuuhDjGWEb4MD4iKVljFuvsMApC/M+LkV1dhvzQExwF5TPCVSEYuix9GPBKCRJW/4LGVhtS9O8EcncIPEy4oeUEuGXdk31i/oVE5zLoBYYsC9ijJMLmiaOuPusjKbs+4Jvqvo3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(6666004)(8936002)(8676002)(4326008)(1076003)(26005)(2616005)(478600001)(86362001)(83380400001)(6512007)(52116002)(66476007)(316002)(66556008)(66946007)(5660300002)(6506007)(38100700002)(7416002)(36756003)(38350700005)(41300700001)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oUmkK/GkzvTMuS+tfczAz++ZiFtOjim3+OayKXv5sqlH9o8O0T1KYhXRfm73?=
 =?us-ascii?Q?OfzLusEc7NamI+w6/tqQYMnIHx+GgiwYz95+p/vFlRAiz+SIJhaWMcbWGVOj?=
 =?us-ascii?Q?6aIt9XZ2cmSwOwHgDc4gqkhMSFUHpwSFwgm/uNhtvzIsS+diMgPqEQpDDoOf?=
 =?us-ascii?Q?rwhs5iuKO2dbb7Lk540WVIQNihu74rRQUV2Kp13yzzuuzXiKimn7qsZo8O3M?=
 =?us-ascii?Q?mRM2arW092nOx/vZtwTLqRkm0Zv8c3Dh6E65D+92SJIReb/6/aU5nzL5MQAP?=
 =?us-ascii?Q?kI+OqoH4EvciH1/378rZk7jB5cPNwljSGJ6wP1R7dgVfzCj20NhwnlUFD05z?=
 =?us-ascii?Q?u5U3uDHvDXuIwitdf4Qw+yKMlbM7lAtXVUbq6UJFn/O7EcFZiMcH+6MQWBo1?=
 =?us-ascii?Q?5Dkj4QQtxCYN0ldLOQAzSa0wg/pUNi3sBWwcZBba0VPTQ2OGKFLKMIslyd+B?=
 =?us-ascii?Q?YDLvNX3E6LhkLdXMbu2Jcy3vKKa6sHK4NUrpYaSjvSzLX3KPire6qi0DI8FV?=
 =?us-ascii?Q?IGOimlTNGPezFQx8nJtQ8YmxgTRuRiOW5TkStO4EJ+00jBV4dG4/oO37S3So?=
 =?us-ascii?Q?Mxfl0SYCvHdtv0/udPIUC9eeKrGASs276QXYckYYl9IQoIpI3OCQf2UQ2dVS?=
 =?us-ascii?Q?M6Fgwt/ltmk6xXMqlv+kwfoCLyfT9bvORGerC/2bDLrWZMDiIOcXr60OTyVL?=
 =?us-ascii?Q?fI5m3rEAQDbSoGxj+0ZLBmpZ4WQnCUmYkR6vY58VOxY77pZN6KDI1XF++knd?=
 =?us-ascii?Q?V35aD2Q1ftS0AQz5Fc/ELfR2NHz3w/yRbtJpq95ZOp89O4W+m6bhwlXIHOF0?=
 =?us-ascii?Q?fjivdkT33WycRnKORax2D59pDcJLeIJ1qh0qTD1ZC0VfjSf9RAi64aRQPjEH?=
 =?us-ascii?Q?rpBz9rLRU1hb/H+wlZmeZziEhvQq8G6rCh8OpsTqSxjrQHKdNZXNB7kw+Cu9?=
 =?us-ascii?Q?Zt4bAIlhZUK/5V1PB1kZ0eAIIB59M0pIS/L+DPGlniCz6DMpC52gPgQz/iyG?=
 =?us-ascii?Q?uk5lKfXfwYNEMls+shAnzYO3m+Gklv/aEozDZZCJAQ1o8/5kGbftfPLCbM2w?=
 =?us-ascii?Q?nIat+ziKOQvqozZcRLxkhSClHsj8VJLMKR9WqWAiv65ULQ3mYNqxbiHHYwbt?=
 =?us-ascii?Q?T3vCK7V+J6FV9R6eIFRnz4qfCKHIbieiHYwATtIGPbI4bhfT1agTvGZcoVDZ?=
 =?us-ascii?Q?5e+5Moc6YDTJhVls8/vRIgm9OKOltsV3nhI9dG3pm/4MnteZfMGs62v1ZEP1?=
 =?us-ascii?Q?8Bw11HagSdC8F/loG1++lqNzZXGoSmLg8A+hPJw5K6bI9/geChOsnonheTFj?=
 =?us-ascii?Q?LWvrnH5jHn8OYgM40G7TuZi1fFIHHt1CQNozURn1LsEkZwAtKa9gCDfMBCZO?=
 =?us-ascii?Q?bbtTaezor6UF8hOP4eqo6AIdaYM/tXCKc0dnrFd7jNhrYY1qbGejHLuIMY85?=
 =?us-ascii?Q?MkUgQKeLlFU0PK1r89R5bGkdif2s/8951oEaJPWyvmJ+QRxzQ3MZNESvWUww?=
 =?us-ascii?Q?c8c/yMRqufjA5kiy9f61mFKWRXAY80jMionZIihFN/8zPs1++J6GI77rqG36?=
 =?us-ascii?Q?urPZHL050/uOfrO70GRfgzqxZ3gibj5AfL9+iOC4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c29989-dd84-4057-2efe-08dbffa6316f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 08:49:06.4816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhU3x4D2xQQ/4Z1Pig1KfGU4wJEnzInTBeDGwl05Z4azDXzERepfACv61r6Ri5uIpLKfo+DSjngq8Y76TxnUkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803

Add USB nodes on i.MX8ULP platform which has 2 USB controllers.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
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


