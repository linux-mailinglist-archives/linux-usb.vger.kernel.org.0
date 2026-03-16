Return-Path: <linux-usb+bounces-34877-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QICTC64TuGk7YwEAu9opvQ
	(envelope-from <linux-usb+bounces-34877-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:29:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9212D29B5FD
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66C1A304C95B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E983D28853E;
	Mon, 16 Mar 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lB7gpFK9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45045280330
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671266; cv=none; b=d+Jd+uD5t0JLizxu087+9KyPmXWyKe7JpWSCFyJQfwGY8pNMgrcDmcIeA74RPq+RqM/hHV6+xYmdYK8a7MhbsyXn5NC5g41PkZQZFcWqozqiO/EhK0wGQNYTIGPle3mb5fvmBsGYDtFigwx7/BbpYVvXNv3x8lPthDXYN+Zfviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671266; c=relaxed/simple;
	bh=+/RTtBMTrrlzYmVas2sGF0iVWZM/3etHoke992MgYtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEU755FV+bORyl42QPaqtUJDcvDKQHP63ebx1EgFyDPFPwXk1Tv9tDNdo7X8SK7FINhR73CZpHYY7Hq07xMfnVB932VkTayCs8e4QCjfBW6yY1FEpKQW83NE5TRZ49tBQVdbcCv/obDE05gAB87Vi8reqECfObRxgch3e1ppEVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lB7gpFK9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773671265; x=1805207265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+/RTtBMTrrlzYmVas2sGF0iVWZM/3etHoke992MgYtE=;
  b=lB7gpFK95cpzsre3Oqi/PkwUvTgA1BEYhjhQ4HD2ZWqbKP5eXqQ0GqvB
   STaTLlaQLzLGkt5xfnROM5yth9tRVRrCRfRZ+2EeyV0uUp1mvAAbM7Dsr
   r0kqmmkXK4jDPPIULIQ1vt746OHXrAhzcJQZY7UunZsvIU35ez/9L5hed
   h4bJ0FHPZVM9W8pEvlA0M/wIURJcERaoX8QPFIe7nJ7nY67jHgwbT9ZTE
   h5bhcADwGGKJbXhzq76vHYmG42a+rSkMLIx5SwPCMCHOInbNOJoVHvBpB
   SWZ8JuMY0vCgw5HNrGTSRYr893YrNr6xAPdMA0/YeoOIWnUxa8LCkP+qE
   A==;
X-CSE-ConnectionGUID: 4Rpa+wweQkahAnvxvlabuA==
X-CSE-MsgGUID: rwBTi2/NSA2R6YFsHGwrdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78537837"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78537837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:27:44 -0700
X-CSE-ConnectionGUID: 89/g67LyQRyMUUW2D4ivbQ==
X-CSE-MsgGUID: 7ycFFUutSZqzCB3KdW7z9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218182575"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 16 Mar 2026 07:27:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 4D1149B; Mon, 16 Mar 2026 15:27:42 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/2] usb: xhci: use writeq() for CA write on 64-bit architectures
Date: Mon, 16 Mar 2026 15:27:20 +0100
Message-ID: <20260316142720.1471906-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
References: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34877-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.neronin@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,marc.info:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9212D29B5FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Setting the Command Abort (CA) bit in the Command Ring Control Register
(CRCR) stops command execution by clearing the Command Ring Running (CRR).
Some controllers latch CRCR only when the upper 32 bits are written,
requiring a retry sequence when the initial lower 32-bit write does not
update CRR. While CRR=1, the controller ignores all CRP updates, so no
field other than CA may be modified.

On 64-bit architectures (CONFIG_64BIT=y), writeq() performs a single,
atomic 64-bit MMIO write. Using writeq() for the CA write ensures that all
64 bits reach the controller in one bus transaction, without giving
controller the opportunity to process the abort between 32-bit writes.

All xHCI 64-bit registers are accessed via lo_hi_writeq().
Earlier attempts to replace these with writeq()/readq() caused regressions
and were reverted [1]. The underlying cause was never identified [2].
It may have been a quirk in writeq() implementation or controller-specific
hardware behavior, both of which are likely no longer relevant after more
than a decade of kernel and hardware evolution.

To reduce risk, this change introduces writeq() only for the CA write path
while retaining the fallback upper 32-bit write. This keeps the change
contained and allows gradual validation across different hardware.

Link: https://git.kernel.org/torvalds/c/477632dff5c7 [1]
Link: https://marc.info/?t=139093294600002&r=1&w=2 [2]
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 10160e76df68..e7910ae2e488 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -499,7 +499,12 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	/* Preserve RsvdP (5:4), other writable bits read 0. */
 	crcr_lo = readl(&xhci->op_regs->cmd_ring);
 	crcr_lo |= CMD_RING_ABORT;
+
+#ifdef CONFIG_64BIT
+	writeq(crcr_lo, &xhci->op_regs->cmd_ring);
+#else
 	writel(crcr_lo, &xhci->op_regs->cmd_ring);
+#endif
 
 	/* In the future we should try to recover a -ETIMEDOUT with a host controller reset */
 	ret = xhci_handshake(&xhci->op_regs->cmd_ring, CMD_RING_RUNNING, 0, 3 * USEC_PER_SEC);
-- 
2.50.1


