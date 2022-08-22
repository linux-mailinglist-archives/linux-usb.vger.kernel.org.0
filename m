Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E34959BA56
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 09:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbiHVHeU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 03:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbiHVHeT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 03:34:19 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036DB27B05;
        Mon, 22 Aug 2022 00:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anmvFsOzpFkhTa5VZZ8CgDlKjmKEcAndkdFjshlpBKStM9nwD9jF10YQ84GNGWb/moPOPE4uLPmugmVkoRb0qZMtkkl724eiQKUSYr7g0F+k+DWh1vVqylcIimryJ+KOQPfchp5qV8qtBvpPoALWV1sLZL6/s5m/06noGH6xP39VW0ct2WgCetJYwsZihOyqefZn71H24sC6WRrww7YToQ82yWDgTzqMSvFBdDs6HJ52qDzmpW72kaML8he9PLLB7dEPiORomaF++IYY08+JHVvqf+No+NX5GVPkhML7hj2Sa/khvbP5nS9keRnu227c9ujXiQRYLQEsL5CYrzvqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NawNz05wLOWus+BE7LiI5Ct3FQmQo4T8Q7CntfkZJLU=;
 b=eXPPrygtFC6wpsZL2/zLbKgCQNyHl+e6BuNRD/rozG47RhJoC5aFuCwn4StFV7LZmJHKL2SQb5fq2FdNMSJOMcCpRKN0AeP4qNG1Kg67AYPEW0EXKDkiHMS6tEkecqey9z73mNAXrGUSROLI82xVJkCmqwsN+OcAFe+3/TgcFrwBhW7crRwHJrL5yI/PUFcTGkEuxt4iRWSfPOeE1/S6qADtUQiWIa0NdMGStD8TXAUfd7ukE9H9dbxY43S4sBnMWBwPVgh7076nOiXBjR78FXt2IKGYw39TuKyGB7hb5m/ummMJWKHvC2v4NrNs/O/toKKgV1jhfaG2ZtIs7WzFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NawNz05wLOWus+BE7LiI5Ct3FQmQo4T8Q7CntfkZJLU=;
 b=eF+fCb7wpjPUb1DO4t2lMWxyEO7XHBLZhoAFbN4d8wpNMivtIlp5Ioc9oDNZDLmj+U4MaCOD5ah1zYpcKgfKHziQUKyWrHAmTFIXRtloL//fGKDuOxorKNdMgiEYnZOXstoWstHu8R45xWJqJrGPITQVN/LFuCi8u96Gtavupbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by VI1PR04MB4640.eurprd04.prod.outlook.com (2603:10a6:803:6b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 07:34:15 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 07:34:15 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: dts: imx8mp-evk: add typec node
Date:   Mon, 22 Aug 2022 23:35:17 +0800
Message-Id: <20220822153517.3747679-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822153517.3747679-1-xu.yang_2@nxp.com>
References: <20220822153517.3747679-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6481c363-8ef7-4f07-e4c7-08da8410b6da
X-MS-TrafficTypeDiagnostic: VI1PR04MB4640:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0f3aiLLjcTmKjNK8TZV1vLjRrROUnjX6tpTxDSQEAH8DP6q7RGfjMYI3RvJUfG0BA0/+5Y6p82AkgDNjhmmGwzNER6Sd5xqb7hSaKx5Ua7mU/KiFSugdY6wcRQVZsHp4LiUDqWPQUdttLHoXSiJCYME6WqhSoLwftCSRkB9Uo6uLc/BZB67YBCqPMwPE83H0ZduUCikQYluJiH3+b7Rud+0rXdPkUv5gJHlMGrgXR6pHOhTc1VF+vPjTPz8gKnori91snhYT5jrC9BtK4UTXjiFSEtgQmyEGZhvD6SvP/vv9XqCO+V1y8Jztho9C+h2VLgOOATt5l6LekP1pPUrvKu0wPc7asY5kIWnofLEDLufpPNx1kXdoK+V7a15eOuKkMmGLEecfegTxAGoaGPs6k6OKgFQ+c62PYhBfajY0hneKXl8w8hU8Pfog1CA0275pgXEMYscAMzuaIfQxbC5cCFii1PwXOVxrXlNMUnqSmihr4EfXOdPAHEc3tCuaaF9TErdLOClOrQfEMBOfiwF6kp52oCEiL4ohNZ2Texso+rXHvylN/o/JpzmKwS4aTG2frqDPXxDofIgNXO3ENmNxv80YdqJVsjV42CA/iy3/EXXL+o+Atk23H+Z6RklZYyz9gQnR0YvbzgwQ9T2GCjC4psLAtndXbg/+aPH7Zhv1ncVSCJLDiX50GAoH9HD6D/+jaS7R0r1f2nfK1PGnvTAf/sQW0p9ffBTlf+gF6wjdMhSeHID3X0DPhC9+QKPw33yCzuK7TI+1tdrM1tCwccaqYexkuuyQvdUyY8ogtTqEOHTDEyJcBbGHNGrulQ7jShKEvxag738cenMFsED3bTBbfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(8676002)(66556008)(66476007)(6486002)(5660300002)(316002)(66946007)(41300700001)(38100700002)(38350700002)(4326008)(36756003)(478600001)(8936002)(2616005)(52116002)(6506007)(26005)(6512007)(2906002)(186003)(1076003)(83380400001)(86362001)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m0gh5NIzkfZi5naz71zple9GLg5WZJqwXn45GiAl2ei4MrP2SJQ8slbfjeMb?=
 =?us-ascii?Q?XFdwVlvYst76S0YLSMfwVEWb7VZ7pdnfw7MKJByO9RBIEK3n0veKKsKifcHa?=
 =?us-ascii?Q?kU5WOR1cPJeFonC+y6cwiiy6OwXv/jNU6Uz4JegG5qwFy3/3WqIfIqM602Z/?=
 =?us-ascii?Q?IrJ1z2VH2FWpw8F0eltxuP4bXsfl824MgQ1Net5w/iwt3rayKh9TdqqmJMFX?=
 =?us-ascii?Q?JBjI68AcLjJniGtBEwKCxUCwz68KmQxqND/ghTI3wzxUK6Is/U92pz6Q/djZ?=
 =?us-ascii?Q?msbazZzIJoC3jPJtP/UOfLNpImVUcqnEByhi7l+m0wrZpnvhzH5WMlJNVoDi?=
 =?us-ascii?Q?HGVNp1JEtR/vfHOGz8okPlyJtt5mk8c2Asrmcv64IiXq4MBzos7/7q6UWdA9?=
 =?us-ascii?Q?VNeTzLEwYH3cRYk6OHQ+pYkbUEW7DEO6qHWfhFlEFC2161nEZjT1L7u0yEq5?=
 =?us-ascii?Q?7hOj30/wulkndh29xGw1Fpdnt2ZMXF7wLFPQBYs5j85/MXLYX9TlaE/iRyHW?=
 =?us-ascii?Q?WPQi05Ze1lLHDwOKhlfrKLYJxnyNVz6O/3kzqUpwzdTPgL2D6yw17xC/fVDm?=
 =?us-ascii?Q?8RmV3/EXavAHKDe4hKqSnbbRQu2nKFXWir0qXdXHKwq1wR63RuyBWCbwbxlr?=
 =?us-ascii?Q?iCAwZh4TXVrik0sc+Z97p4Wln97IFgRhd4hnmCS1oJ9d0d/3bxILhGQKnz4E?=
 =?us-ascii?Q?t4pNYp7D5As1KAZ5smg5HwwwD/ZkLz1cRIvYSzU86RXENpWqETVPYuRZ38we?=
 =?us-ascii?Q?gZLvF968toMOiyhO3faywLCdi5nEEI3sovvWxh6g+YdLu5jnVzGww64K3dZo?=
 =?us-ascii?Q?P7uX4ULqIaMGbmqEhBqemroWnBdTdZs4eCKHhe7XZhIWwAwKekobvtKVABNA?=
 =?us-ascii?Q?Pl8kuQKW0mSUPhfgi3b6QH3e1P7G5pv6wx2i29tzzBpaWdueeZkfNxjVBIpK?=
 =?us-ascii?Q?6pv4xk/QN5F43A10KBjqNwC866Uqv2PHtyqFxWs4iFg86mmdPiGcziZODFau?=
 =?us-ascii?Q?VW30/xv/elkkQAx5I9d3CjhtAIgeUQBn3SUYQj5YQvkw5L8isOv0Op+eAc8A?=
 =?us-ascii?Q?XykqyIbNXkETTxkW6Ffto4jOtfj6U+T65EG3IOmLacYCdoVc03Ye4Gv0Gh3S?=
 =?us-ascii?Q?4bWi/HXQjFUuEz51fOtMgFLPDKqT7AnIEN9QmotHXawpcSb1n1UuY6wJNN2j?=
 =?us-ascii?Q?pQfOazvOJDT2EWCSHbMYmngOxTLMxa+p02jzdn8CaH9wDWGRleBHS7SX+HJt?=
 =?us-ascii?Q?zWI9lXAJfp1X0RtYdNidJk6t0uYE8hfJzUfkYk9j+n0VkRxKhqIsFYm+wCj8?=
 =?us-ascii?Q?4AAhayJ2Uh2d/BZTX1WU//PF5NigQZQfklb63tMq4H9uEeY0u22qw9ZiCoM9?=
 =?us-ascii?Q?oyH33MD4OSf5oavCb4RRz1h7OMIkgoZ8Qj5Kt2Osi2jM1J15osq6P3U97ETD?=
 =?us-ascii?Q?ZAZvra+mEmnkha4W9uARw1O42koogBIdGZIqFsaIn+PSFg56BeZWFuDW2JHR?=
 =?us-ascii?Q?ullxY0CwAgOLZyfOYV5zh++2h+7CFBlfLEopwmxoobBxpxQts42IsZ7Y5MLl?=
 =?us-ascii?Q?uDGJiWpRDLVNH02EHgIboUl9O72xmeiDU7jn2FSQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6481c363-8ef7-4f07-e4c7-08da8410b6da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 07:34:15.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZ2uU9Gfn4EIRGsWKGACYOs6Q9B0Y5JXv/3M2TjXQG/LdRm2KMf/4giy4CE9DjQj/p0jM8ci5cjAy7QGLLp+7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4640
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The first port of USB with type-C connector, which has dual data
role and dual power role.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 120 +++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index f6b017ab5f53..bf0fc6b18164 100644
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
 
 &A53_0 {
@@ -299,6 +316,56 @@ LDO5 {
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
@@ -361,7 +428,41 @@ &uart2 {
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
 
@@ -488,6 +589,13 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c2
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
@@ -527,6 +635,18 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
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
+		>;
+	};
+
 	pinctrl_usb1_vbus: usb1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
-- 
2.34.1

