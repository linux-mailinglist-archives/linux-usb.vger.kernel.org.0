Return-Path: <linux-usb+bounces-31770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FB6CDE8AC
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 10:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 821B4300A347
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 09:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E2522DF9E;
	Fri, 26 Dec 2025 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="FwP/ciPl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF7C19CD1D
	for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766741908; cv=none; b=AXR6W4EGqsLAqseDfKQK6coc8qeLnkeHDbB/q8oX0zTrMyNL5Pa39vWz+NMCtdfLz/drgyDblQZGFJL8/NLms3oj4I4I7IN/eP+NwUtPJRyIf93HfaTJrFME8XItOkQ03vq5Y0jvmOAl2JT+2KqQrQzdlDhLdP+Is7QJ9xQHH5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766741908; c=relaxed/simple;
	bh=Vx1MVuRnVZrJqReILFhVmow5ySi0dtpRaiqHOg9P3A4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJ4iLrlVUxKcXovB3sXqfIAZr5RmC9UVK6hXRIhmVQ3Bp0Gk3lcHQ5lzZe/5htD/+S7j0NjM3H4+Az3VAvZIZ1UWYwolcv7yxjxSbiUqu62Bl2enOTjU5k/d75YsghnV/5KOf1sJUKFLtXKNXMm7uqCy9hyvQQ7yo+vp/zfLo0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=FwP/ciPl; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1766741870;
	bh=kqFsSwN/nhTYRHnIBgcpZ4UQ2eKjTqEVSc0fz2HUUjs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FwP/ciPlcoaLgTITFaqWkWFRbCpGMlDa4y2S93d5rLzxZc8IiMwbvxoK1SZHddH/H
	 rIYze2y5CpEfu1ldTpdNzKuMahyj64EpwBvMSjIAxKv8kL55HwmMDrLF7mtGHUp5eg
	 1h7/DDFdP+rFQmJ4fuMHaN+vnUth4l7/xiKcAXPQ=
X-QQ-mid: zesmtpip3t1766741864t3ab7c9f9
X-QQ-Originating-IP: h0/TtV+TfF90cmcA+E/QLNZkmt0CddkQzgaknlZUorQ=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 17:37:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9889684784965767368
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com,
	zhanjun@uniontech.com
Subject: [PATCH V5] usb:xhci:route device to secondary interrupters
Date: Fri, 26 Dec 2025 17:33:24 +0800
Message-ID: <D7580E11F21C8A25+20251226093324.1264039-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: Nmk/IkUR8Mprl4Wshl3nE+pIdc8/21rIwlzYkf2AsGDdz2lG/SIBpKfA
	UJC0oEfVIOa1p04NNw7LJKrZ7CuO9I3kHpRPDFHeIbu5ob8q9hEPs2ohg0N0R9w1tRF2QPT
	H/q0wCLu/OUm3j/0o5c7UZmOSsfAVrKlY7pp0Qp0xhYubZRLeOs3XOuWsV2mONVpeyM4T5F
	7n+pYu3NdxDMFWcyx8KJ/UrFjYfCAQR7xkS2r6enoiD8eD4MI0aTGIbtao3RjHRgLjeMcUN
	Xij4y3yYQoFmLcOQsXgMDUIlpEUjrWYcTtkAJ7e9gGWgRgQZuWJbJq0U0pbF1RZQ1rSova1
	anVI0KavnyXpCKbQcR2d3TWh1DXC2wOVrQsHHz6PZJofOHauCf/r3jAHJCaEq16HLlHvOJs
	xTnf4T8hT+dcm6mBuVGQWrls5QL9+XZglYd9pcvxjGHmgY46tt68yRQQndGmuyUbK5vlGKF
	XH2rN+I9Qb/5nZhO0ANBtk7WdX+N5LfOQsho/PnApZtariYyKnBjbR6W5VFfYRIXIRO9Dn/
	RfeSdxXNdlf8t4DSnXyrugamSf/LapLbfSa9YD30KyXJynSM9cTHnwm5tIE8ipC9QYdMjNR
	pkwRRzUkLbelHbZsIA/T923VDcgTZs8aAiTNXrDQBpzAZLNvs9sFOTpm7qJas/eRTwlaOXM
	6Qh/Fsy1GTqmk4hQNyh6cQMq9LiUR9a5aiyvb4K3Ij7fYRow6gyjNBUO+efnDQJqTSlYj4m
	bYRsbQF/LrA9XyMdHXJ8FXO5esKRWtx8Hh+qXsb40JQ0klmUCv8cQIOHfCwDxQlAfxE5TbH
	o7LTE72Ab7G4QVF7rXJlxmrqCL86qwCe6+3rdNMQE80ytC01tEefArRukts69kRbO5ajx+0
	hBNCwt3Z4AyrRCMdHISHIDK2gKKlOTso+J+jT51F7e8/m/tg0ZTAzamFSoPnFn+dCj5Peub
	ntK3INPG8ettsI/0TDX3egVIQiihW0KzwcNiZN7Yh0YcMqHtAdrKSAA2Ll6dCIJ5sIB0h8T
	K0GTykcGBkIcMegBkrX1qMxQAA9ECqhhDnmTBYQ8ScdtFwAcpuiiktlGbVB4nPU70rnUK0J
	NvVaA2kMxOTv0drm4kMKfzBdReuA/i2NA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
Use irq handler_data as a stable token (intr_num + 1).
Keep STS_EINT handling restricted to interrupter 0.
Apply MSI-X affinity hints for secondary vectors and re-apply
after resume.

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
---
 drivers/usb/host/xhci-mem.c  |  30 ++++++++++
 drivers/usb/host/xhci-pci.c  | 109 ++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-ring.c |  87 ++++++++++++++++++++--------
 drivers/usb/host/xhci.c      |  36 ++++++++++++
 drivers/usb/host/xhci.h      |  13 +++++
 5 files changed, 249 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c708bdd69f16..2ab670db3e20 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2402,6 +2402,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
+	unsigned int	i;
+	unsigned int    secondary_intr_num;
 
 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2495,6 +2497,34 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
+				i + 1, xhci->imod_interval, 0);
+
+		/* create fail rollback to primary interrupt */
+		if (!xhci->interrupters[i + 1]) {
+			xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+					"rollback to primary interrupter");
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
index 585b2f3117b0..9bb9abb84e0a 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/reset.h>
 #include <linux/suspend.h>
+#include <linux/irq.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -130,21 +131,75 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 {
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	int i;
 
 	if (hcd->irq > 0)
 		return;
 
+	irq_set_handler_data(pci_irq_vector(pdev, 0), NULL);
+	irq_set_affinity_hint(pci_irq_vector(pdev, 0), NULL);
 	free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
+
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+		irq_set_handler_data(pci_irq_vector(pdev, i + 1), NULL);
+		irq_set_affinity_hint(pci_irq_vector(pdev, i + 1), NULL);
+		free_irq(pci_irq_vector(pdev, i + 1), xhci_to_hcd(xhci));
+	}
+	xhci->secondary_irqs_enabled = 0;
+
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }
 
+static void xhci_msix_set_affinity_hint(struct xhci_hcd *xhci)
+{
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct pci_dev *pdev;
+	cpumask_var_t mask;
+	int node, i;
+
+	/* Nothing to do without MSI-X or without enabled secondary vectors. */
+	if (!hcd->msix_enabled || !xhci->secondary_irqs_enabled)
+		return;
+
+	pdev = to_pci_dev(hcd->self.controller);
+	node = dev_to_node(&pdev->dev);
+
+	/* Off-stack cpumasks must be freed (CONFIG_CPUMASK_OFFSTACK). */
+	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
+		return;
+
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+		struct xhci_interrupter *ir = xhci->interrupters[i + 1];
+		int irq;
+		int cpu;
+
+		irq = pci_irq_vector(pdev, ir->intr_num);
+		if (irq < 0)
+			continue;
+
+		cpu = cpumask_local_spread(i, node);
+		if (cpu < 0 || cpu >= nr_cpu_ids || !cpu_online(cpu)) {
+			irq_set_affinity_hint(irq, NULL);
+			continue;
+		}
+
+		cpumask_clear(mask);
+		cpumask_set_cpu(cpu, mask);
+		irq_set_affinity_hint(irq, mask);
+	}
+
+	free_cpumask_var(mask);
+}
+
 /* Try enabling MSI-X with MSI and legacy IRQ as fallback */
 static int xhci_try_enable_msi(struct usb_hcd *hcd)
 {
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int ret;
+	int i;
+	unsigned int request_secondary_intrs;
 
 	/*
 	 * Some Fresco Logic host controllers advertise MSI, but fail to
@@ -179,13 +234,60 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	if (ret)
 		goto free_irq_vectors;
 
+	/*
+	 * Store a stable token (intr_num + 1) as handler_data.
+	 * +1 keeps token 0 meaning "unset" so ISR can reliably default to 0.
+	 */
+	irq_set_handler_data(pci_irq_vector(pdev, 0),
+			(void *)(unsigned long)(xhci->interrupters[0]->intr_num + 1));
+
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
+		struct xhci_interrupter *ir;
+
+		ir = xhci->interrupters[i + 1];
+		ret = request_irq(pci_irq_vector(pdev, ir->intr_num),
+				xhci_msi_irq, 0, "xhci_hcd", xhci_to_hcd(xhci));
+		if (ret)
+			break;
+
+		/* Store intr_num + 1 so 0 remains reserved for "no handler_data"*/
+		irq_set_handler_data(pci_irq_vector(pdev, ir->intr_num),
+						(void *)(unsigned long)(ir->intr_num + 1));
+		xhci->secondary_irqs_enabled++;
+	}
+
+	if (i != 0 && i < request_secondary_intrs) {
+		struct xhci_interrupter *ir;
+
+		while (--i >= 0) {
+			ir = xhci->interrupters[i + 1];
+			irq_set_handler_data(pci_irq_vector(pdev, ir->intr_num), NULL);
+			free_irq(pci_irq_vector(pdev, ir->intr_num), xhci_to_hcd(xhci));
+		}
+		xhci->secondary_irqs_enabled = 0;
+	}
+
+	 /* Spread secondary MSI-X vectors */
+	xhci_msix_set_affinity_hint(xhci);
+
 	return 0;
 
 free_irq_vectors:
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "disable %s interrupt",
 		       pdev->msix_enabled ? "MSI-X" : "MSI");
+	irq_set_handler_data(pci_irq_vector(pdev, 0), NULL);
 	pci_free_irq_vectors(pdev);
 
 legacy_irq:
@@ -843,6 +945,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	bool power_lost = msg.event == PM_EVENT_RESTORE;
 	bool is_auto_resume = msg.event == PM_EVENT_AUTO_RESUME;
+	int ret;
 
 	reset_control_reset(xhci->reset);
 
@@ -873,7 +976,11 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
-	return xhci_resume(xhci, power_lost, is_auto_resume);
+	ret = xhci_resume(xhci, power_lost, is_auto_resume);
+	if (!ret)
+		xhci_msix_set_affinity_hint(xhci);
+
+	return ret;
 }
 
 static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9315ba18310d..c0deea4ccac5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -57,6 +57,7 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/dma-mapping.h>
+#include <linux/irq.h>
 #include "xhci.h"
 #include "xhci-trace.h"
 
@@ -3169,14 +3170,8 @@ void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
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
 
@@ -3188,7 +3183,11 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
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
@@ -3204,25 +3203,58 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
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
+	unsigned int intr_num;
+	unsigned long token;
+
+	/* token 0 means "unset", default to primary interrupter (0). */
+	token = (unsigned long)irq_get_handler_data(irq);
+	if (token)
+		intr_num = (unsigned int)(token - 1);
+	else
+		intr_num = 0;
+
+	/* Map token to the current interrupter instance. */
+	ir = NULL;
+	if (intr_num < xhci->max_interrupters)
+		ir = xhci->interrupters[intr_num];
+	if (!ir)
+		ir = xhci->interrupters[0];
+
+	return xhci_irq_ir(xhci, ir);
 }
 EXPORT_SYMBOL_GPL(xhci_msi_irq);
 
@@ -3624,6 +3656,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	int sent_len, ret;
 	u32 field, length_field, remainder;
 	u64 addr, send_addr;
+	struct xhci_interrupter *ir;
 
 	ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ring)
@@ -3664,6 +3697,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_trb = &ring->enqueue->generic;
 	start_cycle = ring->cycle_state;
 	send_addr = addr;
+	ir = xhci->devs[slot_id]->interrupter;
 
 	/* Queue the TRBs, even if they are zero-length */
 	for (enqd_len = 0; first_trb || enqd_len < full_len;
@@ -3724,7 +3758,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 		length_field = TRB_LEN(trb_buff_len) |
 			TRB_TD_SIZE(remainder) |
-			TRB_INTR_TARGET(0);
+			TRB_INTR_TARGET(ir->intr_num);
 
 		queue_trb(xhci, ring, more_trbs_coming | need_zero_pkt,
 				lower_32_bits(send_addr),
@@ -3756,7 +3790,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		urb_priv->td[1].end_trb = ring->enqueue;
 		urb_priv->td[1].end_seg = ring->enq_seg;
 		field = TRB_TYPE(TRB_NORMAL) | ring->cycle_state | TRB_IOC;
-		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(0), field);
+		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(ir->intr_num), field);
 	}
 
 	check_trb_math(urb, enqd_len);
@@ -3778,6 +3812,9 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	u32 field;
 	struct urb_priv *urb_priv;
 	struct xhci_td *td;
+	struct xhci_interrupter *ir;
+
+	ir = xhci->devs[slot_id]->interrupter;
 
 	ep_ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ep_ring)
@@ -3800,7 +3837,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (last_trb_on_seg(ep_ring->enq_seg, ep_ring->enqueue + 1)) {
 			field = TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state;
 			queue_trb(xhci, ep_ring, false, 0, 0,
-					TRB_INTR_TARGET(0), field);
+					TRB_INTR_TARGET(ir->intr_num), field);
 		}
 	}
 
@@ -3851,7 +3888,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, true,
 		  setup->bRequestType | setup->bRequest << 8 | le16_to_cpu(setup->wValue) << 16,
 		  le16_to_cpu(setup->wIndex) | le16_to_cpu(setup->wLength) << 16,
-		  TRB_LEN(8) | TRB_INTR_TARGET(0),
+		  TRB_LEN(8) | TRB_INTR_TARGET(ir->intr_num),
 		  /* Immediate data in pointer */
 		  field);
 
@@ -3881,7 +3918,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				urb, 1);
 		length_field = TRB_LEN(urb->transfer_buffer_length) |
 				TRB_TD_SIZE(remainder) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);
 		if (setup->bRequestType & USB_DIR_IN)
 			field |= TRB_DIR_IN;
 		queue_trb(xhci, ep_ring, true,
@@ -3904,7 +3941,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, false,
 			0,
 			0,
-			TRB_INTR_TARGET(0),
+			TRB_INTR_TARGET(ir->intr_num),
 			/* Event on completion */
 			field | TRB_IOC | TRB_TYPE(TRB_STATUS) | ep_ring->cycle_state);
 
@@ -4094,7 +4131,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
-	ir = xhci->interrupters[0];
+	ir = xhci->devs[slot_id]->interrupter;
 
 	num_tds = urb->number_of_packets;
 	if (num_tds < 1) {
@@ -4195,7 +4232,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 						   urb, more_trbs_coming);
 
 			length_field = TRB_LEN(trb_buff_len) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);
 
 			/* xhci 1.1 with ETE uses TD Size field for TBC */
 			if (first_trb && xep->use_extended_tbc)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 02c9bfe21ae2..e5532415e601 100644
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
@@ -4112,6 +4133,8 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	virt_dev->udev = NULL;
 	xhci_disable_slot(xhci, udev->slot_id);
 
+	virt_dev->interrupter = NULL;
+
 	spin_lock_irqsave(&xhci->lock, flags);
 	xhci_free_virt_device(xhci, virt_dev, udev->slot_id);
 	spin_unlock_irqrestore(&xhci->lock, flags);
@@ -4207,6 +4230,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	unsigned long flags;
 	int ret, slot_id;
 	struct xhci_command *command;
+	unsigned int intr_num;
 
 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
@@ -4263,6 +4287,18 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 
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
index 2b0796f6d00e..85c481f3935f 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -45,6 +45,9 @@
  */
 #define MAX_HC_INTRS		128
 
+/* Software cap on secondary interrupters to create; not a hardware limit. */
+#define MAX_SECONDARY_INTRNUM   4
+
 /*
  * xHCI register interface.
  * This corresponds to the eXtensible Host Controller Interface (xHCI)
@@ -764,6 +767,12 @@ struct xhci_virt_device {
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
@@ -1533,6 +1542,10 @@ struct xhci_hcd {
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
 	struct xhci_interrupter **interrupters;
+	/* number of secondary interrupters successfully created */
+	unsigned int            secondary_irqs_alloc;
+	/* number of secondary interrupters successfully in use */
+	unsigned int            secondary_irqs_enabled;
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
 #define CMD_RING_STATE_RUNNING         (1 << 0)
-- 
2.50.1


