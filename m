Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E44736B119
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 11:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhDZJzD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 05:55:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31908 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232239AbhDZJzC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 05:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619430861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IGEhv0/hUFj3cHu6S4PGMMt/mAfIUPSSxo6hM2PSOx8=;
        b=A3nNVekR5CMNkkR4LsHnT9EkldTu39FZdW2JXToYSS6a9x7SzF6AlfxweciEYMHlV3kaIs
        mVj9kaJGQkMtyJ64DJVWZKXGH0Lo5AuYqvTTgNeA+hpQjjtwuNtNh9KwgAsGLOCCFeoOxz
        DPBEthChXviHjJlyqP0C3m77DPHecOY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-nnFNCJOVPgKnkn9c8oHrUA-1; Mon, 26 Apr 2021 05:54:14 -0400
X-MC-Unique: nnFNCJOVPgKnkn9c8oHrUA-1
Received: by mail-ej1-f70.google.com with SMTP id n13-20020a170906b30db029038ec026319aso572832ejz.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Apr 2021 02:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IGEhv0/hUFj3cHu6S4PGMMt/mAfIUPSSxo6hM2PSOx8=;
        b=FqFLjml6D/F6wcpGuZJL3hQrQKFsS9GiBn+OnHicyjPAu3bDbBABoOt+jzgj5rsbko
         ivAS031SPOBmXPzDKJz5TIR1Xx8wxmz5OkjMnhxMFrvgLfKXqvi1/BNmAfbh23U1oY/t
         L93mvNyHXqJC6ukdJPGOBMtDuttv6nUo+2BkxakZrSHe4k9Z+n9bqCKPYjVBhRj7PPLy
         hAyBL94/+87wiGxf7Oq1vwuMwHBTxLizxRwxL5rh9xyaGfLtSIOhRYzBudGFuK+qd+7k
         6md852oblC9VrcZU/g+2WsJeLhumJJcjLOeOqqwc1b7mxCjvqiLMB8PWNDjBcyWsweuJ
         fQug==
X-Gm-Message-State: AOAM53312NjNz4bKv6WfOYP6fUFhWFQrHY9r3vnORNbCxHd/PTDKLGTL
        IKfTFbslCvVxTg0YRgzWxRfRIYdR74kRm53KrU7GcjULFb8twgE/xF0GUmjsiohngbccdh8/VNM
        /X5bSw807clOQvNBxS8U6
X-Received: by 2002:a50:e607:: with SMTP id y7mr20445232edm.18.1619430853257;
        Mon, 26 Apr 2021 02:54:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1ofZDvj0xefdnn3n5wn+s078cXBxbhS2FTqoWbsUFbcKLl3otyjhCPyEOb/72nbVKWbdMmA==
X-Received: by 2002:a50:e607:: with SMTP id y7mr20445213edm.18.1619430853093;
        Mon, 26 Apr 2021 02:54:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u9sm7438345edq.68.2021.04.26.02.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 02:54:12 -0700 (PDT)
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
To:     Rene Rebe <rene@exactcode.com>
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <0e698ca2-06e6-6ee7-1c39-a4352207a40e@redhat.com>
 <83FED4AF-2078-43BA-95A8-1EB44C13329D@exactcode.com>
 <c7f619f8-b5c5-2a27-9a9e-e757c5cf5802@redhat.com>
 <20210426.114009.1308148203829096478.rene@exactcode.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <15433246-75ee-2618-2e20-0ab93b45a111@redhat.com>
Date:   Mon, 26 Apr 2021 11:54:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210426.114009.1308148203829096478.rene@exactcode.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/26/21 11:40 AM, Rene Rebe wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> Date: Mon, 26 Apr 2021 10:16:12 +0200
> 
>> Hi,
>>
>> On 4/25/21 10:52 PM, René Rebe wrote:

<snip>

>> Ideally we could just wave a magic wand and make this all work,
>> but unfortunately reality is not cooperating, so we need to come up
>> with some pragmatic solution here.
> 
> I did not mean to be compative, however, as usual in real life we just
> do not agree with all the reasoning ;-)

Yes, thank you for understanding.

>>> On further internet searching that there are at least 4 more drivers
>>> listed on the smartmontools page that should work:
>>>
>>> 	https://www.smartmontools.org/wiki/Supported_USB-Devices
>>
>> That is a very interesting link thank you. That certainly advocates
>> for a generic approach introducing a new US_FL_ATA_1X_OK and then
>> adding quirks setting that for both your model and the 4 models
>> listed there.
>>
>> I would really appreciate it if you could submit a patch series
>> for this. But if you don't want to do that then I'll put this on
>> my own TODO list.
> 
> Maybe another week, however, as this is not the semantic I prefer that
> would only cause more work for me with a bigger reverting patch in our
> tree at the end, ...

Thank you for considering working on this. If you decide not to do
this in the end, please let me know then I'll add this to my
(way too long) TODO list.

> <snip>
> 
>>> Given this, I will not continue spending my time on implementing
>>> what you suggested and instead simply reverted this for our Linux
>>> SDE as I believe results in the best out of the box experience
>>> for our users:
>>>
>>> 	https://svn.exactcode.de/t2/trunk/package/base/linux/uas-seagate.patch
>>
>> I've taken a quick peek at this and I see that you've also restored
>> the old per model quirks to disable ATA pass-through on known to be
>> broken models, good.
> 
> Yes, I reverted that, and added two more I found from the old email
> thread that probably triggered the code change back in the day.

Ah I was already why there were more entries then I expected,
good job.


>> Note that the list of broken models which you've added it missing the
>> 0xab25 and 0xab38 product-ids which according to:
>> https://www.smartmontools.org/wiki/Supported_USB-Devices
>> have broken ATA passthrough support with UAS.
> 
> Thanks, I added those two now as well.

Great, that means your patch will be a good starting point for
the broken devices list if we do ever decide to flip the
default for Seagate devices back to allowing ATA pass-through by
default.

>> If I assume that these behave as some of the other Seagate drivers and
>> the bridge-chip crashes when trying to use ATA pass-through, then once
>> these changes hit your users and customers you have just broken usage
>> of those disks together with your product. This nicely illustrates
>> why we don't want to make this change in the mainline kernel.
>>
>> Note depending on how important disk performance is for you
>> an alternative approach might be to modify the Seagate product-id check
>> to simply disable UAS on Seagate devices, that would be a lot safer.
> 
> We do not run a smartd by default>

Ah yes that helps, unfortunately in the mainline kernel we cannot
assume that that is the case.

> and I actually prefer a driver that
> deaults to behave by the standard book, and get notified when
> something goes wrong, instead of globally disallow listing a whole
> vendor.
> 
> Maybe it is still an option to restore the updated unusual quirk list
> entries, that way users with newer devices get their SMART back sooner
> than later and this also encourages Seagate to continue producing
> fully working devices, without hiding any ATA pass-through bugs by
> default ;-)

It is always an option :) I just don't think that this is the right
moment in time to do it. Notice that your email archive digging +
the https://www.smartmontools.org/wiki/Supported_USB-Devices have
turned op 4 new broken devices for which we did not have quirks
before. I'm simply afraid that that is just the tip of the iceberg.
Causing peoples disks to stop working is not just a bug, it is
a very very bad bug, so yeah I'm quite conservative here, sorry.

So for now I believe that the best thing we can do is to agree
that we disagree on the best way to handle this.

(Now if only I had this magic-wand which could give me the complete
list of all broken models, then things would be different.)

Regards,

Hans

