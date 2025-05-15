Return-Path: <linux-usb+bounces-23989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295FAB88AE
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 15:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356F03BCC9D
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 13:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C254D1EFF93;
	Thu, 15 May 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SfhZabhs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09241A0BD6
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317405; cv=none; b=uwDCa3V+G6N3FPXFtCjaAYXKgYtKIAF+lcHtu3My1pAI6nmOzTqhOpNRhGycsZmp7lcLTHV45KTUTq7rPjlSHRcXn10ko2plZCKqY11gOpUMqKBPM2YpyQbyGWNQxpCInwztqaH/4e83AJGJj2e4xfeT42upwdTXLHRPJckGZ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317405; c=relaxed/simple;
	bh=x3oV9MLHveOCbwIE/3DhSHNMvsocQkvK1JQip0Z+NnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dn+kdnD/cqUbc+s+Vqh3GLdJFeee8Sp4IRya4ybi7MvTbHs7LOqq7pZpjl52tr0GUny7f38fgfobzCXLoM7N8tzC/TlzWdcqJatOT2s/P6rXIMcQ6wZH0UiAY6RBdkkRPxWSVWCRL21Zh5MsTXHbGbncUXLebfBUzui7iLKKXmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SfhZabhs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317404; x=1778853404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x3oV9MLHveOCbwIE/3DhSHNMvsocQkvK1JQip0Z+NnI=;
  b=SfhZabhsoplmuvPAypjSQvJXtKAh4LhcnXHre5F5D270VhbvWle6hxQ3
   42SIR8Mmt5V+S5gj7Lvp3DHfK3n4fhqciY3ZMUcAZAL7oMPLdcduksDnG
   FadoW1vHUZR5wdyWPo+YhWdhNDL03w1aKvHiXASw/0DWT/F9zo0nxZiUI
   SNllZ+hYdrZ+ofaWU+ATnVqI4Al69wg0Wgz9Eb3FRak3/SsUn2iHxWF+C
   IGhTmmSxTuLtXCBxA8NMf7hYtjMtJN3ialQolxRb1swy8RGTlEc4UF3A6
   F51f/5B4Ojf0P7GC3XbK53STMiEJgP/+GAwM5C4wdeT14LirCNy/0OQKa
   g==;
X-CSE-ConnectionGUID: F+vlt0ibT92ZM3i61JW91A==
X-CSE-MsgGUID: DxLi6VVFRSCMpo8VE5PX9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60270023"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60270023"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 06:56:44 -0700
X-CSE-ConnectionGUID: PR8vwcy5RciUj7TqWtXW7A==
X-CSE-MsgGUID: vVGHSN2MQVOuohAT9WpTYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139372174"
Received: from unknown (HELO mnyman-desk.fi.intel.com) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2025 06:56:42 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 09/24] usb: xhci: move enabling of USB 3 device notifications
Date: Thu, 15 May 2025 16:56:06 +0300
Message-ID: <20250515135621.335595-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Relocated the enabling of USB 3.0 device notifications from xhci_mem_init()
to xhci_init(). Introduced xhci_set_dev_notifications() function to handle
the notification settings.

Simplify 'DEV_NOTE_FWAKE' masks by directly using the 'ENABLE_DEV_NOTE'
value (1 << 1) instead of using the 'ENABLE_DEV_NOTE' macro.
Macro 'ENABLE_DEV_NOTE' is removed.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 10 ----------
 drivers/usb/host/xhci.c     | 17 +++++++++++++++++
 drivers/usb/host/xhci.h     |  3 +--
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 2f4dbb67b1bf..718354bd7fb2 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2419,7 +2419,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
-	u32		temp;
 
 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2515,15 +2514,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (xhci_setup_port_arrays(xhci, flags))
 		goto fail;
 
-	/* Enable USB 3.0 device notifications for function remote wake, which
-	 * is necessary for allowing USB 3.0 devices to do remote wakeup from
-	 * U3 (device suspend).
-	 */
-	temp = readl(&xhci->op_regs->dev_notification);
-	temp &= ~DEV_NOTE_MASK;
-	temp |= DEV_NOTE_FWAKE;
-	writel(temp, &xhci->op_regs->dev_notification);
-
 	return 0;
 
 fail:
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0639d8b7372b..fa80cc30c3fe 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -524,6 +524,20 @@ static void xhci_set_doorbell_ptr(struct xhci_hcd *xhci)
 		       "Doorbell array is located at offset 0x%x from cap regs base addr", offset);
 }
 
+/*
+ * Enable USB 3.0 device notifications for function remote wake, which is necessary
+ * for allowing USB 3.0 devices to do remote wakeup from U3 (device suspend).
+ */
+static void xhci_set_dev_notifications(struct xhci_hcd *xhci)
+{
+	u32 dev_notf;
+
+	dev_notf = readl(&xhci->op_regs->dev_notification);
+	dev_notf &= ~DEV_NOTE_MASK;
+	dev_notf |= DEV_NOTE_FWAKE;
+	writel(dev_notf, &xhci->op_regs->dev_notification);
+}
+
 /*
  * Initialize memory for HCD and xHC (one-time init).
  *
@@ -561,6 +575,9 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set Doorbell array pointer */
 	xhci_set_doorbell_ptr(xhci);
 
+	/* Set USB 3.0 device notifications for function remote wake */
+	xhci_set_dev_notifications(xhci);
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 6c1758f8fd01..31d945c4ac07 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -184,11 +184,10 @@ struct xhci_op_regs {
  * notification type that matches a bit set in this bit field.
  */
 #define	DEV_NOTE_MASK		(0xffff)
-#define ENABLE_DEV_NOTE(x)	(1 << (x))
 /* Most of the device notification types should only be used for debug.
  * SW does need to pay attention to function wake notifications.
  */
-#define	DEV_NOTE_FWAKE		ENABLE_DEV_NOTE(1)
+#define	DEV_NOTE_FWAKE		(1 << 1)
 
 /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
 /* bit 0 - Cycle bit indicates the ownership of the command ring */
-- 
2.43.0


