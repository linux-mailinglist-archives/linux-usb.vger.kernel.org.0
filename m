Return-Path: <linux-usb+bounces-36372-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACf8CZzi5mmr1gEAu9opvQ
	(envelope-from <linux-usb+bounces-36372-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 04:36:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BD4435862
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 04:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4566301F9D1
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 02:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8746280329;
	Tue, 21 Apr 2026 02:35:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022127.outbound.protection.outlook.com [40.107.75.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715F5242D67;
	Tue, 21 Apr 2026 02:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738907; cv=fail; b=IMv8T0Hr6qpt8hG0zUa1WUtBiqMDOy4iQSc+C5R20yy+mW3Ed6YI95u1vRFfluEwmiNu1jacHMK+ajEItbf2qwIKOxm8R5HD81Uw9ZX92t3Y70OrVn8MoR0cmLyIxtW53avx8CtrE1C1E08suYpod7xI55w/A3fw7iFEjuzzG4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738907; c=relaxed/simple;
	bh=4yPi1kJ3h4w/pvKqYuA29bVzO4lpXzs435YQUSAKy9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zi/O/nhHklWiMg7sC5drhg3+K7Ct7/NBikXIxX1RcPVx56RMs91QQE/cS34fd1G6PMDQMAoICfUD6Lh8pWEzISu/Sf19BJaVreUKuN9j9d4NODkTahVehhJtmsR9ryASKXqx+3MH/IPb/s9jr+d9rShxKPmcceHmTaCqxuIIoZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzYRjVvbxr3xl8NMV0+Ar76vRwAPO+t0ifpbENbNnN9sv2mp/UX4z7SBz54+/vHfrahSwZjH5yP25CCkY2Z7AiUbL24IVvguAhJV1ePiizX1TdvYZRjExf6HUTI89yQN+VhfvICxWvlT+RAUwPSyYSXoDkbc75loT7vthEXgpjO7RitD8+/pFvVygwCDhY/GNY7e6KiK+L9woklhcPBKF6HxbGuVWSCsi1uE6f1EEdVOpGI0AlTAMeV4EBvA8BBSg6YeleP5knmVLV9ZYdM1o5yz+wm3HUkisyxfvzjOvVmwz1WaTeRjJ50hZGChTR7QOc+IcGaU6hGiLHmTxy63Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fcw9HdpdZhZxreJQ5CNFu0Y9x+TPNxuX0hDC1J+8fn0=;
 b=V+6dwSki+v/sKOowSwiYYFGARy6wj6Ws5fo2v/1vzkpNhsFWnjf/7m09pDv2/1W8VOkldKodJG32iRcdMiPLi25E00ahP0DFQ1N3+D1d6Gov6gMcSbJ9Ti/uv8ZAbO5JPxVA4+w7//kvwESChdGiEXmtcd7RAWQTYv2Qultuq4mRFLJKi1zGORva25acSwm39NneVCQ6E82a4IyM/g6FZ+gF3mnVs/xazGc9GZS9em+HIOIQYXqc5EXOyYV1qFa+/JuBQeO7NHU+2lMPG2ACmSBKUL3qz4ouoKjObcmtKWo09lVy6ppJaDFuAXAOWLSP929PEDiOsgKhIxnjm/MaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0009.apcprd02.prod.outlook.com (2603:1096:4:194::11)
 by KL1PR06MB6555.apcprd06.prod.outlook.com (2603:1096:820:f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 02:35:01 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::48) by SI2PR02CA0009.outlook.office365.com
 (2603:1096:4:194::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 02:35:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 02:35:00 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 63B554079A20;
	Tue, 21 Apr 2026 10:34:59 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v3 0/2] usb: cdns3: USBSSP platform driver support
Date: Tue, 21 Apr 2026 10:34:57 +0800
Message-ID: <20260421023459.506145-1-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KL1PR06MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: 149167b3-5e92-4d73-6dda-08de9f4e95e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|7416014|1800799024|56012099003|18002099003|11006099003;
X-Microsoft-Antispam-Message-Info:
	lJPpwHhVYzZgTCV+rgD1iUvBt07kDCrmRKkUVDVnRR5AjiOow3C89ka9bpYzFJyDHC0H9BMvVCxyXdRQxkqCtjCTpW3jsUJ/C/LBrrR/bxjLVcr6K2fHpUFkFYlzefoEHAFXyMZ8cYMzYNO0SvX4piQhI2pulOm9KfwlutzIun23bDpk3MTB+IwKbTQZuNUVpQuWK6Ba4sv2xjUnpc4RsSTEbKTpV9vd/1eneY6j3X8+D8h+QuwfJ7tqgvqt7Jn5Hqqs3JDovfGhAYhgheI/mlhv+cyQ0LqIrchm3zKOIc7gT+RD4C0KqvmA+gUJtBe8woiUYRjzcoLg3mujgKVrIFzm1YhVBXNc5YLlf/I0zXc5I4/DcYIfnQu3k31CbP/AQ3Q0BXIv73w/9oxDLxD5IJ7oEjn+6CU1tsDCgnljSjxhSG3lTkUDzx6CfwxjtRKAJqI51pv0GsXKaY/Rb3a6y/dLTlniUPkfAYWFtUyM/y8XZcGTkxASnkFk1nRveAHvoDgwdTFaWH3O30xeUBcrVIS97a0JulVXOKux9vSPwXR8wmuD8cUuLzHiTr27WpAW3Kfp/i6hkvHKVSp4z4CqJqPbxapZIXvFgIhGNqjHsP7N8dl4ZvEhMsUr0Zgc0RgUxGjjqsk1f11rQcgHmn1XHKba1BlAj/S6HouD1PcWmm/FK583fpWt4Bw2dMExpxUtI7GCyqMOCjS2U3e6VnvetSikfZwKPCg9gcYNTgsuxhv0ZWMqyAW84ETvXEKONHdtLsItfyFtou74qAlR4n1Rdg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(7416014)(1800799024)(56012099003)(18002099003)(11006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yyor9QaIACsX7z28nsFKWJ3zcajgMhOjHa99VDNtocdfV3dLmt/KQe71WHGE+sRwz0wHMbqdU+Sjbht80yy9XA9QF7WgJUjqnzbe/AEPlH2szLh4bsfPhz6QoPERqhikXExWx+qHeXfJpp0EmX/EEvuUiolf9lZ7TdCYd6hmFFQqKgwYyh2m8mNtX5cInrK8Z7dR41gH6mJq6NEoBrsGEh/eTaSAAyCusKzvvgR//tuBuYhAWmFm7mSkMPkYmZkzhcjwbFKye9+NKVitywuSqv6ipdMzOsXx/n9ZiSnoAw7P47cmlBeTbqRhIyJpgiB5f/HV5X3TFcSKs+OH5LgQy8y4EJQ2bhniuouyuOKl6W4QwEWERS602WAzjOc/sRw5qJaIDy0TkOV8nZCCmkW0TR2wSGlvq4uuTUIMJA2g3KR+riT7YhlB3s38iqVR9RYn
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 02:35:00.2127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 149167b3-5e92-4d73-6dda-08de9f4e95e6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6555
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-36372-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[cixtech.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cixtech.com:mid]
X-Rspamd-Queue-Id: 86BD4435862
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds platform driver support for the Cadence USBSSP (CDNSP)
controller, which was previously only accessible through PCI.  The USBSSP
controller is auto-detected at runtime by reading the DRD/OTG Device ID
register; both USBSS and USBSSP use the "cdns,usb3" compatible string
(binding update in patch 1).

Changes since v2 (vs the v2 series on list)

v2 split CONFIG_USB_CDNSP into its own cdnsp.ko-style path and built
cdns3-plat as a standalone module next to cdns-usb-common.  v3 folds the
integration back into one driver module:

 - Single cdns.ko (CONFIG_USB_CDNS3) bundles core, DRD, the generic
   cdns3-plat binding, optional host.o (CONFIG_USB_CDNS3_HOST) and optional
   gadget objects (CONFIG_USB_CDNS3_GADGET).  SoC and PCI glue stay
   separate small .ko files.

 - CONFIG_USB_CDNS_SUPPORT depends on USB and USB_GADGET using the usual
   pattern (depends on USB || USB_GADGET; depends on USB if !USB_GADGET;
   depends on USB_GADGET if !USB) so the umbrella tracks host or gadget
   when either is built as a module (Suggested-by: Arnd Bergmann).

 - USB_CDNS3_HOST / USB_CDNS3_GADGET are matched to the cdns.ko tristate
   with USB=USB_CDNS3 and USB_GADGET=USB_CDNS3 instead of tying gadget
   only to CONFIG_USB_CDNS_SUPPORT, which mis-handled =y / =m splits when
   CONFIG_USB_CDNS_SUPPORT=y but CONFIG_USB_CDNS3=m.

 - Drop CONFIG_USB_CDNS_HOST; Makefile and host-export.h use
   CONFIG_USB_CDNS3_HOST only.

 - gadget-export.h uses IS_ENABLED(CONFIG_USB_CDNS3_GADGET) for stubs now
   that gadget is a bool compiled into the unified module (v2 used
   IS_REACHABLE on separate CONFIG_USB_CDNS3 / CONFIG_USB_CDNSP tristates).

 - Patch 2 still refactors cdnsp-pci.c into a PCI-to-platform wrapper,
   keeps host_init / gadget_init callbacks, exports cdns_core_init_role,
   and limits drivers/usb/cdns3/ to CONFIG_USB_CDNS_SUPPORT.

 - Add Rob Herring's ACK for Patch 1.

Build verification

Exhaustive Kconfig sweep: 79 unique resolved configurations (deduped on
CONFIG_USB, CONFIG_USB_GADGET, CONFIG_USB_CDNS_SUPPORT,
CONFIG_USB_CDNS3_HOST, CONFIG_USB_CDNS3, CONFIG_USB_CDNSP_PCI,
CONFIG_USB_CDNS3_GADGET), arm64 cross-build, each run through
make O=out/cix olddefconfig, then Image + modules, then modules_install
into a clean INSTALL_MOD_PATH:

	PASS 79 / 79; build failures 0; depmod / module graph failures 0.

Peter Chen (2):
  dt-bindings: usb: cdns,usb3: document USBSSP controller support
  usb: cdns3: Add USBSSP platform driver support

 .../devicetree/bindings/usb/cdns,usb3.yaml    |  10 +-
 drivers/usb/Makefile                          |   2 -
 drivers/usb/cdns3/Kconfig                     | 112 ++++-----
 drivers/usb/cdns3/Makefile                    |  44 ++--
 drivers/usb/cdns3/cdns3-gadget.c              |   1 +
 drivers/usb/cdns3/cdns3-plat.c                |  27 ++-
 drivers/usb/cdns3/cdnsp-gadget.c              |   1 +
 drivers/usb/cdns3/cdnsp-pci.c                 | 217 ++++++++----------
 drivers/usb/cdns3/core.c                      |  45 ++--
 drivers/usb/cdns3/core.h                      |   5 +-
 drivers/usb/cdns3/gadget-export.h             |  10 +-
 drivers/usb/cdns3/host-export.h               |   4 +-
 12 files changed, 209 insertions(+), 269 deletions(-)

-- 
2.50.1

