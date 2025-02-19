Return-Path: <linux-usb+bounces-20817-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C2A3BA3A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 10:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0D6B18979BD
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 09:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CA11E377E;
	Wed, 19 Feb 2025 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PE45RfVv"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2091E32D7;
	Wed, 19 Feb 2025 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739957470; cv=fail; b=T7hPErnsfPZqRZONtc3Rtaac90BdQBcAE4EThxiWAnpDcWCm5f0kxV7NvCwJazL5+0GPH36GFAVvuhrYspeb0fQ6R1r6d1SgvbRmva0zkP2zCXnyn7Eu7qngzG2fu7Di7jhMMR5tyJ7ah6Vq7i/PTYpuI/V8Wo6atUkgGx77S6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739957470; c=relaxed/simple;
	bh=Dx5ATwNRVnr7Gg3jDq31/wzaVBnQD08+WeiEwP4oHfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OfqAkjkZYENbF9UVCESmlaMkj9j4Fo6A0CIQGcWE1DCqHquelFNlGHN4WLLKye3yaZ9H2sVIMkeqkfJaIUQ9ME2+T3mCHe7VuYAc2OYWqmKorUEiQ6UHZjQGv0xMdvGplEoonioMm74IUJsw4SEdIXdWpFoYuqMFqV2H4/FO1qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PE45RfVv; arc=fail smtp.client-ip=40.107.104.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+cWunJPaKysB0Iq0NQDlYnv9TXRBo3IsgC2VmZZDilZbVzWP7HsOKKAFmJqtjNRlOLowfBvXcjKrS+ka4gpvLpO7MR8ooXoB3MNYtUIF70rJyPQ9yM9FIIpmwYq5sK4nLMTQpGIBtO1Xi2RQF+yPRXjVrQwi5eUbkzxqEBBTie9QB5N1eFeNYvk0MqSarTPR5UlhSPHsP7Q/x0VO66kjZaLX8BM5B0tXZ2WP1Ra1+opZXhyIbClghKI5Pw0ALyzdr844b4Fqvd5MTQFBqnjiIEMFnUEyUEhDwFcZliZdhXy9g/BcjBEKJgEQ+yHvHk8ydtxwxVHvPr2pEIxUIxewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRRv+TKWQ5vUJ4nIz5eE0fy3q5AWJbltoDmZDPYdFTY=;
 b=rtaDJuLdoWLQQPfX3i6XqFIAJgK75SehPVWvBnu5+Nu47MAC7bLA6BFX/ZPTwWltNpKvsiDNRwTh9PzLpZMPWugiZridv4CgCVcNL8gAVpSSya3HP1oaXbFLNP8TpzCr92g2CUX51L6bK6AMH8f0OGKH9vO2TnuM93kEPAhL11tyeTsQXM3HM2qYElaCK/q1mUZ7F+D1qSZtZqhAddedNrXBDWYptudV4w00jA0qtFR8cBIWJmX6FCwLco21FJ3bhc8/L1mrY0WG2LiL+/mnxtpFodYrPJJfAUvOzW7isfi6sEjftSsv5J/2fjjcyeqUU3ByM3u8fbUWeS2GZOvOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRRv+TKWQ5vUJ4nIz5eE0fy3q5AWJbltoDmZDPYdFTY=;
 b=PE45RfVv1TP5fGvk3hDe6FsV/Kz0/iKsyvdqX66yWxVGVQNzSI2/6gyhUNqtyoZgBlr0XHkT0I2TR310Q2TNbFM4mc1UZe9Oa/fYHAiic8qhvtNNY4vg/dpsX5w4t8NAeBmbzy51/zRam+3vihBQyfrd9eufujOGEHzXKtjmUBrZhmAtmf5g5E5GVgqEL5qWQmFV3H1JCWbriwItwmvXv56T8S7xEApPhqZ3i1KvWZw/zh/RrkfNWGioIoRkdAHb2EwOFpF7Qw5wqqShy6TKHJFO94J4R4xhMRgoLICpH7PRpvj8Cl+fLgedoE0WbK4wcT9MkPxyaWoYC00ambozsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS4PR04MB9550.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 09:31:06 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Wed, 19 Feb 2025
 09:31:06 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 6/6] arm64: dts: imx95-19x19-evk: enable USB2.0 node
Date: Wed, 19 Feb 2025 17:31:04 +0800
Message-Id: <20250219093104.2589449-7-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219093104.2589449-1-xu.yang_2@nxp.com>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS4PR04MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfca211-650e-4a97-579a-08dd50c8225a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ROesAs6uj6LP4JpT9yFJugFGqTQ3Rr3gN5XbCNyBYo7EtPSYeGAmR49RSXj?=
 =?us-ascii?Q?XX4egBzQq2uh7sXumsN9qhQGb4nbkJ9p+IfpPkgw3deON4EeJCU65K1FAVfW?=
 =?us-ascii?Q?JWzw+kUloMIBs4tTudKjHxJSj+yCfuQSc2LQRBduJbesMntmanOU1oi4U4mb?=
 =?us-ascii?Q?3HfzaJY9kUL1grEdOQozZC+erNOJjcOYu9VsCzvepWNAOh6QIvN7uWWY2OA1?=
 =?us-ascii?Q?wKJBD0m/sK3ji5VkQP3IerOwY0KCOmj4qOZiJhA+S1y4Tty6c3e4uv8T1MEN?=
 =?us-ascii?Q?xFPSUoKwfLYEiuueyYhN0n/QrdJHZ95U64XrrCT+f6Xf9IsvtD9/e2oxj4V/?=
 =?us-ascii?Q?0AQ0kXCP4gynwsCCUZ1pX1wqrKoaWIIPXiiHGkSS1xman8DiO6TvQjXO27E+?=
 =?us-ascii?Q?/Uiro1tsbynwCOY/2dDkAydFMe1VcrbloFMheKiNkyOJv7BE9QEqCF+X0cdN?=
 =?us-ascii?Q?Mgc/6jRwUrpI+hsecbTzXmnHv3qAQAfik99aF48wU+4lYmQcJFpDMAkV6uOw?=
 =?us-ascii?Q?qDit+3Sbw0l6D1W4AFmE4fI4V8Qc00WzQ+kHCcT7NAqnWk5NHNFuD0Y5T0j0?=
 =?us-ascii?Q?ofG+Y/XYEFktZm+PHRWoSY9Xz6HeOrKN1yIpEwoTOWlkwyyjRvadu2/i9V4s?=
 =?us-ascii?Q?2LJbP7VUOZwprWKYIUnTWyExTNczwn7bx4hcRqRZadvi0f0jtlRfzi/nF7PC?=
 =?us-ascii?Q?S2OizqI7Z912uEcv6FBolI1msM3JGrXG0zkzXtBBwvuWUnmFiuMmP9MwNupT?=
 =?us-ascii?Q?uyQFrlLLG28KtNLBbhj8ND5FPU1dz9mL+nBY/bquZ+etnUwLaIybYGZOv8BI?=
 =?us-ascii?Q?//vxa1pYCUxjvsv00nqsu8QzHIEazMdei6uv8iFG9oxdaqdt4ZApS/J1sJFX?=
 =?us-ascii?Q?02v+twocc14u1dzZhhIm4RUj69Dsf1WXAnUuRRReKsAvVJyBgnnoOki7vamO?=
 =?us-ascii?Q?biGveG2vLx1+uC39SfyJWHpav/KbDZFLMEMa3cFtRyYNQQOQGjQr1s8peeTh?=
 =?us-ascii?Q?fAx241gBzTUt3kfLl4hws8cG2NX/n9zlJlJbHtVEpgXq/vPcegDk+ou69GmV?=
 =?us-ascii?Q?25OKu5KNYDGzO7r89GfacCOElsNm/q4kf3KwMZUCz0Amhk8QzbcwdAKduhVY?=
 =?us-ascii?Q?KE+CvsaIM4Aw7/sIBjgnpEzUKnyw5egoZwRD82ucgKaGpUO+X2IdZKrv5wJs?=
 =?us-ascii?Q?gFw1Bk7pZCpsxJ3F01rK3HwZBe8l5iPskHXv0HMD+L5LlKS468iRKR4Le7j1?=
 =?us-ascii?Q?kE0YrI5XCVXdauxcGPg0jzFzCELEfitSGfuHf1VByxl4Fzdjqw1VJo6Ph6Tk?=
 =?us-ascii?Q?/uEb/QvZff5qwW7LQR2KdVRssoP2EsCgvvDYIhKjCVe/dwQUkG/skfRxkY18?=
 =?us-ascii?Q?DTJJIjdt9b78LKUd0W4Qyhw5nvbMt8GX7IHfz2jhYVm7bDaCCzJneZJLbloW?=
 =?us-ascii?Q?Pn5U7moGvYfJI+9l397cd7JkY2bfqVf0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w2q3iHcacgxLTEvZCOVBUGCDzECR/VKtMfHXenhs6dJ2lk+B2e/MSpsMGkUa?=
 =?us-ascii?Q?0hSB/QpZscp9TFcDnCP5rsejf8pQV2B9GCyh9ipakJvyjkFl49iU21jM/BtL?=
 =?us-ascii?Q?T2U2GQvmh+aULEzzS1dbJCemDWEpiQrdW0T2eranEXxGMYRPNX4qG6Fsz/nI?=
 =?us-ascii?Q?eTCaPWOk+fxQ3R+ItyCrHBS94OmpThy5Av5bzsyZSBZWKZ0uOxiuJdmeVmUS?=
 =?us-ascii?Q?lO/4wAv5h0ugPaoaeNN3iM6iEVZ+d6DU2HmZnyJPv4IqfVfyNJ4WeLzRm7PV?=
 =?us-ascii?Q?3uEjJ2qs2mprchbMeG7ZSuhR6FPKLNbM2/vqcPTlHAblABHalPp8FjJxP7IM?=
 =?us-ascii?Q?J3N241BnywABBPJ5kUDencAjHGI4u1WJ86xytykpXlJtYTRqdnZgcaAihkby?=
 =?us-ascii?Q?o0WpLtiV89icuRgehnap7K6OORuhvZkgtNE5N6u9Yn/kTTZwu/RziLITCMNJ?=
 =?us-ascii?Q?ac/5kEDpJINN3Vcc6+DhrRlcyjop0vMo1NQrgc14q6xU1v7axJetUCw9yHF3?=
 =?us-ascii?Q?9sd1cMPqZbu9UXrtKL84kFzdqKOAqYD4f//pHOtI+azxQGEZlH/FD2QsGHc8?=
 =?us-ascii?Q?AaYMSLFiGTiEaKUTkCzim2B5xRnrVwEY+UFf1ojSPLM3yeFqEJECydqYok0c?=
 =?us-ascii?Q?BRIHTTBVLlWRo1jCregO4hrvLDB4IOOpuJelrCwjkZqyYEcpoZEfXn9DZYiL?=
 =?us-ascii?Q?QkPsXcf1kZ/YBOyJUs79PB7q+3JLzEmk+/TmQ+ETj+wi3tMAQUoPpnDxe18F?=
 =?us-ascii?Q?qdUO1ZgAYu/VRDlNIBjzhTR4W+F5NklwgL0IJLcF0Vsq8lgB46EFgiCqIJGi?=
 =?us-ascii?Q?uTyUD4tcmbI7wUKs/UzCVZnL7aeO07M+vh0/SM6qS6Kpdq7G+P4ymPr+3h8G?=
 =?us-ascii?Q?7Witoe5t6/81aQFeiuKHo2zrv/fmV4UYX35h8eOd0TAsRNm4Hr/FgUX1JNjh?=
 =?us-ascii?Q?BaJPFTBTR8gARJjtu9ww1G1d/3TfEdBkQysLifv+X/6U8AC/HpMzgCpBZADY?=
 =?us-ascii?Q?ArFNfmKnYUNJr6SGiZfv/YnE4yCor/U1iBjiBBFPEIalWTGkEBYL1Yzis5iP?=
 =?us-ascii?Q?8CSrCoZbWzp8Xu5hYBflfK4D0SKSgof/U7aVel7wmVPzIdK6OPxgSrpWZiwG?=
 =?us-ascii?Q?2RTe5teBitisOlkCt6nXzmN+b3juPnPZj63em0l0G6uVUVPcGTyHvfp/I2bT?=
 =?us-ascii?Q?gw7PLN53L/XkNVXMZpy/Bk00PdkPmdTzL47inzBeI2W/sExiendco5/D3xqL?=
 =?us-ascii?Q?AH/OmJ6oWuFi+fWr1/f4uYDktgBQQeJckls2x8bfZ7z6JeK67k5sCN2W+95W?=
 =?us-ascii?Q?6vr2kWFVhTPtVat6F+VucM60UIdBjzb9UWSFhmwUrQtvZWFf3PX76a+WGeRf?=
 =?us-ascii?Q?Vood+Jqsi6lRNX/1HU/FSGs93HlhWH64Y14jqB0Im3884VMn3EsYQFwYlRZ2?=
 =?us-ascii?Q?nzcXcmfdJ7fYuRG3AxSGfrPNScStLeEQeHfeE8ilv26rASlFmO62LuRXC+zs?=
 =?us-ascii?Q?+BHTgpJfWWDCPtgqIbblD9wJHRmrrdjwyz9ssSz/6YJSPJ/7BO/2rza6rcoq?=
 =?us-ascii?Q?MufYbLsxw8kCyifdiH4lOdaeXwbbBzRyixMnWfXV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfca211-650e-4a97-579a-08dd50c8225a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 09:31:06.0435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E92He5CPoWFlLHsdxK5Xlh5d93zqc3w46yNI/BFzQ/ZbnyTF6JgcWpd7+nhUt5ZMU2nA2oif2qtsl7EXry2bdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9550

On this board, USB2.0 is a host-only port, add vbus regulator node
and enable USB2.0 node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../arm64/boot/dts/freescale/imx95-19x19-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 25ac331f0318..0505cfe2778f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -133,6 +133,15 @@ reg_slot_pwr: regulator-slot-pwr {
 		enable-active-high;
 	};
 
+	reg_usb_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&i2c7_pcal6524 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -461,6 +470,13 @@ &sai3 {
 	status = "okay";
 };
 
+&usb2 {
+	dr_mode = "host";
+	disable-over-current;
+	vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
+
 &usb3 {
 	status = "okay";
 };
-- 
2.34.1


