Return-Path: <linux-usb+bounces-18588-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D89F49E0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 12:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F37F816ACB0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 11:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5A81EE028;
	Tue, 17 Dec 2024 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOwuY3Y+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C41EC4EE
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734434996; cv=none; b=bQIUzXeg7t/KqKUVktseFEAgJTE1j1f/qJHWWQU3GIqTZb0IQ+lul0LsyjBz4Y+dMLpWtnTaw5G3m08jf/xO7z1o2MQCHydcK0AL9aR6S3Fl2uycwdMF8S8EO9/mws31QNrvKHKoM4LgUV7tQY41qdqr7fNLnXmFqyoNrOO4T+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734434996; c=relaxed/simple;
	bh=p715tLQkz7+MGl9DNtWrXEZgZa8rp+2hCNV7ofrYtko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rk+r8YbL6MQElOrtRL/sJqrIo+hGd8cRTkWJm1pqSsQecg7fHjDegcPTnW9P7zk3Le4qGcloU+q3DvhZRbHFR96jWoD3lXxpp1MvFKHIevnjeWNo4XCKw7DJJpMvSn0ZKiu4i4LNHRUnvY/RRi9JssCtSZdk17mnydgeZbQaUN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOwuY3Y+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734434995; x=1765970995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p715tLQkz7+MGl9DNtWrXEZgZa8rp+2hCNV7ofrYtko=;
  b=XOwuY3Y+XAk0N1/pfS/IwMn7npTJJpMT66NsBnRuvk54uRVxxjWg3YO+
   RD5+3cj3bgYUTz0+LBALgEuOuqgua8EAhTIyjokl+7Jr0x4yzcXCjKD/f
   rIgrvhAElPrZfdtEHfABoiccg72FPMAR+nqDPVwQL68GXoNh+OtqwVb06
   WX/2uRqahAZVvygQOgs/GstHuUBMn02dDejBX/WA2tqIPJI/fZfP9h8iL
   ri1Ec0eAnHdyCKZ2mbUWyG/BZb+Ghrtg0k8wFKxpAvdZ57drcWZHohglL
   541qtKJeIOIY3dahIXHJIzdDxnsLLTozgVWcrB5YVBO21X3pH77XB5LES
   g==;
X-CSE-ConnectionGUID: XqbzpyEIRtGxzgMPJ6EGJw==
X-CSE-MsgGUID: QeN5NY4sSq2JSiUGX13apg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34146748"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34146748"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 03:29:55 -0800
X-CSE-ConnectionGUID: 8uO8MqBzRLWQ63d0EGCB4Q==
X-CSE-MsgGUID: bTYtkxifQ72CsKhZK+Doiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120766570"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 17 Dec 2024 03:29:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id 6B91E329; Tue, 17 Dec 2024 13:29:52 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: WeitaoWang-oc@zhaoxin.com,
	mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/2] usb: xhci: set page size to the xHCI-supported size
Date: Tue, 17 Dec 2024 13:29:16 +0200
Message-ID: <20241217112917.623898-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217112917.623898-1-niklas.neronin@linux.intel.com>
References: <20241217112917.623898-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current xHCI driver does not validate whether a page size of 4096
bytes is supported. Address the issue by setting the page size to the
value supported by the xHCI controller, as read from the Page Size
register.

Additionally, this commit removes unnecessary debug messages and instead
prints the supported and used page size once.

The xHCI controller supports page sizes of (2^{(n+12)}) bytes, where 'n'
is the Page Size Bit. Only one page size is supported, with a maximum
page size of 128 KB.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 28 ++++++++++++----------------
 drivers/usb/host/xhci.h     |  8 ++++----
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d2900197a49e..471afeba2828 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1959,7 +1959,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->interrupters = NULL;
 
 	xhci->page_size = 0;
-	xhci->page_shift = 0;
 	xhci->usb2_rhub.bus_state.bus_suspended = 0;
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
 }
@@ -2378,6 +2377,16 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 }
 EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
+static void xhci_hcd_page_size(struct xhci_hcd *xhci)
+{
+	u32 page_shift;
+
+	page_shift = readl(&xhci->op_regs->page_size) & XHCI_PAGE_SIZE_MASK;
+	xhci->page_size = page_shift << 12;
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "HCD page size set to %iK",
+		       xhci->page_size >> 10);
+}
+
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct xhci_interrupter *ir;
@@ -2385,7 +2394,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	dma_addr_t	dma;
 	unsigned int	val, val2;
 	u64		val_64;
-	u32		page_size, temp;
+	u32		temp;
 	int		i;
 
 	INIT_LIST_HEAD(&xhci->cmd_list);
@@ -2394,20 +2403,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	INIT_DELAYED_WORK(&xhci->cmd_timer, xhci_handle_command_timeout);
 	init_completion(&xhci->cmd_ring_stop_completion);
 
-	page_size = readl(&xhci->op_regs->page_size);
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Supported page size register = 0x%x", page_size);
-	i = ffs(page_size);
-	if (i < 16)
-		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Supported page size of %iK", (1 << (i+12)) / 1024);
-	else
-		xhci_warn(xhci, "WARN: no supported page size\n");
-	/* Use 4K pages, since that's common and the minimum the HC supports */
-	xhci->page_shift = 12;
-	xhci->page_size = 1 << xhci->page_shift;
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"HCD page size set to %iK", xhci->page_size / 1024);
+	xhci_hcd_page_size(xhci);
 
 	/*
 	 * Program the Number of Device Slots Enabled field in the CONFIG
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f0fb696d5619..03c0f2226571 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -211,6 +211,9 @@ struct xhci_op_regs {
 #define CONFIG_CIE		(1 << 9)
 /* bits 10:31 - reserved and should be preserved */
 
+/* bits 15:0 - HCD page shift bit */
+#define XHCI_PAGE_SIZE_MASK     0xffff
+
 /**
  * struct xhci_intr_reg - Interrupt Register Set
  * @irq_pending:	IMAN - Interrupt Management Register.  Used to enable
@@ -1502,10 +1505,7 @@ struct xhci_hcd {
 	u16		max_interrupters;
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
-	/* 4KB min, 128MB max */
-	int		page_size;
-	/* Valid values are 12 to 20, inclusive */
-	int		page_shift;
+	u32		page_size;
 	/* MSI-X/MSI vectors */
 	int		nvecs;
 	/* optional clocks */
-- 
2.45.2


