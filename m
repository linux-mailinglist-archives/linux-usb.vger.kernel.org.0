Return-Path: <linux-usb+bounces-32875-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON8GKJjqeWkF1AEAu9opvQ
	(envelope-from <linux-usb+bounces-32875-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:53:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E209FB9C
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 539953004CBC
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 10:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E20B33507D;
	Wed, 28 Jan 2026 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nChDGJXH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F21332904
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597587; cv=none; b=YMs1e6Zvaeuy/0mSts7Q6LEMJh54+NteKgAwSgwKBAnv1ByHdXRya7sG/AIdM+9NZgUMBHL0q71OVngFt1fJz1IKC2nDkkbkdfAGm/iX6YDg38NROrMb8dYg5HcpNf+B2hvADR2sLLARYqxnnggU5crWdvufVuHDUAnOi2YNPks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597587; c=relaxed/simple;
	bh=k5pabxdiMtld13KRX0BEpy5Cx6+JXZwCjNttHWa2Gmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MrJjo30MynUJ8x+X6P/0bBYz2kVb/W7VeeREJkIAFKghhMc2nc2QVRseXEi6mo1SmWL7RQmVYfAoAYN1t2L06BUjT6sRKxik8VyEk8z3sa6Whx7U1UGucUdwUm55SUGHffoyqR5fdaNVF4O27Ohl9ppJpBg0+d7ETLQQWXAbPXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nChDGJXH; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769597552;
	bh=/8FEOIakysfUtP5bxBnNKJK28jt9QeKGj+wU/FrTG4I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nChDGJXHPSCqcjcc3Xcyt5iezROPbXNdTVVEW9zJqbngMMUT4KuO9l6pcH//3p9Fj
	 QhdrzBjOgTOm3/LETPPLRM2P/qOu4Y0Iu+/BhrTG4yaQdWhMum0FyIm2k0OvHvljdh
	 inR2xD8iPEZPwXIF2tZQkKjI2FRbqr0i0ZlgMGxo=
X-QQ-mid: zesmtpip4t1769597545t14d85803
X-QQ-Originating-IP: Nsnrxqbdzt/2gGajSfho/EQMHfvPNxMBhqLk75ezMQY=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jan 2026 18:52:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13854524553313919348
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
Subject: [PATCH v12 1/2] usb: xhci: refactor IRQ/interrupter plumbing for multi-vector support
Date: Wed, 28 Jan 2026 18:52:22 +0800
Message-ID: <6DFDC6161BD3FD52+20260128105222.2540911-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: NvmHdt7+acqZqUM6uhT+Xaivos5z3QKTSrDAmJl88kVmjP/Pose3winy
	HdmBpvFitGs5RkmASPJhAkkB4wTAfvgn46O2CJdnYomsC6L/YjwAXChg/OrvNMO3E55KOYO
	TtoKhbdmiMM1zGdSTKL1IfMcCrBLIrVs5vMVtsT8knqkm908Cc7wZLVxt7EH9bS0RFhzOER
	ELpcslcf+9JggG4kv1IZQZUFNEawT8Zt4fZ6JmpHWrm3MKc2e8vSsnhYIibLhc9u06e5Btl
	4gjnwkDhgqjo6T0EQrEIG4wjrIb9kV4mJ8fadNe+4u0SslK0DSJXqnNSKV+jefkudBRvUgX
	72zZDpdn6qC9HZM+NdrQgpvLU6vz8+r5GXs+mPGyCg+tyjfjGtHimCdS6XiGRKGz2tQdtUf
	0ZUk4JznihaO0/1S+ZHYhi9SaQFxilE24y8iTbDbVKDuK3vT23pnb//UnLIFcdMxHVn+1wE
	VICGoJ+LsqgoRlV9iGtyKsqmtP6K4lz9U0XdzGTR4/B7eHTSUMm5S1yZRVTNK/oEDcgzvCb
	nm6TU1xV8Tc0QOiaARVCwtbmoZLtZZlZRaEEAydLuFODqkoKc0CsKVVvlthLTJEV5rcOlfG
	VMM8hoRMBiS5xpnRoTaM4mE01apurzMrkhI177SWljseYXx99/8RzbYCuSi1WuZxQR81oJy
	hoQaPZy25F68axY+7Waq8ZTYhOF5WYG3nFHOHy6K0uLssG3+8SxfaIKDRNOlnoGEhrpDwxP
	6wR3qi/DnjVd+FrCL2/u8xB+fDfCy4Kcp78XDe7TzagBiEmTYJcItC41OwhC4Xzpl+ZY9+3
	GEWNzNOawEI0hzTJb66FtBbAMrndStN6AI/CHjDKOiCcXJPaXARLVA42cPLHfOIjlXHSSBr
	ATBZoN1rYlyZUGpCrxXs+foRkPEeCF+uYP6U/gU5NcBLdcWxiTJ8YXXk62vH3eAhKvKVwOI
	0y080HSwZQgPmI6CShP8+lDRfrx8f7acSeIJdbQz1KcjlnYdTQIJbJI1Rfr5PpZe6ZLm9R8
	MX8SUXiNdROBfUfciEvMcS80xtEeb5LManXpYs1VYcPIyr6mmEjKf6gLeKstS3WM6cdhSFT
	7KeJGYpTQdX
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32875-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.990];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,uniontech.com:email,uniontech.com:dkim,uniontech.com:mid]
X-Rspamd-Queue-Id: B0E209FB9C
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
 drivers/usb/host/xhci-pci.c  | 29 +++++++++++++++++++++------
 drivers/usb/host/xhci-ring.c |  9 +++++++--
 drivers/usb/host/xhci.c      | 38 +++++++++++++++++++++++++++---------
 drivers/usb/host/xhci.h      | 16 ++++++++++++++-
 4 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..3e019f2811e7 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -116,12 +116,12 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	int i;

 	if (hcd->msix_enabled) {
 		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
-
-		/* for now, the driver only supports one primary interrupter */
-		synchronize_irq(pci_irq_vector(pdev, 0));
+		for (i = 0; i < xhci->irqs_enabled; i++)
+			synchronize_irq(pci_irq_vector(pdev, i));
 	}
 }

@@ -130,11 +130,17 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
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
@@ -145,6 +151,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int ret;
+	struct xhci_irq_ctx *ctx;

 	/*
 	 * Some Fresco Logic host controllers advertise MSI, but fail to
@@ -174,11 +181,17 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
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
@@ -186,6 +199,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 free_irq_vectors:
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable %s interrupt",
 		       pdev->msix_enabled ? "MSI-X" : "MSI");
+	xhci->irqs_enabled = 0;
 	pci_free_irq_vectors(pdev);

 legacy_irq:
@@ -198,6 +212,9 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
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
index b3ba16b9718c..18d3093b688a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -547,6 +547,7 @@ static int xhci_init(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int retval;
+	int i;

 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 	spin_lock_init(&xhci->lock);
@@ -576,9 +577,21 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set USB 3.0 device notifications for function remote wake */
 	xhci_set_dev_notifications(xhci);

-	/* Initialize the Primary interrupter */
-	xhci_add_interrupter(xhci, 0);
-	xhci->interrupters[0]->isoc_bei_interval = AVOID_BEI_INTERVAL_MAX;
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

 	/* Initializing Compliance Mode Recovery Data If Needed */
 	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
@@ -594,9 +607,9 @@ static int xhci_init(struct usb_hcd *hcd)

 static int xhci_run_finished(struct xhci_hcd *xhci)
 {
-	struct xhci_interrupter *ir = xhci->interrupters[0];
 	unsigned long	flags;
 	u32		temp;
+	int		i;

 	/*
 	 * Enable interrupts before starting the host (xhci 4.2 and 5.5.2).
@@ -609,8 +622,10 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
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
@@ -707,7 +722,7 @@ void xhci_stop(struct usb_hcd *hcd)
 {
 	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	struct xhci_interrupter *ir = xhci->interrupters[0];
+	int i;

 	mutex_lock(&xhci->mutex);

@@ -742,7 +757,9 @@ void xhci_stop(struct usb_hcd *hcd)
 			"// Disabling event ring interrupts");
 	temp = readl(&xhci->op_regs->status);
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
-	xhci_disable_interrupter(xhci, ir);
+	for (i = 0; i < xhci->irqs_enabled; i++)
+		if (xhci->interrupters[i])
+			xhci_disable_interrupter(xhci, xhci->interrupters[i]);

 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
@@ -1087,6 +1104,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
+	int			i;

 	if (!hcd->state)
 		return 0;
@@ -1180,7 +1198,9 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
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
index 2b0796f6d00e..90d4ba6b3573 100644
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
+	unsigned int	intr_num;
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


