Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE7336A6C5
	for <lists+linux-usb@lfdr.de>; Sun, 25 Apr 2021 12:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhDYKn4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Apr 2021 06:43:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58408 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229525AbhDYKnz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Apr 2021 06:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619347395;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FL5Hryf0zzSHIem2IriVEWypXdKGZbBwbUNqEJ27NhI=;
        b=THjlVGIVW6HEQs8K0HNMh2WkKvLh+0b2ziJsiHS62qnJ96zVSx+riLldSQGHYsugi+vvlA
        51fsmnoz8ZhMbqx3LNxokAomp0BrRo75IQDRbcrua6jz4wLGH5d2HMs51mxfX+rby0qn6a
        KX2bXm7l240dKnG1Q4MIJUMuwmp5dxU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-z5SQnX9GPyiLxs_BrOoFzA-1; Sun, 25 Apr 2021 06:43:14 -0400
X-MC-Unique: z5SQnX9GPyiLxs_BrOoFzA-1
Received: by mail-ed1-f71.google.com with SMTP id f1-20020a0564021941b02903850806bb32so15357741edz.9
        for <linux-usb@vger.kernel.org>; Sun, 25 Apr 2021 03:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FL5Hryf0zzSHIem2IriVEWypXdKGZbBwbUNqEJ27NhI=;
        b=BiXjjfqoJ1Ar8bs9O79iERHod19KBzn8tpEFX64XVQEJT4z1pgDVPmIjgTzhethICX
         M8Kro/Fv10BIjpJxLY2VDQ0tcEL6jP1/b7lybnRH4mU6dPjs7pb+06BRMTCZ09JKWyL/
         GKjY8YMdJV4r38ZhKwwzF08bnHhQjJtwRiV+bCiBlWHnbEHBlqJzL9Hyj5wQU0FjSyxk
         rtTFtlA6e+GX0IOGJaet0oPZ4BJgHmYjCWomqD4WoV73rFx3rENdSx5Wnyb9bGv+UDMu
         vnbNXS3somvJ9ovaDKJKQu0cWsEmCPk/+g6S8D2QLPnuhs2lXM3+f19WVhenpp7tH8Li
         khLg==
X-Gm-Message-State: AOAM530uHNo/N+rn751Vt5Npk8PPInqelVAx8ns7NPBw+2p4/znL+6Wq
        Q8Zon0Ofkp0DS84FgqZa8P1A3RLWJ8U1Ml/FHcdEQDWSsEZRVMyh/iOmj707Q5lqD2qkCGfbpom
        g4IyAZ17lBgniyMx47gZD
X-Received: by 2002:a17:907:3e06:: with SMTP id hp6mr12914033ejc.273.1619347392834;
        Sun, 25 Apr 2021 03:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7ZXRVZ9R+2PTw+3++0tP6fhdMeYTc3H2A9swrwBo7D5dDsxhsxOZBkrcqgQs4AcWmpOSIYQ==
X-Received: by 2002:a17:907:3e06:: with SMTP id hp6mr12914022ejc.273.1619347392622;
        Sun, 25 Apr 2021 03:43:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ca1sm11404375edb.76.2021.04.25.03.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 03:43:12 -0700 (PDT)
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
To:     =?UTF-8?Q?Ren=c3=a9_Rebe?= <rene@exactcode.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20210424.220316.855336714119430355.rene@exactcode.com>
 <20210425023133.GC324386@rowland.harvard.edu>
 <883AF188-7817-42E2-84E8-F1DD7A5F3C08@exactcode.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <02f8f171-635a-4ad7-f937-78f935568de2@redhat.com>
Date:   Sun, 25 Apr 2021 12:43:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <883AF188-7817-42E2-84E8-F1DD7A5F3C08@exactcode.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/25/21 9:20 AM, René Rebe wrote:
> Hey,
> 
>> On 25. Apr 2021, at 04:31, Alan Stern <stern@rowland.harvard.edu> wrote:
>>> Seagate devices" in 2017. Apparently some early ones where buggy, ...
>>>
>>> However, fast forward a couple of years and this is no longer true,
>>> this Segate Seven even is already from 2016, and apparently first
>>> available in 2015. I suggest removing this rather drastic global
>>> measure, and instead only add very old broken ones with individual
>>> quirks, should any of them still be alive ;-)
>>>
>>> Signed-off-by: René Rebe <rene@exactcode.com>
>>>
>>> --- linux-5.11/drivers/usb/storage/uas-detect.h.backup	2021-03-05 11:36:00.517423726 +0100
>>> +++ linux-5.11/drivers/usb/storage/uas-detect.h	2021-03-05 11:36:16.373424544 +0100
>>> @@ -113,8 +113,4 @@
>>> 	}
>>>
>>> -	/* All Seagate disk enclosures have broken ATA pass-through support */
>>> -	if (le16_to_cpu(udev->descriptor.idVendor) == 0x0bc2)
>>> -		flags |= US_FL_NO_ATA_1X;
>>> -
>>> 	usb_stor_adjust_quirks(udev, &flags);
>>
>> I don't want to do this unless you can suggest an approach that won't 
>> suddenly break all those old buggy drives.  Just because they are now 
>> five years old or more doesn't mean they are no longer in use.
> 
> Well, what do you propose then? A allow quirk for all new devices going forward?
> Given that the user usually needs to actively run something like smartctl
> manually on the drive I don’t see that this should cause too many issues.

At least Fedora ships with smartmontools with a systemd service monitoring the
driver enabled by default; and I would not be surprised if other distros do
the same.

> I don’t have any non-supporting device - can we not just add them to the
> quirk list when someone reports one?

We have a no regressions rule in the kernel, this would cause regressions,
so NACK. Also the code which you are removing replaced a long list of non-working
Seagate devices, it is not just one or 2 models, we started out with model
specific quirks and when the list grew too long we went for this option.

Something else to keep in mind here is that:

1. Every single user out there wants to have a working drive, and removing the
quirk breaks that for older Seagate drive enclosures.

2. Only some advanced users care about SMART monitoring.

So what you are suggesting is breaking older Seagate drives for everyone to
enable a feature which only few users actually care about.

So as Greg said I believe that the best option would be to add a new
US_FL_ATA_1X_OK flag, add a quirk for your drive(s) and make the code setting
US_FL_NO_ATA_1X for all Seagate devices check that flag.

Regards,

Hans

