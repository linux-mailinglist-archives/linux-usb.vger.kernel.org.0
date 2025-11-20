Return-Path: <linux-usb+bounces-30779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59381C74006
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 13:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 1657430AAD
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 12:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E819C3328F7;
	Thu, 20 Nov 2025 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="NZmpEbjm"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7322E22BF;
	Thu, 20 Nov 2025 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642360; cv=fail; b=f68ay1PT2acNreFrefoxkJWvEuhNm/YSWPZab0hI2uqI6MjGLyOjiStQEMG1mHnLN6pftD8E3sVQEx4DP+E2+p6mepWJtZu0wlRCwzffn6/49AB4JstET4koeHL7Uy3o1ESbLHwwMHWnCcDbsWUCoVMsLijgIDlc/nUL1ppJ0YQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642360; c=relaxed/simple;
	bh=c9ysvIadC8T/4KktXo6m2eyPVbOhVxWajPFt8zyuzxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UJSextrE65Z4KrjLHXPEg8ANHQE7xs3TCOyHtqq7ex1JCANUgRgZdlCVAalfEb7sr046gCEZfErc2eOZ0t/5Cb+pTXuIM9adrwMFzoUFEUiFpF309dmHBALJSQxRc42WrOVmwD4hGzokaGyaScD36cHd/jp/xlbg65lgGru+jok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=NZmpEbjm; arc=fail smtp.client-ip=52.101.65.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaEcqwaQb11wC62mywMpmXfhqqtMUgkxLUPYTb3hZkXxDiwFiXfHSYzitZD0rhqssJkdV1sopAAZIIINDxeVtO9x3F2Hsz7qBvO4RRjvQWfZzIQ+CzyoRFuL6G7zBb6jbbSGrsis270KOdVgwJ4LhnefSfD2ZSi9X9xPOYHWjEfw3KgYFx3WQdMJvoEUOAMpabTCJX3mPc6fSVkAyTjXR6yGh4jgeilrM4BK9mHNNWYoQ6MqaSd3kb0oITgess9zkrr8l6A51YqWWRys4dPsWOAuHSV4HArvjuIj5pvO4CHmcYr+ZsSyLocLyxMuJY2sMcfonpR24WaYJoc7pUvhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKz4kVe2GSKwdWDe2HEXex90qsW9GfX7q3B55Uw8Bhs=;
 b=XGMsx7j/5RVR8VPY7O4Bp49N90REjCJAOZRchNcGmSFGl0z7lV1B1SJ4zE4rFC7XbjX85ay1i484d3OD6Knge14HeAzCDPgC3VBj7bFtfPur8m3LVaSBG9GVEAgsxTLdMJF/zamZynSjnSC6r3Ys5ixK9lBTeTYW2e6BYqgU56oYk6GAC23sH9zkGwSZaMW+WU78kzpXcCWx+YPoIA9QYi9G2fBrMhO7HCVCzAcbd+uKuzaDCfm+9AQE5qt3rv8to8VFwkCBdMKJ+B8jW4osiQC6jTLN3kQsgNSY/rBJhfI8txx9fkL6p740ioi58fRietvBuK4NorSgGJISJFhoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKz4kVe2GSKwdWDe2HEXex90qsW9GfX7q3B55Uw8Bhs=;
 b=NZmpEbjmKoCUTlFH4Dbl5suKLIJ6Ss36TQWiFbWMqA09fQEG7E/xyp2H3DRmXSgHbKTlgkDmlbz66VPXrj8rgFDvAnPcZt4DnzGac7NuZVX7DxcWFKEYgWNsg8YKd52LKZecB/Tx6SXj2R7LUETANCb/M85AFBGARKLVfw9F4xY=
Received: from AM6PR10CA0050.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::27)
 by DU4PR06MB9596.eurprd06.prod.outlook.com (2603:10a6:10:568::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 12:39:11 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::cf) by AM6PR10CA0050.outlook.office365.com
 (2603:10a6:209:80::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 12:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 12:39:10 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 20 Nov 2025 13:39:10 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing-wu.Li@leica-geosystems.com.cn
Cc: bsp-development.geo@leica-geosystems.com
Subject: [PATCH V2] USB: serial: option: add Telit FN920C04 RNDIS compositions
Date: Thu, 20 Nov 2025 12:39:08 +0000
Message-ID: <20251120123908.1865387-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Nov 2025 12:39:10.0186 (UTC) FILETIME=[AB2E4CA0:01DC5A1A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|DU4PR06MB9596:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c219df62-2b3c-46a3-9f0e-08de2831cdda
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G64XdN8RBo16q4qoXdy5bRT6m453wzyz5Oo1NWMunJAtFNA+R3fAuK9dAbuG?=
 =?us-ascii?Q?Cylhi1j7sTUHYVJfZonEulmWkpMUnuoHPXn1MbweSz2T7kyKeK0phHII+tlF?=
 =?us-ascii?Q?bs0tpATHunUtUHf/qjLbWb+jdHxE76DL+HRZ3rjQFkMjGM/KwR8DCA5M8e/Z?=
 =?us-ascii?Q?oShGiiVTUCuq+0ZXaKybzJHcB0gWXMwtlblNIBEgrJ9sgKH47foOFmqrqmJR?=
 =?us-ascii?Q?fw/5FtnGD9DkUNcpXvxlxlhpSk8oN1tB/Q9zfFjLWP+Sz7mGnAZ8+CbEbfSW?=
 =?us-ascii?Q?dtTCLjN61QWeS4bWTgHztkq/5U32+GiE/bZL4b+a7dFjuIM6xUm6U/rkD6P4?=
 =?us-ascii?Q?W7KAX8hzVNC1RDGzZEG0IT5ErxeeGFiOFQWoSf30lUIR762ClQ6vlO8LUA/1?=
 =?us-ascii?Q?cEQPl7zQA+SrCKuqkWKY+cCzZes0DOHbBNEvuLphvStl2vm4JaWpcMp30gWO?=
 =?us-ascii?Q?KNLufaMhfpLp5gXu3ysh+mvzTy70W7bSRXZhrSSsSiG5a/71JZ58fpie+4C8?=
 =?us-ascii?Q?TwL2dGCfMAtdrEcEgfMUI+8rzRtmSRUtrLQKYYKvVZysIUjGTjuZoU3RrE2N?=
 =?us-ascii?Q?sIBqja8FXy2PZi2rY6iWnx2bYQ4yHOpchLawgFG8CKyIhlQx+tcm5kY1HETN?=
 =?us-ascii?Q?hzNipAqbczJpeYllLvIRRTEbxvubaULUCEqJ4FfufjG+XFqwQdOqvN9H8EZq?=
 =?us-ascii?Q?QvNZxYR7+OnI03u18KCroYBVWPq1y9UMOGpDBJlpF/Y6wsfF82RBkt+loNSI?=
 =?us-ascii?Q?PW25+GgliCUeI/5VDUvGMsN7raFvMHnDDu8p9d8Zx5aq90rXLrTceYMCl9Q0?=
 =?us-ascii?Q?2uW7mkNM0GhrT5sE91Mk/TImyyGbP5Iip0+5hUKQhqiEBdMZ1yOOBtA8xu+4?=
 =?us-ascii?Q?b7OgLz1om6U1UjQMokgroEsQU7z8ZYC8gtHMLY3+/SwcGQnUxOLgXggcl+XA?=
 =?us-ascii?Q?a6IXQczv5goTh0YDusGcvk5uYweTtGHHrUgwbnZMtCMTrlTkz+iNMigAmRXz?=
 =?us-ascii?Q?8AwMxsjHqaX65gtMgFJXCuMUZF8rnpV4pAfNJCtnItasRv3MEfPLYO0QO4wl?=
 =?us-ascii?Q?gaOrlo7B1+883s8rCvyHDMEnt26tGRhxq+O0KS/olicg4W8cwlQfw4p5S25X?=
 =?us-ascii?Q?Quqvp1sca02oHzI0hL9s7D3dD2+lptsdiKjx0eukAoEAPWPSD00lUy6SFuWe?=
 =?us-ascii?Q?XlJwtieiiJyGwqB08Ia0Sd2LvRPz9XYzPYNEw51U2bXIV8fekOlTmMHsM2xC?=
 =?us-ascii?Q?B0lj+DPTtWuvfyOGAyXropF4Ghkenv4qhUJW6Hp1Zu6RzwxxvINBuqxI/es7?=
 =?us-ascii?Q?cAxcdtHLrbwxtZHVXv3wIBTjUwZgceLPqhU1sdnl/SqzvJrW1Gso8N1l42Co?=
 =?us-ascii?Q?TmqmmKlZe1UW4IN+WmJS70aLH0VEs8HW+iXFoRkrGshCN9qekwLTxlC/f6Wk?=
 =?us-ascii?Q?ExxJmer4BcJhpeU4ujnopYohgjVOtMgvJ1JTdWL60Eb9UcUkjhqXtrf3xgXk?=
 =?us-ascii?Q?AGGH9m3HSa5EUv1Y9PhzsZWBLjrh9HdzpYjdEF/APhZHlz7d2Gdfxi82qYV2?=
 =?us-ascii?Q?WM6CVAtdgYTOS0SLWy8=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:39:10.4304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c219df62-2b3c-46a3-9f0e-08de2831cdda
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB9596

0x10a1: RNDIS + tty (NMEA) + tty (AT) [+ tty (DIAG)]
T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  6 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=10a1 Rev= 5.15
S:  Manufacturer=Telit Cinterion
S:  Product=FN920
S:  SerialNumber=76e7cb38
C:* #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=500mA
A:  FirstIf#= 0 IfCount= 2 Cls=ef(misc ) Sub=04 Prot=01
I:* If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=(none)
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=(none)
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

0x10a6: RNDIS + tty (AT) + tty (AT) [+ tty (DIAG)]
T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=10a6 Rev= 5.15
S:  Manufacturer=Telit Cinterion
S:  Product=FN920
S:  SerialNumber=76e7cb38
C:* #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=500mA
A:  FirstIf#= 0 IfCount= 2 Cls=ef(misc ) Sub=04 Prot=01
I:* If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=(none)
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=(none)
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

0x10aa: MBIM + tty (AT) + tty (diag) + DPL + ADB
T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  5 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=10ab Rev= 5.15
S:  Manufacturer=Telit Cinterion
S:  Product=FN920
S:  SerialNumber=76e7cb38
C:* #Ifs= 6 Cfg#= 1 Atr=e0 MxPwr=500mA
A:  FirstIf#= 0 IfCount= 2 Cls=ef(misc ) Sub=04 Prot=01
I:* If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=(none)
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=(none)
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/usb/serial/option.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 5de856f65f0d..ed37a976e871 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1401,12 +1401,16 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a0, 0xff),	/* Telit FN20C04 (rmnet) */
 	  .driver_info = RSVD(0) | NCTRL(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a1, 0xff),	/* Telit FN20C04 (RNDIS) */
+	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a2, 0xff),	/* Telit FN920C04 (MBIM) */
 	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a3, 0xff),	/* Telit FN920C04 (ECM) */
 	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a4, 0xff),	/* Telit FN20C04 (rmnet) */
 	  .driver_info = RSVD(0) | NCTRL(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a6, 0xff),	/* Telit FN20C04 (RNDIS) */
+	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a7, 0xff),	/* Telit FN920C04 (MBIM) */
 	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a8, 0xff),	/* Telit FN920C04 (ECM) */
@@ -1415,6 +1419,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10aa, 0xff),	/* Telit FN920C04 (MBIM) */
 	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10ab, 0xff),	/* Telit FN920C04 (RNDIS) */
+	  .driver_info = | NCTRL(3) | RSVD(4) | RSVD(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x30),	/* Telit FE990B (rmnet) */
 	  .driver_info = NCTRL(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x40) },
-- 
2.43.0


