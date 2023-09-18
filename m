Return-Path: <linux-usb+bounces-342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EC27A52C2
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 21:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB160281CDD
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 19:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66CF273F2;
	Mon, 18 Sep 2023 19:04:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3021F5E3
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 19:04:37 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968AD2D57
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 12:02:16 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c451541f23so13516255ad.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 12:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695063734; x=1695668534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6c9Dw+H6bZNAtp6nyetpcWDVm9T7feZvhUEFUNvPro=;
        b=suF1G+4fpQZVz0VAsaLyanBNMnWd7sEMOg1VT2nkIEuDAPcCI5SYzVYd2GiKnm2B37
         HFooJw8RlMjq5Tlo0cny8LfB7ZCZVxz/J1aFf9HiFb0ZOmm/TVPzlzbtY60aS1xjej0K
         9IGb4urjUO+qrc8amcRcs9RAsEH9pKsI9ktP44prDMSBalPZzEbJuZKKorH1qbNFTGaq
         ougVrFrZkf9/hRVHbycvVV+leeb46fSAO5A057xKnFiG7QWwyDWhpwdrRjgjADHhR16z
         glN8H0NhCeEsQJG860ygVLxAvPcWdiYrCN19Wrg4X5jgQJjb9+QSHjU4gIRIC43QIydi
         hLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695063734; x=1695668534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6c9Dw+H6bZNAtp6nyetpcWDVm9T7feZvhUEFUNvPro=;
        b=I677H6wQ2Eox+zDSF/FM6YRb1rLzVex02xHV6kvMeEX9NyJBJZs4jXRNyY7pzPF7Bq
         /Mvo3PAxiXPdrwJSSpYoDgvP06LSoEU77mqkWZtfGdfyDZqk3vySsx8B6lvs/7WuehUG
         nc53/FEIiPoSw5VlFQSzPZw4kSzoLNRkon1hnYM2/i+f2qCJqSkcneg429z6rnvto9rI
         YGCEgHJ+X2KUBYAEiGODGhEyQWaX0+38PjdkmICbFeuU9inQB0p0llkTb97Aw3LaUuLq
         YCAgJpbyUluvep/zkhtNH5McHRs/6XyCLu2qCHdKo2m2tCFw/sRPNAWdBV47DS2cj+BS
         Wrow==
X-Gm-Message-State: AOJu0YwLCzrQ6Jupwy+LY1RGIa3GCxQOI1w0VoYFHcRznlkLaY5mx9Nc
	+VopHKQvouFx8/k3ojBHME8p9xFjnDxKXVDSIuz7bw==
X-Google-Smtp-Source: AGHT+IFgvI8Gx7pJQuu+4F35rTPcO0HTycpb3vyegabZKdF1s/i8Ak7x8KvboiAT+yhu6mkpeswZJA==
X-Received: by 2002:a17:903:2783:b0:1b5:561a:5ca9 with SMTP id jw3-20020a170903278300b001b5561a5ca9mr8111664plb.50.1695063734035;
        Mon, 18 Sep 2023 12:02:14 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902d50700b001a80ad9c599sm8613261plg.294.2023.09.18.12.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 12:02:13 -0700 (PDT)
Message-ID: <d678b644-5f66-4c23-b2ba-6c84ba56012f@google.com>
Date: Mon, 18 Sep 2023 12:02:11 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in correct
 state
Content-Language: en-US
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
 gregkh@linuxfoundation.org, nicolas@ndufresne.ca, kernel@pengutronix.de,
 Jayant Chowdhary <jchowdhary@google.com>
References: <20230911002451.2860049-1-m.grzeschik@pengutronix.de>
 <20230911002451.2860049-3-m.grzeschik@pengutronix.de>
 <a55b3b0c-2306-4591-8613-7be4927f0d4e@google.com>
 <ZQTpnJvTV+8Ye1si@pengutronix.de>
 <587c9b95-a80c-4bf9-b1a0-fe7ef0f4cd60@google.com>
 <ZQY5Ab+YB9FLHoQq@pengutronix.de>
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZQY5Ab+YB9FLHoQq@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 9/16/23 16:23, Michael Grzeschik wrote:
> On Fri, Sep 15, 2023 at 07:41:05PM -0700, Avichal Rakesh wrote:
>> On 9/15/23 16:32, Michael Grzeschik wrote:
>>> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>>>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>>>> The uvc_video_enable function of the uvc-gadget driver is dequeing and
>>>>> immediately deallocs all requests on its disable codepath. This is not
>>>>> save since the dequeue function is async and does not ensure that the
>>>>> requests are left unlinked in the controller driver.
>>>>>
>>>>> By adding the ep_free_request into the completion path of the requests
>>>>> we ensure that the request will be properly deallocated.
>>>>>
>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>> ---
>>>>>  drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
>>>>> index 4b6e854e30c58c..52e3666b51f743 100644
>>>>> --- a/drivers/usb/gadget/function/uvc_video.c
>>>>> +++ b/drivers/usb/gadget/function/uvc_video.c
>>>>> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>>>>>      struct uvc_device *uvc = video->uvc;
>>>>>      unsigned long flags;
>>>>>
>>>>> +    if (uvc->state == UVC_STATE_CONNECTED) {
>>>>> +        usb_ep_free_request(video->ep, ureq->req);
>>>> nit: You can probably just call usb_ep_free_request with req instead of ureq->req.
>>>
>>> Thanks, thats a good point.
>>>
>>>>> +        ureq->req = NULL;
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>>      switch (req->status) {
>>>>>      case 0:
>>>>>          break;
>>>>
>>>> Perhaps I am missing something here, but I am not sure how this alone
>>>> fixes the use-after-free issue. uvcg_video_enable still deallocates
>>>> _all_ usb_requests right after calling usb_ep_dequeue, so it is still
>>>> possible that an unreturned request is deallocated, and now it is
>>>> possible that the complete callback accesses a deallocated ureq :(
>>>
>>> Since the issue I saw was usually coming from the list_del_entry_valid check in
>>> the list_del_entry of the giveback function, the issue was probably just not
>>> triggered anymore as the complete function did exit early.
>>>
>>> So this fix alone is actually bogus without a second patch I had in the stack.
>>> The second patch I am refering should change the actual overall issue:
>>>
>>> https://lore.kernel.org/linux-usb/20230915233113.2903645-1-m.grzeschik@pengutronix.de/T/#u
>>>
>>> This early list_del and this patch here should ensure that the
>>> concurrent functions are not handling already freed memory.
>>
>> Oh, the patch linked above is interesting. It effectively force removes the dwc3_request
>> from whatever list it belongs to? So if DWC3's interrupt handler is delayed past
>> UVC gadget's ep_free_request call, then it won't see the requests in its cancelled
>> list at all. However, this setup is still prone to errors. For example, there is now
>> a chance that gadget_ep_free_request is called twice for one request. A scheduling
>> like the following might cause double kfree:
>>
>> 1. uvcg_video_enable calls usb_ep_dequeue for all usb_requests
>> 2. While the usb_ep_dequeues are being processed, dwc3's interrupt handler starts
>>   calling the complete callbacks.
>> 3. The complete callback calls gadget_ep_free_request (calling kfree as a result)
>> 4. Meanwhile, uvcg_video_enable has moved to uvc_video_free_requests which also
>>   calls gadget_ep_free_request (calling kfree).
>>
>> There is currently (even in your patches) no synchronization between calls to
>> gadget_ep_free_request via complete callback and uvcg_video_enable, which will
>> inevitably call usb_ep_free_request twice for one request.
>>
>> Does that make sense, or am I misunderstanding some part of the patch?
> 
> The overall concept is correct. But in detail the
> uvc_video_free_requests is checking that video->ureq[i].req is not NULL.
> 
> With our previous call of ep_free_request in the complete handler, the
> ureq->req pointer in focus was already set to NULL. So the
> uvc_video_free_requests function will skip that extra free.
> 

Is there any form of synchronization between uvc_video_request and the 
complete callback? As I see it, the dwc3 interrupt thread and the v4l2 
ioctl thread (which calls uvcg_video_enable) are fully independent, so
the calls made by them are free to be interleaved arbitrarily, so an
interleaving like this is technically possible:

+------+------------------------------------+---------------------------------------------+
| time |            ioctl_thread            |            dwc3 interrupt handler           |
+======+====================================+=============================================+
|   1  | -uvc_v4l2_streamoff                |                                             |
|   2  | |-uvcg_video_enable                |                                             |
|   3  | ||-usb_ep_dequeue                  |                                             |
|   4  | ||                                 | -dwc3_process_event_buf                     |
|   5  | ||-uvc_video_free_requests         | |                                           |
|   6  | |||                                | |-dwc3_gadget_ep_cleanup_cancelled_requests |
|   7  | |||                                | ||-dwc3_gadget_giveback                     |
|   8  | |||                                | |||-uvc_video_complete                      |
|   9  | |||-check ureq->req != NULL [true] | ||||                                        |
|  10  | ||||-usb_ep_free_request           | ||||                                        |
|  11  | |||||-dwc3_ep_free_request         | ||||                                        |
|  12  | ||||||-kfree [first call]          | ||||                                        |
|  13  | ||||                               | ||||-usb_ep_free_request                    |
|  14  | ||||                               | |||||-dwc3_ep_free_request                  |
|  15  | ||||                               | ||||||-kfree [second call]                  |
|  16  | ||||                               | ||||-set ureq->req = NULL                   |
|  17  | ||||-set ureq->req = NULL          |                                             |
+------+------------------------------------+---------------------------------------------+

A situation like this means that dwc3_ep_free_request can be called
twice for a particular usb_request. This is obviously low probability,
but a race condition here means we'll start seeing very vague and hard 
to repro crashes or memory inconsistencies when using the uvc gadget.

I do apologize if I've missed something obvious with your changes that 
prevents such interleaving. I don't currently see any locking or 
other synchronization mechanism in your changes. Is there something
in dwc3 that prevents this situation?

Best Regards,
Avi. 


