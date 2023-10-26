Return-Path: <linux-usb+bounces-2235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5BE7D8983
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 22:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE823B2128B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 20:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6161D3CD13;
	Thu, 26 Oct 2023 20:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VGYbP43i"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE393C6B2
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 20:09:34 +0000 (UTC)
X-Greylist: delayed 487 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Oct 2023 13:09:31 PDT
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bd])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBFF51AC
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 13:09:31 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1698350483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rChh14RoKqHyNTtLO4oEGTir1WUGyXt9ry5A85Vdpuk=;
	b=VGYbP43i8J4IsipMVD+zeMt0fHoJnBYRw/yKfBwEDSHLF165mZk657fUGAW6Z6z7F1+H0W
	L/HFADJLtTzn+GsE1YxiJyBXy1pXgyb20osxW+e5iFmf36OGuuCM7hUZ61svAzlchTfN6U
	PZAeo7JpU0FDob/uVbpy0QFzmiAh050=
From: andrey.konovalov@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] usb: raw-gadget: report suspend, resume, reset, and disconnect events
Date: Thu, 26 Oct 2023 22:01:14 +0200
Message-Id: <d610b629a5f32fb76c24012180743f7f0f1872c0.1698350424.git.andreyknvl@gmail.com>
In-Reply-To: <0db45b1d7cc466e3d4d1ab353f61d63c977fbbc5.1698350424.git.andreyknvl@gmail.com>
References: <0db45b1d7cc466e3d4d1ab353f61d63c977fbbc5.1698350424.git.andreyknvl@gmail.com>
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
stops fetching events.

Also print debug messages when a non-control event is received.

Signed-off-by: Andrey Konovalov <andreyknvl@gmail.com>

---

Changes v1->v2:
- Don't print another error message if event queue overflows: each
  caller already prints one if event queueing fails.
---
 drivers/usb/gadget/legacy/raw_gadget.c | 52 ++++++++++++++++++++++----
 include/uapi/linux/usb/raw_gadget.h    | 14 ++++++-
 2 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index daac1f078516..399fca32a8ac 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -65,7 +65,7 @@ static int raw_event_queue_add(struct raw_event_queue *queue,
 	struct usb_raw_event *event;
 
 	spin_lock_irqsave(&queue->lock, flags);
-	if (WARN_ON(queue->size >= RAW_EVENT_QUEUE_SIZE)) {
+	if (queue->size >= RAW_EVENT_QUEUE_SIZE) {
 		spin_unlock_irqrestore(&queue->lock, flags);
 		return -ENOMEM;
 	}
@@ -311,9 +311,10 @@ static int gadget_bind(struct usb_gadget *gadget,
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
@@ -358,7 +359,7 @@ static int gadget_setup(struct usb_gadget *gadget,
 
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONTROL, sizeof(*ctrl), ctrl);
 	if (ret < 0)
-		dev_err(&gadget->dev, "failed to queue event\n");
+		dev_err(&gadget->dev, "failed to queue control event\n");
 	goto out;
 
 out_unlock:
@@ -377,11 +378,46 @@ static int gadget_setup(struct usb_gadget *gadget,
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


