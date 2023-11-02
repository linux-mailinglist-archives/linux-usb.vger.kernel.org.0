Return-Path: <linux-usb+bounces-2477-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE77DFB61
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 21:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 428912811F3
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 20:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1CC21A1D;
	Thu,  2 Nov 2023 20:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AjhI2V/L"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B3721A08
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 20:19:51 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A35E18B
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 13:19:50 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da0737dcb26so1665431276.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Nov 2023 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698956389; x=1699561189; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9HtuKTq7fDT9ipH0h7IAyB40jdEhSYri9qt3cL94eIk=;
        b=AjhI2V/LKSo+4x4A1avfj4mvidCNQM8faZaEXcDrstIwqxlyAw6Ggbk5NwWWpLm/Z8
         HZqG1bBZcs8j+TShLh/hou9I5fgkRDFefOHU6btBuWJEoda9hDWugoGVub+y3GiS7ww7
         gpoSxYLPweMilAcC+1bFQwkt5ncKjKc5OTQAZwO/tceDxBOJT/64MSgIZZ4PKKzmh5oV
         ouEDd5k1HpkiKIHB9sW9iaryo3ZwjWwV+71N9HvXb8+teVsMBMEiyO97zecnquZUfLWh
         +ff27vpAzwTy3BiHT4BHNkVQAfnjI0UZCAT+8aHZs/6rk4RaKYSFmHFNnwSjszgiVMd3
         VXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698956389; x=1699561189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HtuKTq7fDT9ipH0h7IAyB40jdEhSYri9qt3cL94eIk=;
        b=oNC0w+K/yxKffzKZG3fgzNM+ucGjWBFHS0Gge46ThNBj4qO33KFduq6pEz13PDs1yZ
         VncJeeR70GM1F/0cDRGk1IVZSslLFWfKqPLCv27KQT0+tiBLvM/on3c9VkCFHU7An4ND
         1l//U3XF1xuW8xCplhHRykFlDBZ0+a6huldARaV65aKi6gFA2/U2eJf511MYkSdK8nAu
         Fmfa8ZKGJGz6Piz5Iq+nNCiTcY3dT1ZDPZoP8nSgVGgkzfS8he1f7bjK17Zsi4ORuWKm
         gc/NA43KGTqIcZTvVqZfs1zuDqDm2RIak7FWfAIsB8PkHQWYlp6cXmgH1RBPGr2KDJsb
         NPAQ==
X-Gm-Message-State: AOJu0YxA4KpHynzVo+hxZuOPxc7dckeyVjVx8PHZlAefe4sYN2wbyoB/
	ERjfemnKnd20sBTptLAj2PDImEgb4n2E
X-Google-Smtp-Source: AGHT+IFrkjJB9WGWpUTwFb1mgPUZVX9ELEQkumqWtP1m4hJe80Aams7LPTA43HXM/PD8BVds2sVPAaRbtYGR
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a25:2d24:0:b0:d9a:4e29:6353 with SMTP id
 t36-20020a252d24000000b00d9a4e296353mr415463ybt.0.1698956389343; Thu, 02 Nov
 2023 13:19:49 -0700 (PDT)
Date: Thu,  2 Nov 2023 13:19:38 -0700
In-Reply-To: <20231102201939.4171214-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <73309396-3856-43a2-9a6f-81a40ed594db@google.com> <20231102201939.4171214-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231102201939.4171214-3-arakesh@google.com>
Subject: [PATCH v11 3/4] usb: gadget: uvc: move video disable logic to its own function
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
XX  -> v6  : Introduced this patch to make the next one easier to review
v6  -> v7  : Add Suggested-by
v7  -> v8  : No change. Getting back in review queue
v8  -> v9  : Call uvcg_video_disable directly instead of uvcg_video_enable(video, 0)
v9  -> v10 : Rebase to ToT (usb-next)
v10 -> v11 : No change

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
2.42.0.869.gea05f2083d-goog

