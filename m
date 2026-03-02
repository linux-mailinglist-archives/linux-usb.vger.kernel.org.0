Return-Path: <linux-usb+bounces-33850-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGAwOmf+pGn3xwUAu9opvQ
	(envelope-from <linux-usb+bounces-33850-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 04:05:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9BA1D29BB
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 04:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED54E3031805
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 03:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5652D5C7A;
	Mon,  2 Mar 2026 03:03:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023139.outbound.protection.outlook.com [52.101.127.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C12D8379;
	Mon,  2 Mar 2026 03:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772420631; cv=fail; b=EauXxhoDtZU62w3tP9VMTimopKxuOtI9WGDe39hRChSFe6exsA7KGHgobLhXvO2dkqX/y7L9bmeVIrKXlq04XOj0+657aROYztE0jW/8Dmng01daQ2IlWYED9yyMklKDeLipy/quLaEdUdfUb5ZII2UTAG89FAFdo4DdKKkPjLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772420631; c=relaxed/simple;
	bh=88we2ibqnhqtAfoGSnMK+B7xKfRVur9CTYBYRVjSDHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzOCFCBQnOj1y/xC/KhzUJL2pYE6VaD8w9TtlPGLyv2IscL+ZN5fVTaWdCD3ddBid9Mo7JKVoaBS1N+HIuD1lfaKMOpxfil6NnOlXq89wsOOnvAOGVE4eWYaf5+9T2Fec7YOR5ZlggP71KpTvvQMo/7G3HgXnfvPphl03npYOpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZipWfWoCauzcWvJckUkEgdZvwR2pRMVSJ5n84O06TghkYXPmA0Y0HkTaHPI6mqVdw+gNSu7vRJYxJOq5bfpdZntS/pDGYrZIguH/nuXkj/1agPc8TjpGlO92i+dJop846wu2cE9Dn9YHIMJ2wkAmmJ84R4Ir76J6cmcac8y0CdatE91VmwLq7CnIb0AjQiDVK2fIA4McW/g+JmOKL6xYQ7XoFmPzQhi8a6ZaDj4v7rC2X4L1rYK5oe3TZnezzTAyKOnmlVNUwDnZBHHn6pas+j/nxpLkLNOw59n3C4VvoNSpR5z1uV6bezl5mn1/tKs8ZdlwsJzoA1nGzGQUGM3XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMXdDUTNH+WWICiedWlvDDrKZ9bPDLX0323GeEdTTi8=;
 b=eYfoAlGCx6C9nS1cxIwYvUUFTGb9bVItaXcUG3hTq0VbfuMM+bzlfKZzrz6k7kKtPIwi8TZBSNbJXmlYshhVf13EekeGq60kV/nVTZMWeQ7iFmq2xdGF/h8J+5X4IKBbm1yXRUlCDm17YlSndJydQiDkNg57WshXfWUgxVxpIzwNZtyalMrxzZyrEiket57OkcWDBfKDmZAP4tm/xrc4yrsQ9feFybTn21NdqPIldZPP4+YLqU3VpASYNY7RezbpZHp9tsj5h8LHkU3j9ABPh3eYZjmRpI/Y4oSwQSpIBNO0x/9sH6r33bsdBrzmHBufhoc6srqvCSc//YcA9FlwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0037.apcprd02.prod.outlook.com (2603:1096:4:196::8) by
 TY0PR06MB5234.apcprd06.prod.outlook.com (2603:1096:400:21a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 03:03:42 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::d6) by SI2PR02CA0037.outlook.office365.com
 (2603:1096:4:196::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 03:03:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 03:03:40 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7399C435071E;
	Mon,  2 Mar 2026 11:03:39 +0800 (CST)
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
Subject: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
Date: Mon,  2 Mar 2026 11:03:33 +0800
Message-ID: <20260302030339.324196-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260302030339.324196-1-peter.chen@cixtech.com>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|TY0PR06MB5234:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9b90a2b6-ec7d-40a5-0abb-08de78084e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	joSvKLlgw2pia6hZ5ZwL4hmVV+F273zdCtbduBgU5B6Mlgq8Y+rBcYBsSm9wR6JSE4Qy1/uTPo5mkbpApTJS+nIJ3Z8fWrr+C5AmuZuqmRpljTPco7ohKq/CNLGWiGJ+GmXmpdK5buEzFYwTs631HE4kvEaHUov//kz91iMOppKmoDDDMI2tPUvircbJKWkEQV3FrBgk7OLaT5JHKDArU4ieWX1zjyLzqpcyeBrXQiv8cvKCCSTVR3FWOXdRX8MbmPa/Mx15inlsTMtBa+WocLVqu4sJnrdLEwwhd4yDQH6TL3ZH8g+reDNiMG00/Y5oetZryl0SIrVxj/iBG4PHFvSM2+uZZ8VxUV1mhlZDYVQNc1kPJPn2CjENVsAdIVGskaxRK0Bkee595w/Ys9JqKH97XDxQSyXz4CUExDgA823TQerwuN1CZI6xggChIwqH1x6pyYST1Q5ZdCUIITJEuQioaYdSvJqhtw+LFaT/xADwi6dkyOpDW+WNm6v2F7V5h7tHS7oHJRIWUmkjO7FKmzDE7CnTAt5hEeOQwB/n15kxIPzRaAjQ+4qVHppQEZ1OzkhRREyX/9N+n6zQNTs2pfch4vYelI5zyGpnOkyxwxi+LF944P63BgbTnD86TRdk2mq2tKg/TUTKZXf/+UiWyVmXF+Qy6XhiODkuzsvbNEJsX6FtNjLS/6dXK2GWJKPMTDZ1S4R3n7ar+E6y1pmzMY5kKLohpNc1226OK9dDbmXlL6VIcyTZEKACn+Chv7eBA1b7UKQFqsADnns2q4gt1JfTmD2SXdgmAeqxT57oVxrpi5yRGAG5LbroUnaLfdPnVJuieIPG2qHr2tPgHgdFNQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vZNRoPXlRuQB4FI7Wu7HfwRnH9q3CXTVHzU8gsNfqDIGDigE9E0h8v2BnfX3Qsf7qZIdG/K6e0tJY2K+Mf5jMKXJb+e/B3efCY7iWgJkewdjdkHUUdwiD88fl0rUGiR8Mfe0pdPpZoX8vRGs0WbrssfZR5ITzB0mgpXYGN4sLLKyZ+NDRMrC3wwtekS/qY1tDj3osKWEsLK9d4jpY3JRcA+7QhG1yllEd9uPCErd4JcTiEAYf9nauvuclHlKF9mqT3M5j1TXVnrQ9DWpXtyva+s6frmSzZWxkCjIXKTe2tk9I9LVTBosP2KOB6wttauQ2+1bryE+Z+7fWKGXdaaa03ZHNaxzm65bN061+uRe48xQUqaYRj24EcLRzLIfRK2NEdaUuR2dMqwaf56p9n30l/BuzEHqe8gu90steHvjG5u5hsvARLXqi1jSGC4dPZ91
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 03:03:40.1551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b90a2b6-ec7d-40a5-0abb-08de78084e8f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5234
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33850-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:email,plat_info.id:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,plat_info.data:url,plat_info.name:url,cixtech.com:mid,cixtech.com:email]
X-Rspamd-Queue-Id: 4F9BA1D29BB
X-Rspamd-Action: no action

The Cadence USBSSP (CDNSP) controller was previously only accessible
through PCI, coupling the gadget driver with the PCI glue layer into a
single monolithic module (cdnsp-udc-pci). This prevented using the
CDNSP IP on SoC/platform designs that expose the controller through
device tree.

Restructure the driver to decouple the CDNSP gadget from PCI:

- Introduce CONFIG_USB_CDNSP as a standalone tristate (analogous to
  CONFIG_USB_CDNS3), with USB_CDNSP_GADGET and USB_CDNSP_HOST as
  bool sub-options. The gadget code builds as a separate cdnsp.ko
  module.

- Refactor cdnsp-pci.c into a thin PCI-to-platform wrapper (similar
  to cdns3-pci-wrap.c) that registers a platform device and passes
  PCI resources and platform data to the common platform driver.

- Add "cdns,usbssp" compatible string to the shared platform driver
  (cdns3-plat.c). The probe function uses of_device_id match data to
  select cdnsp_gadget_init vs cdns3_gadget_init.

- Move cdns3-plat.o into cdns-usb-common, since it now serves as the
  shared platform driver entry point for both CDNS3 and CDNSP.

- Fix gadget-export.h to use IS_REACHABLE() keyed on the tristate
  module config (CONFIG_USB_CDNS3/CONFIG_USB_CDNSP) instead of
  IS_ENABLED() on the bool gadget config. The bool configs are always
  'y' when enabled, causing IS_ENABLED/IS_REACHABLE to always return
  true and resulting in link errors when cdns-usb-common is built-in
  but the gadget module is loadable.

- Add missing MODULE_LICENSE()/MODULE_DESCRIPTION() and
  EXPORT_SYMBOL_GPL() to the cdns3 and cdnsp gadget modules, required
  by modpost.

- Pass override_apb_timeout through cdns3_platform_data so the PCI
  wrapper can communicate PCI-specific APB timeout values to the
  common driver.

This patch was developed with assistance from Anthropic Claude Opus 4.6.

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 drivers/usb/cdns3/Kconfig         |  44 +++---
 drivers/usb/cdns3/Makefile        |  30 ++--
 drivers/usb/cdns3/cdns3-gadget.c  |   4 +
 drivers/usb/cdns3/cdns3-plat.c    |  14 +-
 drivers/usb/cdns3/cdnsp-gadget.c  |   4 +
 drivers/usb/cdns3/cdnsp-pci.c     | 221 +++++++++++++-----------------
 drivers/usb/cdns3/core.h          |   1 +
 drivers/usb/cdns3/gadget-export.h |   4 +-
 8 files changed, 151 insertions(+), 171 deletions(-)

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 0a514b591527..80c740f5c755 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -20,8 +20,13 @@ config USB_CDNS3
 	  Say Y here if your system has a Cadence USB3 dual-role controller.
 	  It supports: dual-role switch, Host-only, and Peripheral-only.
 
-	  If you choose to build this driver is a dynamically linked
-	  as module, the module will be called cdns3.ko.
+config USB_CDNSP
+	tristate "Cadence USBSSP Dual-Role Controller"
+	depends on USB_CDNS_SUPPORT
+	help
+	  Say Y here if your system has a Cadence USBSSP dual-role controller.
+	  It supports: dual-role switch, Host-only, and Peripheral-only.
+
 endif
 
 if USB_CDNS3
@@ -91,27 +96,14 @@ config USB_CDNS3_STARFIVE
 	  be dynamically linked and module will be called cdns3-starfive.ko
 endif
 
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
+if USB_CDNSP
 
 config USB_CDNSP_GADGET
-	bool "Cadence CDNSP device controller"
-	depends on USB_GADGET=y || USB_GADGET=USB_CDNSP_PCI
+	bool "Cadence USBSSP device controller"
+	depends on USB_GADGET=y || USB_GADGET=USB_CDNSP
 	help
 	  Say Y here to enable device controller functionality of the
-	  Cadence CDNSP-DEV driver.
+	  Cadence USBSSP-DEV driver.
 
 	  Cadence CDNSP Device Controller in device mode is
 	  very similar to XHCI controller. Therefore some algorithms
@@ -120,8 +112,8 @@ config USB_CDNSP_GADGET
 	  It doesn't support LS.
 
 config USB_CDNSP_HOST
-	bool "Cadence CDNSP host controller"
-	depends on USB=y || USB=USB_CDNSP_PCI
+	bool "Cadence USBSSP host controller"
+	depends on USB=y || USB=USB_CDNSP
 	select USB_CDNS_HOST
 	help
 	  Say Y here to enable host controller functionality of the
@@ -130,4 +122,14 @@ config USB_CDNSP_HOST
 	  Host controller is compliant with XHCI so it uses
 	  standard XHCI driver.
 
+config USB_CDNSP_PCI
+	tristate "Cadence USBSSP support on PCIe-based platforms"
+	depends on USB_PCI && ACPI
+	help
+	  If you're using the USBSSP Core IP with a PCIe, please say
+	  'Y' or 'M' here.
+
+	  If you choose to build this driver as module it will
+	  be dynamically linked and module will be called cdnsp-pci.ko
+
 endif
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index 48dfae75b5aa..0e9b20e799d0 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -3,42 +3,32 @@
 CFLAGS_cdns3-trace.o				:= -I$(src)
 CFLAGS_cdnsp-trace.o				:= -I$(src)
 
-cdns-usb-common-y				:= core.o drd.o
-cdns3-y						:= cdns3-plat.o
+cdns-usb-common-y				:= core.o drd.o cdns3-plat.o
 
 ifeq ($(CONFIG_USB),m)
 obj-m						+= cdns-usb-common.o
-obj-m						+= cdns3.o
 else
 obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns-usb-common.o
-obj-$(CONFIG_USB_CDNS3)				+= cdns3.o
 endif
 
 cdns-usb-common-$(CONFIG_USB_CDNS_HOST) 	+= host.o
-cdns3-$(CONFIG_USB_CDNS3_GADGET)		+= cdns3-gadget.o cdns3-ep0.o
 
+# For CDNS3 gadget
 ifneq ($(CONFIG_USB_CDNS3_GADGET),)
+cdns3-y						:= cdns3-gadget.o cdns3-ep0.o
 cdns3-$(CONFIG_TRACING)				+= cdns3-trace.o
+obj-$(CONFIG_USB_CDNS3)				+= cdns3.o
 endif
-
 obj-$(CONFIG_USB_CDNS3_PCI_WRAP)		+= cdns3-pci-wrap.o
 obj-$(CONFIG_USB_CDNS3_TI)			+= cdns3-ti.o
 obj-$(CONFIG_USB_CDNS3_IMX)			+= cdns3-imx.o
 obj-$(CONFIG_USB_CDNS3_STARFIVE)		+= cdns3-starfive.o
 
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
+# For CDNSP gadget
 ifneq ($(CONFIG_USB_CDNSP_GADGET),)
-cdnsp-udc-pci-$(CONFIG_TRACING)			+= cdnsp-trace.o
+cdnsp-y						:= cdnsp-ring.o cdnsp-gadget.o \
+						   cdnsp-mem.o cdnsp-ep0.o
+cdnsp-$(CONFIG_TRACING)				+= cdnsp-trace.o
+obj-$(CONFIG_USB_CDNSP)				+= cdnsp.o
 endif
+obj-$(CONFIG_USB_CDNSP_PCI)			+= cdnsp-pci.o
diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index d59a60a16ec7..b800bd1bedd4 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3508,3 +3508,7 @@ int cdns3_gadget_init(struct cdns *cdns)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cdns3_gadget_init);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Cadence USBSS DRD Driver - gadget");
diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 735df88774e4..156404bd6a43 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -23,6 +23,9 @@
 #include "gadget-export.h"
 #include "drd.h"
 
+static const unsigned long cdns3_plat;
+static const unsigned long cdnsp_plat;
+
 static int set_phy_power_on(struct cdns *cdns)
 {
 	int ret;
@@ -64,6 +67,8 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 
 	cdns->dev = dev;
 	cdns->pdata = dev_get_platdata(dev);
+	if (cdns->pdata && cdns->pdata->override_apb_timeout)
+		cdns->override_apb_timeout = cdns->pdata->override_apb_timeout;
 
 	platform_set_drvdata(pdev, cdns);
 
@@ -143,7 +148,10 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_phy_power_on;
 
-	cdns->gadget_init = cdns3_gadget_init;
+	if (device_get_match_data(dev) == &cdnsp_plat)
+		cdns->gadget_init = cdnsp_gadget_init;
+	else
+		cdns->gadget_init = cdns3_gadget_init;
 
 	ret = cdns_init(cdns);
 	if (ret)
@@ -317,7 +325,8 @@ static const struct dev_pm_ops cdns3_pm_ops = {
 
 #ifdef CONFIG_OF
 static const struct of_device_id of_cdns3_match[] = {
-	{ .compatible = "cdns,usb3" },
+	{ .compatible = "cdns,usb3", .data = &cdns3_plat },
+	{ .compatible = "cdns,usbssp", .data = &cdnsp_plat },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, of_cdns3_match);
@@ -336,6 +345,7 @@ static struct platform_driver cdns3_driver = {
 module_platform_driver(cdns3_driver);
 
 MODULE_ALIAS("platform:cdns3");
+MODULE_ALIAS("platform:cdnsp");
 MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Cadence USB3 DRD Controller Driver");
diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index 6b3815f8a6e5..8db7eee528a1 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -2075,3 +2075,7 @@ int cdnsp_gadget_init(struct cdns *cdns)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(cdnsp_gadget_init);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Cadence CDNSP DRD Driver - gadget");
diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
index 566d94e49102..7deb25816548 100644
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
@@ -8,15 +8,27 @@
  *
  */
 
-#include <linux/platform_device.h>
-#include <linux/dma-mapping.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/slab.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
 
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
@@ -28,14 +40,14 @@
 #define PCI_DRIVER_NAME		"cdns-pci-usbssp"
 #define PLAT_DRIVER_NAME	"cdns-usbssp"
 
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
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index 801be9e61340..9149612bb2a8 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -45,6 +45,7 @@ struct cdns3_platform_data {
 	unsigned long quirks;
 #define CDNS3_DEFAULT_PM_RUNTIME_ALLOW	BIT(0)
 #define CDNS3_DRD_SUSPEND_RESIDENCY_ENABLE	BIT(1)
+	u32 override_apb_timeout;	/* 0 = use default (e.g. for PCI) */
 };
 
 /**
diff --git a/drivers/usb/cdns3/gadget-export.h b/drivers/usb/cdns3/gadget-export.h
index c37b6269b001..0cb600e2b5d2 100644
--- a/drivers/usb/cdns3/gadget-export.h
+++ b/drivers/usb/cdns3/gadget-export.h
@@ -10,7 +10,7 @@
 #ifndef __LINUX_CDNS3_GADGET_EXPORT
 #define __LINUX_CDNS3_GADGET_EXPORT
 
-#if IS_ENABLED(CONFIG_USB_CDNSP_GADGET)
+#if defined(CONFIG_USB_CDNSP_GADGET) && IS_REACHABLE(CONFIG_USB_CDNSP)
 
 int cdnsp_gadget_init(struct cdns *cdns);
 #else
@@ -22,7 +22,7 @@ static inline int cdnsp_gadget_init(struct cdns *cdns)
 
 #endif /* CONFIG_USB_CDNSP_GADGET */
 
-#if IS_ENABLED(CONFIG_USB_CDNS3_GADGET)
+#if defined(CONFIG_USB_CDNS3_GADGET) && IS_REACHABLE(CONFIG_USB_CDNS3)
 
 int cdns3_gadget_init(struct cdns *cdns);
 #else
-- 
2.50.1


