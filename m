Return-Path: <linux-usb+bounces-7448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D586F9AB
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 06:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E3D7B210FB
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 05:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F81BA33;
	Mon,  4 Mar 2024 05:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="38fXuY8n"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EDB6138
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 05:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709531037; cv=fail; b=k9YbMF+9qO88INDVZzx3epjwlssdrKL80QApTqTfIXJMY8neVBv29Trzbpo4q9GG2QM47n0zlUNyEhAgPhg8dxRZwv6d+X+25u3LSHTmS33j97X2jPSTE2bS1NEU/idTALAxHXw/zAMiZMHKZRIsPxhy5GGpPwuJnEAjgSP2cGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709531037; c=relaxed/simple;
	bh=G8GoRR1LzC1Ud0vlk/whIRHooS5WnodZe7aS4HXWHLI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bu11ivP/rrJEH2BQoxSWDHiXOPh2IdeJn1YuCyd8N2vxjV4V8Z/nOsudJlvkq0uGNlyJmhTwhPCY1ekgL0Y3q6cfbmXpewW1DAIoj1zWWV5Hl14jW577MD84XEzRjUYstM4JNMry9Y0AMT0swSWDZ2S9qCBzjjtPguxSWLzRDpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=38fXuY8n; arc=fail smtp.client-ip=40.107.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRzAXwsCwbAkDBtK19KoAzKwX9VqjzT5lH7t6lfAKMAXvzhlcy2OeWBIw9oegwJHGY0KZYus0hodPF8SpVnlagNv3EOedT2Uuu39L1vypVeZO4eQS43IxHAlEV4j0XBmyldfQA6JhQzzV7+JJIR5+ft2wX1CZIVCnBc8fbpP2/n6+PurYD+IZYmgkbrujpPfgQ7/srJ0fdRt3gcRcu1/h/VXDctZlgpxbk8M9faTWs135XrUxMzqLJs2PVyLCKIC7SXNsa0ageJQ+93F8wvjtFR35lw3fCgs3Iyf++G4W62aUrpDeUs+IUJ7A8piW+z8sMVKSt2ke7H8XoP6cDQSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCiDRcNAQcT6xuLjpHwvvcntitUT3OJEKuyqn/YUPbg=;
 b=jI4tjvW7YGVllb1D2r7Ok5Zoa2cEqeIFgXdKaPFFU7T8qaPXfs5UbzDoA216c13nTJSe1SMNUQS+Ht1MKabAs7/r+5TEPFQ6AZBcYnvoTEuQsd2GiDQH9g+2JwgTmsq0gUGQm9UMGADQSAaOiQpYA3cM+hBppr6Nd6v89b73Y/YQjSwPMrfgaw7lagkf2H40xrYVrr8+8moVkZ8lNVh7uoHkS5gRXey31ZuC2b/v9/sXLKSeBSGYSIbYLRsphqzOW4rUyQ6d86QseHAZPsP9h4d3R+KPVngp7UGjC2oxiHKSaitIYCOhWuQhTIgiSQZa5dia9ZnCFW5Mzmt5pNJNfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCiDRcNAQcT6xuLjpHwvvcntitUT3OJEKuyqn/YUPbg=;
 b=38fXuY8nBH3dEpROnzggaqSa4RfRHumDDQBQ3+hFocQJSH/iN/6bdPC5cTfBxSHbJAx9U91xuMjfZgLnrOYAp5HE1F85L3+siLe7jXfzRQ/Abh3MQCsTmPiOrR1AMw2t3u1IjVka9313Gv6JV7bi3/ZKJ2vnyj5boASyYlj9Hb8=
Received: from BN9PR03CA0761.namprd03.prod.outlook.com (2603:10b6:408:13a::16)
 by SA1PR12MB8947.namprd12.prod.outlook.com (2603:10b6:806:386::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 05:43:51 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:13a:cafe::46) by BN9PR03CA0761.outlook.office365.com
 (2603:10b6:408:13a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 05:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 05:43:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 3 Mar
 2024 23:43:48 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
	<linux-usb@vger.kernel.org>
CC: <mario.limonciello@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>, Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: [PATCH v3] xhci: Allow RPM on the USB controller (1022:43f7) by default
Date: Mon, 4 Mar 2024 11:13:27 +0530
Message-ID: <20240304054327.2564500-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SA1PR12MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c9d231-0a5b-4d35-c816-08dc3c0e1219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xvRXraggkTomUTR5EaT+I8FzOBO3ZEo5PZ46dnLs0V1SG3Gok7WJXfTrlzWSB/eBj6TWM4RMr22fFr3kt1h2ZHmkd55Hdcay7RavlSkjTSDEdX+KCAC/yCWMA1NwVBF5bRWNuqIXmErtUeMle52wK8eF1AJtYDl2aU86s8XSaN0a03+LkuL9P7H1rX3WBZt11p85DzSvaWFIuf8RZ5/yMq19sX+R4ukJFFCKzF3m8TMgDbMnxy1rzSP08mScF0P7K0Db6JnbPO+OdqOwOHN/eYLqtJ5wS8QK4YSB2CO34Z38wQjRoEbrNpkLjldOAvU6gSl974XBuBEx317z8u8dU6uI39CSTU5QenxHGDXF5WfjBcmrTtCBpQNzoY3OnIW62o8lN6VcsrQkC+vtZlxMWZUGghkS54mgz6j/w3mIwzU4x/LNtZhHqradbeUS+CNDo39tsRv1sL0gGej/be5VLfzTrCWrCXerBDVwr+tfrk4NxHpv5UKCoykklCb4UndOEdh1QB3GtsRqzh66vOFybtZp2APcpbpp6xktVxcKJasHkEUWFBFgZm11tc6yH26sk5walRo1IGhSTViqeF9yKB0qnTArGNkZAAlvQvoe23HQOs3DZIdZ/C/AC4bKbUiE7hl/UYwW5SyoDJNIw011tHmIgfT2LLIKqtB6ZWJk6M0RzxPN/GpUOZnoLtvcObEykodojEPkC+2AH7RXrYvD4w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 05:43:51.0343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c9d231-0a5b-4d35-c816-08dc3c0e1219
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8947

Enable runtime PM by default for older AMD 1022:43f7 xHCI 1.1 host as it
is proven to work.
Driver enables runtime PM by default for newer xHCI 1.2 host.

Link: https://lore.kernel.org/all/12335218.O9o76ZdvQC@natalenko.name/
Cc: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
Changes in v3:
	- Reworded the commit message.	
	- Removed fixes and stable tags.
	- Moved the code among the rest of the AMD quirks.

Changes in v2:
	- Added Cc: stable@vger.kernel.org

 drivers/usb/host/xhci-pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b534ca9752be..c0920e90efc3 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -307,8 +307,11 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		xhci->quirks |= XHCI_RESET_ON_RESUME;
 	}
 
-	if (pdev->vendor == PCI_VENDOR_ID_AMD)
+	if (pdev->vendor == PCI_VENDOR_ID_AMD) {
 		xhci->quirks |= XHCI_TRUST_TX_LENGTH;
+		if (pdev->device == 0x43f7)
+			xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
+	}
 
 	if ((pdev->vendor == PCI_VENDOR_ID_AMD) &&
 		((pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_4) ||
-- 
2.25.1


