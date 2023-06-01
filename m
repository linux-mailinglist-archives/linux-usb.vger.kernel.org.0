Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC62D71F459
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 23:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbjFAVBT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 17:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbjFAVBR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 17:01:17 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DF7195
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 14:01:16 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2565a896d07so666971a91.2
        for <linux-usb@vger.kernel.org>; Thu, 01 Jun 2023 14:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685653275; x=1688245275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpSyEegOIDgvTm5BJOq1NQqDJi5WCAl593tCJQD91kI=;
        b=vDTbQyGgQ7iMgZFEhw6UpVxzScqSeQDWGjeD2IvWHiojO/W7/pzxrzDc97edeXz6vQ
         yEggdC8PbrFWt2NDeUyMFujAfIlVDo4VE3ixE6JG0XmuDexGdvKpZhby3xlDnacGJQm9
         wRJOnOrUhXJzolynS8i4oJ63eWYvtnNgzcK0+Wnt8/lxfMO6TifRaU3o93KoQ1bDYnLR
         QN0w4m8qlViJmOlPSkhz5FMyIAhRpsGnUAA8tnoS9gpdCwccrXK5BGMZAmU2oAzxHJFy
         9WhXQcFsOW7ZIUv5lkkz1nphPKvLjAPl85tLVG/4l3dthLwRSZrM8pJOJEq4A38j037f
         S91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685653275; x=1688245275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpSyEegOIDgvTm5BJOq1NQqDJi5WCAl593tCJQD91kI=;
        b=O0IMErMtkyGYQyWwz7yEOQGkL0kHxFOQDrAF6GQhSSHmP6GAlHY2LuHbgypQMJy4xF
         m48+JmMDDT9k7nGffykv0D5Nd+X7CKJR/KH9ll0nVR8ChQNqsbPN9hELUb9XQDoUMZVJ
         lYz3deP3NL7JShtCH46TahB/k3CV6QkUqgVicnl9sy8Gc8/Sl8C/L7y06VwnUZFEaCzl
         tEA6g75SbXhvvqxNhxioa6gH2SUDCkCft17g4bJS1w6z2hqEI0M+rvodxqeU5mzdA2SN
         5uNtXZS3jEL2XtpdOpBA4rVOSvltR2tilr9QXqx3P7yAJ+k83RRomY6TP66705Nxd88T
         1EUA==
X-Gm-Message-State: AC+VfDxvM48nV7u/OmNMLq/HQDOME2/QtrFz4u6zf3fLyuYGGytaRHxZ
        PTrNo0sloL4gadxj7AfCG7VPGg==
X-Google-Smtp-Source: ACHHUZ5inN14hfxyOz592kHFLjyHSktSLOOrBIEsnXq4dw+3+FPtc5lzU7nJm0U+ypeqSnTVVixOzA==
X-Received: by 2002:a17:90a:1db:b0:256:3491:a256 with SMTP id 27-20020a17090a01db00b002563491a256mr452537pjd.15.1685653275011;
        Thu, 01 Jun 2023 14:01:15 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a154200b0025621aa4c6bsm1911479pja.25.2023.06.01.14.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 14:01:14 -0700 (PDT)
Message-ID: <8741b7cb-54ec-410b-caf5-697f81e8ad64@google.com>
Date:   Thu, 1 Jun 2023 14:01:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com>
 <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
 <20230509002143.7x5zo6bohvn5dyb2@synopsys.com>
 <CAMHf4WLzx3Bj-TR1ZrqsW1tfY+WUtgTt8TVObOFnkNcx2Pc9kw@mail.gmail.com>
 <20230509223526.5e6oqqri3mhwc34l@synopsys.com>
 <20230509224241.vvylagjkqbwo4hbk@synopsys.com>
 <c68249a8-4e22-abd9-5c7c-7e8b7f383898@google.com>
 <9bc19f98-7842-2c9d-5cb3-6c10916731fd@ideasonboard.com>
Content-Language: en-US
From:   Avichal Rakesh <arakesh@google.com>
In-Reply-To: <9bc19f98-7842-2c9d-5cb3-6c10916731fd@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.7 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 6/1/23 07:54, Dan Scally wrote:

>> With no changes, the usb_requests spend ~3ms in flight, and there
>> is one video frame dispatched every ~33ms. Unfortunately (or perhaps
>> fortunately?), it seems like the system latencies add to >8ms of per frame
>> jitter when encoding frames.
> 
> 
> I'm really really impressed with the thoroughness of your investigation here. Can you share how you tracked the frame times and RTTs? I have some devices with a DWC2 controller and I think a MUSB too - I'd be interested in testing those too to see how they compared.
> 

Hey Dan, I appreciate the kind words! Attaching a dirty patch that I used.

Some things to note: 
- It is terribly hacky, apologies in advance (didn't think anyone would
  want to look at it).
- The patch will likely not apply cleanly to ToT, because I am working off an
  older kernel which also had some of my own debug changes before this
  patch. Hopefully it is still useful!
- It uses the time honored technique of dumping debug logs as error logs so 
  be prepared for a lot of log spam :P
- The metrics mess up if the stream configuration changes mid-stream. I just
  restarted the gadget between tests.
- The stats at stream start and end are all over the place, but should stabilize 
  in a hundred frames or so.

Patch follows below
---
 drivers/usb/gadget/function/uvc.h       | 13 +++++
 drivers/usb/gadget/function/uvc_video.c | 67 ++++++++++++++++++++++---
 2 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 40226b1f7e148..2b877ab270536 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -15,6 +15,7 @@
 #include <linux/usb/composite.h>
 #include <linux/videodev2.h>
 #include <linux/wait.h>
+#include <linux/ktime.h>
 
 #include <media/v4l2-device.h>
 #include <media/v4l2-dev.h>
@@ -81,6 +82,7 @@ struct uvc_request {
 	struct sg_table sgt;
 	u8 header[UVCG_REQUEST_HEADER_LEN];
 	struct uvc_buffer *last_buf;
+	ktime_t ts;
 };
 
 struct uvc_video {
@@ -104,6 +106,11 @@ struct uvc_video {
 	unsigned int req_size;
 	struct uvc_request *ureq;
 	struct list_head req_free;
+	ktime_t max_rtt;
+	ktime_t min_rtt;
+	ktime_t mean_rtt;
+	unsigned int num_reqs;
+	unsigned int inflight_reqs;
 	spinlock_t req_lock;
 
 	unsigned int req_int_count;
@@ -117,6 +124,12 @@ struct uvc_video {
 
 	struct uvc_video_queue queue;
 	unsigned int fid;
+
+	ktime_t frame_ts;
+	ktime_t frame_ts_min;
+	ktime_t frame_ts_max;
+	ktime_t frame_ts_mean;
+	unsigned int num_frames;
 };
 
 enum uvc_state {
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 465dd07bf66e7..4aaa8077145d2 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -230,7 +230,8 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
 static int uvcg_video_ep_queue(struct uvc_video *video, struct usb_request *req)
 {
 	int ret;
-
+	struct uvc_request *ureq = req->context;
+	ureq->ts = ktime_get();
 	ret = usb_ep_queue(video->ep, req, GFP_ATOMIC);
 	if (ret < 0) {
 		uvcg_err(&video->uvc->func, "Failed to queue request (%d).\n",
@@ -255,6 +256,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uvc_video_queue *queue = &video->queue;
 	struct uvc_device *uvc = video->uvc;
 	unsigned long flags;
+	ktime_t rtt;
 
 	switch (req->status) {
 	case 0:
@@ -282,6 +284,22 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 		ureq->last_buf = NULL;
 	}
 
+	spin_lock_irqsave(&queue->irqlock, flags);
+	if (!req->length) {
+		video->inflight_reqs--;
+	}
+	rtt = ktime_get();
+	rtt = ktime_sub(rtt, ureq->ts);
+	video->max_rtt = max(video->max_rtt, rtt);
+	video->min_rtt = min(video->min_rtt, rtt);
+	video->num_reqs++;
+	video->mean_rtt = ((video->mean_rtt * (video->num_reqs - 1)) + rtt) / video->num_reqs;
+	printk(KERN_ERR "%s: ARLog: rtt : min/max/mean: "
+			"%lld : %lld/%lld/%lld goLRA", __FUNCTION__, rtt,
+			video->min_rtt, video->max_rtt, video->mean_rtt);
+	// printk(KERN_ERR "%s: ARLog: video->inflight_reqs = %u", __FUNCTION__, video->inflight_reqs);
+	spin_unlock_irqrestore(&queue->irqlock, flags);
+
 	spin_lock_irqsave(&video->req_lock, flags);
 	list_add_tail(&req->list, &video->req_free);
 	spin_unlock_irqrestore(&video->req_lock, flags);
@@ -315,6 +333,10 @@ uvc_video_free_requests(struct uvc_video *video)
 	}
 
 	INIT_LIST_HEAD(&video->req_free);
+	video->max_rtt = 0;
+	video->min_rtt = 2147483647;
+	video->num_reqs = 0;
+	video->inflight_reqs = 0;
 	video->req_size = 0;
 	return 0;
 }
@@ -360,6 +382,10 @@ uvc_video_alloc_requests(struct uvc_video *video)
 	}
 
 	video->req_size = req_size;
+	video->max_rtt = 0;
+	video->min_rtt = 2147483647;
+	video->inflight_reqs = 0;
+	video->num_reqs = 0;
 
 	return 0;
 
@@ -389,6 +415,11 @@ static void uvcg_video_pump(struct work_struct *work)
 	bool buf_int;
 	/* video->max_payload_size is only set when using bulk transfer */
 	bool is_bulk = video->max_payload_size;
+	unsigned int tmp = 0;
+	unsigned int *req_ctr;
+	// unsigned int target_empty_reqs = video->uvc_num_requests + 2;
+	unsigned int num_sampled_frames;
+	ktime_t frame_ts;
 
 	while (video->ep->enabled) {
 		/*
@@ -416,14 +447,31 @@ static void uvcg_video_pump(struct work_struct *work)
 			video->encode(req, video, buf);
 			/* Always interrupt for the last request of a video buffer */
 			buf_int = buf->state == UVC_BUF_STATE_DONE;
+
+			if (buf->state == UVC_BUF_STATE_DONE) {
+				frame_ts = video->frame_ts;
+				video->frame_ts = ktime_get();
+				frame_ts = ktime_sub(video->frame_ts, frame_ts);
+				if (video->num_frames >= 100) {
+					num_sampled_frames = video->num_frames - 100;
+					video->frame_ts_min = min(video->frame_ts_min, frame_ts);
+					video->frame_ts_max = max(video->frame_ts_max, frame_ts);
+					video->frame_ts_mean = ((video->frame_ts_mean * num_sampled_frames) + frame_ts) / (num_sampled_frames + 1);
+					printk(KERN_ERR "%s: ARLog: frame encode time: curr: min/max/mean: %lld : %lld/%lld/%lld", __FUNCTION__, frame_ts, video->frame_ts_min, video->frame_ts_max, video->frame_ts_mean);
+				}
+				video->num_frames++;
+			}
+			req_ctr = &tmp;
 		} else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) && !is_bulk) {
 			/*
-			 * No video buffer available; the queue is still connected and
-			 * we're traferring over ISOC. Send a 0 length request to
-			 * prevent missed ISOC transfers.
-			 */
+			* No video buffer available; the queue is still connected and
+			* we're traferring over ISOC. Send a 0 length request to
+			* prevent missed ISOC transfers.
+			*/
 			req->length = 0;
-			buf_int = false;
+			// Double the interrupt frequency for empty requests.
+			buf_int = !(video->req_int_count % DIV_ROUND_UP(video->uvc_num_requests, 8));
+			req_ctr = &video->inflight_reqs;
 		} else {
 			/*
 			 * Either queue has been disconnected or no video buffer
@@ -449,7 +497,11 @@ static void uvcg_video_pump(struct work_struct *work)
 		}
 
 		/* Queue the USB request */
+
 		ret = uvcg_video_ep_queue(video, req);
+		if (ret == 0) {
+			(*req_ctr)++;
+		}
 		spin_unlock_irqrestore(&queue->irqlock, flags);
 
 		if (ret < 0) {
@@ -512,6 +564,9 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
 
 	video->req_int_count = 0;
+	video->frame_ts_min = 9720988367;
+	video->frame_ts_max = 0;
+	video->frame_ts_mean = 0;
 
 	queue_work(video->async_wq, &video->pump);
 
-- 
