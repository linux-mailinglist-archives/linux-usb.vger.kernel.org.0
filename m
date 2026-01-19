Return-Path: <linux-usb+bounces-32484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A19D3A197
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 09:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A379131AF448
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 08:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E62733CE8F;
	Mon, 19 Jan 2026 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fw7ohRhG"
X-Original-To: linux-usb@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C5332F74D;
	Mon, 19 Jan 2026 08:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811033; cv=fail; b=CQqxqIZcMgVlit9n4OJNzWPaFAe5R+fJNgsUq+n+of76iyCBRJ7Oefh94hut2qi4AVBFUJFBP5RKpiomQ4OVwOC/gnDCIVqVvdjeR0kzi9czbXH6Qx2FasFebSlfBoI//WzEksb+pMlujZ1PvzCzBAbSXk+Oln5EC2JvlK0jAyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811033; c=relaxed/simple;
	bh=6YAU6ynDI50kfcQnnWziA5BBK2k0rktBTr5m+glUmsA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KEjaC0bM6vIMRn10+lMavkYfh30qZJEQURncjUHj2UUHIYiFlcsgcaEWj45RWyA0jGGu6Qa8DPntTDI0DYG0NOQD1YlXmVRnCnN3mHiUKCAD3opGYrU1A2eFld2hAevt/ZkB7QbXtnJa3lQquaJDDEFM5/4zDk0oUd09BgHsFDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fw7ohRhG; arc=fail smtp.client-ip=52.101.46.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIHQ9Nca/wwiNApkNhlKvim4EYOdGaEGjSvldmWoz1HJJXaxY3dsqslaSPo7SBQxh2ps1CzzDPClblYqELSaF13+T0BlG+yw6ZOKX7B3AGsDz+xM1PyBHcglpIPlpMkHh4L+AAYOQkSBPgwPVwzRxSUkrhFlK/4q3Au+h+TFHqeLlwy/B8Zg/4q+HtUSSztP8detDjE/E6ybS6lLO1V0aMmQQtvmkKp363ncsg6M5afXtgRg22j64gPTwmjWpVKy/htixosTswohQ5aBF5/4FbFKrRo3mazB+tKuiLz9kZ86sK8ZvIhBrbbfBBaqFW0Z4VmMBLrLs+zxl+9NVeQe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwQUPcf3FbjVnzRjaNWliIaupOrcQVjeEdp8Mo6fxxo=;
 b=CM6hk1vNhS9BIzs4ZgkL8jVYDChK/OfZBI0bzrDMRKpPyH1X3hrXzSLAmHHNFysd8nv+51nKdvEyZMBlFIbTPJlVRu1Ut2pxUb+Vvd/0MdWSVku5hndkfH21HIxDs2qVkGlxHj6Zo8u1vNplekqQ9uBuoeCGVUSTVt641p1fMY8iufUYGxbmUQB5WCsAyhqzlvFkM31WbqJTBsOu0QkAuzCbmX9RSATqD2AfuHohVsPRFwPSFIbrFsgrzgsAGXI5Tj1iKGrC3CxZ5+hojl8bQfY04HYYrg1kXbH87IhFbnoO7NbHP7GDQHRDNgO8YBndRJYu7jFqrNylqXc6pEmzMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwQUPcf3FbjVnzRjaNWliIaupOrcQVjeEdp8Mo6fxxo=;
 b=fw7ohRhGQUoXEVdW2c+eTYOvzL/xy9VZcXdr1J1j9TwzJmoBtI1Se6P3sf5eyTcsvi5up9B96hFwepFg8vky+bGrMooigBjOCiJXdGBAC54FB2iU1C57hHVUs30Tob/pDI618mLOtvuUKS9OCr525HLf3WICiU1AaC2pyMfLH3I=
Received: from DS7PR03CA0035.namprd03.prod.outlook.com (2603:10b6:5:3b5::10)
 by DS0PR10MB6702.namprd10.prod.outlook.com (2603:10b6:8:132::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 08:23:48 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::78) by DS7PR03CA0035.outlook.office365.com
 (2603:10b6:5:3b5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 08:23:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 08:23:47 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 02:23:46 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 02:23:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 19 Jan 2026 02:23:46 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60J8NfkV3221199;
	Mon, 19 Jan 2026 02:23:42 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <gregkh@linuxfoundation.org>, <pawell@cadence.com>,
	<peter.chen@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <rogerq@kernel.org>, <u-kumar1@ti.com>,
	<p-mantena@ti.com>, <theo.lebrun@bootlin.com>
Subject: [PATCH] usb: cdns3: host: Add null check for host_device before accessing its members
Date: Mon, 19 Jan 2026 13:52:42 +0530
Message-ID: <20260119082242.1922599-1-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|DS0PR10MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: aa78ffb0-76bf-4fb7-b182-08de57341154
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aqcztEisvDu60fE6wSTB0BKYq9J1n0vqm951IyTWgiWa/88ZLMCFTu1kZXU3?=
 =?us-ascii?Q?zh6L8A9jPkxld1alz47h49fjrrbl4COlpLZTVcMqxZTpyVTSxIvCmvMs2tRY?=
 =?us-ascii?Q?04nXBNPzfpcIy9PwikpFlYr+QpLDFoPYVBjl1xietVDYWTq8NUDyWHAcRTNK?=
 =?us-ascii?Q?Vomo7qjZPgNy1rVQ+PF9Tmjn6wTig76ElqI7aVwUxL/3LXHVJvvKDMRZglnC?=
 =?us-ascii?Q?c6fC07Ddhhf5yizlU1EBS5d8gthzrAUkPJ0E6oQkwRsxY1F6Iexn8fycEQk1?=
 =?us-ascii?Q?XuYrx8UhwjQ9j2p4DXzjwAgt6T0NNhD1MAovlrt3jO7FmQu1hXRN2AAeVHoI?=
 =?us-ascii?Q?7xFQAzUSE4mcKvROOr48b6HwBXuM1+Zw9XcNNUzYowU2qj7UOkrLdeGNMxFw?=
 =?us-ascii?Q?+TtKdZTuub9HVtFGg9yFmBNbMb0Xj5rT+WcbvtBL4HUjoh5/cBZhWv+Ow41B?=
 =?us-ascii?Q?21UHeiuz1ObQegJYzsRVDCiQcxQ3lrDg2U3gWQPbl2V2XFOAklO2RKn3urCA?=
 =?us-ascii?Q?xyJEjrL4BXc7bfva910205mvYFOOdNtqHpNRBpcLxrBPK4iOrkK7BDGfns3d?=
 =?us-ascii?Q?k6Uw+uHP0wnk/Bj7FAsH3GLF0ehlM4Fhs+Isw54JNItau5E2nsqaIs/s/dRK?=
 =?us-ascii?Q?FBBm7yv5v6220XZWHp5BYaDJF1OQ5crvoBcugiskzifbMFXObbOv6bm0VQ5q?=
 =?us-ascii?Q?AoEl+S37k6lQGn70cRa+beKr1c74vWQlpD6r+pOEexueA8ayTy7+Lv6XkKoF?=
 =?us-ascii?Q?CUs9aBpBEdJKRcfSopldkaRPfnmf9MjWCbexnLY1IYItq0iEewIRO4nRSNP0?=
 =?us-ascii?Q?yICaVcn8hkOMcCAd04atDQYKtnu08Nj+k/H1xIh5Dc39Bld8YxGjJ87Qf+ge?=
 =?us-ascii?Q?QKa+YE0DC6YWebdZkPe0SqZwrAh2b8lJ+AcvW8wgrNRsKCZVIynIvnCQPiYp?=
 =?us-ascii?Q?EIMZpp/gLr42lSeAcZBDg8x42qZvbvXN1qmII/uO41cHioXdAmPJVmhoUC71?=
 =?us-ascii?Q?IWqRXN/gUXlu7fAiKkjsJmnMSn0tCNqpV0X+qXRCK/teZHYhaFikxTj0rEZY?=
 =?us-ascii?Q?Q1hQFyhuZHTaw853zQ2XLCgBc0uKaVH+/ALLeZim2qp6u25TwjQht7jAz+lW?=
 =?us-ascii?Q?Vxd0izwa5InvV7ZPW/WrsaDnXRYpF68dQ95EWE7lSYYQI+lhz56wtdyO0u5j?=
 =?us-ascii?Q?TjHeKDODbs8lvoOqHFRTflHDVlqFO8IbmMZYfYHVTOmGXJX5RrkvKXKGZkip?=
 =?us-ascii?Q?aaD4pJspFgg+x/vgTbqOmpADSSH3XXVCjzNupkU+RHNYSH9Mw2+NinwdPzfx?=
 =?us-ascii?Q?rBCySrd/6ZWdt1eR5eJwep7yFfiEXxaWfQ9S51AcbEHCYzMUX5Uh7EJG2Lkc?=
 =?us-ascii?Q?e0lkw5saV18+G+8Vs/GQRpBy7FfAOsfuyS+B/uBFqBEI5bql/8JkHsI6kszZ?=
 =?us-ascii?Q?XIGZoERPVRw/y8dP95ol4bQuS6WffsWfy1g/USqFiikVy1SmnezX1Rg3rqhe?=
 =?us-ascii?Q?T6ezjF95vSNtU21eUNl0vw6S2oMdexU3QMnzTDEIUKbSLzUQjulj4WT5A1PJ?=
 =?us-ascii?Q?3gmgOy7Qrwli5RWzbhbidZlSufuaGZRhAwj34vgEWH+H3j9pQ/lwa/CJpUF/?=
 =?us-ascii?Q?8Mna5z9i/f+qGEMYbq+yAvmsO1v9vaskN1AyRZ0gT+zUVcj3CLzsfUDPr7Zk?=
 =?us-ascii?Q?egUrzQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 08:23:47.2994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa78ffb0-76bf-4fb7-b182-08de57341154
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6702

In cases when the xhci device is not populated, we see a nullptr
exception when resuming.

Add a nullptr check for the host_dev before accessing its private data.

Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")
Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
---
 drivers/usb/cdns3/host.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index f0df114c2b53b..8cc7fc1de6193 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -141,9 +141,12 @@ static void cdns_host_exit(struct cdns *cdns)
 static int cdns_host_resume(struct cdns *cdns, bool power_lost)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
-	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+	struct xhci_plat_priv *priv;
 
-	priv->power_lost = power_lost;
+	if (hcd) {
+		priv = hcd_to_xhci_priv(hcd);
+		priv->power_lost = power_lost;
+	}
 
 	return 0;
 }
-- 
2.34.1


