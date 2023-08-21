Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4CD5782415
	for <lists+linux-usb@lfdr.de>; Mon, 21 Aug 2023 08:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233545AbjHUG6S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Aug 2023 02:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjHUG6R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Aug 2023 02:58:17 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD509AC
        for <linux-usb@vger.kernel.org>; Sun, 20 Aug 2023 23:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kO/9K6E0MQMr2j/a4EOSz6zFrMOg1+cdtkk0soRPjhJ7d1/xY7pc6gTlYlzgnm940aBkN7GNlrZ9e7g/tzceV2WhUxabjrCp4oUQo7hKMnwClq0VE1EwdszqwzoJ6FR4cY61CNt1j4znEi23AR5AXuyzYyqOKq2GwTonCmL2Jkd2lqpP5WG+ktTTUjHmUZrVNs31uTw4eHAUhKuIFavRtBwoW4TSzyFWv+ZXJ4gAhgylqj9Diij909MY2WNTZ/UJJloupm45eNmS7Ki5FjMuTgkpYxUtEopctca1P7bUTwN7SAJ16WjS9cdgX7s/VPIS7rTC1C0cYXbjtl77XRKA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jx4aATHBfcRKQx3xwP5Nl2JeFZ3fXDWaWSaUmFL4s64=;
 b=AH3VgxXeVqioebM1zfwiyRQvZmCJ5oNb7Zru/WtwvoskJcUoG2doDIb7LygkLtM9yOsdlrxtYdFt+HhStEDfUjw1raBkFsyzU9ViyMTh0AIVFbwqg7+vcQESOnW3fwQkF4FviVjS/hhQyirAIkQ0baNrRQV0G3rc/v+AECcVR6J5ffgzfpb4ZgTyrtHkfYDAyifKJCp/k4/hWicBSen4f3oI7Itsn8Ylfri930+fXS8NEyh+PSrDrpnXLoHpHzZnUjrtf8SLXv0CnU+KoAlBjVvyQbPZC9s/a+IpYO07DePJkGxR/95sl7B4y9MHItuPT9s0Ui1Ya7e4EVGNvqDUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx4aATHBfcRKQx3xwP5Nl2JeFZ3fXDWaWSaUmFL4s64=;
 b=nrDnSXDJ4XF/9xL3OnnvItDE/dFv8vx5+NFLYiZjtfog+nWhjkCmDIp3mGQKkw/pRJdat5erywObl2HHMQ5Geh5uhFNIfx4PIRcQNQSge2oVf/6V6tc2WsaQ9Xc4Rq15/b9eBOWq/Oj85WVNQfbYybIWUdKy9N91Eab90k3hoFE=
Received: from SN6PR16CA0066.namprd16.prod.outlook.com (2603:10b6:805:ca::43)
 by CH0PR12MB5234.namprd12.prod.outlook.com (2603:10b6:610:d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 06:58:09 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:805:ca:cafe::6) by SN6PR16CA0066.outlook.office365.com
 (2603:10b6:805:ca::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 06:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Mon, 21 Aug 2023 06:58:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 01:58:05 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <mika.westerberg@linux.intel.com>, <mario.limonciello@amd.com>,
        <linux-usb@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/2] xhci: Loosen RPM as default policy to cover xHC 1.1 as well
Date:   Mon, 21 Aug 2023 12:27:41 +0530
Message-ID: <20230821065742.2924681-2-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|CH0PR12MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc96e51-22b5-4c87-f31f-08dba213f9e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7rcyIFXR6ZqAcIHgoGUoBTyVzhAFuntpOhCw4wDdKQeNAL6W8UNQAslWCE8ah53s2DSFG97SFyOqQ61D2f0fFRL9I+h85d5jTDVpE3RiSj8wLN6Oc3OAQ1XtLVUqsWIXGTEkDvWzP9ldvCTM8KMCuc++VeI1AEkRWa4JFImQEQM8B5hND7k35xFlv94jTmKoe8dHzFhrvmTw7X+hXCOVPAKwIRboXnwqokNay3PjwdFFwS+3OnAMBIXsQmozff0htFfooWNlQ4qxWbpV1fX85ujZC6p2mgHl2aR/QNb5BweeRfKIJG/TtT3hhaizqjoz1ug1LtkbsAAR57Gh1+NPlOVfhRKb2ERx1ZLJGK2hAdxO/SLsJec4Ik3n3tFt88RvhhOOrdUbM6bfGIj8r/4PGAyF0E0gszTWSeRpbBsX/5UHSzdjUjuaoHmB6ZfdvFD8qEf2auYPs5G+klPgkYTSLJAM/yt7uGSaiiN3HWFDE9QKUZn/5ioRck3xmsH4OECqxl2B8NR4x3M8JAj0AWgldWmjkryQmCeRChGD1g+7hUdC82f0b+rbbGQqNpKXAasjBAJuL+yAybqzYQ4Qgvuy8y1tvyoTV0lBBxwF02BSds8fs8LwfEXpRMX/Qp9nRBLDIjQyHpe5KCl3aGi5UoN5yCiWaYLQU0cAjuCs41nN5FX8hqvSLE6wAFydmQezqwaeQQrilRH444lF/IvGvPAp3o2XRdiay6FX/LT15In5cnJcfQW7LL8JXiMJ4csRCEUR2H4+BbipjDv9D/ov5sS/g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(2906002)(83380400001)(7696005)(40480700001)(5660300002)(336012)(426003)(26005)(16526019)(86362001)(47076005)(36860700001)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(70586007)(110136005)(966005)(478600001)(82740400003)(356005)(81166007)(6666004)(36756003)(40460700003)(41300700001)(1076003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:58:08.2910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc96e51-22b5-4c87-f31f-08dba213f9e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5234
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB host controller (1022:43f7) isn't going into PCI D3 by default
without anything connected. This is because the policy that was introduced
by commit a611bf473d1f ("xhci-pci: Set runtime PM as default policy on all
xHC 1.2 or later devices") only covered 1.2 or later.

The 1.1 specification also has the same requirement as the 1.2
specification for D3 support. So expand the runtime PM as default policy
to 1.1 devices as well.

Fixes: a611bf473d1f ("xhci-pci: Set runtime PM as default policy on all xHC 1.2 or later devices")
Link: https://composter.com.ua/documents/xHCI_Specification_for_USB.pdf
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/usb/host/xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b9ae5c2a2527..c908a80ef436 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -533,7 +533,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	}
 
 	/* xHC spec requires PCI devices to support D3hot and D3cold */
-	if (xhci->hci_version >= 0x120)
+	if (xhci->hci_version >= 0x110)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
-- 
2.25.1

