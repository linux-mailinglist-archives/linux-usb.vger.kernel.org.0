Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CF922EB32
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 13:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgG0L0i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 07:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgG0L0h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 07:26:37 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8434FC061794
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 04:26:37 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id z17so11840027edr.9
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=rLNqfLuv4kTUt5Q1w6o2wIBWbivd7SsZR16JviOjzrk=;
        b=KooyF+A1m7jWXkCDZHG82c+Lw6VDfqvqGMHfL6GhudWOLLD0zgOvjbEJUjgV3eKSnO
         ngbHsGdNIM1kf6RCTWNPDzLUbLXbXPDqM1TYjMzeEl5gdg9qtdM0ww8CsXnAgUzg3fB7
         2LN4pfyjhd9ZRZSYGJ9kCMRABRWp+4eulhLTuXHqiTKge/5g8by8zfw9IXW0jw2t6qR8
         bEiMkc3huQq5tKkLqNWmFGxsXbZZRkoFRlwUdbtd1jfCiFabN9GxT1ODWdWeEL/cBF0Y
         6D/rj9HiOklw2TpiNb73w3gwyCkPw3dr3op+0+r+kfueaJt2dzCbBA4nccha7kby3xn1
         wIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=rLNqfLuv4kTUt5Q1w6o2wIBWbivd7SsZR16JviOjzrk=;
        b=QQta+hkGkp6LJN71iny1KWCEglSdjNgdRsI6ONneAIna4pyN58gdWQXrtYPmspk71C
         B2NSN0lFmxRTc/NmqpFKdw/8f+J3Lvilje29xRUOPciQItOuald3UzV/AKybS0XMsN96
         7hnlPRYl3UUm0/brH9J0FsnCliq5xVz4RL6WR4igXh5wzNnBS1AxGUNOR/sBQnUJtiLh
         Extn1bsXXdRGXMIxqIwExCsXtZ2hO3ZllBMMLTsIzjLcWY8xkmYOYbUfd+KnwW+OMGo8
         n/FiM9rPy++4EoQGu79gAsmruSa2q2V8Q0K9cLPkbDNGFHTtlgQEacC6k0Mz6sjw8oBR
         Rviw==
X-Gm-Message-State: AOAM532A1aVW/cmoz0uq9mg9a8u7pgqhBQ8L+X5+nLApvbHkKaSnuu71
        wWAgmCrtVhF8Vet6da93k+M=
X-Google-Smtp-Source: ABdhPJxshQFur5ZX8lafeAk/IeGPvEwFxvuzr/xF2G+7jWdcLSN70DMCHofCfkEET1a6uf775P1fSA==
X-Received: by 2002:a05:6402:84e:: with SMTP id b14mr8025247edz.322.1595849196223;
        Mon, 27 Jul 2020 04:26:36 -0700 (PDT)
Received: from [109.186.98.97] (109-186-98-97.bb.netvision.net.il. [109.186.98.97])
        by smtp.gmail.com with ESMTPSA id s16sm5615990ejr.31.2020.07.27.04.26.34
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jul 2020 04:26:35 -0700 (PDT)
Message-ID: <5F1EB9D2.3010809@gmail.com>
Date:   Mon, 27 Jul 2020 14:26:10 +0300
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     linux-usb@vger.kernel.org, hdegoede@redhat.com,
        stern@rowland.harvard.edu, Oliver Neukum <oneukum@suse.de>
Subject: Re: [PATCH] usb: core: Solve race condition in usb_kill_anchored_urbs
References: <20200727072225.25195-1-eli.billauer@gmail.com> <20200727092141.GA1764157@kroah.com>
In-Reply-To: <20200727092141.GA1764157@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/07/20 12:21, Greg KH wrote:
> On Mon, Jul 27, 2020 at 10:22:25AM +0300,eli.billauer@gmail.com  wrote:
>    
>> From: Eli Billauer<eli.billauer@gmail.com>
>>
>> usb_kill_anchored_urbs() is commonly used to cancel all URBs on an
>> anchor just before releasing resources which the URBs rely on. By doing
>> so, users of this function rely on that no completer callbacks will take
>> place from any URB on the anchor after it returns.
>>
>> However if this function is called in parallel with __usb_hcd_giveback_urb
>> processing a URB on the anchor, the latter may call the completer
>> callback after usb_kill_anchored_urbs() returns. This can lead to a
>> kernel panic due to use after release of memory in interrupt context.
>>
>> The race condition is that __usb_hcd_giveback_urb() first unanchors the URB
>> and then makes the completer callback. Such URB is hence invisible to
>> usb_kill_anchored_urbs(), allowing it to return before the completer has
>> been called, since the anchor's urb_list is empty.
>>
>> This patch adds a call to usb_wait_anchor_empty_timeout() prior to
>> returning. This function waits until urb_list is empty (it should
>> already be), but more importantly, until @suspend_wakeups is zero.
>>
>> The latter condition resolves the race condition, since @suspend_wakeups
>> is incremented by __usb_hcd_giveback_urb() before unanchoring a URB and
>> decremented after completing it. @suspend_wakeups is hence an upper limit
>> of the number of unanchored but uncompleted URBs. By waiting for it to be
>> zero, the race condition is eliminated, in the same way that another
>> problem was solved for the same race condition in commit 6ec4147e7bdb
>> ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up till completion
>> is done").
>>
>> An arbitrary timeout of 1000 ms should cover any sane completer
>> callback. The wait condition may also fail if the anchor is populated
>> while usb_kill_anchored_urbs() is called. Both timeout scenarios are
>> alarmingly weird, hence a WARN() is issued.
>>
>> Signed-off-by: Eli Billauer<eli.billauer@gmail.com>
>> ---
>>   drivers/usb/core/urb.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
>> index da923ec17612..7fa23615199f 100644
>> --- a/drivers/usb/core/urb.c
>> +++ b/drivers/usb/core/urb.c
>> @@ -772,11 +772,12 @@ void usb_block_urb(struct urb *urb)
>>   EXPORT_SYMBOL_GPL(usb_block_urb);
>>
>>   /**
>> - * usb_kill_anchored_urbs - cancel transfer requests en masse
>> + * usb_kill_anchored_urbs -  kill all URBs associated with an anchor
>>    * @anchor: anchor the requests are bound to
>>    *
>> - * this allows all outstanding URBs to be killed starting
>> - * from the back of the queue
>> + * This kills all outstanding URBs starting from the back of the queue,
>> + * with guarantee that no completer callbacks will take place from the
>> + * anchor after this function returns.
>>    *
>>    * This routine should not be called by a driver after its disconnect
>>    * method has returned.
>> @@ -784,6 +785,7 @@ EXPORT_SYMBOL_GPL(usb_block_urb);
>>   void usb_kill_anchored_urbs(struct usb_anchor *anchor)
>>   {
>>   	struct urb *victim;
>> +	int ret;
>>
>>   	spin_lock_irq(&anchor->lock);
>>   	while (!list_empty(&anchor->urb_list)) {
>> @@ -798,6 +800,10 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
>>   		spin_lock_irq(&anchor->lock);
>>   	}
>>   	spin_unlock_irq(&anchor->lock);
>> +
>> +	ret = usb_wait_anchor_empty_timeout(anchor, 1000);
>> +
>> +	WARN(!ret, "Returning with non-empty anchor due to timeout");
>>      
> Don't do a warn-on for things that can be triggered by userspace (i.e.
> "bad USB device), as that can cause systems to reboot, and will get
> caught by the syzbot testing tool.
>    
This WARN is triggered only if the device driver has a bug. Explained 
further below.
> Also, will this cause things to take longer than they used to?  What
> race conditions is this going to cause?  :)
>    
The impact of the call to usb_wait_anchor_empty_timeout() is virtually 
none. Almost always, it will return immediately, as the anchor's list 
has just been emptied.

It's only if a URB happened to be in the middle of being completed, that 
it will wait for this to finish, which should be practically unnoticed: 
Completer calls should be quick, so 1000 ms is a huge overkill. If this 
WARN gets into effect, it's because the driver's completer callback was 
running for 1000ms. It's a bug in the driver. No faulty USB device 
should be able to make this happen.

Alternatively, if the driver submits URBs to the same anchor while 
usb_kill_anchored_urbs() is called, this timeout might be reached. This 
could happen, for example, if the completer function that ran in the 
racy situation resubmits the URB. If that situation isn't cleared within 
1000ms, it means that there's a URB in the system that the driver isn't 
aware of. Maybe that situation is worth more than a WARN.

I originally thought about a goto to the beginning of the function after 
the WARN until the anchor's list is empty. But a really buggy driver 
could turn that into an infinite loop.

Regards,
    Eli
> thanks,
>
> greg k-h
>
>    

