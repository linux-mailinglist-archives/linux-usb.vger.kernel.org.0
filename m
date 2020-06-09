Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3241F3993
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 13:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgFILXy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 07:23:54 -0400
Received: from mail-eopbgr20076.outbound.protection.outlook.com ([40.107.2.76]:15630
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726083AbgFILXv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 07:23:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ3eX1D54W2wYfeSL6z9AKsp0SY5d5ymMbzOsabwACn1K16qv+aeqktcO1H2cTE3jlRjjqLEvfH2ZAwR7n1HkCy8TdgE4m5v5/tk/1pLosTw7Z/fvOG+z4ROfT7/CUtIXxfkgDRUDY0XwehiNVab3PG/4QaDm/iFjSDBoNLKPcAPs1gvn0syMI3OZDduCRWfnm0OUAzGiQhZCj1ij2/tD2jPjytAFe9JEQX/oIxgeMJja7pRNOGuPn1l1bQ6pCCm+pn6jPSy2eHGUQXAG6mOUtHgEjBYLAZBYE+QIPLYjcc2m8T3iuKoZqRUSAW/hMIcuWQHjFz/zOvuMu0Adqhaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9vjlQyqVDnTL6D2PcHulwJP09ovPZl4b6VF3ZnoUME=;
 b=j2iu+sJGjmfDsEife+WTnDRvJGVf4iSRgZ+e7/RNi4gIIPrC5r8e1i+Fw74791og5XN96OjpNB0K9GEYrSs4U07UIsh5HqyKtLL7m1swFveL1x4Ev75ofZmRAv/Gr2dwCml7HNM3mkr7c+uJoaI5DCPIu1HINroZ8y6yV0OYCfmBk3trTaHzeyn04Gc2vs7ffZqycifAd9P2bjomUlXpMtMvcR9czerYyYb0nf+ugPiNOjaI+u/PO26LyEVmFnRAxfofMcgddMN+AohWdQUtoX0SPX57JvOpcDHZ9nEN8X7Ms4qP9ZgKWzX4/xQP5+gIJM77a+SZv0Zrd0t0qIFLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9vjlQyqVDnTL6D2PcHulwJP09ovPZl4b6VF3ZnoUME=;
 b=cyDn+hvBrL6D2cGflsV6Yre8E/YeZST9zz/Wy14eYy5AhsnokF8y4GbvtaBQVQ+H3dy6qZw8vHb+RK7PVTVok/0w/WJJ2ZmvxTqOp427mGviT44OmMJIG1H5VDaOZ9ld4h1pyvD0SCR2b7kitzG54vGgepXHCgVamOH/VdXyoU0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Tue, 9 Jun
 2020 11:23:45 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 11:23:45 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, peter.chen@nxp.com
Subject: [PATCH 4/6] arm64: dtsi: imx8mp: add usb nodes
Date:   Tue,  9 Jun 2020 19:12:43 +0800
Message-Id: <1591701165-12872-5-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0069.apcprd02.prod.outlook.com (2603:1096:4:54::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 11:23:42 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c2af535-833c-4c67-e7e0-08d80c67926f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6589FCE426AC977C1531E15F89820@VE1PR04MB6589.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bo+lFgJbHKsjQLb9/9JhbkrLkOJIOI27ypm9Qj7KfrMqbJiACZBFB0CHec/d0rd89S7Lw/au2z3tus7sDc2TUj0wNtEqo+uiBLcNvW2cR3SM7GdTQ6QZTL5VNOweVqkg3VY/JCk1L9EXiMSJ6/6Kp36L/yOCXOmtpjkGPsHu4f49aXENcsGXFcsrGkpnRHFWG5jGrAyLafi7g1VT+59N3WOoT4BJoxohiDPppXC2YyLZvVvQxAKxsb+Xm0GBa6bMEdjb0LPdJIsQ0aYAgznG7AlLAyUGfDu/tvOWBG94NA7IJA0DH8D3YavmB5MsiZPw7icmZkwWplvkjuXoI4QM7JhZjhjnIWqMl8+x8ZgBqeDd/eVRzf800bfT5Bdd3M1Jlv6jlXuFY7alqKgnYGvqrVNAjO9AbSscfJ1WU6JGjBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(8676002)(4326008)(8936002)(66556008)(66476007)(5660300002)(66946007)(86362001)(16526019)(36756003)(498600001)(6506007)(69590400007)(2906002)(6512007)(26005)(2616005)(6486002)(83380400001)(956004)(52116002)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: GtwYerJbBGOc1gQHF+5++ciOXnS/wYCWY36PnU37Gp292ktyBBY77V8nTS5VTT2jpAmuPvdL1Ey/xNo4RzfyQTsP9M71nRNeZlHZf0j5zwycEGMYIruzI+xHQqIwayvokobC9fMdfifoPqQsuAiZXyVeUQ9PAbX1Rqn4qkD0W/QLrbDR/1QVueXzJez/LrImaf90v7zDf3iKAwjqNKj7c4SltQHXai/bBi3KSNdY3eA6/40/iSRKNXvEPKlUad9qaQB69SkrA0033NyX0psSE9/UJoeBKSEGpWJjzQ4Ev4JvxnvIo4xmeeG8Ji70Pa347zvcwcx1N4mOK0AUPBwP+oUcrAx2r9JMKmL1dC6d4FHz79jFQvtqj2eGVPpKgx2vc/CEGqsl+ZC2TthpUxU4Ixn67j1maJJarR/rc/QPmo1uHC2h9jnTN6imN0ukQjL86lhztlbDgDPRt/UxKCurov2b2K8M5x+YURV4C2BWpJk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c2af535-833c-4c67-e7e0-08d80c67926f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 11:23:45.3315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: of8FsjKhrxKCHA3Mp2WXinzZXrb2iqUagOpQM/jrrIT0SOobCAyggoxYPP/sSu5s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6589
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

imx8mp integrates 2 identical dwc3 based USB3 controllers and
Synopsys phys, each instance has additional wakeup logic to
support low powe mode, so the glue layer need a node with dwc3
core sub node.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 79 +++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b1616e..b0a0de8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -650,5 +650,84 @@
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
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
+				 <&clk IMX8MP_CLK_HSIO_AXI_DIV>,
+				 <&clk IMX8MP_CLK_USB_ROOT>;
+			clock-names = "hsio", "bus", "suspend";
+			assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI_SRC>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
+			assigned-clock-rates = <500000000>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			usb_dwc3_0: dwc3@38100000 {
+				compatible = "snps,dwc3";
+				reg = <0x38100000 0x10000>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy0>, <&usb3_phy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,xhci-dis-64bit-support-quirk;
+				snps,dis-u2-freeclk-exists-quirk;
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
+				 <&clk IMX8MP_CLK_HSIO_AXI_DIV>,
+				 <&clk IMX8MP_CLK_USB_ROOT>;
+			clock-names = "hsio", "bus", "suspend";
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
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy1>, <&usb3_phy1>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,xhci-dis-64bit-support-quirk;
+				snps,dis-u2-freeclk-exists-quirk;
+				status = "disabled";
+			};
+		};
 	};
 };
-- 
2.7.4

