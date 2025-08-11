Return-Path: <linux-usb+bounces-26696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 912C4B204E5
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 12:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98241165027
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 10:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD82221FCC;
	Mon, 11 Aug 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E7mcMMUf"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5CC21CC63
	for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906941; cv=fail; b=qDd+bKWzRdLIlRDio32PbENVgw14vVVaIIcSJsMdY95ZrdBETicWfn1ns5zvxEcTN+bgJIG3A+KB4CRFa9bx/PreCrGqPkf1eULrsql7huiXAAGEPY2NhKhmRfcikIFMxgKSYTCyH+0SkqoPlqhny9m391YjRKAA6dm8yNSOJg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906941; c=relaxed/simple;
	bh=VjkAfocmxF+5x8NF9FPX+yKjap7V0MhftEzrh0gshOM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CKvXOERYbSGJshMaS0gdLfoPzgcaxPOqAlPhXvJ9oh8MFgXWy4BKk1YhFxwcI0UM4NBDFE/ohQrdiUi3ngDuF3v4qY7NxGg+ltBxsBziFbDgSzIcBn5T5PRcE/GKM2+/N0z49CaGE4e2ftev/nOwRYBo3/Lrwl8g8APc5cX2nWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E7mcMMUf; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1bGKawdmQYm+PS+PlvzU8QmAod+Y5JEPl8uxB3aThKy/xXc0PLfz4UfTyomlUiw23V/E7LHmF/sG7VZQJmYly+bCeFfbxTx/+H6nOvF/7vlx86cSc4D5Mal/JuzteBWtIUGnfYW6KHPskNEzjl4rdLkPAsc/sNYjmq5FmaHF8RJWnfjD+gf2jc1kOf02pKfNvoeknIYqOs7uGFCsKIa/tVjv+i0AuLgGc59mxX0B0Dx+mgp5TDEMZe1WzxoK4cmRqk0TbFJE/5eknxOJp9kINEDHxe0w9M+1ZG+HSJvMJKYapi5f7+Aa7m0rk46iBiKb917JPB0mgiuLUF6l3RVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMexpinF+AUpWDeEYK+I1r3+//yR3GPo8ae4MbP/9mc=;
 b=Wlo+MiliNsXN+yl5Zw2ag1RGiZXnUiDJPYswYNSgtEyNW6Rqrwdlwh63iGm1elQ/3Wep+uaKS0/2baxlf0wlf5UIBXbJC+vtkFYqWMyeqFHCdWSjzzAo42mG06j6dIs/2fqWsihszTEy0dlGUjg6rIxPE1IcTvOdXvcuRzEQWm4seJSYwPyc0wwLS8TGxX+bqOTcMKSM1e+PcI7RZup87ClttWQfNl8oIWQcgyT2ZWzAT/ufImBNUnl54fYyUnVdHScsGh0fSsDwlcgs0M8oREhaa94g4wFz0iS8Li5o5YmSasCNH1k1dEc7ZXtqY4ooFIYbBf3mPMrHMXrAcfWzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMexpinF+AUpWDeEYK+I1r3+//yR3GPo8ae4MbP/9mc=;
 b=E7mcMMUf/JiWY+EcU28pTXIksz5hjvw6E6UMfH+MNS9LgjJkGp41mQm2Ku2DQbCI9X2lEnOp4kYLEm5m2U2lmV3LiLUxfR4JEKN5eD/3vWKoV/tIVG52apqLOavoh8MMu2ecgIwhO7U2Ip5MO2jYcXG4EKHVtjTnkQ5A2h+X88xlU8++cW/bCPRu2oxnRiCrxtIkoM1YHBq2H8yQhAoBdCW8gEVgDNOLAi/uh5GU4kl1SwVs51OEjyPXAmEPYwVk7CT4gVSRhFMqgzDcBeuH9G7eCP0fAgy8rlHvEgENvBgBAEd3Lfj9r9MeK438O+jHxXg06fnNN6ujHJ3o62pvxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7388.eurprd04.prod.outlook.com (2603:10a6:102:84::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Mon, 11 Aug
 2025 10:08:55 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 10:08:55 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: chipidea: imx: improve usbmisc_imx7d_pullup()
Date: Mon, 11 Aug 2025 18:08:33 +0800
Message-Id: <20250811100833.862876-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ef7c8a-67a8-44b3-d532-08ddd8bf14c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P9VBwqXpzwzD3hyXkfGT1QJrIqKOGwUQJ31Yvvw0o38D6+4Ayt62TBncRQ+i?=
 =?us-ascii?Q?7GxEmNifLNM6Kzj4ZrcdhDXV24PvLfgjLzUYDO1V9AJBgMkB5mi5x28GQJvW?=
 =?us-ascii?Q?1Og/SUOwa5MjUy+KPh/qge75CiHeyx/dVsXAb/0CtRddsnq/531rqqb7ohLa?=
 =?us-ascii?Q?Zz4BRfY/HVMhrbkk70zpc4btk3xwzhcN1GjWmOsqRhzgKubnT0XG4fDpX5hg?=
 =?us-ascii?Q?GvWSuPUX9VbKiOLTZfFmEJ1zSmT8jEDttqqHig5TByZOPccbuUpUMQ7bhGMG?=
 =?us-ascii?Q?y4qXyx5ca+ArLsrtLSFZ64/J7MLy9jVMMD+Wrg/SwZJKVmZLP4JoDGyT9PsR?=
 =?us-ascii?Q?c8Y2dkChfl+iN/erWldLrJavI7eDfx38kJDRk9LfDci0O0+/9YH3RfjTamgW?=
 =?us-ascii?Q?CQ+jlJRo1kxEFwmHrl63uxSEGINWHG6qAddT9j6H6RptlQZIC/v2B9X45xXp?=
 =?us-ascii?Q?O+dIQ9wjAULOIAWBppgnyLkkNuYI7GD8hgc5uyZigNExU0cXWX8MHPVDV+e6?=
 =?us-ascii?Q?1Z2NnH3KnTe71/5ffwrPVxHUJVyQlwERvNoj1Mim1swUnIVcqvx3itZ3D9wt?=
 =?us-ascii?Q?0tq3UedK5YFbse4VmOETB1W4jUHouVSQs25DBUYwtwi/oxJK/e1nRhkx1dI1?=
 =?us-ascii?Q?6BjdFRHK+jRk1JcP1Tc7BGZzpI2v9A08+IF/ZQd7KuT2w85yxzjXSxjQkvoN?=
 =?us-ascii?Q?xWTbFNe8qCVCb2xAuc+kBLsAIUbB0ojoSKgCzHH76GQeOZzb6Pdk7dj9lGQm?=
 =?us-ascii?Q?iPd8qzPW+bA3juMJKC1oI7xAV7YCJV0S/SPK+0AXtzw9+nFeiLCy+UqqWtN9?=
 =?us-ascii?Q?KM+f6eDpJALmOTUnF8N3iaAjK5tZiS5t7JXSpF55qi113HQVypt0E8ykNm4o?=
 =?us-ascii?Q?nqTlyLtOuV/gMnOX60r5KcuAKNem5e0TjlhljbH6vWxG2Vc1fqvxv9/4T1qZ?=
 =?us-ascii?Q?51bp6Y2afSZR+mUHGaXwXHK7/8+5mi3AGrEGsEcMac8m843j/o9rkOiV2fkI?=
 =?us-ascii?Q?rX1AwvyIaVWngPub8iNr9r8v80NMQMjMRvtPOGLzuJurVE3BN7V7Bw9vPR5C?=
 =?us-ascii?Q?gIKD1HG93qJ5HOy+iQaRqQnNd0Qr3K7LjCwY7+UrkKNpx0wR98bagalTnZf7?=
 =?us-ascii?Q?n/yiiRXHrzYn8TYCbcQDwhxYRtBl1VgH52znmYvKX8UImISs8Fzz6Rxsoh+V?=
 =?us-ascii?Q?SoYZtnPGlwtcepqKEdKNOijs8IdNIRQ8UW1ksRVzdgqDzUrTyeMiGoV50YpJ?=
 =?us-ascii?Q?lf2bDMLzdMn6I3JM+pX2L5TjFepSQmZdpPf4/5SRBtSApg7Gxs6ZlWv2t0Wi?=
 =?us-ascii?Q?9CWW6SMUsmNHk8fte5Coo8X4fMWiYXOF2V//VmRdo3MPMYHlKMaYQgbModPl?=
 =?us-ascii?Q?7gBYBFjfU5XACY7YftkiwyrgGvaczsx7NysBTGuJgRito/2TvH74j57gDESf?=
 =?us-ascii?Q?VS2vwh4FuhFfJyCDYhYmfZJSfh6/wF9bJ4h+RaMJImewjEGI7CWa1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R06XLYgI35QkGVEY1y9Jh/kQH/GYWUVqqsb1nPc5bNeSk7+VC4O/pWqjWrXY?=
 =?us-ascii?Q?h3Zz3Fgn61a5ACBnwmykksHCcE2oDzc25Je1fnlm+GLZW0WyFzD2ApO42rJ/?=
 =?us-ascii?Q?M92wlOelHPC7SADyRG6thM2gKDZ/hUt0hlNi5ozhGzpRIJljnFdnfdhSSFcD?=
 =?us-ascii?Q?Dl5rqP56nHfokUxHghQ6arTEslQ8hdk9SDa2eR6JzHqXJDTJxfYS5x/7sEQV?=
 =?us-ascii?Q?PmdW7ReA5P5y8uonhCGXDFrpTlW/a6TpR++Qjk099o8nuIa/iimh2vkWjvVM?=
 =?us-ascii?Q?uK3LxvQYkKEOBiUuiY764PXXbeDGpLo9JrBrVExEc1AHk95Y1p+PtrQcehbR?=
 =?us-ascii?Q?NIWgrho+867H9eR7X4JgKMXJVa3vp3dqgonbHd3gjpJ0rgt94zRThz2w6U7V?=
 =?us-ascii?Q?iHbQEUhZ0k750uBRx0HNi3KwHtK/yPts+82vOmm235gMuO8xZ61CrAhWC1to?=
 =?us-ascii?Q?l/oBDz6iQoTJClHmNkD6ZWnAn0RV3IZDrlKP4ke9S/G3aiA9tG/qHoyXjOML?=
 =?us-ascii?Q?MZK0J+f+gAVvgeWOTnOayZiu+lea+I2n+djP8WEJOEbhT/i9QDcOSzTyNAxi?=
 =?us-ascii?Q?+f506XxTrfj59gXRaBeqdolW+KuQR3Pk78pb2AgTJvnm1oo6L58/3za4LjE2?=
 =?us-ascii?Q?vrQLEGcIitEcLd3mhoiGtucKSpRNNA5hsQF2fEuIcg4Pu+/254QdVZ4LWzNO?=
 =?us-ascii?Q?Xcbb0RvJwCUhUjymz26kPtQ8hixTbfLqVA+Ev3x9+y4e3v/dOc61kQ02yPaG?=
 =?us-ascii?Q?HBW+T0JKfRxDaGKtntNmwjYoF0zXEZn1M+5AMjyg6BTkYpNqSmjkPFjUtDJM?=
 =?us-ascii?Q?frgmwwMplpLdpTSsE4HQZkEspfNHjfSKAS47SFFbLQJcnz+OsOqNJt1pERq0?=
 =?us-ascii?Q?N/HgHJhGLh3nUvE/NuSRlBEnhC1ZAfL0MWo8RQDbKUoA6xK5GMTKPQzeKR4j?=
 =?us-ascii?Q?s0BzFagUZLl3teYI9LPrOWvGCPOzRE5xmYlpEzT+jmfmifPVrk63q9vS4+UC?=
 =?us-ascii?Q?z2mbqjVZKqP2cZYQG5xNjz1UHrrqIxczq6a7DuTH0y3m3fjyuR7akCZcvbCL?=
 =?us-ascii?Q?3CBUCZ7i8BCaS3cqxzXHK9OfFUzv5UJgdwqCbOPw39tzqS2X6MgkFINqkB7f?=
 =?us-ascii?Q?Gy2f/NRGiVpzfh9l2tmsBsBHrZVTihyHrjJUTp/4KsGtCIxWLhWnQIqOT2w3?=
 =?us-ascii?Q?AjwhEAK8AvzHsjm5y1czHSArqQ/2UmOxxK/63hzAArU6vkoxJiAIFY0jPP++?=
 =?us-ascii?Q?OOuY0hZnB2DdOXeSPS5YrtGt1dbaIo4EdJVJv0eY/TEbf0odOthwHkkKUp4z?=
 =?us-ascii?Q?+eI7RskgqGD9N9tthG0xEVztA+7TY+YyTZcHHKDZ/tWI123vg82FlzogIzZK?=
 =?us-ascii?Q?R40lH0FUsxUyy7T+8JfIdOECvS31gi6hyZD3VdCjB+BOiqSlAAvV1V2NViXm?=
 =?us-ascii?Q?JiFColuaqZKRiOeWC/CIXhpjgrZkLpVeS/iHU6D/g65xImyJ+93pNmSDz0I2?=
 =?us-ascii?Q?velyaWNMM+HJxzTA9GOsMmIlbSV5EKsVdkBMwaYrtQcpsRZV5rpCFxLLe6ai?=
 =?us-ascii?Q?RFo3H0Bver88b2+DuTqNYYOFZZDVTzAOdn4zeyT/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ef7c8a-67a8-44b3-d532-08ddd8bf14c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 10:08:55.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qEFInJXPzWUN8cNWK+ClwQ/vKOl8Mt00PbSRf2ukhpteQ8nKQ3fjF8igtT4uZWVTuhZUgexM2quZWO5pmCLBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7388

When add workaround for ERR051725, the usbmisc will put PHY to
Non-driving mode (OPMODE = 01) after stopping the device controller
and put PHY back to Normal mode (OPMODE = 00) after starting the device
controller.

However, this will bring issue for host controller. Because the PHY may
stay in Non-driving mode after switching the role from device to host.
Then the port will not work if USB device is attached. To fix this issue,
improving the workaround by putting PHY to Non-driving mode for a certain
period and back to Normal mode finally. To make host detect a disconnect
signal, the period should be at least 125us (a micro-frame time) for
high-speed link.

And only working as high-speed mode will need workaround for ERR051725.
So this will also filter the pullup event for high-speed.

Fixes: 11992b410083 ("usb: chipidea: imx: implement workaround for ERR051725")
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  3 ++-
 drivers/usb/chipidea/usbmisc_imx.c | 23 ++++++++++++++++-------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index e1ec9b38f5b9..d7c2a1a3c271 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -338,7 +338,8 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
 			schedule_work(&ci->usb_phy->chg_work);
 		break;
 	case CI_HDRC_CONTROLLER_PULLUP_EVENT:
-		if (ci->role == CI_ROLE_GADGET)
+		if (ci->role == CI_ROLE_GADGET &&
+		    ci->gadget.speed == USB_SPEED_HIGH)
 			imx_usbmisc_pullup(data->usbmisc_data,
 					   ci->gadget.connected);
 		break;
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 3d20c5e76c6a..b1418885707c 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1068,15 +1068,24 @@ static void usbmisc_imx7d_pullup(struct imx_usbmisc_data *data, bool on)
 	unsigned long flags;
 	u32 val;
 
+	if (on)
+		return;
+
 	spin_lock_irqsave(&usbmisc->lock, flags);
 	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
-	if (!on) {
-		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
-		val |= MX7D_USBNC_USB_CTRL2_OPMODE(1);
-		val |= MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
-	} else {
-		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
-	}
+	val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
+	val |= MX7D_USBNC_USB_CTRL2_OPMODE(1);
+	val |= MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
+	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	/* Last for at least 1 micro-frame to let host see disconnect signal */
+	usleep_range(125, 150);
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
+	val |= MX7D_USBNC_USB_CTRL2_OPMODE(0);
+	val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
 	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
 	spin_unlock_irqrestore(&usbmisc->lock, flags);
 }
-- 
2.34.1


