Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697671E85FF
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 19:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgE2R5O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 13:57:14 -0400
Received: from asav22.altibox.net ([109.247.116.9]:39090 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728185AbgE2R5N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 13:57:13 -0400
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 9BB61200DB;
        Fri, 29 May 2020 19:57:04 +0200 (CEST)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     dri-devel@lists.freedesktop.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, sam@ravnborg.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v3 6/6] usb: gadget: function: Add Generic USB Display support
Date:   Fri, 29 May 2020 19:56:43 +0200
Message-Id: <20200529175643.46094-7-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200529175643.46094-1-noralf@tronnes.org>
References: <20200529175643.46094-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=LvK8NEVc c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=VwQbUJbxAAAA:8 a=SJz97ENfAAAA:8
        a=gAmX6pxEAAAA:20 a=e5mUnYsNAAAA:8 a=tKJ212r5Ezfkos4TZsYA:9
        a=oJ3QZCcQx8ZwvcRg:21 a=acWXEmGTS3xcP_Zb:21 a=QEXdDO2ut3YA:10
        a=AjGcO6oz07-iQ99wixmX:22 a=vFet0B0WnEQeilDPIY6i:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds the gadget side support for the Generic USB Display. It presents
a DRM display device as a USB Display configured through configfs.

The display is implemented as a vendor type USB interface with one bulk
out endpoint. The protocol is implemented using control requests.
lz4 compressed framebuffer data/pixels are sent over the bulk endpoint.

The DRM part of the gadget is placed in the DRM subsystem since it reaches
into the DRM internals.

Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 .../ABI/testing/configfs-usb-gadget-gud_drm   |  10 +
 MAINTAINERS                                   |   2 +
 drivers/usb/gadget/Kconfig                    |  12 +
 drivers/usb/gadget/function/Makefile          |   2 +
 drivers/usb/gadget/function/f_gud_drm.c       | 678 ++++++++++++++++++
 5 files changed, 704 insertions(+)
 create mode 100644 Documentation/ABI/testing/configfs-usb-gadget-gud_drm
 create mode 100644 drivers/usb/gadget/function/f_gud_drm.c

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-gud_drm b/Documentation/ABI/testing/configfs-usb-gadget-gud_drm
new file mode 100644
index 000000000000..2ac2c12b33aa
--- /dev/null
+++ b/Documentation/ABI/testing/configfs-usb-gadget-gud_drm
@@ -0,0 +1,10 @@
+What:		/config/usb-gadget/gadget/functions/gud_drm.name
+Date:		Dec 2020
+KernelVersion:	5.10
+Description:
+		The attributes:
+
+		drm_dev - DRM device number
+		backlight_dev - Backlight device name (optional)
+				The backlight brightness scale should be
+				perceptual not linear.
diff --git a/MAINTAINERS b/MAINTAINERS
index b15bf9b2229b..fe3382e07316 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5296,7 +5296,9 @@ M:	Noralf Trønnes <noralf@tronnes.org>
 S:	Maintained
 W:	https://github.com/notro/gud/wiki
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/ABI/testing/configfs-usb-gadget-gud_drm
 F:	drivers/gpu/drm/gud/
+F:	drivers/usb/gadget/function/f_gud_drm.c
 F:	include/drm/gud_drm.h
 
 DRM DRIVER FOR GRAIN MEDIA GM12U320 PROJECTORS
diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index c6db0a0a340c..8d90add495b6 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -216,6 +216,9 @@ config USB_F_PRINTER
 config USB_F_TCM
 	tristate
 
+config USB_F_GUD_DRM
+	tristate
+
 # this first set of drivers all depend on bulk-capable hardware.
 
 config USB_CONFIGFS
@@ -483,6 +486,15 @@ config USB_CONFIGFS_F_TCM
 	  Both protocols can work on USB2.0 and USB3.0.
 	  UAS utilizes the USB 3.0 feature called streams support.
 
+config USB_CONFIGFS_F_GUD_DRM
+	bool "Generic USB Display Gadget function"
+	depends on USB_CONFIGFS
+	depends on DRM
+	select DRM_GUD_GADGET
+	select USB_F_GUD_DRM
+	help
+	  This presents a DRM display device as a Generic USB Display.
+
 source "drivers/usb/gadget/legacy/Kconfig"
 
 endif # USB_GADGET
diff --git a/drivers/usb/gadget/function/Makefile b/drivers/usb/gadget/function/Makefile
index 5d3a6cf02218..cd71caa2a34c 100644
--- a/drivers/usb/gadget/function/Makefile
+++ b/drivers/usb/gadget/function/Makefile
@@ -50,3 +50,5 @@ usb_f_printer-y			:= f_printer.o
 obj-$(CONFIG_USB_F_PRINTER)	+= usb_f_printer.o
 usb_f_tcm-y			:= f_tcm.o
 obj-$(CONFIG_USB_F_TCM)		+= usb_f_tcm.o
+usb_f_gud_drm-y			:= f_gud_drm.o
+obj-$(CONFIG_USB_F_GUD_DRM)	+= usb_f_gud_drm.o
diff --git a/drivers/usb/gadget/function/f_gud_drm.c b/drivers/usb/gadget/function/f_gud_drm.c
new file mode 100644
index 000000000000..9a2d6bb9739f
--- /dev/null
+++ b/drivers/usb/gadget/function/f_gud_drm.c
@@ -0,0 +1,678 @@
+// SPDX-License-Identifier: GPL-2.0
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
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/usb/composite.h>
+#include <linux/usb/gadget.h>
+#include <linux/workqueue.h>
+
+#include <drm/gud_drm.h>
+
+struct f_gud_drm {
+	struct usb_function func;
+	struct work_struct worker;
+	size_t max_buffer_size;
+	void *ctrl_req_buf;
+
+	u8 interface_id;
+	struct usb_request *ctrl_req;
+
+	struct usb_ep *bulk_ep;
+	struct usb_request *bulk_req;
+
+	struct gud_drm_gadget *gdg;
+
+	spinlock_t lock; /* Protects the following members: */
+	bool ctrl_pending;
+	bool status_pending;
+	bool bulk_pending;
+	bool disable_pending;
+	u8 errno;
+	u16 request;
+	u16 value;
+};
+
+static inline struct f_gud_drm *func_to_f_gud_drm(struct usb_function *f)
+{
+	return container_of(f, struct f_gud_drm, func);
+}
+
+struct f_gud_drm_opts {
+	struct usb_function_instance func_inst;
+	struct mutex lock;
+	int refcnt;
+
+	unsigned int drm_dev;
+	const char *backlight_dev;
+};
+
+static inline struct f_gud_drm_opts *fi_to_f_gud_drm_opts(const struct usb_function_instance *fi)
+{
+	return container_of(fi, struct f_gud_drm_opts, func_inst);
+}
+
+static inline struct f_gud_drm_opts *ci_to_f_gud_drm_opts(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct f_gud_drm_opts,
+			    func_inst.group);
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
+static struct usb_interface_descriptor f_gud_drm_intf = {
+	.bLength =		USB_DT_INTERFACE_SIZE,
+	.bDescriptorType =	USB_DT_INTERFACE,
+	.bNumEndpoints =	1,
+	.bInterfaceClass =	USB_CLASS_VENDOR_SPEC,
+};
+
+F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(f_gud_drm_fs_out_desc, USB_DIR_OUT, 0);
+
+static struct usb_descriptor_header *f_gud_drm_fs_function[] = {
+	(struct usb_descriptor_header *)&f_gud_drm_intf,
+	(struct usb_descriptor_header *)&f_gud_drm_fs_out_desc,
+	NULL,
+};
+
+F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(f_gud_drm_hs_out_desc, USB_DIR_OUT, 512);
+
+static struct usb_descriptor_header *f_gud_drm_hs_function[] = {
+	(struct usb_descriptor_header *)&f_gud_drm_intf,
+	(struct usb_descriptor_header *)&f_gud_drm_hs_out_desc,
+	NULL,
+};
+
+F_MUD_DEFINE_BULK_ENDPOINT_DESCRIPTOR(f_gud_drm_ss_out_desc, USB_DIR_OUT, 1024);
+
+static struct usb_ss_ep_comp_descriptor f_gud_drm_ss_bulk_comp_desc = {
+	.bLength =		USB_DT_SS_EP_COMP_SIZE,
+	.bDescriptorType =	USB_DT_SS_ENDPOINT_COMP,
+};
+
+static struct usb_descriptor_header *f_gud_drm_ss_function[] = {
+	(struct usb_descriptor_header *)&f_gud_drm_intf,
+	(struct usb_descriptor_header *)&f_gud_drm_ss_out_desc,
+	(struct usb_descriptor_header *)&f_gud_drm_ss_bulk_comp_desc,
+	NULL,
+};
+
+static struct usb_string f_gud_drm_string_defs[] = {
+	[0].s = "Generic USB Display",
+	{  } /* end of list */
+};
+
+static struct usb_gadget_strings f_gud_drm_string_table = {
+	.language =	0x0409,	/* en-us */
+	.strings =	f_gud_drm_string_defs,
+};
+
+static struct usb_gadget_strings *f_gud_drm_strings[] = {
+	&f_gud_drm_string_table,
+	NULL,
+};
+
+static void f_gud_drm_bulk_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct f_gud_drm *fgd = req->context;
+	unsigned long flags;
+
+	if (req->status || req->actual != req->length)
+		return;
+
+	spin_lock_irqsave(&fgd->lock, flags);
+	fgd->bulk_pending = true;
+	spin_unlock_irqrestore(&fgd->lock, flags);
+
+	queue_work(system_long_wq, &fgd->worker);
+}
+
+static int f_gud_drm_ctrl_req_set_buffer(struct f_gud_drm *fgd, void *buf, size_t len)
+{
+	int ret;
+
+	if (len != sizeof(struct gud_drm_req_set_buffer))
+		return -EINVAL;
+
+	ret = gud_drm_gadget_set_buffer(fgd->gdg, buf);
+	if (ret < 0)
+		return ret;
+
+	if (ret > fgd->max_buffer_size)
+		return -EOVERFLOW;
+
+	fgd->bulk_req->length = ret;
+
+	return usb_ep_queue(fgd->bulk_ep, fgd->bulk_req, GFP_KERNEL);
+}
+
+static void f_gud_drm_worker(struct work_struct *work)
+{
+	struct f_gud_drm *fgd = container_of(work, struct f_gud_drm, worker);
+	bool ctrl_pending, bulk_pending, disable_pending;
+	struct gud_drm_gadget *gdg = fgd->gdg;
+	unsigned long flags;
+	u16 request, value;
+	int ret;
+
+	spin_lock_irqsave(&fgd->lock, flags);
+	request = fgd->request;
+	value = fgd->value;
+	ctrl_pending = fgd->ctrl_pending;
+	bulk_pending = fgd->bulk_pending;
+	disable_pending = fgd->disable_pending;
+	spin_unlock_irqrestore(&fgd->lock, flags);
+
+	pr_debug("%s: bulk_pending=%u ctrl_pending=%u disable_pending=%u\n",
+		 __func__, bulk_pending, ctrl_pending, disable_pending);
+
+	if (disable_pending) {
+		gud_drm_gadget_disable_pipe(gdg);
+
+		spin_lock_irqsave(&fgd->lock, flags);
+		fgd->disable_pending = false;
+		spin_unlock_irqrestore(&fgd->lock, flags);
+		return;
+	}
+
+	if (bulk_pending) {
+		struct usb_request *req = fgd->bulk_req;
+
+		ret = gud_drm_gadget_write_buffer(gdg, req->buf, req->actual);
+		if (ret)
+			pr_err("%s: Failed to write buffer, error=%d\n", __func__, ret);
+
+		spin_lock_irqsave(&fgd->lock, flags);
+		fgd->bulk_pending = false;
+		spin_unlock_irqrestore(&fgd->lock, flags);
+	}
+
+	if (ctrl_pending) {
+		unsigned int length = fgd->ctrl_req->length;
+		void *buf = fgd->ctrl_req->buf;
+
+		if (request == GUD_DRM_USB_REQ_SET_BUFFER)
+			ret = f_gud_drm_ctrl_req_set_buffer(fgd, buf, length);
+		else
+			ret = gud_drm_gadget_ctrl_set(gdg, request, value, buf, length);
+
+		spin_lock_irqsave(&fgd->lock, flags);
+		if (!fgd->errno) /* Don't scribble over an EBUSY or ESHUTDOWN */
+			fgd->errno = -ret;
+		fgd->ctrl_pending = false;
+		fgd->status_pending = false;
+		spin_unlock_irqrestore(&fgd->lock, flags);
+	}
+}
+
+static void f_gud_drm_ctrl_req_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct f_gud_drm *fgd = req->context;
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&fgd->lock, flags);
+
+	if (req->status)
+		ret = req->status;
+	else if (req->actual != req->length)
+		ret = -EREMOTEIO;
+	if (ret) {
+		fgd->errno = -ret;
+		fgd->status_pending = false;
+	} else {
+		fgd->ctrl_pending = true;
+	}
+
+	spin_unlock_irqrestore(&fgd->lock, flags);
+
+	if (!ret)
+		queue_work(system_long_wq, &fgd->worker);
+}
+
+static int f_gud_drm_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
+{
+	struct usb_composite_dev *cdev = f->config->cdev;
+	struct f_gud_drm *fgd = func_to_f_gud_drm(f);
+	bool in = ctrl->bRequestType & USB_DIR_IN;
+	u16 length = le16_to_cpu(ctrl->wLength);
+	u16 value = le16_to_cpu(ctrl->wValue);
+	unsigned long flags;
+	int ret;
+
+	if (ctrl->bRequest == USB_REQ_GET_STATUS) {
+		struct gud_drm_req_get_status *status = cdev->req->buf;
+
+		if (!in || length != sizeof(*status))
+			return -EINVAL;
+
+		spin_lock_irqsave(&fgd->lock, flags);
+		status->flags = 0;
+		if (fgd->status_pending)
+			status->flags |= GUD_DRM_STATUS_PENDING;
+		status->errno = fgd->errno;
+		spin_unlock_irqrestore(&fgd->lock, flags);
+	} else if (in) {
+		if (length > USB_COMP_EP0_BUFSIZ) /* 4k */
+			return -EOVERFLOW;
+
+		ret = gud_drm_gadget_ctrl_get(fgd->gdg, ctrl->bRequest, value,
+					      cdev->req->buf, length);
+		spin_lock_irqsave(&fgd->lock, flags);
+		fgd->status_pending = false;
+		fgd->errno = ret < 0 ? -ret : 0;
+		spin_unlock_irqrestore(&fgd->lock, flags);
+		if (ret < 0)
+			return ret;
+
+		length = ret;
+	} else {
+		if (length > GUD_DRM_MAX_TRANSFER_SIZE)
+			return -EOVERFLOW;
+
+		spin_lock_irqsave(&fgd->lock, flags);
+		if (fgd->ctrl_pending) {
+			/* If we get here the host has timed out on the previous request */
+			ret = -EBUSY;
+			fgd->status_pending = false;
+			fgd->errno = -ret;
+		} else {
+			ret = 0;
+			fgd->errno = 0;
+			fgd->request = ctrl->bRequest;
+			fgd->value = value;
+			fgd->status_pending = true;
+		}
+		spin_unlock_irqrestore(&fgd->lock, flags);
+
+		if (ret)
+			return ret;
+
+		fgd->ctrl_req->length = length;
+
+		return usb_ep_queue(cdev->gadget->ep0, fgd->ctrl_req, GFP_ATOMIC);
+	}
+
+	cdev->req->length = length;
+
+	return usb_ep_queue(cdev->gadget->ep0, cdev->req, GFP_ATOMIC);
+}
+
+static bool f_gud_drm_req_match(struct usb_function *f, const struct usb_ctrlrequest *ctrl,
+				bool config0)
+{
+	struct f_gud_drm *fgd = func_to_f_gud_drm(f);
+
+	if (config0)
+		return false;
+
+	if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_VENDOR)
+		return false;
+
+	if ((ctrl->bRequestType & USB_RECIP_MASK) != USB_RECIP_INTERFACE)
+		return false;
+
+	return fgd->interface_id == le16_to_cpu(ctrl->wIndex);
+}
+
+static int f_gud_drm_set_alt(struct usb_function *f, unsigned int intf, unsigned int alt)
+{
+	struct usb_composite_dev *cdev = f->config->cdev;
+	struct f_gud_drm *fgd = func_to_f_gud_drm(f);
+	unsigned long flags;
+
+	if (alt || intf != fgd->interface_id)
+		return -EINVAL;
+
+	if (!fgd->bulk_ep->desc) {
+		pr_debug("%s: init\n", __func__);
+		if (config_ep_by_speed(cdev->gadget, f, fgd->bulk_ep)) {
+			fgd->bulk_ep->desc = NULL;
+			return -EINVAL;
+		}
+	}
+
+	pr_debug("%s: reset\n", __func__);
+
+	usb_ep_disable(fgd->bulk_ep);
+	usb_ep_enable(fgd->bulk_ep);
+
+	spin_lock_irqsave(&fgd->lock, flags);
+	fgd->ctrl_pending = false;
+	fgd->bulk_pending = false;
+	fgd->disable_pending = false;
+	spin_unlock_irqrestore(&fgd->lock, flags);
+
+	return 0;
+}
+
+static void f_gud_drm_disable(struct usb_function *f)
+{
+	struct f_gud_drm *fgd = func_to_f_gud_drm(f);
+	unsigned long flags;
+
+	pr_debug("%s\n", __func__);
+
+	usb_ep_disable(fgd->bulk_ep);
+
+	spin_lock_irqsave(&fgd->lock, flags);
+	fgd->ctrl_pending = false;
+	fgd->bulk_pending = false;
+	fgd->status_pending = false;
+	fgd->disable_pending = true;
+	fgd->errno = ESHUTDOWN;
+	spin_unlock_irqrestore(&fgd->lock, flags);
+
+	queue_work(system_long_wq, &fgd->worker);
+}
+
+static void f_gud_drm_unbind(struct usb_configuration *c, struct usb_function *f)
+{
+	struct f_gud_drm *fgd = func_to_f_gud_drm(f);
+	struct usb_composite_dev *cdev = fgd->func.config->cdev;
+
+	flush_work(&fgd->worker);
+
+	gud_drm_gadget_fini(fgd->gdg);
+	fgd->gdg = NULL;
+
+	kfree(fgd->bulk_req->buf);
+	usb_ep_free_request(fgd->bulk_ep, fgd->bulk_req);
+	usb_ep_free_request(cdev->gadget->ep0, fgd->ctrl_req);
+	fgd->ctrl_req = NULL;
+	fgd->bulk_req = NULL;
+	fgd->bulk_ep = NULL;
+
+	usb_free_all_descriptors(f);
+}
+
+static int f_gud_drm_bind(struct usb_configuration *c, struct usb_function *f)
+{
+	struct f_gud_drm_opts *opts = fi_to_f_gud_drm_opts(f->fi);
+	struct usb_composite_dev *cdev = c->cdev;
+	struct f_gud_drm *fgd = func_to_f_gud_drm(f);
+	struct usb_request *ctrl_req, *bulk_req;
+	struct gud_drm_gadget *gdg;
+	struct usb_string *us;
+	void *buf;
+	int ret;
+
+	us = usb_gstrings_attach(cdev, f_gud_drm_strings,
+				 ARRAY_SIZE(f_gud_drm_string_defs));
+	if (IS_ERR(us))
+		return PTR_ERR(us);
+
+	f_gud_drm_intf.iInterface = us[0].id;
+
+	ret = usb_interface_id(c, f);
+	if (ret < 0)
+		return ret;
+
+	fgd->interface_id = ret;
+	f_gud_drm_intf.bInterfaceNumber = fgd->interface_id;
+
+	fgd->bulk_ep = usb_ep_autoconfig(cdev->gadget, &f_gud_drm_fs_out_desc);
+	if (!fgd->bulk_ep)
+		return -ENODEV;
+
+	f_gud_drm_hs_out_desc.bEndpointAddress = f_gud_drm_fs_out_desc.bEndpointAddress;
+
+	f_gud_drm_ss_out_desc.bEndpointAddress = f_gud_drm_fs_out_desc.bEndpointAddress;
+
+	ret = usb_assign_descriptors(f, f_gud_drm_fs_function, f_gud_drm_hs_function,
+				     f_gud_drm_ss_function, NULL);
+	if (ret)
+		return ret;
+
+	ctrl_req = usb_ep_alloc_request(cdev->gadget->ep0, GFP_KERNEL);
+	if (!ctrl_req) {
+		ret = -ENOMEM;
+		goto fail_free_descs;
+	}
+
+	ctrl_req->buf = fgd->ctrl_req_buf;
+	ctrl_req->complete = f_gud_drm_ctrl_req_complete;
+	ctrl_req->context = fgd;
+
+	gdg = gud_drm_gadget_init(opts->drm_dev, opts->backlight_dev, &fgd->max_buffer_size);
+	if (IS_ERR(gdg)) {
+		ret = PTR_ERR(gdg);
+		goto fail_free_ctrl_req;
+	}
+
+	bulk_req = usb_ep_alloc_request(fgd->bulk_ep, GFP_KERNEL);
+	if (!bulk_req) {
+		ret = -ENOMEM;
+		goto fail_free_ctrl_req;
+	}
+
+	buf = kmalloc(fgd->max_buffer_size, GFP_KERNEL);
+	if (!buf) {
+		ret = -ENOMEM;
+		goto fail_free_bulk_req;
+	}
+
+	bulk_req->complete = f_gud_drm_bulk_complete;
+	bulk_req->context = fgd;
+	bulk_req->buf = buf;
+
+	fgd->ctrl_req = ctrl_req;
+	fgd->bulk_req = bulk_req;
+	fgd->gdg = gdg;
+
+	return 0;
+
+fail_free_bulk_req:
+	usb_ep_free_request(fgd->bulk_ep, bulk_req);
+fail_free_ctrl_req:
+	usb_ep_free_request(cdev->gadget->ep0, ctrl_req);
+fail_free_descs:
+	usb_free_all_descriptors(f);
+
+	return ret;
+}
+
+static void f_gud_drm_free_func(struct usb_function *f)
+{
+	struct f_gud_drm_opts *opts = container_of(f->fi, struct f_gud_drm_opts, func_inst);
+	struct f_gud_drm *fgd = func_to_f_gud_drm(f);
+
+	mutex_lock(&opts->lock);
+	opts->refcnt--;
+	mutex_unlock(&opts->lock);
+
+	kfree(fgd->ctrl_req_buf);
+	kfree(fgd);
+}
+
+static struct usb_function *f_gud_drm_alloc_func(struct usb_function_instance *fi)
+{
+	struct f_gud_drm_opts *opts = fi_to_f_gud_drm_opts(fi);
+	struct usb_function *func;
+	struct f_gud_drm *fgd;
+
+	fgd = kzalloc(sizeof(*fgd), GFP_KERNEL);
+	if (!fgd)
+		return ERR_PTR(-ENOMEM);
+
+	fgd->ctrl_req_buf = kmalloc(GUD_DRM_MAX_TRANSFER_SIZE, GFP_KERNEL);
+	if (!fgd->ctrl_req_buf)
+		goto error;
+
+	spin_lock_init(&fgd->lock);
+	INIT_WORK(&fgd->worker, f_gud_drm_worker);
+
+	mutex_lock(&opts->lock);
+	opts->refcnt++;
+	mutex_unlock(&opts->lock);
+
+	func = &fgd->func;
+	func->name = "gud_drm";
+	func->bind = f_gud_drm_bind;
+	func->unbind = f_gud_drm_unbind;
+	func->set_alt = f_gud_drm_set_alt;
+	func->req_match = f_gud_drm_req_match;
+	func->setup = f_gud_drm_setup;
+	func->disable = f_gud_drm_disable;
+	func->free_func = f_gud_drm_free_func;
+
+	return func;
+
+error:
+	kfree(fgd);
+
+	return ERR_PTR(-ENOMEM);
+}
+
+static ssize_t f_gud_drm_opts_drm_dev_show(struct config_item *item, char *page)
+{
+	struct f_gud_drm_opts *opts = ci_to_f_gud_drm_opts(item);
+	int result;
+
+	mutex_lock(&opts->lock);
+	result = sprintf(page, "%u\n", opts->drm_dev);
+	mutex_unlock(&opts->lock);
+
+	return result;
+}
+
+static ssize_t f_gud_drm_opts_drm_dev_store(struct config_item *item,
+					    const char *page, size_t len)
+{
+	struct f_gud_drm_opts *opts = ci_to_f_gud_drm_opts(item);
+	unsigned int num;
+	int ret;
+
+	mutex_lock(&opts->lock);
+	if (opts->refcnt) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	ret = kstrtouint(page, 0, &num);
+	if (ret)
+		goto unlock;
+
+	opts->drm_dev = num;
+	ret = len;
+unlock:
+	mutex_unlock(&opts->lock);
+
+	return ret;
+}
+
+CONFIGFS_ATTR(f_gud_drm_opts_, drm_dev);
+
+static ssize_t f_gud_drm_opts_backlight_dev_show(struct config_item *item, char *page)
+{
+	struct f_gud_drm_opts *opts = ci_to_f_gud_drm_opts(item);
+	ssize_t ret = 0;
+
+	mutex_lock(&opts->lock);
+	if (opts->backlight_dev)
+		ret = strscpy(page, opts->backlight_dev, PAGE_SIZE);
+	else
+		page[0] = '\0';
+	mutex_unlock(&opts->lock);
+
+	return ret;
+}
+
+static ssize_t f_gud_drm_opts_backlight_dev_store(struct config_item *item,
+						  const char *page, size_t len)
+{
+	struct f_gud_drm_opts *opts = ci_to_f_gud_drm_opts(item);
+	ssize_t ret;
+	char *name;
+
+	mutex_lock(&opts->lock);
+	if (opts->refcnt) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	name = kstrndup(page, len, GFP_KERNEL);
+	if (!name) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	kfree(opts->backlight_dev);
+	opts->backlight_dev = name;
+	ret = len;
+unlock:
+	mutex_unlock(&opts->lock);
+
+	return ret;
+}
+
+CONFIGFS_ATTR(f_gud_drm_opts_, backlight_dev);
+
+static struct configfs_attribute *f_gud_drm_attrs[] = {
+	&f_gud_drm_opts_attr_drm_dev,
+	&f_gud_drm_opts_attr_backlight_dev,
+	NULL,
+};
+
+static void f_gud_drm_attr_release(struct config_item *item)
+{
+	struct f_gud_drm_opts *opts = ci_to_f_gud_drm_opts(item);
+
+	usb_put_function_instance(&opts->func_inst);
+}
+
+static struct configfs_item_operations f_gud_drm_item_ops = {
+	.release	= f_gud_drm_attr_release,
+};
+
+static const struct config_item_type f_gud_drm_func_type = {
+	.ct_item_ops	= &f_gud_drm_item_ops,
+	.ct_attrs	= f_gud_drm_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void f_gud_drm_free_func_inst(struct usb_function_instance *fi)
+{
+	struct f_gud_drm_opts *opts = fi_to_f_gud_drm_opts(fi);
+
+	mutex_destroy(&opts->lock);
+	kfree(opts->backlight_dev);
+	kfree(opts);
+}
+
+static struct usb_function_instance *f_gud_drm_alloc_func_inst(void)
+{
+	struct f_gud_drm_opts *opts;
+
+	opts = kzalloc(sizeof(*opts), GFP_KERNEL);
+	if (!opts)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&opts->lock);
+	opts->func_inst.free_func_inst = f_gud_drm_free_func_inst;
+
+	config_group_init_type_name(&opts->func_inst.group, "", &f_gud_drm_func_type);
+
+	return &opts->func_inst;
+}
+
+DECLARE_USB_FUNCTION_INIT(gud_drm, f_gud_drm_alloc_func_inst, f_gud_drm_alloc_func);
+
+MODULE_DESCRIPTION("Generic USB Display Gadget");
+MODULE_AUTHOR("Noralf Trønnes");
+MODULE_LICENSE("GPL");
-- 
2.23.0

