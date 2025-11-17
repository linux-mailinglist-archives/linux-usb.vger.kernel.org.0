Return-Path: <linux-usb+bounces-30580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67785C66142
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 21:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF4504E9C52
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 20:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1F1333734;
	Mon, 17 Nov 2025 20:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mCccB1o5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C23633344E
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410461; cv=none; b=a+fzr3EwZUBNlpqUV2KY/5xRESXJpDYNmB1JJ4g3vr4VkM2ClAw8gVnsHoqkeXWO9WoS+nGFYVy54Lc72Lo20ymvjehbZl1FAM0zZ331KvFiDZvbA/cswFRs+V0G2qPNef5l8Ldf3yO6j0+atoDWgL8Coacof4dmfNcKyTNuA30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410461; c=relaxed/simple;
	bh=tUilLqPF6SzmbypUvh0pDDtsvnGuYdJyG0lrVm8dnvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgB0/bb89ywHNSZ4Labv/HpyO6KcTOHuh1KHaKGyDrHDxSlHnzoCFnL0+agGn3h672wV/27M71Mc5bpyB3yUqa17VJfz9X5JentkrEHdsPjq+TBGlAE/qCQe/nlY2moBy8DR4eygNjsrmOOAoRuHF7YMwRp3AT/PrUCSr0LGCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mCccB1o5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-595910c9178so1211102e87.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 12:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763410458; x=1764015258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llhisBgVyW1mIvqEoq3wSr5faLynyoEF2VocpfmN4uM=;
        b=mCccB1o51CQH+KJEzMmYdNVTo8nFFHL60Dd5l29qbcJ/o4tCe+RDzlgoqZE/bISq29
         DZBi0hh8TdKDwvBAp8rdEuyKL3MuZaWT9FoyTcH3lNeYQ/M/bmBwPIR21Imko/RfnI3s
         +FQwA7QqTErZoCdDiDl/zusMzDXSofaKv636c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763410458; x=1764015258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=llhisBgVyW1mIvqEoq3wSr5faLynyoEF2VocpfmN4uM=;
        b=h3y0OVDfBrflH9iR4RSkhYmvwRv88Ivg5OulZXRibOtNoOi5FHJNFBmqmU+Grqh6b7
         p0VkHWS+OARXBY0SLjjQm1dIfx1uya9zbl8GJDdAuLQvloeiHx49Qkyv/9i0Lfobgu4S
         d1nWNqFtgpv1HqBRxy6jGh+aYxhbKtDIL3SfFvD4ravPWx4Ye7PfL99QDFEqtC4Nlhsy
         nU6hnpxKdrxV7B9OPGW+wYTqdkzLkX6H0+FZ3q8GxoFkYC06DhytHLNK+6E9clKgW6tu
         CG86Peu+vcbe7n3v5zW7WvRz2mDCPQL0iNQCFhcPO//VTsKL+tBsIoWsSJbpMYFQxsAC
         n/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVwP2JQZvOztfvmy3CXjq5fiq98WG4nP+NlucvDbvvQyh57+QYGVV8YRN3wb1srpHneMRC/AE+n6P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEKE9XspufEEQxUKKf2IxBtjFrbdt1+wwupXNqx0BSggPkOHHM
	qyj2TOxCG9JgJOLofiKiMPQP8cl6PNoC2erK34MCPl8yWOojiS0kxRy2RTT7gcFAIg==
X-Gm-Gg: ASbGncv3kPBSpU5Kcs4MuzTpXNI+RQBKPD+k9krgGCSu83RX+RRtcKNmdgxZXjSgBaL
	0AnZ4BMXsrrgnhhViwSlwNUwH/BvkifXS6gHSyTS597e9sDYNAPy+4xGy3506VU3l5MwQmcXipX
	MvJkD9Y+pX7KCDKmVrEv1msmwyBLZ8Cjak3GXx+0tEKNYKn6TnadroUyYStZzkrvi+wzqP7BUWe
	yVKX4DZfSDzjVRB5EwuKmM6XJP3UkxKCY2UTNHLsYvfQMdpsI6xU3iVltP1Iq19UHWp5M/gP/do
	uZ1aDUMCdORX3C6HDWXm35k2+5L69J/A77ZKG+L75HQUMb+GRBoJWVUSuz+xAAm63ONyZxU2rEA
	tBLPwyDYq58Ps/8WL7NXCxnvm3o48XRYAX9AAohu5MeF0966hAzvpWaQsxC2AGIll6Pmysf1vcK
	8MTXeKMDKrJ7VwEr1DILhuWi1Qh8gdRKNC9OqJrsJtMRh28zFs6cz+dYyF5HUNq5NHPO9bwnMB
X-Google-Smtp-Source: AGHT+IHqA/rZVuUUTwCH7FDfVPsb0ar2Z5rIxo0AI3uwDk5VfFJ6s5EDzJh5I1/3N26JtJcj3MUnfg==
X-Received: by 2002:a05:6512:1289:b0:594:4fee:c1db with SMTP id 2adb3069b0e04-595841f99b7mr4455750e87.43.1763410458288;
        Mon, 17 Nov 2025 12:14:18 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm3413302e87.59.2025.11.17.12.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 12:14:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Nov 2025 20:14:16 +0000
Subject: [PATCH 1/4] media: uvcvideo: Remove nodrop parameter
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-uvcdynctrl-v1-1-aed70eadf3d8@chromium.org>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
In-Reply-To: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
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


