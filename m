Return-Path: <linux-usb+bounces-2304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAFE7DA1B1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 22:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5559282695
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 20:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDE23E01A;
	Fri, 27 Oct 2023 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ijtoTyfI"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D623E484
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 20:20:13 +0000 (UTC)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7E61B3
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 13:20:12 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-56f75e70190so1903515a12.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 13:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698438012; x=1699042812; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpZGNvK+8AimoR1c5B/6cfe/M0yZF2viXEDURopJcAk=;
        b=ijtoTyfIfLp9OtCPostsmsmL/UMWXojbPow/DCb58u28QSAaE760iodJKGA0fc29VX
         rYhzENEmMht0UBc6Hz++1jorkpfI1XEh8UV7JPRCyBz692I1otqbcJI5L5W71ElWdOKb
         A83L+AT212XJTqil9VK298nZDJkPMBy74eZqL5HTfTRZXF+Z6O0LH53rDyOzlxPYmLoz
         W5iI9tceIOrIiFX/PPGOf2UUHnNfWtUNkhJk5aJu+RhbeGxGzwsXAj6vAHXYPWbjkxDP
         LYin4yVG83kBNuruAiVlu2XTv6MGrtKf1sukUHACr9KkTb8hLObK7QiYGdrVWL+o+u4L
         S2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698438012; x=1699042812;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hpZGNvK+8AimoR1c5B/6cfe/M0yZF2viXEDURopJcAk=;
        b=Gc/xv51fBjFptQaVeSPr4pYGiOtUYsRtmrXwoL0+OoJuUQqR/9VZ4iQ1ynFiAA6fLw
         xLkcT88S6AlplU2LU50Jfa8SZojG0a5aUv4RMDwTi1NczfDjkeYEwqc/1LFA7hX+N/Au
         /H33LAH2ulkJRx3HJIzVg6wH27eXBkkoPo7EIaV7mdPF3AgX8LlSlRD+ceYc/nAt7dky
         F03VjL4LMeGSl/iPMvS3DjARGtM7xXhfV/zlcnZ/JkR8wa08d6CYwy4W1S6C7KUk4GAy
         FkX0muh0FhLmqzPTl1kxDyp+SQHrg+UpmSzRLK9oa4Ll1t9UmRMxEFUJfEgMjmsR2y8B
         gT3w==
X-Gm-Message-State: AOJu0Yz/XerLXEDNHSAbiRfDisRIeN4IZR5oYI0OUSvO5494dWRNkxsO
	bxoWKZrlZrtYLCwK0TozoCojix4THjHl
X-Google-Smtp-Source: AGHT+IEjE8p+wQEjIL68ILQbQOP53JgNCwlWkYiD0QfK+5TD0ZBkI/uVH2UrekqCdb+QlD1+n2pA3tBfdTQe
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a63:6d46:0:b0:589:91f7:c89 with SMTP id
 i67-20020a636d46000000b0058991f70c89mr68069pgc.12.1698438011926; Fri, 27 Oct
 2023 13:20:11 -0700 (PDT)
Date: Fri, 27 Oct 2023 13:19:58 -0700
In-Reply-To: <20231027201959.1869181-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <73309396-3856-43a2-9a6f-81a40ed594db@google.com> <20231027201959.1869181-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027201959.1869181-3-arakesh@google.com>
Subject: [PATCH v9 3/4] usb: gadget: uvc: move video disable logic to its own function
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
v6: Introduced this patch to make the next one easier to review
v6 -> v7: Add Suggested-by
v7 -> v8: No change. Getting back in review queue
v8 -> v9: Call uvcg_video_disable directly instead of uvcg_video_enable(video, 0)

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
index f8f9209fee50..1081dd790fd6 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -494,31 +494,43 @@ static void uvcg_video_pump(struct work_struct *work)
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

