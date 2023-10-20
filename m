Return-Path: <linux-usb+bounces-2003-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6117D14F9
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 19:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 736D9B215AC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 17:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029E22031C;
	Fri, 20 Oct 2023 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g6qV6FY8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F122032C
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 17:36:38 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5429A11B
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 10:36:37 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9cb4de3bf0so1516346276.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697823396; x=1698428196; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dvfxkLD/8r79lzQNiiWwUNyjecc96GlFwHFwp2Vnnrk=;
        b=g6qV6FY8GwIbu7Fx1w4A9VsltnvhRD7oMmiXbvgNNyD6l1OmzvDH1Sn5HMx0+/63MC
         wl75yJ5uvjyDTxC9IA3qXOoHUBTPWywO06HwVqvwVHrg/bWH9Dg1nAFl9yJQdf1y3rk/
         oxeC3BKTtzF46nvBj0Tq287QFYaWPg2oIDSrw8qTb6xGvwPude3SbohOrrgS/584Bult
         tHp6OBDlTl1T0VqzBEIDZDu65jl3K1TIkpRxYgj7F7rYwSP/AH1g7dPH7N2Rj+k7G4Zi
         jZk0QvMKXjPjQpvCkjQKBs/zQBpCR7czGNzKfB2rbinuU2gguaA1UJ8q0SdI+7h6NuN/
         BsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697823396; x=1698428196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvfxkLD/8r79lzQNiiWwUNyjecc96GlFwHFwp2Vnnrk=;
        b=rC7ntiU02uI0rhh5NhOltzXCOPUNysv5BhnVdd2Na4W03PioHX6Xpr6LMIYNDlv0/H
         Ige40zBerbT+LTjol6cGr/H4BXy1zo+EKA0+ib34io+kbdhmkFS2ecUyRn61KfDOAgDW
         B8OghE1f02Jg3BvLEQGMGQC8Ty5uDbN8Ms/+cI82cKgSdY0E35R39UgUdePsB4K3PLbQ
         Bfw2AWLkfyxmRj5X+2GaVB3UJoctyXP/W41aI7/Sr2ldRxr6ErnpEDTkB6J92GFun0ZE
         oUFG835Jleef3HwWrHQ9eNslJBDEDA6eGD05DUyJML3QP8JSBrmhWIUDAp18rhkiJR7d
         kwyg==
X-Gm-Message-State: AOJu0Yw4CqACFAGMuRNKhGf/lvKIS/FtYRf3POY3ELWAj80M/nK5zw9H
	loS4s/v8+KiUKwgh9ncJ5OaDQwEjF6Ou
X-Google-Smtp-Source: AGHT+IGLmJ5qAg6PEoLkIr7FJC5SNvomNDguC7jAUIPnXFmTQS1WD61B25wcNwAuHnZh3QkCD8HukVO2g80G
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a5b:f03:0:b0:d9a:d233:b2a3 with SMTP id
 x3-20020a5b0f03000000b00d9ad233b2a3mr57003ybr.1.1697823396520; Fri, 20 Oct
 2023 10:36:36 -0700 (PDT)
Date: Fri, 20 Oct 2023 10:36:25 -0700
In-Reply-To: <20231020173626.2978356-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231019185319.2714000-1-arakesh@google.com> <20231020173626.2978356-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231020173626.2978356-3-arakesh@google.com>
Subject: [PATCH v7 3/4] usb: gadget: uvc: move video disable logic to its own function
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, dan.scally@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com
Cc: etalvala@google.com, gregkh@linuxfoundation.org, jchowdhary@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	m.grzeschik@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

This patch refactors the video disable logic in uvcg_video_enable
into its own separate function 'uvcg_video_disable'.

Suggested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
v6: Introduced this patch to make the next one easier to review
v6 -> v7: Add Suggested-by

 drivers/usb/gadget/function/uvc_video.c | 37 +++++++++++++++----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index c180866c8e34..80b8eaea2d39 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -493,13 +493,33 @@ static void uvcg_video_pump(struct work_struct *work)
 	return;
 }

+/*
+ * Disable video stream
+ */
+static int
+uvcg_video_disable(struct uvc_video *video)
+{
+	struct uvc_request *ureq;
+
+	cancel_work_sync(&video->pump);
+	uvcg_queue_cancel(&video->queue, 0);
+
+	list_for_each_entry(ureq, &video->ureqs, list) {
+		if (ureq->req)
+			usb_ep_dequeue(video->ep, ureq->req);
+	}
+
+	uvc_video_free_requests(video);
+	uvcg_queue_enable(&video->queue, 0);
+	return 0;
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
@@ -507,19 +527,8 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 		return -ENODEV;
 	}

-	if (!enable) {
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
-		return 0;
-	}
+	if (!enable)
+		return uvcg_video_disable(video);

 	if ((ret = uvcg_queue_enable(&video->queue, 1)) < 0)
 		return ret;
--
2.42.0.758.gaed0368e0e-goog

