Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8D936AF99
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 10:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbhDZIR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 04:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42865 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232411AbhDZIRX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 04:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619424983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=920zwXWrAw7vSQ98hJuWwymp4xFyYRpTuJuag3S2S3k=;
        b=hD9Tw/0eaENMZ8SKQzkGqRvSXoc2w+mLj+VV3VNwiCTFfYEV1FZgKeiPRIAHxPErMVfayu
        cY6e/hhUcDf8byoox8+HH1hO39+a8ZHUbHSFl48i7o5ITNEBbbyCeRD96DGy2mkMCdZypM
        Jx4oqFX3ugGo2Z7gqkbDXJJchgh5FOQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-eNrHpT4EPSOwEQw3gsl2IA-1; Mon, 26 Apr 2021 04:16:15 -0400
X-MC-Unique: eNrHpT4EPSOwEQw3gsl2IA-1
Received: by mail-ed1-f70.google.com with SMTP id d6-20020a0564020786b0290387927a37e2so1677983edy.10
        for <linux-usb@vger.kernel.org>; Mon, 26 Apr 2021 01:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=920zwXWrAw7vSQ98hJuWwymp4xFyYRpTuJuag3S2S3k=;
        b=GQ2RfUZuLxsdznVTnboxR0JWRE14wZkYclOhuRV9DKanKrNoO0/nKvqQwiWPuRHSN/
         tTEomSihyFpON52Fd5Dzg8L7bt06B8+KDZWHQY1BI+r4gGIHky1EmpWLGC4G9rQeTw0q
         bhLHLO4TH1gzQHgqcRflZHOq6UhJ6YvhhpW5eqFkWgs2YRc2ZBrpGTO/RSbiXGdulJLg
         i5EMKgVaXqlLNjV/dKQjEF6WD6GRF3uGlG3iw/aGKFZeQDHbw4ayrBXqokKN9D92KsTy
         nIso9H8olWbOKjC0tBS82r5m18An4ezDnnh7wKeN9H70BTpDdkyrw6EkVswIJImal+1T
         k1Qw==
X-Gm-Message-State: AOAM5306b9mjlabk3cp/x0yx2c1G98T7cFUThIICZBtl2Mt6UcEP4goV
        UdmCvXEAkx7rw1lIXD4f1J898kloc/LC8jDg4UG6JB7B+45vRbPBE2et8at5ocbwgVTY+oEZ91P
        +TXrpcIFIxOPOiKXNnuC1
X-Received: by 2002:a05:6402:cb6:: with SMTP id cn22mr19532742edb.302.1619424974005;
        Mon, 26 Apr 2021 01:16:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp/nluZF982GywIIY0DyZ71yMBiL4LGX/CJcK8x5cnKcTGobQZsTuAWQrH6CcPp0SiVF+53Q==
X-Received: by 2002:a05:6402:cb6:: with SMTP id cn22mr19532725edb.302.1619424973789;
        Mon, 26 Apr 2021 01:16:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k16sm10963327ejv.37.2021.04.26.01.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 01:16:13 -0700 (PDT)
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
To:     =?UTF-8?Q?Ren=c3=a9_Rebe?= <rene@exactcode.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <YIVZ2l9qUfkcyPpG@kroah.com>
 <20210425.141536.1295354861910527121.rene@exactcode.com>
 <20210425144531.GA336783@rowland.harvard.edu>
 <20210425.170224.894337589208455353.rene@exactcode.com>
 <0e698ca2-06e6-6ee7-1c39-a4352207a40e@redhat.com>
 <83FED4AF-2078-43BA-95A8-1EB44C13329D@exactcode.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c7f619f8-b5c5-2a27-9a9e-e757c5cf5802@redhat.com>
Date:   Mon, 26 Apr 2021 10:16:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <83FED4AF-2078-43BA-95A8-1EB44C13329D@exactcode.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/25/21 10:52 PM, René Rebe wrote:
> Hi,
> 
>> On 25. Apr 2021, at 20:25, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Rene,
>>
>> On 4/25/21 5:02 PM, Rene Rebe wrote:
>>> Alan Stern <stern@rowland.harvard.edu> wrote:
>>>
>>>> On Sun, Apr 25, 2021 at 02:15:36PM +0200, Rene Rebe wrote:
>>>>> From: Greg KH <gregkh@linuxfoundation.org>
>>>>> Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
>>>>> Date: Sun, 25 Apr 2021 14:00:26 +0200
>>>>>
>>>>>>> I would expect that more modern devices to work. Vendors usually
>>>>>>> linearly allocate their product ids for new devices, and we could
>>>>>>> allow list product ids higher than this Seven to unbreak more modern
>>>>>>> devices by default and limit the amount of device quirks needed?
>>>>>>
>>>>>> Vendors do not allocate device ids that way at all, as there is no
>>>>>> requirement to do so.  I know of many vendors that seemingly use random
>>>>>> values from their product id space, so there is no guarantee that this
>>>>>> will work, sorry.
>>>>>
>>>>> I did not say it is a requirement, just that they usually do speaking
>>>>> of just this Seagate case. What is wrong with using that to
>>>>> potentially significantly cut down the quirk list?
>>>>
>>>> You didn't read commit 92335ad9e895, did you?  It lists a large number 
>>>> of Seagate devices that don't work with ATA pass-through, and three of 
>>>> them have product IDs that are larger than 0xab03.
>>>>
>>>> Please check the facts before guessing about things that will cause 
>>>> problems for other people.
>>>
>>> I really don't appreciate the unfriendly tone on the linux kernel
>>> mailing lists (which is why for 20 years I never felt like contributing
>>> here mo),
>>
>> I'm sorry to hear that the admittently sometimes unfriendly tone
>> on the kernel mailinglists have stopped you from contributing.
>>
>> Note that I do believe that things have gotten better recently.
>>
>> As for this email-thread, I don't really see anything wrong with
>> Alan's reply here. You have been quite argumentative in this entire
>> thread about how things would be much better if they are done your
>> way.
>>
>> I cannot speak for the others but I certainly have gotten annoyed by
>> the tone of your emails so far, I apologize if any of that annoyance
>> has bleed through in the tone of my emails. I do strive to always
>> stay professional (but as all of us I'm only human).
>>
>> <snip>
>>
>>>>>> What is wrong with just allowing specific devices that you have tested
>>>>>> will work, to the list instead?  That's the safest way to handle this.
>>>>>
>>>>> The problem is that out of the box it does not work for users, and
>>>>> normal users do not dive into the kernel code to find out and simply
>>>>> think their devices sucks. Even I for years thought the drive sucks,
>>>>> before I took a closer look. If you long term want more new devices in
>>>>> an allow list than the previous quirk list included (9 or 10 does not
>>>>> sound that many to me), ... whatever you prefer ,-) I would rather
>>>>> have 10 quirk disable list than potential many more white listed the
>>>>> next years to come. Maybe we shoudl simply restore the prevoius
>>>>> quirks.
>>>>
>>>> That's a possibility, and in the future we may do it.  But probably not 
>>>> until the enable list grows to a comparable length.
>>>
>>> Yeah, why future proof it now, ...
>>
>> Perhaps look in the mirror and start with improving the tone of your
>> own emails ?
> 
> Thanks, I re-read them and find them pretty ok.

I was directly referring to your "Yeah, why future proof it now, ..."
remark here. But more in general I personally find the tone of your
emails in this thread somewhat "combative".

I believe that in the end we all want the same thing which is to help
Linux users to get the best experience possible. It just seems that we
disagree on how to reach that goal.

Assuming that I have that correct, then I believe that there is a lot
of common ground between us; and I wish that we could approach this
in a way where we try to find a solution which we can all agree on.

Ideally we could just wave a magic wand and make this all work,
but unfortunately reality is not cooperating, so we need to come up
with some pragmatic solution here.

<snip>

> On further internet searching that there are at least 4 more drivers
> listed on the smartmontools page that should work:
> 
> 	https://www.smartmontools.org/wiki/Supported_USB-Devices

That is a very interesting link thank you. That certainly advocates
for a generic approach introducing a new US_FL_ATA_1X_OK and then
adding quirks setting that for both your model and the 4 models
listed there.

I would really appreciate it if you could submit a patch series
for this. But if you don't want to do that then I'll put this on
my own TODO list.

> Plus a dedicated page about this change and devices stopped working:
> 
> 	https://www.smartmontools.org/wiki/SAT-with-UAS-Linux

Thank you, that is another interesting link. Note that the page does
acknowledge that the problem with Seagate enclosures is real and
that in many cases the choice is falling back to usb-storage support
with working ATA pass-through, or UAS without ATA pass-through.

Given the huge performance advantages of UAS, especially with SSDs,
IMHO it is better to go with UAS in this case. But I guess in some
scenarios SMART support may be more important then UAS support.

I'll contact the author of that wiki page to discuss this further
with him and see if he has any good ideas for this problem.

> Given this, I will not continue spending my time on implementing
> what you suggested and instead simply reverted this for our Linux
> SDE as I believe results in the best out of the box experience
> for our users:
> 
> 	https://svn.exactcode.de/t2/trunk/package/base/linux/uas-seagate.patch

I've taken a quick peek at this and I see that you've also restored
the old per model quirks to disable ATA pass-through on known to be
broken models, good.

Note that the list of broken models which you've added it missing the
0xab25 and 0xab38 product-ids which according to:
https://www.smartmontools.org/wiki/Supported_USB-Devices
have broken ATA passthrough support with UAS.

If I assume that these behave as some of the other Seagate drivers and
the bridge-chip crashes when trying to use ATA pass-through, then once
these changes hit your users and customers you have just broken usage
of those disks together with your product. This nicely illustrates
why we don't want to make this change in the mainline kernel.

Note depending on how important disk performance is for you
an alternative approach might be to modify the Seagate product-id check
to simply disable UAS on Seagate devices, that would be a lot safer.

Regards,

Hans

