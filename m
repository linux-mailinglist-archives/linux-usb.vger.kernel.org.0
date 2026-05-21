Return-Path: <linux-usb+bounces-37869-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIJtOBrhDmqKCwYAu9opvQ
	(envelope-from <linux-usb+bounces-37869-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:40:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7024B5A3760
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDD053007BBC
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3B53A6409;
	Thu, 21 May 2026 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSX8+790"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191E3A5995;
	Thu, 21 May 2026 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360016; cv=none; b=iBUu2cfV60fCiAt+4MVbM9R2kSYImpKxcFYf3PG4urUAJhJ12gxzLx5TOjm6kCjyPqKG7/F/HDS44v5dbY6+O1e/oTy8ArNxJA9B6XMule9DNBddLBC/dkSrdnkwi3yqJ1Y7laHL5CCyt/jx79YWIE+zjDFS4gATOiQzD3XZfF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360016; c=relaxed/simple;
	bh=PHL3VLNTtQ7vrKw/qYXAxHbhwWTHXtYkwAZ6CKQwqR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhjEdjd/7TUWKlJALucg3pgpG3cv5pAT5eYVJotO2Daf1X9Gjs/Sv3PhpPxvn5lfZ7bZ4Rss9jM3GP7Z+rfJpAxxBuJ1xbVxo/zokkEesSQSdEwkFqhNjVoTxwoGQb0f+hb6q10zIvIljaSC9fkSrk9zVfot3PQEQN14JcsSxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSX8+790; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FDA1F000E9;
	Thu, 21 May 2026 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779360012;
	bh=fwhj6ZVWVs5EIkoHC/vHe7S9BXf9N0fkH6HD06ADUgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GSX8+7904ahw0R9YU/zdsKzjed+A6Q1p/MDSqsNL0I0HfpznyXx31pAmmCDz+vObf
	 +aB14sf6DxI1mX+kFW5RPLyjWAVn9Z6y2KgHe6bKCAOiRZj/0abUvmlKCg2a1Jf7jF
	 xw9bT4Gjp5gwh8kUf0w60O9xVbtHOHybAfbAVSMRd8nOQKntHsg9gts86dCyD6808j
	 KIqsiez45sb4G3Uu7x0CUd5/UbX/Ltz7OJHbo5HM1p7HNr1RTjyn+FZ/WVuNCw2XrS
	 eIf/FKz1qFDey7+Spjy69bR10mVe9mZ74EthRk0XiDjoKCNNBuA+owhaVgy1t6wRU0
	 xQRUjbxe/+YtA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 21 May 2026 12:40:01 +0200
Subject: [PATCH v5 2/4] thunderbolt: Separate out common NHI bits
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-usb4_nonpcie_prepwork-v5-2-b67dbe7508e8@oss.qualcomm.com>
References: <20260521-topic-usb4_nonpcie_prepwork-v5-0-b67dbe7508e8@oss.qualcomm.com>
In-Reply-To: <20260521-topic-usb4_nonpcie_prepwork-v5-0-b67dbe7508e8@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779360003; l=53044;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=cczw0L9RoeTK73qsjQGz1mq7PG0ZO8+/mJBmGKYpkPQ=;
 b=CeFXgNLqSrZ8igILzlcHDccTVHjlD52qW8X4HSRDM+qGaCE5QTpUVzbGarYohoTgjpO0zGf4t
 r+pHVZ6LED3Adf55zGbJ4SI4RkVqRqcQlInbOxHdlBgtFz4f+SnERBK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37869-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7024B5A3760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add a new file encapsulating most of the PCI NHI specifics
(intentionally leaving some odd cookies behind to make the layering
simpler). Most notably, separate out nhi_probe() to make it easier to
register other types of NHIs.

Also, fold in Intel Icelake (nhi_ops.c) support to contain all
PCIe-related bits in pci.c.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/Makefile  |   2 +-
 drivers/thunderbolt/nhi.c     | 461 ++++---------------------------
 drivers/thunderbolt/nhi.h     |  33 ++-
 drivers/thunderbolt/nhi_ops.c | 189 -------------
 drivers/thunderbolt/pci.c     | 622 ++++++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c  |  43 +--
 6 files changed, 712 insertions(+), 638 deletions(-)

diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index c792b8084ffa..beb054c3126b 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccflags-y := -I$(src)
 obj-${CONFIG_USB4} := thunderbolt.o
-thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
+thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
 thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
 
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index d21c8d330f6c..be00ffb04766 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -33,38 +33,13 @@
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
 
-/**
- * struct tb_nhi_pci - NHI device connected over PCIe
- * @nhi: NHI device
- * @msix_ida: Used to allocate MSI-X vectors for rings
- */
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
@@ -179,7 +154,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
  *
  * Use only during init and shutdown.
  */
-static void nhi_disable_interrupts(struct tb_nhi *nhi)
+void nhi_disable_interrupts(struct tb_nhi *nhi)
 {
 	int i = 0;
 	/* disable interrupts */
@@ -466,7 +441,7 @@ static void ring_clear_msix(const struct tb_ring *ring)
 			  4 * (ring->nhi->hop_count / 32));
 }
 
-static irqreturn_t ring_msix(int irq, void *data)
+irqreturn_t ring_msix(int irq, void *data)
 {
 	struct tb_ring *ring = data;
 
@@ -480,55 +455,6 @@ static irqreturn_t ring_msix(int irq, void *data)
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
@@ -642,8 +568,10 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
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
@@ -651,7 +579,8 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	return ring;
 
 err_release_msix:
-	ring_release_msix(ring);
+	if (nhi->ops && nhi->ops->release_ring_irq)
+		nhi->ops->release_ring_irq(ring);
 err_free_descs:
 	dma_free_coherent(ring->nhi->dev,
 			  ring->size * sizeof(*ring->descriptors),
@@ -866,6 +795,8 @@ EXPORT_SYMBOL_GPL(tb_ring_stop);
  */
 void tb_ring_free(struct tb_ring *ring)
 {
+	struct tb_nhi *nhi = ring->nhi;
+
 	spin_lock_irq(&ring->nhi->lock);
 	/*
 	 * Dissociate the ring from the NHI. This also ensures that
@@ -882,7 +813,8 @@ void tb_ring_free(struct tb_ring *ring)
 	}
 	spin_unlock_irq(&ring->nhi->lock);
 
-	ring_release_msix(ring);
+	if (nhi->ops && nhi->ops->release_ring_irq)
+		nhi->ops->release_ring_irq(ring);
 
 	dma_free_coherent(ring->nhi->dev,
 			  ring->size * sizeof(*ring->descriptors),
@@ -983,7 +915,7 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
 	return (enum nhi_fw_mode)val;
 }
 
-static void nhi_interrupt_work(struct work_struct *work)
+void nhi_interrupt_work(struct work_struct *work)
 {
 	struct tb_nhi *nhi = container_of(work, typeof(*nhi), interrupt_work);
 	int value = 0; /* Suppress uninitialized usage warning. */
@@ -1033,7 +965,7 @@ static void nhi_interrupt_work(struct work_struct *work)
 	spin_unlock_irq(&nhi->lock);
 }
 
-static irqreturn_t nhi_msi(int irq, void *data)
+irqreturn_t nhi_msi(int irq, void *data)
 {
 	struct tb_nhi *nhi = data;
 	schedule_work(&nhi->interrupt_work);
@@ -1042,8 +974,7 @@ static irqreturn_t nhi_msi(int irq, void *data)
 
 static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1067,21 +998,19 @@ static int nhi_suspend_noirq(struct device *dev)
 
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
 
@@ -1089,7 +1018,7 @@ static bool nhi_wake_supported(struct pci_dev *pdev)
 	 * If power rails are sustainable for wakeup from S4 this
 	 * property is set by the BIOS.
 	 */
-	if (!device_property_read_u8(&pdev->dev, "WAKE_SUPPORTED", &val))
+	if (!device_property_read_u8(dev, "WAKE_SUPPORTED", &val))
 		return !!val;
 
 	return true;
@@ -1097,17 +1026,15 @@ static bool nhi_wake_supported(struct pci_dev *pdev)
 
 static int nhi_poweroff_noirq(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
 	bool wakeup;
 
-	wakeup = device_may_wakeup(dev) && nhi_wake_supported(pdev);
+	wakeup = device_may_wakeup(dev) && nhi_wake_supported(dev);
 	return __nhi_suspend_noirq(dev, wakeup);
 }
 
 static int nhi_resume_noirq(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1116,7 +1043,7 @@ static int nhi_resume_noirq(struct device *dev)
 	 * unplugged last device which causes the host controller to go
 	 * away on PCs.
 	 */
-	if (!pci_device_is_present(pdev)) {
+	if ((nhi->ops->is_present && !nhi->ops->is_present(nhi))) {
 		nhi->going_away = true;
 	} else if (nhi->ops && nhi->ops->resume_noirq) {
 		ret = nhi->ops->resume_noirq(nhi);
@@ -1129,32 +1056,29 @@ static int nhi_resume_noirq(struct device *dev)
 
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
 
@@ -1172,8 +1096,7 @@ static int nhi_runtime_suspend(struct device *dev)
 
 static int nhi_runtime_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb *tb = dev_get_drvdata(dev);
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
@@ -1186,10 +1109,8 @@ static int nhi_runtime_resume(struct device *dev)
 	return tb_domain_runtime_resume(tb);
 }
 
-static void nhi_shutdown(struct tb_nhi *nhi)
+void nhi_shutdown(struct tb_nhi *nhi)
 {
-	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
 	int i;
 
 	dev_dbg(nhi->dev, "shutdown\n");
@@ -1203,90 +1124,11 @@ static void nhi_shutdown(struct tb_nhi *nhi)
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
@@ -1318,53 +1160,6 @@ static void nhi_reset(struct tb_nhi *nhi)
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
@@ -1388,63 +1183,39 @@ static struct tb *nhi_select_cm(struct tb_nhi *nhi)
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
@@ -1471,38 +1242,24 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
-	wait_for_completion(&nhi->domain_released);
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
@@ -1518,129 +1275,3 @@ static const struct dev_pm_ops nhi_pm_ops = {
 	.runtime_suspend = nhi_runtime_suspend,
 	.runtime_resume = nhi_runtime_resume,
 };
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
index 24ac4246d0ca..d488eadadfce 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -29,6 +29,14 @@ enum nhi_mailbox_cmd {
 
 int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
 enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
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
@@ -38,6 +46,12 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
  * @runtime_suspend: NHI specific runtime_suspend hook
  * @runtime_resume: NHI specific runtime_resume hook
  * @shutdown: NHI specific shutdown
+ * @pre_nvm_auth: hook to run before Thunderbolt 3 NVM authentication
+ * @post_nvm_auth: hook to run after Thunderbolt 3 NVM authentication
+ * @request_ring_irq: NHI specific interrupt retrieval hook
+ * @release_ring_irq: NHI specific interrupt release hook
+ * @is_present: Whether the device is currently present on the parent bus
+ * @init_interrupts: NHI specific interrupt initialization hook
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -46,10 +60,14 @@ struct tb_nhi_ops {
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
 
-extern const struct tb_nhi_ops icl_nhi_ops;
-
 /*
  * PCI IDs used in this driver from Win Ridge forward. There is no
  * need for the PCI quirk anymore as we will use ICM also on Apple
@@ -100,4 +118,15 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 
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
deleted file mode 100644
index 8c50066f3411..000000000000
--- a/drivers/thunderbolt/nhi_ops.c
+++ /dev/null
@@ -1,189 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * NHI specific operations
- *
- * Copyright (C) 2019, Intel Corporation
- * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
- */
-
-#include <linux/delay.h>
-#include <linux/suspend.h>
-
-#include "nhi.h"
-#include "nhi_regs.h"
-#include "tb.h"
-
-/* Ice Lake specific NHI operations */
-
-#define ICL_LC_MAILBOX_TIMEOUT	500 /* ms */
-
-static int check_for_device(struct device *dev, void *data)
-{
-	return tb_is_switch(dev);
-}
-
-static bool icl_nhi_is_device_connected(struct tb_nhi *nhi)
-{
-	struct tb *tb = dev_get_drvdata(nhi->dev);
-	int ret;
-
-	ret = device_for_each_child(&tb->root_switch->dev, NULL,
-				    check_for_device);
-	return ret > 0;
-}
-
-static int icl_nhi_force_power(struct tb_nhi *nhi, bool power)
-{
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
-	u32 vs_cap;
-
-	/*
-	 * The Thunderbolt host controller is present always in Ice Lake
-	 * but the firmware may not be loaded and running (depending
-	 * whether there is device connected and so on). Each time the
-	 * controller is used we need to "Force Power" it first and wait
-	 * for the firmware to indicate it is up and running. This "Force
-	 * Power" is really not about actually powering on/off the
-	 * controller so it is accessible even if "Force Power" is off.
-	 *
-	 * The actual power management happens inside shared ACPI power
-	 * resources using standard ACPI methods.
-	 */
-	pci_read_config_dword(pdev, VS_CAP_22, &vs_cap);
-	if (power) {
-		vs_cap &= ~VS_CAP_22_DMA_DELAY_MASK;
-		vs_cap |= 0x22 << VS_CAP_22_DMA_DELAY_SHIFT;
-		vs_cap |= VS_CAP_22_FORCE_POWER;
-	} else {
-		vs_cap &= ~VS_CAP_22_FORCE_POWER;
-	}
-	pci_write_config_dword(pdev, VS_CAP_22, vs_cap);
-
-	if (power) {
-		unsigned int retries = 350;
-		u32 val;
-
-		/* Wait until the firmware tells it is up and running */
-		do {
-			pci_read_config_dword(pdev, VS_CAP_9, &val);
-			if (val & VS_CAP_9_FW_READY)
-				return 0;
-			usleep_range(3000, 3100);
-		} while (--retries);
-
-		return -ETIMEDOUT;
-	}
-
-	return 0;
-}
-
-static void icl_nhi_lc_mailbox_cmd(struct tb_nhi *nhi, enum icl_lc_mailbox_cmd cmd)
-{
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
-	u32 data;
-
-	data = (cmd << VS_CAP_19_CMD_SHIFT) & VS_CAP_19_CMD_MASK;
-	pci_write_config_dword(pdev, VS_CAP_19, data | VS_CAP_19_VALID);
-}
-
-static int icl_nhi_lc_mailbox_cmd_complete(struct tb_nhi *nhi, int timeout)
-{
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
-	unsigned long end;
-	u32 data;
-
-	if (!timeout)
-		goto clear;
-
-	end = jiffies + msecs_to_jiffies(timeout);
-	do {
-		pci_read_config_dword(pdev, VS_CAP_18, &data);
-		if (data & VS_CAP_18_DONE)
-			goto clear;
-		usleep_range(1000, 1100);
-	} while (time_before(jiffies, end));
-
-	return -ETIMEDOUT;
-
-clear:
-	/* Clear the valid bit */
-	pci_write_config_dword(pdev, VS_CAP_19, 0);
-	return 0;
-}
-
-static void icl_nhi_set_ltr(struct tb_nhi *nhi)
-{
-	struct pci_dev *pdev = to_pci_dev(nhi->dev);
-	u32 max_ltr, ltr;
-
-	pci_read_config_dword(pdev, VS_CAP_16, &max_ltr);
-	max_ltr &= 0xffff;
-	/* Program the same value for both snoop and no-snoop */
-	ltr = max_ltr << 16 | max_ltr;
-	pci_write_config_dword(pdev, VS_CAP_15, ltr);
-}
-
-static int icl_nhi_suspend(struct tb_nhi *nhi)
-{
-	struct tb *tb = dev_get_drvdata(nhi->dev);
-	int ret;
-
-	if (icl_nhi_is_device_connected(nhi))
-		return 0;
-
-	if (tb_switch_is_icm(tb->root_switch)) {
-		/*
-		 * If there is no device connected we need to perform
-		 * both: a handshake through LC mailbox and force power
-		 * down before entering D3.
-		 */
-		icl_nhi_lc_mailbox_cmd(nhi, ICL_LC_PREPARE_FOR_RESET);
-		ret = icl_nhi_lc_mailbox_cmd_complete(nhi, ICL_LC_MAILBOX_TIMEOUT);
-		if (ret)
-			return ret;
-	}
-
-	return icl_nhi_force_power(nhi, false);
-}
-
-static int icl_nhi_suspend_noirq(struct tb_nhi *nhi, bool wakeup)
-{
-	struct tb *tb = dev_get_drvdata(nhi->dev);
-	enum icl_lc_mailbox_cmd cmd;
-
-	if (!pm_suspend_via_firmware())
-		return icl_nhi_suspend(nhi);
-
-	if (!tb_switch_is_icm(tb->root_switch))
-		return 0;
-
-	cmd = wakeup ? ICL_LC_GO2SX : ICL_LC_GO2SX_NO_WAKE;
-	icl_nhi_lc_mailbox_cmd(nhi, cmd);
-	return icl_nhi_lc_mailbox_cmd_complete(nhi, ICL_LC_MAILBOX_TIMEOUT);
-}
-
-static int icl_nhi_resume(struct tb_nhi *nhi)
-{
-	int ret;
-
-	ret = icl_nhi_force_power(nhi, true);
-	if (ret)
-		return ret;
-
-	icl_nhi_set_ltr(nhi);
-	return 0;
-}
-
-static void icl_nhi_shutdown(struct tb_nhi *nhi)
-{
-	icl_nhi_force_power(nhi, false);
-}
-
-const struct tb_nhi_ops icl_nhi_ops = {
-	.init = icl_nhi_resume,
-	.suspend_noirq = icl_nhi_suspend_noirq,
-	.resume_noirq = icl_nhi_resume,
-	.runtime_suspend = icl_nhi_suspend,
-	.runtime_resume = icl_nhi_resume,
-	.shutdown = icl_nhi_shutdown,
-};
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
new file mode 100644
index 000000000000..bbd186c29ef7
--- /dev/null
+++ b/drivers/thunderbolt/pci.c
@@ -0,0 +1,622 @@
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
+#include <linux/property.h>
+#include <linux/string_helpers.h>
+#include <linux/suspend.h>
+
+#include "nhi.h"
+#include "nhi_regs.h"
+#include "tb.h"
+
+/**
+ * struct tb_nhi_pci - NHI device connected over PCIe
+ * @nhi: NHI device
+ * @msix_ida: Used to allocate MSI-X vectors for rings
+ */
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
+static int nhi_pci_init_msi(struct tb_nhi *nhi)
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
+static void nhi_pci_start_dma_port(struct tb_nhi *nhi)
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
+static void nhi_pci_complete_dma_port(struct tb_nhi *nhi)
+{
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	struct pci_dev *root_port;
+
+	root_port = pcie_find_root_port(pdev);
+	if (root_port)
+		pm_runtime_put(&root_port->dev);
+}
+
+static int nhi_pci_ring_request_msix(struct tb_ring *ring, bool no_suspend)
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
+static void nhi_pci_ring_release_msix(struct tb_ring *ring)
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
+static void nhi_pci_shutdown(struct tb_nhi *nhi)
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
+static bool nhi_pci_is_present(struct tb_nhi *nhi)
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
+/* Ice Lake specific NHI operations */
+
+#define ICL_LC_MAILBOX_TIMEOUT	500 /* ms */
+
+static int check_for_device(struct device *dev, void *data)
+{
+	return tb_is_switch(dev);
+}
+
+static bool icl_nhi_is_device_connected(struct tb_nhi *nhi)
+{
+	struct tb *tb = dev_get_drvdata(nhi->dev);
+	int ret;
+
+	ret = device_for_each_child(&tb->root_switch->dev, NULL,
+				    check_for_device);
+	return ret > 0;
+}
+
+static int icl_nhi_force_power(struct tb_nhi *nhi, bool power)
+{
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	u32 vs_cap;
+
+	/*
+	 * The Thunderbolt host controller is present always in Ice Lake
+	 * but the firmware may not be loaded and running (depending
+	 * whether there is device connected and so on). Each time the
+	 * controller is used we need to "Force Power" it first and wait
+	 * for the firmware to indicate it is up and running. This "Force
+	 * Power" is really not about actually powering on/off the
+	 * controller so it is accessible even if "Force Power" is off.
+	 *
+	 * The actual power management happens inside shared ACPI power
+	 * resources using standard ACPI methods.
+	 */
+	pci_read_config_dword(pdev, VS_CAP_22, &vs_cap);
+	if (power) {
+		vs_cap &= ~VS_CAP_22_DMA_DELAY_MASK;
+		vs_cap |= 0x22 << VS_CAP_22_DMA_DELAY_SHIFT;
+		vs_cap |= VS_CAP_22_FORCE_POWER;
+	} else {
+		vs_cap &= ~VS_CAP_22_FORCE_POWER;
+	}
+	pci_write_config_dword(pdev, VS_CAP_22, vs_cap);
+
+	if (power) {
+		unsigned int retries = 350;
+		u32 val;
+
+		/* Wait until the firmware tells it is up and running */
+		do {
+			pci_read_config_dword(pdev, VS_CAP_9, &val);
+			if (val & VS_CAP_9_FW_READY)
+				return 0;
+			usleep_range(3000, 3100);
+		} while (--retries);
+
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void icl_nhi_lc_mailbox_cmd(struct tb_nhi *nhi, enum icl_lc_mailbox_cmd cmd)
+{
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	u32 data;
+
+	data = (cmd << VS_CAP_19_CMD_SHIFT) & VS_CAP_19_CMD_MASK;
+	pci_write_config_dword(pdev, VS_CAP_19, data | VS_CAP_19_VALID);
+}
+
+static int icl_nhi_lc_mailbox_cmd_complete(struct tb_nhi *nhi, int timeout)
+{
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	unsigned long end;
+	u32 data;
+
+	if (!timeout)
+		goto clear;
+
+	end = jiffies + msecs_to_jiffies(timeout);
+	do {
+		pci_read_config_dword(pdev, VS_CAP_18, &data);
+		if (data & VS_CAP_18_DONE)
+			goto clear;
+		usleep_range(1000, 1100);
+	} while (time_before(jiffies, end));
+
+	return -ETIMEDOUT;
+
+clear:
+	/* Clear the valid bit */
+	pci_write_config_dword(pdev, VS_CAP_19, 0);
+	return 0;
+}
+
+static void icl_nhi_set_ltr(struct tb_nhi *nhi)
+{
+	struct pci_dev *pdev = to_pci_dev(nhi->dev);
+	u32 max_ltr, ltr;
+
+	pci_read_config_dword(pdev, VS_CAP_16, &max_ltr);
+	max_ltr &= 0xffff;
+	/* Program the same value for both snoop and no-snoop */
+	ltr = max_ltr << 16 | max_ltr;
+	pci_write_config_dword(pdev, VS_CAP_15, ltr);
+}
+
+static int icl_nhi_suspend(struct tb_nhi *nhi)
+{
+	struct tb *tb = dev_get_drvdata(nhi->dev);
+	int ret;
+
+	if (icl_nhi_is_device_connected(nhi))
+		return 0;
+
+	if (tb_switch_is_icm(tb->root_switch)) {
+		/*
+		 * If there is no device connected we need to perform
+		 * both: a handshake through LC mailbox and force power
+		 * down before entering D3.
+		 */
+		icl_nhi_lc_mailbox_cmd(nhi, ICL_LC_PREPARE_FOR_RESET);
+		ret = icl_nhi_lc_mailbox_cmd_complete(nhi, ICL_LC_MAILBOX_TIMEOUT);
+		if (ret)
+			return ret;
+	}
+
+	return icl_nhi_force_power(nhi, false);
+}
+
+static int icl_nhi_suspend_noirq(struct tb_nhi *nhi, bool wakeup)
+{
+	struct tb *tb = dev_get_drvdata(nhi->dev);
+	enum icl_lc_mailbox_cmd cmd;
+
+	if (!pm_suspend_via_firmware())
+		return icl_nhi_suspend(nhi);
+
+	if (!tb_switch_is_icm(tb->root_switch))
+		return 0;
+
+	cmd = wakeup ? ICL_LC_GO2SX : ICL_LC_GO2SX_NO_WAKE;
+	icl_nhi_lc_mailbox_cmd(nhi, cmd);
+	return icl_nhi_lc_mailbox_cmd_complete(nhi, ICL_LC_MAILBOX_TIMEOUT);
+}
+
+static int icl_nhi_resume(struct tb_nhi *nhi)
+{
+	int ret;
+
+	ret = icl_nhi_force_power(nhi, true);
+	if (ret)
+		return ret;
+
+	icl_nhi_set_ltr(nhi);
+	return 0;
+}
+
+static void icl_nhi_shutdown(struct tb_nhi *nhi)
+{
+	nhi_pci_shutdown(nhi);
+
+	icl_nhi_force_power(nhi, false);
+}
+
+static const struct tb_nhi_ops icl_nhi_ops = {
+	.init = icl_nhi_resume,
+	.suspend_noirq = icl_nhi_suspend_noirq,
+	.resume_noirq = icl_nhi_resume,
+	.runtime_suspend = icl_nhi_suspend,
+	.runtime_resume = icl_nhi_resume,
+	.shutdown = icl_nhi_shutdown,
+	.pre_nvm_auth = nhi_pci_start_dma_port,
+	.post_nvm_auth = nhi_pci_complete_dma_port,
+	.request_ring_irq = nhi_pci_ring_request_msix,
+	.release_ring_irq = nhi_pci_ring_release_msix,
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
+	return nhi_probe(&nhi_pci->nhi);
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
+	wait_for_completion(&nhi->domain_released);
+	nhi_shutdown(nhi);
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
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 769b57ff276b..a29b9887cd6b 100644
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


