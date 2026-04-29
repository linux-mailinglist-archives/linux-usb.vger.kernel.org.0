Return-Path: <linux-usb+bounces-36700-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JuLOAbBA8mkApQEAu9opvQ
	(envelope-from <linux-usb+bounces-36700-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:32:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4659D4982F4
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFA84301F4BB
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 17:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FA540B6CA;
	Wed, 29 Apr 2026 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ip6rWcD3"
X-Original-To: linux-usb@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116472EAD1C;
	Wed, 29 Apr 2026 17:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777483942; cv=fail; b=jce/ApANmXIBDjJ5WRvGe/hwLnzPS6tbh6wdzwT1iNgdD+hRmYOObJyzwOaoB8Xc8JPI6ZO3FT7/rNt206SHCXmx8fH4+mDdBkxo3+ISEORuKFhES8c+1OgOHUuh4yFoe+CTXTEtSiGthbq7Twe37whCNx3KwfrHNICEFcCr0wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777483942; c=relaxed/simple;
	bh=VEgtLeU9bKF+qUL9urxwWfRYu5f0CkOMRFLZukK0r6g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xu4LPHyTjzDF6D5zTPcqeX99q68lrcHpXmCRcwcZ4++STQ4pZlYCBjwMTt6Ogak+xf3tnOnZw1sokMdYxSi8PdAUK84S0oSeurgMsQe3hTXTQVE/FZif/Y9hCxJ0/sxG9WMkeBkB+NosoGf8zBettmNdjZEM7fiA3wpLSPWNAFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ip6rWcD3; arc=fail smtp.client-ip=52.101.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZR95Kz/gOPlVm8/xP9hTVkceeZKC+VQAljhDcGRMzO8+4sF5QYfuWx9ZsKmCpew4NHaBRhGVBJlWlzZCcRyV4p/F7RQg2wXqF+KBcSUIW5cPn1cq9zMtNVbna4W8pqdNtepOsy90fyP8qIDRPHw6U0fHUJo+8CZCwuzn0xzoThi+osNQH/6dV2pM+WTHLEt5M8zQQO2Is+RNjGqfXXfkv/lA5qcZ2HjkOIr1GnzXrqEBvoALN1Zrn67h1cLt7ZqQCSniSDMtypQsYPUaROYxciubasbic1yHyOivTmnUN6cMotb5bGbfWhhok3zBKOIY+jeLUOyWC+L7iDlUd02Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTm78k3fFETGWViJ721DhEUmbtENttOSBrfkcivcRUM=;
 b=nDqyXOWY8iRHK7I+EBSpjUvQEafFFwfflCamHOBbMDl6HM0/9zo35sU86cY+aRtAMSjZsf04/Lksnrbx9FCj/LT29hFzgv2JUJ5BhWIxIxr0AvDnyLynVfL0+TZ148AptIgUpmbgbneBhwjQq1iTRajE8iXfmbhMVnF0jkabojSG6VcY/AQv35DVCofQmgq0cvtRg7uwdjYXWMEFN/iLs5LHXKRJvilpw8HErNrfScoUHJsw6NTH0z+Zpg45AqQhow7ccGdKMFJFlX4fuCWx5wHQu+Ekt/R+n2htQKD/M5GHKF1xtImsmUQ8It4B4zxr10n3vXKWeBScZmpNirRt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTm78k3fFETGWViJ721DhEUmbtENttOSBrfkcivcRUM=;
 b=Ip6rWcD32PquLxcq16Q9bk4vJYW9J2yf2COEQXYNyd2vPq/35c5Ks9m1JfHbNsn7Mm4EiZUY6NlQQGQjBADtbEWX8NhqC+R7uGeuQtQvrgoBC7AENQXquHor0tcT6JvYGBGx/rgeQC/pEc1zx6/H/LdvR8vYIZsgrYy4ks+88nc=
Received: from SJ0PR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:33f::17)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 17:32:18 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::38) by SJ0PR05CA0042.outlook.office365.com
 (2603:10b6:a03:33f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.16 via Frontend Transport; Wed,
 29 Apr 2026 17:32:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:32:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Apr
 2026 12:31:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Apr
 2026 12:31:34 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 12:31:30 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 4/4] usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis
Date: Wed, 29 Apr 2026 23:00:50 +0530
Message-ID: <20260429173050.1772377-5-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
References: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e1c753-b705-4149-3470-08dea61542cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zOaFGPasF7Pnf01XC1Frwd3i5prNaq16T78Xp/S6FwrlsRRY2zlO4xP6CLY2s3GwFDPUkDpcrdJV4pgq+pWf/w9PPvCuB+6Sn+wCtg0J3LGtSf8SFSi4GldbRKLbd+/fo+lQBQWdhMaCjz13tKCs9OVyxWXPJZrYZ6/H3crMg8x2qWWWcyOUm1B0lIhGYAo6ZlfWfsGgc5xanCI3G6AfnXYQB7eEEoeIiZRtqHSPsMh5kBVtM5STo6+eOM3vuecJq3bipcUBLHyUtEXVXXUj9e1NbVa5JMDBiy5qm1cHjO6dmNWUwHzhL2kW0RMTn7eSbqstX/3Zo9lKexSYoB3l1WKYDQLyMRta8A3tAfcSR0BHtBw4NbU4a/mecmkA4CfRQq72zZGe16mIdTxba8JSNwkb565wVtu8be11zimxPEOPwElYcG97s0Wzi3txi17Py0xkvm9bz+9iKCZMRJ71amEyRPYmTnCb7jdvszHUyjxUt4Ak+oD64AhTrKwd1Kj6ukQs/4bAiNVWauhth9LscKlACG5yllZ9kkDxGGOieLLPFV9lJPbUaHQVNjBC2ycONrTSizVP5tyO4toU+xWM+iVNY9jEZQVU150VkmiHayL+Xnd64LtqI4eoWVdTkbb7UjZP54AuLndKczYhvfyWUNZulCdEBAmyfBr4dOPyhc2YB0A0yGlbLZ93MfQZn/xPlCYRgTTbCI5/1IRoCRDI7VEUTR3aN5ddPjw7eqiXSBuH57tPnIUARmQLLWA/UcHjvOywf78bxrTecpSn1W27jA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+B6PkhKMkWEccLbzLvZOEBDa34B9b0aU+uYa/Sx+LWQx8sX67HV3L3dyKy4Z7esdxSNqk5Hpu/dB3zS7T+4khEATp9Ds4wM+hzSQNo89petihZNd14RaCMlo/HT9cn8vqP13wZHws0QcN1Ezl/2mk1qgqqhDaBqyhPrfFVEzW8SRBbYtDhJH0kTfhfajnCUOGmCzoEK++e1aHmqNbuF85NxSbiHT0FjuTrbIr/p84s+xFrtdo/YzuBHK8QYTyYOtce7WjgtXzAG5SZlcyq2sTgijMBPFlvMwEVq48vk8ti4qJdC+5a7sHoyhaIiO+EGtECrfpnkcvzx/0k+bduAzlzR9suHLL1BZ6qyhKU7t0vN7okr1Te+ASxKDA2kK/wvE8GgfZA2SIUKTNyUFkV6WXyGCP2/+jSSKR0/l2nks8CRIY27MUiNN7Sdg8Mlf4tNa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:32:17.7645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e1c753-b705-4149-3470-08dea61542cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921
X-Rspamd-Queue-Id: 4659D4982F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36700-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

Introduces support for programming the 18-bit TX deemphasis value that
drives the pipe_TxDeemph signal, as defined in the PIPE4 specification.

The configured value is recommended by Synopsys and is intended for
standard (non-compliance) operation. These Gen2 equalization settings
have been validated through both internal and external compliance
testing. By applying this setting, the stability of USB 3.2 enumeration
is improved and now SuperSpeedPlus devices are consistently recognized as
USB 3.2 Gen2 by the MMI USB Host controller.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
--
Changes for v3:
- Define DWC3_LCSR_TX_DEEMPH(n) and multiport handling. Thinh: Please
  review on this offset calculation as MMI USB IP support single usb3
  port.
- Default set the tx_deemph to the DWC3_LCSR_TX_DEEMPH_UNSPECIFIED.

Changes for v2:
- Don't use compatible check for deemphasis programming.
- Rename property "snps,lcsr_tx_deemph" to "snps,lcsr-tx-deemph"
  (hyphens per kernel convention).
- Fix double space in LCSR_TX_DEEMPH register comment.
- Add blank line between register offset define and "Bit fields" section.
---
 drivers/usb/dwc3/core.c        | 24 ++++++++++++++++++++++++
 drivers/usb/dwc3/core.h        | 14 ++++++++++++++
 drivers/usb/dwc3/dwc3-xilinx.c | 20 +++++++++++++++++---
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 58899b1fa96d..426e30563caf 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -646,6 +646,22 @@ static void dwc3_config_soc_bus(struct dwc3 *dwc)
 		reg |= DWC3_GSBUSCFG0_REQINFO(dwc->gsbuscfg0_reqinfo);
 		dwc3_writel(dwc, DWC3_GSBUSCFG0, reg);
 	}
+
+	/*
+	 * The csr_tx_deemph setting is common across the controller and
+	 * is configured per port using DWC3_LCSR_TX_DEEMPH(port).
+	 */
+	if (dwc->csr_tx_deemph_field_1 != DWC3_LCSR_TX_DEEMPH_UNSPECIFIED) {
+		unsigned int port;
+		u32 reg;
+
+		for (port = 0; port < dwc->num_usb3_ports; port++) {
+			reg = dwc3_readl(dwc, DWC3_LCSR_TX_DEEMPH(port));
+			reg &= ~DWC3_LCSR_TX_DEEMPH_MASK(~0);
+			reg |= DWC3_LCSR_TX_DEEMPH_MASK(dwc->csr_tx_deemph_field_1);
+			dwc3_writel(dwc, DWC3_LCSR_TX_DEEMPH(port), reg);
+		}
+	}
 }
 
 static int dwc3_core_ulpi_init(struct dwc3 *dwc)
@@ -1691,6 +1707,7 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
 static void dwc3_get_software_properties(struct dwc3 *dwc,
 					 const struct dwc3_properties *properties)
 {
+	u32 csr_tx_deemph_field_1;
 	struct device *tmpdev;
 	u16 gsbuscfg0_reqinfo;
 	int ret;
@@ -1699,6 +1716,7 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 		dwc->needs_full_reinit = true;
 
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
+	dwc->csr_tx_deemph_field_1 = DWC3_LCSR_TX_DEEMPH_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
 	    DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
@@ -1716,6 +1734,12 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
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
index e0dee9d28740..ab68c6d7b021 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -181,6 +181,12 @@
 
 #define DWC3_LLUCTL(n)		(0xd024 + ((n) * 0x80))
 
+/*
+ * LCSR TX deemphasis register for USB3 port @n.
+ * Offset stride matches DWC3_LLUCTL.
+ */
+#define DWC3_LCSR_TX_DEEMPH(n)		(0xd060 + ((n) * 0x80))
+
 /* Bit fields */
 
 /* Global SoC Bus Configuration INCRx Register 0 */
@@ -198,6 +204,10 @@
 #define DWC3_GSBUSCFG0_REQINFO(n)	(((n) & 0xffff) << 16)
 #define DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED	0xffffffff
 
+/* LCSR_TX_DEEMPH Register: setting TX deemphasis used in normal operation in gen2 */
+#define DWC3_LCSR_TX_DEEMPH_MASK(n)		((n) & 0x3ffff)
+#define DWC3_LCSR_TX_DEEMPH_UNSPECIFIED		0xffffffff
+
 /* Global Debug LSP MUX Select */
 #define DWC3_GDBGLSPMUX_ENDBC		BIT(15)	/* Host only */
 #define DWC3_GDBGLSPMUX_HOSTSELECT(n)	((n) & 0x3fff)
@@ -1185,6 +1195,9 @@ struct dwc3_glue_ops {
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
+ * @csr_tx_deemph_field_1: stores TX deemphasis used in Gen2 operation.
+ *                         The csr_tx_deemph setting is applied to each
+ *			   USB3 port.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1424,6 +1437,7 @@ struct dwc3 {
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
 	u32			wakeup_pending_funcs;
+	u32			csr_tx_deemph_field_1;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index b601cca485ed..7c6111a9ca44 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -25,6 +25,8 @@
 
 #include <linux/phy/phy.h>
 
+#include "core.h"
+
 /* USB phy reset mask register */
 #define XLNX_USB_PHY_RST_EN			0x001C
 #define XLNX_PHY_RST_MASK			0x1
@@ -41,12 +43,14 @@
 #define PIPE_CLK_SELECT				0
 #define XLNX_USB_FPD_POWER_PRSNT		0x80
 #define FPD_POWER_PRSNT_OPTION			BIT(0)
+#define XLNX_MMI_USB_TX_DEEMPH_DEF		0x8c45
 
 struct dwc3_xlnx;
 
 struct dwc3_xlnx_config {
 	int				(*pltfm_init)(struct dwc3_xlnx *data);
 	bool				no_mem_map;
+	u32				tx_deemph;
 };
 
 struct dwc3_xlnx {
@@ -280,15 +284,18 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 
 static const struct dwc3_xlnx_config zynqmp_config = {
 	.pltfm_init = dwc3_xlnx_init_zynqmp,
+	.tx_deemph = DWC3_LCSR_TX_DEEMPH_UNSPECIFIED,
 };
 
 static const struct dwc3_xlnx_config versal_config = {
 	.pltfm_init = dwc3_xlnx_init_versal,
+	.tx_deemph = DWC3_LCSR_TX_DEEMPH_UNSPECIFIED,
 };
 
 static const struct dwc3_xlnx_config versal2_config = {
 	.pltfm_init = dwc3_xlnx_init_versal2,
 	.no_mem_map = true,
+	.tx_deemph = XLNX_MMI_USB_TX_DEEMPH_DEF,
 };
 
 static const struct of_device_id dwc3_xlnx_of_match[] = {
@@ -308,10 +315,12 @@ static const struct of_device_id dwc3_xlnx_of_match[] = {
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
@@ -325,6 +334,11 @@ static int dwc3_set_swnode(struct device *dev)
 	if (of_dma_is_coherent(dwc3_np))
 		props[prop_idx++] = PROPERTY_ENTRY_U16("snps,gsbuscfg0-reqinfo",
 						       0xffff);
+
+	if (config->tx_deemph != DWC3_LCSR_TX_DEEMPH_UNSPECIFIED)
+		props[prop_idx++] = PROPERTY_ENTRY_U32("snps,lcsr-tx-deemph",
+						       config->tx_deemph);
+
 	of_node_put(dwc3_np);
 
 	if (prop_idx)
@@ -377,7 +391,7 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_put;
 
-	ret = dwc3_set_swnode(dev);
+	ret = dwc3_set_swnode(priv_data);
 	if (ret)
 		goto err_clk_put;
 
-- 
2.43.0


