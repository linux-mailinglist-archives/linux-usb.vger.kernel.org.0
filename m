Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BE5281806
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 18:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388092AbgJBQfQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 12:35:16 -0400
Received: from mail-vi1eur05on2046.outbound.protection.outlook.com ([40.107.21.46]:16849
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733260AbgJBQfP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 12:35:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnwZlngejtZtZDxDLm51jMzMctBVIBPEvsq5qWPUtSKMRRYAozbf4bGPrJnpQaqC1U+advheU3vIz5i13cu4zHFUkvvZKpYdXN7xNGfbO6zT3j/1q8xgcWeAQ9OwgtvUmW0TJIWHD2MghJlL5iKNQNAG2NQfXEJgvqku7U8tZFYlQVjt4zQKN5dtayYbN8pGM/WrUmhFVNpHh+q28umNTEH8EhlE/FExrejsJwEueaxm+pMwT3s/SrPfGSo+YGLA4lENab/TGJr7skVpJLsoEii1wORZ9wwg29ao1RujjPSEkvRpWa94zhiAJkIDreqbXF8/QK5X5LZxfpNh1QIzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGx+Z3/QdDoUoM5iX01NE8PnOAQvfCrbtQp5XCZtKAc=;
 b=Wt6Il8aM5xsSPbzsS7z0w1t+S9bKhvLSc1XPyTfuBLUALjD3dVLQh8SGjURh6OoNwCXCbmjaJigOzypwxkgsV5WWM2do5AHTzx1sbefEyoxlZcoLeiFclu0pzKr9PBPlUmgiJQtp+3pnHcnxk7uJM9/ne7kYIhis91ot8SUO6OO29bg4t8tG1rDh+hnpLptZ+5xBWfdnZ3LV2xFlD9PTGqgie2ggVUZ/Uh5wupR57fDN1BSlYx1Mxxx/g1dScf1oH6q8RfgR7vRnlxNBtOFkEQyr/CC+91AxEDUEUPuuYkDbYSvweMPUEmb1Wl01a3KAcFa7/ov7K7I6HJtBIiHdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGx+Z3/QdDoUoM5iX01NE8PnOAQvfCrbtQp5XCZtKAc=;
 b=PKOZcQPCOPozI8g2hKGTWxsfs0OrmDD2oNApZr3BQIT/wKpCKGhczvg8sBvdxjwIBnK9ibXgoAYW/aVKb7EeuZ0OO+9Sm5ySlSHrdFlgVV+uIrbCqK5gbQiHLqBJH6KdYkgcbnq8rbG80W6zAF7E0vHQHGA17NJewWvGogW+Eao=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB5213.eurprd04.prod.outlook.com (2603:10a6:803:54::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Fri, 2 Oct
 2020 16:35:11 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3433.035; Fri, 2 Oct 2020
 16:35:11 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/4] arm64: dtsi: imx8mp: add usb nodes
Date:   Sat,  3 Oct 2020 00:30:37 +0800
Message-Id: <1601656238-22232-4-git-send-email-jun.li@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0106.apcprd01.prod.exchangelabs.com (2603:1096:3:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3433.36 via Frontend Transport; Fri, 2 Oct 2020 16:35:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: de4aa2ea-a61b-462c-fe81-08d866f121d7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5213ED1ABCBFC1DA635D53B789310@VI1PR04MB5213.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Dv9AuRVTYtbBCYGH24YRDF+V/khs9mDKn5P0jsiYCp88saGI4q8BvFaFgRQnYwBZL6Hf9WqUrhxTZM//hyQTj89GcL2pX5/ia6bz2j2hIOs8Pmte+U4qaJMigYyONeCQk+ZGvW8ZV7vJvJK9FL2/MusUeHPfiaiAe00VG+URlDK/IcEDfAIJNDVagXOcKJeWLln7w9ixgcaRVzBpvlM4sCLNQujFFgnjk9qk1yKXZx+ibWAnn1/dtDz2KmuOoG4AH81M97xoBY8WNVQ85WjfWyI6titUQMqFqHTuZa8r/WxFqn7SYV0e24XiDFIP0YsqsqcEBQqZugMrawpM+5R/eKhJcXqdgZP4v29deFpAzxZpCnWCIFc9ix86B5LSRV6/HezgH9p53AkL2Tege8fm8gjvQXRI0HjmV0xo4UzQ6k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(6666004)(52116002)(478600001)(8936002)(6506007)(16526019)(4326008)(69590400008)(6486002)(26005)(186003)(83380400001)(2906002)(956004)(316002)(86362001)(8676002)(6512007)(2616005)(36756003)(5660300002)(7416002)(66556008)(66946007)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: eKFnUBgImiA9BiqBJt+lreiiChnoujnAg7hmZlt4EfQs5A8x0XtuZNmUnDNTOdMyQXzSzJA66D7/+xJaIlPiDuAWWFt2p3moFDijYMnNHOQvbI+hmpfI2JsCMZ4yF+MvmfRU75mt854emjSYnbmvDASNeM/mpqREdyFZ5ZYPvHJQr7n1XeUZjSs61Lgp3ZhOeNQMItHWh8QR4bqtDEwcuQDukL5Uwd/p5RJLyPhaZNrFBxeaXcVVZQjTR0jpv2qUN3rZRPWX8jrqccjwvmYaSZudYbGYOWwwMzlhrqQPWro5BGATmKVhIcsnrFamH5NZiieh6jG3/bISVGYVaoWn9byamP2iVWJrR7RWLcrXpoVyh8Wwrk7FG7NjqmqBs1nSZxn6Zc47ws6iyEVhC8ZGAGu4mPag0pT7njoeE3gGkYvVl5FiOCoiVWvCszxSvKdLA9v/idqDpzmx4QOb+HS+3XfeJmGHwgduiAXd/dkpUTzk4/3r9PvQNCVQ8HYlYeCWwBaIb85NXFDwyqaWI2S9ZhQEQre8LuqCiOAZ2u1eAPKVl0MK/4suCJJaG1FPJmv8v5WOpL/NYEnBttdlO/cU8XI9O2qkurftmLWoiPywEJmR91j5Y7LLUK7uQinv+2rJ4LYO4f6CKWedfnMBzZpBdw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4aa2ea-a61b-462c-fe81-08d866f121d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 16:35:11.6378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vON4vZRTnFGZHgI8ElFag0DxwS5RnptxJzT7aZfZkNZqgk1LUAPUzahQumljCqKP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5213
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

imx8mp integrates 2 identical dwc3 based USB3 controllers and
Synopsys phys, each instance has additional wakeup logic to
support low power mode, so the glue layer need a node with dwc3
core sub node.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9de2aa1..2d2efc9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -750,5 +750,87 @@
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
+			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
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
+		};
+
+		usb3_1: usb@32f10108 {
+			compatible = "fsl,imx8mp-dwc3";
+			reg = <0x32f10108 0x8>;
+			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
+				 <&clk IMX8MP_CLK_USB_ROOT>;
+			clock-names = "hsio", "suspend";
+			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
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
+			};
+		};
 	};
 };
-- 
2.7.4

