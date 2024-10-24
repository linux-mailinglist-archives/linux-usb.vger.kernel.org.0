Return-Path: <linux-usb+bounces-16632-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3149AE3B2
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 13:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A79C4283F92
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 11:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5601CEAB1;
	Thu, 24 Oct 2024 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Elwg8ZMs"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D11CCED2
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729768907; cv=fail; b=BqCXdeDc5icLVL9Dbtb8wPRUVRhaJSi0k/CcWVDvgWozbeITdTZh/EXM0A4hY9Clf+kSp/zebiDn+9kUg5Ks51z+KLmN86fAb8lu/TrzLtnq3HNYBSaDmcNuKKO+mccf+3/bgBxpns30AB43lAZ6WZipnQZWkDuAesSlG6BGUm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729768907; c=relaxed/simple;
	bh=qwei3fk38t4b6n0CAX7iSUMGARUeKSF3EvrgNxl9gXc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mhpcowTvDT9iD1fQUXsu1uJUMwYTcsNU3oy/FN1mxSxRjiOGlGkMFh+iFgXn9FnELepPP9zRqDcngXr1kDYdT2t/72HiLpW/mCdMiZEpEEtWhKoobgqOSxJrWOTwjT1Wiuuy5NyorzmJsIpcqQTo6a2/gXJYK0VTsV1swSwLkS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Elwg8ZMs; arc=fail smtp.client-ip=40.107.100.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZVLGc6FCreE2KAabtPvMcDA4mlKR+E7R/GQUvHx+zQbF3tfoceMf2jTTGfyW0hRETIoYQ1b1HW/8UJr06emFP2M8Q6REuKo4/UCKFhTOyvaGa0YF3D26W0Dtf9ace+D32iSxXOFAkIXtgBan99DmaAvKp823II5j2zhUhBcAd2mnZ+AQ20cYnj+rp3lBH7aFt72yG6bZlL9IH3ALQwkTuzdA+iyS806nu54nrGsd29599gFk0QPf2tFUJSYsfwm2N+Z89P/2w5T/no4X/daiw+cui115T8Vya7n81GtQVSWObveC0lwzV81v7c7vrvmVT7S2N3fUrIlDk8Ahl2GEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwY8AzQ2BmK1EliJUrV823Ypbi7pVD3UqJCJCHtXsRI=;
 b=w/sWNj1BqHUVruHN7CaNgN5xcPNkrzOU/0172mHutdMLjFE2/t8rjuR7N1SRfIxnfHgULNfaCKTUtosBC2/JgqLtteiIdF7foS5QfKpL/mDK2NdSNI7HoIRBmaHyO7hr9EzMghBPcjcUf+bi7zVBL+TSXPesurX8yN2wf3sskwykyFqLXv6iqm02MHPlR1+BlQcf12NSm963IG/ze69n5KVOHB5Ddo5o7DndxZOWuXyBeMG2Jkl7ScpAYNYiLBbCT25pZw4683vIKDPDVCSRJ57ZT0q/BZ35nqb1YinmokUOwFjNsELkg8TW3+0r8yWCQsI7H1NB4USwEvX/g/TObw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwY8AzQ2BmK1EliJUrV823Ypbi7pVD3UqJCJCHtXsRI=;
 b=Elwg8ZMszkooNHzKDJ7kphD7G+MJKeFYnatWLRMkfpScnz7VpMRBVi5K6TogLRrIc9gP2IgZWaxnjvXUTevaOSQdo8cwntVz4kCXjpj28GK+N4+iCNUFk09wzutk38ni5/CtBcym+LJe1EIjdK7EU9fw1wDmyOe/xVUGEFR73SA=
Received: from MW2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:907::37) by
 SA3PR12MB8812.namprd12.prod.outlook.com (2603:10b6:806:312::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 11:21:41 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:907:0:cafe::c8) by MW2PR16CA0024.outlook.office365.com
 (2603:10b6:907::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19 via Frontend
 Transport; Thu, 24 Oct 2024 11:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.2 via Frontend Transport; Thu, 24 Oct 2024 11:21:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 06:21:38 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH] xhci: Use pm_runtime_get to prevent RPM on unsupported systems
Date: Thu, 24 Oct 2024 16:51:17 +0530
Message-ID: <20241024112117.723413-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SA3PR12MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e35a0f-6303-4a7e-7379-08dcf41e0878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bydLqn3qiWyYHqPGzvmGMRKcOd07nIvC1APmS2WNbeMFl1GaC/IHNfow2Ly+?=
 =?us-ascii?Q?RzGfVpyiFj4QBowcXK0TqraiJRIn+qVqZzopxXI4aFUHhMXjN2X+OoSyzkRY?=
 =?us-ascii?Q?Qk48UweFZ9xqxeidp2oicwfvJwsqjiYH9X2gVfgsn5xSsQ64LvldVtdYX0bY?=
 =?us-ascii?Q?982l5iNFNWjrJPF20tD5RWDIfhiyhB3kgWE72uqFUTUXCAhF4RSe4EZl/4nu?=
 =?us-ascii?Q?aKaI8RTweiENec3IFISjF6bX/mazvF29uwRZXL36RPsMPqiWwDQ1i0UDnalH?=
 =?us-ascii?Q?+A9UJTJ2bzLO63fFFxdI8wyl3d4OBmJsJZoOfShfX/gRdLqacTO/Qy5fjcE/?=
 =?us-ascii?Q?YES2Sfga5J4BUiGK3PCn0yi4Jj+vPggIJPSLZ2vs8UPa6hBuWZiQdpJZBBJp?=
 =?us-ascii?Q?rRv2rfQp5rDigkjtsJ3JjG456McGd9PxgDW1uvt2OOMEhX2lPSPsWiSrBowa?=
 =?us-ascii?Q?WoYA1VlGNq3kpREWKg5A/wM2ueFleuM7GfUBNh0T8oTbDesyDPjvRG0SG5+m?=
 =?us-ascii?Q?DUuyRuhKOZNP5qJ2ErS+XUh5r4CjP8p0OHtlkF7pwoHs03j+5XoRvUyZnlu8?=
 =?us-ascii?Q?elr6bapZHj7+EL74Bi5t5Fdjt+dHzpg9PlZJvCT26ypXoUn8pEMHBxOMKKJZ?=
 =?us-ascii?Q?U7qHVvSpuml5B1wuQWmy27XnqwofpcCPyHnXOTbJEGDn/aIdvei2jhlDn/a2?=
 =?us-ascii?Q?lIfD8fSaO+Z9rNV38OK2afQoPpb1ROb2nRnQyXX4/Jc7WlFlkq2swB3ZAo8F?=
 =?us-ascii?Q?jPFUDSXiUt/5fN6cdcEHI3TpcEeYYHQ67q6ZtVlQ38NE88Own6RDB81PYDmg?=
 =?us-ascii?Q?JgYlLcqYsfA4wZWSLdNmWRZKJqYaOwvZ02QFl7sbMcjLUx9YjyVWaD5+5TIb?=
 =?us-ascii?Q?sE+/DqzVowJbEDUrUohh960jLVbRA8EMtoNZq05MngBlvaIQgY09TjOWWB5F?=
 =?us-ascii?Q?NViRNKOf9a/wcK6kq6Mu+PP/KcXKUHdHjkYRNMKFEXGcTNqxze+4BThZdMTQ?=
 =?us-ascii?Q?PtnT16v697QHjyHVFAW9Rf08dcl+pq+xHA0uHvOQ+J+T1iUpP/XlzKGDHLVq?=
 =?us-ascii?Q?eGshRL2Og3384U64RpxY+jLo4VejD/Cd+jSsGWOZYoqx5YBBhZ7SvdyVw1mf?=
 =?us-ascii?Q?e1ogyiY7tLcjw2eyYtoLl6z873H9xRKbLBPw3JJHAKSU/kDcOCKp24Vo/rff?=
 =?us-ascii?Q?YZQfS4gG6CqtVm7D4h2XlccfARiojjmZOifc/Fd3LmfYvh6ETY8EY2meF5OY?=
 =?us-ascii?Q?lMTZ1dlrKtNkqiBHvVlHKl976Z2gTDAj4/EeGCosOYqZ54Y4hlXFIMasqCYa?=
 =?us-ascii?Q?kkALN03n95U4nyxqGvN0zLHhpgj12Xw7si0n6gaDIGzcoySUJLJUQzEcWaDj?=
 =?us-ascii?Q?8ikFk1Fof+uR5MYIIpipS3CBLeVBcB/faswPO31MGJ7b0bQPRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:21:40.7294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e35a0f-6303-4a7e-7379-08dcf41e0878
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8812

Use pm_runtime_put in the remove function and pm_runtime_get to disable
RPM on platforms that don't support runtime D3, as re-enabling it through
sysfs auto power control may cause the controller to malfunction. This
can lead to issues such as hotplug devices not being detected due to
failed interrupt generation.

Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/host/xhci-pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 7e538194a0a4..cb07cee9ed0c 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -640,7 +640,7 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pm_runtime_put_noidle(&dev->dev);
 
 	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
-		pm_runtime_forbid(&dev->dev);
+		pm_runtime_get(&dev->dev);
 	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
 		pm_runtime_allow(&dev->dev);
 
@@ -683,7 +683,9 @@ void xhci_pci_remove(struct pci_dev *dev)
 
 	xhci->xhc_state |= XHCI_STATE_REMOVING;
 
-	if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
+	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
+		pm_runtime_put(&dev->dev);
+	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
 		pm_runtime_forbid(&dev->dev);
 
 	if (xhci->shared_hcd) {
-- 
2.25.1


