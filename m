Return-Path: <linux-usb+bounces-1877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1537CEA39
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 23:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E47C1C20D67
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 21:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6503FB20;
	Wed, 18 Oct 2023 21:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YKmwnRKR"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51FC4293F
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 21:50:15 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7375125
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 14:50:11 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5aed4f0e90bso3526989a12.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 14:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697665811; x=1698270611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJ+7th/RasaAq7ED1jtRbeuk5UXgtlcs+RQgrXXgclI=;
        b=YKmwnRKRIWX+/oO2cxghSxmDC+qGe7b8BP5UZA/atMtlTATWntEd1qKjKc+BaKT4Z/
         CS9kEhpgFYk2C/wNAxlqPRcqBBgGpT6/1wJ7GBNEyVxgie79xnqTQQcC8qut1Fo5mjeS
         5ZXX9KzHu43bOrTt6L/blIE27w3q/FmbraDn/ejn4TXkB7vKGreqW1VnMbvpfEYQPyy7
         zLP0gF1th/GJzXl9s0KtFTWvxs2YEbFt30YeU44G4vMDjyn84pFUG8z5RYfooFN6ZV8e
         OaiL00q/fARzcC9s0YetPt2WjfGSIuQ3bQdscr9m2b/K3834ux31BV9Jyr+P2VbpmKHE
         blSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697665811; x=1698270611;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ+7th/RasaAq7ED1jtRbeuk5UXgtlcs+RQgrXXgclI=;
        b=nljWd9QGmaDP0FiwXwGZWlTa2WeRdKxN2P7L1l34WFf/LGF85yKLkzX3e86XkUZ+Uj
         lLb2mBo0G0OsxxP9jvZBbAKalgYhJeVNC+QOzr85P798YT091cFc/2Fb8LU1tiOQ+wu0
         0SE1xQe4GpLu9Na/IR7IZu576EGh4I1q6bmdya25iUlZXMe6/bmbvmiA3/r0LQ+oSGg+
         NIuzXotf8Bwu0U2mSlntkAAQtyrc+lgTcZrjwv3zLD+Kc/H8d0axFNp9AjMLXvTnpUNU
         1ZYsKGnZwwmk0Y6ShOH4kLoRBePRqXpfrAhqeDA5fU98qBkui/brHV3MwEiSQJYgbWnQ
         4aPg==
X-Gm-Message-State: AOJu0YxMh7Y8YS4Md9Poj6/J3wYVcDFtE6qFTZxtgvsiFu6AIjOxnNvG
	2gJF0oWSspojimIREmIYa/Kihg==
X-Google-Smtp-Source: AGHT+IHCQep4L6E5jgmIUIX67olfcUaehC1uL5hnxpDkM5Xf8MNVWNNxUQ89CeqoDOrbx0ncHYEIJQ==
X-Received: by 2002:a17:90b:2b4d:b0:27d:375a:e322 with SMTP id rr13-20020a17090b2b4d00b0027d375ae322mr374446pjb.31.1697665810791;
        Wed, 18 Oct 2023 14:50:10 -0700 (PDT)
Received: from [192.168.60.239] (213.126.145.34.bc.googleusercontent.com. [34.145.126.213])
        by smtp.gmail.com with ESMTPSA id 7-20020a17090a1a0700b0027d04d05d77sm434735pjk.8.2023.10.18.14.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 14:50:10 -0700 (PDT)
Message-ID: <f45e7eab-4d49-41bb-b515-dd036f40a8d8@google.com>
Date: Wed, 18 Oct 2023 14:50:08 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] usb: gadget: uvc: Fix use-after-free for inflight
 usb_requests
Content-Language: en-US
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 etalvala@google.com, gregkh@linuxfoundation.org, jchowdhary@google.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230930184821.310143-1-arakesh@google.com>
 <20231012002451.254737-1-arakesh@google.com>
 <20231012002451.254737-3-arakesh@google.com>
 <ZS/ZL8RMix7zppcP@pengutronix.de>
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZS/ZL8RMix7zppcP@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/18/23 06:10, Michael Grzeschik wrote:
> On Wed, Oct 11, 2023 at 05:24:51PM -0700, Avichal Rakesh wrote:
>> Currently, the uvc gadget driver allocates all uvc_requests as one array
>> and deallocates them all when the video stream stops. This includes
>> de-allocating all the usb_requests associated with those uvc_requests.
>> This can lead to use-after-free issues if any of those de-allocated
>> usb_requests were still owned by the usb controller.
>>
>> This is patch 2 of 2 in fixing the use-after-free issue. It adds a new
>> flag to uvc_video to track when frames and requests should be flowing.
>> When disabling the video stream, the flag is tripped and, instead
>> of de-allocating all uvc_requests and usb_requests, the gadget
>> driver only de-allocates those usb_requests that are currently
>> owned by it (as present in req_free). Other usb_requests are left
>> untouched until their completion handler is called which takes care
>> of freeing the usb_request and its corresponding uvc_request.
>>
>> Now that uvc_video does not depends on uvc->state, this patch removes
>> unnecessary upates to uvc->state that were made to accomodate uvc_video
>> logic. This should ensure that uvc gadget driver never accidentally
>> de-allocates a usb_request that it doesn't own.
>>
>> Link: https://lore.kernel.org/7cd81649-2795-45b6-8c10-b7df1055020d@google.com
>> Suggested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> Signed-off-by: Avichal Rakesh <arakesh@google.com>
>> ---
>> v1 -> v2: Rebased to ToT, and fixed deadlock reported in
>>          https://lore.kernel.org/all/ZRv2UnKztgyqk2pt@pengutronix.de/
>> v2 -> v3: Fix email threading goof-up
>> v3 -> v4: re-rebase to ToT & moved to a uvc_video level lock
>>          as discussed in
>>          https://lore.kernel.org/b14b296f-2e08-4edf-aeea-1c5b621e2d0c@google.com/
> 
> I tested this and I no longer saw any use after free
> errors anymore! :)

Yay! Glad to hear!

> 
> Here comes some more review:
> 
>> drivers/usb/gadget/function/uvc.h       |   1 +
>> drivers/usb/gadget/function/uvc_v4l2.c  |  12 +-
>> drivers/usb/gadget/function/uvc_video.c | 156 +++++++++++++++++++-----
>> 3 files changed, 128 insertions(+), 41 deletions(-)
>>

>> +
>> +/*
>> + * Disable video stream
>> + */
>> +static int
>> +uvcg_video_disable(struct uvc_video *video) {
>> +    unsigned long flags;
>> +    struct list_head inflight_bufs;
>> +    struct usb_request *req, *temp;
>> +    struct uvc_buffer *buf, *btemp;
>> +    struct uvc_request *ureq, *utemp;
>> +
>> +    INIT_LIST_HEAD(&inflight_bufs);
>> +    spin_lock_irqsave(&video->req_lock, flags);
>> +    video->is_enabled = false;
>> +
>> +    /*
>> +     * Remove any in-flight buffers from the uvc_requests
>> +     * because we want to return them before cancelling the
>> +     * queue. This ensures that we aren't stuck waiting for
>> +     * all complete callbacks to come through before disabling
>> +     * vb2 queue.
>> +     */
>> +    list_for_each_entry(ureq, &video->ureqs, list) {
>> +        if (ureq->last_buf) {
>> +            list_add_tail(&ureq->last_buf->queue, &inflight_bufs);
>> +            ureq->last_buf = NULL;
>> +        }
>> +    }
>>     spin_unlock_irqrestore(&video->req_lock, flags);
>> -    return;
>> +
>> +    cancel_work_sync(&video->pump);
>> +    uvcg_queue_cancel(&video->queue, 0);
>> +
>> +    spin_lock_irqsave(&video->req_lock, flags);
>> +    /*
>> +     * Remove all uvc_reqeusts from from ureqs with list_del_init
>> +     * This lets uvc_video_free_request correctly identify
>> +     * if the uvc_request is attached to a list or not when freeing
>> +     * memory.
>> +     */
>> +    list_for_each_entry_safe(ureq, utemp, &video->ureqs, list)
>> +        list_del_init(&ureq->list);
>> +
>> +    list_for_each_entry_safe(req, temp, &video->req_free, list) {
>> +        list_del(&req->list);
>> +        uvc_video_free_request(req->context, video->ep);
>> +    }
>> +
>> +    INIT_LIST_HEAD(&video->ureqs);
>> +    INIT_LIST_HEAD(&video->req_free);
>> +    video->req_size = 0;
>> +    spin_unlock_irqrestore(&video->req_lock, flags);
>> +
>> +    /*
>> +     * Return all the video buffers before disabling the queue.
>> +     */
>> +    spin_lock_irqsave(&video->queue.irqlock, flags);
>> +    list_for_each_entry_safe(buf, btemp, &inflight_bufs, queue) {
>> +        list_del(&buf->queue);
>> +        uvcg_complete_buffer(&video->queue, buf);
>> +    }
>> +    spin_unlock_irqrestore(&video->queue.irqlock, flags);
>> +
>> +    uvcg_queue_enable(&video->queue, 0);
>> +    return 0;
>> }
>>
>> /*
>> @@ -497,28 +596,22 @@ static void uvcg_video_pump(struct work_struct *work)
>> int uvcg_video_enable(struct uvc_video *video, int enable)
>> {
>>     int ret;
>> -    struct uvc_request *ureq;
>>
>>     if (video->ep == NULL) {
>>         uvcg_info(&video->uvc->func,
>>               "Video enable failed, device is uninitialized.\n");
>>         return -ENODEV;
>>     }
>> -
>> -    if (!enable) {
>> -        cancel_work_sync(&video->pump);
>> -        uvcg_queue_cancel(&video->queue, 0);
>> -
>> -        list_for_each_entry(ureq, &video->ureqs, list) {
>> -            if (ureq->req)
>> -                usb_ep_dequeue(video->ep, ureq->req);
>> -        }
>> -
>> -        uvc_video_free_requests(video);
>> -        uvcg_queue_enable(&video->queue, 0);
>> -        return 0;
>> -    }
>> -
>> +    if (!enable)
>> +        return uvcg_video_disable(video);
> 
> Could you refactor this code as it is to an separate
> function and prepand this change as an extra patch
> to this one? It would make the changes in the functions
> more obvious and better to review.

Sure I can send a follow up patch, but I am curious why you think this 
needs to be a separate function? Refactoring into a function would 
have the functions structured something like:

uvcg_video_disable(video) {
    // ...
    // disable impl
    // ...
}

uvcg_video_enable(video) {
    // ...
    // enable impl
    // ...
}

uvcg_video_enable(video, enable) {
    // ep test
   
    if (!enable)
        return uvcg_video_disable(video);

    return uvc_video_enable(video);
}

instead of the current structure:

uvcg_video_disable(video) {
    // ...
    // disable impl
    // ...
}

uvcg_video_enable(video, enable) {
    // ep test
   
    if (!enable)
        return uvcg_video_disable(video);

    // ...
    // enable impl
    // ...
}

I am not sure if one is more readable than the other.

> 
>> +
>> +    /*
>> +     * Safe to access request related fields without req_lock because
>> +     * this is the only thread currently active, and no other
>> +     * request handling thread will become active until this function
>> +     * returns.
>> +     */
>> +    video->is_enabled = true;
> 
> Add an extra empty line.
> 
>>     if ((ret = uvcg_queue_enable(&video->queue, 1)) < 0)
>>         return ret;
>>
>> @@ -544,6 +637,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>>  */
>> int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>> {
>> +    video->is_enabled = false;
>>     INIT_LIST_HEAD(&video->ureqs);
>>     INIT_LIST_HEAD(&video->req_free);
>>     spin_lock_init(&video->req_lock);
>> -- 
>> 2.42.0.609.gbb76f46606-goog
>>
>>
> 
> Reviewed-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> 

