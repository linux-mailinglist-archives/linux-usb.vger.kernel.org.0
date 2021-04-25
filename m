Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43EC936A8D3
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 20:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhDYS0i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 14:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23952 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230459AbhDYS0i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Apr 2021 14:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619375157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0n/ELlk1c7TVO+7MTcG2m6WTPPu1ypKyfy91z4Tww9A=;
        b=SYKxDAmQTdmVLfoN/+EOEK1j3Xuj8Mk6l1UO+lUuMTMT7N7YaaRD2Ot3onTGDdAPKfCFBn
        XR4+lOXlsexxw92f7PBbNDIBcIp2d5jSdN1h0SkmcI1k+ik4yColUmz7a+uLJnKyoLW2IN
        qs52zUDQOHrxXHuzFqDf9lcZTQ4/TPg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-JJk4VDmtNWuBgXEiR-OY1w-1; Sun, 25 Apr 2021 14:25:55 -0400
X-MC-Unique: JJk4VDmtNWuBgXEiR-OY1w-1
Received: by mail-ed1-f72.google.com with SMTP id r14-20020a50d68e0000b0290385504d6e4eso11839783edi.7
        for <linux-usb@vger.kernel.org>; Sun, 25 Apr 2021 11:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0n/ELlk1c7TVO+7MTcG2m6WTPPu1ypKyfy91z4Tww9A=;
        b=mVVfMZV8CKLd1LFY7nL6KrikThJaSU9wR7r5k+Vwq67BtVeiAiT0wydXrzImgFLuiX
         FncHp4M4hbAEaOLllNnSOIUdK/nDIWZt39+nYwcZJ76GlI0qiNO4gWkoYgfMbo9jkddh
         As4csIcg+63MsSLk0nfzs0yQEAdTWZKwQwoMRavpHKt+RwQvcA0uVdVOkap6nETy0kn+
         NIEiDKw2Y0jXJ360YhK2krcW3ETE8wWOMpem9IeRt17uUCiTWhFa30hWQ1JqqZ1l1R8B
         V7QlgUqreRGpDdf4y4OWRQzPfL3Ib/HG5PRtJKSQqOrfR64KwNTwYPAz+DciagQJZhrx
         EYOQ==
X-Gm-Message-State: AOAM532dZkUBK7MjhAkPLbaIAXgCbHJEhiFPZ2ttiHlvKpqordChywqB
        KKXHe6BgNJQGD8SkG/DzXijTcZQ1IhPjGdN0vtOVwxFaobWZEOAtBkBfb8Pvi1RfMWQ1rf07BqJ
        rQ52V3M8af3HAWR2/GGS4
X-Received: by 2002:a05:6402:cb3:: with SMTP id cn19mr16827205edb.206.1619375154365;
        Sun, 25 Apr 2021 11:25:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw83dIRDeb9imtWRW56CXFxjF/xXGVyymqeH3E9OoGDh8YY3X6+dVOej53wqjyorgKzgffWDQ==
X-Received: by 2002:a05:6402:cb3:: with SMTP id cn19mr16827194edb.206.1619375154244;
        Sun, 25 Apr 2021 11:25:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id l3sm12601555edr.2.2021.04.25.11.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 11:25:53 -0700 (PDT)
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
To:     Rene Rebe <rene@exactcode.com>, stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
References: <YIVZ2l9qUfkcyPpG@kroah.com>
 <20210425.141536.1295354861910527121.rene@exactcode.com>
 <20210425144531.GA336783@rowland.harvard.edu>
 <20210425.170224.894337589208455353.rene@exactcode.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e698ca2-06e6-6ee7-1c39-a4352207a40e@redhat.com>
Date:   Sun, 25 Apr 2021 20:25:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210425.170224.894337589208455353.rene@exactcode.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rene,

On 4/25/21 5:02 PM, Rene Rebe wrote:
> Alan Stern <stern@rowland.harvard.edu> wrote:
> 
>> On Sun, Apr 25, 2021 at 02:15:36PM +0200, Rene Rebe wrote:
>>> From: Greg KH <gregkh@linuxfoundation.org>
>>> Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
>>> Date: Sun, 25 Apr 2021 14:00:26 +0200
>>>
>>>>> I would expect that more modern devices to work. Vendors usually
>>>>> linearly allocate their product ids for new devices, and we could
>>>>> allow list product ids higher than this Seven to unbreak more modern
>>>>> devices by default and limit the amount of device quirks needed?
>>>>
>>>> Vendors do not allocate device ids that way at all, as there is no
>>>> requirement to do so.  I know of many vendors that seemingly use random
>>>> values from their product id space, so there is no guarantee that this
>>>> will work, sorry.
>>>
>>> I did not say it is a requirement, just that they usually do speaking
>>> of just this Seagate case. What is wrong with using that to
>>> potentially significantly cut down the quirk list?
>>
>> You didn't read commit 92335ad9e895, did you?  It lists a large number 
>> of Seagate devices that don't work with ATA pass-through, and three of 
>> them have product IDs that are larger than 0xab03.
>>
>> Please check the facts before guessing about things that will cause 
>> problems for other people.
> 
> I really don't appreciate the unfriendly tone on the linux kernel
> mailing lists (which is why for 20 years I never felt like contributing
> here mo),

I'm sorry to hear that the admittently sometimes unfriendly tone
on the kernel mailinglists have stopped you from contributing.

Note that I do believe that things have gotten better recently.

As for this email-thread, I don't really see anything wrong with
Alan's reply here. You have been quite argumentative in this entire
thread about how things would be much better if they are done your
way.

I cannot speak for the others but I certainly have gotten annoyed by
the tone of your emails so far, I apologize if any of that annoyance
has bleed through in the tone of my emails. I do strive to always
stay professional (but as all of us I'm only human).

<snip>

>>>> What is wrong with just allowing specific devices that you have tested
>>>> will work, to the list instead?  That's the safest way to handle this.
>>>
>>> The problem is that out of the box it does not work for users, and
>>> normal users do not dive into the kernel code to find out and simply
>>> think their devices sucks. Even I for years thought the drive sucks,
>>> before I took a closer look. If you long term want more new devices in
>>> an allow list than the previous quirk list included (9 or 10 does not
>>> sound that many to me), ... whatever you prefer ,-) I would rather
>>> have 10 quirk disable list than potential many more white listed the
>>> next years to come. Maybe we shoudl simply restore the prevoius
>>> quirks.
>>
>> That's a possibility, and in the future we may do it.  But probably not 
>> until the enable list grows to a comparable length.
> 
> Yeah, why future proof it now, ...

Perhaps look in the mirror and start with improving the tone of your
own emails ?

> which is exactly what brought us
> here from the original regression. The enable list will likely not
> grow quickly as most users will just expect a broken device hw/
> firmware and not bother looking into it and instead live w/o SMART.

Right because people can happily live without SMART most users won't
even know they're missing some optional functionality. Non working disks
OTOH will lead to bug reports, bug reports of which Alan, Greg and I
will be on the receiving end.

Moreover the kernel has a very strong no regressions policy, and what
you suggest would almost certainly break stuff for some of our users,
so we can simply not do as you suggest.

I notice that you call the lack of SMART support on your own disk
a regression, but that has never worked with any recent kernel
(due to the discussed code which has been present since 2017) so
from the no-regressions kernel policy pov that is not a regression.

Regards,

Hans

