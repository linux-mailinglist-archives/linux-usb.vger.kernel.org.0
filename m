Return-Path: <linux-usb+bounces-4956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF22982BF0F
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 12:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28E482859EC
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 11:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443BA67E6A;
	Fri, 12 Jan 2024 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TpIkDrzO"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6C367E66;
	Fri, 12 Jan 2024 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHOK6LqKu5pWRCOoKmQWr1xImQQrPjHaY1M85nbDMDWrDi205OJyKM9hU+bB1EjoI0JQq7So539yHj4fnTZSfPocf7JB6sV7rOkze5t2urVS+YE48/zqSM0Gcgur7zXsqF4cKtepgIbsbxXQfSwoRcXLw+rnG5lI1THyDO0v1Uy+fn7lmz3MV41zBzsEqLgbmEBwxsx1UOcZj/W63jbF3sSi6xuD+FW5JPdmGWMXJzhgfkhuinf5s1TBkyMKrI5bs0dm2Ay2sQ7U6g4SywC0og4aqm3VrBKnwR7Sd730cKCaio5wCWhCYqlzjnz/0WCY9jL7nZaf38v95nbsf3xLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuSSmeLyWza0M9zQvmOWLsdbJSu8iu9Ec68CnPazHYw=;
 b=nNnhFfFQKp0g8ajom6MTrPDtQg7MCobfrOynyIOFywQobNb0K3rg6336eh/Qu32rse6pNYAAhOmJ6UT8B7YeIDvVMzmd3TXHAQrNbLF3m/28GZfEthaqSJ+4DIbCfHuQ/UmGe5RnsDNdiPapEmYrL81yT1gq8xkX+VYfEJUmy13mNLmSWgoWtD6FBB6qcDjIc+WnWIVlefcNNowSAqHQ6UDvkDMFNz6PvOyjboMPa0Km4HmqejABySu4VmqATGiSB0sc9EtJmm03CMyshurD48/wet29SZoZJtQ+KTLQ1WauRhp17IJC/GCf8t4wyyRppLBL4pt1IAXbbbDQAHuNwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuSSmeLyWza0M9zQvmOWLsdbJSu8iu9Ec68CnPazHYw=;
 b=TpIkDrzOX2IHqOAbjSO//szFxrmyDIRiq0ARROKCcnAkrWV+V2Xd0bBABoidnX84WEvcRgwPmvZ+l4FAEonHq4WtT2/79IEDL9WyaKwZGmYJZSVR2uScVoZUWxu5tNt7+CMWJnMpBRxYlMdb+LxyTXQ8hXOwdfivxA+mB6Ii/LM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB10010.eurprd04.prod.outlook.com (2603:10a6:10:4ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 11:11:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 11:11:54 +0000
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
Subject: [PATCH v3 5/6] arm64: dts: imx93: add usb nodes
Date: Fri, 12 Jan 2024 19:17:46 +0800
Message-Id: <20240112111747.1250915-5-xu.yang_2@nxp.com>
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: 614a5f49-d81a-476c-2ecd-08dc135f48b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CRSg/PjVfCu5Zkf/ieIBRVCwnKPDfxrJlgUW0rZpZxqLUKjLTZ6zv9BdNMJl7x5aMSV9obu/OBia83dTxkGmmyjB8DuzG1usMkqENQ9F3GL1iV3/bZ1JVsodSBMd0OcUmLE2IfpAo6CNv7I9Tvy6wy+NIgJ2TR/v2SJ6/3K71FsRDFoV1TZBz9YNufpGYxIfpiBf6reypxkykbHeUkb5w5JPCk/+XDjUYFaHidJWcTA7xEV0+2/3Nf2bugE/2YCNM4Vbu0/+W8jiKjGbN9zYLTAcCNjpIeuT/PX88LiCc1qYrS/u2rhvh/mEFsNxP9TCRKEv/53wJsIBQj7eFQTSTgeuY/PXdt837hLj2XCsw7ai6B6yI+6SDP8fd/sLWJQLLGujgaa9DrjJE1QpKlS0EOKAyYYH9auyju1xEyPkPW++0hCILDf0sU7gFcjaqWvus4cRRwuTo+KxfWNEWD4VBa33Sd+9c7QB1Lih/Bl8rwUpCncC5lESQWjQ9c9kx/EhFXrBkTYdD5fuYf5XVfCi/hzK61PG7P4d8HOTgf4BZ/t3jv2kNJgv4H5a4qYT4w5IfyFwSjWXFhSH5+on+638If0mcDFyvM2WodBPBJYcU2nqFUKZ2IpjZGjRuhKzWfg/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(38350700005)(83380400001)(26005)(478600001)(6512007)(1076003)(6666004)(5660300002)(8676002)(316002)(52116002)(6486002)(8936002)(66476007)(66946007)(66556008)(2616005)(7416002)(6506007)(2906002)(38100700002)(4326008)(86362001)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IM8TiEVrv+IqW+mFZ2H6KjDb7Io3iNhKkHntcL/lbJ+LY3fXz5Hls/x3ZgE/?=
 =?us-ascii?Q?e5Z4FjlyiL0JI7GobDhom+SyAJLWhKruVUWTIUw8RYVqwPeWEUl01bnlOg5X?=
 =?us-ascii?Q?9KCk8P6Hb91MH7qZ0Fd/W+LOk1SI4FKcVFJEjScxFt6U62NYAx+Hw+X/0lcl?=
 =?us-ascii?Q?mmm2RDKarz3PYc+MrHJ80vCMIrpB1qFKRrN6EoGNsw3BqeVV2US+HsKiOowj?=
 =?us-ascii?Q?B6fc8wn8+2Ceust8CdP3t3gmMqAfrB176l5QhjNTvCRCJwRRsZUsg45CK6nD?=
 =?us-ascii?Q?h5wNW5EKThWDgSClBZOjGQOcv6tBx2lJ5cKeEhEA9+VYHyqvAjCOQEaGKe49?=
 =?us-ascii?Q?nhgO8/9vmx3zwvQvP5i9OITW8SRnEfr8ZE/YU7nc0AAcQMeu8SotflkN4rwV?=
 =?us-ascii?Q?xgA9MQC5/vg1mFy8k6D7zLPL3hi1WPD6xq7R8sQ6jwgGR0zgSXX7i0ZIFsfe?=
 =?us-ascii?Q?9btQXj4AtJAJky128buF+lsHdIKq50i+Le5OqFLVTwLMLK1XnOSBegrnowfl?=
 =?us-ascii?Q?BDmrZYVlX0S0ZMkgQgk27ZBP0ERZmxUswrFfSXCkzkYSlPW4zlMR9M+2wdL7?=
 =?us-ascii?Q?1sHGrixisd2fz8ab/yEw6/yp44Vpf8esjDDyX4NgMmQEPoJTbZQTBwRzh2ha?=
 =?us-ascii?Q?h15m9V+TWscqLcFR+5ZaJdptVdAV3chD2272tsQxmPPzNIgCWUE7wtn4AvNy?=
 =?us-ascii?Q?qCOESyC93tS691MnQOrrXzd7Z1zUwc2/oTGJXpmurCg0oNjP8oqsjT9TIAs8?=
 =?us-ascii?Q?NT/jvg7fiE+sNzOdO+EcXS+FsSth9RrB4xdLcHcQUVzBdYExgE/VzY4wKk4m?=
 =?us-ascii?Q?KT7zgsqlO33R2zMcZeHEHO+lUaFCxdjo+eRiwlsGqRDoVeyRoeVb4ujKf/Zg?=
 =?us-ascii?Q?KhDeG/7Bchh92i6DjtioKMi5G8N0uKGzxgS+B2t2MHDr8rKG/hJ6sARFwdHE?=
 =?us-ascii?Q?/5patjyeDZYGS9uFBbrFhqVuXy1sNKTnpMsalRtDprxRTr6FNKo+DqlaooWd?=
 =?us-ascii?Q?0l2RUj6ZrBenc/nNhimZy+cfFKyffaZf0fn+cIdcKRRFGQDXfF1LX+5XnBUP?=
 =?us-ascii?Q?rgIHV3RpWrt+yI5W7aREOexzuuaDTokcEw05buTq0bHtlCL3BJjCTLdjdjG/?=
 =?us-ascii?Q?6xy4aD+qe9iJGq9ioOmGZV+Z8TFnzYcIVfbAWVOW+xwrfaQ75mCsTteVm1tR?=
 =?us-ascii?Q?9AGW9jDgt3B1WqqwuZDJM8FStdvDAP/D9ivRI12N3HQRxUaDalCmwe7BScD4?=
 =?us-ascii?Q?mVx0WGcr2fp/8ADiREEHQK8Y0+5ycRikzxUno7vVL6wsA1ut8ky9F1kFBb2o?=
 =?us-ascii?Q?ZZFSkrkJPeKbbQLx5CMq75jf96PwVtkynwzDNNCHmZ5K8RpJnc8I6vvrRt3y?=
 =?us-ascii?Q?IazOrUin+erEmzF3Fo3Rv2Fhbtqup+GtEIVce+mwtKTRj9G73zob8cB1WxgY?=
 =?us-ascii?Q?qFeh+bmqrJPZM41M1APZTNYkxvhQ5paUK7OynxbEHSp+7XlfDWWI63QcvHNU?=
 =?us-ascii?Q?bYbjidnP3Pbb35cjHoRAC96xmkTXPBQAmZBcNGKjFr97as/wfctB9NW1jYtD?=
 =?us-ascii?Q?Qn8WuOfA60ggiW6HCLtnQrkmS3AXF4iwkUpp/Dgr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614a5f49-d81a-476c-2ecd-08dc135f48b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 11:11:54.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xerbjqkln2ch0WVfHrHRNf3iIBCFk+xN5XZ8zLCaYZwB2vWilctPLi98myQeXE2YfGaG1WTQEnx/fwKUDGvwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10010

There are 2 USB controllers on i.MX93. Add them.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - fix format as suggested by Alexander
 - change compatible from fsl,imx8mm-usb to fsl,imx93-usb
Changes in v3:
 - replace deprecated fsl,usbphy with phys as suggested by Alexander
 - reorder nodes
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 34c0540276d1..10124758c579 100644
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
+					"fsl,imx6q-usbmisc";
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
+					"fsl,imx6q-usbmisc";
+			reg = <0x4c200200 0x200>;
+			#index-cells = <1>;
+		};
+
 		ddr-pmu@4e300dc0 {
 			compatible = "fsl,imx93-ddr-pmu";
 			reg = <0x4e300dc0 0x200>;
-- 
2.34.1


