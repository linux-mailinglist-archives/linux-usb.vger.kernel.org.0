Return-Path: <linux-usb+bounces-2383-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B35F7DC665
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 07:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E7901C20C57
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 06:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E16101E4;
	Tue, 31 Oct 2023 06:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ODhvzx57"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E927101F4
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 06:18:48 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8F210A
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 23:11:27 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6cd0963c61cso3085341a34.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 23:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698732686; x=1699337486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6ezeYuQIuE//BQpuWO7iBmF0kvV+NzAQu32NrpEGqU=;
        b=ODhvzx57vd5ufUhcY5RJ5IpsUdNYK5D1wlhv5RIww4EG3y0cJgyRmfZrFmWHRrOw66
         4HcJqNXB+w2sxM+YuY3JFUMf4SHRo5r4eOJTWSK2w3o8P23abDrhgX0B8NFmMZam47IT
         UmRHjcnc6LhQK5lhAakC23Fryp+D+qfH+kDvpRAKJC5gfGAgPRNPuJkOVKIddZJgq0rW
         EuONvWEXCV85805OCtcLZmN1721rrHEfJVVI3X0lwORfl59yLW/1TMoCX5G5CL5W4snt
         6/QNheq+ElpNjyRqTGilDf3Ab+wXd5iSjBug3+pjaAcI8x+qqfXHvYEzeGQnXi/EtPva
         tgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698732686; x=1699337486;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r6ezeYuQIuE//BQpuWO7iBmF0kvV+NzAQu32NrpEGqU=;
        b=rGeyTaCTsEJZ1ilxd/bdnJD/tOcr0rOBYXvdcNCiZMGVJ8UtN+Lnr/1evIJCUtE00o
         wyGljBKRsh1OUco/zJU04B4FAzA6JbhBvs5hxyHnIFCNLxMD2/0OHEuXuMf+BLOFkL9T
         TJ7mred+ZJWSJRigl0eohnpP2J6GWmuY2UYD1ldWj4CimDX/uDAMQVjlclIfhBlGkH9F
         Ca3QJv+l1mma7zLEwIwvxHrwBD/E/8hOu1/57XJi8Twinxb5OkSRMSWIaBhWov097hp0
         yKxQyGYdG+HJJQlNF+f0a0IMzkPo2wYH7jWtWVQh39WI0PNvGq48cqiazTLDexXLpReT
         5huQ==
X-Gm-Message-State: AOJu0YwFSKAQ6luBVXGZbU1U4iWsNzozh0IYtyyUJBgIubkRJ4Olzi6v
	frHkhB1/5Aoj8LOnsfv7ebVf2w==
X-Google-Smtp-Source: AGHT+IH+Jk1EPH2zi4xW8cGoi2Xt6+IDW4DD3/PmJGGbyW7p3NnqybJ+sm416GbzheFmm8hGg/JX3Q==
X-Received: by 2002:a05:6808:b0a:b0:3b5:6493:9f2c with SMTP id s10-20020a0568080b0a00b003b564939f2cmr919724oij.26.1698732686342;
        Mon, 30 Oct 2023 23:11:26 -0700 (PDT)
Received: from ?IPV6:2601:645:8100:1350:c518:3438:c57:19f5? ([2601:645:8100:1350:c518:3438:c57:19f5])
        by smtp.gmail.com with ESMTPSA id n22-20020a056a0007d600b006933e71956dsm483889pfu.9.2023.10.30.23.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 23:11:25 -0700 (PDT)
Message-ID: <d2b0544e-bd75-4ccd-9b7e-60bf58fcc0d5@google.com>
Date: Mon, 30 Oct 2023 23:11:22 -0700
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
In-Reply-To: <5fd7d151-cf60-48e1-8eae-fe39039a5acb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/28/23 07:09, Jayant Chowdhary wrote:
> Hi,
>
> On 10/28/23 04:10, Michael Grzeschik wrote:
>> On Fri, Oct 27, 2023 at 10:58:11AM -0400, Alan Stern wrote:
>>> On Fri, Oct 27, 2023 at 03:39:44PM +0200, Michael Grzeschik wrote:
>>>> On Fri, Oct 27, 2023 at 02:47:52PM +0300, Laurent Pinchart wrote:
>>>>> On Fri, Oct 27, 2023 at 01:10:21PM +0200, Michael Grzeschik wrote:
>>>>>> On Fri, Oct 27, 2023 at 10:51:17AM +0300, Laurent Pinchart wrote:
>>>>>>> On Thu, Oct 26, 2023 at 09:56:35PM +0000, Jayant Chowdhary wrote:
>>>>>>>> This patch is based on top of
>>>>>>>> https://lore.kernel.org/linux-usb/20230930184821.310143-1-arakesh@google.com/T/#t:
>>>>>>>>
>>>>>>>> When we use an async work queue to perform the function of pumping
>>>>>>>> usb requests to the usb controller, it is possible that thread scheduling
>>>>>>>> affects at what cadence we're able to pump requests. This could mean usb
>>>>>>>> requests miss their uframes - resulting in video stream flickers on the host
>>>>>>>> device.
>>>>>>>>
>>>>>>>> In this patch, we move the pumping of usb requests to
>>>>>>>> 1) uvcg_video_complete() complete handler for both isoc + bulk
>>>>>>>>     endpoints. We still send 0 length requests when there is no uvc buffer
>>>>>>>>     available to encode.
>>>>>>> This means you will end up copying large amounts of data in interrupt
>>>>>>> context. The work queue was there to avoid exactly that, as it will
>>>>>>> introduce delays that can affect other parts of the system. I think this
>>>>>>> is a problem.
>>>>>> Regarding Thin's argument about possible scheduling latency that is already
>>>>>> introducing real errors, this seemed like a good solution.
>>>>>>
>>>>>> But sure, this potential latency introduced in the interrupt context can
>>>>>> trigger other side effects.
>>>>>>
>>>>>> However I think we need some compromise since both arguments are very valid.
>>>>> Agreed.
>>>>>
>>>>>> Any ideas, how to solve this?
>>>>> I'm afraid not.
>>>> We discussed this and came to the conclusion that we could make use of
>>>> kthread_create and sched_setattr with an attr->sched_policy = SCHED_DEADLINE
>>>> here instead of the workqueue. This way we would ensure that the worker
>>>> would be triggered with hard definitions.
>>>>
>>>> Since the SG case is not that heavy on the completion handler, we could
>>>> also make this kthread conditionaly to the memcpy case.
>>> If you don't mind a naive suggestion from someone who knows nothing
>>> about the driver...
>>>
>>> An attractive possibility is to have the work queue (or kthread) do the
>>> time-consuming copying, but leave the submission up to the completion
>>> handler.  If the data isn't ready (or there's no data to send) when the
>>> handler runs, then queue a 0-length request.
>>>
>>> That will give you the best of both worlds: low latency while in
>>> interrupt context and a steady, constant flow of USB transfers at all
>>> times.  The question of how to schedule the work queue or kthread is a
>>> separate matter, not directly relevant to this design decision.
>> That's it. This is probably the best way to tackle the overall problem.
>>
>> So we leave the call of the encode callback to the worker, that will
>> probably still can be a workqueue. The complete callback is calling
>> the explicit uvcg_video_ep_queue when prepared requests are available
>> and if there is nothing pending it will just enqueue zero requests.
>>
>> Thank you Alan, this makes so much sense!
>>
>> Jayant, Laurent: Do you agree?
>> If yes, Jayant will you change the patch accordingly?
>>
>>
> Thanks for all the discussion Greg, Michael, Laurent and Alan.
> Apologies for not responding earlier since I am OOO.
>
> While I  haven't tried this out this does seem like a very good idea.
> Thank you Alan! I will aim to make changes and post a patch on Monday night PST.

I got caught up with some work which is taking longer than expected. Apologies for the
delay :) I'm testing some things out right now. I hope to be able to post a patch in the
next couple of days. Thanks for your patience.

Jayant


