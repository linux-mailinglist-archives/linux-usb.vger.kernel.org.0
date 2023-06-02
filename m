Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF011720A63
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 22:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235449AbjFBUiP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 16:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbjFBUiO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 16:38:14 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05A0E43
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 13:38:11 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5651d8acfe2so38038467b3.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Jun 2023 13:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685738291; x=1688330291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1pGj2/POBDsIUQ4CnUPDeqZPOZuE4Ae3wEUEXuNv7U=;
        b=DzFg14PSTYeDYU4F6M2g9LQRKsV9gHH6XLwHWybS8R895s0B8l+3EJBVcsJjijZp7+
         co51fWzpePtbnqGumiwMU/JssUSD2E8rqA3nJ4FbGs+ao+xlAy92iykBzwEA9vdUpSnn
         DgpMOqC8QWArpw6Ekdd/hNyIw1qFeEajzxtXcj9CUeX2c1flBw0Uv2FyPdWaRduCvZW7
         sLIEaVAHbSSmqTNCcid975vW+tNmX/C+cuX00BR9fEKzH0fHBC01RrnP/+dLXjAUnJVt
         vzvNeJWCBDVoNzyI2Iu8syBCIiDOlMdyIaKaOvhCUt9EiN9RhPEp3D0umdCHtscPwdbq
         R5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685738291; x=1688330291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1pGj2/POBDsIUQ4CnUPDeqZPOZuE4Ae3wEUEXuNv7U=;
        b=XvPtuh1Zcy8MFrFwlebc9mbo7FJ0EEUk4LlYA0DV2N0qp2heMsElH0djXM3yImFiAE
         4qgMYJ+Gnv297Ui5KWR8F2wTno18ed+1MJf5EaQ8cphyV3k+mQcAZMVif8VcPuf3W92w
         oIw1OtyGYknS7wOe/PRcJuLizH8b/9wm2wjkIQlCUn97WlJlzLkAG+eTNkW6rLXdwEwJ
         UilAFHmtawz96lIMHTdb8AhDt/t94yHt9T2xNIHvlBr37OZBzW9lfwIAxYfVTuT+pKTb
         ZiiC+VRei4nqXW+Y15tAokjZz7JvM8WOGpt9XtfqJXRCkqjrOOr9jsum6+odrXitO3lz
         0JZA==
X-Gm-Message-State: AC+VfDzCPkS1O67un/mSSuTWMOgrEsD2XlrwZiWrgTMm06t5jAaxOdIA
        B+W/hWOdDWNd0wcoKqCsoh8rx5k6HCg5
X-Google-Smtp-Source: ACHHUZ46G/eM2Nh8J29QCWhu+a85YACKHWOlw2lV8g79lNZuulXVwgrYSrT7rhGlA+MCFkqwCFyPEkmFB79n
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a25:404f:0:b0:ba8:373e:acf1 with SMTP id
 n76-20020a25404f000000b00ba8373eacf1mr2541157yba.12.1685738291115; Fri, 02
 Jun 2023 13:38:11 -0700 (PDT)
Date:   Fri,  2 Jun 2023 13:37:46 -0700
In-Reply-To: <20230602151916.GH26944@pendragon.ideasonboard.com>
Mime-Version: 1.0
References: <20230602151916.GH26944@pendragon.ideasonboard.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602203746.288881-1-arakesh@google.com>
Subject: [PATCH v2] usb: gadget: uvc: queue empty isoc requests if no video
 buffer is available
From:   Avichal Rakesh <arakesh@google.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     Thinh.Nguyen@synopsys.com, arakesh@google.com,
        dan.scally@ideasonboard.com, etalvala@google.com,
        gregkh@linuxfoundation.org, jchowdhary@google.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ISOC transfers expect a certain cadence of requests being queued. Not
keeping up with the expected rate of requests results in missed ISOC
transfers (EXDEV). The application layer is not required to produce video
frames to match this expectation, so uvc gadget driver must not rely
on data from application layer to maintain the ISOC cadence.

Currently, uvc gadget driver waits for new video buffer to become available
before queuing up usb requests. With this patch the gadget driver queues up
0 length usb requests whenever there are no video buffers available. The
USB controller's complete callback is used as the limiter for how quickly
the 0 length packets will be queued. Video buffers are still queued as
soon as they become available.

Link: https://lore.kernel.org/CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com/
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
Changelog:
v2:
  - Updated commit message to make it clear that userspace application is not
    required to match the ISOC rate.
  - Styling and comment revision based on review


 drivers/usb/gadget/function/uvc_video.c | 50 +++++++++++++++++++------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index dd1c6b2ca7c6..91af3b1ef0d4 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -382,9 +382,12 @@ static void uvcg_video_pump(struct work_struct *work)
 {
 	struct uvc_video *video = container_of(work, struct uvc_video, pump);
 	struct uvc_video_queue *queue = &video->queue;
+	/* video->max_payload_size is only set when using bulk transfer */
+	bool is_bulk = video->max_payload_size;
 	struct usb_request *req = NULL;
 	struct uvc_buffer *buf;
 	unsigned long flags;
+	bool buf_done;
 	int ret;

 	while (video->ep->enabled) {
@@ -408,20 +411,47 @@ static void uvcg_video_pump(struct work_struct *work)
 		 */
 		spin_lock_irqsave(&queue->irqlock, flags);
 		buf = uvcg_queue_head(queue);
-		if (buf == NULL) {
+
+		if (buf != NULL) {
+			video->encode(req, video, buf);
+			buf_done = buf->state == UVC_BUF_STATE_DONE;
+		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) && !is_bulk) {
+			/*
+			 * No video buffer available; the queue is still connected and
+			 * we're transferring over ISOC. Queue a 0 length request to
+			 * prevent missed ISOC transfers.
+			 */
+			req->length = 0;
+			buf_done = false;
+		} else {
+			/*
+			 * Either the queue has been disconnected or no video buffer
+			 * available for bulk transfer. Either way, stop processing
+			 * further.
+			 */
 			spin_unlock_irqrestore(&queue->irqlock, flags);
 			break;
 		}

-		video->encode(req, video, buf);
-
 		/*
-		 * With usb3 we have more requests. This will decrease the
-		 * interrupt load to a quarter but also catches the corner
-		 * cases, which needs to be handled.
+		 * With USB3 handling more requests at a higher speed, we can't
+		 * afford to generate an interrupt for every request. Decide to
+		 * interrupt:
+		 *
+		 * - When no more requests are available in the free queue, as
+		 *   this may be our last chance to refill the endpoint's
+		 *   request queue.
+		 *
+		 * - When this is request is the last request for the video
+		 *   buffer, as we want to start sending the next video buffer
+		 *   ASAP in case it doesn't get started already in the next
+		 *   iteration of this loop.
+		 *
+		 * - Four times over the length of the requests queue (as
+		 *   indicated by video->uvc_num_requests), as a trade-off
+		 *   between latency and interrupt load.
 		 */
-		if (list_empty(&video->req_free) ||
-		    buf->state == UVC_BUF_STATE_DONE ||
+		if (list_empty(&video->req_free) || buf_done ||
 		    !(video->req_int_count %
 		       DIV_ROUND_UP(video->uvc_num_requests, 4))) {
 			video->req_int_count = 0;
@@ -441,8 +471,7 @@ static void uvcg_video_pump(struct work_struct *work)

 		/* Endpoint now owns the request */
 		req = NULL;
-		if (buf->state != UVC_BUF_STATE_DONE)
-			video->req_int_count++;
+		video->req_int_count++;
 	}

 	if (!req)
@@ -527,4 +556,3 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
 	return 0;
 }
-
--
2.41.0.rc0.172.g3f132b7071-goog

