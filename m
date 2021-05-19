Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23251388832
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 09:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239548AbhESHdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 03:33:21 -0400
Received: from mail-db8eur05on2062.outbound.protection.outlook.com ([40.107.20.62]:44513
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240317AbhESHdU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 03:33:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntZV8UWcHiJvzd3h21zezb3Eln1aDVcIrRtsV8T/eUNUBgRQDyI7NUJdszE5gKcKNTOls896yqzJp3MdJzZBFYdW/JARJ5YPvDWde+Y2N2XBHZwmcvnaSrUr9snwLgD5XYXdaYFOdztHigfRRQIu5rzcjYtiE+l7gZji2iQYu8OS5ZvPDMB1JSG1m5WKfDer50R4KBsGxL6GZVmTG99X+55FSU4axnzTjJJ59/Bt8YJfheOT/edewS4LfMQidJZ60Lit34qJn+kgcSgo6FXES0RSetdaXDQlAQ+JBTCWXLn0H1EkNbGx/12qlJSlFvmVrYjXvewQIX6zzWpMF32QlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB5AYziqxXaSieD11d32gB6lRYt/RK4z/qTAjFdxHl4=;
 b=Vmlc1rb9rbCGOT5jsFSjqVoLCHIR3vYtq1/JA6sgKxIlGDgpDMsJ3RwBCWXDrB4atJgPDVEOnK/iDrgLpDhlanD097DnKyAMhzYKztD7VV50K8KroabS3M6vTTBdxQ2kf7Qq2BDr8jpJBxPgbOAMlzUA/jFGfO8a1l2fH9qxg/+SAMuy+q2u9Lyh6ZLMQj5jUWxZbjKpwKQ6L4pbgOl46PAtys2EkxGOkF907no8/VFVsAa3qvE6RLBKkKxninSwaJjGVEG9FkHEzASsWJD0uF3Md0XZ7GDRFFFIrPF2T03C0mnN0apEttAV7uBIiXjUz/fxzb1i1ouCl4x+pbDRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB5AYziqxXaSieD11d32gB6lRYt/RK4z/qTAjFdxHl4=;
 b=hiFYjSbW+KptSIGeOphvKB9Llix8dSb2pkLH5nTMr10HF9kJootpJ5r/4Ft4xnc9ZOrwOge8Ea6FVe1yAJ7Bwf896WeFXqCRaH0Aj72qyF5QyMLksP5fsWqfDF976MwXGIZr+BsOR/XBSnbq0yhDF7l1m7o7mJVWW1GcISRbY40=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB4783.eurprd04.prod.outlook.com (2603:10a6:803:5e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 07:31:57 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:31:57 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: dts: imx8mp-evk: enable usb0 with typec connector
Date:   Wed, 19 May 2021 15:14:50 +0800
Message-Id: <1621408490-23811-5-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 07:31:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98f4c95d-856a-4126-baed-08d91a982edf
X-MS-TrafficTypeDiagnostic: VI1PR04MB4783:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB478384DF773045B4560DCF27892B9@VI1PR04MB4783.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /EZAYesQZ4kGz6cXJ7UaZPiLKnsp9JSihtze1pRX5T+/Dwy8+mAytdQNM5JxsiUTbRQk/uzXlaKnk4Ipresk14kMDq6IFf8ksUtfBqTy74zh9+b4zOwuSmg+ZM2BOd/SRHXTgpcIK+XdpodPSfjLZocTdRVyfM0uVXoaTaXXP4aFIGp43xJ/zoT6Gw+fsx8gEyC7Wpc9Ls+rs/+Z2lFTsWlodrdc8YPMJK+4LbcsO+H/lVNFMKXAdtwAKbD3tiyB+WKX0k3EqJTGhXD2Z5TQW+6/b/c+HatPsSFI2FgOHl8hYQG0g2sN66aEgcSVy1uxDAD0ZfDsYamQAL4EsjJpFTo+4HJxouyPhiKa+7jGg5Ac92oIFQG1eboLyU9X6y6fJjpk2WmIkMmm0pNvjVylnGwid178XwdJJ03Z41/yjS6BXyMpNlPgr1S0oCydZDslJcD242Ygk51VZEVHfLrOLNnW0kVTdy6u0CrPX4zClmE9MQWrk3iVf7qXkYAVQPwmjsyp0h4cpX+b0+o4bvyG9RCd2V+yAFGzobfCXXtON/vU750E8nyS8vwx/Jy13Q3/4THnZn295xOHk1w/kEbsAONqno/OMqsa70+nu5ps5vnvBqzYD/en0ZOkEBpJZiv9cxZFTM1UOoPrV3uDeZfY+usHmKpZ+XtsrEK0+iDSBU4WaHKYDeznjsMfZrsNVUqv3lM1imj81TSVqCC9uMlWKKZhHRhcbd6nkOkoF+cc/+NW6VjsMjkb1WDqkmDjon7W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(6506007)(16526019)(38100700002)(66556008)(36756003)(66476007)(186003)(66946007)(38350700002)(26005)(478600001)(6486002)(6512007)(52116002)(956004)(86362001)(8676002)(316002)(2906002)(83380400001)(4326008)(8936002)(5660300002)(2616005)(69590400013)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QzkQwL61kHN7cO5XIJAI+moI46ndbbUymC3NT3eka3aTwpTM1LdwxmxS0oZS?=
 =?us-ascii?Q?HmgyxEtd8JdupK4BFxUe3bxjgAZto4r37v3yF2G1Zd5/frGDDGAweFUU1eHB?=
 =?us-ascii?Q?i+jSBhuuMniaopJ2FK+Q/Nw3TmYMAgyTEhGSwcRAUDHMMoth2CLl6H+6YF6k?=
 =?us-ascii?Q?IYYapcdR3G1c0GLv/NDp3ZnVo4I9KKjqh9hwcGG+NDOlgUdJfS6o30Qf/bm9?=
 =?us-ascii?Q?6aBglu7UjeFxOle19jk5NTyX6xlrpTDhzBh2Ydf6ocxgzknvQWmyA08hJVC/?=
 =?us-ascii?Q?QuIF/bL1eYdfxs00EEbUiuhb/gsicSWKtLzxGavTA1zYMQsn+qvdH362HAVk?=
 =?us-ascii?Q?fwUYMykMQYX17GdzeWCDo/iySyzSHQfXkJqFAIwtx4UQqIzYYPXTM+D2TLKb?=
 =?us-ascii?Q?A2R43qDgXcwUdm9xv2ow9HQVt5qqgMXcHuF34q/48tlrJbYA3gI21MZFa5mX?=
 =?us-ascii?Q?7ZULMA/J4Uy4fZpIxCYppuCcesd4utRcAN+S9MNgwFkhHTy3UBxYkKUFDYek?=
 =?us-ascii?Q?41YxrvtM0bWSzfntdoYs9AmfVMm0BOX4dkF4HV/GM07UoBKQeb0mQgez13Ol?=
 =?us-ascii?Q?21sXmWZh466JDMJ6L35+n9Z4UEAWqpkd2L9bzK0cr/y/vm8j1nAc3wLKmLkw?=
 =?us-ascii?Q?qnpiTjd65WkyUDaCmyIHPmU4pUEna7lgSFQL0fA40YBfrfvKzwNFETVuOt5W?=
 =?us-ascii?Q?n6eOnba0HQDvmTu9SJJB5+G1PpljqfDfmcZkE7SXvEQrozspb0mZPQc1jTe2?=
 =?us-ascii?Q?vcMt7WFjgZfhnwZzYgIbSVxUsth/amx1UfonQOmNGmYV0SB4zQeCVhf8EA4Q?=
 =?us-ascii?Q?HEJFkabc/C3KPAE0UsXWuaWIxFQtV1NL/Ggl5Hk2EGuyylCYIL2JBtjLUU9W?=
 =?us-ascii?Q?xqtzxImn2Hi5Wrknm3tL8R+tGD4GPEtJkwVmz2LumbkX5Rxs2mhIWDTjvBx1?=
 =?us-ascii?Q?Mrz/kNP6WsM3Q3AKrQATxHbwwr+F5ni2WR9kvvSn3eFD8FEhz4GIBV4sene5?=
 =?us-ascii?Q?Qav2jfxZahf00YEv6OuDuf9kM+wDrqrYNd4OVx4D2mZ/+0mMG3JV5DQ/5884?=
 =?us-ascii?Q?4VBlAksNWPzkvtg/LiTrHLegRCYWK8UqlC7JkenOMwfyKX00HHSRf64FxlVD?=
 =?us-ascii?Q?J71KDs8yMh4UcQj+Fo9JqFLDVGwcfwR5Hryx7Ma9P6JJxj/GiU5Uxenk2Tj+?=
 =?us-ascii?Q?uVrR99yIEHndzz/R+T3tFBvwwGWqQBaSX1oKJ0NBvqRAmbySo68iA6Z1jMZQ?=
 =?us-ascii?Q?KiV4sNIG8vh2T0iCl/CwgTXudfyqh4vGnkeccGdg0Dx/ytmwvABMzVPNGMdL?=
 =?us-ascii?Q?HSKGgwy1UxV7gTd6szb3LckV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f4c95d-856a-4126-baed-08d91a982edf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:31:57.7379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrX8XEM6dVENfmYuEe7oaSPILm/k5j93FZE8ntafhA/cequxQv1yjwJGrNLSfFQL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4783
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The first usb port on imx8mp evk board has typec connector,
it has dual data role and dual power role with power delivery
support.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 110 +++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 2c28e589677e..c69514910eb9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
 / {
@@ -65,6 +66,22 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	mux: mux-controller {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec_mux>;
+		mux-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>,
+			    <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		idle-state = <2>;
+
+		port {
+			usb3_data_ss: endpoint {
+				remote-endpoint = <&typec_con_ss>;
+			};
+		};
+	};
 };
 
 &flexcan1 {
@@ -104,6 +121,56 @@ ethphy1: ethernet-phy@1 {
 	};
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		reg = <0x50>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <19 8>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+			mux-controls = <&mux>;
+			mux-control-names = "typec-orientation-switch";
+			mux-control-switch-states = <2>, <0>, <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -137,6 +204,29 @@ &usb3_1 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
 &usb_dwc3_1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usb1_vbus>;
@@ -229,6 +319,13 @@ MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x19
 		>;
 	};
 
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c3
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c3
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c3
@@ -242,6 +339,19 @@ MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x41
 		>;
 	};
 
+	pinctrl_typec: typec1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x1c4
+		>;
+	};
+
+	pinctrl_typec_mux: typec1muxgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20	0x16
+			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20		0x16
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x49
-- 
2.25.1

