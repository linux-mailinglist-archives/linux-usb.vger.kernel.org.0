Return-Path: <linux-usb+bounces-1152-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0346C7BA8B0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 20:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id A7EB028200C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 18:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADB93D98F;
	Thu,  5 Oct 2023 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1UAjV89+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5353E374FB
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 18:08:26 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E865C115
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 11:08:18 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d86766bba9fso1775328276.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Oct 2023 11:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696529298; x=1697134098; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGPEr42+ZwCTP+CEzEnFhGGfenBhCq6NKh2BAUdeTck=;
        b=1UAjV89+aPiZ6PfduyoOx/FVGFc1vjlm+88m960GJqSnjXrtwwqMI/qL9rcKTal9Ub
         YIqcddmQ0iGpp62XKF8UMBXnaUPqhfb8S26Tl+GctNI2A6S/6pLse//oqYHj7ArjLtG7
         cSWvr1cPkExnnrBrBZ/H6a2hQm7RnRmg+2w6iSMNOCfkLl3uGuoWnakFuRmFfpCbRJsJ
         rGu5SJX9mBB4oU4EunUppIJO+Jb4Z80VaEZ+YX4b11S5Q9eqRMxFQ2u8T3SZKBacjDFT
         FE6huwNN5AFa7B4v8BhQBOwf9DT6jrhbu2NoyZCOcR1OK7Ce0cVArtbGlcX9GY8tVA0B
         rUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696529298; x=1697134098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGPEr42+ZwCTP+CEzEnFhGGfenBhCq6NKh2BAUdeTck=;
        b=FQ1AMmjINiJz2UiMcNIcu4KNgtOjYtksFVS7GeYCl0D3agd37YJJhyRSrCvQKZGEsV
         NjCm1LOGILf+6QWmbuVusb99pHv6/+vFXH4iMHWm5iM/9xkK6PUZ7mlD++CxHeIyAQga
         XAAGz48O8Ls+EC8ecQ+Ou/PbHuoLG55CbEST7ds+PN8DWl7YLJUI2cCDqp4bHBjZ3Ec/
         pQwnmWMxdNLdp8Ba1rgWxwWx9xFMZivH3L5QphEJNx2lZQ1uXBqKn5Lzf/QRnkb2Gas8
         lMxGUVz9IKX3c/VLYWmZtrAcE5F4P7EuzHz2Xxh+4QmoFsF2QQsB2FU9gtFTFSDdv/54
         +dzw==
X-Gm-Message-State: AOJu0YwbFNuZJgVsBS9NV1DwT+/D6eEUSS2ww78s7Uq+knkxHWjE3yb1
	FRoas3oXdZ4ryb6MHXw5B9SkxiMRriRb
X-Google-Smtp-Source: AGHT+IGohbK75EVXkfCZDbTpCYdI4cTufrVSsHUE2OXMHhyT7A/XkqzRLLmcg1lhHIXwLzwe32LvY3mmUFFy
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a5b:5c9:0:b0:d8b:737f:8240 with SMTP id
 w9-20020a5b05c9000000b00d8b737f8240mr103527ybp.0.1696529298114; Thu, 05 Oct
 2023 11:08:18 -0700 (PDT)
Date: Thu,  5 Oct 2023 11:08:12 -0700
In-Reply-To: <20230930184821.310143-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230930184821.310143-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231005180814.3278050-1-arakesh@google.com>
Subject: [PATCH v3 1/3] usb: gadget: uvc: prevent use of disabled endpoint
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, dan.scally@ideasonboard.com, 
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, 
	m.grzeschik@pengutronix.de
Cc: etalvala@google.com, jchowdhary@google.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Currently the set_alt callback immediately disables the endpoint and queues
the v4l2 streamoff event. However, as the streamoff event is processed
asynchronously, it is possible that the video_pump thread attempts to queue
requests to an already disabled endpoint.

This change moves disabling usb endpoint to the end of streamoff event
callback. To be consistent with the actual streaming state, uvc->state
is now toggled between CONNECTED and STREAMING from the v4l2 event
callback only.

Link: https://lore.kernel.org/20230615171558.GK741@pendragon.ideasonboard.com/
Link: https://lore.kernel.org/20230531085544.253363-1-dan.scally@ideasonboard.com/
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
v1 -> v2: Rebased to ToT and reworded commit message.
v2 -> v3: Fix email threading goof-up

 drivers/usb/gadget/function/f_uvc.c    | 11 +++++------
 drivers/usb/gadget/function/f_uvc.h    |  2 +-
 drivers/usb/gadget/function/uvc.h      |  2 +-
 drivers/usb/gadget/function/uvc_v4l2.c | 21 ++++++++++++++++++---
 4 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index faa398109431..75c9f9a3f884 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -263,10 +263,13 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	return 0;
 }

-void uvc_function_setup_continue(struct uvc_device *uvc)
+void uvc_function_setup_continue(struct uvc_device *uvc, int disable_ep)
 {
 	struct usb_composite_dev *cdev = uvc->func.config->cdev;

+	if (disable_ep && uvc->video.ep) {
+		usb_ep_disable(uvc->video.ep);
+	}
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
index 1db972d4beeb..e7f9f13f14dc 100644
--- a/drivers/usb/gadget/function/f_uvc.h
+++ b/drivers/usb/gadget/function/f_uvc.h
@@ -11,7 +11,7 @@

 struct uvc_device;

-void uvc_function_setup_continue(struct uvc_device *uvc);
+void uvc_function_setup_continue(struct uvc_device *uvc, int disale_ep);

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
index 3f0a9795c0d4..3d3469883ed0 100644
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
@@ -463,11 +463,19 @@ uvc_v4l2_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
 	struct uvc_video *video = &uvc->video;
+	int ret = 0;

 	if (type != video->queue.queue.type)
 		return -EINVAL;

-	return uvcg_video_enable(video, 0);
+	uvc->state = UVC_STATE_CONNECTED;
+	ret = uvcg_video_enable(video, 0);
+	if (ret < 0) {
+		return ret;
+	}
+
+	uvc_function_setup_continue(uvc, 1);
+	return 0;
 }

 static int
@@ -500,6 +508,14 @@ uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
 static void uvc_v4l2_disable(struct uvc_device *uvc)
 {
 	uvc_function_disconnect(uvc);
+	if (uvc->state == UVC_STATE_STREAMING) {
+		/*
+		 * Drop uvc->state to CONNECTED if it was streaming before.
+		 * This ensures that the usb_requests are no longer queued
+		 * to the controller.
+		 */
+		uvc->state = UVC_STATE_CONNECTED;
+	}
 	uvcg_video_enable(&uvc->video, 0);
 	uvcg_free_buffers(&uvc->video.queue);
 	uvc->func_connected = false;
@@ -647,4 +663,3 @@ const struct v4l2_file_operations uvc_v4l2_fops = {
 	.get_unmapped_area = uvcg_v4l2_get_unmapped_area,
 #endif
 };
-
--
2.42.0.609.gbb76f46606-goog

