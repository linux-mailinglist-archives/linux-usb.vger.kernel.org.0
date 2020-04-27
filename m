Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836FF1BA7B2
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 17:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbgD0PQY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 11:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726539AbgD0PQY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 11:16:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04568C0610D5
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2020 08:16:24 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jT5Uc-0000tR-J6; Mon, 27 Apr 2020 17:16:22 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jT5Ub-0002r0-Q4; Mon, 27 Apr 2020 17:16:21 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2] usb: gadget: uvc_video: add worker to handle the frame pumping
Date:   Mon, 27 Apr 2020 17:16:14 +0200
Message-Id: <20200427151614.10868-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200421141003.GC2338@pengutronix.de>
References: <20200421141003.GC2338@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch moves the function uvc_video_pump to be a separate schedule
worker. This way the completion handler of each usb request and every
direct caller of the pump has only to schedule the worker instead of
doing the request handling by itself.

Moving the request handling to only one thread solves the
locking problems between the three queueing cases.

Many drivers handle the completion handlers directly in their interrupt
handlers. This patch also reduces the workload on each interrupt.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
v1 -> v2: - only trigger the worker when in streaming state

 drivers/usb/gadget/function/uvc.h       |  2 +
 drivers/usb/gadget/function/uvc_v4l2.c  |  5 +-
 drivers/usb/gadget/function/uvc_video.c | 78 +++++--------------------
 drivers/usb/gadget/function/uvc_video.h |  2 -
 4 files changed, 22 insertions(+), 65 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 1473d25ff17ad1..88e820db9234ec 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -77,6 +77,8 @@ struct uvc_video {
 	struct uvc_device *uvc;
 	struct usb_ep *ep;
 
+	struct work_struct pump;
+
 	/* Frame parameters */
 	u8 bpp;
 	u32 fcc;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 495f0ec663ead9..67922b1355e69b 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -169,7 +169,10 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 	if (ret < 0)
 		return ret;
 
-	return uvcg_video_pump(video);
+	if (uvc->state == UVC_STATE_STREAMING)
+		schedule_work(&video->pump);
+
+	return ret;
 }
 
 static int
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 5c042f3807081a..14d2bdbc1779e9 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -142,44 +142,13 @@ static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
 	return ret;
 }
 
-/*
- * I somehow feel that synchronisation won't be easy to achieve here. We have
- * three events that control USB requests submission:
- *
- * - USB request completion: the completion handler will resubmit the request
- *   if a video buffer is available.
- *
- * - USB interface setting selection: in response to a SET_INTERFACE request,
- *   the handler will start streaming if a video buffer is available and if
- *   video is not currently streaming.
- *
- * - V4L2 buffer queueing: the driver will start streaming if video is not
- *   currently streaming.
- *
- * Race conditions between those 3 events might lead to deadlocks or other
- * nasty side effects.
- *
- * The "video currently streaming" condition can't be detected by the irqqueue
- * being empty, as a request can still be in flight. A separate "queue paused"
- * flag is thus needed.
- *
- * The paused flag will be set when we try to retrieve the irqqueue head if the
- * queue is empty, and cleared when we queue a buffer.
- *
- * The USB request completion handler will get the buffer at the irqqueue head
- * under protection of the queue spinlock. If the queue is empty, the streaming
- * paused flag will be set. Right after releasing the spinlock a userspace
- * application can queue a buffer. The flag will then cleared, and the ioctl
- * handler will restart the video stream.
- */
 static void
 uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct uvc_video *video = req->context;
 	struct uvc_video_queue *queue = &video->queue;
-	struct uvc_buffer *buf;
+	struct uvc_device *uvc = video->uvc;
 	unsigned long flags;
-	int ret;
 
 	switch (req->status) {
 	case 0:
@@ -188,39 +157,21 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	case -ESHUTDOWN:	/* disconnect from host. */
 		uvcg_dbg(&video->uvc->func, "VS request cancelled.\n");
 		uvcg_queue_cancel(queue, 1);
-		goto requeue;
+		break;
 
 	default:
 		uvcg_info(&video->uvc->func,
 			  "VS request completed with status %d.\n",
 			  req->status);
 		uvcg_queue_cancel(queue, 0);
-		goto requeue;
 	}
 
-	spin_lock_irqsave(&video->queue.irqlock, flags);
-	buf = uvcg_queue_head(&video->queue);
-	if (buf == NULL) {
-		spin_unlock_irqrestore(&video->queue.irqlock, flags);
-		goto requeue;
-	}
-
-	video->encode(req, video, buf);
-
-	ret = uvcg_video_ep_queue(video, req);
-	spin_unlock_irqrestore(&video->queue.irqlock, flags);
-
-	if (ret < 0) {
-		uvcg_queue_cancel(queue, 0);
-		goto requeue;
-	}
-
-	return;
-
-requeue:
 	spin_lock_irqsave(&video->req_lock, flags);
 	list_add_tail(&req->list, &video->req_free);
 	spin_unlock_irqrestore(&video->req_lock, flags);
+
+	if (uvc->state == UVC_STATE_STREAMING)
+		schedule_work(&video->pump);
 }
 
 static int
@@ -294,18 +245,15 @@ uvc_video_alloc_requests(struct uvc_video *video)
  * This function fills the available USB requests (listed in req_free) with
  * video data from the queued buffers.
  */
-int uvcg_video_pump(struct uvc_video *video)
+static void uvcg_video_pump(struct work_struct *work)
 {
+	struct uvc_video *video = container_of(work, struct uvc_video, pump);
 	struct uvc_video_queue *queue = &video->queue;
 	struct usb_request *req;
 	struct uvc_buffer *buf;
 	unsigned long flags;
 	int ret;
 
-	/* FIXME TODO Race between uvcg_video_pump and requests completion
-	 * handler ???
-	 */
-
 	while (1) {
 		/* Retrieve the first available USB request, protected by the
 		 * request lock.
@@ -313,7 +261,7 @@ int uvcg_video_pump(struct uvc_video *video)
 		spin_lock_irqsave(&video->req_lock, flags);
 		if (list_empty(&video->req_free)) {
 			spin_unlock_irqrestore(&video->req_lock, flags);
-			return 0;
+			return;
 		}
 		req = list_first_entry(&video->req_free, struct usb_request,
 					list);
@@ -345,7 +293,7 @@ int uvcg_video_pump(struct uvc_video *video)
 	spin_lock_irqsave(&video->req_lock, flags);
 	list_add_tail(&req->list, &video->req_free);
 	spin_unlock_irqrestore(&video->req_lock, flags);
-	return 0;
+	return;
 }
 
 /*
@@ -363,6 +311,9 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 	}
 
 	if (!enable) {
+		cancel_work_sync(&video->pump);
+		uvcg_queue_cancel(&video->queue, 0);
+
 		for (i = 0; i < UVC_NUM_REQUESTS; ++i)
 			if (video->req[i])
 				usb_ep_dequeue(video->ep, video->req[i]);
@@ -384,7 +335,9 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 	} else
 		video->encode = uvc_video_encode_isoc;
 
-	return uvcg_video_pump(video);
+	schedule_work(&video->pump);
+
+	return ret;
 }
 
 /*
@@ -394,6 +347,7 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 {
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
+	INIT_WORK(&video->pump, uvcg_video_pump);
 
 	video->uvc = uvc;
 	video->fcc = V4L2_PIX_FMT_YUYV;
diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
index dff12103f69699..c618c7bee4756a 100644
--- a/drivers/usb/gadget/function/uvc_video.h
+++ b/drivers/usb/gadget/function/uvc_video.h
@@ -14,8 +14,6 @@
 
 struct uvc_video;
 
-int uvcg_video_pump(struct uvc_video *video);
-
 int uvcg_video_enable(struct uvc_video *video, int enable);
 
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc);
-- 
2.26.2

