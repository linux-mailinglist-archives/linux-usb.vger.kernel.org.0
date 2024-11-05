Return-Path: <linux-usb+bounces-17095-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B79BC722
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 08:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B5F41C21E65
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 07:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E1D3B784;
	Tue,  5 Nov 2024 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JCMtALYB"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2068.outbound.protection.outlook.com [40.107.249.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9E42AF0B
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730792363; cv=fail; b=fGo9941n5rjkJLDtH+4G5Hal6fRfh/pXuEpKfwjJKd2X221D/JfqVA/oG6AgLGa00v92M6bR2ZmlGFulku/tQErKssdmwL6q1DEzqIMaErwQNcH3+4ZlP/TFORwlyZLGsWr6lBYJmnwdnCurTR4xLnXfvHvOr4L0UQydNtzLIcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730792363; c=relaxed/simple;
	bh=5DaHBu5wy4/zPwzHn5iDExbZJiRib/6THMMuwhtKI9E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=r1lIGIoC3vrZcwyC9J0f+R1CJooa3UlhNIEnscWiPggHxUGdTZFPtWVfhEbzJ8LrbTrlvkwtbBwZg80fE8alSFRxg40M9G7cvfgdbgpA1tDQ1qlUJuIdAchlXTjMMmXojEydOGjmKfMjYjfZbqAP+3lYO8FU8lfkcsTjjRjibKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JCMtALYB; arc=fail smtp.client-ip=40.107.249.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXZtOBrFYn6YrI2Bc2N77Dj+N5f/uIf++QKPz3JC5PJHQznCGMUSGEl94M49HxcGGBQ3/1io6E1cpLFh+RVQyjV84+ElordeljpUCNLtaaDGJ4IUvxVRtQb0aUD5DiK5UZHPb4F7AkwUBbYm5AGDlhuxa62637wz+ALtxpac2nlgltUemKXKUtk/7jp3JiYVplUpLLS3hSYkWTC/nnf/q6tym9/TZu92xfyO1JVG2gRXefJnpUgQfPChF2Zjrupu+HH2BMDtkFgEiIoH9wfx1DCAP9qDmyQVZ/pOYnHecEcAJ/p14NC1wV0T1vG8sFT1rD1vA5kYTpXKiYheWflSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewiiyF4xmD8jIU1xlrQnQtO8DK7DODwhTstGSqUFOzM=;
 b=xvrEes0LToouFLAxRUaxcTvIrPRHRPuxiMuQx0mJNdABO0BSVjUAgIqKsLsXziooNa3B3ZbABAO5Lmbb6/4G26Z3ksouv+5h3ZMPJCLJxP1KbcJakdb5LrIx4isIvH6IchGpczMO/CEPBsnN9tT9eawZGMJpWmZa7YMWD4oVXsNt4TCT9By5bUu3kaqpDsitw3+Nvf+oFktD5tIP9/5ushuVgzsXiFDOsDSNSEz3KnjLznpwq3NCBucGJVxwGaNZ4kw79iIWZEYp+/+4lTmymrFMcnPLms1LsoF4POC4JvC08WrJpVknIN3WTgRvrfM6DBbXMEE5WLIPa6azDVb9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewiiyF4xmD8jIU1xlrQnQtO8DK7DODwhTstGSqUFOzM=;
 b=JCMtALYBGvqhGuyZsNehnWOiZN/jkY2D2+lgA5WM4T/5aivmozyb4h0nPRn/ptWkHUuyzUv1f2P/ym042WiAw1gLXEAxkgqekdu1WQs25Wuz258BEtMjhuZJZQxYMcFl/o1VqUki4El4ptRKk9Ai0pyLuxsuWc6A2foZgslVqaox0IN4l8yesqdd0NBSRBKsyGfQ7pFFKRuAIy9x7ugntTUI/WupmHUkxOFj9+2A1mQfL5PHeQ+C4DZpIM3Vm7Evsufn7SzicihkBvPd8I0hTIeupfK80zA63bOA/xqs4llLJuJxf5LC/Y17/Wgx3F3XHRibt2ixeSNB4Q2C/PRz4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7768.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 07:39:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 07:39:18 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: host: xhci-plat: set skip_phy_initialization if software node has XHCI_SKIP_PHY_INIT property
Date: Tue,  5 Nov 2024 15:39:04 +0800
Message-Id: <20241105073904.2416057-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fece847-a65a-42e6-e340-08dcfd6cf4ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MSRL4/zB7PeOo6/EfgFn31dCDEPg0/u22jVt0sNeQskfdumIfN33RdSKdfH1?=
 =?us-ascii?Q?hM0lEkSQ4mBjKwZByHjLrMJERoeK62h0I3fVXP32FLKvgYx/Oi7V4DI0p63K?=
 =?us-ascii?Q?2bjE2CqdFQz/6cRpr8EZRA5H0KZXIn2sYuL/RLBNVvOt9Ey/paFWYjIrvme2?=
 =?us-ascii?Q?Mo39CaDn1QhVMwvDaErNSIKGt9bMM6fwBYeWYoLxVh2WF4frJ6T9u3fIT5yI?=
 =?us-ascii?Q?eONMNlAdZWLfTs8sWvLderrCBFhlgWuUJH4ixOGCJYUPIqFl85rMKgMcLXJJ?=
 =?us-ascii?Q?657GmOsesfeQNgG21xno9zZkCms5umeD/o/w6gK//GhygH9hEU+HMtthLk+T?=
 =?us-ascii?Q?AsTLp4xT6RIoT5WBbesDK698R4ZmMJOlBWPM8bOjK7n7vC1BH+SBrfBqJ7bi?=
 =?us-ascii?Q?fGh7xVDEX6Dc9t7RZK3/Js6+j9VEj/VlE/naXsahIEkdGvQwuJXnRynQcuL3?=
 =?us-ascii?Q?a8GBQ2WuAweiRvzGUzA8+lqi0ex9IQc3J18FaahD2wgMOsTcmcqnNoaBas3i?=
 =?us-ascii?Q?RQv3X/PLbaQvumzZOtuvfjkKPiwmOvXLo1jz16FV0MYwTpA9ryhmung5+rca?=
 =?us-ascii?Q?c/Xvsd1YAgdXdUvAMfQj6f3eGd2snS1mkyx6kF/41f1Iuvb8l3koh7WpaUpr?=
 =?us-ascii?Q?LVP6RXBYwLoog1u/cFPrlNj0F7sZ5sUjmeb2jnKhn+/FbLhNojytcc/Pc29s?=
 =?us-ascii?Q?VV+S4xAECtFZ/PuOjtA8S7ZMOwv/Wt+1EhOYXvJ2ToQ/Jb6SOzVQMdobEprJ?=
 =?us-ascii?Q?U6JVlXnDv/IHjIaLhVFgZq1Q4d0l2ipTPpan7czEx0N+kAyUWxbEsVWf7mB9?=
 =?us-ascii?Q?S/wFnGBoyN6lXs0u92dg1BkN26fHqOG5SWaauAjdckOPUjtcSK/smGba6RY9?=
 =?us-ascii?Q?TrG/GKbPOAyk8zccyAG+0F9aUDdfTi4i4A52xEGbedOM6hJ9muu+kvYDejFo?=
 =?us-ascii?Q?abQtpgHNE9K5SAPt7dlfVOx3szOZccaYhwqd3ZcqWi4RF7U4CDqZVocYeaCN?=
 =?us-ascii?Q?hcpHUUhn6E8r9kgOfZEO6fMnyDYI3cv/0UzbGGJGayNFx32OfPZ5wp0uLtTb?=
 =?us-ascii?Q?2DYN1MV+lyvdvw5PYT0D8Ea2CPbOLJ08eBz0VlGIbfDwJjbE2lRllOvMDl6L?=
 =?us-ascii?Q?6Hcs1DTzBr8S9GEcNmrz6Om2fBM2hzYZnkVScuXuNGq79p7XDsh1aE+ZbqoT?=
 =?us-ascii?Q?ROTkdBsPpFFqiXMkJ0GuhnKsr16OK0CYT1M6+Evk3W09z7JlRDUYAYnc91qU?=
 =?us-ascii?Q?an3+iFghyQ7aEIsAW4K9m2PqYpxer9bWmlARAi5TWWj9QGGzM9WfCKsBvawS?=
 =?us-ascii?Q?A3FHxXuzR/TObK3XlHfYbNdHJyRa5ZYhR+IDsr91BXxnDollCZbVQu5+uWKz?=
 =?us-ascii?Q?bwQUmW4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iPdEb2TKf9bdVpj1gY94PV4l5STbbCqp52ORl973954CJQ0VLdbEtIAnXWDm?=
 =?us-ascii?Q?b81vfC0CCOv1jNrWYegT5IyLQgXGaczTEvTksiQc+IZGwBLg7AZI/tgqF4Ib?=
 =?us-ascii?Q?vgKRI2HvVyCzUbFgagAFNhSI05KQJmNh6+wPfJPNo44jl0rG43fMs0B5Jspq?=
 =?us-ascii?Q?k+es+16G6bXi1+qjY/TKFAxLPDZa3xkb5LtY+vJypf6y5PmtnyYwtG1z8k3a?=
 =?us-ascii?Q?b1ZrnIbalZBVr4QWwi3gCzuKIAa6Jl8zlOY2zUO13ZCXUdb7xpWTgNx+OZrY?=
 =?us-ascii?Q?vslxVvV9QfGXvy0IKQORmr9YuBDoGnQwuw6Mi4WcLBLoInrmFO9hMkehLY08?=
 =?us-ascii?Q?9hUapEbj8m5oZonHeAY9QY2sq8xPQ61Luqt608VX0YC46YghzUd/FGwzxTaj?=
 =?us-ascii?Q?VS3VFZ/NnXwZJEJDzLFtYO3oqCyxXP5nN/nvIxZAnha+Zat+81VpvyRXKqf+?=
 =?us-ascii?Q?dY7aNJFSm+SL75ZzeKaiLJL95fTtM8yFq/tZHOnW06ETpeBt0VeKx57peQ9n?=
 =?us-ascii?Q?1r1As4ZTCP4BzgAB0b0jC7YkqR/kuzFv9OBVSWY582GQE6jnBTOnYFuUWZEW?=
 =?us-ascii?Q?5qJgmxSdRztv8lfnEDDcAGu0b4nLdGmkJKGN1IuGNB7e5JSjvSteCgyIFZ7D?=
 =?us-ascii?Q?ShZPzgHyO5thyadPe1fkk6V6Rvi6BQzSbeZ/CRLK+9emp9u5dXSoMCKx2/W4?=
 =?us-ascii?Q?8wRyymw2KaHhNay5ZslPQs//qqG7TYsCyyl/ETBB6ti/4UfHkdkHhNyznmYx?=
 =?us-ascii?Q?g+3kreKlrOJxggREdz8ZX16hzZRoAP0FLco8kog5ZQcIEu3+IxqI0iH1WPAf?=
 =?us-ascii?Q?tPFmXQj99BFDZFsz7Ez28A8fWjE3ICe/hPFaZYJb/nsgNeGfGH4eVD+gQwY5?=
 =?us-ascii?Q?WlT5v/0/jDwRBYTAKOBbNbEM6Yik8NhScUuxk0qzhKv6TptKMJr4AXLWHfCj?=
 =?us-ascii?Q?XTT5XdsITl6vx7fG6WvN//IJ7mBk2lWW80o7JB1LRPjczM14pHHInGhNj56v?=
 =?us-ascii?Q?s5vSO7lBiaIol9w9vL03MK63JBVT7dnYqcvZzXiE8xKhayeLL5POTR+/eTAL?=
 =?us-ascii?Q?FhkmATLwHlFXMK10tmRSPu5pAu7StvR3/9mK2BT4R0xNbAruuoVjx/I81pJh?=
 =?us-ascii?Q?wDe6kDgs5DR8fWikdwpsNeexXotMM9qjfagPtVw1pYhLnOl9gxRFZJHIfzsl?=
 =?us-ascii?Q?5U1lTLlYdrv4ZCEiRhpjc+nGMplZ0rFhxpSe0pxWNeDKsNBmrsd3waNBBf5e?=
 =?us-ascii?Q?DjAnOzCdhFbygiIVkIUb2TczLMar4rJMWATaA2EOluDj++f+JEad3dxMaQF2?=
 =?us-ascii?Q?bRkEO/QTkNRce4Mt5Arc+CQfXj707Lg3xCuXHIzb8eR00Y9+KVf4dbyDTrFu?=
 =?us-ascii?Q?vb6qVcz0toNvFpkEvUvoJ3/JTEAQkhrR9oLolrj1tPazDOuniYJMdHhXRjVH?=
 =?us-ascii?Q?q6xuL9DIRpTf8X5Mc3ENuZnYVNGSLg0JYrF3QrUOJLfMpInj7Rln4F1sA0GN?=
 =?us-ascii?Q?rCnpv/rSB4mjeGYdHig7e07f6SrVPBfayMhorP9yIYz6W9q3genF7fMqyiQu?=
 =?us-ascii?Q?11p6L2+/GMMlk8ISZsANiOhb//jup6vrkMeefAJo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fece847-a65a-42e6-e340-08dcfd6cf4ac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:39:18.5893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrCQXHRqVdMsiWC5fSpPp+3jywzBsnQRXs0UbSekbvc+Xfrf0Cyjh+0m5Dpq+JTBuMcftG5RggWbYfLxq5vOvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7768

The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
software node property. This will set skip_phy_initialization if software
node also has XHCI_SKIP_PHY_INIT property.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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


