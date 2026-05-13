Return-Path: <linux-usb+bounces-37421-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFToAADFBGrdNwIAu9opvQ
	(envelope-from <linux-usb+bounces-37421-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:37:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A596539141
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E477302F771
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94113AA4E1;
	Wed, 13 May 2026 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jOdJvx8d"
X-Original-To: linux-usb@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010057.outbound.protection.outlook.com [52.101.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2713E3A785E;
	Wed, 13 May 2026 18:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696972; cv=fail; b=tL27dg3vU9cLYiy08EICzp1ZqMPF91NGHtaK7SsIIrXuJeJTjF10eJKfwbD/l26ELxJsG4FUcJZ9QaH+2kan8NYfs/scFBmttfosoyWzvyTbq5YvOU840vCxIZ8c1hlsUZhXoIvDx5Uiq8js7kDtl4t10Vw5gTctlo7GCMHDK1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696972; c=relaxed/simple;
	bh=pyeQAHnHShMRITgMtTu1hhkl/8NlKiMW0ovkLrkPfjM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwDYAinyG1Ly1xDfzlZvhomzoJD7Xia8fvGdvxGfOm2WdAYtTEEXUyeL3iCNfaEfKeYKEjkGqOBW6f6+lKEpqyJZj5wkpgLfbGDgYjVMSm67J0I5bSRAnayb0cp90Ev9RpWUyzVszO3do7NYEdnkpkxvoZ7mMb5DZK2d0g5j5IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jOdJvx8d; arc=fail smtp.client-ip=52.101.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhQ++VLBruKmjE88FdTdvydzixEFaln4XU+V0ZZXxQYeuDd/i8vW7jPc6j1UIMvaQDTjkFJrpLj7sGdBWjbe43A2ChqJIt8Xx24ScGG16AtLFdWBfHJKgRUt4cfKFercYXvH5jUfXKXyGJzmQ54333zvZ9GVZqMMUrJZfeK86SXSnxtbmtwPlDo40PWLBgzWsUYNCDCtHmDhWTXZ4FG9K01bDqiM5WxF936jxJzV4gs3q9DPgeUV/m1mdwlRTErYLUck6qPeDAkip5ybxxHF3XmLI6NWzggI54iPF/oKhf0mcqDSxpJj8oqiYafwUINOYmWccemORVtcvrOf8GIKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I5JWDjDI771x0kQ3TS+BlM5AqKff8F/6kGCB0QA+g8=;
 b=uSxIATITw5Iw+kyjn2hMPq6ibXClmcwwjw8wilwt6VRixCuTa8Xan7GZ/Pr01STbeAe1iqA7peOMbv+AuCoC6USHqQ4kR99aqrROY3AD8Y8O0mf36OxJnRTi+IDdEhPq0v0cKe6z0ujMlqNEclixN9KOoQqn8fzZGIq3Ga8qj0JuiqTxJibN/iw5E3UeXexgo/0IxgRw/HXzpxLdIWYbDjgI7KqrdoeQCkR+fB5lFHTKGF4aFuSHv3JxK2eXjcQ9u/wM+50QjCqs/PylVlzXuKXC8O/hl4UFVsWVEvEUslnvbmi1qjsZcUuvYvi1vEfYtOHyejC5ntWSQOyccn0deQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I5JWDjDI771x0kQ3TS+BlM5AqKff8F/6kGCB0QA+g8=;
 b=jOdJvx8dVZd2BoNBOUX9oHMsj5q1an4D747TMRAFXNRTKEajXD71YXLObHNL0vC6bhcvA7YJ5y7NaX14E4UR5a1+iGq91+3Gr/y/T6gnFnGrVhcyOo+DdyG1nelrt4al/Z4KHMxenJ2niIbKvFIE60ebCrIkRNxOfwgpFfFGUTY=
Received: from SJ0PR05CA0169.namprd05.prod.outlook.com (2603:10b6:a03:339::24)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 18:29:27 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::5f) by SJ0PR05CA0169.outlook.office365.com
 (2603:10b6:a03:339::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 18:29:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 18:29:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 13:29:20 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 13:29:19 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 13:29:17 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 2/3] usb: typec: tipd: demote missing IRQ log to info for polling mode
Date: Wed, 13 May 2026 23:58:49 +0530
Message-ID: <20260513182850.165349-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: dca58361-4390-4c2c-8604-08deb11d8fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	4cQ63cp6ZpTKU7FzG2SPCXr38XCEIJBRklWScag8OdBoTdHmzwAw8odlECk0UpWaswrVploUwNCiGjbZ7EY3qFmA24Q2UgEEdP18a5XIVnC+YpPZww9jw5o8aKpIxquzslEQxFeRXAGQdWeCZ62xEEqiVl+F7JowOF7g4zgnxTRr18UzHGD0oUen2J1sVUMlkZNKdzov98ZjWo9n8yi8v5YNKPlgnZi4JjwgWLGPztwMLwEXGEpvVDcPy5ExdqTCACoyW+FDfFhebgvi8Sp18vkAQZ2zcoPMwjcUEA8iBq9D00NaeN/naWdrxg4q41+H/Jmam8aloklc1ndZ0lAfYTr+23FRP4aputWWmsvFjp9/QZQYuxTgzqfIP5iMLXwGigwFKoD8j5Ao9VZ+nwzLEFKZUxPr0punMubctLAsY1zQiQNNDBNxeV3OmUqL2jvfS/fqSBYqjB7CApB8kxMYTInQT85qfp7vNUMbDdulUfmdGUfCq847ZtyWerXJT/F7bqKWthsWE3UUm78RmCnS0qkMGMBCT3b4HTsNmAwckPwd7pY+pEMnUz4QImppSoaa6qGXCk4SIotNJdzrcm3h3i7549j7zYT+f3/FPRTJobTE3rnJ/9FBh5Uxdj7tv+2BSOQm5fCZJwARV6uf8UMlmbcaq7KIwSdl59onTnYgDWJNH8j16w8KrhYuCGpQ52Cv54bk3kzFaubP62xirkxIiYhCyz2qY2joeOJ39dI4Gio=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I3TFmr5wKUlUyOA4DJAuOPQCIKXgC/yY+fRxW5CwO/2hMxWtkP2/INhdlV5fNvjz8qh50UqwlgUGBTQAHEJZvS7NOzK2buiddiN8MVoZ1WMVBapmtTCYkdl/wvf0bkXqLrdgKqpWELZDilOlAZV3FyyjRENCLk6FghVY+ocT23TlZvTVWtL3UZI9nYTVzPxEGIFa9yXvuVKIbJyy7AZLcRlCEIniVuiLAYTxi6s0xm3VYXdp+4zCNTzNugs/nvONMC4EUxZfnlGZzox3dsP0mlz0sjHYY7+RVbQjVXm3vW/gTFoShYGOeq8e+57Nq7N+YCgebF0GWauakd6qBUplsnD16CKaP5JrvcYW1cruNqIF3/IRvT+hMijcUtCMuFI+P7T5OYZd/VGFsbsFvNYu0mR0VW0I/FXBBiwOlwfK0e6VFWV5GclyXWjEK88vwJn0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 18:29:25.8384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dca58361-4390-4c2c-8604-08deb11d8fe8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250
X-Rspamd-Queue-Id: 9A596539141
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37421-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Operating without an interrupt line and using the driver's polling path
is valid. Log at info level instead of warning.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/typec/tipd/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index b282366b5326..fcd56bcffab8 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1853,7 +1853,7 @@ static int tps6598x_probe(struct i2c_client *client)
 						IRQF_SHARED | IRQF_ONESHOT,
 						dev_name(&client->dev), tps);
 	} else {
-		dev_warn(tps->dev, "Unable to find the interrupt, switching to polling\n");
+		dev_info(tps->dev, "no IRQ specified, using polling mode\n");
 		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
 		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
 				   msecs_to_jiffies(POLL_INTERVAL));
-- 
2.44.4


