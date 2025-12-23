Return-Path: <linux-usb+bounces-31700-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A128DCD8CEC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 11:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 005DF300E803
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 10:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EF235C1A6;
	Tue, 23 Dec 2025 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SlYzvMsg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D328F35C1A5
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 10:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766485218; cv=none; b=HHnJh12bjruByWn8+UNbUb4OvTvrp1jAPwypcMjNish/yEoy74ExLvclvfpoemBrawpkcV6WYrnJi9CqyPQm5OYW5ZbHs2SabPmmIJ3GG2BmxjiCJiyL5mtMWVfvNKkFEKaRoPZ5V7RFJHuELszHBEmzYPF5YVfhxKyc1CimNyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766485218; c=relaxed/simple;
	bh=cUI9LxLtGU6Uj/+Gj+PEaG6rvr1105/JhmVpp+V72AE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J6/vZdRJW307+C/hvkMsw/aFHna+Mig1DmKaTnQh8yVCjjUPDxIdwKC5YhM0LbpnJOkGWD+YbiqX/bup/w7CtjlCC3MzxjWhNQvyBUtllBHeEccaAGZDNz3Y/AA68p5M+LSrEKQLw9/rlcG9PyMdNAIqskDd9g0SkEyEmdlu3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SlYzvMsg; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1766485189;
	bh=vMloboWgDEShwezhYYUn1JJW29+QaReINPBsrXuZRM4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SlYzvMsgIfqYSJf6SeQ3G0IXbIZk/cYswewyUUblc4bXhq2iS9queq4VhJp4d3Y3R
	 Q0Ix8TJHuDWOFlxnlP6corY1n4+xOmwmLzHV1sRCteRgz11hwrveVD17m2oWX1mYns
	 AiTfhdqJRW+bCHGU9G8bibCv5Ax2iAhpuT+fsxL4=
X-QQ-mid: zesmtpip3t1766485177t47f8b03e
X-QQ-Originating-IP: xQRjXpy8L7e2RLPJLiwHhUsZRMMmnGWpJSWxWPzNRYI=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 18:19:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7669759261712646360
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
Subject: [PATCH V4] usb:xhci:route device to secondary interrupters
Date: Tue, 23 Dec 2025 18:19:29 +0800
Message-ID: <B857856CEAB5DF94+20251223101929.202681-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: Ndkv+8NG1EmIQSofyZ9g/qXhcme6loAud1XD2tEXpzAbCwr0IOqup1Dn
	yZGuyqFBux9xYwtvLdq2fJOEIY/rcZQxMrlHvlIYLkEF32BdxxqbsIHhb1j/IJEEgb3qXMZ
	S4opdCg2EkOmIEJHtsy5U3p/Eb/UpZN4QRkrZD7k24foomSsZdZ4zSi/uPsPjrar5OAYLoi
	mS/OH9e/BOcsZUz0ogwlTwirCFYxxvvcAsRTOvaejAn2ck0LZWyEckPfZCxybY4yvBxQTLm
	4zD2wrbYU7TaDcj/EzdZ7VXqOM6NLfNhhmxk1HSef885cuHklDuDU5XLuCzRF07JXyZijMh
	wNpYJwgQV3sFE8mrGaBpQmGiKmrSHDseAUqTcqHzLwBioXYzqRRWQzDAb6xW3rGDcMEWZOu
	hnsl+RdfX0mhB7wa+6tRaJnitlfK3gl43m7c1yD1KKGMsR7T8pWB/FMkeDtgglalcseUa9/
	x/ompxRQNyiIB5M0rZ1nCTa+2OhIooLulWNPUoBVYBR3Gu4X2dX3DldTY8H70oGgn722fV0
	pdORm1ipP0f+sjPtzP5laXrmy8iyqxZde7hPPG35jR1vXc7mAKrUXldgafozEewjJ/9hQTT
	ZBr/h6P+HMjwhYZ6ZxPOsv/zZGRFHKYznLLwhv+H5jBPJogm9tUaWrGfMbaOHJ4cACrrHoG
	IZ9K/LpGZzcC8c6OnPzzVIxVwilV/kC7wZ3GO5Gt83j46yoXD+p5fVHOqjlNNIma0ozFGDV
	AIpRbYYolRIWaq0GDQw4g7TEsKgRx9X3o6D1sI1k7KVNncAaUb7eJK1T+fyh+hrb64mib0r
	MwDtlAXuDyy1Mw+AlPxbRNzeoOAGP5f4VoBWQmqJBVkVRYVGmT1pmnSRLbL3ye2HfGye0sY
	vjlbJ0vi/BMCrZhG2TuUDBe94AV389PCQHuQt9I4Pn58F45tyY+8z+AoO1/z4DekFVl9F6/
	KLUfzXlvcW48R9fISklmVhFKklkdfwS1uqlAmhx3AOLNxMU1T9j+mz+6f+4qS0LUxwinG9v
	C2EQ2SspesBbFbWrML2wqtW/YVcmzaMZx0pcJ72pQAvywdW4NnUPGjAlC+cDYD1yyyN5fPQ
	KR+Ft7gpL3Vsxnrjf2AL9tJvTBcEhwNsw==
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
---
 drivers/usb/host/xhci-mem.c  |  28 +++++++++
 drivers/usb/host/xhci-pci.c  | 107 ++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-ring.c |  87 ++++++++++++++++++++--------
 drivers/usb/host/xhci.c      |  36 ++++++++++++
 drivers/usb/host/xhci.h      |  13 +++++
 5 files changed, 245 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c4a6544aa107..c18d29213398 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2412,6 +2412,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
+	unsigned int	i;
+	unsigned int    secondary_intr_num;
 
 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2505,6 +2507,32 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
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
+		secondary_intr_num = min(xhci->max_interrupters - 1, MAX_SECONDARY_INTRNUM);
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
index f67a4d956204..5802f510a9ce 100644
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
@@ -179,13 +234,58 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
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
+		request_secondary_intrs = min(xhci->nvecs - 1, xhci->secondary_irqs_alloc);
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
@@ -843,6 +943,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	bool power_lost = msg.event == PM_EVENT_RESTORE;
 	bool is_auto_resume = msg.event == PM_EVENT_AUTO_RESUME;
+	int ret;
 
 	reset_control_reset(xhci->reset);
 
@@ -873,7 +974,11 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
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
index 6309200e93dc..ee352447ece4 100644
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
@@ -3222,25 +3221,58 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
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
 
@@ -3642,6 +3674,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	int sent_len, ret;
 	u32 field, length_field, remainder;
 	u64 addr, send_addr;
+	struct xhci_interrupter *ir;
 
 	ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ring)
@@ -3682,6 +3715,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_trb = &ring->enqueue->generic;
 	start_cycle = ring->cycle_state;
 	send_addr = addr;
+	ir = xhci->devs[slot_id]->interrupter;
 
 	/* Queue the TRBs, even if they are zero-length */
 	for (enqd_len = 0; first_trb || enqd_len < full_len;
@@ -3742,7 +3776,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 		length_field = TRB_LEN(trb_buff_len) |
 			TRB_TD_SIZE(remainder) |
-			TRB_INTR_TARGET(0);
+			TRB_INTR_TARGET(ir->intr_num);
 
 		queue_trb(xhci, ring, more_trbs_coming | need_zero_pkt,
 				lower_32_bits(send_addr),
@@ -3774,7 +3808,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		urb_priv->td[1].end_trb = ring->enqueue;
 		urb_priv->td[1].end_seg = ring->enq_seg;
 		field = TRB_TYPE(TRB_NORMAL) | ring->cycle_state | TRB_IOC;
-		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(0), field);
+		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(ir->intr_num), field);
 	}
 
 	check_trb_math(urb, enqd_len);
@@ -3796,6 +3830,9 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	u32 field;
 	struct urb_priv *urb_priv;
 	struct xhci_td *td;
+	struct xhci_interrupter *ir;
+
+	ir = xhci->devs[slot_id]->interrupter;
 
 	ep_ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ep_ring)
@@ -3818,7 +3855,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (last_trb_on_seg(ep_ring->enq_seg, ep_ring->enqueue + 1)) {
 			field = TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state;
 			queue_trb(xhci, ep_ring, false, 0, 0,
-					TRB_INTR_TARGET(0), field);
+					TRB_INTR_TARGET(ir->intr_num), field);
 		}
 	}
 
@@ -3869,7 +3906,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, true,
 		  setup->bRequestType | setup->bRequest << 8 | le16_to_cpu(setup->wValue) << 16,
 		  le16_to_cpu(setup->wIndex) | le16_to_cpu(setup->wLength) << 16,
-		  TRB_LEN(8) | TRB_INTR_TARGET(0),
+		  TRB_LEN(8) | TRB_INTR_TARGET(ir->intr_num),
 		  /* Immediate data in pointer */
 		  field);
 
@@ -3899,7 +3936,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				urb, 1);
 		length_field = TRB_LEN(urb->transfer_buffer_length) |
 				TRB_TD_SIZE(remainder) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);
 		if (setup->bRequestType & USB_DIR_IN)
 			field |= TRB_DIR_IN;
 		queue_trb(xhci, ep_ring, true,
@@ -3922,7 +3959,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, false,
 			0,
 			0,
-			TRB_INTR_TARGET(0),
+			TRB_INTR_TARGET(ir->intr_num),
 			/* Event on completion */
 			field | TRB_IOC | TRB_TYPE(TRB_STATUS) | ep_ring->cycle_state);
 
@@ -4112,7 +4149,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 
 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
-	ir = xhci->interrupters[0];
+	ir = xhci->devs[slot_id]->interrupter;
 
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
index 742c23826e17..d7955eaa50a0 100644
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
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+		if (xhci->interrupters[i + 1])
+			xhci_enable_interrupter(xhci->interrupters[i + 1]);
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
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+		if (xhci->interrupters[i + 1])
+			xhci_disable_interrupter(xhci, xhci->interrupters[i + 1]);
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
+		for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+			if (xhci->interrupters[i + 1])
+				xhci_disable_interrupter(xhci, xhci->interrupters[i + 1]);
+		}
+
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
 		xhci_debugfs_exit(xhci);
@@ -4090,6 +4111,8 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	virt_dev->udev = NULL;
 	xhci_disable_slot(xhci, udev->slot_id);
 
+	virt_dev->interrupter = NULL;
+
 	spin_lock_irqsave(&xhci->lock, flags);
 	xhci_free_virt_device(xhci, virt_dev, udev->slot_id);
 	spin_unlock_irqrestore(&xhci->lock, flags);
@@ -4185,6 +4208,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	unsigned long flags;
 	int ret, slot_id;
 	struct xhci_command *command;
+	unsigned int intr_num;
 
 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
@@ -4242,6 +4266,18 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 
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
index 85d5b964bf1e..4941b43b9b1d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -37,6 +37,9 @@
 /* Section 5.3.3 - MaxPorts */
 #define MAX_HC_PORTS		127
 
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


