Return-Path: <linux-usb+bounces-37729-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGwRJumqDGq4kgUAu9opvQ
	(envelope-from <linux-usb+bounces-37729-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:24:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9BD5839AA
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54FDE307FA8B
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9809E368294;
	Tue, 19 May 2026 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l/p3xqZ0"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D037A36404D;
	Tue, 19 May 2026 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214823; cv=fail; b=qRhGnmCx/iLP0hH7sP+6yNIelnoA2cO1yLn/oc98xW0syAVNiTqSCdLwlTI4yyQ06unCJ8wMxVbhwRTYLaQXA+KybZzc0KShSgZo6HlKwRUh9Ak8NuIo88X6EXe/l1WrHp18Coh6Qo9HrzPr78r0fuBmxwAxAHVikcR6Uuk17xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214823; c=relaxed/simple;
	bh=ashNxMwOpTWUvmMuJ4EGA/FVQnDJjUvnj8oi3zsL/hk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qyWOKAmTqsxKqk+sdNDE5TKgfoe1QnVK88yHXgG0QWZ+1aYopsJ5pOb3lze04ddBBvdUev8zw6ySOKd1hpQjRuradfEGHznChsAONB9VBIcLH3a454njbY4+hFU1phxkq0N3aDND3UPJIWGfX/F1ALtWCCuA3H6pPAr2AKnGU6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l/p3xqZ0; arc=fail smtp.client-ip=52.101.52.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Newuxag+DSqn1KBcuVPm9y8JF4g7mUIwj8af0CKUM5Fh5pX8jifJ6pKZQDzaxx8AACAUIwIy6lPh7NAR28AOWbAONZbTWMeM0ZsxIgUXKLsdh53nANEvDhqWHgeGqF/91FblZDum7Vdu4sY6iCcJVtEbJ+rxUu3L4oYBwB4kkeqP7wB6mC4nZjojrF7mmUDv/jfeeG8FfBMVfXizqQuEXRSP/Msm9Ti/2j+NVyqZuVlduNmvJAiM25yODHgqzTLt7aC4gb5I5G1frgUUlUh2UR3iWVvhP8sYHxnDgTNGLvKcTHDHM9GUgsouU3ay5bMNFPbFtxCgXWHz4LuXinE4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jCTA451qSmmxL0RCvHqT07Hsm7PzUhMun7+duU6cq8=;
 b=mdaUIA9WoteOzyUmSKRUvdZIAQnDGpOtPkrdeYSaTKt1Szt0Sl1H69wQJFTlytVCBTrQyDRNzCn/5S4qLLViftZX019ZyhqKQdEIawPFm6xq7tCmUfbHPiCpJUu8+rpTeHGMO9ngqYk6xzM/pVC9NdTpFkr7BWQAOqrouCz94YvVw9B8UGl5Z6PXaQly0PYFi1nCb+HQt/mMkEPrjKH2OeZiCJ92KYmPV1UY2+mVRbWCGtO0CM+7ZLeySmID+yVxPkf7G4IQD2YuSvOjCNpsoH+xwl1XpccQMr25axi4/B5XJXkhnvcPfWC9h1Ki6uouJEhSV6pX6xKJHN777qXRBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jCTA451qSmmxL0RCvHqT07Hsm7PzUhMun7+duU6cq8=;
 b=l/p3xqZ0cmuDUPcoQrhqa9x0mfMjBweXvPtnr5lYCcZZ35f2mhLJn3a91Niys6nRbMKNDLHxr0aTXwBD94sWOFGX9oqqfBwjHE0LNjfmDC2fbzD7prAuloaNgmSCvjzWmsqvXxm6Gd/67EX+lPnIMm9f9rbABW/KlZk0sjOmJZk=
Received: from BN9PR03CA0919.namprd03.prod.outlook.com (2603:10b6:408:107::24)
 by MN2PR12MB4045.namprd12.prod.outlook.com (2603:10b6:208:1d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 18:20:18 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:107:cafe::8) by BN9PR03CA0919.outlook.office365.com
 (2603:10b6:408:107::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 18:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 18:20:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 13:20:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 13:20:15 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 13:20:13 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 2/3] usb: typec: tipd: demote missing IRQ message to debug
Date: Tue, 19 May 2026 23:49:55 +0530
Message-ID: <7d14634eb5f4f7f2e217cd0080e3288eb63fc940.1779214249.git.radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779214249.git.radhey.shyam.pandey@amd.com>
References: <cover.1779214249.git.radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|MN2PR12MB4045:EE_
X-MS-Office365-Filtering-Correlation-Id: 1512d20a-ad21-466f-d7d0-08deb5d3471b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JQMHLKXkx73tMHJvMLieiBqdRwvvgf0kEwS6JG4jnztkVRJIFWNZS3s6OUi0VoQnH2lyvwWcAUTXnYoBc3VgOKV4/o4ogGT/PCqyex68o8n9BW0beCDLUZxZOyKo6+0D/sAOAI29j6tV/KxvV7Eytw/Y/PELfR3IyamvewxkD8Rd2bRAxdwi6bu3MLT5B5ugnNGgv4f75VfEEys1DZ8KzW9Td2I/qdDzTkGg3RNySRo9fyetxhs/IiBbDIsjPtxyxgG77rWrGwp+g3JcAH0vkZxDTws84GS/b+1rNyKeTqtlHVDB/YYJo0L8YBVviK2g5MfCabjig5EFGPTj9kVPD9dN7QanG9KAKiFbUQDRwdI2kTnJ2wy6AHZJqo6MWUYmset/mpvHzsklQvWylZ/lC9IoVO5Zr53JiiWjhe9VbwmliQQoe9ZxsCeOQ3tGhuSmyfDNWywtXDKvXs4TMdTDemtjDYzQxCLreIHhHuE8NZ39JMOho6U8alKS3qhjDorCsyAocJgciMax9c3/9YfA7OGP2ZDad9ZqatbXkQ6Qq0OGBxxUXIzWD5dRLj/dg8W13I8OXp/aX1ArAm2VUCLIcsKddg34sQpqt1Y/DWmNX3B74T1nZWp8hQM984gWP24Zoxir8ps4XXB1p14HtotHd4J6Yqja3RGBJTYmHxzz6NKRlOOZtcOWnziW3139vk9Vvb1/Cqo2QfRRMn1rX4F0lG1PUfjnSSdIpC9rjNVojLQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oLH/8r36akbnAKC1mQ1D4am6gzVxuzJ8Mh3QrahQCLDocYmIb2Fc4I743RIXxlcdmlKh7sgWGVQV+ZvjOABwzB1nRpUNnYP6A+cQkrCleOaf5FUlYoa/w5LX4TUXQk2hGgL54bwsduQRo1eX4bgLS3CiMcqYcfWphnW6ro/FCL9aUSozKSe2tWwmWLSagMa2Bth+TLqBsaSI1N7T/9lYYio78GpuR6RnvEIcQ8dSnpAUVxGtWVb3DqNvdgRLYyhEwkSwfxpls/pnn/zHw4PZyK5ZnBhfw8CxXF6vwNpom2X/auO86OlyBWgndZWIUJ5MfC4+vqVjmqAYiW65zo/4VwHMYMTFBeZ1O4T7l5xZRGiXNamCsFKF9Qq3jee0jS1A6F9nkghHUxgcEY8vtFvg5L2k2MS4cgXTen6N9VS2DeSEVPs/Vgu3JuJbDCIiwq65
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:20:16.8502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1512d20a-ad21-466f-d7d0-08deb5d3471b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37729-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: EE9BD5839AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Operating without an interrupt line and using the driver's polling path
is valid. So move the log level to debug instead of warning.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- Suggested by Heikki Krogerus - make it dev_dbg.
---
 drivers/usb/typec/tipd/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index b282366b5326..58cf486c3d68 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1853,7 +1853,7 @@ static int tps6598x_probe(struct i2c_client *client)
 						IRQF_SHARED | IRQF_ONESHOT,
 						dev_name(&client->dev), tps);
 	} else {
-		dev_warn(tps->dev, "Unable to find the interrupt, switching to polling\n");
+		dev_dbg(tps->dev, "no IRQ specified, using polling mode\n");
 		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
 		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
 				   msecs_to_jiffies(POLL_INTERVAL));
-- 
2.43.0


