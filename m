Return-Path: <linux-usb+bounces-35867-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG8IL8ZuzmnxngYAu9opvQ
	(envelope-from <linux-usb+bounces-35867-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B43389B52
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7925730EB8BA
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332F42DCBF3;
	Thu,  2 Apr 2026 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGgNM2Dn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0D2877DA
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135834; cv=none; b=QOWZAQkvoTyLiC/cOzYbhr9DhaIODEa5qNFwP0S1Odkr5/7va1r/ApxhimdsERzCJ6Lu8VVfyjbJK4aAdI6lsECNSNg7uavhUFoMrEi4l5/FphkIsFL2p4KfiJlKuKbV0JpYzbUqi/4SsDbXvaj56BeZUNyLd+BFVih0BcHtwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135834; c=relaxed/simple;
	bh=ifix22+uBNL3tCAy8KVuIP6EWh9onYusKgR1NqJP9Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZDcbA3q/jUxMa3I5+wbLUuah6CvTyBy6v7ehdUEu/dI8vcuBfsRsctw1e/Q7VmqohxX4mJ8jluBcyfdI8wNhZTn2yH+PNpFRHYjocCkXS/mX+rsAFYT7Kq8zliR4ixWXlrn+MJUQAxu31f8Lo1IBVSFMK3lQPpNoNZrPRlHb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGgNM2Dn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775135834; x=1806671834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ifix22+uBNL3tCAy8KVuIP6EWh9onYusKgR1NqJP9Vs=;
  b=MGgNM2DnoVO0dkME2CLGV3A62r9t9fdt55xVYBX+UaM5hpyh3z0+G2qM
   S1cnHmgqhnRjJr9sULiAogrhKb1POFT70dNHq8Aze2HDWwSX5V1Dpr35N
   dvcFdc9dUUcV4y0/YSHXOym9Yd08TCwvbVtklmyThbzJ87zeZKS4XoYsv
   bMIdQ2blxs/Ip2kTlvRa6PPFV0Zpmd1WWiKnVwzCYWYmldxOyqJs7FC4Y
   r2sLqi5k1Kw+NET58CxVe6h8MFJhdjd5u3qEsHhFanXmvf7HrSd7WBiOe
   I1KkTlsWlETh3DxdbWJ0qPd3xCVUQNE0FtrfzDJK3blLdVz3usVtXGE0F
   A==;
X-CSE-ConnectionGUID: sk+07C4FRzeDAECujwdAmA==
X-CSE-MsgGUID: IheOJg9LQg+EZtYQMc0ozw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87650796"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87650796"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:14 -0700
X-CSE-ConnectionGUID: /TSYPWPhSryrxa3GwuY6WQ==
X-CSE-MsgGUID: oZDxKrwgSbC9JgmKBcgnlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227241481"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.50])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:17:12 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/25] usb: xhci: Simplify clearing the Event Interrupt bit
Date: Thu,  2 Apr 2026 16:13:19 +0300
Message-ID: <20260402131342.2628648-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35867-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 71B43389B52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michal Pecio <michal.pecio@gmail.com>

USBSTS is mostly RW1C, so to clear EINT we should write just this
one bit. Remove pointless code which ORs the bit with current value
of the register, even though the bit is already known to be set,
and writes the result back, which clears all active RW1C flags.

We used to inadvertently clear PCD and SRE in this way. PCD isn't
used by the driver and SRE is only used at resume, so clearing them
should make no difference. Don't clear them anymore.

Tested by connecting and mounting a storage device on a few HCs.

Before: xhci_irq USBSTS 0x00000018 EINT PCD -> 0x00000000
        xhci_irq USBSTS 0x00000008 EINT -> 0x00000000
After:  xhci_irq USBSTS 0x00000018 EINT PCD -> 0x00000010 PCD
        xhci_irq USBSTS 0x00000018 EINT PCD -> 0x00000010 PCD

Some flags are RsvdZ - should be written as zero regardless of the
value read, so technically it was a bug. But no problems are known.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1cbefee3c4ca..3589af0e2768 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3208,10 +3208,9 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	/*
 	 * Clear the op reg interrupt status first,
 	 * so we can receive interrupts from other MSI-X interrupters.
-	 * Write 1 to clear the interrupt status.
+	 * USBSTS bits are write 1 to clear.
 	 */
-	status |= STS_EINT;
-	writel(status, &xhci->op_regs->status);
+	writel(STS_EINT, &xhci->op_regs->status);
 
 	/* This is the handler of the primary interrupter */
 	xhci_handle_events(xhci, xhci->interrupters[0], false);
-- 
2.43.0


