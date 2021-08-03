Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72963DEDEB
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 14:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235946AbhHCMfa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 08:35:30 -0400
Received: from mail-bn8nam12on2044.outbound.protection.outlook.com ([40.107.237.44]:59232
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235944AbhHCMf2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Aug 2021 08:35:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhZW7YOZirxMADxJ1Y918+wLFow8Fqr2ICGvaITFRLnlTje2Hbb0+s7LeJm46d3Cje3nlLCmvLllgisQZ2tSyjYkcSkb3bqjb5RABgHQNM2fc2dZ0b6mOL6TuCi5W2EsEI39ZL6nYjwQaQcazrTPWqOPK1nYu7TlD6nR4tXKbBgiAFRYIx7LGpNN2d7eIaLcTPCNU1h4qbPjO8hdvpJLjAfhPz9Tjy6hlAN5NUHBU4BAHncae/yxgtogNwOoR3hDAhYlH/TiLiituhgEgX6CfhrPG7yfalwJuWzGZOSxDIalN7kIXjNFzyWE/aGpiHMqDFoSdtfZNGK3ZA+BUru9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb6flVZkKvS9/0oyLEuHNoTwNoyIgV9mETTL8UzpY+g=;
 b=fu/ve3Ns9eS2c0FYUFJPESQXH7DCTFXYLEPnrxHDBW+53R34MKe/Wa1ofi/h6EWWb0J5alfZMtID4gopri7AOecWLKQsTOxKKnJa0dowQ0k9TWm4+NrLcc00sM47mt8mXrMHy3+hybgc499r+434ENUYfgkzkl01whJm4lLMwkwCf2iQOQQw9qDO4aiyy8DLWAvWjBVMO+XRehIxtBWzbEKgOZmivSlhqCj4VZpa4ibysNWuD8jScxlWRv4shkou01CPYmoB4DS5Sge59Vmt26kjzQHRPpgnQMELRnaq1tkM+Gp9kT77gETTaAlOAIMEU3AraS3UQMSLPsfbJ4ZkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb6flVZkKvS9/0oyLEuHNoTwNoyIgV9mETTL8UzpY+g=;
 b=vf6ty8CnymNXnZoWhJureM0wXkH+m3bO6vVwhkuQpi0LcWXCn1uFU/iAqCADdcfU2dxDg7AtVLklz5ToMpsg4QX7LymlWGSXz7KBGXl4KzjbiY9tJUO2OS7FGvpG2BM/3BidH3QhmJdxNtW4FDdTLlVrEPx7UdDjfNChtFJXWa0=
Received: from BN0PR04CA0036.namprd04.prod.outlook.com (2603:10b6:408:e8::11)
 by BN6PR12MB1490.namprd12.prod.outlook.com (2603:10b6:405:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Tue, 3 Aug
 2021 12:35:16 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::8d) by BN0PR04CA0036.outlook.office365.com
 (2603:10b6:408:e8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Tue, 3 Aug 2021 12:35:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 12:35:16 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 3 Aug
 2021 07:35:13 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v2 1/4] thunderbolt: Intel controller uses BIT(2) for intr auto
Date:   Tue, 3 Aug 2021 07:34:53 -0500
Message-ID: <1627994096-99972-2-git-send-email-Sanju.Mehta@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c67d835-b40c-4f94-4891-08d9567b259b
X-MS-TrafficTypeDiagnostic: BN6PR12MB1490:
X-Microsoft-Antispam-PRVS: <BN6PR12MB149032819319724E4B0C8D50E5F09@BN6PR12MB1490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0CFDKLHV8hs+qEJlh+6Eab/tLwt8yVzcEcY//i0N7q7klGLbAIv4PNGoVNPXowt33h59/BcNaKJyDIWSxPEZMVl0AISx9awznte2pVulHauNnN7tk+XYMYstXToxnY9NxCS+qpJg8oxqzqBO5XfzLeWXixSnR344Xs8n2mhu1Th2aqyyDmV72SOWEPwC/T8KL1+/eugky/9kN0/tS4W9xLDQ1IEX2XDPu4pWkp94GdHErXPdShILgMdzh4f+PqAdNLiV3X5HUlpmtKrjBPBlb5Shayi34J2rdYTXjFkea2EQcXMZz3iP64UCK2kEAgP82gpURahI723gypVs+LO90xeaei675zfn/Y5svo6RcPKYiOdN8a99vjx7w2ZEhIW8omIWA+nyF7H/ru1cB/kehQ6Ur4asrW1A/1EsjWOODQLgQT77KomDQ5c7EA3PC1daSk37ah1P0VLs/QSNjXzEgq49jBqzgQ+T0x3/QlJKavWTxtdif7Y6BIQNIMicKwVl0MngwgJsui21at7vpKam5ewOOaQIU1QIlSXsdHzv/0cnVbb0lvwXdjTmSb68ekYibOlEAnVixe753J2rKEyl3UqWBh/ZSA/yTtLybNwBlt3ICS4E2j7lSmZJer3+ozkKJN+bPW+UrZv2xa6bBOmVbWF3oIyij2zN0QJH/wDizDHoeYMnEDAjYxoUMHgKI7mevQkhXKYsMFIs7ZUHmrQXWavQ4tVupnPMQvBek1YsNUw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(36840700001)(46966006)(316002)(26005)(186003)(356005)(16526019)(110136005)(82740400003)(70206006)(70586007)(83380400001)(6666004)(36756003)(36860700001)(81166007)(86362001)(336012)(426003)(54906003)(4326008)(5660300002)(2616005)(478600001)(82310400003)(2906002)(7696005)(8676002)(47076005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 12:35:16.1105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c67d835-b40c-4f94-4891-08d9567b259b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1490
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

REG_DMA_MISC_INT_AUTO_CLEAR which is bit 2 in that register is
actually Intel specific.

As per the USB4 spec bit 17 is used for interrupt auto clear and
by default its enabled.

Hence limit usage of REG_DMA_MISC_INT_AUTO_CLEAR for Intel controllers
and moved this to quirk.

Fixes: 046bee1f9ab8 ("thunderbolt: Add MSI-X support")
Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---
 drivers/thunderbolt/nhi.c    |  8 ++------
 drivers/thunderbolt/quirks.c | 14 ++++++++++++++
 drivers/thunderbolt/tb.h     |  1 +
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index fa44332..ef01aa6 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -57,8 +57,8 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 	u32 old, new;
 
 	if (ring->irq > 0) {
-		u32 step, shift, ivr, misc;
 		void __iomem *ivr_base;
+		u32 step, shift, ivr;
 		int index;
 
 		if (ring->is_tx)
@@ -70,11 +70,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 		 * Ask the hardware to clear interrupt status bits automatically
 		 * since we already know which interrupt was triggered.
 		 */
-		misc = ioread32(ring->nhi->iobase + REG_DMA_MISC);
-		if (!(misc & REG_DMA_MISC_INT_AUTO_CLEAR)) {
-			misc |= REG_DMA_MISC_INT_AUTO_CLEAR;
-			iowrite32(misc, ring->nhi->iobase + REG_DMA_MISC);
-		}
+		quirk_enable_intr_auto_clr(ring);
 
 		ivr_base = ring->nhi->iobase + REG_INT_VEC_ALLOC_BASE;
 		step = index / REG_INT_VEC_ALLOC_REGS * REG_INT_VEC_ALLOC_BITS;
diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index b5f2ec7..af6dab9 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -6,6 +6,7 @@
  */
 
 #include "tb.h"
+#include "nhi_regs.h"
 
 static void quirk_force_power_link(struct tb_switch *sw)
 {
@@ -64,3 +65,16 @@ void tb_check_quirks(struct tb_switch *sw)
 		q->hook(sw);
 	}
 }
+
+void quirk_enable_intr_auto_clr(struct tb_ring *ring)
+{
+	u32 misc;
+
+	if (ring->nhi->pdev->vendor == PCI_VENDOR_ID_INTEL) {
+		misc = ioread32(ring->nhi->iobase + REG_DMA_MISC);
+		if (!(misc & REG_DMA_MISC_INT_AUTO_CLEAR)) {
+			misc |= REG_DMA_MISC_INT_AUTO_CLEAR;
+			iowrite32(misc, ring->nhi->iobase + REG_DMA_MISC);
+		}
+	}
+}
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 725104c..0b8f9d3 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1122,6 +1122,7 @@ int usb4_port_device_resume(struct usb4_port *usb4);
 #define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
 
 void tb_check_quirks(struct tb_switch *sw);
+void quirk_enable_intr_auto_clr(struct tb_ring *ring);
 
 #ifdef CONFIG_ACPI
 void tb_acpi_add_links(struct tb_nhi *nhi);
-- 
2.7.4

