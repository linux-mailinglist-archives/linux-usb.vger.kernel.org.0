Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E90E987061
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 06:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfHIEFN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 00:05:13 -0400
Received: from gate.crashing.org ([63.228.1.57]:41571 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfHIEFN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 00:05:13 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x79457j2003933;
        Thu, 8 Aug 2019 23:05:08 -0500
Message-ID: <5db94157b9b3b89b2874a4f91505e4b860903ac6.camel@kernel.crashing.org>
Subject: [PATCH] [RFC] usb: gadget: hid: Add "single_ep" option
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>
Date:   Fri, 09 Aug 2019 14:05:07 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some host drivers really do not like keyboards having an OUT endpoint.

For example, most UEFI forked from EDK2 before 2006 (or was it 2008 ?)
have a bug, they'll try to use the *last* interrupt EP in the
descriptor list and just assume it's an IN endpoint. Newer UEFIs
use the *first* interrupt endpoint instead. None of them checks the
direction :-(

This adds a "single_ep" option to f_hid which allows to specify that
only the IN path should be created. This should be used for keyboards
if they are ever to be used with such systems as host.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/function/f_hid.c | 61 ++++++++++++++++++-----------
 drivers/usb/gadget/function/u_hid.h |  1 +
 2 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index f3816a5c861e..ae393c4fb61b 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -44,6 +44,7 @@ struct f_hidg {
 	unsigned short			report_desc_length;
 	char				*report_desc;
 	unsigned short			report_length;
+	unsigned char			single_ep;
 
 	/* recv report */
 	struct list_head		completed_out_req;
@@ -249,7 +250,7 @@ static ssize_t f_hidg_read(struct file *file, char __user *buffer,
 	unsigned long flags;
 	int ret;
 
-	if (!count)
+	if (!count || hidg->single_ep)
 		return 0;
 
 	if (!access_ok(buffer, count))
@@ -612,15 +613,16 @@ static void hidg_disable(struct usb_function *f)
 	unsigned long flags;
 
 	usb_ep_disable(hidg->in_ep);
-	usb_ep_disable(hidg->out_ep);
-
-	spin_lock_irqsave(&hidg->read_spinlock, flags);
-	list_for_each_entry_safe(list, next, &hidg->completed_out_req, list) {
-		free_ep_req(hidg->out_ep, list->req);
-		list_del(&list->list);
-		kfree(list);
+	if (!hidg->single_ep) {
+		usb_ep_disable(hidg->out_ep);
+		spin_lock_irqsave(&hidg->read_spinlock, flags);
+		list_for_each_entry_safe(list, next, &hidg->completed_out_req, list) {
+			free_ep_req(hidg->out_ep, list->req);
+			list_del(&list->list);
+			kfree(list);
+		}
+		spin_unlock_irqrestore(&hidg->read_spinlock, flags);
 	}
-	spin_unlock_irqrestore(&hidg->read_spinlock, flags);
 
 	spin_lock_irqsave(&hidg->write_spinlock, flags);
 	if (!hidg->write_pending) {
@@ -770,10 +772,12 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 		goto fail;
 	hidg->in_ep = ep;
 
-	ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_out_ep_desc);
-	if (!ep)
-		goto fail;
-	hidg->out_ep = ep;
+	if (!hidg->single_ep) {
+		ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_out_ep_desc);
+		if (!ep)
+			goto fail;
+		hidg->out_ep = ep;
+	}
 
 	/* set descriptor dynamic values */
 	hidg_interface_desc.bInterfaceSubClass = hidg->bInterfaceSubClass;
@@ -784,11 +788,17 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 				cpu_to_le16(hidg->report_length);
 	hidg_hs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 	hidg_fs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
-	hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
-	hidg_ss_out_comp_desc.wBytesPerInterval =
-				cpu_to_le16(hidg->report_length);
-	hidg_hs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
-	hidg_fs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
+	if (hidg->single_ep) {
+		hidg_interface_desc.bNumEndpoints = 1;
+	} else {
+		hidg_interface_desc.bNumEndpoints = 2;
+		hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
+		hidg_ss_out_comp_desc.wBytesPerInterval =
+			cpu_to_le16(hidg->report_length);
+		hidg_hs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
+		hidg_fs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
+	}
+
 	/*
 	 * We can use hidg_desc struct here but we should not relay
 	 * that its content won't change after returning from this function.
@@ -799,13 +809,15 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 
 	hidg_hs_in_ep_desc.bEndpointAddress =
 		hidg_fs_in_ep_desc.bEndpointAddress;
-	hidg_hs_out_ep_desc.bEndpointAddress =
-		hidg_fs_out_ep_desc.bEndpointAddress;
-
 	hidg_ss_in_ep_desc.bEndpointAddress =
 		hidg_fs_in_ep_desc.bEndpointAddress;
-	hidg_ss_out_ep_desc.bEndpointAddress =
-		hidg_fs_out_ep_desc.bEndpointAddress;
+
+	if (!hidg->single_ep) {
+		hidg_hs_out_ep_desc.bEndpointAddress =
+			hidg_fs_out_ep_desc.bEndpointAddress;
+		hidg_ss_out_ep_desc.bEndpointAddress =
+			hidg_fs_out_ep_desc.bEndpointAddress;
+	}
 
 	status = usb_assign_descriptors(f, hidg_fs_descriptors,
 			hidg_hs_descriptors, hidg_ss_descriptors, NULL);
@@ -924,6 +936,7 @@ CONFIGFS_ATTR(f_hid_opts_, name)
 F_HID_OPT(subclass, 8, 255);
 F_HID_OPT(protocol, 8, 255);
 F_HID_OPT(report_length, 16, 65535);
+F_HID_OPT(single_ep, 8, 1);
 
 static ssize_t f_hid_opts_report_desc_show(struct config_item *item, char *page)
 {
@@ -985,6 +998,7 @@ static struct configfs_attribute *hid_attrs[] = {
 	&f_hid_opts_attr_report_length,
 	&f_hid_opts_attr_report_desc,
 	&f_hid_opts_attr_dev,
+	&f_hid_opts_attr_single_ep,
 	NULL,
 };
 
@@ -1100,6 +1114,7 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	hidg->minor = opts->minor;
 	hidg->bInterfaceSubClass = opts->subclass;
 	hidg->bInterfaceProtocol = opts->protocol;
+	hidg->single_ep = opts->single_ep;
 	hidg->report_length = opts->report_length;
 	hidg->report_desc_length = opts->report_desc_length;
 	if (opts->report_desc) {
diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
index 1594bfa312eb..d9303379d7fd 100644
--- a/drivers/usb/gadget/function/u_hid.h
+++ b/drivers/usb/gadget/function/u_hid.h
@@ -23,6 +23,7 @@ struct f_hid_opts {
 	unsigned short			report_length;
 	unsigned short			report_desc_length;
 	unsigned char			*report_desc;
+	unsigned char			single_ep;
 	bool				report_desc_alloc;
 
 	/*



