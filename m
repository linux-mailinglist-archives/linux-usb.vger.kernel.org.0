Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC6FB691FC6
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 14:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjBJNct (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 08:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbjBJNcs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 08:32:48 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D311F92C
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 05:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ke96d+UC0zvG6EQMw9nUbOWD4QYmHyqz2lN0GAFq9Df8hnqAoZ6z0DayuaPf4fkzeMGnX3sX45+I3THDslC1x/fEYGuFVwjSl6EFgJLGm4LuriSL0mmSZFHt+wI6N4NnnjNDW6T9rriz8U/DhpyzG86n/EniVVhrx20Y8HNb6v7fbR4pHUoFPJ2OgXIVH+RutXLkfB19NBwzA3W74rywhnbh8E7X+PY26lvmiOQiiT72kU7dx8FH6OlfQnC1wH3VU/Z8MthRFwyyDzLU9+PB0tDQRJjBdxlJ7vqLwFk93IvC7Le3ihpD/PVWf5qTZ4iHU3YbpWTTQoeQW/argX0HLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjRUYSmNHXKbDo2KUqp02PUA9cZ4eOeQnCnbAuDjt2I=;
 b=k0Xu0sknlYbannB+TqB8ONoN1P8OWQXvceRN/FQ8pXUOdbZTf+Jj2beoRxeRHFXyvbgPd73ZaHWFeIcF+LrhhPl+YE8wbIvTcFbVeEYNjlyhHGSeClW7G9/drqjsJemwV6UM3qF59/ZKkd0t7NUL8jCKwuHVB8yI0dXKR462W02zonL24E/vBEiBn7EN3j6dFBz+1spUwD2KfEz7UfrnhZJ8TO66B3RumD1ykyzL9FjG5ixyxcOXTndbHENSrQsk4THuRSqXkyfaokzoU/kl8MysJiikBadb1hE8nH7qNSymGCjJu3VQJuNq2CDldBdfaBsme2LmaXGcBMxNrgcYiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjRUYSmNHXKbDo2KUqp02PUA9cZ4eOeQnCnbAuDjt2I=;
 b=3PatPFAovB0U38BqXHz0MriBr/S3mMgSwjsutMgJIW/jzfIpF2K6DPRZqE7OJylKDarMMf6GYLaIOJyj51/dR3g0LHt+NBW+KBf1kMLkUt7i1pHEe+fOzwSuPgFjVMo0JeWwH3d7sO+s6PLeWK+4cvWU9wQW16MNDt0I7ppWaOU=
Received: from DS7PR06CA0021.namprd06.prod.outlook.com (2603:10b6:8:2a::23) by
 DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.21; Fri, 10 Feb 2023 13:32:43 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::3d) by DS7PR06CA0021.outlook.office365.com
 (2603:10b6:8:2a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21 via Frontend
 Transport; Fri, 10 Feb 2023 13:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Fri, 10 Feb 2023 13:32:43 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Feb
 2023 07:32:40 -0600
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH] thunderbolt: Disable CLx state for AMD Yellow Carp and Pink Sardine
Date:   Fri, 10 Feb 2023 07:32:23 -0600
Message-ID: <1676035943-115840-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT015:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef1e337-8272-4656-7ff8-08db0b6b49f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9GKFdd+ltCGmb4vURejgw6ONi35Dn6f3wOLz/kiNkWohiFv9zKa/qdRacq3dPcsKkiXczI4iXtS0clH59mvPEU0sGHkUKPHGFMKAyH8AwWe4kC4mZVV0b6iMAysuaFMUUmatnfDR+5cps1ZCp+nvOqeSNpy/iiS6Nc4IpcLiS/92nSSQTipu3/xoWrEFLiK+Tq1FK9eCe78tey6HUCOsO+Vh2FQj5NWi/XfK8nTl3K2x1qg/uXyltqiHJTn3vo7yUyLqIITLaxqgA9ld5EvsTOfhONLokNIbzIRnf3Ehh2kK/ehrezt83V6IMtD9aCmtXRMAVhJwgdRgYDjzGW6WFrvEDZ3Zm+FHOkLzCM7kqJab29a6NPZwOVRJx1ncyQwUuRA/mfyLfiUZCLOKwVke5FQbfG1jDpxuAoGpYKbNxWeYPqasU7Iy7qPZgholbOPeHI/eBWAAuyiCJeOz4Z1lNdrT5kQfNz8uDYnGkEsbLkrIiJMtAUC/cb7dmfQeLuQxuNqn7DHZ/PQFrEtXmVpdpgO0uv15Vw9lgA9QXC0U1Rfd4Wo90+6Peucq8W3Pm/piDMSs6Hqobmgeug/QXn7cO5z8TBjkuEeANdlm1fZOUZSuwcL2zB+ynzeHcGj6IfbtXfncfnCiQ/265rpP/U2xCTVMKXjwB1ORU/Vj3zvWnn0n9oo932mfHciqNU5JRRPWYb0X5XBfpjcGLy5PAYnRba+go9jvcwNbF6BctvOEmg4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199018)(40470700004)(36840700001)(46966006)(54906003)(316002)(110136005)(5660300002)(4326008)(8676002)(70206006)(41300700001)(8936002)(70586007)(82740400003)(81166007)(356005)(86362001)(36756003)(26005)(7696005)(6666004)(16526019)(186003)(2616005)(2906002)(40460700003)(40480700001)(82310400005)(478600001)(426003)(47076005)(36860700001)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 13:32:43.2180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef1e337-8272-4656-7ff8-08db0b6b49f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418
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
 drivers/thunderbolt/switch.c |  6 ++++++
 drivers/thunderbolt/tb.h     | 24 ++++++++++++++++++++++++
 3 files changed, 36 insertions(+)

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
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 363d712..93e4788 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3574,6 +3574,12 @@ int tb_switch_enable_clx(struct tb_switch *sw, enum tb_clx clx)
 	if (root_sw->generation < 4 || tb_switch_is_tiger_lake(root_sw))
 		return 0;
 
+	/*
+	 * Disabling CLx by default on AMD USB4 platforms for Yellow Carp and Pink Sardine.
+	 */
+	if (tb_switch_is_yellow_carp(sw->tb->nhi) || tb_switch_is_pink_sardine(sw->tb->nhi))
+		return 0;
+
 	switch (clx) {
 	case TB_CL1:
 		/* CL0s and CL1 are enabled and supported together */
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index f978697..c63a023 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -905,6 +905,30 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
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
-- 
2.7.4

