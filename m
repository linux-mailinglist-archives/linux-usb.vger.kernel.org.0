Return-Path: <linux-usb+bounces-1932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9647D0225
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 20:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 963D0282334
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 18:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6877632196;
	Thu, 19 Oct 2023 18:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JHKuoYIg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF632FE0F
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 18:55:00 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C6ECF
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 11:54:59 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c5cd27b1acso70788535ad.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697741699; x=1698346499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wo9uGJpjh2Gn+mJVCJbkCRN0kIqxy+6x2C8i+d+cFTA=;
        b=JHKuoYIgnPa/rYnHILJheM+3fXTtYP2tsN8+tQuXKNe+1K2x7L2OStIA4WmKI0h67n
         n4kiNFncyJ5h43a+bVmrRP67DBAUgqtSVolWGv3+VkZ2NRvH3hJDAutmZAXJQRFq0TOd
         oA6T0+kS8twG+b5fKl3ic1Q6OtS/GVTmGc4sbYE748pbiNAkr+8ol27d1p26hbZSB0IP
         Vx/j9Wniuujv1LVgMWBsivIxS4gIh21aQdONtp6gv7xDMXyPoFNg33AFO8n//gUaot+b
         YJCvIj4RhGpwKlJ+1ao1dIa3A+/szRb8/66qJ4eX9KZ4VdJOUarOH5Dd/hGahbNkVL5v
         FbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697741699; x=1698346499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wo9uGJpjh2Gn+mJVCJbkCRN0kIqxy+6x2C8i+d+cFTA=;
        b=Kk2yUETs23nVcZPCp1NgqPe4gTyNgoeQusr01I4KIAs/lTch7MryIUKXD3E3BCIdus
         +61ExpP5LP8/JRctuq09y1v/1/VYyeAeatLcJHUfeHZW4lklBee8KCk5H+ERJiVm3wvR
         eBKF2l8xfUYlaCfSim7e5XD0VgrRAamVUUcuAWfvfebby5ignM/iOyBIgsMcEELL9Fsm
         DIWYv+OoaQzCzcW6wrz/ysKDigMbTqDlifUF3kJltaNrM8/RtWa1tcLt4c8Nlf+Tyhp7
         OdK3wBf9GqhZtKFDvkOuT2JTAlZxxvMwB3lzjx/iRMupAGh8URxF0wu2Hvk5Q1+9n66z
         I1jQ==
X-Gm-Message-State: AOJu0YybGq7xQ38ATNZ/CxsWrrgjo16/Em6I0FdtN7YuPaSMMY05Xs++
	RecEQ0M0gksK2cHBhFk8qYDOfA==
X-Google-Smtp-Source: AGHT+IEzyqCtgdLtzwmBRgFcb+6oPfoQpOwXgFW30TXNqnO6CdJf71N9yrijz8/j9QHP3Do8OHkZ/w==
X-Received: by 2002:a17:903:1212:b0:1c6:3228:c2ca with SMTP id l18-20020a170903121200b001c63228c2camr3644840plh.29.1697741698578;
        Thu, 19 Oct 2023 11:54:58 -0700 (PDT)
Received: from [192.168.60.239] (213.126.145.34.bc.googleusercontent.com. [34.145.126.213])
        by smtp.gmail.com with ESMTPSA id n17-20020a170902e55100b001bb1f0605b2sm35661plf.214.2023.10.19.11.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 11:54:57 -0700 (PDT)
Message-ID: <b9f9ff09-efad-4c1a-9d27-6dde5c89852f@google.com>
Date: Thu, 19 Oct 2023 11:54:56 -0700
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
 <f45e7eab-4d49-41bb-b515-dd036f40a8d8@google.com>
 <ZTBW/o3tT/ukdbbi@pengutronix.de>
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZTBW/o3tT/ukdbbi@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/18/23 15:06, Michael Grzeschik wrote:
> On Wed, Oct 18, 2023 at 02:50:08PM -0700, Avichal Rakesh wrote:
>>
>>
>> On 10/18/23 06:10, Michael Grzeschik wrote:
>>> On Wed, Oct 11, 2023 at 05:24:51PM -0700, Avichal Rakesh wrote:
>>>> Currently, the uvc gadget driver allocates all uvc_requests as one array
>>>> and deallocates them all when the video stream stops. This includes
>>>> de-allocating all the usb_requests associated with those uvc_requests.
>>>> This can lead to use-after-free issues if any of those de-allocated
>>>> usb_requests were still owned by the usb controller.
>>>>
>>>> This is patch 2 of 2 in fixing the use-after-free issue. It adds a new
>>>> flag to uvc_video to track when frames and requests should be flowing.
>>>> When disabling the video stream, the flag is tripped and, instead
>>>> of de-allocating all uvc_requests and usb_requests, the gadget
>>>> driver only de-allocates those usb_requests that are currently
>>>> owned by it (as present in req_free). Other usb_requests are left
>>>> untouched until their completion handler is called which takes care
>>>> of freeing the usb_request and its corresponding uvc_request.
>>>>
>>>> Now that uvc_video does not depends on uvc->state, this patch removes
>>>> unnecessary upates to uvc->state that were made to accomodate uvc_video
>>>> logic. This should ensure that uvc gadget driver never accidentally
>>>> de-allocates a usb_request that it doesn't own.
>>>>
>>>> Link: https://lore.kernel.org/7cd81649-2795-45b6-8c10-b7df1055020d@google.com
>>>> Suggested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>> Signed-off-by: Avichal Rakesh <arakesh@google.com>
>>>> ---
>>>> v1 -> v2: Rebased to ToT, and fixed deadlock reported in
>>>>          https://lore.kernel.org/all/ZRv2UnKztgyqk2pt@pengutronix.de/
>>>> v2 -> v3: Fix email threading goof-up
>>>> v3 -> v4: re-rebase to ToT & moved to a uvc_video level lock
>>>>          as discussed in
>>>>          https://lore.kernel.org/b14b296f-2e08-4edf-aeea-1c5b621e2d0c@google.com/
>>>
>>> I tested this and I no longer saw any use after free
>>> errors anymore! :)
>>
>> Yay! Glad to hear!
>>
>>>
>>> Here comes some more review:
>>>
>>>> drivers/usb/gadget/function/uvc.h       |   1 +
>>>> drivers/usb/gadget/function/uvc_v4l2.c  |  12 +-
>>>> drivers/usb/gadget/function/uvc_video.c | 156 +++++++++++++++++++-----
>>>> 3 files changed, 128 insertions(+), 41 deletions(-)
>>>>
>>
>>>> +
>>>> +/*
>>>> + * Disable video stream
>>>> + */
>>>> +static int
>>>> +uvcg_video_disable(struct uvc_video *video) {
>>>> +    unsigned long flags;
>>>> +    struct list_head inflight_bufs;
>>>> +    struct usb_request *req, *temp;
>>>> +    struct uvc_buffer *buf, *btemp;
>>>> +    struct uvc_request *ureq, *utemp;
>>>> +
>>>> +    INIT_LIST_HEAD(&inflight_bufs);
>>>> +    spin_lock_irqsave(&video->req_lock, flags);
>>>> +    video->is_enabled = false;
>>>> +
>>>> +    /*
>>>> +     * Remove any in-flight buffers from the uvc_requests
>>>> +     * because we want to return them before cancelling the
>>>> +     * queue. This ensures that we aren't stuck waiting for
>>>> +     * all complete callbacks to come through before disabling
>>>> +     * vb2 queue.
>>>> +     */
>>>> +    list_for_each_entry(ureq, &video->ureqs, list) {
>>>> +        if (ureq->last_buf) {
>>>> +            list_add_tail(&ureq->last_buf->queue, &inflight_bufs);
>>>> +            ureq->last_buf = NULL;
>>>> +        }
>>>> +    }
>>>>     spin_unlock_irqrestore(&video->req_lock, flags);
>>>> -    return;
>>>> +
>>>> +    cancel_work_sync(&video->pump);
>>>> +    uvcg_queue_cancel(&video->queue, 0);
>>>> +
>>>> +    spin_lock_irqsave(&video->req_lock, flags);
>>>> +    /*
>>>> +     * Remove all uvc_reqeusts from from ureqs with list_del_init
>>>> +     * This lets uvc_video_free_request correctly identify
>>>> +     * if the uvc_request is attached to a list or not when freeing
>>>> +     * memory.
>>>> +     */
>>>> +    list_for_each_entry_safe(ureq, utemp, &video->ureqs, list)
>>>> +        list_del_init(&ureq->list);
>>>> +
>>>> +    list_for_each_entry_safe(req, temp, &video->req_free, list) {
>>>> +        list_del(&req->list);
>>>> +        uvc_video_free_request(req->context, video->ep);
>>>> +    }
>>>> +
>>>> +    INIT_LIST_HEAD(&video->ureqs);
>>>> +    INIT_LIST_HEAD(&video->req_free);
>>>> +    video->req_size = 0;
>>>> +    spin_unlock_irqrestore(&video->req_lock, flags);
>>>> +
>>>> +    /*
>>>> +     * Return all the video buffers before disabling the queue.
>>>> +     */
>>>> +    spin_lock_irqsave(&video->queue.irqlock, flags);
>>>> +    list_for_each_entry_safe(buf, btemp, &inflight_bufs, queue) {
>>>> +        list_del(&buf->queue);
>>>> +        uvcg_complete_buffer(&video->queue, buf);
>>>> +    }
>>>> +    spin_unlock_irqrestore(&video->queue.irqlock, flags);
>>>> +
>>>> +    uvcg_queue_enable(&video->queue, 0);
>>>> +    return 0;
>>>> }
>>>>
>>>> /*
>>>> @@ -497,28 +596,22 @@ static void uvcg_video_pump(struct work_struct *work)
>>>> int uvcg_video_enable(struct uvc_video *video, int enable)
>>>> {
>>>>     int ret;
>>>> -    struct uvc_request *ureq;
>>>>
>>>>     if (video->ep == NULL) {
>>>>         uvcg_info(&video->uvc->func,
>>>>               "Video enable failed, device is uninitialized.\n");
>>>>         return -ENODEV;
>>>>     }
>>>> -
>>>> -    if (!enable) {
>>>> -        cancel_work_sync(&video->pump);
>>>> -        uvcg_queue_cancel(&video->queue, 0);
>>>> -
>>>> -        list_for_each_entry(ureq, &video->ureqs, list) {
>>>> -            if (ureq->req)
>>>> -                usb_ep_dequeue(video->ep, ureq->req);
>>>> -        }
>>>> -
>>>> -        uvc_video_free_requests(video);
>>>> -        uvcg_queue_enable(&video->queue, 0);
>>>> -        return 0;
>>>> -    }
>>>> -
>>>> +    if (!enable)
>>>> +        return uvcg_video_disable(video);
>>>
>>> Could you refactor this code as it is to an separate
>>> function and prepand this change as an extra patch
>>> to this one? It would make the changes in the functions
>>> more obvious and better to review.
>>
>> Sure I can send a follow up patch, but I am curious why you think this
>> needs to be a separate function? Refactoring into a function would
>> have the functions structured something like:
>>
>> uvcg_video_disable(video) {
>>    // ...
>>    // disable impl
>>    // ...
>> }
>>
>> uvcg_video_enable(video) {
>>    // ...
>>    // enable impl
>>    // ...
>> }
>>
>> uvcg_video_enable(video, enable) {
>>    // ep test
>>
>>    if (!enable)
>>        return uvcg_video_disable(video);
>>
>>    return uvc_video_enable(video);
>> }
>>
>> instead of the current structure:
>>
>> uvcg_video_disable(video) {
>>    // ...
>>    // disable impl
>>    // ...
>> }
>>
>> uvcg_video_enable(video, enable) {
>>    // ep test
>>
>>    if (!enable)
>>        return uvcg_video_disable(video);
>>
>>    // ...
>>    // enable impl
>>    // ...
>> }
>>
>> I am not sure if one is more readable than the other.
> 
> I think you misunderstood. The second structure is all right.
> 
> What I did want you to do is as follows.
> 
> Lets look at your series:
> 
> patch 0/3
> patch 1/3
> patch 2/3
> 
> <--- add a patch here that does the refactoring of the separate
>      function uvcg_video_disable without changing the functional
>      content of it:
> 
> uvcg_video_disable(video) {
>     // ...
>     // disable impl
>     // ...
> }
> 
> uvcg_video_enable(video, enable) {
>     // ep test
> 
>     if (!enable)
>         return uvcg_video_disable(video);
> 
>     // ...
>     // enable impl
>     // ...
> }
> 
> patch 3/3
> 
> This way in the patch 3/3 the functional changes you introduce to the
> uvcg_video_diable will get better to review.

I see! I did indeed misunderstand. Sent out v6 with 4 patches!

Thank you!
- Avi.

