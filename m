Return-Path: <linux-usb+bounces-31534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E041DCC6EB3
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 10:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 032373048422
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 09:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2BD33D4F0;
	Wed, 17 Dec 2025 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="N5woOQGT"
X-Original-To: linux-usb@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01D33C528
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.67.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765964818; cv=none; b=rwSk8CT8PLE+GQ75L6nUGdfgijVQXTBZ3Gu3oBODCOKGuoPtLJf8bhQqO4SbGlCkHoF2GakPeT8Fw8uszgr/n/U+W5abmJ1oDhPCBORTco+0a+jPAIuXloF/vEtdxco5gbk2uRFANn3Uv1FyuD2BgOh/28bUrW83Mw3tevPUmYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765964818; c=relaxed/simple;
	bh=TWjL2JmXeoRPfM+IuwicigaZraOIJWSnXYTtF0HkmMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3kfKfRevVIxXz+CADSQqvalu/raxWfCv3zcgi5Tg3eqhhqVFP0o/W2BzXBilaA4XdUeJlrP84uzEtRavi2JuW6h1Ack7NjOZacZInghIOJoX5gwEY+e5WtJX5mGqGqu/1ioPqiNTqGQiIWhnqvjE0xCt2zMjk5WYCyRUB8o+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=N5woOQGT; arc=none smtp.client-ip=114.132.67.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1765964778;
	bh=61xs8U+dJJvp7dQQXnFwghW91oRD8SvojZexMY28Ieg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=N5woOQGTEmfnFWyJD5mifD5jLljR+C9bv1Q3m+K0nmQA/9NO/69q3ej0G/p2XItQi
	 ZqDzMmJy6LzbAvBE1dQBPvpkKbvS3CVzLP8lKcj4HIm8zkwQryejD9JBWhJlltHQ8p
	 yiB8Xqy7ypshYC0QeQU/Wjo6GyFzec2y/5QZYpAY=
X-QQ-mid: zesmtpip3t1765964773t5b11a6ba
X-QQ-Originating-IP: InsX1RVMxeYM+KvEgDzmMUV/p7N3Cg/TlqtPU51GPxM=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Dec 2025 17:46:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6541843449717983935
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com,
	zhanjun@uniontech.com
Subject: [PATCH v3] usb: xhci: route endpoints to secondary interrupters
Date: Wed, 17 Dec 2025 17:46:08 +0800
Message-ID: <D7A2A2BD5BF19E5A+20251217094608.3848027-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: MIEbEOayU4Lo1bFS1eUdFqSbDSKH9argkxWyzib7XE/2+sUI2Mqk+Lkq
	2DC1cW6WG8txDVcPOUujZRgi6ATooBM/lxf4rcTY0LjmUkg8Rq36m6NMMyb3z/V8FOTe+2G
	oPoRkEEu+0hxMUIVFzldM9AOC2bl33posaYL4TEUU5CWb59h6ARPcjAaUYo2rd/B4N5ToWu
	PEgWAsQ2ugjtxkIdlD1MbaQoHmxzI2ZTLf2/YtTrnawiStVhJDeSYzC+8mJdID/S6d+WFFF
	sDFg7bOPG1vfdKwgOwhGU32aBuDyfbpr27MxHVLXWIGAnVAnqiw1GO7qOhYlz59WlW3KgZb
	GhxCxObsJ7y5XE2237i+Xh9O5uHwypDJYvn8eAosBu8RAPhdTo39K7Dex3XcSf5SXkNrg52
	yRz7wXWghHGbhTQ83HQQP0zibTD1JeRS5Zm1NlI+7GM+XhZk5MSeewFSkqJ7ElkLuVqSN/R
	qyKVgsKnyVs/M93Gwe2GtRSChfbbhaNRP6998pDT+tMaOYkHGDu8yU37iDsbkEnaROupL9A
	kBS8Q6Ues32XXZqFOzF/L7r8t+k1r619w3qrFqm6q/LrBweIIHtmLEuJaalj5A3mK+xY30a
	vPQHR9PvWsQEuFWH9neiJH0nJdryiBPGxvtyIhG/krwJqkaW2vV/YV0p8q9UIWJshBHmLBH
	JQ9rr4zyOIm/2X3iymhMf6zR+BLbFtVYgNN+wi8KkGzHBY0R/kP/W667xne7mEPlwVlLFPs
	VQ9pu7eguaNU9c3NG5yLyHjboajHL0i5TctfntXueRpx5o/P333Lr5tqfwgFRVl/iSX1wpK
	tffgrJEaBKbMiqszi+bNIKHlfXcGZ8+pc9Ka23b7iRijdi98lv3PmdJ36TAKUA6MlbsDJrh
	uJoCimoJQJHJUHorzr5f8JMrBe4WR74LA3WaPgEhDcy9Vzu9JAkJdSmlceYfrYyRWTP/tYZ
	T8OyHvSToc4y6AAVzF3JfbOJn7xp8Yn/39WIyG/NJLBRQ2KypuHGvh3p+muUwHubmZOwmJ2
	226Qo48Hl2H30IyXPgYRZcBh4DAirLlIOf1QWMoc9PjuLr22gg790Xv8fp88AIxhg37qGLO
	YeBeDm7pp8OUvZ2GmJnGqM=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

Some xHCI hosts expose multiple MSI/MSI-X vectors, but the driver
currently routes all transfer completions through interrupter 0.
This can lead to unnecessary contention on the primary event ring
and IRQ vector.

If the host reports more than one interrupter, allocate secondary
interrupters [1..max_interrupters-1] and cap the number of created
interrupters by num_online_cpus(). Each secondary interrupter has
its own event ring and can be requested as a separate IRQ vector.

An interrupter is bound to each endpoint once at endpoint enable
time. EP0 is always kept on interrupter 0, while all other endpoints
are assigned in a round-robin fashion over the enabled secondary
interrupters. Multiple endpoints may therefore share the same
interrupter.

Interrupt routing is performed by programming TRB_INTR_TARGET()
from the endpoint's bound interrupter number when queueing TRBs.
As a result, transfer completions are delivered to the event ring
(and IRQ vector) of the selected interrupter instead of always
landing on interrupter 0.

All interrupters share a common IRQ handler. STS_EINT is only
checked and cleared for interrupter 0, as it is only meaningful
for the primary interrupter. Secondary MSI/MSI-X vectors may fire
independently and simply process their associated event rings.

When requesting IRQs, the usb_hcd pointer is used as the dev_id
for both primary and secondary vectors. Although each secondary
interrupter has its own event ring, using per-interrupter dev_id
objects complicates teardown ordering in xhci_cleanup_msix().
In particular, IRQs must be freed before the corresponding
interrupter structures are removed, and the existing cleanup
sequence imposes constraints on dev_id lifetime. Using a common
dev_id avoids dev_id mismatches during free_irq() and keeps the
IRQ teardown consistent with the current xHCI removal flow.

Testing on an MSI-X capable host controller shows that interrupts
are effectively distributed across secondary vectors. For example,
after sustained USB transfers:

  /proc/interrupts (filtered):
    32:          0          0          0          0          0          0 \
          0        522  IR-PCI-MSIX-0000:03:00.3  0-edge  xhci_hcd
    33:      12297          0          0          0          0          0 \
          0          0  IR-PCI-MSIX-0000:03:00.3  1-edge  xhci_hcd
    34:          0      17082          0          0          0          0 \
          0          0  IR-PCI-MSIX-0000:03:00.3  2-edge  xhci_hcd
    35:          0          0      27567          0          0          0 \
          0          0  IR-PCI-MSIX-0000:03:00.3  3-edge  xhci_hcd
    36:          0          0          0      33234          0          0 \
          0          0  IR-PCI-MSIX-0000:03:00.3  4-edge  xhci_hcd
    37:          0          0          0          0    1519411          0 \
          0          0  IR-PCI-MSIX-0000:03:00.3  5-edge  xhci_hcd

This demonstrates that transfer completions are no longer handled
exclusively by interrupter 0, but are instead distributed across
multiple MSI-X vectors.

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
---
 drivers/usb/host/xhci-mem.c  | 86 +++++++++++++++++++++++++++++++++---
 drivers/usb/host/xhci-pci.c  | 28 ++++++++++++
 drivers/usb/host/xhci-ring.c | 79 ++++++++++++++++++++++++---------
 drivers/usb/host/xhci.c      | 38 ++++++++++++++++
 drivers/usb/host/xhci.h      |  7 +++
 5 files changed, 212 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c4a6544aa107..277d395c03b8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1408,6 +1408,36 @@ static u32 xhci_get_max_esit_payload(struct usb_device *udev,
 	return max_packet * max_burst;
 }
 
+/* Pick an interrupter for an endpoint (EP0 always stays on interrupter 0). */
+static struct xhci_interrupter *
+xhci_pick_ep_interrupter(struct xhci_hcd *xhci, unsigned int ep_index)
+{
+	unsigned int idx;
+
+	/* Keep EP0 on primary interrupter */
+	if (ep_index == 0 || !xhci->nr_xfer_interrupters)
+		return xhci->interrupters[0];
+
+	/* round-robin over enabled secondary interrupters */
+	idx = (unsigned int)atomic_inc_return(&xhci->next_xfer_intr);
+	idx = (idx - 1) % xhci->nr_xfer_interrupters;
+	return xhci->xfer_interrupters[idx] ?: xhci->interrupters[0];
+}
+
+/* Bind the endpoint to one interrupter at enable time. */
+static void xhci_bind_ep_interrupter(struct xhci_hcd *xhci,
+		struct xhci_virt_device *virt_dev,
+		unsigned int ep_index)
+{
+	struct xhci_virt_ep *xep;
+	struct xhci_interrupter *ir;
+
+	xep = &virt_dev->eps[ep_index];
+	ir = xhci_pick_ep_interrupter(xhci, ep_index);
+
+	xep->interrupter = ir;
+}
+
 /* Set up an endpoint with one ring segment.  Do not allocate stream rings.
  * Drivers will have to call usb_alloc_streams() to do that.
  */
@@ -1511,6 +1541,9 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	ep_ctx->tx_info = cpu_to_le32(EP_MAX_ESIT_PAYLOAD_LO(max_esit_payload) |
 				      EP_AVG_TRB_LENGTH(avg_trb_len));
 
+	/* bind endpoint to an interrupter once at enable time */
+	xhci_bind_ep_interrupter(xhci, virt_dev, ep_index);
+
 	return 0;
 }
 
@@ -1902,17 +1935,31 @@ EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
 void xhci_mem_cleanup(struct xhci_hcd *xhci)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct usb_hcd  *hcd = xhci_to_hcd(xhci);
 	int i, j, num_ports;
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
 
-	for (i = 0; xhci->interrupters && i < xhci->max_interrupters; i++) {
-		if (xhci->interrupters[i]) {
-			xhci_remove_interrupter(xhci, xhci->interrupters[i]);
-			xhci_free_interrupter(xhci, xhci->interrupters[i]);
-			xhci->interrupters[i] = NULL;
+	if (xhci->interrupters && xhci->interrupters[0]) {
+		xhci_remove_interrupter(xhci, xhci->interrupters[0]);
+		xhci_free_interrupter(xhci, xhci->interrupters[0]);
+		xhci->interrupters[0] = NULL;
+	}
+
+	for (i = 0; xhci->xfer_interrupters && i < xhci->xfer_irq_num; i++) {
+		if (xhci->xfer_interrupters[i]) {
+			xhci_remove_secondary_interrupter(hcd, xhci->xfer_interrupters[i]);
+			xhci->xfer_interrupters[i] = NULL;
 		}
 	}
+
+	if (xhci->xfer_irq_num) {
+		kfree(xhci->xfer_interrupters);
+		xhci->xfer_interrupters = NULL;
+		xhci->xfer_irq_num = 0;
+		atomic_set(&xhci->next_xfer_intr, 0);
+	}
+
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed interrupters");
 
 	if (xhci->cmd_ring)
@@ -2412,6 +2459,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
+	int		i;
 
 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2505,6 +2553,34 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters[0])
 		goto fail;
 
+	/*
+	 * Allocate secondary interrupters [1..max_interrupters-1].
+	 * Cap by num_online_cpus() to avoid excessive vectors.
+	 */
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating secondary event ring");
+	if (xhci->max_interrupters > 1) {
+		xhci->xfer_irq_num = min(num_online_cpus(),
+					(unsigned int)xhci->max_interrupters - 1);
+		xhci->xfer_interrupters = kcalloc_node(xhci->xfer_irq_num,
+				sizeof(*xhci->xfer_interrupters),
+				flags, dev_to_node(dev));
+
+		if (!xhci->xfer_interrupters)
+			goto fail;
+	} else
+		xhci->xfer_irq_num = 0;
+
+	for (i = 0; i < xhci->xfer_irq_num; i++) {
+		struct xhci_interrupter *ir;
+		/* Create secondary interrupter with intr_num = i + 1. */
+		ir = xhci_create_secondary_interrupter(xhci_to_hcd(xhci),
+				i + 1, xhci->imod_interval, 0);
+		if (!ir)
+			goto fail;
+
+		xhci->xfer_interrupters[i] = ir;
+	}
+
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;
 
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index f67a4d956204..217e6e217f81 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/reset.h>
 #include <linux/suspend.h>
+#include <linux/irq.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -130,11 +131,20 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	int i;
 
 	if (hcd->irq > 0)
 		return;
 
+	irq_set_handler_data(pci_irq_vector(pdev, 0), NULL);
 	free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
+
+	for (i = 0; i < xhci->nr_xfer_interrupters; i++) {
+		irq_set_handler_data(pci_irq_vector(pdev, i+1), NULL);
+		free_irq(pci_irq_vector(pdev, i+1), hcd);
+	}
+	xhci->nr_xfer_interrupters = 0;
+
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }
@@ -145,6 +155,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int ret;
+	int i;
 
 	/*
 	 * Some Fresco Logic host controllers advertise MSI, but fail to
@@ -179,6 +190,23 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	if (ret)
 		goto free_irq_vectors;
 
+	irq_set_handler_data(pci_irq_vector(pdev, 0), xhci->interrupters[0]);
+
+	/* Secondary transfer interrupters */
+	xhci->nr_xfer_interrupters = 0;
+	for (i = 0; i < xhci->xfer_irq_num; i++) {
+		struct xhci_interrupter *ir;
+
+		ir = xhci->xfer_interrupters[i];
+		ret = request_irq(pci_irq_vector(pdev, ir->intr_num),
+				xhci_msi_irq, 0, "xhci_hcd", xhci_to_hcd(xhci));
+		if (ret)
+			break;
+
+		irq_set_handler_data(pci_irq_vector(pdev, ir->intr_num), ir);
+		xhci->nr_xfer_interrupters++;
+	}
+
 	hcd->msi_enabled = 1;
 	hcd->msix_enabled = pdev->msix_enabled;
 	return 0;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 6309200e93dc..a76707055180 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -57,6 +57,7 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/dma-mapping.h>
+#include <linux/irq.h>
 #include "xhci.h"
 #include "xhci-trace.h"
 
@@ -3187,14 +3188,8 @@ void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
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
 
@@ -3206,7 +3201,11 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		goto out;
 	}
 
-	if (!(status & STS_EINT)) {
+	/*
+	 * STS_EINT is only meaningful for the primary interrupter (0).
+	 * Secondary MSI/MSI-X interrupters may fire without STS_EINT set.
+	 */
+	if (ir->intr_num == 0 && !(status & STS_EINT)) {
 		ret = IRQ_NONE;
 		goto out;
 	}
@@ -3222,25 +3221,46 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
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
 
 	/* This is the handler of the primary interrupter */
-	xhci_handle_events(xhci, xhci->interrupters[0], false);
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
 irqreturn_t xhci_msi_irq(int irq, void *hcd)
 {
-	return xhci_irq(hcd);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_interrupter *ir;
+
+	ir = irq_get_handler_data(irq);
+	if (!ir)
+		ir = xhci->interrupters[0];
+
+	return xhci_irq_ir(xhci, ir);
 }
 EXPORT_SYMBOL_GPL(xhci_msi_irq);
 
@@ -3624,6 +3644,21 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 	return 1;
 }
 
+static inline struct xhci_interrupter *
+xhci_ep_interrupter(struct xhci_hcd *xhci, int slot_id, unsigned int ep_index)
+{
+	struct xhci_virt_device *vdev;
+
+	if (slot_id <= 0 || slot_id >= MAX_HC_SLOTS)
+		return xhci->interrupters[0];
+	vdev = xhci->devs[slot_id];
+	if (!vdev)
+		return xhci->interrupters[0];
+	if (ep_index >= ARRAY_SIZE(vdev->eps))
+		return xhci->interrupters[0];
+	return vdev->eps[ep_index].interrupter ?: xhci->interrupters[0];
+}
+
 /* This is very similar to what ehci-q.c qtd_fill() does */
 int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		struct urb *urb, int slot_id, unsigned int ep_index)
@@ -3642,6 +3677,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	int sent_len, ret;
 	u32 field, length_field, remainder;
 	u64 addr, send_addr;
+	struct xhci_interrupter *ir;
 
 	ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ring)
@@ -3682,6 +3718,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_trb = &ring->enqueue->generic;
 	start_cycle = ring->cycle_state;
 	send_addr = addr;
+	ir = xhci_ep_interrupter(xhci, slot_id, ep_index);
 
 	/* Queue the TRBs, even if they are zero-length */
 	for (enqd_len = 0; first_trb || enqd_len < full_len;
@@ -3742,7 +3779,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 		length_field = TRB_LEN(trb_buff_len) |
 			TRB_TD_SIZE(remainder) |
-			TRB_INTR_TARGET(0);
+			TRB_INTR_TARGET(ir->intr_num);
 
 		queue_trb(xhci, ring, more_trbs_coming | need_zero_pkt,
 				lower_32_bits(send_addr),
@@ -3774,7 +3811,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		urb_priv->td[1].end_trb = ring->enqueue;
 		urb_priv->td[1].end_seg = ring->enq_seg;
 		field = TRB_TYPE(TRB_NORMAL) | ring->cycle_state | TRB_IOC;
-		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(0), field);
+		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(ir->intr_num), field);
 	}
 
 	check_trb_math(urb, enqd_len);
@@ -4112,7 +4149,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
-	ir = xhci->interrupters[0];
+	ir = xep->interrupter ?: xhci->interrupters[0];
 
 	num_tds = urb->number_of_packets;
 	if (num_tds < 1) {
@@ -4213,7 +4250,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 						   urb, more_trbs_coming);
 
 			length_field = TRB_LEN(trb_buff_len) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);
 
 			/* xhci 1.1 with ETE uses TD Size field for TBC */
 			if (first_trb && xep->use_extended_tbc)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 742c23826e17..c6836b254d9d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -590,6 +590,7 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	struct xhci_interrupter *ir = xhci->interrupters[0];
 	unsigned long	flags;
 	u32		temp;
+	int		i;
 
 	/*
 	 * Enable interrupts before starting the host (xhci 4.2 and 5.5.2).
@@ -605,6 +606,12 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Enable primary interrupter");
 	xhci_enable_interrupter(ir);
 
+	/* Enable secondary interrupters (if any were successfully requested) */
+	for (i = 0; i < xhci->nr_xfer_interrupters; i++) {
+		if (xhci->xfer_interrupters && xhci->xfer_interrupters[i])
+			xhci_enable_interrupter(xhci->xfer_interrupters[i]);
+	}
+
 	if (xhci_start(xhci)) {
 		xhci_halt(xhci);
 		spin_unlock_irqrestore(&xhci->lock, flags);
@@ -701,6 +708,7 @@ void xhci_stop(struct usb_hcd *hcd)
 	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir = xhci->interrupters[0];
+	int i;
 
 	mutex_lock(&xhci->mutex);
 
@@ -737,6 +745,12 @@ void xhci_stop(struct usb_hcd *hcd)
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
 	xhci_disable_interrupter(xhci, ir);
 
+	/* Disable secondary interrupters */
+	for (i = 0; i < xhci->nr_xfer_interrupters; i++) {
+		if (xhci->xfer_interrupters && xhci->xfer_interrupters[i])
+			xhci_disable_interrupter(xhci, xhci->xfer_interrupters[i]);
+	}
+
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
 	xhci_debugfs_exit(xhci);
@@ -1080,6 +1094,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
+	int			i;
 
 	if (!hcd->state)
 		return 0;
@@ -1175,6 +1190,12 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
 		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
 
+		/* Disable secondary interrupters as well */
+		for (i = 0; i < xhci->nr_xfer_interrupters; i++) {
+			if (xhci->xfer_interrupters && xhci->xfer_interrupters[i])
+				xhci_disable_interrupter(xhci, xhci->xfer_interrupters[i]);
+		}
+
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
 		xhci_debugfs_exit(xhci);
@@ -1879,6 +1900,16 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	return ret;
 }
 
+static void xhci_unbind_ep_interrupter(struct xhci_hcd *xhci,
+		struct xhci_virt_device *virt_dev,
+		unsigned int ep_index)
+{
+	struct xhci_virt_ep *xep;
+
+	xep = &virt_dev->eps[ep_index];
+	xep->interrupter = NULL;
+}
+
 /* Drop an endpoint from a new bandwidth configuration for this device.
  * Only one call to this function is allowed per endpoint before
  * check_bandwidth() or reset_bandwidth() must be called.
@@ -1902,6 +1933,7 @@ int xhci_drop_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
 	struct xhci_ep_ctx *ep_ctx;
 	u32 drop_flag;
 	u32 new_add_flags, new_drop_flags;
+	struct xhci_virt_device *virt_dev;
 	int ret;
 
 	ret = xhci_check_args(hcd, udev, ep, 1, true, __func__);
@@ -1953,6 +1985,12 @@ int xhci_drop_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
 
 	xhci_endpoint_zero(xhci, xhci->devs[udev->slot_id], ep);
 
+	virt_dev = xhci->devs[udev->slot_id];
+	if (virt_dev) {
+		ep_index = xhci_get_endpoint_index(&ep->desc);
+		xhci_unbind_ep_interrupter(xhci, virt_dev, ep_index);
+	}
+
 	xhci_dbg(xhci, "drop ep 0x%x, slot id %d, new drop flags = %#x, new add flags = %#x\n",
 			(unsigned int) ep->desc.bEndpointAddress,
 			udev->slot_id,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 85d5b964bf1e..23caedfebdb9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -700,6 +700,8 @@ struct xhci_virt_ep {
 	bool			use_extended_tbc;
 	/* set if this endpoint is controlled via sideband access*/
 	struct xhci_sideband	*sideband;
+	/* interrupter bound to this endpoint */
+	struct xhci_interrupter *interrupter;
 };
 
 enum xhci_overhead_type {
@@ -1533,6 +1535,11 @@ struct xhci_hcd {
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
 	struct xhci_interrupter **interrupters;
+	struct xhci_interrupter **xfer_interrupters;
+	/* secondary interrupters for transfer events */
+	unsigned int            nr_xfer_interrupters;
+	atomic_t	        next_xfer_intr;
+	unsigned int		xfer_irq_num;
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
 #define CMD_RING_STATE_RUNNING         (1 << 0)
-- 
2.50.1


