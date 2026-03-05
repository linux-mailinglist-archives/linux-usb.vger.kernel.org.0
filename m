Return-Path: <linux-usb+bounces-34110-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJhMD9WbqWn7AwEAu9opvQ
	(envelope-from <linux-usb+bounces-34110-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:05:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A97214254
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D869431DDB57
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EEB3A9605;
	Thu,  5 Mar 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCTVfRsg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA0E331207
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722142; cv=none; b=i/JSXvmMEVyl3HDWTZ0l2ZmtOa6BnP8urxPW/7yeYbjUVTjTiCiJ7kNYCAcpZkXq5xFCb1peHUxL3u7fQb5a7khxZFi6wkHV6/FN8J53h7YzEJAzHBt9AyPY2kgPTpB/zT/Bzl179Bq6auIafbnAQSL3qzTm4Unkm14E9qoI708=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722142; c=relaxed/simple;
	bh=g4FrkwZjfWF/+Ll5MCk9rypSH5nitKqXotztU6QEuqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A4QL2NZkZvigrVQlnI7LXNNaIktLoquXCwGRZJGLRPT/S5qVxMt91OX1UUhNrhtKJ00rv79GllqmZQ6iUAl9v84iy0WlzRMi+PpQMjqNqeq6JJ04r2t8x4RS5wNOyBXaQAKP0+0G5NFzsabRn+otjvxdi/51aP+FFB+G4/Gg+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCTVfRsg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722141; x=1804258141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g4FrkwZjfWF/+Ll5MCk9rypSH5nitKqXotztU6QEuqg=;
  b=kCTVfRsgzkUt5CpSkMqm8H7WYS8GXrHkO+07gqvvGqXA+qHFtosaScyZ
   SvUSaXpoIDMkJfFw8E4Pk11768FDQCw0Ji+ctbhfuMq0L4uh/tlHMTPl3
   F5DC47TEZzVrKCx/4eXzhfTV/PQgbTf4xN/yLH+ryEljsNKCtlThJGU7Y
   mCsX0DhpjgcIw9VAIfJhjoaeZTpUi45RVsEhxcPqJI8s23EInFYIPRYf0
   Jt9T4xf4+39Afb8Jl5KugIJ/YglOyjwBJvDG1dwWJumFWM+P0YRU7yUxa
   6f5Un7aZWd2mtYrNX1HBKSUEoFIzGxYKQibc1yLstHzm1Z2esjU8jsjZO
   g==;
X-CSE-ConnectionGUID: IgzwEoiwRwi8anMxB/kF4w==
X-CSE-MsgGUID: qk4ZnynbRYCl4+yzM7CpNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77411870"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77411870"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:49:01 -0800
X-CSE-ConnectionGUID: WjO/ghu5RzSfRbtbEHxOrA==
X-CSE-MsgGUID: JtcgK8YiQdupveFTqVXCvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218659801"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 06:48:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 862D29B; Thu, 05 Mar 2026 15:48:58 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [RFC PATCH 12/12] usb: xhci: prepare IRQ handler for multiple interrupters
Date: Thu,  5 Mar 2026 15:48:24 +0100
Message-ID: <20260305144824.3264408-13-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 35A97214254
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34110-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.intel.com:mid]
X-Rspamd-Action: no action

The xHCI driver currently assumes a single interrupter (index 0), and the
IRQ handler receives a pointer to the struct 'xhci', from which it directly
accesses 'xhci->interrupters[0]'.

To support multiple interrupters, the IRQ handler must be able to identify
the specific interrupter instance that triggered the interrupt. Do this by
passing a pointer to the corresponding struct 'xhci_interrupter' instead of
the global struct 'xhci'. Add a back-pointer to struct 'xhci' in struct
'xhci_interrupter' so the handler can still access ore data.

This change is necessary to prepare the driver for multiple interrupters.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  |  1 +
 drivers/usb/host/xhci-pci.c  |  2 +-
 drivers/usb/host/xhci-ring.c | 19 ++++++++++++++-----
 drivers/usb/host/xhci.h      |  3 ++-
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a6fde127c569..30eb0a79ef20 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2331,6 +2331,7 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 	u32 erst_size;
 
 	ir = xhci->interrupters[intr_num];
+	ir->xhci = xhci;
 	ir->intr_num = intr_num;
 	ir->ir_set = &xhci->run_regs->ir_set[intr_num];
 
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index ea43b0153430..c1b8062c5467 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -175,7 +175,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	}
 
 	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
-			  xhci_to_hcd(xhci));
+			  &xhci->interrupters[0]);
 	if (ret)
 		goto free_irq_vectors;
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9315ba18310d..5e303f8f0e4f 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3174,9 +3174,9 @@ void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
  * indicators of an event TRB error, but we check the status *first* to be safe.
  */
-irqreturn_t xhci_irq(struct usb_hcd *hcd)
+static irqreturn_t xhci_irq_handler(struct xhci_interrupter *ir)
 {
-	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_hcd *xhci = ir->xhci;
 	irqreturn_t ret = IRQ_HANDLED;
 	u32 status;
 
@@ -3213,16 +3213,25 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	writel(status, &xhci->op_regs->status);
 
 	/* This is the handler of the primary interrupter */
-	xhci_handle_events(xhci, xhci->interrupters[0], false);
+	xhci_handle_events(xhci, ir, false);
 out:
 	spin_unlock(&xhci->lock);
 
 	return ret;
 }
 
-irqreturn_t xhci_msi_irq(int irq, void *hcd)
+irqreturn_t xhci_irq(struct usb_hcd *hcd)
 {
-	return xhci_irq(hcd);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	return xhci_irq_handler(xhci->interrupters[0]);
+}
+
+irqreturn_t xhci_msi_irq(int irq, void *data)
+{
+	struct xhci_interrupter *ir = *(struct xhci_interrupter **)data;
+
+	return xhci_irq_handler(ir);
 }
 EXPORT_SYMBOL_GPL(xhci_msi_irq);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 1e9ea6507813..1b177882851f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1451,6 +1451,7 @@ enum interrupter_type {
 };
 
 struct xhci_interrupter {
+	struct xhci_hcd		*xhci;
 	struct xhci_ring	*event_ring;
 	struct xhci_erst	erst;
 	struct xhci_intr_reg __iomem *ir_set;
@@ -1905,7 +1906,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
 int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
-irqreturn_t xhci_msi_irq(int irq, void *hcd);
+irqreturn_t xhci_msi_irq(int irq, void *data);
 int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
-- 
2.50.1


