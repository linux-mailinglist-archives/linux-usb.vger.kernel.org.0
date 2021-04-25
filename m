Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D435B36A8C7
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 20:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhDYSPP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 14:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50742 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230459AbhDYSPO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Apr 2021 14:15:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619374473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z8/L6oOgmB7SFi3H9zeiOkiTOEUbd6SIXfhj77SrmSE=;
        b=hU+MllgwiuffCklKX+E2ZPdIIOjbpGT7k+SsRmZjfRbSqnMul0a9mY0Tt/XVHrTmKFMyen
        OmvIn8GfPb9py2g8EhTlljMa2lDDMbn2pzmqbGXp0JwZ+6lBmrB51bIWqqZUwpbydsSv7v
        7sPBDTIa8DK/SoOd+2XfAhdC5FTPZlI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-VU99Aar1PZ2dNCfTgSr2VQ-1; Sun, 25 Apr 2021 14:14:31 -0400
X-MC-Unique: VU99Aar1PZ2dNCfTgSr2VQ-1
Received: by mail-ed1-f69.google.com with SMTP id c13-20020a05640227cdb0290385526e5de5so11654761ede.21
        for <linux-usb@vger.kernel.org>; Sun, 25 Apr 2021 11:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z8/L6oOgmB7SFi3H9zeiOkiTOEUbd6SIXfhj77SrmSE=;
        b=bhPPEcI30pOsYl2DkIjLORVjMyHDOQewWJq9detr4wVwhssdyrcGQaEqgtHPVW6WWq
         FP01ievFuKBmZS7B5XM70I7zvuK6XjLgSjzzbXGquiDWCqOP4GHr5jlrZYeRdD3aMAHT
         UlBq5CdEHuGqBz/o56P3BGU3nqIIT8luqbuBrySqI8vOsTVFTMF1rox2lAkC2QRrzLOH
         vTM1u8q81bT4P8UkwFg+Qqfzla7zTs0G/20LjWzdERUjnMvUCN59nEA8N0tRqrjKuTjt
         r3SDRmtxdnuuhIcqQz/NDTsBG383LsLuAS9Sv9c2LU2BwOy3boSGuhfJRuaPEY+EpXFt
         j33g==
X-Gm-Message-State: AOAM532U2HtGiQmMUgvEtJgw7akO8Z+lxXpl28Ovri5pFzOjf1KxxF1Z
        jUufRQmxShjR5Np3eeS/4j3Gm0mZj+kiZIt8CcFS1QnCFduqBvwBTF6EEJJOUQ6rXn0HGZ72OJw
        JEHEBHHdl5BFfTWPX/+wj
X-Received: by 2002:a17:906:2a1b:: with SMTP id j27mr14540979eje.370.1619374470315;
        Sun, 25 Apr 2021 11:14:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzyaR6YTh0IjYQ3aHT5umr3xcO3R33sMfVwuZOytymJyAR/0AasxSWTxvHE3dQiUFu/Jn5/w==
X-Received: by 2002:a17:906:2a1b:: with SMTP id j27mr14540968eje.370.1619374470172;
        Sun, 25 Apr 2021 11:14:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q6sm9756591ejt.51.2021.04.25.11.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 11:14:29 -0700 (PDT)
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
To:     Rene Rebe <rene@exactcode.com>, gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
References: <YIVZ2l9qUfkcyPpG@kroah.com>
 <20210425.141536.1295354861910527121.rene@exactcode.com>
 <YIVgGdGbSpQ1norU@kroah.com>
 <20210425.175005.2217483968766014768.rene@exactcode.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <191b41b5-36fc-689a-b045-4c7735cebacc@redhat.com>
Date:   Sun, 25 Apr 2021 20:14:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210425.175005.2217483968766014768.rene@exactcode.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/25/21 5:50 PM, Rene Rebe wrote:
> Hey
> 
> From: Greg KH <gregkh@linuxfoundation.org>:
> 
>>>>> Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
>>>>> Date: Sun, 25 Apr 2021 12:58:40 +0200
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 4/25/21 12:47 PM, Hans de Goede wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 4/25/21 12:41 PM, Rene Rebe wrote:
>>>>>>>> Greg KH wrote:
>>>>>>>>
>>>>>>>>> On Sun, Apr 25, 2021 at 09:20:59AM +0200, René Rebe wrote:
>>>>>>>>>> Hey,
>>>>>>>>>>
>>>>>>>>>>> On 25. Apr 2021, at 04:31, Alan Stern <stern@rowland.harvard.edu> wrote:
>>>>>>>>>>>> Seagate devices" in 2017. Apparently some early ones where buggy, ...
>>>>>>>>>>>>
>>>>>>>>>>>> However, fast forward a couple of years and this is no longer true,
>>>>>>>>>>>> this Segate Seven even is already from 2016, and apparently first
>>>>>>>>>>>> available in 2015. I suggest removing this rather drastic global
>>>>>>>>>>>> measure, and instead only add very old broken ones with individual
>>>>>>>>>>>> quirks, should any of them still be alive ;-)
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: René Rebe <rene@exactcode.com>
>>>>>>>>>>>>
>>>>>>>>>>>> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
>>>>>>>>>>>> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
>>>>>>>>>>>> @@ -113,8 +113,4 @@
>>>>>>>>>>>> 	}
>>>>>>>>>>>>
>>>>>>>>>>>> -	/* All Seagate disk enclosures have broken ATA pass-through support */
>>>>>>>>>>>> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
>>>>>>>>>>>> -		flags |= US_FL_NO_ATA_1X;
>>>>>>>>>>>> -
>>>>>>>>>>>> 	usb_stor_adjust_quirks(udev, &flags);
>>>>>>>>>>>
>>>>>>>>>>> I don't want to do this unless you can suggest an approach that won't 
>>>>>>>>>>> suddenly break all those old buggy drives.  Just because they are now 
>>>>>>>>>>> five years old or more doesn't mean they are no longer in use.
>>>>>>>>>>
>>>>>>>>>> Well, what do you propose then? A allow quirk for all new devices going forward?
>>>>>>>>>> Given that the user usually needs to actively run something like smartctl
>>>>>>>>>> manually on the drive I don’t see that this should cause too many issues.
>>>>>>>>>> I don’t have any non-supporting device - can we not just add them to the
>>>>>>>>>> quirk list when someone reports one?
>>>>>>>>>
>>>>>>>>> How about since you know your device works, you make the check detect
>>>>>>>>> your specific device and not apply the flag to it?  You should be able
>>>>>>>>> to do so based on the
>>>>>>>>
>>>>>>>> Sure, while that does not really solve this for all the other newer
>>>>>>>> Seagate drives other users might have at home, here is a patch
>>>>>>>> checking for this one USB product ID. I hope that is what you meant:
>>>>>>>>
>>>>>>>> Signed-off-by: René Rebe <rene@exactcode.com>
>>>>>>>>
>>>>>>>> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
>>>>>>>> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
>>>>>>>> @@ -113,5 +113,6 @@
>>>>>>>>  
>>>>>>>>  	/* All Seagate disk enclosures have broken ATA pass-through support */
>>>>>>>> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
>>>>>>>> +	if ((le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2) &&
>>>>>>>> +	    (le16_to_cpu(udev->descriptor.idProduct) != 0xab03))
>>>>>>>>  		flags |= US_FL_NO_ATA_1X;
>>>>>>>>  
>>>>>>>>
>>>>>>>
>>>>>>> As I indicated in my other email which crossed with this one, please make this
>>>>>>> more generic, add a new US_FL_ATA_1X_OK flag and make the above code check that +
>>>>>>> add a new unusual_uas.h entry for your device setting the new flag.
>>>>>>>
>>>>>>> Note there is no need to add support for the new flag to usb_stor_adjust_quirks()
>>>>>>> if a user overrides quirks for a device on the kernel commandline without specifying
>>>>>>> the "t" flag then the US_FL_NO_ATA_1X flag will already get cleared.
>>>>>>>
>>>>>>> I deliberately put the:
>>>>>>>
>>>>>>>         if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
>>>>>>>                 flags |= US_FL_NO_ATA_1X;
>>>>>>>
>>>>>>> code before the usb_stor_adjust_quirks() call to allow users to override this
>>>>>>> from the kernel commandline.
>>>>>>
>>>>>> p.s.
>>>>>>
>>>>>> A "git log drivers/usb/storage/unusual_uas.h" quickly finds the commit which removed the
>>>>>> quirks which the generic Seagate check replaces. At that time there were US_FL_NO_ATA_1X
>>>>>> quirks for *9* different Seagate models present in unusual_uas.h and I assume someone
>>>>>> reporting a 10th model is what made me go for the just disable this for all Seagate
>>>>>> driver option.
>>>>>>
>>>>>> See commit 92335ad9e895 ("uas: Remove US_FL_NO_ATA_1X unusual device entries for Seagate devices")
>>>>>>
>>>>>> Also I did a quick websearch for the "Seagate Seven" and rather then the usual re-usable
>>>>>> drive-enclosure with a standard 2.5" or 3.5" drive in there, this seems to be a custom
>>>>>> model where the enclosure is actually integrated into the drive to make it smaller.
>>>>>>
>>>>>> So I would not be surprised if this is using another chipset then their usual enclosures,
>>>>>> which would explain why it does have working ATA1x passthrough.
>>>>>
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
>> Because the down-side of this is if we guess wrong, we break things.
>>
>>>> What is wrong with just allowing specific devices that you have tested
>>>> will work, to the list instead?  That's the safest way to handle this.
>>>
>>> The problem is that out of the box it does not work for users, and
>>> normal users do not dive into the kernel code to find out and simply
>>> think their devices sucks. Even I for years thought the drive sucks,
> 
> Ok, so I went there and wanted to quickly add the requested 1X_OK
> unusual flag, buuuutt, apparently all 32-bits of the US_FLAG enum in
> ./include/linux/usb_usual.h are already exhausted, ...

Ah yes, well that was bound to happen sooner or later.

> What should we do now? Make it 64-bit or other workaround suggestions?
> Maybe reverting the original 9 blacklist removals after all?

This is not part of any userspace API, so we can safely bump it to
a 64 bit type, say "u64", thanks.

Regards,

Hans

