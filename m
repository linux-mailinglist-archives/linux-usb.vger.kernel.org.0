Return-Path: <linux-usb+bounces-30789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A0C77659
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 06:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E5454E4A92
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 05:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BE82F2612;
	Fri, 21 Nov 2025 05:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="CRDDZLe3"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CB92737E8;
	Fri, 21 Nov 2025 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763703607; cv=fail; b=Y0Rnyw1ZDi1cOi/1yOuweeHEi2zH6sw/dgIg3tPOsq42yBBGEJ5beZwtyrRIGB6pMkHpQTCzdorHpLoFd1ReeAvJ7XKWWlajWPINzT2oDBef2PbZp/qavAu8S0lZZae4JKbAZGG4Vy0/p8rmm9u8d2SV76IHgYFr9lL1t5YY2uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763703607; c=relaxed/simple;
	bh=GILg7ennlDwM6K8WkXhCGIzT2UpCEG4o0pgELkxRnzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A0av99GAmcU+zwSaYqqylXobVqqDuuAI+uR9bvwxCtolvRZUrmWPvlFiSdzVp2KjQ05pZQvePEN/Dt9SVs22zGvR57U75qdECbOqgTzc8NbqDQ//DwLKwtMpjurTgIO1PY8/qMok6JAAhnqxjUKEuW+L6l9/mloKdZXxD7t5xiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=CRDDZLe3; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odRG66NSfrhQVbyRu6foJAkUMr+FTbyJKQAa8xHQbPTFJP+D4Ln/XX6rxTEvVdE2RNtFzEvhgmwdR35lW1GYSpyVWqCjzmIXfC8mIQSeBEBb+EcDa+VLZii4ZNQVsdG5txNoxwx6q2hrt+zbleyJyD1/D+oO65DfXjcmHf5sw0zn1xvW0uelZM7hTAjj5zH9ufINuIQCbygPLIAn/2YbRZnbkgbxbERD8hsXYudVRF1NbeR0WgtiozRi4QfccMRRJJ2MKRlwd7S7XFcQ1tyGS7Ked0T2Pbuxl7fCWsNGRPQjkXzoeJDmxDmoTASTuKzB0UbU+m+Glx6vQuimn/A9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm89rQ3teX6jXGFFh2lVZWDqR8oBzWHiBTemls1ICNU=;
 b=nUHPVUcH+44NOrSPE7rUOx4N+TOeQnGvUuKVlg6iZLyVRJ0UDbEY80aINLOvPFVumXcJcFMUtyyvQSykK29ehy7SB4bO5d8EunzLPApI+PZ7LqL+jzf24kzfoF/QVu0rYAjM97qsrlnR9KG+hys7lkLK3MqH6Dao82+3vCBdejNJ9PU/l0iRhss5aiuZQ/pOBsC3R0lOqUEV55Pu4LFZMHfOtUx/bz1UvbXMog2tKVT0qbzt6enTmc5TWMjOf+F2n5v9g0pJyg1rmy+PHKHn2pJrgsG5aulZUrk7IMpA8kd1Pwbwzp80BuollWIuE8PAK+tMevRV+gTPq7uGJndt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm89rQ3teX6jXGFFh2lVZWDqR8oBzWHiBTemls1ICNU=;
 b=CRDDZLe38ax5D4TYCFHlvkXQQAkcSf6WWCITyTRU4d3O30cfDh8EhnNS2gwdDkJbaNVtZvtRM2VlxfqbWSM4uHawNomvYq9uH/B6ySf3FVCv6Ho6IvL6cWxSoMYG/o9CuBnNeF46RjqKMwHMrULWFZzA4avm9VsPlw1oql/o++s=
Received: from DU2PR04CA0222.eurprd04.prod.outlook.com (2603:10a6:10:2b1::17)
 by AM8PR06MB7763.eurprd06.prod.outlook.com (2603:10a6:20b:369::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 05:39:59 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::8b) by DU2PR04CA0222.outlook.office365.com
 (2603:10a6:10:2b1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 05:39:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 05:39:58 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 21 Nov 2025 06:39:58 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing-wu.Li@leica-geosystems.com.cn
Cc: bsp-development.geo@leica-geosystems.com
Subject: [PATCH V3 0/1] USB: serial: option: add Telit FN920C04 RNDIS compositions 
Date: Fri, 21 Nov 2025 05:39:55 +0000
Message-ID: <20251121053956.263364-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|AM8PR06MB7763:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 15c380da-9198-4370-335a-08de28c0689c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g1qWK8iJ++Fe8qyguSiSdPORK29hlTZhBKs5rq+xyXZV1WM8UgvsmDDB1wwW?=
 =?us-ascii?Q?qRBpa3Vw8xAtQWK0jSR72WBjr+G3Q9wJUKCLwKPzn2zAXkkdxVIKOYEp3DNG?=
 =?us-ascii?Q?QEhWCJvE4iWVdFwnxtkFNFyIVNomygI9hOOko4m58KuJKdbU+twmRTOW3hBW?=
 =?us-ascii?Q?AsijKPyVfR/jETziiGlhJ5jOwe7N9PlCEwcIsYM+K3ZadFcx1lg+y8BEajCD?=
 =?us-ascii?Q?y2I4cWRr2F8XsxeFeIWwPLWM9njmKyK9flPk/vF4PaeAC0OR9VqCMFUoc2oo?=
 =?us-ascii?Q?zKG9r4T2pvfcfy2iickgovPZfG0RzVZzN+N3ZK3KFA4BFqM8KzJpKJrb2Hfw?=
 =?us-ascii?Q?8WjNjcBThKsOtcbOeBD0oSwnWyEkNHzMO/YSMAmpNaaa3T78NMyGYAmPJ0ta?=
 =?us-ascii?Q?Dio347PqJm176G2apVTaeVbGWhOio55Bf0w/a3smBMD+lZA7JFQELsxolZmB?=
 =?us-ascii?Q?7DbpW3SWzocm7R8XzSukGIwRrSqau1q3w1jCzcsA6PhhehrqhFnikjs3z3fz?=
 =?us-ascii?Q?J5i6VoNSi2BY2JIooBx4xMwDz+N34sDiX1GwBohbXGgF791hBUj6MXJFoGjX?=
 =?us-ascii?Q?c6T+iQj8+F4bJ9mTDskZmuXPH4bRpz1m/IM1LrHUSfKvJzNXIS7gxea4Bz7n?=
 =?us-ascii?Q?AsMWXF3K97O90IbDeUdMszcRcsoUUouft26jMySg6+dEJObjgQ/PNQBHAlnM?=
 =?us-ascii?Q?LkbCkYyl28l/CTbinMgGC4tJoH/tqnrbAf0h+h1f/tKPC0k2LEUmwKNnyOVT?=
 =?us-ascii?Q?0HUsppiTlbt3Jb7qS5+ccQP7OxcOwElQURmzdI9bl8PuZ0I7a7BAoyeZNLoU?=
 =?us-ascii?Q?pOyyGk+VmF1CnaoZ0OJ57DoW51vtDqujAdB4svbW5h5BSwi93TrZ3a6rKF59?=
 =?us-ascii?Q?V/DVbVFWfs1VN4MkHB3OGPAiaVlz7BqEVljORpcKtvFJ6pwgiFUqABZhK0JP?=
 =?us-ascii?Q?LIIlgM0L7/Ctvl5Iu2pMxCoF9UPamHZJPRrXxjJbcPfPYWuu3QtEIkgYQRjk?=
 =?us-ascii?Q?hbGkNsSqLC06I1gnuhrbjzM0KQDdZOesWIB/enc1oY9hat2jgxlSKTbNqkGz?=
 =?us-ascii?Q?uQ/EaEOaJ363ZhOfI0yVEGMNlGsJUC9VGK+xY/tk+bg34TfwV+DP7vEBjUAh?=
 =?us-ascii?Q?fzYbH1OIMv6OOVwJ1u4aVtP0+F2kTtq3iRLfj5dM8PFEvedhCWUNVd54/yOV?=
 =?us-ascii?Q?VCBAc2g5xv1p3DJFSNDmx1crT26X4ehJaiIxoCYu0m7Lkrl24+n5kWg1yVO9?=
 =?us-ascii?Q?s5VQfV/5UXhkyXzlr3eVtQWdJTUIl3yNwURucZJIWyaioU6ABz7sbfCh7nBE?=
 =?us-ascii?Q?KxPdwj1N9zpGSWwfd1wknzTgBKQlrbSgpblwO/NgBhB0/Tw/FIT4vZZex5By?=
 =?us-ascii?Q?MsE4g6FhE1v7Gi/E4ulXDA+XrS15Wopvhz914OlzD8J4ESdpJj3Z2V1dq/it?=
 =?us-ascii?Q?80Z9FiOK26jQV6ANydP/s/j4E9FNP/EGK+13lPkMJZUORwWsdDB7yLhHXV1T?=
 =?us-ascii?Q?mYh0XLjO5r7Ah3b5MrZuwmoSS0jtZ3YX7cUw9TiJvq1bUv/+PUfyNJYN0Y+Z?=
 =?us-ascii?Q?nsu/+5I17n+JDAlu2Ac=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 05:39:58.4885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c380da-9198-4370-335a-08de28c0689c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7763

This patch adds support for new Telit FN920C04 RNDIS compositions to the
option driver, ensuring serial interfaces are properly recognized.

Change in V3:
  Fixed the compilation error.

Change in V2:
  Removed the unnecessary reservation for non-0xff class interfaces.


LI Qingwu (1):
  USB: serial: option: add Telit FN920C04 RNDIS compositions

 drivers/usb/serial/option.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.43.0


