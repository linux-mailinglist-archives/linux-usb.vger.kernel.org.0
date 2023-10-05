Return-Path: <linux-usb+bounces-1154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DFD7BA8B2
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 20:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 2454328251C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 18:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6283E49C;
	Thu,  5 Oct 2023 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="duPIVGxZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9785C374FB
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 18:08:30 +0000 (UTC)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305CF11D
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 11:08:24 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5856082f7e5so1054648a12.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Oct 2023 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696529303; x=1697134103; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fulx3avKDjTg8wkMNU25aLrvIs7TbekfU944xGo/6Xc=;
        b=duPIVGxZJIfn1ybzQqTdHGHA6EMmzUxRvXFfhfPL9B2GOR4JpygthjcOVxt6oSk2fh
         IF0sEYSz3CqwD+MJV5MM3uiee5H7GSPDaUqum1o/hPyDY1qAGQPYR9CPh5r8eQQXE1eM
         HsbPP6gm0G0ikGpoSrY+1TlBSKoMgTO+0jmrXExlzb+pF1KbkW7Ba0olAT8Ol9MB4hdU
         Ei+blOUF8XuLdcDdIxdMc1DIB4vOCY9I1362iCfd3QKe/QFA7JQYzp/F5fiTQJl5V8P6
         hRNSFCduc/Rt4vql5ip10hxJ1lFVefzY63x+G5wttQHw/MSG2rde2XgTi6eKZ+sYGISu
         L4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696529303; x=1697134103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fulx3avKDjTg8wkMNU25aLrvIs7TbekfU944xGo/6Xc=;
        b=iPcpOpnpC+8ybfa1zrIc/zgdf83Ts25BQ1DKKPmBwx0ScoYOo0Zj4oRZoCjFZ94xkx
         qBI08YGfyYm80x9EMM5yyIalqKbLjgFyHm7PA9zukUu0UJ0yIqwYfqEPCMDi9gMdTyRY
         MwLV6PKvuw5ChL6+S9XGNwYar45c0KFr/N4SkJXUvjZo+OKsK8H2bI28WdlmaVmKHOKB
         bZFGs4fuWXL9DAmOhvT2C5yFLURhM3R6pOnaBg0pPaGXLIW/Ppz6u4BlMOMgkAm95/Dr
         vuUnvw5IFrWPMnrLWoSd/P1rRNBn1g8pz7qVfnKj3OwEsH2P5Em/n5R0ARNAYoAFulLo
         y4/Q==
X-Gm-Message-State: AOJu0Yz7tLwVuadIdcMeISNeUQhVumC4NZAyIsrZ80CuCzYT+B7gfSrU
	qoSyLccl/z84s0xlMbibO8v8k4FUU06R
X-Google-Smtp-Source: AGHT+IFs2lBLO0LJRgzGGKcfJnaa4Er1SNQZoYzhm61CwsAqrJqB+VY5zt7nJKa2SHFfB1gQSVPkA0HApzDM
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a17:902:d4c4:b0:1b7:c944:edd4 with SMTP id
 o4-20020a170902d4c400b001b7c944edd4mr91628plg.2.1696529303598; Thu, 05 Oct
 2023 11:08:23 -0700 (PDT)
Date: Thu,  5 Oct 2023 11:08:14 -0700
In-Reply-To: <20231005180814.3278050-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230930184821.310143-1-arakesh@google.com> <20231005180814.3278050-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231005180814.3278050-3-arakesh@google.com>
Subject: [PATCH v3 3/3] usb: gadget: uvc: Fix use-after-free for inflight usb_requests
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, dan.scally@ideasonboard.com, 
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, 
	m.grzeschik@pengutronix.de
Cc: etalvala@google.com, jchowdhary@google.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michael Grzeschik <mgr@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Currently, the uvc gadget driver allocates all uvc_requests as one array
and deallocates them all when the video stream stops. This includes
de-allocating all the usb_requests associated with those uvc_requests.
This can lead to use-after-free issues if any of those de-allocated
usb_requests were still owned by the usb controller.

This is patch 2 of 2 in fixing the use-after-free issue. It adds a new
flag to uvc_request to mark it as 'abandoned'. When disabling the video
stream, instead of de-allocating all uvc_requests and usb_requests, the
gadget driver only de-allocates those usb_requests that are currently
owned by the gadget driver (as present in req_free). Other usb_requests
have their corresponding 'is_abandoned' flag tripped, and the
usb_requests complete handler takes care of freeing the usb_request and
its corresponding uvc_request.

This should ensure that uvc gadget driver never accidentally de-allocates
a usb_request that it doesn't own.

Link: https://lore.kernel.org/7cd81649-2795-45b6-8c10-b7df1055020d@google.com
Suggested-by: Michael Grzeschik <mgr@pengutronix.de>
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
v1 -> v2: Rebased to ToT, and fixed deadlock reported in
          https://lore.kernel.org/all/ZRv2UnKztgyqk2pt@pengutronix.de/
v2 -> v3: Fix email threading goof-up

 drivers/usb/gadget/function/uvc.h       |   1 +
 drivers/usb/gadget/function/uvc_video.c | 118 ++++++++++++++++++++----
 2 files changed, 102 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 993694da0bbc..e69cfb7cced1 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -82,6 +82,7 @@ struct uvc_request {
 	u8 header[UVCG_REQUEST_HEADER_LEN];
 	struct uvc_buffer *last_buf;
 	struct list_head list;
+	bool is_abandoned;
 };

 struct uvc_video {
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 3c4d286d81c0..69521886d599 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -271,7 +271,21 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uvc_video *video = ureq->video;
 	struct uvc_video_queue *queue = &video->queue;
 	struct uvc_device *uvc = video->uvc;
+	struct uvc_buffer *last_buf;
 	unsigned long flags;
+	bool is_abandoned;
+
+	spin_lock_irqsave(&video->req_lock, flags);
+	is_abandoned = ureq->is_abandoned;
+	last_buf = ureq->last_buf;
+	ureq->last_buf = NULL;
+	spin_unlock_irqrestore(&video->req_lock, flags);
+
+	if (is_abandoned) {
+		uvcg_dbg(&video->uvc->func, "Freeing abandoned usb_request\n");
+		uvc_video_free_request(ureq, ep);
+		return;
+	}

 	if (uvc->state == UVC_STATE_CONNECTED) {
 		usb_ep_free_request(video->ep, ureq->req);
@@ -300,15 +314,29 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 		uvcg_queue_cancel(queue, 0);
 	}

-	if (ureq->last_buf) {
-		uvcg_complete_buffer(&video->queue, ureq->last_buf);
-		ureq->last_buf = NULL;
+	if (last_buf) {
+		spin_lock_irqsave(&video->queue.irqlock, flags);
+		uvcg_complete_buffer(&video->queue, last_buf);
+		spin_unlock_irqrestore(&video->queue.irqlock, flags);
 	}

+	/*
+	 * request might have been abandoned while being processed.
+	 * do a last minute check before queueing the request back.
+	 */
 	spin_lock_irqsave(&video->req_lock, flags);
-	list_add_tail(&req->list, &video->req_free);
+	is_abandoned = ureq->is_abandoned;
+	if (!is_abandoned)
+		list_add_tail(&req->list, &video->req_free);
 	spin_unlock_irqrestore(&video->req_lock, flags);

+	if (is_abandoned) {
+		uvcg_dbg(&video->uvc->func,
+			 "usb_request abandoned mid-processing - freeing.\n");
+		uvc_video_free_request(ureq, ep);
+		return;
+	}
+
 	if (uvc->state == UVC_STATE_STREAMING)
 		queue_work(video->async_wq, &video->pump);
 }
@@ -372,7 +400,6 @@ uvc_video_alloc_requests(struct uvc_video *video)
 	}

 	video->req_size = req_size;
-
 	return 0;

 error:
@@ -504,13 +531,80 @@ static void uvcg_video_pump(struct work_struct *work)
 	return;
 }

+/*
+ * Disable video stream. This ensures that any inflight usb requests are marked
+ * for clean up and all video buffers are dropped before returning.
+ */
+static void uvcg_video_disable(struct uvc_video *video)
+{
+	struct uvc_buffer *buf, *tmp_buf;
+	struct uvc_request *ureq, *temp;
+	struct list_head buf_list; /* track in-flight video buffers */
+	struct usb_request *req;
+	unsigned long flags;
+
+	INIT_LIST_HEAD(&buf_list);
+
+	cancel_work_sync(&video->pump);
+	uvcg_queue_cancel(&video->queue, 0);
+
+	list_for_each_entry(ureq, &video->ureqs, list) {
+		if (ureq->req)
+			usb_ep_dequeue(video->ep, ureq->req);
+	}
+
+	/**
+	 * acquiring req_lock here should prevent any more complete
+	 * callbacks from processing until we've abandoned the
+	 * requests that are still in-flight and let the complete
+	 * callback handle cleanup
+	 */
+	spin_lock_irqsave(&video->req_lock, flags);
+	/* abandon all usb requests */
+	list_for_each_entry_safe(ureq, temp, &video->ureqs, list) {
+		ureq->is_abandoned = true;
+		if (ureq->last_buf) {
+			list_add(&ureq->last_buf->queue, &buf_list);
+			ureq->last_buf = NULL;
+		}
+		list_del_init(&ureq->list);
+	}
+	/*
+	 * re-add uvc_requests currently owned by the gadget to
+	 * video->ureqs to be deallocated. This effectively leaves
+	 * video->ureqs with the requests that we currently own.
+	 */
+	list_for_each_entry(req, &video->req_free, list) {
+		ureq = req->context;
+		list_add_tail(&ureq->list, &video->ureqs);
+	}
+	spin_unlock_irqrestore(&video->req_lock, flags);
+
+	/*
+	 * drop abandoned uvc_buffers, as the completion handler
+	 * no longer will
+	 */
+	if (!list_empty(&buf_list)) {
+		spin_lock_irqsave(&video->queue.irqlock, flags);
+		list_for_each_entry_safe(buf, tmp_buf,
+						&buf_list, queue) {
+			video->queue.flags |= UVC_QUEUE_DROP_INCOMPLETE;
+			uvcg_complete_buffer(&video->queue, buf);
+			list_del(&buf->queue);
+		}
+		spin_unlock_irqrestore(&video->queue.irqlock, flags);
+	}
+
+	uvc_video_free_requests(video);
+	uvcg_queue_enable(&video->queue, 0);
+}
+
 /*
  * Enable or disable the video stream.
  */
 int uvcg_video_enable(struct uvc_video *video, int enable)
 {
 	struct uvc_device *uvc = video->uvc;
-	struct uvc_request *ureq;
 	int ret;

 	if (video->ep == NULL) {
@@ -521,17 +615,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)

 	if (!enable) {
 		uvc->state = UVC_STATE_CONNECTED;
-
-		cancel_work_sync(&video->pump);
-		uvcg_queue_cancel(&video->queue, 0);
-
-		list_for_each_entry(ureq, &video->ureqs, list) {
-			if (ureq->req)
-				usb_ep_dequeue(video->ep, ureq->req);
-		}
-
-		uvc_video_free_requests(video);
-		uvcg_queue_enable(&video->queue, 0);
+		uvcg_video_disable(video);
 		return 0;
 	}

--
2.42.0.609.gbb76f46606-goog

