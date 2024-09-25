Return-Path: <linux-usb+bounces-15454-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D21DF986497
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 18:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DF411F21665
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319734643B;
	Wed, 25 Sep 2024 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qan2k9q7"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D4917C6C
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 16:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280942; cv=fail; b=AbqPqdPgGiH4xdb4Ctg4sGth0gvSJx2ei2DXbHPgjPX0L40FRp7mb8F9Xqs2i7z53ICnWfFaUxB9ACM60/ugZpisUJIFSH6P2jtTAwU5Qm2rmyjGmEsAEfxNHgOd5xgK5EkG3+jBbVF7NWCTFhJPCTM+4KTUSMJ46JjYze8aKP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280942; c=relaxed/simple;
	bh=lpag7X55cvGqOY4C+LjeqtOE68OarByR20n1O+/p1GA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qjfs/TwvzYHl4Va7iU1pX4vBp3qnN2VN9aj+fKbzQ2dWA8/6yjQMw8hbjWPnrQsNNX2dscCYpOlEPz1lUSAubJmWZ4LRvTk2ub5IZB8qBKp+OLJZM+Sm+Hiimk0epXZSuV7/tEUOQnRCYzftKyJmCCYGRhHqu4IXKnXBzzRQyms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qan2k9q7; arc=fail smtp.client-ip=40.107.102.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9rrkcmNN9ZzrxLMxhpzi1KIG59A6APhJpMmBILfXONAIurRQvh4+hLPGrLtPYihX0nDTFSIMCoOoTeitYnwhZd+RbMVEJ+WaJipwqXSmupg9dcnTUdj7kPNBbTeCrS7Sg8pJ/4ik2I8FQXkn3a0nEuvN3t0Bto25PH6oSKmPlMVvpPDgZgq/q2rkemNwNj47EbPYSIECfFVFRCE2J5vKKCCldWOSjk+bSei5XmZYKV/jb1uR4PyxgkZJ+XHqrmM138roUL9Uc9p/FhZOGWDOIcbn3CF3q40LsSYEv6/SfaOcVaU1y2HFMmUvUu6u4bh0lfgLrHwFR76p30OsjyueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgoypgO6xeF2iajsi3vP39fh/Y0fSBlZ0k2YQ1HyrC0=;
 b=jgbBGe3b9AegWc4Xqm4Kat9vK0guKX4hibtpa0BrCO5QfkRVTkMsRjYTNrnjc05PKj0TakucQHAhMt4x06Qvjlio1EWrLpdICKUrBR11WQ8KM3IqW9FTe8WiH6D4RtaYQBnjBrkPrwlb3zgccFtvHYm6u7Wak5sgUJXAGbq42ge7rRm0jnvai2cvcQRZ8VS3Ydl+J6gFjRi99cjygAUkDE2BY0CyvpujJ1kb5R4sL5Q3m77nbx0UETEqWLrjJMQossaMQbxRoWYP4DtN0ixicik33qn8PlhkoRyl52pDYwx87RVbcMft0IxVK0IiLxrHqqjoLkmxnSwYK+DIapE1vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgoypgO6xeF2iajsi3vP39fh/Y0fSBlZ0k2YQ1HyrC0=;
 b=qan2k9q7f/lO9fQ34blVMuCEw8j2mI2t09mPbq/vfQZ8EwH8LeKneNqGFbSS6K0WCKhhaEafQ0PPdRVv2q1vRXp0iVRLNLjWuY0CrK1zjr2GttDXzqQyeE99ZjEEDz6VlJq5TX54sV+YVA/DIGMTvLKYIR2NrIZdHIqBoDt4TzA=
Received: from CH0P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::10)
 by SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 16:15:37 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:11d:cafe::6c) by CH0P221CA0028.outlook.office365.com
 (2603:10b6:610:11d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Wed, 25 Sep 2024 16:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.0 via Frontend Transport; Wed, 25 Sep 2024 16:15:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Sep
 2024 11:15:34 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH] xhci: Change pm_runtime_forbid to pm_runtime_disable
Date: Wed, 25 Sep 2024 21:45:20 +0530
Message-ID: <20240925161520.2736895-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SJ2PR12MB9161:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1db9fa-aaa6-4fa5-4055-08dcdd7d4acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YH0pd2uHQK2sk5WNyHAjYex5xBP6zwckP19gJwjaF9tmpq3WHJ6424mQkzJ/?=
 =?us-ascii?Q?67ZksVLyLb773k/XW+mVTxes9QfaK52sroDNzcxv3KmfyjCnymHG0vktGr8M?=
 =?us-ascii?Q?Zzj1wd90KLAElan/1E99JMdTcpBf7/nmWJogK4lka8L+M2YU7OA1blqpjMol?=
 =?us-ascii?Q?nu25Yo3hNADp8Yl15p4XyXswbk7SBSl3thlHxPpKMQIm0J3pALN+EdHCLXjw?=
 =?us-ascii?Q?5XGbmvGH74zyZ0OOaeWDOkVGb8XM35IJAkPU08J2Z1KA9S55lXIsymCpLSqI?=
 =?us-ascii?Q?EfNFnRk36fBdXUuxwtP4vRSQVzSXXxy2vF9g1t9r8m3i5qTxTZDAecsMhTdb?=
 =?us-ascii?Q?gknVsxIhUAs+LGUSASmO4jFY8S3aQE57e4eBi8j5AdoJJqELj1U1or2M0Jhu?=
 =?us-ascii?Q?6uptbpU3QFVQeCe7s8zchCV11aB009zzJTu/Kx0rzq8JbUy47VT1exk8dlNO?=
 =?us-ascii?Q?G0ZcTbJzUYuQB7awYWkyxeUfQDazTyd8OdNBe/82s9b+bQD35W0uwl41VvLy?=
 =?us-ascii?Q?YqUsk4BmXfAKQYGQ61mAWgd3vmimYbqYdwDz9Lx7opTBw3BAzCl7QQYuUXsG?=
 =?us-ascii?Q?VobilNsNZ+E72xSYy65iR/IX2LOeQlowPGNrSznOecxA9HNq6e/U5ZQ83D0u?=
 =?us-ascii?Q?ns+JQB4A3cgnZTBdppwX4q8Jw0XbOY52BLwn2VEOikBg1ul5+3Vd8G3a/ihf?=
 =?us-ascii?Q?+/NvzmWwxJIyVcTsTimCGGvLQHJUTc/Xka7FrQzvavdWuejf3OoRAwK/UDjI?=
 =?us-ascii?Q?IRthJ3QF8fSrneYXAd+h0OadL9j0YDUPCh7yLBFhQ1qA0rUb2a5dEt2g6rC0?=
 =?us-ascii?Q?8x/M/u19wGAPemasdOd6tYft1KMxNP+WhXde+Wvh+SV0CteSTBhFrsJil2xe?=
 =?us-ascii?Q?5c28In+FEtg1sEnd4D+0AV6JE5XUMQMNU1MeW//pywXMvbnf5WNoLw7cwR48?=
 =?us-ascii?Q?uWEBBxsqufMavrtdEghWvBJqblEJIZdqsqe1MFrSZ2Elk+7VamwXMORmd2Lf?=
 =?us-ascii?Q?4zucTx1pHYsiTi4uy+wPIR4at9QfGV33OiqqeXkO2rFIwaBlkS3VhDSwBNzO?=
 =?us-ascii?Q?kKCccbluVvxWwzSRs4boK1hx/sIEpXpZRzOM8fuwsN46lE3tNtiiqsiIp1Ha?=
 =?us-ascii?Q?uvrFIVte1SpBgdVRHiLGwCOqwkcQE+anYHAnk4jT7ihEfRLm9XOXR6RI2qP4?=
 =?us-ascii?Q?WyrxSMMXEYI2gu4NTRA8q2VOTd/rILRR5M2T2OGSWppt/TaQKqOuTZfjZAej?=
 =?us-ascii?Q?qzd9g/8pnAiwc/uaKThaOtZh87lnGc0EX3XD/AbJZRPJd0IpSn7vvNuGi3iy?=
 =?us-ascii?Q?TfaCxgxH0OCG8vuKcHFFUVniN9T4/c9K1fwXxxQ7dJPcUQjlUkGGtt8emsE9?=
 =?us-ascii?Q?CkJ8y0Q0ea8Shj3BiNrtBfgpnC0Qcu7aoubzD/BXmokSAUFUt/y7mBzVwNgg?=
 =?us-ascii?Q?kSxLFfR9WEAFTypHCI7Rkgu8ET0FxwrF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:15:37.4315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1db9fa-aaa6-4fa5-4055-08dcdd7d4acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9161

Change pm_runtime_forbid to pm_runtime_disable to disable RPM on
platforms that don't support runtime D3, as re-enabling it through sysfs
auto power control may cause the controller to malfunction. This can lead
to issues such as hotplug devices not being detected due to failed
interrupt generation.

Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/host/xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index dc1e345ab67e..39ab32fed3f4 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -635,7 +635,7 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pm_runtime_put_noidle(&dev->dev);
 
 	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
-		pm_runtime_forbid(&dev->dev);
+		pm_runtime_disable(&dev->dev);
 	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
 		pm_runtime_allow(&dev->dev);
 
-- 
2.25.1


