Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64F6366739
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 10:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbhDUIqG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 04:46:06 -0400
Received: from salscheider.org ([202.61.254.1]:47560 "EHLO
        mail.salscheider.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237188AbhDUIqF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 04:46:05 -0400
Received: from [IPv6:2001:16b8:2251:100:9f30:1b6c:cb14:12fa] (200116b8225101009f301b6ccb1412fa.dip.versatel-1u1.de [IPv6:2001:16b8:2251:100:9f30:1b6c:cb14:12fa])
        by mail.salscheider.org (Postfix) with ESMTPSA id 4F95F18CE4C;
        Wed, 21 Apr 2021 10:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salscheider.org;
        s=dkim; t=1618994731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ftz4/QgSLGLpXxt4AB/YtnHkZLhiPxv9P0D8T15RK2U=;
        b=KlYpF/ay7GgSqkban57LU9B5XseyOGZTAbySiSsqBZ0ZJJOmR6o2RC5HUcEK+OYu4VijPU
        ZV4rILrGAy7S33dA5X1L8sLF7ALPZULzz6DUPp1YcemwwGHRhOfVhnzW+qbhbflzlHbuu4
        kGy6kAO/Zz+JK78O/PlPUlb6IdWkhpw=
Subject: Re: [PATCH] [RFC] xhci: Add Link TRB sync quirk for ASM3142
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
From:   Ole Salscheider <ole@salscheider.org>
Message-ID: <5ed67ab2-39de-c2d9-647a-df88dac3e6e5@salscheider.org>
Date:   Wed, 21 Apr 2021 10:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9335fdde-4996-1fe5-42ac-fc70bb98d20c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 21.04.21 09:28, Mathias Nyman wrote:
> On 19.4.2021 22.05, Ole Salscheider wrote:
>> Hi Mathias,
> ...
> 
>>> tracing shows the content of the TRB while it's written, before writing the cycle bit.
>>> Could be worth dumping transfer ring after issue is seen and check TRB still looks valid:
>>> cat /sys/kernel/debug/usb/xhci/<your controller>/devices/<xx>/ep<yy>/trbs
>>> you need to figure out which controller, device and endpoint number for this.
>>
>> I think this is the output for the correct device and endpoint:
>>
>> https://stuff.salscheider.org/trbs
> 
> Thanks, the TRB was already turned No-op by the cancel code by then, but it doesn't matter,
> your trace below indicates the TRB is fine.
> 
>>
>>> How about your delayed link TRB cycle write patch? did it help trigger an event for the last transfer
>>> TRB, or did it just help as controller couldn't go past the link TRB and was less out of sync with
>>> the driver?
>>
>>
>> You can find a trace of recording a few seconds of video with my patch here:
>>
>> https://stuff.salscheider.org/trace_with_patch
>>
>> As far as I can tell from it, the patch helps to trigger an event for all transfer TRBs. I also tried to record around 30 min of video with it and it did not encounter a problem while recording.
>>
>> I however cannot start a new recording after stopping the first. And sometimes I observe hangs of the computer some time after stopping the recording. That might be some unwanted side-effect of my patch...
>>
> 
> Yes, It shows transfer events for the TRBs before the link TRB.
> This workaround is however a can of worms as many TD's consist of several TRBs, and they only trigger events for the last TRB.
> 
> How about a different approach?
> If the issue is only with transfers starting on the last TRB before the link TRB, we could turn that TRB to a no-op.
> Does something like the code below help?
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 6cdea0d00d19..0ffda8127640 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3181,6 +3181,12 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
>   		}
>   	}
>   
> +	if (ep_ring != xhci->cmd_ring &&
> +	    !trb_is_link(ep_ring->enqueue) &&
> +	    trb_is_link(ep_ring->enqueue + 1))
> +		queue_trb(xhci, ep_ring, 0, 0, 0, 0,
> +			  TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state);
> +
>   	while (trb_is_link(ep_ring->enqueue)) {
>   		/* If we're not dealing with 0.95 hardware or isoc rings
>   		 * on AMD 0.96 host, clear the chain bit.
>   

Your patch seems to work. I can record video with this and it seems 
stable so far.

But there is still something off (as with my patch): If I stop the video 
recording and try to record again, the camera does not give me any 
frames. Maybe this is an unrelated issue but it works fine on the two 
other host controllers that I tested.

If you are interested you can find a trace here:
https://stuff.salscheider.org/dmesg_second
https://stuff.salscheider.org/trace_second

In this trace I recorded a few seconds of video with ffmpeg, killed it 
(at second 108) and restarted it (at second 116). Can you see anything 
suspicious in the trace?

Thanks a lot
- Ole
