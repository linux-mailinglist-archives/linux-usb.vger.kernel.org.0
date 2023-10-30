Return-Path: <linux-usb+bounces-2366-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 813247DC11C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 21:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD428B20E1B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 20:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7161B284;
	Mon, 30 Oct 2023 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gvKoH2W+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF351B264
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 20:22:40 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA9B102
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 13:22:36 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a7be940fe1so49810487b3.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698697355; x=1699302155; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RZbkFdW7n25fZk9cwmO7qLQnmgnKAK5eU70WepjOvI4=;
        b=gvKoH2W+4/t9QzFXL/8SBkeGxP72e1Uh7PRT3YaKNFyI9XhOQXxrbi9hMH0/4bXW01
         lSH3qMwzNs3Mc7eqCdM/xYPdZCtDJn7aUV4IEV0iR5yHICJCzuym0/NMucWIoY3hGKYA
         RoYdCfWGHXnr5OUyZTdMVYKi2peejmR+KcoTZATUERIXZ5Icx8ZFnsQuFWuJG1i5vf/v
         MC0Vsl26d9JzeYjT4nYzFYSQEQ7iqeqv2I0kCFIAPtkcxbcemu+RazEDR2fcLolI5RU0
         ZvhrHgMdXAVCnNg5DKHOWcQBl/f+x7qtCZj7UXvRQTDiKABaeoTEi1anPTN6uJF/9GaV
         /5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698697355; x=1699302155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZbkFdW7n25fZk9cwmO7qLQnmgnKAK5eU70WepjOvI4=;
        b=wA1L15UFs2weif1KU8oGVhjVFLoGdY6ZsEOcCF+MfjhcAV0ktmwUdwj1EN0j0ZMAM8
         qCi+EGjYxovQEBVbtEBMj9D0/uRF5B74D9J+70wh2hxYZzlktvgi0twdOKDWE8C5r9P5
         /31KfFD4KxkH+qtOJCGmhL/aYckg/aVlhT8rQvmtF9gXKTJh8tZqfV5Ov/dnpMQsKehW
         ShQgPd/LbWaaqZISRN8t+YMOcapZpTqFQRR9f3HIlsRMaXcdrUV7SxLQ+5i+dqkQv6HJ
         DXp48HuArXJEIi5pH+/OV8mkRMIUveHFjaERL2qm5xJNp9Jyc3SHZiq47vFobWYJDnfA
         4SrA==
X-Gm-Message-State: AOJu0YwelDhv3kFZ8lpygXD7VvEScWASiEOKEKBbmCveZ8cCIVUTs2LF
	wYpUQE4rk9Giw54Rvlp5ixQxfKKGuPu9
X-Google-Smtp-Source: AGHT+IHat5B8FCm1prDUO4wysUSxkPtzPuT2YX9PKgBozG5IUodlAPr6/mBcF+W/g6u1xK/XEFTvRIAulDvd
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a81:920b:0:b0:59b:f3a2:cd79 with SMTP id
 j11-20020a81920b000000b0059bf3a2cd79mr219783ywg.8.1698697355197; Mon, 30 Oct
 2023 13:22:35 -0700 (PDT)
Date: Mon, 30 Oct 2023 13:22:28 -0700
In-Reply-To: <73309396-3856-43a2-9a6f-81a40ed594db@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <73309396-3856-43a2-9a6f-81a40ed594db@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231030202231.3263253-1-arakesh@google.com>
Subject: [PATCH v10 1/4] usb: gadget: uvc: prevent use of disabled endpoint
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, dan.scally@ideasonboard.com
Cc: etalvala@google.com, gregkh@linuxfoundation.org, jchowdhary@google.com, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, m.grzeschik@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Currently the set_alt callback immediately disables the endpoint and queues
the v4l2 streamoff event. However, as the streamoff event is processed
asynchronously, it is possible that the video_pump thread attempts to queue
requests to an already disabled endpoint.

This change moves disabling usb endpoint to the end of streamoff event
callback. As the endpoint's state can no longer be used, video_pump is
now guarded by uvc->state as well. To be consistent with the actual
streaming state, uvc->state is now toggled between CONNECTED and STREAMING
from the v4l2 event callback only.

Link: https://lore.kernel.org/20230615171558.GK741@pendragon.ideasonboard.com/
Link: https://lore.kernel.org/20230531085544.253363-1-dan.scally@ideasonboard.com/
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
v1 -> v2 : Rebased to ToT and reworded commit message.
v2 -> v3 : Fix email threading goof-up
v3 -> v4 : Address review comments & re-rebase to ToT
v4 -> v5 : Add Reviewed-by & Tested-by
v5 -> v6 : No change
v6 -> v7 : No change
v7 -> v8 : No change. Getting back in review queue
v8 -> v9 : Fix typo. No functional change.
v9 -> v10: Rebase to ToT (usb-next)

 drivers/usb/gadget/function/f_uvc.c     | 11 +++++------
 drivers/usb/gadget/function/f_uvc.h     |  2 +-
 drivers/usb/gadget/function/uvc.h       |  2 +-
 drivers/usb/gadget/function/uvc_v4l2.c  | 20 +++++++++++++++++---
 drivers/usb/gadget/function/uvc_video.c |  3 ++-
 5 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 786379f1b7b7..77999ed53d33 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -263,10 +263,13 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	return 0;
 }

-void uvc_function_setup_continue(struct uvc_device *uvc)
+void uvc_function_setup_continue(struct uvc_device *uvc, int disable_ep)
 {
 	struct usb_composite_dev *cdev = uvc->func.config->cdev;

+	if (disable_ep && uvc->video.ep)
+		usb_ep_disable(uvc->video.ep);
+
 	usb_composite_setup_continue(cdev);
 }

@@ -337,15 +340,11 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 		if (uvc->state != UVC_STATE_STREAMING)
 			return 0;

-		if (uvc->video.ep)
-			usb_ep_disable(uvc->video.ep);
-
 		memset(&v4l2_event, 0, sizeof(v4l2_event));
 		v4l2_event.type = UVC_EVENT_STREAMOFF;
 		v4l2_event_queue(&uvc->vdev, &v4l2_event);

-		uvc->state = UVC_STATE_CONNECTED;
-		return 0;
+		return USB_GADGET_DELAYED_STATUS;

 	case 1:
 		if (uvc->state != UVC_STATE_CONNECTED)
diff --git a/drivers/usb/gadget/function/f_uvc.h b/drivers/usb/gadget/function/f_uvc.h
index 1db972d4beeb..083aef0c65c6 100644
--- a/drivers/usb/gadget/function/f_uvc.h
+++ b/drivers/usb/gadget/function/f_uvc.h
@@ -11,7 +11,7 @@

 struct uvc_device;

-void uvc_function_setup_continue(struct uvc_device *uvc);
+void uvc_function_setup_continue(struct uvc_device *uvc, int disable_ep);

 void uvc_function_connect(struct uvc_device *uvc);

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 6751de8b63ad..989bc6b4e93d 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -177,7 +177,7 @@ struct uvc_file_handle {
  * Functions
  */

-extern void uvc_function_setup_continue(struct uvc_device *uvc);
+extern void uvc_function_setup_continue(struct uvc_device *uvc, int disable_ep);
 extern void uvc_function_connect(struct uvc_device *uvc);
 extern void uvc_function_disconnect(struct uvc_device *uvc);

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 3f0a9795c0d4..7cb8d027ff0c 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -451,7 +451,7 @@ uvc_v4l2_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	 * Complete the alternate setting selection setup phase now that
 	 * userspace is ready to provide video frames.
 	 */
-	uvc_function_setup_continue(uvc);
+	uvc_function_setup_continue(uvc, 0);
 	uvc->state = UVC_STATE_STREAMING;

 	return 0;
@@ -463,11 +463,18 @@ uvc_v4l2_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
+	int ret = 0;

 	if (type != video->queue.queue.type)
 		return -EINVAL;

-	return uvcg_video_enable(video, 0);
+	uvc->state = UVC_STATE_CONNECTED;
+	ret = uvcg_video_enable(video, 0);
+	if (ret < 0)
+		return ret;
+
+	uvc_function_setup_continue(uvc, 1);
+	return 0;
 }

 static int
@@ -500,6 +507,14 @@ uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
 static void uvc_v4l2_disable(struct uvc_device *uvc)
 {
 	uvc_function_disconnect(uvc);
+	/*
+	 * Drop uvc->state to CONNECTED if it was streaming before.
+	 * This ensures that the usb_requests are no longer queued
+	 * to the controller.
+	 */
+	if (uvc->state == UVC_STATE_STREAMING)
+		uvc->state = UVC_STATE_CONNECTED;
+
 	uvcg_video_enable(&uvc->video, 0);
 	uvcg_free_buffers(&uvc->video.queue);
 	uvc->func_connected = false;
@@ -647,4 +662,3 @@ const struct v4l2_file_operations uvc_v4l2_fops = {
 	.get_unmapped_area = uvcg_v4l2_get_unmapped_area,
 #endif
 };
-
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 91af3b1ef0d4..c334802ac0a4 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -384,13 +384,14 @@ static void uvcg_video_pump(struct work_struct *work)
 	struct uvc_video_queue *queue = &video->queue;
 	/* video->max_payload_size is only set when using bulk transfer */
 	bool is_bulk = video->max_payload_size;
+	struct uvc_device *uvc = video->uvc;
 	struct usb_request *req = NULL;
 	struct uvc_buffer *buf;
 	unsigned long flags;
 	bool buf_done;
 	int ret;

-	while (video->ep->enabled) {
+	while (uvc->state == UVC_STATE_STREAMING && video->ep->enabled) {
 		/*
 		 * Retrieve the first available USB request, protected by the
 		 * request lock.
--
2.42.0.820.g83a721a137-goog

