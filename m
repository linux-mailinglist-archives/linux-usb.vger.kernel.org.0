Return-Path: <linux-usb+bounces-37428-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKN5CwQfBWopSwIAu9opvQ
	(envelope-from <linux-usb+bounces-37428-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:01:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D68453C836
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75D9E3050C92
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 01:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325F52FD681;
	Thu, 14 May 2026 01:01:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DF301465
	for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 01:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720484; cv=fail; b=jP9jeMj6NWaUUXN141MmEZjA990X6/TXGYG36Uve6AhswiWfNeXGZbaX3eA/YYvn8gDzoHFBCemBmySjgg0AhNGjWqVXGPtxR4aYC7iS1lWbai2O2M0K5P/SFJmZsTPLz0A4dcuzDpU1FnZup21xyrHINbZtEaSmSxErBJN418E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720484; c=relaxed/simple;
	bh=3KYzpjeHbkEcZ2iE5uf8fnQnTQM5E8nbDc1OjQ2RkL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZxBt+/e4kdMjM+l8uOX56GtdfYroZ4ilYgGJMvmLcge9hjaL8YyQZXwbz/47FiWfpmOLfX+7/Rm4as859yq7jkelq0rCCM16gvhAk+fdVET4JxEQoHfbqQWz5x1G7hX8Mk2MdTeb1ALNByunEmzHd1s3t0Uo/0WBg4gdXXxAWps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzW1HsitfVg4hyYPAvPRz5zQyUhoCAEBpEuSjA6+BRcgqei341snYSyHQGyBA/RGeNaJ5augXrVvZ64WbmoRho/DRLfIwJzc4CS/XHHjTDDX9YT9HbK8opa1WNS9zjtTggOC7ItpDt65CeiBTFqJgh4ddCjSZ2Uo55DD0BYM1ydkyLVJDDLoQEuJloz4kLSrLOEvPRAKZC0oQ1BNqngo4wGSTQOgPyU6dOj3Kon9qz2LwFNm06l9pDAv5N3k+b0xaaKXvgejp1vv5uBdVVO213nhaMC/mc4IJqa7j5D1dm63OckfHYod2sdTxdykVDIiWfo5STZRWouuMn7l0J4PoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRirjTAYnpJoVtvYzF1Dzm0kEbVTdy1Kdrm++tWnjFI=;
 b=jDK5sPc/3tTtviRV3TCr805zqWt2oZAyzR+kmjJiKKJvVKRMcbEgC5sjrdjW4sbl5TC2ukXUGwSMZjUEwP+a6d+yqodPqEvVlFL9r7l2pmb5uRWZ+XYBlzmYzZ3txGr70jyE31lG1LyhBXReiZYQ32En2z175ZEL++00piuUoLhvGF7iafN4SwdHcheQDOVyALnBaaIn6ipXEeTUYO3bzSncDPVSdzSzGIh64Z8QNn++FEJL/DnXTAwyIYN9WsT7qNpfoEgKRXfAaDrhRKfVRgGAKF2QLIqxyHeLE0UX5fVbQRVBSO4d/sWPGoH8CWphG5GqCPQGhwyns3Av1lMRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0123.apcprd02.prod.outlook.com (2603:1096:4:188::22)
 by TY0PR06MB5833.apcprd06.prod.outlook.com (2603:1096:400:32d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 01:01:17 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:188:cafe::90) by SG2PR02CA0123.outlook.office365.com
 (2603:1096:4:188::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 01:01:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 01:01:15 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 612C640A5A13;
	Thu, 14 May 2026 09:01:14 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH 1/1] usb: cdns3: plat: fix leaked role switch on core role initialization failure
Date: Thu, 14 May 2026 09:01:14 +0800
Message-ID: <20260514010114.2436781-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260514010114.2436781-1-peter.chen@cixtech.com>
References: <20260514010114.2436781-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|TY0PR06MB5833:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 948c79af-7da6-4555-4cd3-08deb1544c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	leDo7FaBIykLuVTm1BlwCLKFC8yOwnLjhuwPb7gVwVjjrFWEEL+v8YF8fF3zEAiJkgo8KgPSNMRG+Z1GIuIbcrG5v+eNUHGNmK+2eYbm1acYn5JHE5h3FLNI75+IaDcx8LhasTi8YiV8vIl5kWPZh2hHaFxexu7LO/0PQD448KehodMng3lzogLHdlFT1nBXfnLVWH1GwjfOVUOi7QBFkzE3nzEbA4TRKMhlh0hnhFtBAZT/bFsXOjzUjgOj403s3kXF4euyHhbze6VtS/0I4jmQG0KGgJeJhp3M/tEXafxkKgQGzT1az9rwTkxYjeFhPTIZqdvHGzTxE0H0988GPt4+5EpHpsOMqNev/Aciw1im/Wr0kZB9xuyaVJUUI0tSLh67M8mZTl7aqfN0Mfvkn/ORddEAZs6kvzVBnE6bQcmEFjPXGbuPhERvgYJ5m70pVoKaX+yJlgQ+Zf6LPJHJv1ew4E7UnibuZeNn0W6LJHiV2xjXxbSHYwW6tTEQC75PmwhwuGM4legznmdOM5Ww59z5jCfbfQb9xhcFPz86bfp2z9g1JwKH6tdD28NdoheYK/R+fCEAFV9wjGIbHS5I7vp67dq6wpljGp04n9EoSa77bZNa5OqgXWHimIVKPZ23dsu1nz+u7yTWa+ABZPhBU822Resw+kqFs/l+W9gXMynPls0wa0pH8KthURc+JeKNdoi2SMSRbayhwcwfl3gIQW2d860iD9tmzty4A3WCHOI=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZS2/7E+1qeFky/W2ZMjQehBJOfJIU/++9TTbVNukgVkFeRPkDXJMm/uAhkjArTxcietxJTFotLOcDOUYsSnhScZmcWqkfXisCzOVpjEpYx11p1XEe22pxpMAu2IWzOg5t2HzbzH/63gIe5YLPddUQDvq7aeBPofJ5KCE1d1AElRNM6DMw/3iXJDXdezMvZ0gUzPNN2eq37hr3i2t1FBL+ZV5JcRitCdyvKFCRktNDGm1D9HAaFsd3X8b9weFZhMqKPKU+OBio1oJwQP9fBwe8kO7hWkKVcjNDjWAq9d4Q8BY2a7lAhZ9sAcTwM3ToCJ2C3Kqj9PVlrfmyl6ndWjY/61tKb2QUOXFNs3bViFyZS7Jmre0zpvdUlbkkVCKNs77dzBhttcfca9Qkq83OD0nqR4WwvCFPaiqCL8JfyadC5K+G86UVwp9h44uieCSfDvU
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 01:01:15.0538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 948c79af-7da6-4555-4cd3-08deb1544c86
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5833
X-Rspamd-Queue-Id: 9D68453C836
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TAGGED_FROM(0.00)[bounces-37428-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Calling usb_role_switch_unregister if core role initialization failure.

Fixes: e4d7362dc9cd ("usb: cdns3: Add USBSSP platform driver support")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-devicetree/agKaEePSFknhDBg2@nchen-desktop/T/#m21e1d9c1574eb127ce03c0c2a1a49002ce435b52
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 drivers/usb/cdns3/cdns3-plat.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 3fe3109a3688..91159910fe95 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -167,7 +167,7 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 	cdns->host_init = cdns3_plat_host_init;
 	ret = cdns_core_init_role(cdns);
 	if (ret)
-		goto err_cdns_init;
+		goto err_cdns_init_role;
 
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
@@ -186,6 +186,9 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_cdns_init_role:
+	if (cdns->role_sw)
+		usb_role_switch_unregister(cdns->role_sw);
 err_cdns_init:
 	set_phy_power_off(cdns);
 err_phy_power_on:
-- 
2.50.1


