Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B904236A6C7
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 12:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhDYKsf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 06:48:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52906 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229525AbhDYKsd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Apr 2021 06:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619347673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GPe7oZJ+inpcWrlRBrTUPbpkLnlov2swiBkbP7YuquY=;
        b=NrGMx3FYCC8XxEllLKIEIO6vlDN1rP65VRRUaUNyzBKJUP2e/+ja49s1o4Eluz46/0hsMb
        mt/J5MOR0UcQSBKPR2ej/B0wPturxFCZ5xuvL1bf5963LCOKaMP5HX/AIjcg3/yQLYKFZK
        YqX1wslvSFIsK3PR4apvYiFZDET/1Fw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-s1_EHsPTNgWH_v9ZobOs5g-1; Sun, 25 Apr 2021 06:47:51 -0400
X-MC-Unique: s1_EHsPTNgWH_v9ZobOs5g-1
Received: by mail-ed1-f70.google.com with SMTP id v20-20020aa7cd540000b0290387928042f8so397642edw.19
        for <linux-usb@vger.kernel.org>; Sun, 25 Apr 2021 03:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GPe7oZJ+inpcWrlRBrTUPbpkLnlov2swiBkbP7YuquY=;
        b=nKCC985pty1LwFcmb4KwlGsumW2wMeScQJZ2oBGhMDc0iR4+U3ZzaCh1viJJG32/E9
         OXJ384rKYmSJGJsJopuRRKyuepgs5IXYKguj519ArA70upz3z/zYqzHhScyDDQZbwRw2
         AbppVRwnugwxDgQ1lVg63pnfcrGzwN+D8F237PLMJa+snEeL/QQu78/egMRvvl8tktZj
         zxmK4PSb/eyGI/INsP8JqYElKrXQHAk9nrUh5rRiU/9t88n+V0DGcJIa8wLI3yfUEYpn
         dq1kMUTF2T4zQlf+29UWip02Em0FquRcQkM4VcEq2+yx6cAyRn+JN5/f/8ljWvqkG+WV
         fHbA==
X-Gm-Message-State: AOAM531V5p+h0+ke1KhGx2Rcdxi08gPCLuZoCsr7hCtopfvGrwHHEGIp
        Svp9DDaNULadgtKqwewIhAOl2w813g71elD6FKhrWmoPIuLlLPN635lgFdBmVTXbg1wchDBPIgO
        moaKAz0bJRFx1KAq97vt0
X-Received: by 2002:a17:906:8319:: with SMTP id j25mr6033191ejx.413.1619347670691;
        Sun, 25 Apr 2021 03:47:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9+F0FjQwOWx9HOFqpfMDfyh+8Xa6pPs4FrtVQWg/vMQXknNBQMAWRCCKsnYW+o+4wfE2gaA==
X-Received: by 2002:a17:906:8319:: with SMTP id j25mr6033176ejx.413.1619347670530;
        Sun, 25 Apr 2021 03:47:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e11sm9274946ejl.115.2021.04.25.03.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 03:47:50 -0700 (PDT)
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
To:     Rene Rebe <rene@exactcode.com>, gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
References: <20210425023133.GC324386@rowland.harvard.edu>
 <883AF188-7817-42E2-84E8-F1DD7A5F3C08@exactcode.com>
 <YIUbHKqs2gQPAu2T@kroah.com>
 <20210425.124119.1949311822603950729.rene@exactcode.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7187e934-b87a-edce-2ac6-f201ea9c7b7d@redhat.com>
Date:   Sun, 25 Apr 2021 12:47:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210425.124119.1949311822603950729.rene@exactcode.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/25/21 12:41 PM, Rene Rebe wrote:
> Greg KH wrote:
> 
>> On Sun, Apr 25, 2021 at 09:20:59AM +0200, René Rebe wrote:
>>> Hey,
>>>
>>>> On 25. Apr 2021, at 04:31, Alan Stern <stern@rowland.harvard.edu> wrote:
>>>>> Seagate devices" in 2017. Apparently some early ones where buggy, ...
>>>>>
>>>>> However, fast forward a couple of years and this is no longer true,
>>>>> this Segate Seven even is already from 2016, and apparently first
>>>>> available in 2015. I suggest removing this rather drastic global
>>>>> measure, and instead only add very old broken ones with individual
>>>>> quirks, should any of them still be alive ;-)
>>>>>
>>>>> Signed-off-by: René Rebe <rene@exactcode.com>
>>>>>
>>>>> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
>>>>> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
>>>>> @@ -113,8 +113,4 @@
>>>>> 	}
>>>>>
>>>>> -	/* All Seagate disk enclosures have broken ATA pass-through support */
>>>>> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
>>>>> -		flags |= US_FL_NO_ATA_1X;
>>>>> -
>>>>> 	usb_stor_adjust_quirks(udev, &flags);
>>>>
>>>> I don't want to do this unless you can suggest an approach that won't 
>>>> suddenly break all those old buggy drives.  Just because they are now 
>>>> five years old or more doesn't mean they are no longer in use.
>>>
>>> Well, what do you propose then? A allow quirk for all new devices going forward?
>>> Given that the user usually needs to actively run something like smartctl
>>> manually on the drive I don’t see that this should cause too many issues.
>>> I don’t have any non-supporting device - can we not just add them to the
>>> quirk list when someone reports one?
>>
>> How about since you know your device works, you make the check detect
>> your specific device and not apply the flag to it?  You should be able
>> to do so based on the
> 
> Sure, while that does not really solve this for all the other newer
> Seagate drives other users might have at home, here is a patch
> checking for this one USB product ID. I hope that is what you meant:
> 
> Signed-off-by: René Rebe <rene@exactcode.com>
> 
> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
> @@ -113,5 +113,6 @@
>  
>  	/* All Seagate disk enclosures have broken ATA pass-through support */
> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
> +	if ((le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2) &&
> +	    (le16_to_cpu(udev->descriptor.idProduct) != 0xab03))
>  		flags |= US_FL_NO_ATA_1X;
>  
> 

As I indicated in my other email which crossed with this one, please make this
more generic, add a new US_FL_ATA_1X_OK flag and make the above code check that +
add a new unusual_uas.h entry for your device setting the new flag.

Note there is no need to add support for the new flag to usb_stor_adjust_quirks()
if a user overrides quirks for a device on the kernel commandline without specifying
the "t" flag then the US_FL_NO_ATA_1X flag will already get cleared.

I deliberately put the:

        if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
                flags |= US_FL_NO_ATA_1X;

code before the usb_stor_adjust_quirks() call to allow users to override this
from the kernel commandline.

Regards,

Hans

