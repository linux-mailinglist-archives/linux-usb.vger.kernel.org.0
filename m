Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26F73DEDEC
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 14:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235944AbhHCMfe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 08:35:34 -0400
Received: from mail-co1nam11on2067.outbound.protection.outlook.com ([40.107.220.67]:33729
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235945AbhHCMfe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Aug 2021 08:35:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEGMm52pCBplUPW4MQOMQHL5RgGhtT2ratDA6IzvrXK4kPTUtj+uDUJfcc2BZ2wcbevIviuNc/FlRSuVRtxG6bFiSCR8qs6ZoBdzJwijgZWyrI18D9QUwec8qX/LDuVpUErRv4ZHviLmAo8f6SPgMwH8Z85Ck91a4HEZl9ol/2I9XkituLmm3TgpokGLmrQtlCdX9peUS30geZqwOipUaSNy2XZrg8N0uiqNLLpzvZcVBrccyfWJn/6KPlyEhPWCQk/PdBoK3irJKshCwsTjxw4A0y2P5XNyhxF2UpOH8+1XqW/KHCNK7YQJFY6+xY5xnsmeSnfLIRgfV1lfsxPl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CSL44mWzWVEjYuH0cYdA60S2Uh9AYx3glBJ3Pt6CnM=;
 b=PcprDtGWo3gtbaC8GP6gbUd/Ea+tAJk3caPmL6trJTGj0O3EcOJ8gA/WJAQtz+7lXVxw7+JGwdaRXCknHvcLs9ayoQzAhXGuCLCmSBBx2HMBYj5MBYxi9GUZ0849GJzECbD5c0pHMhruS9s+A2XsQg+TZyvtCNzdxBD0BAhPnkzS+hhW1rALke9E+l3f+6iFoWOboHq7jSx99CI3Dww6GZYZqRnULKNPHs6YcYpZRcn13GAO0ItxCemAJa7KbNyx3ZwwG5Dtc7sruaQtFIVXLMfcJoPKCzyVTW5r+C5uFif/sT1VmJuocHzJ6dKrxNzO4ciwRs1Lpw8SJZDJbktgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CSL44mWzWVEjYuH0cYdA60S2Uh9AYx3glBJ3Pt6CnM=;
 b=p3Zz8EzBE8iV/PXJBfYWn20uJKNpaQYUmCcK3d24e6N1qdNorOlyXNgifSyp67/w5d5w1xRbVXJDP5GNhsiRyi77eHfRjvMVQnhWeZuqwxTHc7fUNGnSjki2sczcGvRDyAitiJwaz/dvBRwHmww9WTTlvQNmGMGzQUhek1YY54s=
Received: from BN9PR03CA0327.namprd03.prod.outlook.com (2603:10b6:408:112::32)
 by DM6PR12MB2891.namprd12.prod.outlook.com (2603:10b6:5:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Tue, 3 Aug
 2021 12:35:20 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::64) by BN9PR03CA0327.outlook.office365.com
 (2603:10b6:408:112::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Tue, 3 Aug 2021 12:35:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 12:35:20 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 3 Aug
 2021 07:35:17 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v2 2/4] thunderbolt: Handle ring interrupt by reading intr status
Date:   Tue, 3 Aug 2021 07:34:54 -0500
Message-ID: <1627994096-99972-3-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
References: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7915cea-10f2-41e5-165e-08d9567b2813
X-MS-TrafficTypeDiagnostic: DM6PR12MB2891:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2891579E5D13CADC4491D174E5F09@DM6PR12MB2891.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xbMT1nzkRTPxGM92KI7BQAa1OcR0mT/h7JhVs+vrbhZkOvqsmoSIG1MFSQcSMODqZaPqbRTmWePHiZ/Sdv91cwCS1Q02HKFFxsXut6+JiHlRwrcY8meg/p/NdOj9rdoTwi6vFJs7lu6gKa2AxVFEJd2EfhyDDpaQ5Eskb6IwzYylfk5PhipeVS+glrfHcpQHpRU3quenDJ3Z7SYRYBJUasCubgN23fTgPkMMtFwLe0yXGCV1wMdM7eCn4vz1e5ae6uDR8iSfDploAuRuNBJydZDV5Kp+ZARwH+4Wd7AS5fKHVmFRFuzKb76c4bTZ17cwu3rXN4xYyIZgo8HZxHSoyR5wSohPIguAIOwdQymqWr3bNTkSx94RhRC3cjCLYJZq/hgxs8G7KD+2O1GKrjBLg3jJypkaWOVK4o40oEgn6y0U1BCCiMtbev09bRrW5Fr9vPjlzZzpHyOB7mhoQj1yAIiamw7WwR/L+EKTVg+lPvJf7aeOem3iaME8SmIZeUHEVod97hfEn+wHgRjBs/MkmLIvp66C8xZfFdwx+jB4x7MbuN4griXJE8sVDF+DCo5agP4AlJhl2WiL+YJAFnvXZsBF08FH2dnzIf/dU5rrh+yCNkHnmlVnCQIhmkKZri7QY0bNKp9uV1e1hTW2JuZRKC0foIbpdED6yoNCQkckDOlIGFdkD/I8V2ydGqyUTqnKeoCZxxcVyWK17LmhCdzzQ1CphbKjPJ6r/ASTjJNuYEk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(54906003)(7696005)(6666004)(86362001)(110136005)(316002)(83380400001)(47076005)(4326008)(478600001)(356005)(2616005)(81166007)(426003)(186003)(5660300002)(70206006)(82310400003)(26005)(36756003)(70586007)(8676002)(8936002)(16526019)(336012)(36860700001)(82740400003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 12:35:20.2501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7915cea-10f2-41e5-165e-08d9567b2813
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2891
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

As per USB4 spec by default "Disable ISR Auto-Clear" bit is set to 0,
and the Tx/Rx ring interrupt status is needs to be cleared.

Hence handling it by reading the "Interrupt status" register in the ISR.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
 drivers/thunderbolt/nhi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index ef01aa6..7ad2202 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -373,11 +373,25 @@ void tb_ring_poll_complete(struct tb_ring *ring)
 }
 EXPORT_SYMBOL_GPL(tb_ring_poll_complete);
 
+static void check_and_clear_intr_status(struct tb_ring *ring)
+{
+	if (!(ring->nhi->pdev->vendor == PCI_VENDOR_ID_INTEL)) {
+		if (ring->is_tx)
+			ioread32(ring->nhi->iobase
+				 + REG_RING_NOTIFY_BASE);
+		else
+			ioread32(ring->nhi->iobase
+				 + REG_RING_NOTIFY_BASE
+				 + 4 * (ring->nhi->hop_count / 32));
+	}
+}
+
 static irqreturn_t ring_msix(int irq, void *data)
 {
 	struct tb_ring *ring = data;
 
 	spin_lock(&ring->nhi->lock);
+	check_and_clear_intr_status(ring);
 	spin_lock(&ring->lock);
 	__ring_interrupt(ring);
 	spin_unlock(&ring->lock);
-- 
2.7.4

