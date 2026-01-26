Return-Path: <linux-usb+bounces-32714-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H2bEUs1d2nhdAEAu9opvQ
	(envelope-from <linux-usb+bounces-32714-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:35:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2D386136
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 425DB300E14B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633C9329377;
	Mon, 26 Jan 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="l8i3TTPe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC1A329C74
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420101; cv=none; b=cL4SGQzoXNB4j5CYoOIbEuURCOox/mV6iHH3h/xjDFUL5JGoElf7VA8gLPeFkh8flh1V9Tu226r/RzFYQ6oJQ6JapKHDR2VqnS15Bh6SB1oFoQkkPb6gyfqQPRvt/4Tgez1NmPHCHZZVucF1yB/GScC3WG4F55Mo764v4gnFNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420101; c=relaxed/simple;
	bh=MdQnzeK80O5H8xUjD71nn+yMOcnUqWzrwc3OoMGAJv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4BO3gGAnStKm2LM1CQ4BwDs6VJH9BZJKJgae5zO66QRFucfW5s2zVLwoVx1r1pI4ChNk8mqPKUxgpsGxaYM1Vgwd6TDnFvg/z/P/LBVueujFEfrmPBc/K1s9N0eUyBbMxgTNsQTEF64LZF7RH9yh4J8Wy7g7Czl8u90nlBCOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=l8i3TTPe; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769420054;
	bh=Lcs1XCgFYBZMsfsHB1Ox3TjSx8zsYLxbbTACkr/TI0g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=l8i3TTPeWGSm3CNUkcKprEIQ7d9GSFamSwkwFoKB4iOQhRsQxwoVxoKHNaLag+mjY
	 fKnEHhADp3xbFNOOnyKyHX3x9t9Y7M7J4+nMeTlesTYLecMdEHh6NcSfPVLOttrgMz
	 1URvw0LbeS3glCYuurSzyfWrbxiXBJucJ5iOijD8=
X-QQ-mid: zesmtpip2t1769420048t2cfab3a5
X-QQ-Originating-IP: FrxWZzxbkhyKimPgZ2WwewnuvQZMYWyBMuKdPIlwefk=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Jan 2026 17:34:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10598905872957410248
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
Subject: [RESEND PATCH v10 1/2] usb: xhci: refactor IRQ/interrupter plumbing for multi-vector support
Date: Mon, 26 Jan 2026 17:34:02 +0800
Message-ID: <3BE047DC651002AC+20260126093402.851311-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <F7E7CE9569AE17EF+20260126092632.841308-1-raoxu@uniontech.com>
References: <F7E7CE9569AE17EF+20260126092632.841308-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OBVtUtvshiqctd6Hg0UiN+jydGJS7BC/CZM6frw0QzIR3OmApLck6Noj
	RaN7EUeZqvl/Cz481DZ315rDifNWqFZ/6RbsOu6fpk3Kt22a78Bl0DmFfCaoBBH876gyhEa
	XWbRwtWKiWiVwe2AvegddT9/FTRSB9P9+gnDtgsAdeHZGYn50PjEmvhXKQ9PmIavMj9JYGH
	KtEFl4xt14NFlAIYKQvReFtef2QN5ylN9BqPvBMFcZs27Z1tHe8NCVKNXovAPf4Iob+1qJN
	3Ufs7JEbCMZy2GkdzI96rugAD03IVNi5E7Rqs75YdLSyQE0M2EKg+i7otB3fvNBmoJFeq6i
	wkCd7evR0F5jVMik6eNO32URk1sOGfV26lZAs2uhdmRPR9dAMh76SzyxX67jIVxnAl8V++N
	cJZFdy/lqldgzKohwh6TE/Mqlqg0DdXbEV1m88a+2W1Ko4xUJ3OZIObNbebtXRQfz98np47
	b643wevvbI6uR6yes0pJwqMkF18LJ14e2Js6eiChnz/u8tcbW2uKcLGPsoSdJh2tcLH1UPO
	kgI6cwQkkhRor5mB1s6MdknDws20fVUM8fQjuYEM30Xnugw7mEulT2C8gJu43ZE7YRvdFgh
	DGnhvnKILLBHR6Yg6ZtfsmyIFb0BPReZQeXNoOd6WfAYr9xatNKNQn2b26ZFeTTTgFR2IRi
	zYYEA1sTnp51BAYE2pUYcpqTpVTYoFmpb/He6tJkBdbzTV6KKGuVSC8+oi6gZQ1l+c8PtzN
	nbJaBi9Pv8ntdqW/Ctgo2ncJfxBspDqsA/CGl80u0nlpxez5yI7jPzFXG0gqpdvh5/o+10G
	BefVM+pZ+2Sdq2bhziFg1v1DQhzypyAG/1dfbOWB+zysVFbdD26vVROOyF4SKL6znLVdBB+
	BbBLOIdHDi06shDeZpOZR+M292VRZO7upWY/e//9ptytximiXBZxwYsAehy2YhOIJ1ZAcB6
	na5kfXFe//3XIXV9v7wKWiF/S+5uqXluT9QNeLsUPNhGPkTM636oLSy+P+0aiOaFAKlgPCk
	psR3PX7sLmKVyYKOv7dZwO6zR7xhV08bDwhnZthQv1ExI3C66DlgPuhWRuThamfFmm6Xb0n
	+Wwz3pIH/dGWEFvmViFkQDOxyChY7jiKkq/0Cf2gnlcEZBAvtu2FOs=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32714-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AE2D386136
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


