Return-Path: <linux-usb+bounces-5699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A90B843E8E
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 12:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05B001F24D55
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 11:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245DE7AE54;
	Wed, 31 Jan 2024 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="DQeb0iGO"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D791D7AE40;
	Wed, 31 Jan 2024 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701040; cv=fail; b=lNMO1E5nyvCNJcRXoOVIBNDjGTNP+T5xHDnWzXlgaQCgTBirG/ueWNUCF/QkgkmAal34IYYn1nRArOiXRh8FnxaLVbH4lTgoX3PnHQLe+14WFyXgjm54gUCwjbn5JkzXoepr09KlWspJMkpyFAP/avAIRzNgbGij3b3nWWmjhfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701040; c=relaxed/simple;
	bh=009zrz3uT6e8YdR2mxoEfju49yBu42O4/s5V4rkHOqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pZBklw/tE/jbUmrrRcdl8zm/YRwuEMCmg1DSl1NZkxI4CHzEe4WqSV1VO6IH6uItvx5JpnHBQYSW4PbIk9sohfacF65d6FPxCtT/up19Y6EHzF3CgOvFIW0YsBhfZoEv1TYpK66uJhN3pSkfkv1zOjw4a8xGh1TRwqrtZXW3nTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=DQeb0iGO; arc=fail smtp.client-ip=40.107.20.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hN/7PgVx6mzbfjtP0IkxoTSW5vsHWxSAn1/tP1RpZaJvRCD10wpORLEgdbRP8e3Pwto+IRTs3nfBDjNu8anjVLcJHr1nExKbHUE8Qld0n3z5419qtMIZ8iu86IkZY+JwVp7k6G256ZiES34GyaUqy+3bWU9h5EWYCFt93Czearo9pSSGkx+aEVCPbDQYL8ym3x6q1X7euPCfjB17RlyK5zNDMbgrTGrwnmbuNDUpIgmM/kDiVe5RTTM2vl8uiFCwX1XjFx/VdSnNyKH87NPFtgvvxN7ua2iSt6cH3aHbTx3tpwuD9fiK4nEdmCOJTlE4272HnLrkNV4QjlxuuVZNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+i8yu4zovOzaOzLWxOO2pKP0viIFTRU3fATbx8u7gig=;
 b=Wohmf2QjanuyVovwfSsknPPiu+RrhrRDl+yq9SmDUxKdBXPlBxM8rMoNc4L4yy8z3R+OGfZGjC1wtZAR2eFNRQ2h/EAOEsI55Yd3CWH0+QjTlqoTNlOx+zUNOjN4gJ1aE0maIYLWy4lYsFtOKZ1iKuPcgwU178fXpx9jaaIkJIZy5tsfYrsuYQUfwcnXzVDWMr+hzz6NAYYh5L0baM1b1qxGXoWegzCThJKsoioiy1pARSoskl/UolHG9Z/QIHVS5XIhSVyte7f9fsiXoiQkvd5NQKXLxJAYYB2MKife1uEQc7UJN3R5/GUaLFkLCzkAMa2ZToseK4jhc1lTWvJ4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+i8yu4zovOzaOzLWxOO2pKP0viIFTRU3fATbx8u7gig=;
 b=DQeb0iGOslqG9Ovs71RVTd3HFeB9NIZ8aFR/qL/YCOnIaGYFF4x4tHro8iAJDz7TsfaLoyizXYfSJEHddOMVjZurbPytP5rnYnAPpjdXvqqvJ+Vpca246eu0IJX+OoX6bvm7prqDoaMS/1fdZFKKRW1CGSuS1RsIqGMOgLfT0J4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 11:37:15 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 11:37:15 +0000
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
Subject: [PATCH v5 6/8] arm64: dts: imx93: add usb nodes
Date: Wed, 31 Jan 2024 19:43:22 +0800
Message-Id: <20240131114324.3722428-6-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a8da90c6-4b41-4b52-4b88-08dc2250f932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RyXKbo3QsD6Ct+RiH5CfYGGFF3wGMGVLmGIaiJWqMZ54rfOI1nytF2XQtpHoXyMwd9DjMYcVx/rbYHQk75SqZ8VYZ6+Lc3djDTI2eHtRSE/qSktP+WwKiwuezmfKNZ6ZEDuPaBdoSmJRHDiLvaRxrSxQlQY84vibNQVqRPehUV3RhCqSrPntx5V3Jpmh1AEKuMfGid9eMh4Lom90+Kr6bxjaPqtXbnx1aLFhiHtqO0d5dDpaz5UeuyjWuQ8rKr0b2ejda0Cbw7tkrGoUTORD86ZGVv9LVQavglEGyre/kRbdxL2m6Ii91VnUuyXZF2gSTWoin/bxW6qB3GdvtrY9UmBLhHnoQ1BrfULb899Lulc6xO4ksNQlB+KNIBW7f1mUHOelXaeDJ4rpBjwMCcHddknIDJs22G+udIrPCToQZ/Opx5qYQd69j0zmvg302koVEVDPuHw1E6qBoQfJkpjZ/A/JBbP+6CRRwcGslrsPcvfry5k+z+H/0ilMY38/d4k208fi20gWRD1PTC7QvUuFGmjgxyd0OqQ0YQwxp1khCxQ2jGpq506a/luH2uHxb3eRg6Acl5DfJxMhdEhjA7momSvn33wtDjUkYR59zjbl1oqM+Ihst8oDnDgiqZLwgFdu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(1076003)(2616005)(41300700001)(38350700005)(316002)(66476007)(66556008)(478600001)(36756003)(6512007)(52116002)(6506007)(6666004)(83380400001)(6486002)(38100700002)(66946007)(5660300002)(8936002)(7416002)(2906002)(86362001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wtL0vWgPQkuuj6uUbVDAiKu8jj+i958Gxxav8BcCtg1FzoCp/BtCJrm5gQ6d?=
 =?us-ascii?Q?kvkdisf0CWDusM/UtkTNHs3nZ8dmAXsdUt6qyvyUCuCG0dSTcR6IrCB+QccF?=
 =?us-ascii?Q?E8/SBPGz0ND2H2NEkKTQZgWiqxI/Zg4hu2TcN6yAlUwCG+F9nb7qzIo680qd?=
 =?us-ascii?Q?ZxbtfQZ+v3WnMF5h9gRdR2FFhDKDkWVFTU0ZrgERrV5UlzUs+rfamZAdd65O?=
 =?us-ascii?Q?Ejz43dsVLCpz7gKb6zE+SLFJzMHV7NcFOBXLhgB6U8ejsY6yQ+Rnt1Z+LyYW?=
 =?us-ascii?Q?ISIhvpOM1G8csxK6rDu+cVr7oQUJc4jupTofLSPyCG4K8EUwDw5uAMeIYSF1?=
 =?us-ascii?Q?2unRxktNdDcfDeML0dHcygMIVk8IzeQhhjro5p1P9uX2ciUyuDWiAturodV4?=
 =?us-ascii?Q?gky1MB3aLt73afafOEKpHPykUCu8Io1tt3BpCRMWi0cb+7IFn1ueIZ+VcSBz?=
 =?us-ascii?Q?YunExnuXtT9cOXThWocBL/Q0yFG1WMA4kAwxMJooqipcpwEVEZy6Jk756zJ3?=
 =?us-ascii?Q?6xTQYH6V97YOTLZS1P0l/GYGy1uhEF4baOWS+z6pfLp+XjQB0ZmR/W5U2il6?=
 =?us-ascii?Q?wlYEteF2BpaR5bwec5ya+WVijibftX5n9cUT2WwT97CGsIjT0ICztcpuiRQS?=
 =?us-ascii?Q?OqghHw9hfvZh1WakeZBSaK6CgBL/jQzpWPBSC533ck2DKMkxeGMhg6zkVvrd?=
 =?us-ascii?Q?MEy9p5rkyeGeAN9MSoLvIbLryyW3e6vfzE4kjZ8wQzX6an90ykQn0lZWYdSB?=
 =?us-ascii?Q?yOonVtTlV49rD6O5993paoO3a6yzTx6xkftAus/hqIdm76pxBNchpirljef/?=
 =?us-ascii?Q?a58BnIFsl5Y652ahmp7d95wqSFTdRc8Ikv+ThYKaFhQeQBUQVEr93RCo07vV?=
 =?us-ascii?Q?147MaYECXh5tfviinmY1o1mq2+ZZ2+nrT/vlen+9cqKKWMv5hEP8yJDBtLHI?=
 =?us-ascii?Q?s1JcCnyxRtfSSHOzTXvX0L0QBotlw7411x3V786GCK1UUcccjFv8D6lfodQp?=
 =?us-ascii?Q?yGJ5lkmBdpxwNqR7wDP1cgacFHZjp2xouYhDFHY6wxoP5PMTWBXT/D1xXe53?=
 =?us-ascii?Q?xeMQCMMQWSNp4DsoIITNZInUCS7Z8PkfrRzq8pwmiD9ZIlWVvv98fblgbKA4?=
 =?us-ascii?Q?e3bdH5ZlMHPB0o5gNeappytjmpqQk0zK5RCBQPVGGAV6e+A82O0OHPZH/DqQ?=
 =?us-ascii?Q?JhLlxS6MYOh7sP9ksYXkihaReZtOBzQdTRMf15dJsr3tOgcqDOQil4LaL5Gu?=
 =?us-ascii?Q?T0K6T+wGva8dRT2Y7vqDk2dMbDcuF0DUVTW9HZkwOrBBz1s3fM7tBbU5cIAk?=
 =?us-ascii?Q?vVHlCn1x3wubNAnZPtx4LKvWYUbq8jSX8CoW9uPLt4QKpEGYz9wFai5SCMmq?=
 =?us-ascii?Q?SSD3qH2OA9vlxNBqra3lxnTgZHilFPeMBBZIfBC6mx+OoZKMKjkWuYGZnWHj?=
 =?us-ascii?Q?8nl/k0uNsmQZn+fmIFofj99BOPW2CFa5VLJQ6No+8v5KX6bl2CoR5QXOhQGR?=
 =?us-ascii?Q?ZruLeMkYJgtlSXKnc/qLyV/aJbj7dVltex4GgdZxofdiI3zW2d267mtyy0KA?=
 =?us-ascii?Q?PRzuWBIhWFNXWKI5hUKueqLazK6kEkjnN5y934Dk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8da90c6-4b41-4b52-4b88-08dc2250f932
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:37:15.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f05WXBcETH83OK86psRfvKrw2Szp9qy7b8A29ZnQD3Qgr5/a8k785SKzJ5HvTGwxE2sc2EbKjXOhRUiMnxJ1dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

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
Changes in v5:
 - rename usb_wakeup_clk to usb_wakeup
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 8f2e7c42ad6e..de9f9accb040 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -183,6 +183,20 @@ mqs2: mqs2 {
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
@@ -1167,6 +1181,50 @@ media_blk_ctrl: system-controller@4ac10000 {
 			status = "disabled";
 		};
 
+		usbotg1: usb@4c100000 {
+			compatible = "fsl,imx93-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x4c100000 0x200>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
+				 <&clk IMX93_CLK_HSIO_32K_GATE>;
+			clock-names = "usb_ctrl_root_clk", "usb_wakeup";
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
+			clock-names = "usb_ctrl_root_clk", "usb_wakeup";
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


