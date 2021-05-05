Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5863735E4
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 09:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhEEH5Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 03:57:25 -0400
Received: from salscheider.org ([202.61.254.1]:34962 "EHLO
        mail.salscheider.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhEEH5Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 May 2021 03:57:24 -0400
Received: from [IPv6:2001:16b8:2236:8c00:bfac:b555:ec3:1987] (200116b822368c00bfacb5550ec31987.dip.versatel-1u1.de [IPv6:2001:16b8:2236:8c00:bfac:b555:ec3:1987])
        by mail.salscheider.org (Postfix) with ESMTPSA id 6CEC345C701;
        Wed,  5 May 2021 09:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salscheider.org;
        s=dkim; t=1620201387;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yOkkBLTSWebomruxA5JLaQVyC1Zrlcbf72nJUi1/hLs=;
        b=DcC6Ib8nYAHVlCqz8BYMIrA36RB3R1Vd3PAFliR9CdhCfrT0NH0IGSfz1a91bOJQ9wTAWD
        JFhoipkHDTEJYyuZoD/MYVsP7/RpMz8aFEJsA0RWKxVF+eddPW99XHZVGh2C7moum9JP8S
        7LOTM1xhxvOP8B17a5kWy6yjK1GWU+g=
Subject: Re: [PATCH] [RFC] xhci: Add Link TRB sync quirk for ASM3142
From:   Ole Salscheider <ole@salscheider.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org
References: <20210416093729.41865-1-ole@salscheider.org>
 <9bf0060c-3427-a261-531c-c075054ae094@linux.intel.com>
 <5c92dd8c-c8b0-40b5-addb-2df360673462@salscheider.org>
 <a8b56a79-e092-a344-7508-8c22b6568898@salscheider.org>
 <e68b481e-a9a1-787e-b263-461bc9597b65@intel.com>
 <c9a18ec2-7fb1-f206-1d27-ce3fa52be762@salscheider.org>
 <9335fdde-4996-1fe5-42ac-fc70bb98d20c@linux.intel.com>
 <5ed67ab2-39de-c2d9-647a-df88dac3e6e5@salscheider.org>
Message-ID: <41cd7996-f30e-8519-5aa3-264ddfc1473a@salscheider.org>
Date:   Wed, 5 May 2021 09:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5ed67ab2-39de-c2d9-647a-df88dac3e6e5@salscheider.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

...

>> How about a different approach?
>> If the issue is only with transfers starting on the last TRB before 
>> the link TRB, we could turn that TRB to a no-op.
>> Does something like the code below help?
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 6cdea0d00d19..0ffda8127640 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -3181,6 +3181,12 @@ static int prepare_ring(struct xhci_hcd *xhci, 
>> struct xhci_ring *ep_ring,
>>           }
>>       }
>> +    if (ep_ring != xhci->cmd_ring &&
>> +        !trb_is_link(ep_ring->enqueue) &&
>> +        trb_is_link(ep_ring->enqueue + 1))
>> +        queue_trb(xhci, ep_ring, 0, 0, 0, 0,
>> +              TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state);
>> +
>>       while (trb_is_link(ep_ring->enqueue)) {
>>           /* If we're not dealing with 0.95 hardware or isoc rings
>>            * on AMD 0.96 host, clear the chain bit.
> 
> Your patch seems to work. I can record video with this and it seems 
> stable so far.
> 
> But there is still something off (as with my patch): If I stop the video 
> recording and try to record again, the camera does not give me any 
> frames. Maybe this is an unrelated issue but it works fine on the two 
> other host controllers that I tested.
> 
> If you are interested you can find a trace here:
> https://stuff.salscheider.org/dmesg_second
> https://stuff.salscheider.org/trace_second
> 
> In this trace I recorded a few seconds of video with ffmpeg, killed it 
> (at second 108) and restarted it (at second 116). Can you see anything 
> suspicious in the trace?

I guess this second issue is unrelated. The cameras have worked stable 
so far with your patch. It might be good to include this workaround in 
mainline. Will you take care of it or should I send something to the list?

Thanks and best regards,
Ole

