Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFB4160500
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 18:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbgBPR1M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 12:27:12 -0500
Received: from asav22.altibox.net ([109.247.116.9]:50816 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbgBPR1M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 12:27:12 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 5ED46200E9;
        Sun, 16 Feb 2020 18:21:39 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [RFC 2/9] mfd: Add driver for Multifunction USB Device
Date:   Sun, 16 Feb 2020 18:21:10 +0100
Message-Id: <20200216172117.49832-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZvHD1ezG c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10
        a=SJz97ENfAAAA:8 a=CUepv2jGAAAA:20 a=eErRC1Xa2moXgSPB7X0A:9
        a=ivkM6FztAEMVDUfN:21 a=V-uIEZzIEEd-kku2:21 a=QEXdDO2ut3YA:10
        a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A Multifunction USB Device is a device that supports functions like gpio
and display or any other function that can be represented as a USB regmap.
Interrupts over USB is also supported if such an endpoint is present.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/mfd/Kconfig     |   8 +
 drivers/mfd/Makefile    |   1 +
 drivers/mfd/mud.c       | 580 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mud.h |  16 ++
 4 files changed, 605 insertions(+)
 create mode 100644 drivers/mfd/mud.c
 create mode 100644 include/linux/mfd/mud.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 52818dbcfe1f..9950794d907e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1968,6 +1968,14 @@ config MFD_STMFX
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_MUD
+	tristate "Multifunction USB Device core driver"
+	depends on USB
+	select MFD_CORE
+	select REGMAP_USB
+	help
+	  Select this to get support for the Multifunction USB Device.
+
 menu "Multimedia Capabilities Port drivers"
 	depends on ARCH_SA1100
 
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 29e6767dd60c..0adfab9afaed 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -255,4 +255,5 @@ obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
 obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
 obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
 obj-$(CONFIG_MFD_RPISENSE_CORE)	+= rpisense-core.o
+obj-$(CONFIG_MFD_MUD)		+= mud.o
 
diff --git a/drivers/mfd/mud.c b/drivers/mfd/mud.c
new file mode 100644
index 000000000000..f5f31478656d
--- /dev/null
+++ b/drivers/mfd/mud.c
@@ -0,0 +1,580 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/bitmap.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/list.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/mud.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regmap_usb.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/usb.h>
+#include <linux/workqueue.h>
+
+/* Temporary debugging aid */
+#undef dev_dbg
+#define dev_dbg dev_info
+
+#define mdebug(fmt, ...)			\
+do {						\
+	if (1)					\
+		pr_debug(fmt, ##__VA_ARGS__);	\
+} while (0)
+
+struct mud_irq_event {
+	struct list_head node;
+	DECLARE_BITMAP(status, REGMAP_USB_MAX_MAPS);
+};
+
+struct mud_irq {
+	struct irq_domain *domain;
+	unsigned int num_irqs;
+
+	struct workqueue_struct	*workq;
+	struct work_struct work;
+	struct urb *urb;
+
+	spinlock_t lock; /* Protect the values below */
+	unsigned long *mask;
+	u16 tag;
+	struct list_head eventlist;
+
+	unsigned int stats_illegal;
+	unsigned int stats_already_seen;
+	unsigned int stats_lost;
+};
+
+struct mud_device {
+	struct usb_device *usb;
+	struct mud_irq *mirq;
+	struct mfd_cell *cells;
+	unsigned int num_cells;
+};
+
+static void mud_irq_work(struct work_struct *work)
+{
+	struct mud_irq *mirq = container_of(work, struct mud_irq, work);
+	struct mud_irq_event *event;
+	unsigned long n, flags;
+	unsigned int irq;
+
+	mdebug("%s: IN\n", __func__);
+
+	while (true) {
+		spin_lock_irqsave(&mirq->lock, flags);
+		event = list_first_entry_or_null(&mirq->eventlist, struct mud_irq_event, node);
+		if (event) {
+			list_del(&event->node);
+			mdebug("    status: %*pb\n", mirq->num_irqs, event->status);
+			bitmap_and(event->status, event->status, mirq->mask, mirq->num_irqs);
+		}
+		spin_unlock_irqrestore(&mirq->lock, flags);
+		if (!event)
+			break;
+
+		for_each_set_bit(n, event->status, mirq->num_irqs) {
+			irq = irq_find_mapping(mirq->domain, n);
+			mdebug("        n=%lu irq=%u\n", n, irq);
+			if (irq)
+				handle_nested_irq(irq);
+		}
+
+		kfree(event);
+	}
+
+	mdebug("%s: OUT\n", __func__);
+}
+
+#define BYTES_PER_LONG	(BITS_PER_LONG / BITS_PER_BYTE)
+
+static void mud_irq_queue(struct urb *urb)
+{
+	u8 *buf = urb->transfer_buffer + sizeof(u16);
+	struct mud_irq *mirq = urb->context;
+	struct device *dev = &urb->dev->dev;
+	struct mud_irq_event *event = NULL;
+	unsigned int i, tag, diff;
+	unsigned long flags;
+
+	if (urb->actual_length != urb->transfer_buffer_length) {
+		dev_err_once(dev, "Interrupt packet wrong length: %u\n",
+			     urb->actual_length);
+		mirq->stats_illegal++;
+		return;
+	}
+
+	spin_lock_irqsave(&mirq->lock, flags);
+
+	tag = le16_to_cpup(urb->transfer_buffer);
+	if (tag == mirq->tag) {
+		dev_dbg(dev, "Interrupt tag=%u already seen, ignoring\n", tag);
+		mirq->stats_already_seen++;
+		goto unlock;
+	}
+
+	if (tag > mirq->tag)
+		diff = tag - mirq->tag;
+	else
+		diff = U16_MAX - mirq->tag + tag + 1;
+
+	if (diff > 1) {
+		dev_err_once(dev, "Interrupts lost: %u\n", diff - 1);
+		mirq->stats_lost += diff - 1;
+	}
+
+	event = kzalloc(sizeof(*event), GFP_ATOMIC);
+	if (!event) {
+		mirq->stats_lost += 1;
+		goto unlock;
+	}
+
+	list_add_tail(&event->node, &mirq->eventlist);
+
+	for (i = 0; i < (urb->transfer_buffer_length - sizeof(u16)); i++) {
+		unsigned long *val = &event->status[i / BYTES_PER_LONG];
+		unsigned int mod = i % BYTES_PER_LONG;
+
+		if (!mod)
+			*val = buf[i];
+		else
+			*val |= ((unsigned long)buf[i]) << (mod * BITS_PER_BYTE);
+	}
+
+	mdebug("%s: tag=%u\n", __func__, tag);
+
+	mirq->tag = tag;
+unlock:
+	spin_unlock_irqrestore(&mirq->lock, flags);
+
+	if (event)
+		queue_work(mirq->workq, &mirq->work);
+}
+
+static void mud_irq_urb_completion(struct urb *urb)
+{
+	struct device *dev = &urb->dev->dev;
+	int ret;
+
+	mdebug("%s: actual_length=%u\n", __func__, urb->actual_length);
+
+	switch (urb->status) {
+	case 0:
+		mud_irq_queue(urb);
+		break;
+	case -EPROTO:	/* FIXME: verify: dwc2 reports this on disconnect */
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		dev_dbg(dev, "irq urb shutting down with status: %d\n", urb->status);
+		return;
+	default:
+		dev_dbg(dev, "irq urb failure with status: %d\n", urb->status);
+		break;
+	}
+
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret && ret != -ENODEV)
+		dev_err(dev, "irq usb_submit_urb failed with result %d\n", ret);
+}
+
+static void mud_irq_mask(struct irq_data *data)
+{
+	struct mud_irq *mirq = irq_data_get_irq_chip_data(data);
+	unsigned long flags;
+
+	mdebug("%s: hwirq=%lu\n", __func__, data->hwirq);
+
+	spin_lock_irqsave(&mirq->lock, flags);
+	clear_bit(data->hwirq, mirq->mask);
+	spin_unlock_irqrestore(&mirq->lock, flags);
+}
+
+static void mud_irq_unmask(struct irq_data *data)
+{
+	struct mud_irq *mirq = irq_data_get_irq_chip_data(data);
+	unsigned long flags;
+
+	mdebug("%s: hwirq=%lu\n", __func__, data->hwirq);
+
+	spin_lock_irqsave(&mirq->lock, flags);
+	set_bit(data->hwirq, mirq->mask);
+	spin_unlock_irqrestore(&mirq->lock, flags);
+}
+
+static struct irq_chip mud_irq_chip = {
+	.name			= "mud-irq",
+	.irq_mask		= mud_irq_mask,
+	.irq_unmask		= mud_irq_unmask,
+};
+
+static void __maybe_unused
+mud_irq_domain_debug_show(struct seq_file *m, struct irq_domain *d,
+			  struct irq_data *data, int ind)
+{
+	struct mud_irq *mirq = d ? d->host_data : irq_data_get_irq_chip_data(data);
+	unsigned long flags;
+
+	spin_lock_irqsave(&mirq->lock, flags);
+
+	seq_printf(m, "%*sTag:          %u\n", ind, "", mirq->tag);
+	seq_printf(m, "%*sIllegal:      %u\n", ind, "", mirq->stats_illegal);
+	seq_printf(m, "%*sAlready seen: %u\n", ind, "", mirq->stats_already_seen);
+	seq_printf(m, "%*sLost:         %u\n", ind, "", mirq->stats_lost);
+
+	spin_unlock_irqrestore(&mirq->lock, flags);
+}
+
+static int mud_irq_domain_map(struct irq_domain *d, unsigned int virq,
+			      irq_hw_number_t hwirq)
+{
+	irq_set_chip_data(virq, d->host_data);
+	irq_set_chip_and_handler(virq, &mud_irq_chip, handle_simple_irq);
+	irq_set_nested_thread(virq, true);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static void mud_irq_domain_unmap(struct irq_domain *d, unsigned int virq)
+{
+	irq_set_chip_and_handler(virq, NULL, NULL);
+	irq_set_chip_data(virq, NULL);
+}
+
+static const struct irq_domain_ops mud_irq_ops = {
+	.map		= mud_irq_domain_map,
+	.unmap		= mud_irq_domain_unmap,
+#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
+	.debug_show	= mud_irq_domain_debug_show,
+#endif
+};
+
+static int mud_irq_start(struct mud_irq *mirq)
+{
+	if (!mirq)
+		return 0;
+
+	return usb_submit_urb(mirq->urb, GFP_KERNEL);
+}
+
+static void mud_irq_stop(struct mud_irq *mirq)
+{
+	if (!mirq)
+		return;
+
+	usb_kill_urb(mirq->urb);
+	flush_work(&mirq->work);
+}
+
+static void mud_irq_release(struct mud_irq *mirq)
+{
+	if (!mirq)
+		return;
+
+	if (mirq->workq)
+		destroy_workqueue(mirq->workq);
+
+	if (mirq->domain) {
+		irq_hw_number_t hwirq;
+
+		for (hwirq = 0; hwirq < mirq->num_irqs; hwirq++)
+			irq_dispose_mapping(irq_find_mapping(mirq->domain, hwirq));
+
+		irq_domain_remove(mirq->domain);
+	}
+
+	usb_free_coherent(mirq->urb->dev, mirq->urb->transfer_buffer_length,
+			  mirq->urb->transfer_buffer, mirq->urb->transfer_dma);
+	usb_free_urb(mirq->urb);
+	bitmap_free(mirq->mask);
+	kfree(mirq);
+}
+
+static struct mud_irq *mud_irq_create(struct usb_interface *interface,
+				      unsigned int num_irqs)
+{
+	struct usb_device *usb = interface_to_usbdev(interface);
+	struct device *dev = &interface->dev;
+	struct usb_endpoint_descriptor *ep;
+	struct fwnode_handle *fn;
+	struct urb *urb = NULL;
+	struct mud_irq *mirq;
+	void *buf = NULL;
+	size_t buf_size;
+	int ret;
+
+	mdebug("%s: dev->id=%d\n", __func__, dev->id);
+
+	ret = usb_find_int_in_endpoint(interface->cur_altsetting, &ep);
+	if (ret == -ENXIO)
+		return NULL;
+	if (ret)
+		return ERR_PTR(ret);
+
+	mirq = kzalloc(sizeof(*mirq), GFP_KERNEL);
+	if (!mirq)
+		return ERR_PTR(-ENOMEM);
+
+	mirq->mask = bitmap_zalloc(num_irqs, GFP_KERNEL);
+	if (!mirq->mask) {
+		ret = -ENOMEM;
+		goto release;
+	}
+
+	spin_lock_init(&mirq->lock);
+	mirq->num_irqs = num_irqs;
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb) {
+		ret = -ENOMEM;
+		goto release;
+	}
+
+	buf_size = usb_endpoint_maxp(ep);
+	if (buf_size != (sizeof(u16) + DIV_ROUND_UP(num_irqs, BITS_PER_BYTE))) {
+		dev_err(dev, "Interrupt endpoint wMaxPacketSize too small: %zu\n", buf_size);
+		ret = -EINVAL;
+		goto release;
+	}
+
+	buf = usb_alloc_coherent(usb, buf_size, GFP_KERNEL, &urb->transfer_dma);
+	if (!buf) {
+		usb_free_urb(urb);
+		ret = -ENOMEM;
+		goto release;
+	}
+
+	usb_fill_int_urb(urb, usb,
+			 usb_rcvintpipe(usb, usb_endpoint_num(ep)),
+			 buf, buf_size, mud_irq_urb_completion,
+			 mirq, ep->bInterval);
+	urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+
+	mirq->urb = urb;
+
+	if (dev->of_node) {
+		fn = of_node_to_fwnode(dev->of_node);
+	} else {
+		fn = irq_domain_alloc_named_fwnode("mud-irq");
+		if (!fn) {
+			ret = -ENOMEM;
+			goto release;
+		}
+	}
+
+	mirq->domain = irq_domain_create_linear(fn, num_irqs, &mud_irq_ops, mirq);
+	if (!dev->of_node)
+		irq_domain_free_fwnode(fn);
+	if (!mirq->domain) {
+		ret = -ENOMEM;
+		goto release;
+	}
+
+	INIT_LIST_HEAD(&mirq->eventlist);
+	INIT_WORK(&mirq->work, mud_irq_work);
+
+	mirq->workq = alloc_workqueue("mud-irq/%s", WQ_HIGHPRI, 0, dev_name(dev));
+	if (!mirq->workq) {
+		ret = -ENOMEM;
+		goto release;
+	}
+
+	return mirq;
+
+release:
+	mud_irq_release(mirq);
+
+	return ERR_PTR(ret);
+}
+
+static int mud_probe_regmap(struct usb_interface *interface, struct mfd_cell *cell,
+			    unsigned int index, struct mud_irq *mirq)
+{
+	struct mud_cell_pdata *pdata;
+	struct resource *res = NULL;
+	int ret;
+
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	ret = regmap_usb_get_map_descriptor(interface, index, &pdata->desc);
+	if (ret)
+		goto error;
+
+	mdebug("%s: name='%s' index=%u\n", __func__, pdata->desc.name, index);
+	mdebug("    bRegisterValueBits=%u\n", pdata->desc.bRegisterValueBits);
+	mdebug("    bCompression=0x%02x\n", pdata->desc.bCompression);
+	mdebug("    bMaxTransferSizeOrder=%u (%ukB)\n",
+	       pdata->desc.bMaxTransferSizeOrder,
+	       (1 << pdata->desc.bMaxTransferSizeOrder) / 1024);
+
+	if (mirq) {
+		res = kzalloc(sizeof(*res), GFP_KERNEL);
+		if (!res) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		res->flags = IORESOURCE_IRQ;
+		res->start = irq_create_mapping(mirq->domain, index);
+		mdebug("    res->start=%u\n", (unsigned int)res->start);
+		res->end = res->start;
+
+		cell->resources = res;
+		cell->num_resources = 1;
+	}
+
+	pdata->interface = interface;
+	pdata->index = index;
+	cell->name = pdata->desc.name;
+	cell->platform_data = pdata;
+	cell->pdata_size = sizeof(*pdata);
+	/*
+	 * A Multifunction USB Device can have multiple functions of the same
+	 * type. mfd_add_device() in its current form will only match on the
+	 * first node in the Device Tree.
+	 */
+	cell->of_compatible = cell->name;
+
+	return 0;
+
+error:
+	kfree(res);
+	kfree(pdata);
+
+	return ret;
+}
+
+static void mud_free(struct mud_device *mud)
+{
+	unsigned int i;
+
+	mud_irq_release(mud->mirq);
+
+	for (i = 0; i < mud->num_cells; i++) {
+		kfree(mud->cells[i].platform_data);
+		kfree(mud->cells[i].resources);
+	}
+
+	kfree(mud->cells);
+	kfree(mud);
+}
+
+static int mud_probe(struct usb_interface *interface,
+		     const struct usb_device_id *id)
+{
+	struct device *dev = &interface->dev;
+	unsigned int i, num_regmaps;
+	struct mud_device *mud;
+	int ret;
+
+	mdebug("%s: interface->dev.of_node=%px usb->dev.of_node=%px",
+	       __func__, interface->dev.of_node,
+	       usb_get_dev(interface_to_usbdev(interface))->dev.of_node);
+
+	ret = regmap_usb_get_interface_descriptor(interface, &num_regmaps);
+	if (ret)
+		return ret;
+	if (!num_regmaps)
+		return -EINVAL;
+
+	mdebug("%s: num_regmaps=%u\n", __func__, num_regmaps);
+
+	mud = kzalloc(sizeof(*mud), GFP_KERNEL);
+	if (!mud)
+		return -ENOMEM;
+
+	mud->mirq = mud_irq_create(interface, num_regmaps);
+	if (IS_ERR(mud->mirq)) {
+		ret = PTR_ERR(mud->mirq);
+		goto err_free;
+	}
+
+	mud->num_cells = num_regmaps;
+	mud->cells = kcalloc(num_regmaps, sizeof(*mud->cells), GFP_KERNEL);
+	if (!mud->cells)
+		goto err_free;
+
+	for (i = 0; i < num_regmaps; i++) {
+		ret = mud_probe_regmap(interface, &mud->cells[i], i, mud->mirq);
+		if (ret) {
+			dev_err(dev, "Failed to probe regmap index %i (error %d)\n", i, ret);
+			goto err_free;
+		}
+	}
+
+	ret = mud_irq_start(mud->mirq);
+	if (ret) {
+		dev_err(dev, "Failed to start irq (error %d)\n", ret);
+		goto err_free;
+	}
+
+	ret = mfd_add_hotplug_devices(dev, mud->cells, mud->num_cells);
+	if (ret) {
+		dev_err(dev, "Failed to add mfd devices to core.");
+		goto err_stop;
+	}
+
+	mud->usb = usb_get_dev(interface_to_usbdev(interface));
+
+	usb_set_intfdata(interface, mud);
+
+	if (mud->usb->product)
+		dev_info(dev, "%s\n", mud->usb->product);
+
+	return 0;
+
+err_stop:
+	mud_irq_stop(mud->mirq);
+err_free:
+	mud_free(mud);
+
+	return ret;
+}
+
+static void mud_disconnect(struct usb_interface *interface)
+{
+	struct mud_device *mud = usb_get_intfdata(interface);
+
+	mfd_remove_devices(&interface->dev);
+	mud_irq_stop(mud->mirq);
+	usb_put_dev(mud->usb);
+	mud_free(mud);
+
+	dev_dbg(&interface->dev, "disconnected\n");
+}
+
+static const struct usb_device_id mud_table[] = {
+	/*
+	 * FIXME:
+	 * Apply for a proper pid: https://github.com/openmoko/openmoko-usb-oui
+	 *
+	 * Or maybe the Linux Foundation will provide one from their vendor id.
+	 */
+	{ USB_DEVICE_INTERFACE_CLASS(0x1d50, 0x6150, USB_CLASS_VENDOR_SPEC) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(usb, mud_table);
+
+static struct usb_driver mud_driver = {
+	.name		= "mud",
+	.probe		= mud_probe,
+	.disconnect	= mud_disconnect,
+	.id_table	= mud_table,
+};
+
+module_usb_driver(mud_driver);
+
+MODULE_DESCRIPTION("Generic USB Device mfd core driver");
+MODULE_AUTHOR("Noralf Trønnes <noralf@tronnes.org>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/mud.h b/include/linux/mfd/mud.h
new file mode 100644
index 000000000000..b2059fa57429
--- /dev/null
+++ b/include/linux/mfd/mud.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __LINUX_MUD_H
+#define __LINUX_MUD_H
+
+#include <linux/regmap_usb.h>
+
+struct usb_interface;
+
+struct mud_cell_pdata {
+	struct usb_interface *interface;
+	unsigned int index;
+	struct regmap_usb_map_descriptor desc;
+};
+
+#endif
-- 
2.23.0

