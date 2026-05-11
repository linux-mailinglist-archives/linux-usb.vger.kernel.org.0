Return-Path: <linux-usb+bounces-37270-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLWKLOMIAmqknQEAu9opvQ
	(envelope-from <linux-usb+bounces-37270-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 18:50:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD01512A66
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 18:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B57E03186942
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEF843D4FE;
	Mon, 11 May 2026 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oE2jRyHW"
X-Original-To: linux-usb@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39F843D4F6;
	Mon, 11 May 2026 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515736; cv=fail; b=PfYPzeuU1+o9PwZgC40hxnSh6hnvY3sTK1h0ZSG5PdzivL5AOScZBWM6e8c2it+EVS1InyyIhxXac+79UJ8Fl/3M5eCm/poOtJ/w37YKl8bxkh6tAqaNgNF0t3lNx5d0c46TOKp9DYaJ/3T22o3BOrMjrTrGUTuW2UGuns8UmX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515736; c=relaxed/simple;
	bh=ch53UbtXbsKKOii4zXfD34Pjr2c8GMibdOaEoAoAlsQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BI5L534H+z/gjBGa5gLcL/7dP9T4QNe2+73X4KWcatQcNH5iAfYJ4eu7Yp6rdFql4X8lnyxpGJaiEZmFEgY6mGf+XvA2BflT7vi0Jg3b2veiFEEOZvyLBJ77wsj7mh+t8eRoTIBLjQbuc6HjtxJgda6voBdu0VooynZcwMT4qMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oE2jRyHW; arc=fail smtp.client-ip=52.101.43.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz02Cpasl3xq9hSQRsEU9d0hax/+HUPO0wom+9McUTbItH69zB8yG9Up6jA/82Q3uGGIcUMWxaV3ZpM9i9DEbFAlgxIFbNbvcm1/sYRu6Xpbf1oiuzTJPItGqzfhzFmwVu2mJ3m9wPOUpI2pZhnNsBLNvL/gpyMf7Y9AvrRD1HGeXQK6JCnCkjJwmfakeUWLj/tHQXbSNqBiLp42WpU3oK8oB8XS5qwGhgMIAoeuvofedCS+zkXcNaLvEdWEU8O8MOX8bl9atAr7DZQ+5DhTfc0hlZ9UdfAFMwSdcdOVAhYe5rMfiyBhI6asmRcl0NTtgNKvORfOWmwN7duI3X6cxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KL6DZ+mhLRzjaNmcT42pTRNqIAAAh3F0VY/d9uQMcWY=;
 b=q0UpaMkGP6EaRA7lCkfVadoe6xUxe8m5vSvu9g0qfSwm6Y1MjL6FlpnXYaoxW0wJkYpojPEtPB3rV28GL1kKM/keWFXimG+SUGstWCzsDf/2LmztmMK3MHYytCS4svSIDkT53uPqnC+5ya98ZbWd7lEmfMr/5DZYcOKV/Imop3g1c2JwOhNj1sP5tAR4i2ahrtT6yK2hyDMrR7rV5uIAsjrKhqDYGCWzNQzl7Xo9XzXbpnhgeu5qOw5PJUFi6pGjmMMXI+dWinKoLVwM2th4wmr3DsW/2kPQfULEqDfYcssBQsF8wvK0pxrkq2o5w0aOLznHEL2hsjZwqXJJ+z8cyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KL6DZ+mhLRzjaNmcT42pTRNqIAAAh3F0VY/d9uQMcWY=;
 b=oE2jRyHWlaPbCkst2RGrcY4qye4H+DlfS3/FCFS+OjmM9oYsjAzHIWFfkHsyqohoQDrfUOr5rFnGX/E0O5XODVrY4JyYs3Dg3tvXnRSGOVN7HF/MLzR0aJAcxJByH2Wzsl58588CDEOEPCWdotEg+S1pQzSfQcJb9EkjLOq4Il8=
Received: from SA9PR13CA0155.namprd13.prod.outlook.com (2603:10b6:806:28::10)
 by DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Mon, 11 May
 2026 16:08:52 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::ab) by SA9PR13CA0155.outlook.office365.com
 (2603:10b6:806:28::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Mon, 11
 May 2026 16:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 16:08:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 11:08:43 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:08:41 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 2/3] usb: dwc3: xilinx: use reset_control_reset() in versal init
Date: Mon, 11 May 2026 21:38:13 +0530
Message-ID: <20260511160814.2904882-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
References: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|DS7PR12MB9527:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f318bd-cbeb-4720-f71d-08deaf7797ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8UC34AYWLGZUyh0MQaEfD1Na582uyQRXi9tD/n8SddJBKcGzjf+qwXr8BG8qB1kfXDahpJFUx6iOfaZo6HUYWuwrptpKleChLUYlh4XKcBRl3H72LUf5sVo0enGRvVuNKGc5m3ZvSjWbJP2rzru6QBDLpwmNuoU0oJgJ3ppJMTDCANmEIKohk7ctPeEMVv6Xx83MC4Yv0h7ZDPLIGMHTz/73Oa8ikOWoz3JeFcUn7kEy28eM2p/4vLOjcV6y6uvOY87/0N+laC2wxEw0np02Hmkcb7Arl329efE7VQyiNyZD/I83RqY32f4kLRq86ey1EMDZplVSDnwErDqHd7GJPGO1aayrtZLkWNdbOQX2RCSpLC4N4T4mf8MyUhaiGi8UT4ve5Nb7Y3DWJCKw1U6CXn7qp2vT2QUigLAZ1V92m97ZPAx8XJJ2hSKKxcDm+MG01drMpJmOeeLk3RT087QXAhQ9vXBIILCsM6Jwir23Wf/K7DDqx/Qicdz0uF8bW0RdNGwMaqFW8oAWztoynHfF1sLgOfCvsz10tmOERX7nWoFzZbvO9MW6Rpl3Se2rVrMwuzFwgB3u/U+Pa7/9xm7pgKIbIL/jSoZkAs6CG10YuBR6nizBJ11gkhAPkGskVOs/GzkvEs3R4NxQA9nf/pdLMpz/7rJIgRrzAm1mXsjPXS16oQcQVsear+hGnRGQHLJrwaMxKWX746mbcVRzHf7aD2jwlU2OQIWqPyHw0c9F6bc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4qdNHZ1VqdJuWoWqk/kYoH0PPbYVMJ8sVZEt0AkhBM0fLMowBM69BH/U/YPHsC+EfxF9H3bZD94aO5mRUEWgMr0iw2vXee/9lPQaYuOij0Qxu8n3rkmd767/TXlsJDxlobosX693/a3926my1D1Uc9bAnNQnl+kNnMv9co11/YrxPSuMoYhqilSGys2EuM/bX2noqm/Zwwr8FDBC3Ini7ihLVLLXASRqtv3iMmbUhdT9WxYoDEx+gjusdSZgsG5K7qT0azmAW75bC2AT1N8Oj9z0qVbshOLuPjppWcEg8CbCAkNye94WHEOkHKttVpBy3JXWFKt4dxmXTyfgOX/poWs/YtyWWE7s16uSZ+LjpVxUzk7XaQBmKS/GtVzkHYi17I3Dd5UCW1KuMfubVutkeelUmaTna4JsJbxujjSA13ZaRQqexmbu6MBB6EBYYgEy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:08:51.7799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f318bd-cbeb-4720-f71d-08deaf7797ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527
X-Rspamd-Queue-Id: CCD01512A66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37270-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Replace separate reset_control_assert() and reset_control_deassert() calls
with reset_control_reset(), which pulses the reset in one step. Report
failures with dev_err_probe() and a single message. No functional change.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index a3c7dc258c7d..94458b3da1a0 100644
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
2.44.4


