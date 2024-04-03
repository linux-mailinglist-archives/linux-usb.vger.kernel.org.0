Return-Path: <linux-usb+bounces-8837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 549118972CC
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 16:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 783E81C26832
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 14:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0114901F;
	Wed,  3 Apr 2024 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="N/CEnOBR"
X-Original-To: linux-usb@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01193139D17;
	Wed,  3 Apr 2024 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712155139; cv=none; b=KJD15nM4CLeEv4GfX+6myHV3r8lUklF+ey54AmxzFCOy06J6mcAzT0YaGGcKJwChU0OliAmSHhQHubBRQi/7cztdZF1xGpUTgfmIccAsJrp6ko2NK8XtQIpipnuX1A0ORzfkSll2kejJUeN6eFtZGt1Qhn3imDPDxg+rIew72/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712155139; c=relaxed/simple;
	bh=Qz1Kv96F0S0JnaSQ17n5MBJOM2ob1LFz4qOCvinczJw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=VEBBWjoZYvA7wF4oWM7/H2BnwKXI4LtPnqM79Nn7O09bL8NLzIcdU3wrGDsqUUJZVoan6y2My4emYt+yhsVFKkpQOiNiAXkiOF3dWQenhDeGoEMltdBzp+4BdCZX/ITigvfOCuvcEoKeI375J14ViYdY34/CbPDeCjmbhriuul4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=N/CEnOBR; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6BC8A20E8CAD;
	Wed,  3 Apr 2024 07:38:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6BC8A20E8CAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1712155136;
	bh=E3dw3WTaVaNHCq+WZPGaeGSaEsHMUBLKH8TWDpbPj1w=;
	h=From:To:Cc:Subject:Date:From;
	b=N/CEnOBRBy47QPNcZeXvaQAolQ9xRPVzEvn7+Lb8okFjNaS8JhNwRxT5CyMXv0cxq
	 nP7hcW9T8a8E1nH4KMdN2Qi/hSJiNuwSaz8yMbd1N/TQsNeQfMdvIeE+GGJROK/iTQ
	 lonMnQasa/CLsXvDH1Dtvdt0/eWSEl0T+HOdO/FA=
From: Allen Pais <apais@linux.microsoft.com>
To: linux-kernel@vger.kernel.org
Cc: tj@kernel.org,
	keescook@chromium.org,
	duncan.sands@free.fr,
	gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	mathias.nyman@intel.com,
	oneukum@suse.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] USB: Convert from tasklet to BH workqueue
Date: Wed,  3 Apr 2024 14:38:52 +0000
Message-Id: <20240403143852.13175-1-apais@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The only generic interface to execute asynchronously in the BH context is
tasklet; however, it's marked deprecated and has some design flaws. To
replace tasklets, BH workqueue support was recently added. A BH workqueue
behaves similarly to regular workqueues except that the queued work items
are executed in the BH context.

This patch converts drivers/usb/* from tasklet to BH workqueue.

Based on the work done by Tejun Heo <tj@kernel.org>
Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10

Changes in v2:
 - Update code comments and commit message.
	Suggested by Greg K h
 - Retain local variable name(hcd.c).
	Suggested by Alan Stern

Link to v1:https://lore.kernel.org/all/20240327160314.9982-1
-apais@linux.microsoft.com/T/#m2ec7868fbf102f1551ebe4c92d200848b94af3b1

Reviewed-by: Duncan Sands <duncan.sands@free.fr>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/usb/atm/usbatm.c            | 51 +++++++++++++++--------------
 drivers/usb/atm/usbatm.h            |  3 +-
 drivers/usb/core/hcd.c              |  4 +--
 drivers/usb/gadget/udc/fsl_qe_udc.c | 21 ++++++------
 drivers/usb/gadget/udc/fsl_qe_udc.h |  4 +--
 drivers/usb/host/ehci-sched.c       |  2 +-
 drivers/usb/host/fhci-hcd.c         |  3 +-
 drivers/usb/host/fhci-sched.c       | 10 +++---
 drivers/usb/host/fhci.h             |  5 +--
 drivers/usb/host/xhci-dbgcap.h      |  3 +-
 drivers/usb/host/xhci-dbgtty.c      | 15 +++++----
 include/linux/usb/cdc_ncm.h         |  2 +-
 include/linux/usb/usbnet.h          |  2 +-
 13 files changed, 65 insertions(+), 60 deletions(-)

diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 2da6615fbb6f..1467d09a98c0 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -68,6 +68,7 @@
 #include <linux/wait.h>
 #include <linux/kthread.h>
 #include <linux/ratelimit.h>
+#include <linux/workqueue.h>
 
 #ifdef VERBOSE_DEBUG
 static int usbatm_print_packet(struct usbatm_data *instance, const unsigned char *data, int len);
@@ -269,7 +270,7 @@ static void usbatm_complete(struct urb *urb)
 		/* throttle processing in case of an error */
 		mod_timer(&channel->delay, jiffies + msecs_to_jiffies(THROTTLE_MSECS));
 	} else
-		tasklet_schedule(&channel->tasklet);
+		queue_work(system_bh_wq, &channel->work);
 }
 
 
@@ -511,10 +512,10 @@ static unsigned int usbatm_write_cells(struct usbatm_data *instance,
 **  receive  **
 **************/
 
-static void usbatm_rx_process(struct tasklet_struct *t)
+static void usbatm_rx_process(struct work_struct *t)
 {
-	struct usbatm_data *instance = from_tasklet(instance, t,
-						    rx_channel.tasklet);
+	struct usbatm_data *instance = from_work(instance, t,
+						    rx_channel.work);
 	struct urb *urb;
 
 	while ((urb = usbatm_pop_urb(&instance->rx_channel))) {
@@ -565,10 +566,10 @@ static void usbatm_rx_process(struct tasklet_struct *t)
 **  send  **
 ***********/
 
-static void usbatm_tx_process(struct tasklet_struct *t)
+static void usbatm_tx_process(struct work_struct *t)
 {
-	struct usbatm_data *instance = from_tasklet(instance, t,
-						    tx_channel.tasklet);
+	struct usbatm_data *instance = from_work(instance, t,
+						    tx_channel.work);
 	struct sk_buff *skb = instance->current_skb;
 	struct urb *urb = NULL;
 	const unsigned int buf_size = instance->tx_channel.buf_size;
@@ -632,13 +633,13 @@ static void usbatm_cancel_send(struct usbatm_data *instance,
 	}
 	spin_unlock_irq(&instance->sndqueue.lock);
 
-	tasklet_disable(&instance->tx_channel.tasklet);
+	disable_work_sync(&instance->tx_channel.work);
 	if ((skb = instance->current_skb) && (UDSL_SKB(skb)->atm.vcc == vcc)) {
 		atm_dbg(instance, "%s: popping current skb (0x%p)\n", __func__, skb);
 		instance->current_skb = NULL;
 		usbatm_pop(vcc, skb);
 	}
-	tasklet_enable(&instance->tx_channel.tasklet);
+	enable_and_queue_work(system_bh_wq, &instance->tx_channel.work);
 }
 
 static int usbatm_atm_send(struct atm_vcc *vcc, struct sk_buff *skb)
@@ -677,7 +678,7 @@ static int usbatm_atm_send(struct atm_vcc *vcc, struct sk_buff *skb)
 	ctrl->crc = crc32_be(~0, skb->data, skb->len);
 
 	skb_queue_tail(&instance->sndqueue, skb);
-	tasklet_schedule(&instance->tx_channel.tasklet);
+	queue_work(system_bh_wq, &instance->tx_channel.work);
 
 	return 0;
 
@@ -695,8 +696,8 @@ static void usbatm_destroy_instance(struct kref *kref)
 {
 	struct usbatm_data *instance = container_of(kref, struct usbatm_data, refcount);
 
-	tasklet_kill(&instance->rx_channel.tasklet);
-	tasklet_kill(&instance->tx_channel.tasklet);
+	cancel_work_sync(&instance->rx_channel.work);
+	cancel_work_sync(&instance->tx_channel.work);
 	usb_put_dev(instance->usb_dev);
 	kfree(instance);
 }
@@ -823,12 +824,12 @@ static int usbatm_atm_open(struct atm_vcc *vcc)
 
 	vcc->dev_data = new;
 
-	tasklet_disable(&instance->rx_channel.tasklet);
+	disable_work_sync(&instance->rx_channel.work);
 	instance->cached_vcc = new;
 	instance->cached_vpi = vpi;
 	instance->cached_vci = vci;
 	list_add(&new->list, &instance->vcc_list);
-	tasklet_enable(&instance->rx_channel.tasklet);
+	enable_and_queue_work(system_bh_wq, &instance->rx_channel.work);
 
 	set_bit(ATM_VF_ADDR, &vcc->flags);
 	set_bit(ATM_VF_PARTIAL, &vcc->flags);
@@ -858,14 +859,14 @@ static void usbatm_atm_close(struct atm_vcc *vcc)
 
 	mutex_lock(&instance->serialize);	/* vs self, usbatm_atm_open, usbatm_usb_disconnect */
 
-	tasklet_disable(&instance->rx_channel.tasklet);
+	disable_work_sync(&instance->rx_channel.work);
 	if (instance->cached_vcc == vcc_data) {
 		instance->cached_vcc = NULL;
 		instance->cached_vpi = ATM_VPI_UNSPEC;
 		instance->cached_vci = ATM_VCI_UNSPEC;
 	}
 	list_del(&vcc_data->list);
-	tasklet_enable(&instance->rx_channel.tasklet);
+	enable_and_queue_work(system_bh_wq, &instance->rx_channel.work);
 
 	kfree_skb(vcc_data->sarb);
 	vcc_data->sarb = NULL;
@@ -991,18 +992,18 @@ static int usbatm_heavy_init(struct usbatm_data *instance)
 	return 0;
 }
 
-static void usbatm_tasklet_schedule(struct timer_list *t)
+static void usbatm_queue_work(system_bh_wq, struct timer_list *t)
 {
 	struct usbatm_channel *channel = from_timer(channel, t, delay);
 
-	tasklet_schedule(&channel->tasklet);
+	queue_work(system_bh_wq, &channel->work);
 }
 
 static void usbatm_init_channel(struct usbatm_channel *channel)
 {
 	spin_lock_init(&channel->lock);
 	INIT_LIST_HEAD(&channel->list);
-	timer_setup(&channel->delay, usbatm_tasklet_schedule, 0);
+	timer_setup(&channel->delay, usbatm_queue_work, 0);
 }
 
 int usbatm_usb_probe(struct usb_interface *intf, const struct usb_device_id *id,
@@ -1074,8 +1075,8 @@ int usbatm_usb_probe(struct usb_interface *intf, const struct usb_device_id *id,
 
 	usbatm_init_channel(&instance->rx_channel);
 	usbatm_init_channel(&instance->tx_channel);
-	tasklet_setup(&instance->rx_channel.tasklet, usbatm_rx_process);
-	tasklet_setup(&instance->tx_channel.tasklet, usbatm_tx_process);
+	INIT_WORK(&instance->rx_channel.work, usbatm_rx_process);
+	INIT_WORK(&instance->tx_channel.work, usbatm_tx_process);
 	instance->rx_channel.stride = ATM_CELL_SIZE + driver->rx_padding;
 	instance->tx_channel.stride = ATM_CELL_SIZE + driver->tx_padding;
 	instance->rx_channel.usbatm = instance->tx_channel.usbatm = instance;
@@ -1231,8 +1232,8 @@ void usbatm_usb_disconnect(struct usb_interface *intf)
 		vcc_release_async(vcc_data->vcc, -EPIPE);
 	mutex_unlock(&instance->serialize);
 
-	tasklet_disable(&instance->rx_channel.tasklet);
-	tasklet_disable(&instance->tx_channel.tasklet);
+	disable_work_sync(&instance->rx_channel.work);
+	disable_work_sync(&instance->tx_channel.work);
 
 	for (i = 0; i < num_rcv_urbs + num_snd_urbs; i++)
 		usb_kill_urb(instance->urbs[i]);
@@ -1245,8 +1246,8 @@ void usbatm_usb_disconnect(struct usb_interface *intf)
 	INIT_LIST_HEAD(&instance->rx_channel.list);
 	INIT_LIST_HEAD(&instance->tx_channel.list);
 
-	tasklet_enable(&instance->rx_channel.tasklet);
-	tasklet_enable(&instance->tx_channel.tasklet);
+	enable_and_queue_work(system_bh_wq, &instance->rx_channel.work);
+	enable_and_queue_work(system_bh_wq, &instance->tx_channel.work);
 
 	if (instance->atm_dev && instance->driver->atm_stop)
 		instance->driver->atm_stop(instance, instance->atm_dev);
diff --git a/drivers/usb/atm/usbatm.h b/drivers/usb/atm/usbatm.h
index d96658e2e209..3452f8c2e1e5 100644
--- a/drivers/usb/atm/usbatm.h
+++ b/drivers/usb/atm/usbatm.h
@@ -21,6 +21,7 @@
 #include <linux/usb.h>
 #include <linux/mutex.h>
 #include <linux/ratelimit.h>
+#include <linux/workqueue.h>
 
 /*
 #define VERBOSE_DEBUG
@@ -109,7 +110,7 @@ struct usbatm_channel {
 	unsigned int packet_size;	/* endpoint maxpacket */
 	spinlock_t lock;
 	struct list_head list;
-	struct tasklet_struct tasklet;
+	struct work_struct work;
 	struct timer_list delay;
 	struct usbatm_data *usbatm;
 };
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index c0e005670d67..b31d84b02055 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -37,6 +37,7 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/otg.h>
+#include <linux/workqueue.h>
 
 #include "usb.h"
 #include "phy.h"
@@ -1664,8 +1665,7 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 
 static void usb_giveback_urb_bh(struct work_struct *work)
 {
-	struct giveback_urb_bh *bh =
-		container_of(work, struct giveback_urb_bh, bh);
+	struct giveback_urb_bh *bh = from_work(bh, work, bh);
 	struct list_head local_list;
 
 	spin_lock_irq(&bh->lock);
diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 4e88681a79b6..ae29d946a972 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -35,6 +35,7 @@
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg.h>
+#include <linux/workqueue.h>
 #include <soc/fsl/qe/qe.h>
 #include <asm/cpm.h>
 #include <asm/dma.h>
@@ -930,9 +931,9 @@ static int qe_ep_rxframe_handle(struct qe_ep *ep)
 	return 0;
 }
 
-static void ep_rx_tasklet(struct tasklet_struct *t)
+static void ep_rx_work(struct work_struct *t)
 {
-	struct qe_udc *udc = from_tasklet(udc, t, rx_tasklet);
+	struct qe_udc *udc = from_work(udc, t, rx_work);
 	struct qe_ep *ep;
 	struct qe_frame *pframe;
 	struct qe_bd __iomem *bd;
@@ -945,9 +946,9 @@ static void ep_rx_tasklet(struct tasklet_struct *t)
 	for (i = 1; i < USB_MAX_ENDPOINTS; i++) {
 		ep = &udc->eps[i];
 
-		if (ep->dir == USB_DIR_IN || ep->enable_tasklet == 0) {
+		if (ep->dir == USB_DIR_IN || ep->enable_work == 0) {
 			dev_dbg(udc->dev,
-				"This is a transmit ep or disable tasklet!\n");
+				"This is a transmit ep or disable work!\n");
 			continue;
 		}
 
@@ -1012,7 +1013,7 @@ static void ep_rx_tasklet(struct tasklet_struct *t)
 		if (ep->localnack)
 			ep_recycle_rxbds(ep);
 
-		ep->enable_tasklet = 0;
+		ep->enable_work = 0;
 	} /* for i=1 */
 
 	spin_unlock_irqrestore(&udc->lock, flags);
@@ -1057,8 +1058,8 @@ static int qe_ep_rx(struct qe_ep *ep)
 		return 0;
 	}
 
-	tasklet_schedule(&udc->rx_tasklet);
-	ep->enable_tasklet = 1;
+	queue_work(system_bh_wq, &udc->rx_work);
+	ep->enable_work = 1;
 
 	return 0;
 }
@@ -2559,7 +2560,7 @@ static int qe_udc_probe(struct platform_device *ofdev)
 					DMA_TO_DEVICE);
 	}
 
-	tasklet_setup(&udc->rx_tasklet, ep_rx_tasklet);
+	INIT_WORK(&udc->rx_work, ep_rx_work);
 	/* request irq and disable DR  */
 	udc->usb_irq = irq_of_parse_and_map(np, 0);
 	if (!udc->usb_irq) {
@@ -2636,7 +2637,7 @@ static void qe_udc_remove(struct platform_device *ofdev)
 	usb_del_gadget_udc(&udc->gadget);
 
 	udc->done = &done;
-	tasklet_disable(&udc->rx_tasklet);
+	disable_work_sync(&udc->rx_work);
 
 	if (udc->nullmap) {
 		dma_unmap_single(udc->gadget.dev.parent,
@@ -2671,7 +2672,7 @@ static void qe_udc_remove(struct platform_device *ofdev)
 	free_irq(udc->usb_irq, udc);
 	irq_dispose_mapping(udc->usb_irq);
 
-	tasklet_kill(&udc->rx_tasklet);
+	cancel_work_sync(&udc->rx_work);
 
 	iounmap(udc->usb_regs);
 
diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.h b/drivers/usb/gadget/udc/fsl_qe_udc.h
index 53ca0ff7c2cb..1de87c318460 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.h
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.h
@@ -293,7 +293,7 @@ struct qe_ep {
 	u8 init;
 
 	u8 already_seen;
-	u8 enable_tasklet;
+	u8 enable_work;
 	u8 setup_stage;
 	u32 last_io;            /* timestamp */
 
@@ -353,7 +353,7 @@ struct qe_udc {
 	unsigned int usb_irq;
 	struct usb_ctlr __iomem *usb_regs;
 
-	struct tasklet_struct rx_tasklet;
+	struct work_struct rx_work;
 
 	struct completion *done;	/* to make sure release() is done */
 };
diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
index 7e834587e7de..54f3bd6298e6 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -682,7 +682,7 @@ static void start_unlink_intr(struct ehci_hcd *ehci, struct ehci_qh *qh)
 
 /*
  * It is common only one intr URB is scheduled on one qh, and
- * given complete() is run in tasklet context, introduce a bit
+ * given complete() is run in task context, introduce a bit
  * delay to avoid unlink qh too early.
  */
 static void start_unlink_intr_wait(struct ehci_hcd *ehci,
diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 9a1b5224f239..5358bb688acb 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -211,8 +211,7 @@ static int fhci_mem_init(struct fhci_hcd *fhci)
 	INIT_LIST_HEAD(&fhci->empty_tds);
 
 	/* initialize work queue to handle done list */
-	fhci_tasklet.data = (unsigned long)fhci;
-	fhci->process_done_task = &fhci_tasklet;
+	INIT_WORK(&fhci->process_done_task, process_done_list);
 
 	for (i = 0; i < MAX_TDS; i++) {
 		struct td *td;
diff --git a/drivers/usb/host/fhci-sched.c b/drivers/usb/host/fhci-sched.c
index a45ede80edfc..9033cce28014 100644
--- a/drivers/usb/host/fhci-sched.c
+++ b/drivers/usb/host/fhci-sched.c
@@ -628,13 +628,13 @@ irqreturn_t fhci_irq(struct usb_hcd *hcd)
  * is process_del_list(),which unlinks URBs by scanning EDs,instead of scanning
  * the (re-reversed) done list as this does.
  */
-static void process_done_list(unsigned long data)
+static void process_done_list(struct work_struct *t)
 {
 	struct urb *urb;
 	struct ed *ed;
 	struct td *td;
 	struct urb_priv *urb_priv;
-	struct fhci_hcd *fhci = (struct fhci_hcd *)data;
+	struct fhci_hcd *fhci = from_work(fhci, t, process_done_task);
 
 	disable_irq(fhci->timer->irq);
 	disable_irq(fhci_to_hcd(fhci)->irq);
@@ -677,13 +677,13 @@ static void process_done_list(unsigned long data)
 	enable_irq(fhci_to_hcd(fhci)->irq);
 }
 
-DECLARE_TASKLET_OLD(fhci_tasklet, process_done_list);
+DECLARE_WORK(fhci_work, process_done_list);
 
 /* transfer complted callback */
 u32 fhci_transfer_confirm_callback(struct fhci_hcd *fhci)
 {
-	if (!fhci->process_done_task->state)
-		tasklet_schedule(fhci->process_done_task);
+	if (!fhci->process_done_task)
+		queue_work(system_bh_wq, fhci->process_done_task);
 	return 0;
 }
 
diff --git a/drivers/usb/host/fhci.h b/drivers/usb/host/fhci.h
index 1f57b0989485..7cd613762249 100644
--- a/drivers/usb/host/fhci.h
+++ b/drivers/usb/host/fhci.h
@@ -24,6 +24,7 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/gpio/consumer.h>
+#include <linux/workqueue.h>
 #include <soc/fsl/qe/qe.h>
 #include <soc/fsl/qe/immap_qe.h>
 
@@ -254,7 +255,7 @@ struct fhci_hcd {
 	struct virtual_root_hub *vroot_hub; /* the virtual root hub */
 	int active_urbs;
 	struct fhci_controller_list *hc_list;
-	struct tasklet_struct *process_done_task; /* tasklet for done list */
+	struct work_struct *process_done_task; /* work for done list */
 
 	struct list_head empty_eds;
 	struct list_head empty_tds;
@@ -549,7 +550,7 @@ void fhci_init_ep_registers(struct fhci_usb *usb,
 void fhci_ep0_free(struct fhci_usb *usb);
 
 /* fhci-sched.c */
-extern struct tasklet_struct fhci_tasklet;
+extern struct work_struct fhci_work;
 void fhci_transaction_confirm(struct fhci_usb *usb, struct packet *pkt);
 void fhci_flush_all_transmissions(struct fhci_usb *usb);
 void fhci_schedule_transactions(struct fhci_usb *usb);
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 92661b555c2a..0cd57c479fd7 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -11,6 +11,7 @@
 
 #include <linux/tty.h>
 #include <linux/kfifo.h>
+#include <linux/workqueue.h>
 
 struct dbc_regs {
 	__le32	capability;
@@ -107,7 +108,7 @@ struct dbc_port {
 	struct list_head		read_pool;
 	struct list_head		read_queue;
 	unsigned int			n_read;
-	struct tasklet_struct		push;
+	struct work_struct		push;
 
 	struct list_head		write_pool;
 	struct kfifo			write_fifo;
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index b74e98e94393..dec2280b4ae9 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -11,6 +11,7 @@
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/idr.h>
+#include <linux/workqueue.h>
 
 #include "xhci.h"
 #include "xhci-dbgcap.h"
@@ -108,7 +109,7 @@ dbc_read_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 
 	spin_lock_irqsave(&port->port_lock, flags);
 	list_add_tail(&req->list_pool, &port->read_queue);
-	tasklet_schedule(&port->push);
+	queue_work(system_bh_wq, &port->push);
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
 
@@ -278,7 +279,7 @@ static void dbc_tty_unthrottle(struct tty_struct *tty)
 	unsigned long		flags;
 
 	spin_lock_irqsave(&port->port_lock, flags);
-	tasklet_schedule(&port->push);
+	queue_work(system_bh_wq, &port->push);
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
 
@@ -294,14 +295,14 @@ static const struct tty_operations dbc_tty_ops = {
 	.unthrottle		= dbc_tty_unthrottle,
 };
 
-static void dbc_rx_push(struct tasklet_struct *t)
+static void dbc_rx_push(struct work_struct *t)
 {
 	struct dbc_request	*req;
 	struct tty_struct	*tty;
 	unsigned long		flags;
 	bool			do_push = false;
 	bool			disconnect = false;
-	struct dbc_port		*port = from_tasklet(port, t, push);
+	struct dbc_port		*port = from_work(port, t, push);
 	struct list_head	*queue = &port->read_queue;
 
 	spin_lock_irqsave(&port->port_lock, flags);
@@ -355,7 +356,7 @@ static void dbc_rx_push(struct tasklet_struct *t)
 	if (!list_empty(queue) && tty) {
 		if (!tty_throttled(tty)) {
 			if (do_push)
-				tasklet_schedule(&port->push);
+				queue_work(system_bh_wq, &port->push);
 			else
 				pr_warn("ttyDBC0: RX not scheduled?\n");
 		}
@@ -388,7 +389,7 @@ xhci_dbc_tty_init_port(struct xhci_dbc *dbc, struct dbc_port *port)
 {
 	tty_port_init(&port->port);
 	spin_lock_init(&port->port_lock);
-	tasklet_setup(&port->push, dbc_rx_push);
+	INIT_WORK(&port->push, dbc_rx_push);
 	INIT_LIST_HEAD(&port->read_pool);
 	INIT_LIST_HEAD(&port->read_queue);
 	INIT_LIST_HEAD(&port->write_pool);
@@ -400,7 +401,7 @@ xhci_dbc_tty_init_port(struct xhci_dbc *dbc, struct dbc_port *port)
 static void
 xhci_dbc_tty_exit_port(struct dbc_port *port)
 {
-	tasklet_kill(&port->push);
+	cancel_work_sync(&port->push);
 	tty_port_destroy(&port->port);
 }
 
diff --git a/include/linux/usb/cdc_ncm.h b/include/linux/usb/cdc_ncm.h
index 2d207cb4837d..8775580852f9 100644
--- a/include/linux/usb/cdc_ncm.h
+++ b/include/linux/usb/cdc_ncm.h
@@ -96,7 +96,7 @@
 struct cdc_ncm_ctx {
 	struct usb_cdc_ncm_ntb_parameters ncm_parm;
 	struct hrtimer tx_timer;
-	struct tasklet_struct bh;
+	struct work_struct bh;
 
 	struct usbnet *dev;
 
diff --git a/include/linux/usb/usbnet.h b/include/linux/usb/usbnet.h
index 9f08a584d707..522c533a966b 100644
--- a/include/linux/usb/usbnet.h
+++ b/include/linux/usb/usbnet.h
@@ -58,7 +58,7 @@ struct usbnet {
 	unsigned		interrupt_count;
 	struct mutex		interrupt_mutex;
 	struct usb_anchor	deferred;
-	struct tasklet_struct	bh;
+	struct work_struct	bh;
 
 	struct work_struct	kevent;
 	unsigned long		flags;
-- 
2.17.1


