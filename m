Return-Path: <linux-usb+bounces-16228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527A99E52A
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 13:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38A7A1C22EC2
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 11:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179961E907E;
	Tue, 15 Oct 2024 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EPGdPHYh"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC41E32D0;
	Tue, 15 Oct 2024 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990554; cv=fail; b=pBsILEpuCCjoa++wxvktKb6bcxunuC2GDxLNd0GpdtTRPJ1wMzXukvmnlXRYSn3OB8pxw7nJTLgBXQcgdtckDeRInjf4GfprU44VgfQPcK2l6fXfp1AW8QwH8odh8bxUC6v7Luo0Rnwp0DTNUK3cbRsl4qak6S3HKJaVRCmD+9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990554; c=relaxed/simple;
	bh=8kRen0ARFCL4s0Yyy9ISSsl4GUPMe3j5iyTKFfmIV3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OimYpFRBo0TacoBkd58l6+/bjte4rU/ZEQZdYiXvKMMrU9bpQsDEPdKXR6GoG7qzgukPspgTcItPnAkv0v2nBCCTg8ml7L00aKotKHi2BwevCRqqoUhGWFKKbwqoGd46YQ+zrRFe5rnMu94lKfVDtCHmL9+8lVMB65UOtYs0HLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EPGdPHYh; arc=fail smtp.client-ip=52.101.65.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgL+VnUX4ciHfrNe4L2t3se2SbGVrgE433ubrsXTsofE/Fngb4GF2dPugVMVHGJT2gCBG6qVmY4EdHEANxq6z+Ml/7mUUKZUkm2VfpL0wj4N5LxaSZUXcvrJEMkQTtYB3UoVsSb7HZEEPBCWLuspD+/uPetcIJWyw53HJ8uSz9AN9X3/3XAzz+hmR8bWEUzWhFdSYZh4DdrbG07F5Hv7UWmhR7fLkxYoPJPoD2gGZC/ZlJjgJvWr78banJIvV5sYdlvP3UFiWO40ybF6FM1PvD9qQDZedTohEIqLEP1s0uoMVnGm6X2EciQ9tuy/MboQqan8R589cfsE79uLAd90MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUXRGFEVrlH/WClrnsaNb/T51Z4z5YUlqjmyjqIxjxc=;
 b=iCwqEO7FQxmFjgsgmcY6/f6MPsaBsGBCqYTVTBUGcHAfuAxpLst1YvjALg8D5lh3Cby8jf/xU+wOQSlw2VbcZc0Yq40302n/x+UkAdygzsrNe5F4nXYtx61dsnPRcjvEBYrYbLKLvn3qALb2+TPj8u9evg2+Z6SSbhvbFtGKQCxEkoPG/uWz0ZsJId5h/HcIekl12Vb+oNs4cBfDXGKbMw31fWOpvTCWt7bQjLQfHqZaJ/XJ2oAXUNHoXCWsY/zBTxssX+WeaudKDbdKlkXiKhQVb81J8B89u0hicWmvNKY3meD8OnlyMy5rWDl39CRUqfEE35s0vSd+pNCmm3AMFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUXRGFEVrlH/WClrnsaNb/T51Z4z5YUlqjmyjqIxjxc=;
 b=EPGdPHYhsMQdko3+UwgUzOV8ocEkmSe/rE6GIHmLQrf4RoF5mGJJ/9Lt3/STp7Xm2r2oElu2IV9aMQLass30qyrsnekmjLHca8RuWDa13JI78O8KC3qyZABFIK9SiEHuq79GDXqigSPgiVxVnXKB72xqAyiIYBAtLH0tjVo3vw7LpfN6mhjrtbCn7cRk3vSaVHSuC3gpkpym86oJe84p5XazBbvAsb/fCxpMMDobMAvUcXiyijsu0stCBR3/62AD3oHotG921H1NUxi6RacglJdxvd5img6tkD+EgrUcCR/+BSYuQipOeParpk/AijDlsJSd+dON6En86/ewMZKeBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7701.eurprd04.prod.outlook.com (2603:10a6:20b:293::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 11:09:10 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 11:09:10 +0000
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
Subject: [PATCH v8 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Tue, 15 Oct 2024 19:10:17 +0800
Message-Id: <20241015111018.2388913-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015111018.2388913-1-xu.yang_2@nxp.com>
References: <20241015111018.2388913-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc64f4c-9f48-4ebe-d988-08dced09cb67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lMJz8fyjVmMbSQZ2w0aBu6SBYf3LPpjzGcTKo88PMv5ftqhBrMKHEPzfR6tA?=
 =?us-ascii?Q?Us6oc8d0OaEW6OtUdF3TNnf8Ja1COpnMUEixiF8yDrXmVwRs50XlwrMsKy24?=
 =?us-ascii?Q?Fg4evVfF10dGEHRziyIHpJP6/RTeOdLSAwAvTTMTGEhUZfu8bO++bw8apfM+?=
 =?us-ascii?Q?JpCbS/xfkDo26yG9qSqrqbNwyT0qt8RyWm6zso2kdXL/fhmOBEi6Buf/DUE8?=
 =?us-ascii?Q?AZGhNQAzbAUOawNHoEbLGhRTvZE1Q/EGj0PvRNJGfd4jORGcJjI0cN+EMDhY?=
 =?us-ascii?Q?FUdmRAksp8T3Q0E05O3OcXY3LpTRRRxiVBKomPf5Zy7NNIUCTm9akPuaodhO?=
 =?us-ascii?Q?9V2NMyYVyetof8WxcYdePF+E56vHZrmeDlT7UhJOOI4jkHpXYDiCcMDRb8tr?=
 =?us-ascii?Q?dF+tP0O0mIeccZgmQClvRovsGUIwrTmEHhJM2aSoUCxsWmGLrAEueH3XvEX9?=
 =?us-ascii?Q?pfxVMfKjI/UPKMv8/RvVu5tumfNPDWQP8qddqwvm1R0eJK9Urss0f77h0++A?=
 =?us-ascii?Q?2F8C8CPmGbArMBY2VphghURigs6dA2Fx+S8jAhggTeYLYNb7WL/n8yWTRu/T?=
 =?us-ascii?Q?MUpdFuxitlWXuU+LwEP7NvXO60JosIW9ZoDAVH5V2tB0j97JJGJ2yAw6HIkL?=
 =?us-ascii?Q?8icNia7WOrLVc7s0YjXozxY4bSdLo5rmiLTNURHsQ3g/84pNNE001FaSd08Y?=
 =?us-ascii?Q?A2t/nVhOBCSJzzUjAgNTevT6XjXI1qubAIwACrtrgCj7thuwxQp0G3WJ+LXE?=
 =?us-ascii?Q?iwSZuLdElEszwV8oqwUAnQcf5ahGJNsZufrsCAQxYlxKFDLCv/N0HpOELxHr?=
 =?us-ascii?Q?MFIWIB7T4GSuFQtLkOEQJCuQ5+/eecjo9lxj78bIBxqJ07p3W8W3hTlQfQMj?=
 =?us-ascii?Q?grvdmj4c0ZjqLipiY6eeA9Firu2mATXr/dg5wNH35p0YO0rbkZtYnnsVdPye?=
 =?us-ascii?Q?LhTTO0ibtO5Ey6xrzO0au0Id2WQh1QZdvbnqZYrZvCmrt3iT5jjPWDloEaNt?=
 =?us-ascii?Q?OUMnQh1rmQMvMNzeXEuqau+a0wR4byvmK0UhbExGJYrhIoSTZTtsZLVoOIYs?=
 =?us-ascii?Q?q4jGO9L8hcpMyNG3x0nS2QpbqLxpK/Pr1zJZtd9c9eb1NTu6WR3KieXIa6w8?=
 =?us-ascii?Q?/o/c0+A08JtfGKwdfw/lTJ8W4ixk54MOIpUTG6qpei55COYwesO0ZQ8ryiMc?=
 =?us-ascii?Q?tkZmtVQcbCgYj0g4qUcTMs5osisk5Hmj2s02WT/R0fpqTq9mn4ct4Wew5JkN?=
 =?us-ascii?Q?ijHpvZPSXDOJuuXkO7rVaBQQ/cgvXmw1EjSVM7t2OzS+6BW2aaj2IIKVNfBi?=
 =?us-ascii?Q?Ua8F+AqSM2URW6CQkNpNOBsZIxQZkECN8LqDqg04zmJ4v84qIEVj/5nX3KLC?=
 =?us-ascii?Q?Pp2MCuA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/0j7Z7zAJKc80V4UtR+aKtC+ERqhg5lC6Sk8yCtBg8ykeruZKAT+58k+15VR?=
 =?us-ascii?Q?sNvZG68LLQQ8Soj7p8Z/DerFor1p8nWsvyMad+XLIA0Gm2JBbnDlnYrwCm0r?=
 =?us-ascii?Q?ZymBmcrXYIy3Dcqd4zVP0D5gdAYyb1SfvbF712Ks1G42iIka26yh9qtSacql?=
 =?us-ascii?Q?WJRf0dYY8P3uS7MBeHpdbs6RDz45EqU46FpLw1OaM8w2Y1K6V4b9e6hLtsgY?=
 =?us-ascii?Q?mNgjxCZ49pgyga5L58bN+p6qax/q/cvb/FzN3gbx2lVfGOZnFPBXNwPlmkgs?=
 =?us-ascii?Q?8A/EopMp34JhmCoB9QIUHlXq5GQrjNpq26mhX92UkB+PELS4pWhn+jaDcIRG?=
 =?us-ascii?Q?Y24AIYYs+KhoMMQgbESiSwb/LuH5HXxSCDVIY2uAFA7udDKf18m8TZ7kRd5v?=
 =?us-ascii?Q?6LZ84vetM9ncOezPtKWR7vNpTl+oGJmIfOsZUSe7cKGw7FvVb8DhUUrLIWXN?=
 =?us-ascii?Q?e79B3llzW0sh5wK1SbwADt4rVNrqckVr/Zc1+FiQ7N3GVPfau0iOJSc8wmuu?=
 =?us-ascii?Q?w0qsqqplV5PJnx+NvxZXZHW7OzGRRnpNZqmxmTS3l3tshzCU1LTTz/azQkmy?=
 =?us-ascii?Q?WldsgBF6reWmljEJohndVkRj19scOFyRhJ//2L8tDTkDDGlAO7G5RapIb5hZ?=
 =?us-ascii?Q?7J27kVw6lQwbt38u9zBWMCvpaDyzTqWA9aoc7pCs493ECh8Plbt7dpK01InX?=
 =?us-ascii?Q?BrFzIhrgBESu5xBff9fOiRrYE4z2R5RlxPkPCNXg+mQ9tEyhQS3bdK1w0BHn?=
 =?us-ascii?Q?GqkP5SVxb8z/PG0nacaKlkHj0OZ+cfqsHzJMRkSxu9sQ9SN+FkXugdqELt3Y?=
 =?us-ascii?Q?N9jZXA0K6TeNF8+9Bzoyn4b/glG086kC8burw5340fcXsRGVc0UMSwVgkR5r?=
 =?us-ascii?Q?ZpFDOMp6xiqvobepmYOnJg924t7c7YXFb+ZT9qw5srf9YMK3VwloeHZHruFB?=
 =?us-ascii?Q?pekE88tMAbEWRAeL3kQuaLYozJb7/CfuL0hbcoIz6goMoa8FsHNOXKS4NgWv?=
 =?us-ascii?Q?zsX0IphDMN7Z79aUxw8LeKeD3GmpHYmgSP2hBILdH4rIL2zUD5pqylWW9WvA?=
 =?us-ascii?Q?roQuWlH/V9T0mUppCEOtLFShZQqb+9D6wcpZPcEZiw99r+jv9BAqg03ROKB6?=
 =?us-ascii?Q?c2+3uX+r/PzH5HHcCaWakd77RfdoiQN2OXt3/DMvVLU3yDEOTQJHa+Iy47oT?=
 =?us-ascii?Q?EskwHvWo0V8sm965MiKYUvOQO6fXMgAEL9OxNyNe/LDowEDCixgE82j3Tuav?=
 =?us-ascii?Q?puJh6EFzNy3S2FHcdrWodsyP47lA3oR1Sirox9TCgi1pHxdCZ8rgfQtkbXzU?=
 =?us-ascii?Q?EG1TJBbpCJMv0quSdVXzXun7l+YnFjjuX+ggOIvkx92ZwgUbKsZ+6wdOijHN?=
 =?us-ascii?Q?l3WCHOphXPzkgoTONYCJ7HzGctg032E1h/HZ8T4419WVl9u8ql4lxN+1+euw?=
 =?us-ascii?Q?299qiQXfF4FdzV67WWc7Igz+1BIsGATrYlVEnr8ncaFIx/+klL/RWSPdu0dm?=
 =?us-ascii?Q?U/9J7jnUVU2kPZMqR1reqys3URmh7htuN1IbXsZfXmS+bgij4JvavUwlkXmQ?=
 =?us-ascii?Q?6DZOSpw05VLJvqYzEJUaZzHvklH+W/ppGeDwtq9l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc64f4c-9f48-4ebe-d988-08dced09cb67
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 11:09:10.4506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GpzRzxt7vWj6VWSW8n2ehw/KlX7q7l+xoatBks4bGlljG3mwiwYlYV5pehQP//nlwhqhhg6SQrywr0kn+fBaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7701

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
Changes in v7:
 - no changes
Changes in v8:
 - no changes
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


