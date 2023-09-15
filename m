Return-Path: <linux-usb+bounces-156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 100EC7A20A5
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 16:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE00D2828F6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F6F111A0;
	Fri, 15 Sep 2023 14:16:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62110A27
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 14:16:12 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24744268A
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 07:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggu3wxF1Jo9ktxeGuPMasKAQgpsFkrmD0XKWlzfxfYmM5UJ5dUsk40gzY/OYgQ6niZajIbs9UkdQOSJ6QGE+zgv8W8kGcs0JLC2m+d2+KpzW/O2BucHLgbePIOTGBSz0GoLedkWn6VoQ60M4pTXdUCdDHaTBvulxniz1J2MJee2b63+FFDs+v4wZKsPoMVAAL1kWEOGC2pjj6HG0DvzhtMMMv00ozIFCyhePJmaVzlsaNvPLS/Gh18/aQfKpk+pduKJQpkrhWrzHvBc8oD7+nrI5P3Q/C3zZ+yqX2dwHuSVlYGlrcPDaTFf/abcXNIt0qYK4icDs4I9UsYQtIX4J0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N925fT+14kYKjRwKat0rRChRF23oAzIXSL8Hry2Tt0I=;
 b=kqw0m4fFGgm+wO1+X63pheWLxFXSnGuIbgn3kAiNhzZZBOVS2XDmqyITyJnxyoYNVTBcPyPA1s/I3oob0fwD0SKoffo8U69tw1J0qB+y64GDv16qxcZomPjeqU2bo3ITURzgaD9cCT+NFsls8VtqlcoBE4bjQ4kzLbfn6IIa+zfIq44B4OF6KpSff21kt1yMKuUm8adsdaGJQmQdy2KI6WLx63fnCZu6JqISeR9GMq9PYtI0ckRk/AJJOYTbI3TqneVCbIdE/uDMAfjS8UyxfGsEUV75c/KQJjramTlNWnWiRvcbi2ytD+kU63VA5BHfXQvq5BDBTrsIS/dWYF0B+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N925fT+14kYKjRwKat0rRChRF23oAzIXSL8Hry2Tt0I=;
 b=2o+fWO4qGCU5rEuxIe6q2wTMJRQweWAD32b9r30WTTi/seVDXh9Nk3l2e6Dtcm2m0dOd9lnN6awBP7Ey4Wh6+W6YGlJZF/RUuM9KJmrR7SMIXzbqHZFzmjMI6GeDF8+m3B8hj/zYESc8e8RZQDrtG1NZ2dJHnYQ5NW7d9KVCL58=
Received: from SJ0PR05CA0200.namprd05.prod.outlook.com (2603:10b6:a03:330::25)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Fri, 15 Sep
 2023 14:16:04 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::5d) by SJ0PR05CA0200.outlook.office365.com
 (2603:10b6:a03:330::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.17 via Frontend
 Transport; Fri, 15 Sep 2023 14:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 14:16:03 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 09:16:01 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
	<mika.westerberg@linux.intel.com>, <mario.limonciello@amd.com>,
	<linux-usb@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 2/2] xhci: Enable RPM on controllers that support low-power states
Date: Fri, 15 Sep 2023 19:45:30 +0530
Message-ID: <20230915141530.1974640-3-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c523fdf-73a8-49a8-c565-08dbb5f64ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MBGUwFEkAy0hlhTim9I+ePfJzmR7WhBE+D5FR2TTFmuo27hoVcEe3rsKf6nTK0ong8ws1H7op6kv6q9bWHlcXHN8VkigIy0U7is82LaiOdts4VFPJSVi/keOCJS+Ik2Tsr9vT6nqsENTbseX+LBjmnIbPif5m5NDZlUGlwqelBW3Tc9OG+BWDXHdeIqrxX0JuFsCEh+A4AYDTICivXJQUnKRgOOfv1O8MGybsXWYmFCoPEJdNF4Wi2/KoThSMG4D9rjWI8q+69c82sI/pfqnEJ914EYV99o30tbc0PxUXCjTOdthfJu3ZIQih8cWNNWnaw7459E/1WafIJMZMGUDwDDyEDJ6BxArx8eYG4vvdh7kJbrgDxzAxS8OdJ9HO8VSopkINqGzLtAHeI+Fa/x0czJ/ChLuAoKQARb/qyyaBz3BkUXsVgf63nQ09Vy4P8IDcMNcLu274EuLzA9U7pg76KH9jiFE2Dqhr0A74nJh5zFv4YpoUeVpjttCCRhPgKwOG7hlO5/hAEoEuJYcImY78//mGdU3gnYZahlWb0r3mAv4Xq7ciQy49ADDdBGLtCGMRZT7DFc5Cv8nOinig1LmZu2WZSY/43EAd4e+ych272jAQXNWzuXQ4Av6XnQQat/U3o4F3x8VBX/8m3fiuDRaKHQ+e2GuWNhdHBmahxOLGY5eS+QArYE4TDudXF88oscxglhFkfzTRLQwhtGsRcoQvliMbukGHUHwCJz0PTKzMx9Z2cTP20KRlYSYVq6wgVEwhN5Pxan7rACDSwU1QrXMRit0vrI19vy1kzDXTtOJ4Gs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(82740400003)(6666004)(81166007)(478600001)(7696005)(36756003)(356005)(110136005)(70586007)(316002)(47076005)(70206006)(41300700001)(26005)(1076003)(83380400001)(2616005)(426003)(336012)(16526019)(5660300002)(8676002)(40460700003)(8936002)(4326008)(86362001)(40480700001)(36860700001)(2906002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 14:16:03.7584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c523fdf-73a8-49a8-c565-08dbb5f64ba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Use the low-power states of the underlying platform to enable runtime PM.
If the platform doesn't support runtime D3, then enabling default RPM will
result in the controller malfunctioning, as in the case of hotplug devices
not being detected because of a failed interrupt generation.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index bde43cef8846..95ed9404f6f8 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -695,7 +695,9 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* USB-2 and USB-3 roothubs initialized, allow runtime pm suspend */
 	pm_runtime_put_noidle(&dev->dev);
 
-	if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
+	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
+		pm_runtime_forbid(&dev->dev);
+	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
 		pm_runtime_allow(&dev->dev);
 
 	dma_set_max_seg_size(&dev->dev, UINT_MAX);
-- 
2.25.1


