Return-Path: <linux-usb+bounces-36648-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLJfEJEB8WnubgEAu9opvQ
	(envelope-from <linux-usb+bounces-36648-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 20:50:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F348ADAE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 20:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80C3030C52A8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 18:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582A246AF20;
	Tue, 28 Apr 2026 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkVnSa8K"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE0C24501D;
	Tue, 28 Apr 2026 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402194; cv=none; b=IOmtqaLP215m0WTgURMK6Jw8SuEHpwOg8sijL72lw4dYdz1AqJ8AT3nLYQ1D10WySSjnEYvWSDvo+d39w9KedY0UiATVe/Q9zQg6D8gtkVnsZ2xggpZH1KhbmhXY0Zq1IT3kSaxT1EpjoYJxmmn+araYtMjquXmU1VYwnjOQrlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402194; c=relaxed/simple;
	bh=48aDYLVa3ZSeozticenXIgfoOgm5KtRLiPHgZr+fDuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jD9YC+6vJNJUPNbD1juP8OGhHYaixdF6+N/EjQig8Ro0gSLv8IlkxUOO82Z5vlX8ChgXOmFQCAq72qmhFML9DyXgUaSVEMfbb4VpMKw2D9yjWgFVwZKzEj4MgRkBurx1X6TUPwPsfq3QACKpR1j+zDyIW2Gys2hw9sQFuBxqv3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkVnSa8K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1834C2BCB7;
	Tue, 28 Apr 2026 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777402194;
	bh=48aDYLVa3ZSeozticenXIgfoOgm5KtRLiPHgZr+fDuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VkVnSa8K0Yc+LAL42cKldxd2jNwCeA1PWU56nYDhNhUWbfaQXXgECFcoqsgfJAe+4
	 XubohMPw8LdizAvdzgUxgqSTppNHxy4RPJc7wh7jMgZUc3LldFOSzo9DZGx9YnCSzn
	 TfKh6BGTO4Z4H0wvEZcVcv6Up/RCzXHUPn4PVpmGCJW9FTKneWFuiXw6aeXW50FQ8w
	 aD02dFKH7VwE2uiAiGiEKkMCmy7kS1+lVYKJGoRhps7vCCkhYXUakDNdaLMim+73TN
	 1WNlbWGmLMdsnwrJ4lUxaNIuWoVQQiRAy75KNOWUX6EmwRlKo5Uyu6ur5naxqQZxAc
	 7fEB3ObKyRD6A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 28 Apr 2026 20:49:45 +0200
Subject: [PATCH v2 2/4] thunderbolt: Separate out common NHI bits
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-usb4_nonpcie_prepwork-v2-2-452fb9d63f77@oss.qualcomm.com>
References: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
In-Reply-To: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777402187; l=48562;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=uLubzulb/LXLvan1pH3eQZ9gD7+0wgSocfwGTRhpNXs=;
 b=byaoBETlxo8RbDFq5eB8diLqjua5hhvyqPoNu37rdAqSr+2HLZXmucfXa93KenAF1aKTr8h0j
 5T9si/YlsrfCW4xkQ7qeinurVPy3KWZX/4UOovVMQp5uDQGsFjqWgn3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 918F348ADAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36648-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add a new file encapsulating most of the PCI NHI specifics
(intentionally leaving some odd cookies behind to make the layering
simpler). Most notably, separate out nhi_probe() to make it easier to
register other types of NHIs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/Makefile  |   2 +-
 drivers/thunderbolt/nhi.c     | 527 ++++--------------------------------------
 drivers/thunderbolt/nhi.h     |  31 +++
 drivers/thunderbolt/nhi_ops.c |   9 +
 drivers/thunderbolt/pci.c     | 507 ++++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/pci.h     |  19 ++
 drivers/thunderbolt/switch.c  |  43 +---
 7 files changed, 626 insertions(+), 512 deletions(-)

diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index b44b32dcb832..eb1bfc5e5c3c 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccflags-y := -I$(src)
 obj-${CONFIG_USB4} := thunderbolt.o
-thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
+thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
 thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
 
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 2d01e698dd65..3ceca434155d 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -17,7 +17,6 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/platform_data/x86/apple.h>
 #include <linux/property.h>
 #include <linux/string_choices.h>
 #include <linux/string_helpers.h>
@@ -34,33 +33,13 @@
  * transferred.
  */
 #define RING_E2E_RESERVED_HOPID	RING_FIRST_USABLE_HOPID
-/*
- * Minimal number of vectors when we use MSI-X. Two for control channel
- * Rx/Tx and the rest four are for cross domain DMA paths.
- */
-#define MSIX_MIN_VECS		6
-#define MSIX_MAX_VECS		16
 
 #define NHI_MAILBOX_TIMEOUT	500 /* ms */
 
-/* Host interface quirks */
-#define QUIRK_AUTO_CLEAR_INT	BIT(0)
-#define QUIRK_E2E		BIT(1)
-
 static bool host_reset = true;
 module_param(host_reset, bool, 0444);
 MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
 
-struct tb_nhi_pci {
-	struct tb_nhi nhi;
-	struct ida msix_ida;
-};
-
-static inline struct tb_nhi_pci *nhi_to_pci(struct tb_nhi *nhi)
-{
-	return container_of(nhi, struct tb_nhi_pci, nhi);
-}
-
 static int ring_interrupt_index(const struct tb_ring *ring)
 {
 	int bit = ring->hop;
@@ -170,7 +149,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
  *
  * Use only during init and shutdown.
  */
-static void nhi_disable_interrupts(struct tb_nhi *nhi)
+void nhi_disable_interrupts(struct tb_nhi *nhi)
 {
 	int i = 0;
 	/* disable interrupts */
@@ -455,7 +434,7 @@ static void ring_clear_msix(const struct tb_ring *ring)
 			  4 * (ring->nhi->hop_count / 32));
 }
 
-static irqreturn_t ring_msix(int irq, void *data)
+irqreturn_t ring_msix(int irq, void *data)
 {
 	struct tb_ring *ring = data;
 
@@ -469,55 +448,6 @@ static irqreturn_t ring_msix(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int ring_request_msix(struct tb_ring *ring, bool no_suspend)
-{
-	struct tb_nhi *nhi = ring->nhi;
-	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
-	unsigned long irqflags;
-	int ret;
-
-	if (!pdev->msix_enabled)
-		return 0;
-
-	ret = ida_alloc_max(&nhi_pci->msix_ida, MSIX_MAX_VECS - 1, GFP_KERNEL);
-	if (ret < 0)
-		return ret;
-
-	ring->vector = ret;
-
-	ret = pci_irq_vector(pdev, ring->vector);
-	if (ret < 0)
-		goto err_ida_remove;
-
-	ring->irq = ret;
-
-	irqflags = no_suspend ? IRQF_NO_SUSPEND : 0;
-	ret = request_irq(ring->irq, ring_msix, irqflags, "thunderbolt", ring);
-	if (ret)
-		goto err_ida_remove;
-
-	return 0;
-
-err_ida_remove:
-	ida_free(&nhi_pci->msix_ida, ring->vector);
-
-	return ret;
-}
-
-static void ring_release_msix(struct tb_ring *ring)
-{
-	struct tb_nhi_pci *nhi_pci = nhi_to_pci(ring->nhi);
-
-	if (ring->irq <= 0)
-		return;
-
-	free_irq(ring->irq, ring);
-	ida_free(&nhi_pci->msix_ida, ring->vector);
-	ring->vector = 0;
-	ring->irq = 0;
-}
-
 static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
 {
 	unsigned int start_hop = RING_FIRST_USABLE_HOPID;
@@ -630,8 +560,10 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	if (!ring->descriptors)
 		goto err_free_ring;
 
-	if (ring_request_msix(ring, flags & RING_FLAG_NO_SUSPEND))
-		goto err_free_descs;
+	if (nhi->ops && nhi->ops->request_ring_irq) {
+		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
+			goto err_free_descs;
+	}
 
 	if (nhi_alloc_hop(nhi, ring))
 		goto err_release_msix;
@@ -639,7 +571,8 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	return ring;
 
 err_release_msix:
-	ring_release_msix(ring);
+	if (nhi->ops && nhi->ops->release_ring_irq)
+		nhi->ops->release_ring_irq(ring);
 err_free_descs:
 	dma_free_coherent(ring->nhi->dev,
 			  ring->size * sizeof(*ring->descriptors),
@@ -829,6 +762,8 @@ EXPORT_SYMBOL_GPL(tb_ring_stop);
  */
 void tb_ring_free(struct tb_ring *ring)
 {
+	struct tb_nhi *nhi = ring->nhi;
+
 	spin_lock_irq(&ring->nhi->lock);
 	/*
 	 * Dissociate the ring from the NHI. This also ensures that
@@ -845,7 +780,8 @@ void tb_ring_free(struct tb_ring *ring)
 	}
 	spin_unlock_irq(&ring->nhi->lock);
 
-	ring_release_msix(ring);
+	if (nhi->ops && nhi->ops->release_ring_irq)
+		nhi->ops->release_ring_irq(ring);
 
 	dma_free_coherent(ring->nhi->dev,
 			  ring->size * sizeof(*ring->descriptors),
@@ -926,7 +862,7 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
 	return (enum nhi_fw_mode)val;
 }
 
-static void nhi_interrupt_work(struct work_struct *work)
+void nhi_interrupt_work(struct work_struct *work)
 {
 	struct tb_nhi *nhi = container_of(work, typeof(*nhi), interrupt_work);
 	int value = 0; /* Suppress uninitialized usage warning. */
@@ -978,7 +914,7 @@ static void nhi_interrupt_work(struct work_struct *work)
 	spin_unlock_irq(&nhi->lock);
 }
 
-static irqreturn_t nhi_msi(int irq, void *data)
+irqreturn_t nhi_msi(int irq, void *data)
 {
 	struct tb_nhi *nhi = data;
 	schedule_work(&nhi->interrupt_work);
@@ -987,8 +923,7 @@ static irqreturn_t nhi_msi(int irq, void *data)
 
 static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1012,21 +947,19 @@ static int nhi_suspend_noirq(struct device *dev)
 
 static int nhi_freeze_noirq(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 
 	return tb_domain_freeze_noirq(tb);
 }
 
 static int nhi_thaw_noirq(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 
 	return tb_domain_thaw_noirq(tb);
 }
 
-static bool nhi_wake_supported(struct pci_dev *pdev)
+static bool nhi_wake_supported(struct device *dev)
 {
 	u8 val;
 
@@ -1034,7 +967,7 @@ static bool nhi_wake_supported(struct pci_dev *pdev)
 	 * If power rails are sustainable for wakeup from S4 this
 	 * property is set by the BIOS.
 	 */
-	if (!device_property_read_u8(&pdev->dev, "WAKE_SUPPORTED", &val))
+	if (!device_property_read_u8(dev, "WAKE_SUPPORTED", &val))
 		return !!val;
 
 	return true;
@@ -1042,14 +975,13 @@ static bool nhi_wake_supported(struct pci_dev *pdev)
 
 static int nhi_poweroff_noirq(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
 	bool wakeup;
 
-	wakeup = device_may_wakeup(dev) && nhi_wake_supported(pdev);
+	wakeup = device_may_wakeup(dev) && nhi_wake_supported(dev);
 	return __nhi_suspend_noirq(dev, wakeup);
 }
 
-static void nhi_enable_int_throttling(struct tb_nhi *nhi)
+void nhi_enable_int_throttling(struct tb_nhi *nhi)
 {
 	/* Throttling is specified in 256ns increments */
 	u32 throttle = DIV_ROUND_UP(128 * NSEC_PER_USEC, 256);
@@ -1067,8 +999,7 @@ static void nhi_enable_int_throttling(struct tb_nhi *nhi)
 
 static int nhi_resume_noirq(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1077,7 +1008,7 @@ static int nhi_resume_noirq(struct device *dev)
 	 * unplugged last device which causes the host controller to go
 	 * away on PCs.
 	 */
-	if (!pci_device_is_present(pdev)) {
+	if ((nhi->ops->is_present && !nhi->ops->is_present(nhi))) {
 		nhi->going_away = true;
 	} else {
 		if (nhi->ops && nhi->ops->resume_noirq) {
@@ -1093,32 +1024,29 @@ static int nhi_resume_noirq(struct device *dev)
 
 static int nhi_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 
 	return tb_domain_suspend(tb);
 }
 
 static void nhi_complete(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 
 	/*
 	 * If we were runtime suspended when system suspend started,
 	 * schedule runtime resume now. It should bring the domain back
 	 * to functional state.
 	 */
-	if (pm_runtime_suspended(&pdev->dev))
-		pm_runtime_resume(&pdev->dev);
+	if (pm_runtime_suspended(dev))
+		pm_runtime_resume(dev);
 	else
 		tb_domain_complete(tb);
 }
 
 static int nhi_runtime_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1136,8 +1064,7 @@ static int nhi_runtime_suspend(struct device *dev)
 
 static int nhi_runtime_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1151,10 +1078,8 @@ static int nhi_runtime_resume(struct device *dev)
 	return tb_domain_runtime_resume(tb);
 }
 
-static void nhi_shutdown(struct tb_nhi *nhi)
+void nhi_shutdown(struct tb_nhi *nhi)
 {
-	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
 	int i;
 
 	dev_dbg(nhi->dev, "shutdown\n");
@@ -1168,90 +1093,11 @@ static void nhi_shutdown(struct tb_nhi *nhi)
 				 "RX ring %d is still active\n", i);
 	}
 	nhi_disable_interrupts(nhi);
-	/*
-	 * We have to release the irq before calling flush_work. Otherwise an
-	 * already executing IRQ handler could call schedule_work again.
-	 */
-	if (!pdev->msix_enabled) {
-		devm_free_irq(nhi->dev, pdev->irq, nhi);
-		flush_work(&nhi->interrupt_work);
-	}
-	ida_destroy(&nhi_pci->msix_ida);
 
 	if (nhi->ops && nhi->ops->shutdown)
 		nhi->ops->shutdown(nhi);
 }
 
-static void nhi_check_quirks(struct tb_nhi_pci *nhi_pci)
-{
-	struct tb_nhi *nhi = &nhi_pci->nhi;
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
-
-	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
-		/*
-		 * Intel hardware supports auto clear of the interrupt
-		 * status register right after interrupt is being
-		 * issued.
-		 */
-		nhi->quirks |= QUIRK_AUTO_CLEAR_INT;
-
-		switch (pdev->device) {
-		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
-		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
-			/*
-			 * Falcon Ridge controller needs the end-to-end
-			 * flow control workaround to avoid losing Rx
-			 * packets when RING_FLAG_E2E is set.
-			 */
-			nhi->quirks |= QUIRK_E2E;
-			break;
-		}
-	}
-}
-
-static int nhi_check_iommu_pci_dev(struct pci_dev *pdev, void *data)
-{
-	if (!pdev->external_facing ||
-	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_PRE_BOOT_PROTECTION))
-		return 0;
-	*(bool *)data = true;
-	return 1; /* Stop walking */
-}
-
-static void nhi_check_iommu(struct tb_nhi_pci *nhi_pci)
-{
-	struct tb_nhi *nhi = &nhi_pci->nhi;
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
-	struct pci_bus *bus = pdev->bus;
-	bool port_ok = false;
-
-	/*
-	 * Ideally what we'd do here is grab every PCI device that
-	 * represents a tunnelling adapter for this NHI and check their
-	 * status directly, but unfortunately USB4 seems to make it
-	 * obnoxiously difficult to reliably make any correlation.
-	 *
-	 * So for now we'll have to bodge it... Hoping that the system
-	 * is at least sane enough that an adapter is in the same PCI
-	 * segment as its NHI, if we can find *something* on that segment
-	 * which meets the requirements for Kernel DMA Protection, we'll
-	 * take that to imply that firmware is aware and has (hopefully)
-	 * done the right thing in general. We need to know that the PCI
-	 * layer has seen the ExternalFacingPort property which will then
-	 * inform the IOMMU layer to enforce the complete "untrusted DMA"
-	 * flow, but also that the IOMMU driver itself can be trusted not
-	 * to have been subverted by a pre-boot DMA attack.
-	 */
-	while (bus->parent)
-		bus = bus->parent;
-
-	pci_walk_bus(bus, nhi_check_iommu_pci_dev, &port_ok);
-
-	nhi->iommu_dma_protection = port_ok;
-	dev_dbg(nhi->dev, "IOMMU DMA protection is %s\n",
-		str_enabled_disabled(port_ok));
-}
-
 static void nhi_reset(struct tb_nhi *nhi)
 {
 	ktime_t timeout;
@@ -1283,53 +1129,6 @@ static void nhi_reset(struct tb_nhi *nhi)
 	dev_warn(nhi->dev, "timeout resetting host router\n");
 }
 
-static int nhi_init_msi(struct tb_nhi_pci *nhi_pci)
-{
-	struct tb_nhi *nhi = &nhi_pci->nhi;
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
-	struct device *dev = &pdev->dev;
-	int res, irq, nvec;
-
-	ida_init(&nhi_pci->msix_ida);
-
-	/*
-	 * The NHI has 16 MSI-X vectors or a single MSI. We first try to
-	 * get all MSI-X vectors and if we succeed, each ring will have
-	 * one MSI-X. If for some reason that does not work out, we
-	 * fallback to a single MSI.
-	 */
-	nvec = pci_alloc_irq_vectors(pdev, MSIX_MIN_VECS, MSIX_MAX_VECS,
-				     PCI_IRQ_MSIX);
-	if (nvec < 0) {
-		nvec = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
-		if (nvec < 0)
-			return nvec;
-
-		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
-
-		irq = pci_irq_vector(pdev, 0);
-		if (irq < 0)
-			return irq;
-
-		res = devm_request_irq(&pdev->dev, irq, nhi_msi,
-				       IRQF_NO_SUSPEND, "thunderbolt", nhi);
-		if (res)
-			return dev_err_probe(dev, res, "request_irq failed, aborting\n");
-	}
-
-	return 0;
-}
-
-static bool nhi_imr_valid(struct pci_dev *pdev)
-{
-	u8 val;
-
-	if (!device_property_read_u8(&pdev->dev, "IMR_VALID", &val))
-		return !!val;
-
-	return true;
-}
-
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
 	struct tb *tb;
@@ -1353,64 +1152,40 @@ static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 	return tb;
 }
 
-static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+int nhi_probe(struct tb_nhi *nhi)
 {
-	struct device *dev = &pdev->dev;
-	struct tb_nhi_pci *nhi_pci;
-	struct tb_nhi *nhi;
+	struct device *dev = nhi->dev;
 	struct tb *tb;
 	int res;
 
-	if (!nhi_imr_valid(pdev))
-		return dev_err_probe(dev, -ENODEV, "firmware image not valid, aborting\n");
-
-	res = pcim_enable_device(pdev);
-	if (res)
-		return dev_err_probe(dev, res, "cannot enable PCI device, aborting\n");
-
-	nhi_pci = devm_kzalloc(dev, sizeof(*nhi_pci), GFP_KERNEL);
-	if (!nhi_pci)
-		return -ENOMEM;
-
-	nhi = &nhi_pci->nhi;
-	nhi->dev = dev;
-	nhi->ops = (const struct tb_nhi_ops *)id->driver_data;
-
-	nhi->iobase = pcim_iomap_region(pdev, 0, "thunderbolt");
-	res = PTR_ERR_OR_ZERO(nhi->iobase);
-	if (res)
-		return dev_err_probe(dev, res, "cannot obtain PCI resources, aborting\n");
-
 	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
 	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
 
-	nhi->tx_rings = devm_kcalloc(&pdev->dev, nhi->hop_count,
+	nhi->tx_rings = devm_kcalloc(dev, nhi->hop_count,
 				     sizeof(*nhi->tx_rings), GFP_KERNEL);
-	nhi->rx_rings = devm_kcalloc(&pdev->dev, nhi->hop_count,
+	nhi->rx_rings = devm_kcalloc(dev, nhi->hop_count,
 				     sizeof(*nhi->rx_rings), GFP_KERNEL);
 	if (!nhi->tx_rings || !nhi->rx_rings)
 		return -ENOMEM;
 
-	nhi_check_quirks(nhi_pci);
-	nhi_check_iommu(nhi_pci);
 	nhi_reset(nhi);
 
 	/* In case someone left them on. */
 	nhi_disable_interrupts(nhi);
 	nhi_enable_int_throttling(nhi);
 
-	res = nhi_init_msi(nhi_pci);
-	if (res)
-		return dev_err_probe(dev, res, "cannot enable MSI, aborting\n");
+	if (nhi->ops && nhi->ops->init_interrupts) {
+		res = nhi->ops->init_interrupts(nhi);
+		if (res)
+			return dev_err_probe(dev, res, "cannot enable interrupts, aborting\n");
+	}
 
 	spin_lock_init(&nhi->lock);
 
-	res = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	res = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
 	if (res)
 		return dev_err_probe(dev, res, "failed to set DMA mask\n");
 
-	pci_set_master(pdev);
-
 	if (nhi->ops && nhi->ops->init) {
 		res = nhi->ops->init(nhi);
 		if (res)
@@ -1434,37 +1209,24 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		nhi_shutdown(nhi);
 		return res;
 	}
-	pci_set_drvdata(pdev, tb);
+	dev_set_drvdata(dev, tb);
 
-	device_wakeup_enable(&pdev->dev);
+	device_wakeup_enable(dev);
 
-	pm_runtime_allow(&pdev->dev);
-	pm_runtime_set_autosuspend_delay(&pdev->dev, TB_AUTOSUSPEND_DELAY);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_allow(dev);
+	pm_runtime_set_autosuspend_delay(dev, TB_AUTOSUSPEND_DELAY);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }
 
-static void nhi_remove(struct pci_dev *pdev)
-{
-	struct tb *tb = pci_get_drvdata(pdev);
-	struct tb_nhi *nhi = tb->nhi;
-
-	pm_runtime_get_sync(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_forbid(&pdev->dev);
-
-	tb_domain_remove(tb);
-	nhi_shutdown(nhi);
-}
-
 /*
  * The tunneled pci bridges are siblings of us. Use resume_noirq to reenable
  * the tunnels asap. A corresponding pci quirk blocks the downstream bridges
  * resume_noirq until we are done.
  */
-static const struct dev_pm_ops nhi_pm_ops = {
+const struct dev_pm_ops nhi_pm_ops = {
 	.suspend_noirq = nhi_suspend_noirq,
 	.resume_noirq = nhi_resume_noirq,
 	.freeze_noirq = nhi_freeze_noirq,  /*
@@ -1480,198 +1242,3 @@ static const struct dev_pm_ops nhi_pm_ops = {
 	.runtime_suspend = nhi_runtime_suspend,
 	.runtime_resume = nhi_runtime_resume,
 };
-
-/*
- * During suspend the Thunderbolt controller is reset and all PCIe
- * tunnels are lost. The NHI driver will try to reestablish all tunnels
- * during resume. This adds device links between the tunneled PCIe
- * downstream ports and the NHI so that the device core will make sure
- * NHI is resumed first before the rest.
- */
-bool tb_apple_add_links(struct tb_nhi *nhi)
-{
-	struct pci_dev *nhi_pdev = to_pci_dev(nhi->dev);
-	struct pci_dev *upstream, *pdev;
-	bool ret;
-
-	if (!x86_apple_machine)
-		return false;
-
-	switch (nhi_pdev->device) {
-	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
-	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
-		break;
-	default:
-		return false;
-	}
-
-	upstream = pci_upstream_bridge(nhi_pdev);
-	while (upstream) {
-		if (!pci_is_pcie(upstream))
-			return false;
-		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
-			break;
-		upstream = pci_upstream_bridge(upstream);
-	}
-
-	if (!upstream)
-		return false;
-
-	/*
-	 * For each hotplug downstream port, create add device link
-	 * back to NHI so that PCIe tunnels can be re-established after
-	 * sleep.
-	 */
-	ret = false;
-	for_each_pci_bridge(pdev, upstream->subordinate) {
-		const struct device_link *link;
-
-		if (!pci_is_pcie(pdev))
-			continue;
-		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
-		    !pdev->is_pciehp)
-			continue;
-
-		link = device_link_add(&pdev->dev, nhi->dev,
-				       DL_FLAG_AUTOREMOVE_SUPPLIER |
-				       DL_FLAG_PM_RUNTIME);
-		if (link) {
-			dev_dbg(nhi->dev, "created link from %s\n",
-				dev_name(&pdev->dev));
-			ret = true;
-		} else {
-			dev_warn(nhi->dev, "device link creation from %s failed\n",
-				 dev_name(&pdev->dev));
-		}
-	}
-
-	return ret;
-}
-
-static struct pci_device_id nhi_ids[] = {
-	/*
-	 * We have to specify class, the TB bridges use the same device and
-	 * vendor (sub)id on gen 1 and gen 2 controllers.
-	 */
-	{
-		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
-		.vendor = PCI_VENDOR_ID_INTEL,
-		.device = PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
-		.subvendor = 0x2222, .subdevice = 0x1111,
-	},
-	{
-		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
-		.vendor = PCI_VENDOR_ID_INTEL,
-		.device = PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
-		.subvendor = 0x2222, .subdevice = 0x1111,
-	},
-	{
-		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
-		.vendor = PCI_VENDOR_ID_INTEL,
-		.device = PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI,
-		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
-	},
-	{
-		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
-		.vendor = PCI_VENDOR_ID_INTEL,
-		.device = PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI,
-		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
-	},
-
-	/* Thunderbolt 3 */
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_USBONLY_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_USBONLY_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_USBONLY_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICL_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICL_NHI1),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	/* Thunderbolt 4 */
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI1),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_H_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_H_NHI1),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADL_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADL_NHI1),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPL_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPL_NHI1),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_M_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_P_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_P_NHI1),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_LNL_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_LNL_NHI1),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_M_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_M_NHI1),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_P_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_P_NHI1),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_WCL_NHI0),
-	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI) },
-
-	/* Any USB4 compliant host */
-	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_USB4, ~0) },
-
-	{ 0,}
-};
-
-MODULE_DEVICE_TABLE(pci, nhi_ids);
-MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
-MODULE_LICENSE("GPL");
-
-static struct pci_driver nhi_driver = {
-	.name = "thunderbolt",
-	.id_table = nhi_ids,
-	.probe = nhi_probe,
-	.remove = nhi_remove,
-	.shutdown = nhi_remove,
-	.driver.pm = &nhi_pm_ops,
-};
-
-static int __init nhi_init(void)
-{
-	int ret;
-
-	ret = tb_domain_init();
-	if (ret)
-		return ret;
-	ret = pci_register_driver(&nhi_driver);
-	if (ret)
-		tb_domain_exit();
-	return ret;
-}
-
-static void __exit nhi_unload(void)
-{
-	pci_unregister_driver(&nhi_driver);
-	tb_domain_exit();
-}
-
-rootfs_initcall(nhi_init);
-module_exit(nhi_unload);
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index efcd119e26f8..0b172c724b42 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -30,6 +30,14 @@ enum nhi_mailbox_cmd {
 int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
 enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
 bool tb_apple_add_links(struct tb_nhi *nhi);
+void nhi_enable_int_throttling(struct tb_nhi *nhi);
+void nhi_disable_interrupts(struct tb_nhi *nhi);
+void nhi_interrupt_work(struct work_struct *work);
+irqreturn_t nhi_msi(int irq, void *data);
+irqreturn_t ring_msix(int irq, void *data);
+int nhi_probe(struct tb_nhi *nhi);
+void nhi_shutdown(struct tb_nhi *nhi);
+extern const struct dev_pm_ops nhi_pm_ops;
 
 /**
  * struct tb_nhi_ops - NHI specific optional operations
@@ -39,6 +47,12 @@ bool tb_apple_add_links(struct tb_nhi *nhi);
  * @runtime_suspend: NHI specific runtime_suspend hook
  * @runtime_resume: NHI specific runtime_resume hook
  * @shutdown: NHI specific shutdown
+ * @pre_nvm_auth: hook to run before TBT3 NVM authentication
+ * @post_nvm_auth: hook to run after TBT3 NVM authentication
+ * @request_ring_irq: NHI specific interrupt retrieval hook
+ * @release_ring_irq: NHI specific interrupt release hook
+ * @is_present: Whether the device is currently present on the parent bus
+ * @init_interrupts: NHI specific interrupt initialization hook
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -47,6 +61,12 @@ struct tb_nhi_ops {
 	int (*runtime_suspend)(struct tb_nhi *nhi);
 	int (*runtime_resume)(struct tb_nhi *nhi);
 	void (*shutdown)(struct tb_nhi *nhi);
+	void (*pre_nvm_auth)(struct tb_nhi *nhi);
+	void (*post_nvm_auth)(struct tb_nhi *nhi);
+	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
+	void (*release_ring_irq)(struct tb_ring *ring);
+	bool (*is_present)(struct tb_nhi *nhi);
+	int (*init_interrupts)(struct tb_nhi *nhi);
 };
 
 extern const struct tb_nhi_ops icl_nhi_ops;
@@ -101,4 +121,15 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 
 #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
 
+/* Host interface quirks */
+#define QUIRK_AUTO_CLEAR_INT	BIT(0)
+#define QUIRK_E2E		BIT(1)
+
+/*
+ * Minimal number of vectors when we use MSI-X. Two for control channel
+ * Rx/Tx and the rest four are for cross domain DMA paths.
+ */
+#define MSIX_MIN_VECS		6
+#define MSIX_MAX_VECS		16
+
 #endif
diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbolt/nhi_ops.c
index 8c50066f3411..530337a78322 100644
--- a/drivers/thunderbolt/nhi_ops.c
+++ b/drivers/thunderbolt/nhi_ops.c
@@ -11,6 +11,7 @@
 
 #include "nhi.h"
 #include "nhi_regs.h"
+#include "pci.h"
 #include "tb.h"
 
 /* Ice Lake specific NHI operations */
@@ -176,6 +177,8 @@ static int icl_nhi_resume(struct tb_nhi *nhi)
 
 static void icl_nhi_shutdown(struct tb_nhi *nhi)
 {
+	nhi_pci_shutdown(nhi);
+
 	icl_nhi_force_power(nhi, false);
 }
 
@@ -186,4 +189,10 @@ const struct tb_nhi_ops icl_nhi_ops = {
 	.runtime_suspend = icl_nhi_suspend,
 	.runtime_resume = icl_nhi_resume,
 	.shutdown = icl_nhi_shutdown,
+	.pre_nvm_auth = nhi_pci_start_dma_port,
+	.post_nvm_auth = nhi_pci_complete_dma_port,
+	.request_ring_irq = nhi_pci_ring_request_msix,
+	.release_ring_irq = nhi_pci_ring_release_msix,
+	.is_present = nhi_pci_is_present,
+	.init_interrupts = nhi_pci_init_msi,
 };
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
new file mode 100644
index 000000000000..400ba88db034
--- /dev/null
+++ b/drivers/thunderbolt/pci.c
@@ -0,0 +1,507 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Thunderbolt driver - PCI NHI driver
+ *
+ * Copyright (c) 2014 Andreas Noever <andreas.noever@gmail.com>
+ * Copyright (C) 2018, Intel Corporation
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/errno.h>
+#include <linux/pci.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/iommu.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/platform_data/x86/apple.h>
+#include <linux/property.h>
+#include <linux/string_helpers.h>
+
+#include "nhi.h"
+#include "nhi_regs.h"
+#include "pci.h"
+#include "tb.h"
+
+struct tb_nhi_pci {
+	struct tb_nhi nhi;
+	struct ida msix_ida;
+};
+
+static inline struct tb_nhi_pci *nhi_to_pci(struct tb_nhi *nhi)
+{
+	return container_of(nhi, struct tb_nhi_pci, nhi);
+}
+
+static void nhi_pci_check_quirks(struct tb_nhi_pci *nhi_pci)
+{
+	struct tb_nhi *nhi = &nhi_pci->nhi;
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+
+	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
+		/*
+		 * Intel hardware supports auto clear of the interrupt
+		 * status register right after interrupt is being
+		 * issued.
+		 */
+		nhi->quirks |= QUIRK_AUTO_CLEAR_INT;
+
+		switch (pdev->device) {
+		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
+		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+			/*
+			 * Falcon Ridge controller needs the end-to-end
+			 * flow control workaround to avoid losing Rx
+			 * packets when RING_FLAG_E2E is set.
+			 */
+			nhi->quirks |= QUIRK_E2E;
+			break;
+		}
+	}
+}
+
+static int nhi_pci_check_iommu_pdev(struct pci_dev *pdev, void *data)
+{
+	if (!pdev->external_facing ||
+	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_PRE_BOOT_PROTECTION))
+		return 0;
+	*(bool *)data = true;
+	return 1; /* Stop walking */
+}
+
+static void nhi_pci_check_iommu(struct tb_nhi_pci *nhi_pci)
+{
+	struct tb_nhi *nhi = &nhi_pci->nhi;
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	struct pci_bus *bus = pdev->bus;
+	bool port_ok = false;
+
+	/*
+	 * Ideally what we'd do here is grab every PCI device that
+	 * represents a tunnelling adapter for this NHI and check their
+	 * status directly, but unfortunately USB4 seems to make it
+	 * obnoxiously difficult to reliably make any correlation.
+	 *
+	 * So for now we'll have to bodge it... Hoping that the system
+	 * is at least sane enough that an adapter is in the same PCI
+	 * segment as its NHI, if we can find *something* on that segment
+	 * which meets the requirements for Kernel DMA Protection, we'll
+	 * take that to imply that firmware is aware and has (hopefully)
+	 * done the right thing in general. We need to know that the PCI
+	 * layer has seen the ExternalFacingPort property which will then
+	 * inform the IOMMU layer to enforce the complete "untrusted DMA"
+	 * flow, but also that the IOMMU driver itself can be trusted not
+	 * to have been subverted by a pre-boot DMA attack.
+	 */
+	while (bus->parent)
+		bus = bus->parent;
+
+	pci_walk_bus(bus, nhi_pci_check_iommu_pdev, &port_ok);
+
+	nhi->iommu_dma_protection = port_ok;
+	dev_dbg(nhi->dev, "IOMMU DMA protection is %s\n",
+		str_enabled_disabled(port_ok));
+}
+
+int nhi_pci_init_msi(struct tb_nhi *nhi)
+{
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	struct device *dev = &pdev->dev;
+	int res, irq, nvec;
+
+	ida_init(&nhi_pci->msix_ida);
+
+	/*
+	 * The NHI has 16 MSI-X vectors or a single MSI. We first try to
+	 * get all MSI-X vectors and if we succeed, each ring will have
+	 * one MSI-X. If for some reason that does not work out, we
+	 * fallback to a single MSI.
+	 */
+	nvec = pci_alloc_irq_vectors(pdev, MSIX_MIN_VECS, MSIX_MAX_VECS,
+				     PCI_IRQ_MSIX);
+	if (nvec < 0) {
+		nvec = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+		if (nvec < 0)
+			return nvec;
+
+		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
+
+		irq = pci_irq_vector(pdev, 0);
+		if (irq < 0)
+			return irq;
+
+		res = devm_request_irq(&pdev->dev, irq, nhi_msi,
+				       IRQF_NO_SUSPEND, "thunderbolt", nhi);
+		if (res)
+			return dev_err_probe(dev, res, "request_irq failed, aborting\n");
+	}
+
+	return 0;
+}
+
+static bool nhi_pci_imr_valid(struct pci_dev *pdev)
+{
+	u8 val;
+
+	if (!device_property_read_u8(&pdev->dev, "IMR_VALID", &val))
+		return !!val;
+
+	return true;
+}
+
+void nhi_pci_start_dma_port(struct tb_nhi *nhi)
+{
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	struct pci_dev *root_port;
+
+	/*
+	 * During host router NVM upgrade we should not allow root port to
+	 * go into D3cold because some root ports cannot trigger PME
+	 * itself. To be on the safe side keep the root port in D0 during
+	 * the whole upgrade process.
+	 */
+	root_port = pcie_find_root_port(pdev);
+	if (root_port)
+		pm_runtime_get_noresume(&root_port->dev);
+}
+
+void nhi_pci_complete_dma_port(struct tb_nhi *nhi)
+{
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	struct pci_dev *root_port;
+
+	root_port = pcie_find_root_port(pdev);
+	if (root_port)
+		pm_runtime_put(&root_port->dev);
+}
+
+int nhi_pci_ring_request_msix(struct tb_ring *ring, bool no_suspend)
+{
+	struct tb_nhi *nhi = ring->nhi;
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	unsigned long irqflags;
+	int ret;
+
+	if (!pdev->msix_enabled)
+		return 0;
+
+	ret = ida_alloc_max(&nhi_pci->msix_ida, MSIX_MAX_VECS - 1, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	ring->vector = ret;
+
+	ret = pci_irq_vector(pdev, ring->vector);
+	if (ret < 0)
+		goto err_ida_remove;
+
+	ring->irq = ret;
+
+	irqflags = no_suspend ? IRQF_NO_SUSPEND : 0;
+	ret = request_irq(ring->irq, ring_msix, irqflags, "thunderbolt", ring);
+	if (ret)
+		goto err_ida_remove;
+
+	return 0;
+
+err_ida_remove:
+	ida_free(&nhi_pci->msix_ida, ring->vector);
+
+	return ret;
+}
+
+void nhi_pci_ring_release_msix(struct tb_ring *ring)
+{
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(ring->nhi);
+
+	if (ring->irq <= 0)
+		return;
+
+	free_irq(ring->irq, ring);
+	ida_free(&nhi_pci->msix_ida, ring->vector);
+	ring->vector = 0;
+	ring->irq = 0;
+}
+
+void nhi_pci_shutdown(struct tb_nhi *nhi)
+{
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+
+	/*
+	 * We have to release the irq before calling flush_work. Otherwise an
+	 * already executing IRQ handler could call schedule_work again.
+	 */
+	if (!pdev->msix_enabled) {
+		devm_free_irq(nhi->dev, pdev->irq, nhi);
+		flush_work(&nhi->interrupt_work);
+	}
+	ida_destroy(&nhi_pci->msix_ida);
+}
+
+bool nhi_pci_is_present(struct tb_nhi *nhi)
+{
+	return pci_device_is_present(to_pci_dev(nhi->dev));
+}
+
+static const struct tb_nhi_ops pci_nhi_default_ops = {
+	.pre_nvm_auth = nhi_pci_start_dma_port,
+	.post_nvm_auth = nhi_pci_complete_dma_port,
+	.request_ring_irq = nhi_pci_ring_request_msix,
+	.release_ring_irq = nhi_pci_ring_release_msix,
+	.shutdown = nhi_pci_shutdown,
+	.is_present = nhi_pci_is_present,
+	.init_interrupts = nhi_pci_init_msi,
+};
+
+static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct tb_nhi_pci *nhi_pci;
+	struct tb_nhi *nhi;
+	int res;
+
+	if (!nhi_pci_imr_valid(pdev))
+		return dev_err_probe(dev, -ENODEV, "firmware image not valid, aborting\n");
+
+	res = pcim_enable_device(pdev);
+	if (res)
+		return dev_err_probe(dev, res, "cannot enable PCI device, aborting\n");
+
+	nhi_pci = devm_kzalloc(dev, sizeof(*nhi_pci), GFP_KERNEL);
+	if (!nhi_pci)
+		return -ENOMEM;
+
+	nhi = &nhi_pci->nhi;
+	nhi->dev = dev;
+	nhi->ops = (const struct tb_nhi_ops *)id->driver_data ?: &pci_nhi_default_ops;
+
+	nhi->iobase = pcim_iomap_region(pdev, 0, "thunderbolt");
+	res = PTR_ERR_OR_ZERO(nhi->iobase);
+	if (res)
+		return dev_err_probe(dev, res, "cannot obtain PCI resources, aborting\n");
+
+	nhi_pci_check_quirks(nhi_pci);
+	nhi_pci_check_iommu(nhi_pci);
+
+	pci_set_master(pdev);
+
+	res = nhi_probe(&nhi_pci->nhi);
+	if (res)
+		return dev_err_probe(dev, res, "NHI common probe failed\n");
+
+	return 0;
+}
+
+static void nhi_pci_remove(struct pci_dev *pdev)
+{
+	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb_nhi *nhi = tb->nhi;
+
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_forbid(&pdev->dev);
+
+	tb_domain_remove(tb);
+	nhi_shutdown(nhi);
+}
+
+/*
+ * During suspend the Thunderbolt controller is reset and all PCIe
+ * tunnels are lost. The NHI driver will try to reestablish all tunnels
+ * during resume. This adds device links between the tunneled PCIe
+ * downstream ports and the NHI so that the device core will make sure
+ * NHI is resumed first before the rest.
+ */
+bool tb_apple_add_links(struct tb_nhi *nhi)
+{
+	struct pci_dev *nhi_pdev = to_pci_dev(nhi->dev);
+	struct pci_dev *upstream, *pdev;
+	bool ret;
+
+	if (!x86_apple_machine)
+		return false;
+
+	switch (nhi_pdev->device) {
+	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
+	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+		break;
+	default:
+		return false;
+	}
+
+	upstream = pci_upstream_bridge(nhi_pdev);
+	while (upstream) {
+		if (!pci_is_pcie(upstream))
+			return false;
+		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
+			break;
+		upstream = pci_upstream_bridge(upstream);
+	}
+
+	if (!upstream)
+		return false;
+
+	/*
+	 * For each hotplug downstream port, create add device link
+	 * back to NHI so that PCIe tunnels can be re-established after
+	 * sleep.
+	 */
+	ret = false;
+	for_each_pci_bridge(pdev, upstream->subordinate) {
+		const struct device_link *link;
+
+		if (!pci_is_pcie(pdev))
+			continue;
+		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
+		    !pdev->is_pciehp)
+			continue;
+
+		link = device_link_add(&pdev->dev, nhi->dev,
+				       DL_FLAG_AUTOREMOVE_SUPPLIER |
+				       DL_FLAG_PM_RUNTIME);
+		if (link) {
+			dev_dbg(nhi->dev, "created link from %s\n",
+				dev_name(&pdev->dev));
+			ret = true;
+		} else {
+			dev_warn(nhi->dev, "device link creation from %s failed\n",
+				 dev_name(&pdev->dev));
+		}
+	}
+
+	return ret;
+}
+
+static struct pci_device_id nhi_ids[] = {
+	/*
+	 * We have to specify class, the TB bridges use the same device and
+	 * vendor (sub)id on gen 1 and gen 2 controllers.
+	 */
+	{
+		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
+		.vendor = PCI_VENDOR_ID_INTEL,
+		.device = PCI_DEVICE_ID_INTEL_LIGHT_RIDGE,
+		.subvendor = 0x2222, .subdevice = 0x1111,
+	},
+	{
+		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
+		.vendor = PCI_VENDOR_ID_INTEL,
+		.device = PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
+		.subvendor = 0x2222, .subdevice = 0x1111,
+	},
+	{
+		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
+		.vendor = PCI_VENDOR_ID_INTEL,
+		.device = PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
+	},
+	{
+		.class = PCI_CLASS_SYSTEM_OTHER << 8, .class_mask = ~0,
+		.vendor = PCI_VENDOR_ID_INTEL,
+		.device = PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI,
+		.subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
+	},
+
+	/* Thunderbolt 3 */
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_USBONLY_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_USBONLY_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_USBONLY_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICL_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	/* Thunderbolt 4 */
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_H_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_H_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADL_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPL_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_M_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_P_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_P_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_LNL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_LNL_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_M_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_M_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_P_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_PTL_P_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_WCL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI) },
+
+	/* Any USB4 compliant host */
+	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_USB4, ~0) },
+
+	{ 0,}
+};
+
+MODULE_DEVICE_TABLE(pci, nhi_ids);
+MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
+MODULE_LICENSE("GPL");
+
+static struct pci_driver nhi_driver = {
+	.name = "thunderbolt",
+	.id_table = nhi_ids,
+	.probe = nhi_pci_probe,
+	.remove = nhi_pci_remove,
+	.shutdown = nhi_pci_remove,
+	.driver.pm = &nhi_pm_ops,
+};
+
+static int __init nhi_init(void)
+{
+	int ret;
+
+	ret = tb_domain_init();
+	if (ret)
+		return ret;
+
+	ret = pci_register_driver(&nhi_driver);
+	if (ret)
+		tb_domain_exit();
+
+	return ret;
+}
+
+static void __exit nhi_unload(void)
+{
+	pci_unregister_driver(&nhi_driver);
+	tb_domain_exit();
+}
+
+rootfs_initcall(nhi_init);
+module_exit(nhi_unload);
diff --git a/drivers/thunderbolt/pci.h b/drivers/thunderbolt/pci.h
new file mode 100644
index 000000000000..8ce272a10661
--- /dev/null
+++ b/drivers/thunderbolt/pci.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __TBT_PCI_H
+#define __TBT_PCI_H
+
+#include <linux/types.h>
+
+void nhi_pci_start_dma_port(struct tb_nhi *nhi);
+void nhi_pci_complete_dma_port(struct tb_nhi *nhi);
+int nhi_pci_ring_request_msix(struct tb_ring *ring, bool no_suspend);
+void nhi_pci_ring_release_msix(struct tb_ring *ring);
+bool nhi_pci_is_present(struct tb_nhi *nhi);
+void nhi_pci_shutdown(struct tb_nhi *nhi);
+int nhi_pci_init_msi(struct tb_nhi *nhi);
+
+#endif
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 0680209e349c..9647650ee02d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -209,32 +209,6 @@ static int nvm_authenticate_device_dma_port(struct tb_switch *sw)
 	return -ETIMEDOUT;
 }
 
-static void nvm_authenticate_start_dma_port(struct tb_switch *sw)
-{
-	struct pci_dev *pdev = to_pci_dev(sw->tb->nhi->dev);
-	struct pci_dev *root_port;
-
-	/*
-	 * During host router NVM upgrade we should not allow root port to
-	 * go into D3cold because some root ports cannot trigger PME
-	 * itself. To be on the safe side keep the root port in D0 during
-	 * the whole upgrade process.
-	 */
-	root_port = pcie_find_root_port(pdev);
-	if (root_port)
-		pm_runtime_get_noresume(&root_port->dev);
-}
-
-static void nvm_authenticate_complete_dma_port(struct tb_switch *sw)
-{
-	struct pci_dev *pdev = to_pci_dev(sw->tb->nhi->dev);
-	struct pci_dev *root_port;
-
-	root_port = pcie_find_root_port(pdev);
-	if (root_port)
-		pm_runtime_put(&root_port->dev);
-}
-
 static inline bool nvm_readable(struct tb_switch *sw)
 {
 	if (tb_switch_is_usb4(sw)) {
@@ -260,6 +234,7 @@ static inline bool nvm_upgradeable(struct tb_switch *sw)
 
 static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
 {
+	struct tb_nhi *nhi = sw->tb->nhi;
 	int ret;
 
 	if (tb_switch_is_usb4(sw)) {
@@ -276,7 +251,8 @@ static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
 
 	sw->nvm->authenticating = true;
 	if (!tb_route(sw)) {
-		nvm_authenticate_start_dma_port(sw);
+		if (nhi->ops && nhi->ops->pre_nvm_auth)
+			nhi->ops->pre_nvm_auth(nhi);
 		ret = nvm_authenticate_host_dma_port(sw);
 	} else {
 		ret = nvm_authenticate_device_dma_port(sw);
@@ -2745,6 +2721,7 @@ static int tb_switch_set_uuid(struct tb_switch *sw)
 
 static int tb_switch_add_dma_port(struct tb_switch *sw)
 {
+	struct tb_nhi *nhi = sw->tb->nhi;
 	u32 status;
 	int ret;
 
@@ -2804,8 +2781,10 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
 	 */
 	nvm_get_auth_status(sw, &status);
 	if (status) {
-		if (!tb_route(sw))
-			nvm_authenticate_complete_dma_port(sw);
+		if (!tb_route(sw)) {
+			if (nhi->ops && nhi->ops->post_nvm_auth)
+				nhi->ops->post_nvm_auth(nhi);
+		}
 		return 0;
 	}
 
@@ -2819,8 +2798,10 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
 		return ret;
 
 	/* Now we can allow root port to suspend again */
-	if (!tb_route(sw))
-		nvm_authenticate_complete_dma_port(sw);
+	if (!tb_route(sw)) {
+		if (nhi->ops && nhi->ops->post_nvm_auth)
+			nhi->ops->post_nvm_auth(nhi);
+	}
 
 	if (status) {
 		tb_sw_info(sw, "switch flash authentication failed\n");

-- 
2.54.0


