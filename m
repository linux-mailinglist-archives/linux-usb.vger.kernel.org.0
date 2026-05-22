Return-Path: <linux-usb+bounces-37918-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF9+ADYbEGqlTgYAu9opvQ
	(envelope-from <linux-usb+bounces-37918-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:00:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7522C5B0CED
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 242EC300E025
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 09:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6981032938D;
	Fri, 22 May 2026 09:00:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF73B637F;
	Fri, 22 May 2026 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440429; cv=none; b=hbhLeAG422Lkl0MV2TS+/65/X6P1iDY9tRwxU8ugjB8slvmcQ1mO3aN9ga5BSQh8cmAdYKCx6WOjGUtsSsw73BOEHEWgSNei2iYUA4H6M7Cch6S1dZ3bu+Scq8APJkOdn/pyed7mNZ3oo5Js83cr/t3cdk5RSbqQkfumCK/xDWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440429; c=relaxed/simple;
	bh=SOTyRTtHeW9kZGm6MBkk/lUYdAmFEbmAGA/vOsy+fOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WvdrLjYOzwXQFMwfQ+w/2yfpuHu1mD2tIJKAeqTsRiMUpQQrO9MwwLAU7LJt9z0nefxsFDT83y2ueJe+y76YDigTpFYKoakFkOAX0ruw75ScdgURxWAwSEL9Wm7kcYGov5spMquNU1XDxMD9IEZYqiYA9CMZaoZJ3hTI9xd7plc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu.molgen.mpg.de (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 86E504C1511A90;
	Fri, 22 May 2026 10:59:41 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	George D Sworo <george.d.sworo@intel.com>,
	Rajat Jain <rajatja@google.com>,
	Sean Paul <seanpaul@chromium.org>,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	Matt DeVillier <matt.devillier@gmail.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] xhci: add helper to check for pending interrupt
Date: Fri, 22 May 2026 10:58:25 +0200
Message-ID: <20260522085828.24142-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,google.com,chromium.org,gmail.com,molgen.mpg.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37918-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[mpg.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mpg.de:email,molgen.mpg.de:mid,chromium.org:email]
X-Rspamd-Queue-Id: 7522C5B0CED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mathias Nyman <mathias.nyman@linux.intel.com>

xhci driver needs to manually check if xHC has raised an interrupt in
several places. Add a helper for it, use it in `xhci_pending_portevent()`.

Return 1 if there is a pending interrupt, -ENODEV on error (dead device),
0 otherwise.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
(cherry picked from commit 741aeecfd9a1b2437c5ee1d70745b1bfd90fb7d6
git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-next)

[pmenzel: As of 7.1-rc4, the commit is not Linus’ master branch, so port
  it from the ChromiumOS Linux kernel branch chromium/chromeos-6.12.]

BUG=b:192925463
TEST=Test S0ix for 500 cycles on brya.

Signed-off-by: George D Sworo <george.d.sworo@intel.com>
Change-Id: If7d584369e107a6497b10f3346c05e0c32920bcb
Reviewed-on: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3313527
Reviewed-by: Rajat Jain <rajatja@google.com>
Commit-Queue: Rajat Jain <rajatja@google.com>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
Reviewed-on: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/3399807
Tested-by: Rajat Jain <rajatja@google.com>

Origin-6-6: 8651d395a93eba47285700a373c12aa53be047ea
Signed-off-by: Tzung-Bi Shih <tzungbi@chromium.org>

Link: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/9fc38e27c31ae70d7b7829ff61cfcd18c18d3514
Assisted-by: Claude Sonnet 4.6
Cc: Matt DeVillier <matt.devillier@gmail.com>
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/usb/host/xhci.c | 17 ++++++++++++++---
 drivers/usb/host/xhci.h |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a54f5b57f205..8d4d6a524d05 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -97,6 +97,19 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
 	return ret;
 }
 
+/* return 1 if there is a pending interrupt, -ENODEV on error, 0 otherwise */
+int xhci_pending_interrupt(struct xhci_hcd *xhci)
+{
+	u32 status;
+
+	status = readl(&xhci->op_regs->status);
+
+	if (status == ~(u32)0)
+		return -ENODEV;
+
+	return !!(status & STS_EINT);
+}
+
 /*
  * Disable interrupts and begin the xHCI halting process.
  */
@@ -918,11 +931,9 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 {
 	struct xhci_port	**ports;
 	int			port_index;
-	u32			status;
 	u32			portsc;
 
-	status = readl(&xhci->op_regs->status);
-	if (status & STS_EINT)
+	if (xhci_pending_interrupt(xhci) > 0)
 		return true;
 	/*
 	 * Checking STS_EINT is not enough as there is a lag between a change
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index aeecd301f207..82a0596c0ae9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1955,6 +1955,7 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+int xhci_pending_interrupt(struct xhci_hcd *xhci);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
 void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
-- 
2.53.0


