Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6534859E535
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 16:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243192AbiHWOhT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 10:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243944AbiHWOhA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 10:37:00 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D636515DB3B;
        Tue, 23 Aug 2022 04:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFxyDbbcp5mOGkSl8awC6giH3INkBlAm7JSkadgCSHBxTKjlrXLUVA93QU3icUGwy/G423pTBuToctFyhco1UK1bxloP/zThe8XguTQt7gszJNxZtCddWzDmqv0yIvniMsh0xhoGooh4nviz/ANakwLY5vxHMMJD5Tb+HM5X6KKx1pTO1tJuxG58nwYe1l19e2OGaKIMv942kyyuUfCyj/KuxeD1iaWcHkwM/aMQMRmeeKOh01SmtaAZyxu3hLSaiyFBFSeKXyWQG7Bh3en/qnRsi5TX/wDVp0vep1wcAoZ606LBGcL+QHbEJoD/hvKHFGrf5IagJ4dlU+snyT7MdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eIcy9yJgn4z686QFf811NahE/M9NAEaSyrZ3wYKCQQ=;
 b=kVjjP1G+XZGM9NVdSadQGQCqwAE9qehQ8WnTtmHyvlVhMXHioPOz3bfXHR3ALi/NQ0SbMwNGVp0wj3l9Ke1BkElGA2mwfSC1H8rSvjfh9l+buH4rWm808SuawatgE5ZwH/gzZtzF8xx7cZ9zXJgdk89GZgEtJBbcvp1kM+3Lb2P6e3GwneD234yQndY5sn19pf37E21uTW6uq5Om/FujzZOCS5bxvFpbFArcIQrKKrYlf++/yt36lkYVUCSyKtzXjZKa44uIkEXJvFBi8pB2tJIDtfYL+oDQcJfOydGvth7vKQ0P2wO394wWzPEWgKLgNNS8VWWAGYd7MaUmuO+5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eIcy9yJgn4z686QFf811NahE/M9NAEaSyrZ3wYKCQQ=;
 b=FTzqHmBhX4SnaGMPsUMo5bzwSj6NVBpdpJSG7SPykWBAH9ibzyF4E1TbYu1uHO+JUDcnx67fEdYSgdlmHHkUWuEa5nXFQFWHTihCnfJtG7AEJxzJOTiYaI0mqKY9j4+AKYXQic61XgXc/kdxEN4w5cm5OP4cqDXyqUxsWkBHJJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by VI1PR0402MB2720.eurprd04.prod.outlook.com (2603:10a6:800:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 11:53:26 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 11:53:26 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: imx8mp-evk: add typec node
Date:   Wed, 24 Aug 2022 03:54:29 +0800
Message-Id: <20220823195429.1243516-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823195429.1243516-1-xu.yang_2@nxp.com>
References: <20220823195429.1243516-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38e7ec1a-0268-4f31-48b9-08da84fe167a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2720:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8IVi0gvJ1YvxoJdow2bTYvUlXhJ3H1dMUpS1KG38PCZn32CoaoLLIMcwf4KCYUoW5T2Uc8nt6vzUP6vQYsdyc8ao/QUx4asOqflXhJWMG+x3fxJt82yY/EtfppSoHk+Tsa3tnLuhucrOR5mxzxjYWx3hFZzgzsx/IWMTOo9C/zYLlEU1+nYOnBSmgROJacqE1y7RvfGlNdkX4V4IZF3G8aoUx8wbaruvyPQiGTHyS1SVFoBRNYJhzhr2jB3Nmrzv5zYYhMmD+ROsEzUolYoHFIUEKGT4RvWuOTxPuS1sxYirt3LA/rb3qvG/1n6tEks10Ab/OQFTmebwLJuW7UymjEdLJuhGQvjLPegrzVOy4Y/u16539togyAlI7rMGD622ADL/8G+erZ4Hl9vupSiWLYTsZeThdaGWq5UPyBCDb8ysS6PvP2XTOGVDazqsTaPuJSD6nxKKpqOvB7q95Kd9YrHSostEP3XpeBB30WXllx7xF+K8i9mGnCTF21/YfV2jOTuQcOY4O9UKXfSL1RGEbBouKvy5t/cvXRFF9mfhQsoRY4MjL6inj/ARG3VKUB1rByf6Z70yfj8NHUli3/C58a3BuJz56bKMZznMHxiHJIIyn7ePT/SeEZTCq1IK2DoLZX8kHoIqbC22t3T6L8qvhbvTllRkV/qEJjkiqd84vNFSYUGonUDPkjsJ7wwm48MrDVZeB5eczli+x0SdWHnjh3M5Kr+Ic1bN86SxO0YpCGjxw5MVL41iPYAonmlk9LhmXTJhmiwXX0niamdSaCdnn3DA2/modi2qlLNYbB5Svqtkuiw1ZXZDco5ViCof4AdSRlOPX3xFRpFuJKit+t9Ghw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(66556008)(66476007)(66946007)(8676002)(4326008)(86362001)(38350700002)(38100700002)(36756003)(186003)(8936002)(26005)(6512007)(52116002)(1076003)(6506007)(41300700001)(6486002)(478600001)(316002)(2906002)(5660300002)(83380400001)(2616005)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1FEIMQEbeMjHB8M6VsAfvBJTQDqUqQ37rgLaFMPc4VmBja0gUfHFyer+Cid0?=
 =?us-ascii?Q?BzByxVWF5JxZI4HNZKL704vNcr4HjHV6JaPsPaJ6orGUmg4TBed8GGzHV4Fh?=
 =?us-ascii?Q?ok71x+dpUvRz01tvmhd+QbsAkeDbfDY0NcOy0O/19inyYP8/BiW2lQ89aOTK?=
 =?us-ascii?Q?3vz+KZEUzLkNTPagHHNLotkiEUHbGC2gwMf5M+R0eHhyKnjhT+5HpA5AYOO5?=
 =?us-ascii?Q?tdODhRr6GHzxPzNVK4Mn3bUO8Xn4wuRgPmiPMKeSxWHAMy2yhFP/HqAnoSTP?=
 =?us-ascii?Q?mBNj8BqEeEipj0b6K9GcqmMMY8Yzim29DhcdGTZHfgbvJthGxPQX8sdUyVh7?=
 =?us-ascii?Q?hDBjjVEmHoXTTnXu78o8hZ1OoyLr+hlpfLng5N6di64L/fJA+Q/OZIHB1WEq?=
 =?us-ascii?Q?w3wFc+ZdOT+7xdmimFdwRU3en8vBaE7xaly9R3L9LQrQutXmd3zseyyGC4SN?=
 =?us-ascii?Q?78jaU0yPH997CrI5g/LHx2h/lC5d3tFeoox5BpitcQh7l+GhTqgkl/daLy0Z?=
 =?us-ascii?Q?8EXVt+ztNfu3BVTJGKY5804Jx4ZxL6m24eefrkqrf6LRfNRMC/VzaAUOUiSS?=
 =?us-ascii?Q?HxOOMD9FouzJutVNyPgSxNWqkuoK8FWo9cQX+mZl4xN61G0C2x4nXT3dGXYd?=
 =?us-ascii?Q?267mb35YZJmo4bmcNg4Jo56vs1I3W5lfwwVTqGjpfek7HuufOYO3soINHoeK?=
 =?us-ascii?Q?VFGiLS99KPkgwGW3hNEWKCGv6SP+aYu37YNiU4hbnKoBwTckqBktnnzLYXkL?=
 =?us-ascii?Q?Wc+8dKkiBgBsewj/KyyU9cq1ulGeaUI63eKQdjP1u7EkCSWSLa9UI/QkKhb1?=
 =?us-ascii?Q?Vlle5C0qa2Nz4zbx5AgAzoVRad9zf7l2fIArvGW1vslcZX+y2In+YtnbSM+q?=
 =?us-ascii?Q?eqzIadxTnM+lc1x8+pYUeiZ5Eftm7zIzPd3C7PIkp6+pjQ8uAHdHfk8WiCfk?=
 =?us-ascii?Q?oIbXyULk11GO905IOGa4+Cj4dFx5dC04Ac0nGL6R3t1HGg62c7ZNGpdRzNJm?=
 =?us-ascii?Q?CVFkhq5coIhZORAPo4++tOXTvcS/AFFtBc6B435s6BYh0c2yEBeTUapDvLmf?=
 =?us-ascii?Q?DLt7e52FaejHe8XEnZ9SdnJkQeEsgOmITALyhZFBr9LLjTXx8pnsFymUzcMQ?=
 =?us-ascii?Q?jT0WmZ6Z8/qQdnSNgWR7qEEJfGQaF+EBOb5KLAc3AZoaoFnBd8AZ32fGyZAm?=
 =?us-ascii?Q?MTulbnsocoVKqFVjYN7fY2XBCMICsc9mpJWTTJKowVQdJdb0UoXufpDMXoNE?=
 =?us-ascii?Q?l1YAXQl8UCO41KEHjefiA/4yk8tlasl9Rg2YLoq/QNIKLEg+azPSs5acnA9X?=
 =?us-ascii?Q?ClpHl+6Esp22H6IEUd3uGNiGVLRY1KN/dELsu1slSCQeJ5tgMrA3GOaNf4An?=
 =?us-ascii?Q?yH6HXE+FvN9nY0V7Rw4Qnj05hnaMqjGYCB7I1H6yZYpgc/TDhi3vgz/snD87?=
 =?us-ascii?Q?oyY9tvCdjV8iY8Bo6I0A77sZuaHLHFCfkPg3LFJ+t8FuZc0eJJIQPdf059nc?=
 =?us-ascii?Q?zs054Le7hrvFHDBQbhfwAqySE9MqQG/Q/nQ2KqYBL93OAliDDzTSZk0K01+p?=
 =?us-ascii?Q?Ok9Vd1okntHsbrYjwTAHkgX3BLJdBurwxgX69fqK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e7ec1a-0268-4f31-48b9-08da84fe167a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 11:53:26.3143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qm9/USsGP/s9oztejbAQ7iBV1G1H5zyGgZkF/sQKRA1C8XLdr/inkm1HaqS4RiN/LWzCU0IWRBVu6P9me8S7KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2720
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The first port of USB with type-C connector, which has dual data
role and dual power role.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v1:
- change mux controller idle-state to MUX_IDLE_AS_IS

 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 122 +++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index f6b017ab5f53..a8e45a724fd9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
+#include <dt-bindings/mux/mux.h>
 #include "imx8mp.dtsi"
 
 / {
@@ -65,6 +67,22 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
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
+		idle-state = <MUX_IDLE_AS_IS>;
+
+		port {
+			usb3_data_ss: endpoint {
+				remote-endpoint = <&typec_con_ss>;
+			};
+		};
+	};
 };
 
 &A53_0 {
@@ -299,6 +317,56 @@ LDO5 {
 	};
 };
 
+&i2c2 {
+	clock-frequency = <100000>;
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
+
+			mux-controls = <&mux>;
+			typec-switch-states = <2>, <0>, <1>;
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
@@ -361,7 +429,41 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	fsl,phy-tx-vref-tune = <0xe>;
+	fsl,phy-tx-preemp-amp-tune = <3>;
+	fsl,phy-tx-vboost-level = <5>;
+	fsl,phy-comp-dis-tune = <7>;
+	fsl,pcs-tx-deemph-3p5db = <0x21>;
+	fsl,phy-pcs-tx-swing-full = <0x7f>;
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
+	role-switch-default-mode = "none";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
 &usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune = <3>;
+	fsl,phy-tx-vref-tune = <0xb>;
 	status = "okay";
 };
 
@@ -488,6 +590,13 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c2
 		>;
 	};
 
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL         0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA         0x400001c2
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c2
@@ -527,6 +636,19 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
 		>;
 	};
 
+	pinctrl_typec: typec1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19      0x1c4
+		>;
+	};
+
+	pinctrl_typec_mux: typec1muxgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20      0x16
+			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20		0x16
+		>;
+	};
+
 	pinctrl_usb1_vbus: usb1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
-- 
2.34.1

