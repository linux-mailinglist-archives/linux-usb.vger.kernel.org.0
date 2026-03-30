Return-Path: <linux-usb+bounces-35693-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLpOLBDJymmL/wUAu9opvQ
	(envelope-from <linux-usb+bounces-35693-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 21:03:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6413601A9
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 21:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DE76300D4FA
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 19:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787EE386C22;
	Mon, 30 Mar 2026 19:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hT8+hGND"
X-Original-To: linux-usb@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010004.outbound.protection.outlook.com [40.93.198.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE0E2C21D0;
	Mon, 30 Mar 2026 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897408; cv=fail; b=WfosstXG6EZ4EAD3fZSyDZVfJwLxUeiTsKCfBRfEJfhs3IBqVBJMFfYQnkGrV0alQ3+i8hnby4UVXGSYir3aI4GwIwlLXlEpARkNI2a1xpNv7dGgjtvHcKtRLF6hyeAI/ERsSh5dn0k4IjhjCsvaYw+o279whz7+k7q4Mb/+Ml8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897408; c=relaxed/simple;
	bh=sbap2ll4k5EkIwstVgshTibcj1GaTKpWvWXzI8TGRmQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dkbz6dRPsK2zz9VNOXAd0NMn76RUWznpZV5a6YoJdoB94Bf5wD0E0No8elpnmnaWFyjVGjInhJz6aFSorLxm/6FbfskwI37GjjUdFITjtoEfeAq0mlGpMnj0FyoA08bKioZhon9sQrGJRlQO3SeCv/CdmS23odTIKvI4rKQBito=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hT8+hGND; arc=fail smtp.client-ip=40.93.198.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUN/yx3aQxr7EytPfv4SO8KlThQPZNIFaik1wUmz4pSvEaoGcwRuqLC/PhEa2pb9UoobfeZnwBT6dbQDhy7LEM5ERDIeWXW9/ZtI556nz4qpMfQmyR1CoefIZPZXb5tBidl/A2dONDlPXYu9ZfNQnIPd3Y/hmNiGsrxINrIHCEwVRkSGYnSsehrLzn6T/zoOGm54cQDROWKq3eWxHkBbuqFCtP8NvXJJfQ9DUIN4+0qdmummo0gilEBbko9U+tE0i0Rx5fm8+Pqai7jwKYbjTTGaBZVjXJCBwPu3tAhgRItT+O6SmrnLzZ336JYAzU8FBnVK8PSW5fMqe1uxHZwP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCivOAAC6y2SDtg+mjVT1nslDmiFVfh5SXg06Jz+HY0=;
 b=nNI/8LvZmZGFh1drUKs1Bz3YyF6QOlDQi21YpIwecwkOlOqjkceWiWxsu4ZDyZlaZSaa5iikYNBIT04EZ+sY5c9yINvTvMg3WUPYCsUDz0XzuRRd0ENNB0Rmc/2eUWsLtGRCVbtkR9oXyziPu5j8JADFOcoKKZR9Vb6x7vouex01EBgGJTIJCyTM2vUIN7RzOfw+LYy0TsFcyLMjRJVYZvvugUp8iqQcs43NanIfPvspHWuK4rbdU8IzhsJkgZawOz4+Hyw6Ihg7Vq/jYDWYmltEosowZ3P01Htz9GBtjfliK/ZcDyUyAzaqUIWZ154EwjjUL7UFB7tyEJLzjg3fkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCivOAAC6y2SDtg+mjVT1nslDmiFVfh5SXg06Jz+HY0=;
 b=hT8+hGNDU2wytfZHoBLSKxmlEvaJQEW1hWijZp/RjRgrXOhLxLSpzZ9RgcFfxRfKFfjfZvF/S54SneQ+xTBB5REFA6ST1SGHxS7JV5/+Xe7SQcFqxw7KaIV1K+/v7q92yGsAmgnevWTV1/ZRANXc5Bo0BveA8Blypb1GWi3uOZc=
Received: from SJ0PR03CA0074.namprd03.prod.outlook.com (2603:10b6:a03:331::19)
 by DS3PR12MB999215.namprd12.prod.outlook.com (2603:10b6:8:38f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 19:03:21 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::f2) by SJ0PR03CA0074.outlook.office365.com
 (2603:10b6:a03:331::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 19:03:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 19:03:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 14:03:16 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 14:03:15 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 14:03:12 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 0/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Tue, 31 Mar 2026 00:33:00 +0530
Message-ID: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|DS3PR12MB999215:EE_
X-MS-Office365-Filtering-Correlation-Id: d3529159-9323-46fb-0bfe-08de8e8f02e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	93KyPfJUlfPCrnO9EJdoiLMu75AhwZpRy+FKRg4xd5uzvr1m61tL2m2fnymJfLHgZzRBrxyQRJrHqnUXm1nbdPOnKMAMdkp9s+iSHwpBSbnBHGO/NGBZRkDxk0wBegf3HiCnmpl2ECZbWwMVu2uSmfv6ij1sUy4A8rTU02cHHRKMvseav5veSpA50/N2AIIAfg1RWbKAogYwf1Fpd3T+dFsqbX40AHhCW/PFOvc5t4IP9wiRd+y5S/UxSKDkAusJPMYXnegpDPKyGXOmyjiSby9P4lpRsYA9xQf8tmLUp1qHiQcCbRrUiclV0UElRUYGrfYZgF/pDiDcqOZixVDeHgGhWsmlclcSOtX9gSxFe/1AyKbIIsGsh2MNfE429Gw25J9WJAqoh4gAitjHQzcSW0iCrCTlISfAm/3Ngm9i47YtFKtkvqLO5igKkbVwDRf+Jpf4TkFuufKJ06+z6rJiTgKEGntetNOzmqw1vWlSwxAoJ1xhtInIeziVNNTX0569092KoT6mbdWrxSECqN7BW+jOuTIyl7g18z98vZnpcrdsaes3O4Bnp0Ou0923Mpb4N30Xz4+ORJTSd9Q7cRnlggHWBhrW5K4uwvD5EIoSjQdpxXevNfsiuOMTYsno6gjLeg15KRy19DMVJ049d440cbevpWlNIpyZFRSKrnqbGIjKN2Xfz+XjifejYDDurDyCKZ4vSbqM9uOWvFxMsZyPpwZSBW6ys/xibwn+U87Ri6nUhHjs5Kj9MD/meSb1jlRmEd+RUYBQGYz1fSrN8KxY4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sLDtn8tZ+s0rIerjlb37IIT3DEyMxwq19x1E8761OndDsYtdd73sprXbSscPe2gM0/y9CgPT3Vw/VtGqd8IX3u+ChmnswS0SkbRXxxMVMnUL5TT0vt0IFd7PfPkfHrmUeLAA482j5pr+UcwSnFBzUfaACS42xSZ+JyO2pDEXMOeb99vtldVN5Gp4CmjhKJ6syd+OCoAR0+2BcGdyzraYdpCPTOFKvGl+Sw/wiywoz9L0kDpUo1Ex2tTo6oMjTZ8UeEU3sXwqCDrVswPL9nWAwAisIIibyb/if6m1Y/I6qpdDm55e2i9UBof4IVBUMDW3kYy6Mt+kR561a0LVn6QyNhGJ1sjzJIJ4FfcPH+1tGcRD/1JoszXPJ4mrUWGZnFNK3uEakBomaAJ2EI/v43VHF9I7uYgZ5Q02tlzhFCilspw32t+cbJqfwc5UGrwFrhSV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:03:21.2390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3529159-9323-46fb-0bfe-08de8e8f02e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999215
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
	TAGGED_FROM(0.00)[bounces-35693-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BB6413601A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series introduces support for the Multi-Media Integrated (MMI) USB
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

Link: https://lore.kernel.org/all/20251119193036.2666877-1-radhey.shyam.pandey@amd.com/

Radhey Shyam Pandey (4):
  dt-bindings: usb: dwc3-xilinx: Add MMI USB support on Versal Gen2
    platform
  usb: dwc3: xilinx: Introduce dwc3_xlnx_config for per-platform data
  usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
  usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis

 .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 70 ++++++++++++++-
 drivers/usb/dwc3/core.c                       | 17 ++++
 drivers/usb/dwc3/core.h                       |  8 ++
 drivers/usb/dwc3/dwc3-xilinx.c                | 89 +++++++++++++++----
 4 files changed, 166 insertions(+), 18 deletions(-)


base-commit: 46b513250491a7bfc97d98791dbe6a10bcc8129d
-- 
2.43.0


