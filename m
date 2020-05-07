Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F3F1C9726
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 19:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgEGRHP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 13:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727902AbgEGRHL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 13:07:11 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69CDC05BD43
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 10:07:09 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id w6so7476798qtt.21
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=DU3b+dz/5KdgSh9FXxCXtP/uu/aAeFti+R+6yf8Qf2E=;
        b=ZqB6W/cNL+1r6XAaa1fmJV9kotYe7vFoVKvY8XBRrEykFOgeaJWUW5cSRaC6nLftjW
         EYpJR1s6bfv2stZrW/Hd2bCEpY6WscAR1FqqMuF4ZC2lUQM1gjuWEAj7fwlNQSkCb7OJ
         nU2pPjpFAJuciYpOtQuopLcC3veCluJ8Odyy+MkhxgJ9yKY5wGOTb+lX8yTbkw9iIit1
         XSfzVf3AuvAEI/l5UY/wMbaXfMX/3Br/dheRSM2l7Ki3zDc76R10scTbEQYfVjFTkKJW
         vCeD8vCEcA3t3J9CJiEBZvgd2Lqgv+t7oHs1Wqf68/2BL6IrvAq6Q5+1FGfo71ZpgXrR
         tf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DU3b+dz/5KdgSh9FXxCXtP/uu/aAeFti+R+6yf8Qf2E=;
        b=h2MXn5NHkFZ+/i8v0s35FB1NyLmeQg5ydp+5+b1ckMr+6+/6MC9r8gby4t/F0aeReu
         sC5VBL7LGAp7toyuURT7vpUGSgjJ3Nq8CXVTdtwvzqooHiCGLvhz5irAvxvVqzP0AMSl
         z0fW5IZvFEWzCstAxUZGblX8N6UdpE67qYeGl7WyEdKaefNHdm8zXsveufxrmjxNpDrG
         /2BN63XTIcY/fcIQWmM0mKyzAjFymNBh4ON4x2UTyZwK9TofFl0WPzW+nZnEfnSZoad1
         tbr8Wiug5MXMwDfIoVvJuRTp2AiJuiEMsrXSxvCuMFUcMGElteMWOoKOd+sRESk1xZmg
         qtFg==
X-Gm-Message-State: AGi0PuZODDJhxm2nnrvaIVqDs9aYtvprbn61z8/LbuUQ4jGJ2gT6dnqg
        2ouZrRrlXXs8eJcmnlpNlDsPHRG/HMzrxS35
X-Google-Smtp-Source: APiQypL61gEJdR7K1MAJTj+1gwNLdy0iTVv3dr2I60ZDjiIFwdRiO9up37pKCNfbkh1pb/ihwmGMqYY7q2DrUZ6N
X-Received: by 2002:a0c:ffa3:: with SMTP id d3mr14017461qvv.12.1588871229083;
 Thu, 07 May 2020 10:07:09 -0700 (PDT)
Date:   Thu,  7 May 2020 19:06:56 +0200
In-Reply-To: <cover.1588870822.git.andreyknvl@google.com>
Message-Id: <459d02069dedefcc30095748f49ef4a426e15b74.1588870822.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1588870822.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH USB v3 3/5] usb: raw-gadget: fix gadget endpoint selection
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

For Raw Gadget we take another approach. Similarly to GadgetFS, we allow
the user to make the decision as to which gadget endpoints to use.

This patch adds another Raw Gadget ioctl USB_RAW_IOCTL_EPS_INFO that
exposes information about all non-control endpoints that a currently
connected UDC has. This information includes endpoints addresses, as well
as their capabilities and limits to allow the user to choose the most
fitting gadget endpoint.

The USB_RAW_IOCTL_EP_ENABLE ioctl is updated to use the proper endpoint
validation routine usb_gadget_ep_match_desc().

These changes affect the portability of the gadgets that use Raw Gadget
when running on different UDCs. Nevertheless, as long as the user relies
on the information provided by USB_RAW_IOCTL_EPS_INFO to dynamically
choose endpoint addresses, UDC-agnostic gadgets can still be written with
Raw Gadget.

Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 Documentation/usb/raw-gadget.rst       |   5 +-
 drivers/usb/gadget/legacy/raw_gadget.c | 187 ++++++++++++++++---------
 include/uapi/linux/usb/raw_gadget.h    |  72 +++++++++-
 3 files changed, 194 insertions(+), 70 deletions(-)

diff --git a/Documentation/usb/raw-gadget.rst b/Documentation/usb/raw-gadget.rst
index 9e78cb858f86..4af8b1f15574 100644
--- a/Documentation/usb/raw-gadget.rst
+++ b/Documentation/usb/raw-gadget.rst
@@ -27,9 +27,8 @@ differences are:
 3. Raw Gadget provides a way to select a UDC device/driver to bind to,
    while GadgetFS currently binds to the first available UDC.
 
-4. Raw Gadget uses predictable endpoint names (handles) across different
-   UDCs (as long as UDCs have enough endpoints of each required transfer
-   type).
+4. Raw Gadget explicitly exposes information about endpoints addresses and
+   capabilities allowing a user to write UDC-agnostic gadgets.
 
 5. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
 
diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 7b241992ad5a..775f22184aaf 100644
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
+	for (i = 0; i < dev->eps_num; i++) {
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
@@ -682,40 +704,12 @@ static int raw_ioctl_ep0_read(struct raw_dev *dev, unsigned long value)
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
 	struct usb_endpoint_descriptor *desc;
-	struct usb_ep *ep = NULL;
+	struct raw_ep *ep;
 
 	desc = memdup_user((void __user *)value, sizeof(*desc));
 	if (IS_ERR(desc))
@@ -743,41 +737,32 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
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
+		if (ep->addr != usb_endpoint_num(desc) &&
+				ep->addr != USB_RAW_EP_ADDR_ANY)
 			continue;
-		if (!check_ep_caps(ep, desc))
+		if (!usb_gadget_ep_match_desc(dev->gadget, ep->ep, desc, NULL))
 			continue;
-		ep->desc = desc;
-		ret = usb_ep_enable(ep);
+		ep->ep->desc = desc;
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
@@ -796,10 +781,6 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 {
 	int ret = 0, i = value;
 	unsigned long flags;
-	const void *desc;
-
-	if (i < 0 || i >= USB_RAW_MAX_ENDPOINTS)
-		return -EINVAL;
 
 	spin_lock_irqsave(&dev->lock, flags);
 	if (dev->state != STATE_DEV_RUNNING) {
@@ -812,6 +793,11 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 		ret = -EBUSY;
 		goto out_unlock;
 	}
+	if (i < 0 || i >= dev->eps_num) {
+		dev_dbg(dev->dev, "fail, invalid endpoint\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
 	if (dev->eps[i].state != STATE_EP_ENABLED) {
 		dev_dbg(&dev->gadget->dev, "fail, endpoint is not enabled\n");
 		ret = -EINVAL;
@@ -836,10 +822,9 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 
 	spin_lock_irqsave(&dev->lock, flags);
 	usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-	desc = dev->eps[i].ep->desc;
+	kfree(dev->eps[i].ep->desc);
 	dev->eps[i].ep = NULL;
 	dev->eps[i].state = STATE_EP_DISABLED;
-	kfree(desc);
 	dev->eps[i].disabling = false;
 
 out_unlock:
@@ -868,7 +853,7 @@ static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 {
 	int ret = 0;
 	unsigned long flags;
-	struct raw_ep *ep = &dev->eps[io->ep];
+	struct raw_ep *ep;
 	DECLARE_COMPLETION_ONSTACK(done);
 
 	spin_lock_irqsave(&dev->lock, flags);
@@ -882,6 +867,12 @@ static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 		ret = -EBUSY;
 		goto out_unlock;
 	}
+	if (io->ep >= dev->eps_num) {
+		dev_dbg(&dev->gadget->dev, "fail, invalid endpoint\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	ep = &dev->eps[io->ep];
 	if (ep->state != STATE_EP_ENABLED) {
 		dev_dbg(&dev->gadget->dev, "fail, endpoint is not enabled\n");
 		ret = -EBUSY;
@@ -1027,6 +1018,71 @@ static int raw_ioctl_vbus_draw(struct raw_dev *dev, unsigned long value)
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
+}
+
+static int raw_ioctl_eps_info(struct raw_dev *dev, unsigned long value)
+{
+	int ret = 0, i;
+	unsigned long flags;
+	struct usb_raw_eps_info *info;
+	struct raw_ep *ep;
+
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	spin_lock_irqsave(&dev->lock, flags);
+	if (dev->state != STATE_DEV_RUNNING) {
+		dev_dbg(dev->dev, "fail, device is not running\n");
+		ret = -EINVAL;
+		spin_unlock_irqrestore(&dev->lock, flags);
+		goto out_free;
+	}
+	if (!dev->gadget) {
+		dev_dbg(dev->dev, "fail, gadget is not bound\n");
+		ret = -EBUSY;
+		spin_unlock_irqrestore(&dev->lock, flags);
+		goto out_free;
+	}
+
+	memset(info, 0, sizeof(*info));
+	for (i = 0; i < dev->eps_num; i++) {
+		ep = &dev->eps[i];
+		strscpy(&info->eps[i].name[0], ep->ep->name,
+				USB_RAW_EP_NAME_MAX);
+		info->eps[i].addr = ep->addr;
+		fill_ep_caps(&ep->ep->caps, &info->eps[i].caps);
+		fill_ep_limits(ep->ep, &info->eps[i].limits);
+	}
+	ret = dev->eps_num;
+	spin_unlock_irqrestore(&dev->lock, flags);
+
+	if (copy_to_user((void __user *)value, info, sizeof(*info)))
+		ret = -EFAULT;
+
+out_free:
+	kfree(info);
+out:
+	return ret;
+}
+
 static long raw_ioctl(struct file *fd, unsigned int cmd, unsigned long value)
 {
 	struct raw_dev *dev = fd->private_data;
@@ -1069,6 +1125,9 @@ static long raw_ioctl(struct file *fd, unsigned int cmd, unsigned long value)
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
index 02885e021ee5..c89f6341229c 100644
--- a/include/uapi/linux/usb/raw_gadget.h
+++ b/include/uapi/linux/usb/raw_gadget.h
@@ -93,6 +93,64 @@ struct usb_raw_ep_io {
 	__u8		data[0];
 };
 
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
+ * struct usb_raw_ep_caps - exposes endpoint capabilities from struct usb_ep
+ *     (technically from its member struct usb_ep_caps).
+ */
+struct usb_raw_ep_caps {
+	__u32	type_control	: 1;
+	__u32	type_iso	: 1;
+	__u32	type_bulk	: 1;
+	__u32	type_int	: 1;
+	__u32	dir_in		: 1;
+	__u32	dir_out		: 1;
+};
+
+/*
+ * struct usb_raw_ep_limits - exposes endpoint limits from struct usb_ep.
+ * @maxpacket_limit: Maximum packet size value supported by this endpoint.
+ * @max_streams: maximum number of streams supported by this endpoint
+ *     (actual number is 2^n).
+ * @reserved: Empty, reserved for potential future extensions.
+ */
+struct usb_raw_ep_limits {
+	__u16	maxpacket_limit;
+	__u16	max_streams;
+	__u32	reserved;
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
@@ -126,9 +184,9 @@ struct usb_raw_ep_io {
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
 #define USB_RAW_IOCTL_EP_ENABLE		_IOW('U', 5, struct usb_endpoint_descriptor)
@@ -165,4 +223,12 @@ struct usb_raw_ep_io {
  */
 #define USB_RAW_IOCTL_VBUS_DRAW		_IOW('U', 10, __u32)
 
+/*
+ * Fills in the usb_raw_eps_info structure with information about non-control
+ * endpoints available for the currently connected UDC.
+ * Returns the number of available endpoints on success or negative error code
+ * on failure.
+ */
+#define USB_RAW_IOCTL_EPS_INFO		_IOR('U', 11, struct usb_raw_eps_info)
+
 #endif /* _UAPI__LINUX_USB_RAW_GADGET_H */
-- 
2.26.2.526.g744177e7f7-goog

