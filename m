Return-Path: <linux-usb+bounces-1953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11977D07D5
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 07:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB6B11C20A50
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 05:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24FC9468;
	Fri, 20 Oct 2023 05:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1O91NUzt"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBCCAD5D
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 05:52:17 +0000 (UTC)
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A391A4
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 22:52:15 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-584042e7f73so258336eaf.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697781134; x=1698385934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cd8HwXTGc19daOIsweXK1MeD0xudR4nQzS0ZBAWHuYc=;
        b=1O91NUztNCZUoqAmYrDjxc9IEQxSxGi/gDeaGivpCK7JU36r+7VyMwSRqyRL3XpN02
         Xz61ToQC2tld2PDZD22yJ3RXxa+jLMR0ktmSRV0qcnFdb+MMBP/94dElwGfddC+Weucb
         IE/WeI3qNrjJ0IPdkOQP/VHbdKhBidCMSdY/CDzWgH6dkYeAf17xrqGuq+rSp0Qhq+YT
         q+wNdeRJwUOMjdf9oYhnqW6a4oUk7KYbw6LBpfI8NkasGjUQREjZgyOxADDiB6rVV6RL
         hEWUzYyiGjQPrWi/AyPRNBvWPorYIOiUtP8HTfH5BXO221Ntkaia8LnsZ6MA/PCoZzyz
         w//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697781134; x=1698385934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cd8HwXTGc19daOIsweXK1MeD0xudR4nQzS0ZBAWHuYc=;
        b=t1zOBqtjd9iw9BUIQLR1yBZG+XGn1JePxFmaw0mf/mh35Vq8hOgouf58mGMZPwkqqE
         M1wjLklk/gQkPgGkg3zyRdEBAT43uCp/mfkJ3/f29QEnglTtqM3FQor5YWK+PArvfgxE
         pQoBEqBy4t2P0ouGnNK8VflEmHh58V0QWZ4x8r7NCyQQVJ3Zju/ciZZokQDQWdpoTU7E
         e8FLijX8lJMCyDwfWI+7+nl3dxydJDes1rTnGetkh32mDSlyOO7b3izAo/xXRTAyrqQK
         HLwsxoTd54Ro0mrjkc4NBakRsvdWHM/UkG2uqsrIWyVqVBFDjJ39wgzE/uPrTqVL7Qw1
         KEdg==
X-Gm-Message-State: AOJu0YzrlIbyESbSQ6x766DwUKMPuq4qp32PhDYm+cQwoZism1zxFQ8f
	1NDtJWDN+75ECASxmZp7OmXCKw==
X-Google-Smtp-Source: AGHT+IHZJvRo3AWb3EiaYILk1f4XlxEDfNIJzccZc3G7GOI10odyOPnO8mWQN8MNezJCEkRK6uFceA==
X-Received: by 2002:a05:6358:4324:b0:132:d333:4a5c with SMTP id r36-20020a056358432400b00132d3334a5cmr926295rwc.10.1697781133874;
        Thu, 19 Oct 2023 22:52:13 -0700 (PDT)
Received: from ?IPV6:2601:645:8100:1350:e896:22e:acc2:4336? ([2601:645:8100:1350:e896:22e:acc2:4336])
        by smtp.gmail.com with ESMTPSA id t12-20020a65554c000000b005b7dd356f75sm563874pgr.32.2023.10.19.22.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 22:52:13 -0700 (PDT)
Message-ID: <c4743c5f-d365-4829-b5a1-46c0daceba1e@google.com>
Date: Thu, 19 Oct 2023 22:52:11 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Content-Language: en-US
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg KH <gregkh@linuxfoundation.org>, "corbet@lwn.net" <corbet@lwn.net>,
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
 <ZS/dmTjdCCdnelVP@pengutronix.de> <ZTG4l49nrA5NeYr5@pengutronix.de>
From: Jayant Chowdhary <jchowdhary@google.com>
In-Reply-To: <ZTG4l49nrA5NeYr5@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Michael,

On 10/19/23 16:15, Michael Grzeschik wrote:
> On Wed, Oct 18, 2023 at 03:28:57PM +0200, Michael Grzeschik wrote:
>> On Sun, Oct 15, 2023 at 09:33:43PM -0700, Jayant Chowdhary wrote:
>>> On 10/12/23 11:50, Thinh Nguyen wrote:
>>>> On Mon, Oct 09, 2023, Jayant Chowdhary wrote:
>>>>>> On Fri, Oct 06, 2023 at 03:03:56PM -0700, Jayant Chowdhary wrote:
>>>>>>> We had been seeing the UVC gadget driver receive isoc errors while
>>>>>>> sending packets to the usb endpoint - resulting in glitches being shown
>>>>>>> on linux hosts. My colleague Avichal Rakesh and others had a very
>>>>>>> enlightening discussion at
>>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/8741b7cb-54ec-410b-caf5-697f81e8ad64@google.com/T/__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gQ73n_-Y$
>>>>>>>
>>>>>>>
>>>>>>> The conclusion that we came to was : usb requests with actual uvc frame
>>>>>>> data were missing their scheduled uframes in the usb controller. As a
>>>>>>> mitigation, we started sending 0 length usb requests when there was no
>>>>>>> uvc frame buffer available to get data from. Even with this mitigation,
>>>>>>> we are seeing glitches - albeit at a lower frequency.
>>>>>>>
>>>>>>> After some investigation, it is seen that we’re getting isoc errors when
>>>>>>> the worker thread serving video_pump() work items, doesn’t get scheduled
>>>>>>> for longer periods of time - than usual - in most cases > 6ms.
>>>>>>> This is close enough to the 8ms limit that we have when the number of usb
>>>>>>> requests in the queue is 64 (since we have a 125us uframe period). In order
>>>>>>> to tolerate the scheduling delays better, it helps to increase the number of
>>>>>>> usb requests in the queue . In that case, we have more 0 length requests
>>>>>>> given to the udc driver - and as a result we can wait longer for uvc
>>>>>>> frames with valid data to get processed by video_pump(). I’m attaching a
>>>>>>> patch which lets one configure the upper bound on the number of usb
>>>>>>> requests allocated through configfs. Please let me know your thoughts.
>>>>>>> I can formalize  the patch if it looks okay.
>>>>>> Why do you want to limit the upper bound?  Why not just not submit so
>>>>>> many requests from userspace as you control that, right?
>>>>>
>>>>> Userspace negotiates a video frame rate (typically 30/60fps) with the host that does
>>>>> not necessarily correspond to the ISOC cadence. After the
>>>>> patch at https://urldefense.com/v3/__https://lkml.org/lkml/diff/2023/5/8/1115/1__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gWbb9bvy$  was submitted, we are
>>>>> maintaining back pressure on the usb controller even if we do not have uvc frame
>>>>> data, by sending the controller 0 length requests (as long as usb_requests are
>>>>> available). Also, even if the userspace application were to somehow produce
>>>>> data to match the ISOC rate, it would  need to have information about USB
>>>>> timing details - which I am not sure is available to userspace or is the right
>>>>> thing to do here ?
>>>>>
>>>>> Here, we are trying to handle the scenario in which the video_pump() worker
>>>>> thread does not get scheduled in time - by increasing the number of usb requests
>>>>> allocated in the queue. This would send more usb requests to the usb controller,
>>>>> when video_pump() does get scheduled - even if they're 0 length. This buys
>>>>> the video_pump() worker thread scheduling time -since more usb requests
>>>>> are with the controller, subsequent requests sent will not be 'stale' and
>>>>> dropped by the usb controller.
>>>>>
>>>> I believe you're testing against dwc3 controller right? I may not be as
>>>> familiar with UVC function driver, but based on the previous
>>>> discussions, I think the driver should be able to handle this without
>>>> the user input.
>>>
>>> Yes we are testing against the dwc3 controller.
>>>
>>>>
>>>> The frequency of the request submission should not depend on the
>>>> video_pump() work thread since it can vary. The frequency of request
>>>> submission should match with the request completion. We know that
>>>> request completion rate should be fixed (1 uframe/request + when you
>>>> don't set no_interrupt). Base on this you can do your calculation on how
>>>> often you should set no_interrupt and how many requests you must submit.
>>>> You don't have to wait for the video_pump() to submit 0-length requests.
>>>>
>>>> The only variable here is the completion handler delay or system
>>>> latency, which should not be much and should be within your calculation.
>>>
>>>
>>> Thanks for the suggestion. It indeed makes sense that we do not completely depend on
>>> video_pump() for sending 0 length requests. I was concerned about
>>> synchronization needed when we send requests to the dwc3 controller from
>>> different threads. I see that the dwc3 controller code does internally serialize
>>> queueing requests, can we expect this from other controllers as well ?
>>>
>>> This brings me to another question for Michael - I see
>>> that we introduced a worker thread for pumping  usb requests to the usb endpoint
>>> in https://lore.kernel.org/all/20200427151614.10868-1-m.grzeschik@pengutronix.de/
>>> (I see multiple email addresses, so apologies if I used the incorrect one).
>>>
>>> Did we introduce the worker thread to solve some specific deadlock scenarios ?
>>
>> Exactly. This was the reason why we moved to the pump worker. I actually
>> looked into the host side implementation of the uvc driver. There we
>> also queue an worker from the complete function:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_video.c#n1646
>>
>> So this sounded reasonable to me. However we faced similar issues like
>> you and introduced different ways to improve the latency issue.
>>
>> One thing we did was improving the latency by adding WQ_HIGHPRI
>>
>> https://lore.kernel.org/linux-usb/20220907215818.2670097-1-m.grzeschik@pengutronix.de/
>>
>> Another patch here is also adding WQ_CPU_INTENSIVE.
>>
>> But, after all the input from Thinh it is probably better to solve the
>> issue in a more reliable way.
>>
>>> Or was it a general mitigation against racy usb request submission from v4l2 buffer
>>> queuing, stream enable and the video complete handler firing ?
>>
>> I don't remember all of the issues we saw back then. But this is also an very
>> likely scenario.
>>
>>> I was chatting with Avi about this, what if we submit requests to the endpoint
>>> only at two points in the streaming lifecycle -
>>> 1) The whole 64 (or however many usb requests are allocated) when
>>>  uvcg_video_enable() is called - with 0 length usb_requests.
>>> 2) In the video complete handler - if a video buffer is available, we encode it
>>>  and submit it to the endpoint. If not, we send a 0 length request.
>>
>> It really sounds like a good idea.
>>
>>> This way we're really maintaining back pressure and sending requests as soon
>>> as we can to the dwc3 controller. Encoding is mostly memcpys from what I see
>>> so hopefully not too heavy on the interrupt handler. I will work on prototyping
>>> this meanwhile.
>
> [1] https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t
>
> It was actually not that hard to do that.
> With the patches from this thread applied [1] , the unformal changes looks like this:
>
> #change 1
>
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index f64d03136c5665..29cd23c38eb99d 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -626,8 +626,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>      if (ret < 0)
>          return ret;
>  
> -    if (uvc->state == UVC_STATE_STREAMING)
> -        queue_work(video->async_wq, &video->pump);
> +    uvcg_video_pump(video);
>  
>      return ret;
>  }
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 2ec51ed5e9d074..2fe800500c88a3 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -329,7 +329,9 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>       */
>      if (video->is_enabled) {
>          list_add_tail(&req->list, &video->req_free);
> -        queue_work(video->async_wq, &video->pump);
> +        spin_unlock_irqrestore(&video->req_lock, flags);
> +        uvcg_video_pump(video);
> +        return;
>      } else {
>          uvc_video_free_request(ureq, ep);
>      }
> @@ -413,9 +415,8 @@ uvc_video_alloc_requests(struct uvc_video *video)
>   * This function fills the available USB requests (listed in req_free) with
>   * video data from the queued buffers.
>   */
> -static void uvcg_video_pump(struct work_struct *work)
> +int uvcg_video_pump(struct uvc_video *video)
>  {
> -    struct uvc_video *video = container_of(work, struct uvc_video, pump);
>      struct uvc_video_queue *queue = &video->queue;
>      /* video->max_payload_size is only set when using bulk transfer */
>      bool is_bulk = video->max_payload_size;
> @@ -427,7 +428,7 @@ static void uvcg_video_pump(struct work_struct *work)
>  
>      while(true) {
>          if (!video->ep->enabled)
> -            return;
> +            return 0;
>  
>          /*
>           * Check is_enabled and retrieve the first available USB
> @@ -436,7 +437,7 @@ static void uvcg_video_pump(struct work_struct *work)
>          spin_lock_irqsave(&video->req_lock, flags);
>          if (!video->is_enabled || list_empty(&video->req_free)) {
>              spin_unlock_irqrestore(&video->req_lock, flags);
> -            return;
> +            return -EBUSY;
>          }
>          req = list_first_entry(&video->req_free, struct usb_request,
>                      list);
> @@ -513,7 +514,7 @@ static void uvcg_video_pump(struct work_struct *work)
>      }
>  
>      if (!req)
> -        return;
> +        return 0;
>  
>      spin_lock_irqsave(&video->req_lock, flags);
>      if (video->is_enabled)
> @@ -521,6 +522,8 @@ static void uvcg_video_pump(struct work_struct *work)
>      else
>          uvc_video_free_request(req->context, video->ep);
>      spin_unlock_irqrestore(&video->req_lock, flags);
> +
> +    return 0;
>  }
>  
>  /*
> @@ -554,7 +557,6 @@ uvcg_video_disable(struct uvc_video *video)
>      }
>      spin_unlock_irqrestore(&video->req_lock, flags);
>  
> -    cancel_work_sync(&video->pump);
>      uvcg_queue_cancel(&video->queue, 0);
>  
>      spin_lock_irqsave(&video->req_lock, flags);
> @@ -635,8 +637,6 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>  
>      video->req_int_count = 0;
>  
> -    queue_work(video->async_wq, &video->pump);
> -
>      return ret;
>  }
>  
> @@ -649,12 +649,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>      INIT_LIST_HEAD(&video->ureqs);
>      INIT_LIST_HEAD(&video->req_free);
>      spin_lock_init(&video->req_lock);
> -    INIT_WORK(&video->pump, uvcg_video_pump);
> -
> -    /* Allocate a work queue for asynchronous video pump handler. */
> -    video->async_wq = alloc_workqueue("uvcgadget", WQ_UNBOUND | WQ_HIGHPRI | WQ_CPU_INTENSIVE, 0);
> -    if (!video->async_wq)
> -        return -EINVAL;
>  
>      video->uvc = uvc;
>  
> diff --git a/drivers/usb/gadget/function/uvc_video.h b/drivers/usb/gadget/function/uvc_video.h
> index 03adeefa343b71..322b05da43965f 100644
> --- a/drivers/usb/gadget/function/uvc_video.h
> +++ b/drivers/usb/gadget/function/uvc_video.h
> @@ -16,6 +16,8 @@ struct uvc_video;
>  
>  int uvcg_video_enable(struct uvc_video *video, int enable);
>  
> +int uvcg_video_pump(struct uvc_video *video);
> +
>  int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc);
>  
>  #endif /* __UVC_VIDEO_H__ */
>
>

Thank you for this. I made some slight modifications (nothing functional)
and applied this. I'm actually seeing that the flickers completely disappear
on the device that I'm testing.

From around a flicker every couple of minutes to none in 20 minutes. What I did
keep was the 0 length request submission, since the camera is naturally producing
data at a much lower rate than what the usb controller expects. Is there a reason we would
want to remove that code ? 

> #change 2
>
> Also if you would like to revert the zero request generation apply this ontop.
>
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 82695a2ff39aa3..2a3c87079c548d 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -418,12 +418,9 @@ uvc_video_alloc_requests(struct uvc_video *video)
>  int uvcg_video_pump(struct uvc_video *video)
>  {
>      struct uvc_video_queue *queue = &video->queue;
> -    /* video->max_payload_size is only set when using bulk transfer */
> -    bool is_bulk = video->max_payload_size;
>      struct usb_request *req = NULL;
>      struct uvc_buffer *buf;
>      unsigned long flags;
> -    bool buf_done;
>      int ret;
>  
>      while(true) {
> @@ -450,28 +447,13 @@ int uvcg_video_pump(struct uvc_video *video)
>           */
>          spin_lock_irqsave(&queue->irqlock, flags);
>          buf = uvcg_queue_head(queue);
> -
> -        if (buf != NULL) {
> -            video->encode(req, video, buf);
> -            buf_done = buf->state == UVC_BUF_STATE_DONE;
> -        } else if (!(queue->flags & UVC_QUEUE_DISCONNECTED) && !is_bulk) {
> -            /*
> -             * No video buffer available; the queue is still connected and
> -             * we're transferring over ISOC. Queue a 0 length request to
> -             * prevent missed ISOC transfers.
> -             */
> -            req->length = 0;
> -            buf_done = false;
> -        } else {
> -            /*
> -             * Either the queue has been disconnected or no video buffer
> -             * available for bulk transfer. Either way, stop processing
> -             * further.
> -             */
> +        if (buf == NULL) {
>              spin_unlock_irqrestore(&queue->irqlock, flags);
>              break;
>          }
>  
> +        video->encode(req, video, buf);
> +
>          /*
>           * With USB3 handling more requests at a higher speed, we can't
>           * afford to generate an interrupt for every request. Decide to
> @@ -490,7 +472,8 @@ int uvcg_video_pump(struct uvc_video *video)
>           *   indicated by video->uvc_num_requests), as a trade-off
>           *   between latency and interrupt load.
>           */
> -        if (list_empty(&video->req_free) || buf_done ||
> +        if (list_empty(&video->req_free) ||
> +            buf->state == UVC_BUF_STATE_DONE ||
>              !(video->req_int_count %
>                 DIV_ROUND_UP(video->uvc_num_requests, 4))) {
>              video->req_int_count = 0;
> @@ -510,7 +493,8 @@ int uvcg_video_pump(struct uvc_video *video)
>  
>          /* Endpoint now owns the request */
>          req = NULL;
> -        video->req_int_count++;
> +        if(buf->state != UVC_BUF_STATE_DONE)
> +            video->req_int_count++;
>      }
>  
>      if (!req)
>
>
> In my case this did not change a lot with the flickering.
>
> In fact I did see the most effective change when increasing the
> fifo size in the dwc3 controller like this in drivers/usb/dwc3/gadget.c
>
> -813         fifo = dwc3_gadget_calc_tx_fifo_size(dwc, 1);
> +813         fifo = dwc3_gadget_calc_tx_fifo_size(dwc, 3);
>
> My system I am testing against is stressed with a high memory bandwidth
> use. So it is possible that in this scenario the hardware fifo will not
> get filled fast enough. Thus, changing the fifo size helps here. It is
> still just a string to pull on but I think it is worth to dig a bit
> deeper here.
>
> I am not sure if you are already aware of the following discussion:
>
> https://lore.kernel.org/all/ZPo51EUtBgH+qw44@pengutronix.de/T/

Thank you for this. I wasn't aware of this thread, I will give it a read!
To confirm, should I still put up a patch for removing the video_pump() worker
thread or are you planning on doing that ?

Thank you,
Jayant

>
> Rergards,
> Michael
>

