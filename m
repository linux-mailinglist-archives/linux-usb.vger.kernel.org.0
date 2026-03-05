Return-Path: <linux-usb+bounces-34102-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK2wNJyZqWm7AgEAu9opvQ
	(envelope-from <linux-usb+bounces-34102-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD5213F34
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 15:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CD6831433EE
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9B43A9638;
	Thu,  5 Mar 2026 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeJW7h3w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32A39E6F4
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722139; cv=none; b=a44MJw11K46Lb+Pzn5OuMtWdWjOrXAc92HX5yqrM1hASOcbwMBgciGUlFoSyCbksdZ5pr3F2t4pmLS44VVFMapI5l19z74Qnk1AKUt47UbbM95z6qSPX20BHHBJNDow+0mb0mb0fgQxT9TTa9vQlE8nzXZ2E3xWfdbQ0rCMj8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722139; c=relaxed/simple;
	bh=xQWxdfk+FLvxMHq51C/OwX/yusnN8lw+kU0JeFPfqn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7UXK3UCCGQzepeQnO0C9XVEbf2ECVtliNj0qElZbXggM5x12wq7xG2xrD23S0SQuO1LAjMIcMQxrssaEAl5gh927ZNZAFtl8OXTur2aINOfxtFv7OxSlYw4P3b4DpoVfgMRdnamxr3Y6JN2zp4jikQ0s/FCjJ9dumDCyuDQjm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeJW7h3w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722138; x=1804258138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xQWxdfk+FLvxMHq51C/OwX/yusnN8lw+kU0JeFPfqn8=;
  b=HeJW7h3wfKqdT3z34f7oXj4fL/v5KU8UKzCs7TCVNgSLuic22eCrTMsO
   /ZRLhFZuKLvmFLqtrBSNNgBWOMxJzfyNRkflBdeOEU+7xcEKb9qmqNq5w
   Bu+ZJc6TmIWBNndYT/lbGrHdCGG8+1TLJCPQavPgzroJP1+rAv6utxF+7
   rDuocBrQL/RzqJynpOnpGks+UrTUMR+EzvUHtzdv+jd1b5BrS1tfR4tku
   nHY1isCp7cC0HJTTG2oX2Qt/CWBzqWrZZqDN7ETjWaEdV8JILlEPIC95K
   0iNU+Mr/tWdekw6xB/q0QoVxPmukts7w7r46KoqQT3/1fi6basv1I+5Ul
   A==;
X-CSE-ConnectionGUID: tipOIRYaQ5yGKDDnYW2Lcw==
X-CSE-MsgGUID: PkOuJykyTMOX5+uEhoYdEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77411851"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77411851"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:48:55 -0800
X-CSE-ConnectionGUID: OhKp0NLfTcarEhg6XWIoMQ==
X-CSE-MsgGUID: JYHdRv8TRiWacvj6qSUtYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218659792"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2026 06:48:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 1936C95; Thu, 05 Mar 2026 15:48:52 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Thinh.Nguyen@synopsys.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [RFC PATCH 03/12] usb: xhci: simplify USBSTS register reset
Date: Thu,  5 Mar 2026 15:48:15 +0100
Message-ID: <20260305144824.3264408-4-niklas.neronin@linux.intel.com>
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
X-Rspamd-Queue-Id: 57DD5213F34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34102-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The current code clears the USB Status Register (USBSTS) and then sets
the Enable Interrupt (EINT) bit to '1'. A mask (~0x1fff) is used to avoid
modifying reserved bits 31:13, but it also inadvertently excludes reserved
bits 7:5, 1. These fields are defined as RsvdZ, so writing '0' to them has
no effect.

According to the xHCI specification, section 5.1.1:
"System software shall mask all reserved fields (Rsvd, RsvdP or RsvdZ) to
 '0' before evaluating a register or data structure value. This will enable
 current system software to run with future xHCI implementations that
 define the reserved fields."

Given this, it is safe to write zero to all bits of USBSTS except EINT.
This allows the mask and the register read to be removed, simplifying the
code, avoiding potential future issues and removing unexplained hex.

USB Status Register; xHCI Specification, version 1.2 section 5.4.2

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a288f59c604c..ad095768ed48 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -705,7 +705,6 @@ EXPORT_SYMBOL_GPL(xhci_run);
  */
 void xhci_stop(struct usb_hcd *hcd)
 {
-	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir = xhci->interrupters[0];
 
@@ -740,8 +739,7 @@ void xhci_stop(struct usb_hcd *hcd)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"// Disabling event ring interrupts");
-	temp = readl(&xhci->op_regs->status);
-	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
+	writel(STS_EINT, &xhci->op_regs->status);
 	xhci_disable_interrupter(xhci, ir);
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
@@ -1174,8 +1172,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 			return retval;
 
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
-		temp = readl(&xhci->op_regs->status);
-		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
+		writel(STS_EINT, &xhci->op_regs->status);
 		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
 
 		xhci_dbg(xhci, "cleaning up memory\n");
-- 
2.50.1


