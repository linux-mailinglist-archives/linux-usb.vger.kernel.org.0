Return-Path: <linux-usb+bounces-2369-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C36B37DC121
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 21:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B562B20E9B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 20:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3471BDC5;
	Mon, 30 Oct 2023 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UPkhwxO/"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BED1BDE1
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 20:22:48 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704A5122
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 13:22:45 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5af9b0850fdso42103907b3.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698697364; x=1699302164; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbOVumUcV68mIKCi6fEpI8cWauaRcxzC7BeR9lzomMU=;
        b=UPkhwxO/nfNOeDRN+59n+wFmQN4EY3KCx+ia1i7HQZwrTuRn8lT2lwJKx37Tj49V9x
         qvEEUwRWnHkavRMT3TxGDuHwp2+uPo3sgJpMuvtzwgDNBupah78NBhzFAsE66yJlSeUO
         /ymMvsVpcl4uabUHDwP7lDpeZEJXS632JJPja5J1t2F/M6Bxp2A2bUSSO3cDnMPplk9p
         Uhjkb3nQorHd8gisgdQuMbpj8T46IN5ZUZwkwLdTUPLTNcSphYuJzGKw8B/dDRi3FtB+
         1eFIZwPGOfSXGGZStIPCaSHIlgRqEKvQRdlJQXkAnFa57I7dJzQJWDa6hVve0w2qDkj5
         vHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698697364; x=1699302164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbOVumUcV68mIKCi6fEpI8cWauaRcxzC7BeR9lzomMU=;
        b=udbLqq6/s4+2SoMtRP+rSgXG3aEBIpSn2AL9ZNbhF4EPLZ5GVymygbV7s+tVBFQ0Gs
         1RMjM9Lu0ne5w4RvgCzoVvbBrz2YV/K/DSYbP3wNVcUvXYW7kPy4AZBTRxvRD1eyNDa9
         mTWi9WUtb95OqnVsEk8AiDIgCW32XoDeIDdR1vsekfblKcjAsS5SEBF8nSF9b838IwfR
         /1vckRpK9tm4475BQRribPqExCdYFKgfSZ/Yb8gIuurey6PI9WS3Wl1Ttdd465CP4IOC
         V1G4psLFmUH/LCc7qLFWuqkssIzaX/N1FGXI67FR9LAo1ztk7RbPZcbBF0TUKBruiocc
         HS+w==
X-Gm-Message-State: AOJu0Yzg4F2QWN9th5cQolmZw5UGZq0DPy2x/GdhKNaU73DFz0OisU/d
	erzjCiUfrk64N0mOHMwwxeIPuTseyl5r
X-Google-Smtp-Source: AGHT+IEixQJKyzDYPYtIYlV6CV+Wwq0AlCtMsckgwia5fi03K84hbEf2IOvePCwbg+0fnokk+T2kxy+1nYlW
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a0d:df82:0:b0:576:af04:3495 with SMTP id
 i124-20020a0ddf82000000b00576af043495mr227231ywe.9.1698697364705; Mon, 30 Oct
 2023 13:22:44 -0700 (PDT)
Date: Mon, 30 Oct 2023 13:22:31 -0700
In-Reply-To: <20231030202231.3263253-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <73309396-3856-43a2-9a6f-81a40ed594db@google.com> <20231030202231.3263253-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231030202231.3263253-4-arakesh@google.com>
Subject: [PATCH v10 4/4] usb: gadget: uvc: Fix use-after-free for inflight usb_requests
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, dan.scally@ideasonboard.com
Cc: etalvala@google.com, gregkh@linuxfoundation.org, jchowdhary@google.com, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, m.grzeschik@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Currently, the uvc gadget driver allocates all uvc_requests as one array
and deallocates them all when the video stream stops. This includes
de-allocating all the usb_requests associated with those uvc_requests.
This can lead to use-after-free issues if any of those de-allocated
usb_requests were still owned by the usb controller.

This is patch 2 of 2 in fixing the use-after-free issue. It adds a new
flag to uvc_video to track when frames and requests should be flowing.
When disabling the video stream, the flag is tripped and, instead
of de-allocating all uvc_requests and usb_requests, the gadget
driver only de-allocates those usb_requests that are currently
owned by it (as present in req_free). Other usb_requests are left
untouched until their completion handler is called which takes care
of freeing the usb_request and its corresponding uvc_request.

Now that uvc_video does not depends on uvc->state, this patch removes
unnecessary upates to uvc->state that were made to accommodate uvc_video
logic. This should ensure that uvc gadget driver never accidentally
de-allocates a usb_request that it doesn't own.

Link: https://lore.kernel.org/7cd81649-2795-45b6-8c10-b7df1055020d@google.com
Suggested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Reviewed-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
v1 -> v2 : Rebased to ToT, and fixed deadlock reported in
           https://lore.kernel.org/all/ZRv2UnKztgyqk2pt@pengutronix.de/
v2 -> v3 : Fix email threading goof-up
v3 -> v4 : re-rebase to ToT & moved to a uvc_video level lock
           as discussed in
           https://lore.kernel.org/b14b296f-2e08-4edf-aeea-1c5b621e2d0c@google.com/
v4 -> v5 : Address review comments. Add Reviewed-by & Tested-by.
v5 -> v6 : Added another patch before this one to make uvcg_video_disable
           easier to review.
v6 -> v7 : Fix warning reported in
           https://lore.kernel.org/202310200457.GwPPFuHX-lkp@intel.com/
v7 -> v8 : No change. Getting back in review queue
v8 -> v9 : No change.
v9 -> v10: Address review comments. Rebase to ToT (usb-next)

 drivers/usb/gadget/function/uvc.h       |   1 +
 drivers/usb/gadget/function/uvc_v4l2.c  |  10 +-
 drivers/usb/gadget/function/uvc_video.c | 129 ++++++++++++++++++++----
 3 files changed, 111 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 993694da0bbc..be0d012aa244 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -102,6 +102,7 @@ struct uvc_video {
 	unsigned int uvc_num_requests;

 	/* Requests */
+	bool is_enabled; /* tracks whether video stream is enabled */
 	unsigned int req_size;
 	struct list_head ureqs; /* all uvc_requests allocated by uvc_video */
 	struct list_head req_free;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 904dd283cbf7..c7e5fa4f29e0 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -468,11 +468,11 @@ uvc_v4l2_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	if (type != video->queue.queue.type)
 		return -EINVAL;

-	uvc->state = UVC_STATE_CONNECTED;
 	ret = uvcg_video_disable(video);
 	if (ret < 0)
 		return ret;

+	uvc->state = UVC_STATE_CONNECTED;
 	uvc_function_setup_continue(uvc, 1);
 	return 0;
 }
@@ -507,14 +507,6 @@ uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
 static void uvc_v4l2_disable(struct uvc_device *uvc)
 {
 	uvc_function_disconnect(uvc);
-	/*
-	 * Drop uvc->state to CONNECTED if it was streaming before.
-	 * This ensures that the usb_requests are no longer queued
-	 * to the controller.
-	 */
-	if (uvc->state == UVC_STATE_STREAMING)
-		uvc->state = UVC_STATE_CONNECTED;
-
 	uvcg_video_disable(&uvc->video);
 	uvcg_free_buffers(&uvc->video.queue);
 	uvc->func_connected = false;
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index c3e8c48f46a9..53feb790a4c3 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -227,6 +227,9 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
  * Request handling
  */

+/*
+ * Must be called with req_lock held as it modifies the list ureq is held in
+ */
 static void
 uvc_video_free_request(struct uvc_request *ureq, struct usb_ep *ep)
 {
@@ -271,9 +274,26 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uvc_request *ureq = req->context;
 	struct uvc_video *video = ureq->video;
 	struct uvc_video_queue *queue = &video->queue;
-	struct uvc_device *uvc = video->uvc;
+	struct uvc_buffer *last_buf = NULL;
 	unsigned long flags;

+	spin_lock_irqsave(&video->req_lock, flags);
+	if (!video->is_enabled) {
+		/*
+		 * When is_enabled is false, uvcg_video_disable() ensures
+		 * that in-flight uvc_buffers are returned, so we can
+		 * safely call free_request without worrying about
+		 * last_buf.
+		 */
+		uvc_video_free_request(ureq, ep);
+		spin_unlock_irqrestore(&video->req_lock, flags);
+		return;
+	}
+
+	last_buf = ureq->last_buf;
+	ureq->last_buf = NULL;
+	spin_unlock_irqrestore(&video->req_lock, flags);
+
 	switch (req->status) {
 	case 0:
 		break;
@@ -295,17 +315,26 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 		uvcg_queue_cancel(queue, 0);
 	}

-	if (ureq->last_buf) {
-		uvcg_complete_buffer(&video->queue, ureq->last_buf);
-		ureq->last_buf = NULL;
+	if (last_buf) {
+		spin_lock_irqsave(&queue->irqlock, flags);
+		uvcg_complete_buffer(&video->queue, last_buf);
+		spin_unlock_irqrestore(&queue->irqlock, flags);
 	}

 	spin_lock_irqsave(&video->req_lock, flags);
-	list_add_tail(&req->list, &video->req_free);
-	spin_unlock_irqrestore(&video->req_lock, flags);
-
-	if (uvc->state == UVC_STATE_STREAMING)
+	/*
+	 * Video stream might have been disabled while we were
+	 * processing the current usb_request. So make sure
+	 * we're still streaming before queueing the usb_request
+	 * back to req_free
+	 */
+	if (video->is_enabled) {
+		list_add_tail(&req->list, &video->req_free);
 		queue_work(video->async_wq, &video->pump);
+	} else {
+		uvc_video_free_request(ureq, ep);
+	}
+	spin_unlock_irqrestore(&video->req_lock, flags);
 }

 static int
@@ -392,20 +421,22 @@ static void uvcg_video_pump(struct work_struct *work)
 	struct uvc_video_queue *queue = &video->queue;
 	/* video->max_payload_size is only set when using bulk transfer */
 	bool is_bulk = video->max_payload_size;
-	struct uvc_device *uvc = video->uvc;
 	struct usb_request *req = NULL;
 	struct uvc_buffer *buf;
 	unsigned long flags;
 	bool buf_done;
 	int ret;

-	while (uvc->state == UVC_STATE_STREAMING && video->ep->enabled) {
+	while (true) {
+		if (!video->ep->enabled)
+			return;
+
 		/*
-		 * Retrieve the first available USB request, protected by the
-		 * request lock.
+		 * Check is_enabled and retrieve the first available USB
+		 * request, protected by the request lock.
 		 */
 		spin_lock_irqsave(&video->req_lock, flags);
-		if (list_empty(&video->req_free)) {
+		if (!video->is_enabled || list_empty(&video->req_free)) {
 			spin_unlock_irqrestore(&video->req_lock, flags);
 			return;
 		}
@@ -487,9 +518,11 @@ static void uvcg_video_pump(struct work_struct *work)
 		return;

 	spin_lock_irqsave(&video->req_lock, flags);
-	list_add_tail(&req->list, &video->req_free);
+	if (video->is_enabled)
+		list_add_tail(&req->list, &video->req_free);
+	else
+		uvc_video_free_request(req->context, video->ep);
 	spin_unlock_irqrestore(&video->req_lock, flags);
-	return;
 }

 /*
@@ -498,7 +531,11 @@ static void uvcg_video_pump(struct work_struct *work)
 int
 uvcg_video_disable(struct uvc_video *video)
 {
-	struct uvc_request *ureq;
+	unsigned long flags;
+	struct list_head inflight_bufs;
+	struct usb_request *req, *temp;
+	struct uvc_buffer *buf, *btemp;
+	struct uvc_request *ureq, *utemp;

 	if (video->ep == NULL) {
 		uvcg_info(&video->uvc->func,
@@ -506,15 +543,58 @@ uvcg_video_disable(struct uvc_video *video)
 		return -ENODEV;
 	}

+	INIT_LIST_HEAD(&inflight_bufs);
+	spin_lock_irqsave(&video->req_lock, flags);
+	video->is_enabled = false;
+
+	/*
+	 * Remove any in-flight buffers from the uvc_requests
+	 * because we want to return them before cancelling the
+	 * queue. This ensures that we aren't stuck waiting for
+	 * all complete callbacks to come through before disabling
+	 * vb2 queue.
+	 */
+	list_for_each_entry(ureq, &video->ureqs, list) {
+		if (ureq->last_buf) {
+			list_add_tail(&ureq->last_buf->queue, &inflight_bufs);
+			ureq->last_buf = NULL;
+		}
+	}
+	spin_unlock_irqrestore(&video->req_lock, flags);
+
 	cancel_work_sync(&video->pump);
 	uvcg_queue_cancel(&video->queue, 0);

-	list_for_each_entry(ureq, &video->ureqs, list) {
-		if (ureq->req)
-			usb_ep_dequeue(video->ep, ureq->req);
+	spin_lock_irqsave(&video->req_lock, flags);
+	/*
+	 * Remove all uvc_reqeusts from ureqs with list_del_init
+	 * This lets uvc_video_free_request correctly identify
+	 * if the uvc_request is attached to a list or not when freeing
+	 * memory.
+	 */
+	list_for_each_entry_safe(ureq, utemp, &video->ureqs, list)
+		list_del_init(&ureq->list);
+
+	list_for_each_entry_safe(req, temp, &video->req_free, list) {
+		list_del(&req->list);
+		uvc_video_free_request(req->context, video->ep);
 	}

-	uvc_video_free_requests(video);
+	INIT_LIST_HEAD(&video->ureqs);
+	INIT_LIST_HEAD(&video->req_free);
+	video->req_size = 0;
+	spin_unlock_irqrestore(&video->req_lock, flags);
+
+	/*
+	 * Return all the video buffers before disabling the queue.
+	 */
+	spin_lock_irqsave(&video->queue.irqlock, flags);
+	list_for_each_entry_safe(buf, btemp, &inflight_bufs, queue) {
+		list_del(&buf->queue);
+		uvcg_complete_buffer(&video->queue, buf);
+	}
+	spin_unlock_irqrestore(&video->queue.irqlock, flags);
+
 	uvcg_queue_enable(&video->queue, 0);
 	return 0;
 }
@@ -532,6 +612,14 @@ int uvcg_video_enable(struct uvc_video *video)
 		return -ENODEV;
 	}

+	/*
+	 * Safe to access request related fields without req_lock because
+	 * this is the only thread currently active, and no other
+	 * request handling thread will become active until this function
+	 * returns.
+	 */
+	video->is_enabled = true;
+
 	if ((ret = uvcg_queue_enable(&video->queue, 1)) < 0)
 		return ret;

@@ -557,6 +645,7 @@ int uvcg_video_enable(struct uvc_video *video)
  */
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 {
+	video->is_enabled = false;
 	INIT_LIST_HEAD(&video->ureqs);
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
--
2.42.0.820.g83a721a137-goog

