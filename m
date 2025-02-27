Return-Path: <linux-usb+bounces-21136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D2A4799B
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 10:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B9667A3B8C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 09:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3633229B23;
	Thu, 27 Feb 2025 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A74W934k"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2050.outbound.protection.outlook.com [40.107.241.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7655B2288CC;
	Thu, 27 Feb 2025 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649990; cv=fail; b=UMJmCESIEW0Y1L6WxeUgmWXGBDonpKv5PNa+fAkmLBBs4322Bk9YbPe9UVbh0i3K+TGpk0io/dv7Mni2u11x/REiUthm/lfzSAwtIFPvDAnDM5uRATefndfH2pK5ORGAFovxq90xudXSL+l4LRFgSbWgdllWsLxCPT1icDI4iwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649990; c=relaxed/simple;
	bh=9pGH/AZ/bZR5mvcRKrVJ2h8X0EGoMDPCaoAB3WX2hHo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DR/X8f7tcLdmwx8lNxqINo/Yyqwna9h97VnijijXEJpVTTkCMT7xa3ktBvORTb1Gq/9skMwLjoorhRiSvRmICzuX4PtRtTFiVStus3QW1sP/SBKtwolqulWOtoJgLRG7ZLAlH0TJrKRPe0kKjBZzCtTeIM52hga9/s9Rxfghz0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A74W934k; arc=fail smtp.client-ip=40.107.241.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ54/9NpKRKtjcW9DT2IhANd1UOtC/dGCc/9OljewNnU/wCyTFJrxTap/+nYYKQ5GLOHkjPAocfJZKKo2gLSnwvGOLH1B4MvqbUG7MU0A7IdjBFU5zlnbxEzC19yCgQO4lXvrkTdfvqAqb4zoPzh3OJGYCFUwyKesqASQ9jaM5uf452/nNIFS+HFXzZn/wMHKthbRFtJzgNxEWIT92etPO/arSimFcz+pYkGE/b8o2A17kavJhTO2gwRvVsVIQhLF25euo4RPuWSdpmNyTAZYU7wc5FzHzeMyvB/JcOd5dQ3KjwPjyjlyXtVuwfRiaKv9XJcGbeHc8tHaqQFLQOAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLN2x+af5KNMFjh9BvKgTeaqSG1cT4E7311bdmZayB8=;
 b=B1ZWKeFhOvtGSEgo3qKC0kRH+KAexiCao/fBBprQjOasVf5vDqhY1fYIUDoWljFCKj5Ymc94Fb34gs5Uzx93Wuph+U+SK0W/oxRS6YGBhK7S/m4DoLZoXFQPRDUm9RLpIQNUMxxDWsT7ihcxI5mnuHFdxXs7ZcekFdJ4FP7XBBeQZCU4UooBbIsnfzpakW3+XKklvBXWNryoiNnmr1plLP4rm7s8i1UjL1mNgm7+uvr5XvJKwft8NGUZh3JYe36yToS1jHIXuf2UjAAxmbqtaMTVxN60ydo9Uo9BTWZoynrf0rJV/ZykpiruXw67bvpfRY5Ou4xN9XNWCX7cAPdJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLN2x+af5KNMFjh9BvKgTeaqSG1cT4E7311bdmZayB8=;
 b=A74W934kRFHyp+ptPS4vtj3BHjN0EgGDq+OYsKmBhX45sLUgvRnOnSN9AZvSzs/xWApe3CW3cM5To/CaK/f66OtP4+V9AEO53nN4TUik7IDjeGH8d9TxiI1klJJmTdn9a++joN+HmOW+VpLm2u0CTYeN9PSA+MsJeY2pQnKXF5pGboKJFmqS4/JmeVCkIWc/UCV25HV2SrgIkJakAZ8dhRhbj1rWa3SEvbrpxIl23wZ/bhkymxuPXEREB73oF5USbzurzI49VlWaAVMX8RRatbitfXhQrJwLlfkrGkyV/aMmf4UjV6FgulkvmRXbwrK4t//L+ZXhKsHYoTz0qMmTeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 09:53:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:53:05 +0000
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
Subject: [PATCH v3 6/6] arm64: dts: imx95-19x19-evk: enable USB2.0 node
Date: Thu, 27 Feb 2025 17:53:48 +0800
Message-Id: <20250227095348.837223-7-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227095348.837223-1-xu.yang_2@nxp.com>
References: <20250227095348.837223-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d201ba-d7a2-4640-31dd-08dd57148847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EqAfeAPjoQgN0QpY87QcS6J5+ok2xS1IZ7ac3HXUkyojMCxEPqlsLjc6rIQ5?=
 =?us-ascii?Q?kS+oxZeAnoj6UNo5dy30SYP8glCHPbjFqZTh2HUduLZyRQ/k4f0icvND2Mq0?=
 =?us-ascii?Q?YCNENeX3Eigri6f41sbkJOtRIpISD/O6KuZDNu02F2zj+0bMeisx6knztH/R?=
 =?us-ascii?Q?aW9UYyLqnV07Qil7Q5nSkKvXLw4LDI8S9TvzuHXK9KSPSg8KAIM3QQvNgOu2?=
 =?us-ascii?Q?RnYAEK2lUuTLt30EGReOadXZYv/tH5vk6Uk02qLZOAlWeXyTj70/Z5Pt9EXF?=
 =?us-ascii?Q?nk11sInZ4LkreGCn81Pi/xifQjiLaVVUnuN0/LshdIo0ltNtSeZZ5UeQ3G2s?=
 =?us-ascii?Q?GaJFKo6nBAG9Xgr3HweVyE6DjtsXVn9U1PH/nuC8d/Ooyjo3/a7OlgX+g6DL?=
 =?us-ascii?Q?SznZKNXrCTuIGk2Dhf1HVM6QGMLJiCDeI5l1ig2NesU7n0sPqBT9GiyksEkh?=
 =?us-ascii?Q?uDpMKqy/VkZMlzWVjoAV5CYLFHJsyWxCvXUQ1cgyJTbujydWiBffJ17+RH8Z?=
 =?us-ascii?Q?UV3FrIp/89OvUIag86J2RLJyxhYQT9sNG+Gx7+TbEi7JAp3pG2ntWNbBql7i?=
 =?us-ascii?Q?z7xTnGJz00P70Xjh6yqBzweP9FznOxoOqMlqBFdVa/MsAWX2YiWVoOM7rbPy?=
 =?us-ascii?Q?eFAMnIBa8QqeahVco+zYiR0h+MP5mPoMceCTUiZNMzFUaWX2rCfuNiEcL5z6?=
 =?us-ascii?Q?FY0EqwQdDUBmHIUWXeGFye2uRorwy8y7l+tPvSaaLr7G+49N6utBFmsN9z+b?=
 =?us-ascii?Q?tzQo5qsDFFlBINsgX1kEMddmlZpPvJwXbefS3sCXwlfzZrE++fJt/U3oj0Rk?=
 =?us-ascii?Q?hKPD4T3H+OK16DBzEw64CoTSR0Bq1GpMAW1XbvvDzbavUmYvxVxHvU55GjJW?=
 =?us-ascii?Q?aI0GzbYUI5crYMFZwVA8nuCJovbAnGvIheyZxN1JCDipXSvWABGde73cKq4L?=
 =?us-ascii?Q?Oj6Eh2g8I9hvhX4uG973U5tWwIyngRfkMiUpWIza/0Sox2/MR+DSwgJRMlFe?=
 =?us-ascii?Q?+Qdhm+chMQtNbIR/1stuGfttueEUR/AVYqW1OpSOh9TNfRppZhHYGmd/7ZnI?=
 =?us-ascii?Q?FxjIR0O3aEIbFUb+/PUsee8Uj+QHj7CaltOgOTcHjFMgcNQZe8myDCTlMJui?=
 =?us-ascii?Q?/s/SOeDpDN92rO11n48y2cqsTXZZcSlMhIIJxPrbWAge3293gbeKafrCmh3P?=
 =?us-ascii?Q?c+KdjVluyP9IxZeIMbcHbc9WqCWwEyr8u2Dh4ywPM4Td0FhFFXHDIstpsgn7?=
 =?us-ascii?Q?EkZaa0g3s1xgWFKb1IwkTVkbqk3ppNbDPYlVE6tm/SCkziesMPJnoXSE7nR6?=
 =?us-ascii?Q?SdXhPnNxzTEJ/ipvYC16v1StEKe/Yr6vlbAvntdtar4p4Jsn7GAbkmOl0veC?=
 =?us-ascii?Q?mZ0qzLSPvptkvYHH7kWPMmLS8JfGCytS83CfGVcNwxkz1Ty747t+27AXW2QG?=
 =?us-ascii?Q?tpETpkx9jXO2wykQASMA5yNivGTMbbsW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sQww/rlv0LPTJpHvQTR0m/iuAUeK6n/rDf+F7SNILWbC9MKVxiB2OPz1Cmmi?=
 =?us-ascii?Q?CRyKPkIEkKOh7GsCS+/XgCz+fSwAOjhxfqecrLOrSX6CKU1yYsXehx/Otm7e?=
 =?us-ascii?Q?a9w3f31B+4ZpwyG9g/oKgXmEbyhpHqW5ZmmRteb0ZDJk4dMJSSNI/RifuFIX?=
 =?us-ascii?Q?WvNL7Qt1ZNTfDq0W8BxElbd2waJDe6cs8Bh4hOQmP4FnrH1EnmMVzBSGhRvs?=
 =?us-ascii?Q?JYxGpKXzEHaBXFvuRamWfvkwz5gSVk1jMiecywCGrNj9pUtV8fitV0uj/gxt?=
 =?us-ascii?Q?Xg4TOG+jukwzXn83P30ek/86Bl0IIAZ7w+NoeQLHFsnx0fbxlC/eCrPLvSPU?=
 =?us-ascii?Q?58kYxWfK7jZI19ueDt/PZXOjvw67E+p1mSbcvuFCmIBXRkZc9PhBQ/hXgnC1?=
 =?us-ascii?Q?D8Rws8r5eowUdN+JrHmmSuoKvF13g9d3XN2qI3rbHxHifm4lqS2rnA9GTZ8d?=
 =?us-ascii?Q?fD8UeOE1VSmFoGNobb5QdQriIH0VZRLeA0EujXKvmBVKbXhzd7+szVF+VOSS?=
 =?us-ascii?Q?0mEETlPTiMJn0Q8SzRaV8U0PBfDG2SjI72ps67iuwLMMV8Qh0MQSZeoWrzg3?=
 =?us-ascii?Q?PEW7fDXEPpnQlRYU5I/A9mP7EQMmeE8LrBSfRtak2GWZfCW+KGzQFDRMBpLC?=
 =?us-ascii?Q?LY0PwtGuaO9+571+5FKUHSHuqdC6BA+njSV28m4ebSph6XjUvumU//XorpIv?=
 =?us-ascii?Q?pwn+9pOmHWp/6eyKRpnUCnEmjsrhtBa7WKKqw3ySbbeSSg3v72948ZjfIxgn?=
 =?us-ascii?Q?izmVD/Zin8ixvScdbPYUkdllCQVKv83JqJNjH/bhMXBYT0cBwsYblm17VlrP?=
 =?us-ascii?Q?0xcdrTEwNFyoJwzppncLpd9og/flmqPov+s7MMIj4n0ndyY9Ykf5yWeIG/ul?=
 =?us-ascii?Q?kYaoz4mXyxXlGEeYeZxUSq3xQYVtVhyJKD2Ybe9Ul3UACJk5zVnxqaubo6hj?=
 =?us-ascii?Q?P46F99Xzj5aZSeZXWH8t9fGnmBVAamE4hAU47s+GvYok7D6GECccuTSW7E87?=
 =?us-ascii?Q?jNYMksoWJUJ5UTGQ0T6zBqFIUDw/Bjo84pMAoWITkt6MxFvIYumvJI54KVly?=
 =?us-ascii?Q?KRWT1mXOpG6XAMsoOipf5Sfm/Fget6OPxxMoJUWPk1BprWOa+whix1esCZat?=
 =?us-ascii?Q?mWYK2VB3l56kJAPXKO80fCETkoMgYoJzPygY8jnqdSlcYnbjA8xVVC2YLmyR?=
 =?us-ascii?Q?7PyhVHdqVM1UgS7noBdV5tsR8alEJV0dOQfWb0DJ51LL7uAvt5Bclq9drT1B?=
 =?us-ascii?Q?M59BlyQkYsB+rtYNIE58fl7pRPb+bhPO974XIoRV9sQYFHgR1WNaIfTN3Lls?=
 =?us-ascii?Q?MPEHTjaHsG1BmKeBjX1hPOkV3L/FoWabYSC3V0bZrS2ZEG2AMeRV8q5vnJoK?=
 =?us-ascii?Q?8Y/84dYmjmDOaUUEdLTVtUTdGvZcI7/0XHJuPXF1ufd1C6FYHiOrxJMPm2yA?=
 =?us-ascii?Q?M3loK6y83088YGYTPbzno6WaCvR4LuBQPWklqE/GxR2Axplag9/mLuR9qcRe?=
 =?us-ascii?Q?6TGVHDFWEqw3zZz8fdajN3wpQPf4K6XXMBnrspGBh/r+/JqZLSH2Jqxcgngt?=
 =?us-ascii?Q?CCYVA36SJCtqGZIhZoPZHxkOk4OhvBBemJukyK/Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d201ba-d7a2-4640-31dd-08dd57148847
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 09:53:05.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ls0RXIrkqEqnHJn6akElrGedTrg71IFeYxL2Bl7sudpUYS8iX2oDYzj1GZKPKz8EkDlIdg6ZOR4kd0qxCX1lpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

On this board, USB2.0 is a host-only port, add vbus regulator node
and enable USB2.0 node.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
Changes in v2:
 - reorder regulator node
---
 .../arm64/boot/dts/freescale/imx95-19x19-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 25ac331f0318..a41d542488ed 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -145,6 +145,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		off-on-delay-us = <12000>;
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
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
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


