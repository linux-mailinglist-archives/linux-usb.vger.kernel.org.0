Return-Path: <linux-usb+bounces-2198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A387D784A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 00:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69A1E281B37
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 22:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979CF347A4;
	Wed, 25 Oct 2023 22:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Em6o3q9i"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBD5749F
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 22:59:14 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FDEBB
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 15:59:13 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1caa7597af9so1760895ad.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 15:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698274753; x=1698879553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq+ua6YPuCX7eBMYAS2BZuh0hp1CEO5d8KDXmLQUriA=;
        b=Em6o3q9i5oIpG709nPDsq0IxI+TVfIPMYuwsgnG/f0QzXLNitq237OG1VgHBD33kzS
         9JnlfgfXkkbOukmCW3GJO2sw1jpzmh3b2eOaU7rmKDkS7upXUMvLCWLRGATLIi7JpqVH
         p26/1gAhs0FuBhfqqyXBBzBtBwD3W8LB+Pscv6vu9/HZEZnd2LuXKqxqedTKVYUbf9Mf
         ixmKnPJkVGqxhiROtzCev5gxRtEKiPVdRuTYqEBeoiENHe5Mc/nw9o9CXIQiUw+2wGhm
         MNUh8K0z+MojN5qhf+hd/Qq36z6WnmT4cGlpn8di8A9dIHpKu0VOo7/jhBAGBGhcaepH
         zzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698274753; x=1698879553;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lq+ua6YPuCX7eBMYAS2BZuh0hp1CEO5d8KDXmLQUriA=;
        b=bXP5jl4SC7R0R58LdCwN4XzsNmCb+bYRpTVjQzL6eUxM+SfPPxIf2dpqGNauRXbJ52
         kBplL400hDakYjRXlipjGlFL0AoeTkiqmaNmOB6YXIaqD/Mnl5+AaR4S0/biVGcW9T3H
         2t7pX1LM/EyfoUQVkFiQ/blIYVW1snpuPKsuys2uPagp+1rD/M2aqTjzN2ss65lVl8EH
         5xIXDMbJnvczqfc6nH54eq0qkZv1UP0dGb5ec9OmehTzi50N1uTfkY+eJn9uShMjUYtP
         WF5TzNfY/2lmbfW73Oe/95/ACv2BXg8txQgt+tDVOXbN2CLQnVB4pbJnED9tCzgHG/iU
         7TAQ==
X-Gm-Message-State: AOJu0YxP47gpHgCrRiPaLW5moMvzNQTBD7Jx1oKqv0/9GcJ2MLcflT4X
	+yjo1n0uRiVj05mPHIFgr/bZWQ==
X-Google-Smtp-Source: AGHT+IF8XwyUghyGVjEbJyOelcSt65HWyoefzX1fajZutZu8AmuOgjgZPasoBKo40tiOsf/UmTitmw==
X-Received: by 2002:a17:902:f342:b0:1ca:7294:a55a with SMTP id q2-20020a170902f34200b001ca7294a55amr10640395ple.64.1698274752556;
        Wed, 25 Oct 2023 15:59:12 -0700 (PDT)
Received: from ?IPV6:2620:0:1000:2514:51de:2ba6:1522:9df7? ([2620:0:1000:2514:51de:2ba6:1522:9df7])
        by smtp.gmail.com with ESMTPSA id o2-20020a170902d4c200b001c735421215sm9652830plg.216.2023.10.25.15.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 15:59:12 -0700 (PDT)
Message-ID: <99384044-0d14-4ebe-9109-8a5557e64449@google.com>
Date: Wed, 25 Oct 2023 15:59:10 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jayant Chowdhary <jchowdhary@google.com>
Subject: [PATCH] usb:gadget:uvc Do not use worker thread to pump usb requests
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
 Michael Grzeschik <mgr@pengutronix.de>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This patch is based on top of
https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:

When we use an async work queue to perform the function of pumping
usb requests to the usb controller, it is possible that thread scheduling
affects at what cadence we're able to pump requests. This could mean usb
requests miss their uframes - resulting in video stream flickers on the host
device.

In this patch, we move the pumping of usb requests to
1) uvcg_video_complete() complete handler for both isoc + bulk
   endpoints. We still send 0 length requests when there is no uvc buffer
   available to encode.
2) uvc_v4l2_qbuf - only for bulk endpoints since it is not legal to send
   0 length requests.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Suggested-by: Jayant Chowdhary <jchowdhary@google.com>
Suggested-by: Avichal Rakesh <arakesh@google.com>
Tested-by: Jayant Chowdhary <jchowdhary@google.com>
---
 drivers/usb/gadget/function/f_uvc.c     |  4 --
 drivers/usb/gadget/function/uvc.h       |  4 +-
 drivers/usb/gadget/function/uvc_v4l2.c  |  5 +-
 drivers/usb/gadget/function/uvc_video.c | 72 ++++++++++++++++---------
 drivers/usb/gadget/function/uvc_video.h |  2 +
 5 files changed, 52 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index ae08341961eb..53cb2539486d 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -959,14 +959,10 @@ static void uvc_function_unbind(struct usb_configuration *c,
 {
 	struct usb_composite_dev *cdev = c->cdev;
 	struct uvc_device *uvc = to_uvc(f);
-	struct uvc_video *video = &uvc->video;
 	long wait_ret = 1;
 
 	uvcg_info(f, "%s()\n", __func__);
 
-	if (video->async_wq)
-		destroy_workqueue(video->async_wq);
-
 	/*
 	 * If we know we're connected via v4l2, then there should be a cleanup
 	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index be0d012aa244..498f344fda4b 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -88,9 +88,6 @@ struct uvc_video {
 	struct uvc_device *uvc;
 	struct usb_ep *ep;
 
-	struct work_struct pump;
-	struct workqueue_struct *async_wq;
-
 	/* Frame parameters */
 	u8 bpp;
 	u32 fcc;
@@ -116,6 +113,7 @@ struct uvc_video {
 	/* Context data used by the completion handler */
 	__u32 payload_size;
 	__u32 max_payload_size;
+	bool is_bulk;
 
 	struct uvc_video_queue queue;
 	unsigned int fid;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index f4d2e24835d4..678ea6df7b5c 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -414,10 +414,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 	ret = uvcg_queue_buffer(&video->queue, b);
 	if (ret < 0)
 		return ret;
-
-	if (uvc->state == UVC_STATE_STREAMING)
-		queue_work(video->async_wq, &video->pump);
-
+	uvcg_video_pump_qbuf(video);
 	return ret;
 }
 
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index ab3f02054e85..143453e9f003 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -24,6 +24,8 @@
  * Video codecs
  */
 
+static void uvcg_video_pump(struct uvc_video *video);
+
 static int
 uvc_video_encode_header(struct uvc_video *video, struct uvc_buffer *buf,
 		u8 *data, int len)
@@ -329,7 +331,9 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	 */
 	if (video->is_enabled) {
 		list_add_tail(&req->list, &video->req_free);
-		queue_work(video->async_wq, &video->pump);
+		spin_unlock_irqrestore(&video->req_lock, flags);
+		uvcg_video_pump(video);
+		return;
 	} else {
 		uvc_video_free_request(ureq, ep);
 	}
@@ -409,20 +413,32 @@ uvc_video_alloc_requests(struct uvc_video *video)
  * Video streaming
  */
 
+void uvcg_video_pump_qbuf(struct uvc_video *video)
+{
+	if (video->is_bulk) {
+		/*
+		 * Only call uvcg_video_pump() from qbuf, for bulk eps since
+		 * for isoc, the complete handler will call uvcg_video_pump()
+		 * consistently. Calling it for isoc eps, while correct
+		 * will increase contention for video->req_lock since the
+		 * complete handler will be called more often.
+		 */
+		uvcg_video_pump(video);
+	}
+}
+
 /*
  * uvcg_video_pump - Pump video data into the USB requests
  *
  * This function fills the available USB requests (listed in req_free) with
  * video data from the queued buffers.
  */
-static void uvcg_video_pump(struct work_struct *work)
+static void uvcg_video_pump(struct uvc_video *video)
 {
-	struct uvc_video *video = container_of(work, struct uvc_video, pump);
 	struct uvc_video_queue *queue = &video->queue;
-	/* video->max_payload_size is only set when using bulk transfer */
-	bool is_bulk = video->max_payload_size;
 	struct usb_request *req = NULL;
-	struct uvc_buffer *buf;
+	struct uvc_request *ureq = NULL;
+	struct uvc_buffer *buf = NULL, *last_buf = NULL;
 	unsigned long flags;
 	bool buf_done;
 	int ret;
@@ -455,7 +471,8 @@ static void uvcg_video_pump(struct work_struct *work)
 		if (buf != NULL) {
 			video->encode(req, video, buf);
 			buf_done = buf->state == UVC_BUF_STATE_DONE;
-		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) && !is_bulk) {
+		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) &&
+				!video->is_bulk) {
 			/*
 			 * No video buffer available; the queue is still connected and
 			 * we're transferring over ISOC. Queue a 0 length request to
@@ -500,18 +517,30 @@ static void uvcg_video_pump(struct work_struct *work)
 			req->no_interrupt = 1;
 		}
 
-		/* Queue the USB request */
-		ret = uvcg_video_ep_queue(video, req);
 		spin_unlock_irqrestore(&queue->irqlock, flags);
-
+		spin_lock_irqsave(&video->req_lock, flags);
+		if (video->is_enabled) {
+			/* Queue the USB request */
+			ret = uvcg_video_ep_queue(video, req);
+			/* Endpoint now owns the request */
+			req = NULL;
+			video->req_int_count++;
+		} else {
+			ret =  -ENODEV;
+			ureq = req->context;
+			last_buf = ureq->last_buf;
+			ureq->last_buf = NULL;
+		}
+		spin_unlock_irqrestore(&video->req_lock, flags);
 		if (ret < 0) {
+			if (last_buf != NULL) {
+				// Return the buffer to the queue in the case the
+				// request was not queued to the ep.
+				uvcg_complete_buffer(&video->queue, last_buf);
+			}
 			uvcg_queue_cancel(queue, 0);
 			break;
 		}
-
-		/* Endpoint now owns the request */
-		req = NULL;
-		video->req_int_count++;
 	}
 
 	if (!req)
@@ -556,7 +585,6 @@ uvcg_video_disable(struct uvc_video *video)
 	}
 	spin_unlock_irqrestore(&video->req_lock, flags);
 
-	cancel_work_sync(&video->pump);
 	uvcg_queue_cancel(&video->queue, 0);
 
 	spin_lock_irqsave(&video->req_lock, flags);
@@ -626,14 +654,16 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 	if (video->max_payload_size) {
 		video->encode = uvc_video_encode_bulk;
 		video->payload_size = 0;
-	} else
+		video->is_bulk = true;
+	} else {
 		video->encode = video->queue.use_sg ?
 			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
+		video->is_bulk = false;
+	}
 
 	video->req_int_count = 0;
 
-	queue_work(video->async_wq, &video->pump);
-
+	uvcg_video_pump(video);
 	return ret;
 }
 
@@ -646,12 +676,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	INIT_LIST_HEAD(&video->ureqs);
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
-	INIT_WORK(&video->pump, uvcg_video_pump);
-
-	/* Allocate a work queue for asynchronous video pump handler. */
-	video->async_wq = alloc_workqueue("uvcgadget", WQ_UNBOUND | WQ_HIGHPRI, 0);
-	if (!video->async_wq)
-		return -EINVAL;
 
 	video->uvc = uvc;
 	video->fcc = V4L2_PIX_FMT_YUYV;
diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
index 03adeefa343b..29c6b9a2e9c3 100644
--- a/drivers/usb/gadget/function/uvc_video.h
+++ b/drivers/usb/gadget/function/uvc_video.h
@@ -18,4 +18,6 @@ int uvcg_video_enable(struct uvc_video *video, int enable);
 
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc);
 
+void uvcg_video_pump_qbuf(struct uvc_video *video);
+
 #endif /* __UVC_VIDEO_H__ */
-- 


