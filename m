Return-Path: <linux-usb+bounces-15835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD961993F31
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 09:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0981F21F6E
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 07:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6335D1DED64;
	Tue,  8 Oct 2024 06:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H7SY2Aup"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154ED1DED58;
	Tue,  8 Oct 2024 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728368807; cv=fail; b=gDJuOptFRQVn3M4FEgE65me3dfBRMDewRjtFlgCqrjYNwvQGYG6Zsp66xPwvh+YuMVtPChqddSeDRoB2kNDGNTREcdj+EoGW4W8GnM29Q6cNYknVBo7DZEYtsLG+gBHLyOt9OO/Ch2vL5wrpU5L5DQsc+xLvHlnnkBCq10t2oGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728368807; c=relaxed/simple;
	bh=UhnJQn9CmXoSKNl6vM0JUXoT+jsxD7LqKcvUkPH78HE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=erddQsNAHQpTxHqpQL+UX/wnjY6v2HdVAM2o6XrvznDQFyRtYlRinravAziPeBdaH1kMhd09P6T3wew8YXuL03qLI2AwCZvu9oaHY9Ivow8lby6+xv+1QQhjxa7DThj3hKJY/mY+Fc2ORKvQetG6lJBF2niFRc2XXrWmjGbxO2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H7SY2Aup; arc=fail smtp.client-ip=40.107.22.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAE6tP/gLxTXLNd3vqRlAp5wmLTey3TljktwNUoGZEnTJj2yPx+Z/1NS+9zHfg65fw+wTAmIbibVi6TVcWRdZp8UXoY8PFq4lBoQz2BqBgpTrOad4mA947p61uMQcEIcOlsk2CzhR2vjkTFYYb+ItTKeVrqH6DTpUl6K6ERy1v7k0lDseT3mPvMNIeLwBFvj7DOehFe507zV8g9wHetzVFodOul3cWVKagtyq1Ut8hYKVdQ/6oCEK1jKGeWGVXS8nfbfSHcwkD0WouQNXlpOG6qI0fvUVdSq984ORVFCgkdKFNJVZ29ZKtDrjEeXkxgOkHgtvVl9sVk79RKsN2uC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nhbXMRL+m9n7Ok7CgcCcKU1Qo/wi171E7jYWa5X8t8=;
 b=ZymVKNf31DCKwLsb0+KFjKsSL5diSQko2gAzYlpJMTR+RY1ck01PwImyZlAdX/KINuOh2z9qrHLPmTjc2ANXb0wXjZWu0hUl4X4R18RrtUGnIlirx00Ff/f8In6WkDfq39AOPnB2c/9wF0GeXPTKo09O8cN2iJCQX3kgkTZrqt1eE29RsxQ+q+ZUEIprT8cPMQrl4z454CdYAmaLiH6nw9+o4xc6uyjKplxmr6RiUZ5gAEYw5HZ+qIa/+Z4vB8V6q24ug+1c5eRA5hVAIp2OWnx8exUobrkPLSIfv2dnND+xeMXGPZjSDwtxgcioAio1aP57E2NxXmXQ0kBk4Nh0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nhbXMRL+m9n7Ok7CgcCcKU1Qo/wi171E7jYWa5X8t8=;
 b=H7SY2AuppdKYM4nVUaqCjSd11YJQSKSvh9tpTpXUFrVPI1HCzvariaSEXCvz8HJKfDkqrb98h2nnNpo+eVCNET+dtjbtsM/spRfJKbv4FNkgBJmWVec9BzXnsa9a/DktwMgCzicYzB3T8EA/YLykfo+P4S5kmndQssXhb5qA3ITEAz0fEusHUzZ3hiAvBBEvIHrab/A9OplktUurQxqcnqquAHED9EnO9JtgVazoeCtdTpyg3PhHRlo3Le8a2QyZHAIx8zkahE0YNmzSkcgAGVEJ7T3LUDxBSLQ7mRYCesOkZaP2OxVQuuzmQ/tvzA5JT3ixRo6MNH37hYoztCW9ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB8PR04MB6956.eurprd04.prod.outlook.com (2603:10a6:10:11b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 06:26:43 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:26:43 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	peter.chen@kernel.org,
	herve.codina@bootlin.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v6 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Tue,  8 Oct 2024 14:27:43 +0800
Message-Id: <20241008062744.2211539-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008062744.2211539-1-xu.yang_2@nxp.com>
References: <20241008062744.2211539-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB8PR04MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: f1097933-6bb1-468e-7391-08dce7622d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72OqlD3BTzeaxs/FaLRkocy1Cz0Ugo+AgaLp0mMOiP5TdBkSvsHPvXu46IFl?=
 =?us-ascii?Q?fZl+CrM25i3iWTU6O5DRwERhp23RiFczDc1NNj2RMBkexNDS1Wk9SOCzd696?=
 =?us-ascii?Q?EDlvFXPZhwfqtlrhXRu7WhWzvivoUBEdhpzvYBxP5TeH2FuOkWBgYerU/0dZ?=
 =?us-ascii?Q?ukXBBscYPp3MSwBcJvrqCYn/ISEnuLH38aCcD0SSA0e/mrKsrE892zfrE74W?=
 =?us-ascii?Q?nXGZ1zfw3bHDOhO6Ug3plf1T5EyNmngUN3LG0V8TMEr6X2kFFUG5M0582eFz?=
 =?us-ascii?Q?2efrtdh17WhNqVQw11tCyo4Hfy0qfHgQxB5XBMZB7q+0mhfY7wH6utAe0CGQ?=
 =?us-ascii?Q?MK0Zyuikbd2JfiFnH/BBqgCDXREqdQPPAd1cjkkvHZF+Fvo82SIExGs+aDca?=
 =?us-ascii?Q?NfoKSRHvk/quj9Iw1KXy2TbV4DLcV+1QU2eD5o4EyNBvmZ0C89r3AEiYHG5K?=
 =?us-ascii?Q?BLgSI1eE9rjOYBybRAUcMmHXJIDlH/q5MM3MoQx/41Rsbu81RmYH3oCTwtFN?=
 =?us-ascii?Q?iiMqce7FwlDX9xd00lCxc4OLlbMZ5Rxf1plcVGC/W2+wFEliVpsx429y/3zc?=
 =?us-ascii?Q?oSBR5adsjHFIbW5MLsjDfD0CmAFBJxRDYrkyHDATV20aTtDgmGaPXR4NmvNL?=
 =?us-ascii?Q?cEF5zwmTALhZlgbV4coF1LZd0DkOINlFIX4H/UIFXAKgO32TgiiXkLqULzue?=
 =?us-ascii?Q?k49oIU46d1QAIkjTmiN0xV4FOdUv1TadzchoFtdhRebVci8bgxfRxzKdKnK2?=
 =?us-ascii?Q?gRwSyvjnHOo2ml1jHIYvelM8D3z/qz2RrJEfqkGmDdl65NibaKJ7bUj4dK52?=
 =?us-ascii?Q?BCw3wv23PwTLrB6PSN3aBXWqgUsidMornJu6uSazysCeFx7WnIrWTiq24OHP?=
 =?us-ascii?Q?74QaP3JGzS5zY7nEEVSby0GdJNTiB949bw1Xdd5t4T/do+2WBrSDbJx7V6vf?=
 =?us-ascii?Q?76ZFrLz/1GYp+uCPgWqQOwyf4oG8xTJLiWRr+iXe8qTdTlV4WdGjEKdSqtCF?=
 =?us-ascii?Q?+o/CFc7lC3CWnKfT0vbZaIBQ7RI3KH/M3RNIwLsB86Ex8PtvE871/YpI+vEp?=
 =?us-ascii?Q?FLbg37zcGtl98UySD2PM+cCEylqDNkeEZBXRMywRFNZuuOv+pb1gr8+Wlpm0?=
 =?us-ascii?Q?TFBgjSzbp1juSrzJ3C3Pg01PIdZc/qOzGeVQAlhY4mo6rphuZcoQH3vr0v7t?=
 =?us-ascii?Q?I5FxqtBxUvNq4nvdfLiEPHvPxZmYIksbh0p2xBzhMXFRrTLYmKN3p6QmeVi8?=
 =?us-ascii?Q?hBeYv0H/S2Y6sUPOGp9X70mIV+cZOucppMRf5iZWi/VlmCMJuVd/4ja1axJ1?=
 =?us-ascii?Q?i3dk45A0qmd1JSXT3hVH3SHW41TsbpbJy7qmiZo8FV/UtpewOM1GIvRdfb4B?=
 =?us-ascii?Q?17v41zY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z61WIhwo2/ZQy8CaTe5JAZ+Y5V1VpmgP8GloR4VoeljNPRIphajNbwMmf4d9?=
 =?us-ascii?Q?JK58R5wyor+t/xS/W+a0SffrnxbipcpmAaK2ITt5yEKrFMG11hNsjCbRunF+?=
 =?us-ascii?Q?qgU5dF0KL/VQV+iVG8l3dK2ly6zYnawwfw+4FNcMAho0muQ0t88DGAytK+S3?=
 =?us-ascii?Q?QJv3QkLQbqDvKKDhLbxK16d7XkjO4m0+8rSOW7GVK8HYjl45b3YnbjPD5n4t?=
 =?us-ascii?Q?PeVW2tG0vtfvHns03p6jC9O9RdO1msluao5MfJcPalc2SvrfTExae5DE8D8u?=
 =?us-ascii?Q?jHVGF117fXhW0RE+e9MQLnr2EavTRBT89JuQQ3L/w3kJ+FrIcfAZyIBCsuQ8?=
 =?us-ascii?Q?PWMPjWwcIGXP08j8HP/ZncN5qJLZor8fKaO0uph7S+pXdbv8lWoEILjfu76P?=
 =?us-ascii?Q?0SGl0Yoh3pdLKe3kpgPrHpRpsLJQ4MNaWklR9GzVZ6iljx/w3aUAy0UHslJ+?=
 =?us-ascii?Q?qZjF6Mi69LzwNXmcZEm8cUP5HGpdEPSedkaHNQqAc52yMaYW0tH4U3MkL+IZ?=
 =?us-ascii?Q?K/Kx52FvJiZguLaCmAzVrj+Hq2/DSkYrp4VVSIN+RSA138UqU0AUc4ZvGh+Q?=
 =?us-ascii?Q?HGAAkxE28IGFgVT0Tn3JgKKIFPD15/2K0rfr1Kc/h9pG3CMTb/LyB24mGfaG?=
 =?us-ascii?Q?xR1DFSvcF2dSWPSrjUBJavQb/MxaJD8uvsyOyq6QyPuuJuz0n6KLLa0dIND1?=
 =?us-ascii?Q?/pBd+1KH97JaUYfYjEtqBG8XPWFCio6ppktndygBRMZ7iuwCbz9nvOPA0eRA?=
 =?us-ascii?Q?c9Ug/SBM535eunWuwu6KS84XIRfIEycD1/J3nGOMUp8dVQEPlTjmEg3+LTn4?=
 =?us-ascii?Q?GXix1aoPmbx/dmVvlS8oGUV5KTvTfP1wKlXy6GMCZJIsCLH69IbRWQUR7RB/?=
 =?us-ascii?Q?8QHeq5+NqvvETVj7i0Av7YBgpSExue8t+L+jxw3gEhPwcn36qDUHCdSGYb+l?=
 =?us-ascii?Q?P7DUTOvbn3bVDP9aL6HqE8LZpVtruzCzgSQqA55UwUnL6HJ7lsaV2vjxkoas?=
 =?us-ascii?Q?voyD57uDnQD0m2+PIZ41PqjILkQk+woTbn3udBYXhRwIncnRfuzkZBqlj25v?=
 =?us-ascii?Q?IYvWvD9IZ/+BlviAVDzXsRcdlCxzYDN0W7Z6B0Z4S1P7ziPQTmbkc2TD6AYt?=
 =?us-ascii?Q?1Q886eqpiNZBeyMX7PevovEsoe4ep/7rE4nhnMtA/v7xTBvmeR+JwBSJsDAk?=
 =?us-ascii?Q?FgqiYkjvR2wl/wEJKQbnY1doRtwBt56OJYtDU3EBt9Uk3td1Yf2c7La68+qN?=
 =?us-ascii?Q?je6OHyIT31AjWURuOeO7ZhcKKFuSJmv5EvzhO6IN/6ACWd2xDR0PxaqdLl5p?=
 =?us-ascii?Q?ly4FP6G8BtyegU6pGwquyZw0ghZpuF8IO+PJeajIBX3fha1YW/duC9X+RYD4?=
 =?us-ascii?Q?beBPHXTBTd0xDZHrGZmCHMcalSRBjNLw9AQ12W7U0ClN8+iemW2b8Hgr9IqA?=
 =?us-ascii?Q?LftpBT5EwguJxmkw177WYZJY4cGPUW/F2YMq6estUVQr0Kl8EKsBBDxrvDsr?=
 =?us-ascii?Q?dmxIGleeTi6C5nG6XLdgIEd4x0OQ9vPTrW/3PE+bEA/SVN3cRbP0xSxcokUD?=
 =?us-ascii?Q?VIJZFYAKjWdAobmJ+9SV121xZ7wH3xLvK09rR6vl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1097933-6bb1-468e-7391-08dce7622d3d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:26:43.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Y3z3tGyuScv3danpbgc0i3lQB0/LsvvA9y7tP3w3M8F6XP5lKj3I4APQqx4FAHZnx2408GyHAYsWZSuIgV/iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6956

Add usb3 phy and controller nodes for imx95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - reorder nodes
Changes in v5:
 - no changes
Changes in v6:
 - rebase to latest
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 03661e76550f..e3faa8462759 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1473,6 +1473,49 @@ smmu: iommu@490d0000 {
 			};
 		};
 
+		usb3: usb@4c010010 {
+			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
+			reg = <0x0 0x4c010010 0x0 0x04>,
+			      <0x0 0x4c1f0000 0x0 0x20>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>,
+				 <&scmi_clk IMX95_CLK_32K>;
+			clock-names = "hsio", "suspend";
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+			status = "disabled";
+
+			usb3_dwc3: usb@4c100000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x4c100000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_HSIO>,
+					 <&scmi_clk IMX95_CLK_24M>,
+					 <&scmi_clk IMX95_CLK_32K>;
+				clock-names = "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy>, <&usb3_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+				iommus = <&smmu 0xe>;
+			};
+		};
+
+		usb3_phy: phy@4c1f0040 {
+			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
+			reg = <0x0 0x4c1f0040 0x0 0x40>,
+			      <0x0 0x4c1fc000 0x0 0x100>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>;
+			clock-names = "phy";
+			#phy-cells = <0>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			orientation-switch;
+			status = "disabled";
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
-- 
2.34.1


