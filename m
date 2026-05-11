Return-Path: <linux-usb+bounces-37268-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPrJL0YCAmrknAEAu9opvQ
	(envelope-from <linux-usb+bounces-37268-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 18:22:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF7512060
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 18:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDB68310F43D
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E3643C05C;
	Mon, 11 May 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O00BZMgA"
X-Original-To: linux-usb@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012067.outbound.protection.outlook.com [40.107.200.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F2426EB3;
	Mon, 11 May 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515728; cv=fail; b=pRh3LoLvnUcY6g2qZPWD5ypG97uDU/CYwKuwBZzqROIbVMWW2UTt7kycDQtpgPZcP7uLC27ec/ceU5xhpNFOtrm6M/UWwHSLUYRE7MQn4yabBiepCQmkPH7hd3IqBKy8TjflraJuHAVvIGZw/a0AjEXYWmXiJsdyNQYSBy7rSTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515728; c=relaxed/simple;
	bh=wg6Bn5YCymQY4oTXY57Wg+7JZ1esTvr2NO1vnN+ppt4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KjlzkIYiKaaJhwl9Dabso14cqS8Rn0i3J7lJ68jHEIxNqlXuwkIdRvNEpQlcYFDf8/fdf/H3sowzgEBnfItiXW3Kf43esXXFCqpfkGxPAo+iIp/BwBPF015J5JPnP9Sk4pnzNvy+ii3HgBplmRG94hdVVTRBvF0GJJ4gIOUgYqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O00BZMgA; arc=fail smtp.client-ip=40.107.200.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2yjK8A6RPzgx4DqrjgCFIoAHaG/ejWpSiheeoidRAEqA425rYFWHdKF9g1d6HFF5UD28zAa+Yx2GvjckNgeFmeDs9KTUzP20GFKltBwb894VK+XSN92PFAo8f/xJRvwa8yt9AypRsBYxk9W6m7wuJMYXeMvq8/Lyx68LQ/N7WBl2ggV5X4kyIksSb+px0K3uP7XZ4yv2BesMZqprBqwHzXWY68M7R8ImALlMiumtfew1Aa9kAGiUGOJIHZNmtNr0CtRWRTgx4z9GGtIJg7vi4gRC5md26YVhw4Dgy87Ag6HbrI3gWwC8wAy2H2sDDC346f1iIO3jHSBKfyj42VaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pmnk1p1wR2u51vF+qf9IlBdMpNuWfADZYy6Kwd9pNfw=;
 b=arr+rwBQbuxjRtWO6R5qSsOmb64vh4KeE7ZCrA1UB961x6mrbW2c3K7WR417e+Px+exsQOazPtedUCNvPEzFG4BQic4TAnHDW1nD1kTBnVBcVqfAwCZFYMGVjjh6W61wicofm8F2kzN5EuNOymGv1nLj7+QnM629eHpzzWAfkv4+lIr5HD4hpdAIKrufxaxrn91MTwr8FarC4VC4ubkkFM1olvUwMfQCZjnmi0ydKSpHNTlh4QCj+/vSJsHOyZ7N0InHo+V1k76ESkGFE+5MzrtiRW52YsmrD6Qa2vDjeH3c6Cch3oWOp1flldp9n74trYsVbOUX0hMG0DtmXvDgww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pmnk1p1wR2u51vF+qf9IlBdMpNuWfADZYy6Kwd9pNfw=;
 b=O00BZMgAyc9b5ZUYCCzZdUz4RT+9Wd5ljwfzkTJMFTd3v2i5+LcCQBx6afpoU69C6OeSP0FEqeq/1MwNLb9g9f/M4LAEeSZy//WS5oIDKUIJ64hM2h4bu07dsVa42ug9OQjeYA2i3xE1KPZjio+VgpIqjhlpxUw8pkJqniR/ih4=
Received: from SA1P222CA0164.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::29)
 by SJ5PPF09E5F035B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::988) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 11 May
 2026 16:08:40 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::d7) by SA1P222CA0164.outlook.office365.com
 (2603:10b6:806:3c3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 16:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 16:08:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 11 May
 2026 11:08:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 May
 2026 11:08:38 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 11:08:35 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 0/3] usb: dwc3: xilinx: minor fixes for dwc3-xilinx glue driver
Date: Mon, 11 May 2026 21:38:11 +0530
Message-ID: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|SJ5PPF09E5F035B:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7c92b9-fbf0-416c-bd3f-08deaf779116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SLRvZWB/6nZGvLE7W/RgBtz6RExKGK+fD6XQDdnWeAfhxV0zLVixXoWjUiQi6y8PeNGSoxRklmVAPnFJExq+k8pinGxAyBXHaZ/AngqSXZTFksyU49XHJO/IOH2gItYgZLkFcSqXC3iS0Orf0KfdMt/Js7xLJnQKRu4GatU2HRvWlmKvOv38JFZZcfchEB//sTBd0nbkUAyuroI83oTLEkB5MeLa6UyJYDgnjttu0OzvroPmaxFDFXeqmZN4FTknd4VHRtAbvcX5UjYMygwyxGMcbjAcFPFFR7Py8+oPt5CbxcHATlE9YxHQf68hwJL6k07XjZtuZLWfbJuRQSG7SYYwTOk7JQ0lOHLwXmj3/t5nPv3MoaYP3+y/Det71Wbg56W3KHX0pnxqFNRClrrlzTvSasO1+rVJUd7c8NHRyu4BPpAcXyRMO3r1QLxvSxI1plbNFdfPB8WAJYy2O6Tn82q5V1jjgEkmBtZZS28t1TEOA3fAf2Gfm+jCzQlMkx76KTRzS2srvfnjl+rrVJhc5VpsKwCYkm71I39toDxdPQDFXp2RIBoW82awEW7IBWcrbK7+POQXHkureft8jCGh0ILR8iOCvKfmmYQV7mIe7v/cNbidZfTvcey7jlbKWOuGOtkX7Y43TzcItGPXsMHBgCGLcclHYn9XhBepsj1bq13h3MyL7qrv3co3eXB4u4qRWxw0yA8i1X53mJH0leJhh+dnghdHTdccSYV2Gc365Fo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MF6ApyMTMvqvddThopXUYQpZjF/IQfjwoQm4dqWy3+ksw4gh4tryjFfa+kZH7ls8T4OgUjRdS/p393aWzYsK2oGjLnQ9Fi6l/6KUk5Smcncrz7aBBHtPOSX/o5ZyibIFZwFdcl2Ys0pCGb5nqiGMc7kaOhzmdzt2VmVF6ngtheevCP1hLv6l25X1ZnVoWNXBzeOMym9pgUA/uMfNF++/ilnd6OljtXrciPbNXP/lAJpE7rL6m92BkULC7/x+9DnwguGiKJw196P6OqesfaNCGwR+ouF8lOPQ4Xdt1tcWUf3eS9fH1wHfiTGU+f32yhwDpoQyyMjQu3jqDIE4Lp76jY4X00vL+DlOM1T9VCL5NxIaXu87DLEE5B8//LF+6iNvyguMOcLBNMosKP+WfMu5zJOFzcLFfN8TT+qo6/eozhN2Aveio1NRiJbCWl0n4ju5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:08:40.2702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7c92b9-fbf0-416c-bd3f-08deaf779116
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF09E5F035B
X-Rspamd-Queue-Id: 36EF7512060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37268-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Minor cleanups and a bug fix for the dwc3-xilinx glue driver:

- Fix a comment style violation (missing space before closing delimiter).
- Use reset_control_reset in versal init.
- Fix phy resource leak in zynqmp init error paths where phy_init() and
  phy_power_on() resources were not properly released on failure.

Radhey Shyam Pandey (3):
  usb: dwc3: xilinx: fix missing space before closing comment delimiter
  usb: dwc3: xilinx: use reset_control_reset() in versal init
  usb: dwc3: xilinx: fix error handling in zynqmp init error paths

 drivers/usb/dwc3/dwc3-xilinx.c | 45 +++++++++++++++-------------------
 1 file changed, 20 insertions(+), 25 deletions(-)


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.44.4


