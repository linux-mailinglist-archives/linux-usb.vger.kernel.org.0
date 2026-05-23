Return-Path: <linux-usb+bounces-37960-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JGRLpxSEWr1jwYAu9opvQ
	(envelope-from <linux-usb+bounces-37960-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 09:09:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD005BD7B7
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 09:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 389FD30182BE
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 07:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696A0342C8B;
	Sat, 23 May 2026 07:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CYAJIHyE"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614F33446B9;
	Sat, 23 May 2026 07:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520147; cv=fail; b=oRwcDVmZ08WocRnDgRqe+GzFecxdNJCr9u6XJEKkOZKalvq10GczQbSwCQsJ9aVZYm92/Dn6RSnzfteabqJYpbLIOEBkAZBTCU2irzHs1eU77uQW63aid9lsYoWNZjVvq1Xx+8EEccUpZH33PIGjtdzoMalKsdbLp6ADoDFB/6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520147; c=relaxed/simple;
	bh=g8IMhZkwjQzjlcaL1StV7FoiINy7v+To6ULydfHDlzc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XfunU1kkJ9zv6CfzjVvbV4s37MS/vkrehQdAo8obdVWD+MLH/01zkmROLxTkrZxAlG4FM9nQnLaa6+VNQwl0y3Wy+/Lzo4bou75zmGzW1FRciFxQnHw69sr2gzxG/iCkK8FNTGrUSUEqErJlUHQygVn/AfMY62mxzs9wlqfj65Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CYAJIHyE; arc=fail smtp.client-ip=52.101.53.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4xLVLAnEUwN6UU+fxoUuQJbF4mr7DbriPPO7WAcQbsH6gy+JlJtWzRFoe59h9s6f0nsfjzgw51qFLgKQm6F2r7fDzMGS79sBDU5ZnnNzASCveTe2GpsPBhZ0CXFFP0HKmUULZPU/4v62JyufYHJ3MoNhCWgnifiRImPmxnvBKx6+IAE/NUKWLIVKBWgJVfqmumoXwNJk1FLKnAcmmHr2K9swy0XwY3QMt+X0cP2jQ6E/VM/HfjOyoOTIyEnciSb+Zv69c6eoJCW/KiH9aoUcFe3+YBXbHa0utJIqcj5RBpXMdQaxvvKZtYhiFTWFtIpG6geCbuOT63xZt35oNip+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKz9yTn64eZwnfuJd/yimYL398LYYUoQLIt2PsfsnAs=;
 b=W7qor4XyeSxcOX8GRbP1ddzz0PMZCj4yZCRNZ99IYIaJel84bZvHpZQsawa7dzqXoqMAG/pO/L5EYPCV8wbJkoGrxw6KM/+wgkDKrHz+mlPXMMGrKmQF80vVKBlJ0pcfd9XmDGtpzSKeztZv41rxtGhOP/OzAni5tTaI2ShhRn++b8AY4eUQSHQAYcIZNpI4cKF1bwvSXGQf+t1bIoqKsWbfU0noww8Mz1MsE5ZngStuT/xHC4RqoqIfxZXfakUJAbyqv5+RzTtEMeRb3Nh88KzfI1FgeRKvru24Szm+bd1QiIPwcmqLxLuOH6BZVRztfUatt624L5RFv8UIU87SFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKz9yTn64eZwnfuJd/yimYL398LYYUoQLIt2PsfsnAs=;
 b=CYAJIHyEWuyAyVIUcIcnfGYzqfZM44aaA790ybpFPNpe2CVjONGvc1/jWR9kSbCi1/EV8ErNW150B6LW0IbDtEr60pGUpi7DYWx57zqXRNVzhl50H6Pj6+uX7ceuwP1f1pkaJPgwuD/gkpKgoFbqUoXAqF9b+p6A9YUVe00il3s=
Received: from PH8P220CA0057.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::17)
 by DM6PR12MB4108.namprd12.prod.outlook.com (2603:10b6:5:220::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Sat, 23 May
 2026 07:08:59 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:2d9:cafe::80) by PH8P220CA0057.outlook.office365.com
 (2603:10b6:510:2d9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Sat, 23
 May 2026 07:08:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Sat, 23 May 2026 07:08:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 23 May
 2026 02:08:57 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 23 May
 2026 02:08:56 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 23 May 2026 02:08:54 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 2/2] usb: dwc3: xilinx: use reset_control_reset() in versal init
Date: Sat, 23 May 2026 12:38:37 +0530
Message-ID: <6a5e4e25d84d6abc971f1669739aae4d3146700f.1779518171.git.radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779518171.git.radhey.shyam.pandey@amd.com>
References: <cover.1779518171.git.radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DM6PR12MB4108:EE_
X-MS-Office365-Filtering-Correlation-Id: 43792de3-d0cb-4b43-f787-08deb89a28af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	qEnh4QgYh/l9jJLkhIUwylI7dQgULKQWbCj3pPG9pscILtZ5EUyUpwKvzXbal/juhCTqdXOvSVEFy7pDGiE54AyMKXfq9RXAJnaqICI5tJHudfTvPCVcSwZPr3HjY4jNKSe5ROHibafE0NdbBBgBtLpCh7JTWIoF9vyhZ27bxucabnYrXhNOcV3IVFjaIP16O5stBteqSHzL63lPkm1Gvc3R3hk8aF6CWuaXZMDy0sJPRaq4XFmo1K5mccMSoWqnNxbYOISTU4EhyQQ6poJXlOVSTaX+0BjMdDuZcqE9wgHlGH/0o0t3D52DK11ZpOuyTRYxCMFcKsmUA/8XyM+1DScdbK4c1ojQgaj1Sk2dBXYvPZK1qT0hGUxjdONDBll4G6v9gVw5PR9JSs75oZ0eqzF2vP7xFzxAF10e7AJeospbccZykPQkhOiOw9FkLbq0aB4Qj4hekSqqNha+wkhb9xfLzgijQaNnBT+Qw+gncz8P0tLFfzq1E+FKgg4jxzIj0rVnFribkbPlZ9LeuLWtbAWUmzOcHPKlwmFB42Pc5HOR5vSlgvd/T+xLoPF5K5fY8U93SrsUgpbptjXlnA8qyuuOuxnfvEzHMo1GhRN7318ccYT0yjxPNJeQrCpC34NSJIAYeIc6bHmKzWjlnVLWOQHCjpgFucVAX07AHAXK3fyN4oZRmoQwTI2L2CmDtxi9BoddCkndTtbBXElNYUkz3u+wIfQtGemRdBvN2a2VWF0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BpNsE6gzxwk4r8b1jwZbaFjD8MKzYKiE38vBnlc+TrX+d2PUM51jcXrNHQmcGlLE84ll26PXj+MzIDv64e+l6sSF/AhGuFUQONDQV9Pgg3Mu8AshfhfgCq3/1xlTzjoDfjSxfcdiLw6cJ0ye+r3f+I4XN+bkC/L7RA874bT6hIvQluQqez+f1EMswKyynbnyhgwbG810e5Tw2HGeOfJcqOZFkKdfageRcjY57ZTF3Y1gjJXwHWH9k8TGT3aAN+zpD71HBLmvl0jnMDDHfzidIT73zFtLPxQCb/JVVSutw/2yXeiQOLOBg3cF5BDwL9v9r43U0ouf1+27YBZb0MtkY9BHhEXtf+wAWKOdeQjuZ9ZtkW9pL4PuiVgTtANg6VR9OMdWktbLkCu5Ohkw+E+AjOhwGyQp7yZ5mG+hn3KZVpKdpTUWTFTLgwbbLa8VAebq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 07:08:57.9411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43792de3-d0cb-4b43-f787-08deb89a28af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4108
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37960-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3BD005BD7B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace reset_control_assert()/deassert() with reset_control_reset().
For dwc3-xilinx, reset_control_reset() routes via the zynqmp reset
driver and uses PM_RESET_ACTION_PULSE, which performs assert and
deassert in firmware. This results in a single SMC call issuing a
reset pulse and taking the IP out of reset.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- As suggested by Thinh rephrased commit description to explain
  firmware driven reset sequence.
---
 drivers/usb/dwc3/dwc3-xilinx.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 02dc35e110b9..b832505e1b04 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -98,18 +98,10 @@ static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 
 	dwc3_xlnx_mask_phy_rst(priv_data, false);
 
-	/* Assert and De-assert reset */
-	ret = reset_control_assert(crst);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to assert Reset\n");
-		return ret;
-	}
-
-	ret = reset_control_deassert(crst);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to De-assert Reset\n");
-		return ret;
-	}
+	/* assert and deassert reset */
+	ret = reset_control_reset(crst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to assert and deassert reset\n");
 
 	dwc3_xlnx_mask_phy_rst(priv_data, true);
 	dwc3_xlnx_set_coherency(priv_data, XLNX_USB2_TRAFFIC_ROUTE_CONFIG);
-- 
2.43.0


