Return-Path: <linux-usb+bounces-32378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EA6D231DF
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 09:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32D36304171D
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 08:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0337F328B44;
	Thu, 15 Jan 2026 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="MmeRpm2g"
X-Original-To: linux-usb@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3673321D8
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 08:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465643; cv=none; b=XvMbOjEBgT+9ref72lDayhpRG8fxBTHUFM3GN0jbzMzn/K9KS2buhhrx4fmYjCmqshQ3BXdmMNCzVqFX3DBaFSWZl55eYOsyuhQKbh7ytFu8+78vFZsH+E3BtFC7BbwUTB/8k95Rk2NEoI2LjT7K4gz4zTaeKuHnLyeDDz6jnMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465643; c=relaxed/simple;
	bh=REkQhSIvmmaLitvptMFR/MPLBDKOjjlaS+PeNGw2TOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHFGQyN8xeXhoOCfz1yKQ5TsQV9ztycleHUhDu7QtxrSPYsWFw8zIctddd+SXVeKJYoy7e0aYbCccyd9UsQ541o04hrZtLN4PsT52IPhoFId1ebY0qQQLenxhfmc6eSOdZLqyWWHGLfsDmfyv6Jl3lHQZ6M9067X9fr8r7ELqu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=MmeRpm2g; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768465579;
	bh=FQM/2F4zH/fJTPkwsC80PaDX3awJwTaSCbhXFuvuJH8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MmeRpm2g4iBFwmQ16nRKNS/hEOy6X3MTGekJYgbYdrm31RaSAyRaT3UmjyHs40HJg
	 WO7t5xrmj7AvJMxMRYJWd3buxXN5bUfLScetyGjTyTMIlqpDTeZge8+8JACPJbTSah
	 8UyqdWGjv6S5x12m7MPUUibaaKclQCJ3xm91QIv0=
X-QQ-mid: zesmtpip3t1768465573t7a912989
X-QQ-Originating-IP: 72vVWhTwa4kTaHs7NIiJO0YZ4tp36lqR+K9NOclh7Vc=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 15 Jan 2026 16:26:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18336105608505155775
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
Subject: [PATCH v7] usb:xhci:route device to secondary interrupters
Date: Thu, 15 Jan 2026 16:26:08 +0800
Message-ID: <097C424DFD34E837+20260115082608.743707-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: N0yntFC9EIUMIsGqUategfMeOl768M2ctzvRek+ukMIl+vpYRtxpBe08
	lqOhgmWrlR2u81smSBvdv7xpotQFJKnOegsbiKmvSgShyITLdhrPlSJb2lk1xNu/pEu2oFy
	SU6YS+OxhXKB+MMvxxiFUFFloVaEC9e635X3x+47P9y4H2jKZEPM2o/RBJf67+kHmR6Kcqv
	x8DVg/DT0Gwg/M8vSNgYMMsLTlRm4iSFoSWXdQfO8XLpjQ/bl4c7ghohahWwlifpIOJ1pvY
	FpQoW8yVT8Kg2WCS5MTJI/fhW470gbYfuucaR+rb1wYbW2Ez7VDZvVQMcm2NmWXaj05rU32
	OATeZ5l3Y+y9y+CsHE6BIHhZERuUfl7sLjwGoJSGSX2hlmRDPTa2dFRzVuTUHn8W9yKDSLr
	DDVUTLT+g2PGNJQ8OuZcmCZHsRFOIoTwu+uqFJbjreLetYAgdAHsorZvlwol0Mg9e/qgT6y
	BtXS/pAMQK02gVnmJQSovQPD/8V1DZnoDFiyCMU0zzsw0H08G+hahPEU1Pr9J6C6S7TeikG
	5ynsADrkM8yYlygUDYI2ALq+LefbvaIvmXBNtHvX5XtmVbHCMK2tj52blnIHhwp8sh44i4d
	jGBpNWwC7BV4MmzpED3f0H5MPwir8iAQiYeF6jqLg+3vAlfpaf9yEUHjOsHG+eKV/NKe8gt
	tJNVCUdlvRX2hYUWQUDB5N20Lg8lX4qlSu03bVykc4/RcKVRC8v0ANyydOG22A0SVl+dspv
	djeWYzfS/9RYKATeuRQoX6GG6uC4hoXdikG+VOSTQy5vQrJSdrveJXmaEvehtRl4m/Mz7fG
	QHUXep/SDF8nr5Mphl0dDSnjn8EHlhE9M29nhOyEvoM4udHG37TEjcHGEvDTaCwEjTImC8j
	1Qkj72CuxIl4X5EfTU74hO/nffuX1kiRu8co+mW45fZEydldyGwCmnSFx8+CEImk1VDyC0C
	1xS0n4HF5exReRu/DHb8F7AeX6Hgp7mRwDDajhXqETmiD4uYn/A7W0q+0kbXPJdlEGgZ2p4
	Icv53+Vu2tbKHi4dVYUgBuqjbgZPrAKB+VSzQb5w5zMXFlBrGPzqjTYY5dPHTmiMSTb6hDv
	XdhydLZ3WEVtAnGLH+5ySdAZaebuzVYxlrDL7S6nLyt3822Dxm7dG8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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
Store the struct xhci_interrupter pointer in irq handler_data.
Map vectors by index (0..N) to xhci->interrupters[].
Keep STS_EINT handling restricted to interrupter 0.
Spread MSI-X vectors with irq_set_affinity() and re-apply on resume.

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
---
 drivers/usb/host/xhci-mem.c  |  39 ++++++++++++
 drivers/usb/host/xhci-pci.c  | 120 ++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-pci.h  |   5 ++
 drivers/usb/host/xhci-ring.c |  77 ++++++++++++++--------
 drivers/usb/host/xhci.c      |  64 +++++++++++++++++++
 drivers/usb/host/xhci.h      |  20 ++++++
 6 files changed, 298 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c708bdd69f16..ce317a9ce96e 100644
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
index 585b2f3117b0..f932e28e6027 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/reset.h>
 #include <linux/suspend.h>
+#include <linux/irq.h>

 #include "xhci.h"
 #include "xhci-trace.h"
@@ -130,21 +131,101 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
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
+	for (i = 0; i < ARRAY_SIZE(xhci->irq_affinity_hint); i++)
+		xhci->irq_affinity_hint[i] = NULL;
+
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }

+/* Set IRQ affinity hints for MSI/MSI-X vectors.*/
+static void xhci_msix_set_affinity(struct xhci_hcd *xhci)
+{
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
+	struct pci_dev *pdev;
+	int node, vec, irq, cpu;
+	const struct cpumask *mask;
+
+	/* Nothing to do without MSI/MSI-X or without secondary vectors. */
+	if (!hcd->msi_enabled || !xhci->secondary_irqs_enabled)
+		return;
+
+	pdev = to_pci_dev(hcd->self.controller);
+	node = dev_to_node(&pdev->dev);
+
+	/* Include vec0 (primary) and vec[1..secondary_irqs_enabled]. */
+	for (vec = 0; vec <= xhci->secondary_irqs_enabled; vec++) {
+		irq = pci_irq_vector(pdev, vec);
+		if (irq < 0)
+			continue;
+
+		cpu = cpumask_local_spread(vec, node);
+		if (cpu < 0 || cpu >= nr_cpu_ids || !cpu_online(cpu)) {
+			irq_set_affinity_hint(irq, NULL);
+			xhci->irq_affinity_hint[vec] = NULL;
+			continue;
+		}
+
+		mask = cpumask_of(cpu);
+		xhci->irq_affinity_hint[vec] = mask;
+		irq_set_affinity_hint(irq, mask);
+	}
+}
+
+/* Bind MSI/MSI-X vectors to interrupters via irq handler_data. */
+void xhci_msix_set_handler_data(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct device *dev = hcd->self.controller;
+	struct pci_dev *pdev;
+	int i, irq;
+
+	if (!hcd->msi_enabled || !xhci->interrupters || !dev_is_pci(dev))
+		return;
+
+	pdev = to_pci_dev(hcd->self.controller);
+
+	/* Primary */
+	irq = pci_irq_vector(pdev, 0);
+	if (irq >= 0)
+		irq_set_handler_data(irq, xhci->interrupters[0]);
+
+	/* Secondary: bind by vector index (i + 1) */
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+		struct xhci_interrupter *ir = xhci->interrupters[i + 1];
+
+		if (!ir)
+			continue;
+		irq = pci_irq_vector(pdev, i + 1);
+		if (irq >= 0)
+			irq_set_handler_data(irq, ir);
+	}
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
@@ -181,6 +262,38 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)

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
+		ret = request_irq(pci_irq_vector(pdev, i + 1),
+				xhci_msi_irq, 0, "xhci_hcd", xhci_to_hcd(xhci));
+		if (ret)
+			break;
+
+		xhci->secondary_irqs_enabled++;
+	}
+
+	if (i != 0 && i < request_secondary_intrs) {
+		while (--i >= 0)
+			free_irq(pci_irq_vector(pdev, i + 1), xhci_to_hcd(xhci));
+
+		xhci->secondary_irqs_enabled = 0;
+	}
+
+	/* Spread secondary MSI-X vectors */
+	xhci_msix_set_affinity(xhci);
+
+	/* Ensure irq handler_data is set before enabling interrupters. */
+	xhci_msix_set_handler_data(hcd);
+
 	return 0;

 free_irq_vectors:
@@ -843,6 +956,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 	bool power_lost = msg.event == PM_EVENT_RESTORE;
 	bool is_auto_resume = msg.event == PM_EVENT_AUTO_RESUME;
+	int ret;

 	reset_control_reset(xhci->reset);

@@ -873,7 +987,11 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);

-	return xhci_resume(xhci, power_lost, is_auto_resume);
+	ret = xhci_resume(xhci, power_lost, is_auto_resume);
+	if (!ret)
+		xhci_msix_set_affinity(xhci);
+
+	return ret;
 }

 static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
index e87c7d9d76b8..c1fbd33dc250 100644
--- a/drivers/usb/host/xhci-pci.h
+++ b/drivers/usb/host/xhci-pci.h
@@ -6,5 +6,10 @@

 int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id);
 void xhci_pci_remove(struct pci_dev *dev);
+#if IS_REACHABLE(CONFIG_USB_XHCI_PCI)
+void xhci_msix_set_handler_data(struct usb_hcd *hcd);
+#else
+static inline void xhci_msix_set_handler_data(struct usb_hcd *hcd) { }
+#endif

 #endif
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9315ba18310d..3635a878d71d 100644
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
+	 * Secondary vectors may interrupt without STS_EINT set.
+	 */
+	if (ir->intr_num == 0 && !(status & STS_EINT)) {
 		ret = IRQ_NONE;
 		goto out;
 	}
@@ -3204,25 +3203,46 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
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

@@ -3624,6 +3644,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	int sent_len, ret;
 	u32 field, length_field, remainder;
 	u64 addr, send_addr;
+	struct xhci_interrupter *ir;

 	ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ring)
@@ -3664,6 +3685,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_trb = &ring->enqueue->generic;
 	start_cycle = ring->cycle_state;
 	send_addr = addr;
+	ir = xhci->devs[slot_id]->interrupter;

 	/* Queue the TRBs, even if they are zero-length */
 	for (enqd_len = 0; first_trb || enqd_len < full_len;
@@ -3724,7 +3746,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,

 		length_field = TRB_LEN(trb_buff_len) |
 			TRB_TD_SIZE(remainder) |
-			TRB_INTR_TARGET(0);
+			TRB_INTR_TARGET(ir->intr_num);

 		queue_trb(xhci, ring, more_trbs_coming | need_zero_pkt,
 				lower_32_bits(send_addr),
@@ -3756,7 +3778,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		urb_priv->td[1].end_trb = ring->enqueue;
 		urb_priv->td[1].end_seg = ring->enq_seg;
 		field = TRB_TYPE(TRB_NORMAL) | ring->cycle_state | TRB_IOC;
-		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(0), field);
+		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(ir->intr_num), field);
 	}

 	check_trb_math(urb, enqd_len);
@@ -3778,6 +3800,9 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	u32 field;
 	struct urb_priv *urb_priv;
 	struct xhci_td *td;
+	struct xhci_interrupter *ir;
+
+	ir = xhci->devs[slot_id]->interrupter;

 	ep_ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ep_ring)
@@ -3800,7 +3825,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (last_trb_on_seg(ep_ring->enq_seg, ep_ring->enqueue + 1)) {
 			field = TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state;
 			queue_trb(xhci, ep_ring, false, 0, 0,
-					TRB_INTR_TARGET(0), field);
+					TRB_INTR_TARGET(ir->intr_num), field);
 		}
 	}

@@ -3851,7 +3876,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, true,
 		  setup->bRequestType | setup->bRequest << 8 | le16_to_cpu(setup->wValue) << 16,
 		  le16_to_cpu(setup->wIndex) | le16_to_cpu(setup->wLength) << 16,
-		  TRB_LEN(8) | TRB_INTR_TARGET(0),
+		  TRB_LEN(8) | TRB_INTR_TARGET(ir->intr_num),
 		  /* Immediate data in pointer */
 		  field);

@@ -3881,7 +3906,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				urb, 1);
 		length_field = TRB_LEN(urb->transfer_buffer_length) |
 				TRB_TD_SIZE(remainder) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);
 		if (setup->bRequestType & USB_DIR_IN)
 			field |= TRB_DIR_IN;
 		queue_trb(xhci, ep_ring, true,
@@ -3904,7 +3929,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, false,
 			0,
 			0,
-			TRB_INTR_TARGET(0),
+			TRB_INTR_TARGET(ir->intr_num),
 			/* Event on completion */
 			field | TRB_IOC | TRB_TYPE(TRB_STATUS) | ep_ring->cycle_state);

@@ -4094,7 +4119,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,

 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
-	ir = xhci->interrupters[0];
+	ir = xhci->devs[slot_id]->interrupter;

 	num_tds = urb->number_of_packets;
 	if (num_tds < 1) {
@@ -4195,7 +4220,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 						   urb, more_trbs_coming);

 			length_field = TRB_LEN(trb_buff_len) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);

 			/* xhci 1.1 with ETE uses TD Size field for TBC */
 			if (first_trb && xep->use_extended_tbc)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 02c9bfe21ae2..3d99eadeac4c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -23,6 +23,7 @@
 #include <linux/usb/xhci-sideband.h>

 #include "xhci.h"
+#include "xhci-pci.h"
 #include "xhci-trace.h"
 #include "xhci-debugfs.h"
 #include "xhci-dbgcap.h"
@@ -346,6 +347,29 @@ int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 	return 0;
 }

+static int xhci_quiesce_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
+{
+	u32 iman;
+	u64 erdp;
+
+	if (!ir || !ir->ir_set)
+		return -EINVAL;
+
+	xhci_disable_interrupter(xhci, ir);
+
+	if (!ir->ip_autoclear) {
+		iman = readl(&ir->ir_set->iman);
+		iman |= IMAN_IP;
+		writel(iman, &ir->ir_set->iman);
+		readl(&ir->ir_set->iman);
+	}
+
+	erdp = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+	xhci_write_64(xhci, erdp | ERST_EHB, &ir->ir_set->erst_dequeue);
+
+	return 0;
+}
+
 /* interrupt moderation interval imod_interval in nanoseconds */
 int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 				    u32 imod_interval)
@@ -597,6 +621,11 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 	struct xhci_interrupter *ir = xhci->interrupters[0];
 	unsigned long	flags;
 	u32		temp;
+	int		i;
+	struct usb_hcd  *hcd = xhci_to_hcd(xhci);
+
+	/* Ensure handler_data is set for secondary MSI/MSI-X vectors. */
+	xhci_msix_set_handler_data(hcd);

 	/*
 	 * Enable interrupts before starting the host (xhci 4.2 and 5.5.2).
@@ -612,6 +641,12 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
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
@@ -708,6 +743,7 @@ void xhci_stop(struct usb_hcd *hcd)
 	u32 temp;
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir = xhci->interrupters[0];
+	int i;

 	mutex_lock(&xhci->mutex);

@@ -744,6 +780,12 @@ void xhci_stop(struct usb_hcd *hcd)
 	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
 	xhci_disable_interrupter(xhci, ir);

+	/* Disable secondary interrupters */
+	for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+		if (xhci->interrupters[i + 1])
+			xhci_quiesce_interrupter(xhci, (xhci->interrupters[i + 1]));
+	}
+
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
 	xhci_mem_cleanup(xhci);
 	xhci_debugfs_exit(xhci);
@@ -1087,6 +1129,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
+	int			i;

 	if (!hcd->state)
 		return 0;
@@ -1182,6 +1225,12 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
 		xhci_disable_interrupter(xhci, xhci->interrupters[0]);

+		/* Disable secondary interrupters as well */
+		for (i = 0; i < xhci->secondary_irqs_enabled; i++) {
+			if (xhci->interrupters[i + 1])
+				xhci_quiesce_interrupter(xhci, (xhci->interrupters[i + 1]));
+		}
+
 		xhci_dbg(xhci, "cleaning up memory\n");
 		xhci_mem_cleanup(xhci);
 		xhci_debugfs_exit(xhci);
@@ -4112,6 +4161,8 @@ static void xhci_free_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	virt_dev->udev = NULL;
 	xhci_disable_slot(xhci, udev->slot_id);

+	virt_dev->interrupter = NULL;
+
 	spin_lock_irqsave(&xhci->lock, flags);
 	xhci_free_virt_device(xhci, virt_dev, udev->slot_id);
 	spin_unlock_irqrestore(&xhci->lock, flags);
@@ -4207,6 +4258,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	unsigned long flags;
 	int ret, slot_id;
 	struct xhci_command *command;
+	unsigned int intr_num;

 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
@@ -4263,6 +4315,18 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)

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
index 2b0796f6d00e..abbbfbc38966 100644
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
@@ -1533,6 +1547,12 @@ struct xhci_hcd {
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
 	struct xhci_interrupter **interrupters;
+	/* number of secondary interrupters successfully created */
+	unsigned int            secondary_irqs_alloc;
+	/* number of secondary interrupters successfully in use */
+	unsigned int            secondary_irqs_enabled;
+	/* Affinity hints for vector 0..MAX_SECONDARY_INTRNUM. */
+	const struct cpumask	*irq_affinity_hint[MAX_SECONDARY_INTRNUM + 1];
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
 #define CMD_RING_STATE_RUNNING         (1 << 0)
--
2.50.1


