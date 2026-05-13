Return-Path: <linux-usb+bounces-37422-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMJjEynGBGrdNwIAu9opvQ
	(envelope-from <linux-usb+bounces-37422-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:42:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F63539271
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 251FC30136F4
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB393AB29B;
	Wed, 13 May 2026 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Wy9NE6y2"
X-Original-To: linux-usb@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717A43AA9E8;
	Wed, 13 May 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696974; cv=fail; b=cmuZ95wPKI0BPB7RO5uQQp19GgycDWBW5u6HgAu+oBupDqWt8C8jhyUh0V0wS7puc6pzfcsQMuHjcRaK82VIZ5JEdMo1jglof9sSeRMellV2AdMb7zJwEL38AzkWOfiLSxxcEQBW3b3WPox/f6VVLW97uHUmbIaeeH3tQaFxNKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696974; c=relaxed/simple;
	bh=mZTpFFgJjVteRqI9GYzdDUeK0X7UkHSk91dBnAktjg8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpuoKdLCFMx1+8VwZLn1dDh5CUztr7AR3AwvL8bZ1Yspz2dO4TTEgBbvKDzZabOoQxRXpf9+t4QOep+heT9dWT7FJGOkSRM1wLGZsRkly5lHVcW7KLC/g1PQjHDIQC974WZ7tm7YW5IRzZUVB4NB/SG+F/eqBmeViwL51ofZKEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Wy9NE6y2; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Up34CaMwKiuv7rADTzfEZgQfRyKLuNq8d0YkewaBi3QptaEhHUaONav6nAOxNZUXCqOHBEFTPFCJbgIjIsZJEqPmxgVGvcmR9jrkpKiYIiJvVl6HaS0Cw9jURn7fSrHvaAjU5E3zz19coXKFd1LU1yszpmn3mW2SHcR75wDghRo4qIjMu6XlZoSSGy2amQwo/IKVV/qFKhAVVJrkD/9BSpoXaCW/AK1U+2j+X9TdN6FauG+MjbIU8nZKrMVUJcLy4PzUeypSQcc2lRHiEUwMBdyunjIi0jifDXfwp6ueIkyIeIf5hcmtGDSv76/4VptU68JhzKdyEB+vEi9hjnKg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2M11bkXL+frXa3j3KZ5qvhwz/o6ftyc8foFVFoRB7U=;
 b=cwrl82DSQumGAJsBujaNfkjFmrfPGXc0F2J9P7T7IDA9kFl0HmTjfbiC6irMLi1kePBSBqqu2mcvbfR9wK9zersTEsvlkrkq6Dh3mNSSlN57R17a9XeEomsRrsv2nf91uWkVTSRhCM61jVnWiO8E1hie/4h3B5ntVOre67iUIeDLIlqOd2YRaSJUbAHNlsqsEHZ/xj0GVliMAl1OnlN2TtnAtTY8jSyc81aXaM7Y+ldKTkZpq/pb/+oct5kh0ye9yeyOnk3WX5reOnlzM0OeJpa+91rhDjURLKn9AOYkHw3ZBExni9J8PyhC1oPKNyJpjAXvIUftv1oorK25GWicwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2M11bkXL+frXa3j3KZ5qvhwz/o6ftyc8foFVFoRB7U=;
 b=Wy9NE6y2+vgbe3MyPypep9i4d+mOSxevXgje4H2llBQYOFuGepbGeCwsuB5EbablnBCehyVZkjTbZOPgiJdfKuAIewQXbrMeI63dKywppOrLduKHQ1hlXYR79evapSdmGTrxZBCKKu8rUj9qmr0gSAw5dyISBIvpjcZaWMnFHMc=
Received: from SJ0PR05CA0166.namprd05.prod.outlook.com (2603:10b6:a03:339::21)
 by MN2PR12MB4376.namprd12.prod.outlook.com (2603:10b6:208:26c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 18:29:27 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::75) by SJ0PR05CA0166.outlook.office365.com
 (2603:10b6:a03:339::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Wed, 13
 May 2026 18:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 18:29:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 13:29:22 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 13:29:21 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 13:29:19 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 3/3] usb: typec: tipd: name TPS_REG_POWER_STATUS field masks
Date: Wed, 13 May 2026 23:58:50 +0530
Message-ID: <20260513182850.165349-4-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|MN2PR12MB4376:EE_
X-MS-Office365-Filtering-Correlation-Id: e0dfea8d-7481-460f-89ea-08deb11d9103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	+EZXHpLaJXKJK6F2XR9hgjTx69KMvRS4IlYZgLCJMvG+brGyJA70o1e69DY2xneqrOVeyyEAKvzd4lEu2yzG4lZnYpPmjhe8u3m+rrKHmCEl99rIXzdBbxPWhLMsLERGJ6V9lDc7Eyven/nqArPdN3mpHG9GNuQJ3yraaUfHk5kncdqE7bAVgYf89W+dplOITSjMuHIbK9zkwCU1fmVGU16AbuReNvECsdTq2NKkc2kU80YzMHeXOhwVYBX96rNehd3JFY4TLCpgi+8aM1xpOuO8VH9FzRT1RshKjqkO0NrB8j8Ny5m++Pz1KRzHtPiU7eOseSxAh1Q/tGh51dYCSTDaunXry02NXgX1OACRrWu0p+/zF6e3Xw/G6vkR7+/gGDhfaLNSLIbt6KvYUFnksiljlK+lDgsPbv0FRYaMzXXdyfUHSZYbPjjIPpP0G2nOSgfqGUtJMXFxBS7roXTN3b1t39KF86Nfpdu0lZx35SzF/km8XyqMR9tj2rsiLJF17BkUm/XQw25qmXpBbW8t8kV+mTovdH7FP09Pn4sc94WuTspSk6O7ieXeZMrJKkU4locXDB46vX5OB+kWHtIpSwViCm+BWyq5dZ+CfZXSS4s6iY0dqFo4ObnADzXMv8OwfeCCnpwo/Pk0gyvr8zdoQbEdiHBSNJWTrUP8EQbemMWOBqH8+H6OdoTd45rk6709DyEHAjIrrWGJiCzFpH35+3bGujRcXddRKHEsli7EAtk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p/iE/xgEGh4kYIY8AbZj2n2e0O6DTKjB+Dz81jXMaSQhAEYIbQCxndnMvZ7mVtfqIdrVwrdgrdAByeVN45vx6bUyftOIMk8N/RCE6zLLMJAQlh1pJm6ogw8FylTZMuBLAlX8aiSvC7I/nszJ2yKDT5X7FgczbXB2WZ4oDDmbVDIpttHzUfssMwRRRCVadn6aJnpmw72ZM/rO6iPIMYobtLuG1eDY53n2Xj1o9U+bBg1pQeK/g72DOUJwP/AgEuLP9WInnErGKjcWbCDgpMcfogc7seMMCRxPNwUt6n03UWdhQqR6JtDElBwlpdeP9iddTZOgvRbe38S4EA4jkP/h+9USp38iqwFhPCMTcTy3TXnsUSBfwlIym1cNocdm+tqMa//YXgiUxJpBzorLdZJiiKh2a0SoGGeUjC8TpWjTJ16JqGf62iPrjvzLKCXLr0f5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 18:29:27.6929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dfea8d-7481-460f-89ea-08deb11d9103
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4376
X-Rspamd-Queue-Id: 58F63539271
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37422-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Define named masks for Power Status fields (connection and source/sink)
and reuse them consistently for both field extraction and value
construction. This avoids raw bit usage, keeps the definitions aligned.
No functional change.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
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
2.44.4


