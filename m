Return-Path: <linux-usb+bounces-3008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA17F0BD0
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 07:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C5C9280C48
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 06:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B116546B3;
	Mon, 20 Nov 2023 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kQtkuQcz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2E6E5
	for <linux-usb@vger.kernel.org>; Sun, 19 Nov 2023 22:20:39 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cf61cbe570so5141665ad.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Nov 2023 22:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700461239; x=1701066039; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpRAxzka1HLHoAoAc2/H0bEtCTJ9kmkVxTC2KoNrzFw=;
        b=kQtkuQczevhV++xPYIsCkT9BIntVUG1ZsCp+jGC4ZRgVcsKY8liSaJ+HpEF/RZIjEn
         qMirzlmjgxeGRRwa5upkSU5GV+pLVWWYUNfNakvLsenndl9T1Rbvo2BJzpCT/yvvN6xi
         YvymaP9aqfcCRWxWX7fcWP7KCz495XgN6xtbEGMHzdALdHL4PB2wJzUhmqIC6NkbsPIx
         AW72XcTlTEv9ihNW88SeUWtLPTs2HN1ULJATCKReJjv+xL+qH/SYzpiQ3iZrdRNsg5r8
         NE1diTt1D/c8hniSsO4msbjmggKoFQMQy1lnInSLNkpuC9gu4FRiCE1oySC5xUV9Dym7
         rtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700461239; x=1701066039;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpRAxzka1HLHoAoAc2/H0bEtCTJ9kmkVxTC2KoNrzFw=;
        b=sBZcOQn8hrx7PKGSkojER1jchrTMvLDyqsFeMFT6fPp6fmORYIOD1vbNICHd23SUYK
         sjtelcngkavI1PPAmz14k+fUIFn9SFDxbjC+V8RuRR8fbShdaT25iLIDombGUoFTfmeF
         0zoK/2EL8R5kmgMgoWkpAXvXGTY2/JoZojXyPfpR6g1aH+w5DnU8fslH9MjSTvtmaTl4
         whifufdk1SBp/JaLihIARDZWKgM8rPAbYsKw1g18NQgrRLGBW4qXDGvHabNhmwMUXwok
         cIjlr8BKCFGXCh9sr1Plji3cu17TaczjxQkuhMQUlfAfrgJsHXPUMhAipAAfBWxAQLXe
         q9gA==
X-Gm-Message-State: AOJu0Yy4eSNG0JsNipOBTA1l3Wb+ZMxmna6Z5/feSrd2G3ZIQVR/E7g0
	h658SisrkY3MQxxvjZ5opLA7NgZY5dmPMRr2
X-Google-Smtp-Source: AGHT+IFQ/PmU/737Z4fWDvoI0bVaWyzw36MFIA1H26LMYLgmmS6KdkfL2Px2Wiexn4HblpjRAbvNnC/ULKuwe0M1
X-Received: from jchowdhary2.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:434b])
 (user=jchowdhary job=sendgmr) by 2002:a17:902:d2c7:b0:1cc:23d2:bb94 with SMTP
 id n7-20020a170902d2c700b001cc23d2bb94mr2060214plc.1.1700461239400; Sun, 19
 Nov 2023 22:20:39 -0800 (PST)
Date: Mon, 20 Nov 2023 06:20:25 +0000
In-Reply-To: <20231109073453.751860-1-jchowdhary@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231109073453.751860-1-jchowdhary@google.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231120062026.3759463-1-jchowdhary@google.com>
Subject: [PATCH v7] usb:gadget:uvc Do not use worker thread to pump isoc usb requests
From: Jayant Chowdhary <jchowdhary@google.com>
To: dan.scally@ideasonboard.com, jchowdhary@google.com, 
	stern@rowland.harvard.edu, laurent.pinchart@ideasonboard.com, 
	m.grzeschik@pengutronix.de, gregkh@linuxfoundation.org
Cc: Thinh.Nguyen@synopsys.com, arakesh@google.com, etalvala@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When we use an async work queue to perform the function of pumping
usb requests to the usb controller, it is possible that amongst other
factors, thread scheduling affects at what cadence we're able to pump
requests. This could mean isoc usb requests miss their uframes - resulting
in video stream flickers on the host device.

To avoid this, we make the async_wq thread only produce isoc usb_requests
with uvc buffers encoded into them. The process of queueing to the
endpoint is done by the uvc_video_complete() handler. In case no
usb_requests are ready with encoded information, we just queue a zero
length request to the endpoint from the complete handler.

For bulk endpoints the async_wq thread still queues usb requests to the
endpoint.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Jayant Chowdhary <jchowdhary@google.com>
Suggested-by: Avichal Rakesh <arakesh@google.com>
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
---
 Based on top of
 https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:
 v1->v2: Added self Signed-Off-by and addressed review comments
 v2->v3: Encode to usb requests in async_wq; queue to ep in complete handler
	 for isoc transfers.
 v3->v4: Address review comments around code style.
 v4->v5: Update comments. Remove 0 length request queueing from async_wq
	 thread since it is already done by the complete handler.
 v5->v6: Fix checkpatch.pl suggestions.
 v6->v7: Fix code style review comments.

 drivers/usb/gadget/function/uvc.h       |   8 +
 drivers/usb/gadget/function/uvc_video.c | 204 ++++++++++++++++++------
 2 files changed, 166 insertions(+), 46 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index e8d4c87f1e09..5ff454528bd8 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -105,7 +105,15 @@ struct uvc_video {
 	bool is_enabled; /* tracks whether video stream is enabled */
 	unsigned int req_size;
 	struct list_head ureqs; /* all uvc_requests allocated by uvc_video */
+
+	/* USB requests that the video pump thread can encode into */
 	struct list_head req_free;
+
+	/*
+	 * USB requests video pump thread has already encoded into. These are
+	 * ready to be queued to the endpoint.
+	 */
+	struct list_head req_ready;
 	spinlock_t req_lock;
 
 	unsigned int req_int_count;
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 53feb790a4c3..dbf055d8094f 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -268,6 +268,101 @@ static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
 	return ret;
 }
 
+/* This function must be called with video->req_lock held. */
+static int uvcg_video_usb_req_queue(struct uvc_video *video,
+	struct usb_request *req, bool queue_to_ep)
+{
+	bool is_bulk = video->max_payload_size;
+	struct list_head *list = NULL;
+
+	if (!video->is_enabled) {
+		uvc_video_free_request(req->context, video->ep);
+		return -ENODEV;
+	}
+	if (queue_to_ep) {
+		struct uvc_request *ureq = req->context;
+		/*
+		 * With USB3 handling more requests at a higher speed, we can't
+		 * afford to generate an interrupt for every request. Decide to
+		 * interrupt:
+		 *
+		 * - When no more requests are available in the free queue, as
+		 *   this may be our last chance to refill the endpoint's
+		 *   request queue.
+		 *
+		 * - When this is request is the last request for the video
+		 *   buffer, as we want to start sending the next video buffer
+		 *   ASAP in case it doesn't get started already in the next
+		 *   iteration of this loop.
+		 *
+		 * - Four times over the length of the requests queue (as
+		 *   indicated by video->uvc_num_requests), as a trade-off
+		 *   between latency and interrupt load.
+		 */
+		if (list_empty(&video->req_free) || ureq->last_buf ||
+			!(video->req_int_count %
+			DIV_ROUND_UP(video->uvc_num_requests, 4))) {
+			video->req_int_count = 0;
+			req->no_interrupt = 0;
+		} else {
+			req->no_interrupt = 1;
+		}
+		video->req_int_count++;
+		return uvcg_video_ep_queue(video, req);
+	}
+	/*
+	 * If we're not queuing to the ep, for isoc we're queuing
+	 * to the req_ready list, otherwise req_free.
+	 */
+	list = is_bulk ? &video->req_free : &video->req_ready;
+	list_add_tail(&req->list, list);
+	return 0;
+}
+
+/*
+ * Must only be called from uvcg_video_enable - since after that we only want to
+ * queue requests to the endpoint from the uvc_video_complete complete handler.
+ * This function is needed in order to 'kick start' the flow of requests from
+ * gadget driver to the usb controller.
+ */
+static void uvc_video_ep_queue_initial_requests(struct uvc_video *video)
+{
+	struct usb_request *req = NULL;
+	unsigned long flags = 0;
+	unsigned int count = 0;
+	int ret = 0;
+
+	/*
+	 * We only queue half of the free list since we still want to have
+	 * some free usb_requests in the free list for the video_pump async_wq
+	 * thread to encode uvc buffers into. Otherwise we could get into a
+	 * situation where the free list does not have any usb requests to
+	 * encode into - we always end up queueing 0 length requests to the
+	 * end point.
+	 */
+	unsigned int half_list_size = video->uvc_num_requests / 2;
+
+	spin_lock_irqsave(&video->req_lock, flags);
+	/*
+	 * Take these requests off the free list and queue them all to the
+	 * endpoint. Since we queue 0 length requests with the req_lock held,
+	 * there isn't any 'data' race involved here with the complete handler.
+	 */
+	while (count < half_list_size) {
+		req = list_first_entry(&video->req_free, struct usb_request,
+					list);
+		list_del(&req->list);
+		req->length = 0;
+		ret = uvcg_video_ep_queue(video, req);
+		if (ret < 0) {
+			uvcg_queue_cancel(&video->queue, 0);
+			break;
+		}
+		count++;
+	}
+	spin_unlock_irqrestore(&video->req_lock, flags);
+}
+
 static void
 uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 {
@@ -276,6 +371,8 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uvc_video_queue *queue = &video->queue;
 	struct uvc_buffer *last_buf = NULL;
 	unsigned long flags;
+	bool is_bulk = video->max_payload_size;
+	int ret = 0;
 
 	spin_lock_irqsave(&video->req_lock, flags);
 	if (!video->is_enabled) {
@@ -329,8 +426,45 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	 * back to req_free
 	 */
 	if (video->is_enabled) {
-		list_add_tail(&req->list, &video->req_free);
-		queue_work(video->async_wq, &video->pump);
+		/*
+		 * Here we check whether any request is available in the ready
+		 * list. If it is, queue it to the ep and add the current
+		 * usb_request to the req_free list - for video_pump to fill in.
+		 * Otherwise, just use the current usb_request to queue a 0
+		 * length request to the ep. Since we always add to the req_free
+		 * list if we dequeue from the ready list, there will never
+		 * be a situation where the req_free list is completely out of
+		 * requests and cannot recover.
+		 */
+		struct usb_request *to_queue = req;
+
+		to_queue->length = 0;
+		if (!list_empty(&video->req_ready)) {
+			to_queue = list_first_entry(&video->req_ready,
+				struct usb_request, list);
+			list_del(&to_queue->list);
+			list_add_tail(&req->list, &video->req_free);
+			/*
+			 * Queue work to the wq as well since it is possible that a
+			 * buffer may not have been completely encoded with the set of
+			 * in-flight usb requests for whih the complete callbacks are
+			 * firing.
+			 * In that case, if we do not queue work to the worker thread,
+			 * the buffer will never be marked as complete - and therefore
+			 * not be returned to userpsace. As a result,
+			 * dequeue -> queue -> dequeue flow of uvc buffers will not
+			 * happen.
+			 */
+			queue_work(video->async_wq, &video->pump);
+		}
+		/*
+		 * Queue to the endpoint. The actual queueing to ep will
+		 * only happen on one thread - the async_wq for bulk endpoints
+		 * and this thread for isoc endpoints.
+		 */
+		ret = uvcg_video_usb_req_queue(video, to_queue, !is_bulk);
+		if (ret < 0)
+			uvcg_queue_cancel(queue, 0);
 	} else {
 		uvc_video_free_request(ureq, ep);
 	}
@@ -347,6 +481,7 @@ uvc_video_free_requests(struct uvc_video *video)
 
 	INIT_LIST_HEAD(&video->ureqs);
 	INIT_LIST_HEAD(&video->req_free);
+	INIT_LIST_HEAD(&video->req_ready);
 	video->req_size = 0;
 	return 0;
 }
@@ -424,8 +559,7 @@ static void uvcg_video_pump(struct work_struct *work)
 	struct usb_request *req = NULL;
 	struct uvc_buffer *buf;
 	unsigned long flags;
-	bool buf_done;
-	int ret;
+	int ret = 0;
 
 	while (true) {
 		if (!video->ep->enabled)
@@ -454,15 +588,6 @@ static void uvcg_video_pump(struct work_struct *work)
 
 		if (buf != NULL) {
 			video->encode(req, video, buf);
-			buf_done = buf->state == UVC_BUF_STATE_DONE;
-		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) && !is_bulk) {
-			/*
-			 * No video buffer available; the queue is still connected and
-			 * we're transferring over ISOC. Queue a 0 length request to
-			 * prevent missed ISOC transfers.
-			 */
-			req->length = 0;
-			buf_done = false;
 		} else {
 			/*
 			 * Either the queue has been disconnected or no video buffer
@@ -473,45 +598,25 @@ static void uvcg_video_pump(struct work_struct *work)
 			break;
 		}
 
-		/*
-		 * With USB3 handling more requests at a higher speed, we can't
-		 * afford to generate an interrupt for every request. Decide to
-		 * interrupt:
-		 *
-		 * - When no more requests are available in the free queue, as
-		 *   this may be our last chance to refill the endpoint's
-		 *   request queue.
-		 *
-		 * - When this is request is the last request for the video
-		 *   buffer, as we want to start sending the next video buffer
-		 *   ASAP in case it doesn't get started already in the next
-		 *   iteration of this loop.
-		 *
-		 * - Four times over the length of the requests queue (as
-		 *   indicated by video->uvc_num_requests), as a trade-off
-		 *   between latency and interrupt load.
-		 */
-		if (list_empty(&video->req_free) || buf_done ||
-		    !(video->req_int_count %
-		       DIV_ROUND_UP(video->uvc_num_requests, 4))) {
-			video->req_int_count = 0;
-			req->no_interrupt = 0;
-		} else {
-			req->no_interrupt = 1;
-		}
-
-		/* Queue the USB request */
-		ret = uvcg_video_ep_queue(video, req);
 		spin_unlock_irqrestore(&queue->irqlock, flags);
 
+		spin_lock_irqsave(&video->req_lock, flags);
+		/* For bulk end points we queue from the worker thread
+		 * since we would preferably not want to wait on requests
+		 * to be ready, in the uvcg_video_complete() handler.
+		 * For isoc endpoints we add the request to the ready list
+		 * and only queue it to the endpoint from the complete handler.
+		 */
+		ret = uvcg_video_usb_req_queue(video, req, is_bulk);
+		spin_unlock_irqrestore(&video->req_lock, flags);
+
 		if (ret < 0) {
 			uvcg_queue_cancel(queue, 0);
 			break;
 		}
 
-		/* Endpoint now owns the request */
+		/* The request is owned by  the endpoint / ready list. */
 		req = NULL;
-		video->req_int_count++;
 	}
 
 	if (!req)
@@ -567,7 +672,7 @@ uvcg_video_disable(struct uvc_video *video)
 
 	spin_lock_irqsave(&video->req_lock, flags);
 	/*
-	 * Remove all uvc_reqeusts from ureqs with list_del_init
+	 * Remove all uvc_requests from ureqs with list_del_init
 	 * This lets uvc_video_free_request correctly identify
 	 * if the uvc_request is attached to a list or not when freeing
 	 * memory.
@@ -580,8 +685,14 @@ uvcg_video_disable(struct uvc_video *video)
 		uvc_video_free_request(req->context, video->ep);
 	}
 
+	list_for_each_entry_safe(req, temp, &video->req_ready, list) {
+		list_del(&req->list);
+		uvc_video_free_request(req->context, video->ep);
+	}
+
 	INIT_LIST_HEAD(&video->ureqs);
 	INIT_LIST_HEAD(&video->req_free);
+	INIT_LIST_HEAD(&video->req_ready);
 	video->req_size = 0;
 	spin_unlock_irqrestore(&video->req_lock, flags);
 
@@ -635,7 +746,7 @@ int uvcg_video_enable(struct uvc_video *video)
 
 	video->req_int_count = 0;
 
-	queue_work(video->async_wq, &video->pump);
+	uvc_video_ep_queue_initial_requests(video);
 
 	return ret;
 }
@@ -648,6 +759,7 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	video->is_enabled = false;
 	INIT_LIST_HEAD(&video->ureqs);
 	INIT_LIST_HEAD(&video->req_free);
+	INIT_LIST_HEAD(&video->req_ready);
 	spin_lock_init(&video->req_lock);
 	INIT_WORK(&video->pump, uvcg_video_pump);
 
-- 
2.43.0.rc0.421.g78406f8d94-goog


