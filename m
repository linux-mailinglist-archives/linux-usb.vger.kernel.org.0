Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69D30782414
	for <lists+linux-usb@lfdr.de>; Mon, 21 Aug 2023 08:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbjHUG6R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Aug 2023 02:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjHUG6R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Aug 2023 02:58:17 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2067.outbound.protection.outlook.com [40.107.212.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D10CAF
        for <linux-usb@vger.kernel.org>; Sun, 20 Aug 2023 23:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJc8zPVSavaLujMR4YTdTU8p8cMuE5aYrcajHxtk34C83Rpz8rlYtlVIS5pTs+fPqPvm/SCGqdsGwNHe7NPDKiHcSF6EvTYYcrtsYA03KWCqC0ca0Y8oA7PaVhjsQRVnPSts8OMCmEmbLAaMX/NMXo8tNo0Gfrgm3B9QlbTzGI8BFtbE+gBp70NXW4V24DqQQbTtwWPKJ8ZEItpmjOScbGFfhKxwPJLCYh4Z1TUFs9OQWCpJT9imkZ2s2zp+XPzPSkukVFYDDCyq93nikKyIPXjBcawF9/GjPfsxXUWExAZ7KHYW7Fyq8UGRalhiomfsGPlrBUXbQ4sT+DzbBesHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+r2rRH2y85uBG2TItXqkZ2NJ6OjpbWhdY6e/3r7ZwY=;
 b=RuNE8Du+AhmbjwdEFXXkEgZMoPDYajb823pTwOBUjsrmYLjxuPu5b0hZLC0+Wbt+vOgiZ//Y11CFq3HBTCsq1yTQRt4LKr6LQX+bU+lJZZ85cY4YgRwtyEKKic5kECWpMeVHSH81Zvf6CF3uOE08q76m2OGTJECiLV/hfdoVVkPLzP1qz1siqcoa6hYNemj/CkdZQ+UWiZwrHG4wGQ2GRn40aWAC7DJj7jEPqc9znhZXcjvFhBOazhEu50jUk/q1cu0TaE8pq4SCO6YabA1exsOV5HLC3a4eOTinMqno76tULBkh5kYbObI7PhpDGy3zgINwANedf+nGXQdTChPwTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+r2rRH2y85uBG2TItXqkZ2NJ6OjpbWhdY6e/3r7ZwY=;
 b=Myl+3RI+B0mBFxcLb4L3znVJ5oW80lctkrzyh+w0lbiLQup32kCVwkjKGjVCpTrVsUcnnIk1ELSBYT2sBiSbaRs0dJx+SkqPQxZyQAA50B3rq01QlsxjSxRXCmGjm5dBW8fW/Jhpl0hpBKmQH2x7stuErQA7bAWA7FEkjn8KY3I=
Received: from PH8PR07CA0003.namprd07.prod.outlook.com (2603:10b6:510:2cd::17)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 06:58:11 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::f0) by PH8PR07CA0003.outlook.office365.com
 (2603:10b6:510:2cd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 06:58:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 06:58:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 01:58:08 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <mika.westerberg@linux.intel.com>, <mario.limonciello@amd.com>,
        <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/2] xhci: Enable RPM on controllers that support low-power states
Date:   Mon, 21 Aug 2023 12:27:42 +0530
Message-ID: <20230821065742.2924681-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821065742.2924681-1-Basavaraj.Natikar@amd.com>
References: <20230821065742.2924681-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e2efec-34b4-4f20-f296-08dba213fb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMu8/Pj2ic5SlXd0xwRgW5xpCJ0clGxuFDEaJHT7V6zAsJ0EL3PPwYJGzK39V0AbjSnO989FNn5Zotft3rJYUaUavR6ERvZV84URGtDzQ6//TNRKO1+T90Es9+ECwc6cD4N5C547JWLJ7JZUt1UK1OVxEhKYwpAurqorJqMnSfdP1YzjbEZR2Vip3Hnu2r8qP97moi9QqnP4hU0cDYj8nHo3/ii6vAcyLYg0YdmTqu9Z9cnTlOBVThORQV+SMeqx9xZrdSZho1VtdDN6YqFKXWdDN+sxn8EgHN+Pb5hRvubFHr1oVo+1nZBATt4OPla7o7GNsh98DaRT69agk5QMCeY4RpDp00Q3F1oPuXows1E/NiNEGsfAR1QtvVIGOj4Ll1pEzqMQj6WP2mMVvO06iD/wdP68NeKh7avKBFtkxWosl5IZHlu8zqaN+0Me+8OC5YmxY8fHKuymXEPMBzdjzD6grSO6OKvkO/LsUMdOIYpeQBbiFOYPRXC2uMx/wV3ztCOIt79DyShrcTI9Q7lYX2AWFZyBDGrp6orDzI/MpNayw90GZuXGzpeYlDymMpaKVeI48gY5tiq/zXs3Q3TesuIcoKFtglBJLfQyKlWinF34yGESHOqKs/4j5OKx/LFa1OtUwIPefNOMFNCotN9epzRrfXZL6zp49U/GgO31LlTd1y2W5RFXlSTuJMB5/sS/t/yx9IjgJ+6zBzMNmoTmf2m9sfQBFdaZvkUdh5AI4TIikAJjAGIDNatrBWb85iXVA9CTPBPF69jOLH+1mAvBGEKUEcFpdElahyT6Bs8DOew=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(6666004)(7696005)(40460700003)(36860700001)(16526019)(426003)(336012)(40480700001)(1076003)(83380400001)(36756003)(26005)(81166007)(47076005)(82740400003)(356005)(2616005)(41300700001)(2906002)(316002)(70206006)(110136005)(86362001)(5660300002)(70586007)(8676002)(478600001)(4326008)(8936002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:58:10.5495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e2efec-34b4-4f20-f296-08dba213fb3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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
index c908a80ef436..1bb5b510c5ba 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -693,7 +693,9 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
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

