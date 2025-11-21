Return-Path: <linux-usb+bounces-30788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B28C77653
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 06:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B7FD34E4145
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 05:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA1E29D29C;
	Fri, 21 Nov 2025 05:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="KLO2gn1l"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF7F1C5D59;
	Fri, 21 Nov 2025 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763703606; cv=fail; b=Nr6bwBmORoegsDxlKmtoKextGiGqDaX+Uu6kjQ1WFNtfkv96kOlnOBCd3Ie6w56TfrKQhrtebgmdSQMXI1fkHQTy8gvnxvnhULrPhR3oTwiDHOTRgiDsa3dgIbhAK7rBWHuydtyZlSJ0UlVt1htVE4qA8DOOyAOCtfbrd5fH/jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763703606; c=relaxed/simple;
	bh=W3Y2DGEXM+nOSbarP/Q3mD1PFQ1sTySIJi9lphcN8AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hg3vKdV1iwTiEpbwJxhEKGEpVSad3vUuuqFzbtw4Db06KQWpifmdUhitKSxBF/76MPcmBjsMS+KRI6l5ZDPCfiddMULDkKzLh0WSoiQOebYygE3a4M0pDCsC8GKMZPIvl6BQEYGp0BBxAipnn02yF1tPp3Bpz9vRoY/deXfUKDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=KLO2gn1l; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXFIJ5wlQck/xnmzXwdMwUCFuzwKM7l0blaoOJ5QUUWMM/HrTSvciaak791iaiLZUBEKl26cL8EKfHLmbNQm3n1BZ+S8bK9CZA4T1KaRNB08q2dSGN89cJFpavDnPQKv3NP/21WQrfXnM0raTur5GkQFzDdlYMI9WI4yIAE74Y6rHmKiqKgGeSFbatby0EKRbnfqzmTNcbKhHVTIldGkuIRJqgwqskscUCg4+lc97e0uPqbXuCTKvjJL3JS8vwgErPAz63bGRRLtIupjxcqV6f2uTOL9yT5iSHmmiWHntNymzRguDOYlA6chAjuw2Jr7cLiBmdnI91iUHMDjx5ZCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sudjpK3SbrxsY1xWsjPUdeRcaDKKRgwu76I52x8FZlQ=;
 b=B0LJbU+WZwiAcsX1PBCV9PW85QnqwfPQNKUq9SJ/CY/TvgPTXz2M/bTfhPzd/CMJTvSduHfixanUYZd/i2ovo7EyY0Njphxy4s0lznb1G4HT+eHCBhqQ0CS+ICW1JW3oLcYd3GTT1hbn/bJpa/JfcN0+3u07CHLQ2LmKyz5GbpezrdYcoEPg0jBO32aHtXGSpf9AUnduy1CPDOVNNnX4TNBLZ75qZ18jzZBu7n47Nxz39cRqrDLJIgePtdB8WjbuIC3zUTM3NI2kTOzHpMftTZAMyWf55TpiVV6cNRk/GonpAhthjCHH4TgJZAcca16EOyqB4bmR9xDg3o3d5/KmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sudjpK3SbrxsY1xWsjPUdeRcaDKKRgwu76I52x8FZlQ=;
 b=KLO2gn1lY76CzvhcBFs4EpLfgEWNWaFKGRbsK+9FC6C+C8+54Zgi9FGNo+DNIC+AGhUhx/ZeaDNTtraHSzO7Zn40ym4NyRNi+H0aR8LwI2YTva6WtHPLnUezBF016CzW74W3Y4b+udQ/EjBTJTfgmtS3Mfw2QuU1E6SbVg8TX8o=
Received: from DU2PR04CA0212.eurprd04.prod.outlook.com (2603:10a6:10:2b1::7)
 by DUZPR06MB9034.eurprd06.prod.outlook.com (2603:10a6:10:4b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 05:39:59 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::3) by DU2PR04CA0212.outlook.office365.com
 (2603:10a6:10:2b1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 05:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 05:39:59 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 21 Nov 2025 06:39:58 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing-wu.Li@leica-geosystems.com.cn
Cc: bsp-development.geo@leica-geosystems.com
Subject: [PATCH V3 1/1] USB: serial: option: add Telit FN920C04 RNDIS compositions
Date: Fri, 21 Nov 2025 05:39:56 +0000
Message-ID: <20251121053956.263364-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121053956.263364-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20251121053956.263364-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Nov 2025 05:39:58.0208 (UTC) FILETIME=[45D8C800:01DC5AA9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|DUZPR06MB9034:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e276bfa6-490a-43f8-99e0-08de28c06910
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?axpH4FHZTGCDQWFbUbCBXDfWKKe1G2VF99NwI5jGQi2JLE7if0rmPGpcJQcn?=
 =?us-ascii?Q?eHVMFl+jw2aukw3cThu+QJWFw1oxEWZoxxj4lKbBHCba1ztMLKIjJ090PkGB?=
 =?us-ascii?Q?bnZyhkvHnacQlRCka7uRiq4IjHlCCstII1QtHvEIlehf3i8rFjnYUipkK1NO?=
 =?us-ascii?Q?HwJGlbiyCyIH+u3H+LOFQ/q/lSZimhvjWeBeT4+0nxvFGzIzNjvyYhbt+r+V?=
 =?us-ascii?Q?+eFr29H+tirft/3n3FgUwnnleKD0tUBURB8MxBdVPZEHKyXKv/TlmyIoR/m9?=
 =?us-ascii?Q?e+tjkLouROZBDHUzCkSq+glNHZSKihEk1jGySU+6rZqeansj3WDfM0RYYQbC?=
 =?us-ascii?Q?X+yZEnd1Yxnw0ntuwEWzojvs2xWYBv/2dGl6+mN9MFP/jyMokHmZZNHEXb3w?=
 =?us-ascii?Q?0urqRGfkMBYztGJwLP3dUxcraHY2NPylO94V5LbZL7ND513GJm41C3zub+2H?=
 =?us-ascii?Q?lvWzYfrIV1wk+K+w3LMgUfHNrOP05XT6HDPXAuQAyCb+y3GRhaHVBiuCeDF3?=
 =?us-ascii?Q?tczFtGgQ5vGMABf6Mvo3GgE/Nbm2/q9eBrW0tc7mrF4hQMsi7a3Cjwl3FC+3?=
 =?us-ascii?Q?c/q0aSA66SZPOyCupsiqHFlD/hriIxjvzu6cowNkCyIm6WLe9R0j88pLrZtR?=
 =?us-ascii?Q?qEBXsO2OS6fgjrykIYaQ2amkkAxZE9XSD6gtvwuiQEiJr7jSieUsBId0CTG8?=
 =?us-ascii?Q?Nhc6B887xUEtP0gPzWIwK/PrInJCoU1Y/UpA2fd44OOUODuyEGhsNmWVTuEB?=
 =?us-ascii?Q?p8vFVb/yBsb6AlSC8s1RN9aV/g3t+/jGSu9feiRATdtceX7QePVcQ19NXT78?=
 =?us-ascii?Q?jHNLWjet4icA+ZcRFcvJnt3cUDrFWV6zLybFGTg9WZfags1CknDaJWk2OZDI?=
 =?us-ascii?Q?6ZGYKrKB8LjCGwvOfsUeBcdQ/hCZXUxTeFEAAAl9F0nDXdERcoo6kYMK0q2t?=
 =?us-ascii?Q?T51lcS0TFX68QzyBrbDV34W242SCE3+hU6+TF+P2SXq14v8mHyiw5qUe1Wh8?=
 =?us-ascii?Q?lTNPHXFVL88njrfkZK742oESyjPPvIEwbk5L8vHSKaXho3OQ/spPwwxNwpRH?=
 =?us-ascii?Q?XvWBvEv4gOhSWDzLd456cc0w39leTOsYtsfLCGDzgoHYyH5lTS/f5t039qEA?=
 =?us-ascii?Q?29DOoVyDp/D5KoeOKExHuEtV48zxwEN3wIxymr/PWHTkZ+2GxEBwRWXhveXf?=
 =?us-ascii?Q?SX5DBEbxyyj/SNtwSHPEz4Xiau9kMcAerORvraxLjtLRCcj7ch3xIVoKZyCd?=
 =?us-ascii?Q?xcnx8HxYZhulOTESCbLT5af0AB7MvSN706pob7QAaemvyybe9BONc+A2dehY?=
 =?us-ascii?Q?oudAwyewLREXklx4djOMabRBhGi1bsHuCgRwRrUZfY8iZZ8Tc6l7z6ylxZZ7?=
 =?us-ascii?Q?ETZmlHAjIkcaf8mGLxHBDAD7Q0MArWnR/3tenMNcaeCB9FvYz1GYvugpX1cF?=
 =?us-ascii?Q?VnYJLZzEQB72NiaF/VhEtOb8joAXHYERYOA3/LaljHVMvd4nLUE6WuaGV1Ao?=
 =?us-ascii?Q?trazfDO+ajc3nNHacZohitVTu3TeC72x7BRdrbEgJuBWWdz/XhqIsEuCJ9he?=
 =?us-ascii?Q?ZZAhUeDbYUDk+ArZlwQ=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 05:39:59.3288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e276bfa6-490a-43f8-99e0-08de28c06910
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB9034

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
index 5de856f65f0d..b521d47cda53 100644
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
+	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x30),	/* Telit FE990B (rmnet) */
 	  .driver_info = NCTRL(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x40) },
-- 
2.43.0


