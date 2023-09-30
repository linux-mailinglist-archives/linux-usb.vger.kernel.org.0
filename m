Return-Path: <linux-usb+bounces-845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A227B431A
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 20:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id CA3021C20978
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 18:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF1D171D5;
	Sat, 30 Sep 2023 18:48:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F5F14F76
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 18:48:41 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E9ED3
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 11:48:39 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59f8040b2ffso196892097b3.3
        for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 11:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696099718; x=1696704518; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8sS0/uaQLhAvse+d/NY7S3JtHJHgQXnCXFHZHAD5jYQ=;
        b=tRLc6bqBTUC+HjWpMuM+lJSzMX7JOeSi+5VjDfx965ORJh4k2dXGYvpooRLZTa5g2f
         o/6cYNB6pXGXw+DCQoQXyCxfrGz8oQW6bkTbAxP1rlO7l1cQp4i8L+NZ/Yl8u4FhG+WB
         Bkb4S9gRWR04NGOJMishgCr4Jbzi3OF+ePmmajq+efN53iurJvUIUVT1v6D11kKRP8nY
         RZl/4CP6Qlxfk5ZmiiPAs4s1hi6nG4lOhJq3YuctxnKiMqhL50tNTmRpTp5SJFO/2bhL
         RsDbJXpNVrmCElhY2PHGbGaP9tjPTVxBzJze0umhW8G+/omiQnNzZriw4XqCNxP1ybJW
         2vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696099718; x=1696704518;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8sS0/uaQLhAvse+d/NY7S3JtHJHgQXnCXFHZHAD5jYQ=;
        b=kazTD+iqvByAVMePGoSWG60oQOGdh08j439LXCiTStiSOce+/tnRk3LaKheS1tMcHO
         iQn3K7S56vZxJhU2VLAGSf6ucpmZLht4/aDz2TYcXwiHJ6lZUC2I72s+SfSOnsFJHjFF
         19o8mGAzGNBjvH7h57/a3twRpsiy1j+xKypIFzIfAwBnpUxUpZXmtQWJLGhDJn+cuxwR
         HmHTufxKyH+DkTDU6VoFxHinXY3ayQG47NRgPj4y3TcYL8NNBfWkbK4h2NTIa2UDAFyC
         LOY0dRI3eYQpT3/zlz2ingNP2uM3fZQpveMpv75JNvkFOflP9ObHwyEhmqoaR5zXwI6r
         HUlA==
X-Gm-Message-State: AOJu0YymjrvZ62jF96sZ/i9sivXJIIswQ0lj7Cv5ql6i+BaOjiWALkMX
	my5t6FGkZYH7jPl2rmGVpyfgdQVW86Ek
X-Google-Smtp-Source: AGHT+IHWdhL5RAVxsyWTiI4/e6dqT9qBN4mYpBbtKdY2IFEu9Ctuxp7yzyHR+CXeMVVBwlqF+9X+xO7MZ7h0
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a05:690c:3412:b0:579:f832:74b with SMTP id
 fn18-20020a05690c341200b00579f832074bmr130768ywb.10.1696099718241; Sat, 30
 Sep 2023 11:48:38 -0700 (PDT)
Date: Sat, 30 Sep 2023 11:48:21 -0700
In-Reply-To: <20230930184821.310143-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230930184821.310143-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230930184821.310143-4-arakesh@google.com>
Subject: [PATCH v1 3/3] usb: gadget: uvc: Fix use-after-free for inflight usb_requests
From: Avichal Rakesh <arakesh@google.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: jchowdhary@google.com, etalvala@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Avichal Rakesh <arakesh@google.com>, 
	Michael Grzeschik <mgr@pengutronix.de>
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
 drivers/usb/gadget/function/uvc.h       |   1 +
 drivers/usb/gadget/function/uvc_video.c | 106 ++++++++++++++++++++----
 2 files changed, 91 insertions(+), 16 deletions(-)

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
index ffecd7a140dc..aad7dcba46ee 100644
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
 
 	switch (req->status) {
 	case 0:
@@ -294,15 +308,29 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
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
@@ -366,7 +394,6 @@ uvc_video_alloc_requests(struct uvc_video *video)
 	}
 
 	video->req_size = req_size;
-
 	return 0;
 
 error:
@@ -490,13 +517,69 @@ static void uvcg_video_pump(struct work_struct *work)
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
+	cancel_work_sync(&video->pump);
+	uvcg_queue_cancel(&video->queue, 0);
+
+	INIT_LIST_HEAD(&buf_list);
+	spin_lock_irqsave(&video->req_lock, flags);
+	/* abandon all usb requests */
+	list_for_each_entry_safe(ureq, temp, &video->ureqs, list) {
+		ureq->is_abandoned = true;
+		if (ureq->last_buf) {
+			list_add(&ureq->last_buf->queue, &buf_list);
+			ureq->last_buf = NULL;
+		}
+		list_del_init(&ureq->list);
+		if (ureq->req)
+			usb_ep_dequeue(video->ep, ureq->req);
+	}
+	/*
+	 * re-add uvc_requests currently owned by the gadget to
+	 * video->ureqs to be deallocated
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
 	int ret;
-	struct uvc_request *ureq;
 
 	if (video->ep == NULL) {
 		uvcg_info(&video->uvc->func,
@@ -505,16 +588,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 	}
 
 	if (!enable) {
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
2.42.0.582.g8ccd20d70d-goog


