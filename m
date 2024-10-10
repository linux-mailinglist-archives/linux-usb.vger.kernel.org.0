Return-Path: <linux-usb+bounces-15975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2181A9981A7
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 11:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82E9DB297F8
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2024 09:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29D11BE245;
	Thu, 10 Oct 2024 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gCwMCSiJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2050.outbound.protection.outlook.com [40.107.247.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913891BD513;
	Thu, 10 Oct 2024 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551250; cv=fail; b=Pliu1rN+w7ohhzJ7MVo4DoXsnWqor2NshdkPWlOOp7kA1ergu/GQLPZVN957bBUaQEaP0mLphTh6iULd3C1/cYwTdZU8MaPSbjhNuP8ySO8cC9u4tOUoO64CKEpZUP5hPKG+mOJW/vfKDpqCpAYN2RDUNzLuDLQLAFunZgIAXb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551250; c=relaxed/simple;
	bh=CkaYUvPFYkZkXWZ0uFnxPHtcbuH7qqPDfxyOc+V/Vfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UfvLQ0QwS0fYwfjer0LXsgst9ogxyoTST/fu8ixFvYmU8TgeXtkwab/rJZCnPCVAte/FknxDPzpaA6hXhPp3uQEKC9vXgXF2gEvEMvENdmB7K57BpX4bUpngEkiixJ7ul3TeRKTnrRVgLFvI+U5BHfsoV5nLi+eWmXt2e27FlWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gCwMCSiJ; arc=fail smtp.client-ip=40.107.247.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9LBZc285ZZzsytiGEEFF5jLi4PEl3HSiF46cvgCa3J86IgjQu68UDvbnfPYcMz6WZdZxAS8MC9ROLtD4JeE/AzipAR4qTlERMzZ58/z1QDjcLX7Ezxbx1ntMKXojoVzmJYOHdlGYPkjLyrWcZ6PbYiU/b58sJ3+B6V8xaorSVdlJgkjtXcHtWjQoPt4DyaYPs2IunouXwT5X4hd/DgasgN+09V/lYzFHfitnTLxUKmjKpxpb/Wvi4udAC1dhSLihkgbfj3qHUNaR2WkzSLuZlT5aQD+2/UVoWpaophqM1Aorni7m+8V03sD/f0uXoHGcZwVVSr25f7/tHTqJ80Nqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKc1/PW3yqYwkyzRlNd1ZkhuyJYQlLry9bpPMtY9WpY=;
 b=fXvzxF2/7YJHMOG2wdhIll4sJEU1u+w7eMIaGUzNcPQt0fIpttgum72bnUgWERoSF4wQbhuohJ9JCH1Z+nrdvzqGLj9RgCr8OKkFpyZrUAcOwnA9c3djXS93hyE401e56ZXKYZeY7c6tH9knjOGFBm8TYdGZ4rLXZuYSAP+hSCMp8FZOK3jyMENcYiJ14XNpAdcgmy73xGzao48k211Isqz74pJL3Dmhipci9cZdQCusZVAcKhYWWMABVcOhK3tBvY8cfkFoU5RhlRe17o3Ztc6O/x07hYULUmqmtrOqBLIrY+v040pYpuIaYsH2cCL/eYsvA6L6AQPEiFZ7vi3B+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKc1/PW3yqYwkyzRlNd1ZkhuyJYQlLry9bpPMtY9WpY=;
 b=gCwMCSiJvk7JSEu1RZxwVeAMcVCtw1339k5w3UcxQM0xyYvIdV+qgIitW+qDJ2HQYTQLL2jsXxpq7tqXDLih63QpdauaS+cRos4UD16W7eb7eqrrHQm5179Y32oPggquYIGeLm6R4AYUUELGn01yx0CrbgnqbjGjkHdpffkEymZjIo15XEuOByb4k9STdhZOi0q4BvdXHLI/Djeld78ZXqcsNY0PM1sSDNfINv9qiGCM9rFwLIZIihs9aIoqI4PuXoV5F6hXl49U7H51fr3ERsQOqxbzz9FuUHHSkhoSh8sa5u1/eQuJEYyIzR0cLOWrLgpi78lozUUMC9MzIV8Lfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB6851.eurprd04.prod.outlook.com (2603:10a6:208:182::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 09:07:25 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 09:07:25 +0000
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
Subject: [PATCH v7 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Thu, 10 Oct 2024 17:08:21 +0800
Message-Id: <20241010090822.3915064-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010090822.3915064-1-xu.yang_2@nxp.com>
References: <20241010090822.3915064-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0187.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM0PR04MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb2776a-d6c5-4b49-9623-08dce90af536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s0fp8bbNjslH3EeIyr6hqIBMJMC1X6l5aBWtIZQhEwsuIA2GohvkXBEXIfYM?=
 =?us-ascii?Q?Nt85QeZBwC8ePBxCPt2hsf3jF7NggSzR3YV4SLfMVjL+5zRdv550EJSAvWR+?=
 =?us-ascii?Q?QCKD3Lzsu7ESN0SDGz+lukArZPlm57oMunX6NvUvw2NjDIlyl61+IlVlnTYW?=
 =?us-ascii?Q?D6PIwkoFdeI4YrpeFb34vdyvjBaV3q9E5ZPdjePtHuSqaB9WgU29FRhjaL2A?=
 =?us-ascii?Q?MC4ZDhsEMjERnbrIWLetjNFdXQEcmrrY/U3B50I3k56SETQ/6BLkvkapRHsW?=
 =?us-ascii?Q?aAxV3wkZhun+nX3I5HvXnTKOPrHDN9lbeNGGmxXS18YnNM6pB0W9nR5hHOxs?=
 =?us-ascii?Q?s8yhhRr99SG/OeWtMbvKpGwLSZW/QALaJuZQzJ52VFbisTtGtrwVrB5706OC?=
 =?us-ascii?Q?tJY0s3Z1+nWBbMeGUKXf7w8Ki5CS5wUD0dcwOmcWPqFM/zEKX7JmwNyIQsmu?=
 =?us-ascii?Q?4qXodlrACrkVHaJjukPGVumxf5uC8Vjf2bRX5HqpzIhL8pPC+tbNRoY+6Bks?=
 =?us-ascii?Q?27lRv9BuXXudNreE8A3f/dBpOY4oglTKXDxSU2o3wuuiR8e+orbDD25olQ07?=
 =?us-ascii?Q?DkrIcH/wW+GMkEXmEFp8TzKHiFolJavuKtyyIJRDaUtcbjH0v6JnQTl8nXJh?=
 =?us-ascii?Q?IrAIXFAy2EqDjlxYaOXbDTs4Rn1Pe5W53s54pS1YB25HDyQ1oERQnG1rAGkd?=
 =?us-ascii?Q?oorTBttZuebBasolDwUHXWKgJQDyapvj0V7buCpl1qTDAWaKG9sSmrbNA5Mr?=
 =?us-ascii?Q?LxLSM20jhAHEyWQRFAqiLi+KyJVCi/K1aPU0OQigIQA/gXu4sRfdhinIvR51?=
 =?us-ascii?Q?qiqehW/qQbTjEqpH39DJ71ft2z4dpTczCPn4m+YUGFeJL9Lly6e2Ylc3eZHw?=
 =?us-ascii?Q?Ex2+ON/oB21b4YfJ6fowaoZJ8qS9494o8YdTwgUbAa2Y98qgPVau5PubU/yZ?=
 =?us-ascii?Q?skjC21UP9czwppApJYfi0/WGEv8gF7uW2DpWbDQvkv72bpqHu3/aV9HIsQGK?=
 =?us-ascii?Q?xK1JOWocc/0/kVqYe8x0mtWvOHo0ZdDiWN8BRLdmG3gIUeTNq8JJ1zTZjoLj?=
 =?us-ascii?Q?56DjIuJg0R2J5bvRUOuFPvP+o3AMXiMtOIQtBo8iaD/S/tFiLSJK++DlW5d2?=
 =?us-ascii?Q?4RBWEj6UvLXSXxw03QnvL7hNaO7z1dgm4OdtuZf1Z+PPwdynERGaGMoL3oEd?=
 =?us-ascii?Q?RCsS7tb5TfuJmqin3YPJ1E3JoFB0ihZHk35NJs6whUpj84mC/nQN/AR3o0Y6?=
 =?us-ascii?Q?quVxX8alhWchNWsUWIQS8dF/7j561NWpFAXR6l6VKY3l6F/Cyxa0eocsWAgJ?=
 =?us-ascii?Q?w/NNU87s0mW/VN1HcpVeSR6W17HWnSrnDxbAV6Zr260sFQh8N4i2M8J7QFla?=
 =?us-ascii?Q?jl2EAMU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ixRCqh72Rb09QTHfkS7CAOIbLbLErDRcei5FK0LXO7A9Evip9m7yUAcxXdmx?=
 =?us-ascii?Q?CiPYDXZ3jwEG0IzJMoTF12EDUq+AQ25dM/k+AqZKvqYbOArfp0chGR6N0PJP?=
 =?us-ascii?Q?8q54F6AwfXhnGcS/dI/nrJ+hcyDFOkSepy/eLb0rf17Cy0hCLzrPzkCcWmgH?=
 =?us-ascii?Q?HdvAXJKSiXaro2SWIUZGyNZjtwAWkejwhL6MRSPVSHBgvSfv6/UxyZU5K4J/?=
 =?us-ascii?Q?mnbuG4BOs3/DNLRHzwOvekjcVWA1L7DflkEcxd7SFO9B0okSn2lmbg2AadSL?=
 =?us-ascii?Q?0yGSwgLdiOvVvNOI72Nz3G6wWttN1/kBBmpNtrF4IhPX7xl3eWzc8OaV8IpW?=
 =?us-ascii?Q?fAJ9AC4zmKIP2K6bdKaieWyO40aMBDZRyMa5kiMaoNw2ZwrrqB57nHJMHIR7?=
 =?us-ascii?Q?v2gV05apfn/nDS/C1iTcublwYAyWi0BgiVOKzsXE260ML0Wlf3CI+T/xLqbl?=
 =?us-ascii?Q?DPLIgkoFUyEgR56SnnSHkF5bw53RtOjZ2D0xcDaqSuEYXJmiZ82mkGMJpBDF?=
 =?us-ascii?Q?66Rn4r3KWzJMyPDdXBvVuFE3u06vzDb7wAsvHR4UMbxAjFVeN6fpYQ9OlrV3?=
 =?us-ascii?Q?6TV+vMYsJSeTMPEsfj8eSCTADX0xaFHmP7ytFAWm5TEuuQIQH0OSilwuTf19?=
 =?us-ascii?Q?sY4xj5Je6isPlo0GB9HeQIRgha1duL9qH/SzA0PTpSdAVqmn5azUIhdu8Dtq?=
 =?us-ascii?Q?SNZm7eJJqgDZQ2ecmhkXcYDx0Vc5rpsnfRpHTD/z5cGcWq786YNRFNYWZh1r?=
 =?us-ascii?Q?IqNM1kGdE4lUYL4P9TaW76ofZghBIRCk7vDei2nhv3kaoYiw+lHCFjbwk/M4?=
 =?us-ascii?Q?scaJrG8K2rbFvstKup13qpjp7QiqnFCR6VSWvQhzKxLZmvP6Rd82GjAPyZDv?=
 =?us-ascii?Q?cCZg0zGMoNaUfY06e8BxZI03hJmtIhy6R/9tjsbq6YWYLHXuemwIz6SzqSz5?=
 =?us-ascii?Q?b9WA2e4aXcb9RlqOVpPNtpq0wKUpB6JIK5iV/4FEVbHKjr+8GO4c2rL8c7KW?=
 =?us-ascii?Q?9Se0dG5l4TpjgxyplLXTMEUXHQOE+ll+m7MHratWYUBrYbJsveCzijyN1RuR?=
 =?us-ascii?Q?F9LAQNqN2w/q7ROPCW7Sypnwzrni7NjDe74Tn+oSwKx6g4m/ORIm4GkElS+e?=
 =?us-ascii?Q?gSVl3rz2xo57tbSB4PE1DE6716ltQmFznIlVkqsrM6UEa0tcpcXKRAfLvpAm?=
 =?us-ascii?Q?6sbiihUF5Srex86x0jbi8h9D/qev2rLmuL/0dMq9L9ROlsiXhbey8FoEoeVP?=
 =?us-ascii?Q?b3dzea+78xPiN7W1fcWAwN1hH1sdHtP1POGMGE/758uD0VUuFxogy8Vd1Chq?=
 =?us-ascii?Q?Hzv1GGvkoiwN+6eTZFRLZ2TfhLV5egbD8AyEW6EaKYE4L0rAO7luT/9tH+PY?=
 =?us-ascii?Q?UyCyvAoVbMZn0AoUobGak93DJXMnMbUpfiM71VaRs8XfceMEGeh5ogGPYLYr?=
 =?us-ascii?Q?pwK92nRmAJwCMxCH/qJ1NKVkbXDjYXH0JsRtv2e/YyVAxMFLWwqI+qyuSbrN?=
 =?us-ascii?Q?k7TKuga3LrzCx8fPb5nQC6ez0cs8TPowF7yIFknr2KUm1fMCPd8Apfm/Kw6Y?=
 =?us-ascii?Q?kqOVeNEAE8Rj34cHxDAgKWEpLNml1EGu5GQgHg4t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb2776a-d6c5-4b49-9623-08dce90af536
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:07:25.7100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnkwMdbGcYkaETgTdbm1/rDG3BgFxFVBd6X9wIHQKvQF3FiqU+T7mNEWf1FQa2n54iwlbvLTw3Eegs597jwV+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6851

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


