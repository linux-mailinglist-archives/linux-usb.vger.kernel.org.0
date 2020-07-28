Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE0E2306DE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 11:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728395AbgG1Jrv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 05:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbgG1Jru (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jul 2020 05:47:50 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F72C061794
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2020 02:47:49 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id di22so7143142edb.12
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2020 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=tSn4gfKXmweX6O14NhtNOLfpreeOHAOrANsyONJV3HE=;
        b=rRbyffe1wU38IVKT4nCev5vkkwf0GR4zhVs/OPIntl3XRXkW96HZsXPh5Zgo1Cc07M
         uy3+W+weD7EZWuyNkgQ2jMzaCB6pnD6WBkWkGqO5BdZs8JFMa7xSuiEcRSy8iHjslh18
         lRiSeTsv4miBdQKe6RXF1RMOY8sg33hbwDJxkIIefEVda3eVRwnx5jUaOoQfDzxEHVNj
         oBr9eugBa/DvwcNy/Z679pTogvHxL5BRxStNA7Fa/yMpO3P8CVYdbaVT/w+hGy4ir9mR
         Gec+3qHLqRUJ0CyXCGFEQCOJj1ODwuXZTj0GSf3pTDHHrH/j5C1tb+w8B0HI/mh9UhQ7
         MwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=tSn4gfKXmweX6O14NhtNOLfpreeOHAOrANsyONJV3HE=;
        b=cMwt5AmVnUDJARAOrTofLEJEp60wWMpw3+44ad2kYbg3NQB4XrX6M4GEe2apXntwKQ
         +iI1e7pb9jNhHOdkN4KrASFMuHPtQ/t8otqmi+4aXWLqvCazq0sRDp5BIY9Sr/rXhTqb
         vEEI7pVnO0BWyD77Dl89raHUJ2uC/Mrdotj/Eqoa+5JDCVZdmtecyOY+11rvxW7qggAi
         2W9KPI0ln+8zRVAURbxBwRvFnqzTSwn2XReZZlETluW8apYVQ0lCIDs3/P2yMAk9VkrP
         OXOVylLZcH6ZK/adwBaCOz9UUz0A+80deT5X8IebEDzTWeiZjQjC+AzN/0aMUYdEGVTn
         GsRA==
X-Gm-Message-State: AOAM531Y3gLkM41hfsiUYDfQ1eDCdMiNMHyUWtyje2qkh0cCD1l6pe7X
        Wjy9jsf9QEzFwcdkde0Utf7g/nc6GbI=
X-Google-Smtp-Source: ABdhPJzFHFYYvXif/AMUFrr2RoEt0FW0dJJiYCfPso3P5uuFBbXUHbacAC/XyU7NtKMPf7neg4cOrw==
X-Received: by 2002:aa7:d410:: with SMTP id z16mr564410edq.287.1595929668031;
        Tue, 28 Jul 2020 02:47:48 -0700 (PDT)
Received: from [109.186.98.97] (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id t3sm6978829edq.26.2020.07.28.02.47.46
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jul 2020 02:47:47 -0700 (PDT)
Message-ID: <5F1FF432.9060509@gmail.com>
Date:   Tue, 28 Jul 2020 12:47:30 +0300
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Oliver Neukum <oneukum@suse.de>
CC:     Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH] usb: core: Solve race condition in usb_kill_anchored_urbs
References: <20200727072225.25195-1-eli.billauer@gmail.com> <1595844840.13408.17.camel@suse.de> <5F1EBA04.5050109@gmail.com> <1595858285.13408.36.camel@suse.de> <20200727144357.GB1468275@rowland.harvard.edu> <1595885364.13408.44.camel@suse.de>
In-Reply-To: <1595885364.13408.44.camel@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver, Alan,

I understand that there's a disagreement in what is allowed or not with 
the anchor API. Effectively that means that I have to assume that driver 
programmers will go either way. I have to admit that my view was that a 
driver must proactively make sure it doesn't submit further URBs to an 
anchor as long as usb_kill_anchored_urbs() runs, through completers or 
otherwise. I formed the current patch accordingly.

To make things trickier, a driver might rely (correctly or not) on that 
usb_kill_urb() makes sure that resubmission of a URB by the completer, 
while usb_kill_urb() is killing it, will fail. Or at least so says the 
description of this function.

And once again, the resubmitted URB will remain untouched if the said 
race condition occurs. So a driver's programmer, who relied on 
usb_kill_urb() to prevent the resubmission, might get the impression 
that he did correctly when testing the driver, but then the kernel panic 
will happen rarely and far from the eye.

Writing an additional API without this problem is beyond the scope of 
this discussion. I'm focused on resolving the problem of the current 
one. The existing API must be safe to use, even if it's planned to phase 
out.

Given the discussion so far, I realized that the resubmission by 
completer case must be handled properly as well. So I suggest modifying 
the patch to something like

do {
     spin_lock_irq(&anchor->lock);
     while (!list_empty(&anchor->urb_list)) {
         /* URB kill loop */
     }
     spin_unlock_irq(&anchor->lock);
} while (unlikely(!usb_anchor_check_wakeup(anchor)));

The do-while loop will almost never make any difference. But it will 
loop like a waiting spinlock in the rare event of the said race 
condition, while the completer callback executes.

And if the completer submitted a URB, it will be removed as well this 
way. Recall that this loops only in the event of a race condition, so it 
will NOT play cat-and-mouse with the completer callback, but rather 
finish this up rather quickly.

And I've dropped the WARN(): If some people consider resubmission of a 
URB to be OK, even while usb_kill_anchored_urbs() is called, no noise 
should be made if that causes a rare but tricky situation.

And since I'm at it, I'll make the same change to 
usb_poison_anchored_urbs(), which suffers from exactly the same problem.

What do you think?

Thanks,
    Eli

On 28/07/20 00:29, Oliver Neukum wrote:
> Am Montag, den 27.07.2020, 10:43 -0400 schrieb Alan Stern:
>    
>> On Mon, Jul 27, 2020 at 03:58:05PM +0200, Oliver Neukum wrote:
>>      
>>> Am Montag, den 27.07.2020, 14:27 +0300 schrieb Eli Billauer:
>>>        
>>>> Hello, Oliver.
>>>>
>>>> On 27/07/20 13:14, Oliver Neukum wrote:
>>>>          
>>>>> That however is really a kludge we cannot have in usbcore.
>>>>> I am afraid as is the patch should_not_  be applied.
>>>>>
>>>>>            
>>>> Could you please explain further why the suggested patch is unsuitable?
>>>>          
>>> Hi,
>>>
>>> certainly.
>>>
>>> 1. timeouts are generally a bad idea, especially if the timeout does
>>> not come out of a spec.
>>>
>>> 2. That involves quoting you:
>>>
>>> Alternatively, if the driver submits URBs to the same anchor while
>>> usb_kill_anchored_urbs() is called, this timeout might be reached. This
>>>        
>> That would be a bug in the driver, though.  In such a situation, a WARN
>> is worth having.
>>      
> Well, it is an inherent race, certainly. You can do it, though. It is
> debatable whether it would ever make sense. Yet it is not a bug in the
> sense of, for example, writing beyond the end of a buffer or submitting
> an URB twofold.
>
>    
>>> could happen, for example, if the completer function that ran in the
>>> racy situation resubmits the URB. If that situation isn't cleared within
>>> 1000ms, it means that there's a URB in the system that the driver isn't
>>> aware of. Maybe that situation is worth more than a WARN.
>>>
>>> That is an entirely valid use case. And a bulk URB may take a potentially
>>> unbounded time to complete.
>>>        
>> It is _not_ a valid use case.  Since usb_kill_anchored_urbs() doesn't'
>> specify whether it will kill URBs that are added to the anchor after it
>> is called (and before it returns), a driver that anchors URBs at such a
>> time is buggy.
>>      
> Yes, if you depend on it. Here we are getting into technicalities.
> The thing is that we are getting into areas where we should not need to
> go if the API were optimal.
>
> What drivers really want is a way to say, kill this group of URBs and
> make sure they stay dead no matter what.
>
>    
>> Maybe this should be mentioned in the kerneldoc for the routine: Drivers
>> must not add URBs to the anchor while the routine is running.
>>      
> True, yet this defeats one of the aims of the API.
>
>    
>>> My failure in this case is simply overengineering.
>>> If this line:
>>>
>>>          usb_unanchor_urb(urb);
>>>
>>> In __usb_hcd_giveback_urb(struct urb *urb) weren't there, the issue
>>> would not exist. I misdesigned the API in automatically unanchoring
>>> a completing URB.
>>> Simply removing it now is no longer possible, so we need to come up with
>>> a more complex solution.
>>>        
>> Given that this timeout-based API is already present and being used in a
>> separate context, I don't see anything wrong with using it here as well.
>>
>>      
> It is unnecessary and results in a much less useful API.
> The true error in its design is that it unconditionally unanchors the
> URBs it gives back. Stop doing that and it becomes much better.
>
> 	Regards
> 		Oliver
>
>
>    

