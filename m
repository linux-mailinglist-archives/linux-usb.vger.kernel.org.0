Return-Path: <linux-usb+bounces-31995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D01CFD421
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 11:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 635313090DFF
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 10:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB212DEA7A;
	Wed,  7 Jan 2026 10:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="EryM6Rst"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8BC20C023
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 10:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782717; cv=fail; b=YFCsiECMcZft0M4RaXxdJCdTbyKGAjrw4TY1GNgu0P2bUfGIeY79nlNTemKG776tNs48ZfTyGCgbkzhFUlg3EHYv61ntgk/JWhKh8InnOGQPLcDQJM3miJCeaCXph85T2Ck/3MQekUW02dcQg4mbBWUc9DEGRMCyWy5UdoApb+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782717; c=relaxed/simple;
	bh=JG/KJ8W5MXBCoevpfi2dcIYtLhGCzbXGWDpxfzfPtVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V/41POQ5A6q2pqaUvjK1TkkUaixcfztP9l7+6Kqh50+AomFqSylnlkDUPaQ8Ce+f9iXAAjZB9t2eat1eZHTWNtS9jN9/QbMEzXW/u4nyvT4JMjjArAHKeT0qOjtATsXjJjfHTkpZKTA6lUyzpF0jnEr3fbGO8RIRr4V+2GlYI7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=EryM6Rst; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3Dy+fEfuRhfilO84OYmBk5V0sIxuVH0Fn74Lt6Hc+t0BLhRUUJPM4+WqWni2K6GtlzWr4DNExLIREVbCEj0HVjRY+t5fZ3g3k5FmNgrvOXTZkn4RUO6JmqKu7Vn7LrY1pWtfRthIB2gZXdT5bMEbOLFNJt5bBgDNAOGJY74yEQZMnkjB73Lhf0QJqO8UEM50ZXHbRb7XVE+t+BULPUnM6mv4xAxSlcQQFRDmH1YYVu/lqmlbtt0wJiKU0oix3J0mEAcnrqE9OvT8D/3apbQf6/xDPfRRZq4nXKhR1tZnKU/UwG3Xpq4dnbcTjUaPEjucYwr+ZZJT41tdQRzm5B6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAj0k/EfC7w5B0rl9zZJupQ/J06f3+VgL3OH89Hp2VU=;
 b=Z0nFqlYhzTLxKhi0OUP6kmEFn3+cdouRBAcV9zqzI48rDHwPom998p6yCwR/G4BKsBUeTc2gV+CWytiTPq9e3o9nZTZGG6l2vFDeXFFqFmyx7aDiJ7HQlZD/W7vTX/2/3MCNl7ilc4vSaADFXECf4C9YMWwh0il6KVOyoEaXBuBNscN0v+fhjbxuj/CFQFrXeZG0DnIzGrb1wE76xk6zLUdyL7Zdaym0tH5YHEpElALK7qGtdRkv5+FBhC9cHeDmW2uvD5p+LDg7aVwNiiQdiV9jwClXegAQR49bUTdKBBMjXq1doHsP3KYWnD0ZN0aq5bGD0JssSwuKBqda2qXuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAj0k/EfC7w5B0rl9zZJupQ/J06f3+VgL3OH89Hp2VU=;
 b=EryM6Rst4mrbhCtGEoOWEJ5P6jXte72T9EXF07S6gfxoqkcQogKHyutPuDlOyzy5CFIkdgb3Y/Hi+SnCicBdMUAgQh7WTTJTNDZoPOwnTHvZD7ocnlJpm71hCa77mFJiIvHMLpFLUH3fr546MWt6zWv9/GhmZ/b/md4cgdM9g1Q=
Received: from AS9PR06CA0144.eurprd06.prod.outlook.com (2603:10a6:20b:467::10)
 by DB9PR06MB7418.eurprd06.prod.outlook.com (2603:10a6:10:255::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 10:45:11 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:467:cafe::42) by AS9PR06CA0144.outlook.office365.com
 (2603:10a6:20b:467::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 10:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 10:45:11 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 7 Jan 2026 11:45:11 +0100
From: Mario Peter <mario.peter@leica-geosystems.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>
Subject: [PATCH v1] usb: chipidea: udc: fix DMA and SG cleanup in _ep_nuke()
Date: Wed,  7 Jan 2026 10:45:09 +0000
Message-ID: <20260107104509.421795-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jan 2026 10:45:11.0180 (UTC) FILETIME=[B2A4CCC0:01DC7FC2]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A796:EE_|DB9PR06MB7418:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f2704eea-abb4-465c-304b-08de4dd9d54c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9cQw+DtSAkXbGVRPZ3LAkwmeMrCMCHaunNP44YW2N3JC6ANqmF7HCF3mrU0I?=
 =?us-ascii?Q?gvJiriC3WLcf09YL6Y9UZkqPvd16x2I6vtGk2jxxk67AfWMHAmv4adNP4aHP?=
 =?us-ascii?Q?MICkfREbb3HTKsidWBpb0ZUrLmihZmrwdft7P35hWajKKQcJiZ89mk7NuCvW?=
 =?us-ascii?Q?eLt9FwOhvDGR6q+Q97e+NQPN08jBmXCbd4gxQIj/z/pyZZEMXJYEZHATMHn5?=
 =?us-ascii?Q?wjUmt+B0hm9TVg77Z016rP1EBQ/QOxHlBTJNpIOzAUR3Zy7zKPOd2pdqdxh2?=
 =?us-ascii?Q?Ezvkwhah/vl4x8lp3ihm2QVnTWqRp9RqoI8THuemyFry1riuWpc8YHbvlv3t?=
 =?us-ascii?Q?QoBpfQLQcezOVdfHzWeUTZU5O7VOthDxrd4lHO21iD4ATPYFOhTnjSyB/4ki?=
 =?us-ascii?Q?a1XNRl4rdGjHdjSkynyXJDFxQ5By2AjRnUfNeD7tYEf37KA0n8n7H7sQxV7k?=
 =?us-ascii?Q?iVBPRu0M2gQgTtOWayVMte3OQhMLXLATkJGjWvRz0497uOEn4iAg9d5ZF6yO?=
 =?us-ascii?Q?awgE+4XNmIXc0svR7afcg6VDxcSMJ6Lae2XAuoZ1UWqIkDhWvWeqZEoQcVHV?=
 =?us-ascii?Q?hlhnM9C+gmtlq3bsk53Jg3VhwlreOOBQdxGoRCf3i5PdGWt1DQZUB5AyYA5M?=
 =?us-ascii?Q?/z5KQDlTQauFCc9O48lkkXNqgoROwx+likuhL6yUw/2O7VSCg9TJDmxs7p+c?=
 =?us-ascii?Q?Oo82z9IaeobjF56NTHnV1kaHNMnCU3OfRHoYclP7fczfvim9p4asFk541clL?=
 =?us-ascii?Q?qzlPDv/nYfZcmZoK3KpfgT/44ZvY06eD4OQ25IR9+qYL3XtQ5h8xwHuQQ+nv?=
 =?us-ascii?Q?zG2haOsex8luSqPxyL6DYhhF7U+n4t4Paydn3+w06KhN7KrP57aEBhJutUx9?=
 =?us-ascii?Q?XxNEXwc5ujGK2rKiKjgn+eA0o1U8A5Ntv4PIOW1yilztnpzXRlV20cQs/9fI?=
 =?us-ascii?Q?8KnN0E9vrpy3jeNIdbYgbj/yTw8Nrt10UwneuaRcs5rqyXMM5GKu9mmPBOkW?=
 =?us-ascii?Q?8eWiCpkhnpL+O/+Mf+xIMRz8L6JjmpR3tX7INuaP2/4P8ay4Hmr2aysfoX6b?=
 =?us-ascii?Q?+2gbK7c0P6xLXpsmQj5cUS8OOlYSmzQYoV+ycMqpNTkm6OvNZJqouiTKAC5Z?=
 =?us-ascii?Q?VJOH6L6zHPfknuPu6/TNbNM1UT0s65yjADtXnomc7T7NYGpLxxu/7UmlmeDK?=
 =?us-ascii?Q?9lAqCNKav37Odrh7y9jx8COEwvQYlqP8V9ys/6dAHP6TblPPQ9UfL2iV1JMn?=
 =?us-ascii?Q?8+CL4pCEq+ML5Ace8TIK8QuuUi00D68mw5c9rtAPEsBoAKflPzXWKpYj0R1g?=
 =?us-ascii?Q?iMOU67JREmuRsngBJ/HUacGkx8+6XE7hs6gSt1enT7j/eleHEWV/GiBr0hIb?=
 =?us-ascii?Q?3MXcp/Uar5z22sCtjY387IKh4KOY0FNaPZLU4oqnK/mdAvO6NI42de2gi4gN?=
 =?us-ascii?Q?lBjHXgwjpQHkcmwxXjbhvhM9BESUKCjuqy8ftuUf8HVElm7qcc4268y3FkS/?=
 =?us-ascii?Q?ZBnY3ILf1SM8D0cf6/u1QwTRpXafMUlLNNZotNOpdyRVQvdodTHTSL3yZneg?=
 =?us-ascii?Q?cm5XTyV7JxrTwybmeWQ=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:45:11.4613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2704eea-abb4-465c-304b-08de4dd9d54c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7418

The ChipIdea UDC driver can encounter "not page aligned sg buffer"
errors when a USB device is reconnected after being disconnected
during an active transfer. This occurs because _ep_nuke() returns
requests to the gadget layer without properly unmapping DMA buffers
or cleaning up scatter-gather bounce buffers.

Root cause:
When a disconnect happens during a multi-segment DMA transfer, the
request's num_mapped_sgs field and sgt.sgl pointer remain set with
stale values. The request is returned to the gadget driver with status
-ESHUTDOWN but still has active DMA state. If the gadget driver reuses
this request on reconnect without reinitializing it, the stale DMA
state causes _hardware_enqueue() to skip DMA mapping (seeing non-zero
num_mapped_sgs) and attempt to use freed/invalid DMA addresses,
leading to alignment errors and potential memory corruption.

The normal completion path via _hardware_dequeue() properly calls
usb_gadget_unmap_request_by_dev() and sglist_do_debounce() before
returning the request. The _ep_nuke() path must do the same cleanup
to ensure requests are returned in a clean, reusable state.

Fix:
Add DMA unmapping and bounce buffer cleanup to _ep_nuke() to mirror
the cleanup sequence in _hardware_dequeue():
- Call usb_gadget_unmap_request_by_dev() if num_mapped_sgs is set
- Call sglist_do_debounce() with copy=false if bounce buffer exists

This ensures that when requests are returned due to endpoint shutdown,
they don't retain stale DMA mappings. The 'false' parameter to
sglist_do_debounce() prevents copying data back (appropriate for
shutdown path where transfer was aborted).

Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
---

v1: submitted

 drivers/usb/chipidea/udc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 1a48e6440e6c..8e1e0f9ae7c3 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -931,6 +931,15 @@ __acquires(hwep->lock)
 		list_del_init(&hwreq->queue);
 		hwreq->req.status = -ESHUTDOWN;

+		/* Unmap DMA and clean up bounce buffers before giving back */
+		if (hwreq->req.num_mapped_sgs) {
+			usb_gadget_unmap_request_by_dev(hwep->ci->dev->parent,
+							&hwreq->req, hwep->dir);
+		}
+		if (hwreq->sgt.sgl) {
+			sglist_do_debounce(hwreq, false);
+		}
+
 		if (hwreq->req.complete != NULL) {
 			spin_unlock(hwep->lock);
 			usb_gadget_giveback_request(&hwep->ep, &hwreq->req);
--
2.43.0


