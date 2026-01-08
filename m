Return-Path: <linux-usb+bounces-32070-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B42ED03FA6
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 16:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38AC93010515
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 15:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76755302CD9;
	Thu,  8 Jan 2026 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="gPKA1kyJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B249F33B6EE
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886407; cv=fail; b=ibMKKH0Ti1cl4qR681qMhjDorNHgGNcLycb00VnyyxopXBAiiVPzrHQUfqHgo8a4ctS9KQyllZiWUSqYZIAgEudp16LcF6Wna4RtAjvALq82uLD5okh9PpsvvnYCV2Nyc1Z1ZU582DfMTpcW4hCc1HqxnPg6pFUDi8UDYSG907s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886407; c=relaxed/simple;
	bh=h92g+GBwnxoO3pfLNeGqTfaxQIdU33G+aWg+N6+fqzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LNAmt0L1q3Cl5fof02RrFocTWa8TZuCPkFqVtVhM7xVOqPXFOIY80xgph63aUkzc1F8g46DeArw/3YhfdbdxCM5a8J/vQwa2EtTyQ4wXRwxhJd25EcM/J16ZFivWTudQ8H1KzJzx0N1AJ5abiRqJ3K/dGX/S6a0+ojLGqC6YFwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=gPKA1kyJ; arc=fail smtp.client-ip=52.101.72.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+fLq63hwv/o9zo5aQZHzzAVPC9wYapUnX0bkIKF+PHL5I+umUgJq9vMPWZY8poHFhjzX6R7xXJs/DEdVmchLweXy53UdKBOBdRAN+EAbUSaNgwzP4uf1XVSDHjCN16RW42IJcC2mvPBkVjCYdWkNL2Nt+uw7pKzoOK+dZ7pUgI+eKTvQ4oX+BM6MtgM79rLXORM1y73Z04iDpSlZvukJqAQvOCdV92VMC3ZfQ/WiLAKn0FxYOIig2XgvHy9CGyOEqrX6RkaHxCGDbMzFRtiqZY/UY9SP887yRa/ITLXU0Q/RZIWbpURhkklVLJvh/SplAR5ucRImhjBydspoZDUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h92g+GBwnxoO3pfLNeGqTfaxQIdU33G+aWg+N6+fqzY=;
 b=lyp79lcbSPCrDGwUit12RHWUDNAa5NbrZHplqoY/1DUJ/Gp7Jj47eeaqzJEsXmqDV/SPWEWOqbPzLKepChCSzoxkw/XW3BKO1de4GeOkB/73OGotnYSyNnhqhk3sCQHxlSaI92E1kLvwzoPOX7rqR5MhQzCu48cVig9hhj1e1LoztUYhByVa2INQnMdl4UXt38xjA7u7KMwB7dcxC3ePXBYSPPXqoDtA2cnQIfum9jMeUPBhde7rsI7J2VG5XuRGIYijxrhaVNW5NYc6zh4NOPSuJtt57iMrjak3OnwbClu9hPNpk9voa3n5Mh/+icJA5MSWcIg6Piw/96KpmFQ2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h92g+GBwnxoO3pfLNeGqTfaxQIdU33G+aWg+N6+fqzY=;
 b=gPKA1kyJHW4iCdHv15O7azR5O/W7do6R14kbnppCZb5Il2/j1bXtdDLPjDqhCrekQIiywsohrkCQDDuafLTvGW+WFFeKlEzxc9Nv+MPAoBJ1ildW86DIEw6cpmwcaHmbhue7Mde013QBbSzOM1WukBvhvYBwoxE82XsrS3M9res=
Received: from CWLP265CA0293.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::17)
 by AM9PR06MB7234.eurprd06.prod.outlook.com (2603:10a6:20b:2c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 15:33:20 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:401:5d:cafe::17) by CWLP265CA0293.outlook.office365.com
 (2603:10a6:401:5d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 15:33:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 15:33:18 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 8 Jan 2026 16:33:18 +0100
From: Mario Peter <mario.peter@leica-geosystems.com>
To: xu.yang_2@nxp.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mario.peter@leica-geosystems.com,
	peter.chen@kernel.org
Subject: Re: [PATCH v1] usb: chipidea: otg: use autosuspend in ci_otg_work
Date: Thu,  8 Jan 2026 15:33:18 +0000
Message-ID: <20260108153318.1705831-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <zuzsjr6isq6i5izw3rkyo45opyikiqjmy5xk7flpmlgmqb6mgh@rpbdvi3s4u54>
References: <zuzsjr6isq6i5izw3rkyo45opyikiqjmy5xk7flpmlgmqb6mgh@rpbdvi3s4u54>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Jan 2026 15:33:18.0297 (UTC) FILETIME=[1CFB4490:01DC80B4]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|AM9PR06MB7234:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9b3b9266-36e7-4c05-54a9-08de4ecb3f95
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y+svxPK2GYX0pA6egOFIjRyovvVAnBjzoEP9jBlH4rbO0wEWLMGKvsQGtX29?=
 =?us-ascii?Q?BaZHq3FhpOSvDJoUAZyuXTXm728XOruLC/2+oTFnuFb7EtZCXWBc9QQfK4tK?=
 =?us-ascii?Q?aVyIeH8LpjcUt/1a5o5ERw2RCmMNR1rDm2bOx7+EPSQt6ydgsMHTDOaUJdy+?=
 =?us-ascii?Q?B+8xvsXQx2UQNHsqhFNzdUDIuNbtOpDsfHVDr3Alf4+fJvx2+p4dcEjNrU6I?=
 =?us-ascii?Q?D96sTW8WkkuJhdcaGMd7uO3Awu/gTuwYfunMP2BsdjrAkV+CAoA8Ot8httBd?=
 =?us-ascii?Q?yE4VoK6FLNZNw5+TZ3uqRZC7vIdgVPRtPnQUHfIDC3vSXmid13urKd+DfnKq?=
 =?us-ascii?Q?8Z6zbNZYTINYCnOtP9v1K9EX/yRfT1rWNvR+CRvbWV/lbnBXZAVqvwkTM63l?=
 =?us-ascii?Q?dB3lwr0zuFsDdMD9BWaXKVBfoBPyTjIYcEITsIfz4p3PyWTZJ8zDUeoxOLFw?=
 =?us-ascii?Q?ttfzhJ6FDck0dzL7tzclDsoM5NvvlrR+NLT9CtfkwCPhT5LlChXa2ZHtYxG7?=
 =?us-ascii?Q?2FvyavQ5KFRZpFRiYpQhCcVOuFe9WMnWDIO1XLyF3EEdyNESmd/RmHNUJx7T?=
 =?us-ascii?Q?jpb2kGfIcso2qOMxg4r9lYuYpvwvB79GQqsKUXkWwPiAHJkStoVnYnExVAWT?=
 =?us-ascii?Q?i2w76X/BbaUVlCPANQxFtP3y02Qh6mSt6gHK7n72gAKql1ug8rRG4y2XlkkO?=
 =?us-ascii?Q?wtoyMYtVcUZaM7G0y6hezxcsdxA3vkqqY3Rioo1hVKFHnsTSRaqMbHLcqMQu?=
 =?us-ascii?Q?ozUuoLSIb++n+CKeNqb634BmAzKFwJJNMs1h5nayAC+oePHcuC9pQ+hM5KOy?=
 =?us-ascii?Q?4j/494NiHw6nPlhDl653mlxZC1sDmupoXj3UNRKHjiO2vqFt4gma+CT0ZEk7?=
 =?us-ascii?Q?yQ12pdoKOxixYGQNwscpEshhOjaVFQSwH4LUwzh+F5NESrxbeaXxq8Mpilfc?=
 =?us-ascii?Q?UE1iX6m8X9gcu+QO97NH4oIxlYu7h1aNBXD+htLIORgk1wcGjbjmY/I9mtnW?=
 =?us-ascii?Q?Lao+ZyCklv9IEp+hdDSrsNcogMFNoAXHBDETmV3cigImIKs8ifWOZW+qOw+B?=
 =?us-ascii?Q?hLYTm2p46c+H04wPXQA5njtcKVX2mzB/8LODSOq3hTBjFf8W8rt06wZz6Ce9?=
 =?us-ascii?Q?GbIY++YniG/rSi30jUX1tnshKeDlYilwNSfWZp49Lpg59IYzENUa41SjGuJ6?=
 =?us-ascii?Q?Yt/HvrV/Ya4nJUblvurYfkfev57123LQnhTzJhFbXJ+pHmqvAjQ3cDB6d6pH?=
 =?us-ascii?Q?Zmq73520PqTTJAeGpccSxneq4+MllAKY9Xr7I9KAyOKYzhmfvs/1qf9krEWw?=
 =?us-ascii?Q?Tb2OfcegfhA2fSkcpFOXQWCVneQCc4f9Pxav9YVYlatsXBD3UxyzQhFmCRQa?=
 =?us-ascii?Q?inzrAZUh/FIQo1TGtySDFNj4z6McFg6du+k20y2gcLVrG7d0hEtj9erFthZn?=
 =?us-ascii?Q?nOv+fwvH12e3k4iSIZOS1uy1EHtYANV9BMNND2cnBGPv7zXPWBkZV29S09OY?=
 =?us-ascii?Q?5D515NyRLeUyrH/8UfN2FsrJX6tXFMKAmi8Bit9WDvpYzRqL4FCrGjY+cAg9?=
 =?us-ascii?Q?HZw4sLzbSWmtUgzap2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:33:18.4887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3b9266-36e7-4c05-54a9-08de4ecb3f95
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7234

Hi Xu Yang,

> Do you mean the USBSTS.PCI doesn't assert when replug it?

Yes, exactly. In the failing case, USBSTS.PCI does not assert because the
controller suspends before the hardware port-change event can occur. No
interrupts arrive at all.

> pm_runtime_mark_last_busy() is redundant since pm_runtime_put_sync_autosuspend()
> will do it firstly.

You are right. We are on v6.16. In this version pm_runtime_mark_last_busy() is
not called by pm_runtime_put_sync_autosuspend(). I removed the redundant call in v2.

Thanks,
Mario

