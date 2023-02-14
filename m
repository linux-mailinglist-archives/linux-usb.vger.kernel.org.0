Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3372696E3B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 21:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjBNUCQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 15:02:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjBNUCO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 15:02:14 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE962D173
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 12:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq2MdY7uBqJ2FGtMszK/05vRXOAv47ymNKlYgqFAnh5/1GIni240XhJnWM8kP9bunGquyhbXYiP2ut6GseRCE0VQUoBMu5+o4MB424KHtWdiYyiJuMp1tLMKvsGxzHRcROfwdC/HZYNd5X3rTESRdCuhNjyOirNs+oy2Ed6h0rpPf3Tj+GyyzL6pEFdhKG0FCz2dA2hKmPINqon/blGkv7ht1BtBlTyelfvWJnJyOqb4xV+YWB58NqVVoGOqi5SfQA71khhg2Brd9w+sPZKjAvTs67gWwwnPT09qiX7KbgDZi7NCj3ObBO/Yq61MJa6WbYaluhiDKqgP916/31KUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMwgNUJxmNArSt1D6Fb0wfDUojHdbLi0TRarRfqPBtg=;
 b=UUdwAekOHzASLMz71HBi9Ymq4LMUlRfpeHUqkLJpjx+R6jbjgSKmlOA4qGWTKFUIKHVb4DWvhjrKJyXb66CU2+AWTO0ghY7KMlwBMoow2C/3Z1QD3qpvp82VTBJo7uKRJncYt3KJnA5w6yBjvt3kDYldoCDOupBTwW1B2OpaSo8Q8/KrEanNRpjhgrJZKrCZIFX5ySsdRnsxQMxXfTwes6hSzUMNfMgR6n8+YAKaNQAk+aR/BQ34BOCKlNRnScCGTWsovFlyHZa+9+6ethLEq/3Z0eDGObj5TR41NphWvOT43kV9LI2e0mfT+W9UMDeogYMjK7ZzxiV+CrGhJqT+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMwgNUJxmNArSt1D6Fb0wfDUojHdbLi0TRarRfqPBtg=;
 b=O/74A397cFG2EFYQgFny4yDrIIgHUMVF8tXkSA53hKUu9bDOaVwmqcOvlBEKLX8Te8PkQPAJiIKiPvYwfadU7t39VidynB9nw+PMsJQ7/7YUbN78ovvvBEqzPmKu1dlxo6gALPVUzwfwD9K09Ens94c6O2NuhQNePQQA8/4gwJ0=
Received: from DS7PR03CA0241.namprd03.prod.outlook.com (2603:10b6:5:3b3::6) by
 MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 20:02:09 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::4c) by DS7PR03CA0241.outlook.office365.com
 (2603:10b6:5:3b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 20:02:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Tue, 14 Feb 2023 20:02:08 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 14:02:05 -0600
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v5] thunderbolt: Add quirk to disable CLx
Date:   Tue, 14 Feb 2023 14:01:52 -0600
Message-ID: <1676404912-7048-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT023:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: e71a54ea-fb58-400b-8214-08db0ec65a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VP1KV0JBNgysjExBIoETNrUrlmzpTjJSow3S0yaa+x9vKP0PsWJCV+GeawjTCpCqjuHg8pMsyng0ESl+FtQcL2QojB/qbN2PYG9ROy+ODjvsV2dRSDCxXvkZrnR/DhRpP0KPKcquIzg//74KLZesgjEwkLtEDHXDFcnEEVuDn8vCqj0lRmaoNeXhN+wg07LZ+auuGaKl60bU4zfiPeuJBy7nl3H0Om1G+AnqbrTN558vmAKziTXFnq0EbP/t4Vj7ks+xk6XLuRNxBe+WUfTYf2bqlAZLt3Y6NV1pvf4qvW6yHrFKIY4g4LDNAuJnSKYrz+U9w8D6vwh9ZAJfaclsYOMczhEqlIXuKJuN/B5+1qXLV1Z778kYBOxrGMm126fSCOZMwuwYyBSeDnXsMt+RXyB4KRZ2J4WF/kE46fXrf5fhlVNbAKTUWf29cRTp+k1OvR63L90POWPVyBJjj4sg+F2Sjt+V3PMH2SNOZahDyo2LUlZ8jgaw0ArdxIgyaLbJhmpVybw/lO1TClzhcvj5LsTyMgk7ExS3EQQe1ZYd3hiYhqtuIIXK7SVQHw0o9OQE/GFno6MFcru7yZmeYPbf3VBryDVLEL7xwHqcNHebEllM3LyhTNRuyX66efZAPIoYG9GFJpBiWihPiqFqu9CbcUFMIEr7HQNBfVmjeZt2cPLAez4BMIQVdQmEDTDnkhrfh/2i8WEQaa2OXsv2N+9Xv1xiLXWAkO2gXhzcbQpSL0U=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199018)(36840700001)(46966006)(40470700004)(110136005)(5660300002)(47076005)(83380400001)(26005)(186003)(426003)(2906002)(36756003)(82310400005)(86362001)(6666004)(40460700003)(478600001)(81166007)(41300700001)(40480700001)(7696005)(82740400003)(16526019)(2616005)(36860700001)(336012)(356005)(8936002)(316002)(70206006)(8676002)(54906003)(70586007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 20:02:08.8074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e71a54ea-fb58-400b-8214-08db0ec65a91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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
index b5f2ec7..3fc5474 100644
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
+					q->hw_device_id != root_sw->config.device_id))
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

