Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7D9692252
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 16:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbjBJPf3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 10:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbjBJPf2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 10:35:28 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BACE28231
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6D0gGuoRp9oThzoBw4EDf/gN0ctPju8ku/md8HFyip9aMGPDdQ6sjG/xRJTaUZ6GvzQMtCeUBCxoW3ebJ0xXVh9Nfb8AOzrOLW1Isx8Ln8qEMc+CEVHqyTt6vnDqp8pEplzz+QZ3sCNbqnpD/ADG8hx9t2K+NvzqS2JgSMUY+9mqdBgzEkRnLw7903pjN8YHHbbdzrzqupfWeb7qJxc2jDeH/BQ24togkqYxAytRxA23KQ7KcWv/mCdoTyhnEYZMU3MtPSAhwE+8tjhAPbYgNXo6UubMuCK+Ay0tjZDViI6AnBOcNq3TgZIThTpRzp85/4hK/ie2Aupab33E2vKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2EMiR9elN/0OBXrbzyzt58m/h9nARBYdGxqi3vvJ8A=;
 b=ehpxyqW0x0UwKTYTcboGcGtB7ZqTHzRwxFe6PKtmxHZ2l9jBepRugVJaqvfBmE4TzdaMUn/kfKH0eHy0OvI0Rkhkm37dlDNGJAJ+q3MOeTveau/DtCsNFMIq0AirQH6s6YngCIcg6io1Xc0pRsBJJYM8oMfe/7j5NNMJnWtPD/GkHKWswljOigAhHXEKGEgkkJBm0AWjR0QHaEAS6t+Fk9+UmIO3HJhbbBTPoPm0gT4JJrm0aLJYHnMI4U2nvbb7IkxuvR66Ol1KTx+aMDjvy8cZ60WSKpcDwUvYVlLyVNHptDNtOY7yV36AYsBm1yH5hI8UlQe6DgZFUn2XIbwQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2EMiR9elN/0OBXrbzyzt58m/h9nARBYdGxqi3vvJ8A=;
 b=kiDH4UeRkU+cd9dLjCs0eTrv7scZ4gG9kWAkAQmx4j53MOtpCu/9djBlSNqLNmFLo+b5WPueqda2eIOflTzgb7wiG/SDKIjvqNsGt5ZZ2yjkwcwo2BnZNtxM8UoWFcKdck5jYFjUez1AAhUM9lhjr3tB2mms0d2aRc7zoVX+K/Q=
Received: from MN2PR20CA0050.namprd20.prod.outlook.com (2603:10b6:208:235::19)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 15:35:21 +0000
Received: from BL02EPF000108EB.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::b6) by MN2PR20CA0050.outlook.office365.com
 (2603:10b6:208:235::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21 via Frontend
 Transport; Fri, 10 Feb 2023 15:35:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108EB.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.16 via Frontend Transport; Fri, 10 Feb 2023 15:35:19 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Feb
 2023 09:35:17 -0600
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v2] thunderbolt: Disable CLx state for AMD Yellow Carp and Pink Sardine
Date:   Fri, 10 Feb 2023 09:34:47 -0600
Message-ID: <1676043287-119829-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EB:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c79cab6-79f1-45f9-90e9-08db0b7c6ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +BWc/DA2HEG1hbwM1iEnuFDFFJUodMFTE3nFMdyEG3KQB3IFGDpSiTDsDpKav9N2qeZC3auzRlX5n5ZPcEtSbBt8fd7jqWxUXy978QlunSGF2IEtcnn3wiguqJ2AJ9FCbRq3xq/oupwTwMAE5xF60waXEJTXaPcBEcoEbQRV6A+3uxSdEJ6zL4KynMhuyySZTb2b1k7Yez4gAvrXK2JaVHybMpfNbJOAtEkwuCmjCckWrzhnCtfIMclUoW557I7OMihaYdCsj3PkC6dJWrJtnEriyXvWRJMS25iIITtIiD23eZKp/ofeint672lx2rA4mv23SnF25Ky+CeJzfLE6QwcFrVozE9KsiqZbGUlH21CO/+cuQrCyt5chh7bd8AhtgRNFpr0wpbpe4MsYhr0mmWK5zBT24cCkDY6nMmvIidFC3pvDGqPlPw/HTGoNsUWaNpYIpjunbLc9PyjgRGYulw0EZqgWvZesRJTmMb+fYfC7m8u4yJWr0mV6pg22IKfoO5CuD9MjMsdorGrez1Nx8DGba1bfyHaJeG43QJ1WW1kKd4LdyHsIiKTCww0iI36nz+ZP5Wn47gtktpIBoXn++q7i651WDrBpRqDDrFD+nOHCHy7wy+go4h9B86Z0N2sIEE+rJh+SjSDJi3R9OJf0yfMm4joPjcZF3NJqHpSjpcsJfPd7zUk/p2ZDLdf7kyeOByBuDxRSLtwZQulisIkMPVMiht7jcejiX/pg2AmOQ30=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199018)(40470700004)(46966006)(36840700001)(2906002)(36860700001)(86362001)(82310400005)(81166007)(82740400003)(40460700003)(336012)(426003)(7696005)(2616005)(16526019)(186003)(26005)(36756003)(40480700001)(356005)(47076005)(70206006)(83380400001)(54906003)(316002)(110136005)(41300700001)(6666004)(4326008)(478600001)(70586007)(8676002)(8936002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 15:35:19.8557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c79cab6-79f1-45f9-90e9-08db0b7c6ad1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617
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

AMD Yellow Carp and Pink Sardine don't support CLx state,
hence disabling it.

Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/thunderbolt/nhi.h    |  6 ++++++
 drivers/thunderbolt/quirks.c |  6 ++++++
 drivers/thunderbolt/tb.h     | 35 ++++++++++++++++++++++++++++++++---
 3 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index b071802..3d8cfaf 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -87,6 +87,12 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_RPL_NHI0			0xa73e
 #define PCI_DEVICE_ID_INTEL_RPL_NHI1			0xa76d
 
+/* PCI IDs for AMD USB4 controllers */
+#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0		0x162e
+#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1		0x162f
+#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0		0x1668
+#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1		0x1669
+
 #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
 
 #endif
diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index b5f2ec7..f38db02 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -63,4 +63,10 @@ void tb_check_quirks(struct tb_switch *sw)
 
 		q->hook(sw);
 	}
+
+	/*
+	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
+	 */
+	if (tb_switch_is_yellow_carp(sw->tb->nhi) || tb_switch_is_pink_sardine(sw->tb->nhi))
+		sw->quirks |= QUIRK_NO_CLX;
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index f978697..d7988ad 100644
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
@@ -905,6 +910,30 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
 	return false;
 }
 
+static inline bool tb_switch_is_yellow_carp(const struct tb_nhi *nhi)
+{
+	if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
+		switch (nhi->pdev->device) {
+		case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0:
+		case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1:
+			return true;
+		}
+	}
+	return false;
+}
+
+static inline bool tb_switch_is_pink_sardine(const struct tb_nhi *nhi)
+{
+	if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
+		switch (nhi->pdev->device) {
+		case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0:
+		case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1:
+			return true;
+		}
+	}
+	return false;
+}
+
 /**
  * tb_switch_is_usb4() - Is the switch USB4 compliant
  * @sw: Switch to check
@@ -997,6 +1026,9 @@ static inline bool tb_switch_is_clx_enabled(const struct tb_switch *sw,
  */
 static inline bool tb_switch_is_clx_supported(const struct tb_switch *sw)
 {
+	if (sw->quirks & QUIRK_NO_CLX)
+		return false;
+
 	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
 }
 
@@ -1254,9 +1286,6 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
 void usb4_port_device_remove(struct usb4_port *usb4);
 int usb4_port_device_resume(struct usb4_port *usb4);
 
-/* Keep link controller awake during update */
-#define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
-
 void tb_check_quirks(struct tb_switch *sw);
 
 #ifdef CONFIG_ACPI
-- 
2.7.4

