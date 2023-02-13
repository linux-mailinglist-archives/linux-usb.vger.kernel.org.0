Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75F2694EFC
	for <lists+linux-usb@lfdr.de>; Mon, 13 Feb 2023 19:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbjBMSNg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Feb 2023 13:13:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbjBMSNf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 13:13:35 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF3C469B
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 10:13:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHfAxERSGq4j+pNEILU5csL9hs/HeE25cT3Zu/kiIE9S+vdw5yBX6UbksFxHv46dT6QoohMTCBmTsJdXZJEtLUOMdKPpCLznM63QCoNRskrmnmgIYLKjCc3CRQbyyAGIiLBXmTGXzsvl9FY40IzKM0sNBNrB8CjLgEOvaSnLkfOwnzvTdPMcmT1yCvxrUfu9qQLRiN3LDIF+pNi4B9CEtrzgHB3jq9DtKrvvNg88e9PtHhuMwQFzmDasEA8McAVeLFKCGQIwAkL1Qr1RpNNAFORvBhS2CWUQCseJ21TRjdGaO3r/cdxnaZUbNO1WbLX0ayMnz8QlpVGgjMVuZv9uFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvdKBQTg11WNgGBr7AGR0GQE3i61GCVkurvOSXQGXR8=;
 b=VRICXQReYKTXURaOBsSvrrZ2oN1sou72W/+Jig9rcZiFl3AgQwNROp9h0mqQhmJ0PAJcp0Wamh89FrawdkxHDy4JTNkFA8NI77tdge0LwfCPRim1adlOoTftwkXkW9GWXvUyj4pg7W0nCnxFoR7EzSUv+Nwl8T9vaMoGCSdIfujNOclW0ok/QtQFLn/MlC0N7lfRxWQOcVi3D4Ibq9fC6kZ5FAw997p+a1kRKRrRRTKas/9yHdhhHNzdFAMldHVsulEjxNHMWA227yLjGpejtwUPLaQ755Yz2ZdhiJH04kObfy9VcUt7Bo7mle0WwrNOplxvkinpWTou/lG1ISZjdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvdKBQTg11WNgGBr7AGR0GQE3i61GCVkurvOSXQGXR8=;
 b=kJWt35neXPukqCJY2P8zSARHeA1G/PHdxGXy/1JrmMRc1bz9QpIcL3spryQi00XWAdYr3zmaQ6H+cQ2Gok3GVObOZJEgWX2VrWROwsx1wlseBdBzQFiRzbfuMy0x/HpEY817eXYHzxHDRvfc4RiHk0yDp3G1dj22/fPfuGz51Bs=
Received: from BN0PR02CA0011.namprd02.prod.outlook.com (2603:10b6:408:e4::16)
 by PH8PR12MB6769.namprd12.prod.outlook.com (2603:10b6:510:1c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 18:13:15 +0000
Received: from BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::8e) by BN0PR02CA0011.outlook.office365.com
 (2603:10b6:408:e4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Mon, 13 Feb 2023 18:13:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT089.mail.protection.outlook.com (10.13.176.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Mon, 13 Feb 2023 18:13:15 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 12:13:12 -0600
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v3] thunderbolt: Add quirk to disable CLx
Date:   Mon, 13 Feb 2023 12:11:51 -0600
Message-ID: <1676311911-1952-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT089:EE_|PH8PR12MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 73019d23-d362-4873-0c60-08db0dedf9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jg+3l9DAzx4YtHBDcDtygfs44zqMD3lLKGQUx3y3KKDqZDLXjbQwXtk4x0M+1f11vkpxnpC550jWxEE9ACjq4GQMNTTNezrv6u8dVpXjSOuNQFLlxANVmAd7gI+owKPMXwfXT/Vovt0kDQHjH/IgT/sKlsjJLLLP7vhmBCoLpofrxiMgLFcydezdSbeB0od/gme3fGpwQXRIIIMBeMolZRhRP6z7rd4ela3wKE+8YGD29nI8okjosPdAhUviHgtTteK7g7kza5l1JNnYQoRsPxbtkG0LjsH/vVsKBOLbBnfrofiWIMMtYUyHDhaBGtNO30JaXQIwczWbIEtUyQyPSCdjVnTSGY0E3i7ahgPVNTdH1uJEFH4HL2oHIsN9+Eyu12IoSBAEiJWeCGy8tkcJxsv9VK+2JI8Q3Qrlmx6SRRfZLWFXBwX583TDE6ZJGegVELC5JD5acyngA/JTqInlDft9UqIn+5L1jP3ViLAozUD1gx0jyW/aFcn6X2wT+Kr/2bsYwXkgjK6mVcxVciUsyZV7e4Z3G2KczY/eVZL0g94UaU1NaBxm2nI7vDMoCc0OicqDepALqlEIZKzMHM8uJyeBqy/sTdrcu1jBT9AN3/v4g+z1NEvauirODEz3oLIY3Z6MvOmlEmrARQjCfRl5itDxlhACdXib2KpGaWr3wFAXHUIE0eGSbdkxnfWaZf/0VrSDPIrScYZJrH1xRPoWT/ZYyDHkyfL+5Z5cbLY/eMo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199018)(40470700004)(46966006)(36840700001)(4326008)(5660300002)(41300700001)(36756003)(8936002)(36860700001)(356005)(82740400003)(2906002)(336012)(426003)(2616005)(16526019)(47076005)(186003)(83380400001)(6666004)(110136005)(316002)(54906003)(82310400005)(7696005)(26005)(86362001)(40460700003)(70586007)(8676002)(70206006)(81166007)(40480700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 18:13:15.0128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73019d23-d362-4873-0c60-08db0dedf9b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6769
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
index b5f2ec7..47ff4b8 100644
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
+	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x162e, quirk_clx_disable },
+	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x162f, quirk_clx_disable },
+	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x1668, quirk_clx_disable },
+	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x1669, quirk_clx_disable },
 };
 
 /**
@@ -47,6 +59,7 @@ static const struct tb_quirk tb_quirks[] = {
  */
 void tb_check_quirks(struct tb_switch *sw)
 {
+	struct tb_nhi *nhi = sw->tb->nhi;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(tb_quirks); i++) {
@@ -56,9 +69,11 @@ void tb_check_quirks(struct tb_switch *sw)
 			continue;
 		if (q->hw_device_id && q->hw_device_id != sw->config.device_id)
 			continue;
-		if (q->vendor && q->vendor != sw->vendor)
+		if (q->vendor && (q->vendor != sw->vendor &&
+				  q->vendor != nhi->pdev->vendor))
 			continue;
-		if (q->device && q->device != sw->device)
+		if (q->device && (q->device != sw->device &&
+				  q->device != nhi->pdev->device))
 			continue;
 
 		q->hook(sw);
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

