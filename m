Return-Path: <linux-usb+bounces-2086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF697D3EB8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 20:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6B1B2815D1
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 18:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F152136A;
	Mon, 23 Oct 2023 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PjB50tIY"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D71BDFE
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 18:13:08 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBA39D
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 11:13:06 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-27d1aee5aa1so2594843a91.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698084786; x=1698689586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyR06kmSOvyp16JipQI1Y3Q+81kFnPqYM3CkWnYWKlM=;
        b=PjB50tIYf60sQ7wrXiaxydYT/DLTZMtBf5GAgu/cV2tqvk8dJ4aU878QphDC6Y2Bgd
         G1nOvDieC0meC0SYn6OjCDHDhYOrrMkibF3JbB3Ccjo6WQnxN728M8Ch3Je0oy4Uxbuk
         XZ1CWBRJIEVd8RFxumPHTCo2FXFAjlA/rcJsMEo+agT7RlMXKx6AO2kfuiZkUFG29MDc
         66nTB9SRVaDXCVoglDURg4A6StTXit9T1BR04gVG6ea/leVh4edfrpoXhpkAVeuFp1Hs
         pL1WrR9Kntb9AA91EnF/YSI5Z/imuTnU315Rllq4cguETYZ8mGdTMqTjGErc8/x9dAjr
         /DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698084786; x=1698689586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyR06kmSOvyp16JipQI1Y3Q+81kFnPqYM3CkWnYWKlM=;
        b=w6AYZ0tJ982LW2k8wB0Dju1PNkzjS5kkqDBTQJ6xt2rg66gXAEfmIuDLLxF7LcN8r3
         sEX+5mW8dshd4+5kdZLEIbo19M7T27C9tIAlgz3plpjPJy7YY1o7XdZ42eyZvSZcYJ1d
         6NJlZVTJyN4fphUQADoBygLEkSh2WiIf9rHRhOIn1rAQtE66NnqaEBg8tpl7NVP8RF8j
         i2bBc7kJFHlJeDQSFMnQMba8zaEAhLzcLHPfeGZZOFisXFA6J7PAB4NQhazM4aLWBVHJ
         L6caa5Kx+/k9IswLU8a8HAwhEq7AAuVLlYDYxpCXNHdcENbnDivcwvvigLoQVKtGobXc
         B7Zg==
X-Gm-Message-State: AOJu0Yx1vrNHGtmAco4kgLlWcRkm9dyKNsbPVxiPisjxCuYh2vUQbbMe
	XiU36ZDb8n9xBdIX1NDt4Cwmcw==
X-Google-Smtp-Source: AGHT+IGnNLGXNBRGtY9F0s5gO+pe7XXXQtcc/AVW7bqVqe/eVeMPbYXjMhUMZFOYmt98+Pt0+SmAWw==
X-Received: by 2002:a17:90a:ff11:b0:27d:3c62:6342 with SMTP id ce17-20020a17090aff1100b0027d3c626342mr13099308pjb.4.1698084785590;
        Mon, 23 Oct 2023 11:13:05 -0700 (PDT)
Received: from ?IPV6:2601:645:8100:1350:8800:4c7f:d309:abbb? ([2601:645:8100:1350:8800:4c7f:d309:abbb])
        by smtp.gmail.com with ESMTPSA id s12-20020a170902988c00b001c73fb506aesm6140465plp.128.2023.10.23.11.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 11:13:05 -0700 (PDT)
Message-ID: <69609645-fa20-4987-981d-1ab264e80b9b@google.com>
Date: Mon, 23 Oct 2023 11:13:03 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Michael Grzeschik <mgr@pengutronix.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "etalvala@google.com" <etalvala@google.com>,
 "arakesh@google.com" <arakesh@google.com>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
 <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
 <20231020233044.dh63nu3tkbmrtfl4@synopsys.com>
Content-Language: en-US
From: Jayant Chowdhary <jchowdhary@google.com>
In-Reply-To: <20231020233044.dh63nu3tkbmrtfl4@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thinh, Michael,

On 10/20/23 16:30, Thinh Nguyen wrote:
> Sorry for the delay response.
>
> On Sun, Oct 15, 2023, Jayant Chowdhary wrote:
>> On 10/12/23 11:50, Thinh Nguyen wrote:
>>> The frequency of the request submission should not depend on the
>>> video_pump() work thread since it can vary. The frequency of request
>>> submission should match with the request completion. We know that
>>> request completion rate should be fixed (1 uframe/request + when you
>>> don't set no_interrupt). Base on this you can do your calculation on how
>>> often you should set no_interrupt and how many requests you must submit.
>>> You don't have to wait for the video_pump() to submit 0-length requests.
>>>
>>> The only variable here is the completion handler delay or system
>>> latency, which should not be much and should be within your calculation.
>>
>> Thanks for the suggestion. It indeed makes sense that we do not completely depend on
>> video_pump() for sending 0 length requests. I was concerned about
>> synchronization needed when we send requests to the dwc3 controller from
>> different threads. I see that the dwc3 controller code does internally serialize
>> queueing requests, can we expect this from other controllers as well ? 
> While it's not explicitly documented, when the gadget driver uses
> usb_ep_queue(), the order in which the gadget recieves the request
> should be maintained and serialized. Because the order the transfer go
> out for the same endpoint can be critical, breaking this will cause
> issue.
>
Thanks for clarifying this. Keeping this in mind - I made a slight modification to
your test patch - I removed the uvc_video_pump() function call from uvc_v4l2_qbuf(). We just
call it in uvcg_video_enable(). That should just queue 0 length requests till the first qbuf
is called. There-after only the complete handler running uvcg_video_complete() calls video_pump(),
which sends usb requests to the endpoint. While I do see that we hold the queue->irqlock while
getting the uvc buffer to encode and sending it to the ep, I feel like its just logically safer
for future changes if we can restrict the pumping of requests to one thread.

Does that seem okay to you ? I can formalize it if it does.  

The patch would look something like (on top of: https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t)

---
 drivers/usb/gadget/function/f_uvc.c     |  4 ----
 drivers/usb/gadget/function/uvc.h       |  3 ---
 drivers/usb/gadget/function/uvc_v4l2.c  |  3 ---
 drivers/usb/gadget/function/uvc_video.c | 19 +++++++------------
 4 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 44c36e40e943..7d78fc8c00c5 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -907,14 +907,10 @@ static void uvc_function_unbind(struct usb_configuration *c,
 {
 	struct usb_composite_dev *cdev = c->cdev;
 	struct uvc_device *uvc = to_uvc(f);
-	struct uvc_video *video = &uvc->video;
 	long wait_ret = 1;
 
 	uvcg_info(f, "%s()\n", __func__);
 
-	if (video->async_wq)
-		destroy_workqueue(video->async_wq);
-
 	/*
 	 * If we know we're connected via v4l2, then there should be a cleanup
 	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index e8d4c87f1e09..b33211c92c02 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -88,9 +88,6 @@ struct uvc_video {
 	struct uvc_device *uvc;
 	struct usb_ep *ep;
 
-	struct work_struct pump;
-	struct workqueue_struct *async_wq;
-
 	/* Frame parameters */
 	u8 bpp;
 	u32 fcc;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 68bb18bdef81..ef4305f79cfe 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -421,9 +421,6 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 	if (ret < 0)
 		return ret;
 
-	if (uvc->state == UVC_STATE_STREAMING)
-		queue_work(video->async_wq, &video->pump);
-
 	return ret;
 }
 
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 54a1c36e879e..35fb6a185b6e 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -24,6 +24,8 @@
  * Video codecs
  */
 
+static void uvcg_video_pump(struct uvc_video *video);
+
 static int
 uvc_video_encode_header(struct uvc_video *video, struct uvc_buffer *buf,
 		u8 *data, int len)
@@ -329,7 +331,9 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	 */
 	if (video->is_enabled) {
 		list_add_tail(&req->list, &video->req_free);
-		queue_work(video->async_wq, &video->pump);
+		spin_unlock_irqrestore(&video->req_lock, flags);
+		uvcg_video_pump(video);
+		return;
 	} else {
 		uvc_video_free_request(ureq, ep);
 	}
@@ -415,9 +419,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
  * This function fills the available USB requests (listed in req_free) with
  * video data from the queued buffers.
  */
-static void uvcg_video_pump(struct work_struct *work)
+static void uvcg_video_pump(struct uvc_video *video)
 {
-	struct uvc_video *video = container_of(work, struct uvc_video, pump);
 	struct uvc_video_queue *queue = &video->queue;
 	struct usb_request *req = NULL;
 	struct uvc_buffer *buf;
@@ -545,7 +548,6 @@ uvcg_video_disable(struct uvc_video *video)
 	}
 	spin_unlock_irqrestore(&video->req_lock, flags);
 
-	cancel_work_sync(&video->pump);
 	uvcg_queue_cancel(&video->queue, 0);
 
 	spin_lock_irqsave(&video->req_lock, flags);
@@ -621,8 +623,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 
 	video->req_int_count = 0;
 
-	queue_work(video->async_wq, &video->pump);
-
+	uvcg_video_pump(video);
 	return ret;
 }
 
@@ -635,12 +636,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	INIT_LIST_HEAD(&video->ureqs);
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
-	INIT_WORK(&video->pump, uvcg_video_pump);
-
-	/* Allocate a work queue for asynchronous video pump handler. */
-	video->async_wq = alloc_workqueue("uvcgadget", WQ_UNBOUND | WQ_HIGHPRI, 0);
-	if (!video->async_wq)
-		return -EINVAL;
 
 	video->uvc = uvc;
 	video->fcc = V4L2_PIX_FMT_YUYV;
-- 

>> This brings me to another question for Michael - I see
>> that we introduced a worker thread for pumping  usb requests to the usb endpoint
>> in https://urldefense.com/v3/__https://lore.kernel.org/all/20200427151614.10868-1-m.grzeschik@pengutronix.de/__;!!A4F2R9G_pg!aAnzCopbTbZtUxBK6a6r6_QzV-b2Z2J5o5esPaartZ2jogKijmhqj6OyiKDg-BPhxq8pJHR3HS1Hf8z6YnqfWTon$ 
>> (I see multiple email addresses, so apologies if I used the incorrect one).
>>
>> Did we introduce the worker thread to solve some specific deadlock scenarios ?
>> Or was it a general mitigation against racy usb request submission from v4l2 buffer
>> queuing, stream enable and the video complete handler firing ?
>>
>> I was chatting with Avi about this, what if we submit requests to the endpoint
>> only at two points in the streaming lifecycle - 
>> 1) The whole 64 (or however many usb requests are allocated) when
>>    uvcg_video_enable() is called - with 0 length usb_requests.
>> 2) In the video complete handler - if a video buffer is available, we encode it
>>    and submit it to the endpoint. If not, we send a 0 length request.
>>
>> This way we're really maintaining back pressure and sending requests as soon
>> as we can to the dwc3 controller. Encoding is mostly memcpys from what I see
>> so hopefully not too heavy on the interrupt handler. I will work on prototyping
>> this meanwhile.
>>
> That sounds good to me. I believe Michael already provided some test
> patches and you've already done some preliminary tests for that right?

Yes that is correct. I tested out the patch above as well and it seems to
work for my setup. I haven't seen flickers in over an hour of streaming.

Thanks,
Jayant



