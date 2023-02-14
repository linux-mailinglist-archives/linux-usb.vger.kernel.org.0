Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7F0696E1D
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 20:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjBNTtZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 14:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjBNTtX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 14:49:23 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8244E28D36
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 11:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6s5Dmibk0mlyBy4jTkLMhi3zuLr4Zqo3JuStW9tpB7RiWgrwoj2AcBsv51K59+0uKi614xiOGivb1/QT3et2nDhHNU/3kl4gSWbf/Z5PGZyS4TiZ8CMflhiiCdBKt4br76ppJNK2yjqbfdjvViQyppYrQM7QhPl/OARRt45mh1QNY3OIrYT+J6GTFw0rg3hR925x/WWRfIoeUAb7d6lx5kLuzzUcpNd/vd6EdEwI1LeqCavFbIJ2NxyPDaTiOqbG1h99bOs847RsXIa6lcl391cmzSMqX0T/qMeO+R3Ag1+Y/U3nz9fdgyvtfvwlWG0at6ixF44Pn+213z55DKTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDWaaxWyN8PgUBKl2akTDD/mN64s1otIrEHSFH3/48s=;
 b=V7H863BkISq4LooWqro9gljd5zKlX10k3PEbM6uxEB6juMPmXv0IYs51ves5gS2FkyUd620jlXQ07zcjUQMDcgjuEAYgtUKhgmOZAzJ0D6Nb1pK0rr0QdXonsO4DerXHvKgXGMvHUUsqsiuQFfH0Dqt/MM/1T8YRfDlkFWtb2MkmRrC56DTZq4Vbg1Eq7xXg8QJYzekO+MBKqZ0R96WWCHg65Txg6UH8BB7t5PHBVsxLANYnZOO4zzUHgA5HBQuoKbrGbgJIO7M6yXs+h8MuVoUhI9lebFHDgEkat4drR1hWWTYuLokoGI2TjrEK7qWTGY3+TSGGgg5wp9ihL4681Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDWaaxWyN8PgUBKl2akTDD/mN64s1otIrEHSFH3/48s=;
 b=gyLebozVkOubGz4YFGrOPVixTXonefwQY3kXlnHwERdSzD2ocYobnUNnRWzMk8J1Qfui5AcMKxCCblPVm1jdK6w5uqLyKP1r81iVejE0PhuFIb4lJu1YuvqIW4FcFjXkNAeHqxwcelek7dHlREn25fKGXoqTL8vcH4djuW8MDt0=
Received: from DM6PR13CA0038.namprd13.prod.outlook.com (2603:10b6:5:134::15)
 by MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 19:49:20 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::55) by DM6PR13CA0038.outlook.office365.com
 (2603:10b6:5:134::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10 via Frontend
 Transport; Tue, 14 Feb 2023 19:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.10 via Frontend Transport; Tue, 14 Feb 2023 19:49:19 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 13:49:16 -0600
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v4 RESEND] thunderbolt: Add quirk to disable CLx
Date:   Tue, 14 Feb 2023 13:49:04 -0600
Message-ID: <1676404144-5155-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT030:EE_|MN2PR12MB4093:EE_
X-MS-Office365-Filtering-Correlation-Id: 993bca1e-953e-4a74-7478-08db0ec48fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wMIRRo62d+uHmYIMk+91UZMGb2bynlsTWoqaWWlquhPDHAD4XgNzco4VEkYg3RaWaKmTOX31EmZghrAsiTLEykq/zd+SUzQMo74S2KRwo8rDI8tHufCHpVwtEjgrMGhhxxsnu3VgnF93gzicjYqGzL/nXir97Z1xLQwiRjiaJJWRCjguCjGm3VYXjcOYnnn64zbmqREMPxuzzZMd3DgSu4QwUhmEp+CVfTHEdT0oKNaDTAa8X/8tPDCRtiVZbFyuHqM7B73MpZ1mIoFgu1Vur0m8eL4EV4oJJ66Y+5c1Sw0cJkaDEJ8XDt5wqQrcNC+56/Mj3hHKlmKvespKycUTD0tU+ylzNXAwWy0o7b60eikqeYs2dfOlWdQ8F6eqFv+lc038MFLx2hheH5UNzzuRpBj5WBH53RFFYJ+k4EgLhTqnhTt6kAq1ATU/7a3tMwpoPeKtKOjFSdYL8IK6gr+/sZxVesbhbIbPD4GehJwSrVsAzUktoORf2r7xUWwYw9JoorkJdrx6TnFOrQU8bXc+cW4P6HRXcyfymnxQOeYKvybm8SUc3MI3T+cdgBb5D+SsYzK545uIzA/00EOxBwUdPlvUozO5eejzMs4IQ1+EFanddDPOTpbmKhYptyEuMeTSAvRi4HetyHyFpES1gZSYYAT03qfMtAOQp7sUZqxk1dZw0XmdvPM5qfismahkk1JvwplLHliHw4cKL8ode2UiQIfdBthqb8EyYyhQjmlIos=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(16526019)(2616005)(336012)(26005)(186003)(36756003)(356005)(426003)(40480700001)(47076005)(8936002)(6666004)(86362001)(478600001)(2906002)(5660300002)(83380400001)(70586007)(70206006)(4326008)(41300700001)(8676002)(36860700001)(81166007)(7696005)(316002)(82310400005)(82740400003)(40460700003)(54906003)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 19:49:19.2375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 993bca1e-953e-4a74-7478-08db0ec48fde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

Add QUIRK_NO_CLX to disable the CLx state for hardware which
doesn't supports it.

AMD Yellow Carp and Pink Sardine don't support CLx state,
hence disabling it using QUIRK_NO_CLX.

Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/thunderbolt/quirks.c | 19 +++++++++++++++++--
 drivers/thunderbolt/tb.h     | 11 ++++++++---
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index b5f2ec7..08e609a 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -20,6 +20,11 @@ static void quirk_dp_credit_allocation(struct tb_switch *sw)
 	}
 }
 
+static void quirk_clx_disable(struct tb_switch *sw)
+{
+	sw->quirks |= QUIRK_NO_CLX;
+}
+
 struct tb_quirk {
 	u16 hw_vendor_id;
 	u16 hw_device_id;
@@ -37,6 +42,13 @@ static const struct tb_quirk tb_quirks[] = {
 	 * DP buffers.
 	 */
 	{ 0x8087, 0x0b26, 0x0000, 0x0000, quirk_dp_credit_allocation },
+	/*
+	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
+	 */
+	{ 0x0438, 0x0208, 0x0000, 0x0000, quirk_clx_disable },
+	{ 0x0438, 0x0209, 0x0000, 0x0000, quirk_clx_disable },
+	{ 0x0438, 0x020a, 0x0000, 0x0000, quirk_clx_disable },
+	{ 0x0438, 0x020b, 0x0000, 0x0000, quirk_clx_disable },
 };
 
 /**
@@ -47,14 +59,17 @@ static const struct tb_quirk tb_quirks[] = {
  */
 void tb_check_quirks(struct tb_switch *sw)
 {
+	struct tb_switch *root_sw = sw->tb->root_switch;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(tb_quirks); i++) {
 		const struct tb_quirk *q = &tb_quirks[i];
 
-		if (q->hw_vendor_id && q->hw_vendor_id != sw->config.vendor_id)
+		if (q->hw_vendor_id && (q->hw_vendor_id != sw->config.vendor_id &&
+					q->hw_vendor_id != root_sw->config.vendor_id))
 			continue;
-		if (q->hw_device_id && q->hw_device_id != sw->config.device_id)
+		if (q->hw_device_id && (q->hw_device_id != sw->config.device_id &&
+					q->hw_device_id != root_sw->config.hw_device_id))
 			continue;
 		if (q->vendor && q->vendor != sw->vendor)
 			continue;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index f978697..206759a 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -23,6 +23,11 @@
 #define NVM_MAX_SIZE		SZ_512K
 #define NVM_DATA_DWORDS		16
 
+/* Keep link controller awake during update */
+#define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
+/* Disable CLx if not supported */
+#define QUIRK_NO_CLX					BIT(1)
+
 /**
  * struct tb_nvm - Structure holding NVM information
  * @dev: Owner of the NVM
@@ -997,6 +1002,9 @@ static inline bool tb_switch_is_clx_enabled(const struct tb_switch *sw,
  */
 static inline bool tb_switch_is_clx_supported(const struct tb_switch *sw)
 {
+	if (sw->quirks & QUIRK_NO_CLX)
+		return false;
+
 	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
 }
 
@@ -1254,9 +1262,6 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
 void usb4_port_device_remove(struct usb4_port *usb4);
 int usb4_port_device_resume(struct usb4_port *usb4);
 
-/* Keep link controller awake during update */
-#define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
-
 void tb_check_quirks(struct tb_switch *sw);
 
 #ifdef CONFIG_ACPI
-- 
2.7.4

