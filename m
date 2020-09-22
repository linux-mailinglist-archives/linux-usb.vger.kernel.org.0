Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4D327400E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgIVKyq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:54:46 -0400
Received: from mail-eopbgr60083.outbound.protection.outlook.com ([40.107.6.83]:13403
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726503AbgIVKyq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 06:54:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gguIRyhRBOSdIJev04KoWLR0GZ3lh9b08HL7vK56gCTvFdYRCMk3fjxHkw8o8AG5A7LupXDNaj/6tYZ9juOhz2/1hkxN231H4vkrfBAUi1dB4MiHxce2igj7FSHyUc7MRls9442huS0Bghj0ImRNUBC1hvrO0e+Zk2e8szGDXPr/LywEWq6+9NVBNiTagpmXsFTaW+GMW5e5oD8gZ2fRJ+OzhDM3UAJ98o/WRQRYUq9fHFe1vcWfc7yqvR2KnU106OKj8HJrR0nEdwCjHKLWegrq9FGgIUmgjSVuFqZt6A8U/WIfEUKZXvWONwRX0hWNTTxk2xqeG7Ksp2kfKYWJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI4zXmZg7Uo6OKFNqSKKwim+JAGdaV75yasTPS+Lg1k=;
 b=Y8UfO+ubTv3auiYUh7PN0IWtC3nyBFWjIhQIaxGUOTShzyCx3ZnmYj/aFHYgk9JvnRNV/OoSttJ6WgDo5vhi3pYe001F8H6EJ093mHzZskM8DAXEwh8m1wCXqvvUSan0kQvdFiwbjgW4dnUfg5nxLc1KArW13DnhR86sy2qSsDABlMdEOR+C+orW0/BBY/AbXLvyB+40WvaMxyz0QEL+PdhWnr9Z/VHo+TyC5QT9y0nmffVdJYMtPplduORMPfeXSCQlKLsBQUejP9GyYiYt2cgkKlCnAw2xk7sP6HCZeosFkdlZF8cf6tsN57NMCRApqZlebUM3ngkw/DLvD/Datg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI4zXmZg7Uo6OKFNqSKKwim+JAGdaV75yasTPS+Lg1k=;
 b=GbWx4TUAxj1+GbhTNGoshjEk6N78WOboVIYbPSUpngcyigyAf6ykTKA6TY0PPvXwSRKkWhQG+UerMbo5DdM9lGyMbyvrj7f+LNA7USqaHn+F14+D8JTHxaW1tu+ilE6UMjZ3HF/dHiVjIMrII8oab05DusJL6n0SQMMRH+nKro8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4255.eurprd04.prod.outlook.com (2603:10a6:803:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 22 Sep
 2020 10:54:43 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3391.025; Tue, 22 Sep 2020
 10:54:43 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, qiangqing.zhang@nxp.com,
        horia.geanta@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 6/6] arm64: dts: imx8mp-evk: enable usb1 as host mode
Date:   Tue, 22 Sep 2020 18:46:52 +0800
Message-Id: <1600771612-30727-7-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:3:1::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.66) by SG2PR0401CA0017.apcprd04.prod.outlook.com (2603:1096:3:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.13 via Frontend Transport; Tue, 22 Sep 2020 10:54:37 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2aa671d3-b5eb-4675-850b-08d85ee5e91d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4255C4A659CECF63F52126D7893B0@VI1PR04MB4255.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uU2YNOUQPqiefbfO4xehExoMuZK63KDg4wA2yhy7YpTG1ibNtkbsvTk+1Tdi0ffC5cjvMtJdbIpcq6kNcJQUcol4OCV9ZSFPE84clLa+qokROm2fuB4nqb2kZc1HzsJFMpQ0ErlfC3vSVCbcol8wdt8r3+enRraoHmR00QSrW1Fq2RBi1YuRMEgEhmTzpDchnAvrMKKdifEKNTCjQRsQwvj6dyC9TQ/+GAq2o6TG3ODNa9yTIuMoreH+xjoouNdcAWy0R/BozfQ6GPVQxkFArcaT34wInaI3uIrEtMR7oDy1mmQoA+oqul3aaLWLqN1nBNc4bHIJOK79plSAi597WLxS6W+KH1uqo4P4a5TVfTtWDmJoqDJ+lHhaPpnGhUadODQOp9ZL7cnirjw5WjtjBCjCIeCENuzCbDW+yq/WR8x9ajs5jsu7tY6Kb0/vZK1/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(316002)(16526019)(86362001)(956004)(2616005)(478600001)(8936002)(26005)(52116002)(83380400001)(5660300002)(8676002)(6666004)(186003)(66476007)(66556008)(16576012)(4744005)(4326008)(66946007)(2906002)(6486002)(36756003)(7416002)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XmOID35glFMBc9mxecg7C5uma0tHRPyxSp32mhzW5gDWxkFOrM1sP4C9hZ1HQngMBMYYrtgktQjydXIz5qdliLocffSih9q+5Zpf/G6aLqlU6bO3DT+Bi+d56xK1MwApF+tCVM3S4ypNn96aMr+YytgH5LEjtsysgorsFJoqenS5ARaSDQeHm6B715fS+fUOltuG+vJC2j77cxknA+O/CqRHN1Cm9RVIK5sSsjAdbe/IppOPmVTsHthUAGxgTqC7UJcBIHDo+gUD0IT8NPIRhA+hDrkopHdrsq/x2yWqhoF5oGWi9S3/RSyRvlxNlYBEFDJUBbmSv1bNo6iTvzZAr3xPgy2co/WGqPk/lrEDgyC4HLeTIIXDKeXlPyrK+NSt/c6yArzF1MFsyCW+askdyGJh9PpiKKxv2+Y6K+gs45rqUvYaLifuMu+MCtzkHcQHnLXgIg4Vw8yKxtNnIzrRcCV1f89dJhqaaztLjYaQ0QnBIi8ZaQINrhK2v/Gl8ZWIJjyrtUi2RURlOpYmaMdzWbllDdgurbJHjDS3jumwUFPRT0Irfo7q0YY5z9GQBcbK7dQ3LTzEVa4smAvvKJauSpndUMRx9lXBM52HRBbQSraIk9gWkUsaAggmZ6RoIXJ+U9RwUghivEoLOvIlTtHfVw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa671d3-b5eb-4675-850b-08d85ee5e91d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 10:54:42.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrtQeoQZsuVe2a09rrhwEo0cEn+5HxtT7d2dj2N/Zwv9w7T8FO0KPpi5C2YDbvog
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4255
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

