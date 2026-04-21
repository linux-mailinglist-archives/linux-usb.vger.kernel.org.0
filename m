Return-Path: <linux-usb+bounces-36373-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAR/Lbji5mmr1gEAu9opvQ
	(envelope-from <linux-usb+bounces-36373-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 04:36:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF4D435878
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 04:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61BB03025936
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 02:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396F32848AA;
	Tue, 21 Apr 2026 02:35:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023143.outbound.protection.outlook.com [40.107.44.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E46426B2DA;
	Tue, 21 Apr 2026 02:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738908; cv=fail; b=sL6AZFGQBxHn2N37+nww1NoD9vgB4XWMyMgDcM8pak8LqXWNPBz3JpGi2EFNJVke9Fva5AR3kgQYhkE/plKNqDBhEFphLqNSXMw9aqNBUGqYYQH7W07uY/zrRlDWBQaK7MflH6ACAcjIigpBYYyXETcKa1dX8rjpo9gSdrncx1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738908; c=relaxed/simple;
	bh=i4oLQRrnRlKJJj3n6/ng87Uso2Y50aO03Q6DTbu0csA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HXz4HAUXU76zzrlznBnLYL3lTeUxAAbGP3Ncys0yxr+Ad4ONdV+bWZpzmEsmbA05QNIMsD1/oPaPd73lwza2wG6YQ4N1ny2syo95TAxKkLC7q7yWw+28wrX5r7CT7AfgsasI5cBwEzm+5xoPFvrgAiPW82YScsnHs3+5favr5D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eccoHrZdmWqbx9Sx8wzdFD/7aK6UhnINVoFt1s41v6c/37KLYXC2ETqiXTD5lhl/74b6nbusLzXfsyDYd81PQ8dH5BzG2aRHY7hDGPFaH7sPdxeGuDrFYvr0LzByvj6njyAbx59raNC2m7meJXoT2pJsfp2rs2ES8iHconGnrBpW3nWtY2qG9GNyZXlh4mc5+9ZQi9ULDqHWhCm7fJ6YydFE2CDYw+eIbkxrh2dTlLiB2yQqWliWC7TxBoSg1VsrSBUqJ60GWpNxdt4rEN00wQNvcITKa0fSI1EoLauzjOzCZJTFRvPSGLpkAU9hxh3lukPbPi4OYvYcTOgVIJNfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHjZlP1FEE94NuwAMhtnsvIVODM8aP6ZvzcYOFZiqZ4=;
 b=yIfhnJRq2FRYccylEuV9VqiyN1unpc8uaE+MUvB6rRQoJo/17NQbFlmlw+7pshK3chMz1F885bQ+pobwgeTr9TfuYk80lUY4Z6zPgRY3+47UW4bLEeulc7b5SWoAEFd+CnLGS7xrzXINfwXuC3Xe3QHRwBWNQKhurS26chii4MaORLmHgde8zCVX7hts43oOH4t9P1IGj8vNxQA6OfVNpcaS/biDJo1VBOose9Vf8fAELn4cUS58vcm0ebyfxejSOYjv9tOoARGYcg6CxrnMZ9wwcpMrbrjlvgbNTmwvwHMr/X206Tm0o4ipPneVP+XL0bvP2d9iWeZr2VGZKGaDwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::6) by
 TY0PR06MB5403.apcprd06.prod.outlook.com (2603:1096:400:218::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 02:35:01 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::ab) by PUZP153CA0001.outlook.office365.com
 (2603:1096:301:c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.14 via Frontend Transport; Tue,
 21 Apr 2026 02:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 02:35:00 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 775354126F9E;
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
Subject: [PATCH v3 2/2] usb: cdns3: Add USBSSP platform driver support
Date: Tue, 21 Apr 2026 10:34:59 +0800
Message-ID: <20260421023459.506145-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260421023459.506145-1-peter.chen@cixtech.com>
References: <20260421023459.506145-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|TY0PR06MB5403:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: df259195-3bfc-4491-54c5-08de9f4e9659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h5hkrh3ic9zt+vaJQPKPpIr5oX1yiEzI9U1LbV9rLjK70hM3r7vRoIDhHwIshsi8HpxiTxUSExxHMk5zzNnJqrQSpZPreLZHWtvDWfCTKts9Jan7/RKgYdtkH09lP1qyrhndCIrmxU5hmhR1hKPbSh854rI94XUDfNUsglitBKBtVjjXtNeG0hcSWcQgLd9BPanjtznk5ZZh5QDKgQZ0nTE/sutQvn+waJq9ptokvZIKBAzQPJJyHARXMjzNRZ6GW24SbngMqb+K9Q9M/VdPyT1U0mqJFURVCk7HcZDyy+3F5V1ZwceVzqXWhWDxR3ADW9/+Aq8LIY9W/K4Eeh5OmKKvRonHOmPDa9GBadY8SXDUbu/uNT8GHrYeaO3ywo+PZpZk9LB85SQvqVwhoAjotK1jgRchpbWRNZRal13K9kOo/faCg0i8PzZK5k9+TMxDBCitjlyTnHYPqtQRRUK4DrTJ2sphpjrkVUnrQf8Zi7dOWK0hWd6uSkIYx607iv1JyjfydsU5Zewp67sCfgvYbKjS+0xoqDiZZ2u3UOAeCAwuw4YRQGEDwdfzrD/X8rgQk/RCbUelapi9XjpXBvujNYPsa38wLnMqdbSBn8l7JR7/vADp6EY68lL0/tBsFn3VKJvFdn0cGcLClx468aL8MhyJLW6FezljN9n8+P2XCdGDrIz4BSUZN6pQ0TWqkts6Uul8DWoEwT73PANwpsKmDz3VFCZthltiysszU+5h6qwCmgtvat8dicF5UxI2rDy1tjoCY/mO06LN9Q6Ew5rp1A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E5Tk1ptOwGfx6mwIuQnCs6FB0/Vg5ff4254IFNz2G7TSoeh+EduvJq1jHOQDcIvCNjVrd00St3kvWGOosQNms7uPsV71de9TULFwfJCFUAhXfhBTxePHre2Z9e2izXs0H7A7kz2cKjCcmrSpuokAEuhCHoyjpK0y3PbC0w07rV7pQVbNXkivy/CxyuFJ99Z7E+LryMM0LkhwX35xGQYPLuspkQj7CsmWfoPK+dARRZd8R89zCnp5ka0HBXZR5SFzj15sZUYr4mYN90UYTy/1L1CqC0YjJASyiaq9Oy0p9QPvLY7OGYEGUvtUsQXarMLkvpn/WLl2JgeIttUOzJ83t3uq5aaha5uqwvj26hMSXmEiPQn377N90yfpKdwaeIUkxLGW0ClqsPMcIstAwRzMu2D9z9h+v2g7qQF81aS71zSlmYMlh8+91Bs5a1/Sgyym
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 02:35:00.8118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df259195-3bfc-4491-54c5-08de9f4e9659
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5403
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36373-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[cixtech.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email,plat_info.data:url,cixtech.com:mid,cixtech.com:email,arndb.de:email,plat_info.name:url]
X-Rspamd-Queue-Id: 0FF4D435878
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Expose Cadence USBSSP through the same platform path as USBSS, trim
Kconfig and Makefile: one core loadable object plus separate glue .ko
files.

Single cdns.ko bundles core, DRD, the generic "cdns,usb3" platform
driver in cdns3-plat.c, optional host.o, and optional gadget objects.
Use CONFIG_USB_CDNS3_GADGET as a bool to compile gadget support into
that module. Remove duplicate MODULE_* declarations from cdns3-plat.c
now that it links into the same module.

Kconfig: the generic platform driver is selected via CONFIG_USB_CDNS3.
Move CONFIG_USB_CDNSP_PCI beside CONFIG_USB_CDNS3_PCI_WRAP under
"Platform glue driver support". SoC glue entries (TI, i.MX, StarFive)
depend only on CONFIG_USB_CDNS3.

Tighten CONFIG_USB_CDNS_SUPPORT dependencies so the umbrella follows
host or gadget when either is built as a module. Match host and gadget
bools to the cdns.ko tristate with USB=USB_CDNS3 and USB_GADGET=USB_CDNS3
instead of comparing against USB_CDNS_SUPPORT.

Link host.o when CONFIG_USB_CDNS3_HOST is enabled and use that symbol in
host-export.h, removing the redundant CONFIG_USB_CDNS_HOST indirection.

Export cdns_core_init_role and reorganize the function cdns_init, and
controller version could be gotten before the gadget init function is
decided per controller.

Keep host_init / gadget_init callbacks in struct cdns, so core.c does
not need direct linkage to host or gadget objects. Refactor cdnsp-pci.c
into a thin PCI-to-platform wrapper.

drivers/usb/Makefile: descend into drivers/usb/cdns3/ only when
CONFIG_USB_CDNS_SUPPORT is enabled.

Assisted-by: Cursor:claude-4.6-opus
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 drivers/usb/Makefile              |   2 -
 drivers/usb/cdns3/Kconfig         | 112 +++++++--------
 drivers/usb/cdns3/Makefile        |  44 +++---
 drivers/usb/cdns3/cdns3-gadget.c  |   1 +
 drivers/usb/cdns3/cdns3-plat.c    |  27 +++-
 drivers/usb/cdns3/cdnsp-gadget.c  |   1 +
 drivers/usb/cdns3/cdnsp-pci.c     | 217 +++++++++++++-----------------
 drivers/usb/cdns3/core.c          |  45 ++-----
 drivers/usb/cdns3/core.h          |   5 +-
 drivers/usb/cdns3/gadget-export.h |  10 +-
 drivers/usb/cdns3/host-export.h   |   4 +-
 11 files changed, 201 insertions(+), 267 deletions(-)

diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 6f3c86149887..eecbd631fdab 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -14,8 +14,6 @@ obj-$(CONFIG_USB_DWC2)		+= dwc2/
 obj-$(CONFIG_USB_ISP1760)	+= isp1760/
 
 obj-$(CONFIG_USB_CDNS_SUPPORT)	+= cdns3/
-obj-$(CONFIG_USB_CDNS3)		+= cdns3/
-obj-$(CONFIG_USB_CDNSP_PCI)	+= cdns3/
 
 obj-$(CONFIG_USB_FOTG210)	+= fotg210/
 
diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 0a514b591527..39ad23d1ada8 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -1,6 +1,9 @@
 config USB_CDNS_SUPPORT
 	tristate "Cadence USB Support"
-	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
+	depends on USB_SUPPORT && HAS_DMA
+	depends on USB || USB_GADGET
+	depends on USB if !USB_GADGET
+	depends on USB_GADGET if !USB
 	select USB_XHCI_PLATFORM if USB_XHCI_HCD
 	select USB_ROLE_SWITCH
 	help
@@ -8,44 +11,49 @@ config USB_CDNS_SUPPORT
 	  dual-role controller.
 	  It supports: dual-role switch, Host-only, and Peripheral-only.
 
-config USB_CDNS_HOST
-	bool
-
 if USB_CDNS_SUPPORT
 
 config USB_CDNS3
-	tristate "Cadence USB3 Dual-Role Controller"
+	tristate "Cadence USB dual-role controller (USBSS and USBSSP)"
 	depends on USB_CDNS_SUPPORT
 	help
-	  Say Y here if your system has a Cadence USB3 dual-role controller.
-	  It supports: dual-role switch, Host-only, and Peripheral-only.
+	  Say Y or M here if your system has an on-chip Cadence USB
+	  dual-role controller. This covers both USBSS (USB 3.0) and
+	  USBSSP (SuperSpeed Plus) IP; the driver detects the variant at
+	  runtime.
 
-	  If you choose to build this driver is a dynamically linked
-	  as module, the module will be called cdns3.ko.
-endif
+	  The core driver (core, DRD, generic platform binding for the
+	  "cdns,usb3" device tree compatible, optional host and gadget)
+	  builds as one module named cdns.ko when built as a loadable
+	  module.
+
+	  It supports: dual-role switch, Host-only, and Peripheral-only.
 
 if USB_CDNS3
 
-config USB_CDNS3_GADGET
-	bool "Cadence USB3 device controller"
-	depends on USB_GADGET=y || USB_GADGET=USB_CDNS3
+config USB_CDNS3_HOST
+	bool "Cadence USB host controller (xHCI)"
+	depends on USB=y || USB=USB_CDNS3
 	help
-	  Say Y here to enable device controller functionality of the
-	  Cadence USBSS-DEV driver.
+	  Say Y here to enable host controller functionality for Cadence
+	  USBSS and USBSSP dual-role controllers.
 
-	  This controller supports FF, HS and SS mode. It doesn't support
-	  LS and SSP mode.
+	  The host controller is xHCI compliant and uses the standard
+	  xHCI driver.
 
-config USB_CDNS3_HOST
-	bool "Cadence USB3 host controller"
-	depends on USB=y || USB=USB_CDNS3
-	select USB_CDNS_HOST
+config USB_CDNS3_GADGET
+	bool "Cadence USB device controller (USBSS and USBSSP)"
+	depends on USB_GADGET=y || USB_GADGET=USB_CDNS3
 	help
-	  Say Y here to enable host controller functionality of the
-	  Cadence driver.
+	  Say Y here to include Cadence USB device (gadget) support for
+	  both USBSS (USB 3.0) and USBSSP (SuperSpeed Plus) IP in the
+	  cdns.ko module. The implementation is selected at runtime from
+	  the detected controller version.
 
-	  Host controller is compliant with XHCI so it will use
-	  standard XHCI driver.
+	  USBSS gadget supports FF, HS and SS mode (not LS or SSP).
+	  USBSSP gadget supports FF, HS, SS and SSP mode (not LS).
+
+comment "Platform glue driver support"
 
 config USB_CDNS3_PCI_WRAP
 	tristate "Cadence USB3 support on PCIe-based platforms"
@@ -58,6 +66,17 @@ config USB_CDNS3_PCI_WRAP
 	  If you choose to build this driver as module it will
 	  be dynamically linked and module will be called cdns3-pci.ko
 
+config USB_CDNSP_PCI
+	tristate "Cadence USBSSP support on PCIe-based platforms"
+	depends on USB_PCI && ACPI
+	default USB_CDNS3
+	help
+	  If you're using the USBSSP Core IP with a PCIe, please say
+	  'Y' or 'M' here.
+
+	  If you choose to build this driver as module it will
+	  be dynamically linked and module will be called cdnsp-pci.ko
+
 config USB_CDNS3_TI
 	tristate "Cadence USB3 support on TI platforms"
 	depends on ARCH_K3 || COMPILE_TEST
@@ -81,6 +100,7 @@ config USB_CDNS3_IMX
 config USB_CDNS3_STARFIVE
 	tristate "Cadence USB3 support on StarFive SoC platforms"
 	depends on ARCH_STARFIVE || COMPILE_TEST
+	default USB_CDNS3
 	help
 	  Say 'Y' or 'M' here if you are building for StarFive SoCs
 	  platforms that contain Cadence USB3 controller core.
@@ -89,45 +109,7 @@ config USB_CDNS3_STARFIVE
 
 	  If you choose to build this driver as module it will
 	  be dynamically linked and module will be called cdns3-starfive.ko
-endif
-
-if USB_CDNS_SUPPORT
-
-config USB_CDNSP_PCI
-	tristate "Cadence CDNSP Dual-Role Controller"
-	depends on USB_CDNS_SUPPORT && USB_PCI && ACPI
-	help
-	  Say Y here if your system has a Cadence CDNSP dual-role controller.
-	  It supports: dual-role switch Host-only, and Peripheral-only.
-
-	  If you choose to build this driver is a dynamically linked
-	  module, the module will be called cdnsp.ko.
-endif
-
-if USB_CDNSP_PCI
-
-config USB_CDNSP_GADGET
-	bool "Cadence CDNSP device controller"
-	depends on USB_GADGET=y || USB_GADGET=USB_CDNSP_PCI
-	help
-	  Say Y here to enable device controller functionality of the
-	  Cadence CDNSP-DEV driver.
-
-	  Cadence CDNSP Device Controller in device mode is
-	  very similar to XHCI controller. Therefore some algorithms
-	  used has been taken from host driver.
-	  This controller supports FF, HS, SS and SSP mode.
-	  It doesn't support LS.
-
-config USB_CDNSP_HOST
-	bool "Cadence CDNSP host controller"
-	depends on USB=y || USB=USB_CDNSP_PCI
-	select USB_CDNS_HOST
-	help
-	  Say Y here to enable host controller functionality of the
-	  Cadence driver.
 
-	  Host controller is compliant with XHCI so it uses
-	  standard XHCI driver.
+endif # USB_CDNS3
 
-endif
+endif # USB_CDNS_SUPPORT
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index 48dfae75b5aa..b2e4ba6a49a3 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -3,42 +3,28 @@
 CFLAGS_cdns3-trace.o				:= -I$(src)
 CFLAGS_cdnsp-trace.o				:= -I$(src)
 
-cdns-usb-common-y				:= core.o drd.o
-cdns3-y						:= cdns3-plat.o
+obj-$(CONFIG_USB_CDNS3)			+= cdns.o
 
-ifeq ($(CONFIG_USB),m)
-obj-m						+= cdns-usb-common.o
-obj-m						+= cdns3.o
-else
-obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns-usb-common.o
-obj-$(CONFIG_USB_CDNS3)				+= cdns3.o
-endif
+cdns-y					:= core.o drd.o cdns3-plat.o
+cdns-$(CONFIG_USB_CDNS3_HOST)		+= host.o
 
-cdns-usb-common-$(CONFIG_USB_CDNS_HOST) 	+= host.o
-cdns3-$(CONFIG_USB_CDNS3_GADGET)		+= cdns3-gadget.o cdns3-ep0.o
+ifneq ($(CONFIG_USB_CDNS3_GADGET),)
+cdns-y					+= cdns3-gadget.o cdns3-ep0.o \
+					   cdnsp-ring.o cdnsp-gadget.o \
+					   cdnsp-mem.o cdnsp-ep0.o
+endif
 
+ifneq ($(CONFIG_TRACING),)
 ifneq ($(CONFIG_USB_CDNS3_GADGET),)
-cdns3-$(CONFIG_TRACING)				+= cdns3-trace.o
+cdns-y					+= cdns3-trace.o cdnsp-trace.o
+endif
 endif
 
+##
+# Platform-specific glue layers (PCI wrappers, SoC integration)
+##
 obj-$(CONFIG_USB_CDNS3_PCI_WRAP)		+= cdns3-pci-wrap.o
+obj-$(CONFIG_USB_CDNSP_PCI)			+= cdnsp-pci.o
 obj-$(CONFIG_USB_CDNS3_TI)			+= cdns3-ti.o
 obj-$(CONFIG_USB_CDNS3_IMX)			+= cdns3-imx.o
 obj-$(CONFIG_USB_CDNS3_STARFIVE)		+= cdns3-starfive.o
-
-cdnsp-udc-pci-y					:= cdnsp-pci.o
-
-ifdef CONFIG_USB_CDNSP_PCI
-ifeq ($(CONFIG_USB),m)
-obj-m						+= cdnsp-udc-pci.o
-else
-obj-$(CONFIG_USB_CDNSP_PCI) 			+= cdnsp-udc-pci.o
-endif
-endif
-
-cdnsp-udc-pci-$(CONFIG_USB_CDNSP_GADGET)	+= cdnsp-ring.o cdnsp-gadget.o \
-						   cdnsp-mem.o cdnsp-ep0.o
-
-ifneq ($(CONFIG_USB_CDNSP_GADGET),)
-cdnsp-udc-pci-$(CONFIG_TRACING)			+= cdnsp-trace.o
-endif
diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index d59a60a16ec7..ff422e5204e4 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3508,3 +3508,4 @@ int cdns3_gadget_init(struct cdns *cdns)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cdns3_gadget_init);
diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 735df88774e4..3fe3109a3688 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -21,6 +21,7 @@
 
 #include "core.h"
 #include "gadget-export.h"
+#include "host-export.h"
 #include "drd.h"
 
 static int set_phy_power_on(struct cdns *cdns)
@@ -44,6 +45,19 @@ static void set_phy_power_off(struct cdns *cdns)
 	phy_power_off(cdns->usb2_phy);
 }
 
+static int cdns3_plat_gadget_init(struct cdns *cdns)
+{
+	if (cdns->version < CDNSP_CONTROLLER_V2)
+		return cdns3_gadget_init(cdns);
+	else
+		return cdnsp_gadget_init(cdns);
+}
+
+static int cdns3_plat_host_init(struct cdns *cdns)
+{
+	return cdns_host_init(cdns);
+}
+
 /**
  * cdns3_plat_probe - probe for cdns3 core device
  * @pdev: Pointer to cdns3 core platform device
@@ -64,6 +78,8 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 
 	cdns->dev = dev;
 	cdns->pdata = dev_get_platdata(dev);
+	if (cdns->pdata && cdns->pdata->override_apb_timeout)
+		cdns->override_apb_timeout = cdns->pdata->override_apb_timeout;
 
 	platform_set_drvdata(pdev, cdns);
 
@@ -143,12 +159,16 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_phy_power_on;
 
-	cdns->gadget_init = cdns3_gadget_init;
-
 	ret = cdns_init(cdns);
 	if (ret)
 		goto err_cdns_init;
 
+	cdns->gadget_init = cdns3_plat_gadget_init;
+	cdns->host_init = cdns3_plat_host_init;
+	ret = cdns_core_init_role(cdns);
+	if (ret)
+		goto err_cdns_init;
+
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -336,6 +356,3 @@ static struct platform_driver cdns3_driver = {
 module_platform_driver(cdns3_driver);
 
 MODULE_ALIAS("platform:cdns3");
-MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Cadence USB3 DRD Controller Driver");
diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index 6b3815f8a6e5..18e872ad29bd 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -2075,3 +2075,4 @@ int cdnsp_gadget_init(struct cdns *cdns)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cdnsp_gadget_init);
diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
index 566d94e49102..432007cfe695 100644
--- a/drivers/usb/cdns3/cdnsp-pci.c
+++ b/drivers/usb/cdns3/cdnsp-pci.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Cadence PCI Glue driver.
+ * Cadence USBSSP PCI Glue driver.
  *
  * Copyright (C) 2019 Cadence.
  *
@@ -16,7 +16,19 @@
 #include <linux/pci.h>
 
 #include "core.h"
-#include "gadget-export.h"
+
+struct cdnsp_wrap {
+	struct platform_device *plat_dev;
+	struct resource dev_res[6];
+	int devfn;
+};
+
+#define RES_IRQ_HOST_ID		0
+#define RES_IRQ_PERIPHERAL_ID	1
+#define RES_IRQ_OTG_ID		2
+#define RES_HOST_ID		3
+#define RES_DEV_ID		4
+#define RES_DRD_ID		5
 
 #define PCI_BAR_HOST		0
 #define PCI_BAR_OTG		0
@@ -26,16 +38,16 @@
 #define PCI_DEV_FN_OTG		1
 
 #define PCI_DRIVER_NAME		"cdns-pci-usbssp"
-#define PLAT_DRIVER_NAME	"cdns-usbssp"
+#define PLAT_DRIVER_NAME	"cdns-usb3"
 
-#define CHICKEN_APB_TIMEOUT_VALUE       0x1C20
+#define CHICKEN_APB_TIMEOUT_VALUE	0x1C20
 
 static struct pci_dev *cdnsp_get_second_fun(struct pci_dev *pdev)
 {
 	/*
 	 * Gets the second function.
-	 * Platform has two function. The fist keeps resources for
-	 * Host/Device while the secon keeps resources for DRD/OTG.
+	 * Platform has two function. The first keeps resources for
+	 * Host/Device while the second keeps resources for DRD/OTG.
 	 */
 	if (pdev->device == PCI_DEVICE_ID_CDNS_USBSSP)
 		return pci_get_device(pdev->vendor, PCI_DEVICE_ID_CDNS_USBSS, NULL);
@@ -48,11 +60,12 @@ static struct pci_dev *cdnsp_get_second_fun(struct pci_dev *pdev)
 static int cdnsp_pci_probe(struct pci_dev *pdev,
 			   const struct pci_device_id *id)
 {
-	struct device *dev = &pdev->dev;
-	struct pci_dev *func;
+	struct platform_device_info plat_info;
+	static struct cdns3_platform_data pdata;
+	struct cdnsp_wrap *wrap;
 	struct resource *res;
-	struct cdns *cdnsp;
-	int ret;
+	struct pci_dev *func;
+	int ret = 0;
 
 	/*
 	 * For GADGET/HOST PCI (devfn) function number is 0,
@@ -79,146 +92,105 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
 	}
 
 	pci_set_master(pdev);
+
 	if (pci_is_enabled(func)) {
-		cdnsp = pci_get_drvdata(func);
+		wrap = pci_get_drvdata(func);
 	} else {
-		cdnsp = kzalloc_obj(*cdnsp);
-		if (!cdnsp) {
+		wrap = kzalloc_obj(*wrap);
+		if (!wrap) {
 			ret = -ENOMEM;
 			goto put_pci;
 		}
 	}
 
-	/* For GADGET device function number is 0. */
-	if (pdev->devfn == 0) {
-		resource_size_t rsrc_start, rsrc_len;
-
-		/* Function 0: host(BAR_0) + device(BAR_1).*/
-		dev_dbg(dev, "Initialize resources\n");
-		rsrc_start = pci_resource_start(pdev, PCI_BAR_DEV);
-		rsrc_len = pci_resource_len(pdev, PCI_BAR_DEV);
-		res = devm_request_mem_region(dev, rsrc_start, rsrc_len, "dev");
-		if (!res) {
-			dev_dbg(dev, "controller already in use\n");
-			ret = -EBUSY;
-			goto free_cdnsp;
-		}
-
-		cdnsp->dev_regs = devm_ioremap(dev, rsrc_start, rsrc_len);
-		if (!cdnsp->dev_regs) {
-			dev_dbg(dev, "error mapping memory\n");
-			ret = -EFAULT;
-			goto free_cdnsp;
-		}
-
-		cdnsp->dev_irq = pdev->irq;
-		dev_dbg(dev, "USBSS-DEV physical base addr: %pa\n",
-			&rsrc_start);
-
-		res = &cdnsp->xhci_res[0];
-		res->start = pci_resource_start(pdev, PCI_BAR_HOST);
-		res->end = pci_resource_end(pdev, PCI_BAR_HOST);
-		res->name = "xhci";
-		res->flags = IORESOURCE_MEM;
-		dev_dbg(dev, "USBSS-XHCI physical base addr: %pa\n",
-			&res->start);
-
-		/* Interrupt for XHCI, */
-		res = &cdnsp->xhci_res[1];
-		res->start = pdev->irq;
-		res->name = "host";
-		res->flags = IORESOURCE_IRQ;
+	res = wrap->dev_res;
+
+	if (pdev->devfn == PCI_DEV_FN_HOST_DEVICE) {
+		/* Function 0: host(BAR_0) + device(BAR_2). */
+		dev_dbg(&pdev->dev, "Initialize Device resources\n");
+		res[RES_DEV_ID].start = pci_resource_start(pdev, PCI_BAR_DEV);
+		res[RES_DEV_ID].end = pci_resource_end(pdev, PCI_BAR_DEV);
+		res[RES_DEV_ID].name = "dev";
+		res[RES_DEV_ID].flags = IORESOURCE_MEM;
+		dev_dbg(&pdev->dev, "USBSSP-DEV physical base addr: %pa\n",
+			&res[RES_DEV_ID].start);
+
+		res[RES_HOST_ID].start = pci_resource_start(pdev, PCI_BAR_HOST);
+		res[RES_HOST_ID].end = pci_resource_end(pdev, PCI_BAR_HOST);
+		res[RES_HOST_ID].name = "xhci";
+		res[RES_HOST_ID].flags = IORESOURCE_MEM;
+		dev_dbg(&pdev->dev, "USBSSP-XHCI physical base addr: %pa\n",
+			&res[RES_HOST_ID].start);
+
+		/* Interrupt for XHCI */
+		wrap->dev_res[RES_IRQ_HOST_ID].start = pdev->irq;
+		wrap->dev_res[RES_IRQ_HOST_ID].name = "host";
+		wrap->dev_res[RES_IRQ_HOST_ID].flags = IORESOURCE_IRQ;
+
+		/* Interrupt for device. It's the same as for HOST. */
+		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].start = pdev->irq;
+		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].name = "peripheral";
+		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].flags = IORESOURCE_IRQ;
 	} else {
-		res = &cdnsp->otg_res;
-		res->start = pci_resource_start(pdev, PCI_BAR_OTG);
-		res->end =   pci_resource_end(pdev, PCI_BAR_OTG);
-		res->name = "otg";
-		res->flags = IORESOURCE_MEM;
-		dev_dbg(dev, "CDNSP-DRD physical base addr: %pa\n",
-			&res->start);
+		res[RES_DRD_ID].start = pci_resource_start(pdev, PCI_BAR_OTG);
+		res[RES_DRD_ID].end = pci_resource_end(pdev, PCI_BAR_OTG);
+		res[RES_DRD_ID].name = "otg";
+		res[RES_DRD_ID].flags = IORESOURCE_MEM;
+		dev_dbg(&pdev->dev, "CDNSP-DRD physical base addr: %pa\n",
+			&res[RES_DRD_ID].start);
 
 		/* Interrupt for OTG/DRD. */
-		cdnsp->otg_irq = pdev->irq;
+		wrap->dev_res[RES_IRQ_OTG_ID].start = pdev->irq;
+		wrap->dev_res[RES_IRQ_OTG_ID].name = "otg";
+		wrap->dev_res[RES_IRQ_OTG_ID].flags = IORESOURCE_IRQ;
 	}
 
-	/*
-	 * Cadence PCI based platform require some longer timeout for APB
-	 * to fixes domain clock synchronization issue after resuming
-	 * controller from L1 state.
-	 */
-	cdnsp->override_apb_timeout = CHICKEN_APB_TIMEOUT_VALUE;
-	pci_set_drvdata(pdev, cdnsp);
-
 	if (pci_is_enabled(func)) {
-		cdnsp->dev = dev;
-		cdnsp->gadget_init = cdnsp_gadget_init;
-
-		ret = cdns_init(cdnsp);
-		if (ret)
-			goto free_cdnsp;
+		/* set up platform device info */
+		pdata.override_apb_timeout = CHICKEN_APB_TIMEOUT_VALUE;
+		memset(&plat_info, 0, sizeof(plat_info));
+		plat_info.parent = &pdev->dev;
+		plat_info.fwnode = pdev->dev.fwnode;
+		plat_info.name = PLAT_DRIVER_NAME;
+		plat_info.id = pdev->devfn;
+		plat_info.res = wrap->dev_res;
+		plat_info.num_res = ARRAY_SIZE(wrap->dev_res);
+		plat_info.dma_mask = pdev->dma_mask;
+		plat_info.data = &pdata;
+		plat_info.size_data = sizeof(pdata);
+		wrap->devfn = pdev->devfn;
+		/* register platform device */
+		wrap->plat_dev = platform_device_register_full(&plat_info);
+		if (IS_ERR(wrap->plat_dev)) {
+			ret = PTR_ERR(wrap->plat_dev);
+			kfree(wrap);
+			goto put_pci;
+		}
 	}
 
-	device_wakeup_enable(&pdev->dev);
-	if (pci_dev_run_wake(pdev))
-		pm_runtime_put_noidle(&pdev->dev);
-
-	return 0;
-
-free_cdnsp:
-	if (!pci_is_enabled(func))
-		kfree(cdnsp);
-
+	pci_set_drvdata(pdev, wrap);
 put_pci:
 	pci_dev_put(func);
-
 	return ret;
 }
 
 static void cdnsp_pci_remove(struct pci_dev *pdev)
 {
-	struct cdns *cdnsp;
+	struct cdnsp_wrap *wrap;
 	struct pci_dev *func;
 
 	func = cdnsp_get_second_fun(pdev);
-	cdnsp = (struct cdns *)pci_get_drvdata(pdev);
+	wrap = pci_get_drvdata(pdev);
 
-	if (pci_dev_run_wake(pdev))
-		pm_runtime_get_noresume(&pdev->dev);
+	if (wrap->devfn == pdev->devfn)
+		platform_device_unregister(wrap->plat_dev);
 
-	if (pci_is_enabled(func)) {
-		cdns_remove(cdnsp);
-	} else {
-		kfree(cdnsp);
-	}
+	if (!pci_is_enabled(func))
+		kfree(wrap);
 
 	pci_dev_put(func);
 }
 
-static int __maybe_unused cdnsp_pci_suspend(struct device *dev)
-{
-	struct cdns *cdns = dev_get_drvdata(dev);
-
-	return cdns_suspend(cdns);
-}
-
-static int __maybe_unused cdnsp_pci_resume(struct device *dev)
-{
-	struct cdns *cdns = dev_get_drvdata(dev);
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&cdns->lock, flags);
-	ret = cdns_resume(cdns);
-	spin_unlock_irqrestore(&cdns->lock, flags);
-	cdns_set_active(cdns, 1);
-
-	return ret;
-}
-
-static const struct dev_pm_ops cdnsp_pci_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cdnsp_pci_suspend, cdnsp_pci_resume)
-};
-
 static const struct pci_device_id cdnsp_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_CDNS, PCI_DEVICE_ID_CDNS_USBSSP),
 	  .class = PCI_CLASS_SERIAL_USB_DEVICE },
@@ -230,13 +202,10 @@ static const struct pci_device_id cdnsp_pci_ids[] = {
 };
 
 static struct pci_driver cdnsp_pci_driver = {
-	.name = "cdnsp-pci",
+	.name = PCI_DRIVER_NAME,
 	.id_table = cdnsp_pci_ids,
 	.probe = cdnsp_pci_probe,
 	.remove = cdnsp_pci_remove,
-	.driver = {
-		.pm = &cdnsp_pci_pm_ops,
-	}
 };
 
 module_pci_driver(cdnsp_pci_driver);
@@ -245,4 +214,4 @@ MODULE_DEVICE_TABLE(pci, cdnsp_pci_ids);
 MODULE_ALIAS("pci:cdnsp");
 MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Cadence CDNSP PCI driver");
+MODULE_DESCRIPTION("Cadence CDNSP PCI wrapper");
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index f0e32227c0b7..6a8d1fefbc0d 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -21,7 +21,6 @@
 #include <linux/pm_runtime.h>
 
 #include "core.h"
-#include "host-export.h"
 #include "drd.h"
 
 static int cdns_idle_init(struct cdns *cdns);
@@ -80,7 +79,7 @@ static void cdns_exit_roles(struct cdns *cdns)
  *
  * Returns 0 on success otherwise negative errno
  */
-static int cdns_core_init_role(struct cdns *cdns)
+int cdns_core_init_role(struct cdns *cdns)
 {
 	struct device *dev = cdns->dev;
 	enum usb_dr_mode best_dr_mode;
@@ -96,23 +95,13 @@ static int cdns_core_init_role(struct cdns *cdns)
 	 * can be restricted later depending on strap pin configuration.
 	 */
 	if (dr_mode == USB_DR_MODE_UNKNOWN) {
-		if (cdns->version == CDNSP_CONTROLLER_V2) {
-			if (IS_ENABLED(CONFIG_USB_CDNSP_HOST) &&
-			    IS_ENABLED(CONFIG_USB_CDNSP_GADGET))
-				dr_mode = USB_DR_MODE_OTG;
-			else if (IS_ENABLED(CONFIG_USB_CDNSP_HOST))
-				dr_mode = USB_DR_MODE_HOST;
-			else if (IS_ENABLED(CONFIG_USB_CDNSP_GADGET))
-				dr_mode = USB_DR_MODE_PERIPHERAL;
-		} else {
-			if (IS_ENABLED(CONFIG_USB_CDNS3_HOST) &&
-			    IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
-				dr_mode = USB_DR_MODE_OTG;
-			else if (IS_ENABLED(CONFIG_USB_CDNS3_HOST))
-				dr_mode = USB_DR_MODE_HOST;
-			else if (IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
-				dr_mode = USB_DR_MODE_PERIPHERAL;
-		}
+		if (IS_ENABLED(CONFIG_USB_CDNS3_HOST) &&
+		    IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
+			dr_mode = USB_DR_MODE_OTG;
+		else if (IS_ENABLED(CONFIG_USB_CDNS3_HOST))
+			dr_mode = USB_DR_MODE_HOST;
+		else if (IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
+			dr_mode = USB_DR_MODE_PERIPHERAL;
 	}
 
 	/*
@@ -137,11 +126,8 @@ static int cdns_core_init_role(struct cdns *cdns)
 	dr_mode = best_dr_mode;
 
 	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_HOST) {
-		if ((cdns->version == CDNSP_CONTROLLER_V2 &&
-		     IS_ENABLED(CONFIG_USB_CDNSP_HOST)) ||
-		    (cdns->version < CDNSP_CONTROLLER_V2 &&
-		     IS_ENABLED(CONFIG_USB_CDNS3_HOST)))
-			ret = cdns_host_init(cdns);
+		if (cdns->host_init)
+			ret = cdns->host_init(cdns);
 		else
 			ret = -ENXIO;
 
@@ -197,11 +183,14 @@ static int cdns_core_init_role(struct cdns *cdns)
 		goto err;
 	}
 
+	dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
+
 	return 0;
 err:
 	cdns_exit_roles(cdns);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(cdns_core_init_role);
 
 /**
  * cdns_hw_role_state_machine  - role switch state machine based on hw events.
@@ -469,14 +458,8 @@ int cdns_init(struct cdns *cdns)
 	if (ret)
 		goto init_failed;
 
-	ret = cdns_core_init_role(cdns);
-	if (ret)
-		goto init_failed;
-
 	spin_lock_init(&cdns->lock);
 
-	dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
-
 	return 0;
 init_failed:
 	cdns_drd_exit(cdns);
@@ -576,5 +559,5 @@ EXPORT_SYMBOL_GPL(cdns_set_active);
 MODULE_AUTHOR("Peter Chen <peter.chen@nxp.com>");
 MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
 MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
-MODULE_DESCRIPTION("Cadence USBSS and USBSSP DRD Driver");
+MODULE_DESCRIPTION("Cadence USBSS/USBSSP DRD driver (core, DRD, platform, optional host/gadget)");
 MODULE_LICENSE("GPL");
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index 801be9e61340..bca973b999a4 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -45,6 +45,7 @@ struct cdns3_platform_data {
 	unsigned long quirks;
 #define CDNS3_DEFAULT_PM_RUNTIME_ALLOW	BIT(0)
 #define CDNS3_DRD_SUSPEND_RESIDENCY_ENABLE	BIT(1)
+	u32 override_apb_timeout;	/* 0 = use default (e.g. for PCI) */
 };
 
 /**
@@ -82,6 +83,7 @@ struct cdns3_platform_data {
  * @override_apb_timeout: hold value of APB timeout. For value 0 the default
  *                        value in CHICKEN_BITS_3 will be preserved.
  * @gadget_init: pointer to gadget initialization function
+ * @host_init: pointer to host initialization function
  */
 struct cdns {
 	struct device			*dev;
@@ -120,13 +122,14 @@ struct cdns {
 	spinlock_t			lock;
 	struct xhci_plat_priv		*xhci_plat_data;
 	u32                             override_apb_timeout;
-
 	int (*gadget_init)(struct cdns *cdns);
+	int (*host_init)(struct cdns *cdns);
 };
 
 int cdns_hw_role_switch(struct cdns *cdns);
 int cdns_init(struct cdns *cdns);
 int cdns_remove(struct cdns *cdns);
+int cdns_core_init_role(struct cdns *cdns);
 
 #ifdef CONFIG_PM_SLEEP
 int cdns_resume(struct cdns *cdns);
diff --git a/drivers/usb/cdns3/gadget-export.h b/drivers/usb/cdns3/gadget-export.h
index c37b6269b001..60c3177db62c 100644
--- a/drivers/usb/cdns3/gadget-export.h
+++ b/drivers/usb/cdns3/gadget-export.h
@@ -10,9 +10,10 @@
 #ifndef __LINUX_CDNS3_GADGET_EXPORT
 #define __LINUX_CDNS3_GADGET_EXPORT
 
-#if IS_ENABLED(CONFIG_USB_CDNSP_GADGET)
+#if IS_ENABLED(CONFIG_USB_CDNS3_GADGET)
 
 int cdnsp_gadget_init(struct cdns *cdns);
+int cdns3_gadget_init(struct cdns *cdns);
 #else
 
 static inline int cdnsp_gadget_init(struct cdns *cdns)
@@ -20,13 +21,6 @@ static inline int cdnsp_gadget_init(struct cdns *cdns)
 	return -ENXIO;
 }
 
-#endif /* CONFIG_USB_CDNSP_GADGET */
-
-#if IS_ENABLED(CONFIG_USB_CDNS3_GADGET)
-
-int cdns3_gadget_init(struct cdns *cdns);
-#else
-
 static inline int cdns3_gadget_init(struct cdns *cdns)
 {
 	return -ENXIO;
diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-export.h
index cf92173ecf00..34fd1f1ad59d 100644
--- a/drivers/usb/cdns3/host-export.h
+++ b/drivers/usb/cdns3/host-export.h
@@ -9,7 +9,7 @@
 #ifndef __LINUX_CDNS3_HOST_EXPORT
 #define __LINUX_CDNS3_HOST_EXPORT
 
-#if IS_ENABLED(CONFIG_USB_CDNS_HOST)
+#if IS_ENABLED(CONFIG_USB_CDNS3_HOST)
 
 int cdns_host_init(struct cdns *cdns);
 
@@ -22,6 +22,6 @@ static inline int cdns_host_init(struct cdns *cdns)
 
 static inline void cdns_host_exit(struct cdns *cdns) { }
 
-#endif /* USB_CDNS_HOST */
+#endif /* CONFIG_USB_CDNS3_HOST */
 
 #endif /* __LINUX_CDNS3_HOST_EXPORT */
-- 
2.50.1


