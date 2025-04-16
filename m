Return-Path: <linux-usb+bounces-23141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B413A90546
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 915CB19E243D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2062223328;
	Wed, 16 Apr 2025 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5LZCwuC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698962222DD
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811178; cv=none; b=IVf7G+PSHLVtIa8qVcDMp6JZhe9Ch7QoVrGFyJXjkZWJMPn++L1kLZJWldvhXmfHwKw02PKHtrhXUY80cWZr4nTInUKzg4DABNWZWJ5nZJBYw98mowJyD+P1ABIk8vx1xcbFNfiSClBSoSc6pRIX9Zeb3uMNgs36U/0AaBZHDx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811178; c=relaxed/simple;
	bh=HMHrBwIhg4x+Pu1NWtumKmwftkteBGg4w6T8P4FotfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQ+djWbKqtkgqyWsyJAhcd4labHEm66zkS+XH7LiSVriCr3YvaIxyIXO8b9ImWJaMvJljonhVlX6ROVLVkPG7oh7T6tNs5WA3lqKtLZgilHexGmhXERXP32WLPZgU2zbtLlez2Rov/4icK3sx4RylDBYsSJy1+3P2N06U0vY2jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5LZCwuC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811176; x=1776347176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HMHrBwIhg4x+Pu1NWtumKmwftkteBGg4w6T8P4FotfU=;
  b=m5LZCwuCn+F03Wu0F26PU+lKVQ8ZYpDAuFuU/Wk/i7xCWkIs0XGoRD0b
   DRWNH5ixIsy6l3cFvup7UMaF8ENX+qCi2mDNykxirgze2c6rWJt1d8wHw
   tBqtwxlpBSzRAbYVRh//gq8genpHEyMNQ1N9i1qMSBe+o974Kp6SXHoji
   8/o19O1N3TpnLcFRy5AVbVVEvu0gCTJy941yCj03Brrfr1HybPZ1mECb+
   Py3jKsz/O03YizPFJByOyc3hHIcAxsoA1Fueg5DOn4kLP/l1XyOJPb0Nf
   nhC7dvdjJa83MYFJ64MYttqFKIWEB77kZ8p7VbJK4SAAHGQ95q83/7Qa+
   w==;
X-CSE-ConnectionGUID: cD8rX60WQL+b5mkFuk0/uw==
X-CSE-MsgGUID: QjtC1mMCQ4uY6gURUQ3XWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46074464"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46074464"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:46:15 -0700
X-CSE-ConnectionGUID: lzlzodhxSdmKSxsZnjkR1g==
X-CSE-MsgGUID: taVICWsgTfS9UBXmlz04pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135659173"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 06:46:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id A5F1578A; Wed, 16 Apr 2025 16:46:12 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	sergei.shtylyov@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 07/11] usb: xhci: move enabling of USB 3 device notifications
Date: Wed, 16 Apr 2025 16:45:06 +0300
Message-ID: <20250416134510.2406543-8-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
References: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Relocated the enabling of USB 3.0 device notifications from xhci_mem_init()
to xhci_init(). Introduced xhci_set_dev_notifications() function to handle
the notification settings.

Simplify 'DEV_NOTE_FWAKE' masks by directly using the 'ENABLE_DEV_NOTE'
value (1 << 1) instead of using the 'ENABLE_DEV_NOTE' macro.
Macro 'ENABLE_DEV_NOTE' is removed.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 10 ----------
 drivers/usb/host/xhci.c     | 17 +++++++++++++++++
 drivers/usb/host/xhci.h     |  3 +--
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 391dc2282360..226013ee443a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2385,7 +2385,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
-	u32		temp;
 
 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2472,15 +2471,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index 00aae0619ccd..18d8637773cb 100644
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
index bfb02dbd9fc7..c05c3eab005b 100644
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
2.47.2


