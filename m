Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F9627400C
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgIVKyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:54:41 -0400
Received: from mail-eopbgr140042.outbound.protection.outlook.com ([40.107.14.42]:62350
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726625AbgIVKyk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 06:54:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDXaCCpnrUNE0qL9M59wGM6J7eBd6DXmfM+wEnQaMiGoA4StmugKxycbnvTbGLTJyIivplQkfScuEiYd9Fl7Qc33JfcjHeQi894ZMFxBge+rLgI22LzJCzoM0OZWnORyhJ4iYoLlcmjw9Yzd74EasHh0inws+YlvjQ6m9SEKQ4g+sDbxpVHsvz4z3o1xBLpitTP+y6lsrw/LohXr6ms1qvcV2tAcSnHFxptw9qbwfs4MbHMJFmo7oqSCq72xGyDFwE/t5ArAGufdPL2bg81BVBr7cHxLpwaq3UvojrpsYJtnkU6Jv9Gjfx/pMNi6mxMuuah/RYqnmkTeU4+Auo94fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0a+X9wc5guutenoiOKhyriP4zoUXBc6SkNCW+vBD8Q=;
 b=UNY+C8h3HkNETUH/Y9I8V1/wKBwPMLnLIEP5gSwUs/P7x+PcihurPcZ2KV8MGzP7e0NchebRx3rHrffT41aPrEkBT0cm5uZMBftqasJQOdZDBtEU23NZ/DFtXUdt33aA/wgGVboBgHMPrOjEVrbZnHzGYslachmI5ErppfFNfko7Q7U5ndrCcGHsYH8FXT++9GEyRvgwgXRm1Y9Gp+oR1lurGRa3SBx3mbQ/8cmAmJvQiCz4P7DCn2Ql59YiWIYCHszk1mzsDGgp50sDWbqT43t7DL7UGJ25g3wEhy0NM9yssSSAIcjBxYspy8YCOrR93JaZfz1xFfLIOJtpqNEt7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0a+X9wc5guutenoiOKhyriP4zoUXBc6SkNCW+vBD8Q=;
 b=JX2NaCKPAQ/7SkpLSCIc8pKnusazL7yT2xnH0Gf0zFcOQbGlpw+qqH51qlh+v4J/J7i5m1OKem7Fje0Gi6NR8bZlaQrUYHogklAsm4bsG+0zloHo1JIddW6PhPO1wEzYEeI0b0Fu8Li1Ia81zdX0e3EKIrDLOk8/IQohu507Wmg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5055.eurprd04.prod.outlook.com (2603:10a6:803:53::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Tue, 22 Sep
 2020 10:54:37 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3391.025; Tue, 22 Sep 2020
 10:54:37 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, qiangqing.zhang@nxp.com,
        horia.geanta@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/6] arm64: dtsi: imx8mp: add usb nodes
Date:   Tue, 22 Sep 2020 18:46:51 +0800
Message-Id: <1600771612-30727-6-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:3:1::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.66) by SG2PR0401CA0017.apcprd04.prod.outlook.com (2603:1096:3:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.13 via Frontend Transport; Tue, 22 Sep 2020 10:54:31 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9a0eb09-31f9-49d3-08b3-08d85ee5e5b9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5055:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB50551D03A333E8E743FCB3A4893B0@VI1PR04MB5055.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5PQJZrTEQFd90YcxkDVubnxpTykgHCpcOkLoYGcYKD6WklUQ7JTciG+kRBPiLnc8kHodsinpciefJYw5/Oktt9NOvdu+48Z2/Cme/yvSZTLlH1Lz/IFmL1d1B2TGyO16OAiaTxSwxzL31rRIyhmq1ylLY46sm5V9QLw8Dg18UHM11gOdYS00OaxnK4A74Dxt7NhRGC3qpubEtRzUpP33+KgqVmYY8iMw6coQbzbav6cUc5fXBgwkhhxhP96z6sPjd0GqzgS7s9Gu4LL3F1Eq74c51KrgWQI13SEvs0IAjUoJp5JoYD3QuhLTpYfp03tyqodT4nl9wpH1w23bcykHK61J6XVG8xtAVKp2MV41qoZiMOnXzVqJN/O3s4rY6LjJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(8936002)(478600001)(86362001)(186003)(36756003)(6666004)(6486002)(26005)(4326008)(2906002)(16576012)(83380400001)(66946007)(316002)(5660300002)(8676002)(7416002)(52116002)(956004)(2616005)(66556008)(16526019)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: deEUqUQBYE33shCOCMtrpBLI5xd/IqeblE5c4OvBP82z1t1Xp2IiZs3W6ztvrJHHzpYxKR+LBEtyjXMypboiSqvHWqSJgkSlZDtWdaDmP0gAv4B2621kB30LZVd0L13myj47J/kDqXbRwrkkNo+Nw/SH04IAPqwHQNczqDOOBgTbCPtShmRjgK0ij8bvebswYDEeP17uiZ97PNTYem8D896osWTRcXaNW+UOU5weKuic2/OcKv3SSL2kbA+Y0Xe/A3YAL6/hSKy/ob8VF2CT02AeFB6eRZ/YIlKJYFd9yGCHok9mhLlve7aeKptYD1E+vuV6F6JQDLaWNxBf+4nN7ghhE5cYhhVIczXnu70+C0dtpIDpCTCqL/FnM7FkOzPKRMEfCiWIQrwM8wBej8XSeF2iDYcVWVto7rQkpqASYdEBDGeAbBAWTpwfYic3wYUDWMWnsdxXZ1QTlYmby7tXRrmeLPZ2GZ2YsqQmnkCLg/KP0x4xh4QaRxmT5KfL2vAmFxvnYXkp4oHhIJIx/bvTNowF7aDqkD+w6aIxevpBPHKuc/VOu8HhK7xHESYzlMFyd9JGTxcq8h+2z3BVDah1eOctF0ZWMFt1vyIQLPuevXodmjooPmzHNyEBSEKO02kk4sqAoO6HAKgNRlGV2Tou+A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a0eb09-31f9-49d3-08b3-08d85ee5e5b9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 10:54:37.0084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hv2lmUIjMpleT5/n3UTQxGdsxAV8HB0f733XQGgtYD9CYzbyKgQboMflyice8r3w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5055
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

imx8mp integrates 2 identical dwc3 based USB3 controllers and
Synopsys phys, each instance has additional wakeup logic to
support low power mode, so the glue layer need a node with dwc3
core sub node.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 88 +++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9de2aa1..1b7ed4c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -750,5 +750,93 @@
 			reg = <0x3d800000 0x400000>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		usb3_phy0: usb-phy@381f0040 {
+			compatible = "fsl,imx8mp-usb-phy";
+			reg = <0x381f0040 0x40>;
+			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
+			clock-names = "phy";
+			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
+			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3_0: usb@32f10100 {
+			compatible = "fsl,imx8mp-dwc3";
+			reg = <0x32f10100 0x8>;
+			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+				 <&clk IMX8MP_CLK_USB_ROOT>;
+			clock-names = "hsio", "suspend";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			usb_dwc3_0: dwc3@38100000 {
+				compatible = "snps,dwc3";
+				reg = <0x38100000 0x10000>;
+				clocks = <&clk IMX8MP_CLK_HSIO_AXI>,
+					 <&clk IMX8MP_CLK_USB_CORE_REF>,
+					 <&clk IMX8MP_CLK_USB_ROOT>;
+				clock-names = "bus_early", "ref", "suspend";
+				assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+				assigned-clock-rates = <500000000>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy0>, <&usb3_phy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis-u2-freeclk-exists-quirk;
+				xhci-64bit-support-disable;
+				status = "disabled";
+			};
+
+		};
+
+		usb3_phy1: usb-phy@382f0040 {
+			compatible = "fsl,imx8mp-usb-phy";
+			reg = <0x382f0040 0x40>;
+			clocks = <&clk IMX8MP_CLK_USB_PHY_ROOT>;
+			clock-names = "phy";
+			assigned-clocks = <&clk IMX8MP_CLK_USB_PHY_REF>;
+			assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3_1: usb@32f10108 {
+			compatible = "fsl,imx8mp-dwc3";
+			reg = <0x32f10108 0x8>;
+			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+				 <&clk IMX8MP_CLK_USB_ROOT>;
+			clock-names = "hsio", "suspend";
+			assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI_SRC>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+			assigned-clock-rates = <500000000>;
+			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			usb_dwc3_1: dwc3@38200000 {
+				compatible = "snps,dwc3";
+				reg = <0x38200000 0x10000>;
+				clocks = <&clk IMX8MP_CLK_HSIO_AXI>,
+					 <&clk IMX8MP_CLK_USB_CORE_REF>,
+					 <&clk IMX8MP_CLK_USB_ROOT>;
+				clock-names = "bus_early", "ref", "suspend";
+				assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+				assigned-clock-rates = <500000000>;
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy1>, <&usb3_phy1>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis-u2-freeclk-exists-quirk;
+				xhci-64bit-support-disable;
+				status = "disabled";
+			};
+		};
 	};
 };
-- 
2.7.4

