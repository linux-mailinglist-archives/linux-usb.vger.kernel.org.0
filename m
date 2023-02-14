Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7CC696D9F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 20:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjBNTOV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 14:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjBNTOU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 14:14:20 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FF526CF4
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 11:14:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GX8hn4QLeNkvuOK6KB5RmI++euv4jm5xr3LLD4yaLwC2uasbv2OUa5SDBq3TBrFUmkNPfsmWDqDD/cIsCWOVVj1JtBxCjIPE6KAXQttJrhzBa99BOpugkhV/rTFab7l7XMbcm8L3NPo+GesZUn/Vj4N7bmL6TuuFHfglQssLwIFaP8tiIkjv84kId8kGNkySm8R7lstgZBWS+e8omkEp5+ksbZ3jLpx8SsDsnIC+4KcdPuzhVMqnBFWRMRkC0rSyPiS4n9yXKOcOUepTVTsBObBO77RZhfb4lF2Ax879fx/xxsfwlXWCdhQM1ERASvHQBBcOfSo6Imzg6e+0o5UbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0pNXHLJavb5VATIzM9M3OZAgcs+RolyhZhRhdE7/B4=;
 b=dq8s8RaxPH+l0JoSFmF84iYZJEJ/GzcF6iWK3M/n7PlbpjU4R7A7jN3UU2Uae6edBNLWi9+hkNXgIJW1B3DuaOO0GhQzWmhTXGR8TKBqzg6tyNPG+fe9YpHBx+8l6JruhAA1eGGfcbx9ikUoItfclH3wVBPuF3awORlMCqcgJt67vYE1537nyzPedyMx3eurQ4Gl08L5aSQ1MKt6GAA1jgww6+5qYNxihSVn+zNarxMK47pl9oRg/AIYf1dzjTfyn/NUnbw8QTdfRLDRdyNLYyPB+VqRpGQOdWE+JBwN5MzuPXWmNtrXwJEP6J+0P8p2lNssFb2W0AkcBlSyFN5jyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0pNXHLJavb5VATIzM9M3OZAgcs+RolyhZhRhdE7/B4=;
 b=oC6lwZ430Lk/FUomJtnNt2HoBNAd6KcC330fBaon72bd8NzxHaPmYCKm/Ku7ixymI+51bF15xMtb8WKeLJ8Ywy3W6p44aHMMZzW9d0Se7mHMfXNi8K5U5uDW4jH6sUShbSQhkixc3KOTpJsw77C4sPY8F5Y+vW97iQq10IaSMrc=
Received: from BN9PR03CA0571.namprd03.prod.outlook.com (2603:10b6:408:10d::6)
 by DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 14 Feb
 2023 19:14:17 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::ca) by BN9PR03CA0571.outlook.office365.com
 (2603:10b6:408:10d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 19:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.10 via Frontend Transport; Tue, 14 Feb 2023 19:14:15 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 13:14:12 -0600
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v4] thunderbolt: Add quirk to disable CLx
Date:   Tue, 14 Feb 2023 13:13:50 -0600
Message-ID: <1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT051:EE_|DM6PR12MB4340:EE_
X-MS-Office365-Filtering-Correlation-Id: 230401d1-647c-4639-ec8e-08db0ebfa9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DeDHC9oNlWhK9FATX4oys6KXW43rdq9Sa6yZzzzinQau1S7UGF1ZmL2oV0maJzyhep8XxeQsmGcBSEMQjjlsnZwCmt/QBeDcu+3/v/4coyTHjJrzB7gcVVtSARGGu9VuKu9i+obU+Bf2wCPqFmijxxrwDHlW1X6C7RR25mawIUb4IEuiB7wlwhir/BNZcLd/32sqvDTagnC8yCgGtGwMDTj/fpOMQbvnrzlpPbjC2JsnboKn9EQhCkCSnSWgevhkNmPRLfFa/tSWz+hJv0xltgMHV8Ab01SGKa6zYzKiuWPx2/RnMX9F7V8zoz7/guQ3cuhhlMgwqhderf75lpnMJeJ21kGOg4MGT9ART7FBGrvc6NmW/3kB2E/HkO+M/DNNQncrRCqKO45vOZxTgY6jD4wMIQDxr/UCEURrrxtaGWCf5vCpP3OUWGQe34oDOFYB+z19Ok0r818yGCmLd09ca3X4mKJxhVGEJKYh3QZUAgak1zvCwtTjmrhbNuv8BCR2Nc6ht6iwtKPMH62vCFgWyvF50pipRQwOmjELzD9NgbLzuUqF2C9YCYu7pgUTz4vLCud1oIMJkuOivbsC2gBDnQGCOdjMCWd2kigI3PjOwi2lutrrInMQhXlH6DLRrfD1J6jRnW5V5mC9S8HzluY+dRvzZMXfaqw3iJ/mcYVI9uGRviuzBH5+0PUrvIFys4RzIomCr5rfra59ULbWxrAWiZbFaZjp0Stz8287G0iDuKE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(478600001)(41300700001)(8936002)(5660300002)(54906003)(40460700003)(7696005)(86362001)(316002)(4326008)(70206006)(70586007)(8676002)(110136005)(47076005)(426003)(336012)(83380400001)(26005)(186003)(40480700001)(6666004)(356005)(16526019)(36756003)(2616005)(2906002)(82310400005)(81166007)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 19:14:15.2123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 230401d1-647c-4639-ec8e-08db0ebfa9c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4340
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
 drivers/thunderbolt/quirks.c | 12 ++++++++++++
 drivers/thunderbolt/tb.h     | 11 ++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index b5f2ec7..03cd390 100644
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

