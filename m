Return-Path: <linux-usb+bounces-22879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E5A839B3
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 08:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49D4F462EE9
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 06:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5F5204699;
	Thu, 10 Apr 2025 06:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="arayCq0O"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1DA1CA84;
	Thu, 10 Apr 2025 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267654; cv=fail; b=FhCHWZGWYw11fiTssY4gGn4fUcHGx1vznhmfPvEHbO8HNNGv4CGtewYQPP9+5bb0LPjHdkicaqj2HfW6BFuxyL2SFbqZ9ey1nXlZEGj4feCOV/kpApDw90Ks+d6LUkhlLWo3YDUB4CEpefzHGgHPlMFt7zP7r6iMnJnnqGRmHYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267654; c=relaxed/simple;
	bh=d+f+qGSWL89IM4lS0ay0uIynenTjnC9FAU49Sy9g/O8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KgMoXXdG3CJDTwS/qdnKwHcT1zWT6WrXGSgvAdwKOrrMiH5wB8gFlTWsgn4dYR0Bgn66Pcw9fMhVeDZa7XEx5VeH8HyGpphc+64kGs80CE9I3tk+iIwk3ff1FW5LEcmjRrYa6Wn6snzVI/kYe+lTyN8t079vpMzGqvEj4kf2LxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=arayCq0O; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdTVThMj32MllfmxJCM0RkLQGMjCRmlCEk9hRvecMcAzq5tgpqaWsJf/0OfWq6gZAcwU0ar2l/TT6T5G/EfminVaxEAPFyoMJxA1gM8VeJyV9BFjQGOlf3RHAbPbsTX2ZcKlcqGtsPnXTogXpFi+JrD14lWE8bmHgLIcSY9/DHGQBisQ3qyy46lrjAvrRiKu6nRSaJJ39ctD3EBi0NowKV4rr/6+m2oj+kVWk/zMJDOX7QOFD76zVUHBYLsdCmA3DqyiVrDn+BBhZUYrxiuT/YifM6Uv5UX2edaN2yxocg8y9Z0ZGX7cOZqSaUIE6NC1VPRY0xf6VoaLOCFMVi1kDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFsdg9LpH5fWu+jWlEu1HX4OVQNdBKUtywoEJ0rBhQU=;
 b=mkKEo5WD1/xzxLljYUUPj4bwlXRy33VBvzz1QY8airmM4vhXbEpZqYVzS90zcuL1y5eVAwviIuuXpcGGIYKnVyanmRGncq22/30OvC4i903dLTYV07aiblWWe91ea7mDUM72KetccrW3CRHYv3P60NKHhr9P+FTIixbH6BS4Q1MajSOLaheW6dXee87b57VnYw/e70+dR1l2s/qKlnUTFCgcRvc5/1rEl2GHVIrJ8fecu1Bzy0KW1ivIuGNZ6XwLUC1eeK+Eur6bD/meidy5CAhmsTh9LC9crJhSyElnqZ6I6NSw8glzk+kz+y4bqTu3y5aa9KcwHO4NsGlDvaIr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFsdg9LpH5fWu+jWlEu1HX4OVQNdBKUtywoEJ0rBhQU=;
 b=arayCq0OC0WYI5/4G4URgAia655hW0iNsuhgrv3Oosfu5JLyy/AIJFlSzOnbIQtluRatARH9R6zqYe0Lx52p70JBinTMaJbru3ncl6lEd55F46bJblZLkoCCkZhQ/nd+tBOBO1Idhs4rZjiFm68dLqtx7hHeoNw4TSHQdkAkveWXDKIQiaGH4kOUHLMgfQbYOEGkphRe1/A52/oWYko4Y3LFszxz6vx3CnQXWlXMvssmsbxz9KLi2dYDHTNwaN6etiW8dTS942wur/EFUMJWIGTER9KdOAoPVQAH0l38vEy2zdf3AtXX4PvPHWxcfJttfZ/8qIxOCf1HHRsFZNo92A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 06:47:30 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 06:47:29 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v6 1/3] arm64: dts: imx95: add USB2.0 nodes
Date: Thu, 10 Apr 2025 14:49:05 +0800
Message-Id: <20250410064907.3372772-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 99115c41-4183-4df9-e0c7-08dd77fb9002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OzmkEtdZKuEzw9qtEaCildPrcyfHdOcRSpnei6fo8OcHpaP7KEZdVDTIgCUU?=
 =?us-ascii?Q?GhqkImcoolG1TkhbpDN3HqkDP7GEBgFxMFmNEIlHFyum0VoUG7afqqvQN70w?=
 =?us-ascii?Q?sosVJbNNZGV/LaO5EbbhdDlt29sBtEElqvg/8RqEEp+kYXNhOgj//xVEUzta?=
 =?us-ascii?Q?Evcr8+CBdlCwdLBJUi7IAZgTeGpYxanvCDk4unBmCSXepOQejqg41Cq7saov?=
 =?us-ascii?Q?rlsTJ4hhA1I1uV0Dr5DW3j63a3bX8KqeHX/yO96Fy5Dk6y4sq3CodRDuuutB?=
 =?us-ascii?Q?S/I25Yu2SPhsJ4ql/kYbhrNASxbMmTn3j8fS1T8l8UFG+ecEagvETHRaMhF7?=
 =?us-ascii?Q?D4ilTgraVcBgcbIPhpH64If4in+4ii1yMIrNEGjQpcw5KSUYsPLiLndruNVd?=
 =?us-ascii?Q?n96TwipUJJcbTbn7NIYYVO1VblLp2J+ZyUgEzWvZNu3lW0oRVJ5iZcOxpNjk?=
 =?us-ascii?Q?dtuIWXL99H26LPBeAeEdDu/ZCpykQl2KV1hbl7ah/jgVCU3sLWREMnNuVn/R?=
 =?us-ascii?Q?tGOqHX7RPVToYKPuvYMtQWxTvyao9TcjvkfUHS5V6Hjs8THv7Z327km6aCw/?=
 =?us-ascii?Q?ajNOA3OJaYklmegywNMvkNU5lz2t6oxqJMdc8Jzjovj9O+1KBQjeH8SzCC/e?=
 =?us-ascii?Q?oGV0lbfx+NH8aiJsr17plOvGm9BgYktkrAMTlSjqRKXEtKGg4tWUWtlfXOMd?=
 =?us-ascii?Q?f+RpDJ3OdtGsJk9tYE7aFEId+RMelZZtcfY4SzhuOKW/YlAlj0mJnk9YipVi?=
 =?us-ascii?Q?57ZxU6ltmxKzIos5zwhAWXOjNq4eaQSad1lX5kuqHjR906hr6iniruPuH3cS?=
 =?us-ascii?Q?NhImA9ExeIuA/o/WJoSfP+BFgvj/5h5aJMcDH8BvmnYa+/IC28iY4/Biq+oI?=
 =?us-ascii?Q?DW8HUNJTJlDJOZSyyBlOR9bIDapKGf8Bsn0QLHSm9yyEwKizwE5HA4aldfzO?=
 =?us-ascii?Q?pdwrioqyRcH6HiYXn1G3e7ppzm0ckZ2/OyxwGk5vfSMtTlwAT2XeZ2XpstQk?=
 =?us-ascii?Q?gQNDI0Y5o4nx2Nu9dCqt3HpYTV92jD8g6qPIfGvh1/PcBZut5FS2+LSHjTNM?=
 =?us-ascii?Q?vrnqup9lztEk82zY/UXnwb06i71gpDFOq3yncrZ3YpS7CB61Holf6s+r5mWb?=
 =?us-ascii?Q?ybFhLS0xetaDmhViIbAP3xYePFLgNuBqFNQAbHVtdqJzFXf5SftT+k/N21+b?=
 =?us-ascii?Q?m1GVjrG0cdYn3clBpgZG8+xumV1NauYKNJVhRpYARYdayDeDqfQwQCqs5zjT?=
 =?us-ascii?Q?Ut31uAQIYz9oi5wnNS9A07d++xiX853vTpQ1jy1SwT8qLRYZoufem4LeZDaE?=
 =?us-ascii?Q?p2pgLKGAU7XX8Px2qLDzbFXIScW22kseNTCqcH/OIzT71rBCzr8HdMWrqKYO?=
 =?us-ascii?Q?uLExB/czp89XVByLrsGl43pxfhICPxkmqDORV1sFjVS9krQ8O5dr6EoneWA9?=
 =?us-ascii?Q?QG8f4Y7nBINWqDOlEzZHvL7xrTcTCYX6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lfFTumq0vhvlMAmou7FZanyIG/m2Z7tmP9w91+LRf0tyCZO5BKToiY8cwhQp?=
 =?us-ascii?Q?d2d1tA/Cjdkhqb6VZOHfWoeXMakrz8EqyF42Y0DoOWbZhPI1ibyFrEVaM1lr?=
 =?us-ascii?Q?cIxyYDKofuw7h/CkFvgz0RWtTuBNUQZdAEAyUJKvhOZSFYCEr8e7dIjyF9cu?=
 =?us-ascii?Q?ykJHI2f++SuP50v1XoSuXo7ply3mBF08Db+FgdwcjUO0ApjkPBTY2C6VEs+l?=
 =?us-ascii?Q?FSSVtVYig7y6AV3p1sxzF9/AYuRZ0XQvHv/aPCYnaP3Wes/mjZOp89nvuPLN?=
 =?us-ascii?Q?8HYOOSpIpKqoB63fzlRShJoP+DF4f37T5XXJcELf2rqqPfXxrwKG67swIPxt?=
 =?us-ascii?Q?1Zwehp+s2kKlCUDXxbaBwIFdaSY7Booi8WGDtbsDpNkV7Rj6LnBQsYprsJDA?=
 =?us-ascii?Q?wBYb2ZPymXVwLvl0axuBpR5Lj4sZi6IxSJ0kIg0IlXrYbN6qvFAmdTUyzUsl?=
 =?us-ascii?Q?6ox6q+maGsnbi+jxdG5Kj8PhFx7hD1KiMHkxc5qYV1sh9ZxVs1N5PKjcckfr?=
 =?us-ascii?Q?OG/5wP5t0yVJ3PrH2CDb1brqh2DVdSEceJQDC2lzK5ZUuIRMIqEXKnd+ZFAM?=
 =?us-ascii?Q?lkwTQNxYGxDB8z6PGPejc1l/L5DdMN9sIf9TTdl/8dkPbAYxlYGOsraV5Ldu?=
 =?us-ascii?Q?3w6wgNxL/rb5Iuvjqu4dWnVKLm98eRW8dC9XxaI3zhu0b9YDydKIRbcn6hQ0?=
 =?us-ascii?Q?EfuBAue6wpBKS3+LXsQlmOpna6gHsymQZExmUQ+VKZjKcMvGUHkXe7FDHSSU?=
 =?us-ascii?Q?i/XryDYY3NT1LDY5VcksFpDnJAJWpNpNyESKOkP1/Sc08triw/P4XxBOa8wb?=
 =?us-ascii?Q?7rUgasWoKbQiiUB+6hB1ikiHpBDkd4mxp1Pu9W+Y6ihZqBd+amG3tWgCErxb?=
 =?us-ascii?Q?92ElOZWGS3HM+No86mvhRjxmHUeyXC9X/fMOlzlcCSXoCo80jF4laEtRDG7X?=
 =?us-ascii?Q?aNyLOa8AAcb/N0aZezIObODYaCNf6uH/xnXNWy+kNtzuW2kAvdrB0+5qUnc8?=
 =?us-ascii?Q?RwE2QmYapM7NFML5T8no+/rAmANVUCATT860KBmOZxbBLdbu7t6Ez4hEWMPy?=
 =?us-ascii?Q?QIRTDcprHiX12ORxM/ToCS1/0whS2bl0BzTp4ILZTZ7b+j5cZcMJMp1La4qH?=
 =?us-ascii?Q?+y/GbVtnkw6N53D4unk/Y3fvu+9TESJv/FAGlbwRXMCFiW94UhUXnFgRo0Ds?=
 =?us-ascii?Q?/fBOTvQH1aSjs5reuDLQEHMs49tv42RUyJnXTUfpMdWJ79nuU8ItiBuI46Ou?=
 =?us-ascii?Q?icGQL1RtlrDFY+UU9xtv2yllgY5uwp3VKQ9bi5QmC1MpUYXjQ/MhxciQmDzr?=
 =?us-ascii?Q?n863ajxu9OTYZQChu8qdVtDovmryMix+mutA9slto/eSn7rcE+hzMq/Bp1CP?=
 =?us-ascii?Q?Pcskm8dH+n676Li7S6/ecJF1pHCneYlWV3+KpcTLZb9F0L7+ECNm3+WlB7rs?=
 =?us-ascii?Q?Ti21BPY/rWC59AWgmNw+sa+79OlDGwmTHHW/5YMVXPEaxcej8OuamZU5aUb3?=
 =?us-ascii?Q?fQtSzZH5oZFdbzVhyIoVOIJwr70D3KjHxnHtHIBpU7LRJltH9r00Wuv3ts6r?=
 =?us-ascii?Q?MEtsFRy8JFtkzzML7mWnl1GojKKPeq55nEIIUENg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99115c41-4183-4df9-e0c7-08dd77fb9002
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 06:47:29.6264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOLDalrjA2vs3hYUidfsAamaEzipmrXbD6FYcEWBoKxYvtc9fGSsLAx+uM8xFoXJlLEFfgd7EMjkZur3wQFkLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134

Add USB2.0 controller and phy nodes.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa95xxSA
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v6:
 - no changes
Changes in v5:
 - no changes
Changes in v4:
 - add Tb tag
Changes in v3:
 - no changes
Changes in v2:
 - add Rb tag
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 9bb26b466a06..8dd859d8d319 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -470,6 +470,13 @@ its: msi-controller@48040000 {
 		};
 	};
 
+	usbphynop: usbphynop {
+		compatible = "usb-nop-xceiv";
+		clocks = <&scmi_clk IMX95_CLK_HSIO>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1621,6 +1628,29 @@ usb3_phy: phy@4c1f0040 {
 			status = "disabled";
 		};
 
+		usb2: usb@4c200000 {
+			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
+			reg = <0x0 0x4c200000 0x0 0x200>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>,
+				 <&scmi_clk IMX95_CLK_32K>;
+			clock-names = "usb_ctrl_root", "usb_wakeup";
+			iommus = <&smmu 0xf>;
+			phys = <&usbphynop>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			fsl,usbmisc = <&usbmisc 0>;
+			status = "disabled";
+		};
+
+		usbmisc: usbmisc@4c200200 {
+			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc",
+				     "fsl,imx6q-usbmisc";
+			reg = <0x0 0x4c200200 0x0 0x200>,
+			      <0x0 0x4c010014 0x0 0x04>;
+			#index-cells = <1>;
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
-- 
2.34.1


