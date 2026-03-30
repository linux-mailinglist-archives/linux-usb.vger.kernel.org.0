Return-Path: <linux-usb+bounces-35652-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJBFL3lEymky7AUAu9opvQ
	(envelope-from <linux-usb+bounces-35652-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:38:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDBB3584C5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A73EC30576B0
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D90E3AE6FA;
	Mon, 30 Mar 2026 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hHjr778x"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834DC3AB29D;
	Mon, 30 Mar 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862970; cv=fail; b=P1h4e8F9W3Sf+kob5muYpkrTmjYzum6YkudWtJJagN3r0Vs0q8coxxwZldgH8nnu3bVdh2K56zxMOhq52TzugNwuz6/CpEzYvZSfDkEO+tcMVjYvf4g4CKJ2d9RAUJy5shFtBTahs4onil5GLu+3IWmBO55qkVekdnuXiMPGCFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862970; c=relaxed/simple;
	bh=PtDc6PbfbDzn2CXglaqTT7T/Q1pkrBdzM8r6vPkS+e0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Pa9MY2sWeJPFBLSjGxr89uHtVLNsDs1vlsEFA6K4BNXFm9WSlDBVxiJct5mHTpQa+zWac8oglkSnTJQvOYN43Cao5JA1ILoaTyyEIKPxZzcJHsr2C+x8ko9Ybq/wM+llApg0gFgZhbY/Koj7SL/6Svp0nGTdEHqQXhF0IIyHOug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hHjr778x; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJ54gLnhG+kmtsAg2+UREm5UVTJ1V/xpN2gs+sxLE+d/rr898mUI4gIZTXktO5HIzLNCxZseXeImgwCdCr19oRszpXf9DvM+AuopCIs283UBwQnfREpW0eqApbkvgaGEAgUPmhlizaLHw81QVLYWeXqha7lC3H46AC/XzxpDWcLI0d/H+vAK1wkrCk9URNrIDB+I4oQm/T4FZnPM2u+neFluUUniBaFce264v4YZ6Go+NVNKDE17w7PkZt4FxPyC4JhT0f0SZISYzULyFWnDpZLbzDL/cgimWrMvxgv3hTSAaswg7gsCEtd2y0eSfWurXMkU05sgchtsQMFapUAGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXSwsX5u4yvN1K2wZVsOdt8GLyfelCWfTazU0M9wOAs=;
 b=RFXaUFnGZwmBqEa7yuYB3hjBqJw0joWZ76xsAYnl0+fpxh3FT9gJBXEt8oW1U4s8YI5g152TNs3j296L9An/kWDpB5uAJuzbfHvT+21LR8EBI6u25CPdhH+/1EN6YUj4VuJ1loAfP5bTAjJb+XRjLd7qA4l2R+TmATcoDulmTf1GJylbQoKijLLu+ZtDOCl/ad9k96S0yE1rom5v5IQHZ0MHxa8CFxwRxg6Pw1X9IUvV4qKlkf4m8MKOgANFaAilseWWRvFJtUc7vXxfPp74cLyxtNr/sRZ0dcZh19qKSPdz9jDYJ9awmmO4B6mO/oV734GImEzR00SJtQPR9mRQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXSwsX5u4yvN1K2wZVsOdt8GLyfelCWfTazU0M9wOAs=;
 b=hHjr778xI9kAv71cuxcYUrCsJfSYZSycv65nPyuyhXICBoNJJIWuEIdWfp+xqyUyHoNA+wkNh8Pt+bY0xz3o3poN8wymBP+y+g1/0svZakR5ARlVCOYGQOYGcnfRw3wtoHX7PVZKf83Bf+HvoLy63N+bevyWHqWyli1haShHUOaDMwfwzIkX3OMZa2C5s+QkWtNyoWwKtIYqztYz2aNUeKqPchmj3eDVtI2H/mHY6RUYjsGvMFebx5KNzrcTu4QdVvovV4fF1YRX0+0s5mfixGKQr1VxtfwmORgNABDzocnzUAN7Rp/JDJO1sY0DCqmkA2YQGDQLQxI6QX/jMzdV4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10811.eurprd04.prod.outlook.com (2603:10a6:800:277::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Mon, 30 Mar
 2026 09:29:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 09:29:24 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: phy: mxs: manually reset phy regs after a warm reset
Date: Mon, 30 Mar 2026 17:31:33 +0800
Message-Id: <20260330093133.973785-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB10811:EE_
X-MS-Office365-Filtering-Correlation-Id: c151a942-e93a-4d1c-c1f5-08de8e3ed4a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	4QM14xB+qafwlppC/paJrsW0s9T3SXSVvMP/BbpnNc6Uc9VZLFkqD/ZBKCT1KnaBSCuJkGrghB0xMZ237MODAgaerqO+aPGIxBvT+jVbwCLNPkj64uV6wUukesKdV9I2kmAgQJw8EnHA8bCGgdium46J6rYiJf6cWvJQy+bWwzzasFkKdDwDBxmzEtv1tvk7xQhXNfZd99+3kjqrSHhCkrQ5gECMWHAYpWRJeqEKdu+oGsSjmD4xx22ZsXo9bXQJlv5LOIJU2hF3KdR5RiUbqMzZ9511vtNk7vQk+pwfuZFigA32hPUow9Ej0SNojePtn2V+0xKBAsekHWs+WEP1abkppaJ5Vy8+GWXkm8ba7rJoCxYkr+KK7MTH8udjkram4EdgzH+5j7NXj0/Jr5sBoEgzbDcHTzy0osxB3Glz17c2jP40iYBPQB2wUf4FSK5O9Nj/aaEzT80B/kWz1EAGpmMfbIsCxUSziSli398/kcQWQyg0LwBhEKFYEq3HwJ7uVu8bDXO6yzm1AXIzwGQ9YYLQqjVWyNrJ7ushteFTCEoIG5Fmp1vOuK0F92ZFj30poNgzp2xd7Mf/bOgcJ7/1sITaFUDYGHjHrM1OxtffrOIe39eZ7X/MkFHBYhrPJmoIMXn7Ll6jd2y+HWHISUrsX625O8K+AP62iONltBr3Goe0UfFRbyuEEQkscxceW2EwgHTOR1/GoVXOQJI6IvI3gc8ldu/Us6/VL/xiEihbJ/33faHePnDvY37pLmUoBDRa61m3Otm1gkF1HXegopEFESm01kX6ANU7metZ9JLCF3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jc+2wxCNgOwrNZMoozIB9F1yu/pHIzFsf6ydgz/gU+BXI8j8QBIf7sFwS0//?=
 =?us-ascii?Q?qHKANWerC8o+FXvdq48dU01P5zsBRgeP5AReesknbBJ31mhQ6W+UFA+gvZaB?=
 =?us-ascii?Q?1MhhZH5sC/iCX0wCgr9S7hOJQBciR5DORH0iL1zyyTxriod/2krNbp5wFgfW?=
 =?us-ascii?Q?SqVzkKJXO/b37Gipz1Knycd7DNZ1SvZJ4JpJQjn5E6/YK/3WWFY0GpSLFYF1?=
 =?us-ascii?Q?1S6yCi7r6e4r7cwgDqifOzn5SNS89A8dbJutaC+soXuDNJ7OTbrl0JhjzfRI?=
 =?us-ascii?Q?q2SQ6hMONWevlIYVSeWOnEVoeVxnTOVpy3SK1V9SBqrgFtRbQfxEp8/9KBWQ?=
 =?us-ascii?Q?JXf//6JyrmQeGpbscmSuL2n6mNerPMUD21t22Yjdzxqc5Dlj6ILk/WRln0uL?=
 =?us-ascii?Q?teDv5O5tYdz+uXUGNZ0laD58WW1av5IOKvsekERwYZ9PfBIU/oR5uk+p/F5U?=
 =?us-ascii?Q?Gktd4M5yr3s4aW/wcGp62J5rf0fHVtpf/u+SSVGwUTEdSAT0WBPQkvVLMUp7?=
 =?us-ascii?Q?v4IIPY8UXKSZV7xrdZKPZM1+ugzy30UzAGyx2jaXN63bisz/5Is4l3s7KCHw?=
 =?us-ascii?Q?hegXBe7xvHW6/Lcq/m2S3pmLWOE4fqz/V/JUY3/uEH1/Rg1KiJv2AJkWIZbU?=
 =?us-ascii?Q?0Fz6c2/s6cEDMErLGPF/NrH9vJgmcpT1biBYSnhKQDfEuZt5iF+koXQAwH3d?=
 =?us-ascii?Q?ZdsfqaOpETiqi5F8ZkLv1J4RYbMh51b/CfyeesXxjOb2cX6VASpGVHVaHxcA?=
 =?us-ascii?Q?4X6Pp1JAcB7TyHVrnUAprFLYVrs9VeMynNcRlvNTOJ2GbTfKJ2EoVZhGaNMw?=
 =?us-ascii?Q?cbayDk9e2ez4QpqszrNBfqm47cQvKJmgehjFZ3Xflq1+z0+xmNO/AkNDsKv/?=
 =?us-ascii?Q?tEWhtuicxhl1sr7l16vIRIxfNqTmXpsnzib9T/eyACxLb6eZmmG0sj+MH+uL?=
 =?us-ascii?Q?wMjHbpXbbIL0l2JOIcJ7pu34IQ1GhVwAZpu/0Sk27j/gAjeRdOd90AGX0vCJ?=
 =?us-ascii?Q?L2ekqmn6NycB4hXQgnL760e1e4vzYWIRAe4Wyz9dlqDCY7/621cZX5/k9t4q?=
 =?us-ascii?Q?fJ2GH6r9FX9OEoxa7TKVWR9f2fwLdhzy7ahA71NroU+aQv4KgD8QYad2WXJP?=
 =?us-ascii?Q?LjAazCa7VGiygPLkDFVoorLgxQGjZ0TsKn6sHweHuVqoo3wpugN6fOE9l1nV?=
 =?us-ascii?Q?KMjQGhMybojbj6pL35c0SYOGY5adfPYZsYgD2aQIHhpZrokLeluzRUA6aTCA?=
 =?us-ascii?Q?1hSr5615ircm9lUh+dUfsPRhrtVQyK+mHaj4/zFMC5VwilRTPqz7+a/qFZAr?=
 =?us-ascii?Q?3v4U96TlGYnsm+tkmLapy+0KvbrXhhahYxScidoBzSZoJxrZdBTjefCtfDDw?=
 =?us-ascii?Q?LjX4w6XnIgY0zYQfpyKFiyM0qCXL7RpLi1MmafG0YKeeYMTJeAwFXuAvrPC9?=
 =?us-ascii?Q?0svmPmygDgPjHupoWH2w4osQgYgpnznclovDm1YL2FCSx+4V2AYkFWBgHpAb?=
 =?us-ascii?Q?AEUe4PDbcwm/Zlx54i7HjcCU60vpL3UDeayUUgAvBMjYiJv1XUM+Y/HxCqSp?=
 =?us-ascii?Q?c/FDwBV6591USeD9MpPX12E1XtEZu5KwS5LvuNyrGbAicBgUn6kEGK8aM3JB?=
 =?us-ascii?Q?3yZ5D42pgG/LpOSKEK6xRHtTTsKtfcSOxcI5x2TbXZUsFeyEonef2G6Ei+0y?=
 =?us-ascii?Q?AzHPiwKNWeEDgVJnPfP5cK4Ag3sdF5Cv/9TeYOzZfFrlVc/mWi/xfNo6DcqE?=
 =?us-ascii?Q?QaCvuSqCtA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c151a942-e93a-4d1c-c1f5-08de8e3ed4a9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 09:29:24.3793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GG+6YOutPjDzlmJjzOQJg9ATSrjL8Ssk/1K/6KPciWcav2CS/XdWuKozhhignawaYzc36axGIKgO2dQcrAz+MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10811
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35652-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,nxp.com,pengutronix.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3DDBB3584C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The usb phy registers are not fully reset on warm reset under stress
conditions. We need to manually reset those (CTRL, PWD, DEBUG, PLL_SIC)
regs after a warm reset. This will reset DEBUG and PLL_SIC registers.
CTRL and PWD register are handled by "SFT" bit in stmp_reset_block().

ERR051269: USB PHY registers not fully resetting on warm reset under
           stress conditions

The following USB PHY registers must be written by SW to restore the reset
value after a warm reset:

Reg: ctrl Addr: 0x29910030 Data: 0xc000_0000
Reg: pwd Addr: 0x29910000 Data: 0x001e_1c00
Reg: debug0 Addr: 0x29910050 Data: 0x7f18_0000
Reg: pll_sic Addr: 0x299100a0 Data: 0x00d1_2000

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 7069dd3f4d0d..dd42db8a0829 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -209,6 +209,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
 static const struct mxs_phy_data imx7ulp_phy_data = {
 };
 
+static const struct mxs_phy_data imx8ulp_phy_data = {
+};
+
 static const struct of_device_id mxs_phy_dt_ids[] = {
 	{ .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
 	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
@@ -217,6 +220,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
 	{ .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
 	{ .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data, },
 	{ .compatible = "fsl,imx7ulp-usbphy", .data = &imx7ulp_phy_data, },
+	{ .compatible = "fsl,imx8ulp-usbphy", .data = &imx8ulp_phy_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
@@ -248,6 +252,11 @@ static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
 	return mxs_phy->data == &imx7ulp_phy_data;
 }
 
+static inline bool is_imx8ulp_phy(struct mxs_phy *mxs_phy)
+{
+	return mxs_phy->data == &imx8ulp_phy_data;
+}
+
 static inline bool is_imx6ul_phy(struct mxs_phy *mxs_phy)
 {
 	return mxs_phy->data == &imx6ul_phy_data;
@@ -305,12 +314,29 @@ static int mxs_phy_pll_enable(void __iomem *base, bool enable)
 	return ret;
 }
 
+/*
+ * The imx8ulp phy registers are not properly reset after a warm
+ * reset (ERR051269). Using the following steps to reset DEBUG and
+ * PLL_SIC regs. CTRL and PWD regs are reset by "SFT" bit in
+ * stmp_reset_block().
+ */
+static void mxs_phy_regs_reset(void __iomem *base)
+{
+	writel(0x7f180000, base + HW_USBPHY_DEBUG_SET);
+	writel(~0x7f180000, base + HW_USBPHY_DEBUG_CLR);
+	writel(0x00d12000, base + HW_USBPHY_PLL_SIC_SET);
+	writel(~0x00d12000, base + HW_USBPHY_PLL_SIC_CLR);
+}
+
 static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 {
 	int ret;
 	void __iomem *base = mxs_phy->phy.io_priv;
 
-	if (is_imx7ulp_phy(mxs_phy)) {
+	if (is_imx8ulp_phy(mxs_phy))
+		mxs_phy_regs_reset(base);
+
+	if (is_imx7ulp_phy(mxs_phy) || is_imx8ulp_phy(mxs_phy)) {
 		ret = mxs_phy_pll_enable(base, true);
 		if (ret)
 			return ret;
@@ -368,7 +394,7 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
 	return 0;
 
 disable_pll:
-	if (is_imx7ulp_phy(mxs_phy))
+	if (is_imx7ulp_phy(mxs_phy) || is_imx8ulp_phy(mxs_phy))
 		mxs_phy_pll_enable(base, false);
 	return ret;
 }
@@ -487,7 +513,7 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
 	writel(BM_USBPHY_CTRL_CLKGATE,
 	       phy->io_priv + HW_USBPHY_CTRL_SET);
 
-	if (is_imx7ulp_phy(mxs_phy))
+	if (is_imx7ulp_phy(mxs_phy) || is_imx8ulp_phy(mxs_phy))
 		mxs_phy_pll_enable(phy->io_priv, false);
 
 	if (mxs_phy->phy_3p0)
-- 
2.34.1


