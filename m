Return-Path: <linux-usb+bounces-37728-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ0CAySqDGpLkgUAu9opvQ
	(envelope-from <linux-usb+bounces-37728-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:21:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1458394B
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0076E3002F45
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A95367F25;
	Tue, 19 May 2026 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DUi6nat1"
X-Original-To: linux-usb@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011065.outbound.protection.outlook.com [52.101.57.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137935BDDF;
	Tue, 19 May 2026 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214822; cv=fail; b=UX0vnVTJ1a7xQYWCATDNg1JASQ2PGevF+ya2q+ZSokPUxzxner2dhSVwHKlUQ5RwA8nuDP9rvzYkeSCNF5g907rOVLvdWWs/khAwKsYGsn+st7WvqcPirK1yMHcLwO1MXZEhnZXAXPCAg3kzGR9rYD9///ad1MnAtx9dWntnkWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214822; c=relaxed/simple;
	bh=oIhwd/Rk6HnCWuK37OqyYewmRaZcT7DqPKPynEIm1ss=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tN6TLsDd3NypBcWgMhnAs1cC1seaEQ0xtLPGjnoHuefzq3CHCwj2BE+TOF4YxnZpBt/EULAGo4+63UHy79dM5Fz0vPBBPuKz/XYt4yWd0sn1L9GRlCUedjNsy7G6CLDjvkLbunp8UMSb/ehEdeITfPfmdlVLF+zUR8pt6BaGw+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DUi6nat1; arc=fail smtp.client-ip=52.101.57.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jA5gpbAmuyXSXzX9daACIqAP/Ono5ogwQpHxkQnOr1pPadw8+Sb3BoUSTsEEUfkcwEgkWYx/jB9gMVPgBtDIpfVecLhrB0Kl33hVwUvx5+uoou20uauPHzGCnUqDT7qZSjBzjQ6YXIUaSnNT8iu07o7lRigMDooEMz9+gJk2wPfgl/m626am/axI+XpJM+IKTgVGU+l5weta4IUcaF4G2OZw2Fl+dC6RhFpfOJJfAwbqivw+5rdt+ujXmZ3fea/Py4mqJP819LeMvtjqTI8hZR0H9DFpR1coUf56lJUWyLjr/cptEcgDdxFSHfuALavLXy6cmyBWYhOgrYGUDyn13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDfJaYaCRVrLHvqTEf/m9RrUtE+c/Aw2G8D9pqmSowo=;
 b=mO1A0D1K1vRU7wVZ2++xvgskEXbfKeLApf4eklsMvqZF6PEdF81LDanJcWwJaSgIfeg5Zq+tolD1gXtbdDxDEZ8W8cXidMWGY2gU5D54nrDlc2WXRteHn++2iJxUK0K3N2MODlP5Mj+6Qg5V7C1TPr540Az6EdVtsGwvGOyVJny/cyc2jRks9T7n4W/VQ2xSIrPVMEoUZff6PXz0zw14wQdnuZ99nDp6GkATOYclcF/iK1f2X5RLun2U2vykn57Xu7QaZ2dhk13T65JpQIujlLeeU2tsHRsze8fnCT7ZWjAECcV4JmCCYw/7fRRxbc1boCYrh9G5h4TMh5Q1XNM01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDfJaYaCRVrLHvqTEf/m9RrUtE+c/Aw2G8D9pqmSowo=;
 b=DUi6nat1yfwWw+9PQypkHRRrsKRBh5e2QJ1Z9otrjBb63sMMYElf2Wpvsd0wKMjKeRouvNOFgbNS2LOoGarFNwCBTL3DA1CUh+5Z1VduAdxCmw/hbmQy9/OmDMnw/byGUHmFAz5BqGVCnteXZKt6ML5eOeMwmDA4IUVrzKeoCpI=
Received: from BN9PR03CA0596.namprd03.prod.outlook.com (2603:10b6:408:10d::31)
 by IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 18:20:13 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::8a) by BN9PR03CA0596.outlook.office365.com
 (2603:10b6:408:10d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 18:20:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 18:20:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 13:20:12 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 13:20:11 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 13:20:09 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 0/3] usb: typec: tipd: improve probe diagnostics and POWER_STATUS handling
Date: Tue, 19 May 2026 23:49:53 +0530
Message-ID: <cover.1779214249.git.radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 75056861-91ea-48a9-2f0a-08deb5d34480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|11063799006|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	67PPX/cv/d2rdW3147I7XfQGNEeY3TkISyXHHUGF4Iz/PhayukD/bKT7oQ8UmOPwDf01ROa2vw07f+I9STuLqBAfAU6LH/yGqsVKkFWmT5fknybFvPUOHA4DOFRy7BmCHd/6HrJ5h0RbpvXo4YsvVlhHMRCz2O9VtVCajV0AVK/1bYpmedhxHdDkAPFhbdWUFQ6Mbi9k8jTEoP8mA8PWX32tBTW/TmMaxpOmOJJy/Rp33Nuuhh49CbFxMkERjlbSagdlhRgCI6NvB0vydA8xxKAVFE4yBd81hjg0i9Mu36CAgftAE01WqOf1cgfW57LrcVTRQJUC2Eg0U0cgwY7MAAFZbDfJBhpOvZFLUv1+GOHrlR4r7BNB5MkmHsuPAfOCeHCVLCPcHlIdO3xMdyKYkevKs5tB5hOjfOsD1PDqMNPrzJ0wyI7JTvlCqMgeeq9Q4EJe6ubZK4aHuWccQyCwiOzRuIqp6bJsaCMh0dyKfgcFtNpnb/xDxAN8D1Mq/pDSkxuPDizgLLA9U4N0t7oaWCP6NlaGAethc+n57RkQP6V+U90qJq6bDtqyJv3kGa3e2/7Wvy7X255fscVZEsQLDVDbt6sRfQ4tOnfseuEtFvcEft36XR01NALYVhS6iccc5IXFujXqkbBsGJMIw3VvW9Dc6Db2GGg6Al8oQx2NLcTe+6RNsr+77xYQSeHmeTi9xsVhAXJ7Tu6y3CurA/tpgUTL+XCJh0wKsk2JpW6fhiA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i9GCGalELwodfyrDJELNnb7knv11eIFt74jaUn9S6si82AOYwCnifn+LlnVuBanUu1XV81plCdXouvAXf8trqU4lvMcXVsSnoRiL3ZpNx0bqJQjsOYvcNCyT2ybOvXrKtHAXgvVTSH/KlwSaulonioOiFi5r5FM4dFXUye+6pZfAh0xaB9oeGZd5HEPlRfOKjKKaFIFviXLwuNnbLZhknIN1ME5qR2mD311Q5dbdR77kus7LB6wVbBRkUd8IYvFcDvXNe+xvc+D0lpcp4FqoRHY6d3ht0ReLd29PdJOu7VkEVCwvaUewXSoQWqZ8I20WkwSUyOvM0uQtYNHrWWxBgLvgop1rkjFlwWiJ2WeTQSrVdbh51vMftubawVjxfc2jdx1zq9KWtnw8ZXAYsR1NSc6QOFKs9H7B5j29ThSrxCt5e5A7kkmw1DSGQbiSb9El
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:20:12.4745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75056861-91ea-48a9-2f0a-08deb5d34480
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37728-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0CA1458394B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series tightens TI TIPD (TPS6598x family) bring-up ergonomics and
cleans up register bit definitions:

- Log vendor ID read failures with I2C return code and register value so
  boards with wiring or address mistakes are easier to debug at probe
  time.

- Treat operation without an interrupt line as a normal polling setup and
  log at debug instead of warning.

- Name TPS_REG_POWER_STATUS connection/source-sink bit masks and use
  them consistently with TPS_FIELD_GET (no behavior change).

Changes for v2:
- Extend commit description in 1/3 patch.
- Move to _dbg() for missing IRQ message in 2/3 patch.
- Add Heikki Krogerus Reviewed-by tag in 3/3 patch.

Link to v1:
https://lore.kernel.org/all/20260513182850.165349-1-radhey.shyam.pandey@amd.com

Radhey Shyam Pandey (3):
  usb: typec: tipd: add error message for vendor ID read failure
  usb: typec: tipd: demote missing IRQ message to debug
  usb: typec: tipd: name TPS_REG_POWER_STATUS field masks

 drivers/usb/typec/tipd/core.c     |  9 ++++++---
 drivers/usb/typec/tipd/tps6598x.h | 10 +++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)


base-commit: 1a2ab0feaa23147e347b4d4cb79cb3fc392118eb
-- 
2.43.0


