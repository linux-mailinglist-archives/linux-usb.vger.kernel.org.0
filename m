Return-Path: <linux-usb+bounces-35697-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPHUMbXJyml3AAYAu9opvQ
	(envelope-from <linux-usb+bounces-35697-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 21:06:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B45C36026E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 21:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC03A3017F9A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 19:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C123E1CE4;
	Mon, 30 Mar 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uTCAnKM2"
X-Original-To: linux-usb@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013032.outbound.protection.outlook.com [40.93.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837A3DFC88;
	Mon, 30 Mar 2026 19:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897419; cv=fail; b=Jpnkmdgz1eye3HEfOlboUxGQNBRpV1mXh3O4hzkk1Ytg11XdVfgBV5rnZVqnTUrHoBBNG8hd5qt0tKE2U0297ENmfXL7A1AOeBIeNRuyxUIm0kqTN/Gl8o8oWCXEys9qkuCWrK0U6ZI+y+XA5R+wDqk4gFkCUwij/QBngkRXu1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897419; c=relaxed/simple;
	bh=F3NTYImDUX8G3LXiXRzrcWw8y/rUeSUny1FV9yqI9nA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzXdZ20W7PDVRApJ88O9t+8lFUUxkOc/hGiqGP4WIiBlNjCNX+qEzjcM3Ybv6PYai1HhfJKSVkdjQvTGUSggk4rLU+J/k1x+tXr1SyBhIBmyLWbuGLSEO7C4b7KOUilGBFueLSf4v++6PQwh2LtBM3iEecCa9oymQunkArZfIkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uTCAnKM2; arc=fail smtp.client-ip=40.93.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUTylB2Nw97vv1RXtL0ShNKsj1qJsEh6nwFB6oxFqFKTrnj0YVx0nyIXtcMnwz2H1aU4L3dC+RPBeSQ5czVW/HrLRyKcS2pYp0x56wQR1v8w3ZtM2hjAJk8tgB3gYR+RQuqledxI6Nxs54g1792KqYtThIUprIbB/YiOrzvoev8gDrL8MZk0wf0QaCJ2FC0kXAQJh1cZozMLw9dhom2sc6stZZ3JIXaIwys0IexTn8IS0x//vnQSb7W4wiNzipxdJjTL1iHG10jdoJz0qgjrZJukuO4E6ZLSae7VH0Ez60vks7OF/MvyQJfWB8S/Eq8UuTiSEIQkFvhpQBcRZ/FVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqThKNqYOVQKAqf/aI1IdmPVydfb4qZEgbbbLWMT9QY=;
 b=i3dmn8PVv4ZzTxccqq5Vmo/T8vGl0S9S2NVsbKOPvrXt9KDUrD5G1Y2dMmfAsSzB8catCpe8qC4YdNSyNT3t0eNXqRQjtTHDW9aPlwLiC9ug2iFd69XujyjtMDj5E+GiL3e9Fb4t+HsgQ1DryxsS3qiUl/mUvXxp7GXKqUMR30oU0zn8SuF84H6yO1rTvrZY4//nNO9FXCQ7T3NajedaJMg055Y5Gqs7yVfRgSf0OVA5KPKfw/Gvf3J9HlrNfHPJJhLQw2/vjH4t9e5DHGYNiBJoTPeP/nRuYzJo0Vbt0Lh7PLsjPGY0MVLaZFkzzsA07rGkQX2MVFORMQXA1Ls7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqThKNqYOVQKAqf/aI1IdmPVydfb4qZEgbbbLWMT9QY=;
 b=uTCAnKM2LYQqIGgTBdO+VStxBN2VZpJ2oSJ96Ok5Ser27CUhXq1FhTqh8JQExFXNmn9HW2VWC5My9+JjjSIRQMdpnKHS1RtvEc+3SZmw/2R70fq9rVj0siN77YoMSReZFzDaWbrnG/8rEQUun7NrbZlHgy4vApCkQTBoIkSK7pM=
Received: from BL1PR13CA0418.namprd13.prod.outlook.com (2603:10b6:208:2c2::33)
 by DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 19:03:31 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c2:cafe::d2) by BL1PR13CA0418.outlook.office365.com
 (2603:10b6:208:2c2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 19:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 19:03:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 14:03:31 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 12:03:30 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 14:03:27 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 4/4] usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis
Date: Tue, 31 Mar 2026 00:33:04 +0530
Message-ID: <20260330190304.1841593-5-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 6baa8181-d5c3-4b2c-d899-08de8e8f0911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Sq25gHh3iZKo50IEtXMaThlqu3spJb7e1vObB7H8RT2TskFGyYraY4Jv9GbAyO4YA7USE91/X6kBbtfdje7GRa68nXHy7zcDhwlrjHlj1xf3azF6eOk7J6H06TBsY5paM98nbRNMKCdb9Gr2AKp4nRkZef2txz2z6PR+zdoi78kOJPzWWB7Pc5jYRbYK8LYbZqAUE9rntRmlQ8PJDqeWKOtKWcfqvmeZZs50cajUoCDxe1BNx8EwPcoxS6c++rR4Ia4t7g+U/hS2OkVNtm6kfxyHimTs5kTryV+T84uHvYQnzMxkpDtfIH7IxwPlL8bi3xnNOW1TAR2kyI3tubfqNZzqv9TlUG1Yu+5Ei0N2RL6qxA62PTfEJgConCoI0ftxULSiurl2e504HwSvJHWbXRin87tBHkYTqPFEmyyx+aqBi4wL8B447C7s1gLGq7IToMFXqWdDYe36X2p7MDxuIm1iwQBz6Z3fQl38+ArHt0bGPtkFYHfEy/4JMEEWPEyfPqg3RXzKLkIKcVhZw/a5nmf676fC3BHJryK7tQFa9CSHVTATeByhXg9D9DgODdJKHbCLuvc5TbgwrB1QgSex0cRyJNc+tAlmBXvPSP8bHYlv/MepJh1O1DvzY880HoAF75u3nSADiIplGt0vCbIN/Wy1CHi1IJDQsqemFEfoSDS79DK+WJtZ3Ta7J9HytzU03hinUiPK66eRBb92URNnAdUcfiNCdP725cf6E2rN33RUSFWgjk9ZD896Ublb3m2wfnLLpcoZLy9javimmdTNYg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9zL13n5YiHzPW3+DvGsFkm6RY/JxG69L7ctiVk+pV0jIt1ts4T3jjCOqiDWe8K1iBVTDdzsXNssMFCobR8I1tNAGl0mCTbZ+s5FozcQXVeRgVLhxnxRtcE8c4CoQHaCfUtgI3aADR1edVi6kQaItvHMgDhUc1FjBs4Lv9imj6y5KwySD+Db7dOF9aVBQOX1PUc0pQXo9OLMrIk1mDwL/6XAw76beowlruCRqy1F0WvKY41ywje2gp87vG2lYdQ4e2q8NR+5vE3VZDGh0eAZqp5Bt/9ykAlRQoshpt8FC64/gRG2pCt0h+sFh8gisSwreoufupj4/DuEdaO0xNmrttel+9eaifPVe2IIFlB1XFIdfSlAnBEc5kik+JxXbxcPdl4scHJurJVXDK0MD06ZDRzL4vkFzLQneevReEf2eHfn0/sFbbHi+np3nZLSEV3xs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:03:31.6378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baa8181-d5c3-4b2c-d899-08de8e8f0911
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35697-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8B45C36026E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes for v2:
- Don't use compatible check for deemphasis programming.
- Rename property "snps,lcsr_tx_deemph" to "snps,lcsr-tx-deemph"
  (hyphens per kernel convention).
- Fix double space in LCSR_TX_DEEMPH register comment.
- Add blank line between register offset define and "Bit fields" section.
---
 drivers/usb/dwc3/core.c        | 17 +++++++++++++++++
 drivers/usb/dwc3/core.h        |  8 ++++++++
 drivers/usb/dwc3/dwc3-xilinx.c | 15 ++++++++++++---
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 161a4d58b2ce..e678a53a90b3 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -646,6 +646,15 @@ static void dwc3_config_soc_bus(struct dwc3 *dwc)
 		reg |= DWC3_GSBUSCFG0_REQINFO(dwc->gsbuscfg0_reqinfo);
 		dwc3_writel(dwc, DWC3_GSBUSCFG0, reg);
 	}
+
+	if (dwc->csr_tx_deemph_field_1 != DWC3_LCSR_TX_DEEMPH_UNSPECIFIED) {
+		u32 reg;
+
+		reg = dwc3_readl(dwc, DWC3_LCSR_TX_DEEMPH);
+		reg &= ~DWC3_LCSR_TX_DEEMPH_MASK(~0);
+		reg |= DWC3_LCSR_TX_DEEMPH_MASK(dwc->csr_tx_deemph_field_1);
+		dwc3_writel(dwc, DWC3_LCSR_TX_DEEMPH, reg);
+	}
 }
 
 static int dwc3_core_ulpi_init(struct dwc3 *dwc)
@@ -1671,11 +1680,13 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
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
@@ -1693,6 +1704,12 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 					       &gsbuscfg0_reqinfo);
 		if (!ret)
 			dwc->gsbuscfg0_reqinfo = gsbuscfg0_reqinfo;
+
+		ret = device_property_read_u32(tmpdev,
+					       "snps,lcsr-tx-deemph",
+					       &csr_tx_deemph_field_1);
+		if (!ret)
+			dwc->csr_tx_deemph_field_1 = csr_tx_deemph_field_1;
 	}
 }
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a35b3db1f9f3..99874ad09730 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -181,6 +181,8 @@
 
 #define DWC3_LLUCTL(n)		(0xd024 + ((n) * 0x80))
 
+#define DWC3_LCSR_TX_DEEMPH	0xd060
+
 /* Bit fields */
 
 /* Global SoC Bus Configuration INCRx Register 0 */
@@ -198,6 +200,10 @@
 #define DWC3_GSBUSCFG0_REQINFO(n)	(((n) & 0xffff) << 16)
 #define DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED	0xffffffff
 
+/* LCSR_TX_DEEMPH Register: setting TX deemphasis used in normal operation in gen2 */
+#define DWC3_LCSR_TX_DEEMPH_MASK(n)		((n) & 0x3ffff)
+#define DWC3_LCSR_TX_DEEMPH_UNSPECIFIED		0xffffffff
+
 /* Global Debug LSP MUX Select */
 #define DWC3_GDBGLSPMUX_ENDBC		BIT(15)	/* Host only */
 #define DWC3_GDBGLSPMUX_HOSTSELECT(n)	((n) & 0x3fff)
@@ -1180,6 +1186,7 @@ struct dwc3_glue_ops {
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
+ * @csr_tx_deemph_field_1: stores TX deemphasis used in Gen2 operation.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1417,6 +1424,7 @@ struct dwc3 {
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
 	u32			wakeup_pending_funcs;
+	u32			csr_tx_deemph_field_1;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index f2dee28bdc65..44008856ee73 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -41,11 +41,13 @@
 #define PIPE_CLK_SELECT				0
 #define XLNX_USB_FPD_POWER_PRSNT		0x80
 #define FPD_POWER_PRSNT_OPTION			BIT(0)
+#define XLNX_MMI_USB_TX_DEEMPH_DEF		0x8c45
 
 struct dwc3_xlnx;
 
 struct dwc3_xlnx_config {
 	int				(*pltfm_init)(struct dwc3_xlnx *data);
+	u32				tx_deemph;
 	bool				map_resource;
 };
 
@@ -284,6 +286,7 @@ static const struct dwc3_xlnx_config versal_config = {
 
 static const struct dwc3_xlnx_config versal2_config = {
 	.pltfm_init = dwc3_xlnx_init_versal2,
+	.tx_deemph = XLNX_MMI_USB_TX_DEEMPH_DEF,
 };
 
 static const struct of_device_id dwc3_xlnx_of_match[] = {
@@ -303,10 +306,12 @@ static const struct of_device_id dwc3_xlnx_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dwc3_xlnx_of_match);
 
-static int dwc3_set_swnode(struct device *dev)
+static int dwc3_set_swnode(struct dwc3_xlnx *priv_data)
 {
+	struct device *dev = priv_data->dev;
+	const struct dwc3_xlnx_config *config = priv_data->dwc3_config;
 	struct device_node *np = dev->of_node, *dwc3_np;
-	struct property_entry props[2];
+	struct property_entry props[3];
 	int prop_idx = 0, ret = 0;
 
 	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
@@ -320,6 +325,10 @@ static int dwc3_set_swnode(struct device *dev)
 	if (of_dma_is_coherent(dwc3_np))
 		props[prop_idx++] = PROPERTY_ENTRY_U16("snps,gsbuscfg0-reqinfo",
 						       0xffff);
+	if (config->tx_deemph)
+		props[prop_idx++] = PROPERTY_ENTRY_U32("snps,lcsr-tx-deemph",
+						       config->tx_deemph);
+
 	of_node_put(dwc3_np);
 
 	if (prop_idx)
@@ -368,7 +377,7 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_put;
 
-	ret = dwc3_set_swnode(dev);
+	ret = dwc3_set_swnode(priv_data);
 	if (ret)
 		goto err_clk_put;
 
-- 
2.43.0


