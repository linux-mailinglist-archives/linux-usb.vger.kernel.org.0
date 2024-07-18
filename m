Return-Path: <linux-usb+bounces-12271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50407934BA4
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 12:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C488E1F244CB
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 10:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A22F13664C;
	Thu, 18 Jul 2024 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="oucl3LYo"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B30E78286;
	Thu, 18 Jul 2024 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721298413; cv=fail; b=rt1yUJ2o8rfvmjEvqtAsIsammvErKhKAUfJaFPP8MV7DbdHcJmLLp5VOuxeBNuQwyLkSV5IElNeFvrSSLlS9iNsaqCVgV+74SjfUlqATFPX55zTtW5Lb22MuamVSIAh/dyywnEwadncLlpcXzEErdimKF14DRznnt85Y4Hhk4SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721298413; c=relaxed/simple;
	bh=MAnwh5kCwWBieyNtTfP8JOw0x4fYaw/cOkduv8rg8iw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O74L7hdOj4jdzeaXLzQSLw4emsoD2VNbyiK17ICIhxrIU0sfCJUlgxg8X8502mM1/xFCq+GsSAS9xX3jfeY64AF7RE9kvV+PvPiiYzjh8HVtYc3hZuf8/8G453wajpvML4Iyd+BLq0G5hkbrlAxG+6QNuqD9UkOfKiJYJyR8q6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=oucl3LYo; arc=fail smtp.client-ip=52.101.70.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vo/ZDieAHbxmqAtE7d6HQ5adlGaTVEN09KXqvsTDb2bFiFANOqq5K6vzGPeFbWQQKn1K7QdD5Q0WkhZv7OZGZkJgC1uHKWTLS3+E1UIltzujmVXw+2uoo3v8FriPcpUZDMk4Flvzwlh/uI6fVkz7IcAax4fYIPJZU4QuZJwtYk9ap54BpXkAvHRHDzK0vGi/wWSUD7fNqeRfWHsZwDuLm2LCDh2ZnSefHKTQskTzLUtbtTijZl9sxMN4Dl9O8T3rR5CWFNC9i6PpJaBxc9rxxXrj3nGYOY6z4NoztROkd1keDOUrdTjwbqoVSBLY1A/WLXhCfpwyIavxDu4zN9iODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDLChDrm2VhOs40dhdZbGqXup///V8YEJRleLaNpxXc=;
 b=vcp+25+3+Bw+NMj52y9tsChOSKHsCW4mLG4k4X0zjvv0o+Uc1qWv7rKEUEnjqnAdpKSGg3dUvbb0sHnUaBwaQWkALQZxhBTDawi6S/sQgUWeyFK4k2KHn/IzALaKtQem8fyunsCqFe7+eAN6o4YsfPN4lOqlyVbWgwwwLpkGTj73vbnYtnse+EUQbaNAbsLJiY8UZ2MXDeddXZdC4iybPF7AXm1z46oR9nAAT+NnjcqUK7SDM/7bcnM8OKlM5LeRRheE7hGjq27yqmGFc37yEz1lEFwlHKUuAGQBknZUuhJDrn7wu17PCIe8OLSHqM+DbRFx8ulTTVjDN9GvmbImkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDLChDrm2VhOs40dhdZbGqXup///V8YEJRleLaNpxXc=;
 b=oucl3LYo9mF556lJofoZIhOaGym3k2oANzLJAI6MpPZBQyvbAw1VvkRNxrm1vvYQyWERuhEjYwViF6EYxns0DbKV60XLB0U/MerVIeVT7M1VhYliSAyGC8IfXEu1CKC0VDIALK/7Xgrkqj3J8bEX/z4gYEvuHXEHgvy8hqe7Vms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9886.eurprd04.prod.outlook.com (2603:10a6:102:37f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 10:26:48 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 10:26:48 +0000
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
Subject: [PATCH 5/6] usb: phy: mxs: enable weak 1p1 regulator for imx6ul during suspend
Date: Thu, 18 Jul 2024 18:26:36 +0800
Message-Id: <20240718102637.3964232-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718102637.3964232-1-xu.yang_2@nxp.com>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9886:EE_
X-MS-Office365-Filtering-Correlation-Id: 3462f68c-acc9-4fcf-e83c-08dca71421a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BLvSONq79Unc1LulgBbGAg3VJN8y1+6FGjyJvJJlEs6lzi2c2MipvBsgAQ/m?=
 =?us-ascii?Q?tu5mZLHtWnDAJmTnjkQp9aDzTXs3fovn2yPSpAGjSzTmV3kuHUMY+jpheOZ1?=
 =?us-ascii?Q?geAyzwME25oHJ1nYtjYu7vHOhPpCrVPrACLgWaVyLreA4Gm/4dY3sCySnSst?=
 =?us-ascii?Q?U9CCI/aSLKjPIclj8JTnxrF9jLWrU58uVD4jgS9R5gEqG+xXAv6SBB0f7UAE?=
 =?us-ascii?Q?61J8gjAU0fbojzIhbh/msBbZjzSagO71+rqmuhJC8Xb6CtHBP9uyvZ3LOkKt?=
 =?us-ascii?Q?uaY5jbaYtpXwKVbEQ/1Y8mnx9+uBSWa2YdRm6PFiXmlLtaVZO7FTNxKKF8rg?=
 =?us-ascii?Q?Wlu7HqN1ewf/nSulQ6romXZ/rXNOABPkM3/YKmXGTknWka9sdRBK0bayvwQH?=
 =?us-ascii?Q?7eaj015cnKnQ3NBNOFNEy1rGumu0V/5xejC+f6hrLrrvINpAAp6M+mByz9r4?=
 =?us-ascii?Q?dtEQY8F2WjExfd8PlVJLygE0ChBN7p6wrck+MLXC2bkdSwsHp357zr+so2kx?=
 =?us-ascii?Q?oJ++oKyl5hn3NxeWUP2zm0k+vTJsrMFo91ORKPSpNoInVMBO+g3cmWzYQpzO?=
 =?us-ascii?Q?Ezr3LNb6yVRBp89IyIJap9JQhp6bOJD1xMJd57B8h2IR1FX7gGWw98K9avPe?=
 =?us-ascii?Q?rayw0hy2PNJgJ0kORca3+wPpz1hYEFVnzC9VgJCJ7bbhlSCg4VdPICxQVzx0?=
 =?us-ascii?Q?nNtT32Q5r/UwsdV3JmCVBQnoHZaGs7wt1tXES8syhSm3R4qek1smsy1ARZuy?=
 =?us-ascii?Q?WVDoNradO3wjkeYlEmKCPvWTWuroESAt7YezJzXyWVSpCnqSZ4WT0vcM7w2K?=
 =?us-ascii?Q?OzLmdPBK0vQ45jQBOfj9gYE8GMCx2AzR8OJNhWXpc3hZ/KLL6miKIpLAzjnP?=
 =?us-ascii?Q?0/h4al02QHA1Lw8DCeRCxL80mVAgBKtLHoCHPLAhAbCs80UVTc1wseH/IHBF?=
 =?us-ascii?Q?IO34P010vxjngcyYWMmTFvccMUEg/xUgEs0zNA2q98EnKXO/mJW3Tpi7+DUH?=
 =?us-ascii?Q?k49rEkXd1xEDsOM5M4v7zA/LxPHZcJwdl6L2oOnQOT9wPWq4AN/MVm3yd+aU?=
 =?us-ascii?Q?Ut3mvDg0ZkmMl7hsqHqipB87gstTbDWsQSmYP9BghiL8PwM8kbk+ekBlTBuD?=
 =?us-ascii?Q?rjrkoO6ewD81JDiGvVkI1FFeGKso4+b+IHjmmve95c3DB3LOhVKySoTPZcea?=
 =?us-ascii?Q?/g+HHor8e6WEjLTRn8dMA9UerST08grMHC75hJsZOOuna/yFVMi1dZVByeM5?=
 =?us-ascii?Q?h4/mMyWAbwrMa3JSWOo6EefVal36v2ZdGfdWB54GPD+xLkHPiJIOOZZx+tyG?=
 =?us-ascii?Q?o357cFzx/JLQ4OkX6iAsOD1nIdVZ5lJ5hPccAiCq52T39SpN0D2w40+ePcqY?=
 =?us-ascii?Q?yeIZt3/54s7r95YtTaKAbrBn+k0WfG+Fm5gVdNVXPeb4Ya1cjLFyck+aD4I/?=
 =?us-ascii?Q?Xwl0CRD9Du0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1KiAKCTKZv9EtenxH2fzd1as/x3oHCb+D994rDUAlWnvCkuENkX023gHECjG?=
 =?us-ascii?Q?ggppsePrvlU1SoxJ2iDDOyxclvufehNdpifJCXh1VkN+KA1gndN6xBZBQ1Ba?=
 =?us-ascii?Q?9Ef29VSG/gh04NEFWW7kE144L35mBfZoQ0dToBatKisPHnQGqXuQ2MHx/TBV?=
 =?us-ascii?Q?NSzeGq4jMoF2ju8Mtvqd/KJ5OiTOEAXSCvbmuJAueFIDcaPJUqW04wW47XC3?=
 =?us-ascii?Q?mYWQFYs22nNJTQvzRRnrOhwSs5K7tK5fvzHuUSwakUqNiXVOdXhHhFScdXPJ?=
 =?us-ascii?Q?QELKTkfFQ/0DEjf8XPUNP6q+b95Ml0bo/gABr3Bj5fIvls1WLErvblePM69p?=
 =?us-ascii?Q?A0G6DDmx++8acqIa9JfEythKUzppFDxu2Weg4HHwJKNKrKfqe1231f/NEnZZ?=
 =?us-ascii?Q?7boVmoSqt16wE8xgPQmDdr5MOtJvm/FCoJ7d9xkECjPDeSTsRYNY6QCX4+yG?=
 =?us-ascii?Q?z8NbMbrOL8ay0BN4bP8QJPabrJzk/LdXC2XSM9KL3L9YBgv+XuTHayhRmwJE?=
 =?us-ascii?Q?Ao0uGFi1QmFOxh4KNJxh74apZ8QpzJiFvw/xYN9AnUPfPUcy/ilfREj0yqkC?=
 =?us-ascii?Q?+VwgRqBwxxK20qB8PX9qx4Qwq63qiYLyZAR01k7wwTsMluKCtZLHHubGZcvs?=
 =?us-ascii?Q?2Ls7APPdZE2Q1vXLAjkJccMwZ75hwHYjpB0X0Xkxu1S9hvA27AiPjrW81x6s?=
 =?us-ascii?Q?lYxieKLA2xG4zjFyqNkXu3d1rC960cW6OB+cklgVASdAYDot7hMjNn3S6e5K?=
 =?us-ascii?Q?pptWf2vLRgFsmDLte4X6kGiDZmjSB61Ha6FFv+fulua5vVvjOkKrVyR+h1na?=
 =?us-ascii?Q?2mQZlMnnHAZUXd6Key43Ps7Rgj/iGsA5H15a0GGiPZ0QmRW3KF+mRc8eNcRt?=
 =?us-ascii?Q?kPdi7bFwkFD0vj4x78jKUoKXl7KwWJa2cUecXBGSwlSH873CZdZU1ll9fuMb?=
 =?us-ascii?Q?tfpQ4Y6chBVC/pZjnaB1EOqUuHNxq4WtnzlU8uyEONr5lwvKiWJ6hUcvS2u/?=
 =?us-ascii?Q?uOb9X/dc8t0OdRl1n4Hy6ELJZBy9Oui8Ik6autkXnx0LeyfzLL9x8c8GvcDr?=
 =?us-ascii?Q?Ze2Dordaw7Qb3HkEMQyZoIx6ocKxoZz4jgD2evjGDWepb26rMbtlzIEEM60o?=
 =?us-ascii?Q?cKmzNRePKLoi4KATDote0wo3rTaCI3j6nmPpacA5kpPYyKXkAtAbyKvQHCUu?=
 =?us-ascii?Q?D+foHV9zVJ+uEoS/uka6j9ZhJeJcuoefvxXPNXK9CAhCdU2o/0odU8SlpqBH?=
 =?us-ascii?Q?SYcRWgfnkIpkx/x/sWjoT2gUt0ncPU0RhtbJ3clkdTQiR51VwexpMq2Ikqe9?=
 =?us-ascii?Q?9LrSrvSE7FamVmxq6tYRzVjYaSgyv3hvPo3FwxJvwSrlcvbQhq1/98SYSTlG?=
 =?us-ascii?Q?xsvOa8vUuPLU17oDFWVUcRbGVpmAXyG1AY1EYH5xIUNvCxW2KDH8iSoNSIxO?=
 =?us-ascii?Q?tr8mQDR07A6rIE4fiWVD9KiTO/agf8pI0Bq3sJLe6ezyh3HiQ1rn4s8c1749?=
 =?us-ascii?Q?gCAdhr0I7URxc0XuMphnPfNW107F1SRGWRVC4AU1zyouceXKvJIu8RU9Yn0n?=
 =?us-ascii?Q?t4Xjbr2aefp4chkrKXPD1UaYUBliCwjZrm8vkevR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3462f68c-acc9-4fcf-e83c-08dca71421a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 10:26:48.6685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hF3oxExlT+zNs+qw0OvqKZoLGRbVWElNrOXhz/cUvk+xaQrc8FK+afiJeN5n8+7WlRX7vfBSFgS4PMdnmDT9vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9886

For imx6ul PHY, when the system enters suspend, its 1p1 is off by default,
that may cause the PHY get inaccurate USB DP/DM value. If the USB wakeup
is enabled at this time, the unexpected wakeup may occur when the system
enters suspend.

In this patch, when the vbus is there, we enable weak 1p1 during the PHY
suspend API, in that case, the USB DP/DM will be accurate for USB PHY,
then unexpected usb wakeup will not be occurred, especially for the USB
charger is connected scenario. The user needs to enable PHY wakeup for
USB wakeup function using below setting.

echo enabled > /sys/devices/platform/soc/2000000.aips-bus/20c9000.usbphy
/power/wakeup

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 627733a982d1..dcd032678814 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -71,6 +71,9 @@
 #define BM_USBPHY_PLL_EN_USB_CLKS		BIT(6)
 
 /* Anatop Registers */
+#define ANADIG_REG_1P1_SET			0x114
+#define ANADIG_REG_1P1_CLR			0x118
+
 #define ANADIG_ANA_MISC0			0x150
 #define ANADIG_ANA_MISC0_SET			0x154
 #define ANADIG_ANA_MISC0_CLR			0x158
@@ -123,6 +126,9 @@
 
 #define USB_PHY_VLLS_WAKEUP_EN			BIT(0)
 
+#define BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG	BIT(18)
+#define BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP	BIT(19)
+
 #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
 
 /* Do disconnection between PHY and controller without vbus */
@@ -197,7 +203,8 @@ static const struct mxs_phy_data imx6sx_phy_data = {
 };
 
 static const struct mxs_phy_data imx6ul_phy_data = {
-	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
+	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
+		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
 };
 
 static const struct mxs_phy_data imx7ulp_phy_data = {
@@ -243,6 +250,11 @@ static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
 	return mxs_phy->data == &imx7ulp_phy_data;
 }
 
+static inline bool is_imx6ul_phy(struct mxs_phy *mxs_phy)
+{
+	return mxs_phy->data == &imx6ul_phy_data;
+}
+
 /*
  * PHY needs some 32K cycles to switch from 32K clock to
  * bus (such as AHB/AXI, etc) clock.
@@ -891,18 +903,30 @@ static void mxs_phy_wakeup_enable(struct mxs_phy *mxs_phy, bool on)
 
 static void mxs_phy_enable_ldo_in_suspend(struct mxs_phy *mxs_phy, bool on)
 {
-	unsigned int reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
+	unsigned int reg;
+	u32 value;
 
 	/* If the SoCs don't have anatop, quit */
 	if (!mxs_phy->regmap_anatop)
 		return;
 
-	if (is_imx6q_phy(mxs_phy))
+	if (is_imx6q_phy(mxs_phy)) {
+		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
 		regmap_write(mxs_phy->regmap_anatop, reg,
 			BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG);
-	else if (is_imx6sl_phy(mxs_phy))
+	} else if (is_imx6sl_phy(mxs_phy)) {
+		reg = on ? ANADIG_ANA_MISC0_SET : ANADIG_ANA_MISC0_CLR;
 		regmap_write(mxs_phy->regmap_anatop,
 			reg, BM_ANADIG_ANA_MISC0_STOP_MODE_CONFIG_SL);
+	} else if (is_imx6ul_phy(mxs_phy)) {
+		reg = on ? ANADIG_REG_1P1_SET : ANADIG_REG_1P1_CLR;
+		value = BM_ANADIG_REG_1P1_ENABLE_WEAK_LINREG |
+			BM_ANADIG_REG_1P1_TRACK_VDD_SOC_CAP;
+		if (mxs_phy_get_vbus_status(mxs_phy) && on)
+			regmap_write(mxs_phy->regmap_anatop, reg, value);
+		else if (!on)
+			regmap_write(mxs_phy->regmap_anatop, reg, value);
+	}
 }
 
 static int mxs_phy_system_suspend(struct device *dev)
-- 
2.34.1


