Return-Path: <linux-usb+bounces-32078-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC86D0499A
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 17:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5382E30124F3
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 16:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747512E9749;
	Thu,  8 Jan 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="hsoXPE6N"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A32E7637
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891469; cv=fail; b=oqN0/4a7M9z7YCk9DwZJtW9MJjib8tHDgIvNZCWz5qVeV3lFXdlwQM6jA3Ixg7xcojhJtF5oH8xAjx1PGte9gkvpNtOybnTWUHfO7KedZsFL/LQdOkPwGPeIU2i/l/2D2fyO6BMXhoB4ivBpI7vOy4Fb9W3UpLztc1k4hn1Dgps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891469; c=relaxed/simple;
	bh=G7O2b73o9Auak+sxqFaIAlDumcbUu6nqp3t6HJLECq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acP2GBT1qUcsspPGQUhVE0Tp/IOvKxMbE5p7e/5g6UE2PZ/k1OYLvM8BtH3F0WGYbcQUNoE0bh10A6Hpxl2jArA9+KmQj/BwMtx6PTF6u8eHfw3rJLYqZr9/t6UwOwZkpi6GHvB+WBWGs1UHUejyv4aMVPY3lqH8gXAXRJ5IWm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=hsoXPE6N; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wi3pqtNYWDMMgCTePqG5ncXRkwh7jAc5uYSQID+eg9I/tBkd2hpMgdNZM7sIpIbNXLIFsJESKWi2am6v2PWA+WJJTvGdN/0Z98+qbixw4OED5TqV3g+bKMPQ2f5VJ6zAmJ+RdPnjO3J/0dtgTHLqD5BdR6E4kn7jAYM5NNl/2PVjlcMO3WjwZMVOqc71gzgJFEBjRJOBrE1QaECi1N1fpvV9/YkXU9AIPdxfn3F6+En5M7Ex++JthDXf9aV+OgYUxp28UHKiI+8uSsy6fSryDWe31dOc1M4DtovrZMDdeS4xlnDe09lwnWipNo9+hE0FHn4rdysCsbOq6x0YZsmAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5P/xubNAWueJo+m+96z5FM/QBkDCOnakAhWMvfzV2hs=;
 b=hVc0zEMo3Cl4wmwGqh0slui7+NAX044lNfqWzJMwgxyz4KcLNFhuDWQUzFZdMVFRo7atrNx4l8/PTeO0xDAq3vJ5CvaaqTHZ1suH2MSiFTRtJ8/Bkg+6X+B8ROLM4Yw689We98LvQIplVfs9rcccDEi1IvzJT8sQRcuiY5+vFDGaPo+GRxmdcOuQbq0PIbtqdgOLpRCwtPubf+iG+yr8vRexiw49Nk1CoQEvFWVJ6d4AbWHTbxCwMQengUbnHYScZR+GcSQjQe81MryqRpPMebM31mrGjseO3a65v3eqYfwAIZNX5bxftIC6GemMUOhxGDhnjGU1OPAud7pDjmAK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5P/xubNAWueJo+m+96z5FM/QBkDCOnakAhWMvfzV2hs=;
 b=hsoXPE6N94a94KzHqlusvoxtNDlFoWUDNK5GpuVOjnH3UYQWz45VR70I7i1WXWgo0Tl0xlbwo0hh9Wvm2BbXSET04NwWFe7n9uOfnJTUfU/H1vPgRfREzKyT3Uc/B+Z6bUUIOV3joyIRGDO/Uj1ebpzl4RhbZ0InRBOaWZ0XfDM=
Received: from AS4P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::14)
 by AS5PR06MB8779.eurprd06.prod.outlook.com (2603:10a6:20b:67f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 16:57:39 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::4) by AS4P191CA0041.outlook.office365.com
 (2603:10a6:20b:657::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 16:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 16:57:38 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 8 Jan 2026 17:57:38 +0100
From: Mario Peter <mario.peter@leica-geosystems.com>
To: xu.yang_2@nxp.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mario.peter@leica-geosystems.com,
	peter.chen@kernel.org
Subject: Re: [PATCH v1] usb: chipidea: udc: fix DMA and SG cleanup in _ep_nuke()
Date: Thu,  8 Jan 2026 16:57:38 +0000
Message-ID: <20260108165738.793331-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ofw7h7s7jbhzjzbj6fpkzp5m2av25ovlyfp7fdlcvt2dd6x6a5@kx3rnlojdzdy>
References: <ofw7h7s7jbhzjzbj6fpkzp5m2av25ovlyfp7fdlcvt2dd6x6a5@kx3rnlojdzdy>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Jan 2026 16:57:38.0618 (UTC) FILETIME=[E52AF9A0:01DC80BF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|AS5PR06MB8779:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 836a0339-11cd-42af-bde2-08de4ed707be
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?skn9dlp/HQbofvImDxwKKbxKImy1VxBQReU4F2W0UNIVZ/+XcsyEJWGdUaUc?=
 =?us-ascii?Q?kLIcqYg6hBKJRJfEzweehs69KH9uDBha3s9W1z/apfJ0zxaNHVArI4p95xNL?=
 =?us-ascii?Q?IH/6E6+OoVuPHAEgdw18vrBlcmROJVJxf/6uJbr4PvxWH4+cP3siW0KlJ2yU?=
 =?us-ascii?Q?lYiYQGAZUJINyKmQQV9O9iLSwqXLGtSqMfGGVjco/Yq57rQRByDOd6czVTP+?=
 =?us-ascii?Q?EtMtKE+yshp96V+3dOUqt4Ph9y1ERIyOJrDdQSkN3e3+ReDpXfVZ4thR60kZ?=
 =?us-ascii?Q?yLknkQ4TgRh+C3RlIxOCT0mTd0ftilR2PnVSNuHhv2OBr7S0JmB8pXVtrKfq?=
 =?us-ascii?Q?QgfXFwRPPhqSXNu9938z8CMyPbL2usvnzPNYrh6Hed87kAPDX3OQTmADy/yd?=
 =?us-ascii?Q?wwWtQLPC1Vfp4zhdNoWFF99hvVmF1wlu6aJx7EGvrmt1+BIbo9A212jh4dDz?=
 =?us-ascii?Q?UJ4uex3tPc1CIf9CGGcpw96KmsENAF6y5MU+gsMuyCYMD/3waBYQMyahi0M5?=
 =?us-ascii?Q?W8WeCeC5AI4lyqJfJ2sIyfMJJul9DG6wnbxKnBSvfSLA4RGTr+/mdfZ2ljuU?=
 =?us-ascii?Q?fibwW8iSgthgUWhZ71IoQS3BzbhdGhTaBkOnILPJ/fkrGVm6J8TERp6h9oRy?=
 =?us-ascii?Q?oUVlxlMrjKdEO8pEkPK3InjvJTkHAyVdubX3cUuvbilCxn+ER+3U1eB2Ay/d?=
 =?us-ascii?Q?hWrnCIqwgNWx1JyZBk4kcfz+XueVVNtOhcAIdqA59ebTycoHd0Wb0AJDlAOi?=
 =?us-ascii?Q?Ey0Z11x481sdFZqafQjOk6Fp8bSIwBZLUo+HpSSIG1pll/bk5gDct2a7zdyu?=
 =?us-ascii?Q?JhyW4XKdj96Bu0jbU0LThovAblDge8+cAjOxYwpWLpFh+rh41wuHgkfzqvHd?=
 =?us-ascii?Q?roqnM4z1Tp0dH/HLT3k4u93JWbuAedmjqiroahaChbvL9cZFvbIsAF5tM0po?=
 =?us-ascii?Q?ziHOY6RpHmZTQo5zj7K/lueSfSRlM7aJetY8e1L7r88ee6ck6A5jVyhDO/We?=
 =?us-ascii?Q?lBgTgq2zCh8kPqsTswrQZU+xtxCDnBOauzGHizlQrtwQRRXXC0jB/7OuDj4g?=
 =?us-ascii?Q?QpuAQ6io9bbj9471eo2z34/EmDSOUYi0hnVDIRxvR2cLGT3WQKx307nr6znr?=
 =?us-ascii?Q?jQOIJtPklGC/912T9ZJpQZ89LXl1EHETqAkIPlfcZNT1m/jZebwmyYWHHAAu?=
 =?us-ascii?Q?6ACzs8X7+6xzz2RcJ/8mwaHfKDHDFjfxky4NRDjU0EZswrGjGVnbxcu+qtjN?=
 =?us-ascii?Q?A2zAODRW/haL7b+c09z9G6B7as81ir19fXZgoLLbOU18Dcr09co0LcDRaplx?=
 =?us-ascii?Q?mlA5tAHz9FT0qQZ8GcJI8gnt9dp0syBuM/rBq19bp5pGYVnipQfrY7tS+dzR?=
 =?us-ascii?Q?b6FR0A78UQ5ChFDi2fKWN3IYh9Yy8CPW/ylCSfAvl+htPiMFLm0IIG2GVUY5?=
 =?us-ascii?Q?Rsd+c0k1p8R6NxQBGzj4K6Xbix+NFAwpIyfJ99Q83Uv2wi4Lo7/TNRU8vfif?=
 =?us-ascii?Q?R0eHkN9gpvUOsoR2j+kQf2Vi9U9WmN4RSyYHcTA/rIgEbDfA+B5mMhfCg8hG?=
 =?us-ascii?Q?byxcWn5zOrEbi6b7g8A=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:57:38.7705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 836a0339-11cd-42af-bde2-08de4ed707be
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8779

>> The ChipIdea UDC driver can encounter "not page aligned sg buffer"
>> errors when a USB device is reconnected after being disconnected
>> during an active transfer. This occurs because _ep_nuke() returns
>> requests to the gadget layer without properly unmapping DMA buffers
>> or cleaning up scatter-gather bounce buffers.
>>
>> Root cause:
>> When a disconnect happens during a multi-segment DMA transfer, the
>> request's num_mapped_sgs field and sgt.sgl pointer remain set with
>> stale values. The request is returned to the gadget driver with status
>> -ESHUTDOWN but still has active DMA state. If the gadget driver reuses
>> this request on reconnect without reinitializing it, the stale DMA
>> state causes _hardware_enqueue() to skip DMA mapping (seeing non-zero
>> num_mapped_sgs) and attempt to use freed/invalid DMA addresses,
>> leading to alignment errors and potential memory corruption.
>>
>> The normal completion path via _hardware_dequeue() properly calls
>> usb_gadget_unmap_request_by_dev() and sglist_do_debounce() before
>> returning the request. The _ep_nuke() path must do the same cleanup
>> to ensure requests are returned in a clean, reusable state.
>>
>> Fix:
>> Add DMA unmapping and bounce buffer cleanup to _ep_nuke() to mirror
>> the cleanup sequence in _hardware_dequeue():
>> - Call usb_gadget_unmap_request_by_dev() if num_mapped_sgs is set
>> - Call sglist_do_debounce() with copy=false if bounce buffer exists
>>
>> This ensures that when requests are returned due to endpoint shutdown,
>> they don't retain stale DMA mappings. The 'false' parameter to
>> sglist_do_debounce() prevents copying data back (appropriate for
>> shutdown path where transfer was aborted).
>>
>> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
>> ---
>>
>> v1: submitted
>>
>>  drivers/usb/chipidea/udc.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
>> index 1a48e6440e6c..8e1e0f9ae7c3 100644
>> --- a/drivers/usb/chipidea/udc.c
>> +++ b/drivers/usb/chipidea/udc.c
>> @@ -931,6 +931,15 @@ __acquires(hwep->lock)
>>  		list_del_init(&hwreq->queue);
>>  		hwreq->req.status = -ESHUTDOWN;
>>
>> +		/* Unmap DMA and clean up bounce buffers before giving back */
>> +		if (hwreq->req.num_mapped_sgs) {
>
> It is redundant to check req.num_mapped_sgs since usb_gadget_unmap_request_by_dev()
> will do that.
>

Ack, removed the redundant check in v2.

>> +			usb_gadget_unmap_request_by_dev(hwep->ci->dev->parent,
>> +							&hwreq->req, hwep->dir);
>> +		}
>> +		if (hwreq->sgt.sgl) {
>> +			sglist_do_debounce(hwreq, false);
>> +		}
>
> The brackets can be removed if only 1 line code in it.

Removed in v2.

>
> Thanks,
> Xu Yang
>> +
>>  		if (hwreq->req.complete != NULL) {
>>  			spin_unlock(hwep->lock);
>>  			usb_gadget_giveback_request(&hwep->ep, &hwreq->req);
>> --
>> 2.43.0
>>

