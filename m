Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDACD2E7027
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 12:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgL2LtG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 06:49:06 -0500
Received: from mail-db8eur05on2086.outbound.protection.outlook.com ([40.107.20.86]:50497
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726354AbgL2Lsg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Dec 2020 06:48:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ok1k4mWCHUXIVhHcU5ZMQvZCeX1aiU9mL/O2ITjQl50tI+YfHXk7z2XIK79pbb4/4WsGtNVaFamvmUBtetgRXIq3S8JhCQcm+x0VM0W96mDJZvd1XUxxY1S47/0HPALWN2Fa2/dIxzNVfs6CYBi3TmNNLW+h6e8UFlqYSvt/591dhG0i2cKnPGGTAoMsNo5WPrsnxVFSf1P1fGoSdsZZnhjw7QZ2iNOtV4R4hi7rmb80Qooy0MU/r06+uvCjupFtbDc5TuLEuWu+ou7zdMPFKtUWQHIf8GBF1sBnEp62NXgrMcDubXX77t0IQklJuo9tYlOmEgiYB3kNsp9cIFWjig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxN7nDy6tJZnbK3PjRnVd1h6xDMixzZSHlIYLZJckXo=;
 b=H2ickL7UJfYFYUCK7Z+CLpa2rlzzb8eP5WL6MLUw2JBh1QBlFNPcwITcIuqGDMyMvWutVZrl+dCZa/9ZlNGQyc6jnhZIWLGbjM7rC6SQbocJ3GmIMcOJuc9wjLuyKRHAV31mpHymHHHpXSKy1BAxJz+BWed3Coy0URwz1GQFlDgfMJNJdDvGitYy3/vnTPDEEySHtPMi0ShcWfVCjo0R6IBYfoDlfNgn7NGyaBq+b0y0L7akE9ZsE2ILS/WUeWts+qZsDOhG7QMtE8+pU298G3eLyTd+TW7j/PQcN8a6j2t7z1fT4nbSHul7EwcXuGz6Ro6JJG2QlHty797GPRr8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxN7nDy6tJZnbK3PjRnVd1h6xDMixzZSHlIYLZJckXo=;
 b=dtJ/KXCabQEmkWv+IJV2A+YOmUh8eFrPPctmfA0N3e70eILZUf4hZAP9xN1gIgw4VhdzKYRf6iNTFN8+0Vlv3+5ZnTcWMDCnjgr9Am4ZG3hczmb7fGCSBP9HCL/91p+lIO4oAPHQyfNdYO/3h6OoWRzkJXqAxzoFbChmW1Qvroc=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6653.eurprd04.prod.outlook.com (2603:10a6:803:122::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 11:47:09 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 11:47:09 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     balbi@kernel.org, krzk@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, l.stach@pengutronix.de, jun.li@nxp.com,
        aisheng.dong@nxp.com, peng.fan@nxp.com, peter.chen@nxp.com
Subject: [PATCH RESEND v5 3/4] arm64: dtsi: imx8mp: add usb nodes
Date:   Tue, 29 Dec 2020 19:37:45 +0800
Message-Id: <1609241866-9508-4-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609241866-9508-1-git-send-email-jun.li@nxp.com>
References: <1609241866-9508-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0173.apcprd06.prod.outlook.com
 (2603:1096:1:1e::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0173.apcprd06.prod.outlook.com (2603:1096:1:1e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 11:47:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd7dc1ae-ae95-4358-ad1b-08d8abef7975
X-MS-TrafficTypeDiagnostic: VE1PR04MB6653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB66533788386E321764E08AE589D80@VE1PR04MB6653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 63YvHa2SRDghLkMJoRgPTW7TdpY9IBpQYZ9FqzrY/vNrB39CX2qVOyfEEm0thC7XZshrE6F776UzunU2iAYj2ggVSXJc10wyvss9HxJmiZWnv5a0t9fi9H0iSLnTk6+mu1VkS4aKV8uhNfUqHhoTOBj0tu8HFtiDCZtsG0v3cUMRPTYCHGKT8QV97A/+wbiAC1EqcfgXZ45DijLj/fx1qTHICnZ28gIFUsHR7ZWkNcsBNJvIF361KF/j6jr19rlnkq0q1ZUPJLjqfkiSVwe5hNmr2xanPRTdsEiYWujGmfYb8HZmZtjTKY8mI8hrVFSAVnmILT4trFR094VcUwleWb7qj7n4csUb0E+fHaHKbUcGYujvqw3wgcmuaM1JexQdQwMkqGKHZ2+4CLPkPObU0RFlvwoGqpEAOOKczMGXbf3jT+J3CiKIYG1wpMLd8PTFUPI7vSdmchc+7/W3EnO392niAMP8vpKFwl7A9v9iog0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6506007)(66476007)(4326008)(83380400001)(26005)(8676002)(66946007)(956004)(2616005)(2906002)(69590400010)(5660300002)(66556008)(16526019)(6512007)(498600001)(6666004)(8936002)(7416002)(52116002)(186003)(86362001)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zAEkT38sA5Aj3Xl9NMOEtL7VVwUu5Ogug0j5Fr8G3QRJ2wUV6/00FSqh6igQ?=
 =?us-ascii?Q?+6vnvzXQO+zVdcSsBLp1JmOccqi511G37TKsoTIGbsU0oxLoh6cyVz1+cIGj?=
 =?us-ascii?Q?GqPJzzp8Fgh4VcLzK+EX29dNhiObWkNHrCsPq0q8KSgEgSYj9JpN0nYgPicM?=
 =?us-ascii?Q?NLg+uZOV4MaSBYugYHAd1DO4iNLfRbJpoZPY3631agbf3anyJ1kJwvW7GiCi?=
 =?us-ascii?Q?cRMj2lUeRLQJ3sL0IwMx/IeFjfC+tvsKyMOTgbHSNukv/cuv38lXpfWWowP3?=
 =?us-ascii?Q?3D7H5RCVcU/IRSgUcB/fus+qcNhY6T0K1bLxR6RPkkrIIAd0S9nc4GIGyjxg?=
 =?us-ascii?Q?nRChxY0CXNXs2kEwbKb26EksSDbMNrUr7mdq/4VSvWpK5iuZMU4OFZ1yIQU7?=
 =?us-ascii?Q?aE8PAWi7ORV1+HGrrpw2XA/weJmbgmolwSrgaUXdI/i7JgCApzyNeKZeVhv6?=
 =?us-ascii?Q?1ghjxDmPj/fred9eF+oQ1NhzG2oxx1B1fh/0uezmJmhn+w9giTKraMHgsht6?=
 =?us-ascii?Q?ByHQmPdiq9v5IgkoUOzXHWy3M2AxxqZpYUen5UwRn04KqVQpFYqfN1km6StQ?=
 =?us-ascii?Q?Xu4iWBqgRwKcFK6FwZhNajKs9ZUwup678653MC8+cCqLXYiAuNytSLjb/mbV?=
 =?us-ascii?Q?jazeMrVEBOrt262GYhE2s1frUACxL+vNCY1pKRVCEYJ6T7AgnIhFyuerktNa?=
 =?us-ascii?Q?4iRkeSW5fGFO5ucwJFCpS39cjVHdVcfQc8DtfrPtcV2dbYyCfFu27mwiya6I?=
 =?us-ascii?Q?0nT0JLaMhHJbifJp/LLHA+k49ptbc32wCQs0k+qpVvajniw++ArQAbsxYiif?=
 =?us-ascii?Q?jtdfEzVgX7zz9H/NlmGPhyHM0u9bUunsOI/9qu23JtnbVjhd+DxC3+5fnYCb?=
 =?us-ascii?Q?brSesfGLQ2tO380S5Jp7WmwOUcSBvgvRVoJqDGm34xBHhSyvzkPoYkh9FVFl?=
 =?us-ascii?Q?PSTdrYE3d7dyLzSYJsefOiGxzVd8m9ZBUi6n4xafz3AMGXKqUJNyiFL1SsCc?=
 =?us-ascii?Q?M+yM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:47:09.4454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7dc1ae-ae95-4358-ad1b-08d8abef7975
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJWm4iPO14RE8GCGVsZQMUtNm6+D+g3jfredli9U1zyVGy2V8nJV8iQhwVWRQqza
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6653
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

imx8mp integrates 2 identical dwc3 based USB3 controllers and
Synopsys phys, each instance has additional wakeup logic to
support low power mode, so the glue layer need a node with dwc3
core sub node.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ecccfbb..22db53f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -788,5 +788,87 @@
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

