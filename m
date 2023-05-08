Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B176FBB4C
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 01:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbjEHXLK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 19:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233900AbjEHXLJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 19:11:09 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F1E49FE
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 16:11:08 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-b9a6f15287eso37394149276.1
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 16:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683587467; x=1686179467;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+KHbWW8aLhrRbwJSnBa+NaTRCZqDMugAVxqQ48a5vrA=;
        b=CkjnqpvoEfZTwHBSM/0dyupsDIBPF7IPLz0ISI7PYOrxbb5YGCHqcS8N0v1ZYLos5s
         ZtWoMSyGyNck58xxb4MlM7D9oeMpY0FMBEc1BB4KSMsLYewZ4bdbEkD4livoTWc5PyMn
         O6B6HPkIRROawPcob38VSK47JQ4hFYCRXn3/HKfzTm2sErrjX47RdPpxKRFPiEamuWVj
         dY0PNzDtDuNp4y+ZdO9x1a1jm8PI7Jl4Z50tbqGybTBauo0Ds/fKCExzX4fsh1G9Ky3M
         zud9d1MI+NzDEjmYLQsAx7fV9bJWoybJ0h2w+RKsLj2WC3dKJRNmET+kWSdQCNy3pj45
         NCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683587467; x=1686179467;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KHbWW8aLhrRbwJSnBa+NaTRCZqDMugAVxqQ48a5vrA=;
        b=j8gkYjRgMU31OgNYRPnOo168obrbzMmAHXL1aEIz3msikBP1r+MB+AjUP00gEZ/wxk
         /jVv3OSg4y3Xh9IXbnPhs9KTePY0LHVvOdM/ybDm8zh0LYWlpZ3EgtnLZND/PxQ0itlQ
         zlO7LHGmixYQOevIjyb0TxBRKyhO/jLe4POmuQ2fynyEsfoVU7duBQxhZBgkBdWWutoN
         NcizGm9oxyIztEFq0Ox1RJWJOmsvZTDsHJ0h2qZkDja1v/ervnrjWxoa6mgGBq5bi3JO
         dr6oq5wEp2G1l9iah9vszRpYxLWMS8gB9l7DIAamCLKwyjQYoddu0unIpXTYKjP57539
         wt0w==
X-Gm-Message-State: AC+VfDwE1ONTrazR7Yz9RlW12W+5129B41Ctc6p3GB5Wrve+hhvKyIHn
        xFNiXm7iz8YWq18csXVR8WCYTc4OBBfQ
X-Google-Smtp-Source: ACHHUZ4B/vPacOTqfRbMpnEhblMLe1lmO3gLnmtHCUmQOhnTl/8VZr5qPYV7FXFR46siNgB15sSf8X+ChjYg
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a25:1283:0:b0:b9a:672d:23c9 with SMTP id
 125-20020a251283000000b00b9a672d23c9mr7400472ybs.0.1683587467239; Mon, 08 May
 2023 16:11:07 -0700 (PDT)
Date:   Mon,  8 May 2023 16:11:03 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230508231103.1621375-1-arakesh@google.com>
Subject: [PATCH] usb: gadget: uvc: queue empty isoc requests if no video
 buffer is available
From:   Avichal Rakesh <arakesh@google.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avichal Rakesh <arakesh@google.com>
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
transfers (EXDEV). The application layer may or may not produce video
frames to match this expectation, so uvc gadget driver must handle cases
where the application is not queuing up buffers fast enough to fulfill
ISOC requirements.

Currently, uvc gadget driver waits for new video buffer to become available
before queuing up usb requests. With this patch the gadget driver queues up
0 length usb requests whenever there are no video buffers available. The
USB controller's complete callback is used as the limiter for how quickly
the 0 length packets will be queued. Video buffers are still queued as
soon as they become available.

Link: https://lore.kernel.org/CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com/
Signed-off-by: Avichal Rakesh <arakesh@google.com>
---
 drivers/usb/gadget/function/uvc_video.c | 32 ++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index dd1c6b2ca7c6..e81865978299 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -386,6 +386,9 @@ static void uvcg_video_pump(struct work_struct *work)
 	struct uvc_buffer *buf;
 	unsigned long flags;
 	int ret;
+	bool buf_int;
+	/* video->max_payload_size is only set when using bulk transfer */
+	bool is_bulk = video->max_payload_size;
 
 	while (video->ep->enabled) {
 		/*
@@ -408,20 +411,35 @@ static void uvcg_video_pump(struct work_struct *work)
 		 */
 		spin_lock_irqsave(&queue->irqlock, flags);
 		buf = uvcg_queue_head(queue);
-		if (buf == NULL) {
+
+		if (buf != NULL) {
+			video->encode(req, video, buf);
+			/* Always interrupt for the last request of a video buffer */
+			buf_int = buf->state == UVC_BUF_STATE_DONE;
+		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) && !is_bulk) {
+			/*
+			 * No video buffer available; the queue is still connected and
+			 * we're traferring over ISOC. Queue a 0 length request to
+			 * prevent missed ISOC transfers.
+			 */
+			req->length = 0;
+			buf_int = false;
+		} else {
+			/*
+			 * Either queue has been disconnected or no video buffer
+			 * available to bulk transfer. Either way, stop processing
+			 * further.
+			 */
 			spin_unlock_irqrestore(&queue->irqlock, flags);
 			break;
 		}
 
-		video->encode(req, video, buf);
-
 		/*
 		 * With usb3 we have more requests. This will decrease the
 		 * interrupt load to a quarter but also catches the corner
 		 * cases, which needs to be handled.
 		 */
-		if (list_empty(&video->req_free) ||
-		    buf->state == UVC_BUF_STATE_DONE ||
+		if (list_empty(&video->req_free) || buf_int ||
 		    !(video->req_int_count %
 		       DIV_ROUND_UP(video->uvc_num_requests, 4))) {
 			video->req_int_count = 0;
@@ -441,8 +459,7 @@ static void uvcg_video_pump(struct work_struct *work)
 
 		/* Endpoint now owns the request */
 		req = NULL;
-		if (buf->state != UVC_BUF_STATE_DONE)
-			video->req_int_count++;
+		video->req_int_count++;
 	}
 
 	if (!req)
@@ -527,4 +544,3 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
 	return 0;
 }
-
-- 
2.40.1.521.gf1e218fcd8-goog

