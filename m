Return-Path: <linux-usb+bounces-37269-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN75HxgFAmo3nQEAu9opvQ
	(envelope-from <linux-usb+bounces-37269-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 18:34:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8547F512434
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 18:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC82B3132FA6
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D53C43CEF0;
	Mon, 11 May 2026 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JU5poEU6"
X-Original-To: linux-usb@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012000.outbound.protection.outlook.com [40.93.195.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CB943CECD;
	Mon, 11 May 2026 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515732; cv=fail; b=Dlh/AoMsvdLYKIXiDS9VoktkMnJ86z3SFWTDbW4hf+NqLi+afebNmaHdabqO3+uQWMWfVEa+/lC12Z+NC2ALaXlqSoRx5uvJDQX82tH0XOYNpdRJIJ1uAo4scrLe+Mm1nGvyGiDyk9ruJ72pizNzQvqtch2wMnNGiUzXi9qcMeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515732; c=relaxed/simple;
	bh=5A/iTGh7DjUS5p8cUKMGjtOfQE0zj5VlcJfSgUi4sas=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QgoS6TqEnlrQ8dz0vjXGxsrV4/KgFh7dF3m+C7F9tUC+mzcCD/Gyar+Zcg7q+PlcdwCIHvWBW9zV43Olclfd44x9CiwTLutClR81TMKuaKX74J9RIgA9mnlNS6GEmqgefTF73BnrJRFzAy44B5CTfIZsWMW20zM47kR8UJc1hBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JU5poEU6; arc=fail smtp.client-ip=40.93.195.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAdYmx4+g0mud8qsaEgKQLxyrEIVeYPYL5VnJVRg+qMZu+DEizLETQOB8DuCk5uQvyBufApU9lV52HP2vYMPnEhU/FRxrXo7Px5qtilKZS0DQ2iR7pnWjC9akssSVO0WDykLc0OymOeXWMJgPNT1J2gwRP//fO7/IQVuhbfihVsow042VytL4YqIfPyx2yOJDcJXlrzYatTzIjSy61qWN6o4RkWC8XdDv/5AhF681eeO7tFzmEsyF+g83PUwdg/Bu1LfP71zsld8pCAXyPC3oLH6gJu33xn/pRNLSluxPP8DMX6HwrMBeStQI/3nLXMCja3vkCN7R1k/UNXw8LxA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6bvowfY22m8biTaw0TdOcjMJUVZ14CmEpwh1B7yrxM=;
 b=oUBbkTKwyPhYKWwjcgxbakdHwOa2o83v04b+W2r9BHwG0w4qpN3qYidukiE8eoKjnA6ByVskESqv2ZDti3wo0pIX/kGcZmP6YxC/M/tzYrWvFHMKFkbK5G+Bpeepqc6bmw6gax/aXqU97h2irMyrrb6HcMF221Di++iptanqDmgSRIncYYaAXygpiW0yB8sH9mvA3/tJw4G8Kgii3mlK2rPlvpD9rTAn4+4ILVo8aedOVGbXn3Zhcc+uPxaMeKwaBVXBntSCGBGTJpKMcYzRkdbWNuUPH7xwKUvDLcrWpDa/MwEokdX02PKWxga+2PAZ3kWMrucatx0MlCygGdw3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6bvowfY22m8biTaw0TdOcjMJUVZ14CmEpwh1B7yrxM=;
 b=JU5poEU6bVKejaIhtRnfwaE83nNwYoHtloQQdgoLS4I0Bjp/dIaD2A5aShBCYJFTd9aL1503kXq5zSizdlN7NjlgcmWbtyax1eIlDWfwAyDm4oUb6ucTlcv0U+o6Kvj5nsAgtpdpGL50pNVF98r1ynDJnamPfdKeID4ZbZsCBUY=
Received: from BN0PR08CA0030.namprd08.prod.outlook.com (2603:10b6:408:142::9)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 16:08:45 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:142:cafe::99) by BN0PR08CA0030.outlook.office365.com
 (2603:10b6:408:142::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 16:08:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Mon, 11 May 2026 16:08:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 11:08:40 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:08:38 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/3] usb: dwc3: xilinx: fix missing space before closing comment delimiter
Date: Mon, 11 May 2026 21:38:12 +0530
Message-ID: <20260511160814.2904882-2-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc6bda0-733d-4397-fdb6-08deaf7793be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	w5Vn/JJPhBJlhv2J7GZ8WgfSk8isRgbfalRtI0dyjqHkA0u+reifWmJKuZb9YkQTE60jL0H03qM7+n00kaTp7+utSyWKFzpnEuS/WtG2FOxY4X8gjiwV1wIMHr05QD7QZlHOLVWzypRgpy8f9gbPZS1oiLJpqSmu68ruNhy8wfi6U/ahJGGFKderStRy2D9vSlefTIGc37IMTkPBGMHoPiPUa8t2vq8lnNE3FUJMdVJ+iapvH8ADx8PVmjUcD1L9yeblNt+4lTB8Qzf79kGh1ESWweQmLlmHX5QM6BMHlPSpG1N6ywXEWDtigFLk2s32p/jpBv5cJA/fAbSpVRF4fGsM5MoKT0P+VpWicFV22ZFPN2c8xKa1Q75CrrMhOElzweoaFducMktZrEMP1Dv8rCSDPhQka7ptNeUKIRB75MfZav4lJvZxqlD1t+1r1HzWFKAo2BkG2yuTtkvUtVecTi9WknTUkuj1hnXGW8aqCKvd/Qz6QxtEMUskzjvk2/IGfd4AhoOYAecJNfps4PDOL5DJSYMro7mevnw3+YppbCER/ZmWY+ICN8IHm3aT18Y2J1ADG7ZEULACLpxJkDgaOzHhQpb7FVedgf+WX3aHKgvzp0R3uCi9FpPZbv3j48pIe2JZeAD42zV8IgU0K0ztTo/x7h/FjMCyr61Jj/sBNAgTaUlDr2GLj2W6g0Nj4InICAq1jHWmR8bwaW4hV07klfAhOgMFjvR8bUtNJY2UK+M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6qE4DsYPArEoPk70DAsre9eWXy7QHkKtgBZLG4Lrs85puVhz1EgBH6LVgQL5C+SzFp7glZq9OFQMpxnuQP8tN6vdIBkK7fvAvBmj8e4+hB188EGshWr7MUHWYkH1oe3hGMPCt5MawNnYsRF1nWcugtuFWaBxO1rO8UQcWxO1yRU0xoef/0m3SgAOcE2cP7vnBFSNa/I5aaOx2mwxOXuJF7vWUr4B7aI9MM+llkj3GchSWtRZZt4x5dGVs6d89y5jb17p/g3DbbF0EGSdZduzLlLJHWT95y8wn27oqBT0tSmmUJ6JdlRJG/KOaLk8zS7vZMxECYn1+KHkeiWv+E4RhZaQ9OHzExa+7OIVExdZ+JQBToHWS4hNAKI2zmjmVSfcDhQND5FfnFx1uqyb6GoWQ4AVxc5bJA9y2EJ8XWGLnfxi8E8FhNH/R9qbHwy7TPP4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:08:44.7504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc6bda0-733d-4397-fdb6-08deaf7793be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
X-Rspamd-Queue-Id: 8547F512434
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37269-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

Add missing space before '*/' in an inline comment to follow
the kernel coding style.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index f41b0da5e89d..a3c7dc258c7d 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -196,7 +196,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	}
 
 	if (priv_data->usb3_phy) {
-		/* Set PIPE Power Present signal in FPD Power Present Register*/
+		/* Set PIPE Power Present signal in FPD Power Present Register */
 		writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
 		/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
 		writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
-- 
2.44.4


