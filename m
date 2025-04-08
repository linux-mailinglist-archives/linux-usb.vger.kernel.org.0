Return-Path: <linux-usb+bounces-22732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A3A7F6EB
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 09:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC1E3AB25F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 07:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D57B2638B8;
	Tue,  8 Apr 2025 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="d9m7Bx6J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396B7263F5E
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097930; cv=none; b=pFcZOS8aYcwk6dF2Mi93rUjPsmh7p1i6Df2luLOzXEg1NaFHeMGTs/+kdySg4Hz/w9EHim1DTkGclecVFWnKwbLrRC5BKw05DfN31WEZXpeH/7Y7muSp8+lP1BNuIT/M4ictTlLPu0B8bO4rr1TxvzUD3NFCp2tIfWNxyNAF5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097930; c=relaxed/simple;
	bh=uhqIYIkpMHheXJSPsdZKCYY8Smc7pIb3Af4gK9h/sJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNxDgmHg/rvyyg/vyjCnyMjWOdCoKWLhZ6CSx7sKnQOT7+jSKL3JI8uLCUl3F+R5jD1a8fsALqhqnGoLSRuCOwDLtDmuf7urWilg5bHLYT5inIdpYF9vhMw7KM+EzUFCYx+iQ30PmcSmodtCh55dW7cjYW2NnaoGmmDczpswYso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=d9m7Bx6J; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0618746bso37339845e9.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Apr 2025 00:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744097924; x=1744702724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHiVA/BbFDHj9t+LwB6syhW0Shef5KI+cKqbJQXyVpk=;
        b=d9m7Bx6JLDen/D8t91coXdKVpPMZrb3t5DjtnErei6UAhC/X7LUjAcBEOXfMi/eYXq
         sp+V+MdvlkzNz+Y5kHQfb0CniC208wql6sCbow31w6Vk5l7ZbcrxetQ/vLUoyt9CcolH
         Mog3Racnfk81ARydwQ+3uMIoQTpRa7UtoVC08Sm063vIhhjbbY8ZWIRMbeKn2QiUaApx
         NhOfyBZ72DErE4RSFWWmnQAKndlTykPh04Uz7p0yeMUfE6bDTw8XXkYij37BZwDbW+kd
         msd28+VrjOqmjiJoc1QiyEeKV51Kb/HC7DksG7D0Hpuvbr54TXFC2+PxeaeWF1Bwzn4m
         KaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097924; x=1744702724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHiVA/BbFDHj9t+LwB6syhW0Shef5KI+cKqbJQXyVpk=;
        b=J4jDPIJETvW7XkzemCFObEctcDKc88FXyp0K6ko4eP7eTXpqe4QfnUTJ90UABPhuox
         3Z95dF0R44NTjfgjE96pNJ6IMAAgTW681gCn5kfT8k8OLOFWKZVqxmyEAFcVVQ94Jtar
         HhEsAhmBZAIGjcIF52Ky9Q/94gVjYFmCfkOwQwKpAUx2Xc70OL1cqtaRCM+E+rg9AhqO
         UMHkuJVZusL9gvthjNWtBCX835dVP/h5d9AjzQzOR9mUe470kBtIvnIxduMW9ZyxAPfX
         VSOSX2fulpbkAkAZ2x22+1RQJSf7Bkdj4kOiTFWpoyHiOmbAPJRPDjMvtYLoJWIjoh5R
         2Kkg==
X-Gm-Message-State: AOJu0YwwVDKCFCn3Q4XfzyV4AqYXyJnaSUf+IFz9WzKHQwn5bOxFAJjN
	VvlkefIk3DObXLRclFNfrxg30iRto/xPi0e/TBn++rmHCsmiE1KkEYJA0FfkdBUJxgRUXTbGThS
	oSIFYMg==
X-Gm-Gg: ASbGncveZYDfKqjVNHzGZ+C9NE7njNUzbqSrAxUHqLPD6uwfNBA/sGoTZ9E8ncs8xUt
	NAkoW+DMiRllPnIqFMwrBv+wiKYdyzWuAX/H7Sh4vTbLZRrlDeN1xF2igAjnvor+F0Gm9gpaqWY
	bqff2z1aLNBNvWa2rtUXgSVSZ3zZyN4Ob/E/2QOF9cYrFpaglbJCfmoNWNC/sV5ylCx72EYxL34
	ANbQMqCPoodIPmNzVx8Ig19B2kU6pZfrEbS3UFzyKD8JJU/ucUqboNIul6/8SaJuG/Vn3kDsOzk
	hLcSelsNey4nmPXDClmiRjvR98ke0CoO3FVa5H/fQ8guiHCC9HvJOItZneLSx1gmW/HkPGr9yd3
	BIiVGVsjPty/sJ85t
X-Google-Smtp-Source: AGHT+IHtgJ65YNixffuqzrAiGGYa++1Xh2cPof8SuaKfWXARRRYoxM+CZdV/aI65yhhdGmqPsKLSZw==
X-Received: by 2002:a05:600c:3587:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-43ecf57d332mr143275085e9.0.1744097924043;
        Tue, 08 Apr 2025 00:38:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:355:6b90:e24f:43ff:fee6:750f? ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b7933sm14492851f8f.54.2025.04.08.00.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 00:38:43 -0700 (PDT)
Message-ID: <fa1b7d70-b40c-48cd-9dbe-61b6cf6f8d6d@baylibre.com>
Date: Tue, 8 Apr 2025 09:38:42 +0200
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
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <20250407234337.ejaghhulwqumbk3j@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/25 1:44 AM, Thinh Nguyen wrote:
> On Thu, Apr 03, 2025, Frode Isaksen wrote:
>> On 4/3/25 12:21 AM, Thinh Nguyen wrote:
>>> On Wed, Apr 02, 2025, Frode Isaksen wrote:
>>>> On 4/2/25 1:49 AM, Thinh Nguyen wrote:
>>>>> On Thu, Mar 27, 2025, Frode Isaksen wrote:
>>>>>> From: Frode Isaksen <frode@meta.com>
>>>>>>
>>>>>> Prevent dwc3_request from being queued twice, by checking
>>>>>> req->status.
>>>>>> Similar to commit b2b6d601365a ("usb: dwc3: gadget: prevent
>>>>>> dwc3_request from being queued twice") for non-ep0 endpoints.
>>>>>> Crash log:
>>>>>> list_add double add: new=ffffff87ab2c7950, prev=ffffff87ab2c7950,
>>>>>>     next=ffffff87ab485b60.
>>>>>> kernel BUG at lib/list_debug.c:35!
>>>>>> Call trace:
>>>>>> __list_add_valid+0x70/0xc0
>>>>>> __dwc3_gadget_ep0_queue+0x70/0x224
>>>>>> dwc3_ep0_handle_status+0x118/0x200
>>>>>> dwc3_ep0_inspect_setup+0x144/0x32c
>>>>>> dwc3_ep0_interrupt+0xac/0x340
>>>>>> dwc3_process_event_entry+0x90/0x724
>>>>>> dwc3_process_event_buf+0x7c/0x33c
>>>>>> dwc3_thread_interrupt+0x58/0x8c
>>>>>>
>>>>>> Signed-off-by: Frode Isaksen <frode@meta.com>
>>>>>> ---
>>>>>> This bug was discovered, tested and fixed (no more crashes seen) on
>>>>>> Meta Quest 3 device. Also tested on T.I. AM62x board.
>>>>>>
>>>>>>     drivers/usb/dwc3/ep0.c    | 5 +++++
>>>>>>     drivers/usb/dwc3/gadget.c | 1 +
>>>>>>     2 files changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>>>>>> index 666ac432f52d..e26c3a62d470 100644
>>>>>> --- a/drivers/usb/dwc3/ep0.c
>>>>>> +++ b/drivers/usb/dwc3/ep0.c
>>>>>> @@ -91,6 +91,11 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
>>>>>>     {
>>>>>>     	struct dwc3		*dwc = dep->dwc;
>>>>>> +	if (WARN(req->status < DWC3_REQUEST_STATUS_COMPLETED,
>>>>> Let's not use WARN. Perhaps dev_warn?
>>>> I copied the coding style from commit b2b6d601365a ("usb: dwc3: gadget:
>>>> prevent
>>>>
>>>> dwc3_request from being queued twice"), so maybe a follow-up patch to change from WARN to dev_warn for the two patches ?
>>> We can just use dev_warn here, we don't need 2 separate patches for this
>>> change. The other place can be reworked in a separate patch.
>> OK
>>>>>> +				"%s: request %pK already in flight\n",
>>>>>> +				dep->name, &req->request))
>>>>>> +		return -EINVAL;
>>>>>> +
>>>>>>     	req->request.actual	= 0;
>>>>>>     	req->request.status	= -EINPROGRESS;
>>>>>>     	req->epnum		= dep->number;
>>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>>>> index 89a4dc8ebf94..c34446d8c54f 100644
>>>>>> --- a/drivers/usb/dwc3/gadget.c
>>>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>>>> @@ -3002,6 +3002,7 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
>>>>>>     	dwc->ep0_bounced = false;
>>>>>>     	dwc->link_state = DWC3_LINK_STATE_SS_DIS;
>>>>>>     	dwc->delayed_status = false;
>>>>>> +	dwc->ep0_usb_req.status = DWC3_REQUEST_STATUS_UNKNOWN;
>>>>>>     	dwc3_ep0_out_start(dwc);
>>>>>>     	dwc3_gadget_enable_irq(dwc);
>>>>>> -- 
>>>>>> 2.48.1
>>>>>>
>>>>> I'm still not clear how this can happen. Are you testing this against
>>>>> mainline? Can you provide the dwc3 tracepoints?
>>>> I was not able to reproduce this locally. Was seen on 5.10, tested on 6.1
>>>> and 6.6.
>>>>
>>> Without understanding how this can happen and why it is needed, we
>>> should not just apply this. Kernel v5.10, v6.1, and v6.6 are really old.
>>> We have a lot of fixes since then. Please see if this is reproducible
>>> using mainline.
>> We have applied all relevant patches from mainline to ep0.c, in order to try
>> to fix this crash:
> What causes the crash? I'm still not clear whether you were able to
> reproduced this on mainline, or any of the new stable tree.
I was not able to reproduce this bug locally in any version.
>
>> 566bc793bdd7 usb: dwc3: ep0: Don't clear ep0 DWC3_EP_TRANSFER_STARTED
>> 371d3fc577db usb: dwc3: ep0: Don't reset resource alloc flag (including ep0)
>> d819a0bbb493 usb: dwc3: ep0: Don't reset resource alloc flag
>> 2eb3ba38bf88 usb: dwc3: gadget: Rewrite endpoint allocation flow
>> cbfcf517dc42 FROMGIT: usb: dwc: ep0: Update request status in
>> dwc3_ep0_stall_restart
>> 4fc39328579e UPSTREAM: usb: dwc3: Avoid unmapping USB requests if endxfer is
>> not complete
>> 5dc06419d8a6 UPSTREAM: usb: dwc3: Do not service EP0 and conndone events if
>> soft disconnected
>> 75a4f0b5e1f4 UPSTREAM: usb: dwc3: ep0: Properly handle setup_packet_pending
>> scenario in data stage
>> a79e848e5299 UPSTREAM: usb: dwc3: ep0: Don't prepare beyond Setup stage
>> 910e9e60492a UPSTREAM: usb: dwc3: Fix ep0 handling when getting reset while
>> doing control transfer
>> fe513e1c2685 UPSTREAM: usb: dwc3: gadget: Wait for ep0 xfers to complete
>> during dequeueThan
>>
> Cherry-picking the upstream patch like this will be difficult to debug
> as I can't determine the corresponding changes related to the usb gadget
> core API and the dwc3.

There were first a WARNING:

<4>[ 341.860109] WARNING: CPU: 0 PID: 8548 at 
drivers/usb/dwc3/ep0.c:1077 dwc3_ep0_interrupt+0x1e8/0x340

Here:

static void __dwc3_ep0_do_control_status(struct dwc3 *dwc, struct 
dwc3_ep *dep) { WARN_ON(dwc3_ep0_start_control_status(dep)); } and then 
the crash:

<3>[ 351.674418] list_add double add: new=ffffff87ab2c7950, 
prev=ffffff87ab2c7950, next=ffffff87ab485b60.

<6>[ 351.674437] ------------[ cut here ]------------

<2>[ 351.674439] kernel BUG at lib/list_debug.c:35!

<0>[ 351.674447] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP

<6>[ 351.675047] Call trace:

<6>[ 351.675052] __list_add_valid+0x70/0xc0

<6>[ 351.675060] __dwc3_gadget_ep0_queue+0x70/0x224

<6>[ 351.675064] dwc3_ep0_handle_status+0x118/0x200

<6>[ 351.675068] dwc3_ep0_inspect_setup+0x144/0x32c

<6>[ 351.675073] dwc3_ep0_interrupt+0xac/0x340

<6>[ 351.675078] dwc3_process_event_entry+0x90/0x724

<6>[ 351.675082] dwc3_process_event_buf+0x7c/0x33c

<6>[ 351.675086] dwc3_thread_interrupt+0x58/0x8c

<6>[ 351.675092] irq_thread_fn+0x54/0xd4

This is all I have..

Thanks,

Frode

>
> BR,
> Thinh



