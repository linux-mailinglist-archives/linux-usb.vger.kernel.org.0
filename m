Return-Path: <linux-usb+bounces-32876-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHzvHFnreWkF1AEAu9opvQ
	(envelope-from <linux-usb+bounces-32876-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:56:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D47299FCB8
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C263063A3D
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 10:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7369A335554;
	Wed, 28 Jan 2026 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="a8sRIDOY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22FF334C2C
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597598; cv=none; b=JMHkoYOH+q29vpDj0F9CZQ8JBnBO9/Q1blCsv5k8MMNHwAWd/ISKqxbLzjG/r8fl6LaeaGirS91sXmrQczCrnKkaXUjwpzARq59CabFu8q7hRnBGzgJXOhoKxawudxaB6t3OyQRbhi/2SL1ImTs8Avsdl4KkTJt6ydEFbsjH7kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597598; c=relaxed/simple;
	bh=Enm4PspiHKgWCY/M2YkY3HvWeNpsW2L9BjxSWQizuoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbOVHySuUeQ0A+Qgk77/V1pnGAHv3FgOB97/SSoXqlPfV4jZyomWU6wf2CZU0Awu865R0AaSFpKa7pFUl2F61B50EVv9PGlBIXyavfCVH+kbhw/46P+IvCXhP3Sem3GnfYgxfOAs79Ktx9j2QYHr7WVO7U9eWuLqzG7n+337an0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=a8sRIDOY; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769597568;
	bh=nUWqH7jA/BxKr6r4PGSwVMGz5KPl2PB2Nd9YQy7uI6g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=a8sRIDOY7cp1S+2ClbAVeHPL83Yyq0Q54ePN0kH+nrST62ntS3PDiM6+xMSBwrM65
	 hwXho3jKmWoOTlG02ipE5gnQHkM4HPwqH1YfG0y0hqJ6R0kfYQKDFyE5ueGtfPU8hn
	 UawwBQzIDapO5DDDV2rzi9SXFVlFkzI2LGz84d8g=
X-QQ-mid: zesmtpip2t1769597562t7c4003de
X-QQ-Originating-IP: z/cymZK3tF+sVHOP+ZUJKq+xZMOsQBC1VpOdX6JOXWs=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jan 2026 18:52:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4852473869823959833
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	kenny@panix.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	zhanjun@uniontech.com
Subject: [PATCH v12 2/2] usb: xhci: enable secondary interrupters and route transfers per slot
Date: Wed, 28 Jan 2026 18:52:38 +0800
Message-ID: <E3E429D835D20957+20260128105238.2541277-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <35BBAFB9EDB17421+20260128104815.2535380-1-raoxu@uniontech.com>
References: <35BBAFB9EDB17421+20260128104815.2535380-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MrL15gPbNc8sYLgbbbWipakkog+F4IlPN8UNfrZj0uFqK8UXfTqChTRO
	D4UyLZtshXjRcbjXhYMQd2asK9boF5Y1hFI3p0ixA75YRk3m4MOC/WEUACI274fUXGtxaR3
	hfuBEVa3bL8evGykhtCja41jj0jiwbv/uQoectESkgloqz4ljEfce/uywpWGlYl8qze3SBm
	Wud7etUGfW2HaZ476nR5g+g7Vq+K8xc8peA+bRgvhCr/m9sJakYCXns5BQN3zWfGcBCmcyq
	1jhufz56ri120B6iy5VGCWJrM/23E0WsQIiWEHGpVU/DFRq65NV6leNtKEogJCGxNmiWGHT
	MpN+SoJiQQJh/5tawq799feSbrFGZnUysKhSK5G3T0JKyG3Nuhy0ONYzBV9M2xgRyvEVpk9
	30SH3hJA+qByxV4CfYpW1qemRE9GCgQs6p/Z955fi3OzIqjYdYZYmVvW7pb0Bh4amvDG7wy
	sGa7LoYcE05+swmWbBVZ+HhP4LKzdne781DrnQrwxFf3V45fLfL6M/o0iiS1mCqCMyhWCmr
	T3te/+bnPvRCSAN56hefB4fy06hxiZJXTQtMiAMk2MNJNF1QtpqADzgFWD+YyDDKe2z3fVN
	AAsvLmev5dC6LAZ+4vGLsg0J43KgxTaj3f2nNqUprVoxsDEsBzKFiDkvFQwT0zD8inQ3MYG
	KmSmjJwl095U8Ermw5h6hBKkIZE8Oy03cQT3vClZsnOsxAodPsKib5Hh5cHDMF/ieZEjMLR
	I4aos7RXx96G0RhiAK2A6w3M5yZdB4YaJodfBHNAVIWEvW0nOLYVLmsXu2Xd5Eo548f8BN9
	5tKKzxFVZL602K2a1oDRFPm35HkhoDqEoJ8/eOsBk8KkItiGUthTk33GDUqiVbeVzUXqbsm
	6knDDTeoWI0dyhkV96j2RNrj3z0Wpp+qqzHNMoA+wkgmrww/H+KbiBq0WW98gY8JaScTXnY
	5LCsTY8NMWZtsr5KX0gcFLGjxRWdXGigbfZiCaizDkpngVg3q1Bjl5u72C94H2rsTqL4DfC
	bY38bi1N2oYg6YYnlQMA0FChCwG6qcEqy6ahHZoITJp+BQ9vJrYO7lp1ViU4561jueFnuqf
	g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32876-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.991];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,uniontech.com:email,uniontech.com:dkim,uniontech.com:mid]
X-Rspamd-Queue-Id: D47299FCB8
X-Rspamd-Action: no action

From: Xu Rao <raoxu@uniontech.com>

Some xHCI hosts expose multiple MSI/MSI-X vectors and support multiple
interrupters with independent event rings, but Linux commonly routes all
transfer completions through interrupter 0.

This is not about increasing USB link throughput, but about avoiding a
driver-imposed single hot spot. On hosts that already provide multiple
MSI/MSI-X vectors and independent event rings, routing all completions
through interrupter 0 creates unnecessary contention (serialized event
handling/locks and coupled moderation), increasing CPU cost and tail
latency under many active devices/endpoints. Using secondary interrupters
simply matches the hardware's design, similar in spirit to merged
xHCI-sideband work: exploit available parallel paths rather than
funneling all events through one.

Allocate a small capped set of secondary interrupters in xhci_mem_init()
(MAX_SECONDARY_INTRNUM, default 4) and request up to the matching number
of IRQ vectors (bounded by what PCI core provides).  Dispatch each vector
to its interrupter via the per-vector irq_ctx.

Route transfers per USB device (slot) by assigning vdev->interrupter at
device allocation time and programming the interrupter target (slot
context + TRB_INTR_TARGET) from that selection, so completions land on the
selected event ring.  Drain a slot's secondary event ring at selected
command completion boundaries to reduce late-event artifacts when teardown
happens on interrupter 0.

Signed-off-by: Xu Rao <raoxu@uniontech.com>

---
 drivers/usb/host/xhci-mem.c  |  33 ++++++++
 drivers/usb/host/xhci-pci.c  |  39 ++++++++-
 drivers/usb/host/xhci-ring.c | 151 ++++++++++++++++++++++++++++-------
 drivers/usb/host/xhci.c      |  16 +++-
 drivers/usb/host/xhci.h      |  10 +++
 5 files changed, 218 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c708bdd69f16..7092d797048c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1197,6 +1197,15 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud

 	ep0_ctx->tx_info = cpu_to_le32(EP_AVG_TRB_LENGTH(8));

+	/* Match Slot Context interrupter target to vdev->interrupter. */
+	if (dev->interrupter) {
+		u32 tt = le32_to_cpu(slot_ctx->tt_info);
+
+		tt &= ~SLOT_INTR_TARGET_MASK;
+		tt |= SLOT_INTR_TARGET(dev->interrupter->intr_num);
+		slot_ctx->tt_info = cpu_to_le32(tt);
+	}
+
 	trace_xhci_setup_addressable_virt_device(dev);

 	/* Steps 7 and 8 were done in xhci_alloc_virt_device() */
@@ -2402,6 +2411,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
+	unsigned int	secondary_intr_num = 0;
+	int		i;

 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2495,6 +2506,28 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters[0])
 		goto fail;

+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating secondary event ring");
+	if (xhci->max_interrupters > 1)
+		secondary_intr_num = min_t(unsigned int,
+				xhci->max_interrupters - 1,
+				(unsigned int)MAX_SECONDARY_INTRNUM);
+
+	xhci->secondary_irqs_alloc = 0;
+	for (i = 1; i <= secondary_intr_num; i++) {
+		if (xhci->interrupters[i])
+			continue;
+		xhci->interrupters[i] = xhci_alloc_interrupter(xhci, i, flags);
+		if (!xhci->interrupters[i]) {
+			while (--i >= 1) {
+				xhci_free_interrupter(xhci, xhci->interrupters[i]);
+				xhci->interrupters[i] = NULL;
+			}
+			xhci->secondary_irqs_alloc = 0;
+			break;
+		}
+		xhci->secondary_irqs_alloc++;
+	}
+
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 3e019f2811e7..28050222f53b 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -152,6 +152,8 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int ret;
 	struct xhci_irq_ctx *ctx;
+	unsigned int irqs_num;
+	int i;

 	/*
 	 * Some Fresco Logic host controllers advertise MSI, but fail to
@@ -174,7 +176,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)

 	/* TODO: Check with MSI Soc for sysdev */
 	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, xhci->nvecs,
-					    PCI_IRQ_MSIX | PCI_IRQ_MSI);
+					    PCI_IRQ_MSIX | PCI_IRQ_MSI | PCI_IRQ_AFFINITY);
 	if (xhci->nvecs < 0) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			       "failed to allocate IRQ vectors");
@@ -192,8 +194,43 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 		goto free_irq_vectors;

 	xhci->irqs_enabled = 1;
+
+	/*
+	 * Vector 0 IRQ handler is requested above.
+	 * Request IRQ handlers for up to secondary_irqs_alloc additional vectors
+	 * (vectors 1..), limited by what PCI core actually allocated.
+	 */
+	irqs_num = min_t(unsigned int,
+			(unsigned int)xhci->nvecs,
+			(unsigned int)(1 + xhci->secondary_irqs_alloc));
+
+	/* Vector 0 requested above; request up to sec_num secondary vectors (1..). */
+	for (i = 1; i < irqs_num; i++) {
+		ctx = &xhci->irq_ctx[i];
+		ctx->hcd = hcd;
+		ctx->intr_num = i;
+		ret = request_irq(pci_irq_vector(pdev, i), xhci_msi_irq, 0,
+				"xhci_hcd", ctx);
+		if (ret) {
+			xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+					"failed to request irq vector %d", i);
+			while (--i >= 1) {
+				free_irq(pci_irq_vector(pdev, i),
+						&xhci->irq_ctx[i]);
+				memset(&xhci->irq_ctx[i], 0,
+						sizeof(xhci->irq_ctx[i]));
+			}
+			xhci->irqs_enabled = 1;
+			break;
+		}
+		xhci->irqs_enabled++;
+	}
+
 	hcd->msi_enabled = 1;
 	hcd->msix_enabled = pdev->msix_enabled;
+
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "enabled %u %s interrupters",
+			xhci->irqs_enabled, pdev->msix_enabled ? "MSI-X" : "MSI");
 	return 0;

 free_irq_vectors:
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3ea134c07c5f..5a230dbc9430 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -64,6 +64,9 @@ static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			 u32 field1, u32 field2,
 			 u32 field3, u32 field4, bool command_must_succeed);

+static void xhci_handle_slot_secondary_events(struct xhci_hcd *xhci,
+		union xhci_trb *cmd_trb);
+
 /*
  * Returns zero if the TRB isn't in this segment, otherwise it returns the DMA
  * address of the TRB.
@@ -1859,6 +1862,9 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 		}
 	}

+	/* Handle slot secondary events before command-specific teardown logic */
+	xhci_handle_slot_secondary_events(xhci, cmd_trb);
+
 	cmd_type = TRB_FIELD_TO_TYPE(le32_to_cpu(cmd_trb->generic.field[3]));
 	switch (cmd_type) {
 	case TRB_ENABLE_SLOT:
@@ -3138,6 +3144,72 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 	return 0;
 }

+/*
+ * Handle a slot's secondary event ring at command completion boundaries.
+ *
+ * With secondary interrupters, transfer events may lag behind command
+ * completions (handled on interrupter 0). Commands that stop/reset/disable
+ * endpoints/slots can reclaim TD state before those transfer events are
+ * processed, leading to "Spurious event dma" reports. Call this from
+ * handle_cmd_completion() before command-specific completion handling.
+ */
+static void xhci_handle_slot_secondary_events(struct xhci_hcd *xhci,
+		union xhci_trb *cmd_trb)
+{
+	u32 field3, cmd_type, slot_id;
+	struct xhci_virt_device *vdev;
+	struct xhci_interrupter *sec_ir;
+	unsigned int intr;
+
+	/* No secondary routing -> nothing to do */
+	if (xhci->irqs_enabled <= 1)
+		return;
+
+	field3   = le32_to_cpu(cmd_trb->generic.field[3]);
+	cmd_type = TRB_FIELD_TO_TYPE(field3);
+	slot_id  = TRB_TO_SLOT_ID(field3);
+
+	if (!slot_id)
+		return;
+
+	/*
+	 * Handle only for commands that can stop/reset/disable endpoints/slots
+	 * and/or cause the driver to reclaim TD ownership.
+	 */
+	switch (cmd_type) {
+	case TRB_STOP_RING:
+	case TRB_SET_DEQ:
+	case TRB_RESET_EP:
+	case TRB_RESET_DEV:
+	case TRB_DISABLE_SLOT:
+		break;
+	case TRB_CONFIG_EP:
+		/* Only needed for deconfigure (drop endpoints) */
+		if (!(field3 & TRB_DC))
+			return;
+		break;
+	default:
+		return;
+	}
+
+	vdev = xhci->devs[slot_id];
+	if (!vdev || !vdev->interrupter)
+		return;
+
+	intr = vdev->interrupter->intr_num;
+	if (!intr || intr >= xhci->irqs_enabled)
+		return; /* slot is on primary interrupter */
+
+	sec_ir = xhci->interrupters[intr];
+	if (!sec_ir || !sec_ir->event_ring)
+		return;
+
+	lockdep_assert_held(&xhci->lock);
+
+	/* Handle pending events normally to complete URB/TD bookkeeping. */
+	xhci_handle_events(xhci, sec_ir, false);
+}
+
 /*
  * Move the event ring dequeue pointer to skip events kept in the secondary
  * event ring.  This is used to ensure that pending events in the ring are
@@ -3169,14 +3241,8 @@ void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
 	xhci_handle_events(xhci, ir, true);
 }

-/*
- * xHCI spec says we can get an interrupt, and if the HC has an error condition,
- * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
- * indicators of an event TRB error, but we check the status *first* to be safe.
- */
-irqreturn_t xhci_irq(struct usb_hcd *hcd)
+static irqreturn_t xhci_irq_ir(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
-	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	irqreturn_t ret = IRQ_HANDLED;
 	u32 status;

@@ -3188,7 +3254,11 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		goto out;
 	}

-	if (!(status & STS_EINT)) {
+	/*
+	 * STS_EINT is only meaningful for the primary interrupter (0).
+	 * Secondary vectors may interrupt without STS_EINT set.
+	 */
+	if (ir->intr_num == 0 && !(status & STS_EINT)) {
 		ret = IRQ_NONE;
 		goto out;
 	}
@@ -3204,30 +3274,52 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		goto out;
 	}

-	/*
-	 * Clear the op reg interrupt status first,
-	 * so we can receive interrupts from other MSI-X interrupters.
-	 * Write 1 to clear the interrupt status.
-	 */
-	status |= STS_EINT;
-	writel(status, &xhci->op_regs->status);
+	if (ir->intr_num == 0) {
+		/*
+		 * Clear the op reg interrupt status first,
+		 * so we can receive interrupts from other MSI-X interrupters.
+		 * Write 1 to clear the interrupt status.
+		 */
+		status |= STS_EINT;
+		writel(status, &xhci->op_regs->status);
+	}

-	/* This is the handler of the primary interrupter */
-	xhci_handle_events(xhci, xhci->interrupters[0], false);
+	/* Handle events for this interrupter. */
+	xhci_handle_events(xhci, ir, false);
 out:
 	spin_unlock(&xhci->lock);

 	return ret;
 }

+/*
+ * xHCI spec says we can get an interrupt, and if the HC has an error condition,
+ * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
+ * indicators of an event TRB error, but we check the status *first* to be safe.
+ */
+irqreturn_t xhci_irq(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	return xhci_irq_ir(xhci, xhci->interrupters[0]);
+}
+
 irqreturn_t xhci_msi_irq(int irq, void *data)
 {
 	struct xhci_irq_ctx *ctx = data;
+	struct xhci_hcd *xhci;
+	struct xhci_interrupter *ir;

-	/* For now only vector 0 is requested; keep behavior unchanged. */
+	/* All MSI/MSI-X vectors use ctx (dev_id) to select interrupter.*/
 	if (!ctx || !ctx->hcd)
 		return IRQ_NONE;
-	return xhci_irq(ctx->hcd);
+
+	xhci = hcd_to_xhci(ctx->hcd);
+	ir = xhci->interrupters[ctx->intr_num];
+	if (!ir)
+		return IRQ_NONE;
+
+	return xhci_irq_ir(xhci, ir);
 }
 EXPORT_SYMBOL_GPL(xhci_msi_irq);

@@ -3629,6 +3721,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	int sent_len, ret;
 	u32 field, length_field, remainder;
 	u64 addr, send_addr;
+	struct xhci_interrupter *ir;

 	ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ring)
@@ -3669,6 +3762,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_trb = &ring->enqueue->generic;
 	start_cycle = ring->cycle_state;
 	send_addr = addr;
+	ir = xhci->devs[slot_id]->interrupter;

 	/* Queue the TRBs, even if they are zero-length */
 	for (enqd_len = 0; first_trb || enqd_len < full_len;
@@ -3729,7 +3823,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,

 		length_field = TRB_LEN(trb_buff_len) |
 			TRB_TD_SIZE(remainder) |
-			TRB_INTR_TARGET(0);
+			TRB_INTR_TARGET(ir->intr_num);

 		queue_trb(xhci, ring, more_trbs_coming | need_zero_pkt,
 				lower_32_bits(send_addr),
@@ -3761,7 +3855,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		urb_priv->td[1].end_trb = ring->enqueue;
 		urb_priv->td[1].end_seg = ring->enq_seg;
 		field = TRB_TYPE(TRB_NORMAL) | ring->cycle_state | TRB_IOC;
-		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(0), field);
+		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(ir->intr_num), field);
 	}

 	check_trb_math(urb, enqd_len);
@@ -3783,6 +3877,9 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	u32 field;
 	struct urb_priv *urb_priv;
 	struct xhci_td *td;
+	struct xhci_interrupter *ir;
+
+	ir = xhci->devs[slot_id]->interrupter;

 	ep_ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ep_ring)
@@ -3805,7 +3902,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (last_trb_on_seg(ep_ring->enq_seg, ep_ring->enqueue + 1)) {
 			field = TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state;
 			queue_trb(xhci, ep_ring, false, 0, 0,
-					TRB_INTR_TARGET(0), field);
+					TRB_INTR_TARGET(ir->intr_num), field);
 		}
 	}

@@ -3856,7 +3953,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, true,
 		  setup->bRequestType | setup->bRequest << 8 | le16_to_cpu(setup->wValue) << 16,
 		  le16_to_cpu(setup->wIndex) | le16_to_cpu(setup->wLength) << 16,
-		  TRB_LEN(8) | TRB_INTR_TARGET(0),
+		  TRB_LEN(8) | TRB_INTR_TARGET(ir->intr_num),
 		  /* Immediate data in pointer */
 		  field);

@@ -3886,7 +3983,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				urb, 1);
 		length_field = TRB_LEN(urb->transfer_buffer_length) |
 				TRB_TD_SIZE(remainder) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);
 		if (setup->bRequestType & USB_DIR_IN)
 			field |= TRB_DIR_IN;
 		queue_trb(xhci, ep_ring, true,
@@ -3909,7 +4006,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, false,
 			0,
 			0,
-			TRB_INTR_TARGET(0),
+			TRB_INTR_TARGET(ir->intr_num),
 			/* Event on completion */
 			field | TRB_IOC | TRB_TYPE(TRB_STATUS) | ep_ring->cycle_state);

@@ -4099,7 +4196,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,

 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
-	ir = xhci->interrupters[0];
+	ir = xhci->devs[slot_id]->interrupter;

 	num_tds = urb->number_of_packets;
 	if (num_tds < 1) {
@@ -4200,7 +4297,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 						   urb, more_trbs_coming);

 			length_field = TRB_LEN(trb_buff_len) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);

 			/* xhci 1.1 with ETE uses TD Size field for TBC */
 			if (first_trb && xep->use_extended_tbc)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 18d3093b688a..3187f4b6943b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -577,9 +577,6 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set USB 3.0 device notifications for function remote wake */
 	xhci_set_dev_notifications(xhci);

-	/* Since only the main interrupt is used, secondary_irqs_alloc is set to 0. */
-	xhci->secondary_irqs_alloc = 0;
-
 	/*
 	 * Initialize all allocated interrupters here.
 	 * Use allocated count as loop bound to avoid touching non-allocated
@@ -4236,6 +4233,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	unsigned long flags;
 	int ret, slot_id;
 	struct xhci_command *command;
+	unsigned int sec_irqs, intr_num;

 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
@@ -4292,6 +4290,18 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)

 	udev->slot_id = slot_id;

+	/*
+	 * Spread devices across IRQ-backed secondary interrupters [1..].
+	 * If only vector 0 is enabled, default to interrupter 0.
+	 */
+	sec_irqs = (xhci->irqs_enabled > 1) ? (xhci->irqs_enabled - 1) : 0;
+	if (sec_irqs) {
+		intr_num = slot_id % sec_irqs;
+		vdev->interrupter = xhci->interrupters[intr_num + 1];
+	} else {
+		vdev->interrupter = xhci->interrupters[0];
+	}
+
 	xhci_debugfs_create_slot(xhci, slot_id);

 	/*
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 90d4ba6b3573..c437aace7af7 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -408,6 +408,11 @@ struct xhci_slot_ctx {
 #define SLOT_STATE_ADDRESSED	2
 #define SLOT_STATE_CONFIGURED	3

+/* Interrupter Target - tt_info[31:22] (xHCI Slot Context) */
+#define SLOT_INTR_TARGET_SHIFT 22
+#define SLOT_INTR_TARGET_MASK  (0x3ffU << SLOT_INTR_TARGET_SHIFT)
+#define SLOT_INTR_TARGET(p)    (((p) & 0x3ffU) << SLOT_INTR_TARGET_SHIFT)
+
 /**
  * struct xhci_ep_ctx
  * @ep_info:	endpoint state, streams, mult, and interval information.
@@ -767,6 +772,11 @@ struct xhci_virt_device {
 	void				*debugfs_private;
 	/* set if this endpoint is controlled via sideband access*/
 	struct xhci_sideband	*sideband;
+	/*
+	 * Default transfer-event interrupter for this USB device.
+	 * Queueing code programs TRB_INTR_TARGET() from vdev->interrupter.
+	 */
+	struct xhci_interrupter *interrupter;
 };

 /*
--
2.50.1


