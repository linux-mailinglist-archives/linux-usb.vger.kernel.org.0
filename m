Return-Path: <linux-usb+bounces-18250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ECF9E91E3
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 12:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8053C2812DE
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 11:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB2321883A;
	Mon,  9 Dec 2024 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AqqSRe3W"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6123217F52
	for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2024 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742857; cv=fail; b=Murh6R82/GBLWRnzYV6Jrto+PGBdQcK33oQZFDWxAdnDjJ0f4mqzrUBtD51UIIRZph8PiKLkOj2CVtNPn9NysdDd0v8/bIs7QRIhhas1haMzBp+xxYoQbCQFZIB1oDB9YNKOOcCD+Qtm9Igu1rjRwPqkrDiSlZ7vnwii4ivr+EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742857; c=relaxed/simple;
	bh=9g4Es4qaKlNTuv6sfRUohKEufXKipul6Q7hRenzE9LI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sEHsOg6dvi5caDvu/rU/2Dsl0Iz63UMppnj+1UiHtrrsljnKwHyHEyBEbAcAYl0LYFC1ld5WOrtcI4XTv6NVS9JWK1CAl3c1W7bRxtLpriBvPKQ6VRZB2MJy7ipMiK/6Tn8PMhllNrGOY/slN1OgZyYKPwjnxscybRZ/oKCg0Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AqqSRe3W; arc=fail smtp.client-ip=40.107.21.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEikFFL5x3MCWyxfUkHirpIAnLLOd3MaGrqPz7e5K2dZy80JpaS5noeFCFfxtRhQPRaaEhkG3XNExVMH3b3fCmHUwF6Ej1Hts7oBFdSuUMBQh5ANNmiZV+YRom3QonE68O5sfOWu4alTPnUErxxvKLMy0jj1CjMilkHxK3OKnLyWmJ44U0ATbt7anyIoEkYB2OxsgG8lAmS1BVKuFC5Kw3dR2PlU0QmuhUTEz6cDniM/NR5RewabNvs5P5bKfi38QG/DR/Ed5fpcAfACuJYyjKIpSJXM+TfaDJluVnCltfSUWuloz1mZQAPi2cgbeUHQghZFotQtTHRWgDpFNng6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fj1p0Z0RNN06m9prAeS9bBcR9KMfR660Hn5Et88F81U=;
 b=FZRv8LWLWLQW+IYKAMLeS5lNXUvDulVnyapDhDFIEJG9I6KfIazCPjcMpR8+rQIto8LlaM9FAvba2Lq6KxypDPVm2iGd4HUhrxr2QjNih3AVyf+tWld4qspT+qrQgXHLg3cN3xZyOt/QpW3cv6QXsOmpSWkR3efLh4uEfspB7tjiM4LU6+mmbUupgeifSGainKaRrimbuSL3KI1J0H9gySEly8fA5y8UR3vcJN0Ky3yFMIYK9S0wKwiPEX9h2dvmPJ3G98RFhUBE96ax8+ozx9MuD1/YcdfKE2BCFwuTB68lBPzx3uk7HpPCxiVqBuNbbsU6oqDgEjdLJHhvlvpVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fj1p0Z0RNN06m9prAeS9bBcR9KMfR660Hn5Et88F81U=;
 b=AqqSRe3WcVa7kOXLFWLIXRTfoOfmG5JNMNFqI0pQ2zPEDmI3zHfjrJFrtfDZYaJ6Ylm7oAw/h+ihV8Cv8FRatasqzXv//6jWbylAQob2Vw/kgrsUShyrPouvVe+BKM4a6NsuRhFEuO6FzgT7xkILkbuoOnGCqtMPmN31bpe3QmLaUYd3PrYOL4mD0WgBoGrSQLohYcngGEey2EwBXsluE+6oMoKIyuchqkMYb9UjlPVfkODEZWucR7hecYxTO1ttjFaYNkIKtZyzSYGfmPLBK3u2bM9EF4Pj0cPBCINczjMhXBNPV8R7rmM9FjdDk1c48QcYkzUuWcYuoA3v8BFBNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10737.eurprd04.prod.outlook.com (2603:10a6:800:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 11:14:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 11:14:12 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3] usb: host: xhci-plat: set skip_phy_initialization if software node has XHCI_SKIP_PHY_INIT property
Date: Mon,  9 Dec 2024 19:14:23 +0800
Message-Id: <20241209111423.4085548-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0192.apcprd04.prod.outlook.com
 (2603:1096:4:14::30) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB10737:EE_
X-MS-Office365-Filtering-Correlation-Id: eec5af45-1688-44ae-2171-08dd18429c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NT+Hk8TNvhsDLrX8xFLplh8cUDYxdoAumWw5p4kj9DyXDd/Bk7ipH10bel84?=
 =?us-ascii?Q?06tjpWBCZjxW690x7odkpjXTVz03UlZFcl2O8FnXV4gE1NcyZOz5k4Fcwb6B?=
 =?us-ascii?Q?2b4OR6kEVQXrSiQyroV63dBeZU9VH2U37QvEzcLz/hubSg5XanABBkcd8mMm?=
 =?us-ascii?Q?6A6wRep0bENrJCucDa/4mSY/fMqr+fBM7BooJ4HtlusqYTIvwPqYVhSYN1Nc?=
 =?us-ascii?Q?yBFV9GIMItZGEoErNnjyFF4wl6lJlWB1PZTAfuc7EN65UYNWRO8t5Xp8buFR?=
 =?us-ascii?Q?X1OLcTvrVD27/CAI4azie2l0Ditn0T1Ycbj9MAc4hT9g0aaMPQpJHHWklkaT?=
 =?us-ascii?Q?Wh4cso/a0Pnr4ZeEUPHMj08btgCCmgWk7Qke0NyogqSWWmjMSFino1q7q37p?=
 =?us-ascii?Q?Vrmn+/j5gw1fkEhRP9XUMUckrNnTVIMtVAgAbhQG5jF480s6Hg5sgTpBwZVc?=
 =?us-ascii?Q?elNdIC5agVSVEo5NpypMXtNe73gtdHyz1nMRDQVPQ+EIoDw98Xy+FwHgygRD?=
 =?us-ascii?Q?6ry3WPr35R7Jbnr/m5Mm28Kj+NPeeJPjkPDIyT20aFhsD54XmjMTK8Bo1/Ni?=
 =?us-ascii?Q?/9kc6XyBhRjV1ixxKSuC+Aq7hxia6kH5AmtvLFqyaqgb9jz5KWE7WMrYI6Kj?=
 =?us-ascii?Q?f7xk+AYqBVI4unm2fMp1LCaXgyx5NzvuHK/HFFf1ivUWvBLYFuYacblXQDbL?=
 =?us-ascii?Q?W+TUpEUa7ISl731f71k62M3suMH4dqg0kaXLBIMwzxUB13ULVJRiOZ/oxPvs?=
 =?us-ascii?Q?JfEplw9xzhRkscaMwfZNLhUWAFYi1yvPyQyjKbx8z3bQj4wTne5bWCyLu8Tu?=
 =?us-ascii?Q?BG5gQ0RKE0GD4gHrOiwDLpAkemVh5/89tZPS3uKtPk3GjG9smbSqSSG/1W4X?=
 =?us-ascii?Q?spMovFMnRth7cAi8AY5x7eyniT3mturnSL7ULUBlICjUQqIykdQ2RYDbhfyG?=
 =?us-ascii?Q?gPW+JFUhDH2lAjdIdzFooSDPBfNkggWmoQlxVHYXKgz1zTcxuJv9/1Gckqyz?=
 =?us-ascii?Q?Evlq666DjwiFj5X1a5AXxtvQtJuaxsJ3EZd739KD2xB3dQ9+62Q4a7RpVRy5?=
 =?us-ascii?Q?f84D+odGzwVp2epu/VbsUlFiO22REaPtWG9r0FjBDI1ztqUH/AmMP/QoQU1X?=
 =?us-ascii?Q?Da4AtgwIvMifpb4wGF30OABi1ZTsachzMgOlSPqseWon8BvTlHIGjGvs+Bei?=
 =?us-ascii?Q?W5bQQpJsGSRXaAgAlU7WWAql/HgbJmR+LVBKxc8ogTYn1n71Ta7v+wKnBgcX?=
 =?us-ascii?Q?22ldtU5ej2gPeunAEiIOigYX9hU4MBShdYSK8HFt5sFMNEgHMwQSFyGaYmF5?=
 =?us-ascii?Q?1BRnQDPRa27gMXnaNuS7Bk/pv+4p/dPjyshuZgs/sdlQcn8niDuVHaA9y/3g?=
 =?us-ascii?Q?UtsCLvDUOzbS7Eil7y9C8l54/25BowTZzi4P5abOGBM1zzJTHg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TnT99N9AHgCtwMq7nxYuFs+uCUf79es/mvDSkOCiSxnHGqp1CD7P3BdsRt/6?=
 =?us-ascii?Q?S2ZDraGh/7jBsV6wQ45LYEG4r11p3GPa1SrqPj/LGAUqFyzRDLWlwNNHQXvw?=
 =?us-ascii?Q?06ZbQHKgAfY1Sy0ODGWpGuddEIqs3GIYuQyZvBwKzHft5ossZT/YX25ItAPP?=
 =?us-ascii?Q?RsBeBk7GDw1wHwN9svuOOAQ43qV/5JzxqxW98ZY8mz51DbrrjRDezrXRdYY4?=
 =?us-ascii?Q?cqqZvY0JejaO+9/ljPxk/XYEEz18uw4zWLk0ChLQ6WVLlm6tlzW1gjQ7xlWt?=
 =?us-ascii?Q?UIOuql6+aLcq9Rq3JFd0Ra1ldUiQMLEiswaAjAY5oSQEE8Nu7ZoB+lh6tZD5?=
 =?us-ascii?Q?ELQBSwnrlJfqGaBrhOMhMfFUw0IgreSnjysAZ8/g4rStNQG8oXPsJ/mlFHRc?=
 =?us-ascii?Q?zMlhU2PDeErlyDSsCyOMq7cbbwOTAp1GKs91UJB7aKh+wruFVkGZYthFmuiu?=
 =?us-ascii?Q?Eal34i6RA4kCTOpo5if1cHMXfv/zm6fx+PC/DqQN95fFOIZuYk4RSeLtnIY8?=
 =?us-ascii?Q?IgDIKO8hd31vklN2yz7wOfPsGyZe6Ipna8TPHx1rimUtGgS7UBZGXZIcuOaS?=
 =?us-ascii?Q?EV3AjwiDV0633nKSJAFTRn9P3DOUzkUdIXxyrhyKe7eBRUV17Sj3mT5CF9Iv?=
 =?us-ascii?Q?qTr+SbcyiFyY4JhFV61WX016dSivUOUiqjx91vc+qAZDlgF9j+tJ96HTDf7u?=
 =?us-ascii?Q?qd3EKKOuoskLxp2IO0zbbgGz4SH1kEtLfAyxPQ2K3KM/edf7rWxgHilT1kvE?=
 =?us-ascii?Q?hrXdjbZeFArQmXH3nTI/0QvEBZtULl+ZuIeaQ6kt2sfmy0Z6uHfrwVkr/BXY?=
 =?us-ascii?Q?pcN6jMO32MKhz4BmG1Q7odt+qWBMTSriIWn3PuGBOqr6MuZIFPIljgLaWsGD?=
 =?us-ascii?Q?u3YcB7a7p7NkODtSYBzjGDgGmEKHvgUqdE2/PUydayP8tLbOLfwpybohJ1lX?=
 =?us-ascii?Q?GZ1lnuCF9EnkegMqJ7QyXsAKWl8HjWqN+LPEAvKjAfkXZR9GLIYPWqv/ecf7?=
 =?us-ascii?Q?SzIo4b7ogwkActIHlANXWtk5oYQJ8L58vFji0FGaGbS1X1T5qDOEU4brGR42?=
 =?us-ascii?Q?IsrKVU9y0nCt4/kIPpn9WzF2wshGOno9iK0d27cfbrQqlR/1ooAZ9srXvqqk?=
 =?us-ascii?Q?APPNMRlw4i+lXa7JOue7uatuFp1vm3tt3INSyNRX4iQ/Yt/FnbbBV3Gt131s?=
 =?us-ascii?Q?iWFfp8qz/ddoP6tm2DWpeRtYjLI+HPxWWuLmPpGN25ZSWWzr+epJd/qkva6I?=
 =?us-ascii?Q?IyKfEi0lCpMKDdMKEZwNExp6L+uoM2CkVGs0eoJxuxuqFaqEuQIYSh/YsAfU?=
 =?us-ascii?Q?l7eymy3iXbAC7kP5G/ZdNTr/3GfSQ1OzmZaseH+MjqWEyz0cEKL9CNdY+evj?=
 =?us-ascii?Q?KWDK1YxolLjGsV9QU26sTM6Vvg7+j0ANcGTh7W4QIkRgCPP+x2FdTKLJr4OV?=
 =?us-ascii?Q?g5nm9henisYW3qnUjX7Q1pKJEuzl+Y6UKt2e8WHl/itL1tTqKXIjy6Y2GGg8?=
 =?us-ascii?Q?UUshl5NrI/RiONBH7vJsD5IyYLVacyQ9On6oxgpI2avhkcUpC0Qzpp3Zc+Mk?=
 =?us-ascii?Q?Bd8ewLnfJl3tMZ5ft9LNB4+KXfOcd3vLDtM7omb/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec5af45-1688-44ae-2171-08dd18429c34
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 11:14:12.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYsfZovGAznctZPIQtGCiZpPzsvNedf2KSbGc12Hk/eqUiyQujzqhasbJOhtZxsVh4nMG5DmHorlTDnVyBgqVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10737

The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
software node property. This will set skip_phy_initialization if software
node also has XHCI_SKIP_PHY_INIT property.

Fixes: a6cd2b3fa894 ("usb: host: xhci-plat: Parse xhci-missing_cas_quirk and apply quirk")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - fix indentation
Changes in v2:
 - fix indentation
 - add fix tag and stable list
---
 drivers/usb/host/xhci-plat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index e6c9006bd568..db109b570c5c 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -290,7 +290,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 
 	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
 
-	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
+	if ((priv && (priv->quirks & XHCI_SKIP_PHY_INIT)) ||
+	    (xhci->quirks & XHCI_SKIP_PHY_INIT))
 		hcd->skip_phy_initialization = 1;
 
 	if (priv && (priv->quirks & XHCI_SG_TRB_CACHE_SIZE_QUIRK))
-- 
2.34.1


