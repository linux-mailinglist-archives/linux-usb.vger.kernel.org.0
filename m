Return-Path: <linux-usb+bounces-21677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D63A5D82A
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45063B72F8
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 08:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36982343AF;
	Wed, 12 Mar 2025 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B6CIqljh"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4AA22FF58;
	Wed, 12 Mar 2025 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768078; cv=fail; b=ZnyfBFCd1Qj6igLsHWx8gVcHWpBJVs2AKt7Hol689x1PLz/kXdAxRJv8M8lPyaMYp3LY9K7+HPCdVFc+7gtLl1UmHpIBIOdyBE4PCMgXHTbRd3F894CZTuEp2mh0suRmfR8es0uK3GFjmbO+vbwLlpUs3NggQYWjlj4ZR4yW91I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768078; c=relaxed/simple;
	bh=VeeV9DyckSsuCTO4PhNbNIC29J0QvLouOn5IFE8chOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XIDYTddeOuco16NC/kDtMXdg5r6Oo/3p24we9f9e9EYZRnrcJ+Rp41/c/wbuJN9LETAG0lICGNbfyvY+CeYBB2Xs2yXUMVg9vY8Y71YFcDLl6A+XQ7URoyRzW45CiYTTriC6zvHNZFxXYf9jMyxUB3XtOdTchoTaei4z8Hjn+Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B6CIqljh; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaIG5OOzUk3A1nveXW/9mZBs8zLOiItaDhK85YagvcGPNRxdMn1GEqEtzl4PtZWatjo3U5gAKX/ELRSWpdG/8i4Cd5x4yFtZxk6YMdvgTspxScbQrtINuZFwPZnBClY4d18eq4HW1HfGQO8tr/v6RpKXlPOdTFVjmLonSzyVLYMPW5Ipw/JQ/vmNZlKh4TFc6W6rTk14ADQ1MKtiIRCO2c3XWhED+73rwqCB9CWp7bC58ye20GIPaZ//KnqDpXaw2sJcp7QpVe77iDLFYpIDNy/LTJ15vseaAP/lrI1aEszKrkQIKILxsvURYp2UcMVZu0OOTCUW+S5GmeHxyBHLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tpE2cyi8Y5B7AzQz4gzvM600YXc8ijcQ2ZwFqBbHO0=;
 b=q4M8bhXY/oYhEXWfhUxK6YIKszqnsXBcrXb5Pk7e7zG8ShjS1PDlbQlUrKGN9BT4AONib4Yqn7tY5AHgoFsEwnGP2BT+1LDdvVbkMCd64UfNKMKp70EwUS4KrFwSMe7m9y+VIBXpL7xRdbuxxSQd/UzevK01sp6ss2YrPh574NaN44QjZq9WsJOXhi97FoHxfY/E01JXYwqvkSnMCFTJA8N7T78n1AFGgFKqYeu/ndO8dv0d23XUp3Pd15benpiHXi5KF/WXDw2FX/t64u3MiKA9/QocqhHaGHr4wH61cD0cSlcB/7t/RgrDetWq18ImcpZ1KYDyY6mbZMJiYoBffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tpE2cyi8Y5B7AzQz4gzvM600YXc8ijcQ2ZwFqBbHO0=;
 b=B6CIqljhblbEAxTKWMZ9JCjhvMa80JpHph2X8XDV8q+h2Gepf6/DsbOW6KueV6k3Ss1qfwrLYcwULLDg7exOGa6axBGmLOFXZAEznh+ndAi3iAfkQTas4F+k8LRf7m62ti7GTmTbx5iJKJfhY8gP7vYqBjhPFMxOjkyAJUgF7+NmXyt3iF02Mx13O+eTd+CEXy53MC1FiVFktAXjiaTG6EhVKkl6duvPCSEWNS1EZascrAuDIeiOKHXCKozqnb3sYzooJjk1IYcE5rNSQcycYVC5KO3vQRSr7/8EEuQlHNoY6M01kqbLexbUscS9FAEOwqoVTPeBj7H0Rje9u21KCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10592.eurprd04.prod.outlook.com (2603:10a6:800:266::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 08:27:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:27:54 +0000
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
Subject: [PATCH v5 6/6] arm64: dts: imx95-19x19-evk: enable USB2.0 node
Date: Wed, 12 Mar 2025 16:27:00 +0800
Message-Id: <20250312082700.260260-7-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312082700.260260-1-xu.yang_2@nxp.com>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10592:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa389f8-1fca-46b9-d99d-08dd613fc8e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xg0v0hkifpkO4puFVjk/CwwyyqEYZYGTtapJ/AT/uah8A4WLszr3T52x/4VL?=
 =?us-ascii?Q?wuRRDcOBU+BVfsbgi3zLLNhoXQjjjvzw9z3G+PUiRRfBE1ogyZmd30bzD1fi?=
 =?us-ascii?Q?F1o7ldciGnjuoC9GgUy/WBlunaV0zTZ7fnpttUPX00a+cxgiC5svqLFgk4w9?=
 =?us-ascii?Q?WVeJoWvcl8Rxsm30SfV6DwFi3TEchDXCUNowpA8F1mxXxich42t7eT8Au683?=
 =?us-ascii?Q?JIkcmJSuddOapoVDE4USgAkhENID1yeF0CBW+nQSXwmoXvtghQy4AD2UI7TO?=
 =?us-ascii?Q?sWdGmVlxWXv4N1sNhtYqsJ7+fiPp8cyxxQQk4Id7nkW9bdU3XvLoCKvsB+bu?=
 =?us-ascii?Q?MoSA2z/+ayOPCkoifvqmvShDhKL7CPfrRvcxGoSMuk84XkbLOiSSiJt4OZcX?=
 =?us-ascii?Q?93i/5KfvDDUilz7BNy3NJFRmgl221OWHyER8Bcy2obLCt3Ds3kcBdKHKx5l6?=
 =?us-ascii?Q?prucFd1/YwglUAw4vx0WAqAT34EBSh57ec7TT5pL6U8R+6MEMkWvTWx3+co4?=
 =?us-ascii?Q?dt531BJUwOMhHQVmZQwDarcS1tD1UNp9+geVfqYIIei16a2KOTXT616u+KHO?=
 =?us-ascii?Q?BayTH4raq+cTkh1m9yYfGode7xjdjoB9YdR+5XHohN29CAjqIcAOrBUL5v35?=
 =?us-ascii?Q?hNlKGyIb2pjgsuX+g4AqscEiUnX84NoQd9w2pB1pknXur7qQiXhKQfuAhBvw?=
 =?us-ascii?Q?js4ePvkKpvu7E+9rPawENtJK7je7UZIUKr1i+JUAijnWo5j4q+wtdd6ecocF?=
 =?us-ascii?Q?Knre5gpViXLsuiMzURa/OV96rf5bkbAKAJkPgrEXT8CIq+fcSzS17IL+IlTP?=
 =?us-ascii?Q?XfKtbxrxESFlloNiOIMueg7fth4OwJx3I9ckJ5Hll2wdLLJ4av+waMMw7l8u?=
 =?us-ascii?Q?3Sz9k4jD8luN8hM5S7V4k8kvGZw4nTIApzlHJIAhD+LSHcCFcNWcHZroAO6l?=
 =?us-ascii?Q?87vuqmggKnV0IwBm1/CyLfOI1x1zAthljjRWIRz+OsExZUUjTI9G2+N9QPbr?=
 =?us-ascii?Q?82fnPcFd5/VGpENUKXDSPqQdVHndc5ubB8vrdykwR74W4nxeY1+phvWe7iob?=
 =?us-ascii?Q?fe9jnkIvd/ZdmRL4PeQNiBhMLkc5FXigwDn/unXRUhdCjj19JI7swEL8G5oU?=
 =?us-ascii?Q?f6NarMezBRvQ5p8WXAIhD5OwwG6ok1QvuVgpDA6QKM8UpTN5ulnYxp16VOCr?=
 =?us-ascii?Q?VfMtirDP7ICvd9dZF+8h3cY12/Wz5ndCfTH9NbvSDOYr4rZFM3NoN0+q37MO?=
 =?us-ascii?Q?1/Wi+jIK7wPKyH6c6D6m0684DbgZxnpfiE7w8PC9FDYNR+V10St9GEi0W5Nx?=
 =?us-ascii?Q?m6iVF+BNttEMa6qrxuqge1KyH1ZXhEFW1kYrCX8ijWey8u/tWikUY7rjzpdU?=
 =?us-ascii?Q?zpV5yrsxxZZHydA8HvilMH6BlZu6zAB+7pNITcBSV7lgSdSA7N4At1jxQdfy?=
 =?us-ascii?Q?h9T9S4bYk1YiM6GrwfcG+AHS6WuknD1Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wSK+rCx7BaHJW0ZK4zDjctfPYqRL8sT8E5IfzaBYFiH8vH4B8Wy+p8Ob1vTP?=
 =?us-ascii?Q?mw/jePiow1x7z94PqOBl7DdCUJ2ccb38vkz8eQhO0w8Koce/W/V6zkatzkoD?=
 =?us-ascii?Q?pPi/icQEZ9uwMrKp52kuxgOEQoziEKI3A/udQTlkT81ty9brtC/2w5dNyjeT?=
 =?us-ascii?Q?/ZkARzZLuvXNqkpNrgBjvwQmI5b9WdUmJWGdhoJUlkOYE/SOWnPiqt7Sz8Uy?=
 =?us-ascii?Q?CRYmu0/8fGtWYhYr2SjjJTBeAU7sR+X6WU77XZU90kjnBUX4OGI52z66OvZ+?=
 =?us-ascii?Q?Tgqz/DtU3/lzpEPahhvd2wjut9V+ktnPQLNQ3bEBvb+CLRWMi6yRTgYShvDp?=
 =?us-ascii?Q?wi1DnX1CPD+N6EOmomwrU/PW17HOF//gsFjzPcrnTDbi4RRNeyz1rlK5JkzO?=
 =?us-ascii?Q?tvlLYznAYe3qAwW2GIsPCjOo90F1jLX1+yIphjlX+f6a/yH4JTVHf8os9FBr?=
 =?us-ascii?Q?c1jjz4gG0s9Ij/WS8IQDJhXLLvR7yuOkt0KrPj3TU8Fw5BWK1Ey/xcs9a8s2?=
 =?us-ascii?Q?SiCVp570Ptt0OlsOSTTakzfNLvBS3QhuWcikTTLonLTM1VXsoWmlUEwSluiq?=
 =?us-ascii?Q?lyP5XdKy2C47dy6MPGm6vqnyZHW7TIVbAFm1DGB4vVqXxrUw3K22LVnS8w8m?=
 =?us-ascii?Q?h/Nna7NmvUZA7jpQnB7US+YpChCj8Ku2/nOoFAFwHPMPOKuSyRYkiATv9T46?=
 =?us-ascii?Q?1a0Y/yZ7W08Ook2ZbSxPOlyVUWpzGO9JVAb+QC0fkvidtyygzOvU3lsmpy89?=
 =?us-ascii?Q?Jl2RumHhJEahyyTtzuvATbOPLO5UCWVQF3x4lHwGziIP9sVgQAxSY20tp1d8?=
 =?us-ascii?Q?QfoBeHfRQPshZzQsjqfKtQRq8u0ncu5M4BrZQgwcqYS8fxuCCGIO4J8PU7Of?=
 =?us-ascii?Q?9SHi1MhkCUpep+B0O1EAkENZ74wc0q3PydkfmsykQ0nvw8cjTBTAge5lTcIk?=
 =?us-ascii?Q?tU9kCOGg28Wgo9M7VahjR+YR2rWewjpYSZsBhC8QkdORmgTpsdmo1V+pkHZA?=
 =?us-ascii?Q?QNGOLny8Tg/KRro94FfsKOZh8ikb1ZBj6n5/c2XrQU2j2wHpnw1CFrLvieJp?=
 =?us-ascii?Q?uBynibj48DAg3ZtBwJjOfQKNDvqOjNDPkVk2zYAUGXaaVpYbxMGg9RzS1YEy?=
 =?us-ascii?Q?fBfKuLqdqPLeslLx4QSQUZGYNYXEMDc1sRrf+2nZNupOWTT7cWzVI275U4HD?=
 =?us-ascii?Q?2MUIdYaVQO/pGda6vYs638PVfzZAFCUwznSKXHM/ViXNYwPFYd4dwIFFEH95?=
 =?us-ascii?Q?yscKOq/r0iMOSJTOf8yO5ixHWvkwTob8C8xZOpJV7hLtZ5k+CzY0KXpyY8XZ?=
 =?us-ascii?Q?UjgZZ/fj2MtkkumNTN15Wl8Q2H7Jy4nOQNyMkTfoXQABO9BGK0Ry+GGP79F/?=
 =?us-ascii?Q?njFuqVu8RDxizksOmtIOy/zdyvwrVzWbfdvVRIxbcFOORbHbuXwzNQk5CrEx?=
 =?us-ascii?Q?TmxoiRrkl7dtzn8fCspTfXyADlpR+8nSPG+/X57qZwEPgOS6y1XrCvlZyrqI?=
 =?us-ascii?Q?dJVC0q3WoUwENWADRBtMsbzT+Ld2JwXvSFBWhBVoBomMhBjdQs9nCh2Puh+a?=
 =?us-ascii?Q?9ithmhre6/jOmMZAEGK/EROLlyov6ELhySMq6mB0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa389f8-1fca-46b9-d99d-08dd613fc8e2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:27:54.1901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmCvrs2hI96o5+kuNnb6D9rQuKz4r/XhrWfF0OvabiC97+cCUdAyHrBcQorQdb0i5c6CmBmR6Uv9T509ATlsTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10592

On this board, USB2.0 is a host-only port, add vbus regulator node
and enable USB2.0 node.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - no changes
Changes in v4:
 - no changes
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


