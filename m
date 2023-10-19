Return-Path: <linux-usb+bounces-1930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E40677D021D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 20:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EEE92823FF
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 18:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25342FE0F;
	Thu, 19 Oct 2023 18:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YJN9YgOH"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEB038DFA
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 18:53:34 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540DA126
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 11:53:33 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9caf486775so20406276.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 11:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697741612; x=1698346412; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QionUCvuT3m0k3agh1AZNJhfdHG7qgHMaPeO/bL+n4o=;
        b=YJN9YgOH35FSE5qFIIYKCdF6xAHhJGAW2alUm6/yltMyH/sm5hzjTuCC6je/iLzSgc
         9vjtUF32y/4nHgsa4o2li6zWXz+Q1jUcC5iI8MijZMgatNZ+zdyPp7YswK1tZs1dbSAW
         J6bJikaRGCPGk7TSBBHrHPFggM0HnHlnMpbPLj7Oqkq4kM48MzmuAKf0gFU+dQE9yIcx
         LbGLa/XZCCXwQ2PP0sLl6RcQvPy4iuiqJI005zuS56kN6UTqUFOstz7Tzuh/tqW3lEDa
         a9+Axwp1YP3t+NIZCQ3VFAciN0FkCa73n8Cq5701eQRrVvMJD92UWNvxhtWPLxH0lpHz
         4NcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697741612; x=1698346412;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QionUCvuT3m0k3agh1AZNJhfdHG7qgHMaPeO/bL+n4o=;
        b=UTDNic+wytQJEzuXj/ymGUxor2sAYMZ/uGHV4S44hCi10fJJAwjnAMtGvwunGrgF+h
         Etfn6/d7j+bpSENWLbA9GIYuiJFkYELM7oFmPfIQ2HPekpRniZv1QIIk8NNJnX2CCRw/
         XP/bF5o+s+84UmilUnkHxHAd1AW2KPx11tQR8zWWZRqdq5Nakduu4xSteRu/p+cwthOC
         WwxFYA/xy5OuZS0V30xZFtaz27GNPl+KzX1sCCofaM8H7klWkyBtezt6EarF6k6DCXIo
         mPwNK0ClmR+pablNaExnSSd7DwwmuxVN9UbLCmgWOi9Fi8EsscdFFo3h6lg0Vkd2TCXF
         8uxw==
X-Gm-Message-State: AOJu0YxHqnnuv0m8SmQr0rKh/BG6Yqgizji9MEIggcrIWuEPbvVsEgV9
	p7pwNh9k1+8dGKQxJGAjE+61HSL7nqB4
X-Google-Smtp-Source: AGHT+IEk97ye1XaX5Un4njRJ74jhPtt4z3P97XlgQktDFvpYiWSjbv6fhaikcH7jj0ZjZwKPkeI1P2Mhv06A
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a25:e7c2:0:b0:d9c:a59b:203c with SMTP id
 e185-20020a25e7c2000000b00d9ca59b203cmr65805ybh.4.1697741612510; Thu, 19 Oct
 2023 11:53:32 -0700 (PDT)
Date: Thu, 19 Oct 2023 11:53:18 -0700
In-Reply-To: <20231019185319.2714000-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230930184821.310143-1-arakesh@google.com> <20231019185319.2714000-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231019185319.2714000-4-arakesh@google.com>
Subject: [PATCH v6 3/4] usb: gadget: uvc: move video disable logic to its own function
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, dan.scally@ideasonboard.com, 
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com, 
	m.grzeschik@pengutronix.de
Cc: etalvala@google.com, jchowdhary@google.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch refactors the video disable logic in uvcg_video_enable
into its own separate function 'uvcg_video_disable'.

Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
v6: Introduced this patch to make the next one easier to review

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

