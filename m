Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A25225D726
	for <lists+linux-usb@lfdr.de>; Fri,  4 Sep 2020 13:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730106AbgIDL0b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Sep 2020 07:26:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43628 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730163AbgIDLZr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Sep 2020 07:25:47 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-41vrFL5KPm6Gjd-2TnPLlQ-1; Fri, 04 Sep 2020 07:16:45 -0400
X-MC-Unique: 41vrFL5KPm6Gjd-2TnPLlQ-1
Received: by mail-ed1-f70.google.com with SMTP id y15so2571133ede.14
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2020 04:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rGOUOPQ8Y3l0L4xm3V1c+7c7ChT/8b1ge/fYKbLTvxA=;
        b=pZcEgMAAvFl+skLFIk6L2iUbGCzVF4UQh98BfysSlBS4Z+B04evWwUqyV2ymjLIT9O
         VGFm6i4viSH7Mg7xsw6EB7htOTXQajHFVXvxbYOXAf004iwex4K4n9UuKJrKXbT4Gd4V
         RxZ13/jaexcYFI64nNO9TuTrHoJImE7+aBeXantu5qG2Luy9JQu1vUtBtZABmBrcBxqj
         FEUjD3j40gJ7ZgnTrB9+91vrHA/hk2WxFeP2rPD5wwdbHYDZ+3ZOtcn1CGrzkG5A1KuJ
         54aIxyopUn2rVtM788zFJJqZYcaU+QtFlS7gp2ZUlPnD8KwWdgMIslYqjB+mmGBHtG5C
         yOLg==
X-Gm-Message-State: AOAM531sOeORP8NOlysKVSlufM2WvmPc+nowkTRF+K6ONdCOXHi545UA
        gxDQDj/6mBidusUrCXh6Em1LDwU0qTgE9HHaxM/l8Pe7OjEaj1Jbocv48SZ7SR7wbBn8Z064c5h
        rJcnxMHlu3zhML7T+8+c1
X-Received: by 2002:a17:906:1b55:: with SMTP id p21mr7070232ejg.457.1599218203921;
        Fri, 04 Sep 2020 04:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/C2O4l1zrWTL/qMOCgIIs5O0Q+HrO6I1F/9lQ1LM83tX7XdpJMfa1Hz540JWokcfrasY1TQ==
X-Received: by 2002:a17:906:1b55:: with SMTP id p21mr7070201ejg.457.1599218203655;
        Fri, 04 Sep 2020 04:16:43 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n26sm5799589ejz.89.2020.09.04.04.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2020 04:16:43 -0700 (PDT)
Subject: Re: [PATCH v3] HID: quirks: Add USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk
 for BYD zhaoxin notebook
To:     PengHao <penghao@uniontech.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     johan@kernel.org, dlaz@chromium.org, stern@rowland.harvard.edu,
        kerneldev@karsmulder.nl, jonathan@jdcox.net, tomasz@meresinski.eu
References: <20200904091322.30426-1-penghao@uniontech.com>
 <f519d8a0-9082-13c5-0222-40dd9a1fac36@redhat.com>
 <bd5674f2-67dc-b386-f639-97ddce13b8af@uniontech.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d71edbab-daf4-3bed-9097-9aa2aacf65a5@redhat.com>
Date:   Fri, 4 Sep 2020 13:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bd5674f2-67dc-b386-f639-97ddce13b8af@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/4/20 12:38 PM, PengHao wrote:
> Hi, Hans
> 
> Thanks for the review. And sorry for I'm not really familiar with
> mailing list, so didn't reply early.
> 
> Actually the reason why I submit this patch, is the vendor ask we do
> this, they do not want enable touchpad wakeup.
> 
> And yes, this device use hid-multitouch.

Right, I already suspected that. I guess they might be seeing
a similar issue as what I am seeing on the Asus T101HA.

Here when closed the lid comes to close to the touchpad and
it starts sending spurious events, resulting in immediate
wakeup from suspend.

I have a workaround patch for that issue here:

https://github.com/jwrdegoede/linux-sunxi/commit/cb3a4c23b94bc3646953d00cea183d4e8fddeea0

As the commit message explains that patch is not yet
ready for upstream. It should probably be modified to
only disable the touchpad this way when remote-wakeup is
disabled (at which point it mainly becomes a power-saving
feature).

So if the BYD zhaoxin notebook has the same issue, then
adding a quirk to disable remote-wakeup is likely still the
right thing to do. But first I would like to understand the
problem better.

Regards,

Hans



> 
> 
> 在 2020/9/4 下午6:05, Hans de Goede 写道:
>> Hi,
>>
>> On 9/4/20 11:13 AM, Penghao wrote:
>>> Add a USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk for the BYD zhaoxin notebook.
>>> This notebook come with usb touchpad. And we would like to disable
>>> touchpad
>>> wakeup on this notebook by default.
>>
>> You are still not explaining why this is necessary ?
>>
>> And you did not answer my question if this touchpad is using hid-multitouch
>> either ?
>>
>> So NACK (rejection) from me until both questions are answered. The commi
>> message for a quirk should always explain why a quirk is necessary and
>> "we would like to disable touchpad wakeup on this notebook by default"
>> does not explain why you want to do that.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>
>>> Signed-off-by: Penghao <penghao@uniontech.com>
>>> ---
>>>
>>> Changes since v2:
>>>    - Add changes
>>>
>>> Changes since v1:
>>>    - Add the entries sorted by vendor ID and product ID.
>>>
>>>    drivers/usb/core/quirks.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
>>> index 7c1198f80c23..fffe1f7f1098 100644
>>> --- a/drivers/usb/core/quirks.c
>>> +++ b/drivers/usb/core/quirks.c
>>> @@ -393,6 +393,10 @@ static const struct usb_device_id
>>> usb_quirk_list[] = {
>>>        /* Generic RTL8153 based ethernet adapters */
>>>        { USB_DEVICE(0x0bda, 0x8153), .driver_info = USB_QUIRK_NO_LPM },
>>>    +    /* SONiX USB DEVICE Touchpad */
>>> +    { USB_DEVICE(0x0c45, 0x7056), .driver_info =
>>> +            USB_QUIRK_IGNORE_REMOTE_WAKEUP },
>>> +
>>>        /* Action Semiconductor flash disk */
>>>        { USB_DEVICE(0x10d6, 0x2200), .driver_info =
>>>                USB_QUIRK_STRING_FETCH_255 },
>>>
>>
>>
>>
>>
>>
> 
> 

