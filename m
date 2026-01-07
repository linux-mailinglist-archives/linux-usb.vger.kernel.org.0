Return-Path: <linux-usb+bounces-31994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5ACFD3EE
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 11:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0966D301E142
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 10:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DD4330666;
	Wed,  7 Jan 2026 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="kKaI5q46"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100C6330B07
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782550; cv=fail; b=MsReE5wd+rMPHBCzVk8BvFlnfP3J3UbZPXHqCT7Ku2ilT6a0OUPG3y1oLmBkt5HkwCX5PEVhxCv6/Xt++9zWWbRK9DSKKgJaG1BoJ6U8/SnIeFOO3EdItNh0wco2zOO0sMt+nAlzjFBLZnhk6wINCAb+7WHp54s115feLtuBKuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782550; c=relaxed/simple;
	bh=1HwI0V19qdww+3/fLtU0ERi9OL2jZxmcH1uB41yEJgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dwyf2LoQyYxw+ZsHz3wYrK1CxGlX3K6c4G9BUNmjCaQvSIqIcDNrP2epBWmSqNAdwbdGeIz48KG2++1sx42tUb/Sh5AgWSfz3vmqs0IdHvjDk5FRRdfd5E4AUItQ62UvuHX4fKn7fh95KvEQogdi6DGsijzT9creEc7voXBCp5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=kKaI5q46; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bureRhD5jH1aUenY67utxtgGI5+uzD0w9KTKgfkVstSxR0AhzmX59pFOSRhtEF3FvRMaz3e/xlT8vFIDtW3V6fwNT8+GN93JXANJGeJsqMRL7KaU5/7nlYskwt5qEYCSYyth+8caDDaBlAJQm/6AnZd+4sikCAlYef2Cg6gWdlbxrmwzy+abaqZBITJ/g9u07GnpxHMkoi5zxdM4cE2GrStSdHoDsrZqbkvLs8Bshpoc8JqhCIxTZtCUOeIbkIPpKRdlthPA0+NPoXk110CyA6RssoG0zzHE/3252L1+MGzqv5u4wCKSfBJIJTACabJ4J6nu2/dQyll/0avGbZtiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn+nhSIJ008yJixM3f8oWC+3ywbGu4F7hfJZ7d1RcjA=;
 b=TRZBEvD1B3IQrye53tRrmhkLJvBU2BOSV2lzfQjWkiU0+hp99GRhFjAefgaKBkXPrv+kb1Sf0O4m6L8p2qo2lYDziqy+WVI1bEQe8fXbzkw7fhJ872gn0buXj33cakeEkFB7if/3LQHsoT8AkchziiuGw3NkwJGyrAQCuMv0f0nNJEzMkjPBJW6KUb/TwqjrWWSVJSQDll54nsjJ5crtrsuNS8800CLOUcSANSPOTnmFCQBqtJnKejNsN4q4xPxUyvOpPwR0+Fj8QCimV8AXBBykOeQYSWF5pmarAPxqZSl0w1spBg7BJGElpGGpr+3jnSXCY57j58gOPwkiS/Pj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fn+nhSIJ008yJixM3f8oWC+3ywbGu4F7hfJZ7d1RcjA=;
 b=kKaI5q46QBQ/U7Ibx4O7E7SDhz/eZqLuFgPrYWw3R5dU4VGrGJtqBzgAJGwVtIUGoMZapzJEK3W0NVcAcDk+pqznIjSVyA1SfgOrv9qlhbtkEv38dbBVSpu0jXSSc8njL4KFf4lc3nNrsXGEEg7MRvnqQw+7fGRI10Dybhm7Aco=
Received: from DU2PR04CA0190.eurprd04.prod.outlook.com (2603:10a6:10:28d::15)
 by AS8PR06MB7318.eurprd06.prod.outlook.com (2603:10a6:20b:252::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 10:42:25 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::a1) by DU2PR04CA0190.outlook.office365.com
 (2603:10a6:10:28d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 10:42:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 7 Jan 2026 10:42:25 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 7 Jan 2026 11:42:24 +0100
From: Mario Peter <mario.peter@leica-geosystems.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>
Subject: [PATCH v1] usb: chipidea: otg: use autosuspend in ci_otg_work
Date: Wed,  7 Jan 2026 10:42:20 +0000
Message-ID: <20260107104220.419563-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jan 2026 10:42:24.0899 (UTC) FILETIME=[4F885530:01DC7FC2]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|AS8PR06MB7318:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dd514162-6573-4092-5d0e-08de4dd97257
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j1mXoz7aIFjV4Kf2SHrkWGYl6fYblWJSh6yq5CZx96HtbC/AC+o/TBs00Pqm?=
 =?us-ascii?Q?ZsaRrdwptdFUAMsD2f602VgAN9qwCsxpeG2Q+9VWjlHqhyhZae2LfXQ8RTxz?=
 =?us-ascii?Q?0pPxRcUW9Tgft77Xaa6ER2G/W4ysxe3S/eAuueSQNX31K7hoPtrGaYlaGi3B?=
 =?us-ascii?Q?1744/21pZMhHyliXVTopGM66EARewzKeSEt2El/ZpMHdzBL5KxzEtahjX/MP?=
 =?us-ascii?Q?EuEAP8K4+aBgkWqPLJNNE07JQ83GQ2jWIScYwcenJV7SdiriSIkPBBUw4Q15?=
 =?us-ascii?Q?LAE6gHAqh0US+dbYxmmE638BqFB4CWSZwRuNX46D841xZm97fLeQ2YDxubiT?=
 =?us-ascii?Q?dJSz3tG+ZtTOqykPDzW9PykI2XoA96dzwkK/F/uGy+ZdJUgXWwAX7jGfHgXB?=
 =?us-ascii?Q?YV9M5VkBTq5+vOrN2nWptgrXHiykkPl/WTSmL2QPaOfKG6A7LivO3EjNJFMU?=
 =?us-ascii?Q?h2IXoUOgiDzbyKYFi+U1QqAUgcb3ZmLOgemcBMsR91t27Fm3ndFi/WefVqvf?=
 =?us-ascii?Q?Aek86gjr9CJHwyGln/Y0MHESN+2Qv+qEgawogzoWSQdSxRTR+QepqoUGD2tg?=
 =?us-ascii?Q?RhHO3H1PIDZ3oVOROeryIO1xiOKfEczY6c+FTPuvSdYuEQzz4p47iLGXjfh1?=
 =?us-ascii?Q?NQeeH9ZI0YFpicLnFUFK5L0aJH2nVBQpzreWo3G/pZIdBqPkX7yNYFnR6/HV?=
 =?us-ascii?Q?Z+fAYOCa7LIkf9Imkd6h7mK2t+4oh46WBSsw4nuWW4yNMa7W+YpkflK1ae0k?=
 =?us-ascii?Q?fyQ55RVNcDcLdJ3PYr8rmZ3t9WykHtaHPBGGZtLGzKYNm06QCDCnSSXYnnHe?=
 =?us-ascii?Q?jb+hR6aIbudovRaRQiaKTUPpmAm9BtsQZUP1kRnJ90tFIO6JIOTxaAi8IExs?=
 =?us-ascii?Q?LzKB/Y98QA7PANV+rnR6lJwT/YyZeLGjifbf19oPlNnXIepWyaIB3sQOrur/?=
 =?us-ascii?Q?s0JYW1vNhic7aVAECeLIlPGtBKd2Ze1XCkMRtbmrp875CkCsq9xjjr+nfDdv?=
 =?us-ascii?Q?9xrCgN7YK3JbWHe8xqCnZ8fgmJzra/IGoIvts9xIVzS7z7Ul2NjCgAYRfOaV?=
 =?us-ascii?Q?FVncI7yg4L0wFhAQ0PSmHW7g1LhOEFoX8SbSnWiM0kRB48YlT7Z9BzTR0FRo?=
 =?us-ascii?Q?ZiooFXjnZX3mMd53DYMIOYRaN9tYcYrs8uTRkx4aDNG9zlLOr4x4eQ2dCJ9w?=
 =?us-ascii?Q?8hteciuCtbhzJZ+fOagstUXpJ2lJCWkbQQ1NepUoLhdrkO4wDmhtB1xTXjCO?=
 =?us-ascii?Q?sZfYvE/L66csUoH2yRAow1I6sCEELz9qyFZegWogkNiRAZ0r6I1bAarDpptS?=
 =?us-ascii?Q?xT4oFLDty8ch7QOyI2aJgawFrZ6arDUqPEQmv2gOouNzmyi7vvESzzU2/Ji5?=
 =?us-ascii?Q?yo/d7KSv7NfZ/kBSxhFaP5cbgINTmMrkJXOMrvYyJ/sKwhS2ieuMU8jhnF3x?=
 =?us-ascii?Q?QkwYLHNqJHb2BeYMxFdnfoLi9RC3ynlwkjNnZcAOxGhWZ6E0SxYscKE+AxkA?=
 =?us-ascii?Q?319hS8xpQl67y+3ru7NjLzl/cI5MS8PzOUVZs1dgTnqZ+tpMBNQ9love5bNx?=
 =?us-ascii?Q?tKycR0AXIt2UfgfPm9Y=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:42:25.4067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd514162-6573-4092-5d0e-08de4dd97257
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7318

Switch to autosuspend mechanism in ci_otg_work() to prevent race
conditions during rapid device plug/unplug cycles.

The current implementation uses pm_runtime_put_sync() which triggers
immediate runtime suspend. This creates a race condition when a USB
device is unplugged and quickly replugged. The controller may suspend
before the new device detection completes, causing detection to fail.

Replace pm_runtime_put_sync() with pm_runtime_mark_last_busy() and
pm_runtime_put_sync_autosuspend() as recommended by Section 9 of
Documentation/power/runtime_pm.rst. This updates the device's last_busy
timestamp and delays the suspend until after the autosuspend_delay
period, allowing pending device detection to complete. As documented,
this approach prevents "bouncing too rapidly between low-power and
full-power states".

The synchronous variant pm_runtime_put_sync_autosuspend() is used
(rather than the asynchronous __pm_runtime_put_autosuspend()) to match
the semantics of the original pm_runtime_put_sync() call.

Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
---

Testing was performed using a scripted sequence with a relay to simulate
USB plug/unplug operations at various timing intervals, verifying that
devices are consistently detected after replugging.

v1: submitted

 drivers/usb/chipidea/otg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index 647e98f4e351..8482170c55b4 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -230,7 +230,8 @@ static void ci_otg_work(struct work_struct *work)
 		ci_handle_vbus_change(ci);
 	}

-	pm_runtime_put_sync(ci->dev);
+	pm_runtime_mark_last_busy(ci->dev);
+	pm_runtime_put_sync_autosuspend(ci->dev);

 	enable_irq(ci->irq);
 }
--
2.43.0


