Return-Path: <linux-usb+bounces-2368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF5A7DC11F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 21:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A533B281295
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 20:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB461B28D;
	Mon, 30 Oct 2023 20:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zQcl83m0"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50219451
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 20:22:46 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB9EFC
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 13:22:42 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9c5708ddbeso4703419276.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698697362; x=1699302162; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ObSidP8JTCZls9mTLBjvE7k31kuLSrW0wzxXXc7FEEI=;
        b=zQcl83m0FC2L6KsVk+LJoeCOOH38nj3xIEh0Vvb8feJl2mG8AyGai9LqX2RyTweo4K
         m9sgzHuRR3BQ6ZhiKO/VFP4AYbxcEtUxVJBMyKsDOxhPtuIdxOBV9n+kOW7cqF1r+nLg
         h98s4N4dLmmbpczrd4e89+uMbx69OKXpOsHs0pl+K+S9VS63tuFYKZ829kH+vPTzrvvw
         54DkvsjpW7pQg2gqnUoD9WB5faYhJkNS0tARdK9hEruhzIHLWzBmnsFuLdFcJH2rDYyI
         Ns4VTnQ/iGALyLNmbTMwVkD+mJQxZD4kuIKpmfSx3qszrYWHpJjw50GVrOZhEzCySsW5
         DETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698697362; x=1699302162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObSidP8JTCZls9mTLBjvE7k31kuLSrW0wzxXXc7FEEI=;
        b=sDiOKuYjFsvyieZyEJ5BhMeRhknRu8gPcnAl1y8wRWPUEbev9OfCBR/s3RxH61ws31
         +WouwB9smaAFTQXyLBlu0f0AOUaE9awndZ+ufOzzOx3IwlW/lseGpEEhJzXV8U9YeNdu
         NZ1oXf61wqcTT7SYrUTJQc3fTSvNv4u5MXjWxkE3rR2PVNuH98HB2wx4rOk9xuo7+eCo
         VA6lt2GMXPBihddbFAmCCnZ55hB+XSYxcquG4xcY07LXVsLJ2N25g2glHCqlTXyFkk3D
         dy34znYftSLZ/UBExDZ08klMzMeF76xJwOrrE60YucIVChyhKu0P5Vy7WyW144nJk0ov
         Vo2g==
X-Gm-Message-State: AOJu0YylRtJr8ae1+reOGpJzCwUPZTa8sRfj1A5vzQHQtkti/cnogBTz
	BDfnJapW+tt8tihv+2XgXWV+Yuy4qBew
X-Google-Smtp-Source: AGHT+IGXaBGhYiUyEBAbiUTE/wKmbOQwP9DauDj3LKX2kH18wQf6KMCbKcLl28XaVwWzoVCF4g181quPk6So
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a25:cf09:0:b0:d90:e642:d9fc with SMTP id
 f9-20020a25cf09000000b00d90e642d9fcmr208026ybg.6.1698697361861; Mon, 30 Oct
 2023 13:22:41 -0700 (PDT)
Date: Mon, 30 Oct 2023 13:22:30 -0700
In-Reply-To: <20231030202231.3263253-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <73309396-3856-43a2-9a6f-81a40ed594db@google.com> <20231030202231.3263253-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231030202231.3263253-3-arakesh@google.com>
Subject: [PATCH v10 3/4] usb: gadget: uvc: move video disable logic to its own function
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, dan.scally@ideasonboard.com
Cc: etalvala@google.com, gregkh@linuxfoundation.org, jchowdhary@google.com, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, m.grzeschik@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

This patch refactors the video disable logic in uvcg_video_enable
into its own separate function 'uvcg_video_disable'. This function
is now used anywhere uvcg_video_enable(video, 0) was used.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Suggested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
v6       : Introduced this patch to make the next one easier to review
v6 -> v7 : Add Suggested-by
v7 -> v8 : No change. Getting back in review queue
v8 -> v9 : Call uvcg_video_disable directly instead of uvcg_video_enable(video, 0)
v9 -> v10: Rebase to ToT (usb-next)

 drivers/usb/gadget/function/uvc_v4l2.c  |  6 ++--
 drivers/usb/gadget/function/uvc_video.c | 40 ++++++++++++++++---------
 drivers/usb/gadget/function/uvc_video.h |  3 +-
 3 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 7cb8d027ff0c..904dd283cbf7 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -443,7 +443,7 @@ uvc_v4l2_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 		return -EINVAL;

 	/* Enable UVC video. */
-	ret = uvcg_video_enable(video, 1);
+	ret = uvcg_video_enable(video);
 	if (ret < 0)
 		return ret;

@@ -469,7 +469,7 @@ uvc_v4l2_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 		return -EINVAL;

 	uvc->state = UVC_STATE_CONNECTED;
-	ret = uvcg_video_enable(video, 0);
+	ret = uvcg_video_disable(video);
 	if (ret < 0)
 		return ret;

@@ -515,7 +515,7 @@ static void uvc_v4l2_disable(struct uvc_device *uvc)
 	if (uvc->state == UVC_STATE_STREAMING)
 		uvc->state = UVC_STATE_CONNECTED;

-	uvcg_video_enable(&uvc->video, 0);
+	uvcg_video_disable(&uvc->video);
 	uvcg_free_buffers(&uvc->video.queue);
 	uvc->func_connected = false;
 	wake_up_interruptible(&uvc->func_connected_queue);
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 1619f9664748..c3e8c48f46a9 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -493,31 +493,43 @@ static void uvcg_video_pump(struct work_struct *work)
 }

 /*
- * Enable or disable the video stream.
+ * Disable the video stream
  */
-int uvcg_video_enable(struct uvc_video *video, int enable)
+int
+uvcg_video_disable(struct uvc_video *video)
 {
-	int ret;
 	struct uvc_request *ureq;

 	if (video->ep == NULL) {
 		uvcg_info(&video->uvc->func,
-			  "Video enable failed, device is uninitialized.\n");
+			  "Video disable failed, device is uninitialized.\n");
 		return -ENODEV;
 	}

-	if (!enable) {
-		cancel_work_sync(&video->pump);
-		uvcg_queue_cancel(&video->queue, 0);
+	cancel_work_sync(&video->pump);
+	uvcg_queue_cancel(&video->queue, 0);

-		list_for_each_entry(ureq, &video->ureqs, list) {
-			if (ureq->req)
-				usb_ep_dequeue(video->ep, ureq->req);
-		}
+	list_for_each_entry(ureq, &video->ureqs, list) {
+		if (ureq->req)
+			usb_ep_dequeue(video->ep, ureq->req);
+	}

-		uvc_video_free_requests(video);
-		uvcg_queue_enable(&video->queue, 0);
-		return 0;
+	uvc_video_free_requests(video);
+	uvcg_queue_enable(&video->queue, 0);
+	return 0;
+}
+
+/*
+ * Enable the video stream.
+ */
+int uvcg_video_enable(struct uvc_video *video)
+{
+	int ret;
+
+	if (video->ep == NULL) {
+		uvcg_info(&video->uvc->func,
+			  "Video enable failed, device is uninitialized.\n");
+		return -ENODEV;
 	}

 	if ((ret = uvcg_queue_enable(&video->queue, 1)) < 0)
diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
index 03adeefa343b..8ef6259741f1 100644
--- a/drivers/usb/gadget/function/uvc_video.h
+++ b/drivers/usb/gadget/function/uvc_video.h
@@ -14,7 +14,8 @@

 struct uvc_video;

-int uvcg_video_enable(struct uvc_video *video, int enable);
+int uvcg_video_enable(struct uvc_video *video);
+int uvcg_video_disable(struct uvc_video *video);

 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc);

--
2.42.0.820.g83a721a137-goog

