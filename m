Return-Path: <linux-usb+bounces-34845-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DgAJw+ot2k2UAEAu9opvQ
	(envelope-from <linux-usb+bounces-34845-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:49:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E81295456
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE7B33036057
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 06:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1149634D915;
	Mon, 16 Mar 2026 06:48:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023135.outbound.protection.outlook.com [52.101.127.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50A5CDF1;
	Mon, 16 Mar 2026 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773643720; cv=fail; b=qtmiLrdfp8EAdUw8zoAJOIqaHrfXTszxEn3fWjSYJTafZyzA6Ac1rwbKlJpauCTyxDcZ6c/ogz5JmwdcW/0UCRszJRomHZudbVZf7zIO9KljqB2hTpwWTjneWTqe6XcFy2ZwINhRMYDQZU/WTkJ6pWbClXv8SEaPFGfd12gtIBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773643720; c=relaxed/simple;
	bh=ZoClpGwvwZwLmenzgXZ98iPCkLRG73o7JbwgHSQV1GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NWFX8E90e790BgLK2eeQFDakK9J4PtynzGnr2yYz86DdetvNgoIHojlY8y6hnrHQKgGgOIEIr/7v5n1Dle03X7kyboIZwzh930DxOcJooNHHVfVpU7bpK2I9H7xeNU/gphzEKtVJMGms8g3I1jQBrODlqR+K9BOknIY1fZ1MEQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsNB6bp/rhmsX1Ep8TKipaOiE+VXI9ED3/DOTklP3GMIV1V/xqm6xHSy0fSZ3uPU/4AfZ3R+xYLp4JYQuGAerwfNTSDurxrpLD2a037z5u8uORsUHD8tHfI28BoxrEruISDBH+mKx3unbLWShmNaiiG9YMgagH1wx4VaUMZMyIa5Cupyul8OdQLEjhzcCK1KFBYHv7xWSnlozxFKfyeQHj3ccGLXmgrOIlptCFae8GkSw667kCTShnWadc/hZCj1UOzsnGQurPjcKSRdIWH3Rt0GGTVkBLJRVlc1Iqc5KyrFHSyvXp9e25ZGZSEQiNqE5s0BzIdrPN3O02F9biA5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jX9Nkp5RpXDmU/Abq4XNFHzmCy1OCvZgTYQAuLcUrgQ=;
 b=JRd7ghg2hgEvRTLNlfVz0CJre1y9euyDVpJIC8/7yqe11St6WlRfuG5s/cxM+zlLimf50sw/O4z7on36BNz1uT9bN6lppTCbsm84MSOnZqgngRNRjVyVzGDf1/RnHpvpQ+tCsWA6M0iAlHD17pyarj5/8qU1EWLxWydRqtUu3har6LHR5doNIxMa2+KYIlgUWt3CGjTteOCY5QPbm6RNLnpFeN9ox7clTZnOtdYrjHMz6vgZrqCX/1t259kJEiazKBT6oMhz5WA8rdqHdIkYwljFQwopHHA4Wixjcxq5HtWUuTBVawpGO2djVEe/yyIBOuAYmIPOUzwyJUf3+K1adA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0198.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::7) by SEZPR06MB6549.apcprd06.prod.outlook.com
 (2603:1096:101:17e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 06:48:34 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:4:189:cafe::37) by SG2PR01CA0198.outlook.office365.com
 (2603:1096:4:189::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 06:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 06:48:32 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8137B4126F88;
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
Subject: [PATCH v2 2/2] usb: cdns3: Add USBSSP platform driver support
Date: Mon, 16 Mar 2026 14:48:31 +0800
Message-ID: <20260316064831.274865-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316064831.274865-1-peter.chen@cixtech.com>
References: <20260316064831.274865-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SEZPR06MB6549:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d5fc61d9-1d89-4082-9ee4-08de83280a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uEbDewr5f0WfM1Qc5ZQ1g1U4pi6tqx00AFfOzx4WhzLiQG06IYEY/sGu/tEE6k7pRRMl3w2aQMSf3PNpv43fyr3WNdrZtW8HOHUCnivBM4C3bX4OFo60iQh4SHm1rRCssBEb9X6FOeM2dj+0MI6VYPBStl52riWAjhkKtTJVnnOTUv6xA5JXb3EP62rqkmQG9ZNtn6PNm8JT01bSUjLbr1VBv3Ct9DdrMdMRG0g1d+5YfjIGvSBCCjKNLlS6yuQKk+6I9xfg6DuCujcplBdfpz2EpSC3Q/xG2xlRXI7Up8qwVyS5rRBZ5WOYy8NJOfSXhelZQDzCBMv58DEFCTXzRP30Akb+uK1ZBz2s3fjPGWonr8AZsT4X5CckXoCfuThTRsyWX9qJgc7SmbMEmlj875VN8EJ8JgrdSHLWGFB2Mk4guzBI0hSaheaVj8pxJC2FeJZpwHJ4lQVKE+SZ9eyzTEO8KnqgK/ncjkSCBWMzEGoiA9fUnYkGi1rhar2udub+PiyyZIRguAZqiO0DksY767wcz+1noQHxjQIcsAEpG+s8rhgXzSzQ3EJAJzXQD6TZRz8tEJ3SxSBZEujUws835vVkO3YDe5WHNSedFqqMT1dLu7/ywlqAP03sCUQALiJd/7vZo/tkgn8tAP5QYMuZCIo8F+5EOyT5WtN5XxAmyVk8PSlV6krJ1tlIdRlFIgismjgUIH0Z5++F82KrzpMESKmxPTzLB+7tKVRNdQVVqylY2ZXGI7D17T9CxI9dr4BOWcGluc1GiAh2VNA74WD1ow==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F07kB1V7hXt5eisYORmMmRgv2eU/AR2MaIb1SyX2JGcfPrLfjTKP+GdYYDMQtpgkwWiCFEq/tkCVwHBZ6/Lbfnd33NhN2RwWz0Boa3+px2ZE+hZdInce6hieBEcHjQoEcOvSO+lTlxRITMsjZjc60z0J/+z4mp5SW72CRSdFfpUvlGuPLnbKVBT44jOjTBfVNiwkg6EKaD+c4aAMQfhS7XA/3RVdT8rQC0lFHaay+nLBNHdTekf53hsLn/n5SBq/77ygcgz1ZPQcgDUF0B6NGnIZtm3gq1GWUlr5eq5jF2pwYc8VbcVdCjlqjBgzhrJWWM1G7ZWptaQ6nyRwSOzYpOkqKSTp5CyfD9V+xBG4yUKAZE5xUyxHNLEMfQv7MbYAmOEbdldiuvxnwmqR13yVNqU2GlBdSCxoYFocC3oRHPgbDY1bdbQ9Hlu7sCSH2i7t
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 06:48:32.4349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fc61d9-1d89-4082-9ee4-08de83280a3b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6549
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
	TAGGED_FROM(0.00)[bounces-34845-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.933];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:email,cixtech.com:mid,cadence.com:email,plat_info.id:url,plat_info.name:url,plat_info.data:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1E81295456
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Cadence USBSSP (CDNSP) controller was previously only accessible
through PCI, coupling the gadget driver with the PCI glue layer into a
single monolithic module (cdnsp-udc-pci). This prevented using the
CDNSP IP on SoC/platform designs that expose the controller through
device tree. It restructures the driver to decouple the CDNSP gadget
from PCI.

- Introduce CONFIG_USB_CDNSP as a standalone tristate (analogous to
  CONFIG_USB_CDNS3), with USB_CDNSP_GADGET and USB_CDNSP_HOST as
  bool sub-options. The gadget code builds as a separate cdnsp.ko
  module.

- Regroup USBSSP and CDNS3 Kconfig options under the USB_CDNS_SUPPORT
  menu so they appear properly grouped in menuconfig.

- Refactor cdnsp-pci.c into a thin PCI-to-platform wrapper (similar
  to cdns3-pci-wrap.c) that registers a platform device and passes
  PCI resources and platform data to the common platform driver.

- Auto-detect the controller version (USBSS vs USBSSP) at runtime by
  reading the DRD/OTG Device ID register in cdns_drd_init(), and select
  the appropriate gadget init function (cdns3_gadget_init or
  cdnsp_gadget_init) based on cdns->version. This follows the same
  pattern already used for host initialization.

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

This patch is Assisted-by: Cursor:claude-4.6-opus

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 drivers/usb/cdns3/Kconfig         |  50 ++++---
 drivers/usb/cdns3/Makefile        |  30 ++---
 drivers/usb/cdns3/cdns3-gadget.c  |   4 +
 drivers/usb/cdns3/cdns3-plat.c    |  17 ++-
 drivers/usb/cdns3/cdnsp-gadget.c  |   4 +
 drivers/usb/cdns3/cdnsp-pci.c     | 217 +++++++++++++-----------------
 drivers/usb/cdns3/core.c          |  11 +-
 drivers/usb/cdns3/core.h          |   5 +-
 drivers/usb/cdns3/gadget-export.h |   4 +-
 9 files changed, 164 insertions(+), 178 deletions(-)

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 0a514b591527..97fa84dddbca 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -20,10 +20,6 @@ config USB_CDNS3
 	  Say Y here if your system has a Cadence USB3 dual-role controller.
 	  It supports: dual-role switch, Host-only, and Peripheral-only.
 
-	  If you choose to build this driver is a dynamically linked
-	  as module, the module will be called cdns3.ko.
-endif
-
 if USB_CDNS3
 
 config USB_CDNS3_GADGET
@@ -89,29 +85,27 @@ config USB_CDNS3_STARFIVE
 
 	  If you choose to build this driver as module it will
 	  be dynamically linked and module will be called cdns3-starfive.ko
-endif
 
-if USB_CDNS_SUPPORT
+endif # USB_CDNS3
 
-config USB_CDNSP_PCI
-	tristate "Cadence CDNSP Dual-Role Controller"
-	depends on USB_CDNS_SUPPORT && USB_PCI && ACPI
+config USB_CDNSP
+	tristate "Cadence USBSSP Dual-Role Controller"
+	depends on USB_CDNS_SUPPORT
 	help
-	  Say Y here if your system has a Cadence CDNSP dual-role controller.
-	  It supports: dual-role switch Host-only, and Peripheral-only.
-
-	  If you choose to build this driver is a dynamically linked
-	  module, the module will be called cdnsp.ko.
-endif
+	  Say Y here if your system has a Cadence USBSSP dual-role controller.
+	  It supports: dual-role switch, Host-only, and Peripheral-only.
+	  Cadence CDNSP Controller device mode is very similar to XHCI controller.
+	  Therefore some algorithms used has been taken from xHCI driver.
+	  Host controller is compliant with XHCI so it uses standard XHCI driver.
 
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
@@ -120,8 +114,8 @@ config USB_CDNSP_GADGET
 	  It doesn't support LS.
 
 config USB_CDNSP_HOST
-	bool "Cadence CDNSP host controller"
-	depends on USB=y || USB=USB_CDNSP_PCI
+	bool "Cadence USBSSP host controller"
+	depends on USB=y || USB=USB_CDNSP
 	select USB_CDNS_HOST
 	help
 	  Say Y here to enable host controller functionality of the
@@ -130,4 +124,16 @@ config USB_CDNSP_HOST
 	  Host controller is compliant with XHCI so it uses
 	  standard XHCI driver.
 
-endif
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
+endif # USB_CDNSP
+
+endif # USB_CDNS_SUPPORT
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index 48dfae75b5aa..63484f145bb9 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -4,41 +4,33 @@ CFLAGS_cdns3-trace.o				:= -I$(src)
 CFLAGS_cdnsp-trace.o				:= -I$(src)
 
 cdns-usb-common-y				:= core.o drd.o
-cdns3-y						:= cdns3-plat.o
 
 ifeq ($(CONFIG_USB),m)
 obj-m						+= cdns-usb-common.o
-obj-m						+= cdns3.o
+obj-m						+= cdns3-plat.o
 else
 obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns-usb-common.o
-obj-$(CONFIG_USB_CDNS3)				+= cdns3.o
+obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns3-plat.o
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
index 735df88774e4..71c612e27b73 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -44,6 +44,14 @@ static void set_phy_power_off(struct cdns *cdns)
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
 /**
  * cdns3_plat_probe - probe for cdns3 core device
  * @pdev: Pointer to cdns3 core platform device
@@ -64,6 +72,8 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 
 	cdns->dev = dev;
 	cdns->pdata = dev_get_platdata(dev);
+	if (cdns->pdata && cdns->pdata->override_apb_timeout)
+		cdns->override_apb_timeout = cdns->pdata->override_apb_timeout;
 
 	platform_set_drvdata(pdev, cdns);
 
@@ -143,12 +153,15 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_phy_power_on;
 
-	cdns->gadget_init = cdns3_gadget_init;
-
 	ret = cdns_init(cdns);
 	if (ret)
 		goto err_cdns_init;
 
+	cdns->gadget_init = cdns3_plat_gadget_init;
+	ret = cdns_core_init_role(cdns);
+	if (ret)
+		goto err_cdns_init;
+
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
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
index f0e32227c0b7..10f00b6c3c83 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -80,7 +80,7 @@ static void cdns_exit_roles(struct cdns *cdns)
  *
  * Returns 0 on success otherwise negative errno
  */
-static int cdns_core_init_role(struct cdns *cdns)
+int cdns_core_init_role(struct cdns *cdns)
 {
 	struct device *dev = cdns->dev;
 	enum usb_dr_mode best_dr_mode;
@@ -197,11 +197,14 @@ static int cdns_core_init_role(struct cdns *cdns)
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
@@ -469,14 +472,8 @@ int cdns_init(struct cdns *cdns)
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
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index 801be9e61340..dc8c4137de15 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -45,6 +45,7 @@ struct cdns3_platform_data {
 	unsigned long quirks;
 #define CDNS3_DEFAULT_PM_RUNTIME_ALLOW	BIT(0)
 #define CDNS3_DRD_SUSPEND_RESIDENCY_ENABLE	BIT(1)
+	u32 override_apb_timeout;	/* 0 = use default (e.g. for PCI) */
 };
 
 /**
@@ -119,14 +120,14 @@ struct cdns {
 	struct cdns3_platform_data	*pdata;
 	spinlock_t			lock;
 	struct xhci_plat_priv		*xhci_plat_data;
-	u32                             override_apb_timeout;
-
 	int (*gadget_init)(struct cdns *cdns);
+	u32                             override_apb_timeout;
 };
 
 int cdns_hw_role_switch(struct cdns *cdns);
 int cdns_init(struct cdns *cdns);
 int cdns_remove(struct cdns *cdns);
+int cdns_core_init_role(struct cdns *cdns);
 
 #ifdef CONFIG_PM_SLEEP
 int cdns_resume(struct cdns *cdns);
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


