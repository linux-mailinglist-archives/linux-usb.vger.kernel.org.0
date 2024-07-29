Return-Path: <linux-usb+bounces-12558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E793EF79
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 10:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04E301C21CCF
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 08:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DB213A40B;
	Mon, 29 Jul 2024 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="agsDQB1B"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5C1384B9;
	Mon, 29 Jul 2024 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722240629; cv=fail; b=tk/TttEGlCJ1/QifpKK2hnYQn06uVodnXXomXduPUaa43jIIPJrStWQ0xxLgevoSSxW3fYC89Kh/6DzokJNKTfbmG5QKb4/K3wExVlUwDCS8IV7KsC6oOP4ojrdSLX0U0bHfSD8qDsKHcL55ogqUbZIILWO4cDKP+kmvOct5smI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722240629; c=relaxed/simple;
	bh=eITdotS8t5C3ZSv4KVIogf36r2ws5yEYoH/qGFpGGRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U5ROB5RFuL7lSDNummoYsTQ0Oz6881C9dFHnOdZmnGTQfQG4UkN9jWCwK5mUAMk21hQ9JNHNnvt06iv99MvKiVwkbyPMb4KkNmYuqjw9wnYxDmNlGp1WWzSB2pXwDBWvm+apHbqDXAE1uoao0PADaqU2YhwH28rEmq73P0aT2bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=agsDQB1B; arc=fail smtp.client-ip=52.101.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vabHbbOtwxPB33483jPNt3uSYJDLu1haKZMeqASYu5zgcovjHU3dr93C/3ZAmaY1L54iuKR3QMy6Llr0R0KEHLtkHC//LqisnYbuIYpbGc/6n0EyQ9RVDTru10YAmJBdrpOpBVviJd2wH9N1tJAaCzBWi3LXq/w+fPJIW4V197QgF1iYbgsIpZdqgS+CkjrqqzjQyOM4qVeQyKLLlKPzBQ78L9nqNGAMcyU0xtmx1VxYpsk5A64ZAeg6dcOrI3KRs9v+T2LgLmVI7rLMo5KzJEd8hLEYzTY/oDInPAsSowFk6+Hu1pw0H0BIl7P64o3QxwSXUwR0fuRN2x476Cu+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aICEZUcPThMvO8M4yZM6VgNq278FBQYvhHtIlnwwsHI=;
 b=rAvawPg3SOfXbrzR0tgOlhSSttGXhjv0AJS9wKt4W8Wt/o6EEY69yRuDlJX8g3hI0mLrCwMU4YugXytQocCyFkLFAFvDuXZGGcGuSuCHAR/H15ZLGHElsP/rNRUjO8ibStdv8Us4Zq3D0aBHg0kUTcwAsr6hb1wkCRnQp5N19dyMIxL18RWxag+H3nNUeSvmT7YZQzrYYvzePqlUl8/ae1eh+gn/gQ3ee+lrFAJInxnGPbw8Z9GCdSa3zXBCpxbFnbXcWMiYrIjb2aqUovxVIUscMko5Xh3P8aTVVSn5BAesOwEE/ZYUv+V7+d4UvBdC1QBa/qRh33e6W8yBFcU38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aICEZUcPThMvO8M4yZM6VgNq278FBQYvhHtIlnwwsHI=;
 b=agsDQB1B1l79OV+RyIhE3jWqfmoFw2qyJF//2kbMyMwbAsBX2cLC0BP2WXmEdvgDOl2jY2wRoR02SZD+I/6FoqXNjmjy3tdX/oWpCkTMCGzvqOjdQfdAhGNFFruLnPItlBvL/OvtKgWrQsXBO7bns4v1eS6oUghgvvvRyF4OUe4n2w5FMx1OGBxczKLhZO+GFSrCLmWPrVaZTmzbCFz021k7fwri42q8mugZYVu2Ku6/ZJuMJKXxVSUUM2XUXJwtuehVc9pEojogvCeDB/oSdkQW5PLM1mi57JPmByBdbmqPRRztBasuAD7RMWhzK8628OHc9IRWfqeheY7oTGMI2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10302.eurprd04.prod.outlook.com (2603:10a6:150:1e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 08:10:23 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Mon, 29 Jul 2024
 08:10:23 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: andersson@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH 2/3] arm64: dts: imx8mp-evk: add typec node
Date: Mon, 29 Jul 2024 16:10:38 +0800
Message-Id: <20240729081039.3904797-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729081039.3904797-1-xu.yang_2@nxp.com>
References: <20240729081039.3904797-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10302:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ac5fef-2d87-4ed0-ceda-08dcafa5e560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JHuKyYs+dHGJ/wp8F+N4iauBSPGRlQ6EN/cVvG6FlKmP2fwfWbZFPJYO8dr1?=
 =?us-ascii?Q?nwtudUl8r9CZ/fSMzkIwPh5CdQWYZ69bKyYA293u7iBG9RJLBdadoUElZucF?=
 =?us-ascii?Q?fWqpLofwlWAQoDhMAd7bl6KshM8+YxzwnJjMgYZr4AhjTBUgjkyqmdq/R64V?=
 =?us-ascii?Q?2M6oPcyPd+3H5cLIOIVa3lX4yWtREcKK4HaTgEXySrlkqPVUbsf63i5/QziQ?=
 =?us-ascii?Q?X0gu9KGbjX9f2kXVXHQ6l3Ey7vXMn1UY8h3Rh5mUDGgYSP3SXpRS7KfoAm7r?=
 =?us-ascii?Q?3l6ziWjXxvR1Mm23Qd99MUzLup4lcoqo1A00S+hN2/URYjvDDyNMnpO8VvTD?=
 =?us-ascii?Q?jj1qluyTFg4F5iC2NlrpaPksi7BeXSfGJkSW7LJM4QZ32cGeU6Ei9wBt1F6M?=
 =?us-ascii?Q?b3Lu/00zs6yf5DljQf7LV9DbF41UxyXe3O7c9RXnNHWpOVaaxF4aCOgagzvp?=
 =?us-ascii?Q?neh0y5m6bgTLCcTwpK9DdizXAcwTfuVwvWKKeq1Jo9TL8uShrF3AsJDvtQsB?=
 =?us-ascii?Q?Od27gcbVrlGCVDGX1WcFcR8uR/QS3CZvoWmbg9XP89kluIi+t4pAM8IIGuwC?=
 =?us-ascii?Q?meMAarVRnXe3F9TZGc+KidR3jCtKeSEfzuy6JBMMy9dO1KCGa2ZUhLRBOdyu?=
 =?us-ascii?Q?Vt0YdSsoPstBceZ3A7RabUcFHSI7qlsnf5Gw13JT7V6iWPAFfGdgO7vpLhIa?=
 =?us-ascii?Q?pB0n4PbWxM/GnATS2XFM9GrqOP6iN5I1O4+zkRViccZVLfadZCcQsAPSswts?=
 =?us-ascii?Q?C5ear/JQK5WnWzo/6H4B2Vv1Zs68kk2Vdamm3eJ5QrOQg1JeSHFAV/VsBN0n?=
 =?us-ascii?Q?DrlvhPIlCMh2xeWw3g6G/hKZL5A5EC5SxI948WrSAhilREy6/SFNHpCSvzo1?=
 =?us-ascii?Q?DXLvT0cJecKS1fzx+v1G7ySbubQ08OPu6ZMbZ3fuFVQ2qC6yA6rN75EEpguI?=
 =?us-ascii?Q?FPVPXgs0OsM2GhPjUxqb63av6ZT7Rhbd3zSx35Q4b64DXDT8RDTSbMBbPtMy?=
 =?us-ascii?Q?WR7eWlsCyEk+rXpVK0Mm8tUOd7L6K0zt6fI+Iy6JRyw+yBGK3jxpRT38RYnW?=
 =?us-ascii?Q?BzvWiWHBjefpIzRJEHJXKvynmR+ht0hnrtYT2TmFjgjrEcnpitDnlEaJ6Qks?=
 =?us-ascii?Q?243M0c11XhNkubI3RCzleo0TjALFJPMKczxjGG+F/J/Uvr7hDw29v9VqthBB?=
 =?us-ascii?Q?29SQ44LRr7DNO6sQ6c1JKedFjFtODMrCFdDbF380yWMHiaTQiI6U2fVCE6Xa?=
 =?us-ascii?Q?AmRCoatRgDOklfA3uf4zOnaQMjnlV12Un3iTfiF1UxcoEgIXaKGjIZZknkfb?=
 =?us-ascii?Q?ZdYj4dERfmithq9xzNJVc74YJkrhY5EVtckldhAfQAcucute89eZlWqAJomG?=
 =?us-ascii?Q?yE41NOcvSVXdVt3XoPXE7tdPdpL2Y4a/6dg7fjVTfZEu/p9+Pg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZJN6ENe0xS3Mt2FQXIefQLeOQs13x0WPLVyK6cmEp2/Ev+Y1ap3p5jrdHvQ/?=
 =?us-ascii?Q?hMjyHTKdPl39aWnH8NhEX9Jl9SCrc0NNsLR5vsEFICnHfB0A2pjTTjUTKvY7?=
 =?us-ascii?Q?HkH3MvRRXS48NUplfpTviQJ88oa5gtnERqGJyXbCzAgtMVGXA2Mik/UEztRm?=
 =?us-ascii?Q?w23FBAnpLk9VwD+EEm8LZrZgOcc+0OallAs/vxiakrV/1Rucari6CzrqSUhE?=
 =?us-ascii?Q?Rzx0CCn5itLdSwd7TyNL+j8FY5la/oubhlvxWD3HmnWhgQ8ZoUJOemOR64ix?=
 =?us-ascii?Q?xELoQWW5DfYkNT+3LINflLqqFMH55GRd0w4/n3aPtmZiz9R/RZdI5MP4aOiT?=
 =?us-ascii?Q?MxwvGC1uIUUdCPSXjSSXgpjGc+L7TMGeVeuaQPJ99CrFLPGUf+nbxpoz/K75?=
 =?us-ascii?Q?siN/XUB/T45VTJxdCz+hCAReccCydLW5H0ayEknJrYNoNZMKBagB7Is5QX9q?=
 =?us-ascii?Q?WLhlzZdh3DydPEHdvqz35DrAPYdspiCC/dk4KgPl8WG6KlneYbSgWADJ0nr2?=
 =?us-ascii?Q?2PRDok9Wd7/EXLKc/3wU38xt0EwvHUG/ttr3QKzHH/AQ0CKp3SEl7o93AGJ8?=
 =?us-ascii?Q?IAtA8NIKhWfd2L0oCEtZuRq2Z3YB1YGEV42YgMsI2pOJoC24N9icNqcS3lp2?=
 =?us-ascii?Q?OpsaAQhRn/4Roiw94atOQO9fSJpsqhcr3OfIHvSz+F9p7r64VXqH7Iy7nl0X?=
 =?us-ascii?Q?3hCnfbMLqErreGasORTLMzJFT51tlJG9T3d3H9GjBhpVZRpDepig9pvsvUx3?=
 =?us-ascii?Q?niH56dZlFSdsGgAyRpOHCoUwF2iudYSNE+Lxq4xYF6AL43ndAZbJLlITgU6N?=
 =?us-ascii?Q?Br91zduh3dQVFX0VXnLqMcYYgEZnFrwEwGGFhXKe4sQ4GQd7ozDZvVzuhwmg?=
 =?us-ascii?Q?vercu0Y3VkdAoozss2W3UB/JpGYbXUT7KB4nphTav1jkoxMyIcvcSN46EEwL?=
 =?us-ascii?Q?uRtqbhr4QehGmZU0T+4ZcC2MEKDGTEE3l3don6xxt4NhVVEHjcSl4k+CgH+Z?=
 =?us-ascii?Q?wrHKJVlclJPPKRGQjcI5fxAI+2IvqF8gGQ8t4TqDybbDeYLFyG6vmMdkvxOa?=
 =?us-ascii?Q?1AmnKO4xPh/QxAuQ5i3NXi3x9IARP1bZS7RETYlb8p9PY21AyPoHGa5PBCYl?=
 =?us-ascii?Q?g1fuMasOI/FhZyzmgRFcknVdjPwoAvxYGYtaN+W4K0Op1cS4vR4homxk6yga?=
 =?us-ascii?Q?NhQ4zUZTdtUs8G1mTm3ws47p6HcKIGcCrodzFBK5cJ27mSuzpJIK+B6FWtrP?=
 =?us-ascii?Q?ErPypWjlL0reFlgDBtz8/uFqWviXIY/GUV1fRGIfsrA5YD2ObrgvM2F+RhGw?=
 =?us-ascii?Q?trGX+OZTUM5r2OXJT3Y1Jhy1R1sRCiUosfbNo9hW2vTxjK2mMVXbf1YWnyGU?=
 =?us-ascii?Q?ScZLcQhKF4WpgaN5YbcDdsERRS9ya30yZn4tCpRVQWZVnZRrQfAmM0rm6dgy?=
 =?us-ascii?Q?g9vKbv9V7lsYDfcBwOLY35U3H2gl3wuP8e6YItie3Hr0KR3H6zq4gV/FouFE?=
 =?us-ascii?Q?n2gIlTVketO6nm/q70je7OuW6thBdq3iXENu+ZY1Po42S0YNm87nisxBjryX?=
 =?us-ascii?Q?YD8lwTAyHQe8i/Cwea9e8DHr0quzHqL+ufdOcZZh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ac5fef-2d87-4ed0-ceda-08dcafa5e560
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 08:10:23.5525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkAW1Ff4fuii7R9PFiflKaN6X8uaTR3hssmj9McE53jcVQprSMmjXrgFGWwwuuwy92TdyveWBe8MgofGeoS9NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10302

The first port of USB with type-C connector, which has dual data
role and dual power role.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 104 +++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 938347704136..e38b59af5f33 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
 / {
@@ -26,6 +27,20 @@ backlight_lvds: backlight-lvds {
 		status = "disabled";
 	};
 
+	cbdtu02043: typec-mux {
+		compatible = "nxp,cbdtu02043", "gpio-sbu-mux";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec_mux>;
+		select-gpios =<&gpio4 20 GPIO_ACTIVE_HIGH>;
+		orientation-switch;
+
+		port {
+			usb3_data_ss: endpoint {
+				remote-endpoint = <&typec_con_ss>;
+			};
+		};
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "hdmi";
@@ -535,6 +550,49 @@ adv7535_out: endpoint {
 
 		};
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_dr_sw: endpoint {
+						remote-endpoint = <&usb3_drd_sw>;
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
 
 &i2c3 {
@@ -704,7 +762,41 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	fsl,phy-tx-vref-tune = <0xe>;
+	fsl,phy-tx-preemp-amp-tune = <3>;
+	fsl,phy-tx-vboost-level = <5>;
+	fsl,phy-comp-dis-tune = <7>;
+	fsl,pcs-tx-deemph-3p5db = <0x21>;
+	fsl,phy-pcs-tx-swing-full = <0x7f>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "none";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
 &usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune = <3>;
+	fsl,phy-tx-vref-tune = <0xb>;
 	status = "okay";
 };
 
@@ -986,6 +1078,18 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x1c4
+		>;
+	};
+
+	pinctrl_typec_mux: typecmuxgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20      0x16
+		>;
+	};
+
 	pinctrl_usb1_vbus: usb1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
-- 
2.34.1


