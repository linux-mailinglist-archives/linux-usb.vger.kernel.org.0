Return-Path: <linux-usb+bounces-13125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA829488CD
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 07:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7555B1F2349E
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 05:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565711B9B57;
	Tue,  6 Aug 2024 05:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RjIVLWQS"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013040.outbound.protection.outlook.com [52.101.67.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41EC1BB684;
	Tue,  6 Aug 2024 05:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920799; cv=fail; b=ll2JNXCDyM6LKFjDfaFREkfmykvcwudgIGfMFLpOSkJq1jPMhCH9dWRxe18dQpvNv4zlxWE4snRzC4Z8WQeE/jruRCNMzZdA68gI5Nq46kNJCcf8X8d9VMIdjL8DNUZeETLYrgSweGVf7kEutvg3eCVXXbh8XMGl7GpsDxMRN8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920799; c=relaxed/simple;
	bh=WWq24P+y1bXNFKWoTYHUjRwinf5bEfc8e4e5Dc+8HMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JI7jwIdIDID0qR7qVmhuPuuYJvS7JicbdcheZ/XBv2FLII8M0W7fgt9/IxJMLqC0gAummMJW4zeJXdm/mpWWS3qnL2YMCiAZ4SzPyTdwTISczgFm4qa0TBuNV8WCgmn+g/3bftT/vvnPgyoi6H8Vd+w1apTPDIyYc48xAslkTr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RjIVLWQS; arc=fail smtp.client-ip=52.101.67.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNXbTmCY7C3+M1TLjdoJy6qSLbTFngpcOleq4eyaq9IZd1zLb5QlIFdI1THOI+UtZTgs+pbNSAnMUYQJpnzyNl/yvYxTbBAnTqI8p4HiYSC/UwSf3C8fx7vBXOz2pA+JJshMDIg8Alxy3CyEm7GAtP7SuN2I5rQZge7VQRJGhX8YtzO+CT/YHyv380eSe5hPBdsnvUi6y+Ug97Ent5U6sHkYStsd2mX436RB2d/EQpKXSLMpbVMI6BBgvCHNfjevxFOj2UHR+pw9HdMBuWXSkKNy8On7ad8ez/vqPx+vNN1pZgQ/kcKsTUffAZS4ZAQy+WeABgqdjSXY2n95smNC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3ZCDYxchFU+3m+x5vJxpoZ+0Wmvrk70e/lGAVRCxKk=;
 b=vgb4Fofhc/zE34Mr5dSdbnZpCEtmA/9VWBJ8dfqs3c65HNwNempN0cv9G2SpH48/rpGoJ85Um975azFIJwZwn9cecOrzQk5Z4lrgHp4tDFlZCGyZBaom7B6nyWW+zqMxiu5VLhFLpWc8XMGDQSVJquDmuuL4wdo/B79u2aXkDxmhALopFlKBwrGMSGELaGwb7FrVA4n5ldv9usOT9wWD2ApFSA4LW+3yWiB2ZXZ4MFJzjpgZp/JiSl0+Dzxu/XdfsdvgLdhZ1McKK9+nui8qowLmdsz/meRBQw6wodM27C486/H5vzSKNlD+NifJlZkej0V/h2OrPi3GNQ5tVpbr4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3ZCDYxchFU+3m+x5vJxpoZ+0Wmvrk70e/lGAVRCxKk=;
 b=RjIVLWQSHp/9dts/H725zn3pqbFwFvi+8b7eBDgD7/LStvJ5OSY2UFrBMcPlXOXkXwo9PA+lBpBLrITjqlzMOOKPLJ+OyOTXbsy5K7Bf3nfkFEIqAEcfwUgzOuoCWC4BEjsBZF5QKGWkubMCTX0TdSFzq4KooO+YRerwNHbIW0R21NqZ29FfbwSpmJREzJsS1NLjQz3V1QoHYx1RWDaaMwv/cUjvd0pD7DV8+uHAwtpRfQFbx3rfBeh82yF0PZp9ZrzSnTBAwOkNIPpfkTYkuH6Onv9Vnfv7qqkoDhx5GbXd6YeBloRoHyGrk8XRDOPUcTlqWZCR8bA+5mNVsw4wzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10211.eurprd04.prod.outlook.com (2603:10a6:800:240::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 05:06:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 05:06:35 +0000
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
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: imx95: add usb3 related nodes
Date: Tue,  6 Aug 2024 13:06:38 +0800
Message-Id: <20240806050639.1013152-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806050639.1013152-1-xu.yang_2@nxp.com>
References: <20240806050639.1013152-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10211:EE_
X-MS-Office365-Filtering-Correlation-Id: 239b6e73-abb5-4bcb-8c64-08dcb5d58b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G4wTo5xUhu9GXgoJYL2c4+eGoIpyKKkSSdqQQ3Soe37NFDxYn9RGBhjapLhw?=
 =?us-ascii?Q?xQnMqvzRHu0TkzgbkdqdXPA6HMZ1ViZgpFe5FXQ7g49wZSy2rMfqu1ZJUNtb?=
 =?us-ascii?Q?NemAQuu0W697Cr2rP9WksMQhKWusruNGSEuVaWmQlc7U1pBG9p6yHsN5Mbww?=
 =?us-ascii?Q?/psIcoJsdSrQLvZmMB/YYEDWH4WelhEPzB318RpnBSqz55mePQolPSlc+QYZ?=
 =?us-ascii?Q?+bpKDLbW+wd7RtvkNVwKV6SvTMiR/2m681ftOkpsemVVD+14ZKFuqdGQEHiF?=
 =?us-ascii?Q?D7EM9efEuqfw/ynuASB+zXH6f9EvB5A6Xj1Q3w6J8xLqiI7jEdp3BL3aKRHo?=
 =?us-ascii?Q?DYYmFlfSHUZsJb0YEz9238/kKbsYf9gyRKtMj+0wWMcNHaNvBn82xVKwbPm2?=
 =?us-ascii?Q?JlaZ18jP+ZBmuoj56gxCqwY3GVpCykPALGfiAzDYaaaqNL6hH/YDKwqSNCRD?=
 =?us-ascii?Q?AyxIKb1hqKy0y9gR0aFadKlUxv2OGZ65JchciVSoKt83VmHLKzy9/QDjZfn+?=
 =?us-ascii?Q?6RKMq+QgM/jsxaNVlQbLhmgujdUfrko+qTjXIJL/q9+9r7T2C2fu29dbWoEx?=
 =?us-ascii?Q?SRihYj8cN4tvrhwUjXBquZ84BjbailY/HeI43mnh7frNK9it/1Sc62uqSrzq?=
 =?us-ascii?Q?Iz4iX1y09Vztq+iaZebfR7nXyDxuATvX4aepi7ABSDntEIEX5CsN/9JQQ7TH?=
 =?us-ascii?Q?qYqqzJqxwU1CVaTcseoJDmPjvGv5r+7nLbMQPVZ0FJdqhXsBFjisH1uMqrDc?=
 =?us-ascii?Q?OattWb+NwpDbcLlXTc9I4eUUaLIXlRO9b+hRs+2im/jeDZGwLUw4Od+qoK9c?=
 =?us-ascii?Q?ddwO/MEdspSQEnkNFC4MsQQF7xhQyPKyI0vAAbEOUW0QjfOCVv8l4sbgrnhu?=
 =?us-ascii?Q?IDsDet9nqz4GG0SdlbZnd/WvD4CL2aXFGdn9H2lpW4hpVHBjPhTXsCs4UeBx?=
 =?us-ascii?Q?zuYxZQgQNRdBYAmRTD6tz1BObvMD3WHZprOQQFIqKQVfS9xhgsf4g9dUjJ64?=
 =?us-ascii?Q?cTdOWr9hBR7RtZVD74sg35yMi/cwTvNJhs9QkZkHNoU8WOP0X/6X/n8UTA2+?=
 =?us-ascii?Q?kbCPnp6NA6k7Mu7AmXSsm2FEEsFSwxol92n1oUfvxjLyU3oAeOyW5IBAX8Y+?=
 =?us-ascii?Q?S8O9iX5/ANwu9RvrOhldp2/dgkOzBwQigfcn3bUlYrQaQZwB/pEOn5lNgU4g?=
 =?us-ascii?Q?W8MJzkJmbuyJGsTR+CRuqBbX8ZIKTb60WpYhopl3ugdzANTraxeAXpXCu7bw?=
 =?us-ascii?Q?pARyLcLFPq1B6AwO5Lqx7JUmym8XV4MknB7i4mLoYZgSjGJt6DBlwCdIeN1X?=
 =?us-ascii?Q?IsJfVF85dWVaIkXpGw5sg57bWDxdk6EYq3gY0xujTiafMOozFt8BLVxW7Ra6?=
 =?us-ascii?Q?zYSPXHzz2KbgJqh1VsNZlfQTCukSkK44BBN46+Y6S1mY2xfPRTI/NR3JkOD5?=
 =?us-ascii?Q?XZI9kSFDC+8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V17wAxIyeT81vxR1a3d7ASt/KBQh1/x28VCLfUJMgPzmzkQRrZsPu0zw6566?=
 =?us-ascii?Q?EskCf2EY4+DIiIR3NBVS/D+FtRW6+hdeO9fKxSTbdYXQtgGz8jeahrFbPqoe?=
 =?us-ascii?Q?ls8TOKpJWf/DhzEhOus4gPzrunYlFBxQXwSQ6INyuuW1D+nUCn7oAMGT6STS?=
 =?us-ascii?Q?CoZLFM48DrGipGaBE4aHbra4gFOqfYiE156B6EonxJL+KOvmTvQv7rqa0eKl?=
 =?us-ascii?Q?84YKqUbahz64jA2IIxp+tYrNXfeSWUHVhid4A1BoWx2iIWIgrYFdNTSBCMH/?=
 =?us-ascii?Q?eooYuO7kE6qcHdD3ZQ+nOxlkhCVD4HdNvn5h9XtDRHmv0/38J5iw5arx+dNB?=
 =?us-ascii?Q?TjRNB8Zt1eow91ZnSYxVoRgirxocABTJ0bT/NlBVT7cu9p2rEV8GGahTvtXG?=
 =?us-ascii?Q?4vaLbacSjtiNkymQvZYdyKzyF+N/5dG0Iz+FI+bTJMpmQGwQG7MxBiEizP5o?=
 =?us-ascii?Q?MxDcuUV+QHUhbzlUgMm/Qywf7cQUdcsH9qDq8Cj3AA7onqsnDScG1PHDavAU?=
 =?us-ascii?Q?t0PNGbkDLLVzkxYDwKfAWvOtmuZewBSxPOeUtWyiyMnHXxbTGJjJLpVOdMqv?=
 =?us-ascii?Q?wQZmwmSv/x/GL/nTz8ldAzpfrCJwFBJvuyEHCqu5SKgGIJ0I/xMVbh097Pec?=
 =?us-ascii?Q?XqYP9usSQtEGVJd2nbiC7h7Kqmk3P7mTCourujwggD/C8olZE14T0qivTLkA?=
 =?us-ascii?Q?pRZ8uUmpfBzOpkSE1/CgfqB+TvQAZf5YKmduiktVZsyEjLBmne4FR3vXNqeI?=
 =?us-ascii?Q?Q3jWzGv6eCay+2q/aZkSwD5S1Hi/HkObtxFbY+i8SwNbHTLqSRlATCRLBCQH?=
 =?us-ascii?Q?cJJcWGgYS7xnLh4nWa/c5QjmoN+g+30PrNhOXmoBP3v+GTMaAUEg4J5KLs6b?=
 =?us-ascii?Q?vzPG45dra9BGVISbPoTwqDmNmYBFz1cDbvi21R+8eI/JQN4H3Q3f322vyjuj?=
 =?us-ascii?Q?J+TNa3QA4MSZd12hzFkLDfHwhbHP22BrbVodKQWlXFJPJyKzWBvyyjOBQ2G4?=
 =?us-ascii?Q?w01Sb2KkcwvbsKvPfovTxPoKnYItY0ITbRlgRpEPRtLbgb6iiMtU4B3p6mbZ?=
 =?us-ascii?Q?xiz8lJ9wPk0clG37nEO/+xRfkg6ZBjbXsrXJ830ytz3Si3p6HYs6dqiJmHwP?=
 =?us-ascii?Q?BMzuPBeSjR0Q+5Ao8avrsz7pRdFj53sEyXh/OzkNlCRU5Mddf8kvbJmZxxzL?=
 =?us-ascii?Q?fQ89yUJgvD2CTVENKszpNol/WPOspnMHBch63mEMNTnrYJbVv7rP3BfYWe2f?=
 =?us-ascii?Q?+XpBbLrhRAzaepEIk1Tyyzl5sF5EcNNTKYrfIbLfiwGXiuze+OaszbbcfDgK?=
 =?us-ascii?Q?MZtaMptThLoEq+DTuuodsTEEJg+RmqQpue5GdkhG6IgUWVdC9nacRPN0pxeK?=
 =?us-ascii?Q?shXSmdVVrel7JcgN9Th1g1H1Ruz8NU9tQesCFZNohqpqIKD85GBq2N7rE0P9?=
 =?us-ascii?Q?OfzbYd18g73UkukJx/yIMEFywqQKgDKordgQord4HE2OEMt+xtJ3u54heK5t?=
 =?us-ascii?Q?9zFkiZ3xjiIDBps5cOP3IWoAdT9S5M5lqJQO/N4/9qXNYQkQ1yt4m2x+IDG8?=
 =?us-ascii?Q?TarnJZ6EXCOl8SovJqfHlaec3d1ULnQqfa1yCHru?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239b6e73-abb5-4bcb-8c64-08dcb5d58b4b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 05:06:35.1267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvxIBF8o8ro5rN2eWuby7waALUaOL/Vgy/DD4FXqO/HwwqGDwjtz2LDXAvmJgSOWRiL5xuz9MsnAAYGRkcJh9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10211

Add usb3 phy and controller nodes for imx95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1bbf9a0468f6..06a7c2f1e211 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1188,5 +1188,48 @@ pcie1_ep: pcie-ep@4c380000 {
 			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
 			status = "disabled";
 		};
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
 	};
 };
-- 
2.34.1


