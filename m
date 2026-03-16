Return-Path: <linux-usb+bounces-34844-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AT0CQSot2k2UAEAu9opvQ
	(envelope-from <linux-usb+bounces-34844-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:49:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A4295447
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C303302FAA4
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 06:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AD734D3AC;
	Mon, 16 Mar 2026 06:48:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022091.outbound.protection.outlook.com [40.107.75.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7A926FD9A;
	Mon, 16 Mar 2026 06:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773643720; cv=fail; b=i+LhwmaPuA7RouoFp6fywMngMae8V7SHUaRfb1R7CHXOQqEF/IiJU1EOF73ql+DxI8teGa8eYFLo1QmBwSbb6vGH9oD99iP4OzdPtU0UzAIZmIx5VltCHTvrUR+ndo8SD8Z09QBZnUtgLUQJaQ3Ps0wpPmLpJx0xerAbnq9dJpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773643720; c=relaxed/simple;
	bh=Orj+jBNPpM+uYBw6fHbbp67T7fvi+078LT7sDI1IJeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e0D2jcZ3/DmybgA+NRs9/EWmOUIxlENvvLdAJAkLcN9OnUygbk3WPobcpHD56U//ZO0Njzwp5nvQOZQ3MAha7wpVNUoCa4Ix2Yfi7aqA7o62WeLtxxejTBAOisM8PWAP1W53yP8d5fsNHzpFvQy29nS16uuX7nHRtVKwuLawvFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKNgdEEmqtJVWd406wzdZBYOcUEpjTmaR3Cqw+B7r1hkEnqecHPXYBIMraGEael20v4DFJNSx2GYHpq/D7V9RnIPAv2CQpAYeTVM1IDy4wu/7FfRmfq6DBbmmSPFxxfmFi5myUbZQjOV9p6cr230MWUulS3fH0oRwsqJiF7rThwUfYjq1taSz3hfMstDzMF+eFf9cXxt8Z/tdjAYfuvyvcTmSRuIWTKdtp0kvY3XfMZfoO3+BvQXFpbPT7KYdQgDwygZFpClhSxP2AAGAuIIYh90fvsISDDaRFrSsHz/IrIC1S4Q/qaPRmWz//QM4MCyBENVYkpr2R81Msv3QaDMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXTuCDG76ptZF4VkFWskK6ROg5SgG5ZycKXQd2jhyio=;
 b=o76IzQTGyKp7Q8uMzj4iWBlOiA4GMwD7RkP7Lct2cKvzCBc2Io4DdsY0IV0rkM0WcoP6s9NE3QqjK/mLB+QKWNwp2SnKQ9w+Fo3xyl3AHBZ2CoEn9LlFuVBZaKMwM+hlwvk71yb2sel1LWqEewiAfJJD8aJcZ7tTWQJTrY2VvyDVdh5lh/ujMmzQhm+FqvFC3bnxw3AayieVokOHrAu1W7wZJzcrPoT9iKuyU8U54CGLbFcPJoagM4Y5YaWHg8Mvufy1W3lDBSXQXEYkwdoJw946HP3BP7ysbRo1D8VRy65Riac9x3tAtBCs7rFVI8jfuqqZSURolKg1debXiawRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19) by
 TYSPR06MB6971.apcprd06.prod.outlook.com (2603:1096:400:469::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Mon, 16 Mar
 2026 06:48:35 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::ca) by SG2P153CA0032.outlook.office365.com
 (2603:1096:4:c7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.4 via Frontend Transport; Mon,
 16 Mar 2026 06:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 06:48:32 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6FD4D4126F86;
	Mon, 16 Mar 2026 14:48:31 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v2 0/2] usb: cdns3: USBSSP platform driver support
Date: Mon, 16 Mar 2026 14:48:29 +0800
Message-ID: <20260316064831.274865-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|TYSPR06MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8cb184-c8b4-4133-8f27-08de83280a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	oN5zgAYI5PaUBznm8MvU7vqiO83mVWDUR8iJOpGsMaHLRKQTxxHeowfAxxlH51FE2oAJa5fs0tf66Y0tOrRjz0CHd1ORSg0NRXTUZScqIN7rzUyIbp+mE2Xdi0+ang1JaBkj/wU+MT2z+xUxWqVVw2pRalKVAgrZSzIEMptCglvO9InqFccVQn8xUeztAIQ7TZFEvL9WLOjP/5GHSh7thTTRIgyubT83CPk53Aq58DKHIgyK+B4gXbqkvC5gWTbooomGZFu4fZx6qNYOFq9YR5XSSN3yVl/+5QDrOoUIuoTbAyKJdWJCUbwc3pcrlSjAk3R+AJZy7TynDiSMTmB+FmrNaJ9ypn1bR4z/kAubZ3yzzAvH+/60FqWgMavUgDJvkYSS1fPtW/latBuw2O8cTWtc4G51ExNda3sFnunQQwO1DR3NGMVukBf5DPHkAAbdmlj/iE0AkiDRO7XE6GVS55DfWQ0P3M9KjyCA5MOgl8hIYbjLGR/DXiSw8h1c3qx4RpXDdX6pDB/B0tjl/FgBsRI+r6DpnGeM11VoX5LnCllERiUcs/fwuvK3n33IIgcsfrz8NNcp9cEwWP6rjTyFiwoxqdFA7rpVrxH6Qw1PlZ70lVwAiH9PAirZ721zP7KgwZQE8ry4QJNfakIPaPN+ZVKtP4dWUQv26tCMAMPkGo2MxOv0WQN5tncDlOGWXfzLSUlnX1BKdryBHcZGmD0+VbipOE9LiXvDokQ0PCv3Qgf3nRJnLyrPFWiRKEowX2S9XTp6jOKA7yl9tqvHGbfJvQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7/+Xc++bZQRRhQrAF3b5Gbo2VwqsH7KPrp/RExQSkwLsqA1A2Cjo7Oge7HbVwArFDzWbc62YzxVRRvYwWFF4ELBT6xWtpI0czSHgxj3KaTDpTGPyoV8PXtW0wAlHgmB4K4v455VtQvazNrjh4CbB7Mz+e5IIz58a8j3F7WzL3yI+kiubPyvfPW4il6TcoGwybX4JQH8cA4PnxJhVllnI+AhozQ7/j1S9s95bS4JDMwVq4xTfX6wBP2BMjVEdHEe4OHnBvfYDejN94CHFbzlb5yT+ewE4Nz7MaIdQPvIBj4XhqlX+dLPaun1oHUzHSFIDR5A/xfr6ADahPCufzKxYy7uWiAwyVFAAntI5BpV3sCZ3ufjc2R8c7Q4BzMt38y2rYcwS/rI/Ic7ggW01CmqFSyhP8Gt2/ib2+JQXaLnMlGhOhoQMbNvacm5IbCl0uqpL
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 06:48:32.9850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8cb184-c8b4-4133-8f27-08de83280a92
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6971
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34844-lists,linux-usb=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	DMARC_NA(0.00)[cixtech.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.875];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 801A4295447
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds platform driver support for the Cadence USBSSP (CDNSP)
controller, which was previously only accessible through PCI.

The USBSSP controller is auto-detected at runtime by reading the DRD/OTG
Device ID register, so no additional DT compatible string is needed — both
USBSS and USBSSP use "cdns,usb3".

Changes since v1:
- Update DT binding: keep compatible as "const: cdns,usb3", add
  description and super-speed-plus to maximum-speed, drop separate
  USBSSP example.
- Drop "cdns,usbssp" compatible string; Auto-detect the controller version
  (USBSS vs USBSSP) at runtime by reading the DRD/OTG Device ID register
  in cdns_drd_init(), and select the appropriate gadget init function
  (cdns3_gadget_init or cdnsp_gadget_init) based on cdns->version.
  This follows the same pattern already used for host initialization.
  (Comments from: Pawel Laszczak, Krzysztof Kozlowski)
- Export cdns_core_init_role and re-orginize the function cdns_init, and
  controller version could be gotten before the gadget init function is
  decided per controller.
- Fix PLAT_DRIVER_NAME in cdnsp-pci.c from "cdns-usbssp" to "cdns-usb3"
  to match the platform driver name. (Comments from Pawel Laszczak)
- Remove unnecessary MODULE_ALIAS("platform:cdnsp"). (Comments from Krzysztof Kozlowski)
- Build cdns3-plat.o as a standalone module instead of bundling it into
  cdns-usb-common, so that 'make modules_install' works correctly.
  (Comments from Pawel Laszczak)
- Regroup USBSSP and CDNS3 Kconfig options under the USB_CDNS_SUPPORT
  menu so they appear properly grouped in menuconfig. (Comments from Pawel Laszczak)
- Add Assisted-by tag per Documentation/process/coding-assistants.rst.
  Since the checkpatch.pl can't support this, it is added at context.

Peter Chen (2):
  dt-bindings: usb: cdns,usb3: document USBSSP controller support
  usb: cdns3: Add USBSSP platform driver support

 .../devicetree/bindings/usb/cdns,usb3.yaml    |  10 +-
 drivers/usb/cdns3/Kconfig                     |  50 ++--
 drivers/usb/cdns3/Makefile                    |  30 +--
 drivers/usb/cdns3/cdns3-gadget.c              |   4 +
 drivers/usb/cdns3/cdns3-plat.c                |  17 +-
 drivers/usb/cdns3/cdnsp-gadget.c              |   4 +
 drivers/usb/cdns3/cdnsp-pci.c                 | 217 ++++++++----------
 drivers/usb/cdns3/core.c                      |  11 +-
 drivers/usb/cdns3/core.h                      |   5 +-
 drivers/usb/cdns3/gadget-export.h             |   4 +-
 10 files changed, 172 insertions(+), 180 deletions(-)

-- 
2.50.1


