Return-Path: <linux-usb+bounces-32523-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E178D3C301
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 10:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 276E34E6F59
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 08:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480373B95F3;
	Tue, 20 Jan 2026 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="CGI52zt9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7EC3BBA16
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899350; cv=none; b=O+XKmakBuDpa2O0mqtkiS/G1k/RdVD099OHB0CT6wigVH3HWsyLnVGAw+AZB3ry1kj9Oo1kunT7LCaOQQtizhEfN0sb89QqZPkJu4d7o/tLB6pX6t/JJy5C3nAykOd4uCMtrJpevC4Df7L4fPkvXqE+pm1TsY/5diNEQomQEiLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899350; c=relaxed/simple;
	bh=BpucGOPGiSPmzb1odbVVWeuBAuW/fhznS0bz4DtyOKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=urN9E2mFiopWOAQj8pxjsU9pMssrKGNW9Q4IDA5SIBtesHtBFdb/O81aGQlluD3WfDFHqQT6DuTODY7l9eQntiuRtYXlcXNlygS0VtLLSxsy76r13ZtBrZBMUeKl5boUXDuCGqjcHYvszymG84MEXlu+KdmgRHjxnYMR/zPcWvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=CGI52zt9; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768899310;
	bh=8VjNDDSJ49+mg6bLCrrwjqLkxTr/IsNgckXCBrx7OU0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=CGI52zt9b1keCEqUfZtzeN9XXEUS+DMLsXTpZoZxRgmlxOvnZ3maIkpzuqC1P2FT3
	 gBcRbCA5f9TsxqPf5s/8uC8jBlw5PwjdtLVYrZW//D6+R0So+TmUem8iXo76ipJ1Ha
	 lxANsRH4el4mY5K2qwwe5ROvaYVPNrwhhpBIyMPA=
X-QQ-mid: zesmtpip2t1768899304ta9271439
X-QQ-Originating-IP: flG8s18uUnIiALr7vApAQDS9pUX8ajspDw65iInriEs=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Jan 2026 16:55:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3211229097722342083
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com,
	zhanjun@uniontech.com,
	kenny@panix.com
Subject: [PATCH v9] usb:xhci:route device to secondary interrupters
Date: Tue, 20 Jan 2026 16:55:00 +0800
Message-ID: <93A4C02E97C0BC96+20260120085500.2288734-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MM8+Ywit1ilxf7yYmHuzoGijS2zrURWzSbKUFHtRr1JWkHeg1dgqsOQ9
	zK3g4LKnH2smot+ECLPErA1esHX9PTkZl+l8iLUshtR5xQBT9C0f+sw3YDO8xTZDZ1+Ikcm
	Ywlar+19dQuQB3BYKiUwkN04THt36c8w6hWxDMqrIOe5JBystREwnjaynqyydVPikLewAcG
	GkXsv0IoukBPScZJzvwwVuQmh3PZN5Cb4nmzm6J6CozeR8uJCcMjhBtrTTcDO48y6/VQRuv
	6VGKs+xDVF41uWEdKpXvzxUFTUIG3aJNwqTDTtZXNTlLb8bOCu3h362kZrvjGfIjRLmI6dM
	Bvh1C5zR0B/yseh1zJHxV6bD1fto1VLp/wJEvN5WodvAh16eC7lDcLfodLeVo+Lm6X0r+0o
	ObMlWXpdFpMABLJa24yJKq/kWjt++vPeHC+PQ6VLZ/4+x3WdUubB6S1PIBJ3/FnLtfx15N/
	VwKgzqqEt80JwkiZzhdfcitGSCKYXwlPT7nkRpVn78udMUTQLYjRfDNqYsyp7/RlA0oIBRu
	eSHg501BcsIbl8atVFKE/KxdKxMbOaEDzqXUe3QWTjFVDGQhWA0bQGfHp58hIVqSVeZ73jc
	wt+DxNxI/dEq2RpKAtVlEvKgQyoxnYLO9b6KnsQGeOvd6HlIDxnOI3ZTTqsnJIRuT8f4WWa
	gmUvO6udX7ZUuhuXC+3l2i9ArzFT8uRfg0NnxOKpJZZ3uoVOR6at+Rs/oRGEiypYXz/Srgs
	Wj9pV0wUaT9HmKdpKPoZJZr3aykMZOZNHVHyX8q4tolfG3hioL2Ou8dQyVL7IsuqAoOHK7K
	rdUwmC0EHWdA2Q5r8bEs/cb9eBtaxRPHRreT26x98jWyszHi7kG/UUCHTXSQ/pov2n1UO9Z
	UOkid0C7WKpiNIOBxOulOnZdOl7455T0v3cMc8gsziJhFlqVcQirVUcU44vkrN7TS7izMUu
	MtO3zQG6SEgk3rwiDyhHFPWgNbj2xgS9F/k5rEWVDTCw1Vy5PSN2BiOJPiTxkahjLfOgL/P
	Wdpo3mSqZm8sIix/W39TBtSCvSF2qD+runIBMBRJrjYONsxfFowYr6Z7xGtjZ9pdxw19YGo
	jpsftlLNQ5MqZePqcunDu6HD2T4RX6CyaPu+JelSaLhcq5ms8l5lIzIiJPoniG3l7oftvhF
	Jjr2wltHCtqqH0SXQU/VUgDdBg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

Some xHCI hosts expose multiple MSI/MSI-X vectors, but the driver
currently routes all transfer completions through interrupter 0.
This can lead to unnecessary contention on the primary event ring
and IRQ vector.

Create a small set of secondary interrupters in xhci_mem_init().
Cap the number in software (MAX_SECONDARY_INTRNUM, default 4).
If any secondary allocation fails, roll back and keep using
interrupter 0 only.

Unify primary and secondary handling on xhci->interrupters[].
Use the same paths for enable/disable and teardown.
Keep behavior consistent across run/stop/resume.

Route transfers per USB device (slot).
Add vdev->interrupter in struct xhci_virt_device.
Pick the default interrupter at device alloc time.
Program TRB_INTR_TARGET() from vdev->interrupter->intr_num for
bulk/ctrl/isoc/intr, so completions land on the selected event ring.

Route MSI/MSI-X IRQs to the right interrupter in xhci_msi_irq().
Use a per-vector irq_ctx (hcd + intr_num) as dev_id for request_irq(),
so each vector can select xhci->interrupters[intr_num] directly.
Request vectors with PCI_IRQ_AFFINITY and sync all vectors on suspend.

Tested:
S3 suspend/resume
S4 hibernate/resume
USB storage (U-disk), camera, mouse
/proc/interrupts:
  32:         51          0          0          0          0          0
              0        320 IR-PCI-MSIX-0000:03:00.3    0-edge
              xhci_hcd
  33:       5696          0          0          0          0          0
              0          0 IR-PCI-MSIX-0000:03:00.3    1-edge
              xhci_hcd
  34:          0      60682          0          0          0          0
              0          0 IR-PCI-MSIX-0000:03:00.3    2-edge
              xhci_hcd
  35:          0          0      48205          0          0          0
              0          0 IR-PCI-MSIX-0000:03:00.3    3-edge
              xhci_hcd
  36:          0          0          0         32          0          0
              0          0 IR-PCI-MSIX-0000:03:00.3    4-edge
              xhci_hcd

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
Changelog:
v1 -> v2:
  - Bind interrupters to endpoints at enable time instead of selecting
    per transfer.
  - Store the selected interrupter in struct xhci_virt_ep and program
    TRB_INTR_TARGET() from the bound interrupter.
  - Use a single IRQ handler for both primary and secondary vectors,
    with STS_EINT handling restricted to interrupter 0.
  - Keep a common dev_id for IRQ registration to match the existing
    xhci_cleanup_msix() teardown constraints and avoid dev_id
    lifetime issues.
  - Clarify secondary interrupter teardown to avoid double-free or
    use-after-free during xHCI removal.
v2 -> v3:
  - modify commit information
v3 -> v4:
  - Bind interrupters per USB device (slot) via struct xhci_virt_device,
    program TRB_INTR_TARGET() from vdev->interrupter for bulk/ctrl/isoc.
  - Drop xfer_interrupters and unify on xhci->interrupters[] for both
    primary and secondary event rings and IRQ routing.
  - Allocate secondary interrupters in xhci_mem_init; on any allocation
    failure, rollback and continue with primary interrupter only.
  - Cap secondary interrupter creation with MAX_SECONDARY_INTRNUM,
    defaulting to 4.
  - Route xhci_msi_irq by irq handler_data token (intr_num + 1) to keep
    correct interrupter selection across resume/power_lost.
  - Apply MSI-X affinity hints for secondary vectors.
v4 -> v5:
  - Fix min() signedness build error reported by 0day CI.
  - Rebase onto v6.19-rc2.
v5 -> v6:
  - Route secondary MSI/MSI-X IRQs by storing struct xhci_interrupter in
    irq handler_data, instead of using an (intr_num + 1) token mapping.
  - Program Slot Context Interrupter Target (tt_info[31:22]) from
    vdev->interrupter to keep slot default routing aligned with TRB
    TRB_INTR_TARGET() selection.
v6 -> v7:
  - Add xhci_quiesce_interrupter() and use it for secondary
    interrupters in xhci_stop() and the power_lost path of xhci_resume(),
    ensuring IMAN.IP (RW1C) and ERDP.EHB are properly cleared.
v7 -> v8:
  - Sync secondary MSI/MSI-X vectors in xhci_msix_sync_irqs() with
    synchronize_irq().
  - Fix build errors by adding missing header includes for the IRQ helper APIs.
v8 -> v9:
  - Use PCI_IRQ_AFFINITY to let PCI core spread MSI/MSI-X vectors across CPUs.
  - Route each MSI/MSI-X vector to its interrupter via per-vector irq_ctx dev_id.
  - Fix modpost error: xhci_msix_set_handler_data undefined (0-day CI).
    https://lore.kernel.org/oe-kbuild-all/202601171743.omq3DpnM-lkp@intel.com/
  - Rebase onto v6.19-rc6.
---
 drivers/usb/host/xhci-mem.c  |  39 +++++++++++++
 drivers/usb/host/xhci-pci.c  |  63 ++++++++++++++++++---
 drivers/usb/host/xhci-ring.c | 103 ++++++++++++++++++++++++++---------
 drivers/usb/host/xhci.c      |  36 ++++++++++++
 drivers/usb/host/xhci.h      |  27 ++++++++-
 5 files changed, 232 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c708bdd69f16..347eb026414d 100644
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
+	unsigned int	i;
+	unsigned int    secondary_intr_num;

 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2495,6 +2506,34 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters[0])
 		goto fail;

+	/*
+	 * Allocate secondary interrupters [1..max_interrupters-1].
+	 * if alloc fail rollback to primary interrupt.
+	 */
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating secondary event ring");
+	xhci->secondary_irqs_alloc = 0;
+	secondary_intr_num = 0;
+	if (xhci->max_interrupters > 1)
+		secondary_intr_num = min_t(unsigned int,
+					xhci->max_interrupters - 1,
+					(unsigned int)MAX_SECONDARY_INTRNUM);
+
+	for (i = 0; i < secondary_intr_num; i++) {
+		/* Create secondary interrupter with intr_num = i + 1. */
+		xhci->interrupters[i + 1] = xhci_create_secondary_interrupter(xhci_to_hcd(xhci),
+				0, xhci->imod_interval, i + 1);
+
+		 /* Allocation failed; keep primary interrupter only. */
+		if (!xhci->interrupters[i + 1]) {
+			xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+					"keep primary interrupter only");
+			xhci->secondary_irqs_alloc = 0;
+			break;
+		}
+
+		xhci->secondary_irqs_alloc++;
+	}
+
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..208a17428afc 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -116,13 +116,15 @@ static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 static void xhci_msix_sync_irqs(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	int i;

-	if (hcd->msix_enabled) {
-		struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
-
+	if (hcd->msix_enabled)
 		/* for now, the driver only supports one primary interrupter */
 		synchronize_irq(pci_irq_vector(pdev, 0));
-	}
+
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++)
+		synchronize_irq(pci_irq_vector(pdev, i + 1));
 }

 /* Legacy IRQ is freed by usb_remove_hcd() or usb_hcd_pci_shutdown() */
@@ -130,11 +132,19 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	int i;

 	if (hcd->irq > 0)
 		return;

-	free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
+	free_irq(pci_irq_vector(pdev, 0), &xhci->irq_ctx[0]);
+
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++)
+		free_irq(pci_irq_vector(pdev, i + 1), &xhci->irq_ctx[i + 1]);
+
+	xhci->secondary_irqs_enabled = 0;
+	memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
+
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }
@@ -145,6 +155,9 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int ret;
+	int i;
+	unsigned int request_secondary_intrs;
+	struct xhci_irq_ctx *ctx;

 	/*
 	 * Some Fresco Logic host controllers advertise MSI, but fail to
@@ -167,20 +180,54 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)

 	/* TODO: Check with MSI Soc for sysdev */
 	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, xhci->nvecs,
-					    PCI_IRQ_MSIX | PCI_IRQ_MSI);
+					    PCI_IRQ_MSIX | PCI_IRQ_MSI | PCI_IRQ_AFFINITY);
 	if (xhci->nvecs < 0) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			       "failed to allocate IRQ vectors");
 		goto legacy_irq;
 	}

-	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
-			  xhci_to_hcd(xhci));
+	memset(xhci->irq_ctx, 0, sizeof(xhci->irq_ctx));
+
+	ctx = &xhci->irq_ctx[0];
+	ctx->hcd = hcd;
+	ctx->intr_num = 0;
+	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd", ctx);
 	if (ret)
 		goto free_irq_vectors;

 	hcd->msi_enabled = 1;
 	hcd->msix_enabled = pdev->msix_enabled;
+
+	if (xhci->nvecs <= 1)
+		request_secondary_intrs = 0;
+	else
+		request_secondary_intrs = min_t(unsigned int,
+					(unsigned int)(xhci->nvecs - 1),
+					xhci->secondary_irqs_alloc);
+
+	/* Secondary transfer interrupters */
+	xhci->secondary_irqs_enabled = 0;
+	for (i = 0; i < request_secondary_intrs; i++) {
+		ctx = &xhci->irq_ctx[i + 1];
+		ctx->hcd = hcd;
+		ctx->intr_num = i + 1;
+
+		ret = request_irq(pci_irq_vector(pdev, i + 1),
+				xhci_msi_irq, 0, "xhci_hcd", ctx);
+		if (ret)
+			break;
+
+		xhci->secondary_irqs_enabled++;
+	}
+
+	if (i != 0 && i < request_secondary_intrs) {
+		while (--i >= 0)
+			free_irq(pci_irq_vector(pdev, i + 1), &xhci->irq_ctx[i + 1]);
+
+		xhci->secondary_irqs_enabled = 0;
+	}
+
 	return 0;

 free_irq_vectors:
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9315ba18310d..bf08d8764625 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2661,6 +2661,16 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep_index);

 	if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_DISABLED) {
+		/*
+		 * Secondary interrupters may deliver late transfer events after an endpoint
+		 * is disabled during stop or teardown.  If the completion code is a stopped
+		 * transfer (COMP_STOPPED*), drop it to avoid spurious error reports.
+		 */
+		if (trb_comp_code == COMP_STOPPED ||
+				trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
+				trb_comp_code == COMP_STOPPED_SHORT_PACKET)
+			return 0;
+
 		xhci_err(xhci,
 			 "ERROR Transfer event for disabled endpoint slot %u ep %u\n",
 			  slot_id, ep_index);
@@ -3169,17 +3179,20 @@ void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
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
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	irqreturn_t ret = IRQ_HANDLED;
 	u32 status;

+	/*
+	 * Ignore late secondary MSI/MSI-X interrupts after HW access has
+	 * been disabled.
+	 * Keep primary interrupter behavior unchanged.
+	 */
+	if (ir->intr_num != 0 && !HCD_HW_ACCESSIBLE(hcd))
+		return IRQ_HANDLED;
+
 	spin_lock(&xhci->lock);
 	/* Check if the xHC generated the interrupt, or the irq is shared */
 	status = readl(&xhci->op_regs->status);
@@ -3188,7 +3201,11 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
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
@@ -3204,25 +3221,52 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
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

-irqreturn_t xhci_msi_irq(int irq, void *hcd)
+/*
+ * xHCI spec says we can get an interrupt, and if the HC has an error condition,
+ * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
+ * indicators of an event TRB error, but we check the status *first* to be safe.
+ */
+irqreturn_t xhci_irq(struct usb_hcd *hcd)
 {
-	return xhci_irq(hcd);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	return xhci_irq_ir(xhci, xhci->interrupters[0]);
+}
+
+irqreturn_t xhci_msi_irq(int irq, void *data)
+{
+	struct xhci_irq_ctx *ctx = data;
+	struct xhci_hcd *xhci;
+	struct xhci_interrupter *ir;
+
+	/* All MSI/MSI-X vectors use ctx (dev_id) to select interrupter.*/
+	if (!ctx || !ctx->hcd)
+		return IRQ_NONE;
+
+	xhci = hcd_to_xhci(ctx->hcd);
+	ir = xhci->interrupters[ctx->intr_num];
+	if (!ir)
+		return IRQ_NONE;
+
+	return xhci_irq_ir(xhci, ir);
 }
 EXPORT_SYMBOL_GPL(xhci_msi_irq);

@@ -3624,6 +3668,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	int sent_len, ret;
 	u32 field, length_field, remainder;
 	u64 addr, send_addr;
+	struct xhci_interrupter *ir;

 	ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ring)
@@ -3664,6 +3709,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_trb = &ring->enqueue->generic;
 	start_cycle = ring->cycle_state;
 	send_addr = addr;
+	ir = xhci->devs[slot_id]->interrupter;

 	/* Queue the TRBs, even if they are zero-length */
 	for (enqd_len = 0; first_trb || enqd_len < full_len;
@@ -3724,7 +3770,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,

 		length_field = TRB_LEN(trb_buff_len) |
 			TRB_TD_SIZE(remainder) |
-			TRB_INTR_TARGET(0);
+			TRB_INTR_TARGET(ir->intr_num);

 		queue_trb(xhci, ring, more_trbs_coming | need_zero_pkt,
 				lower_32_bits(send_addr),
@@ -3756,7 +3802,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		urb_priv->td[1].end_trb = ring->enqueue;
 		urb_priv->td[1].end_seg = ring->enq_seg;
 		field = TRB_TYPE(TRB_NORMAL) | ring->cycle_state | TRB_IOC;
-		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(0), field);
+		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(ir->intr_num), field);
 	}

 	check_trb_math(urb, enqd_len);
@@ -3778,6 +3824,9 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	u32 field;
 	struct urb_priv *urb_priv;
 	struct xhci_td *td;
+	struct xhci_interrupter *ir;
+
+	ir = xhci->devs[slot_id]->interrupter;

 	ep_ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ep_ring)
@@ -3800,7 +3849,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (last_trb_on_seg(ep_ring->enq_seg, ep_ring->enqueue + 1)) {
 			field = TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state;
 			queue_trb(xhci, ep_ring, false, 0, 0,
-					TRB_INTR_TARGET(0), field);
+					TRB_INTR_TARGET(ir->intr_num), field);
 		}
 	}

@@ -3851,7 +3900,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, true,
 		  setup->bRequestType | setup->bRequest << 8 | le16_to_cpu(setup->wValue) << 16,
 		  le16_to_cpu(setup->wIndex) | le16_to_cpu(setup->wLength) << 16,
-		  TRB_LEN(8) | TRB_INTR_TARGET(0),
+		  TRB_LEN(8) | TRB_INTR_TARGET(ir->intr_num),
 		  /* Immediate data in pointer */
 		  field);

@@ -3881,7 +3930,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				urb, 1);
 		length_field = TRB_LEN(urb->transfer_buffer_length) |
 				TRB_TD_SIZE(remainder) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);
 		if (setup->bRequestType & USB_DIR_IN)
 			field |= TRB_DIR_IN;
 		queue_trb(xhci, ep_ring, true,
@@ -3904,7 +3953,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, false,
 			0,
 			0,
-			TRB_INTR_TARGET(0),
+			TRB_INTR_TARGET(ir->intr_num),
 			/* Event on completion */
 			field | TRB_IOC | TRB_TYPE(TRB_STATUS) | ep_ring->cycle_state);

@@ -4094,7 +4143,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,

 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
-	ir = xhci->interrupters[0];
+	ir = xhci->devs[slot_id]->interrupter;

 	num_tds = urb->number_of_packets;
 	if (num_tds < 1) {
@@ -4195,7 +4244,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 						   urb, more_trbs_coming);

 			length_field = TRB_LEN(trb_buff_len) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);

 			/* xhci 1.1 with ETE uses TD Size field for TBC */
 			if (first_trb && xep->use_extended_tbc)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index b3ba16b9718c..713560cdb69a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -597,6 +597,7 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	struct xhci_interrupter *ir = xhci->interrupters[0];
 	unsigned long	flags;
 	u32		temp;
+	int		i;

 	/*
 	 * Enable interrupts before starting the host (xhci 4.2 and 5.5.2).
@@ -612,6 +613,12 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable primary interrupter");
 	xhci_enable_interrupter(ir);

+	/* Enable secondary interrupters (if any were successfully requested) */
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+		if (xhci->interrupters[i + 1])
+			xhci_enable_interrupter(xhci->interrupters[i + 1]);
+	}
+
 	if (xhci_start(xhci)) {
 		xhci_halt(xhci);
 		spin_unlock_irqrestore(&xhci->lock, flags);
@@ -708,6 +715,7 @@ void xhci_stop(struct usb_hcd *hcd)
 	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir = xhci->interrupters[0];
+	int i;

 	mutex_lock(&xhci->mutex);

@@ -744,6 +752,12 @@ void xhci_stop(struct usb_hcd *hcd)
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
 	xhci_disable_interrupter(xhci, ir);

+	/* Disable secondary interrupters */
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+		if (xhci->interrupters[i + 1])
+			xhci_disable_interrupter(xhci, xhci->interrupters[i + 1]);
+	}
+
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
 	xhci_debugfs_exit(xhci);
@@ -1087,6 +1101,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
+	int			i;

 	if (!hcd->state)
 		return 0;
@@ -1182,6 +1197,12 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
 		xhci_disable_interrupter(xhci, xhci->interrupters[0]);

+		/* Disable secondary interrupters as well */
+		for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+			if (xhci->interrupters[i + 1])
+				xhci_disable_interrupter(xhci, xhci->interrupters[i + 1]);
+		}
+
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
 		xhci_debugfs_exit(xhci);
@@ -4121,6 +4142,8 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	virt_dev->udev = NULL;
 	xhci_disable_slot(xhci, udev->slot_id);

+	virt_dev->interrupter = NULL;
+
 	spin_lock_irqsave(&xhci->lock, flags);
 	xhci_free_virt_device(xhci, virt_dev, udev->slot_id);
 	spin_unlock_irqrestore(&xhci->lock, flags);
@@ -4216,6 +4239,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	unsigned long flags;
 	int ret, slot_id;
 	struct xhci_command *command;
+	unsigned int intr_num;

 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
@@ -4272,6 +4296,18 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)

 	udev->slot_id = slot_id;

+	/*
+	 * Select a default interrupter for this device.
+	 *
+	 * Using slot_id modulo spreads devices across enabled secondary vectors;
+	 * queueing code will use this to program TRB_INTR_TARGET().
+	 */
+	if (xhci->secondary_irqs_enabled) {
+		intr_num = slot_id % xhci->secondary_irqs_enabled;
+		vdev->interrupter = xhci->interrupters[intr_num + 1];
+	} else
+		vdev->interrupter = xhci->interrupters[0];
+
 	xhci_debugfs_create_slot(xhci, slot_id);

 	/*
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2b0796f6d00e..73514b2b1651 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -45,6 +45,9 @@
  */
 #define MAX_HC_INTRS		128

+/* Software cap for secondary interrupters; not a hardware limit. */
+#define MAX_SECONDARY_INTRNUM   4
+
 /*
  * xHCI register interface.
  * This corresponds to the eXtensible Host Controller Interface (xHCI)
@@ -405,6 +408,11 @@ struct xhci_slot_ctx {
 #define SLOT_STATE_ADDRESSED	2
 #define SLOT_STATE_CONFIGURED	3

+/* Interrupter Target - tt_info[31:22] (xHCI Slot Context) */
+#define SLOT_INTR_TARGET_SHIFT	22
+#define SLOT_INTR_TARGET_MASK	(0x3ffU << SLOT_INTR_TARGET_SHIFT)
+#define SLOT_INTR_TARGET(p)	(((p) & 0x3ffU) << SLOT_INTR_TARGET_SHIFT)
+
 /**
  * struct xhci_ep_ctx
  * @ep_info:	endpoint state, streams, mult, and interval information.
@@ -764,6 +772,12 @@ struct xhci_virt_device {
 	void				*debugfs_private;
 	/* set if this endpoint is controlled via sideband access*/
 	struct xhci_sideband	*sideband;
+	/*
+	 * Default transfer-event interrupter for this USB device.
+	 * Queueing code programs TRB_INTR_TARGET() from vdev->interrupter
+	 * to route transfer completion events to the selected event ring.
+	 */
+	struct xhci_interrupter *interrupter;
 };

 /*
@@ -1497,6 +1511,11 @@ struct xhci_hub {
 	u8			min_rev;
 };

+struct xhci_irq_ctx {
+	struct usb_hcd *hcd;
+	u8		intr_num;
+};
+
 /* There is one xhci_hcd structure per controller */
 struct xhci_hcd {
 	struct usb_hcd *main_hcd;
@@ -1533,6 +1552,12 @@ struct xhci_hcd {
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
 	struct xhci_interrupter **interrupters;
+	/* number of secondary interrupters successfully created */
+	unsigned int            secondary_irqs_alloc;
+	/* number of secondary interrupters successfully in use */
+	unsigned int            secondary_irqs_enabled;
+	/* MSI/MSI-X vector contexts. Vector 0 uses [0], secondary use [1..] */
+	struct xhci_irq_ctx	irq_ctx[MAX_SECONDARY_INTRNUM + 1];
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
 #define CMD_RING_STATE_RUNNING         (1 << 0)
@@ -1895,7 +1920,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
 int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume);

 irqreturn_t xhci_irq(struct usb_hcd *hcd);
-irqreturn_t xhci_msi_irq(int irq, void *hcd);
+irqreturn_t xhci_msi_irq(int irq, void *data);
 int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
--
2.50.1


