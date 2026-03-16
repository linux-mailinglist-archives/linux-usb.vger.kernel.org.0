Return-Path: <linux-usb+bounces-34876-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDLbLaITuGk7YwEAu9opvQ
	(envelope-from <linux-usb+bounces-34876-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:28:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 325EB29B5DE
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6558E30480DB
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A87628727A;
	Mon, 16 Mar 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtNFiCRN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8083D27FB18
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671265; cv=none; b=jQLOImsSCIJ/lK+aDfytjUoxnBfm+oWpN0h3iARDLwQcxDmOYuf5DgZUGddV9uvCJyFwLkTRjt7OtN5NDU9x7+44HotZ+OlAZUZaYsTfzZl7QRRcqkv1ODZ2t0ObpjDnpXWy2SVGh2rxQiMutigVxcWy9ssIeOuBXze/GQFGyig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671265; c=relaxed/simple;
	bh=pTTiBttQgQ+YAGFYvAYXPsauj6LHRK1Y1sHBPi5H/VE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezd7MCOgUddTpHKXcuDoG2NM5jI2yjK5H53V4LwaRuYoR8nBMsAtQxKwY+/Wu2I79j7PseU+eHO8b3shqpAjL5y4ebsWRgnZ0Td7kikp5871pe/zUo72XTd2Q6tPhOcyWECi/6cKGrxx+Ma+tjfYRaUa0wrN6R1ERFpFdpUiq90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtNFiCRN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773671265; x=1805207265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pTTiBttQgQ+YAGFYvAYXPsauj6LHRK1Y1sHBPi5H/VE=;
  b=PtNFiCRNAqQESeu6Gn3T5/pnp4LXizJPRtsRLe+KPQKjDGyzl8ggStsD
   VLE8gpTtYDLqdWHnk5U6UyZvB12NCXStLZRp7Lh2B6txfeTtSZolVOHPv
   AlNjWdL7uJDkCtD3jYyeUDdFNcUwn84gTjHK2IyS8/4RCwZ/SkwspYyyE
   eGaL5EBx9kQ4hAh9GzcGmmdXHb0yz9RYfIpR+XuGoMs1JxvtUIWerDUDZ
   Vx7qPOvn0VvxrBeFC6QI4gFkSySZB3J1b1LkQAQu/WfRsMb/TaqFsIBay
   zHDJuYoVDdlN0kXo9XYcLUcqmOdH1oh4J8XLJ72BN9Bd1dAkoYEbCq24K
   A==;
X-CSE-ConnectionGUID: gm5z766GRW6x2uTjR4aZQQ==
X-CSE-MsgGUID: R+ZfnSJhRbWhipHVKzf6Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74574303"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74574303"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 07:27:44 -0700
X-CSE-ConnectionGUID: KBE6LXkrR3Gu+AvRwcvB0Q==
X-CSE-MsgGUID: 3sHl4HdHQD2vLS2NnwLD/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="246787061"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 16 Mar 2026 07:27:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 9AFA199; Mon, 16 Mar 2026 15:27:41 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 1/2] usb: xhci: fix Command Aborting
Date: Mon, 16 Mar 2026 15:27:19 +0100
Message-ID: <20260316142720.1471906-2-niklas.neronin@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-34876-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 325EB29B5DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Aborting the command ring requires setting the Command Abort (CA) bit in
the 64-bit Command Ring Control Register (CRCR). Historically, several
attempts have been made to implement this correctly, but each introduced
its own problems. This patch fixes the final remaining issue: accidental
modification of the Command Ring Pointer (i'll abbreviate it to CRP).

Originally [1], the full 64-bit CRCR value was read and written back after
setting CA. This is a bit unnecessary, only RsvdP bits (5:4) should be
read and written back (for future-proofing). All other writable fields
read as zero.

Later patches attempted to solve an issues, caused by 64-bit writes being
split into two 32-bit writes. Writing the lower 31:0 bits first immediately
stopped the ring (CRR=0), and the following upper-half write then overwrote
part of CRP with zeroes, thus corrupting the CRP.
Patch [2] avoided this by writing only the lower 31:0 bits with CA set,
but that broke controllers that latch 64-bit registers only when the upper
bits are written, as reported in [3].

The current solution [4] attempted to fix this by writing the full 64-bit
CRCR with both CA and an updated CRP. This does not work. The patch tries
to modify CRP while setting CA, but with CRR=1 all writes to CRP are
ignored. Updating CRP requires writing only the CA bit, waiting for the
controller to process the abort and clear CRR, and only then writing the
full CRP value.
Writing a new CRP after CA clears CRR is also unsafe:
 * TRBs are 16-byte aligned (bits 3:0 clear)
 * CRP requires 64-byte alignment (bits 5:0 clear)
Writing a TRB pointer into CRP truncates bits 5:4 and may produce an
incorrect address. Restoring the original CRP is also not possible,
CRCR reads return zero, and writing the original CRP back forces the
controller to restart execution from the beginning of the ring.

For a Command Abort to succeed, the CA bit must be set without modifying
the CRP. The following sequence ensures this:

  1. Write the lower 31:0 bits with only the CA bit set. Since CRR=1,
     CRP write is ignored.

  2. Poll CRR. If CRR becomes 0, the abort succeeded with CRP preserved.

  3. If CRR does not clear (timeout), test if controller requires an upper
     bits write to latch the register. Write the upper 63:32 bits (which
     does not update the CRP because CRR=1).
     Then poll CRR again. If CRR becomes 0, it was a latching issue and the
     abort succeeded with CRP preserved.

Because there are now two polling stages, each timeout has been reduced
from five seconds to three seconds. The comment explaining the 5 seconds
poll has been removed.

Link: https://git.kernel.org/torvalds/c/b92cc66c047f [1]
Link: https://lore.kernel.org/all/20211008092547.3996295-5-mathias.nyman@linux.intel.com/ [2]
Link: https://lore.kernel.org/all/20211022105913.7671-1-youling257@gmail.com/ [3]
Link: https://lore.kernel.org/20211126122340.1193239-2-mathias.nyman@linux.intel.com [4]
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 42 ++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1cbefee3c4ca..10160e76df68 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -489,38 +489,32 @@ static void xhci_handle_stopped_cmd_ring(struct xhci_hcd *xhci,
 /* Must be called with xhci->lock held, releases and acquires lock back */
 static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 {
-	struct xhci_segment *new_seg	= xhci->cmd_ring->deq_seg;
-	union xhci_trb *new_deq		= xhci->cmd_ring->dequeue;
-	u64 crcr;
+	u32 crcr_lo;
 	int ret;
 
 	xhci_dbg(xhci, "Abort command ring\n");
 
 	reinit_completion(&xhci->cmd_ring_stop_completion);
 
-	/*
-	 * The control bits like command stop, abort are located in lower
-	 * dword of the command ring control register.
-	 * Some controllers require all 64 bits to be written to abort the ring.
-	 * Make sure the upper dword is valid, pointing to the next command,
-	 * avoiding corrupting the command ring pointer in case the command ring
-	 * is stopped by the time the upper dword is written.
-	 */
-	next_trb(&new_seg, &new_deq);
-	if (trb_is_link(new_deq))
-		next_trb(&new_seg, &new_deq);
+	/* Preserve RsvdP (5:4), other writable bits read 0. */
+	crcr_lo = readl(&xhci->op_regs->cmd_ring);
+	crcr_lo |= CMD_RING_ABORT;
+	writel(crcr_lo, &xhci->op_regs->cmd_ring);
 
-	crcr = xhci_trb_virt_to_dma(new_seg, new_deq);
-	xhci_write_64(xhci, crcr | CMD_RING_ABORT, &xhci->op_regs->cmd_ring);
+	/* In the future we should try to recover a -ETIMEDOUT with a host controller reset */
+	ret = xhci_handshake(&xhci->op_regs->cmd_ring, CMD_RING_RUNNING, 0, 3 * USEC_PER_SEC);
+	if (ret == -ETIMEDOUT) {
+		/*
+		 * Some controllers only latch 64-bit registers when the upper (63:32) bits
+		 * are written.
+		 * While the ring is running, writes to bits 63:6 and bit 0 are ignored.
+		 */
+		xhci_dbg(xhci, "Ring still running, checking if HC needs full 64-bit CRCR write\n");
+		writel(0, (void __iomem *)(&xhci->op_regs->cmd_ring) + 4);
+		ret = xhci_handshake(&xhci->op_regs->cmd_ring, CMD_RING_RUNNING, 0,
+				     3 * USEC_PER_SEC);
+	}
 
-	/* Section 4.6.1.2 of xHCI 1.0 spec says software should also time the
-	 * completion of the Command Abort operation. If CRR is not negated in 5
-	 * seconds then driver handles it as if host died (-ENODEV).
-	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
-	 * and try to recover a -ETIMEDOUT with a host controller reset.
-	 */
-	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
-			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
 	if (ret < 0) {
 		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
 		xhci_halt(xhci);
-- 
2.50.1


