Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C681BCCA7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 21:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbgD1TqT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 15:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728620AbgD1TqT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 15:46:19 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD481C03C1AC
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 12:46:18 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id t2so25954014ybq.11
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=REUornMUNNo44MwpyGzMlWX0UTRetBsRbPQ6PscTidg=;
        b=v0ZEJ6WpU2lwn0yng76HoZOyWH4qMdeJjg9Q2duj57sPlkS5OGvpcV0LHbv2uvTNKj
         YRmv33fARFIEIiOm2n/5yY+2DZ2Leih/Bd5dEPhjcUkV1rte2DmwzjPIRY31WAB3/AaY
         v9x7owkzKdAu9b0XYle2+fBshR6vpVFRhQkJwem2XTPdldWb8Y3a1PD0JvWkkbtVweah
         TeOtQAMyv5WH35Vzi2fhLcRV1MUK69yBrSqMh4yalU8iU8Pc0T+ZO9tXa4eB/MzpW0A+
         zpHZ5tO/vhmFQofKKA1zpYDmPa6jso7uKHtIVXfqvr+IGhKPI1X9Kug0NGVAOnMfM4Ah
         WxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=REUornMUNNo44MwpyGzMlWX0UTRetBsRbPQ6PscTidg=;
        b=UmyBKhv14WRs/TAoiSXaODJiWoDsuSYwI1aXQb1zrpP3fyauTF/t3UlfJYP6kLHCys
         Gz/LvB7VXUWYHoO86oW82b1wirEQlZAGxdaXximuDBsIDTkaUa/ZHtLFvG9aKVuoohad
         LqWyT7vDGi3zcEsSALAR7pFNNTuArfEp36hJZr2Aqo4iGDkFNNGBS0ltKroJmFTC3ev5
         Qkc5fbnQAvJ0oYL7t3hYZkRhLyU+XV6sAdhdpKqltVGHOQvGWytY+9Pe+Srd2KYj2Sd6
         ija2N/Ei20hrKV57yxuHXS+7PBpe8ONwbyE2TrhRKzszRBISIgeCWn9rRYdtaqKaAxAk
         hAxQ==
X-Gm-Message-State: AGi0PubErQjbsLYXnaLi15Gv9m2AkaTHsk/KML30Z8qwvgjPg5jN+ebH
        i6ATWcFWANw5g7KvEZ/eEeUW7Wshruk0Bdrl
X-Google-Smtp-Source: APiQypKrz5L8kViR/3X2cUgIijxd1haxS+KTbC2gK8Nj0h98lMt6GuUxdhlNhV2qRIkU6MeypCdVGVU+Gkz0IrI+
X-Received: by 2002:a25:80c3:: with SMTP id c3mr51962845ybm.33.1588103178028;
 Tue, 28 Apr 2020 12:46:18 -0700 (PDT)
Date:   Tue, 28 Apr 2020 21:46:12 +0200
Message-Id: <e7920e1960ed65410f00c3400bdeccb27553c736.1588103144.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH] usb: raw-gadget: fix gadget endpoint selection
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently automatic gadget endpoint selection based on required features
doesn't work. Raw Gadget tries iterating over the list of available
endpoints and finding one that has the right direction and transfer type.
Unfortunately selecting arbitrary gadget endpoints (even if they satisfy
feature requirements) doesn't work, as (depending on the UDC driver) they
might have fixed addresses, and one also needs to provide matching
endpoint addresses in the descriptors sent to the host.

The composite framework deals with this by assigning endpoint addresses
in usb_ep_autoconfig() before enumeration starts. This approach won't work
with Raw Gadget as the endpoints are supposed to be enabled after a
set_configuration/set_interface request from the host, so it's too late to
patch the endpoint descriptors that had already been sent to the host.

For Raw Gadget we take the another approach. Similarly to GadgetFS, we
allow the user to make the decision as to which gadget endpoints to use.

This patch adds another Raw Gadget ioctl USB_RAW_IOCTL_EPS_INFO that
exposes information about all non-control endpoints that a currently
connected UDC has. This information includes endpoints addresses, as well
as their capabilities and limits to allow the user to chose the most
fitting gadget endpoint.

The USB_RAW_IOCTL_EP_ENABLE ioctl is updated to use the proper endpoint
validation routine usb_gadget_ep_match_desc() and also now accepts an
optional usb_ss_ep_comp_descriptor argument.

These changes affect the portability of the gadgets that use Raw Gadget
when running on different UDCs. Nevertheless, as long as the user relies
on the information provided by USB_RAW_IOCTL_EPS_INFO to dynamically
choose endpoint addresses, UDC-agnostic gadgets can still be written with
Raw Gadget.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 Documentation/usb/raw-gadget.rst       |   6 +-
 drivers/usb/gadget/legacy/raw_gadget.c | 194 ++++++++++++++++---------
 include/uapi/linux/usb/raw_gadget.h    |  84 ++++++++++-
 3 files changed, 207 insertions(+), 77 deletions(-)

diff --git a/Documentation/usb/raw-gadget.rst b/Documentation/usb/raw-gadget.rst
index 9e78cb858f86..42bd446d72b2 100644
--- a/Documentation/usb/raw-gadget.rst
+++ b/Documentation/usb/raw-gadget.rst
@@ -27,11 +27,7 @@ differences are:
 3. Raw Gadget provides a way to select a UDC device/driver to bind to,
    while GadgetFS currently binds to the first available UDC.
 
-4. Raw Gadget uses predictable endpoint names (handles) across different
-   UDCs (as long as UDCs have enough endpoints of each required transfer
-   type).
-
-5. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
+4. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
 
 Userspace interface
 ~~~~~~~~~~~~~~~~~~~
diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 7b241992ad5a..cbf4b0572188 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/compiler.h>
+#include <linux/ctype.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/kref.h>
@@ -123,8 +124,6 @@ static void raw_event_queue_destroy(struct raw_event_queue *queue)
 
 struct raw_dev;
 
-#define USB_RAW_MAX_ENDPOINTS 32
-
 enum ep_state {
 	STATE_EP_DISABLED,
 	STATE_EP_ENABLED,
@@ -134,6 +133,7 @@ struct raw_ep {
 	struct raw_dev		*dev;
 	enum ep_state		state;
 	struct usb_ep		*ep;
+	u8			addr;
 	struct usb_request	*req;
 	bool			urb_queued;
 	bool			disabling;
@@ -168,7 +168,8 @@ struct raw_dev {
 	bool				ep0_out_pending;
 	bool				ep0_urb_queued;
 	ssize_t				ep0_status;
-	struct raw_ep			eps[USB_RAW_MAX_ENDPOINTS];
+	struct raw_ep			eps[USB_RAW_EPS_NUM_MAX];
+	int				eps_num;
 
 	struct completion		ep0_done;
 	struct raw_event_queue		queue;
@@ -202,7 +203,7 @@ static void dev_free(struct kref *kref)
 		usb_ep_free_request(dev->gadget->ep0, dev->req);
 	}
 	raw_event_queue_destroy(&dev->queue);
-	for (i = 0; i < USB_RAW_MAX_ENDPOINTS; i++) {
+	for (i = 0; i < USB_RAW_EPS_NUM_MAX; i++) {
 		if (dev->eps[i].state != STATE_EP_ENABLED)
 			continue;
 		usb_ep_disable(dev->eps[i].ep);
@@ -249,12 +250,26 @@ static void gadget_ep0_complete(struct usb_ep *ep, struct usb_request *req)
 	complete(&dev->ep0_done);
 }
 
+static u8 get_ep_addr(const char *name)
+{
+	/* If the endpoint has fixed function (named as e.g. "ep12out-bulk"),
+	 * parse the endpoint address from its name. We deliberately use
+	 * deprecated simple_strtoul() function here, as the number isn't
+	 * followed by '\0' nor '\n'.
+	 */
+	if (isdigit(name[2]))
+		return simple_strtoul(&name[2], NULL, 10);
+	/* Otherwise the endpoint is configurable (named as e.g. "ep-a"). */
+	return USB_RAW_EP_ADDR_ANY;
+}
+
 static int gadget_bind(struct usb_gadget *gadget,
 			struct usb_gadget_driver *driver)
 {
-	int ret = 0;
+	int ret = 0, i = 0;
 	struct raw_dev *dev = container_of(driver, struct raw_dev, driver);
 	struct usb_request *req;
+	struct usb_ep *ep;
 	unsigned long flags;
 
 	if (strcmp(gadget->name, dev->udc_name) != 0)
@@ -273,6 +288,13 @@ static int gadget_bind(struct usb_gadget *gadget,
 	dev->req->context = dev;
 	dev->req->complete = gadget_ep0_complete;
 	dev->gadget = gadget;
+	gadget_for_each_ep(ep, dev->gadget) {
+		dev->eps[i].ep = ep;
+		dev->eps[i].addr = get_ep_addr(ep->name);
+		dev->eps[i].state = STATE_EP_DISABLED;
+		i++;
+	}
+	dev->eps_num = i;
 	spin_unlock_irqrestore(&dev->lock, flags);
 
 	/* Matches kref_put() in gadget_unbind(). */
@@ -555,7 +577,7 @@ static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
 
 	if (copy_from_user(io, ptr, sizeof(*io)))
 		return ERR_PTR(-EFAULT);
-	if (io->ep >= USB_RAW_MAX_ENDPOINTS)
+	if (io->ep >= USB_RAW_EPS_NUM_MAX)
 		return ERR_PTR(-EINVAL);
 	if (!usb_raw_io_flags_valid(io->flags))
 		return ERR_PTR(-EINVAL);
@@ -682,52 +704,30 @@ static int raw_ioctl_ep0_read(struct raw_dev *dev, unsigned long value)
 	return ret;
 }
 
-static bool check_ep_caps(struct usb_ep *ep,
-				struct usb_endpoint_descriptor *desc)
-{
-	switch (usb_endpoint_type(desc)) {
-	case USB_ENDPOINT_XFER_ISOC:
-		if (!ep->caps.type_iso)
-			return false;
-		break;
-	case USB_ENDPOINT_XFER_BULK:
-		if (!ep->caps.type_bulk)
-			return false;
-		break;
-	case USB_ENDPOINT_XFER_INT:
-		if (!ep->caps.type_int)
-			return false;
-		break;
-	default:
-		return false;
-	}
-
-	if (usb_endpoint_dir_in(desc) && !ep->caps.dir_in)
-		return false;
-	if (usb_endpoint_dir_out(desc) && !ep->caps.dir_out)
-		return false;
-
-	return true;
-}
-
 static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 {
 	int ret = 0, i;
 	unsigned long flags;
-	struct usb_endpoint_descriptor *desc;
-	struct usb_ep *ep = NULL;
+	struct usb_raw_ep_descs *descs;
+	struct usb_endpoint_descriptor *ep_desc;
+	struct usb_ss_ep_comp_descriptor *comp_desc = NULL;
+	struct raw_ep *ep;
 
-	desc = memdup_user((void __user *)value, sizeof(*desc));
-	if (IS_ERR(desc))
-		return PTR_ERR(desc);
+	descs = memdup_user((void __user *)value, sizeof(*descs));
+	if (IS_ERR(descs))
+		return PTR_ERR(descs);
+
+	ep_desc = &descs->ep;
+	if (descs->comp.bLength != 0)
+		comp_desc = &descs->comp;
 
 	/*
 	 * Endpoints with a maxpacket length of 0 can cause crashes in UDC
 	 * drivers.
 	 */
-	if (usb_endpoint_maxp(desc) == 0) {
+	if (usb_endpoint_maxp(ep_desc) == 0) {
 		dev_dbg(dev->dev, "fail, bad endpoint maxpacket\n");
-		kfree(desc);
+		kfree(descs);
 		return -EINVAL;
 	}
 
@@ -743,41 +743,38 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 		goto out_free;
 	}
 
-	for (i = 0; i < USB_RAW_MAX_ENDPOINTS; i++) {
-		if (dev->eps[i].state == STATE_EP_ENABLED)
+	for (i = 0; i < dev->eps_num; i++) {
+		ep = &dev->eps[i];
+		if (ep->state != STATE_EP_DISABLED)
 			continue;
-		break;
-	}
-	if (i == USB_RAW_MAX_ENDPOINTS) {
-		dev_dbg(&dev->gadget->dev,
-				"fail, no device endpoints available\n");
-		ret = -EBUSY;
-		goto out_free;
-	}
-
-	gadget_for_each_ep(ep, dev->gadget) {
-		if (ep->enabled)
+		if (ep->addr != usb_endpoint_num(ep_desc) &&
+				ep->addr != USB_RAW_EP_ADDR_ANY)
 			continue;
-		if (!check_ep_caps(ep, desc))
+		if (!usb_gadget_ep_match_desc(dev->gadget, ep->ep,
+							ep_desc, comp_desc))
 			continue;
-		ep->desc = desc;
-		ret = usb_ep_enable(ep);
+		/* Gadget subsystem requires us to assign only a pointer to the
+		 * endpoint descriptor here, but technically we store pointer
+		 * to a usb_raw_ep_descs struct with both ep and comp
+		 * descriptors to be later freed by raw_ioctl_ep_disable().
+		 */
+		ep->ep->desc = ep_desc;
+		ret = usb_ep_enable(ep->ep);
 		if (ret < 0) {
 			dev_err(&dev->gadget->dev,
 				"fail, usb_ep_enable returned %d\n", ret);
 			goto out_free;
 		}
-		dev->eps[i].req = usb_ep_alloc_request(ep, GFP_ATOMIC);
-		if (!dev->eps[i].req) {
+		ep->req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
+		if (!ep->req) {
 			dev_err(&dev->gadget->dev,
 				"fail, usb_ep_alloc_request failed\n");
-			usb_ep_disable(ep);
+			usb_ep_disable(ep->ep);
 			ret = -ENOMEM;
 			goto out_free;
 		}
-		dev->eps[i].ep = ep;
-		dev->eps[i].state = STATE_EP_ENABLED;
-		ep->driver_data = &dev->eps[i];
+		ep->state = STATE_EP_ENABLED;
+		ep->ep->driver_data = ep;
 		ret = i;
 		goto out_unlock;
 	}
@@ -786,7 +783,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 	ret = -EBUSY;
 
 out_free:
-	kfree(desc);
+	kfree(descs);
 out_unlock:
 	spin_unlock_irqrestore(&dev->lock, flags);
 	return ret;
@@ -796,9 +793,9 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 {
 	int ret = 0, i = value;
 	unsigned long flags;
-	const void *desc;
+	const void *descs;
 
-	if (i < 0 || i >= USB_RAW_MAX_ENDPOINTS)
+	if (i < 0 || i >= USB_RAW_EPS_NUM_MAX)
 		return -EINVAL;
 
 	spin_lock_irqsave(&dev->lock, flags);
@@ -836,10 +833,10 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 
 	spin_lock_irqsave(&dev->lock, flags);
 	usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-	desc = dev->eps[i].ep->desc;
+	descs = dev->eps[i].ep->desc;
 	dev->eps[i].ep = NULL;
 	dev->eps[i].state = STATE_EP_DISABLED;
-	kfree(desc);
+	kfree(descs);
 	dev->eps[i].disabling = false;
 
 out_unlock:
@@ -1027,6 +1024,64 @@ static int raw_ioctl_vbus_draw(struct raw_dev *dev, unsigned long value)
 	return ret;
 }
 
+static void fill_ep_caps(struct usb_ep_caps *caps,
+				struct usb_raw_ep_caps *raw_caps)
+{
+	raw_caps->type_control = caps->type_control;
+	raw_caps->type_iso = caps->type_iso;
+	raw_caps->type_bulk = caps->type_bulk;
+	raw_caps->type_int = caps->type_int;
+	raw_caps->dir_in = caps->dir_in;
+	raw_caps->dir_out = caps->dir_out;
+}
+
+static void fill_ep_limits(struct usb_ep *ep, struct usb_raw_ep_limits *limits)
+{
+	limits->maxpacket_limit = ep->maxpacket_limit;
+	limits->max_streams = ep->max_streams;
+	limits->maxburst = ep->maxburst;
+}
+
+static int raw_ioctl_eps_info(struct raw_dev *dev, unsigned long value)
+{
+	int ret = 0, i;
+	unsigned long flags;
+	struct usb_raw_eps_info info;
+	struct raw_ep *ep;
+
+	spin_lock_irqsave(&dev->lock, flags);
+	if (dev->state != STATE_DEV_RUNNING) {
+		dev_dbg(dev->dev, "fail, device is not running\n");
+		ret = -EINVAL;
+		spin_unlock_irqrestore(&dev->lock, flags);
+		goto out;
+	}
+	if (!dev->gadget) {
+		dev_dbg(dev->dev, "fail, gadget is not bound\n");
+		ret = -EBUSY;
+		spin_unlock_irqrestore(&dev->lock, flags);
+		goto out;
+	}
+
+	memset(&info, 0, sizeof(info));
+	for (i = 0; i < dev->eps_num; i++) {
+		ep = &dev->eps[i];
+		strscpy(&info.eps[i].name[0], ep->ep->name,
+				USB_RAW_EP_NAME_MAX);
+		info.eps[i].addr = ep->addr;
+		fill_ep_caps(&ep->ep->caps, &info.eps[i].caps);
+		fill_ep_limits(ep->ep, &info.eps[i].limits);
+	}
+	ret = dev->eps_num;
+	spin_unlock_irqrestore(&dev->lock, flags);
+
+	if (copy_to_user((void __user *)value, &info, sizeof(info)))
+		ret = -EFAULT;
+
+out:
+	return ret;
+}
+
 static long raw_ioctl(struct file *fd, unsigned int cmd, unsigned long value)
 {
 	struct raw_dev *dev = fd->private_data;
@@ -1069,6 +1124,9 @@ static long raw_ioctl(struct file *fd, unsigned int cmd, unsigned long value)
 	case USB_RAW_IOCTL_VBUS_DRAW:
 		ret = raw_ioctl_vbus_draw(dev, value);
 		break;
+	case USB_RAW_IOCTL_EPS_INFO:
+		ret = raw_ioctl_eps_info(dev, value);
+		break;
 	default:
 		ret = -EINVAL;
 	}
diff --git a/include/uapi/linux/usb/raw_gadget.h b/include/uapi/linux/usb/raw_gadget.h
index 8544802b25bd..6ae626d17f0c 100644
--- a/include/uapi/linux/usb/raw_gadget.h
+++ b/include/uapi/linux/usb/raw_gadget.h
@@ -93,6 +93,75 @@ struct usb_raw_ep_io {
 	__u8		data[0];
 };
 
+/*
+ * struct usb_raw_ep_descs - argument for USB_RAW_IOCTL_EP_ENABLE ioctl.
+ * @ep: Endpoint descriptor.
+ * @comp: SuperSpeed Endpoint Companion descriptor.
+ *
+ * Both of these descriptors are only used by the gadget subsystem including
+ * the UDC driver and don't affect the descriptors that are sent to the host.
+ * However, the user must make sure that the host and the gadget sides agree
+ * on the used endpoint parameters (such as e.g. endpoint addresses).
+ */
+struct usb_raw_ep_descs {
+	struct usb_endpoint_descriptor		ep;
+	struct usb_ss_ep_comp_descriptor	comp;
+};
+
+/* Maximum number of non-control endpoints in struct usb_raw_eps_info. */
+#define USB_RAW_EPS_NUM_MAX	30
+
+/* Maximum length of UDC endpoint name in struct usb_raw_ep_info. */
+#define USB_RAW_EP_NAME_MAX	16
+
+/* Used as addr in struct usb_raw_ep_info if endpoint accepts any address. */
+#define USB_RAW_EP_ADDR_ANY	0xff
+
+/*
+ * struct usb_raw_ep_caps - exposes endpoint capabilities from
+ *     struct usb_ep_caps.
+ */
+struct usb_raw_ep_caps {
+	__u32	type_control:1;
+	__u32	type_iso:1;
+	__u32	type_bulk:1;
+	__u32	type_int:1;
+	__u32	dir_in:1;
+	__u32	dir_out:1;
+};
+
+/*
+ * struct usb_raw_ep_limits - exposes endpoint limits from struct usb_ep.
+ */
+struct usb_raw_ep_limits {
+	__u32	maxpacket_limit;
+	__u32	max_streams;
+	__u32	maxburst;
+};
+
+/*
+ * struct usb_raw_ep_info - stores information about a gadget endpoint.
+ * @name: Name of the endpoint as it is defined in the UDC driver.
+ * @addr: Address of the endpoint that must be specified in the endpoint
+ *     descriptor passed to USB_RAW_IOCTL_EP_ENABLE ioctl.
+ * @caps: Endpoint capabilities.
+ * @limits: Endpoint limits.
+ */
+struct usb_raw_ep_info {
+	__u8				name[USB_RAW_EP_NAME_MAX];
+	__u32				addr;
+	struct usb_raw_ep_caps		caps;
+	struct usb_raw_ep_limits	limits;
+};
+
+/*
+ * struct usb_raw_eps_info - argument for USB_RAW_IOCTL_EPS_INFO ioctl.
+ * eps: Structures that store information about non-control endpoints.
+ */
+struct usb_raw_eps_info {
+	struct usb_raw_ep_info	eps[USB_RAW_EPS_NUM_MAX];
+};
+
 /*
  * Initializes a Raw Gadget instance.
  * Accepts a pointer to the usb_raw_init struct as an argument.
@@ -126,12 +195,12 @@ struct usb_raw_ep_io {
 #define USB_RAW_IOCTL_EP0_READ		_IOWR('U', 4, struct usb_raw_ep_io)
 
 /*
- * Finds an endpoint that supports the transfer type specified in the
- * descriptor and enables it.
- * Accepts a pointer to the usb_endpoint_descriptor struct as an argument.
+ * Finds an endpoint that satisfies the parameters specified in the provided
+ * descriptors (address, transfer type, etc.) and enables it.
+ * Accepts a pointer to the usb_raw_ep_descs struct as an argument.
  * Returns enabled endpoint handle on success or negative error code on failure.
  */
-#define USB_RAW_IOCTL_EP_ENABLE		_IOW('U', 5, struct usb_endpoint_descriptor)
+#define USB_RAW_IOCTL_EP_ENABLE		_IOW('U', 5, struct usb_raw_ep_descs)
 
 /* Disables specified endpoint.
  * Accepts endpoint handle as an argument.
@@ -164,4 +233,11 @@ struct usb_raw_ep_io {
  */
 #define USB_RAW_IOCTL_VBUS_DRAW		_IOW('U', 10, __u32)
 
+/* Fills in the usb_raw_eps_info structure with information about non-control
+ * endpoints available for the currently connected UDC.
+ * Returns the number of available endpoints on success or negative error code
+ * on failure.
+ */
+#define USB_RAW_IOCTL_EPS_INFO		_IOR('U', 11, struct usb_raw_eps_info)
+
 #endif /* _UAPI__LINUX_USB_RAW_GADGET_H */
-- 
2.26.2.303.gf8c07b1a785-goog

