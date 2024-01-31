Return-Path: <linux-usb+bounces-5695-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9513843E84
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 12:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE91D1C25894
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 11:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534D679930;
	Wed, 31 Jan 2024 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VDr7wF6F"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CAC69D39;
	Wed, 31 Jan 2024 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701022; cv=fail; b=PYCKAKhUYPDt1YpbQxm7gahNwfqxraJpNS2uUJ3u+QlyScN3Yg+Arcpm/dXem++mPBz0ZSBspsgf80LocS5S++wjvB37adEWoGQjMD18zgWYI6LlYFbGQ4gHjW5C1w2+J2Mi2oBRTFVXhT4i1R4NCka2iJ1T/TsLNMClCtS/VOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701022; c=relaxed/simple;
	bh=WxsKS1vfvuaM7k814LBHp4T51T2lZhHmZvE678ZUrXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BzBP05tlKxQmzg5YaJJv31NN49TMPxYYq6jSDECUa22zEcUT2wM4vmJDdh3FcTUU+iTxl9bIP7iNYCHPI4H8nd0S5suFRRB3BaI/a3Gvdkfhai8RNlJ5NP2vbt4du7yWe0ouxrsJuCP3iiv2PAPGsaEdqPfh2JPLgKX301CqJU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=VDr7wF6F; arc=fail smtp.client-ip=40.107.20.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O50qXnnYncsqmMJkHGyXuiRVZ7fhKBWsmhRy1WH/uAcmuX85/5zuzkQaGKPGmaesCftcO0ejSOAtJbyowvzTzgDHqDpgGfY7YKHIbN9/Q81XW/xN1qEUK+twL10bO5Rrv6tdNwAaL/nt8lKCxIYKPCYzGLEzMyTJQ8TB1yvHnAtjraueaNFuuja12yd0uEErtHwbtWLyKC4Uuc5QBo3svT10PYBkQRPZYTxNTXWu3ltQRsG3c/OxOXtzAr0/cRPPm4X5YufW8/jpkw/7cEdZBSJwuW7HW0I/Y9oz/vO+GiYIdAI2XnevFAImeAgptdrAl9P00t+GeXhwRWvfCQbyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkTzcuF2DyT+WAI3+K58cuQdid20oVDGgk8NVq1zPbw=;
 b=HHcsA1NOB7XcdZH2hFatKW116bHGUp3siHhxXfexHJ0xig0sK/aRjUTJ2mgc1Mr/i8J43vuBZGNYoqzzf7mQyW2WC2Y4OrxDF0MqkB8QsSHM40ySXBypTpVimXJRv53gW13SYcsTF9VoiQHapUFYA9tXEjVLwm4BtVz5xxUH14pnwh15OJmXNGRLRxadW4cIGmb8rqJc1MEwoshq3Irmfz7h7SB4icyBc6jmDD6XA+TwFWkdG6P1rD307zyjBiJxHn9240HOcjvJTUTtsmdAgX7cKKfcZJ1WDcZK6tfIGpW9ZvyuPo9GgufWxP8SfnuyRGfJxryjSTL/k+L/OrCvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkTzcuF2DyT+WAI3+K58cuQdid20oVDGgk8NVq1zPbw=;
 b=VDr7wF6FslGNIxssg3sMW85e8TVSKyb7G5v1MlcVsvseGeouzVANYp0oYIWmvFCQlf/0pmLcm5dq56w8731t+g2slM6KJot894b2seYZ6BAtU5gkoytktOqBJfJZUEUnpqDXRbxFnV5/KZWR+B1imoSUWVPPqdQFqUgz+oagME8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 11:36:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 11:36:57 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-imx@nxp.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/8] arm64: dts: imx8ulp: add usb nodes
Date: Wed, 31 Jan 2024 19:43:18 +0800
Message-Id: <20240131114324.3722428-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131114324.3722428-1-xu.yang_2@nxp.com>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c0e266-64c3-42ae-9216-08dc2250ee67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cBd/LmkF+QADoceyrxRc2gu11Ak2o3u12XezgSuBnqu2JDrbaefXUusHjx3h3IlbjOYoJxYEwk6A7y098nHe7fPjF3+hdbgy6s477JTVuD1UvXxdi6bhsOdD0jedXGYZatx9EpNiFocH32r7auWH686rdO5RyTDDhYYWKVEkX1FERUin/RYDBbKXywzei4RNRPdgeVcvU1RqNpMhm6KEEiZgk9NnxHOtCai5yAZUh2YHLmQt1JK+8OtzkzJ+ygCMADXeaiUvQafu8NtLACeg1xGrYlZKrwcDtpxnS2wEmU0x/8BrLrfTJAiGLUTUG0vfRbp5WtxTr/2lu6g5hlrTCvC+wY8gYG9cu2Bwxp/wNZ29Yr2O7QNGe5JFjKHxLvEKcqpfvgwqV2wTMplHI+lWlnMhxG2o0a4FoEfck9TvRJWX3dqbbmrv5EZ7wu8mWJlRfi+MlBgXgZX983MedJTtwRRZj3BNi1bSjczcTbFYZPjxCm60dZsci2+YtGFNxuVya/jP2mTQZvviOIzFpXHzhOKTw0DdpeQmD5FvwH6LW5hKtsjb0W7XDb8PfE3x8ZGd1XTTEepZg6Ma5YKKdVHkKKq7Kn0GC347SnzparYTZh2bsnm2nZNw0IvEP6mWkB+8aL8d+0PVxEcnaDQBzOVwCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(1076003)(2616005)(41300700001)(38350700005)(316002)(66476007)(66556008)(478600001)(36756003)(6512007)(52116002)(6506007)(6666004)(83380400001)(6486002)(38100700002)(66946007)(5660300002)(8936002)(7416002)(2906002)(86362001)(8676002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bQP95P9q6oQsG4S0QdzFArs8eUnel/yCgvNXOPN1SNA9/S4QUAUmmucMoZp0?=
 =?us-ascii?Q?Vqv4lbZyGsbybhMvmoGeI+aFhwfu21/QZ7ovGSa5zUGgDiyuoUs0i3eMOkjr?=
 =?us-ascii?Q?Mh449hE2jdvXwt/sO9QbCPwgEAfF+63HmgjclF0UemeHv4vPdWHtKJIQyLwv?=
 =?us-ascii?Q?j5u1xH7nea8Ee7D2AeCfELJLKseM5oUqZ0q3DoQoD5rVcT1l/cx0XSNyLnux?=
 =?us-ascii?Q?zwl3yRUAZSckfwooVYnwDRh7vagixaypycRsQv42fDjBh8dIQrYvBUHwFyjv?=
 =?us-ascii?Q?Pu2Jbc8voo+DwBjMBx67jY9MEBkoaOiTictFkRY0HMR5u4pnKjRb6p6Xmj4f?=
 =?us-ascii?Q?2m1y/Rkz3kib+RGLvjJZ/ws1wSkbL9oRYVWy8tOVW377aTSxH7uDogZUUKLh?=
 =?us-ascii?Q?UmzLAaXEHg3iZxktdwbw4uCOSTImunZ+6Y2pFte1rw2xx83KkQX6cHVrYlHN?=
 =?us-ascii?Q?lC1W2/5OvU0dkJyxBxqtQNdgDwAmGfkGX+FHfaHKngjjT67BMeB5ufD0XhhQ?=
 =?us-ascii?Q?Ezr/3j9xFnUIIoDt297O/3pvQBmntGIweD4RN4O6QRJ+fjGmpCNRmjrFPCxJ?=
 =?us-ascii?Q?vAp+zRlNgsBwwHm+nqy8/mVt1r0fwgH/7fJj4YgrgQbvupSpST0hDmB5Uip3?=
 =?us-ascii?Q?Bg+QB2f3UL3dP7oPhjT6EBjnwV6aHIYwbB1Ef6ku1MdvC0VGBfaKgeymo67k?=
 =?us-ascii?Q?NM0tcSsAEIDAn+BBObIKSDS4iMFUTy/y7WpodF0xOFiJIeRiMuCGvK210L+W?=
 =?us-ascii?Q?EM+9hq1VToTL86XDJu8rMrpN6tSob1qiCem4/zbEPmoIwV8qnqjqf5hzNYvR?=
 =?us-ascii?Q?V19mXbZVajqe57olkd80KRnzaR0uXR25m8Nz+kivgAuLRgCuKBYvr61UTPmH?=
 =?us-ascii?Q?PDAXIC8AIL2Tnt96MymYB4ot75qcgHgZA3Vm3svgJBglJrKCuDfVgj/sF1u7?=
 =?us-ascii?Q?xRe4GhXA+BJTyGN9yHL+UvYKF6zLJRHl5t9VhhnkSZDpXVSd8ZxRiw9K4yrp?=
 =?us-ascii?Q?vt9ZAZRB8pyIb2kVNYle/H0Fn+kkvYXERLcof370387hC0ZJ+2XF66vzqHSC?=
 =?us-ascii?Q?YnmgvD/EcHfVbhe27jEU1qSy5W1qYGIEI4nqDtT7yvZMpNhT86tD0K4M4+SK?=
 =?us-ascii?Q?NNrr+bY++OM979JonhGRsBx0ddlsWl8smwK+fHNhG/oFlPqZoBTgWbwyFywC?=
 =?us-ascii?Q?o2K170SqwJqKzgDEdyCwAQcbHvaH/MmWHdc3PmQygVVckX9InTjAFAuKMJcP?=
 =?us-ascii?Q?OOs3Pm4iR2i4eiye4GpfAwPCvAwzKUEjPT/uFGOqZLURKoID6khEJZQ2SbGg?=
 =?us-ascii?Q?fA59tOtONqAXBZvg+gkh++us7CoPCqMOg4yjIREtMXDuRGChekkkVfFWq1mI?=
 =?us-ascii?Q?ctX4RUxza1HGeetRlFR6yQQ/eiWziOySu7Yi8Smzhu9QXWOG8wgrvboE73Jk?=
 =?us-ascii?Q?jzPqn9SOt0wFOHh+rGrcOSqb/mn3hOl9uW3o9c8MXyB5mwMhYwk4wD/bV4fM?=
 =?us-ascii?Q?N/KTfB7sb6Gz6oBL8uGvWMeGn/OO/gbH1oN5KhfJWetgbzZyaQr2Uh8vRaml?=
 =?us-ascii?Q?u3RIt2AqayEmlo4YJoQBbcGh9VyHHDQyDo7nfW7k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c0e266-64c3-42ae-9216-08dc2250ee67
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:36:57.5011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzyPHMHMvl2RBkuW5T7jccWa1JeQBNCZiukJDFo2PF4PZaHdZzKMuhip3glr949Dervb9aBO7tm9+sHFJMrAkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

Add USB nodes on i.MX8ULP platform which has 2 USB controllers.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - no changes
Changes in v5:
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


