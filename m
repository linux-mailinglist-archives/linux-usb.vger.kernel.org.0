Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1638D3E2EB0
	for <lists+linux-usb@lfdr.de>; Fri,  6 Aug 2021 19:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239838AbhHFRAP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Aug 2021 13:00:15 -0400
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com ([40.107.236.40]:14945
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235659AbhHFRAO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Aug 2021 13:00:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq8sV9eV8wruYY8CtjNpMSNC/4A4+1+r5G1xPOBGo2MHvRAM52tbJgDSlAa4g8i8EklwH4t0N8bBWeI8y49XIR+ja6akuDm8KvX/NIvhFizcAhMY+PshSCfGEggkLmijr7oiUJX5iAgb59hr5fpHomF5lkhyrbPBuqvQGAgeOTI+DaBspX/r4edxmTAhZFeWjzEg98s54zMoacP6rTm79NNWW74kpHuyws5v9I1iUKvE/T+Mf2j8oWsKQ0pjS662VpuSVmtqNpQIWNwrszSjxwF3eGHTTtz1/N/sn7U/Zu3Vtw874u8mvvbQu1vnxjeajNwo/bLX+rRBiMF5nT/htA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzB/IK1tY/DzgVNq3fx7/l3eDoTzQFSvFQrq8zGXLF8=;
 b=Hbx2fJEcRpt+4pgoIitg1Vb/LYRLd946pKYT4QaiaxiccpTYRFEJFHEpL7mmI1SX0VOdeoe34m3XHfDme7FjUMu/vcYe0TNjlcFyS95bxpzoE+SR/sU4QY8iQAVd+i5yeWM3LXecxj7rCSrb/gZY8DBj5VL04BUGhA53k+v+m6blMh7WuDqiqTyUEezygBUzPTxTW3RB97qstdiQGrxw+wIR5ZKqGG74qnq19RLSLUxTxYbq4GVN7TXwT5Kdo6pDF59ojtCX0IoDHrQ/6+1+gRwe7gjWBKls8hO2wmCkFVWkKA3L4zBlGhyLq1YWraXjnSnUT3vLKtA9h+GRmdBh2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzB/IK1tY/DzgVNq3fx7/l3eDoTzQFSvFQrq8zGXLF8=;
 b=kFfph8hR1i3+dBYBFuBeAljVlVnyYM/azGVOhDkEAT5EwwSvOPjNCoSMIx0SuA7Wih8J9i/d4ZzdA3B+8Y5If1LKooevdNhgIVkCY/8eT7KIUCh+LnyQwRNO9CFQNWx4sqy/d8bdtDFOOuRDdGoIFN93OUuxaKsdmBo00DxE0Ro=
Received: from BN6PR22CA0072.namprd22.prod.outlook.com (2603:10b6:404:ca::34)
 by BY5PR12MB5557.namprd12.prod.outlook.com (2603:10b6:a03:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 16:59:56 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::df) by BN6PR22CA0072.outlook.office365.com
 (2603:10b6:404:ca::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 16:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 16:59:56 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 6 Aug
 2021 11:59:53 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v3 2/4] thunderbolt: Handle ring interrupt by reading intr status
Date:   Fri, 6 Aug 2021 11:59:06 -0500
Message-ID: <1628269148-51355-3-git-send-email-Sanju.Mehta@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a3965214-9e9d-4101-f94a-08d958fb9e61
X-MS-TrafficTypeDiagnostic: BY5PR12MB5557:
X-Microsoft-Antispam-PRVS: <BY5PR12MB55576C6400EE650CCB6CD328E5F39@BY5PR12MB5557.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D1Q0XxzD83aAEobG80s/4eO5vCz5v+tF12N51WnQehvYqJXcHSBIO1Wc0wmO+rj4xxSwjYmZ97mnourGcvfSuVvV68Pqyv55knuPZXI6SybbRZpJe2aqqKlz7uF8FnAHhSDPGeF/NSVF7k68kVvyLdgNjMh0zf4Kjmd+tbttki4P3HXMi8Bzrbn/mwGtTTiBXydzjNnJawq4K7Mqbz+MNAviTpxLtcfMJRXlrI/HMRKVGo6poxtioOAoTw3ciiUiF0Wqy1tgjystnanStj41rzXZKOsg6epBh3yiA7ZY+bSh+L+FMGMZx2junmDhfimoaebbqQH3sTZwQh5UTbjmo/PMT/CE76zA1ElrgdrxtVT+k8rhdlmrs6Y2T6hIjtzflwXLSGTg5qBYAMsp9QGv9+nbTSkRV+HGPGS9nOp2ZB+MegocaJtIKsa98cRnZnukgxOQ0ADae9SlPcXXhUyO5gxsP/HMBpgDVfpgEKlBuTvgM49jRnyxs1iKJSMVt1qTyOmCPWz9KGSgjXmbxMv5V/gUHnlAy3FZiAyyHWPSfupm00d24RVCnjI3jhfipHkfEzCmTGqmqxaHn3pSMDjenQ/iqOxB760+GQ71WqTUCjpiGUjrGul55P00chv3+mM4fdpB8ELTgDeve4JiYeJhzk5hPu5CQ42fOUgKyDF3j8Rh73dLz3cpq8MzgaFX2kUHTk4Cqy9OOdZ+57VVq6+Fs7LCsSVjf4sIAVZu4ngShJs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(36840700001)(36756003)(336012)(82310400003)(86362001)(82740400003)(478600001)(6666004)(54906003)(316002)(36860700001)(110136005)(81166007)(8936002)(426003)(16526019)(2906002)(4326008)(7696005)(2616005)(186003)(5660300002)(26005)(47076005)(356005)(70206006)(83380400001)(70586007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 16:59:56.6442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3965214-9e9d-4101-f94a-08d958fb9e61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5557
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

As per USB4 specification by default "Disable ISR Auto-Clear" bit is set
to zero and the Tx/Rx ring interrupt status needs to be cleared.

Hence handle it by reading the "Interrupt status" register in the ISR.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
 drivers/thunderbolt/nhi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 7979638..56ac343 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -385,11 +385,25 @@ void tb_ring_poll_complete(struct tb_ring *ring)
 }
 EXPORT_SYMBOL_GPL(tb_ring_poll_complete);
 
+static void check_and_clear_intr_status(struct tb_ring *ring)
+{
+	if (!(ring->nhi->quirks & REG_DMA_MISC_INT_AUTO_CLEAR)) {
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

