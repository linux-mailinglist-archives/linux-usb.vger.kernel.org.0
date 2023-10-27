Return-Path: <linux-usb+bounces-2307-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B05797DA1C9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 22:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42455B21610
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 20:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D043F4B0;
	Fri, 27 Oct 2023 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T1y5CWZm"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A3D3FB17
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 20:31:30 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301401B5
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 13:31:29 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c434c33ec0so21661325ad.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698438688; x=1699043488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCIU9ORg/nTCKd2EQWEkquVrxpIR07c21YhTjQSP+0s=;
        b=T1y5CWZm1t/tz8OVb/ZTazF7LmXcKTwfgO0mSd9xYgoErgrIAm1D83ht3DU50KZJDh
         LD7FQ9K4HZhJEdaSvUDWdyE9ERuhNiLU96i1cOv2Hss70xvY8pSYZacZU2lZ7MYHG760
         G2G86xPG7WDOipN29AfHeQLMFcuzYAAW2OmXGJqHRmrVaYjUoRvAb9l2zhWLt0OQt3yl
         +nMpxLp2FiPZTZjp7xoi4R5Hp+89ydnMuIpRdQGdDC5J7DyeVAge5PjAvvlDZrT6REv/
         KltZ3B+GCPJbcMIxOYcdwGOEFYevRc0ay6WIXECI+M5Uw+4ojbwoKym5p7F0c6cWbjZQ
         /4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698438688; x=1699043488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCIU9ORg/nTCKd2EQWEkquVrxpIR07c21YhTjQSP+0s=;
        b=Bkp1PQxTRyEtC97swSZDbaD1LqjHNZNGaxfXZkptP3UVKKiJrlvSNW+pCxFttGDirN
         Gb126QKat/Q+1ycsTX4HvUl0zGlG/8FeaQGGsx+EO9d3cTLfGrA/ObllGvPvx4rQMhAt
         wykYgMozFZgvpQzeBLrHiobNYV9EdcVdV+Bfzfhq8liZcLmTmHyjS1b64pQT0wvTUZoq
         cbbXA3fRxg7h42E6MtIxGZEpmsu5th19JD7fKjKuIc7/T4Ax5eoyjmK7TeKKLN4f1/J8
         HBIkzOVZ+3x/2JweBZedhLob0FSKB7KrxZVq1rBkavXZXyE3QoYP4ojUy+/R46YHAfJy
         lvAA==
X-Gm-Message-State: AOJu0YwNDT1QsFFfpnrYe7uUBGbtDvWte7t9QJE7E3qkGp4KcdZtuWbX
	M7IByvlufigp8EFFs27KbX2GCA==
X-Google-Smtp-Source: AGHT+IGdS/nGHoauxLpdK4pOHUXQ0d/MOf0euxn0ULXmidHE8fDhBei/GpzafAwPu4EllfZOyK7QfQ==
X-Received: by 2002:a17:902:f542:b0:1c3:83e2:d0a9 with SMTP id h2-20020a170902f54200b001c383e2d0a9mr4604736plf.58.1698438688455;
        Fri, 27 Oct 2023 13:31:28 -0700 (PDT)
Received: from [192.168.60.239] (183.43.230.35.bc.googleusercontent.com. [35.230.43.183])
        by smtp.gmail.com with ESMTPSA id jw20-20020a170903279400b001c9ba6c7287sm1963989plb.143.2023.10.27.13.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 13:31:27 -0700 (PDT)
Message-ID: <1d3777ec-ac12-4a9a-a19c-fb7d5013a0a6@google.com>
Date: Fri, 27 Oct 2023 13:31:26 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] usb: gadget: uvc: Allocate uvc_requests one at a
 time
Content-Language: en-US
To: Dan Scally <dan.scally@ideasonboard.com>, gregkh@linuxfoundation.org,
 laurent.pinchart@ideasonboard.com
Cc: etalvala@google.com, jchowdhary@google.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, m.grzeschik@pengutronix.de
References: <20231019185319.2714000-1-arakesh@google.com>
 <20231024183605.908253-1-arakesh@google.com>
 <20231024183605.908253-2-arakesh@google.com>
 <421d1996-8544-45ac-9f31-551ef597546c@ideasonboard.com>
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <421d1996-8544-45ac-9f31-551ef597546c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thank you for the reviews, Dan!

Uploaded v9 with the comments addressed.

On 10/27/23 05:57, Dan Scally wrote:
> Hi Avichal - thanks for the patch
> 
> On 24/10/2023 19:36, Avichal Rakesh wrote:
>> Currently, the uvc gadget driver allocates all uvc_requests as one array
>> and deallocates them all when the video stream stops. This includes
>> de-allocating all the usb_requests associated with those uvc_requests.
>> This can lead to use-after-free issues if any of those de-allocated
>> usb_requests were still owned by the usb controller.
>>
>> <snip>
>>
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
>> index c334802ac0a4..c180866c8e34 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -227,6 +227,24 @@ uvc_video_encode_isoc(struct usb_request *req, struct uvc_video *video,
>>    * Request handling
>>    */
>>
>> +static void
>> +uvc_video_free_request(struct uvc_request *ureq, struct usb_ep *ep)
>> +{
>> +    sg_free_table(&ureq->sgt);
>> +    if (ureq->req && ep) {
>> +        usb_ep_free_request(ep, ureq->req);
>> +        ureq->req = NULL;
>> +    }
>> +
>> +    kfree(ureq->req_buffer);
>> +    ureq->req_buffer = NULL;
>> +
>> +    if (!list_empty(&ureq->list))
> 
> 
> Is this conditional needed? You can only get here through the list_for_each_entry_safe()

Strictly speaking, we don't need this check right now. As you said, we currently
only get to this from within a list_for_each_entry_safe block. However, we end up
needing the check in the very next patch. Considering this is a function
with no real control over who might call it, it seemed reasonable to write 
this a little defensively in case of a partial revert of the patchset.

> 
>> +        list_del_init(&ureq->list);
>> +
>> +    kfree(ureq);
>> +}
>> +
>>  <snip>
>> @@ -322,6 +325,7 @@ uvc_video_free_requests(struct uvc_video *video)
>>   static int
>>   uvc_video_alloc_requests(struct uvc_video *video)
>>   {
>> +    struct uvc_request *ureq;
>>       unsigned int req_size;
>>       unsigned int i;
>>       int ret = -ENOMEM;
>> @@ -332,29 +336,34 @@ uvc_video_alloc_requests(struct uvc_video *video)
>>            * max_t(unsigned int, video->ep->maxburst, 1)
>>            * (video->ep->mult);
>>
>> -    video->ureq = kcalloc(video->uvc_num_requests, sizeof(struct uvc_request), GFP_KERNEL);
>> -    if (video->ureq == NULL)
>> -        return -ENOMEM;
>> +    INIT_LIST_HEAD(&video->ureqs);
> 
> 
> Probably unecessary here; it's done in uvc_video_free_requests() and uvcg_video_init() already

Ah, that is fair. Added a BUG_ON instead, like we do for video->req_size
so we still catch cases where the state might be inconsistent.

> 
>> +    for (i = 0; i < video->uvc_num_requests; i++) {
>> +        ureq = kzalloc(sizeof(struct uvc_request), GFP_KERNEL);
>> +        if (ureq == NULL)
>> +            goto error;
>> +
>> +        INIT_LIST_HEAD(&ureq->list);
>> +
>> +        list_add_tail(&ureq->list, &video->ureqs);
>>
>> <snip>

Regards,
Avi.

