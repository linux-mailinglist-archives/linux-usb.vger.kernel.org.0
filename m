Return-Path: <linux-usb+bounces-30737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D27C70D4F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 20:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8971D4E3F5C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 19:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0495C371DEE;
	Wed, 19 Nov 2025 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ryFIayJR"
X-Original-To: linux-usb@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215B8320A0C;
	Wed, 19 Nov 2025 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580689; cv=fail; b=IBlCPI1Wl9XU91iiEgLjjqQieAXF0gkwj7OhJcn+NTzojqIFGexCbzFOw9dK+no5y4ss/wqvdLPgCdMp5nItla9n7FbMldHnqoz9W31WgyUlbY1XsZvC4tcKCBffeYdnf72U8adXflksymVUOyPufEYSypVePJvimRMgv1fq9Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580689; c=relaxed/simple;
	bh=c/CcEBuWR48+sitbsaFIpz1YprSQr9CXqUoVn14W+os=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MYutZZAMAsRjZ/h5q2githhfE6N2PYlZKgUXFDRDhJwXwWYsPkjgF4yfsEXFDfIqQhlZxyK2iz2o02f++NrL/QBXf7NMxjDS/93Stn4dKvxNgwCPjfpEP+C6zTHR/2/AE9r7QldLwRU3QrCtvBlKXdiyZQUn3VxT8H2rnWVIfaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ryFIayJR; arc=fail smtp.client-ip=52.101.85.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toul89NR8bufZbZiVROdAZWAkrYEGBn/Ycy3jiuLt7Bukp0FECRCIZoqxJn0YByknu6dP4Yf7xfRyUHxxj2YcQKYm4G+FCD9KdfXrNcVFvQheC+HfAwFwkALpwHBgUIivQLFifp4UoZE/RfOohlRRDYHVPJyzHrAG7Cm0Vd24tBhz9KFSlhMGNo3qtf2lZ5zRdJDXMOX1tBSNiSxyE3k5fLdrYqa0RQ+YiE0aXmaU+uwxZ0QLPsewLiTwke5h/Y4BzOTRh2CwN7CNq/LchkqdCuVLxHF4ywSiLmhY7DSsTvoFj8gBjLM/y6VkzWrdzzmnpwCY6DgimEavItR5kyC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tK4vOSHT1taizrVyi6fOyJ9omOZO/BrywkL2GZIm+Aw=;
 b=NMJwpNEzmeI6Vj6fpfcvZ/mUi+50llFK0nDrv1+GUXufpTkbwFAjsprcjbVKiRgylxhxG4Hs+D6T0OZfjIsjCICVJcGdg5SRArvdHHyjUCRU0ZCllqkC/Ep58LqXuT4Cp39DYlGspeeSrfRNvqrMcwrllj+lhkE6SMQpN0/RIpWfYJiYEIHhQ3p6W5Br8VfeAIm86kfhK+LsQgpEwZbdO6T6myG5iAU4lxsJuyFAVxK/bUieqVfkfkfqJQx2ZU1QARv84lcKyAkLGwQ1B92C+sHJl08yYa4yO0Fou64kW3Bzh52K7spV9xRUO/h0RQLwH14FnfdYIKAwn3SCDGAnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tK4vOSHT1taizrVyi6fOyJ9omOZO/BrywkL2GZIm+Aw=;
 b=ryFIayJR8Du6eyHbh26bbCZVZI9DWeOyBcCGTUdzf7QROufE7bCAd/DOX48bwKg8yvi01QLJ84kWf+Kzy71/bfWVh0fBXWBmFVUt1G0XUr0hmaVw4j/KH1KubpbX0Y+x9c7Maa+WnEj7KhPaOHHXQxC6G1o0VgzFP4D9HhDaOmo=
Received: from SJ0PR03CA0159.namprd03.prod.outlook.com (2603:10b6:a03:338::14)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::999) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 19:31:12 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:338::4) by SJ0PR03CA0159.outlook.office365.com
 (2603:10b6:a03:338::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 19:31:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 19:31:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 11:30:55 -0800
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 19 Nov 2025 11:30:52 -0800
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 3/3] usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis
Date: Thu, 20 Nov 2025 01:00:36 +0530
Message-ID: <20251119193036.2666877-4-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
References: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: 959ca540-4572-425e-3022-08de27a2329f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iI5eXOdXU4iiZow3gnNjD+r8zGtZh7NtzYKsXZmdWT7xMITOn4DQ8u5lJwfk?=
 =?us-ascii?Q?Nv3hS+Mhvzi0auj7Ey0gH0+EzdoMlvIJ1YNTcYgXeDw687Ua1QrhznT8C37U?=
 =?us-ascii?Q?fCpodPBtiDqpEbWiQznnPijJlZH02qhFOApt7Npwd6yptCGpS94WMWLhAin1?=
 =?us-ascii?Q?OXyM25Zs9jwryyZJRN++wfJqTQc9ZOm3M9IY6S2J8L4uFc0HBAu2UrnFqzv8?=
 =?us-ascii?Q?kiP4MKuIPEHVgOU9nvR459BPzfhkBwArnUU4QNnk0wbAi0EScJfxbmzVruJJ?=
 =?us-ascii?Q?522WOYBbZ+WWrkqirI+WNKAPd4FWJ2cEo7xOtGEFk0aI7BM9AgmIk5PpbU4P?=
 =?us-ascii?Q?8eQZWsfFeAUdo7Or4PFaSuaWzTCfDM4o/orvCYJzRhe24d6gNwYoJv4+SC2U?=
 =?us-ascii?Q?cVbV85yBbCibwYZfTpMeavje/ffP2Pkkx09WqcA2rM2FOI5FfgOIEVSGOlML?=
 =?us-ascii?Q?hRnjHZ4BALG6AxS3Sxv6mO6QQEzm4Jww032FU8i5IdnOeYja6khv1Cvz6K+P?=
 =?us-ascii?Q?afgBAlaynGHQ4owhQvn2U370/GGaNDkzINEdXGSAocuWeW0QuJrZf7wtLRjF?=
 =?us-ascii?Q?GF7JGyt59aZACnFgMfWiUPn7iTCcTwWqa9n3wj5DDfSliqIhnfCpmb283qY+?=
 =?us-ascii?Q?J9G1gmv9XP6v4D0kZCNqC30FCGiP9Xs/pRw9iIslVD8KRAIz95g+u8Ii0C5q?=
 =?us-ascii?Q?MS9GY1eJPtIR65CWe/KnNhGE6CAqD99U/66FUvTzZlefl0bVAuxe5r+gS9b1?=
 =?us-ascii?Q?Z6fenWmQwazTnetdmaOp4f1BYuniC9G1wHAP6azp8ExySWqowOaLxnkDQAPz?=
 =?us-ascii?Q?ysgQgVWEULrU8qc994CrUbVG2rST0olrJFA+2Fy45oYf27gyI9CppUvc23Im?=
 =?us-ascii?Q?i33m+ofjke2egsuMksZvYUqYxdalhmJNx1LNJcAvR8MdIr5jQIFnE/IbGbDl?=
 =?us-ascii?Q?zyspWXmv0U+ngxdse1pBEE6GonPUfudsLMlBVBbHIDBKg9ylIRr+IaunWuNR?=
 =?us-ascii?Q?x4hg1tvm/YTZWWwv7/MNcNo//PtTlC2VSLT/th2PLJv81y1rzPuOM6lduH9U?=
 =?us-ascii?Q?c26TsN/TY+DcKBHFthUXg1R/9GgjMqHfQOQQa2XKXrUXAD6xvmmdI1UntOMD?=
 =?us-ascii?Q?3Qdr9h2XPh+hE4xBIEMK/1d8IM57HdlR9BjtSqbWOEk+DVPPsaLNIifrDO6c?=
 =?us-ascii?Q?QCnhosNT7PCKCdQnVFaaMm04deDTnQIud52I5bHnFb53B3D3rOI/s5RAyBlq?=
 =?us-ascii?Q?P/DLPWjJ9XkwTRAvFwB1ExxRyckqeOLYtJsK3yA1qTnR5AJEIrQBNiEhzmbL?=
 =?us-ascii?Q?73NF2XTS1oXobXJ6MtBd25c75ggUeOSP8CVemgrvfEIgaZPSbhfrsJvE8arU?=
 =?us-ascii?Q?XbdXYmVzTGhHXq5JvWvsYeCYXy7enfAHb+2yxv6thG7vIcSYwF8m5ti6TAjW?=
 =?us-ascii?Q?OakF3707j9wH35pdLSD/M5goUdQAyph91ctLcm0Tks2j+djE9ThuB2jWEmQg?=
 =?us-ascii?Q?rqAr3RMfGNgD0z7c6Xlu92ZCunBMSEyJHLytuRDBIJkohRptP4hgTqGwB2pM?=
 =?us-ascii?Q?KzzCaFCpTUcgaSeUQ+o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:31:11.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 959ca540-4572-425e-3022-08de27a2329f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39

Introduces support for programming the 18-bit TX Deemphasis value that
drives the pipe_TxDeemph signal, as defined in the PIPE4 specification.

The configured value is recommended by Synopsys and is intended for
standard (non-compliance) operation. These Gen2 equalization settings
have been validated through both internal and external compliance
testing. By applying this setting, the stability of USB 3.2 enumeration
is improved and now SuperSpeedPlus devices are consistently recognized as
USB 3.2 Gen 2 by the MMI USB Host controller.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/core.c        | 17 +++++++++++++++++
 drivers/usb/dwc3/core.h        |  7 +++++++
 drivers/usb/dwc3/dwc3-xilinx.c |  7 ++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7b84512b13a2..cb737aee316e 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -647,6 +647,15 @@ static void dwc3_config_soc_bus(struct dwc3 *dwc)
 		reg |= DWC3_GSBUSCFG0_REQINFO(dwc->gsbuscfg0_reqinfo);
 		dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, reg);
 	}
+
+	if (dwc->csr_tx_deemph_field_1 != DWC3_LCSR_TX_DEEMPH_UNSPECIFIED) {
+		u32 reg;
+
+		reg = dwc3_readl(dwc->regs, DWC3_LCSR_TX_DEEMPH);
+		reg &= ~DWC3_LCSR_TX_DEEMPH_MASK(~0);
+		reg |= DWC3_LCSR_TX_DEEMPH_MASK(dwc->csr_tx_deemph_field_1);
+		dwc3_writel(dwc->regs, DWC3_LCSR_TX_DEEMPH, reg);
+	}
 }
 
 static int dwc3_core_ulpi_init(struct dwc3 *dwc)
@@ -1674,11 +1683,13 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
 static void dwc3_get_software_properties(struct dwc3 *dwc,
 					 const struct dwc3_properties *properties)
 {
+	u32 csr_tx_deemph_field_1;
 	struct device *tmpdev;
 	u16 gsbuscfg0_reqinfo;
 	int ret;
 
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
+	dwc->csr_tx_deemph_field_1 = DWC3_LCSR_TX_DEEMPH_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
 	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
@@ -1696,6 +1707,12 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 					       &gsbuscfg0_reqinfo);
 		if (!ret)
 			dwc->gsbuscfg0_reqinfo = gsbuscfg0_reqinfo;
+
+		ret = device_property_read_u32(tmpdev,
+					       "snps,lcsr_tx_deemph",
+					       &csr_tx_deemph_field_1);
+		if (!ret)
+			dwc->csr_tx_deemph_field_1 = csr_tx_deemph_field_1;
 	}
 }
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a5fc92c4ffa3..32205f435b5b 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -181,6 +181,7 @@
 
 #define DWC3_LLUCTL(n)		(0xd024 + ((n) * 0x80))
 
+#define DWC3_LCSR_TX_DEEMPH	0xd060
 /* Bit fields */
 
 /* Global SoC Bus Configuration INCRx Register 0 */
@@ -198,6 +199,10 @@
 #define DWC3_GSBUSCFG0_REQINFO(n)	(((n) & 0xffff) << 16)
 #define DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED	0xffffffff
 
+/* LCSR_TX_DEEMPH Register:  setting TX deemphasis used in normal operation in gen2 */
+#define DWC3_LCSR_TX_DEEMPH_MASK(n)		((n) & 0x3ffff)
+#define DWC3_LCSR_TX_DEEMPH_UNSPECIFIED		0xffffffff
+
 /* Global Debug LSP MUX Select */
 #define DWC3_GDBGLSPMUX_ENDBC		BIT(15)	/* Host only */
 #define DWC3_GDBGLSPMUX_HOSTSELECT(n)	((n) & 0x3fff)
@@ -1180,6 +1185,7 @@ struct dwc3_glue_ops {
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
+ * @csr_tx_deemph_field_1: stores TX deemphasis used in Gen2 operation.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1414,6 +1420,7 @@ struct dwc3 {
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
 	u32			wakeup_pending_funcs;
+	u32			csr_tx_deemph_field_1;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 32f87a238d0e..85bc4ab461fd 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -40,6 +40,7 @@
 #define PIPE_CLK_SELECT				0
 #define XLNX_USB_FPD_POWER_PRSNT		0x80
 #define FPD_POWER_PRSNT_OPTION			BIT(0)
+#define XLNX_MMI_USB_TX_DEEMPH_DEF		0x8c45
 
 struct dwc3_xlnx {
 	int				num_clocks;
@@ -306,7 +307,7 @@ MODULE_DEVICE_TABLE(of, dwc3_xlnx_of_match);
 static int dwc3_set_swnode(struct device *dev)
 {
 	struct device_node *np = dev->of_node, *dwc3_np;
-	struct property_entry props[2];
+	struct property_entry props[3];
 	int prop_idx = 0, ret = 0;
 
 	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
@@ -320,6 +321,10 @@ static int dwc3_set_swnode(struct device *dev)
 	if (of_dma_is_coherent(dwc3_np))
 		props[prop_idx++] = PROPERTY_ENTRY_U16("snps,gsbuscfg0-reqinfo",
 						       0xffff);
+	if (of_device_is_compatible(np, "xlnx,versal2-mmi-dwc3"))
+		props[prop_idx++] = PROPERTY_ENTRY_U32("snps,lcsr_tx_deemph",
+						       XLNX_MMI_USB_TX_DEEMPH_DEF);
+
 	of_node_put(dwc3_np);
 
 	if (prop_idx)
-- 
2.34.1


