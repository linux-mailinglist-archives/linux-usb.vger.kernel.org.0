Return-Path: <linux-usb+bounces-22514-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10DA7A54D
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 16:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3988016D542
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 14:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B5324EF70;
	Thu,  3 Apr 2025 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OtB2hmxY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E6624BBEF
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690874; cv=none; b=L+9BcQon3hNrSEbBFMYKHoHj5k2HPhlAnoCvqmVEBYqxTSa7jP/kw1b395zwd3oannVTPavvAMjSz8wTjSuTengEbyYEN4GmDAk4ULQhBo1g8i9YpvoVeMu6aiN43fvSFmytxxff5+sF7rKmK3Eri6BHaYRzRNZGKXqTr4/2REU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690874; c=relaxed/simple;
	bh=QCdM9EAHAmyUJcgKoJ3vMOVJQaEm/cyykHj6NrgkE8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ln1DXCDJXrdvn1ZLkJvjpe73dNT1gK2/kTWIDXbJzHk6+HAu3t3eVIuEFCjceIBXP672k48IrwBJvJF3edMPP6U4CDJakDWuwp64e+9UJT3fuul/IlrrujWSeyucMWCAFi4h79wBqHeQvkKZBMZkUJ5lHcDKK2s6AfMapvSB9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OtB2hmxY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ac9aea656so871625f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743690868; x=1744295668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElmazU9eiDu5YgsStdMEUDt4VLgiKXFLHzijFh9iQzE=;
        b=OtB2hmxYWe74JmVpeNB9dKyf5Y2uLTcE7LjvAEgn0cknLGUN7+GQHmtroQ1PHU0XRN
         plB0/PRZHizOoWTCH1CFES4QhYjK0lsYATUW4vhsWE6WbVdoEfYZtjh6LYirmJkdiigm
         gOJkQUgBICgTTXHgdgfCyvl+YdpielCATl/6Y+2DgUT0dOo8bNyEw2aL9XD+rqsmX8ND
         MdCoxhheCcPR1TicXRr/mENAqNSNUoVd7kGNq369E+LqnB5I/PCR8wgvfSg4Cq8kwbVe
         Os2Zmcfl61Dhuyzt93P5zA8zHxO1iDGe51+nnrsVZtle9pLd0c/LXsZPBsU676W4LKA8
         r3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743690868; x=1744295668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElmazU9eiDu5YgsStdMEUDt4VLgiKXFLHzijFh9iQzE=;
        b=UUMqTBvFuK07hjq++IyNKYoF7g02fqmVTIQOKRuZ2eIOpkvqKqYwkbn0rqtvyY/JNK
         +KBOHfPkVvlYEESR2V4TvwaYAEIboukQUBRZ8O2fjoLfOgEhj6UlqVxYxdttWhETAb3O
         wKgGQok+5Sjl1cYR+fOdd+X90FDd219aWt9qinXmzJpM/J03W8WOiIEJONgDYH8XWOXe
         rdVbTFlwP9Is6Qx0VRGnR0H5LV3IgqQNV2H/6oSxo7BeppEBUyoja3QTLfLTTBD/KZaC
         UpNKhA8k8nwYIwxTNQnCzSTd4kz56bgF1dwM0TWtDk6P3BkINULkIPOgqwwSa3DBpmBx
         cNjA==
X-Gm-Message-State: AOJu0YxFzvitw7gYioZj50rwp0ADuubsQgj1cgjxPNk4FUVoq/8fxOHv
	61AG5XX3V6XByPUG/FaQR7bRWk5FnbyepBmAIhC/Djf9byyLgnhiHHeBBaCwjXQ=
X-Gm-Gg: ASbGncsS0krDrTnKEpIg7/ltjK3bFlaNu9P5bFN8fjfeTIRniyWwsOWlFwTs7mB4y/C
	oLHMkPgtDm0sYhBNzE/bVHz6DhKMcnxj5bb/CH+/68q3bg/yAw1HzunuRwMTUWEVxL5mxfX9hvO
	fvM9oKLLeRhNc7FBjOtOVGjq00bUTEzykcYCLVnT4fwDH+bDvlhx2QpPvI9IcVVsogzYqfTfx6/
	feI9PnAhiqqFMYtFr1HXeMYQAdNVV4KMucOqpRpfOOJ7NDRD7EtsfU6ojc+wO33jZjS7RYa6V5t
	2s9OBvsS56C8/A1ttgT/44ffD13eEym1p8Q8ZCZJmCgrYByyH1jCow6ALEp/ZSMyo0TkWtni+Ga
	qlLGmYAMMSIkLplkX
X-Google-Smtp-Source: AGHT+IGx3lg3jFsrRnmDrrAeoBgnGKF5akeTYY0qcIyox1EaR75d+Yj5XqrTqIpD8ITexLw+bvyYxw==
X-Received: by 2002:a05:6000:40e0:b0:391:4977:5060 with SMTP id ffacd0b85a97d-39c1211d5b0mr17241969f8f.53.1743690868433;
        Thu, 03 Apr 2025 07:34:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:355:6b90:e24f:43ff:fee6:750f? ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b816csm1969961f8f.57.2025.04.03.07.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 07:34:27 -0700 (PDT)
Message-ID: <cf51ea66-24b2-49f4-87ec-5165249d53c5@baylibre.com>
Date: Thu, 3 Apr 2025 16:34:26 +0200
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
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <20250402222128.2soczlkfwonz7r3p@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/25 12:21 AM, Thinh Nguyen wrote:
> On Wed, Apr 02, 2025, Frode Isaksen wrote:
>> On 4/2/25 1:49 AM, Thinh Nguyen wrote:
>>> On Thu, Mar 27, 2025, Frode Isaksen wrote:
>>>> From: Frode Isaksen <frode@meta.com>
>>>>
>>>> Prevent dwc3_request from being queued twice, by checking
>>>> req->status.
>>>> Similar to commit b2b6d601365a ("usb: dwc3: gadget: prevent
>>>> dwc3_request from being queued twice") for non-ep0 endpoints.
>>>> Crash log:
>>>> list_add double add: new=ffffff87ab2c7950, prev=ffffff87ab2c7950,
>>>>    next=ffffff87ab485b60.
>>>> kernel BUG at lib/list_debug.c:35!
>>>> Call trace:
>>>> __list_add_valid+0x70/0xc0
>>>> __dwc3_gadget_ep0_queue+0x70/0x224
>>>> dwc3_ep0_handle_status+0x118/0x200
>>>> dwc3_ep0_inspect_setup+0x144/0x32c
>>>> dwc3_ep0_interrupt+0xac/0x340
>>>> dwc3_process_event_entry+0x90/0x724
>>>> dwc3_process_event_buf+0x7c/0x33c
>>>> dwc3_thread_interrupt+0x58/0x8c
>>>>
>>>> Signed-off-by: Frode Isaksen <frode@meta.com>
>>>> ---
>>>> This bug was discovered, tested and fixed (no more crashes seen) on
>>>> Meta Quest 3 device. Also tested on T.I. AM62x board.
>>>>
>>>>    drivers/usb/dwc3/ep0.c    | 5 +++++
>>>>    drivers/usb/dwc3/gadget.c | 1 +
>>>>    2 files changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>>>> index 666ac432f52d..e26c3a62d470 100644
>>>> --- a/drivers/usb/dwc3/ep0.c
>>>> +++ b/drivers/usb/dwc3/ep0.c
>>>> @@ -91,6 +91,11 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
>>>>    {
>>>>    	struct dwc3		*dwc = dep->dwc;
>>>> +	if (WARN(req->status < DWC3_REQUEST_STATUS_COMPLETED,
>>> Let's not use WARN. Perhaps dev_warn?
>> I copied the coding style from commit b2b6d601365a ("usb: dwc3: gadget:
>> prevent
>>
>> dwc3_request from being queued twice"), so maybe a follow-up patch to change from WARN to dev_warn for the two patches ?
> We can just use dev_warn here, we don't need 2 separate patches for this
> change. The other place can be reworked in a separate patch.
OK
>
>>>> +				"%s: request %pK already in flight\n",
>>>> +				dep->name, &req->request))
>>>> +		return -EINVAL;
>>>> +
>>>>    	req->request.actual	= 0;
>>>>    	req->request.status	= -EINPROGRESS;
>>>>    	req->epnum		= dep->number;
>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>> index 89a4dc8ebf94..c34446d8c54f 100644
>>>> --- a/drivers/usb/dwc3/gadget.c
>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>> @@ -3002,6 +3002,7 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
>>>>    	dwc->ep0_bounced = false;
>>>>    	dwc->link_state = DWC3_LINK_STATE_SS_DIS;
>>>>    	dwc->delayed_status = false;
>>>> +	dwc->ep0_usb_req.status = DWC3_REQUEST_STATUS_UNKNOWN;
>>>>    	dwc3_ep0_out_start(dwc);
>>>>    	dwc3_gadget_enable_irq(dwc);
>>>> -- 
>>>> 2.48.1
>>>>
>>> I'm still not clear how this can happen. Are you testing this against
>>> mainline? Can you provide the dwc3 tracepoints?
>> I was not able to reproduce this locally. Was seen on 5.10, tested on 6.1
>> and 6.6.
>>
> Without understanding how this can happen and why it is needed, we
> should not just apply this. Kernel v5.10, v6.1, and v6.6 are really old.
> We have a lot of fixes since then. Please see if this is reproducible
> using mainline.

We have applied all relevant patches from mainline to ep0.c, in order to 
try to fix this crash:

566bc793bdd7 usb: dwc3: ep0: Don't clear ep0 DWC3_EP_TRANSFER_STARTED
371d3fc577db usb: dwc3: ep0: Don't reset resource alloc flag (including ep0)
d819a0bbb493 usb: dwc3: ep0: Don't reset resource alloc flag
2eb3ba38bf88 usb: dwc3: gadget: Rewrite endpoint allocation flow
cbfcf517dc42 FROMGIT: usb: dwc: ep0: Update request status in 
dwc3_ep0_stall_restart
4fc39328579e UPSTREAM: usb: dwc3: Avoid unmapping USB requests if 
endxfer is not complete
5dc06419d8a6 UPSTREAM: usb: dwc3: Do not service EP0 and conndone events 
if soft disconnected
75a4f0b5e1f4 UPSTREAM: usb: dwc3: ep0: Properly handle 
setup_packet_pending scenario in data stage
a79e848e5299 UPSTREAM: usb: dwc3: ep0: Don't prepare beyond Setup stage
910e9e60492a UPSTREAM: usb: dwc3: Fix ep0 handling when getting reset 
while doing control transfer
fe513e1c2685 UPSTREAM: usb: dwc3: gadget: Wait for ep0 xfers to complete 
during dequeueThan

Thanks,

Frode

>
> Thanks,
> Thinh



