Return-Path: <linux-usb+bounces-22901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C3A842AE
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 14:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45F35179AD6
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 12:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CD32836A0;
	Thu, 10 Apr 2025 12:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q+IXed3a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA720A5EE
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287153; cv=none; b=aSCKf2gG0NBdUIH++lX4tVv+paYIqAVOsbHJfn59ravD/TjjYnqIHIdvNhEyWDTKjtuLmMZJBfTDtF81RWU7/4IRqzLiFet2EPysvUctg3jOlWqznWxvo6T8wD3k91ERKCVZ1nLYd3Dd4+mqZzcj6At8k2hxs8XZLszPfVtsR8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287153; c=relaxed/simple;
	bh=MkDM6HZPnxJ7Aw3TgwYFZfD2s6KMdDf0cZu3o3dSUSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DG4LzIginZ/RAhygUnyBg5/DPi3fPRe3OID6+y3SBa9UXkUFBvHzRGVaqvANgCMI+c0ASdXe8dLvvO6we4tUejpjcX05FBc0UFW8fB3oar9KVGyCG3zOoc/XjWpLRBOeUY8pUO+Iml7Ns7IjrWQjtgPEao5SgPMj6XZoOny2xWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=q+IXed3a; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edb40f357so6570395e9.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 05:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744287148; x=1744891948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4iryWvrOkOB9Ub1dMT0lm9Ie/uKu1QsAxjTkNUenfk=;
        b=q+IXed3aoTNCuHAvyhHsaSg9iaksrS6a+tbPNNaNYHYnYCmdqew5n1KKTVxTy7L5bP
         Kj0IpFB2A0elvHwQ/99CTOY3CFjUqhQs9uGhUBOL/IPXic6OtWjtFFneWlVMbnOAjLQs
         A25igMU8N3t1ckMu4+7S8HHQUtvktm8o9LIAfSJYwVrpszSwZDTAwnKQ796KP1wZzBut
         iGoqTHHRLRXTD/uM9tfON9GFFBkJih+RY5JAfOx8UeNeXhMwt2R3Vfra1t3CVhduCYVv
         stSeqeSR+ZKLOow0KrynSOBkvipfH6unttxgfTHUvt9HDn/avnzzh51rrOkdd1fQCmeW
         ab2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287148; x=1744891948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4iryWvrOkOB9Ub1dMT0lm9Ie/uKu1QsAxjTkNUenfk=;
        b=LO8sfiF3KYQVEdysYvyKngyTSJIO0SsviwYujgx3yQlyPRXlHp2Inq11DYGbd6RaGc
         B0DjB/XzD6OfljPiIRRKcceLkqAI9R6Ht8lFwPd5Pd+62B5T9TAQJ3SSxUUrSm4a4xj9
         W+ZUcCk4f5bPtqPZ+qh57sbkYIOFXW/omM81LlnX8hgnuJOXPitE7TVD2PQlVu0m+k3n
         05ufHMaYqUHboQLXzx0h15YljSib5DG6Anmn0PY3w6TFqL8nlfwRuhcR6mfpr1A5JJGr
         0MizMla3QeDAIRSuOgWLcHovZNm6WrHwfQ+1z1MAwXC7rdSf0IAu+0k5Y/NHBH7f9pqZ
         uY3A==
X-Gm-Message-State: AOJu0YwmZIHdK97MhSy6fFYgrPCtcsJ/gN2GBYK4R1iUMA9kfj6BizTe
	hJn5g+HLBoaJXfj3ORmwWwjT3GzlIeUVzY4ChNm0gOCbUdx2DuE8upt2pXjiCUQ=
X-Gm-Gg: ASbGncvb0d4kiBsxRExpDuZt+SlWPwoB0DqfRJ1IPSU90y+gblDRfEvVoxu5dQVvAqr
	9WK9f7kuBA/zeesaAt8iYqa8A4l3RbUXoYdkF4vQkfDmjmCSI5uIi/7qDrSerMGUQDLwYLSDyUW
	YfiUdZiAvwZoeic9tnJt5KqqLtn1iGCmV5Rc904bk1NpUj5kuae69dEBKKkJKH8i6Ctr228i3xh
	u9J7s3k3eVjfKMZ0vrZGh6XZFHVyykPPUoQltfy0HfleUyzidbjUobJ0L0laHXZHo7HkdiXfoe/
	fPAt+pY7ynA77Z1z/zwmXSwn5/IolfMdMXi//NwDZUzEJL25wVQn2nZQpAikvW2l/zE96ikteR2
	co1RGbcAgLg5HCJJ9DWLYbbo=
X-Google-Smtp-Source: AGHT+IFmuP9fnj8bf/1r3kSzvKKtQFlf5LmRn48HEMFMkAGC6zRC/hckoJrI10PnnPQ4G/Bxij/tdA==
X-Received: by 2002:a05:600c:b99:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43f2d7bc0c0mr29918505e9.9.1744287147748;
        Thu, 10 Apr 2025 05:12:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:355:6b90:e24f:43ff:fee6:750f? ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecf30sm53164395e9.1.2025.04.10.05.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:12:26 -0700 (PDT)
Message-ID: <c4db0757-4a64-4622-86b7-ca6c78c3c670@baylibre.com>
Date: Thu, 10 Apr 2025 14:12:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Frode Isaksen <frode@meta.com>
References: <20250327141630.2085029-1-fisaksen@baylibre.com>
 <20250401234908.npkn5h3vdyefkvxr@synopsys.com>
 <26644fc1-98c1-4443-9809-b7e4d6cec2e3@baylibre.com>
 <20250402222128.2soczlkfwonz7r3p@synopsys.com>
 <cf51ea66-24b2-49f4-87ec-5165249d53c5@baylibre.com>
 <20250407234337.ejaghhulwqumbk3j@synopsys.com>
 <fa1b7d70-b40c-48cd-9dbe-61b6cf6f8d6d@baylibre.com>
 <20250409011652.kr2q7keumvykxser@synopsys.com>
 <20250410000921.6zffl57kpqbrw7rf@synopsys.com>
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <20250410000921.6zffl57kpqbrw7rf@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 2:09 AM, Thinh Nguyen wrote:
> On Wed, Apr 09, 2025, Thinh Nguyen wrote:
>> On Tue, Apr 08, 2025, Frode Isaksen wrote:
>>> On 4/8/25 1:44 AM, Thinh Nguyen wrote:
>>>> On Thu, Apr 03, 2025, Frode Isaksen wrote:
>>>>> On 4/3/25 12:21 AM, Thinh Nguyen wrote:
>>>>>> On Wed, Apr 02, 2025, Frode Isaksen wrote:
>>>>>>> On 4/2/25 1:49 AM, Thinh Nguyen wrote:
>>>>>>>> On Thu, Mar 27, 2025, Frode Isaksen wrote:
>>>>>>>>> From: Frode Isaksen <frode@meta.com>
>>>>>>>>>
>>>>>>>>> Prevent dwc3_request from being queued twice, by checking
>>>>>>>>> req->status.
>>>>>>>>> Similar to commit b2b6d601365a ("usb: dwc3: gadget: prevent
>>>>>>>>> dwc3_request from being queued twice") for non-ep0 endpoints.
>>>>>>>>> Crash log:
>>>>>>>>> list_add double add: new=ffffff87ab2c7950, prev=ffffff87ab2c7950,
>>>>>>>>>      next=ffffff87ab485b60.
>>>>>>>>> kernel BUG at lib/list_debug.c:35!
>>>>>>>>> Call trace:
>>>>>>>>> __list_add_valid+0x70/0xc0
>>>>>>>>> __dwc3_gadget_ep0_queue+0x70/0x224
>>>>>>>>> dwc3_ep0_handle_status+0x118/0x200
>>>>>>>>> dwc3_ep0_inspect_setup+0x144/0x32c
>>>>>>>>> dwc3_ep0_interrupt+0xac/0x340
>>>>>>>>> dwc3_process_event_entry+0x90/0x724
>>>>>>>>> dwc3_process_event_buf+0x7c/0x33c
>>>>>>>>> dwc3_thread_interrupt+0x58/0x8c
>>>>>>>>>
>>>>>>>>> Signed-off-by: Frode Isaksen <frode@meta.com>
>>>>>>>>> ---
>>>>>>>>> This bug was discovered, tested and fixed (no more crashes seen) on
>>>>>>>>> Meta Quest 3 device. Also tested on T.I. AM62x board.
>>>>>>>>>
>>>>>>>>>      drivers/usb/dwc3/ep0.c    | 5 +++++
>>>>>>>>>      drivers/usb/dwc3/gadget.c | 1 +
>>>>>>>>>      2 files changed, 6 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>>>>>>>>> index 666ac432f52d..e26c3a62d470 100644
>>>>>>>>> --- a/drivers/usb/dwc3/ep0.c
>>>>>>>>> +++ b/drivers/usb/dwc3/ep0.c
>>>>>>>>> @@ -91,6 +91,11 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
>>>>>>>>>      {
>>>>>>>>>      	struct dwc3		*dwc = dep->dwc;
>>>>>>>>> +	if (WARN(req->status < DWC3_REQUEST_STATUS_COMPLETED,
>>>>>>>> Let's not use WARN. Perhaps dev_warn?
>>>>>>> I copied the coding style from commit b2b6d601365a ("usb: dwc3: gadget:
>>>>>>> prevent
>>>>>>>
>>>>>>> dwc3_request from being queued twice"), so maybe a follow-up patch to change from WARN to dev_warn for the two patches ?
>>>>>> We can just use dev_warn here, we don't need 2 separate patches for this
>>>>>> change. The other place can be reworked in a separate patch.
>>>>> OK
>>>>>>>>> +				"%s: request %pK already in flight\n",
>>>>>>>>> +				dep->name, &req->request))
>>>>>>>>> +		return -EINVAL;
>>>>>>>>> +
>>>>>>>>>      	req->request.actual	= 0;
>>>>>>>>>      	req->request.status	= -EINPROGRESS;
>>>>>>>>>      	req->epnum		= dep->number;
>>>>>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>>>>>>> index 89a4dc8ebf94..c34446d8c54f 100644
>>>>>>>>> --- a/drivers/usb/dwc3/gadget.c
>>>>>>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>>>>>>> @@ -3002,6 +3002,7 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
>>>>>>>>>      	dwc->ep0_bounced = false;
>>>>>>>>>      	dwc->link_state = DWC3_LINK_STATE_SS_DIS;
>>>>>>>>>      	dwc->delayed_status = false;
>>>>>>>>> +	dwc->ep0_usb_req.status = DWC3_REQUEST_STATUS_UNKNOWN;
>>>>>>>>>      	dwc3_ep0_out_start(dwc);
>>>>>>>>>      	dwc3_gadget_enable_irq(dwc);
>>>>>>>>> -- 
>>>>>>>>> 2.48.1
>>>>>>>>>
>>>>>>>> I'm still not clear how this can happen. Are you testing this against
>>>>>>>> mainline? Can you provide the dwc3 tracepoints?
>>>>>>> I was not able to reproduce this locally. Was seen on 5.10, tested on 6.1
>>>>>>> and 6.6.
>>>>>>>
>>>>>> Without understanding how this can happen and why it is needed, we
>>>>>> should not just apply this. Kernel v5.10, v6.1, and v6.6 are really old.
>>>>>> We have a lot of fixes since then. Please see if this is reproducible
>>>>>> using mainline.
>>>>> We have applied all relevant patches from mainline to ep0.c, in order to try
>>>>> to fix this crash:
>>>> What causes the crash? I'm still not clear whether you were able to
>>>> reproduced this on mainline, or any of the new stable tree.
> <snip>
>
>>> I was not able to reproduce this bug locally in any version.
> Sorry, I totally missed this response...
>
> <snip>
>
>>> There were first a WARNING:
>>>
>>> <4>[ 341.860109] WARNING: CPU: 0 PID: 8548 at drivers/usb/dwc3/ep0.c:1077
>>> dwc3_ep0_interrupt+0x1e8/0x340
>>>
>>> Here:
>>>
>>> static void __dwc3_ep0_do_control_status(struct dwc3 *dwc, struct dwc3_ep
>>> *dep) { WARN_ON(dwc3_ep0_start_control_status(dep)); } and then the crash:
>>>
>>> <3>[ 351.674418] list_add double add: new=ffffff87ab2c7950,
>>> prev=ffffff87ab2c7950, next=ffffff87ab485b60.
>>>
>>> <6>[ 351.674437] ------------[ cut here ]------------
>>>
>>> <2>[ 351.674439] kernel BUG at lib/list_debug.c:35!
>>>
>>> <0>[ 351.674447] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
>>>
>>> <6>[ 351.675047] Call trace:
>>>
>>> <6>[ 351.675052] __list_add_valid+0x70/0xc0
>>>
>>> <6>[ 351.675060] __dwc3_gadget_ep0_queue+0x70/0x224
>>>
>>> <6>[ 351.675064] dwc3_ep0_handle_status+0x118/0x200
>>>
>>> <6>[ 351.675068] dwc3_ep0_inspect_setup+0x144/0x32c
>>>
>>> <6>[ 351.675073] dwc3_ep0_interrupt+0xac/0x340
>>>
>>> <6>[ 351.675078] dwc3_process_event_entry+0x90/0x724
>>>
>>> <6>[ 351.675082] dwc3_process_event_buf+0x7c/0x33c
>>>
>>> <6>[ 351.675086] dwc3_thread_interrupt+0x58/0x8c
>>>
>>> <6>[ 351.675092] irq_thread_fn+0x54/0xd4
>>>
>>> This is all I have..
>>>
>> Hm... which kernel version was this reproduced?
>>
>> Are you using the usb composite framework? The control transfers are
>> driven by the host, and the usb gadget composite framework should not
>> hit scenarios like this.
>>
>> Can you capture the tracepoints* for dwc3?
>> [*] https://docs.kernel.org/driver-api/usb/dwc3.html#reporting-bugs
> Ignore this request since you can't reproduce this bug. But can you help
> answer the question above about whether you used the usb composite
> framework?
>
> Thanks,
> Thinh

Yes, I thinks it's using the composite framework, as there are two 
interfaces XRSP and ADB.

Thanks,

Frode


