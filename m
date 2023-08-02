Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDC576CB81
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 13:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbjHBLMM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 07:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjHBLML (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 07:12:11 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAA1123
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 04:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkIQ2niKo6h38WJe4jyhiwk6AvxXm85LUMl9ivzoWXLga7G+4+F9lVmCEHy7u95D283+nE7ZcUKdRZ5FidDDO/dKBb/cTGNkXH/hxqEijWg07s/YXO+3CuTHDPG793cXzOBwOZV++rND36Vgy+bwIplDtRw+9NxthaiLlPdCH9Q0hY48fs1KeYWiX6UcjuhrKRAYf1WRLyjpWaEo0P30lKoK2UGJ4y/2WFiDq2Zy+9uRtcKRETJRzi/kjUgSJaRWggMxk6QFINXHlEo4POGaRJrRXTm8EYhrXzPYpNJIw2uUcw53maXlad5EYu3X5NqPHZOydFkoW97GRa0RdoEKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDtrTkoNMgXIp7GDc/OwepKGkPRmbJvFWTASuO13Rjw=;
 b=f1msoDzJThBMKCFoPLLHWIwb1RJ1O9VfnOHFgkPcWBRbu4I0KipkgvIg8vGmVDk7XT5Wwyg0L1vdarzi6lHKwscqhYDhV+4nz5sDWhwc/bPArUcQ8EXJmmPq3seFdlVU2wY1aowz4KuaGFTnRMEwVmORGY0dZ3fc5mvyYWdXFP5+c1JJ9LYK3/yculEQgWdkOhdxkNZ6BDs/Io1AyTnAwYRWOLOk6ck8v6IxKTjBBuLz/FhUzi5iz5KKgakaMs6wqIDYaPfnd0livRUyqMQQtnI0l+9C+hnM0ZKeryDA4aEkPOjk3PQ5ZuZNUpDSzmkmImG/78EK3Qev7rmwEAwxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDtrTkoNMgXIp7GDc/OwepKGkPRmbJvFWTASuO13Rjw=;
 b=I6iqSf8tAys+rfv0xnVu90vXDyIuGKPkRBD0dA35BRQV9NxOtItqdJv62jmfLbGnWIY8WTiKYVYwJWQKWuo70NjcdcmTMxneR99sXWLIzEEaLVWaG56nzwK+2MAHxNNVt9wvFXJ4fue4sIBoXh3TeiphIZA2Jb9F+vRVtWpuS/I=
Received: from PH7PR13CA0003.namprd13.prod.outlook.com (2603:10b6:510:174::14)
 by CH2PR12MB4038.namprd12.prod.outlook.com (2603:10b6:610:7b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 11:12:05 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::5e) by PH7PR13CA0003.outlook.office365.com
 (2603:10b6:510:174::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Wed, 2 Aug 2023 11:12:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Wed, 2 Aug 2023 11:12:04 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 06:12:02 -0500
From:   Sanjay R Mehta <sanju.mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <linux-usb@vger.kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
        "Sanath S" <Sanath.S@amd.com>
Subject: [PATCH v3] thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards
Date:   Wed, 2 Aug 2023 06:11:49 -0500
Message-ID: <1690974709-20848-1-git-send-email-sanju.mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CH2PR12MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de388b8-2def-4f4f-fe0f-08db93494dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ALDLMrd75RuEuE1ocPlrbU7lmDJQ5yQ56k847jkVyl5IiXKmsHKTV5zbHD+jLZbd4dkvJzggdLm6pA1nmU+/sxwmJxF4RwWdr1/o+JfsP8ohMDwEMkTkfVqyIEMDvItjCJckM8nhaioHPt97vSsxxg5jXNVer0o2hhY/RlOmXyXPVfi/8Y50mfXs4YGbaCs6BwlnGVUfkzvGu5uZOAj6TBAmKdCEMx/NbZ9ZTZraUUVf8TLVrjU9XOBC9uIFZUZ6wTE0tgHRuhMWVS2bqmFIyzCRbaKaa2AkJID4JQq0BfBylc4AnAP8bHEXu9nKDwv1ZXcFq7EFH+z4zWGTXhdOXTMzPFFCq1VuxkaGDqGrAgQQp2J4B6wKHDCr7w/49o4OpyHgw07aShylo4rXUS1p2MOtKt1eGlqk9+GXKWn7w6THHR62+W5rV1qDZerIg7Fr8cly+G/OOnh5oNIZXqTuTFoPgUXrz2OIVzDWQOW5sm0+sU/7+xGgWGfrz7k73BOKybxiawUeMlHpjXCXNdwP/XySUpjXw9Tk9GhPFeHYQJywx0P5xD0qTeF73EvBjUBb4zE9frpnim47Z5w0tzYwV08TledUHPAXX867kjmv+3bsjJZp602Zip3o8+Q4ROcvFIGuOage66WKnjf0vR2KVRyTlb3BvBK447f6XMQQr5I8HpvE86jQvaI8VFnRCPNOmlU6kSewkdUmO3W1vbsVTqnsWYwVaDJI6zegmRi9qrWq0W93B1h4ILOPTamcJ3KSXMf6bHU6OkfhFo8/vBRhUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(82310400008)(451199021)(36840700001)(46966006)(40470700004)(70206006)(70586007)(86362001)(6666004)(7696005)(2906002)(4326008)(54906003)(110136005)(40480700001)(36756003)(40460700003)(478600001)(83380400001)(82740400003)(66574015)(426003)(41300700001)(47076005)(2616005)(81166007)(356005)(5660300002)(36860700001)(8936002)(8676002)(26005)(16526019)(316002)(186003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 11:12:04.9411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de388b8-2def-4f4f-fe0f-08db93494dc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4038
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Previously, on unplug events, the TMU mode was disabled first
followed by the Time Synchronization Handshake, irrespective of
whether the tb_switch_tmu_rate_write() API was successful or not.

However, this caused a problem with Thunderbolt 3 (TBT3)
devices, as the TSPacketInterval bits were always enabled by default,
leading the host router to assume that the device router's TMU was
already enabled and preventing it from initiating the Time
Synchronization Handshake. As a result, TBT3 monitors experienced
display flickering from the second hot plug onwards.

To address this issue, we have modified the code to only disable the
Time Synchronization Handshake during TMU disable if the
tb_switch_tmu_rate_write() function is successful. This ensures that
the TBT3 devices function correctly and eliminates the display
flickering issue.

Co-developed-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
---

v2->v3:
-------
	- Rebase to 6.5.0-rc4.
---
 drivers/thunderbolt/tmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 1269f41..0dfd1e0 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -579,7 +579,9 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 		 * uni-directional mode and we don't want to change it's TMU
 		 * mode.
 		 */
-		tb_switch_tmu_rate_write(sw, tmu_rates[TB_SWITCH_TMU_MODE_OFF]);
+		ret = tb_switch_tmu_rate_write(sw, tmu_rates[TB_SWITCH_TMU_MODE_OFF]);
+		if (ret)
+			return ret;
 
 		tb_port_tmu_time_sync_disable(up);
 		ret = tb_port_tmu_time_sync_disable(down);
-- 
2.7.4

