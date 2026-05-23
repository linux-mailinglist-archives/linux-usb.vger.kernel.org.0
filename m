Return-Path: <linux-usb+bounces-37959-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNhJArNSEWr1jwYAu9opvQ
	(envelope-from <linux-usb+bounces-37959-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 09:09:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B23B5BD7BF
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 09:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 570193021B37
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 07:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755D63451AF;
	Sat, 23 May 2026 07:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kTYhnWeM"
X-Original-To: linux-usb@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CC734402B;
	Sat, 23 May 2026 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520143; cv=fail; b=UGRNI1gM7GsSPF9Z1NovGBVQfvGLTLEAph7O7HDxdt15alVzA+7cyu1xMdlxuwu4NPOT+Ftv3cva8aMDbjbhZ8F5mhQcSXrpqp/I3wZFs/sty3tNr6nvP9bXSLSY4FC8kM9/S0PVXbpZnIM5J0qaUvOpjszKFb709xJbg5lBtwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520143; c=relaxed/simple;
	bh=FmgNfruN8Z5XaxKX4f96IDa/FgFCHepeonU0y+atuKI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UKJicSfPSyBK7kF3ahdhYPZdnuSwHY7ujRmNrFYkMSG8qFAht/sVgSGEMqznGoPIQii85iB8tam2HprlZPXGoJfcd55aBqmlCgpaR3FyHnGliZP15jVJCloTUg6a4BK2QGIPgWoJbmkLMI0n2gQClHXZBwYUPOEXWZfE0gL8BTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kTYhnWeM; arc=fail smtp.client-ip=40.93.195.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN0GHyMkgDJSgwTbo0VC8RAQj9ANlvnVnHnpZQ7XAFqLpKuAqhv1R5imR8sSaoaI9CSCYe8CLa76X1TT9iYcCOLDisHeyfHAjRdZE//2hb4DkHM95vTIteiMU8xpcdxK7/5U6/ExrakCZtRO8IhsSgvodX92XgC0fzHc3iAsmZl67tyiLE/q78XOLgQ/NgRam5Uop2DcoULHvlVUvDXOMvrLg4UpPBFeGmMViE9dkrsTDhEmfsgU0be8Jb/quFOk8sGVef8zSRsT9PZYt3ahowrRQkH1FylcwKkXKgWa8me917azBdPYnA9iONfam+cyPS6jXDRZtV+s4aw4+9rYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8fKpVGGh7slQFz4F8D41MmhUPeOgy6Utsd1sGDDaic=;
 b=nA6Nhu2CftjyHBltYAW5BcBXaJow1GyZuV/Z6ug0gSC270rX5p7e33ERmGpMuFU2YBXk6skkk7kkVDiOuA4wk+zDiLzCeIy5A5wJbabdw+Z0AS1w5MynWptLZUvpDbm3LtTV5Ym8XZx7uMHpm4cT0kSIbwLx8Etc1229A6rg0OWZ8c1BgzvL/cKMt7CC49VJ+CvkJ3Or8P2vjs1USz1mhWHCXErAb/0kI+BZXqVSh2nqdQm7lBqBDp+u2W3B3kbocwkvsD2iVFPbxzhl5whKe3tA8szDHzNCWqELNp5msPTsWCF12TzJGOxJwsEY6Rp6UPTLkTWr+Gotw+CYkSOA0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8fKpVGGh7slQFz4F8D41MmhUPeOgy6Utsd1sGDDaic=;
 b=kTYhnWeMWd0g6h2XvVI+06OaCJ83dUqYcEEgVaBEaW3dKoRbONuDzqGGI3pHBIZPXEDzUkYR4TOBul/1I1J5BqN/eLf6+ywj8wnEo/6dX3P+MOQNsbVnrNhYEHSgGvyu/FIpQDA4Va6iPHsLHL8+2XXF3aqx1bJ/E5S7w6+Vg6Y=
Received: from DS7PR03CA0250.namprd03.prod.outlook.com (2603:10b6:5:3b3::15)
 by PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 07:08:55 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::7e) by DS7PR03CA0250.outlook.office365.com
 (2603:10b6:5:3b3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.18 via Frontend Transport; Sat, 23
 May 2026 07:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Sat, 23 May 2026 07:08:55 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 23 May
 2026 02:08:54 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 23 May
 2026 02:08:53 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sat, 23 May 2026 02:08:51 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 1/2] usb: dwc3: xilinx: fix missing space before closing comment delimiter
Date: Sat, 23 May 2026 12:38:36 +0530
Message-ID: <8e6f53ad4eef8babb3c72ae9fac5130342760da9.1779518171.git.radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|PH8PR12MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6b7646-1eb6-48b9-3443-08deb89a2711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	h3EMgszMK19PVASvh57Fc366/B4Ao/EhKN2LThUZzmh4m8c/eJGSab2rnMAWxkyw7cuGf8U/wzgiP5/56ig5/CbN+s0u6BzMXBMbjVBnvymgS1ZDP33BXXDrz4FT6LJXF+bYDyb2eCdLLDlO7wWtWVe+Nl5S9HTD2wJEsEXd/icUhbRITvOhrITS6RzMwTMPJJnPl1tacdnpNmrDPA+YrQpvtKEnECQha3lX4axC9aU8HFMbeazrMQW+Wcl7qVn2OyFxjSwKrR4qbZ/zEwNY0XUKsifK+WNj+cfnapXePvPZnEQTORguULsxCD09hhbxNcvu6Y8Yec8RRWCBnGuwOlRc6Du1zUor/l2tmQVsGRBZoS78zxAvN0rVqJ+g+Icc7XjPQZiv0qApKYONPSFNart7KMeLWth+1dKYXWiV6rOFNKLwHEauF8QQ0PlpozXVN+DGkNaOsSdA9vLprICi/3nHY/qne+zSCyCVPNBYu83O0WAjh5FyDpIP7jdN0GzrytOwRDRgbSR70co1YiuaEvbuGQIFxGEoR0MVFoZJrNdrNrEXQ4zDnUF8Atqb8tSQtzxA0UT9duTNMPfKz2V3H8KCIAPGdzUxoXhVjB7VVntZc19N5keEsFe6qrxqtMPibvIG2nnX1eScEYZ8XIxh1YuDjFzd3SibcafAZaKj/ueYMpsTDZcnRzI/7nfJH3MWEVGygNYogB5Q880NQ3dlvHPeeGxQq08LV0VLAfgnBYQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CKV4LivvQvLi2gdfQzafxkM/Or6p9saGayvTSqMGKrjmaYv5LpEczGpfgmjsgFuOX6rpb/FlutV/7aCWcuSYD+pJYPQkSKagIpn7xoJBVz6mFTXjnX9LwROVKw4K5Me8ya7qnj3uyWeD2g+YUGdqWBXohP+NCd3vKz7vQxzmv3xRt7xhwE7QLOzG1uhVDk8YKp1f8ZpVdfA/hZwLMUE0Z7d8KgKrLt0PSTBAbNHVVKhWA5aU+WcvtwUGlQZJDAfO118ijUgzgBnoNL2kNpbavTn3n9gPW7HB9HO5P9gg9l4SRLPElJlZFh6b3wPqDvjBxc0WCdVUcJNyN1i+L6h3tPcsYMRqkAVKpAjTl6ovaxAnCdt21K+F9Tx+y5igFnF/GlAcYF/daMEgJpYoAiQu80k1845YztRyoMGHdgrzp8EBVjqfuDwNPyZLAA39yxgD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 07:08:55.2221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6b7646-1eb6-48b9-3443-08deb89a2711
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37959-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,synopsys.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5B23B5BD7BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing space before '*/' in an inline comment to follow
the kernel coding style.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- Add Thinh Nguyen acked by tag.
---
 drivers/usb/dwc3/dwc3-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 9b9525592a85..02dc35e110b9 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -194,7 +194,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	}
 
 	if (priv_data->usb3_phy) {
-		/* Set PIPE Power Present signal in FPD Power Present Register*/
+		/* Set PIPE Power Present signal in FPD Power Present Register */
 		writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
 		/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
 		writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
-- 
2.43.0


