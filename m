Return-Path: <linux-usb+bounces-4953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF682BF07
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 12:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8111F22210
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 11:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D6F67E6B;
	Fri, 12 Jan 2024 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="YGKJMCKH"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2040.outbound.protection.outlook.com [40.107.249.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BBB63510;
	Fri, 12 Jan 2024 11:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSSCczhWA4lfKVyOSuqkO8FTGiz6+ekyWvDIuS5VczZ++wq68I7qx1gAB2LRYPaV1LPULzVfokBMPp6JmVEqjL4OqphHOCZMM4kTslb+MZb/G+6j2NhwTa6KnHw8BD5S3VJaEsscEaAKP+0ab61Yh8ZK6INULN70hizoibSIwbTNi4IZgjECl1EuvVB8n7dB8z5SmzTDlmgQOShQUnWkyygPVX6/CxDNd5xsNJyCZICbxKsMHtGkdSX5/1VjmVnX8YibxESVCOtmyhzi/wiS1pL0npe5WZCRlLaWKKsY1SLzASdu0x5nGM0vRp/Gyk0sNmdrq2L/O7Yp00ZjpAsgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2zAZscEYnXvr7Mi6vnBJI88z9aWRyRDBhOwV892VVU=;
 b=UiK7P7fkVVFbyjE2DHySiaFcrlEzT/JGSvA0WLbRMpesVH7WBjLdqUdaDp7Fppb1b8/0lT+8xyxrVvS3P2qR98zXhUFWmUS280j+hZ5DVZ6VkQTbFjAD4qf/8D0ba0b1zlriaLgh4AeiFcRBDLbXRNVvTvIvxaxJWgInmW7I3ge3aOJucjOxkNlurYw6RiHtDWCDUzlkuIYurLsqtXm9jL/40RcsSv09icONBqXFN3y1jbtn4PHOK7b7UskgcptNv3OieruOxCYtAcSelBhWM78hlIHRnK4uu+LQp77its+UmiUUG7R03pvlLJL06y2wHSq/BkcI6AjKZirqlfmHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2zAZscEYnXvr7Mi6vnBJI88z9aWRyRDBhOwV892VVU=;
 b=YGKJMCKHmMY3WhA+YBgRGospLA3f6lOVJenRKPtfmjwUh5WOEWtow8uzZRVshh1Jt4fFEMdBL1kQQdiytuxKY/SVKqGi/ww/VF20iX26Rs23v1LZxIAxAbiDhoqnnvTv+RV+Mk1wsUKbfATUJoDX7t9gj2ZLWruTI/xtEzkvikg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 11:11:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 11:11:41 +0000
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
Subject: [PATCH v3 2/6] arm64: dts: imx8ulp: add usb nodes
Date: Fri, 12 Jan 2024 19:17:43 +0800
Message-Id: <20240112111747.1250915-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112111747.1250915-1-xu.yang_2@nxp.com>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f1f47c-fb2e-4ce9-692f-08dc135f411b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FingOQdfcazoXdpDdOE0qs7fuwaB7btCX/wEYcGyyG0tmJWKVcwG0QZm0BMOUJBs3TKDKyXsvFjYqKkLzsJ9qfhk3dPiGSeeyQ/rVEizO00MKWR1kJbnF8TDylnk4Wz8mGniaV7UU+H6wEKyUmbmFugLNnNFHcksUq/+Weinsmd1FLnjUMJF67Y81F/ZyH+mtg7CJyfO0pICQkdIfiQLbvTMRc07oQpZQX/SVeZwLpvO9OOUO1isRCfGjMAAo4j3DUB8XT9VKrO58iQeK4IEvTb5eIvvAHiwjdXsJ8mSYrClyesWE/+6u+SIX+S9a9w0KkhKdeiARq4tIoVMIxgMjQPDZ6atW3aUfF1Q9NWr0jWTIAAQEecEDJzOxDLXFCvIjW6/67iuwvZs9ESTtHYgocBfM0ahqY1WZHgNwsG1GYT2R4cnq151/pB8KsDZIVnLa3W/IaahZO2hKMUAy5DIK/4IgvSe15EB6C0nwlvGzGr2CYcBN0ImWPW/gVmGnk/5Iu2Dhu6Q3furYgwNMeJ/R9ldqSopzdkkLG89IyaRaFl/myW9bPfebHEhHDD/ZIwKOh45D8ETzfo0TFFkj7hWL+NsweFYLMSq6f17e0SwdJYVMkg38PK8faM6eTc7A6wSriXB40+CllBlJarRlAUCgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(6506007)(66946007)(478600001)(66476007)(316002)(66556008)(83380400001)(86362001)(8936002)(4326008)(8676002)(52116002)(6486002)(2616005)(5660300002)(6512007)(7416002)(2906002)(1076003)(36756003)(41300700001)(26005)(38350700005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?njnsLPNV+y3+0UG1uqqGMxKZxND5ISR/NXG0YQqmQtb3kq/xyQPTjaLKlvMW?=
 =?us-ascii?Q?2A39RV8SCBy+J2e9o6BVoxng5d7mXad4v/4yxwBw406x1M1FACXQ7Gq7Mll+?=
 =?us-ascii?Q?v2lK5qO/q2yndu62BXhU+OFakRoZTVQCYKj5uPwD/7dyF5frIGDjRhD+ROz0?=
 =?us-ascii?Q?YBIOEEvrDkiOrRi0NWrosNYvZTKlzTn348GeLb9SRPrP/SpBurTHtmpYXyHK?=
 =?us-ascii?Q?4daCNmEnQHv6P3meRLVbHSleIoVxyWs+8qd2qP/8m5rJTK9/z9uyC/eC4DrS?=
 =?us-ascii?Q?1lPeaA2a3FiHVhrYWZy/+614+I9n5gKp0EUsoXBrEd902ROFyw63asny/s4m?=
 =?us-ascii?Q?ICjr+LWx7/njVt/vcAvKsZefVwbaMVeESxb2r7F5KqMsHCubpzSuSK6J67q8?=
 =?us-ascii?Q?XzexS/kRiR786LbM3U9cWEdcIqIKsJUXP8Rf6k5oerb25zNVufdC95PcMtOM?=
 =?us-ascii?Q?dxW59GS5yeqxO+tKnm5+lzuMh4E1bquvZE+BmcF0Q7wx/PlTPrsy12SoW4LF?=
 =?us-ascii?Q?jgwSl83UxRuH5/T9f8cEtnfPOfbwth8tkC5jlCNQ/8vnup0t2RXGJTZrEIkJ?=
 =?us-ascii?Q?gw/c5m4xMlSsvN4e2X1PlC2A02QEByceR+EJY5skYiczpDalhKIs3yBXdr+w?=
 =?us-ascii?Q?/+eKDSPmkV2CZvgUvSEVi+QVcL1NAgCpiwh3GIf8bsQ6CF3Uix6mLHiVXBDH?=
 =?us-ascii?Q?f9BbHVfh6wi6l75jw8QAVyN19QCPJy1BJE3F1EnWtTBKloeBtHDTdI8C+MOD?=
 =?us-ascii?Q?VbyIXMxhYLdyBiJ4L6kLx7q/CF9+TYwMFB4rO6fkGINrHbPJUQxjgYcamzt+?=
 =?us-ascii?Q?ZpYYNajUQJkP0aTqmfyVTRYUXkDNocnRZhs7skHU+EBHBhHNT3VCc5wzjo7W?=
 =?us-ascii?Q?qNkaab4jXDJfYyWTpVcMK7+zOsFNlj5BngaMy+L2icP/zDDr3ORprw3GJQVQ?=
 =?us-ascii?Q?Ck0zhRE6vCzluZ9KLAXDsq4tit0dXbDaf1gMVYItzjf6nOoSInr2YFO+Kaz7?=
 =?us-ascii?Q?JgDlF7yizh6+GTfX0Yaa0+9pA2+g+KCGnqwAtp//AqCTzqiJB7Ob6W6B+RcE?=
 =?us-ascii?Q?On1WRmr640GnEtb+pmF7310/uHmxfs8hfikkIP1uUjVbSu/pxHKXQog6poq2?=
 =?us-ascii?Q?8O8OFPw3hB1x1lD5CAm6BbASapaxZ0WL4xgNyHflEtf4CVlqB6BKTBKa1Sr6?=
 =?us-ascii?Q?+EjVXizB2NTn3hHeJE5ld/SqhnULtBHkr7s1vu2pP8t6cmMfREpdSF6jULw2?=
 =?us-ascii?Q?RMiOhJNUVUPpJqYmnnJdsxqJtETm9+cUqnbgoWEhuWIV0gim0Fh0bPuy4HUT?=
 =?us-ascii?Q?4lGRgpbYyglZnuxubo6hfDqfOJ1LDEvc8esn6bLiT/R6SDIDsAUGCUvaYmGq?=
 =?us-ascii?Q?b8XvKAEmK3w6l80nIIM0iBfnCPK9+hc+b0X2iuwnUNKmr2sB4hcVQWmn7GvZ?=
 =?us-ascii?Q?CgFypVnszhuc2ZMpPYiPC3WhwN7+7ZKRdv6QS8glCEmd5K2Ysgs5uwq9Zxuy?=
 =?us-ascii?Q?iSuU0/rSqXArb1LxTUstKvcK8ciflyIqCNYYeFFtch9qPg5TYsBOLEXCHOEO?=
 =?us-ascii?Q?RiHQHuLwUYegK2ws3RCBOp0grLXN2k2Fjpm/hQ5h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f1f47c-fb2e-4ce9-692f-08dc135f411b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 11:11:41.6993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwm220jCOVP9R0k4HY1ArkhoZSAqu91kP7Llt0BYx4w/VF5n5XNcMbKzf++vFlqUwZvheuU1EAVa5db0+ByJfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227

Add USB nodes on i.MX8ULP platform which has 2 USB controllers.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
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


