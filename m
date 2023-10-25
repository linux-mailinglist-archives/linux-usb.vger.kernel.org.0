Return-Path: <linux-usb+bounces-2199-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3407D7862
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 01:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E12A1B212F3
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 23:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239D037176;
	Wed, 25 Oct 2023 23:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nJkFEDnF"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE5347CF
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 23:09:32 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8288ABB
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 16:09:30 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c9e95aa02dso2040025ad.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 16:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698275370; x=1698880170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5/8Zhe+/2PuD/bvi5I+6K7bHUYZ7aH71nEnIXb67ts=;
        b=nJkFEDnF/sR5MeFPnISvGlDYpTbzhcQft0p16QyxZHYdrpsnSv5XJHp9apUYygYlIv
         on+5q72m4V+Ls9kWe3+vxkYiYt8c3EFUjXSwQ7z4DUOJbAEOtO+4Pdm7UIQgsUPQJNpI
         oHyyKXG1FkYyUnKBIrNSCYWzAwWSOItBs3vak9FBeHwIO/CU9359V7cwQBnrHZ0KnUxs
         IHFPKwLom6xZp4WXSJIIa3aoMq10FMc4ngO83poNwvMprADAA/8yzSWUxJcDojkLTZsA
         yMrLHf3SOROwnhhz1JjK9NznuFpyJtZNJZKAG05Kc8ZS6R1ImFZUh04ouwXsxHsA3tri
         qV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698275370; x=1698880170;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5/8Zhe+/2PuD/bvi5I+6K7bHUYZ7aH71nEnIXb67ts=;
        b=OwYtSwpWV+uc95AB/EBX/In4s6/+mVoHDLYihP/UENNh1Iuj4QH2PW8cCUd+fc9tfy
         gqWd0znSkhkuPdY8fFW8FaJ+iYdrJBCmYqFK2tGBxeyJwgUr/LPZg4yZDWCJ3dSqaCoV
         bjri/IwAiNzHW3sUy+RELiJj4jFg16HH/O5oP9aXHVT6+ZD4r/jAkfhYiwiHYGYu1Djh
         AC9aBw0myI0RANf4KOFlTKnhIem/VrW55RwsZrM6pqJlRUyG/v5dZ9TkqBIbXVXPFOh4
         lK2C4zxgbT9cqbs/whmh2FP7w9bD1IlYMwBioYchV5Y/P4RHf166NNOcmr6XbkUjcBOs
         5Y1A==
X-Gm-Message-State: AOJu0Ywrn8uxuRYiIlFEHoNEU80Y80OkXh9KAe5Yo1P9hstEGhU/sdMn
	RnwDrXsK1MSDAeo2ymie79Ol5A==
X-Google-Smtp-Source: AGHT+IFbXWNRjQgljYKWXpYcspZdsliQtnJOWE7ugF8hYiXQHTt6dBK2xxX3l95Hv7yFzt9kx7wy5w==
X-Received: by 2002:a17:902:f684:b0:1c7:7c2c:f828 with SMTP id l4-20020a170902f68400b001c77c2cf828mr1319929plg.8.1698275369726;
        Wed, 25 Oct 2023 16:09:29 -0700 (PDT)
Received: from ?IPV6:2620:0:1000:2514:51de:2ba6:1522:9df7? ([2620:0:1000:2514:51de:2ba6:1522:9df7])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902cec400b001c1f4edfb9csm9656210plg.173.2023.10.25.16.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 16:09:29 -0700 (PDT)
Message-ID: <45fe4c79-458a-4eaf-8de8-50682f7d8b52@google.com>
Date: Wed, 25 Oct 2023 16:09:27 -0700
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
 <20231020233044.dh63nu3tkbmrtfl4@synopsys.com>
 <69609645-fa20-4987-981d-1ab264e80b9b@google.com>
 <ZTe5leI7Hvk2/cl9@pengutronix.de>
From: Jayant Chowdhary <jchowdhary@google.com>
In-Reply-To: <ZTe5leI7Hvk2/cl9@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Michael,

On 10/24/23 05:33, Michael Grzeschik wrote:
> On Mon, Oct 23, 2023 at 11:13:03AM -0700, Jayant Chowdhary wrote:
>> Hi Thinh, Michael,
>>
>> On 10/20/23 16:30, Thinh Nguyen wrote:
>>> Sorry for the delay response.
>>>
>>> On Sun, Oct 15, 2023, Jayant Chowdhary wrote:
>>>> On 10/12/23 11:50, Thinh Nguyen wrote:
>>>>> The frequency of the request submission should not depend on the
>>>>> video_pump() work thread since it can vary. The frequency of request
>>>>> submission should match with the request completion. We know that
>>>>> request completion rate should be fixed (1 uframe/request + when you
>>>>> don't set no_interrupt). Base on this you can do your calculation on how
>>>>> often you should set no_interrupt and how many requests you must submit.
>>>>> You don't have to wait for the video_pump() to submit 0-length requests.
>>>>>
>>>>> The only variable here is the completion handler delay or system
>>>>> latency, which should not be much and should be within your calculation.
>>>>
>>>> Thanks for the suggestion. It indeed makes sense that we do not completely depend on
>>>> video_pump() for sending 0 length requests. I was concerned about
>>>> synchronization needed when we send requests to the dwc3 controller from
>>>> different threads. I see that the dwc3 controller code does internally serialize
>>>> queueing requests, can we expect this from other controllers as well ?
>>> While it's not explicitly documented, when the gadget driver uses
>>> usb_ep_queue(), the order in which the gadget recieves the request
>>> should be maintained and serialized. Because the order the transfer go
>>> out for the same endpoint can be critical, breaking this will cause
>>> issue.
>>>
>> Thanks for clarifying this. Keeping this in mind - I made a slight modification to
>> your test patch - I removed the uvc_video_pump() function call from uvc_v4l2_qbuf(). We just
>> call it in uvcg_video_enable(). That should just queue 0 length requests till the first qbuf
>> is called. There-after only the complete handler running uvcg_video_complete() calls video_pump(),
>> which sends usb requests to the endpoint. While I do see that we hold the queue->irqlock while
>> getting the uvc buffer to encode and sending it to the ep, I feel like its just logically safer
>> for future changes if we can restrict the pumping of requests to one thread.
>>
>> Does that seem okay to you ? I can formalize it if it does.
>
> I tested this, and it looks good so far.
>
> Since your changes are minimal you could send this with me as the author
> and add your Suggested-by Tag. You should also add your Tested-by Tag in
> that case.
>
I sent out https://lore.kernel.org/linux-usb/99384044-0d14-4ebe-9109-8a5557e64449@google.com/T/#u

with a Signed-off-by crediting you and suggested by with Avichal and me. It has a few changes related to

bulk end-points as well, but they're relatively minor.

Thanks


