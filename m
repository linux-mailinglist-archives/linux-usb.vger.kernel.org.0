Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2EF8160504
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 18:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbgBPR1R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 12:27:17 -0500
Received: from asav22.altibox.net ([109.247.116.9]:50682 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbgBPR1R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 12:27:17 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id B3E83200EC;
        Sun, 16 Feb 2020 18:21:39 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [RFC 3/9] usb: gadget: function: Add Multifunction USB Device support
Date:   Sun, 16 Feb 2020 18:21:11 +0100
Message-Id: <20200216172117.49832-4-noralf@tronnes.org>
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
        a=SJz97ENfAAAA:8 a=9iXY35lkYcQ8TEz7kwIA:9 a=S4O_JTp8qcaCKkJR:21
        a=v5tXeCps66gWD8CS:21 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is the gadget side of the mfd host driver. It provides a USB
function that drivers can hook into providing functions like gpio and
display as regmaps to the host. These drivers are configured through
configfs.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/usb/gadget/Kconfig               |  10 +
 drivers/usb/gadget/function/Makefile     |   2 +
 drivers/usb/gadget/function/f_mud.c      | 913 ++++++++++++++++++++++
 drivers/usb/gadget/function/f_mud.h      | 210 +++++
 drivers/usb/gadget/function/mud_regmap.c | 936 +++++++++++++++++++++++
 5 files changed, 2071 insertions(+)
 create mode 100644 drivers/usb/gadget/function/f_mud.c
 create mode 100644 drivers/usb/gadget/function/f_mud.h
 create mode 100644 drivers/usb/gadget/function/mud_regmap.c

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 02ff850278b1..9551876ffe08 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -216,6 +216,9 @@ config USB_F_PRINTER
 config USB_F_TCM
 	tristate
 
+config USB_F_MUD
+	tristate
+
 # this first set of drivers all depend on bulk-capable hardware.
 
 config USB_CONFIGFS
@@ -483,6 +486,13 @@ config USB_CONFIGFS_F_TCM
 	  Both protocols can work on USB2.0 and USB3.0.
 	  UAS utilizes the USB 3.0 feature called streams support.
 
+menuconfig USB_CONFIGFS_F_MUD
+	bool "Multifunction USB Device"
+	depends on USB_CONFIGFS
+	select USB_F_MUD
+	help
+	  Core support for the Multifunction USB Device.
+
 choice
 	tristate "USB Gadget precomposed configurations"
 	default USB_ETH
diff --git a/drivers/usb/gadget/function/Makefile b/drivers/usb/gadget/function/Makefile
index 5d3a6cf02218..b6e31b511521 100644
--- a/drivers/usb/gadget/function/Makefile
+++ b/drivers/usb/gadget/function/Makefile
@@ -50,3 +50,5 @@ usb_f_printer-y			:= f_printer.o
 obj-$(CONFIG_USB_F_PRINTER)	+= usb_f_printer.o
 usb_f_tcm-y			:= f_tcm.o
 obj-$(CONFIG_USB_F_TCM)		+= usb_f_tcm.o
+usb_f_mud-y			:= f_mud.o mud_regmap.o
+obj-$(CONFIG_USB_F_MUD)		+= usb_f_mud.o
diff --git a/drivers/usb/gadget/function/f_mud.c b/drivers/usb/gadget/function/f_mud.c
new file mode 100644
index 000000000000..b15a571d2e5d
--- /dev/null
+++ b/drivers/usb/gadget/function/f_mud.c
@@ -0,0 +1,913 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Noralf Trønnes
+ */
+
+#include <linux/configfs.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/regmap_usb.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/usb/composite.h>
+#include <linux/usb/gadget.h>
+
+#include "f_mud.h"
+
+/**
+ * DOC: overview
+ *
+ * f_mud is the device side counterpart to drivers/mfd/mud.
+ * It combines the regmap and mfd cell abstraction on the host side into one cell
+ * driver on the device side: @f_mud_cell_ops. The reason for not using the
+ * regmap library here is so drivers can do compression directly with their own
+ * buffers without going through a temporary buffer.
+ */
+
+/* Temporary debugging aid */
+static unsigned int debug = 8;
+
+#define fmdebug(level, fmt, ...)		\
+do {						\
+	if ((level) <= debug)			\
+		pr_debug(fmt, ##__VA_ARGS__);	\
+} while (0)
+
+struct f_mud {
+	struct usb_function func;
+	u8 interface_id;
+	struct mud_regmap *mreg;
+
+	struct f_mud_cell **cells;
+	unsigned int num_cells;
+
+	int interrupt_interval_ms;
+
+	spinlock_t irq_lock;
+	bool irq_enabled;
+	struct usb_ep *irq_ep;
+	struct usb_request *irq_req;
+	u16 int_tag;
+	unsigned long *irq_status;
+	bool irq_queued;
+};
+
+static inline struct f_mud *func_to_f_mud(struct usb_function *f)
+{
+	return container_of(f, struct f_mud, func);
+}
+
+struct f_mud_opts {
+	struct usb_function_instance func_inst;
+	struct mutex lock;
+	int refcnt;
+
+	int interrupt_interval_ms;
+
+	struct list_head cells;
+};
+
+static inline struct f_mud_opts *ci_to_f_mud_opts(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct f_mud_opts,
+			    func_inst.group);
+}
+
+static DEFINE_MUTEX(f_mud_cell_ops_list_mutex);
+static LIST_HEAD(f_mud_cell_ops_list);
+
+struct f_mud_cell_ops_list_item {
+	struct list_head list;
+	const struct f_mud_cell_ops *ops;
+	unsigned int refcnt;
+};
+
+static struct f_mud_cell_ops_list_item *f_mud_cell_item_lookup(const char *name)
+{
+	struct f_mud_cell_ops_list_item *item;
+
+	list_for_each_entry(item, &f_mud_cell_ops_list, list) {
+		if (!strcmp(name, item->ops->name))
+			return item;
+	}
+
+	return NULL;
+}
+
+/**
+ * f_mud_cell_register() - Register a cell driver
+ * @ops: Cell operations structure
+ *
+ * This function registers a cell driver for use in a gadget.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int f_mud_cell_register(const struct f_mud_cell_ops *ops)
+{
+	struct f_mud_cell_ops_list_item *item;
+	int ret = 0;
+
+	fmdebug(1, "%s: name=%s\n", __func__, ops->name);
+
+	mutex_lock(&f_mud_cell_ops_list_mutex);
+
+	item = f_mud_cell_item_lookup(ops->name);
+	if (item) {
+		pr_err("%s: '%s' is already registered\n", __func__, ops->name);
+		ret = -EEXIST;
+		goto out;
+	}
+
+	item = kzalloc(sizeof(*item), GFP_KERNEL);
+	if (!item) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	item->ops = ops;
+	INIT_LIST_HEAD(&item->list);
+	list_add(&item->list, &f_mud_cell_ops_list);
+out:
+	mutex_unlock(&f_mud_cell_ops_list_mutex);
+
+	fmdebug(1, "%s: ret=%d\n", __func__, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL(f_mud_cell_register);
+
+/**
+ * f_mud_cell_unregister() - Unregister a cell driver
+ * @ops: Cell operations structure
+ *
+ * This function unregisters a cell driver.
+ */
+void f_mud_cell_unregister(const struct f_mud_cell_ops *ops)
+{
+	struct f_mud_cell_ops_list_item *item;
+
+	fmdebug(1, "%s: name=%s\n", __func__, ops->name);
+
+	mutex_lock(&f_mud_cell_ops_list_mutex);
+
+	item = f_mud_cell_item_lookup(ops->name);
+	if (item) {
+		list_del(&item->list);
+		if (item->refcnt)
+			kfree(item);
+		else
+			pr_err("%s: Can't unregister '%s' (refcnt=%u)\n", __func__, ops->name, item->refcnt);
+	} else {
+		pr_err("%s: Didn't find '%s'\n", __func__, ops->name);
+	}
+
+	mutex_unlock(&f_mud_cell_ops_list_mutex);
+}
+EXPORT_SYMBOL(f_mud_cell_unregister);
+
+static const struct f_mud_cell_ops *f_mud_cell_get(const char *name)
+{
+	const struct f_mud_cell_ops *ops = NULL;
+	struct f_mud_cell_ops_list_item *item;
+	char module_name[MODULE_NAME_LEN];
+	bool retried = false;
+
+	fmdebug(1, "%s: name=%s\n", __func__, name);
+retry:
+	mutex_lock(&f_mud_cell_ops_list_mutex);
+	item = f_mud_cell_item_lookup(name);
+	fmdebug(1, "%s: item=%px\n", __func__, item);
+	if (!item) {
+		mutex_unlock(&f_mud_cell_ops_list_mutex);
+		if (retried)
+			return NULL;
+
+		retried = true;
+		snprintf(module_name, MODULE_NAME_LEN, "usb_f_%s", name);
+		strreplace(module_name, '-', '_');
+		if (request_module(module_name))
+			return NULL;
+
+		goto retry;
+	}
+
+	if (item && try_module_get(item->ops->owner)) {
+		ops = item->ops;
+		item->refcnt++;
+	}
+
+	mutex_unlock(&f_mud_cell_ops_list_mutex);
+
+	return ops;
+}
+
+static void f_mud_cell_put(const struct f_mud_cell_ops *ops)
+{
+	struct f_mud_cell_ops_list_item *item;
+
+	fmdebug(1, "%s: name=%s\n", __func__, ops->name);
+
+	mutex_lock(&f_mud_cell_ops_list_mutex);
+	item = f_mud_cell_item_lookup(ops->name);
+	WARN_ON(!item || !item->refcnt);
+	if (item && item->refcnt) {
+		module_put(item->ops->owner);
+		item->refcnt--;
+	}
+	mutex_unlock(&f_mud_cell_ops_list_mutex);
+}
+
+#define F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(name, addr, size)	\
+	static struct usb_endpoint_descriptor name = {		\
+		.bLength =		USB_DT_ENDPOINT_SIZE,	\
+		.bDescriptorType =	USB_DT_ENDPOINT,	\
+		.bEndpointAddress =	addr,			\
+		.bmAttributes =		USB_ENDPOINT_XFER_BULK,	\
+		.wMaxPacketSize =	cpu_to_le16(size),	\
+	}
+
+#define F_MUD_DEFINE_INT_ENDPOINT_DESCRIPTOR(name)		\
+	static struct usb_endpoint_descriptor name = {		\
+		.bLength =		USB_DT_ENDPOINT_SIZE,	\
+		.bDescriptorType =	USB_DT_ENDPOINT,	\
+		.bEndpointAddress =	USB_DIR_IN,		\
+		.bmAttributes =		USB_ENDPOINT_XFER_INT,	\
+	}
+
+static struct usb_interface_descriptor f_mud_intf = {
+	.bLength =		USB_DT_INTERFACE_SIZE,
+	.bDescriptorType =	USB_DT_INTERFACE,
+	/*.bNumEndpoints =	2 or 3, */
+	.bInterfaceClass =	USB_CLASS_VENDOR_SPEC,
+};
+
+F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(f_mud_fs_in_desc, USB_DIR_IN, 0);
+F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(f_mud_fs_out_desc, USB_DIR_OUT, 0);
+F_MUD_DEFINE_INT_ENDPOINT_DESCRIPTOR(f_mud_fs_int_desc);
+
+static struct usb_descriptor_header *f_mud_fs_function[] = {
+	(struct usb_descriptor_header *)&f_mud_intf,
+	(struct usb_descriptor_header *)&f_mud_fs_in_desc,
+	(struct usb_descriptor_header *)&f_mud_fs_out_desc,
+	NULL, /* Room for optional interrupt endpoint */
+	NULL,
+};
+
+F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(f_mud_hs_in_desc, USB_DIR_IN, 512);
+F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(f_mud_hs_out_desc, USB_DIR_OUT, 512);
+F_MUD_DEFINE_INT_ENDPOINT_DESCRIPTOR(f_mud_hs_int_desc);
+
+static struct usb_descriptor_header *f_mud_hs_function[] = {
+	(struct usb_descriptor_header *)&f_mud_intf,
+	(struct usb_descriptor_header *)&f_mud_hs_in_desc,
+	(struct usb_descriptor_header *)&f_mud_hs_out_desc,
+	NULL, /* Room for optional interrupt endpoint */
+	NULL,
+};
+
+F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(f_mud_ss_in_desc, USB_DIR_IN, 1024);
+F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(f_mud_ss_out_desc, USB_DIR_OUT, 1024);
+F_MUD_DEFINE_INT_ENDPOINT_DESCRIPTOR(f_mud_ss_int_desc);
+
+static struct usb_ss_ep_comp_descriptor f_mud_ss_bulk_comp_desc = {
+	.bLength =		USB_DT_SS_EP_COMP_SIZE,
+	.bDescriptorType =	USB_DT_SS_ENDPOINT_COMP,
+};
+
+static struct usb_ss_ep_comp_descriptor f_mud_ss_int_comp_desc = {
+	.bLength =		USB_DT_SS_EP_COMP_SIZE,
+	.bDescriptorType =	USB_DT_SS_ENDPOINT_COMP,
+};
+
+static struct usb_descriptor_header *f_mud_ss_function[] = {
+	(struct usb_descriptor_header *)&f_mud_intf,
+	(struct usb_descriptor_header *)&f_mud_ss_in_desc,
+	(struct usb_descriptor_header *)&f_mud_ss_bulk_comp_desc,
+	(struct usb_descriptor_header *)&f_mud_ss_out_desc,
+	(struct usb_descriptor_header *)&f_mud_ss_bulk_comp_desc,
+	NULL, /* Room for optional interrupt endpoint, otherwise terminator */
+	(struct usb_descriptor_header *)&f_mud_ss_int_comp_desc,
+	NULL,
+};
+
+static struct usb_string f_mud_string_defs[] = {
+	[0].s = "Multifunction USB device",
+	{  } /* end of list */
+};
+
+static struct usb_gadget_strings f_mud_string_table = {
+	.language =	0x0409,	/* en-us */
+	.strings =	f_mud_string_defs,
+};
+
+static struct usb_gadget_strings *f_mud_strings[] = {
+	&f_mud_string_table,
+	NULL,
+};
+
+static void fmud_irq_req_queue(struct f_mud *fmud)
+{
+	unsigned int nlongs = DIV_ROUND_UP(fmud->num_cells, BITS_PER_LONG);
+	unsigned int nbytes = DIV_ROUND_UP(fmud->num_cells, BITS_PER_BYTE);
+	unsigned int i, ilong, ibuf = 0;
+	int ret;
+	__le16 *tag = fmud->irq_req->buf;
+	u8 *buf = fmud->irq_req->buf + sizeof(u16);
+
+	fmdebug(3, "%s: irq_status: %*pb\n", __func__, fmud->num_cells, fmud->irq_status);
+
+	*tag = cpu_to_le16(++fmud->int_tag);
+
+	for (ilong = 0; ilong < nlongs; ilong++) {
+		unsigned long val = fmud->irq_status[ilong];
+
+		fmud->irq_status[ilong] = 0;
+
+		for (i = 0; i < (BITS_PER_LONG / BITS_PER_BYTE) && ibuf < nbytes; i++, ibuf++) {
+			buf[ibuf] = val & 0xff;
+			val >>= 8;
+		}
+	}
+
+	fmdebug(3, "%s: req->buf: %*ph\n", __func__, fmud->irq_req->length, fmud->irq_req->buf);
+
+	ret = usb_ep_queue(fmud->irq_ep, fmud->irq_req, GFP_ATOMIC);
+	if (!ret)
+		fmud->irq_queued = true;
+	else
+		pr_err("%s: Failed to queue irq req, error=%d\n", __func__, ret);
+}
+
+static void fmud_irq_req_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct f_mud *fmud = req->context;
+	unsigned long flags;
+
+	switch (req->status) {
+	case 0:
+		break;
+	case -ECONNABORTED:		/* hardware forced ep reset */
+	case -ECONNRESET:		/* request dequeued */
+	case -ESHUTDOWN:		/* disconnect from host */
+		fmdebug(1, "%s: abort, status=%d\n", __func__, req->status);
+		return;
+	default:
+		pr_err("%s: irq request failed, error=%d\n", __func__, req->status);
+		break;
+	}
+
+	spin_lock_irqsave(&fmud->irq_lock, flags);
+
+	fmud->irq_queued = false;
+
+	if (!bitmap_empty(fmud->irq_status, fmud->num_cells))
+		fmud_irq_req_queue(fmud);
+
+	spin_unlock_irqrestore(&fmud->irq_lock, flags);
+}
+
+/**
+ * f_mud_irq() - Send an interrupt
+ * @cell: Cell
+ *
+ * This function queues an interrupt to be sent to the host.
+ *
+ * Returns:
+ * True if there's a pending interrupt that has not been sent yet, otherwise false.
+ */
+bool f_mud_irq(struct f_mud_cell *cell)
+{
+	struct f_mud *fmud = cell->fmud;
+	unsigned long flags;
+	bool ret;
+
+	if (WARN_ON_ONCE(!fmud || !fmud->irq_enabled))
+		return false;
+
+	spin_lock_irqsave(&fmud->irq_lock, flags);
+
+	ret = test_and_set_bit(cell->index, fmud->irq_status);
+
+	if (!fmud->irq_queued)
+		fmud_irq_req_queue(fmud);
+
+	spin_unlock_irqrestore(&fmud->irq_lock, flags);
+
+	fmdebug(1, "%s: cell->index=%u was_set=%u\n", __func__, cell->index, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL(f_mud_irq);
+
+static int f_mud_set_alt(struct usb_function *f, unsigned int intf, unsigned int alt)
+{
+	struct f_mud *fmud = func_to_f_mud(f);
+
+	fmdebug(1, "%s: intf=%u, alt=%u\n", __func__, intf, alt);
+
+	if (alt || intf != fmud->interface_id)
+		return -EINVAL;
+
+	if (fmud->irq_ep) {
+		struct usb_composite_dev *cdev = f->config->cdev;
+
+		if (!fmud->irq_ep->desc) {
+			if (config_ep_by_speed(cdev->gadget, f, fmud->irq_ep)) {
+				fmud->irq_ep->desc = NULL;
+				return -EINVAL;
+			}
+		}
+
+		usb_ep_disable(fmud->irq_ep);
+		usb_ep_enable(fmud->irq_ep);
+		fmud->irq_enabled = true;
+	}
+
+	return mud_regmap_set_alt(fmud->mreg, f);
+}
+
+static int f_mud_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
+{
+	struct f_mud *fmud = func_to_f_mud(f);
+
+	return mud_regmap_setup(fmud->mreg, f, ctrl);
+}
+
+static void f_mud_disable(struct usb_function *f)
+{
+	struct f_mud *fmud = func_to_f_mud(f);
+
+	fmdebug(1, "%s\n", __func__);
+
+	if (fmud->irq_ep) {
+		fmud->int_tag = 0;
+		fmud->irq_enabled = false;
+		usb_ep_disable(fmud->irq_ep);
+	}
+
+	mud_regmap_stop(fmud->mreg);
+}
+
+static void f_mud_unbind(struct usb_configuration *c, struct usb_function *f)
+{
+	struct f_mud *fmud = func_to_f_mud(f);
+	struct f_mud_cell *cell;
+	unsigned int i;
+
+	fmdebug(1, "%s\n", __func__);
+
+	for (i = 0; i < fmud->num_cells; i++) {
+		cell = fmud->cells[i];
+		cell->ops->unbind(cell);
+	}
+	mud_regmap_cleanup(fmud->mreg);
+	fmud->mreg = NULL;
+	usb_free_all_descriptors(f);
+	if (fmud->irq_req) {
+		kfree(fmud->irq_req->buf);
+		usb_ep_free_request(fmud->irq_ep, fmud->irq_req);
+		fmud->irq_req = NULL;
+		bitmap_free(fmud->irq_status);
+		fmud->irq_status = NULL;
+	}
+}
+
+static int f_mud_bind(struct usb_configuration *c, struct usb_function *f)
+{
+	struct usb_composite_dev *cdev = c->cdev;
+	struct f_mud *fmud = func_to_f_mud(f);
+	struct usb_ep *in_ep, *out_ep;
+	unsigned int max_index = 0;
+	struct usb_string *us;
+	struct mud_regmap *mreg;
+	int i, ret;
+
+	fmdebug(1, "%s\n", __func__);
+
+	for (i = 0; i < fmud->num_cells; i++)
+		max_index = max(fmud->cells[i]->index, max_index);
+
+	if (fmud->num_cells != max_index + 1) {
+		pr_err("Cell indices are not continuous\n");
+		return -EINVAL;
+	}
+
+	us = usb_gstrings_attach(cdev, f_mud_strings,
+				 ARRAY_SIZE(f_mud_string_defs));
+	if (IS_ERR(us))
+		return PTR_ERR(us);
+
+	f_mud_intf.iInterface = us[0].id;
+
+	ret = usb_interface_id(c, f);
+	if (ret < 0)
+		return ret;
+
+	fmud->interface_id = ret;
+	f_mud_intf.bInterfaceNumber = fmud->interface_id;
+
+	in_ep = usb_ep_autoconfig(cdev->gadget, &f_mud_fs_in_desc);
+	out_ep = usb_ep_autoconfig(cdev->gadget, &f_mud_fs_out_desc);
+	if (!in_ep || !out_ep)
+		return -ENODEV;
+
+	f_mud_hs_in_desc.bEndpointAddress = f_mud_fs_in_desc.bEndpointAddress;
+	f_mud_hs_out_desc.bEndpointAddress = f_mud_fs_out_desc.bEndpointAddress;
+
+	f_mud_ss_in_desc.bEndpointAddress = f_mud_fs_in_desc.bEndpointAddress;
+	f_mud_ss_out_desc.bEndpointAddress = f_mud_fs_out_desc.bEndpointAddress;
+
+	if (fmud->interrupt_interval_ms) {
+		unsigned int buflen = sizeof(u16) + DIV_ROUND_UP(fmud->num_cells, 8);
+		unsigned int interval_ms = fmud->interrupt_interval_ms;
+		unsigned int interval_hs_ss;
+
+		interval_hs_ss = roundup_pow_of_two(interval_ms * 8); /* 125us frames */
+		interval_hs_ss = ilog2(interval_hs_ss) + 1; /* 2^(bInterval-1) encoding */
+		interval_hs_ss = min_t(unsigned int, interval_hs_ss, 16); /* max 4096ms */
+
+		f_mud_fs_int_desc.bInterval = min_t(unsigned int, interval_ms, 255);
+		f_mud_fs_int_desc.wMaxPacketSize = cpu_to_le16(buflen);
+		f_mud_hs_int_desc.bInterval = interval_hs_ss;
+		f_mud_hs_int_desc.wMaxPacketSize = cpu_to_le16(buflen);
+		f_mud_ss_int_desc.bInterval = interval_hs_ss;
+		f_mud_ss_int_desc.wMaxPacketSize = cpu_to_le16(buflen);
+		f_mud_ss_int_comp_desc.wBytesPerInterval = cpu_to_le16(buflen);
+
+		fmud->irq_ep = usb_ep_autoconfig(cdev->gadget, &f_mud_fs_int_desc);
+		if (!fmud->irq_ep)
+			return -ENODEV;
+
+		f_mud_hs_int_desc.bEndpointAddress = f_mud_fs_int_desc.bEndpointAddress;
+		f_mud_ss_int_desc.bEndpointAddress = f_mud_fs_int_desc.bEndpointAddress;
+
+		fmud->irq_req = usb_ep_alloc_request(fmud->irq_ep, GFP_KERNEL);
+		if (!fmud->irq_req) {
+			ret = -ENOMEM;
+			goto fail_free_irq;
+		}
+
+		fmud->irq_req->complete = fmud_irq_req_complete;
+		fmud->irq_req->length = buflen;
+		fmud->irq_req->context = fmud;
+		fmud->irq_req->buf = kmalloc(buflen, GFP_KERNEL);
+		if (!fmud->irq_req->buf) {
+			ret = -ENOMEM;
+			goto fail_free_irq;
+		}
+
+		fmud->irq_status = bitmap_zalloc(fmud->num_cells, GFP_KERNEL);
+		if (!fmud->irq_status) {
+			ret = -ENOMEM;
+			goto fail_free_irq;
+		}
+
+		f_mud_intf.bNumEndpoints = 3;
+		f_mud_fs_function[3] = (struct usb_descriptor_header *)&f_mud_fs_int_desc;
+		f_mud_hs_function[3] = (struct usb_descriptor_header *)&f_mud_hs_int_desc;
+		f_mud_ss_function[5] = (struct usb_descriptor_header *)&f_mud_ss_int_desc;
+	} else {
+		f_mud_intf.bNumEndpoints = 2;
+		f_mud_fs_function[3] = NULL;
+		f_mud_hs_function[3] = NULL;
+		f_mud_ss_function[5] = NULL;
+	}
+
+	ret = usb_assign_descriptors(f, f_mud_fs_function, f_mud_hs_function,
+				     f_mud_ss_function, NULL);
+	if (ret)
+		goto fail_free_irq;
+
+	for (i = 0; i < fmud->num_cells; i++) {
+		struct f_mud_cell *cell = fmud->cells[i];
+
+		ret = cell->ops->bind(cell);
+		if (ret) {
+			pr_err("%s: Failed to bind cell '%s' ret=%d",
+			       __func__, cell->ops->name, ret);
+			goto fail_unbind;
+		}
+	}
+
+	mreg = mud_regmap_init(cdev, in_ep, out_ep, fmud->cells, fmud->num_cells);
+	if (IS_ERR(mreg)) {
+		ret = PTR_ERR(mreg);
+		goto fail_unbind;
+	}
+
+	fmud->mreg = mreg;
+
+	pr_info("%s: %s speed IN/%s OUT/%s\n", __func__,
+		gadget_is_superspeed(c->cdev->gadget) ? "super" :
+		gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
+		in_ep->name, out_ep->name);
+
+	return 0;
+
+fail_unbind:
+	while (--i >= 0) {
+		struct f_mud_cell *cell = fmud->cells[i];
+
+		cell->ops->unbind(cell);
+	}
+	usb_free_all_descriptors(f);
+fail_free_irq:
+	if (fmud->irq_req) {
+		kfree(fmud->irq_req->buf);
+		usb_ep_free_request(fmud->irq_ep, fmud->irq_req);
+		fmud->irq_req = NULL;
+		bitmap_free(fmud->irq_status);
+		fmud->irq_status = NULL;
+	}
+
+	return ret;
+}
+
+static void f_mud_free_func(struct usb_function *f)
+{
+	struct f_mud_opts *opts = container_of(f->fi, struct f_mud_opts, func_inst);
+	struct f_mud *fmud = func_to_f_mud(f);
+	unsigned int i;
+
+	fmdebug(1, "%s\n", __func__);
+
+	mutex_lock(&opts->lock);
+	opts->refcnt--;
+	for (i = 0; i < fmud->num_cells; i++) {
+		configfs_undepend_item(&fmud->cells[i]->group.cg_item);
+		fmud->cells[i]->fmud = NULL;
+	}
+	mutex_unlock(&opts->lock);
+
+	kfree(fmud->cells);
+	kfree(fmud);
+}
+
+static struct usb_function *f_mud_alloc_func(struct usb_function_instance *fi)
+{
+	struct f_mud_opts *opts = container_of(fi, struct f_mud_opts, func_inst);
+	unsigned int max_index = 0, interrupt_interval_ms = UINT_MAX;
+	struct usb_function *func;
+	struct f_mud_cell *cell;
+	struct f_mud *fmud;
+	int ret = 0;
+
+	fmdebug(1, "%s\n", __func__);
+
+	fmud = kzalloc(sizeof(*fmud), GFP_KERNEL);
+	if (!fmud)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock_init(&fmud->irq_lock);
+
+	mutex_lock(&opts->lock);
+
+	list_for_each_entry(cell, &opts->cells, node) {
+		max_index = max(max_index, cell->index);
+		fmud->num_cells++;
+	}
+
+	if (!fmud->num_cells) {
+		ret = -ENOENT;
+		goto unlock;
+	}
+
+	if (fmud->num_cells != max_index + 1) {
+		pr_err("Cell indices are not continuous\n");
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	fmud->cells = kcalloc(fmud->num_cells, sizeof(*fmud->cells), GFP_KERNEL);
+	if (!fmud->cells) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	list_for_each_entry(cell, &opts->cells, node) {
+		/* Prevent the cell dir from being deleted */
+		ret = configfs_depend_item(cell->group.cg_subsys, &cell->group.cg_item);
+		if (ret)
+			goto unlock;
+
+		fmud->cells[cell->index] = cell;
+		cell->fmud = fmud;
+		if (cell->ops->interrupt_interval_ms)
+			interrupt_interval_ms = min(cell->ops->interrupt_interval_ms,
+						    interrupt_interval_ms);
+	}
+
+	if (interrupt_interval_ms != UINT_MAX) {
+		if (opts->interrupt_interval_ms == -1)
+			fmud->interrupt_interval_ms = interrupt_interval_ms;
+		else
+			fmud->interrupt_interval_ms = opts->interrupt_interval_ms;
+	}
+
+	fmdebug(1, "    interrupt_interval_ms=%d\n", fmud->interrupt_interval_ms);
+
+	opts->refcnt++;
+unlock:
+	mutex_unlock(&opts->lock);
+
+	if (ret)
+		goto error;
+
+	func = &fmud->func;
+	func->name = "f_mud";
+	func->bind = f_mud_bind;
+	func->unbind = f_mud_unbind;
+	func->set_alt = f_mud_set_alt;
+	func->setup = f_mud_setup;
+	func->disable = f_mud_disable;
+	func->free_func = f_mud_free_func;
+
+	return func;
+
+error:
+	if (fmud->cells) {
+		unsigned int i;
+
+		for (i = 0; i < fmud->num_cells; i++) {
+			cell = fmud->cells[i];
+			if (cell)
+				configfs_undepend_item(&cell->group.cg_item);
+		}
+		kfree(fmud->cells);
+	}
+	kfree(fmud);
+
+	return ERR_PTR(ret);
+}
+
+F_MUD_OPT_INT(f_mud_opts, interrupt_interval_ms, -1, INT_MAX);
+
+static struct configfs_attribute *f_mud_attrs[] = {
+	&f_mud_opts_attr_interrupt_interval_ms,
+	NULL,
+};
+
+static struct config_group *f_mud_cell_make_group(struct config_group *group,
+						  const char *name)
+{
+	struct f_mud_opts *opts = ci_to_f_mud_opts(&group->cg_item);
+	char *cell_name, *cell_index_str, *buf = NULL;
+	const struct f_mud_cell_ops *ops;
+	struct f_mud_cell *cell;
+	int ret = 0;
+	u8 index;
+
+	fmdebug(1, "%s: name=%s\n", __func__, name);
+
+	mutex_lock(&opts->lock);
+	if (opts->refcnt) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	buf = kstrdup(name, GFP_KERNEL);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	cell_index_str = buf;
+	cell_name = strsep(&cell_index_str, ".");
+	if (!cell_index_str || !strlen(cell_index_str)) {
+		pr_err("Unable to parse CELL.INDEX for '%s'\n", name);
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ret = kstrtou8(cell_index_str, 10, &index);
+	if (ret)
+		goto out_unlock;
+
+	if (index >= REGMAP_USB_MAX_MAPS) {
+		pr_err("Cell index out of range for '%s'\n", name);
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	ops = f_mud_cell_get(cell_name);
+	if (!ops) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	cell = ops->alloc();
+	if (IS_ERR(cell)) {
+		f_mud_cell_put(ops);
+		ret = PTR_ERR(cell);
+		goto out_unlock;
+	}
+
+	cell->ops = ops;
+	cell->index = index;
+	list_add(&cell->node, &opts->cells);
+out_unlock:
+	mutex_unlock(&opts->lock);
+
+	kfree(buf);
+
+	return ret ? ERR_PTR(ret) : &cell->group;
+}
+
+/**
+ * f_mud_cell_item_release() - Cell configfs item release
+ * @item: Configfs item
+ *
+ * Drivers should use this as their &configfs_item_operations.release callback
+ * in their &config_item_type on the cells &config_group.
+ */
+void f_mud_cell_item_release(struct config_item *item)
+{
+	struct f_mud_cell *cell = ci_to_f_mud_cell(item);
+	const struct f_mud_cell_ops *ops = cell->ops;
+
+	fmdebug(1, "%s: cell=%px\n", __func__, cell);
+
+	ops->free(cell);
+	f_mud_cell_put(ops);
+}
+EXPORT_SYMBOL(f_mud_cell_item_release);
+
+static void f_mud_cell_drop_item(struct config_group *group, struct config_item *item)
+{
+	struct f_mud_opts *opts = ci_to_f_mud_opts(&group->cg_item);
+	struct f_mud_cell *cell = ci_to_f_mud_cell(item);
+
+	fmdebug(1, "%s: cell=%px\n", __func__, cell);
+
+	mutex_lock(&opts->lock);
+	list_del(&cell->node);
+	mutex_unlock(&opts->lock);
+
+	config_item_put(item);
+}
+
+static struct configfs_group_operations f_mud_cell_group_ops = {
+	.make_group	= f_mud_cell_make_group,
+	.drop_item	= f_mud_cell_drop_item,
+};
+
+static void f_mud_attr_release(struct config_item *item)
+{
+	struct f_mud_opts *opts = ci_to_f_mud_opts(item);
+
+	fmdebug(1, "%s\n", __func__);
+
+	usb_put_function_instance(&opts->func_inst);
+}
+
+static struct configfs_item_operations f_mud_item_ops = {
+	.release	= f_mud_attr_release,
+};
+
+static const struct config_item_type f_mud_func_type = {
+	.ct_item_ops	= &f_mud_item_ops,
+	.ct_group_ops	= &f_mud_cell_group_ops,
+	.ct_attrs	= f_mud_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void f_mud_free_func_inst(struct usb_function_instance *f)
+{
+	struct f_mud_opts *opts = container_of(f, struct f_mud_opts, func_inst);
+
+	fmdebug(1, "%s\n", __func__);
+
+	mutex_destroy(&opts->lock);
+	kfree(opts);
+}
+
+static struct usb_function_instance *f_mud_alloc_func_inst(void)
+{
+	struct f_mud_opts *opts;
+
+	fmdebug(1, "%s\n", __func__);
+
+	opts = kzalloc(sizeof(*opts), GFP_KERNEL);
+	if (!opts)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&opts->lock);
+	INIT_LIST_HEAD(&opts->cells);
+	opts->func_inst.free_func_inst = f_mud_free_func_inst;
+	opts->interrupt_interval_ms = -1;
+
+	config_group_init_type_name(&opts->func_inst.group, "", &f_mud_func_type);
+
+	return &opts->func_inst;
+}
+
+DECLARE_USB_FUNCTION_INIT(f_mud, f_mud_alloc_func_inst, f_mud_alloc_func);
+
+MODULE_DESCRIPTION("Multifunction USB Device");
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/gadget/function/f_mud.h b/drivers/usb/gadget/function/f_mud.h
new file mode 100644
index 000000000000..ce3833530a1a
--- /dev/null
+++ b/drivers/usb/gadget/function/f_mud.h
@@ -0,0 +1,210 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __LINUX_F_MUD_H
+#define __LINUX_F_MUD_H
+
+#include <linux/configfs.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+struct module;
+
+struct f_mud;
+struct f_mud_cell;
+
+/**
+ * struct f_mud_cell_ops - Cell driver operations
+ * @name: Name, passed on to the host as the regmap name
+ * @owner: Owner module
+ * @regval_bytes: Number of bytes in the register value (1, 2 or 4)
+ * @max_transfer_size: Maximum size of one transfer
+ * @compression: Supported compression bit mask
+ * @interrupt_interval_ms: Interrupt interval in milliseconds (optional)
+ *                         Setting this adds an interrupt endpoint to the interface.
+ *                         If more than one cell sets this then the smallest value is used.
+ * @alloc: Callback that allocates and returns an &f_mud_cell
+ * @free: Frees the allocated cell
+ * @bind: Called when the gadget is bound to the controller
+ * @unbind: Called when the gadget is unbound from the controller
+ * @enable: Called when the USB cable is plugged in (optional)
+ * @disable: Called when the USB cable is unplugged (optional)
+ * @readreg: Called when the host is writing to a register. If the host asks for
+ *           compression, the cell is free to ignore it. If it does compress,
+ *           then the len argument must be updated to reflect the actual buffer size.
+ * @writereg: Called when the host is reading from a register
+ *
+ * All callbacks run in process context.
+ */
+struct f_mud_cell_ops {
+	const char *name;
+	struct module *owner;
+
+	unsigned int regval_bytes;
+	unsigned int max_transfer_size;
+	u8 compression;
+	unsigned int interrupt_interval_ms;
+
+	struct f_mud_cell *(*alloc)(void);
+	void (*free)(struct f_mud_cell *cell);
+
+	int (*bind)(struct f_mud_cell *cell);
+	void (*unbind)(struct f_mud_cell *cell);
+
+	void (*enable)(struct f_mud_cell *cell);
+	void (*disable)(struct f_mud_cell *cell);
+
+	int (*readreg)(struct f_mud_cell *cell, unsigned int regnr,
+		       void *buf, size_t *len, u8 compression);
+	int (*writereg)(struct f_mud_cell *cell, unsigned int regnr,
+			const void *buf, size_t len, u8 compression);
+};
+
+/**
+ * struct f_mud_cell - Cell
+ * @node: List node in the configfs entry list
+ * @index: Cell index from configfs entry
+ * @ops: Cell operations
+ * @fmud: Parent structure
+ * @group: Configfs group
+ */
+struct f_mud_cell {
+	struct list_head node;
+	unsigned int index;
+	const struct f_mud_cell_ops *ops;
+	struct f_mud *fmud;
+	struct config_group group;
+};
+
+static inline struct f_mud_cell *ci_to_f_mud_cell(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct f_mud_cell, group);
+}
+
+bool f_mud_irq(struct f_mud_cell *cell);
+void f_mud_cell_item_release(struct config_item *item);
+
+int f_mud_cell_register(const struct f_mud_cell_ops *ops);
+void f_mud_cell_unregister(const struct f_mud_cell_ops *ops);
+
+#define DECLARE_F_MUD_CELL_INIT(_ops)			\
+	static int __init _ops ## _mod_init(void)	\
+	{						\
+		return f_mud_cell_register(&_ops);	\
+	}						\
+	module_init(_ops ## _mod_init);			\
+	static void __exit _ops ## _mod_exit(void)	\
+	{						\
+		f_mud_cell_unregister(&_ops);		\
+	}						\
+	module_exit(_ops ## _mod_exit)
+
+#define F_MUD_OPT_INT(_typ, _name, _min, _max)				\
+static ssize_t _typ ## _ ## _name ## _show(struct config_item *item,	\
+					   char *page)			\
+{									\
+	struct _typ *opts = ci_to_ ## _typ(item);			\
+	ssize_t ret;							\
+									\
+	mutex_lock(&opts->lock);					\
+	ret = sprintf(page, "%d\n", opts->_name);			\
+	mutex_unlock(&opts->lock);					\
+									\
+	return ret;							\
+}									\
+									\
+static ssize_t _typ ## _ ## _name ## _store(struct config_item *item,	\
+					const char *page, size_t len)	\
+{									\
+	struct _typ *opts = ci_to_ ## _typ(item);			\
+	int ret, num;							\
+									\
+	mutex_lock(&opts->lock);					\
+	if (opts->refcnt) {						\
+		ret = -EBUSY;						\
+		goto out_unlock;					\
+	}								\
+									\
+	ret = kstrtoint(page, 0, &num);					\
+	if (ret)							\
+		goto out_unlock;					\
+									\
+	if (num >= (_min) || num <= (_max))				\
+		opts->_name = num;					\
+	else								\
+		ret = -EINVAL;						\
+out_unlock:								\
+	mutex_unlock(&opts->lock);					\
+									\
+	return ret ? ret : len;						\
+}									\
+									\
+CONFIGFS_ATTR(_typ ## _, _name)
+
+#define F_MUD_OPT_STR(_typ, _name)					\
+static ssize_t _typ ## _ ## _name ## _show(struct config_item *item,	\
+					   char *page)			\
+{									\
+	struct _typ *opts = ci_to_ ## _typ(item);			\
+	ssize_t ret;							\
+									\
+	mutex_lock(&opts->lock);					\
+									\
+	if (opts->_name) {						\
+		ret = strscpy(page, opts->_name, PAGE_SIZE);		\
+	} else {							\
+		page[0] = '\0';						\
+		ret = 0;						\
+	}								\
+									\
+	mutex_unlock(&opts->lock);					\
+									\
+	return ret;							\
+}									\
+									\
+static ssize_t _typ ## _ ## _name ## _store(struct config_item *item,	\
+					const char *page, size_t len)	\
+{									\
+	struct _typ *opts = ci_to_ ## _typ(item);			\
+	ssize_t ret = 0;						\
+	char *buf;							\
+									\
+	mutex_lock(&opts->lock);					\
+	if (opts->refcnt) {						\
+		ret = -EBUSY;						\
+		goto out_unlock;					\
+	}								\
+									\
+	buf = kstrndup(page, len, GFP_KERNEL);				\
+	if (!buf) {							\
+		ret = -ENOMEM;						\
+		goto out_unlock;					\
+	}								\
+									\
+	kfree(opts->_name);						\
+	opts->_name = buf;						\
+out_unlock:								\
+	mutex_unlock(&opts->lock);					\
+									\
+	return ret ? ret : len;						\
+}									\
+									\
+CONFIGFS_ATTR(_typ ## _, _name)
+
+/* mud_regmap.c */
+struct mud_regmap;
+struct usb_composite_dev;
+struct usb_ctrlrequest;
+struct usb_ep;
+struct usb_function;
+
+void mud_regmap_stop(struct mud_regmap *mreg);
+int mud_regmap_setup(struct mud_regmap *mreg, struct usb_function *f,
+		     const struct usb_ctrlrequest *ctrl);
+int mud_regmap_set_alt(struct mud_regmap *mreg, struct usb_function *f);
+
+struct mud_regmap *mud_regmap_init(struct usb_composite_dev *cdev,
+				   struct usb_ep *in_ep, struct usb_ep *out_ep,
+				   struct f_mud_cell **cells, unsigned int num_cells);
+void mud_regmap_cleanup(struct mud_regmap *mreg);
+
+#endif
diff --git a/drivers/usb/gadget/function/mud_regmap.c b/drivers/usb/gadget/function/mud_regmap.c
new file mode 100644
index 000000000000..d5fd5d2d96a7
--- /dev/null
+++ b/drivers/usb/gadget/function/mud_regmap.c
@@ -0,0 +1,936 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/delay.h>
+#include <linux/list.h>
+#include <linux/log2.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/spinlock.h>
+#include <linux/regmap.h>
+#include <linux/regmap_usb.h>
+#include <linux/usb/composite.h>
+#include <linux/usb/gadget.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#include "f_mud.h"
+
+struct mud_regmap_transfer {
+	struct mud_regmap *mreg;
+
+	spinlock_t lock;
+	struct list_head node;
+
+	struct usb_request *header_req;
+	struct usb_request *buf_out_req;
+	struct usb_request *buf_in_req;
+	struct usb_request *status_req;
+
+	struct usb_request *current_req;
+
+	u32 tag;
+	bool in;
+	unsigned int index;
+	unsigned int regnr;
+	u32 flags;
+};
+
+struct mud_regmap {
+	struct usb_ep *in_ep;
+	struct usb_ep *out_ep;
+	struct usb_composite_dev *cdev;
+
+	struct f_mud_cell **cells;
+	unsigned int num_cells;
+
+	unsigned int max_transfer_size;
+	struct mud_regmap_transfer *transfers[2];
+
+	spinlock_t lock;
+
+	struct list_head free_transfers;
+	struct list_head pending_transfers;
+
+	struct workqueue_struct	*workq;
+	struct work_struct work;
+	wait_queue_head_t waitq;
+
+	bool pending_protocol_reset;
+	bool pending_stall;
+	bool stalled;
+	bool run;
+
+	bool header_queued;
+	u8 errno;
+};
+
+/* Temporary debugging aid */
+static unsigned int debug = 0;
+
+#define udebug(level, fmt, ...)				\
+do {							\
+	if ((level) <= debug)				\
+		printk(KERN_DEBUG fmt, ##__VA_ARGS__);	\
+} while (0)
+
+#undef DBG
+#define DBG INFO
+
+static int mud_regmap_usb_ep_set_halt(struct usb_ep *ep)
+{
+	int retries = 10, ret;
+
+	while (retries-- > 0) {
+		ret = usb_ep_set_halt(ep);
+		if (ret != -EAGAIN)
+			break;
+		msleep(100);
+	}
+
+	return ret;
+}
+
+static void mud_regmap_stall(struct mud_regmap *mreg)
+{
+	struct usb_request *current_req[2] = { NULL, NULL };
+	struct mud_regmap_transfer *transfer;
+	int ret_in, ret_out, timeout;
+	unsigned int i;
+
+	udebug(0, "%s:\n", __func__);
+
+	for (i = 0; i < 2; i++) {
+		transfer = mreg->transfers[i];
+		spin_lock_irq(&transfer->lock);
+		current_req[i] = transfer->current_req;
+		spin_unlock_irq(&transfer->lock);
+		if (current_req[i]) {
+			if (current_req[i] == transfer->header_req ||
+			    current_req[i] == transfer->buf_out_req)
+				usb_ep_dequeue(mreg->out_ep, current_req[i]);
+			else
+				usb_ep_dequeue(mreg->in_ep, current_req[i]);
+		}
+	}
+
+	for (timeout = 20; timeout > 0; timeout--) {
+		for (i = 0; i < 2; i++) {
+			transfer = mreg->transfers[i];
+			spin_lock_irq(&transfer->lock);
+			current_req[i] = transfer->current_req;
+			spin_unlock_irq(&transfer->lock);
+		}
+		if (!current_req[0] && !current_req[1])
+			break;
+		msleep(100);
+	}
+
+	if (!timeout)
+		pr_warn("%s: timeout waiting for transfers to complete: tr0=%u, tr1=%u\n",
+			__func__, !!current_req[0], !!current_req[1]);
+
+	ret_in = mud_regmap_usb_ep_set_halt(mreg->in_ep);
+	ret_out = mud_regmap_usb_ep_set_halt(mreg->out_ep);
+	if (ret_in || ret_out)
+		pr_err("%s: Failed to halt endpoint(s) ret_in=%d, ret_out=%d\n",
+		       __func__, ret_in, ret_out);
+
+	spin_lock_irq(&mreg->lock);
+	mreg->pending_stall = false;
+	mreg->stalled = true;
+	spin_unlock_irq(&mreg->lock);
+}
+
+static void mud_regmap_queue_stall(struct mud_regmap *mreg, int error)
+{
+	unsigned long flags;
+
+	udebug(0, "%s: error=%d\n", __func__, error);
+
+	if (error < -255 || error > 0)
+		error = -EREMOTEIO;
+
+	spin_lock_irqsave(&mreg->lock, flags);
+	if (!mreg->pending_stall) {
+		mreg->errno = -error;
+		mreg->pending_stall = true;
+		wake_up(&mreg->waitq);
+	}
+	spin_unlock_irqrestore(&mreg->lock, flags);
+}
+
+static int mud_regmap_queue_header(struct mud_regmap *mreg)
+{
+	struct mud_regmap_transfer *transfer = NULL;
+	bool header_queued, run;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&mreg->lock, flags);
+	header_queued = mreg->header_queued;
+	run = mreg->run;
+	if (!header_queued && run) {
+		transfer = list_first_entry_or_null(&mreg->free_transfers, struct mud_regmap_transfer, node);
+		if (transfer) {
+			mreg->header_queued = true;
+			list_del_init(&transfer->node);
+		}
+	}
+	spin_unlock_irqrestore(&mreg->lock, flags);
+
+	udebug(4, "%s: header_queued=%u, transfer=%px\n", __func__,
+	       header_queued, transfer);
+
+	if (header_queued || !run)
+		return 0;
+
+	if (!transfer) {
+		udebug(4, "Run out of transfers\n");
+		return 0;
+	}
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	ret = usb_ep_queue(mreg->out_ep, transfer->header_req, GFP_ATOMIC);
+	if (!ret)
+		transfer->current_req = transfer->header_req;
+	spin_unlock_irqrestore(&transfer->lock, flags);
+	if (ret) {
+		pr_warn("Queueing header failed, ret=%d\n", ret);
+		mud_regmap_queue_stall(mreg, ret);
+	}
+
+	return ret;
+}
+
+static void mud_regmap_queue_status(struct mud_regmap_transfer *transfer, int error)
+{
+	struct regmap_usb_status *status = transfer->status_req->buf;
+	unsigned long flags;
+	int ret;
+
+	udebug(4, "%s: tag=%u, error=%d\n", __func__, transfer->tag, error);
+
+	if (error < -255 || error > 0)
+		error = -EREMOTEIO;
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	status->tag = cpu_to_le16(transfer->tag);
+	status->status = -error;
+	ret = usb_ep_queue(transfer->mreg->in_ep, transfer->status_req, GFP_ATOMIC);
+	if (!ret)
+		transfer->current_req = transfer->status_req;
+	spin_unlock_irqrestore(&transfer->lock, flags);
+	if (ret) {
+		pr_warn("Queueing status failed, ret=%d\n", ret);
+		mud_regmap_queue_stall(transfer->mreg, ret);
+	}
+}
+
+static void mud_regmap_queue_for_processing(struct mud_regmap_transfer *transfer)
+{
+	struct mud_regmap *mreg = transfer->mreg;
+	unsigned long flags;
+
+	spin_lock_irqsave(&mreg->lock, flags);
+	list_add_tail(&transfer->node, &mreg->pending_transfers);
+	spin_unlock_irqrestore(&mreg->lock, flags);
+
+	wake_up(&mreg->waitq);
+}
+
+static bool mud_regmap_check_req_status(struct usb_request *req)
+{
+	switch (req->status) {
+	case -ECONNABORTED:		/* hardware forced ep reset */
+	case -ECONNRESET:		/* request dequeued */
+	case -ESHUTDOWN:		/* disconnect from host */
+	case -EOVERFLOW:		/* buffer overrun on read means that
+					 * we didn't provide a big enough
+					 * buffer.
+					 */
+	case -EREMOTEIO:		/* short read */
+		udebug(0, "%s: bail out, status=%d\n", __func__, req->status);
+		return false;
+	}
+
+	return true;
+}
+
+static void mud_regmap_header_req_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct mud_regmap_transfer *transfer = req->context;
+	struct mud_regmap *mreg = transfer->mreg;
+	struct regmap_usb_header *header = req->buf;
+	unsigned int index = le16_to_cpu(header->index);
+	u32 hflags = le32_to_cpu(header->flags);
+	bool in = hflags & REGMAP_USB_HEADER_FLAG_IN;
+	u32 length = le32_to_cpu(header->length);
+	unsigned long flags;
+	bool run;
+	int ret;
+
+	udebug(4, "%s: status=%d, actual=%u, length=%u\n", __func__, req->status, req->actual, req->length);
+	udebug(4, "     signature=0x%x, index=%u, tag=%u, flags=0x%x, regnr=0x%x, length=%u, in=%u\n",
+	       le32_to_cpu(header->signature), le16_to_cpu(header->index), le16_to_cpu(header->tag),
+	       le32_to_cpu(header->flags), le32_to_cpu(header->regnr), le32_to_cpu(header->length), in);
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	transfer->current_req = NULL;
+	transfer->in = in;
+	transfer->index = index;
+	transfer->tag = le16_to_cpu(header->tag);
+	transfer->flags = hflags;
+	transfer->regnr = le32_to_cpu(header->regnr);
+	spin_unlock_irqrestore(&transfer->lock, flags);
+
+	if (!mud_regmap_check_req_status(req))
+		return;
+
+	spin_lock_irqsave(&mreg->lock, flags);
+	mreg->header_queued = false;
+	run = mreg->run;
+	spin_unlock_irqrestore(&mreg->lock, flags);
+
+	if (!run)
+		return;
+
+	if (req->status) {
+		udebug(0, "%s: Failed, status=%d\n", __func__, req->status);
+		ret = req->status;
+		goto error;
+	}
+
+	if (req->actual != req->length) {
+		udebug(0, "%s: Wrong length\n", __func__);
+		ret = -EREMOTEIO;
+		goto error;
+	}
+
+	if (le32_to_cpu(header->signature) != REGMAP_USB_HEADER_SIGNATURE) {
+		udebug(0, "%s: Wrong signature\n", __func__);
+		ret = -EINVAL;
+		goto error;
+	}
+
+	if (index >= mreg->num_cells) {
+		udebug(0, "%s: No such index %u\n", __func__, index);
+		ret = -ENOENT;
+		goto error;
+	}
+
+	/* FIXME: Temporary test code */
+	if (index == 2 && !strcmp(mreg->cells[index]->ops->name, "mud-test")) {
+		udebug(0, "%s: Test stall + reset\n", __func__);
+		ret = -ENOENT;
+		goto error;
+	}
+
+	if (length > mreg->max_transfer_size) {
+		udebug(0, "%s: Length overflow %u\n", __func__, length);
+		ret = -EOVERFLOW;
+		goto error;
+	}
+
+	if (in) {
+		transfer->buf_in_req->length = length;
+		mud_regmap_queue_for_processing(transfer);
+		mud_regmap_queue_header(mreg);
+	} else {
+		transfer->buf_out_req->length = length;
+
+		spin_lock_irqsave(&transfer->lock, flags);
+		ret = usb_ep_queue(mreg->out_ep, transfer->buf_out_req, GFP_ATOMIC);
+		if (!ret)
+			transfer->current_req = transfer->buf_out_req;
+		spin_unlock_irqrestore(&transfer->lock, flags);
+		if (ret) {
+			pr_warn("Queueing buf out failed, ret=%d\n", ret);
+			goto error;
+		}
+	}
+
+	return;
+
+error:
+	mud_regmap_queue_stall(mreg, ret);
+}
+
+static void mud_regmap_buf_out_req_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct mud_regmap_transfer *transfer = req->context;
+	struct mud_regmap *mreg = transfer->mreg;
+	unsigned long flags;
+	bool run;
+	int ret;
+
+	udebug(4, "%s: status=%d, actual=%u, length=%u, tag=%u\n", __func__,
+	       req->status, req->actual, req->length, transfer->tag);
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	transfer->current_req = NULL;
+	spin_unlock_irqrestore(&transfer->lock, flags);
+
+	if (!mud_regmap_check_req_status(req))
+		return;
+
+	spin_lock_irqsave(&mreg->lock, flags);
+	run = mreg->run;
+	spin_unlock_irqrestore(&mreg->lock, flags);
+
+	if (!run)
+		return;
+
+	if (req->status) {
+		udebug(0, "%s: Failed, status=%d\n", __func__, req->status);
+		ret = req->status;
+		goto error;
+	}
+
+	if (req->actual != req->length) {
+		udebug(0, "%s: Wrong length\n", __func__);
+		ret = -EREMOTEIO;
+		goto error;
+	}
+
+	mud_regmap_queue_for_processing(transfer);
+	mud_regmap_queue_header(mreg);
+
+	return;
+
+error:
+	mud_regmap_queue_stall(mreg, ret);
+}
+
+static void mud_regmap_buf_in_req_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct mud_regmap_transfer *transfer = req->context;
+	struct mud_regmap *mreg = transfer->mreg;
+	unsigned long flags;
+	bool run;
+
+	udebug(4, "%s: status=%d, actual=%u, length=%u, tag=%u\n", __func__,
+	       req->status, req->actual, req->length, transfer->tag);
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	transfer->current_req = NULL;
+	spin_unlock_irqrestore(&transfer->lock, flags);
+
+	if (!mud_regmap_check_req_status(req))
+		return;
+
+	spin_lock_irqsave(&mreg->lock, flags);
+	run = mreg->run;
+	spin_unlock_irqrestore(&mreg->lock, flags);
+
+	if (!run)
+		return;
+
+	if (req->actual != req->length) {
+		udebug(0, "%s: Wrong length\n", __func__);
+		mud_regmap_queue_stall(mreg, -EREMOTEIO);
+	}
+}
+
+static void mud_regmap_status_req_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct mud_regmap_transfer *transfer = req->context;
+	struct mud_regmap *mreg = transfer->mreg;
+	unsigned long flags;
+	bool run;
+
+	udebug(4, "%s: status=%d, actual=%u, length=%u, tag=%u\n", __func__,
+	       req->status, req->actual, req->length, transfer->tag);
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	transfer->current_req = NULL;
+	spin_unlock_irqrestore(&transfer->lock, flags);
+
+	if (!mud_regmap_check_req_status(req))
+		return;
+
+	spin_lock_irqsave(&mreg->lock, flags);
+	run = mreg->run;
+	list_add_tail(&transfer->node, &mreg->free_transfers);
+	spin_unlock_irqrestore(&mreg->lock, flags);
+
+	if (!run)
+		return;
+
+	if (req->actual != req->length) {
+		udebug(0, "%s: Wrong length\n", __func__);
+		mud_regmap_queue_stall(mreg, -EREMOTEIO);
+		return;
+	}
+
+	/* Make sure it's queued */
+	mud_regmap_queue_header(mreg);
+}
+
+static void mud_regmap_free_transfer(struct mud_regmap_transfer *transfer)
+{
+	if (!transfer)
+		return;
+
+	kfree(transfer->status_req->buf);
+	usb_ep_free_request(transfer->mreg->in_ep, transfer->status_req);
+
+	usb_ep_free_request(transfer->mreg->in_ep, transfer->buf_in_req);
+
+	kfree(transfer->buf_out_req->buf);
+	usb_ep_free_request(transfer->mreg->out_ep, transfer->buf_out_req);
+
+	kfree(transfer->header_req->buf);
+	usb_ep_free_request(transfer->mreg->out_ep, transfer->header_req);
+
+	kfree(transfer);
+}
+
+static struct mud_regmap_transfer *mud_regmap_alloc_transfer(struct mud_regmap *mreg)
+{
+	struct mud_regmap_transfer *transfer;
+	struct regmap_usb_header *header;
+	struct regmap_usb_status *status;
+	void *buf;
+
+	transfer = kzalloc(sizeof(*transfer), GFP_KERNEL);
+	header = kzalloc(sizeof(*header), GFP_KERNEL);
+	status = kzalloc(sizeof(*status), GFP_KERNEL);
+	buf = kmalloc(mreg->max_transfer_size, GFP_KERNEL);
+	if (!transfer || !header || !status || !buf)
+		goto free;
+
+	spin_lock_init(&transfer->lock);
+	transfer->mreg = mreg;
+
+	transfer->header_req = usb_ep_alloc_request(mreg->out_ep, GFP_KERNEL);
+	if (!transfer->header_req)
+		goto free;
+
+	transfer->header_req->context = transfer;
+	transfer->header_req->complete = mud_regmap_header_req_complete;
+	transfer->header_req->buf = header;
+	transfer->header_req->length = sizeof(*header);
+
+	transfer->buf_out_req = usb_ep_alloc_request(mreg->out_ep, GFP_KERNEL);
+	if (!transfer->buf_out_req)
+		goto free;
+
+	transfer->buf_out_req->context = transfer;
+	transfer->buf_out_req->complete = mud_regmap_buf_out_req_complete;
+	transfer->buf_out_req->buf = buf;
+
+	transfer->buf_in_req = usb_ep_alloc_request(mreg->in_ep, GFP_KERNEL);
+	if (!transfer->buf_in_req)
+		goto free;
+
+	transfer->buf_in_req->context = transfer;
+	transfer->buf_in_req->complete = mud_regmap_buf_in_req_complete;
+	transfer->buf_in_req->buf = buf;
+
+	transfer->status_req = usb_ep_alloc_request(mreg->in_ep, GFP_KERNEL);
+	if (!transfer->status_req)
+		goto free;
+
+	transfer->status_req->context = transfer;
+	transfer->status_req->complete = mud_regmap_status_req_complete;
+	transfer->status_req->buf = status;
+	transfer->status_req->length = sizeof(*status);
+	status->signature = cpu_to_le32(REGMAP_USB_STATUS_SIGNATURE);
+
+	return transfer;
+
+free:
+	if (transfer->status_req)
+		usb_ep_free_request(mreg->in_ep, transfer->status_req);
+	if (transfer->buf_in_req)
+		usb_ep_free_request(mreg->in_ep, transfer->buf_in_req);
+	if (transfer->buf_out_req)
+		usb_ep_free_request(mreg->out_ep, transfer->buf_out_req);
+	if (transfer->header_req)
+		usb_ep_free_request(mreg->out_ep, transfer->header_req);
+	kfree(buf);
+	kfree(status);
+	kfree(header);
+	kfree(transfer);
+
+	return NULL;
+}
+
+static void mud_regmap_free_transfers(struct mud_regmap *mreg)
+{
+	mud_regmap_free_transfer(mreg->transfers[0]);
+	mud_regmap_free_transfer(mreg->transfers[1]);
+}
+
+static int mud_regmap_alloc_transfers(struct mud_regmap *mreg)
+{
+retry:
+	udebug(1, "%s: max_transfer_size=%u\n", __func__,
+	       mreg->max_transfer_size);
+
+	mreg->transfers[0] = mud_regmap_alloc_transfer(mreg);
+	mreg->transfers[1] = mud_regmap_alloc_transfer(mreg);
+	if (!mreg->transfers[0] || !mreg->transfers[1]) {
+		mud_regmap_free_transfers(mreg);
+		if (mreg->max_transfer_size < 512)
+			return -ENOMEM; /* No point in retrying we'll fail later anyway */
+
+		mreg->max_transfer_size /= 2;
+		goto retry;
+	}
+
+	list_add_tail(&mreg->transfers[0]->node, &mreg->free_transfers);
+	list_add_tail(&mreg->transfers[1]->node, &mreg->free_transfers);
+
+	return 0;
+}
+
+static void mud_regmap_reset_state(struct mud_regmap *mreg)
+{
+	unsigned long flags;
+
+	udebug(5, "%s:\n", __func__);
+
+	spin_lock_irqsave(&mreg->lock, flags);
+
+	mreg->pending_protocol_reset = false;
+	mreg->pending_stall = false;
+	mreg->stalled = false;
+	mreg->header_queued = false;
+	mreg->errno = 0;
+
+	INIT_LIST_HEAD(&mreg->free_transfers);
+	INIT_LIST_HEAD(&mreg->pending_transfers);
+
+	INIT_LIST_HEAD(&mreg->transfers[0]->node);
+	list_add_tail(&mreg->transfers[0]->node, &mreg->free_transfers);
+	INIT_LIST_HEAD(&mreg->transfers[1]->node);
+	list_add_tail(&mreg->transfers[1]->node, &mreg->free_transfers);
+
+	spin_unlock_irqrestore(&mreg->lock, flags);
+}
+
+static void mud_regmap_protocol_reset(struct mud_regmap *mreg)
+{
+	struct usb_composite_dev *cdev = mreg->cdev;
+	int ret;
+
+	udebug(0, "%s: IN\n", __func__);
+
+	mud_regmap_reset_state(mreg);
+
+	/* Complete the reset request and return the error */
+	ret = usb_ep_queue(cdev->gadget->ep0, cdev->req, GFP_ATOMIC);
+	if (ret < 0)
+		/* FIXME: Should we stall (again) and let the host retry? */
+		ERROR(cdev, "usb_ep_queue error on ep0 %d\n", ret);
+
+	mud_regmap_queue_header(mreg);
+
+	udebug(0, "%s: OUT\n", __func__);
+}
+
+static void mud_regmap_worker(struct work_struct *work)
+{
+	struct mud_regmap *mreg = container_of(work, struct mud_regmap, work);
+	struct mud_regmap_transfer *transfer;
+	unsigned int index, regnr;
+	struct f_mud_cell *cell;
+	bool in, stalled;
+	int ret, error;
+	size_t len;
+	u32 flags;
+
+	for (index = 0; index < mreg->num_cells; index++) {
+		cell = mreg->cells[index];
+		if (cell->ops->enable)
+			cell->ops->enable(cell);
+	}
+
+	while (mreg->run) {
+		spin_lock_irq(&mreg->lock);
+		stalled = mreg->stalled;
+		transfer = list_first_entry_or_null(&mreg->pending_transfers, struct mud_regmap_transfer, node);
+		if (transfer)
+			list_del_init(&transfer->node);
+		spin_unlock_irq(&mreg->lock);
+
+		if (mreg->pending_protocol_reset) {
+			mud_regmap_protocol_reset(mreg);
+			continue;
+		}
+
+		if (mreg->pending_stall) {
+			mud_regmap_stall(mreg);
+			continue;
+		}
+
+		if (stalled || !transfer) {
+			/* Use _interruptible to avoid triggering hung task warnings */
+			wait_event_interruptible(mreg->waitq, !mreg->run ||
+						 mreg->pending_stall ||
+						 mreg->pending_protocol_reset ||
+						 !list_empty(&mreg->pending_transfers));
+			continue;
+		}
+
+		spin_lock_irq(&transfer->lock);
+		index = transfer->index;
+		in = transfer->in;
+		regnr = transfer->regnr;
+		flags = transfer->flags;
+		if (in)
+			len = transfer->buf_in_req->length;
+		else
+			len = transfer->buf_out_req->length;
+		spin_unlock_irq(&transfer->lock);
+
+		// FIXME: check len?
+
+		cell = mreg->cells[index];
+
+		if (in) {
+			udebug(2, "cell->ops->readreg(regnr=0x%02x, len=%zu)\n", regnr, len);
+
+			error = cell->ops->readreg(cell, regnr,
+						   transfer->buf_in_req->buf, &len,
+						   flags & REGMAP_USB_HEADER_FLAG_COMPRESSION_MASK);
+			if (error) {
+				udebug(2, "    error=%d\n", error);
+				// FIXME: Stall or run its course to status stage? Stalling takes time...
+			}
+
+			/* In case the buffer was compressed */
+			transfer->buf_in_req->length = len;
+
+			ret = usb_ep_queue(mreg->in_ep, transfer->buf_in_req, GFP_KERNEL);
+			if (ret) {
+				pr_warn("Failed to queue buf_in_req ret=%d\n", ret);
+				mud_regmap_queue_stall(transfer->mreg, ret);
+				continue;
+			}
+
+			mud_regmap_queue_status(transfer, error);
+		} else {
+			udebug(2, "cell->ops->writereg(regnr=0x%02x, len=%zu)\n", regnr, len);
+
+			error = cell->ops->writereg(cell, regnr,
+						    transfer->buf_out_req->buf, len,
+						    flags & REGMAP_USB_HEADER_FLAG_COMPRESSION_MASK);
+			if (error)
+				udebug(2, "    error=%d\n", error);
+
+			mud_regmap_queue_status(transfer, error);
+		}
+	}
+
+	for (index = 0; index < mreg->num_cells; index++) {
+		cell = mreg->cells[index];
+		if (cell->ops->disable)
+			cell->ops->disable(cell);
+	}
+}
+
+static int mud_regmap_start(struct mud_regmap *mreg)
+{
+	unsigned long flags;
+
+	udebug(1, "%s:\n", __func__);
+
+	mud_regmap_reset_state(mreg);
+
+	usb_ep_enable(mreg->in_ep);
+	usb_ep_enable(mreg->out_ep);
+
+	spin_lock_irqsave(&mreg->lock, flags);
+	mreg->run = true;
+	spin_unlock_irqrestore(&mreg->lock, flags);
+
+	queue_work(mreg->workq, &mreg->work);
+
+	return mud_regmap_queue_header(mreg);
+}
+
+void mud_regmap_stop(struct mud_regmap *mreg)
+{
+	unsigned long flags;
+
+	udebug(1, "%s:\n", __func__);
+
+	spin_lock_irqsave(&mreg->lock, flags);
+	mreg->run = false;
+	spin_unlock_irqrestore(&mreg->lock, flags);
+
+	wake_up(&mreg->waitq);
+
+	usb_ep_disable(mreg->in_ep);
+	usb_ep_disable(mreg->out_ep);
+}
+
+int mud_regmap_setup(struct mud_regmap *mreg, struct usb_function *f,
+		     const struct usb_ctrlrequest *ctrl)
+{
+	struct usb_composite_dev *cdev = f->config->cdev;
+	u16 length = le16_to_cpu(ctrl->wLength);
+	struct usb_request *req  = cdev->req;
+	int ret;
+
+	udebug(1, "%s: bRequest=0x%x, length=%u\n", __func__, ctrl->bRequest, length);
+
+	if (ctrl->bRequestType != (USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_INTERFACE))
+		return -EINVAL;
+
+	if (ctrl->bRequest == USB_REQ_GET_DESCRIPTOR) {
+		u8 type = le16_to_cpu(ctrl->wValue) >> 8;
+		u8 index = le16_to_cpu(ctrl->wValue) & 0xff;
+
+		udebug(1, "    USB_REQ_GET_DESCRIPTOR: type=%u index=%u\n", type, index);
+
+		if (type == REGMAP_USB_DT_INTERFACE && index == 0) {
+			struct regmap_usb_interface_descriptor *desc = req->buf;
+
+			desc->bLength = sizeof(*desc);
+			desc->bDescriptorType = REGMAP_USB_DT_INTERFACE;
+			desc->bNumRegmaps = mreg->num_cells;
+			req->zero = 0;
+			req->length = min_t(unsigned int, length, sizeof(*desc));
+		} else if (type == REGMAP_USB_DT_MAP) {
+			struct regmap_usb_map_descriptor *desc = req->buf;
+			unsigned int max_transfer_size;
+			struct f_mud_cell *cell;
+
+			if (index >= mreg->num_cells)
+				return -ENOENT;
+
+			cell = mreg->cells[index];
+
+			desc->bLength = sizeof(*desc);
+			desc->bDescriptorType = REGMAP_USB_DT_MAP;
+			if (strscpy_pad(desc->name, cell->ops->name, 32) < 0)
+				return -EINVAL;
+			desc->bRegisterValueBits = cell->ops->regval_bytes * 8;
+			desc->bCompression = cell->ops->compression;
+			max_transfer_size = min(mreg->max_transfer_size,
+						cell->ops->max_transfer_size);
+			desc->bMaxTransferSizeOrder = ilog2(max_transfer_size);
+			req->zero = 0;
+			req->length = min_t(unsigned int, length, sizeof(*desc));
+		} else {
+			return -EINVAL;
+		}
+	} else if (ctrl->bRequest == REGMAP_USB_REQ_PROTOCOL_RESET && length == 1) {
+		unsigned long flags;
+
+		DBG(cdev, "Protocol reset request: errno=%u\n", mreg->errno);
+
+		spin_lock_irqsave(&mreg->lock, flags);
+		mreg->pending_protocol_reset = true;
+		*(u8 *)req->buf = mreg->errno;
+		mreg->errno = 0;
+		spin_unlock_irqrestore(&mreg->lock, flags);
+
+		req->zero = 0;
+		req->length = length;
+
+		wake_up(&mreg->waitq);
+
+		return USB_GADGET_DELAYED_STATUS;
+	} else {
+		return -EINVAL;
+	}
+
+	ret = usb_ep_queue(cdev->gadget->ep0, req, GFP_ATOMIC);
+	if (ret < 0)
+		ERROR(cdev, "usb_ep_queue error on ep0 %d\n", ret);
+
+	return ret;
+}
+
+int mud_regmap_set_alt(struct mud_regmap *mreg, struct usb_function *f)
+{
+	struct usb_composite_dev *cdev = f->config->cdev;
+
+	DBG(cdev, "%s: reset\n", __func__);
+
+	if (!mreg->in_ep->desc || !mreg->out_ep->desc) {
+		DBG(cdev, "%s: init\n", __func__);
+		if (config_ep_by_speed(cdev->gadget, f, mreg->in_ep) ||
+		    config_ep_by_speed(cdev->gadget, f, mreg->out_ep)) {
+			mreg->in_ep->desc = NULL;
+			mreg->out_ep->desc = NULL;
+			return -EINVAL;
+		}
+	}
+
+	mud_regmap_stop(mreg);
+
+	return mud_regmap_start(mreg);
+}
+
+struct mud_regmap *mud_regmap_init(struct usb_composite_dev *cdev,
+				   struct usb_ep *in_ep, struct usb_ep *out_ep,
+				   struct f_mud_cell **cells, unsigned int num_cells)
+{
+	size_t max_transfer_size = 0;
+	struct mud_regmap *mreg;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_cells; i++) {
+		size_t cell_max = cells[i]->ops->max_transfer_size;
+
+		if (!is_power_of_2(cell_max)) {
+			pr_err("%s: Max transfer size must be a power of two: %u\n",
+			       __func__, cell_max);
+			return ERR_PTR(-EINVAL);
+		}
+		max_transfer_size = max(max_transfer_size, cell_max);
+	}
+
+	mreg = kzalloc(sizeof(*mreg), GFP_KERNEL);
+	if (!mreg)
+		return ERR_PTR(-ENOMEM);
+
+	mreg->cdev = cdev;
+	mreg->in_ep = in_ep;
+	mreg->out_ep = out_ep;
+	mreg->cells = cells;
+	mreg->num_cells = num_cells;
+	mreg->max_transfer_size = max_transfer_size;
+
+	spin_lock_init(&mreg->lock);
+
+	INIT_LIST_HEAD(&mreg->free_transfers);
+	INIT_LIST_HEAD(&mreg->pending_transfers);
+
+	INIT_WORK(&mreg->work, mud_regmap_worker);
+	init_waitqueue_head(&mreg->waitq);
+
+	mreg->workq = alloc_workqueue("mud_regmap", 0, 0);
+	if (!mreg->workq) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	ret = mud_regmap_alloc_transfers(mreg);
+	if (ret)
+		goto fail;
+
+	return mreg;
+fail:
+	mud_regmap_cleanup(mreg);
+
+	return ERR_PTR(ret);
+}
+
+void mud_regmap_cleanup(struct mud_regmap *mreg)
+{
+	cancel_work_sync(&mreg->work);
+	if (mreg->workq)
+		destroy_workqueue(mreg->workq);
+	mud_regmap_free_transfers(mreg);
+	kfree(mreg);
+}
-- 
2.23.0

