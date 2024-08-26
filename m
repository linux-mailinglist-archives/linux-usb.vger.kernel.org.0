Return-Path: <linux-usb+bounces-14083-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555BF95E9FF
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 09:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AFC51C20E4B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 07:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE6A84A5C;
	Mon, 26 Aug 2024 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IT03c74R"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2056.outbound.protection.outlook.com [40.107.104.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72153376E6;
	Mon, 26 Aug 2024 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656133; cv=fail; b=iUBagBCoO1xlWOuQPPLUiY50vk6P/tm77Mcrh+4mgP55VEYjujqOpJ+nP+ygb0aQNDrMfXbuGI6N+m+eqzlbgoKdD+rTvZDrVul0xfTCjOepzOE0Dtn+McQB7QWdnmBVrqtYTSo4iaZ1xQGFOPUfZ67PCHtiOCV2lU/BVKpMwZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656133; c=relaxed/simple;
	bh=Ih5Ds7GAD47s586REIW3/CM9Sk5vt3H/316SUtyYPI4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TNoob86W8sH2HeIH94+vh5IBFnr7W5j0//mCkFuM2uiES0gLhAfSkdL3Oc54jdrMvhJ3wSZASl/0Mu+Np3w1Nfzh8Ya2wmQHolZ8MydsMJRq1BmxcfGtUncVppyzRVkhdQ61SStiRgNOcU9TJvyOVaB9zMdLcZlBUkA8XuTEihk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IT03c74R; arc=fail smtp.client-ip=40.107.104.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgepawRc5+htmQVb0socB5kn1Ug4hEYSlC7hSCAbGkjHtd9OlMv1DTvaLwBhPAD24HROZqvFEXUlKZkQdwA37lHK6Z2+c+lnlTWESMuDvgK4uoppvNRZ4SN+yaXm+MnzhrofzWIYBoW0h/keOLOF1eYOe0zWz//Df06aWikvGiqmzIv/j8+u4YKXtuO5CuaiDP85BEcG4dth2PL6qDO3VTn4/DKmr1sDQ5c2oAWtA/keQQ+Jicu0QJge68pS9r9hoAt+InPp5NNfNobrbzTa47AfkukPEoXGJ9+TELHYwT7WTrpcWPUTHEpQgG51KoFJek5B0JRzKvrZkinPtDoiLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN+CB8lunIQWJJvOwgo6E+dee90lpc+pQQewjqEOb5M=;
 b=my12h7o/XgQwepnvzUroRJBlZaDWd8FIEX1Y8SMqOMGby/g3OiuG6fv60yRLkn9IxG3YWUv6cx6/QeKnuU4BzZoaUdiOoVvnndYLjIOclvAbAyDiIp++oGOlFfXJK8uaDYeO86L5HdI0VZUIsDSVtd9dW7S0xr3Ktrk5Z+vgAsxKajlZ4u/PqN5JMe6pinZoGYmj7LQQfH2Ly88z3wucTtvtS6YFN4n5vL5jBaLUZVfxoPCERn3ss+JMWPjJuL+FjkEF58slIlFoILojH2goz/w1CpYbAIQvAGHje6QfIF3fmVo6yeNFdQHyHXkoXh5QDl3w9YQmH92DLzOiUcUwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN+CB8lunIQWJJvOwgo6E+dee90lpc+pQQewjqEOb5M=;
 b=IT03c74Ral25cPPr09Y8cDNnsTkWFWtHQz9AvLtmWRSnu6Re0vet67xGo7VSax7lMLWRqBD+cYbUymOQJfltVk2vAZu38uw8LmLrr9BpWvIknN20lpuplBqijjxLEYWCqNanvLVWB0YKVOTBn683UtICZkMxjvQkIOVd7yePzyEdpYeu+T3p11oIVfO1VinJPhgG3s5pffBLoq4XhLdDH2rVpho5ReTdHKmgiXpr2390t0tZonalHLrhGaQSrHq7FLtACTZySAoFYr9E4y5UUtW5tfmI32uomxT2BzZIFpiywROdN55UvdW9yMUdlQKTrPIDwPLOLDnrWdYt3uns+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 07:08:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:08:48 +0000
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
Subject: [PATCH v3 5/5] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Mon, 26 Aug 2024 15:08:54 +0800
Message-Id: <20240826070854.1948347-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826070854.1948347-1-xu.yang_2@nxp.com>
References: <20240826070854.1948347-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3a4f8c-fa74-46cf-39ff-08dcc59deeaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vAKxmNRTuKqtMQDxLkal/T4RvgQ3wgwFpE/MwQhKHaZbuMN79gJs5CGowhhv?=
 =?us-ascii?Q?tFtUw/wmS6SvRbTr20qC94FHYErPPfwnx0vasYhdw/FizcplNFiVTJpxDX7L?=
 =?us-ascii?Q?q8+v2A1garBVjmbI0OeGim0x3oKqP/uJV8hx6xQDhxXGM0yw9SWahib5q8gx?=
 =?us-ascii?Q?LCTYSW9cqkGiOfyWdGJH3tJz2/fokGOi5j3gcLmgkay2xkkF5Armr5PptLzW?=
 =?us-ascii?Q?xIJqYB2lSjHAlx1gAKIKwGevXj6UrpaBVU6oOH0Rhkp7pW4qp5G0HJQ9PKWf?=
 =?us-ascii?Q?hdhYcckV77bHyyxPghARL0TbGd9a8MI42uaUMRjsa72OvT/3VCpnIVwjbvwC?=
 =?us-ascii?Q?Vtw0EIMlki3E3m8TG1gLKQCRsGcHSvIQrJw6yhCQapJLXqd2pXiO0otbbluB?=
 =?us-ascii?Q?VX7WgZe6glPMjDhMXfc09l1xEtwXpS606JgAj4+60sO9qAEx7BquNAlawsi9?=
 =?us-ascii?Q?RFTAqkEPeOAX4tbmPfgN9po6vtaF5q8H+ntSYxJ+KmcRmt1kULCHlTSOZkNL?=
 =?us-ascii?Q?7qrZbO6QgS7dGuM2Wv4XgWUYH0y6cn5RfEk3Y5D7+kCqHQBjh5CFyw7HTv1V?=
 =?us-ascii?Q?Y+FaKkh64gSC1pXl26zilF/vbVOIS6n+C62COj5VfnEFj6zyrduRLALMY3gY?=
 =?us-ascii?Q?bQzaJLy89oZOGztNfHGaB/zFVXqOXeEl5r2yPGCPX/6TU3D4R59t5nsejr2o?=
 =?us-ascii?Q?4aWeT/l4dzoQMkEkHNox46/aMwITeqppBa7s48EYj/0FxprUeLLhvqDk9ZiG?=
 =?us-ascii?Q?5ROOi5kMmkOuQGDZsXK1/Nief2E2uhWN1mJWwZNy3lUhEWeqEE9xNV9egkDm?=
 =?us-ascii?Q?i0tWGPJbB1+6axHZQ7ESanSHg6uQoMBkn39Y8L5gPLpnWNV8g2tMK12+lDS8?=
 =?us-ascii?Q?BXjnjdWDnaCt4bQgpZldSiTirzX9ZGzx5di1LmpnlblaemNxafwNjxna9UgQ?=
 =?us-ascii?Q?FvAH4iNQVJiAadW/UVqJ31CGd5isbdG2AzAgwMN8R8W5JBvSUzRQKDMPYXvS?=
 =?us-ascii?Q?NfxEBNQ0JHLe5cs/anHWB1ocUmyGNy6rIn6RDAd12g4Tt92CSzMs9T+Nd1mJ?=
 =?us-ascii?Q?fizUgqwUNv57qBaHcN9K1HyXR2LUN14Xgv3iH2tFl7Enw6SAaRMGMIBekCYQ?=
 =?us-ascii?Q?qu2w9vjV1k7flVx8ealXDLPIjSZyCaLNlTjfr9hBbrdkbFofswhKcUWJeGWO?=
 =?us-ascii?Q?mK3zzRKDVgIhtpmmajWnfBSXucdXS7SXXg9EmZ5ld7xmkBeXzVTABUmIdo/F?=
 =?us-ascii?Q?daJ7PfcRC3NTibej8b3e1ka0stc0A7A3PyI5uvfbp7bo/0YRLpk/PO+/Divn?=
 =?us-ascii?Q?2HF+I0EcR1y2FerhdpToEZ9XAm1oxd/jXbeFvW5eXksVBMlzFb4yzsnKx3E6?=
 =?us-ascii?Q?d6qKxyFxuEhOBV8S+vPbqqLNOFfyoKGT4d7+yzk/Bb4xhfQ2U9rAS9WInwF8?=
 =?us-ascii?Q?zb2n0jxRRK0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fXTPFmp6ytZVcbu1DyTx7EvsfgkFtYK6o5GEr6Rf++aC5lh1WxNHLmfFwO91?=
 =?us-ascii?Q?BVq6EB8IOdW2X3wAJoCFtEPIM/UZT5MevyoKpQQzVutciTDwEv14OaQCZ6fq?=
 =?us-ascii?Q?Ja4wusXqHeQXVXaycUtkiaBdZ9EvOHGqg+t5hkTopaaPHecYoPMzkv+Eom7l?=
 =?us-ascii?Q?Dv/PINBCsol244mWDGowD76AYGKQzxPrL4FXlHh2ZCUJK1/BV/4ghT7Fnpeg?=
 =?us-ascii?Q?ie5t5Pv2YUs6v6NrdTq6e4kqhV5b/SNL/tdzFMqHMJ6EBMTpk5plMJSNVGY/?=
 =?us-ascii?Q?+BAJQMupDdt2d8ATt27YUel0TZgYWtMgESauX4ziXYdM0+fl8X2/wY/q+7fa?=
 =?us-ascii?Q?4b1hA4alMj58M6nq7at8XHR1LJb00MbHucr+zWj3eX2e195elmLffj8sopBv?=
 =?us-ascii?Q?2B6gJRYBDRs1sL693rZHe+27FqmALnEEEMoEwklaUvR20+E6iTDoMiV7r07P?=
 =?us-ascii?Q?vbHZnuKf//IcISMSPz2/joqhXHWGOF3ND7/f/ogksOEvipbJSP2YNrN0ZcUP?=
 =?us-ascii?Q?EMybdPsJl+B+riiqvNCteHo4dMWQmR4/HL6bBkygYYGIX4QRQRfkK+O9izBu?=
 =?us-ascii?Q?9Z/TJATOsrTKLKZC7vfdJ3L33XUGJKjHfUsgeA/lS1BPH6z+XzbSvh4LYeL5?=
 =?us-ascii?Q?Fz1ik6D4M7qNPtsabKDced8d8b/KfUwqn1QwnYlN763vs1O9zbP1yyNB1jop?=
 =?us-ascii?Q?BR8dLg4rPWffZkMZ/t6mdkUu+/6eAnNranJED3kKpnwYYR2LUN/Xn0j/IF7f?=
 =?us-ascii?Q?42/X8qbJr8wywDkUTlVCm8x2dhC3afaKpdE7j05dH5LDNLvIjdauIXEncJ9W?=
 =?us-ascii?Q?IsGWIbAxPZkFlFpBslqzEjY8Z+1GdUhlzq415h9UCHfuBEw+DbB1/nbbJIbE?=
 =?us-ascii?Q?znMfgT1icBGbnnwIhTqCP9CXQlmNy8HoORLVq5H7l1fOSE+CrQR80iOyv7WO?=
 =?us-ascii?Q?g9oHTMR7UP65u/QIGNGwM/+qMRqknsMqfOKIa/BP08a8s9Sh9+r2Nc8rEsM1?=
 =?us-ascii?Q?gElTxHbsSKQxKhiEOHNpoMnW3Vm6JqsVBcGJVShpwL2Lg+RpA0p5YcUbvfYl?=
 =?us-ascii?Q?YB9f6GGvYfySv7SHC2vsYA5hqWU2MgoA9s5hCDPTSS1fu0NfKVOvQh9IPFR3?=
 =?us-ascii?Q?R9s+0lcDTTB463wt9PRra593NChD8F2rvukuytrItkJd3/0pG9taxRuOd+D8?=
 =?us-ascii?Q?nLFceOt9YgrsByrRQLkbAYjOhvUTaAUMbbwZFV9iBCZ93H4J72XcVqakYXBe?=
 =?us-ascii?Q?iXGSzpjzyFHp+VZO7W+KI0joJ+1zyBLpKnupjmg0+my3xwO3EVhYrrwbloz+?=
 =?us-ascii?Q?pIXgSqC3ll5A75ihq0DQmzlPziM/+AumAJBLiGR/XrlDXezO7XMZS197C5ay?=
 =?us-ascii?Q?pWiN/6ae9DNUNnsmdD9PmbmVZVQ5/tVTXZk967kPzhtK8or02bOOfZjX1M51?=
 =?us-ascii?Q?EJEYEfS1W8onF+UDYiFt2fERe7o7F15VK5mUCy8yDbiVm1QVEMWt7icfLehj?=
 =?us-ascii?Q?uNsmKvmbfI2Ia5/9yKctkqXyyt61Vwytx1gkM3a6npM0eXzPYe3rSvV1MNxD?=
 =?us-ascii?Q?vOKIVl5zwYIFNygCV/DpZ7XronOvqtCfdCFuwt9m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3a4f8c-fa74-46cf-39ff-08dcc59deeaa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:08:48.7354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qST1F0+7iGRXRk76JwqM6/sIKZGH/R2Y/72VcAx3ymqsJxVq1+7i9q8GYHnpoIiNGvKoqBBp1hPCUCfCphufg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

This board has one Type-C port which has USB3 capability. This will
add typec nodes and enable usb3 node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index d14a54ab4fd4..46a9cd3d4403 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
 / {
@@ -99,6 +100,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
 		interrupt-parent = <&gpio5>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -128,6 +171,38 @@ &pcie1 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
+&usb3_dwc3 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -245,6 +320,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e
-- 
2.34.1


