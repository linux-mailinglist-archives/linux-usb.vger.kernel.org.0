Return-Path: <linux-usb+bounces-32079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C66CD04A0F
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 18:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09B34302726A
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 17:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207C73033FB;
	Thu,  8 Jan 2026 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="Igv2AyHc"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843482FF669
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891551; cv=fail; b=MEMFZHvVALeMI3VmeEPv8kTTVRVG+3DDsj5P93S2rk4CYQtkm6Q0yl6bREIEum2Usq4mRW6j9Rtc/HFfC2pUWYxDVgE4MlSLsBBgHHtiq25XbAWpukff+Kuqvyvz1GMnw8wogRTgIZqoTN1PHYDqxn6HqHxgLX3gHZZofRM5KyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891551; c=relaxed/simple;
	bh=TtpZJjJA7z41znepyEWbB9tqoI/wTEgVadbYblsIGek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JAHfnezHbXppkfR2YFQfAKoHA1vGcgfF4xrJ43Dahii3LbdHxx5rXUtfYgKZ+1EFEpqdp8BFtMOLuNsWXhHDARZGzKh/8gkJddAFggVjzJWIUQr/tLT/Vk9bDcD2/4JumZFsddqmtm/rg4ZsL+2JWvBuRETvpqP8mn4IqD4nlZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=Igv2AyHc; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNajH5v3sR/KdxB7EdprMi2vRIPnx747V+Lh0jmCBNahrw37aWG5DDFnYyYz+VXNPBMJ2KWDS36uw0AiMCf9kDAUVoO0QQ+hOt+2BV3j6G7bA5lCt6hkJ+QWw2dG1l58jDnarD0DXwjR6OdelfipjUkIED9FTc/Ek+sP6vLbLTw4/RUxAoOBuHvpRODOv4aUClgPhSX5SurhMXQJe/dzdruzbMy72F8lAFop5FGJX01GM6/OhSgBeuxH7BsWoRVD7fGwRiyHljy6hrfyecQjl6nV0Trg7VsIqZBs9gqFYPeXY/lju6QZhRKtieFfOt0kphU7omrPp06OSadVXLYn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgIXV/oBG9/X7dLPdwfaXMbbfHUaHc08R3rsjzN89OU=;
 b=BhabX0q03qQhRrz/A9A39A4dLxgqBb9lslOespm2CvwebBORjtf3rQoz5UpiJOpYfzaYbPW325H92OtiVmgj+zfc04pzC0tLlaVI4Yp4ADmOy/8attvi59DmW+qKtBUvTPAjI/HQ8cN6UVbyIH/SZZAHQE//pR8qtjZfZavBYx1CE8fQD6+zg8aQKWJttn8YWpuRlX49J3TjMSRGq1WhmxRnrekqmmu5bGuRPyQB9DzwD2gNmrKW5IqXKODay2qK7CPUNqDgpj69/MAGXq9487mh5XhhhpNJet9l8dRYMwkbgfVtzWVzKfnYgg62ScQcxJuOWN4LYmQuKviPb1FfrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgIXV/oBG9/X7dLPdwfaXMbbfHUaHc08R3rsjzN89OU=;
 b=Igv2AyHce9nTnLVliuAJAMtKfvtUMoiykoZgxj+cw0ZNJvibBzjci4kD/QQDDLDA5PB4SjrYvH+751WIXyaILfFheymlBZ0xalpjgZSRx5BXb6PepZ6+SIbscgWalTY20SgqY8QWSx5pbVzWcwWujIZOC21fHPk1UkG+AUnREf8=
Received: from DB9PR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::28) by AS1PR06MB8513.eurprd06.prod.outlook.com
 (2603:10a6:20b:4df::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:59:05 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::7f) by DB9PR01CA0023.outlook.office365.com
 (2603:10a6:10:1d8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Thu, 8
 Jan 2026 16:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 16:59:04 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 8 Jan 2026 17:59:04 +0100
From: Mario Peter <mario.peter@leica-geosystems.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>
Subject: [PATCH v2] usb: chipidea: udc: fix DMA and SG cleanup in _ep_nuke()
Date: Thu,  8 Jan 2026 16:59:02 +0000
Message-ID: <20260108165902.795354-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Jan 2026 16:59:04.0649 (UTC) FILETIME=[18724390:01DC80C0]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9B:EE_|AS1PR06MB8513:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 645c6bff-aa6d-421e-6dce-08de4ed73b23
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S0ny1/DEFSxhZ4z5gf6yr5j0lj2XhPcgSTgwNFy1AEC795G6wT1t48/vQSSo?=
 =?us-ascii?Q?3CWfACl6MZvnodlma5e2ik80nlgI7wslwOMUOC5s6YJ3hdw8vv4X5eT11sqa?=
 =?us-ascii?Q?DxHCcZuMJySg0mdV+8uzQIDJHtuT1+FRpiLTnPVuIgQrthsTSrYcbfFWVt/v?=
 =?us-ascii?Q?nAnfNd7IfgX9LqMc+sKWNmD9w+4+POqSSz+sm/4/Xh4Ijdn+gJhqXg0Jvi2M?=
 =?us-ascii?Q?nFkngOGGO4Wsy9Aa2KYLTYCIJ0acvhAMFSHCJaYEQS+bb087+YUoHnCtrvtt?=
 =?us-ascii?Q?9ywX60iTZtoWjcybg6B9xmG0LF15974YfLju/cOsFUWskFL8JwcVMN5XvLBG?=
 =?us-ascii?Q?n7cTBTdIQHdKkw2r1TkrYNelYN5FVsSL+QjJlbi7fUak/WDV9rPg1AZXCeuv?=
 =?us-ascii?Q?2OjYguKqnv8IdD4YHwq+lX5RRbkT5mxNy8aUNHwch/qBaLkoYb0TP1bWFW9U?=
 =?us-ascii?Q?wHJnGQFzg2SgqugYKXhrJsuaWTlPoFSQu1W366x66aVHt9FibEtMGOm2/5sT?=
 =?us-ascii?Q?XZ/So+KVCilO8jfP7/yS3ANYba3rJrpCM1yd4AnvxjoAd8PKjbRg/23+/pBs?=
 =?us-ascii?Q?4YuIHiokbYukSaqLPBCp55B1Tj9joCnF2DNn9U5rOpDBAIE75M2qJA0zClYK?=
 =?us-ascii?Q?5/bDyevZElYguqPLcRSiOBi+zTNE7n2Rt/F1VDVByRCSQ/otl+aFtH00wgIM?=
 =?us-ascii?Q?DUjUXF1/ETVjok7uCJhqLj+W/GcwiJWTRxPiQTp+Q6OelvMrsaFZGUtn5jwa?=
 =?us-ascii?Q?lRsjgxREItxbDCZtSAWL9J1VxsN9kTfbUxf6xi/DtRGvaPFbAwpptc2CUfHl?=
 =?us-ascii?Q?dBP5+Dz3u+Ge2XZYPFmEdklwhpZESP9JP5G7gC57YAjINosea7uN9xOXxrAi?=
 =?us-ascii?Q?X9/qX/OHmu39EMkfWDTNyua/OsWoKsqGSaMAqYkekFp9Uowv0n4M2+TjfE30?=
 =?us-ascii?Q?NlQB/tkijU22E0B7UoFPKmn7NySbq+UC4rowd2G6fploKTSYxtA3biGxE+74?=
 =?us-ascii?Q?NokZOM7hmYAl+Ex5Zu9exzX9bxc0IpagPzRgyCfRMDYBc8W1h0wol4VX30GB?=
 =?us-ascii?Q?+QH4TqFaYaFcudmRjehWy/Mrh/uJaQ1z7AZdeXbvswo2OJyC2N5HqECUmNWK?=
 =?us-ascii?Q?k+IUQQYHCATh9ppLya0Ls5wg8lM2seZ/QHuI+LlshbsNmqWoe6+MbwswRLq1?=
 =?us-ascii?Q?Rtq3bKs4wASdyDaFMiPIwM3F26JkvHyoSUs4aIRo0S+5ytQrHv96pyk96u+B?=
 =?us-ascii?Q?eta49QmZM9+38oma9zdILUlVkAgmEKZuI+WjA3vLlHdsFfPGwTJ9uk9GLVuL?=
 =?us-ascii?Q?s5p31agHJBYaBks0crbL30Ff+oJw0qWznONPh6E/B9OFT6OLISg4zex5lEhP?=
 =?us-ascii?Q?6MHRmwFW/6sxjKHEufi6lUG+7m1WDqwLmnt+QtItZzlm4Q6soXLt4FIlrF8c?=
 =?us-ascii?Q?gC3bwcxOrebRoOtNol+6FxUAxFJYFrKaKr+Bzss+J2gZ2G5LwFXfUzKRBmzi?=
 =?us-ascii?Q?eN0ZBnf7hBi+8vTtBpuHqut1bMGoDDTncRD8DOaBbAfiCBdYk5eFlWd7umPk?=
 =?us-ascii?Q?cses+fcQeIlqBr6BM34=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:59:04.9633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 645c6bff-aa6d-421e-6dce-08de4ed73b23
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR06MB8513

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

v1: submitted (https://lore.kernel.org/linux-usb/ofw7h7s7jbhzjzbj6fpkzp5m2av25ovlyfp7fdlcvt2dd6x6a5@kx3rnlojdzdy/)
v2:
* dropped redundant req.num_mapped_sgs check
* removed obsolete brackets

 drivers/usb/chipidea/udc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 64a421ae0f05..c8d931d9d433 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -931,6 +931,13 @@ __acquires(hwep->lock)
 		list_del_init(&hwreq->queue);
 		hwreq->req.status = -ESHUTDOWN;

+		/* Unmap DMA and clean up bounce buffers before giving back */
+		usb_gadget_unmap_request_by_dev(hwep->ci->dev->parent,
+					&hwreq->req, hwep->dir);
+
+		if (hwreq->sgt.sgl)
+			sglist_do_debounce(hwreq, false);
+
 		if (hwreq->req.complete != NULL) {
 			spin_unlock(hwep->lock);
 			usb_gadget_giveback_request(&hwep->ep, &hwreq->req);
--
2.43.0


