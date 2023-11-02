Return-Path: <linux-usb+bounces-2445-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C6F7DECC4
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 07:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0E1C1C20E7F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 06:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A8C523D;
	Thu,  2 Nov 2023 06:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T/wMuNVZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5C3187A
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 06:06:10 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB3A12F
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 23:06:04 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc3bc5df96so4388215ad.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Nov 2023 23:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698905164; x=1699509964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bepNsZiATRafZ7f1bJZa7YPshJfBdy3C9yqnv90bdg4=;
        b=T/wMuNVZ/YCeYXiPRq56nNJWfmKHvM7+IpCgdpdjzTzFDphei3NL3I9dHVz+JBMTRx
         9MB1EaZLOmsCdG10U88NXHuzWDKGZd5VuVI8moSCGfgqf1eKoBt5pgKzE/0LAn5kkaLW
         yVncpWUMuNMdFvRpJ9uG8LBn03AKLrFBWfFlLcyzy3DgxFR112JY/9Y/67fF4H5B/mRy
         Pbn96HnhcE31PWRzwlF4RQaTvRvDlk0e+U6s13U6KNmNATIHhqIH2lTrXM7nkRCr9Sdh
         iuo0+/PzfsLdLLWhbm95a+g/sBl2xxYtpC/bKZCj9A8MA+oVwvMKYGVQxAtjP7j9wVbp
         UEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698905164; x=1699509964;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bepNsZiATRafZ7f1bJZa7YPshJfBdy3C9yqnv90bdg4=;
        b=drPm1t/MfEp5OQiU9tiqj08MWJb0hmwdZgzukXfXFPZoWk/qTIMWaNORXYftAzGUQ8
         6rLq3kiw0QZdFC9q9fv7V9nAmNZcOZUYKSbwI9iZuilP8M1jtUdCJP24+O25jT5fe+dD
         Ht/dH4hSh/iI76Zm81/atQtDoUvr+KVYxdyQ1dDE4VXgJlDDxN+aTNHWoXhBkAb5cx4X
         iKgxHQa5qutVU+/dTd8JBYorRoK9igTF7JmNo0Ccu8Tqpn9rqEalrHoxdc+hk1djOsoj
         ctA30yko42b3j/apMqTAICs2jbNOT4sn6a3aHe04CFHmQRUvMAbg4Hdhf+OO/at80ye9
         sm/A==
X-Gm-Message-State: AOJu0Yw0jo3KTxQOguHATxe5iYDHgwGFZSp1lNQu202lt6SxEJQ2R2Qa
	3kxcKsXvsqzZmPBw0sU65I/tL8G/eiWoErMjrHidSCiE
X-Google-Smtp-Source: AGHT+IH60SKpRcK1pGfvFnSs7QQC+O/fYxdB9mh5HEVhBSL+D1gkdXritcV9vNz7nYdzjoTuUyWzaA==
X-Received: by 2002:a17:903:887:b0:1cc:3bd3:73e4 with SMTP id kt7-20020a170903088700b001cc3bd373e4mr10373278plb.4.1698905163837;
        Wed, 01 Nov 2023 23:06:03 -0700 (PDT)
Received: from ?IPV6:2601:645:8100:1350:b57a:76c2:10a1:3307? ([2601:645:8100:1350:b57a:76c2:10a1:3307])
        by smtp.gmail.com with ESMTPSA id c4-20020a170903234400b001c9c97beb9csm2230335plh.71.2023.11.01.23.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 23:06:02 -0700 (PDT)
Message-ID: <823bc4a1-bb04-4df2-9992-cdb6a7e8facc@google.com>
Date: Wed, 1 Nov 2023 23:06:00 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb:gadget:uvc Do not use worker thread to pump usb
 requests
Content-Language: en-US
From: Jayant Chowdhary <jchowdhary@google.com>
To: Michael Grzeschik <mgr@pengutronix.de>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thinh.Nguyen@synopsys.com, arakesh@google.com, etalvala@google.com,
 dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <ZToOJhyOFeGCGUFj@pengutronix.de>
 <20231026215635.2478767-1-jchowdhary@google.com>
 <20231027075117.GJ26306@pendragon.ideasonboard.com>
 <ZTuanepgXLXRoSMW@pengutronix.de>
 <20231027114752.GB12144@pendragon.ideasonboard.com>
 <ZTu9oEw1QEOxbHCf@pengutronix.de>
 <7c30f943-aaad-47dd-9ae3-02f1ca57e49b@rowland.harvard.edu>
 <ZTzsJo1/NPVTLCnY@pengutronix.de>
 <5fd7d151-cf60-48e1-8eae-fe39039a5acb@google.com>
 <d2b0544e-bd75-4ccd-9b7e-60bf58fcc0d5@google.com>
In-Reply-To: <d2b0544e-bd75-4ccd-9b7e-60bf58fcc0d5@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/30/23 23:11, Jayant Chowdhary wrote:
> Hi,
>
> On 10/28/23 07:09, Jayant Chowdhary wrote:
>> Hi,
>>
>> On 10/28/23 04:10, Michael Grzeschik wrote:
>>> On Fri, Oct 27, 2023 at 10:58:11AM -0400, Alan Stern wrote:
>>>> On Fri, Oct 27, 2023 at 03:39:44PM +0200, Michael Grzeschik wrote:
>>>>> On Fri, Oct 27, 2023 at 02:47:52PM +0300, Laurent Pinchart wrote:
>>>>>> On Fri, Oct 27, 2023 at 01:10:21PM +0200, Michael Grzeschik wrote:
>>>>>>> On Fri, Oct 27, 2023 at 10:51:17AM +0300, Laurent Pinchart wrote:
>>>>>>>> On Thu, Oct 26, 2023 at 09:56:35PM +0000, Jayant Chowdhary wrote:
>>>>>>>>> This patch is based on top of
>>>>>>>>> https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:
>>>>>>>>>
>>>>>>>>> When we use an async work queue to perform the function of pumping
>>>>>>>>> usb requests to the usb controller, it is possible that thread scheduling
>>>>>>>>> affects at what cadence we're able to pump requests. This could mean usb
>>>>>>>>> requests miss their uframes - resulting in video stream flickers on the host
>>>>>>>>> device.
>>>>>>>>>
>>>>>>>>> In this patch, we move the pumping of usb requests to
>>>>>>>>> 1) uvcg_video_complete() complete handler for both isoc + bulk
>>>>>>>>>     endpoints. We still send 0 length requests when there is no uvc buffer
>>>>>>>>>     available to encode.
>>>>>>>> This means you will end up copying large amounts of data in interrupt
>>>>>>>> context. The work queue was there to avoid exactly that, as it will
>>>>>>>> introduce delays that can affect other parts of the system. I think this
>>>>>>>> is a problem.
>>>>>>> Regarding Thin's argument about possible scheduling latency that is already
>>>>>>> introducing real errors, this seemed like a good solution.
>>>>>>>
>>>>>>> But sure, this potential latency introduced in the interrupt context can
>>>>>>> trigger other side effects.
>>>>>>>
>>>>>>> However I think we need some compromise since both arguments are very valid.
>>>>>> Agreed.
>>>>>>
>>>>>>> Any ideas, how to solve this?
>>>>>> I'm afraid not.
>>>>> We discussed this and came to the conclusion that we could make use of
>>>>> kthread_create and sched_setattr with an attr->sched_policy = SCHED_DEADLINE
>>>>> here instead of the workqueue. This way we would ensure that the worker
>>>>> would be triggered with hard definitions.
>>>>>
>>>>> Since the SG case is not that heavy on the completion handler, we could
>>>>> also make this kthread conditionaly to the memcpy case.
>>>> If you don't mind a naive suggestion from someone who knows nothing
>>>> about the driver...
>>>>
>>>> An attractive possibility is to have the work queue (or kthread) do the
>>>> time-consuming copying, but leave the submission up to the completion
>>>> handler.  If the data isn't ready (or there's no data to send) when the
>>>> handler runs, then queue a 0-length request.
>>>>
>>>> That will give you the best of both worlds: low latency while in
>>>> interrupt context and a steady, constant flow of USB transfers at all
>>>> times.  The question of how to schedule the work queue or kthread is a
>>>> separate matter, not directly relevant to this design decision.
>>> That's it. This is probably the best way to tackle the overall problem.
>>>
>>> So we leave the call of the encode callback to the worker, that will
>>> probably still can be a workqueue. The complete callback is calling
>>> the explicit uvcg_video_ep_queue when prepared requests are available
>>> and if there is nothing pending it will just enqueue zero requests.
>>>
>>> Thank you Alan, this makes so much sense!
>>>
>>> Jayant, Laurent: Do you agree?
>>> If yes, Jayant will you change the patch accordingly?
>>>
>>>
>> Thanks for all the discussion Greg, Michael, Laurent and Alan.
>> Apologies for not responding earlier since I am OOO.
>>
>> While I  haven't tried this out this does seem like a very good idea.
>> Thank you Alan! I will aim to make changes and post a patch on Monday night PST.
> I got caught up with some work which is taking longer than expected. Apologies for the
> delay :) I'm testing some things out right now. I hope to be able to post a patch in the
> next couple of days. Thanks for your patience.

I posted another patch at https://lore.kernel.org/linux-usb/20231102060120.1159112-1-jchowdhary@google.com/T/#u.
I've not split this into 2 patches since here, we have a common function that handles both the bulk and isoc
cases and I feel they're logically related. 

Thank you

Jayant


