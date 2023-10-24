Return-Path: <linux-usb+bounces-2140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AE27D5AA2
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 20:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E645281A63
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 18:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77963B2AF;
	Tue, 24 Oct 2023 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="09WLSfof"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC43C0C
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 18:36:16 +0000 (UTC)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3B0A2
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 11:36:15 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5b87150242cso3164455a12.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 11:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698172575; x=1698777375; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4WZ1HmvUmacPvyIaR17cHvCpQJGXPJrdUyEy8+V7mI=;
        b=09WLSfofrd7WGFjn9ZyNZ84zvC2k/UnSEETZ+SZSRHKu8PDZ8FVndiHnZU359dB3eH
         1KuT8iJOV2M4qoB3LO7GPsyXf+lkKCpErwhw1RA4njpyIO/jfAKR06jPjkRF2E/7T2EF
         90CZp1IUk1JnyT58p02VKJ5l2i6SY9P+ZkTTUIythZCgy5DIsJqDlur2fNO52rtt1rxx
         jmoTKXONpSaI6a0QOKoPsV7uFXnHTOsagJa1C8WsD4pMAhCzKr0PpzqGuMwOiI9grbdh
         U6zAXk7W1l6a6KQvL6nCqE78hIw5R4nyUB5HmHWtbOHAGDjphwCpCMY58uMvrAv8KrTA
         HjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698172575; x=1698777375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4WZ1HmvUmacPvyIaR17cHvCpQJGXPJrdUyEy8+V7mI=;
        b=iOZqSECGuY0Oi8jpVUhsttNHTz8ogoo5f7HgLZzgqzFlA3b0pOZ91m6TfD4RkD78Eq
         km/jXL6Q1GVefIyJL+wyZwWomtWZ9DnFEYhXanp5f4oM428AGt0fJsioQBUnzZZyiDIo
         Q6/TEavyVVK+c01wCDyPhTYDvdBPE5mINSm7Ku/3N8sV6MSeV27HrasUygtRyE9oIIX9
         64ZV57XTSRqkHS5eNty9zOcx2eYLWSwi7Qp1ddMaOyav96VIQKOpooKNuV2YOa/YbkpW
         ZGCA5I17EwtFBNgxZD0qtxbYEaEOSHRhWJlkDWxlDhGI7icQNbW2LF2xk8YZf8rBVj8Z
         fhIw==
X-Gm-Message-State: AOJu0YzDZ2bLPjwjkNVP98d5WWGNb3wLUcnS1G2mJUH3B0REzkG0GV/l
	Z3qwy/fVDRCySbwKqIqJgRRaYtjAWRdx
X-Google-Smtp-Source: AGHT+IGXxUNdfMt15oKOdqw99Ssbcqp76I1WtEMrjR6oh8zum05Ei/D30LaPvRF6xr6VZvWoFY5p2afzDLIS
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a05:6a02:68c:b0:589:86ae:2107 with SMTP id
 ca12-20020a056a02068c00b0058986ae2107mr299068pgb.9.1698172574872; Tue, 24 Oct
 2023 11:36:14 -0700 (PDT)
Date: Tue, 24 Oct 2023 11:36:04 -0700
In-Reply-To: <20231024183605.908253-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231019185319.2714000-1-arakesh@google.com> <20231024183605.908253-1-arakesh@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231024183605.908253-3-arakesh@google.com>
Subject: [PATCH v8 3/4] usb: gadget: uvc: move video disable logic to its own function
From: Avichal Rakesh <arakesh@google.com>
To: arakesh@google.com, dan.scally@ideasonboard.com, 
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com
Cc: etalvala@google.com, jchowdhary@google.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, m.grzeschik@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

This patch refactors the video disable logic in uvcg_video_enable
into its own separate function 'uvcg_video_disable'.

Suggested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
v6: Introduced this patch to make the next one easier to review
v6 -> v7: Add Suggested-by
v7 -> v8: No change. Getting back in review queue

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

