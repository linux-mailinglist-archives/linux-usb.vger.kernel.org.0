Return-Path: <linux-usb+bounces-4303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC838168A3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 09:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27FCD1F225C7
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 08:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2807710A2E;
	Mon, 18 Dec 2023 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z0AxsWLZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2040.outbound.protection.outlook.com [40.107.105.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DDA101D3;
	Mon, 18 Dec 2023 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7y5sVNuyrHzuIYvr2chorrcYJa05oxJziEgZa084OLwvUAN752H0ZvkABCQXvm+juCbhFV8STK2tXcA1S/4NyMqb3MLtrSg5hhtqr/Adbayapd9qK788KLz2j2mnB0jyfzCAr2Sl+KgTaufiXtXTUrNQLzxx2scL5rLJ/SHh0bojfJBaoUzpThYYCcXXBWUP3UtQZMQvfl/7jaaUi/2uRtw66r/JofwlviNRUzTFrwqc9LhGocVNqpsVmC38YURtRi/BidX1HuRv51oZ0qOdzT73ZS9lDRx/UiJ5rLgb529EIBWC+rZxELMA6nwmfQOTMPUrHNAsO/Wg5+fU5btvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56VFFqxuWFjT8ZdSt1Xec0Jb00TF/4bmV9528WIcOuM=;
 b=ZY1w/5nZKcFPgr9ijZkIxG2r/R8tQxjc/jNtKJnlR+MDkPktQ62xtq7T8GkAyPjFgfk/9E6vYcS6m1ybsA4WpWpJHpExrNvrKIHsp9QOU7ruAFwL/EDf0RPenin2ddL74EYFirOnYgTvOy7gvGXghDvOimZDV+0Nm2VhVyLar19G/Z6aPZrV6EZe21O17D54JgI1Ids7PM0PKh+bIkFKukmHsnlCDT25/TV5iBlMmIyf/H0ITHjEWE04Aebar/ov3sLjHZ9VJnK72eSBg7kedvpovOfCWaR8qzt6P2iIFKIxBkDFQxnrzxyzOS/hFYhPD0FuNNUC9UCaHkBMJhmxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56VFFqxuWFjT8ZdSt1Xec0Jb00TF/4bmV9528WIcOuM=;
 b=Z0AxsWLZN2u36co+n3PYNLBCK2zCblhoZqkLUtwDyBA4tKkNXM676t96JeNjEobwKVbAPfNPnYKdfaNfU0NTZVrDyfTo9Set8E2B78MNeohIk9gd3A09bfW80h8Q46W3HGgKAE7d19dE/OfeBvDBWcI3wjqG/cVJId+1fQA4Sbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 08:49:19 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:49:19 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: imx93: add usb nodes
Date: Mon, 18 Dec 2023 16:54:55 +0800
Message-Id: <20231218085456.3962720-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218085456.3962720-1-xu.yang_2@nxp.com>
References: <20231218085456.3962720-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To DB7PR04MB5146.eurprd04.prod.outlook.com
 (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 994faf29-8d70-4621-ade2-08dbffa638e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iEHEt9fYefl4oAUu/WMY0NE4OZjxzxCg+FlwkwTf2FFrpqd8W2gf8afCYOojcT7KBzKGT95qrymrhUJFCFxq+Mo/yJyyN0Iil68jFuc/u9/ln10VwgnpB2DPu4fSi+JUUE0sVylmtffcNrVFu7S0kgYf+oGQBeRuZY65LEatznSaZhKW23/modIguyCsA0kEIascYDqJSlcH8V95FzDq7q4jB5+T/Cmn2WbsTIyRnGL20yju0sj3P6gps1ti+UebYvvuNYHtStAaJnpc1Ez+1touIsHuLDj80jxos3F0xRa19JQ5Jhq6puuXWqLUc5SfvjbFZ1WswYR/mMwyrze/JYnA9VarsfHL7OEJqoShF6PnHSvDw6A8p5d7TaexH8+a0EtKn/DIm3Nmw0Hh42sXc2+EjxThJcd9UpRLhB3MmeVeXr3L88LWlWJwBq23AKiOBH2EW4rraRnVSfvQ6auNt6dQWJV9v0of4Aml8i+WwKNHg7kWZcbmPgbC33Z/eYVxPQ78FMRKESro2ANI2aDo2qYZ+Lm03CIx3a60hJENBeFQXLsY9uf8JDQrXKZlJtG0XzppooZOGvwe1Gtnuwm60+waox3NXlj5/wC7aPvGHo//XkfbIuGWIMit7zlcZX0J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(6666004)(8936002)(8676002)(4326008)(1076003)(26005)(2616005)(478600001)(86362001)(83380400001)(6512007)(52116002)(66476007)(316002)(66556008)(66946007)(5660300002)(6506007)(38100700002)(7416002)(36756003)(38350700005)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jPfUaDVRbfI+t/O5KHVmaHuWdtvZROl0gtH4ublK2zg60TyMSY1ShF35t4FT?=
 =?us-ascii?Q?Bqn5fZAZDYe7vQnCFmritR4rwMO4fnp+zKvuuWftJkC7xUAr+LkrF55c6bo+?=
 =?us-ascii?Q?Ugo0K0ewiL4sJUbTu9nIqKJKZI2jdXxQTi2x+jlCQ7nWMek2F3w5Sylh0/29?=
 =?us-ascii?Q?ZhKpS9TWzR9rVxOBkl/99GKcB3Hl4TNG+7wPD989fzCx1o2VgVrwDXJ+MrDK?=
 =?us-ascii?Q?7IphOjGWIrroNpsSK9Edc/r33Ba/adM1DRoXb6SXt/RaRo9wDq5u23g5+ISJ?=
 =?us-ascii?Q?poxAmxYjXL3WtxEtz/XG1/A2F5d3uYR5BzlxPY8i+orDcYwh8JqwHE5V19v9?=
 =?us-ascii?Q?WTZX8oehnM44uEHDFsr8UimEaLAMp476FWZGqqYeHFeHaomA4B2/sKNWZBI0?=
 =?us-ascii?Q?I/BbiTJJtvSfzau4C3eiZCzNaQmj/oqqQ2HKuicLsrs4wRByVQWPBdyFjJs0?=
 =?us-ascii?Q?r+fucjxJuFYQfbasSp720ukkqY6G+f5jcCwjspP/EK7Ch5roirkCLsKoiBm9?=
 =?us-ascii?Q?VMxdPcUJrxnWIneIUj7aIqRRF7J3TOX0mpsZFN8tCrwGeNd/wml9lncXkZ0B?=
 =?us-ascii?Q?cqWqmtGVa3QfAXX9haQE7q4iATQoHF9TSujJ63AT6R6YhQwtzd+5qd0eWXl1?=
 =?us-ascii?Q?j7I6y8JFe1bRWbSLG01aCLNp3dlODUoYDc9maaJ+X/J4jxYqoBXAWK2tV3ju?=
 =?us-ascii?Q?x5yi6S2W7Cz8gYW/spVrSEmRQd6XB7FhSWQLNDYq/aPuXDggxP2kq7jAOFy+?=
 =?us-ascii?Q?jMjzaAU1T/fFnK3Yi6jEOGDvOgxz0npI+SkUEoLIWRPN3DlgbuIXiOv/Tdfk?=
 =?us-ascii?Q?OI+Aps16yrs5A6WAJgP+eBJCKQvlSkNlSOxw8kpa/F0XgxVNokGtXNIIZMlE?=
 =?us-ascii?Q?PI1Cw5rXVjRnJPC+BrwmZdqJtmJfFJUQFURe2/D4yqkwx8E9a9R0rIbWJc6d?=
 =?us-ascii?Q?OSsxjMLnymmYww5t060qDEni2r5VwxNQTl70sSZqHcJqO0vLMypnQTo4fIT0?=
 =?us-ascii?Q?YnQkCwisN+MT4rcPmpz48u4SM38/CmpmEOFDSpUddM9uCQ8laKczZ+6V0Ggf?=
 =?us-ascii?Q?KxloY3zEx61vdYiI/CfZaXb2VFfvmKEwDE92E11yjbEGLsFrBgXiXXysJa2m?=
 =?us-ascii?Q?GSHecDfgVXeNg8U7gD5z8PNKZQXFT/tgHme/vN5MSkuvUbBe/3CNYLrTv6DX?=
 =?us-ascii?Q?jq74QeMfkOCA/7fL+dpz3kJi+NxaD7CugHJZ6aCX2wEevroqDhhZHJpa5KbW?=
 =?us-ascii?Q?Kze2x/a1cEzXBz7mNdhntXSSyLv/fYntaKZ54rE81lIbhtS2CUDhMu0Y0ac9?=
 =?us-ascii?Q?s/YWA6VdmDTmQmtQOp4PugporpnsM8eT8oJhou9QLF1+HG/hBldGNnGV2gK3?=
 =?us-ascii?Q?plwL1RAyhx1H15aS7OtrnHhueT7VuPF3mV6x7QKXSpUU4iwB/+nUMfUx+/7S?=
 =?us-ascii?Q?ca96Z2c/Pk1Z6ZI+5DxuvQZWkM9EPWW72kvqxu3xtD4wUREY+Dh/ktS8umgt?=
 =?us-ascii?Q?g4cfaUwGK11y1aLIcQooxEFyaeXjH2XlYbq5eQJ/iWXe+V5qqZAreNfqpuyW?=
 =?us-ascii?Q?G3kdc873+oMyE4W9Ll2DAylaRkkmWNLwBBgpC2Gr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994faf29-8d70-4621-ade2-08dbffa638e9
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 08:49:19.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI7UHYmbEn6FKDfH9bTyG+e/pE79i6C4eNYUPBflA/e44B4QExw8wn2ljf16ZINLfKTBqHZS51WE6RZbZjQT+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803

There are 2 USB controllers on i.MX93. Add them.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - fix format as suggested by Alexander
 - change compatible from fsl,imx8mm-usb to fsl,imx93-usb
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 34c0540276d1..043ec8dc9aca 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -171,6 +171,20 @@ cm33: remoteproc-cm33 {
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
@@ -1059,5 +1073,49 @@ ddr-pmu@4e300dc0 {
 			reg = <0x4e300dc0 0x200>;
 			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		usbotg1: usb@4c100000 {
+			compatible = "fsl,imx93-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x4c100000 0x200>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_USB_CONTROLLER_GATE>,
+				 <&clk IMX93_CLK_HSIO_32K_GATE>;
+			clock-names = "usb_ctrl_root_clk", "usb_wakeup_clk";
+			assigned-clocks = <&clk IMX93_CLK_HSIO>;
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+			assigned-clock-rates = <133000000>;
+			fsl,usbphy = <&usbphynop1>;
+			fsl,usbmisc = <&usbmisc1 0>;
+			status = "disabled";
+		};
+
+		usbmisc1: usbmisc@4c100200 {
+			compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc",
+					"fsl,imx6q-usbmisc";
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
+			clock-names = "usb_ctrl_root_clk", "usb_wakeup_clk";
+			assigned-clocks = <&clk IMX93_CLK_HSIO>;
+			assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+			assigned-clock-rates = <133000000>;
+			fsl,usbphy = <&usbphynop2>;
+			fsl,usbmisc = <&usbmisc2 0>;
+			status = "disabled";
+		};
+
+		usbmisc2: usbmisc@4c200200 {
+			compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc",
+					"fsl,imx6q-usbmisc";
+			reg = <0x4c200200 0x200>;
+			#index-cells = <1>;
+		};
 	};
 };
-- 
2.34.1


