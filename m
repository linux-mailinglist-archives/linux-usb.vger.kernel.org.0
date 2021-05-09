Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580873775C9
	for <lists+linux-usb@lfdr.de>; Sun,  9 May 2021 09:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhEIHcP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 May 2021 03:32:15 -0400
Received: from salscheider.org ([202.61.254.1]:46028 "EHLO
        mail.salscheider.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhEIHcP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 May 2021 03:32:15 -0400
Received: from [IPv6:2001:16b8:227b:b600:afd9:e4e9:1199:3646] (200116b8227bb600afd9e4e911993646.dip.versatel-1u1.de [IPv6:2001:16b8:227b:b600:afd9:e4e9:1199:3646])
        by mail.salscheider.org (Postfix) with ESMTPSA id 98DDA468A6C;
        Sun,  9 May 2021 09:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salscheider.org;
        s=dkim; t=1620545471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bs7DUTyzcswaCYvkDZdeFMQaz+/ltkKViMQHiqypPAQ=;
        b=ceVqOqyV+75EwwLP1JAlZ4ci5I3C0aWgbFoWfsEqVDJVXHMFG82WuJAn4fwC/xhclCTBav
        JIhBhmIXQpwfTfgxm5XewEDPpWaxr96hd+VNQ80GfaJ7sOdL26DnLWFAtkecPbIw6nO8VK
        ZE6XMNzpoxM38S0P47xSs3z6M76Chw0=
Subject: Re: [PATCH] [RFC] xhci: Add Link TRB sync quirk for ASM3142
To:     Forest Crossman <cyrozap@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20210416093729.41865-1-ole@salscheider.org>
 <9bf0060c-3427-a261-531c-c075054ae094@linux.intel.com>
 <5c92dd8c-c8b0-40b5-addb-2df360673462@salscheider.org>
 <a8b56a79-e092-a344-7508-8c22b6568898@salscheider.org>
 <e68b481e-a9a1-787e-b263-461bc9597b65@intel.com>
 <c9a18ec2-7fb1-f206-1d27-ce3fa52be762@salscheider.org>
 <9335fdde-4996-1fe5-42ac-fc70bb98d20c@linux.intel.com>
 <5ed67ab2-39de-c2d9-647a-df88dac3e6e5@salscheider.org>
 <41cd7996-f30e-8519-5aa3-264ddfc1473a@salscheider.org>
 <2c93e750-70e0-792f-1f10-e416751270b7@linux.intel.com>
 <CAO3ALPx9CBqggJGVpo_qowRPr5haR0wKMu27eN9GPXD3b_bW+Q@mail.gmail.com>
From:   Ole Salscheider <ole@salscheider.org>
Message-ID: <d7bb3888-a596-481e-829f-cf3276edb5f4@salscheider.org>
Date:   Sun, 9 May 2021 09:31:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAO3ALPx9CBqggJGVpo_qowRPr5haR0wKMu27eN9GPXD3b_bW+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 09.05.21 02:01, Forest Crossman wrote:
> On Thu, May 6, 2021 at 4:06 AM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
>> On 5.5.2021 10.56, Ole Salscheider wrote:
>>> Hi Mathias,
>>>
>>> ...
>>>
>>>>> How about a different approach?
>>>>> If the issue is only with transfers starting on the last TRB before the link TRB, we could turn that TRB to a no-op.
>>>>> Does something like the code below help?
>>>>>
>>>>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>>>>> index 6cdea0d00d19..0ffda8127640 100644
>>>>> --- a/drivers/usb/host/xhci-ring.c
>>>>> +++ b/drivers/usb/host/xhci-ring.c
>>>>> @@ -3181,6 +3181,12 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
>>>>>            }
>>>>>        }
>>>>> +    if (ep_ring != xhci->cmd_ring &&
>>>>> +        !trb_is_link(ep_ring->enqueue) &&
>>>>> +        trb_is_link(ep_ring->enqueue + 1))
>>>>> +        queue_trb(xhci, ep_ring, 0, 0, 0, 0,
>>>>> +              TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state);
>>>>> +
>>>>>        while (trb_is_link(ep_ring->enqueue)) {
>>>>>            /* If we're not dealing with 0.95 hardware or isoc rings
>>>>>             * on AMD 0.96 host, clear the chain bit.
>>>>
>>>> Your patch seems to work. I can record video with this and it seems stable so far.
>>>>
>>>> But there is still something off (as with my patch): If I stop the video recording and try to record again, the camera does not give me any frames. Maybe this is an unrelated issue but it works fine on the two other host controllers that I tested.
>>>>
>>>> If you are interested you can find a trace here:
>>>> https://stuff.salscheider.org/dmesg_second
>>>> https://stuff.salscheider.org/trace_second
>>>>
>>>> In this trace I recorded a few seconds of video with ffmpeg, killed it (at second 108) and restarted it (at second 116). Can you see anything suspicious in the trace?
>>>
>>> I guess this second issue is unrelated. The cameras have worked stable so far with your patch. It might be good to include this workaround in mainline. Will you take care of it or should I send something to the list?
>>>
>>
>> This is still not a very nice solution. We have no clue about the actual rootcause.
>>
>> I remember now there was a similar issue with an earlier ASMedia host some years ago.
>> This was fixed by modifying some internal flowcontol parameters of the host in:
>>
>> 9da5a1092b13 xhci: Bad Ethernet performance plugged in ASM1042A host
>>
>> Not sure if  Jiahau Chang (cc) works on this anymore, but maybe he knows who to contact.
>> Also adding Forest Crossman who has committed ASMediad fixes lately
>>
>> Any clue about the rootcause?
>> thread:
>> https://lore.kernel.org/linux-usb/20210416093729.41865-1-ole@salscheider.org
> 
> Unfortunately, I don't know what could be causing this. The only thing
> I would suggest is to see if this problem happens (without the patch)
> while the USB device is connected directly to a port on the ASMedia
> host controller, with no other hubs or devices connected to that
> controller. The only problem I've been seeing with my various ASMedia
> cards is when I try to do a lot of bulk reads from multiple devices
> simultaneously (e.g., when dd-ing from multiple hard drives to
> /dev/null). In those cases, the controller eventually triggers an
> IOMMU page access violation, which causes the kernel to reset the PCIe
> endpoint. So if the camera works fine when it's the only device
> connected to the host controller (without any patches applied), that
> might indicate that this is the same issue. But that's mostly a wild
> guess--I don't know enough of the USB or xHCI standards to really
> understand what's going on.

The problem occurs here also if only one camera and no other device are 
connected to the ASMedia host controller.

> Best of luck resolving this issue,
> 
> Forest
> 
