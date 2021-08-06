Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E5D3E2EAF
	for <lists+linux-usb@lfdr.de>; Fri,  6 Aug 2021 18:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239256AbhHFRAK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Aug 2021 13:00:10 -0400
Received: from mail-co1nam11on2051.outbound.protection.outlook.com ([40.107.220.51]:19201
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235659AbhHFRAJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Aug 2021 13:00:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Do9szB6EnfnrYH2W9x2rloG6KMvjRhTGkXXHGRD9hs5JxClAnQDqSm4SN1lbJaibBHOg9ekiZ6AAnUn3NmDiK4Ww+wvaDHGYLENPme1BYmLtdrmMVRwyPqgCHwQx1VyhCMbl6CqLjR6zmKO+cK28povE5kuxadl/lyNc6JrU4R4TWhq/eBgVMbdlrZhQyg1hhzTbTnaN3CBA4tsQ0o4/JhdT3JSLg/cykD7kZdZbm3LeeVkwTNwZcTQzyePmiXbQyAWQ1RVCFodtWZYyvanrJuMBlTn4uYECRvouHQGkGYTGeXlQi4LxkkVY8vmSBKBU+0Hurn8cFS5UGObpe89uzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJ5Ou6R4NJMt32j3oMnE+lzBMpegpOJVjRZbsKjixhY=;
 b=Z4Mfz9ZU/Cmp6K9t0PulwkiHD2SFsYWq+3kwButDBMXBjIyb9mHCs9ptR5z/yHznjiW2QKyUOhNav0A9Yy2iA6p24lvy9JBMCzsR4yoKbAxJfxweqM9WN/F8vNAjJLgz3/5rBTPxB4PoUfjiUBx5fG3W2WKV5Rtz1qayyknbudig8Hw0mIyGXyrPxiJvyA1cKlCU7WDUWVIlmYOFfk49uUjHC/onPl96riMbffheiu9ycA/V4N2TaP+4kZCrtnGzDN+a9UWUHnqHzNvg5q/USuovSjulzABabv9DBTS6IXDUDDglpkch/ppJxG8TOuYOXfotNbCX3KDQV1vATjti2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJ5Ou6R4NJMt32j3oMnE+lzBMpegpOJVjRZbsKjixhY=;
 b=OzdX/gvEJOrEssPO55cMmuJdSLICJl/gjoTDzx7N12b1Zr4joiO70GCjeR92hAZsovt7E8/xiDZUgBc1Efq8qRBWiS/qgIqsCujTyXUVL7bm8OQdNhnUdLjvlK9NJEcgP0XpV5DvU4Oh1zUARN/2wF2luREmqi6QMbPqNywbnpA=
Received: from BN6PR22CA0065.namprd22.prod.outlook.com (2603:10b6:404:ca::27)
 by BL0PR12MB4705.namprd12.prod.outlook.com (2603:10b6:208:88::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.18; Fri, 6 Aug
 2021 16:59:51 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::74) by BN6PR22CA0065.outlook.office365.com
 (2603:10b6:404:ca::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 16:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 16:59:51 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 6 Aug
 2021 11:59:48 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v3 1/4] thunderbolt: Add quirk to support vendor specific implementation
Date:   Fri, 6 Aug 2021 11:59:05 -0500
Message-ID: <1628269148-51355-2-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
References: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bc6eb3f-2a14-46d1-039d-08d958fb9b8b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4705:
X-Microsoft-Antispam-PRVS: <BL0PR12MB47053B0907E7A4001266D141E5F39@BL0PR12MB4705.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IVoKHtDuvYS6MO55tM6I5RwpMajfdMGPsZaLAokRsHuczNqEDjfYFwQgfQ26RpitkkDchAdJfVFPlYFyC6n4SdMITz+O1bkHcxCNGvr/YsR8QKig2shxoN0zY4eMgWK5YihfD4rYTw0lz/Ju1cC1WCXjQKypD/ad8iJSMh35jm1nCXTs7N253jp17ZIo0GO+WGtQ9mTCNSe5FKwJvMcmuwwDs1LWZ5nSKo6xZ2cvKf86POQ1r5YzaCwabOYBmzWcyKwJwbNyNUPEQC7lpnRm9GEy8KUfQZ1yfeCN/H7cDIj5QrdVw8JBk8dL/fNg19yc9UcC8MsXsJPZX2pdEzMShhXPU2r1zH9M/jI8XaYUP3KE8sKnPu8wA0tUJFMU/kOyJ3gbONDrgAG2hh5SENf8YE4nAtJ78gZ9AFRQGJDm6xtD40Q3yhAI63fhTFIWek1iVlDQ0UOOW+OLyiyPUxpqkbrY9Z6p5aGqVaXJysLVE0p3dJIk/ZEJGgly+dgUpAwnMdreKblNnhAfnjZFaRUZKb6esPcBgBaFHf3cGyUGVbdtJTy0us5zkpd5gS0/QdbTwVkubV8EqMDmFoiqIwM49L8IzivJmT7AHMMa+CnzY1wWj4woS7QB3eWN+JWSBadGVjimw2SKdxFt+6AVXywD0IZJavl+cem2MFz5q26v0kdWugxllgYckxIDhhQAJ2QN4wcG8XuOdtLFB114tpORoV1DGitng48tLbh6N/bY7wY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(36840700001)(46966006)(70586007)(336012)(2616005)(82310400003)(8676002)(426003)(70206006)(478600001)(5660300002)(36860700001)(356005)(47076005)(86362001)(7696005)(83380400001)(6666004)(81166007)(4326008)(2906002)(82740400003)(26005)(186003)(54906003)(8936002)(316002)(16526019)(110136005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 16:59:51.8800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc6eb3f-2a14-46d1-039d-08d958fb9b8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4705
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

Introduce nhi_check_quirks() routine to handle any vendor specific quirks
to manage a hardware specific implementation.

On Intel system, the USB4 controller requires the
REG_DMA_MISC_INT_AUTO_CLEAR to be set. Hence handle it accordingly as
per the USB4 specification via a quirk.

Fixes: 046bee1f9ab8 ("thunderbolt: Add MSI-X support")
Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
 drivers/thunderbolt/nhi.c   | 18 ++++++++++++++----
 include/linux/thunderbolt.h |  1 +
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index fa44332..7979638 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -43,6 +43,12 @@ static int ring_interrupt_index(struct tb_ring *ring)
 	return bit;
 }
 
+static void nhi_check_quirks(struct tb_nhi *nhi)
+{
+	if (nhi->pdev->vendor == PCI_VENDOR_ID_INTEL)
+		nhi->quirks |= REG_DMA_MISC_INT_AUTO_CLEAR;
+}
+
 /*
  * ring_interrupt_active() - activate/deactivate interrupts for a single ring
  *
@@ -70,10 +76,12 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 		 * Ask the hardware to clear interrupt status bits automatically
 		 * since we already know which interrupt was triggered.
 		 */
-		misc = ioread32(ring->nhi->iobase + REG_DMA_MISC);
-		if (!(misc & REG_DMA_MISC_INT_AUTO_CLEAR)) {
-			misc |= REG_DMA_MISC_INT_AUTO_CLEAR;
-			iowrite32(misc, ring->nhi->iobase + REG_DMA_MISC);
+		if (ring->nhi->quirks & REG_DMA_MISC_INT_AUTO_CLEAR) {
+			misc = ioread32(ring->nhi->iobase + REG_DMA_MISC);
+			if (!(misc & REG_DMA_MISC_INT_AUTO_CLEAR)) {
+				misc |= REG_DMA_MISC_INT_AUTO_CLEAR;
+				iowrite32(misc, ring->nhi->iobase + REG_DMA_MISC);
+			}
 		}
 
 		ivr_base = ring->nhi->iobase + REG_INT_VEC_ALLOC_BASE;
@@ -1190,6 +1198,8 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!nhi->tx_rings || !nhi->rx_rings)
 		return -ENOMEM;
 
+	nhi_check_quirks(nhi);
+
 	res = nhi_init_msi(nhi);
 	if (res) {
 		dev_err(&pdev->dev, "cannot enable MSI, aborting\n");
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index e7c96c3..2144123 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -480,6 +480,7 @@ struct tb_nhi {
 	bool going_away;
 	struct work_struct interrupt_work;
 	u32 hop_count;
+	u32 quirks;
 };
 
 /**
-- 
2.7.4

