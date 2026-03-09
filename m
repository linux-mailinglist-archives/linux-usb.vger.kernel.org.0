Return-Path: <linux-usb+bounces-34282-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMd/Nyyirmk9HAIAu9opvQ
	(envelope-from <linux-usb+bounces-34282-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:34:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69A2372BF
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1017B30234F4
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 10:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295A938F931;
	Mon,  9 Mar 2026 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PM3vO1NL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81F438B7B9;
	Mon,  9 Mar 2026 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052427; cv=none; b=g2omEbKvDuW1ryqHb+5xNtTfFBlc31PXZFuHU3VyUeu2c6Zpvr/69T0oLPkUb4RjAwfFvSJx4gIPIdmBe8aZjqvzuyw5hWSeN5d7z1QpQQ5gLxnv6+vhgAHScPrT0GSs37eHcO1ScaO0gzUgB0cmkZdVU9QgDssk2VDkS1I/zCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052427; c=relaxed/simple;
	bh=d/Cda0uwNorcwEDKJiLBY68hrG1k7S02ZAi4VISBLBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rIiS1RYTFnrgKt+K6Z73AGv61XqPAUM97LZ6ws6HNzXDxon/sQBlanSU2yq23szDh7OUfVvEA0PMFCGAGjlMtXK2Z2POwNuv/OS8bA4HbHwC99GZZaJZV6PfHkh3wtlS2iFi8mwfCwFgwv7gKR7u0gpRUOBZYZ5SyVHsc/lsUYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PM3vO1NL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2895C4CEF7;
	Mon,  9 Mar 2026 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773052427;
	bh=d/Cda0uwNorcwEDKJiLBY68hrG1k7S02ZAi4VISBLBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PM3vO1NLJPicQHleRjObAt5sdgikBtQbX/X6RaJCGz4rkm9RqctYLkegxanwUOMeG
	 mRDykFQgKR2nSgvcZ3vQe3Cb5dCU9Fp+u8knZjcig1JB8fqnNOzU0g6TYrGMlrf9PO
	 N3nPLgJhdxL2n5aI7ZSiQdrFjuE/wleSqtk76F1J0fkko9NMivXErV9TTtxAQHayb9
	 yThPAnQBynNEJdv3I3V9/2qRZvCwtugmDVBr7YKd+QGP90EA04cRyXKfDm7ImpgCdl
	 otO0HRHxvRCEQneUEn2S5JWaYNl2TUzUNHkK+wDA9Ov300l0v1CaeopJoWBI5s6J1z
	 5E7+1MYZ90pvw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 09 Mar 2026 11:33:00 +0100
Subject: [PATCH RFC/RFT 2/3] thunderbolt: Separate out common NHI bits
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-topic-usb4_nonpcie_prepwork-v1-2-d901d85fc794@oss.qualcomm.com>
References: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
In-Reply-To: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773052420; l=43360;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=sjryN46v4+J93ZADSK/0CMgeGD58OP3Z9/p+OyU2lfo=;
 b=022PHtpmT4SIDfd2o/oqDYzST5z2QisJhY0wbU/Hb9/C0B9/alsRYGIxycp6min0ONuw3ceNp
 NLbE98rn2H1AyuKkqY4yPhzoY2f7wVGOoqMeWAbHyrcIrLiNm/JQ7sV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 8D69A2372BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34282-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add a new file encapsulating most of the PCI NHI specifics
(intentionally leaving some odd cookies behind to make the layering
simpler). Most notably, separate out nhi_probe_common() to make it
easier to register other types of NHIs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/Makefile  |   2 +-
 drivers/thunderbolt/nhi.c     | 531 +++---------------------------------------
 drivers/thunderbolt/nhi.h     |  21 ++
 drivers/thunderbolt/nhi_ops.c |   2 +
 drivers/thunderbolt/nhi_pci.c | 496 +++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/nhi_pci.h |   2 +
 6 files changed, 554 insertions(+), 500 deletions(-)

diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index b44b32dcb832..58505c7c9719 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccflags-y := -I$(src)
 obj-${CONFIG_USB4} := thunderbolt.o
-thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
+thunderbolt-objs := nhi.o nhi_pci.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
 thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
 
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 18710bafef20..ca832f802ee7 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -18,13 +18,11 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/platform_data/x86/apple.h>
 #include <linux/property.h>
 #include <linux/string_choices.h>
 #include <linux/string_helpers.h>
 
 #include "nhi.h"
-#include "nhi_pci.h"
 #include "nhi_regs.h"
 #include "tb.h"
 
@@ -36,19 +34,9 @@
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
@@ -162,7 +150,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
  *
  * Use only during init and shutdown.
  */
-static void nhi_disable_interrupts(struct tb_nhi *nhi)
+void nhi_disable_interrupts(struct tb_nhi *nhi)
 {
 	int i = 0;
 	/* disable interrupts */
@@ -447,7 +435,7 @@ static void ring_clear_msix(const struct tb_ring *ring)
 			  4 * (ring->nhi->hop_count / 32));
 }
 
-static irqreturn_t ring_msix(int irq, void *data)
+irqreturn_t ring_msix(int irq, void *data)
 {
 	struct tb_ring *ring = data;
 
@@ -461,54 +449,6 @@ static irqreturn_t ring_msix(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int ring_request_msix(struct tb_ring *ring, bool no_suspend)
-{
-	struct tb_nhi *nhi = ring->nhi;
-	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
-	unsigned long irqflags;
-	int ret;
-
-	if (!nhi_pci->pdev->msix_enabled)
-		return 0;
-
-	ret = ida_alloc_max(&nhi_pci->msix_ida, MSIX_MAX_VECS - 1, GFP_KERNEL);
-	if (ret < 0)
-		return ret;
-
-	ring->vector = ret;
-
-	ret = pci_irq_vector(nhi_pci->pdev, ring->vector);
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
@@ -923,7 +863,7 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
 	return (enum nhi_fw_mode)val;
 }
 
-static void nhi_interrupt_work(struct work_struct *work)
+void nhi_interrupt_work(struct work_struct *work)
 {
 	struct tb_nhi *nhi = container_of(work, typeof(*nhi), interrupt_work);
 	int value = 0; /* Suppress uninitialized usage warning. */
@@ -975,7 +915,7 @@ static void nhi_interrupt_work(struct work_struct *work)
 	spin_unlock_irq(&nhi->lock);
 }
 
-static irqreturn_t nhi_msi(int irq, void *data)
+irqreturn_t nhi_msi(int irq, void *data)
 {
 	struct tb_nhi *nhi = data;
 	schedule_work(&nhi->interrupt_work);
@@ -984,8 +924,7 @@ static irqreturn_t nhi_msi(int irq, void *data)
 
 static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1009,21 +948,19 @@ static int nhi_suspend_noirq(struct device *dev)
 
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
 
@@ -1031,7 +968,7 @@ static bool nhi_wake_supported(struct pci_dev *pdev)
 	 * If power rails are sustainable for wakeup from S4 this
 	 * property is set by the BIOS.
 	 */
-	if (device_property_read_u8(&pdev->dev, "WAKE_SUPPORTED", &val))
+	if (device_property_read_u8(dev, "WAKE_SUPPORTED", &val))
 		return !!val;
 
 	return true;
@@ -1039,14 +976,13 @@ static bool nhi_wake_supported(struct pci_dev *pdev)
 
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
@@ -1064,8 +1000,7 @@ static void nhi_enable_int_throttling(struct tb_nhi *nhi)
 
 static int nhi_resume_noirq(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1074,7 +1009,7 @@ static int nhi_resume_noirq(struct device *dev)
 	 * unplugged last device which causes the host controller to go
 	 * away on PCs.
 	 */
-	if (!pci_device_is_present(pdev)) {
+	if ((nhi->ops->is_present && nhi->ops->is_present(nhi))) {
 		nhi->going_away = true;
 	} else {
 		if (nhi->ops && nhi->ops->resume_noirq) {
@@ -1090,32 +1025,29 @@ static int nhi_resume_noirq(struct device *dev)
 
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
 
@@ -1133,8 +1065,7 @@ static int nhi_runtime_suspend(struct device *dev)
 
 static int nhi_runtime_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1148,9 +1079,8 @@ static int nhi_runtime_resume(struct device *dev)
 	return tb_domain_runtime_resume(tb);
 }
 
-static void nhi_shutdown(struct tb_nhi *nhi)
+void nhi_shutdown(struct tb_nhi *nhi)
 {
-	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	int i;
 
 	dev_dbg(nhi->dev, "shutdown\n");
@@ -1164,88 +1094,11 @@ static void nhi_shutdown(struct tb_nhi *nhi)
 				 "RX ring %d is still active\n", i);
 	}
 	nhi_disable_interrupts(nhi);
-	/*
-	 * We have to release the irq before calling flush_work. Otherwise an
-	 * already executing IRQ handler could call schedule_work again.
-	 */
-	if (!nhi_pci->pdev->msix_enabled) {
-		devm_free_irq(nhi->dev, nhi_pci->pdev->irq, nhi);
-		flush_work(&nhi->interrupt_work);
-	}
-	ida_destroy(&nhi_pci->msix_ida);
 
 	if (nhi->ops && nhi->ops->shutdown)
 		nhi->ops->shutdown(nhi);
 }
 
-static void nhi_check_quirks(struct tb_nhi_pci *nhi_pci)
-{
-	struct tb_nhi *nhi = &nhi_pci->nhi;
-
-	if (nhi_pci->pdev->vendor == PCI_VENDOR_ID_INTEL) {
-		/*
-		 * Intel hardware supports auto clear of the interrupt
-		 * status register right after interrupt is being
-		 * issued.
-		 */
-		nhi->quirks |= QUIRK_AUTO_CLEAR_INT;
-
-		switch (nhi_pci->pdev->device) {
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
-	struct pci_bus *bus = nhi_pci->pdev->bus;
-	struct tb_nhi *nhi = &nhi_pci->nhi;
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
@@ -1277,86 +1130,6 @@ static void nhi_reset(struct tb_nhi *nhi)
 	dev_warn(nhi->dev, "timeout resetting host router\n");
 }
 
-static int nhi_init_msi(struct tb_nhi_pci *nhi_pci)
-{
-	struct pci_dev *pdev = nhi_pci->pdev;
-	struct tb_nhi *nhi = &nhi_pci->nhi;
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
-		irq = pci_irq_vector(nhi_pci->pdev, 0);
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
-void nhi_pci_start_dma_port(struct tb_nhi *nhi)
-{
-	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
-	struct pci_dev *root_port;
-
-	/*
-	 * During host router NVM upgrade we should not allow root port to
-	 * go into D3cold because some root ports cannot trigger PME
-	 * itself. To be on the safe side keep the root port in D0 during
-	 * the whole upgrade process.
-	 */
-	root_port = pcie_find_root_port(nhi_pci->pdev);
-	if (root_port)
-		pm_runtime_get_noresume(&root_port->dev);
-}
-
-void nhi_pci_complete_dma_port(struct tb_nhi *nhi)
-{
-	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
-	struct pci_dev *root_port;
-
-	root_port = pcie_find_root_port(nhi_pci->pdev);
-	if (root_port)
-		pm_runtime_put(&root_port->dev);
-}
-
-static const struct tb_nhi_ops pci_nhi_default_ops = {
-	.pre_nvm_auth = nhi_pci_start_dma_port,
-	.post_nvm_auth = nhi_pci_complete_dma_port,
-	.request_ring_irq = ring_request_msix,
-	.release_ring_irq = ring_release_msix,
-};
-
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
 	struct tb *tb;
@@ -1380,66 +1153,34 @@ static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 	return tb;
 }
 
-static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+int nhi_probe_common(struct tb_nhi *nhi)
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
-	nhi_pci->pdev = pdev;
-
-	nhi = &nhi_pci->nhi;
-	nhi->dev = dev;
-	nhi->ops = (const struct tb_nhi_ops *)id->driver_data ?: &pci_nhi_default_ops;
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
-
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
@@ -1463,37 +1204,24 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
@@ -1509,198 +1237,3 @@ static const struct dev_pm_ops nhi_pm_ops = {
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
-	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
-	struct pci_dev *upstream, *pdev;
-	bool ret;
-
-	if (!x86_apple_machine)
-		return false;
-
-	switch (nhi_pci->pdev->device) {
-	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
-	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
-		break;
-	default:
-		return false;
-	}
-
-	upstream = pci_upstream_bridge(nhi_pci->pdev);
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
index 5534a3f0800a..b0490a1cd463 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -32,6 +32,14 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
 bool tb_apple_add_links(struct tb_nhi *nhi);
 void nhi_pci_start_dma_port(struct tb_nhi *nhi);
 void nhi_pci_complete_dma_port(struct tb_nhi *nhi);
+void nhi_enable_int_throttling(struct tb_nhi *nhi);
+void nhi_disable_interrupts(struct tb_nhi *nhi);
+void nhi_interrupt_work(struct work_struct *work);
+irqreturn_t nhi_msi(int irq, void *data);
+irqreturn_t ring_msix(int irq, void *data);
+int nhi_probe_common(struct tb_nhi *nhi);
+void nhi_shutdown(struct tb_nhi *nhi);
+extern const struct dev_pm_ops nhi_pm_ops;
 
 /**
  * struct tb_nhi_ops - NHI specific optional operations
@@ -45,6 +53,7 @@ void nhi_pci_complete_dma_port(struct tb_nhi *nhi);
  * @post_nvm_auth: hook to run after TBT3 NVM authentication
  * @request_ring_irq: NHI specific interrupt retrieval function pointer
  * @release_ring_irq: NHI specific interrupt release function pointer
+ * @is_present: Whether the device is currently present on the parent bus
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -57,6 +66,7 @@ struct tb_nhi_ops {
 	void (*post_nvm_auth)(struct tb_nhi *nhi);
 	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
 	void (*release_ring_irq)(struct tb_ring *ring);
+	bool (*is_present)(struct tb_nhi *nhi);
 };
 
 extern const struct tb_nhi_ops icl_nhi_ops;
@@ -111,4 +121,15 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 
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
index da6083f45fad..a2e79aab20a4 100644
--- a/drivers/thunderbolt/nhi_ops.c
+++ b/drivers/thunderbolt/nhi_ops.c
@@ -177,6 +177,8 @@ static int icl_nhi_resume(struct tb_nhi *nhi)
 
 static void icl_nhi_shutdown(struct tb_nhi *nhi)
 {
+	nhi_pci_shutdown(nhi);
+
 	icl_nhi_force_power(nhi, false);
 }
 
diff --git a/drivers/thunderbolt/nhi_pci.c b/drivers/thunderbolt/nhi_pci.c
new file mode 100644
index 000000000000..c63f37580128
--- /dev/null
+++ b/drivers/thunderbolt/nhi_pci.c
@@ -0,0 +1,496 @@
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
+#include "nhi_pci.h"
+#include "nhi_regs.h"
+#include "tb.h"
+
+static void nhi_pci_check_quirks(struct tb_nhi_pci *nhi_pci)
+{
+	struct tb_nhi *nhi = &nhi_pci->nhi;
+
+	if (nhi_pci->pdev->vendor == PCI_VENDOR_ID_INTEL) {
+		/*
+		 * Intel hardware supports auto clear of the interrupt
+		 * status register right after interrupt is being
+		 * issued.
+		 */
+		nhi->quirks |= QUIRK_AUTO_CLEAR_INT;
+
+		switch (nhi_pci->pdev->device) {
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
+	struct pci_bus *bus = nhi_pci->pdev->bus;
+	struct tb_nhi *nhi = &nhi_pci->nhi;
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
+static int nhi_pci_init_msi(struct tb_nhi *nhi)
+{
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *pdev = nhi_pci->pdev;
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
+		irq = pci_irq_vector(nhi_pci->pdev, 0);
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
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *root_port;
+
+	/*
+	 * During host router NVM upgrade we should not allow root port to
+	 * go into D3cold because some root ports cannot trigger PME
+	 * itself. To be on the safe side keep the root port in D0 during
+	 * the whole upgrade process.
+	 */
+	root_port = pcie_find_root_port(nhi_pci->pdev);
+	if (root_port)
+		pm_runtime_get_noresume(&root_port->dev);
+}
+
+void nhi_pci_complete_dma_port(struct tb_nhi *nhi)
+{
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *root_port;
+
+	root_port = pcie_find_root_port(nhi_pci->pdev);
+	if (root_port)
+		pm_runtime_put(&root_port->dev);
+}
+
+static int ring_request_msix(struct tb_ring *ring, bool no_suspend)
+{
+	struct tb_nhi *nhi = ring->nhi;
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	unsigned long irqflags;
+	int ret;
+
+	if (!nhi_pci->pdev->msix_enabled)
+		return 0;
+
+	ret = ida_alloc_max(&nhi_pci->msix_ida, MSIX_MAX_VECS - 1, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	ring->vector = ret;
+
+	ret = pci_irq_vector(nhi_pci->pdev, ring->vector);
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
+static void ring_release_msix(struct tb_ring *ring)
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
+
+	/*
+	 * We have to release the irq before calling flush_work. Otherwise an
+	 * already executing IRQ handler could call schedule_work again.
+	 */
+	if (!nhi_pci->pdev->msix_enabled) {
+		devm_free_irq(nhi->dev, nhi_pci->pdev->irq, nhi);
+		flush_work(&nhi->interrupt_work);
+	}
+	ida_destroy(&nhi_pci->msix_ida);
+}
+
+static bool nhi_pci_is_present(struct tb_nhi *nhi)
+{
+	return pci_device_is_present(nhi_to_pci(nhi)->pdev);
+}
+
+static const struct tb_nhi_ops pci_nhi_default_ops = {
+	.pre_nvm_auth = nhi_pci_start_dma_port,
+	.post_nvm_auth = nhi_pci_complete_dma_port,
+	.request_ring_irq = ring_request_msix,
+	.release_ring_irq = ring_release_msix,
+	.shutdown = nhi_pci_shutdown,
+	.is_present = nhi_pci_is_present,
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
+	nhi_pci->pdev = pdev;
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
+	res = nhi_pci_init_msi(nhi);
+	if (res)
+		return dev_err_probe(dev, res, "cannot enable MSI, aborting\n");
+
+	res = nhi_probe_common(&nhi_pci->nhi);
+	if (res)
+		return dev_err_probe(dev, res, "NHI common probe failed\n");
+
+	pci_set_master(pdev);
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
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *upstream, *pdev;
+	bool ret;
+
+	if (!x86_apple_machine)
+		return false;
+
+	switch (nhi_pci->pdev->device) {
+	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
+	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+		break;
+	default:
+		return false;
+	}
+
+	upstream = pci_upstream_bridge(nhi_pci->pdev);
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
+	ret = pci_register_driver(&nhi_driver);
+	if (ret)
+		tb_domain_exit();
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
diff --git a/drivers/thunderbolt/nhi_pci.h b/drivers/thunderbolt/nhi_pci.h
index 9f686e0512e9..6e930a13400e 100644
--- a/drivers/thunderbolt/nhi_pci.h
+++ b/drivers/thunderbolt/nhi_pci.h
@@ -12,6 +12,8 @@ struct tb_nhi_pci {
 	struct tb_nhi nhi;
 };
 
+void nhi_pci_shutdown(struct tb_nhi *nhi);
+
 static inline struct tb_nhi_pci *nhi_to_pci(struct tb_nhi *nhi)
 {
 	return container_of(nhi, struct tb_nhi_pci, nhi);

-- 
2.53.0


