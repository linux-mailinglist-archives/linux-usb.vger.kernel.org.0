Return-Path: <linux-usb+bounces-37919-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL9ZBmsbEGrqTgYAu9opvQ
	(envelope-from <linux-usb+bounces-37919-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:01:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB95B0D09
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6EBFE3009E25
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 09:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D835D3B3BF2;
	Fri, 22 May 2026 09:01:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EF33B7B7A;
	Fri, 22 May 2026 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440468; cv=none; b=k/87aLxDevSeE4XROHoz8sh7iasD5M4MPVeRwMKM4JRkXAfMPCTWdUS27waEqNl5IsgINopNYpTaMhnkWxh4udBd+8Q38PLULPbOe+VKU5xv9d6qGsbZ7KHM1nxyawUOluRfWKRzLDfnzI1Uetyko/ZOuFxlZ4Cjw4N36mAHijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440468; c=relaxed/simple;
	bh=AaUjuQhlLZWOfe7Q39IOiiQkX8Iotw4lC0MNUFZ/NwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sSMVbYA0TlzZvoOd8GK2XV0/9rPzXR4LPGQnzkGBNf2ooAT9yNLYuCOzXCuTWrefuUlU59+hcX47/Znz+z7QO8I34sJqSch06mQpHTME7woJ2LFxbIhLJTl3X2FlqkiXS5NPNTxrLXLelD+IYX0tZe6eMXuc0WlJZBN770XZZSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu.molgen.mpg.de (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B8BA34C1511A93;
	Fri, 22 May 2026 10:59:53 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	George D Sworo <george.d.sworo@intel.com>,
	Matt DeVillier <matt.devillier@gmail.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] xhci: check for a pending command completion during command timeout
Date: Fri, 22 May 2026 10:58:27 +0200
Message-ID: <20260522085828.24142-4-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522085828.24142-2-pmenzel@molgen.mpg.de>
References: <20260522085828.24142-2-pmenzel@molgen.mpg.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,gmail.com,molgen.mpg.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37919-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[mpg.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mpg.de:email,molgen.mpg.de:mid,googlesource.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: D0EB95B0D09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mathias Nyman <mathias.nyman@linux.intel.com>

It's possible a command times out even if xHC hardware already completed
the command. Driver is unaware of the command completion if interrupt
handler is blocked for a long time.

Check if there is an unhandled command completion on the event ring during
command timeout.

In this case just give the command additional time to complete. There's no
point in aborting the command ring to move past a stuck command.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: George D Sworo <george.d.sworo@intel.com>
Link: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/478ab723af9414b0a2a2fbc59ac34f5d319a4fc3
[pmenzel: one adaptation for mainline 7.1: next_trb() uses the
  2-argument form next_trb(&seg, &deq) — the mainline 7.1 signature
  dropped the xhci and ring arguments present in the 6.12 source the
  patch was ported from.  xhci_pending_interrupt() is used directly as
  it is now committed as the preceding prerequisite.]
Assisted-by: Claude Sonnet 4.6
[pmenzel: No devices with the problem available, but no regressions on
  Dell XPS 13 9360 and QEMU 7.2.0.

      qemu-system-x86_64 -enable-kvm -cpu host -m 3G -device qemu-xhci,id=xhci -device usb-storage,bus=xhci.0

  xHCI host controller initialised cleanly, USB 3.0 SuperSpeed root
  hubs and USB mass storage device enumerated without errors.
  The specific race (command timeout with blocked interrupt handler)
  cannot easily be forced in QEMU, but no regressions in the normal
  command path were observed.]
Cc: Matt DeVillier <matt.devillier@gmail.com>
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/usb/host/xhci-ring.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e47e644b296e..7f023558af22 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1714,6 +1714,28 @@ void xhci_cleanup_command_queue(struct xhci_hcd *xhci)
 		xhci_complete_del_and_free_cmd(cur_cmd, COMP_COMMAND_ABORTED, 0);
 }
 
+static bool xhci_pending_command_completion(struct xhci_hcd *xhci)
+{
+	struct xhci_segment	*seg = xhci->interrupters[0]->event_ring->deq_seg;
+	union xhci_trb		*deq = xhci->interrupters[0]->event_ring->dequeue;
+	u32			deq_flags = le32_to_cpu(deq->event_cmd.flags);
+	u32			cycle = xhci->interrupters[0]->event_ring->cycle_state;
+	int			i = 0;
+
+	/* Check if event ring contains an unhandled command completion */
+	while ((deq_flags & TRB_CYCLE) == cycle) {
+		if ((deq_flags & TRB_TYPE_BITMASK) == TRB_TYPE(TRB_COMPLETION))
+			return true;
+		if (last_trb_on_ring(xhci->interrupters[0]->event_ring, seg, deq))
+			cycle ^= 1;
+		next_trb(&seg, &deq);
+		deq_flags = le32_to_cpu(deq->event_cmd.flags);
+		if (i++ > TRBS_PER_SEGMENT)
+			break;
+	}
+	return false;
+}
+
 void xhci_handle_command_timeout(struct work_struct *work)
 {
 	struct xhci_hcd	*xhci;
@@ -1736,6 +1758,14 @@ void xhci_handle_command_timeout(struct work_struct *work)
 		return;
 	}
 
+	/* Did hw complete the command but event handler was blocked? */
+	if (xhci_pending_interrupt(xhci) > 0 &&
+	    xhci_pending_command_completion(xhci)) {
+		xhci_dbg(xhci, "Command timeout with unhandled command completion\n");
+		xhci_mod_cmd_timer(xhci);
+		goto time_out_completed;
+	}
+
 	cmd_field3 = le32_to_cpu(xhci->current_cmd->command_trb->generic.field[3]);
 	usbsts = readl(&xhci->op_regs->status);
 	xhci_dbg(xhci, "Command timeout, USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
-- 
2.53.0


