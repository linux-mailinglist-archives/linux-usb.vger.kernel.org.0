Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84FF16F8C78
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 00:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbjEEWjw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 18:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233526AbjEEWjo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 18:39:44 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B15A527E
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 15:39:43 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64359d9c531so1820405b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 05 May 2023 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683326382; x=1685918382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yfyg7pnL5oKpnCMqwEJ+1cV5XtpRYqdR+KixxDAJqbU=;
        b=6GXrzMRKwex+03KOaUM0oNjKoX2fLa8ptMR+bV2z0JLoMhD0djWOhDIPnq2y18U9OF
         XjBUcxgAdOLt+fNTXiEdXWc45o3Ri7FDSgOxh+YPJKN98pOTK8DwY/IJ6YPfMq/d0AxV
         b5BhredzRTakwoacWloDmMQLcNBgDo0+Fw3L1IBe0RtarxLvUPk/0NH18E0i50SSFQIw
         rfiqmmBL4qiuaklWNbBrjxTA/kz5tsvjAzunX8JtCabFeS915oDUkiZHwcT20Yfx4kKx
         41GM/b2bh+sgtGv6/Z9NlfhNJKGqyfMky+48wHzVDWWLiStQJy66N/Bblqtx9HO8HO5v
         wS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683326382; x=1685918382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfyg7pnL5oKpnCMqwEJ+1cV5XtpRYqdR+KixxDAJqbU=;
        b=l5eesGKNm1yNBZWxETbRLDA3CD+FFcb3VUDpyj9TCkZLvk95jUaLv8lhMdzut1q8qE
         t5RSv6YQXojzO01IeCBvftRZLqKGCQiWzEF5KPnBp3Rcsa8Ma9QRP322hlaEQHQSINwQ
         fx10fCsPS2BGlSDkTGDrqd5I3fEfGy1Eu7YOFnf+C5ABd1eq4YRJS4lTCAA7Y5M1jSEI
         v8Ub7jlJK6lNlKJ3Mr/D/5mE1STMhvlDIcB+0MEq+YRwvbB2ooC4EsFFkOD8adUmOmLC
         ME0Q2cf/uPLZrMx2G8QQrG6y4HVDkKD2f0+Id1sdT56RX9EyxV2zDLSndRhMgrG9agux
         trZg==
X-Gm-Message-State: AC+VfDym9e7PZtX5OUrJjMcouvij+E2eUDnwojDUV5LLMLXZeOVoaD82
        X7nNtXU9DgpO9wPIuFXpJMbM6g==
X-Google-Smtp-Source: ACHHUZ5CLKDYSHFkqJ6Af2zJ0XJfIY89/9yECz78Y+DOCAE/hkV+6qRlMzNY61Dd5wmPqys/8H5/bA==
X-Received: by 2002:a17:902:ec87:b0:19f:87b5:1873 with SMTP id x7-20020a170902ec8700b0019f87b51873mr3802436plg.62.1683326382298;
        Fri, 05 May 2023 15:39:42 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id g8-20020a170902934800b001ab12545508sm2256047plp.67.2023.05.05.15.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 15:39:41 -0700 (PDT)
Message-ID: <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
Date:   Fri, 5 May 2023 15:39:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
To:     "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Avichal Rakesh <arakesh@google.com>
In-Reply-To: <20230420172011.GF21943@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-21.9 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 4/20/23 10:20, Laurent Pinchart wrote:
> 
> As far as I understand, we have two ways forward here to avoid running
> out of requests to send: sending data as quickly as possible (maximizing
> the number of bytes sent in each packet) and filling up with 0-length
> requests in-between, and spreading the data across packets. I'll call
> the first one burst mode for lack of a better term.
> 

Hey all,

Apologies for the late reply. My not-so-long work took longer than expected.
I tried the 2 (technically 3, but I'll go over it in a bit) approaches we had
discussed above and the "burst" approach works pretty well. I'll attach that
to this email, and send another email out with the other patch.

The first thing I tried was to split one video frame over 266 frames, without
changing the number of requests allocated. And it works! However, as Laurent
mentioned, it does add a fair amount of bookkeeping to split a video frame into
the required number of requests. I also hardcoded the number 266 from our
discussion, but I am not sure how to figure out that number dynamically. 266
also didn't work if the host started sending frames at more than 30fps :/, so
our dynamic calculation would need to take camera's real output fps into
account, which as far as I can tell is not known to the UVC driver.

With those issues I tried what Laurent called the "burst" approach
(attached below), i.e. send the video frames in as few packets as possible,
and then queue up 0 length packets to keep the ISOC queue happy. This approach
works perfectly as far as I can tell. Locally I tried with a Linux, Window,
and MacOS host with no frame drops or ISOC failures on any of them!

In the current patch, UVC gadget driver keeps the ISOC cadence by effectively
maintaining a back-pressure on the USB controller (at least to the best of its
capabilities). Any usb_request available to the UVC gadget gets immediately
queued back to the USB controller. If a video frame is available, the frame is
encoded, if not, the length is set to 0. The idea being that the host's polling
and the controller's 'complete' callback will result in a somewhat consistent
cadence for the uvc driver after the initial burst of packets.

However this does mean that at worst, the new video frames are up to 63
usb_requests behind, but assuming a 125us per usb_request, that amounts to ~8ms
latency at the worst, which seems acceptable?

Another concern I had was about how the back-pressure might affect other USB
controllers. DWC3 doesn't seem to be sweating and in local testing I saw no
EXDEVs or frame drops other than when the stream was being transitioned from
one configuration to another, but I don't know how this interaction might go for
other USB controllers. Would you have any insights into non-DWC3 controllers,
and if they might be negatively affected by having up to 64 requests queued at 
once?

Here's the patch, it doesn't currently handle bulk transfers, but I can upload a
formal patch with it if this approach seems acceptable!

---
 drivers/usb/gadget/function/uvc_video.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index dd1c6b2ca7c6..d7ad278709d4 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -386,6 +386,7 @@ static void uvcg_video_pump(struct work_struct *work)
 	struct uvc_buffer *buf;
 	unsigned long flags;
 	int ret;
+	bool buf_int;

 	while (video->ep->enabled) {
 		/*
@@ -408,20 +409,29 @@ static void uvcg_video_pump(struct work_struct *work)
 		 */
 		spin_lock_irqsave(&queue->irqlock, flags);
 		buf = uvcg_queue_head(queue);
-		if (buf == NULL) {
+
+		if (buf != NULL) {
+			// Encode video frame if we have one.
+			video->encode(req, video, buf);
+			// Always interrupt for the last usb_request of a video frame
+			buf_int = buf->state == UVC_BUF_STATE_DONE;
+		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED)) {
+			// No video frame, but the queue is still connected
+			// Send an empty USB request to keep ISOC contract...
+			req->length = 0;
+			buf_int = false;
+		} else {
+			// queue no longer connected. Stop processing further.
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
@@ -441,8 +451,7 @@ static void uvcg_video_pump(struct work_struct *work)

 		/* Endpoint now owns the request */
 		req = NULL;
-		if (buf->state != UVC_BUF_STATE_DONE)
-			video->req_int_count++;
+		video->req_int_count++;
 	}

 	if (!req)
@@ -527,4 +536,3 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
 	return 0;
 }
-
--

