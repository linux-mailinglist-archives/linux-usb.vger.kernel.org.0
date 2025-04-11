Return-Path: <linux-usb+bounces-22957-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F5A857A3
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BE3A17F34A
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 09:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5682980DC;
	Fri, 11 Apr 2025 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yg1J1Dpk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A34C2989B8
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362779; cv=none; b=CLu+KhzL3VW3VJ7qUBgl9jeh8Ck8gjWRWYe8Kqjf9Cy6FU2nyHiqZIlVWbWpKWEljptodPUXifR7czVEkZh61ce31/9JAkW2BrIy6v0XaKT9Kj/Me/n7h1L3G73gngwPC/kBlPoIavKGFHgCShyHOaGwURes+kPO2kxfpw399tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362779; c=relaxed/simple;
	bh=9RWcNJQ8wa5b9yrpW4pxaw70ckjZelb1DIicyWORdW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvulzrWqUhS0fbC/Rc1VmyDD4sU8s3yubdNTdXXsXV20cXLqyfh1L8+/L4pDmpBkKy99fBncsi2a/BgG8IiDU/KQ1OJNe4II9+2JOgcLdYF8/HrCVQtzRYacP1LRYzzHpULykvWtntukZIe0H8kk1bcptr/ORDIaWaEgUmTuEdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yg1J1Dpk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744362778; x=1775898778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9RWcNJQ8wa5b9yrpW4pxaw70ckjZelb1DIicyWORdW4=;
  b=Yg1J1Dpk2w2EXbyH3I2yqNpf83Mc2wsvs/om99+ChgbjNeGs4W+6yWa2
   xYpFJMvt75V7n+QHNOekd+dNXBDeCkSVnLeJzkksG3U/XL92izmpT/1aW
   9zzfQgFh2ZxIoWeTA/LZCTI1ZhIWJviy3pC3ttLM2uUwfUtBAMQtgaqna
   zYdJqhTf/ji6XRB+Mz6jBuc8bhsUCxru7ULmSejx8c++Cgt0NTnDmdVs3
   G4pKnrMY+oAFz/Rf9EurskIfPaefyvSQX/GkUi73wLSCpzf6IT1EyhOfa
   Vkxwp0ecOMgKhD/C4n9gR/oH4opcCpO+ilAgvwS1RpwJdVssk8ZkDnVJq
   w==;
X-CSE-ConnectionGUID: 9pnd2J27RO6iDUBzjo3rBg==
X-CSE-MsgGUID: pQ+u/W1mT+2bF431LpsD8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45798952"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45798952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 02:12:58 -0700
X-CSE-ConnectionGUID: BKbwxje2SRaOVjZdBpxC1A==
X-CSE-MsgGUID: qtCpP0IkTEKhq8Upp+5Hxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134008656"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 02:12:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 3D8FC78B; Fri, 11 Apr 2025 12:12:56 +0300 (EEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 07/11] usb: xhci: move enabling of USB 3 device notifications
Date: Fri, 11 Apr 2025 12:11:51 +0300
Message-ID: <20250411091155.3386971-8-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411091155.3386971-1-niklas.neronin@linux.intel.com>
References: <20250411091155.3386971-1-niklas.neronin@linux.intel.com>
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
index 7525713f0774..1b05704a1852 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2376,7 +2376,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	struct xhci_interrupter *ir;
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
-	u32		temp;
 
 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2463,15 +2462,6 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
index e5e5a50d9617..8fe217cdf80f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -523,6 +523,20 @@ static void xhci_set_doorbell_ptr(struct xhci_hcd *xhci)
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
@@ -560,6 +574,9 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set Doorbell array pointer */
 	xhci_set_doorbell_ptr(xhci);
 
+	/* Set USB 3.0 device notifications for function remote wake */
+	xhci_set_dev_notifications(xhci);
+
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 38058006f79b..b8e6ce888032 100644
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


