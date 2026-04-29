Return-Path: <linux-usb+bounces-36703-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBl0Iu1A8mn7pAEAu9opvQ
	(envelope-from <linux-usb+bounces-36703-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:33:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D02E498332
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 883AF300C3B1
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 17:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D811C41B360;
	Wed, 29 Apr 2026 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X3Za39LI"
X-Original-To: linux-usb@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1162640149B;
	Wed, 29 Apr 2026 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777483958; cv=fail; b=cQLrgg17/zdo34PbvW/+K1F9D5VbD+fyTRoM/KDSXxaXvQ0S2joHquA2kwC+I5jxIYFjDP/0Dce0LYc5xU+uSUGu4aIh3eGwxTMXNbdK2eNMvLMU2Q4ENHKHcTyd3jY6uJXa2Ft5tLxadc2zDJaLIK1JpBfUi1w6EzlM8EgDzLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777483958; c=relaxed/simple;
	bh=Q6s3wM+mm2fCFTJREiNnqOg6uYujHSoblP6JO0dTWyk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b2RhHjN3UVg1DFiwApZ0BSfVbA+nX9LDM5CbxffvQ3siM5UWLRGnbNgMVW2iVGIioOhqsha9bAbGE/KG5b78DHwJqv3sr+pzBxtoBD1N9G75Q6DZSsKk67odsK40pNnSM4t5en+AiFtwXwU0pbqiKsq8iSn9NDmtL5jSBWpNhRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X3Za39LI; arc=fail smtp.client-ip=52.101.46.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knZSia8ygAlb6SYncaKamonOY4WVgBvXZ3Tj9rlxWtlP46nii9UXhMN62PrRm5H93EpuynAAOhqNUUUjB0qKYHEEaM/BjLIYqrshtktmqBfVJ9qEsBirSIXa/pPvWAH2M+aoKonlFlJi3qyFLrW3iMTkGJHPrjIKG1X93T70T1bRWNJnRlrU11G1Fz6yvAwKY2e7vqm4GJVTLNQs//F6kkVY9GTQvz6BGz5hgJ3H/UKeiTyPq5ER93pQDB5G8kTUJLd2LaNyCacCLZlojAwJ8l6SDnyEp0LVc1jh/ebdvIiWi6djVx7ZHX5nENgAxgMigpjNHkmSEgUACTAGdGWRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBP0pVPxiyAdOds3IG7AjgbQI5Veking0yRKpLFLBCg=;
 b=WGl87VIw30Md27WUB7ir8a93Qhubg0m3GIqKYBgYkga2F0CgsILcFry9J30JRreQENtolzp2ADeGzaKHtJQVF6m84amVW3em1bV6bnWXfdYVW/1ru+6kLgMbs8GtItTO5uO7SVYktBwtV6y8hTWMokpUP5ju7GTOL4ReoZtDMnqrDJl6ZG/jCpNwCBt4PUB8QUZSPAPLQOd7N7aHHrr/n3pznJuErhnF7CckgnrEK2xDpapbrqLZO3/27Ps1pPfmkc6vjZ5agx25t9NKpfISzTPfrXDm7t8nK9tLzW7EkWUgXzQXjEmFsMUNnoRMgmLoXoVR2k/S9ptBLoNerLCMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBP0pVPxiyAdOds3IG7AjgbQI5Veking0yRKpLFLBCg=;
 b=X3Za39LIPb1d6RB2wk7Nrao8V0SQcb4Fq+7RiouN+uvct4iMWJgqJSBN90Z3obQr0/X4WS2sqZ+sPU4F6e/RW2SJbBj2V+rDeyE+mDWXELbSbRLk2+WGfaVurku7Sk7VCV+HPZjDHWkjMub6fajhO46dNu/pX6VU3pkoXeB5aM4=
Received: from SJ0PR03CA0191.namprd03.prod.outlook.com (2603:10b6:a03:2ef::16)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 17:32:29 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::89) by SJ0PR03CA0191.outlook.office365.com
 (2603:10b6:a03:2ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 17:32:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:32:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Apr
 2026 12:31:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Apr
 2026 12:31:09 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 12:31:06 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 0/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Wed, 29 Apr 2026 23:00:46 +0530
Message-ID: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 634d1579-70a4-4e05-d19a-08dea61549b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gL423kqDB8An9UrqHLEePA+QwRmz9NHvyK2atae4qhuryQtAUp7fhWlh+apFKaptKges3xxkU3vRJM+Bk8Soh+sMFppQmtODQWSggPQIZAWR/sU+toHFIXNHqTqbtCypeCpzPjg8pkXYZI4BnIBwLaf7oYhNfrF7xT0roEsATyp4zKzmicf75NATVBFfbWY438hZNKRNa7OrFystdLpBg06LXOKOVACCbV/YkVvQymzLWbIDtbPXP/D8lWO/p6idQsM2Leh9XN3XOIeiNgUhAR87BS52JUkHL8zRtsWL/qbZ3G+fUTeDgNIkDlLLDqNUxpkCpbZBuoOcBG96jqv6mgAvWyj6l6ykaLXNc6zI922LH3GpF7awJVtEjp2D+j3PnBoRmjsntRyxBQhhdUuAweGq9CCIGGu+iQ0xs570srNlfdWYpyPS1tlVS/9gHNiv9SZ8djK5uUBF3wb/ZMpBWuXkxSNKSSv73LBo5uNsHi+znjAwbDnCnX4znthK2s/k1t9mVZsSsXrLymmZaJxQ/7+4XSAAmlZzn6L6Wn/hmwCY0dg+6rZR8SddWTVfrAHixtizVUvv1IACwIWearfeNWnhbNhslyOKxXrVcOkdehjBAP1kFx354686cEmsgftaCqcoGFTA80TzYbXM7P9S3VKSbVb2dVTmBfxBekF1PA8kpKxRI/U6i4P9vrZNcNpsoCUYV480TKuP/TFNLYGcw+ePx2aVhaStLMKjqjzfDkuGgYqtO085bxJbiknX7o1XmeArCjbGJi7MdeUbzWJZhA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fZGN+3COI72QKWDGXuWRvMFpos4h3QXGHMivq0HTunP+nqTtiNVX7sfkmg0SdmqptjWdYjMWUSNhMmJceXITrFncgoWmWMTkhzfZPteNwEauC8b+PLkBr69enCmBAgsIRTWJEB84/vKIpoPWFmrj8gAjjnFksUuvDBFPOoKVJHHVGECjw9qjXj+PItotrsJ99PxLBxr5oPbDyQMOuIcN2sJCs8DYaeCC5uuSCg2tmMj7KMwTrkme2O0zT5J/GwO0YOfix2M5px0LT3AlfJEbz3SkmDR9aOWLfVxyJEVqRiWipZrNx3DiAuBoh5fXgiREEVEprCCJfqIb83UO3X0u6QY5JWxan6wVMR1eZd4jd/yqtYunIBhaGVzbgNQcWPhQ/yKBJm5FMNOtmVU03Mv4NIgwH2Mo4ct6d61Hi6JixiP1zySVCJBJj1QtwThkcZx2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:32:29.3730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 634d1579-70a4-4e05-d19a-08dea61549b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324
X-Rspamd-Queue-Id: 6D02E498332
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36703-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

This series introduces support for the Multimedia Integrated (MMI) USB
3.2 Dual-Role Device (DRD) controller on Xilinx Versal2 platforms.

The controller supports SSP(10-Gbps), SuperSpeed, high-speed, full-speed
and low-speed operation modes.

USB2 and USB3 PHY support Physical connectivity via the Type-C
connectivity. DWC3 wrapper IP IO space is in SLCR so reg is made
optional.

The driver is required for the clock, reset and platform specific
initialization (coherency/TX_DEEMPH etc). In this initial version typec
reversibility is not implemented and it is assumed that USB3 PHY TCA mux
programming is done by MMI configuration data object (CDOs) and TI PD
controller is configured using external tiva programmer on VEK385
evaluation board.

Changes for v3:
- Return -ENODEV from probe if device_get_match_data() is NULL.
- Replace map_resource with no_mem_map (Versal2 MMI only; others default
  MMIO map).
- Add PHY warm-reset assert delay.
- Loop all num_usb3_ports with one de-emphasis value.
- Set default as DWC3_LCSR_TX_DEEMPH_UNSPECIFIED default and only set
  snps,lcsr-tx-deemph when not unspecified.

Changes for v2:
- DT binding: fix MHz spacing (SI convention), reorder description
  before $ref in xlnx,usb-syscon, restore zynqmp-dwc3 example and add
  versal2-mmi-dwc3 example, fix node name for no-reg case, use 1/1
  address/size configuration and lowercase hex in syscon offsets.
- Split config struct refactoring (device_get_match_data,dwc3_xlnx_config)
  into a separate preparatory patch.
- Fix error message capitalization to lowercase per kernel convention.
- Rename property snps,lcsr_tx_deemph to snps,lcsr-tx-deemph (hyphens).
- Fix double space in comment and missing blank line in core.h.
- Use platform data instead of of_device_is_compatible() check for
  deemphasis support.

Link: https://lore.kernel.org/all/20251119193036.2666877-1-radhey.shyam.pandey@amd.com/ [v1]

Radhey Shyam Pandey (4):
  dt-bindings: usb: dwc3-xilinx: Add MMI USB support on Versal Gen2
    platform
  usb: dwc3: xilinx: Introduce dwc3_xlnx_config for per-platform data
  usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
  usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis

 .../devicetree/bindings/usb/dwc3-xilinx.yaml  |  70 +++++++++++-
 drivers/usb/dwc3/core.c                       |  24 ++++
 drivers/usb/dwc3/core.h                       |  14 +++
 drivers/usb/dwc3/dwc3-xilinx.c                | 103 +++++++++++++++---
 4 files changed, 193 insertions(+), 18 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.43.0


