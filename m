Return-Path: <linux-usb+bounces-157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033ED7A20A6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 16:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BE671C21338
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5991111A7;
	Fri, 15 Sep 2023 14:16:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF371111A5
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 14:16:15 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF331FD7
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 07:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzxQHAyJuiXFTsh3bI3gKhqqxgBxngN4SBkrtc7BGqDcCX9zQ/3cLyPBhdFmRtgpX8K6BP8ptwy05LLJqdoH9ouywoqrrYwIdJ14VxpFS5bZegDpf0Z14x9Y0Mrx0FTPznU10rmE0JoZTyD/0OZnCpzKRyiCAvb4bis+BAML8XIGVa1ujtlRe8PxvOaxtLZYJqTf9yUkeEh3yirZMawWEnyHsbYjxrq0JEemVteKEEYyLfvy2FeIqo+wTC6RflmsA/nCtwVqtYPv5Wx5UwFTrgbP89Mzya4r+1XFy24pEyZy3nTeFFvus94a0y7wo5qUKKa+G/K0f8121pP7GyBZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSZAowWmGZFdAsRfMOysZRKIIQlmoS+v/ZxDDSlTP40=;
 b=K3l5NHbmPHzJbsso/jDmWsiXQL+UvvD1WrHrNMe0einnn+lcZo84fLizN5euNn3AqM3/n8yTlLJlQqhH82Nqf25+93Aw1VyZup5j7maSFWHweawRd0uN/n0E40ADkOP/uhBrxYUajTL9/YMMPPYLw7dTHVZB8S/iMtmwLsvQTd0a/a0JCtG9VLhvfRJb91e6/VFDt2KbopW1uS73oG5wviGVp7y44DcPjyv4RK0vLJLToV5Bkq1igc80T1PiLbX3OOOP9l9PnoTHqqKMoxe7WQB9qxTWPPT3Ze1n0sJVZzCWN55D0nElINc4euh3vBmyLtSBsu4s+VxB4HePKGiJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSZAowWmGZFdAsRfMOysZRKIIQlmoS+v/ZxDDSlTP40=;
 b=dd1Mc7LK1v5vIOgaZLFOPAmrjyaWeSgd/cqZJde4XRwbT/j5mOUH6LJtozGs5Iw2iA6QSJL4Rxxy0ck5Kb/I8WIGMzlGuNGy5EXy0y9wf84v7fgEksCiE85oHxKej+L/lDbFcKPvDFeRvH6u8Mg/XkXkWIHx8Lx98DIsj0xWomU=
Received: from SJ0PR05CA0186.namprd05.prod.outlook.com (2603:10b6:a03:330::11)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Fri, 15 Sep
 2023 14:16:02 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::73) by SJ0PR05CA0186.outlook.office365.com
 (2603:10b6:a03:330::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Fri, 15 Sep 2023 14:16:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 14:16:02 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 09:15:59 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
	<mika.westerberg@linux.intel.com>, <mario.limonciello@amd.com>,
	<linux-usb@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 1/2] xhci: Loosen RPM as default policy to cover for AMD xHC 1.1
Date: Fri, 15 Sep 2023 19:45:29 +0530
Message-ID: <20230915141530.1974640-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915141530.1974640-1-Basavaraj.Natikar@amd.com>
References: <20230915141530.1974640-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|SJ0PR12MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 067b5e8b-4608-42d7-93c1-08dbb5f64ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s3iPWjxPv1VotIW8rPW8TVMq0Ne+lXfd2xpfpe0KJks8Sy6gx+fr369v0HBtG2Qg2231DTYVbvBhMpWtYc0yRBidhI2O7imfLMSJ59oU4ZFQ1aahDLvbErf8VOskkVkrrlZRlgOkUVni4CSRHhbyXkrWiivm7vquSgB8zRpkDya1tZr+RgmhdqlJW+Ab0M+uLRLqsscctrOod89YtjiYbZaYQmAaLuya7JvaKYYvD+1O9lCAjUS+IqPHV60Gk8n+ISbhlDkbMbp2nIw+4w2auQGiSj9qbuH/qYAnsvfve7TR70HMN5IpFAPGmsyevttW3EhaWDlp3bZSUIm+R4oGfJ4OvkFOAmj2ovma2cOQma6/dHDGAMILsP8o/UG55dhfL55KDKH6WSHUM+XX+JImCaA+h5/Mk51dxi/Vf6S8UqOciPC1t49CUaLune+82FTB1RcDeNJdtHYwzdq3Vo/7XwA4LvdNJQJS36D0yd5YURSFtMPfMKxc140s7owOhHNjVllV7nAvhbysVdud/ENxplGHYG6T7/S17a/TbX7qu+88Xp1Pog5vOyDJ/lzS7iSNwmCkiJ53p6BnZIBqYQLF3SiiuwSIagaY4JZPKObff4DLskqMnr8cfdJ4vbfP67v85hZXw1pnZiGSozgmLGIGJOJ7ce7SVqxT8ipaXG1uDh5Wv86NwcoEn43vLldGrtRbXrfuoKoKXNEXp/fI8/bD8YNePSYVyxBMU2Z0Q/w4Sgqe/5eDAzquiA2+2iEo8eCH3yNcww2uJWH7W/w1KWSegg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(186009)(82310400011)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(16526019)(36860700001)(36756003)(86362001)(40460700003)(40480700001)(82740400003)(81166007)(356005)(966005)(478600001)(70206006)(316002)(2906002)(70586007)(110136005)(8676002)(6666004)(7696005)(5660300002)(8936002)(4326008)(41300700001)(47076005)(26005)(426003)(2616005)(336012)(1076003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 14:16:02.3522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 067b5e8b-4608-42d7-93c1-08dbb5f64ad4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The AMD USB host controller (1022:43f7) isn't going into PCI D3 by default
without anything connected. This is because the policy that was introduced
by commit a611bf473d1f ("xhci-pci: Set runtime PM as default policy on all
xHC 1.2 or later devices") only covered 1.2 or later.

The 1.1 specification also has the same requirement as the 1.2
specification for D3 support. So expand the runtime PM as default policy
to all AMD 1.1 devices as well.

Fixes: a611bf473d1f ("xhci-pci: Set runtime PM as default policy on all xHC 1.2 or later devices")
Link: https://composter.com.ua/documents/xHCI_Specification_for_USB.pdf
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/host/xhci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b9ae5c2a2527..bde43cef8846 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -535,6 +535,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	/* xHC spec requires PCI devices to support D3hot and D3cold */
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
+	else if (pdev->vendor == PCI_VENDOR_ID_AMD && xhci->hci_version >= 0x110)
+		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
-- 
2.25.1


