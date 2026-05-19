Return-Path: <linux-usb+bounces-37730-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFg/KAyrDGq4kgUAu9opvQ
	(envelope-from <linux-usb+bounces-37730-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:25:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2D5839C1
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6024B30A625A
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDB2368294;
	Tue, 19 May 2026 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z76OCEBi"
X-Original-To: linux-usb@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D094368284;
	Tue, 19 May 2026 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214828; cv=fail; b=Lx8zYebHrCSQ4pTqc0Eo36f5GIbi2aNSYe68V4HMs8jRqa8jBhe3P93f7Mti8jbLikjAM1tp06CucZHwObsAeT/Nc+sNN3eQyJqJnWe2YaeJm/izVNxLAwrLnZXB+nCYGBYdnU2WqMj+YbuTb9RAlDFwO76euGMqht30gIpZkBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214828; c=relaxed/simple;
	bh=sUT0VtI0iOHfw44qtjv2o5acBLc/g5cbrsvT9Ec8xng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wn8MRztzIsrAWlFs6UtztLNrkiadHIvQN099IKF4QR0coUm5Efpsd1wpRFXmWA0oAVEYvu7RkxH62N5v+DcXMdFPACcPn0nBbEWDRM0VeZff7CckPSvnPA0WMoSw468l65POu37VYDYpiK8Txat60T4KnbvNXjKPHM/1ieCu7yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z76OCEBi; arc=fail smtp.client-ip=52.101.43.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zu4tuO9lEoEU0xisrpQ0bh5DT9agWJUAOvHeFMMy4oPQjeHAkKING2GAMotJh+fprdXxKS73fdUBpCC9L+r3TdynjsroD8oCBs4m722bryDEUwoTykoOaBxFrIfEWnve+nNF/+mFNxda/BdtTUn87y4kRhnX2xKWS40QaV+lwVUldL2ju57MfLRMcfP+a8Tzaqa4S7zXXGQYA5ENIInD7tVmHg4//wwxt19LtxOHxvf4oMMHrNFlYWtSPWjdV1engwhzAk4s5Vrxnekz++5Vd/gZxURnJEOffkpVVZ4YEb/cBx2LScsHiLQdKzXlyA/+ng2RDPl3xiDQ7l3H0kZzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nrEWwfwadCssOBgGMBF3nUnLsSXuAn7tysLsq6cVCA=;
 b=KdBtpu/0U4j2YUwFDjqZ2d39UvnSXBCeCCE+5RMN2J5Azd7MRBuTCUbBD01Pn3eMYNA0Zzz4DJDJMtSC0CLoXcC3Yjmxcvv1RzEySLUxxU1o6TKsIQWH442mIUy5wTC8BNcrNDZeNypMBozcCZexgGmH9viRJpMEmBuly7xS9zwtOkmUKNS3EAqZHuR6h9IJOsgWSADFErakQIZY/efnvReSFARtPbzA2qaeV+gKinpcZ7ul8C7ZQnakFVmAK1h1y7uXbvkMDPQCRFaVZFco6j1mvipO5ogNqdggV9QwA8Z2/QKmtedVwU4RByhSdqX+mOkInf5vISNRJyGK2nmMog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nrEWwfwadCssOBgGMBF3nUnLsSXuAn7tysLsq6cVCA=;
 b=z76OCEBicSYqSPHtMI+XkTwsoEta/i7SkRrU5fSF63Ieb6g1hMfW8AWhz5rgyEYRA0z47Pvc7SuuX1XOA9bAJwh0Elaq2H/4Y5k61hh5BegZOLq4RsLCV7yGo1ZuiwANxbiIBgNJF1i/dSH6aaFAnml0T0lbzTDXq9JAslSZ1FM=
Received: from BN0PR04CA0072.namprd04.prod.outlook.com (2603:10b6:408:ea::17)
 by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 18:20:24 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:ea:cafe::72) by BN0PR04CA0072.outlook.office365.com
 (2603:10b6:408:ea::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 18:20:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 18:20:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 13:20:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 13:20:17 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 13:20:16 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 3/3] usb: typec: tipd: name TPS_REG_POWER_STATUS field masks
Date: Tue, 19 May 2026 23:49:56 +0530
Message-ID: <fdf373fd9d98ba68c72cfa9e89b4e9bddf06aea8.1779214249.git.radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779214249.git.radhey.shyam.pandey@amd.com>
References: <cover.1779214249.git.radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4830a3-69a0-44f7-00b8-08deb5d34b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AObJzz+3JCDjxWI89mF1sCgLIa3PhW1E5nZOtD+olYC7EWLsCCnOuGY2cdtIJjcniNgy8RVgjpwcQBVgYl+L1M7BvZ7zdkbegCRXeCbLhWTOH4gNc6mKM3lWLkF0OEXPwk/CZEM+Hn1rVXpJJFx0Ns1ZzG/dCzwIeEAZlHJmE3b4ys1b3Ytt5RJ/5kcA05U3mGtqBlre3uPVlMUVrtuNnFZ7RLGdS75++m95FduhRtMa0l8n52atnR7OGMKKWlqOeFOkRiinRaESHnmA/jSRi2bdAuFvQvOKtrzF//K+gy1cg5dwU7fw4DjdDQKhYpzNDpsI6MXVyqPSUJuz3VXoKf3dxkllJVN2i7nxMfXaGUlt0xmQ+10FQtE2ASOXWnQqY5OKJ4sFQapjJcWiYZI85ZnC8NA1OGX9djTWNeDdR1ZdOVkAi56YcuyCYiF52tFUN/6mDZa9P9eyje0sLAga50vF+JHerYSsHhxKQrIH0/mXWv/l+cPBffUkxwJiox7MYGQYQfal2c92kqy7Ooiu8Z656HdIKOC8d17yjyHLUG3P+f9+lRo5GncNaoz2ltYMz/zr8Vlauy+xH2wgGiAncVERZiANiGyPsoApuq4hQbveSIAljZOacDkWPN+/j1k27We+1f95OAKD74pNFXob5/yzkB2FrZLeBQzVE9zMDrBXlYiRzd1TVMb7wYN5mhC1u6fB3uUF8rWPwqBsHwXGIr3SOBTn1egFP0Rh56wp0KY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PBfZL2QKsdnRg1bhNIhHGqXbW4aKbNRgCCuRzOhFCc4ORJCwxT1qiHYiSdkOJWW8ZiiUKjFcutuOz5jNGPmFdD7BSvI7wZjeH1EoaZdD8QjQVscYiPAasFYdfO30Jh2hL5JDsAeOxxZTKhBV2dsKdGUF/PspeFoU9FORSPH/H4T9w2kj6pIWDfA6qYV3KJWyq1DjVugI7WkG7eTPt1GtEhRsxrZsm3tG0UYE+TmM1fDFWoLwSh54qMTq/frddBvjaKj82kAg+q56nPjDRzxxOQNs10aM/GVwMgdfb0/fpSYP7jMQNaWdxrR0uk+utdtyPx8baZYePLwQuZZYiSAKQl+ZUD5H5U5wBo9kqLF1QayVyZRtPyMnRTxA+JylLIevwz32gKikLM39CSH62ImFDNhcg+SnpexgYXYND/bjaq+coehV0d82GI5jTawKZ6/Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:20:24.2855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4830a3-69a0-44f7-00b8-08deb5d34b8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37730-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,amd.com:email,amd.com:mid,amd.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 03F2D5839C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define named masks for Power Status fields (connection and source/sink)
and reuse them consistently for both field extraction and value
construction. This avoids raw bit usage, keeps the definitions aligned.
No functional change.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- Add Heikki Krogerus Reviewed-by tag.
---
 drivers/usb/typec/tipd/tps6598x.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
index 03edbb77bbd6..d4140f4da5bb 100644
--- a/drivers/usb/typec/tipd/tps6598x.h
+++ b/drivers/usb/typec/tipd/tps6598x.h
@@ -142,9 +142,13 @@
 #define TPS_SYSTEM_POWER_STATE_S4	0x04
 #define TPS_SYSTEM_POWER_STATE_S5	0x05
 
-/* TPS_REG_POWER_STATUS bits */
-#define TPS_POWER_STATUS_CONNECTION(x)  TPS_FIELD_GET(BIT(0), (x))
-#define TPS_POWER_STATUS_SOURCESINK(x)	TPS_FIELD_GET(BIT(1), (x))
+/* TPS_REG_POWER_STATUS bits (masks shared by TPS_FIELD_GET accessors and FIELD_PREP) */
+#define TPS_POWER_STATUS_CONNECTION_MASK	BIT(0)
+#define TPS_POWER_STATUS_SOURCESINK_MASK	BIT(1)
+#define TPS_POWER_STATUS_CONNECTION(x) \
+	TPS_FIELD_GET(TPS_POWER_STATUS_CONNECTION_MASK, (x))
+#define TPS_POWER_STATUS_SOURCESINK(x) \
+	TPS_FIELD_GET(TPS_POWER_STATUS_SOURCESINK_MASK, (x))
 #define TPS_POWER_STATUS_BC12_DET(x)	TPS_FIELD_GET(BIT(2), (x))
 
 #define TPS_POWER_STATUS_TYPEC_CURRENT_MASK GENMASK(3, 2)
-- 
2.43.0


