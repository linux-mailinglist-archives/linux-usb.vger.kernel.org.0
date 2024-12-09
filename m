Return-Path: <linux-usb+bounces-18246-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B862F9E90A1
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 11:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C407283250
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 10:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF70216E2C;
	Mon,  9 Dec 2024 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ox6PV0DY"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1381C12D758
	for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2024 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740905; cv=fail; b=Z93iDE3L9ngUI1+smnzzD0wCHmIHz3f6hBJuOHHLBkWdSyrTouWALbU2gW2a0z/RkANKHf6xFC58vGYr+OKgvDxjHw93T2U1ghUZ1yIIQ7afOd/64gQowAP8Vt3DO3m1ykf3zWKuyM5cekUn1OGfmvMeKCgLNVAGpFjh1c6P7SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740905; c=relaxed/simple;
	bh=8f1OGClNDTkNXF+NcHex2Fw2V74JTKKZoaM9SysyJmg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uTKakF79Jw8Awm1Ja0iv6EQrEZtRx6RaU3yK+1ehUAFxNPGNDjGTavvpRHRRaO5VPC3jbDTJQMUznTZGJwhWKMWdbjsHc/B/q9k48WP4lVoFUKRImqO6isNQ2eyMhKUVRPAYdFMF9OrzYV3+YEiED4+NmnHSURl83HEaTJBxtx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ox6PV0DY; arc=fail smtp.client-ip=40.107.21.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vf4xZ/CC6zXVijpQe6XhtIAP8plPA1Uoih2VYEXDkPlybyBLpH5WekcK+qOCsJSElARn6LNWGj8fJrcQn/2qkjBBDx3uAJQjVIAExG/ivAe0e4qzw1Znh8kP9OxF93Iiwi/HKQ/W//mj8h4rKA+9/jt0w975G2uULLoh2b9EQhfuW3QvAQ0YRO7YcKOoGVanF+81chKeSE9exsVNcvpxIfnX9wZW3kWeJCUzO7pFU0r7d3MkPGiXi3CzeTrtSzNLOh+2tGsf/kyxBovf3TKK3Je8ftqVkVd3iT3DNqE9pw149k+S/LWm44zG/TkT8rCddpILA67aiqpQs6b40o58aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr3nRo5ognVGm5yfHK3W80PgJGINGKsz4Mjafj6gows=;
 b=eDUieGynJFbUBAdvDAv+q0Vwn6fdtW1zqCQRrOy9EuSgq9W0lUWqoouu+iKfwGMfG7/RCN1XKDIVJcDaHecAAJvKcBKUSP5OnIOV2YUlMtPops7S0DDSI7zmj+gCin9ANBF/Zrp16EnR2Cc22nJ0rkEUTh0FiRGAD2gwlfPGekdo4RZWcKeQYjJnPV2aPO/GneLpF56Unctm3ruDQChtNBGKObFvHVH+Uah147qPh/9kvEmelxdw1swWlI3n5xGyeqoFugNZV0umty/1yL3iKUmYnZGK6CQMpQl/2pXTtYOExX4ZsBHFNXzi7dpQ2VoT/pQvW8B0ti/agLXzNAfPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr3nRo5ognVGm5yfHK3W80PgJGINGKsz4Mjafj6gows=;
 b=Ox6PV0DYViA+1QW5BklTiMOlJIa5jQCGV7rPb/cEIMmapfLdRIwKAJUNfbgkdKHaOYB6MzGuA/kBbocv3DVhgO/qxpgb31J8KdElpyRQvPdubEXU1ObMg0q2LHKKylmV2Ce0cPc5Yua9UMMtPdTWxzkoIDKRMBflTRNYhdfbfTxK0lADXl1WZr0i+T+JTW416dcP/ENakp9AUKX+HhgnqrcmII1v07d5O3A4q/Mfpd8fkXw9mUafelSDOcC8oe+eNn5chMaAt6RPugCygc3nFGff0En0EXXIQM5O7Oy0b8V4czlh9JGiqq/Z/nUZtoj2TAwSTEmFk7ZAVbcml0/SWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10103.eurprd04.prod.outlook.com (2603:10a6:800:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 10:41:39 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 10:41:39 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: host: xhci-plat: set skip_phy_initialization if software node has XHCI_SKIP_PHY_INIT property
Date: Mon,  9 Dec 2024 18:41:49 +0800
Message-Id: <20241209104149.4080315-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: 0199685a-40d6-4167-599c-08dd183e102a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U9SsUScbrAk479D42HxUg1UhgdLkzVwt1xFursf6F5Eeo41tlYWtr1cB/Rft?=
 =?us-ascii?Q?FYELs6kUSoMWmZVTxtO0bpvpe6/o0BFYXXOMjljsxo7ZKwrpionncKQrxW0N?=
 =?us-ascii?Q?NsIbmHEXRmk9eu9WmWeDBdmUaavay/iasVPu7ssAy9p/5GNo+y7YmPH9sl8z?=
 =?us-ascii?Q?cW1pWgomgkMSQOBoOJDXT0W3m+tx9wLkYn8zYjCjtLLg0gR2+wyFO/z2hkIj?=
 =?us-ascii?Q?0XKLwBLZt+Dg5w1MYwM/5iUCCaYKl3P8NYfPGeAMBOIBKdNtS/Hhguz9yWZ4?=
 =?us-ascii?Q?vWIj1wBLnoBTh1ep86M3k17v9dLyQmEN3GX3ubfRvXoQ1AuUx5mKi9OdRjhL?=
 =?us-ascii?Q?IJcQUyyM5xIV+zmB4voiIlUcPtTZo03KA+061y8RcyQBs1SNs02zzcidpXCz?=
 =?us-ascii?Q?mRZDA8aeHH2/ezdNZjgEQnynqK/q5/HrKdqpqwL+su9BXQcjrrZhPZFnfxYP?=
 =?us-ascii?Q?E+8zfE9ICaT0EaSZoY7BE8FIhrM22VQnsvdcmJrG+8pwRAPPyyMKtKGyQ1At?=
 =?us-ascii?Q?sUQcX+HkLi4rGEdfSkQXjOhVGukD8zR4b127jciuI2yfeMPTQAvqpa+ZtyhQ?=
 =?us-ascii?Q?7BYLrevfjU0NFnCq3naDB4fv8l21gh0crrDWQs+ycuuOW+RGn9hkaIBB8ys1?=
 =?us-ascii?Q?J4fyQIZGyyp/We5+d8ILGpI0Vc0EK+xxb8uYsWgNJexsCFFIRqUTYreq5/lF?=
 =?us-ascii?Q?1yx17szmhq2MfNJrbVw+FPxAyIoBlrdfBdEUNAzbRUF7KGSw8mfMw2KE8CM2?=
 =?us-ascii?Q?Or16f3JfhS0CklwM2ShjllW506Ly57Wuy/tOgM2Rf7TksIAfFLJeHP0b5QyW?=
 =?us-ascii?Q?XlntvbHGyA0szZATjqATVsYVPddwYLrF+Yz99wPNT18tG7VAew/FPxs7QR5q?=
 =?us-ascii?Q?OlB0f8pqg28gpwpNaZDfc/aDhd1FGacu8aqikzuMNOX182YXmG2QYgXiOu8G?=
 =?us-ascii?Q?XdzGKah7B6FMI3C1bVesNHnSkXKKP/GZEjut+8zxpzjHyTTdIYYbBfc3EZR5?=
 =?us-ascii?Q?5StroMoohIJ7OjNyLBXW35BMN3Ioe0f3AzpeAFj6uMxIZSwklVOcLA+86LAq?=
 =?us-ascii?Q?mNIaMicFRm/l6X1kjrzOr/5RFDITUvygeHHZDsdB6AntxoXJUjdGisB1l3lJ?=
 =?us-ascii?Q?AKBCNv29fskta22YDEur8wLP6tdDKTijtO/R62SakYnf+aq6OYGwGp2qjsii?=
 =?us-ascii?Q?owkBDpNlulC2g2+7TcnCm9zaCcnBzPvHxCoH6zCbovBEFvCf8AiN1g6bYHj5?=
 =?us-ascii?Q?8MORXttKqlN/Dj0z4UFev/c47VBXGQF7xYla4EWN9Tud/FeTCqa7Fwirgqt4?=
 =?us-ascii?Q?SN2kQAQ5CCgsjBToWu3B+nG3CULZQIx8TTtV9yszlYYK4Lrx+GjmTzFAcNUg?=
 =?us-ascii?Q?rfyHNcTXJ9XM/to9Mcwh7kFAKUIvJIPU0JQ8i+6r9Xa0KRXAPg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WnL86h9ylZ0CQYGup4bVXH9stGCm5pu+G9vSw8/XBQmI7VJMzA6LkEHyunNf?=
 =?us-ascii?Q?OT1GRcPyNkL8PTgJ8fUwsY94DGBLoTaVBbR9VuXZaSkWSj3KyYL6CcoTNmtQ?=
 =?us-ascii?Q?LjWpG5MKYIGNTpxo1zEPadD8UBmSmWkL8SvCDbGzTiMvB6tawicw+0y1I9s3?=
 =?us-ascii?Q?osq954Mo7KQgkkL13e/afqrLwV0WuA+VIgWFHAYsSF35WFJcyxjKYWEDd1V2?=
 =?us-ascii?Q?Gws9uRALkatKXV3tStnlXDmCX8Yf8XfAc48/wYfFv2LS/ax6rFB1tDag5GSs?=
 =?us-ascii?Q?2CeyaCB3N+UvSLboNLeeVAA6DzYqkl50BMqjRY/EnfTf23gNe/Z0o5v/Dn4Z?=
 =?us-ascii?Q?WL9mR8JU0WHp5u0TzCkga6feW7VmRxBciLSjAkSm2x7ICNnLXzVoi8ESkser?=
 =?us-ascii?Q?9OrXZIr9TNsq2nTyM8oVZOEML3FH9IBUN0DWnCgSL/zA4NHHKhXLfAs7/gmz?=
 =?us-ascii?Q?saU6MAPbNQjP1K/YflzkstJRUev0wKyePNWGL7pExvC8JeEpU1DkPc3JcHN8?=
 =?us-ascii?Q?KklOE3TUIDW7Ul0ZYyxAC8mk99CUfnJEDi2lVsTbiZHeyzqopPPp9zWq5l8a?=
 =?us-ascii?Q?VbuBsBp8jYgnoYDZ41Nr1GXeuZJRDwlxDbKHUrhIl4x4pQFF0iaC12ZqHXwL?=
 =?us-ascii?Q?v6Uv+Mq6G4N4piLu6AwyGYHXOSGrM/HDhXICTgeRjT5jN7cZTUZ3OX1r842B?=
 =?us-ascii?Q?ZRb4uMK2X9206hKUN9+coXv9MsBO+/AjsX1JD2568b8W6NQf2ptFaQYCvwEo?=
 =?us-ascii?Q?b+wJJKHMR5arn3HsdD25OHDKEQ0aST/yX3Iw5/xa0xFwdf+3MHlJfm3ktfr5?=
 =?us-ascii?Q?C3VxEH0EjLrNaPyv9U9IJsbzEekswSBFeiUJJBcHtrLTwA5yc9bbbH0YV2nC?=
 =?us-ascii?Q?j6c9/eERdtS4NAbdE3PIJtg9IHWwIkQ39dB5oyJ6gEcQrZtNoBKjYwMboici?=
 =?us-ascii?Q?FUApeEg+KW+FtSCv46k630J+bGrLpC/Ws0Yjh59kOLUlR+wLzZprWt0ZbfXz?=
 =?us-ascii?Q?NcpVX3/TJO0T/2liY9apF4hbjPppg9Wr8Iwn7gIfmSD0XxvDeLwm+Ge2Uqie?=
 =?us-ascii?Q?r/rw00YanLxrTAaV9ULhxZ1v/8FugYKNWEXcjeRNksgvwt8yByL0ImoNInfg?=
 =?us-ascii?Q?L+vuNE6puvQOmSR4x1l0AuBHl+IVg1NqCXKWLg56PxMYLMaCMjmtIyzjTtAA?=
 =?us-ascii?Q?336dlRuI8XW7JSEclWHJuqzmot7sI+qTcgf9iHW8iTC2whjNPj9gt/4lYKBt?=
 =?us-ascii?Q?hXxCs5u0c/7s1UTw2O/R/GJGH6+PpbsJpJBG3dovUtaBxPHq+Qz/Ff1o8Q1l?=
 =?us-ascii?Q?t4eMIjEO543+IMppgr4OYgg80wV7nf/3lsRjXeNYqFjYkx3D2Q5FEBZfXCdm?=
 =?us-ascii?Q?RSlsN/UkULWmqNvoJtPY3ERlkRnfUeIJwljThJUarzFFt5bQkH3klPgwp+HA?=
 =?us-ascii?Q?DiznCyJUsDisqKfBPE/sDE+Yo+GKjUnwMCiYgwRG15BQRJ8vPzeqW7bZdfuS?=
 =?us-ascii?Q?EJUJodrauZQd+D31BgFjLP0VX8OeS+TJVN48H5B0kXlMBksPmnHRR3xlKP8U?=
 =?us-ascii?Q?HOoloODAyEgkz+WcPO6HDYYtl7mZx1FSpN6KicSX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0199685a-40d6-4167-599c-08dd183e102a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 10:41:39.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pq5lhvI5edHg5/dvBqKnth8g/9SSHDL47ekGgg+SBAYBBNMntv2flUwHVM9BaaRf3cCC6A/2Bk4TyA6lK8jN+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10103

The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
software node property. This will set skip_phy_initialization if software
node also has XHCI_SKIP_PHY_INIT property.

Fixes: a6cd2b3fa894 ("usb: host: xhci-plat: Parse xhci-missing_cas_quirk and apply quirk")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - fix indentation
 - add fix tag and stable list
---
 drivers/usb/host/xhci-plat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index e6c9006bd568..77853b86794a 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -290,7 +290,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
 
-	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
+	if ((priv && (priv->quirks & XHCI_SKIP_PHY_INIT)) ||
+		(xhci->quirks & XHCI_SKIP_PHY_INIT))
 		hcd->skip_phy_initialization = 1;
 
 	if (priv && (priv->quirks & XHCI_SG_TRB_CACHE_SIZE_QUIRK))
-- 
2.34.1


