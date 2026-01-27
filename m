Return-Path: <linux-usb+bounces-32765-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKIdMnMleGl7oQEAu9opvQ
	(envelope-from <linux-usb+bounces-32765-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 03:39:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7608F14A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 03:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B85D3007A7B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 02:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083814F5E0;
	Tue, 27 Jan 2026 02:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Xn8+xqzd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFD21A23A6
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 02:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481582; cv=none; b=tRc3wpmiOC4sghVvgRLP/yXsLiTYDrLm03cwN4q0JE6Jwu1Fa8BumhoJmOuoFlN4nUGyh8MiiIX+e7/rVYkFPQ5MtmhgsWrNBW1pmdOD9y/7Qp8FK4ELiPql+UR7ZHGS3Tz9sgJaYjvtNdSJwZHQyl/Xq0WfUFvp/050u7SgaHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481582; c=relaxed/simple;
	bh=TGvAWC2yVp4VhDSQSdYjvRFk/+GSepSZb87pJuC3hes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGTar3sv61fX8IbfXxwvbKg4ucMV+zx91MOXDb/4KYXdHCQXsgfOX5QIf4aAr6ZxW20odeKEY17m7HRyH8F84Gvbz0E5t2vvDC07J5jSB2Lx+cE1Ey2ntx3WNtw8lcDCKKicYhSR/Yh72xLsQLnD3JT6aPZ4kWcFhhOvhEGhH9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Xn8+xqzd; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769481549;
	bh=rYN8sPEhNzh3MP+knRnibzkza1YHbGkNg1pfLSL1IBo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Xn8+xqzdTLnJ05WD2kBRo0aDAgbhwFTGCADvJiWAsy6zY6swFnycq6ldt1zfkZytK
	 xPMaF2Nu0yArmdeRJQu0tx65weLUqjylFZeX1VgebqPwGh/yqEmzlKrn0Jp7IX4V30
	 gVXfRnAmvqF6TuzLcwKK4Yr9ERXkpDODh6qqjAZU=
X-QQ-mid: zesmtpip3t1769481543t1b08c229
X-QQ-Originating-IP: ybZ6BCxXsF2PuawdI/jDp7orMLpOt4VklcZ0FD640KQ=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 27 Jan 2026 10:39:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5507139308207355025
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
Subject: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and route transfers per slot
Date: Tue, 27 Jan 2026 10:39:00 +0800
Message-ID: <FF69E7CC57E8D606+20260127023900.2145949-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
References: <D51D214ACD887BE9+20260127023446.2140220-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N0wq4UDXOmCw/RREqQssTtS7ONGskx7E3mPulkrHmc4hYwDfObfgzTSQ
	2hnZoInsEWREl+cks/6mF3i5bNjyLRHgzdymjvxd11Sb2NQWEKqkTfrSslyg1NIsWx6wtyp
	azTKk5dgIuz9gvJn0AtwCCkoknqXY4SR2w623qxevA0Q02sG1FdniAi0h7i7frb0FbS8QtA
	oddjLI8rrGmYMM21RfHw2OKnq/F30xRtQXPqfE2eB9f8vJe4MJNEmvohllsR7D8HlF8a/UN
	Gr3/WMgs57FHMN1QLlu+2ehQMUXhdgQ80dYz9M+LJtVlR2awMLy1SCSTe31DvEd+mMIZmOm
	cmkPAl9QPRbuBjq06/sMAo1ilD90Qo7xkVjnsvrKR/sapTa7SwRXkZX7EA6CShH8uFNrhTB
	0rFqmHaG2gaDg2A3Kuj1b/QlvURrPuY5kN6D/XP0aj7l+ISO8HsFKBYn0fr9v1lDXHDsXKO
	275ro4wVisJKsXSnwqtkqoAo8fFNU5z0/M9sLwW0kABHxbdPaSwhMgq6QSxZ0SKU5DMS+n4
	iPQ84I4ImAS6jGqFA7CoinTkcETaTV45ULEkWrdRCP/0+rkzhz9ZFChZU2vFcu3yeTwTZSb
	mfnG6VC3MMI9ZMDOZgjO1zlnzR5VfjAZjstNYt+WSWrgAA/urt9v3OwaGZ/AffXXMbKQsuJ
	VajD/2hpk2TA65QqPzjfFg6ZFLxBDB6CEbdl6bExw5KuNgdI59q9HGNyFwQ81z9URf62fIS
	WQyYNgZBk4E88WbPSIbXmxWbks03WZNtu6oxlhAxjaKHK2u+JOo6hVtg2/vtQx6BqMaegZv
	FZVqYaNt/ZO5FdpKdZv5jALdFPFKUCl79Q6w0pQ8L0SOz4JxPGo4ziWaOy11zs5m7BCjG2R
	adJAS0kR11oXIwyFIn0ukRQUXGmk3Os0gyFKxtEU/koXhWyC+awyxpGfvnaT/Tx54bqLptA
	RbfH6MdQsgtJSB6rdrxCksyVR6qflwMM1c8NUKjuAtKFMmvALy9kpZsTyMmFAkFRpAUwqDK
	wh89X+6CmKc13LKZWbHlXuzS04xXEMLu8ayV2u+zFWB4mP7rHQRNALRpzhv8AL6XhKAtHYZ
	RodYRkQ3sUI
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32765-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B7608F14A
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
 drivers/usb/host/xhci-mem.c  |  35 +++++++-
 drivers/usb/host/xhci-pci.c  |  35 +++++---
 drivers/usb/host/xhci-ring.c | 151 ++++++++++++++++++++++++++++-------
 drivers/usb/host/xhci.c      |  14 ++++
 drivers/usb/host/xhci.h      |  10 +++
 5 files changed, 207 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 524c58a149d3..cc9612873566 100644
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
@@ -2402,7 +2411,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
-	unsigned int    i;
+	unsigned int	secondary_intr_num = 0;
+	int		i;

 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2496,9 +2506,30 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters[0])
 		goto fail;

-	/* Since only the main interrupt is used, secondary_irqs_alloc is set to 0. */
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+			"Allocating secondary event ring");
 	xhci->secondary_irqs_alloc = 0;

+	if (xhci->max_interrupters > 1)
+		secondary_intr_num = min_t(unsigned int,
+				xhci->max_interrupters - 1,
+				(unsigned int)MAX_SECONDARY_INTRNUM);
+
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
 	/*
 	 * Initialize all allocated interrupters here.
 	 * Use allocated count as loop bound to avoid touching non-allocated
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index b3efd6d8fd9c..4ff3e29070b1 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -150,6 +150,8 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int ret;
+	unsigned int irqs_num;
+	int i;
 	struct xhci_irq_ctx *ctx;

 	/*
@@ -173,7 +175,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)

 	/* TODO: Check with MSI Soc for sysdev */
 	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, xhci->nvecs,
-					    PCI_IRQ_MSIX | PCI_IRQ_MSI);
+					    PCI_IRQ_MSIX | PCI_IRQ_MSI | PCI_IRQ_AFFINITY);
 	if (xhci->nvecs < 0) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			       "failed to allocate IRQ vectors");
@@ -183,14 +185,30 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
 	xhci->irqs_enabled = 0;

-	ctx = &xhci->irq_ctx[0];
-	ctx->hcd = hcd;
-	ctx->intr_num = 0;
-	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd", ctx);
-	if (ret)
-		goto free_irq_vectors;
+	/*
+	 * Request up to 1 + secondary_irqs_alloc vectors (vector 0 + secondary),
+	 * limited by what PCI core actually allocated.
+	 */
+	irqs_num = min_t(unsigned int,
+		     (unsigned int)xhci->nvecs,
+		     (unsigned int)(1 + xhci->secondary_irqs_alloc));
+
+	for (i = 0; i < irqs_num; i++) {
+		ctx = &xhci->irq_ctx[i];
+		ctx->hcd = hcd;
+		ctx->intr_num = i;
+		ret = request_irq(pci_irq_vector(pdev, i), xhci_msi_irq, 0,
+				  "xhci_hcd", ctx);
+		if (ret) {
+			while (--i >= 0)
+				free_irq(pci_irq_vector(pdev, i), &xhci->irq_ctx[i]);
+			xhci->irqs_enabled = 0;
+			memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
+			goto free_irq_vectors;
+		}
+		xhci->irqs_enabled++;
+	}

-	xhci->irqs_enabled = 1;
 	hcd->msi_enabled = 1;
 	hcd->msix_enabled = pdev->msix_enabled;
 	return 0;
@@ -198,7 +216,6 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 free_irq_vectors:
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable %s interrupt",
 		       pdev->msix_enabled ? "MSI-X" : "MSI");
-	xhci->irqs_enabled = 0;
 	pci_free_irq_vectors(pdev);

 legacy_irq:
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3ea134c07c5f..f16339f47ed4 100644
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
+	if (!vdev)
+		return;
+
+	intr = vdev->interrupter->intr_num;
+	if (!intr)
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
index cbf96cb51583..96934a29e39b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4123,6 +4123,7 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 		virt_dev->eps[i].ep_state &= ~EP_STOP_CMD_PENDING;
 	virt_dev->udev = NULL;
 	xhci_disable_slot(xhci, udev->slot_id);
+	virt_dev->interrupter = NULL;

 	spin_lock_irqsave(&xhci->lock, flags);
 	xhci_free_virt_device(xhci, virt_dev, udev->slot_id);
@@ -4219,6 +4220,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	unsigned long flags;
 	int ret, slot_id;
 	struct xhci_command *command;
+	unsigned int sec_irqs, intr_num;

 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
@@ -4275,6 +4277,18 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)

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
index 7707fd7564c5..b30ace66ff62 100644
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


