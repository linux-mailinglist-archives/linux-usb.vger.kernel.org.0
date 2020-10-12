Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DC728B374
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 13:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387867AbgJLLKp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 07:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387594AbgJLLKo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Oct 2020 07:10:44 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55306C0613CE
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 04:10:44 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id m11so2880052qvt.11
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=vyjUo4iqfTYXZjl1RjOLeHlLDMkwl2MkVwAUCYCeRqo=;
        b=a31cdSl0ArY34hN52bV31QGPrdI/8NxB/3U+OHTVenV491rUivLYassE/h8vSPRo5I
         pZPat40cQQwpjt5THgoOCtRsw/VntrGnKg1CFr3w845zyH6pbaslujR9SU4ySgTvlMDC
         y92h1ZUyM0PmkfMreijyrkQccCh23Jp4eoyfrQxIStgoxhOAZ23euXiJAvEDlpwfJ7b6
         iD4NNollUWM+WK2PceIlL6h0RYMWyrKi3q/FOT0My7e4ViCMtbYjh6ldvJ8yzwSxjY8K
         FlbOUgC8Xspz3UxiImkBPRzy7LE2tVS4uZ+Ma1X29HD2rGXASeIhN0pCxnFRhR/k/xlE
         277Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vyjUo4iqfTYXZjl1RjOLeHlLDMkwl2MkVwAUCYCeRqo=;
        b=iFSdzLmiv+lb7QAGRoja5Gmf+bkdT0QNbswgXubrdgSTcB5htj5MaqQ53aB7WISkWm
         C6sSiGOiSO4UUpzP7iGaejV+PnTmKFPEKt6LY0YQUou2wUQbNLJrjOdUZbeejZRH0M9s
         qVwv6fneJKrNDMGS63Ytw538s9FQ+5oKWCPhsmJxkreC4jQPiEVwEn/8pp6Ej4j5vQkn
         KJZqHRas7WrhscKDY47nb1OPUM6GR6hzu9yudO8cPpgR7pwVJ56yyV7WNuZIFXjwNlS2
         a8R3hKOw984F1ZxBTtTunvB5ntba6fZIt3wXOd6cRK8/HZe7okkppfYjfT3ujgcGFSnx
         AN7w==
X-Gm-Message-State: AOAM533uYdjPLmGjSxlHycQYDTujTsArlVGAGS4TlFS/977ST5YB/PBv
        KLhU2DdbFt5MYmXkpsobhxhvayr/tuDOWA==
X-Google-Smtp-Source: ABdhPJxUHAsWLVh7cBbOmRpWe14oqXfhnklPgqfcs9znjwce7Eo3ygbi3VRjfMTxS+khqDuVbyLtxhMjsQEdWw==
Sender: "rickyniu via sendgmr" <rickyniu@rickyniu.ntc.corp.google.com>
X-Received: from rickyniu.ntc.corp.google.com ([2401:fa00:fc:1:3e52:82ff:fe5e:efef])
 (user=rickyniu job=sendgmr) by 2002:a0c:aa98:: with SMTP id
 f24mr21272242qvb.62.1602501043361; Mon, 12 Oct 2020 04:10:43 -0700 (PDT)
Date:   Mon, 12 Oct 2020 19:10:22 +0800
In-Reply-To: <20201012111024.2259162-1-rickyniu@google.com>
Message-Id: <20201012111024.2259162-2-rickyniu@google.com>
Mime-Version: 1.0
References: <20201012111024.2259162-1-rickyniu@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH 1/3] ANDROID: usb: gadget: f_accessory: Add Android Accessory function
From:   rickyniu <rickyniu@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, astrachan@google.com,
        rickyniu@google.com, amit.pundir@linaro.org, lockwood@android.com,
        benoit@android.com, jackp@codeaurora.org, vvreddy@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        kyletso@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Benoit Goby <benoit@android.com>

USB accessory mode allows users to connect USB host hardware
specifically designed for Android-powered devices. The accessories
must adhere to the Android accessory protocol outlined in the
http://accessories.android.com documentation. This allows
Android devices that cannot act as a USB host to still interact with
USB hardware. When an Android device is in USB accessory mode, the
attached Android USB accessory acts as the host, provides power
to the USB bus, and enumerates connected devices.

Signed-off-by: Mike Lockwood <lockwood@android.com>
[AmitP: Folded following android-4.9 commit changes into this patch
        ceb2f0aac624 ("ANDROID: usb: gadget: accessory: Fix section mismatch")
        Parts of e27543931009 ("ANDROID: usb: gadget: Fixes and hacks to make android usb gadget compile on 3.8")
        1b07ec751563 ("ANDROID: drivers: usb: gadget: 64-bit related type fixes")]
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
[astrachan: Folded the following changes into this patch:
            9d5891d516e2 ("ANDROID: usb: gadget: f_accessory: Add ACCESSORY_SET_AUDIO_MODE control request and ioctl")
            dc66cfce9622 ("ANDROID: usb: gadget: f_accessory: Add support for HID input devices")
            5f1ac9c2871b ("ANDROID: usb: gadget: f_accessory: move userspace interface to uapi")
            9a6241722cd8 ("ANDROID: usb: gadget: f_accessory: Enabled Zero Length Packet (ZLP) for acc_write")
            31a0ecd5a825 ("ANDROID: usb: gadget: f_accessory: check for accessory device before disconnecting HIDs")
            580721fa6cbc ("ANDROID: usb: gadget: f_accessory: Migrate to USB_FUNCTION API")
            7f407172fb28 ("ANDROID: usb: gadget: f_accessory: Fix for UsbAccessory clean unbind.")
            ebc98ac5a22f ("ANDROID: usb: gadget: f_accessory: fix false disconnect due to a signal sent to the reading process")
            71c6dc5ffdab ("ANDROID: usb: gadget: f_accessory: assign no-op request complete callbacks")
            675047ee68e9 ("ANDROID: usb: gadget: f_accessory: Move gadget functions code")
            b2bedaa5c7df ("CHROMIUM: usb: gadget: f_accessory: add .raw_request callback")]
Signed-off-by: Alistair Strachan <astrachan@google.com>
Signed-off-by: rickyniu <rickyniu@google.com>
---
 drivers/usb/gadget/Kconfig                |   10 +
 drivers/usb/gadget/function/Makefile      |    2 +
 drivers/usb/gadget/function/f_accessory.c | 1352 +++++++++++++++++++++
 include/linux/usb/f_accessory.h           |   23 +
 include/uapi/linux/usb/f_accessory.h      |  146 +++
 5 files changed, 1533 insertions(+)
 create mode 100644 drivers/usb/gadget/function/f_accessory.c
 create mode 100644 include/linux/usb/f_accessory.h
 create mode 100644 include/uapi/linux/usb/f_accessory.h

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 02ff850278b1..ef8114720c73 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -216,6 +216,9 @@ config USB_F_PRINTER
 config USB_F_TCM
 	tristate
 
+config USB_F_ACC
+	tristate
+
 # this first set of drivers all depend on bulk-capable hardware.
 
 config USB_CONFIGFS
@@ -369,6 +372,13 @@ config USB_CONFIGFS_F_FS
 	  implemented in kernel space (for instance Ethernet, serial or
 	  mass storage) and other are implemented in user space.
 
+config USB_CONFIGFS_F_ACC
+	bool "Accessory gadget"
+	depends on USB_CONFIGFS
+	select USB_F_ACC
+	help
+	  USB gadget Accessory support
+
 config USB_CONFIGFS_F_UAC1
 	bool "Audio Class 1.0"
 	depends on USB_CONFIGFS
diff --git a/drivers/usb/gadget/function/Makefile b/drivers/usb/gadget/function/Makefile
index 5d3a6cf02218..2305360e5f22 100644
--- a/drivers/usb/gadget/function/Makefile
+++ b/drivers/usb/gadget/function/Makefile
@@ -50,3 +50,5 @@ usb_f_printer-y			:= f_printer.o
 obj-$(CONFIG_USB_F_PRINTER)	+= usb_f_printer.o
 usb_f_tcm-y			:= f_tcm.o
 obj-$(CONFIG_USB_F_TCM)		+= usb_f_tcm.o
+usb_f_accessory-y		:= f_accessory.o
+obj-$(CONFIG_USB_F_ACC)		+= usb_f_accessory.o
diff --git a/drivers/usb/gadget/function/f_accessory.c b/drivers/usb/gadget/function/f_accessory.c
new file mode 100644
index 000000000000..514eadee1793
--- /dev/null
+++ b/drivers/usb/gadget/function/f_accessory.c
@@ -0,0 +1,1352 @@
+/*
+ * Gadget Function Driver for Android USB accessories
+ *
+ * Copyright (C) 2011 Google, Inc.
+ * Author: Mike Lockwood <lockwood@android.com>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+/* #define DEBUG */
+/* #define VERBOSE_DEBUG */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/poll.h>
+#include <linux/delay.h>
+#include <linux/wait.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/kthread.h>
+#include <linux/freezer.h>
+
+#include <linux/types.h>
+#include <linux/file.h>
+#include <linux/device.h>
+#include <linux/miscdevice.h>
+
+#include <linux/hid.h>
+#include <linux/hiddev.h>
+#include <linux/usb.h>
+#include <linux/usb/ch9.h>
+#include <linux/usb/f_accessory.h>
+
+#include <linux/configfs.h>
+#include <linux/usb/composite.h>
+
+#define MAX_INST_NAME_LEN        40
+#define BULK_BUFFER_SIZE    16384
+#define ACC_STRING_SIZE     256
+
+#define PROTOCOL_VERSION    2
+
+/* String IDs */
+#define INTERFACE_STRING_INDEX	0
+
+/* number of tx and rx requests to allocate */
+#define TX_REQ_MAX 4
+#define RX_REQ_MAX 2
+
+struct acc_hid_dev {
+	struct list_head	list;
+	struct hid_device *hid;
+	struct acc_dev *dev;
+	/* accessory defined ID */
+	int id;
+	/* HID report descriptor */
+	u8 *report_desc;
+	/* length of HID report descriptor */
+	int report_desc_len;
+	/* number of bytes of report_desc we have received so far */
+	int report_desc_offset;
+};
+
+struct acc_dev {
+	struct usb_function function;
+	struct usb_composite_dev *cdev;
+	spinlock_t lock;
+
+	struct usb_ep *ep_in;
+	struct usb_ep *ep_out;
+
+	/* online indicates state of function_set_alt & function_unbind
+	 * set to 1 when we connect
+	 */
+	int online:1;
+
+	/* disconnected indicates state of open & release
+	 * Set to 1 when we disconnect.
+	 * Not cleared until our file is closed.
+	 */
+	int disconnected:1;
+
+	/* strings sent by the host */
+	char manufacturer[ACC_STRING_SIZE];
+	char model[ACC_STRING_SIZE];
+	char description[ACC_STRING_SIZE];
+	char version[ACC_STRING_SIZE];
+	char uri[ACC_STRING_SIZE];
+	char serial[ACC_STRING_SIZE];
+
+	/* for acc_complete_set_string */
+	int string_index;
+
+	/* set to 1 if we have a pending start request */
+	int start_requested;
+
+	int audio_mode;
+
+	/* synchronize access to our device file */
+	atomic_t open_excl;
+
+	struct list_head tx_idle;
+
+	wait_queue_head_t read_wq;
+	wait_queue_head_t write_wq;
+	struct usb_request *rx_req[RX_REQ_MAX];
+	int rx_done;
+
+	/* delayed work for handling ACCESSORY_START */
+	struct delayed_work start_work;
+
+	/* worker for registering and unregistering hid devices */
+	struct work_struct hid_work;
+
+	/* list of active HID devices */
+	struct list_head	hid_list;
+
+	/* list of new HID devices to register */
+	struct list_head	new_hid_list;
+
+	/* list of dead HID devices to unregister */
+	struct list_head	dead_hid_list;
+};
+
+static struct usb_interface_descriptor acc_interface_desc = {
+	.bLength                = USB_DT_INTERFACE_SIZE,
+	.bDescriptorType        = USB_DT_INTERFACE,
+	.bInterfaceNumber       = 0,
+	.bNumEndpoints          = 2,
+	.bInterfaceClass        = USB_CLASS_VENDOR_SPEC,
+	.bInterfaceSubClass     = USB_SUBCLASS_VENDOR_SPEC,
+	.bInterfaceProtocol     = 0,
+};
+
+static struct usb_endpoint_descriptor acc_highspeed_in_desc = {
+	.bLength                = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType        = USB_DT_ENDPOINT,
+	.bEndpointAddress       = USB_DIR_IN,
+	.bmAttributes           = USB_ENDPOINT_XFER_BULK,
+	.wMaxPacketSize         = __constant_cpu_to_le16(512),
+};
+
+static struct usb_endpoint_descriptor acc_highspeed_out_desc = {
+	.bLength                = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType        = USB_DT_ENDPOINT,
+	.bEndpointAddress       = USB_DIR_OUT,
+	.bmAttributes           = USB_ENDPOINT_XFER_BULK,
+	.wMaxPacketSize         = __constant_cpu_to_le16(512),
+};
+
+static struct usb_endpoint_descriptor acc_fullspeed_in_desc = {
+	.bLength                = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType        = USB_DT_ENDPOINT,
+	.bEndpointAddress       = USB_DIR_IN,
+	.bmAttributes           = USB_ENDPOINT_XFER_BULK,
+};
+
+static struct usb_endpoint_descriptor acc_fullspeed_out_desc = {
+	.bLength                = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType        = USB_DT_ENDPOINT,
+	.bEndpointAddress       = USB_DIR_OUT,
+	.bmAttributes           = USB_ENDPOINT_XFER_BULK,
+};
+
+static struct usb_descriptor_header *fs_acc_descs[] = {
+	(struct usb_descriptor_header *) &acc_interface_desc,
+	(struct usb_descriptor_header *) &acc_fullspeed_in_desc,
+	(struct usb_descriptor_header *) &acc_fullspeed_out_desc,
+	NULL,
+};
+
+static struct usb_descriptor_header *hs_acc_descs[] = {
+	(struct usb_descriptor_header *) &acc_interface_desc,
+	(struct usb_descriptor_header *) &acc_highspeed_in_desc,
+	(struct usb_descriptor_header *) &acc_highspeed_out_desc,
+	NULL,
+};
+
+static struct usb_string acc_string_defs[] = {
+	[INTERFACE_STRING_INDEX].s	= "Android Accessory Interface",
+	{  },	/* end of list */
+};
+
+static struct usb_gadget_strings acc_string_table = {
+	.language		= 0x0409,	/* en-US */
+	.strings		= acc_string_defs,
+};
+
+static struct usb_gadget_strings *acc_strings[] = {
+	&acc_string_table,
+	NULL,
+};
+
+/* temporary variable used between acc_open() and acc_gadget_bind() */
+static struct acc_dev *_acc_dev;
+
+struct acc_instance {
+	struct usb_function_instance func_inst;
+	const char *name;
+};
+
+static inline struct acc_dev *func_to_dev(struct usb_function *f)
+{
+	return container_of(f, struct acc_dev, function);
+}
+
+static struct usb_request *acc_request_new(struct usb_ep *ep, int buffer_size)
+{
+	struct usb_request *req = usb_ep_alloc_request(ep, GFP_KERNEL);
+
+	if (!req)
+		return NULL;
+
+	/* now allocate buffers for the requests */
+	req->buf = kmalloc(buffer_size, GFP_KERNEL);
+	if (!req->buf) {
+		usb_ep_free_request(ep, req);
+		return NULL;
+	}
+
+	return req;
+}
+
+static void acc_request_free(struct usb_request *req, struct usb_ep *ep)
+{
+	if (req) {
+		kfree(req->buf);
+		usb_ep_free_request(ep, req);
+	}
+}
+
+/* add a request to the tail of a list */
+static void req_put(struct acc_dev *dev, struct list_head *head,
+		struct usb_request *req)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->lock, flags);
+	list_add_tail(&req->list, head);
+	spin_unlock_irqrestore(&dev->lock, flags);
+}
+
+/* remove a request from the head of a list */
+static struct usb_request *req_get(struct acc_dev *dev, struct list_head *head)
+{
+	unsigned long flags;
+	struct usb_request *req;
+
+	spin_lock_irqsave(&dev->lock, flags);
+	if (list_empty(head)) {
+		req = 0;
+	} else {
+		req = list_first_entry(head, struct usb_request, list);
+		list_del(&req->list);
+	}
+	spin_unlock_irqrestore(&dev->lock, flags);
+	return req;
+}
+
+static void acc_set_disconnected(struct acc_dev *dev)
+{
+	dev->disconnected = 1;
+}
+
+static void acc_complete_in(struct usb_ep *ep, struct usb_request *req)
+{
+	struct acc_dev *dev = _acc_dev;
+
+	if (req->status == -ESHUTDOWN) {
+		pr_debug("acc_complete_in set disconnected");
+		acc_set_disconnected(dev);
+	}
+
+	req_put(dev, &dev->tx_idle, req);
+
+	wake_up(&dev->write_wq);
+}
+
+static void acc_complete_out(struct usb_ep *ep, struct usb_request *req)
+{
+	struct acc_dev *dev = _acc_dev;
+
+	dev->rx_done = 1;
+	if (req->status == -ESHUTDOWN) {
+		pr_debug("acc_complete_out set disconnected");
+		acc_set_disconnected(dev);
+	}
+
+	wake_up(&dev->read_wq);
+}
+
+static void acc_complete_set_string(struct usb_ep *ep, struct usb_request *req)
+{
+	struct acc_dev	*dev = ep->driver_data;
+	char *string_dest = NULL;
+	int length = req->actual;
+
+	if (req->status != 0) {
+		pr_err("acc_complete_set_string, err %d\n", req->status);
+		return;
+	}
+
+	switch (dev->string_index) {
+	case ACCESSORY_STRING_MANUFACTURER:
+		string_dest = dev->manufacturer;
+		break;
+	case ACCESSORY_STRING_MODEL:
+		string_dest = dev->model;
+		break;
+	case ACCESSORY_STRING_DESCRIPTION:
+		string_dest = dev->description;
+		break;
+	case ACCESSORY_STRING_VERSION:
+		string_dest = dev->version;
+		break;
+	case ACCESSORY_STRING_URI:
+		string_dest = dev->uri;
+		break;
+	case ACCESSORY_STRING_SERIAL:
+		string_dest = dev->serial;
+		break;
+	}
+	if (string_dest) {
+		unsigned long flags;
+
+		if (length >= ACC_STRING_SIZE)
+			length = ACC_STRING_SIZE - 1;
+
+		spin_lock_irqsave(&dev->lock, flags);
+		memcpy(string_dest, req->buf, length);
+		/* ensure zero termination */
+		string_dest[length] = 0;
+		spin_unlock_irqrestore(&dev->lock, flags);
+	} else {
+		pr_err("unknown accessory string index %d\n",
+			dev->string_index);
+	}
+}
+
+static void acc_complete_set_hid_report_desc(struct usb_ep *ep,
+		struct usb_request *req)
+{
+	struct acc_hid_dev *hid = req->context;
+	struct acc_dev *dev = hid->dev;
+	int length = req->actual;
+
+	if (req->status != 0) {
+		pr_err("acc_complete_set_hid_report_desc, err %d\n",
+			req->status);
+		return;
+	}
+
+	memcpy(hid->report_desc + hid->report_desc_offset, req->buf, length);
+	hid->report_desc_offset += length;
+	if (hid->report_desc_offset == hid->report_desc_len) {
+		/* After we have received the entire report descriptor
+		 * we schedule work to initialize the HID device
+		 */
+		schedule_work(&dev->hid_work);
+	}
+}
+
+static void acc_complete_send_hid_event(struct usb_ep *ep,
+		struct usb_request *req)
+{
+	struct acc_hid_dev *hid = req->context;
+	int length = req->actual;
+
+	if (req->status != 0) {
+		pr_err("acc_complete_send_hid_event, err %d\n", req->status);
+		return;
+	}
+
+	hid_report_raw_event(hid->hid, HID_INPUT_REPORT, req->buf, length, 1);
+}
+
+static int acc_hid_parse(struct hid_device *hid)
+{
+	struct acc_hid_dev *hdev = hid->driver_data;
+
+	hid_parse_report(hid, hdev->report_desc, hdev->report_desc_len);
+	return 0;
+}
+
+static int acc_hid_start(struct hid_device *hid)
+{
+	return 0;
+}
+
+static void acc_hid_stop(struct hid_device *hid)
+{
+}
+
+static int acc_hid_open(struct hid_device *hid)
+{
+	return 0;
+}
+
+static void acc_hid_close(struct hid_device *hid)
+{
+}
+
+static int acc_hid_raw_request(struct hid_device *hid, unsigned char reportnum,
+	__u8 *buf, size_t len, unsigned char rtype, int reqtype)
+{
+	return 0;
+}
+
+static struct hid_ll_driver acc_hid_ll_driver = {
+	.parse = acc_hid_parse,
+	.start = acc_hid_start,
+	.stop = acc_hid_stop,
+	.open = acc_hid_open,
+	.close = acc_hid_close,
+	.raw_request = acc_hid_raw_request,
+};
+
+static struct acc_hid_dev *acc_hid_new(struct acc_dev *dev,
+		int id, int desc_len)
+{
+	struct acc_hid_dev *hdev;
+
+	hdev = kzalloc(sizeof(*hdev), GFP_ATOMIC);
+	if (!hdev)
+		return NULL;
+	hdev->report_desc = kzalloc(desc_len, GFP_ATOMIC);
+	if (!hdev->report_desc) {
+		kfree(hdev);
+		return NULL;
+	}
+	hdev->dev = dev;
+	hdev->id = id;
+	hdev->report_desc_len = desc_len;
+
+	return hdev;
+}
+
+static struct acc_hid_dev *acc_hid_get(struct list_head *list, int id)
+{
+	struct acc_hid_dev *hid;
+
+	list_for_each_entry(hid, list, list) {
+		if (hid->id == id)
+			return hid;
+	}
+	return NULL;
+}
+
+static int acc_register_hid(struct acc_dev *dev, int id, int desc_length)
+{
+	struct acc_hid_dev *hid;
+	unsigned long flags;
+
+	/* report descriptor length must be > 0 */
+	if (desc_length <= 0)
+		return -EINVAL;
+
+	spin_lock_irqsave(&dev->lock, flags);
+	/* replace HID if one already exists with this ID */
+	hid = acc_hid_get(&dev->hid_list, id);
+	if (!hid)
+		hid = acc_hid_get(&dev->new_hid_list, id);
+	if (hid)
+		list_move(&hid->list, &dev->dead_hid_list);
+
+	hid = acc_hid_new(dev, id, desc_length);
+	if (!hid) {
+		spin_unlock_irqrestore(&dev->lock, flags);
+		return -ENOMEM;
+	}
+
+	list_add(&hid->list, &dev->new_hid_list);
+	spin_unlock_irqrestore(&dev->lock, flags);
+
+	/* schedule work to register the HID device */
+	schedule_work(&dev->hid_work);
+	return 0;
+}
+
+static int acc_unregister_hid(struct acc_dev *dev, int id)
+{
+	struct acc_hid_dev *hid;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->lock, flags);
+	hid = acc_hid_get(&dev->hid_list, id);
+	if (!hid)
+		hid = acc_hid_get(&dev->new_hid_list, id);
+	if (!hid) {
+		spin_unlock_irqrestore(&dev->lock, flags);
+		return -EINVAL;
+	}
+
+	list_move(&hid->list, &dev->dead_hid_list);
+	spin_unlock_irqrestore(&dev->lock, flags);
+
+	schedule_work(&dev->hid_work);
+	return 0;
+}
+
+static int create_bulk_endpoints(struct acc_dev *dev,
+				struct usb_endpoint_descriptor *in_desc,
+				struct usb_endpoint_descriptor *out_desc)
+{
+	struct usb_composite_dev *cdev = dev->cdev;
+	struct usb_request *req;
+	struct usb_ep *ep;
+	int i;
+
+	DBG(cdev, "create_bulk_endpoints dev: %p\n", dev);
+
+	ep = usb_ep_autoconfig(cdev->gadget, in_desc);
+	if (!ep) {
+		DBG(cdev, "usb_ep_autoconfig for ep_in failed\n");
+		return -ENODEV;
+	}
+	DBG(cdev, "usb_ep_autoconfig for ep_in got %s\n", ep->name);
+	ep->driver_data = dev;		/* claim the endpoint */
+	dev->ep_in = ep;
+
+	ep = usb_ep_autoconfig(cdev->gadget, out_desc);
+	if (!ep) {
+		DBG(cdev, "usb_ep_autoconfig for ep_out failed\n");
+		return -ENODEV;
+	}
+	DBG(cdev, "usb_ep_autoconfig for ep_out got %s\n", ep->name);
+	ep->driver_data = dev;		/* claim the endpoint */
+	dev->ep_out = ep;
+
+	/* now allocate requests for our endpoints */
+	for (i = 0; i < TX_REQ_MAX; i++) {
+		req = acc_request_new(dev->ep_in, BULK_BUFFER_SIZE);
+		if (!req)
+			goto fail;
+		req->complete = acc_complete_in;
+		req_put(dev, &dev->tx_idle, req);
+	}
+	for (i = 0; i < RX_REQ_MAX; i++) {
+		req = acc_request_new(dev->ep_out, BULK_BUFFER_SIZE);
+		if (!req)
+			goto fail;
+		req->complete = acc_complete_out;
+		dev->rx_req[i] = req;
+	}
+
+	return 0;
+
+fail:
+	pr_err("acc_bind() could not allocate requests\n");
+	while ((req = req_get(dev, &dev->tx_idle)))
+		acc_request_free(req, dev->ep_in);
+	for (i = 0; i < RX_REQ_MAX; i++)
+		acc_request_free(dev->rx_req[i], dev->ep_out);
+	return -1;
+}
+
+static ssize_t acc_read(struct file *fp, char __user *buf,
+	size_t count, loff_t *pos)
+{
+	struct acc_dev *dev = fp->private_data;
+	struct usb_request *req;
+	ssize_t r = count;
+	unsigned xfer;
+	int ret = 0;
+
+	pr_debug("acc_read(%zu)\n", count);
+
+	if (dev->disconnected) {
+		pr_debug("acc_read disconnected");
+		return -ENODEV;
+	}
+
+	if (count > BULK_BUFFER_SIZE)
+		count = BULK_BUFFER_SIZE;
+
+	/* we will block until we're online */
+	pr_debug("acc_read: waiting for online\n");
+	ret = wait_event_interruptible(dev->read_wq, dev->online);
+	if (ret < 0) {
+		r = ret;
+		goto done;
+	}
+
+	if (dev->rx_done) {
+		// last req cancelled. try to get it.
+		req = dev->rx_req[0];
+		goto copy_data;
+	}
+
+requeue_req:
+	/* queue a request */
+	req = dev->rx_req[0];
+	req->length = count;
+	dev->rx_done = 0;
+	ret = usb_ep_queue(dev->ep_out, req, GFP_KERNEL);
+	if (ret < 0) {
+		r = -EIO;
+		goto done;
+	} else {
+		pr_debug("rx %p queue\n", req);
+	}
+
+	/* wait for a request to complete */
+	ret = wait_event_interruptible(dev->read_wq, dev->rx_done);
+	if (ret < 0) {
+		r = ret;
+		ret = usb_ep_dequeue(dev->ep_out, req);
+		if (ret != 0) {
+			// cancel failed. There can be a data already received.
+			// it will be retrieved in the next read.
+			pr_debug("acc_read: cancelling failed %d", ret);
+		}
+		goto done;
+	}
+
+copy_data:
+	dev->rx_done = 0;
+	if (dev->online) {
+		/* If we got a 0-len packet, throw it back and try again. */
+		if (req->actual == 0)
+			goto requeue_req;
+
+		pr_debug("rx %p %u\n", req, req->actual);
+		xfer = (req->actual < count) ? req->actual : count;
+		r = xfer;
+		if (copy_to_user(buf, req->buf, xfer))
+			r = -EFAULT;
+	} else
+		r = -EIO;
+
+done:
+	pr_debug("acc_read returning %zd\n", r);
+	return r;
+}
+
+static ssize_t acc_write(struct file *fp, const char __user *buf,
+	size_t count, loff_t *pos)
+{
+	struct acc_dev *dev = fp->private_data;
+	struct usb_request *req = 0;
+	ssize_t r = count;
+	unsigned xfer;
+	int ret;
+
+	pr_debug("acc_write(%zu)\n", count);
+
+	if (!dev->online || dev->disconnected) {
+		pr_debug("acc_write disconnected or not online");
+		return -ENODEV;
+	}
+
+	while (count > 0) {
+		if (!dev->online) {
+			pr_debug("acc_write dev->error\n");
+			r = -EIO;
+			break;
+		}
+
+		/* get an idle tx request to use */
+		req = 0;
+		ret = wait_event_interruptible(dev->write_wq,
+			((req = req_get(dev, &dev->tx_idle)) || !dev->online));
+		if (!req) {
+			r = ret;
+			break;
+		}
+
+		if (count > BULK_BUFFER_SIZE) {
+			xfer = BULK_BUFFER_SIZE;
+			/* ZLP, They will be more TX requests so not yet. */
+			req->zero = 0;
+		} else {
+			xfer = count;
+			/* If the data length is a multple of the
+			 * maxpacket size then send a zero length packet(ZLP).
+			*/
+			req->zero = ((xfer % dev->ep_in->maxpacket) == 0);
+		}
+		if (copy_from_user(req->buf, buf, xfer)) {
+			r = -EFAULT;
+			break;
+		}
+
+		req->length = xfer;
+		ret = usb_ep_queue(dev->ep_in, req, GFP_KERNEL);
+		if (ret < 0) {
+			pr_debug("acc_write: xfer error %d\n", ret);
+			r = -EIO;
+			break;
+		}
+
+		buf += xfer;
+		count -= xfer;
+
+		/* zero this so we don't try to free it on error exit */
+		req = 0;
+	}
+
+	if (req)
+		req_put(dev, &dev->tx_idle, req);
+
+	pr_debug("acc_write returning %zd\n", r);
+	return r;
+}
+
+static long acc_ioctl(struct file *fp, unsigned code, unsigned long value)
+{
+	struct acc_dev *dev = fp->private_data;
+	char *src = NULL;
+	int ret;
+
+	switch (code) {
+	case ACCESSORY_GET_STRING_MANUFACTURER:
+		src = dev->manufacturer;
+		break;
+	case ACCESSORY_GET_STRING_MODEL:
+		src = dev->model;
+		break;
+	case ACCESSORY_GET_STRING_DESCRIPTION:
+		src = dev->description;
+		break;
+	case ACCESSORY_GET_STRING_VERSION:
+		src = dev->version;
+		break;
+	case ACCESSORY_GET_STRING_URI:
+		src = dev->uri;
+		break;
+	case ACCESSORY_GET_STRING_SERIAL:
+		src = dev->serial;
+		break;
+	case ACCESSORY_IS_START_REQUESTED:
+		return dev->start_requested;
+	case ACCESSORY_GET_AUDIO_MODE:
+		return dev->audio_mode;
+	}
+	if (!src)
+		return -EINVAL;
+
+	ret = strlen(src) + 1;
+	if (copy_to_user((void __user *)value, src, ret))
+		ret = -EFAULT;
+	return ret;
+}
+
+static int acc_open(struct inode *ip, struct file *fp)
+{
+	printk(KERN_INFO "acc_open\n");
+	if (atomic_xchg(&_acc_dev->open_excl, 1))
+		return -EBUSY;
+
+	_acc_dev->disconnected = 0;
+	fp->private_data = _acc_dev;
+	return 0;
+}
+
+static int acc_release(struct inode *ip, struct file *fp)
+{
+	printk(KERN_INFO "acc_release\n");
+
+	WARN_ON(!atomic_xchg(&_acc_dev->open_excl, 0));
+	/* indicate that we are disconnected
+	 * still could be online so don't touch online flag
+	 */
+	_acc_dev->disconnected = 1;
+	return 0;
+}
+
+/* file operations for /dev/usb_accessory */
+static const struct file_operations acc_fops = {
+	.owner = THIS_MODULE,
+	.read = acc_read,
+	.write = acc_write,
+	.unlocked_ioctl = acc_ioctl,
+	.open = acc_open,
+	.release = acc_release,
+};
+
+static int acc_hid_probe(struct hid_device *hdev,
+		const struct hid_device_id *id)
+{
+	int ret;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+	return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+}
+
+static struct miscdevice acc_device = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "usb_accessory",
+	.fops = &acc_fops,
+};
+
+static const struct hid_device_id acc_hid_table[] = {
+	{ HID_USB_DEVICE(HID_ANY_ID, HID_ANY_ID) },
+	{ }
+};
+
+static struct hid_driver acc_hid_driver = {
+	.name = "USB accessory",
+	.id_table = acc_hid_table,
+	.probe = acc_hid_probe,
+};
+
+static void acc_complete_setup_noop(struct usb_ep *ep, struct usb_request *req)
+{
+	/*
+	 * Default no-op function when nothing needs to be done for the
+	 * setup request
+	 */
+}
+
+int acc_ctrlrequest(struct usb_composite_dev *cdev,
+				const struct usb_ctrlrequest *ctrl)
+{
+	struct acc_dev	*dev = _acc_dev;
+	int	value = -EOPNOTSUPP;
+	struct acc_hid_dev *hid;
+	int offset;
+	u8 b_requestType = ctrl->bRequestType;
+	u8 b_request = ctrl->bRequest;
+	u16	w_index = le16_to_cpu(ctrl->wIndex);
+	u16	w_value = le16_to_cpu(ctrl->wValue);
+	u16	w_length = le16_to_cpu(ctrl->wLength);
+	unsigned long flags;
+
+/*
+	printk(KERN_INFO "acc_ctrlrequest "
+			"%02x.%02x v%04x i%04x l%u\n",
+			b_requestType, b_request,
+			w_value, w_index, w_length);
+*/
+
+	if (b_requestType == (USB_DIR_OUT | USB_TYPE_VENDOR)) {
+		if (b_request == ACCESSORY_START) {
+			dev->start_requested = 1;
+			schedule_delayed_work(
+				&dev->start_work, msecs_to_jiffies(10));
+			value = 0;
+			cdev->req->complete = acc_complete_setup_noop;
+		} else if (b_request == ACCESSORY_SEND_STRING) {
+			dev->string_index = w_index;
+			cdev->gadget->ep0->driver_data = dev;
+			cdev->req->complete = acc_complete_set_string;
+			value = w_length;
+		} else if (b_request == ACCESSORY_SET_AUDIO_MODE &&
+				w_index == 0 && w_length == 0) {
+			dev->audio_mode = w_value;
+			cdev->req->complete = acc_complete_setup_noop;
+			value = 0;
+		} else if (b_request == ACCESSORY_REGISTER_HID) {
+			cdev->req->complete = acc_complete_setup_noop;
+			value = acc_register_hid(dev, w_value, w_index);
+		} else if (b_request == ACCESSORY_UNREGISTER_HID) {
+			cdev->req->complete = acc_complete_setup_noop;
+			value = acc_unregister_hid(dev, w_value);
+		} else if (b_request == ACCESSORY_SET_HID_REPORT_DESC) {
+			spin_lock_irqsave(&dev->lock, flags);
+			hid = acc_hid_get(&dev->new_hid_list, w_value);
+			spin_unlock_irqrestore(&dev->lock, flags);
+			if (!hid) {
+				value = -EINVAL;
+				goto err;
+			}
+			offset = w_index;
+			if (offset != hid->report_desc_offset
+				|| offset + w_length > hid->report_desc_len) {
+				value = -EINVAL;
+				goto err;
+			}
+			cdev->req->context = hid;
+			cdev->req->complete = acc_complete_set_hid_report_desc;
+			value = w_length;
+		} else if (b_request == ACCESSORY_SEND_HID_EVENT) {
+			spin_lock_irqsave(&dev->lock, flags);
+			hid = acc_hid_get(&dev->hid_list, w_value);
+			spin_unlock_irqrestore(&dev->lock, flags);
+			if (!hid) {
+				value = -EINVAL;
+				goto err;
+			}
+			cdev->req->context = hid;
+			cdev->req->complete = acc_complete_send_hid_event;
+			value = w_length;
+		}
+	} else if (b_requestType == (USB_DIR_IN | USB_TYPE_VENDOR)) {
+		if (b_request == ACCESSORY_GET_PROTOCOL) {
+			*((u16 *)cdev->req->buf) = PROTOCOL_VERSION;
+			value = sizeof(u16);
+			cdev->req->complete = acc_complete_setup_noop;
+			/* clear any string left over from a previous session */
+			memset(dev->manufacturer, 0, sizeof(dev->manufacturer));
+			memset(dev->model, 0, sizeof(dev->model));
+			memset(dev->description, 0, sizeof(dev->description));
+			memset(dev->version, 0, sizeof(dev->version));
+			memset(dev->uri, 0, sizeof(dev->uri));
+			memset(dev->serial, 0, sizeof(dev->serial));
+			dev->start_requested = 0;
+			dev->audio_mode = 0;
+		}
+	}
+
+	if (value >= 0) {
+		cdev->req->zero = 0;
+		cdev->req->length = value;
+		value = usb_ep_queue(cdev->gadget->ep0, cdev->req, GFP_ATOMIC);
+		if (value < 0)
+			ERROR(cdev, "%s setup response queue error\n",
+				__func__);
+	}
+
+err:
+	if (value == -EOPNOTSUPP)
+		VDBG(cdev,
+			"unknown class-specific control req "
+			"%02x.%02x v%04x i%04x l%u\n",
+			ctrl->bRequestType, ctrl->bRequest,
+			w_value, w_index, w_length);
+	return value;
+}
+EXPORT_SYMBOL_GPL(acc_ctrlrequest);
+
+static int
+__acc_function_bind(struct usb_configuration *c,
+			struct usb_function *f, bool configfs)
+{
+	struct usb_composite_dev *cdev = c->cdev;
+	struct acc_dev	*dev = func_to_dev(f);
+	int			id;
+	int			ret;
+
+	DBG(cdev, "acc_function_bind dev: %p\n", dev);
+
+	if (configfs) {
+		if (acc_string_defs[INTERFACE_STRING_INDEX].id == 0) {
+			ret = usb_string_id(c->cdev);
+			if (ret < 0)
+				return ret;
+			acc_string_defs[INTERFACE_STRING_INDEX].id = ret;
+			acc_interface_desc.iInterface = ret;
+		}
+		dev->cdev = c->cdev;
+	}
+	ret = hid_register_driver(&acc_hid_driver);
+	if (ret)
+		return ret;
+
+	dev->start_requested = 0;
+
+	/* allocate interface ID(s) */
+	id = usb_interface_id(c, f);
+	if (id < 0)
+		return id;
+	acc_interface_desc.bInterfaceNumber = id;
+
+	/* allocate endpoints */
+	ret = create_bulk_endpoints(dev, &acc_fullspeed_in_desc,
+			&acc_fullspeed_out_desc);
+	if (ret)
+		return ret;
+
+	/* support high speed hardware */
+	if (gadget_is_dualspeed(c->cdev->gadget)) {
+		acc_highspeed_in_desc.bEndpointAddress =
+			acc_fullspeed_in_desc.bEndpointAddress;
+		acc_highspeed_out_desc.bEndpointAddress =
+			acc_fullspeed_out_desc.bEndpointAddress;
+	}
+
+	DBG(cdev, "%s speed %s: IN/%s, OUT/%s\n",
+			gadget_is_dualspeed(c->cdev->gadget) ? "dual" : "full",
+			f->name, dev->ep_in->name, dev->ep_out->name);
+	return 0;
+}
+
+static int
+acc_function_bind_configfs(struct usb_configuration *c, struct usb_function *f)
+{
+	return __acc_function_bind(c, f, true);
+}
+
+static void
+kill_all_hid_devices(struct acc_dev *dev)
+{
+	struct acc_hid_dev *hid;
+	struct list_head *entry, *temp;
+	unsigned long flags;
+
+	/* do nothing if usb accessory device doesn't exist */
+	if (!dev)
+		return;
+
+	spin_lock_irqsave(&dev->lock, flags);
+	list_for_each_safe(entry, temp, &dev->hid_list) {
+		hid = list_entry(entry, struct acc_hid_dev, list);
+		list_del(&hid->list);
+		list_add(&hid->list, &dev->dead_hid_list);
+	}
+	list_for_each_safe(entry, temp, &dev->new_hid_list) {
+		hid = list_entry(entry, struct acc_hid_dev, list);
+		list_del(&hid->list);
+		list_add(&hid->list, &dev->dead_hid_list);
+	}
+	spin_unlock_irqrestore(&dev->lock, flags);
+
+	schedule_work(&dev->hid_work);
+}
+
+static void
+acc_hid_unbind(struct acc_dev *dev)
+{
+	hid_unregister_driver(&acc_hid_driver);
+	kill_all_hid_devices(dev);
+}
+
+static void
+acc_function_unbind(struct usb_configuration *c, struct usb_function *f)
+{
+	struct acc_dev	*dev = func_to_dev(f);
+	struct usb_request *req;
+	int i;
+
+	dev->online = 0;		/* clear online flag */
+	wake_up(&dev->read_wq);		/* unblock reads on closure */
+	wake_up(&dev->write_wq);	/* likewise for writes */
+
+	while ((req = req_get(dev, &dev->tx_idle)))
+		acc_request_free(req, dev->ep_in);
+	for (i = 0; i < RX_REQ_MAX; i++)
+		acc_request_free(dev->rx_req[i], dev->ep_out);
+
+	acc_hid_unbind(dev);
+}
+
+static void acc_start_work(struct work_struct *data)
+{
+	char *envp[2] = { "ACCESSORY=START", NULL };
+
+	kobject_uevent_env(&acc_device.this_device->kobj, KOBJ_CHANGE, envp);
+}
+
+static int acc_hid_init(struct acc_hid_dev *hdev)
+{
+	struct hid_device *hid;
+	int ret;
+
+	hid = hid_allocate_device();
+	if (IS_ERR(hid))
+		return PTR_ERR(hid);
+
+	hid->ll_driver = &acc_hid_ll_driver;
+	hid->dev.parent = acc_device.this_device;
+
+	hid->bus = BUS_USB;
+	hid->vendor = HID_ANY_ID;
+	hid->product = HID_ANY_ID;
+	hid->driver_data = hdev;
+	ret = hid_add_device(hid);
+	if (ret) {
+		pr_err("can't add hid device: %d\n", ret);
+		hid_destroy_device(hid);
+		return ret;
+	}
+
+	hdev->hid = hid;
+	return 0;
+}
+
+static void acc_hid_delete(struct acc_hid_dev *hid)
+{
+	kfree(hid->report_desc);
+	kfree(hid);
+}
+
+static void acc_hid_work(struct work_struct *data)
+{
+	struct acc_dev *dev = _acc_dev;
+	struct list_head	*entry, *temp;
+	struct acc_hid_dev *hid;
+	struct list_head	new_list, dead_list;
+	unsigned long flags;
+
+	INIT_LIST_HEAD(&new_list);
+
+	spin_lock_irqsave(&dev->lock, flags);
+
+	/* copy hids that are ready for initialization to new_list */
+	list_for_each_safe(entry, temp, &dev->new_hid_list) {
+		hid = list_entry(entry, struct acc_hid_dev, list);
+		if (hid->report_desc_offset == hid->report_desc_len)
+			list_move(&hid->list, &new_list);
+	}
+
+	if (list_empty(&dev->dead_hid_list)) {
+		INIT_LIST_HEAD(&dead_list);
+	} else {
+		/* move all of dev->dead_hid_list to dead_list */
+		dead_list.prev = dev->dead_hid_list.prev;
+		dead_list.next = dev->dead_hid_list.next;
+		dead_list.next->prev = &dead_list;
+		dead_list.prev->next = &dead_list;
+		INIT_LIST_HEAD(&dev->dead_hid_list);
+	}
+
+	spin_unlock_irqrestore(&dev->lock, flags);
+
+	/* register new HID devices */
+	list_for_each_safe(entry, temp, &new_list) {
+		hid = list_entry(entry, struct acc_hid_dev, list);
+		if (acc_hid_init(hid)) {
+			pr_err("can't add HID device %p\n", hid);
+			acc_hid_delete(hid);
+		} else {
+			spin_lock_irqsave(&dev->lock, flags);
+			list_move(&hid->list, &dev->hid_list);
+			spin_unlock_irqrestore(&dev->lock, flags);
+		}
+	}
+
+	/* remove dead HID devices */
+	list_for_each_safe(entry, temp, &dead_list) {
+		hid = list_entry(entry, struct acc_hid_dev, list);
+		list_del(&hid->list);
+		if (hid->hid)
+			hid_destroy_device(hid->hid);
+		acc_hid_delete(hid);
+	}
+}
+
+static int acc_function_set_alt(struct usb_function *f,
+		unsigned intf, unsigned alt)
+{
+	struct acc_dev	*dev = func_to_dev(f);
+	struct usb_composite_dev *cdev = f->config->cdev;
+	int ret;
+
+	DBG(cdev, "acc_function_set_alt intf: %d alt: %d\n", intf, alt);
+
+	ret = config_ep_by_speed(cdev->gadget, f, dev->ep_in);
+	if (ret)
+		return ret;
+
+	ret = usb_ep_enable(dev->ep_in);
+	if (ret)
+		return ret;
+
+	ret = config_ep_by_speed(cdev->gadget, f, dev->ep_out);
+	if (ret)
+		return ret;
+
+	ret = usb_ep_enable(dev->ep_out);
+	if (ret) {
+		usb_ep_disable(dev->ep_in);
+		return ret;
+	}
+
+	dev->online = 1;
+	dev->disconnected = 0; /* if online then not disconnected */
+
+	/* readers may be blocked waiting for us to go online */
+	wake_up(&dev->read_wq);
+	return 0;
+}
+
+static void acc_function_disable(struct usb_function *f)
+{
+	struct acc_dev	*dev = func_to_dev(f);
+	struct usb_composite_dev	*cdev = dev->cdev;
+
+	DBG(cdev, "acc_function_disable\n");
+	acc_set_disconnected(dev); /* this now only sets disconnected */
+	dev->online = 0; /* so now need to clear online flag here too */
+	usb_ep_disable(dev->ep_in);
+	usb_ep_disable(dev->ep_out);
+
+	/* readers may be blocked waiting for us to go online */
+	wake_up(&dev->read_wq);
+
+	VDBG(cdev, "%s disabled\n", dev->function.name);
+}
+
+static int acc_setup(void)
+{
+	struct acc_dev *dev;
+	int ret;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	spin_lock_init(&dev->lock);
+	init_waitqueue_head(&dev->read_wq);
+	init_waitqueue_head(&dev->write_wq);
+	atomic_set(&dev->open_excl, 0);
+	INIT_LIST_HEAD(&dev->tx_idle);
+	INIT_LIST_HEAD(&dev->hid_list);
+	INIT_LIST_HEAD(&dev->new_hid_list);
+	INIT_LIST_HEAD(&dev->dead_hid_list);
+	INIT_DELAYED_WORK(&dev->start_work, acc_start_work);
+	INIT_WORK(&dev->hid_work, acc_hid_work);
+
+	/* _acc_dev must be set before calling usb_gadget_register_driver */
+	_acc_dev = dev;
+
+	ret = misc_register(&acc_device);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	kfree(dev);
+	pr_err("USB accessory gadget driver failed to initialize\n");
+	return ret;
+}
+
+void acc_disconnect(void)
+{
+	/* unregister all HID devices if USB is disconnected */
+	kill_all_hid_devices(_acc_dev);
+}
+EXPORT_SYMBOL_GPL(acc_disconnect);
+
+static void acc_cleanup(void)
+{
+	misc_deregister(&acc_device);
+	kfree(_acc_dev);
+	_acc_dev = NULL;
+}
+static struct acc_instance *to_acc_instance(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct acc_instance,
+		func_inst.group);
+}
+
+static void acc_attr_release(struct config_item *item)
+{
+	struct acc_instance *fi_acc = to_acc_instance(item);
+
+	usb_put_function_instance(&fi_acc->func_inst);
+}
+
+static struct configfs_item_operations acc_item_ops = {
+	.release        = acc_attr_release,
+};
+
+static struct config_item_type acc_func_type = {
+	.ct_item_ops    = &acc_item_ops,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct acc_instance *to_fi_acc(struct usb_function_instance *fi)
+{
+	return container_of(fi, struct acc_instance, func_inst);
+}
+
+static int acc_set_inst_name(struct usb_function_instance *fi, const char *name)
+{
+	struct acc_instance *fi_acc;
+	char *ptr;
+	int name_len;
+
+	name_len = strlen(name) + 1;
+	if (name_len > MAX_INST_NAME_LEN)
+		return -ENAMETOOLONG;
+
+	ptr = kstrndup(name, name_len, GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	fi_acc = to_fi_acc(fi);
+	fi_acc->name = ptr;
+	return 0;
+}
+
+static void acc_free_inst(struct usb_function_instance *fi)
+{
+	struct acc_instance *fi_acc;
+
+	fi_acc = to_fi_acc(fi);
+	kfree(fi_acc->name);
+	acc_cleanup();
+}
+
+static struct usb_function_instance *acc_alloc_inst(void)
+{
+	struct acc_instance *fi_acc;
+	struct acc_dev *dev;
+	int err;
+
+	fi_acc = kzalloc(sizeof(*fi_acc), GFP_KERNEL);
+	if (!fi_acc)
+		return ERR_PTR(-ENOMEM);
+	fi_acc->func_inst.set_inst_name = acc_set_inst_name;
+	fi_acc->func_inst.free_func_inst = acc_free_inst;
+
+	err = acc_setup();
+	if (err) {
+		kfree(fi_acc);
+		pr_err("Error setting ACCESSORY\n");
+		return ERR_PTR(err);
+	}
+
+	config_group_init_type_name(&fi_acc->func_inst.group,
+					"", &acc_func_type);
+	dev = _acc_dev;
+	return  &fi_acc->func_inst;
+}
+
+static void acc_free(struct usb_function *f)
+{
+/*NO-OP: no function specific resource allocation in mtp_alloc*/
+}
+
+int acc_ctrlrequest_configfs(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
+{
+	if (f->config != NULL && f->config->cdev != NULL)
+		return acc_ctrlrequest(f->config->cdev, ctrl);
+	else
+		return -1;
+}
+
+static struct usb_function *acc_alloc(struct usb_function_instance *fi)
+{
+	struct acc_dev *dev = _acc_dev;
+
+	pr_info("acc_alloc\n");
+
+	dev->function.name = "accessory";
+	dev->function.strings = acc_strings,
+	dev->function.fs_descriptors = fs_acc_descs;
+	dev->function.hs_descriptors = hs_acc_descs;
+	dev->function.bind = acc_function_bind_configfs;
+	dev->function.unbind = acc_function_unbind;
+	dev->function.set_alt = acc_function_set_alt;
+	dev->function.disable = acc_function_disable;
+	dev->function.free_func = acc_free;
+	dev->function.setup = acc_ctrlrequest_configfs;
+
+	return &dev->function;
+}
+DECLARE_USB_FUNCTION_INIT(accessory, acc_alloc_inst, acc_alloc);
+MODULE_LICENSE("GPL");
diff --git a/include/linux/usb/f_accessory.h b/include/linux/usb/f_accessory.h
new file mode 100644
index 000000000000..ebe3c4d59309
--- /dev/null
+++ b/include/linux/usb/f_accessory.h
@@ -0,0 +1,23 @@
+/*
+ * Gadget Function Driver for Android USB accessories
+ *
+ * Copyright (C) 2011 Google, Inc.
+ * Author: Mike Lockwood <lockwood@android.com>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef __LINUX_USB_F_ACCESSORY_H
+#define __LINUX_USB_F_ACCESSORY_H
+
+#include <uapi/linux/usb/f_accessory.h>
+
+#endif /* __LINUX_USB_F_ACCESSORY_H */
diff --git a/include/uapi/linux/usb/f_accessory.h b/include/uapi/linux/usb/f_accessory.h
new file mode 100644
index 000000000000..0baeb7d0d74c
--- /dev/null
+++ b/include/uapi/linux/usb/f_accessory.h
@@ -0,0 +1,146 @@
+/*
+ * Gadget Function Driver for Android USB accessories
+ *
+ * Copyright (C) 2011 Google, Inc.
+ * Author: Mike Lockwood <lockwood@android.com>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef _UAPI_LINUX_USB_F_ACCESSORY_H
+#define _UAPI_LINUX_USB_F_ACCESSORY_H
+
+/* Use Google Vendor ID when in accessory mode */
+#define USB_ACCESSORY_VENDOR_ID 0x18D1
+
+
+/* Product ID to use when in accessory mode */
+#define USB_ACCESSORY_PRODUCT_ID 0x2D00
+
+/* Product ID to use when in accessory mode and adb is enabled */
+#define USB_ACCESSORY_ADB_PRODUCT_ID 0x2D01
+
+/* Indexes for strings sent by the host via ACCESSORY_SEND_STRING */
+#define ACCESSORY_STRING_MANUFACTURER   0
+#define ACCESSORY_STRING_MODEL          1
+#define ACCESSORY_STRING_DESCRIPTION    2
+#define ACCESSORY_STRING_VERSION        3
+#define ACCESSORY_STRING_URI            4
+#define ACCESSORY_STRING_SERIAL         5
+
+/* Control request for retrieving device's protocol version
+ *
+ *	requestType:    USB_DIR_IN | USB_TYPE_VENDOR
+ *	request:        ACCESSORY_GET_PROTOCOL
+ *	value:          0
+ *	index:          0
+ *	data            version number (16 bits little endian)
+ *                     1 for original accessory support
+ *                     2 adds HID and device to host audio support
+ */
+#define ACCESSORY_GET_PROTOCOL  51
+
+/* Control request for host to send a string to the device
+ *
+ *	requestType:    USB_DIR_OUT | USB_TYPE_VENDOR
+ *	request:        ACCESSORY_SEND_STRING
+ *	value:          0
+ *	index:          string ID
+ *	data            zero terminated UTF8 string
+ *
+ *  The device can later retrieve these strings via the
+ *  ACCESSORY_GET_STRING_* ioctls
+ */
+#define ACCESSORY_SEND_STRING   52
+
+/* Control request for starting device in accessory mode.
+ * The host sends this after setting all its strings to the device.
+ *
+ *	requestType:    USB_DIR_OUT | USB_TYPE_VENDOR
+ *	request:        ACCESSORY_START
+ *	value:          0
+ *	index:          0
+ *	data            none
+ */
+#define ACCESSORY_START         53
+
+/* Control request for registering a HID device.
+ * Upon registering, a unique ID is sent by the accessory in the
+ * value parameter. This ID will be used for future commands for
+ * the device
+ *
+ *	requestType:    USB_DIR_OUT | USB_TYPE_VENDOR
+ *	request:        ACCESSORY_REGISTER_HID_DEVICE
+ *	value:          Accessory assigned ID for the HID device
+ *	index:          total length of the HID report descriptor
+ *	data            none
+ */
+#define ACCESSORY_REGISTER_HID         54
+
+/* Control request for unregistering a HID device.
+ *
+ *	requestType:    USB_DIR_OUT | USB_TYPE_VENDOR
+ *	request:        ACCESSORY_REGISTER_HID
+ *	value:          Accessory assigned ID for the HID device
+ *	index:          0
+ *	data            none
+ */
+#define ACCESSORY_UNREGISTER_HID         55
+
+/* Control request for sending the HID report descriptor.
+ * If the HID descriptor is longer than the endpoint zero max packet size,
+ * the descriptor will be sent in multiple ACCESSORY_SET_HID_REPORT_DESC
+ * commands. The data for the descriptor must be sent sequentially
+ * if multiple packets are needed.
+ *
+ *	requestType:    USB_DIR_OUT | USB_TYPE_VENDOR
+ *	request:        ACCESSORY_SET_HID_REPORT_DESC
+ *	value:          Accessory assigned ID for the HID device
+ *	index:          offset of data in descriptor
+ *                      (needed when HID descriptor is too big for one packet)
+ *	data            the HID report descriptor
+ */
+#define ACCESSORY_SET_HID_REPORT_DESC         56
+
+/* Control request for sending HID events.
+ *
+ *	requestType:    USB_DIR_OUT | USB_TYPE_VENDOR
+ *	request:        ACCESSORY_SEND_HID_EVENT
+ *	value:          Accessory assigned ID for the HID device
+ *	index:          0
+ *	data            the HID report for the event
+ */
+#define ACCESSORY_SEND_HID_EVENT         57
+
+/* Control request for setting the audio mode.
+ *
+ *	requestType:	USB_DIR_OUT | USB_TYPE_VENDOR
+ *	request:        ACCESSORY_SET_AUDIO_MODE
+ *	value:          0 - no audio
+ *                     1 - device to host, 44100 16-bit stereo PCM
+ *	index:          0
+ *	data            none
+ */
+#define ACCESSORY_SET_AUDIO_MODE         58
+
+/* ioctls for retrieving strings set by the host */
+#define ACCESSORY_GET_STRING_MANUFACTURER   _IOW('M', 1, char[256])
+#define ACCESSORY_GET_STRING_MODEL          _IOW('M', 2, char[256])
+#define ACCESSORY_GET_STRING_DESCRIPTION    _IOW('M', 3, char[256])
+#define ACCESSORY_GET_STRING_VERSION        _IOW('M', 4, char[256])
+#define ACCESSORY_GET_STRING_URI            _IOW('M', 5, char[256])
+#define ACCESSORY_GET_STRING_SERIAL         _IOW('M', 6, char[256])
+/* returns 1 if there is a start request pending */
+#define ACCESSORY_IS_START_REQUESTED        _IO('M', 7)
+/* returns audio mode (set via the ACCESSORY_SET_AUDIO_MODE control request) */
+#define ACCESSORY_GET_AUDIO_MODE            _IO('M', 8)
+
+#endif /* _UAPI_LINUX_USB_F_ACCESSORY_H */
-- 
2.28.0.1011.ga647a8990f-goog

