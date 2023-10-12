Return-Path: <linux-usb+bounces-1492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D382B7C61D9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 02:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1237428270C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 00:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D91A658;
	Thu, 12 Oct 2023 00:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IlQSPaMw"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264DE641
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 00:33:51 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967F298
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 17:33:49 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-692c70bc440so333327b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 17:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697070829; x=1697675629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYFcbGbMzUUClTf9x+vWugaH7nLZZyyxs+6xS78to48=;
        b=IlQSPaMwUq/ozv5kCtaCuHoF3Sd9en1lIKok5yH5KHWgh1DznK1nTrVda1qG/zXhKQ
         lEaT/5Idwv5o4CIbz8RuSCiafKAFcldEUAc1hXgBRSCBfmLBbHgv5BkQY3DN+ZINNby7
         o2f+y6BSNYvzIlx8Ap/kcnaQzuKcr0HWlXrDU6L7TdgzRmdOqBBRf1Az4TutlON0zofx
         21Xt6ZCcAlMBRM+7cmtonBtxT7tYDXm6NSPGeKjS8YmshkoJ4ekPAfSmX/iis5rWYM4m
         VNAzI+5aT7gZqCS/hY4AMAxcZCtWOUGcGw2oZSrAeDFEMubiOVg4sDjoqcTQucM71IHd
         /sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697070829; x=1697675629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYFcbGbMzUUClTf9x+vWugaH7nLZZyyxs+6xS78to48=;
        b=l0wKY263Jo+A6mKFQbeI9PLZZ4OQH+G1QmGBq3fLhvr9wtn9tBsmUOKWyNDqFU0KLh
         b7WUima1QCnnT90NQzQ/eZl2HrkcexYMX5Ep1BczvobT+lN6UteQ0rC0Nv3Hn/AXsQ6e
         6Z/bPEecaHmb1+fDeQvz080VdwCmIvHFC1cPHt+2pUnSQxrIFpB+TsuyOF20/nHZDoA1
         SrItE86qM40xhSO4tZEQHiWZF9AqGfCZmw+gNyw2wxsOpbhA0jWNiy58Zxmm70FTsYcW
         0L08h8fEtTxLGiswn3HNLyLiWgOLLHA5aSw12oS0omt6JjUoJYN2IsNwrQrm/1TKhmFq
         qiQA==
X-Gm-Message-State: AOJu0Yx6NWun0w5NwkrecjFH+AnQS0fFRdZdOutK2A9ytChlcuaDeNMz
	Tedj2LruXlrXTMMVXxUKX/qDpg==
X-Google-Smtp-Source: AGHT+IFvkJV4nzq2xa7UQL26ABJWbAlIX1fa7B96CIxtNcwVe7sRQRxgtDkj3EzUYUHUQlJgfOdzTg==
X-Received: by 2002:a05:6a00:24c4:b0:68e:3eab:9e1b with SMTP id d4-20020a056a0024c400b0068e3eab9e1bmr24713809pfv.22.1697070828800;
        Wed, 11 Oct 2023 17:33:48 -0700 (PDT)
Received: from [192.168.60.239] (213.126.145.34.bc.googleusercontent.com. [34.145.126.213])
        by smtp.gmail.com with ESMTPSA id x3-20020aa793a3000000b0068a54866ca8sm10644925pff.134.2023.10.11.17.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 17:33:48 -0700 (PDT)
Message-ID: <26747e41-6848-493d-a442-abedea09b751@google.com>
Date: Wed, 11 Oct 2023 17:33:46 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] usb: gadget: uvc: stability fixes on STREAMOFF.
Content-Language: en-US
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jchowdhary@google.com,
 etalvala@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230930184821.310143-1-arakesh@google.com>
 <ZRv2UnKztgyqk2pt@pengutronix.de>
 <20231005082327.GC13853@pendragon.ideasonboard.com>
 <ZR6Me5WsAbjvc2hk@pengutronix.de>
 <53300d24-b558-428d-b52f-316b2e456313@google.com>
 <ZR8zKHQv1dkyLosv@pengutronix.de>
 <50f92131-3e41-49a8-834d-8ae3ae36f565@google.com>
 <ZSCP0clqb1Nn/Ft3@pengutronix.de>
 <b14b296f-2e08-4edf-aeea-1c5b621e2d0c@google.com>
 <ZSMHeH6jNtXMRR2K@pengutronix.de>
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZSMHeH6jNtXMRR2K@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/8/23 12:48, Michael Grzeschik wrote:
> On Fri, Oct 06, 2023 at 04:48:19PM -0700, Avichal Rakesh wrote:
>> On 10/6/23 15:53, Michael Grzeschik wrote:
>>> On Fri, Oct 06, 2023 at 10:00:11AM -0700, Avichal Rakesh wrote:
>>>>
>>>>
>>>> On 10/5/23 15:05, Michael Grzeschik wrote:
>>>>> Hi Avichal,
>>>>>
>>>>> On Thu, Oct 05, 2023 at 11:30:32AM -0700, Avichal Rakesh wrote:
>>>>>> On 10/5/23 03:14, Michael Grzeschik wrote:
>>>>> <snip>
>>>>> I don't know where the extra complexity comes from.
>>>>
>>>> A lot of this complexity comes from assuming a back to back
>>>> STREAMOFF -> STREAMON sequence is possible where the gadget driver
>>>> doesn't have the time to clean up all in-flight usb_requests.
>>>> However, looking through the usb gadget APIs again, and it
>>>> looks like  usb_ep_disable enforces that all requests will
>>>> be sent back to the gadget driver before it returns.
>>>
>>> Great!
>>
>> Uhh...apologies, I will have to take this back. I've been
>> trying to use uvc->state as the condition for when completion
>> handler should clean up usb_requests, and I cannot figure
>> out a way to do so cleanly.
>>
>> The fundamental problem with using uvc->state is that it is
>> not protected by any locks. So there is no real way to
>> assert that its value has not changed between reading
>> uvc->state and acting on it.
>>
>> Naively we can write something like the following in the
>> completion handler:
>>
>> void uvc_video_complete(...) {
>>    if (uvc->state != UVC_EVENT_STREAMING) {
>>        usb_ep_free_request(....);
>>    } else {
>>        // handle usb_request normally
>>    }
>> }
>>
>> But without any locks, there are no guarantees that
>> uvc->state didn't mutate immediately after the if
>> condition was checked, and the complete handler is
>> handling a request that it should've freed instead
>> or vice-versa. This argument would hold for any logic
>> we guard with uvc->state, making uvc->state effectively
>> useless as a check for freeing memory.
> 
> Yes, this makes total sense. Since the above condition was also part of
> the wait_event patch you created in the first place, I bet this issue
> was there aswell and was probably causing the issues I saw while testing
> it> 
> 
>> We can work around it by either
>> 1. Locking uvc->state with some driver level lock
>>   to ensure that we can trust the value of uvc->state
>>   at least for a little while, or
>> 2. Using some other barrier condition that is protected by
>>   another lock
>>
>> If we go with (1), we'd have to add a lock around every
>> and every write to uvc->state, which isn't terrible, but
>> would require more testing to ensure that it doesn't
>> create any new deadlocks.
>>
>> For (2), with the realization that usb_ep_disable flushes
>> all requests, we can add a barrier in uvc_video, protected by
>> req_lock. That should simplify the logic a little bit and
>> will hopefully be easier to reason about.
>>
>> I could of course be missing a simpler solution here,
>> and am happy to be wrong. So please let me know if you
>> have any other ideas on how to guarantee such a check.
> 
> For now, I have no better Idea. Idea (2) sounds like
> a good compromise. But I will have to review that code
> to really judge.
> 

Sent out v4 patches with option (2). It simplifies the logic 
decently because we no longer have to reason about per-request
consistency. uvc_video now tracks its own state of whether
requests should be flowing or not based on calls to
uvcg_video_enable. This state is protected, and is the source
of truth for queueing usb_requests.

The last bit of complexity left is around returning in-flight
video buffers. AFAICT it should now be protected, and in my 
local testing I didn't notice any un-returned buffers, but 
please to take a look and let me know if your testing 
uncovers anything.

Thanks,
Avi.
 

