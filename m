Return-Path: <linux-usb+bounces-30739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DAFC70DC7
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 20:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 938884E3CDC
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 19:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AAC371DCF;
	Wed, 19 Nov 2025 19:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mQgOdslD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F1C313285
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581038; cv=none; b=HHEGC0ESAXeW2lNYNkcpmkvklqLYoY4VfnoBj5rVn7J6d6zcdnPkIaQMjiFrTSfBoMw6EupCxL+BjT1rzgr4anR21eAqDpWz7B77NOi868a9ObA9lTr4BfPNp5SE54T7dJbBEMcknfn4gvKXfqtI8vTLjj0m10XbzQK2cDLiSUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581038; c=relaxed/simple;
	bh=n8XOm9luf2fVsxqKyrBWhIZuOOg2rhp+w9xSWOV/plE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQlDpdhErTDvBYHlvTwZocHGmE/YTynOlysv2tKWBSO+Y+oreXW9XF6Q+rZpJlpmI6VKzxaEqpY5Iqg4Q7O3H6NuPjEtVrzefariYaUIASKE8Zx8UJaTcp8eFdH/CzBpLWqDmm3pWLyexwZtbeNkqYmIw1V22hbhenIL9SGdHEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mQgOdslD; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59428d2d975so26047e87.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763581033; x=1764185833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9t1hhYNW+A5BDerlrM2zvaB6QZgqTCpLkk7E6jVXaDE=;
        b=mQgOdslD9nPCwG9K3q8zYKNBqSnR9NiIbjnRUyi1hwl/ZqQBNidXW1M+iUuKqIamPV
         Ctz0G6VHyuPiuqdE7olOliRniJho3p+TfXcvoiVot1nD+TtziHgYFyVvoH3+wKsakH4H
         565pHVmC6BlTb+dMLmBTfwqDi8Q2ZwjyI3eHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581033; x=1764185833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9t1hhYNW+A5BDerlrM2zvaB6QZgqTCpLkk7E6jVXaDE=;
        b=ZuR6vlKOGhXkY7mWdFejnKhOb5fP7QmGZ4+D6ARDpl+2t+9Kts+CS1AQyqR82ox4+V
         J3lkaAbniEB0+SXRLIBBbwGd2usyJc2n3hTPWmdH2KXNby/QnanAAGLu6PvTuAO7J7xR
         2wxr/YkU4UvbQgDRdnJ+FulCTbIQgDK1++V706GMcjOCEiboImvoJZduVjsLaZK8Eyfg
         8KSSH+bxBEhvOmJJi0L6+Ay73eNBxuBk5rRtZHxsbPVtEAgUXDDjTbtKhVm0CVii1MRO
         6LDSQxCBaoHqD9g1ob054GfRtuIAOh0MPX8Gaw3PQjvk+HJNCBEEiVvQUdujvOi1f3t1
         UfDg==
X-Forwarded-Encrypted: i=1; AJvYcCVWzF5YBpwM4jn0w/QFx7ga3uy02uIU3lY+AUOvffqbVzSdMQvMpXazt73WoQVD4p3xRXJSd9ABtlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY6RxWsxYE2DC6ifibiJr5nnc8XfQUZsUtJi3tD4RewozitxCF
	6QHzekQu2/N+sPErPKn3bLkuFBuc/JGtWflBwBXrW+kdezTFXQZinabCz5czR4E5rw==
X-Gm-Gg: ASbGncu7uRa7MGzYcqsemcE0mOGwejwalJDSmwhjVBLuBCo/tQSflWuZ/HDdrueub+4
	om1aYzbJKMWikb8moGkqK4tjDO6YlxP5jrUF/kQOUl7NwYCIPFymc6P66zGgx5HnMBHSVPNrNxo
	9/iCChcZhTO42SXmFI1x5UmwqPDTqD0d88POl6OjGfY5EG+g7OrQYm3deqadDktfe8K3EOcE7J8
	YFb1rAcX5zYBNQ1IopZjfucowgplzlk2Reh344rBQUhxtxQuSxDdj9/2PlorK07nRMp41mxBqdM
	eXVEiLVgzoKdesFsDgi9MnQGEeGJwtFl53InXiuwIH0r58qq+TmdhD+iYTBlV8GjnS+gs+Liv1Z
	X9R/FbwQSJcRM+WUzy1swTGwJxIDGALlNQW5piG5ydOHBhmN4wdTePyu7hGj+GCSvJTvT0EnR/q
	GDJIU6SQvzrliwb5nDWVpje/AbyRhRGzrTHcMDze43xCJZf/AA5xXDlin/tnTkGg==
X-Google-Smtp-Source: AGHT+IEzy07FdaBjKY/dhcgvBozZKv1y77WZHmLiavxxJhCZh+QBPAxjEQ2BThdKmAn1PbL0E6rOzg==
X-Received: by 2002:a05:6512:3e15:b0:594:2f46:391c with SMTP id 2adb3069b0e04-5969e30c2ddmr20533e87.44.1763581033193;
        Wed, 19 Nov 2025 11:37:13 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd15a1sm65790e87.98.2025.11.19.11.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:37:12 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 19:37:10 +0000
Subject: [PATCH v2 1/6] media: uvcvideo: Remove nodrop parameter
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-uvcdynctrl-v2-1-0359ffb98c9e@chromium.org>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
In-Reply-To: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

We announced the deprecation intentions one year ago in the commit
commit 40ed9e9b2808 ("media: uvcvideo: Announce the user our deprecation
intentions").

We have not hear any complains, lets remove the nodrop parameter.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 19 -------------------
 drivers/media/usb/uvc/uvc_queue.c  | 25 -------------------------
 drivers/media/usb/uvc/uvcvideo.h   |  1 -
 3 files changed, 45 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ee4f54d6834962414979a046afc59c5036455124..71563d8f4bcf581694ccd4b665ff52b629caa0b6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -32,7 +32,6 @@
 
 unsigned int uvc_clock_param = CLOCK_MONOTONIC;
 unsigned int uvc_hw_timestamps_param;
-unsigned int uvc_no_drop_param = 1;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
@@ -2468,24 +2467,6 @@ MODULE_PARM_DESC(clock, "Video buffers timestamp clock");
 module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, 0644);
 MODULE_PARM_DESC(hwtimestamps, "Use hardware timestamps");
 
-static int param_set_nodrop(const char *val, const struct kernel_param *kp)
-{
-	pr_warn_once("uvcvideo: "
-		     DEPRECATED
-		     "nodrop parameter will be eventually removed.\n");
-	return param_set_bool(val, kp);
-}
-
-static const struct kernel_param_ops param_ops_nodrop = {
-	.set = param_set_nodrop,
-	.get = param_get_uint,
-};
-
-param_check_uint(nodrop, &uvc_no_drop_param);
-module_param_cb(nodrop, &param_ops_nodrop, &uvc_no_drop_param, 0644);
-__MODULE_PARM_TYPE(nodrop, "uint");
-MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
-
 module_param_named(quirks, uvc_quirks_param, uint, 0644);
 MODULE_PARM_DESC(quirks, "Forced device quirks");
 module_param_named(trace, uvc_dbg_param, uint, 0644);
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 790184c9843d211d34fa7d66801631d5a07450bd..3bc54456b4d98ed50b1ea250ce8501e67141e1ef 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -331,34 +331,9 @@ struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue)
 	return nextbuf;
 }
 
-/*
- * uvc_queue_buffer_requeue: Requeue a buffer on our internal irqqueue
- *
- * Reuse a buffer through our internal queue without the need to 'prepare'.
- * The buffer will be returned to userspace through the uvc_buffer_queue call if
- * the device has been disconnected.
- */
-static void uvc_queue_buffer_requeue(struct uvc_video_queue *queue,
-		struct uvc_buffer *buf)
-{
-	buf->error = 0;
-	buf->state = UVC_BUF_STATE_QUEUED;
-	buf->bytesused = 0;
-	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, 0);
-
-	uvc_buffer_queue(&buf->buf.vb2_buf);
-}
-
 static void uvc_queue_buffer_complete(struct kref *ref)
 {
 	struct uvc_buffer *buf = container_of(ref, struct uvc_buffer, ref);
-	struct vb2_buffer *vb = &buf->buf.vb2_buf;
-	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
-
-	if (buf->error && !uvc_no_drop_param) {
-		uvc_queue_buffer_requeue(queue, buf);
-		return;
-	}
 
 	buf->state = buf->error ? UVC_BUF_STATE_ERROR : UVC_BUF_STATE_DONE;
 	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ed7bad31f75ca474c1037d666d5310c78dd764df..9a86d7f1f6ea022dace87614030bf0fde0d260f0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -659,7 +659,6 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_XU_GET_RES	2
 
 extern unsigned int uvc_clock_param;
-extern unsigned int uvc_no_drop_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;

-- 
2.52.0.rc1.455.g30608eb744-goog


