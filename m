Return-Path: <linux-usb+bounces-2225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C27B97D84B6
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 16:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AC35282102
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 14:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425232EB07;
	Thu, 26 Oct 2023 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m3gmsQYZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108C2EAED
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 14:29:34 +0000 (UTC)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [IPv6:2001:41d0:203:375::bc])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3299A1A2
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 07:29:33 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1698330248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3WoE26nAgEdBcPVcwYl75mEnNpoIurBRTnIv4fRtFU=;
	b=m3gmsQYZFpE/NvKwO3uvnBHptamqVHuDQBj+qeCmN04QH0rR9MGJgSjR0+mM16CRz7Y15v
	YszuEHHTNjFLfnAUkF2t0uBJcx6V7xIIedpZz2LfWTCPDClrYXe5nz2U0eWrjIca1mFZqu
	rshzxKtceA7ssbd+f0BIGC8xNDpdq50=
From: andrey.konovalov@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] usb: raw-gadget: report suspend, resume, reset, and disconnect events
Date: Thu, 26 Oct 2023 16:24:01 +0200
Message-Id: <eb637fd7930722ff9dfc2ab4469d78040ee2a166.1698329862.git.andreyknvl@gmail.com>
In-Reply-To: <0db45b1d7cc466e3d4d1ab353f61d63c977fbbc5.1698329862.git.andreyknvl@gmail.com>
References: <0db45b1d7cc466e3d4d1ab353f61d63c977fbbc5.1698329862.git.andreyknvl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Andrey Konovalov <andreyknvl@gmail.com>

Update USB_RAW_IOCTL_EVENT_FETCH to also report suspend, resume, reset,
and disconnect events.

This allows the code that emulates a USB device via Raw Gadget to handle
these events. For example, the device can restart enumeration when it
gets reset.

Also do not print a WARNING when the event queue overflows. With these new
events being queued, the queue might overflow if the device emulation code
stops fetching events. Instead, print an error message.

Also print debug messages when a non-control event is received.

Signed-off-by: Andrey Konovalov <andreyknvl@gmail.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 53 ++++++++++++++++++++++----
 include/uapi/linux/usb/raw_gadget.h    | 14 ++++++-
 2 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index daac1f078516..ee712e6570b4 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -65,8 +65,9 @@ static int raw_event_queue_add(struct raw_event_queue *queue,
 	struct usb_raw_event *event;
 
 	spin_lock_irqsave(&queue->lock, flags);
-	if (WARN_ON(queue->size >= RAW_EVENT_QUEUE_SIZE)) {
+	if (queue->size >= RAW_EVENT_QUEUE_SIZE) {
 		spin_unlock_irqrestore(&queue->lock, flags);
+		dev_err(&gadget->dev, "event queue overflown\n");
 		return -ENOMEM;
 	}
 	event = kmalloc(sizeof(*event) + length, GFP_ATOMIC);
@@ -311,9 +312,10 @@ static int gadget_bind(struct usb_gadget *gadget,
 	dev->eps_num = i;
 	spin_unlock_irqrestore(&dev->lock, flags);
 
+	dev_dbg(&gadget->dev, "gadget connected\n");
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
 	if (ret < 0) {
-		dev_err(&gadget->dev, "failed to queue event\n");
+		dev_err(&gadget->dev, "failed to queue connect event\n");
 		set_gadget_data(gadget, NULL);
 		return ret;
 	}
@@ -358,7 +360,7 @@ static int gadget_setup(struct usb_gadget *gadget,
 
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONTROL, sizeof(*ctrl), ctrl);
 	if (ret < 0)
-		dev_err(&gadget->dev, "failed to queue event\n");
+		dev_err(&gadget->dev, "failed to queue control event\n");
 	goto out;
 
 out_unlock:
@@ -377,11 +379,46 @@ static int gadget_setup(struct usb_gadget *gadget,
 	return ret;
 }
 
-/* These are currently unused but present in case UDC driver requires them. */
-static void gadget_disconnect(struct usb_gadget *gadget) { }
-static void gadget_suspend(struct usb_gadget *gadget) { }
-static void gadget_resume(struct usb_gadget *gadget) { }
-static void gadget_reset(struct usb_gadget *gadget) { }
+static void gadget_disconnect(struct usb_gadget *gadget)
+{
+	struct raw_dev *dev = get_gadget_data(gadget);
+	int ret;
+
+	dev_dbg(&gadget->dev, "gadget disconnected\n");
+	ret = raw_queue_event(dev, USB_RAW_EVENT_DISCONNECT, 0, NULL);
+	if (ret < 0)
+		dev_err(&gadget->dev, "failed to queue disconnect event\n");
+}
+static void gadget_suspend(struct usb_gadget *gadget)
+{
+	struct raw_dev *dev = get_gadget_data(gadget);
+	int ret;
+
+	dev_dbg(&gadget->dev, "gadget suspended\n");
+	ret = raw_queue_event(dev, USB_RAW_EVENT_SUSPEND, 0, NULL);
+	if (ret < 0)
+		dev_err(&gadget->dev, "failed to queue suspend event\n");
+}
+static void gadget_resume(struct usb_gadget *gadget)
+{
+	struct raw_dev *dev = get_gadget_data(gadget);
+	int ret;
+
+	dev_dbg(&gadget->dev, "gadget resumed\n");
+	ret = raw_queue_event(dev, USB_RAW_EVENT_RESUME, 0, NULL);
+	if (ret < 0)
+		dev_err(&gadget->dev, "failed to queue resume event\n");
+}
+static void gadget_reset(struct usb_gadget *gadget)
+{
+	struct raw_dev *dev = get_gadget_data(gadget);
+	int ret;
+
+	dev_dbg(&gadget->dev, "gadget reset\n");
+	ret = raw_queue_event(dev, USB_RAW_EVENT_RESET, 0, NULL);
+	if (ret < 0)
+		dev_err(&gadget->dev, "failed to queue reset event\n");
+}
 
 /*----------------------------------------------------------------------*/
 
diff --git a/include/uapi/linux/usb/raw_gadget.h b/include/uapi/linux/usb/raw_gadget.h
index c7d2199134d7..f0224a8dc858 100644
--- a/include/uapi/linux/usb/raw_gadget.h
+++ b/include/uapi/linux/usb/raw_gadget.h
@@ -44,6 +44,16 @@ enum usb_raw_event_type {
 	/* This event is queued when a new control request arrived to ep0. */
 	USB_RAW_EVENT_CONTROL = 2,
 
+	/*
+	 * These events are queued when the gadget driver is suspended,
+	 * resumed, reset, or disconnected. Note that some UDCs (e.g. dwc2)
+	 * report a disconnect event instead of a reset.
+	 */
+	USB_RAW_EVENT_SUSPEND = 3,
+	USB_RAW_EVENT_RESUME = 4,
+	USB_RAW_EVENT_RESET = 5,
+	USB_RAW_EVENT_DISCONNECT = 6,
+
 	/* The list might grow in the future. */
 };
 
@@ -54,8 +64,8 @@ enum usb_raw_event_type {
  *     actual length of the fetched event data.
  * @data: A buffer to store the fetched event data.
  *
- * Currently the fetched data buffer is empty for USB_RAW_EVENT_CONNECT,
- * and contains struct usb_ctrlrequest for USB_RAW_EVENT_CONTROL.
+ * The fetched event data buffer contains struct usb_ctrlrequest for
+ * USB_RAW_EVENT_CONTROL and is empty for other events.
  */
 struct usb_raw_event {
 	__u32		type;
-- 
2.25.1


