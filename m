Return-Path: <linux-usb+bounces-8464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B7788D956
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 09:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4D0E1C27145
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 08:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA6C28DBC;
	Wed, 27 Mar 2024 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="n88nr3Kz";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qf3dezZ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84252DF87
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711528904; cv=none; b=EyRuuImGqxrZXYAiGBEOmRevNZ4wF4IBTIgW0WCMXIEka2hT/o14YdQQAvjaFvVPoQCeLmt/JauVViGHawoid6WKzM53PeY4FmTG8JxEolD6p24rKPBGndZX9HnW7/Zy3Pr0fiXDhLf04Req2hqtREUf/k4/xFHX0Q/4UZUAeOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711528904; c=relaxed/simple;
	bh=OYILgdzTINEH3VmskFVu1t5Z0931Bua1N+FYSvPwA48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o9Emf6Y9sQIVD4jygEsZX9ja+0h7/nxWUVEcfppjEwo04Aej/x/CNQFw/GSHAFucTO6kyzP0jeDIs67x4fA0BDlmjbASm6s7zxBhOrV/4n2JAr0bJm1+pStJ6oj2AaaZvirHroP49yMQgP7oJFDbeY64y7jBt7qLS9VVA/hpMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=n88nr3Kz; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=qf3dezZ9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED02D60107;
	Wed, 27 Mar 2024 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711528900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/BYoUifRM9loeqoutl1efNwubnElYr4s/GB+9JfqXX8=;
	b=n88nr3Kz0I+U4eNACvVmcULLXyqMhq/cYOi9mFlN8ffDDnbAsctDFkrYDYss55+xPGK00R
	TM4UtYIDlJnJkXQR7v4QjWs9oHdYrjy8vtjDtz+4zUAJocmHL1j58oL1yI7p2SsGke7tij
	IcD8tPQh5aQ/f03SrLcHZG75V5f76Gc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711528899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/BYoUifRM9loeqoutl1efNwubnElYr4s/GB+9JfqXX8=;
	b=qf3dezZ9cYI3agMe3wVVdf9nNTZRhXwoRnofJ2Z6c6wIzjQSpWoDndEvhSBisn1xQ1vxAX
	EO/YF6VRlriCK/PmeZ8Z1Y7hmz1uFlkrA71aVYG5issLQNV5Rnpdaomq6PJZpyJm1a/xjB
	DllkTuusfZtytDZf3tv/aAhUneZUWoM=
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AC92B13AC5;
	Wed, 27 Mar 2024 08:41:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id tFqEJ8PbA2a/fAAAn2gu4w
	(envelope-from <oneukum@suse.com>); Wed, 27 Mar 2024 08:41:39 +0000
From: Oliver Neukum <oneukum@suse.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: xhci: correct return value in case of STS_HCE
Date: Wed, 27 Mar 2024 09:41:11 +0100
Message-ID: <20240327084136.29663-1-oneukum@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.69
X-Spamd-Result: default: False [3.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[48.93%]
X-Spam-Flag: NO

If we get STS_HCE we give up on the interrupt, but for the purpose
of IRQ handling that still counts as ours. We may return IRQ_NONE
only if we are positive that it wasn't ours. Hence correct the default.

Fixes: 2a25e66d676df ("xhci: print warning when HCE was set")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/host/xhci-ring.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a820ddbff4c7..a8d6d8bb8a3e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3133,7 +3133,7 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 irqreturn_t xhci_irq(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	irqreturn_t ret = IRQ_NONE;
+	irqreturn_t ret = IRQ_HANDLED;
 	u32 status;
 
 	spin_lock(&xhci->lock);
@@ -3141,12 +3141,13 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	status = readl(&xhci->op_regs->status);
 	if (status == ~(u32)0) {
 		xhci_hc_died(xhci);
-		ret = IRQ_HANDLED;
 		goto out;
 	}
 
-	if (!(status & STS_EINT))
+	if (!(status & STS_EINT)) {
+		ret = IRQ_NONE;
 		goto out;
+	}
 
 	if (status & STS_HCE) {
 		xhci_warn(xhci, "WARNING: Host Controller Error\n");
@@ -3156,7 +3157,6 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	if (status & STS_FATAL) {
 		xhci_warn(xhci, "WARNING: Host System Error\n");
 		xhci_halt(xhci);
-		ret = IRQ_HANDLED;
 		goto out;
 	}
 
@@ -3167,7 +3167,6 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	 */
 	status |= STS_EINT;
 	writel(status, &xhci->op_regs->status);
-	ret = IRQ_HANDLED;
 
 	/* This is the handler of the primary interrupter */
 	xhci_handle_events(xhci, xhci->interrupters[0]);
-- 
2.44.0


