Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB6D36A6D3
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 12:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhDYK7Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 06:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26032 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229525AbhDYK7Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Apr 2021 06:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619348324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6BdWKwvEAsU8I94UWFhYX6VA+g4MZ/9S/hDCSfn7d0=;
        b=GcOPtAUaTVr2lpfsm89XjjXPJL4h535ySkFd6RooFhs6YNLTT7/nsSnNNH6NflfA8RGH8A
        tSLFl+OxhkAgcgWAjDgGU0pqJY52Q9MWwFoa4HKUBB++wr4kLZWEEW5NFaEDOlPDWnuIc0
        FGqEbuJK0o7RmZ6keB5xbwwTY/Z5FCQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-cVtq35E1NdOEZYangPxUWw-1; Sun, 25 Apr 2021 06:58:42 -0400
X-MC-Unique: cVtq35E1NdOEZYangPxUWw-1
Received: by mail-ed1-f71.google.com with SMTP id bf25-20020a0564021a59b0290385169cebf8so13980441edb.8
        for <linux-usb@vger.kernel.org>; Sun, 25 Apr 2021 03:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c6BdWKwvEAsU8I94UWFhYX6VA+g4MZ/9S/hDCSfn7d0=;
        b=IVvyqafqJOBv03nnoHC4TYmgNa8wio9+pB8cjmkpsAhwbfDxrQDS6emSUX/zLG/3W1
         jao7XVM9M990uraS89YTHlh5VHve86TelXpM8M4jSi7eIsuRVD9ujCinHDqS6Lo8OIOx
         VRv8rBlMWH6a4DMz/4tY1cLaDrx+XsKfHoVh7SPZ7uDXTOA4HBgns2zUnOwBXZ5c1/s7
         px53sLhfN6WSsAJwuXek0EduwE25L7P4Q0SAF3VOV7eiwMnnG8GOJNUKGvPmoxikDkMy
         N0cFMKAb9KxOuW+mlcqcMm6UBxIjA9JWgXBUEw4RdGzu2rjvpM4floVTiSNk/SFwU1Nr
         q4YA==
X-Gm-Message-State: AOAM531IqmTdkwx+a8m/hbLpJqQRu2v9uHcjT1joDnjJug1Lk5nr8Cek
        davo2Xgp+hx52xY/s8taKwxFVPXTIvfkzoCO7oyNGMjmLEtNR0+MuMHvra0cOt94EP7Jdf29DE/
        1l+GfZOtTY0bR9/VMsvce
X-Received: by 2002:a05:6402:5a:: with SMTP id f26mr15062288edu.285.1619348321315;
        Sun, 25 Apr 2021 03:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypCsICPzgBkJ14uYN/LwfvY6vxxQPF1ij7v5GRZRvcDJrFnX+VVMCELsmVqEqQAoXzvr2sgg==
X-Received: by 2002:a05:6402:5a:: with SMTP id f26mr15062272edu.285.1619348321092;
        Sun, 25 Apr 2021 03:58:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n2sm11699764edi.32.2021.04.25.03.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 03:58:40 -0700 (PDT)
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
From:   Hans de Goede <hdegoede@redhat.com>
To:     Rene Rebe <rene@exactcode.com>, gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
References: <20210425023133.GC324386@rowland.harvard.edu>
 <883AF188-7817-42E2-84E8-F1DD7A5F3C08@exactcode.com>
 <YIUbHKqs2gQPAu2T@kroah.com>
 <20210425.124119.1949311822603950729.rene@exactcode.com>
 <7187e934-b87a-edce-2ac6-f201ea9c7b7d@redhat.com>
Message-ID: <ee48ea5d-c820-ae24-b557-2a7b7372821c@redhat.com>
Date:   Sun, 25 Apr 2021 12:58:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7187e934-b87a-edce-2ac6-f201ea9c7b7d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/25/21 12:47 PM, Hans de Goede wrote:
> Hi,
> 
> On 4/25/21 12:41 PM, Rene Rebe wrote:
>> Greg KH wrote:
>>
>>> On Sun, Apr 25, 2021 at 09:20:59AM +0200, René Rebe wrote:
>>>> Hey,
>>>>
>>>>> On 25. Apr 2021, at 04:31, Alan Stern <stern@rowland.harvard.edu> wrote:
>>>>>> Seagate devices" in 2017. Apparently some early ones where buggy, ...
>>>>>>
>>>>>> However, fast forward a couple of years and this is no longer true,
>>>>>> this Segate Seven even is already from 2016, and apparently first
>>>>>> available in 2015. I suggest removing this rather drastic global
>>>>>> measure, and instead only add very old broken ones with individual
>>>>>> quirks, should any of them still be alive ;-)
>>>>>>
>>>>>> Signed-off-by: René Rebe <rene@exactcode.com>
>>>>>>
>>>>>> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
>>>>>> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
>>>>>> @@ -113,8 +113,4 @@
>>>>>> 	}
>>>>>>
>>>>>> -	/* All Seagate disk enclosures have broken ATA pass-through support */
>>>>>> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
>>>>>> -		flags |= US_FL_NO_ATA_1X;
>>>>>> -
>>>>>> 	usb_stor_adjust_quirks(udev, &flags);
>>>>>
>>>>> I don't want to do this unless you can suggest an approach that won't 
>>>>> suddenly break all those old buggy drives.  Just because they are now 
>>>>> five years old or more doesn't mean they are no longer in use.
>>>>
>>>> Well, what do you propose then? A allow quirk for all new devices going forward?
>>>> Given that the user usually needs to actively run something like smartctl
>>>> manually on the drive I don’t see that this should cause too many issues.
>>>> I don’t have any non-supporting device - can we not just add them to the
>>>> quirk list when someone reports one?
>>>
>>> How about since you know your device works, you make the check detect
>>> your specific device and not apply the flag to it?  You should be able
>>> to do so based on the
>>
>> Sure, while that does not really solve this for all the other newer
>> Seagate drives other users might have at home, here is a patch
>> checking for this one USB product ID. I hope that is what you meant:
>>
>> Signed-off-by: René Rebe <rene@exactcode.com>
>>
>> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
>> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
>> @@ -113,5 +113,6 @@
>>  
>>  	/* All Seagate disk enclosures have broken ATA pass-through support */
>> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
>> +	if ((le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2) &&
>> +	    (le16_to_cpu(udev->descriptor.idProduct) != 0xab03))
>>  		flags |= US_FL_NO_ATA_1X;
>>  
>>
> 
> As I indicated in my other email which crossed with this one, please make this
> more generic, add a new US_FL_ATA_1X_OK flag and make the above code check that +
> add a new unusual_uas.h entry for your device setting the new flag.
> 
> Note there is no need to add support for the new flag to usb_stor_adjust_quirks()
> if a user overrides quirks for a device on the kernel commandline without specifying
> the "t" flag then the US_FL_NO_ATA_1X flag will already get cleared.
> 
> I deliberately put the:
> 
>         if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
>                 flags |= US_FL_NO_ATA_1X;
> 
> code before the usb_stor_adjust_quirks() call to allow users to override this
> from the kernel commandline.

p.s.

A "git log drivers/usb/storage/unusual_uas.h" quickly finds the commit which removed the
quirks which the generic Seagate check replaces. At that time there were US_FL_NO_ATA_1X
quirks for *9* different Seagate models present in unusual_uas.h and I assume someone
reporting a 10th model is what made me go for the just disable this for all Seagate
driver option.

See commit 92335ad9e895 ("uas: Remove US_FL_NO_ATA_1X unusual device entries for Seagate devices")

Also I did a quick websearch for the "Seagate Seven" and rather then the usual re-usable
drive-enclosure with a standard 2.5" or 3.5" drive in there, this seems to be a custom
model where the enclosure is actually integrated into the drive to make it smaller.

So I would not be surprised if this is using another chipset then their usual enclosures,
which would explain why it does have working ATA1x passthrough.

Regards,

Hans

