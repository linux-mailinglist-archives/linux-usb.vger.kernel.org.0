Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87977281808
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 18:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388134AbgJBQfV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 12:35:21 -0400
Received: from mail-vi1eur05on2055.outbound.protection.outlook.com ([40.107.21.55]:30241
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733260AbgJBQfU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 12:35:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyPNgmrMv1hQPZz7oKaCyM6mcqnXd77WhCEs9GLKI4FS7woJs8GaBO3oOZIC+XDpaTiCPP93cJi9mNf/llTzSI/ra2HESQNaQUyRIzzzNhQiNFoUdeEKyOqIFzy6XM8sfXnFjYxjRpFG9SyO43IX8dkdh1a5ihO/rBUn0lPcHvC0OTl6pZMl1Kz/0v7UvkUJHACrc0EJo3MgpKy+93CyUsHpCrogrez4d0dzh1oCtjgu2ItzUg60Z+uPp3aWFSBAiJ0XkWwh+twSx+Gs0F4xukasPtMHuLiWxEGWL7EHxg7wuzjRRRJQiXqwwxymfm8MLU04JdTEhqLAWWL0DGlVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI4zXmZg7Uo6OKFNqSKKwim+JAGdaV75yasTPS+Lg1k=;
 b=fF7cWdJONzvTKzTBVvS26GWE6HFauMhg79VM1m8JOzw/sqV5AszRtYm83cYoBnH1WCiBdU35HPq/nbNYU7qfEzfjfJSWGrVLMO0CafL2+OSq7tRXai1Ezb8kKULMn4eT4evDWH2VQKjxlh5LWpZsUckuSkLWQBgL6R4B6/T4tltEPupn91C3Vp6X3Q1vu4w5fB8fl1oFvOIGoBVEiQ2kIP5yk+Uv3ZK9r+hhOABtQUCkCA1sTXHze4fh10CHPkH7wmevSG22czH4uvzm1E6fNGbiQ0M2wnmvGXFT8DBz9tWJYTZ3wuGV7FgWV8pvIUQmanic7koppeLRqB/OVpqT4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI4zXmZg7Uo6OKFNqSKKwim+JAGdaV75yasTPS+Lg1k=;
 b=WiZK6GSacd3A9m3b+3vWQL+7PynYaDZ+oS2P62JPyzQ2I1vx1SzMLIcadi9k2RUPkGcA2ay2ZSjLsu9U0M6233fwdyOYVdAPr20vPcQL0e/gFdInYUOtUFBzByiE9yE8UxQA+mUFw78DyNlLcbUgdtbruQERb3wlBU/9p3y6hKI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5213.eurprd04.prod.outlook.com (2603:10a6:803:54::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 16:35:17 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3433.035; Fri, 2 Oct 2020
 16:35:17 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/4] arm64: dts: imx8mp-evk: enable usb1 as host mode
Date:   Sat,  3 Oct 2020 00:30:38 +0800
Message-Id: <1601656238-22232-5-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601656238-22232-1-git-send-email-jun.li@nxp.com>
References: <1601656238-22232-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0106.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::32) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0106.apcprd01.prod.exchangelabs.com (2603:1096:3:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3433.36 via Frontend Transport; Fri, 2 Oct 2020 16:35:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d19faee-1c29-454d-0129-08d866f12501
X-MS-TrafficTypeDiagnostic: VI1PR04MB5213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB521382D3E14995DA0CBB867989310@VI1PR04MB5213.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QVb/3A7KvefgU/pJZLRjN2OL03G0U7BC39LGXVgDLn0sC60qt19VCXrPIwx1KGMvO4DKGrZcKE6d2fzcDfUUwsjTt1LOT9RI5sJ494337prQ6ROOk420P7FM5/6cZc4a/ARgbzGBtY34kBlxci53+VhDbgH5j0/gW10uyEuJ5n+M31R5QTqpYYkhqHG7xE9oSaXBoclOtfYP16AyZ5iJZoaKbyUxgCTbg84ifrTIs/1mUI6J7g49iMCvHazAuJV51oGHMRr/FYOXq21a8/4ZUtLFovuYnXJ8ZGjrsKyCiy9RIotENLmQ6OTKsc/lvxATBC33rb0xnsGGmSnn9VCwvBmyTQt7f1gqGsKhNFTc2gL4HXhrZcj3I8ehMw9GhxAC9oC20lIYVwphpqMkUHDsy4ABYAawGcHSZ5pOrSDEi/Xs3/o3p/O1UEVHSDdPJBRj65v+kCdK8e4awnmOMSc+wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(6666004)(52116002)(478600001)(8936002)(4744005)(6506007)(16526019)(4326008)(69590400008)(6486002)(26005)(186003)(83380400001)(2906002)(956004)(316002)(86362001)(8676002)(6512007)(2616005)(36756003)(5660300002)(7416002)(66556008)(66946007)(66476007)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Zge0Ousali8M9fmonFK+JMePowg3XCYMsiB+r5w8P4uYasgXJFXHCuwamHtrPTymep+5Fyr+0CKOLncxk7aJoa29y2QET6xd0CgGRN59pJdXImQOFHvLMlai6hT3yrrA6t1MvxQflGiHgGnAs0IEjw7G9NrcPIMsUJenbWI4BfPrey6XD8xyuGgSYcqUlJNvprrQ0zMOX8HnMrjFqFKSep2RQ3IprRPjQHtPkknxHN4iRj3U903ZeaxWvAV5VlQ5U0eH0KkAWBX8lCUmswXWk6H4Hq8h/LqcziRFYaZNQ+Fr1s6AdOPu3n76WPTM2ogcRSfdKcYToj01HVPDMjr1f7vVOUBOfzqc441NXhk5reAGKEqjlZWJ7Dz6S9CZ1VnhGwXX0wrIwuP2maWRgCe0L+M+eSZCZHglvBU7zOwayJpYQX+zXm4JxHo0wCq6S9+byLxOWHBai+iBjJJrhFtGFqIMb5hEqwSwvPtRajeRcRGLk0y/w7a/kQUZteo9Fk5Ax7aZABuxrFNCvwvlykr8HFd7AhKhQPWO5DLnnUmMmh5OAEMhEA2hTX8C2HEHBDMyWzdVHSZJ7/4KMBxuEyaiBBGDLCFOz3272M7t/kW5ULDmkKL/I0Nv6mTy1mtI9B/Lu+Y+3IsPfO2vyDXcxw+yog==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d19faee-1c29-454d-0129-08d866f12501
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 16:35:17.1197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFFKkLuZl2W5St41snfg8LxFa/vwiyEITGFiZHyDitGmQV43Jqp+pDQx0sTfGGmZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5213
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable usb host port with type-A connector on imx8mp-evk board.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 432c1a7..0cb3b16 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -176,6 +176,21 @@
 	};
 };
 
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1_vbus>;
+	dr_mode = "host";
+	status = "okay";
+};
+
 &usdhc2 {
 	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
 	assigned-clock-rates = <400000000>;
@@ -276,6 +291,12 @@
 		>;
 	};
 
+	pinctrl_usb1_vbus: usb1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__HSIOMIX_usb2_OTG_PWR	0x19
+		>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
-- 
2.7.4

