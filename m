Return-Path: <linux-usb+bounces-7079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7326086751D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 13:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE74F1F2475B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 12:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A00F7F475;
	Mon, 26 Feb 2024 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I7prYaPE"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F75B1F6
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708951014; cv=fail; b=gmWTtNVmo7zNcIOG3EekYsv88wYWpL/pN95hQI94J9zKTiZByghghj4h2DrrMTFHHxhfOGdyg1Pd37SadiroBkciC5fjKmQr7kk6lL6qnRPPwGtSC6rQtV2GFxxC30Qt8p3eZiLm8XOd/AKpa/HNtRrkvsGqnllEKstXkpvOVT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708951014; c=relaxed/simple;
	bh=K8zMp+9gJqe5kL69AnjMJJBbGCHN0zwnOm3WM0X44Fc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JahjbAD6hBUiFNq50xCMSUlRoyfOfRGhbBbOOCGSZieDt1oyb6JcZ3UD2o6PG0pPTTPI2iLy+SO5FywdrCARyrnRPYteuIbD97TIIZDjHwNfvuBcjC7DDD1saJW23IvD29Ii0X7WQXrzjdZdeYA8nwteketVw8O+LXtVjZbEB28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I7prYaPE; arc=fail smtp.client-ip=40.107.94.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmerFDHrdg+ilMrE8H7LkuaRS/Y3hs4ldYgZZNIn067oGpC6eMzsbM7EvX9/m4oG7P8qFj7HLWRUnOoCdL8KofOKG9uY1ATNJUXIBgKOgUxS+huKr1Yg6KA1yN9YEdKi2SfbPzG69A7ckSkO6GG0wYTZwWF1kgMiBWOyrSOo49VNk7XAvKAM13MI2VWJ7JvW2Q0HgEsxvPSpXhd8ql+iPEjVWvUPPcNWw0u+zQifKIaSrCfLdbV9pcpFHo9jYIgXColX39yWNJTJoP53z0cPEXsOPgbQGURUv/we/45NE1hG80nNUVhXja186j/J0i4xajiyH+epw3+QgBCgpYVENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVGrzOyJyrhonBHqK81BuFxim2Sl++SwG6zslDbffSE=;
 b=nwDRxiFeZ7S1idhIajvAC8w2kuRLSjIlXbxLuuiaMlNrIchPLPJ4YPW7tZigCwrBHGZLeWQBPfoWd4usQ+fgmrUr7OJoIR6oD/7GTTY4JhSzF2AYSeDa5oeNxXt+Cr6JIJlNHzK1MRZYS3r2JMBNypHX7E9cWjBFJMS/npBW8O499bA+e5HED204e++qLU9uiLrA/RYYG3zP291Lw5sAAqz6+3LNLgnPgwlhGOU62+WQt5lzwCWCJw5q5SFTDsu4HvYGAcrk8HMwzTfRTNlSdW0yfP2dTvTrFi0ovVk7XhS7sBYCMGkHjfTWqGe+BrzSwIkJN5ceGMP7nwPpjnObBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVGrzOyJyrhonBHqK81BuFxim2Sl++SwG6zslDbffSE=;
 b=I7prYaPEtkbFaTc49Q8O216mqSUDItGKV/1LpX7CVt0q923JiRIWkzulnycklRqUETvBCsnL/yOuxWPfZiwdveW5yqigFNyB04HBhppPDyiW/Gg+WeS0V12/Gy/SGxQdNZ11x7AO+n36Ow/cCEKUAI4vIL0frje1dQQh/tR9pso=
Received: from MN2PR15CA0002.namprd15.prod.outlook.com (2603:10b6:208:1b4::15)
 by SA3PR12MB9131.namprd12.prod.outlook.com (2603:10b6:806:395::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 12:36:50 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:1b4:cafe::9f) by MN2PR15CA0002.outlook.office365.com
 (2603:10b6:208:1b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 12:36:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 12:36:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 06:36:47 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
	<linux-usb@vger.kernel.org>
CC: <mario.limonciello@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>, Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: [PATCH] xhci: Allow RPM on the USB controller (1022:43f7) by default
Date: Mon, 26 Feb 2024 18:06:27 +0530
Message-ID: <20240226123627.2144961-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|SA3PR12MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: 6801cf28-9aca-4e6d-74dd-08dc36c79ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fCBTuP8P+L8lokmZl0EyWIehLFuSz/Or9QbiwEj74WKlIamkjZXrnDtgzy4npzXyNw8Eu73unbjWVEtB6W7OnR00rdJ56zYEDQdcvwtDGoXXyiANMXwOv4aFWz/nZCuzPn7QSb12KbEEwebgGaPHZC+aielTyP1MHetvqGMmNMiINHjK/lDY/JFz0O01uWXH1vqIuw3M/51MwxTmO6E90HlcQD0QblYpx2w53zA9OQn2XR24/OSYoWN/StjL2Fs6VlebNRCEIt1a86U/SbTuUTMUs4xEzb81OXBnUMr6yQuEWAqh0FXUezd2HgKXw0qq5k+3i2VVm8aoMfmDc8BsGem/It9uMuiKxuraSoTqNAPChUCoYj151oO2Q9Lf5eoN7sfaqOBRjUhuDmivoXMABfDfN2oNnZCDZIGsiREpSsQ0lsRnuQfMt+7v//iPbzEQUb2x9lIgABObcNLyUlNA3wCMpRhhSUVaskwGUxiAMr4vmrByPaMHpWOUaKO9LPbPDu0B+dAudUZuFw8KY3Mhyc3+4LcgMgrgkyRx2m+0MQNPqdEQ+obJG1H+5jkPHIg/E2FfHFPbz53J0zUfzqx2rCcH63g4nE5KInd7NjM5VC0TK28X9Rt5pTMeX1cO80nDX9cEx65OLQ3jQBBUWA/YBwQ2b6FvY6f6e53hgCJQZOh7YVcamJjMFsU+1pmZWHHXAzxeZQRWbkDDUtmWZSLtuhmuT9ICWV3YYI1ktXwP8C1++IcC6iJoDaS0a2k1yG9y
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 12:36:50.2453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6801cf28-9aca-4e6d-74dd-08dc36c79ac7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9131

The AMD USB host controller (1022:43f7) does not enter PCI D3 by default
when nothing is connected. This is due to the policy introduced by
'commit a611bf473d1f ("xhci-pci: Set runtime PM as default policy on all
xHC 1.2 or later devices")', which only covers 1.2 or later devices.

Therefore, by default, allow RPM on the AMD USB controller [1022:43f7].

Fixes: 4baf12181509 ("xhci: Loosen RPM as default policy to cover for AMD xHC 1.1")
Link: https://lore.kernel.org/all/12335218.O9o76ZdvQC@natalenko.name/
Cc: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/host/xhci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b534ca9752be..1eb7a41a75d7 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -473,6 +473,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	/* xHC spec requires PCI devices to support D3hot and D3cold */
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
+	else if (pdev->vendor == PCI_VENDOR_ID_AMD && pdev->device == 0x43f7)
+		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-- 
2.25.1


