Return-Path: <linux-usb+bounces-32764-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNQaNlkleGl7oQEAu9opvQ
	(envelope-from <linux-usb+bounces-32764-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 03:39:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1268F12C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 03:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACCA53017784
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 02:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCA6235063;
	Tue, 27 Jan 2026 02:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="IVJbdE2R"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3114F5E0
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 02:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769481557; cv=none; b=AVnlAHpnL03RvQyAxP+pmdK75P8cdWqMXV7zDeZmlQgYRsTXiiW6b+0/7vp6ONSmNSoakDGg+Gv/Ox58nKCFmZBkgzQMwLP3M5B7VdyRvB+Sb3wdxzcEvsSGu4VL9ieiPbSmES6bkag9cqyseoUVg7eJ7/3pKqaFq7ug1QsBX2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769481557; c=relaxed/simple;
	bh=MdQnzeK80O5H8xUjD71nn+yMOcnUqWzrwc3OoMGAJv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9CwcQqgnD2kdzPJDmMjAEU+YatxBC4u3t4tCGVYkYI1sao0iHGFCyo/Q8Le2TtgzEFnTzyIUIchws7JRw4zKIzTbEKLMYE/BxFAK0XvjTLl4jjkSFbZVbosi7v9/3WbFdIrKXY6JoUFxpfJ6BRuffwlJd0ZPe6ux4vw8uWd1cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=IVJbdE2R; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769481533;
	bh=Lcs1XCgFYBZMsfsHB1Ox3TjSx8zsYLxbbTACkr/TI0g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=IVJbdE2RbAOCHsVhZPtJZybc7TX1DsBfbh84JXqhADqwygs/r3ZcP4BroS2FChifp
	 Plbum1SXZOMnrY556rw28B+BYsfcJRpZlVuU0g163F2injlQyDjqHt7Nw1X9eeFXcZ
	 /00nrkzO8nY95G0Kvn+wD1wB7mzP7RwUjx+7TDho=
X-QQ-mid: zesmtpip3t1769481527t2f1f8388
X-QQ-Originating-IP: VmhbXxyIpk7ZFotEu3eimvzhz5+n+CFA7zePa9KQH7E=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 27 Jan 2026 10:38:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12951614995747503431
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
Subject: [PATCH v11 1/2] usb: xhci: refactor IRQ/interrupter plumbing for multi-vector support
Date: Tue, 27 Jan 2026 10:38:43 +0800
Message-ID: <427F99629441CABE+20260127023843.2145548-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: NIM9fEB8IbgPEQK1pSWy7/TH/AXbvIGJCDofNulj3TYHZqBjcmsuCScy
	6KYMOktJctt9arkrksopMXNT1O2Kfh7gFrCp684k9BhgylUKLVlzbu8nf0FTqT2PSpJoTZQ
	0k7HkbySVsm5tlxR6jMbfDVylSJB1Dxhmfc8HbtB+CDon6/TfF/SuoA4q6CYbh68WFcuyYw
	tHNHNwdWMBzpOvQ9KPGqcQBfsPWzwadWi96ackP+mY5L7bFetV3N2pElLwBiWsAwdKz6H5B
	2fm6VYX9uy0pUGXZqiNysOKk62c/p2H8lG9ubjdl9o2VvxpmPeTRo6Pbn1Uz+WxOS0RG21u
	ATnpuClWI/fgJmRhCBQrgt9NkrgMaabQ5oEIUs+x1k37gk3zoqVInoK+GjABNaF0nmVbt/S
	+/K9Z3EMZBOONauPCLEmXHMqSmOCKy7QjalPlTOYH1S1e3TdRitGy1VzXwW8h4qA6m8MWhl
	PxJAls97A27UPC5iVAaZA1Tm4nlNPwbS/nIZdEbkEwrOtGHxS7UtDbsLaOzT61+y5RdvPjQ
	69Q3I2I76izCBdX/M/oqqFckDi9wpT+DhhVFptAjwTZjhn+7nOUKbUWHXmwevek2nQuV35p
	L6vv7tpAtjPKntquJ9xojtwgNaEQqX7RmFhWYX1sfnztuk0jGad19yiy7SU/9falhn0DlRO
	eX9MDgDGFSEUb/AD60NQqvMAGVoOAnIjlR1Kzk4EQNb3af1GMVGxbfIYFLLPpGpMWlCz+T7
	5qaSaJjlATs3NOhd5CRwz2Ot5ezfG3N+DRmwVpvBtBz9s3etxwARFWoiSU39fdPJocQQkM1
	kmcuQ5hXQHA/D7hm/RwOs+sZ6Jf4i7u8+CGoeHRttVRXPV50BXISJ+/srwMG6H1zJKPtwLw
	hrZpe7XF5JpD4tEx9v5M6pIrLOoVYkMSlSmnauTGlNIQsS1Zn5mmPp/SH9fJcXm6zk28NyA
	9ikwL7LjEvAOr0z8JDxV/hDMDVwm02QMBhdybQ41WX/aZQTIYDvuyFoGIb76munYGUrhAJk
	qj62BQhrDezuWT9ZMjFGZezPA/dyS8Bbrmou94VFrUoYa+kFrmDOlRc1A/l7s0tFWu1ga0p
	w==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32764-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F1268F12C
X-Rspamd-Action: no action

From: Xu Rao <raoxu@uniontech.com>

Prepare xHCI for multiple IRQ vectors/interrupters without changing the
current behavior.

Introduce a per-vector irq context (hcd + intr_num) to use as request_irq()
dev_id, and track the active vector count in xhci->irqs_enabled.  Use this
single bound to enable/disable interrupters consistently across run/stop/
resume and to sync/free IRQs.

Legacy IRQ fallback also keeps irqs_enabled >= 1 so interrupter 0 remains
functional when MSI/MSI-X is unavailable.

No functional change intended: still uses interrupter 0 only.

Signed-off-by: Xu Rao <raoxu@uniontech.com>

---
 drivers/usb/host/xhci-mem.c  | 17 +++++++++++++++++
 drivers/usb/host/xhci-pci.c  | 34 +++++++++++++++++++++++++---------
 drivers/usb/host/xhci-ring.c |  9 +++++++--
 drivers/usb/host/xhci.c      | 23 +++++++++++++----------
 drivers/usb/host/xhci.h      | 16 +++++++++++++++-
 5 files changed, 77 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c708bdd69f16..524c58a149d3 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2402,6 +2402,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
+	unsigned int    i;

 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2495,6 +2496,22 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters[0])
 		goto fail;

+	/* Since only the main interrupt is used, secondary_irqs_alloc is set to 0. */
+	xhci->secondary_irqs_alloc = 0;
+
+	/*
+	 * Initialize all allocated interrupters here.
+	 * Use allocated count as loop bound to avoid touching non-allocated
+	 * or non-operational interrupters.
+	 */
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Add allocated interrupters");
+	for (i = 0; i < xhci->secondary_irqs_alloc + 1; i++) {
+		if (!xhci->interrupters[i])
+			continue;
+		xhci_add_interrupter(xhci, i);
+		xhci->interrupters[i]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
+	}
+
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..b3efd6d8fd9c 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -116,13 +116,12 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	int i;

-	if (hcd->msix_enabled) {
-		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
-
-		/* for now, the driver only supports one primary interrupter */
-		synchronize_irq(pci_irq_vector(pdev, 0));
-	}
+	if (hcd->msix_enabled)
+		for (i = 0; i < xhci->irqs_enabled; i++)
+			synchronize_irq(pci_irq_vector(pdev, i));
 }

 /* Legacy IRQ is freed by usb_remove_hcd() or usb_hcd_pci_shutdown() */
@@ -130,11 +129,17 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	int i;

 	if (hcd->irq > 0)
 		return;

-	free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
+	for (i = 0; i < xhci->irqs_enabled; i++)
+		free_irq(pci_irq_vector(pdev, i), &xhci->irq_ctx[i]);
+
+	xhci->irqs_enabled = 0;
+	memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
+
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }
@@ -145,6 +150,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int ret;
+	struct xhci_irq_ctx *ctx;

 	/*
 	 * Some Fresco Logic host controllers advertise MSI, but fail to
@@ -174,11 +180,17 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 		goto legacy_irq;
 	}

-	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
-			  xhci_to_hcd(xhci));
+	memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
+	xhci->irqs_enabled = 0;
+
+	ctx = &xhci->irq_ctx[0];
+	ctx->hcd = hcd;
+	ctx->intr_num = 0;
+	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd", ctx);
 	if (ret)
 		goto free_irq_vectors;

+	xhci->irqs_enabled = 1;
 	hcd->msi_enabled = 1;
 	hcd->msix_enabled = pdev->msix_enabled;
 	return 0;
@@ -186,6 +198,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 free_irq_vectors:
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable %s interrupt",
 		       pdev->msix_enabled ? "MSI-X" : "MSI");
+	xhci->irqs_enabled = 0;
 	pci_free_irq_vectors(pdev);

 legacy_irq:
@@ -198,6 +211,9 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 		snprintf(hcd->irq_descr, sizeof(hcd->irq_descr), "%s:usb%d",
 			 hcd->driver->description, hcd->self.busnum);

+	/* legacy IRQ path still needs interrupter 0 */
+	xhci->irqs_enabled = 1;
+
 	/* fall back to legacy interrupt */
 	ret = request_irq(pdev->irq, &usb_hcd_irq, IRQF_SHARED, hcd->irq_descr, hcd);
 	if (ret) {
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9315ba18310d..3ea134c07c5f 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3220,9 +3220,14 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	return ret;
 }

-irqreturn_t xhci_msi_irq(int irq, void *hcd)
+irqreturn_t xhci_msi_irq(int irq, void *data)
 {
-	return xhci_irq(hcd);
+	struct xhci_irq_ctx *ctx = data;
+
+	/* For now only vector 0 is requested; keep behavior unchanged. */
+	if (!ctx || !ctx->hcd)
+		return IRQ_NONE;
+	return xhci_irq(ctx->hcd);
 }
 EXPORT_SYMBOL_GPL(xhci_msi_irq);

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index b3ba16b9718c..cbf96cb51583 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -576,10 +576,6 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set USB 3.0 device notifications for function remote wake */
 	xhci_set_dev_notifications(xhci);

-	/* Initialize the Primary interrupter */
-	xhci_add_interrupter(xhci, 0);
-	xhci->interrupters[0]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
-
 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
 		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
@@ -594,9 +590,9 @@ static int xhci_init(struct usb_hcd *hcd)

 static int xhci_run_finished(struct xhci_hcd *xhci)
 {
-	struct xhci_interrupter *ir = xhci->interrupters[0];
 	unsigned long	flags;
 	u32		temp;
+	int		i;

 	/*
 	 * Enable interrupts before starting the host (xhci 4.2 and 5.5.2).
@@ -609,8 +605,10 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	temp |= (CMD_EIE);
 	writel(temp, &xhci->op_regs->command);

-	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable primary interrupter");
-	xhci_enable_interrupter(ir);
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable all interrupters");
+	for (i = 0; i < xhci->irqs_enabled; i++)
+		if (xhci->interrupters[i])
+			xhci_enable_interrupter(xhci->interrupters[i]);

 	if (xhci_start(xhci)) {
 		xhci_halt(xhci);
@@ -707,7 +705,7 @@ void xhci_stop(struct usb_hcd *hcd)
 {
 	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct xhci_interrupter *ir = xhci->interrupters[0];
+	int i;

 	mutex_lock(&xhci->mutex);

@@ -742,7 +740,9 @@ void xhci_stop(struct usb_hcd *hcd)
 			"// Disabling event ring interrupts");
 	temp = readl(&xhci->op_regs->status);
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-	xhci_disable_interrupter(xhci, ir);
+	for (i = 0; i < xhci->irqs_enabled; i++)
+		if (xhci->interrupters[i])
+			xhci_disable_interrupter(xhci, xhci->interrupters[i]);

 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
@@ -1087,6 +1087,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
+	int			i;

 	if (!hcd->state)
 		return 0;
@@ -1180,7 +1181,9 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
 		temp = readl(&xhci->op_regs->status);
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
+		for (i = 0; i < xhci->irqs_enabled; i++)
+			if (xhci->interrupters[i])
+				xhci_disable_interrupter(xhci, xhci->interrupters[i]);

 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2b0796f6d00e..7707fd7564c5 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -45,6 +45,9 @@
  */
 #define MAX_HC_INTRS		128

+/* Software cap for secondary interrupters; not a hardware limit. */
+#define MAX_SECONDARY_INTRNUM	4
+
 /*
  * xHCI register interface.
  * This corresponds to the eXtensible Host Controller Interface (xHCI)
@@ -1497,6 +1500,11 @@ struct xhci_hub {
 	u8			min_rev;
 };

+struct xhci_irq_ctx {
+	struct usb_hcd	*hcd;
+	u8		intr_num;
+};
+
 /* There is one xhci_hcd structure per controller */
 struct xhci_hcd {
 	struct usb_hcd *main_hcd;
@@ -1533,6 +1541,12 @@ struct xhci_hcd {
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
 	struct xhci_interrupter **interrupters;
+	/* Number of secondary interrupters successfully allocated */
+	unsigned int		secondary_irqs_alloc;
+	/* Number of IRQ vectors successfully requested (includes vector 0) */
+	unsigned int		irqs_enabled;
+	/* MSI/MSI-X vector contexts. Vector 0 uses [0], secondary use [1..] */
+	struct xhci_irq_ctx	irq_ctx[MAX_SECONDARY_INTRNUM + 1];
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
 #define CMD_RING_STATE_RUNNING         (1 << 0)
@@ -1895,7 +1909,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
 int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume);

 irqreturn_t xhci_irq(struct usb_hcd *hcd);
-irqreturn_t xhci_msi_irq(int irq, void *hcd);
+irqreturn_t xhci_msi_irq(int irq, void *data);
 int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
--
2.50.1


