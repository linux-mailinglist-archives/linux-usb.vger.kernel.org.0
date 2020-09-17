Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9B426E28D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 19:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgIQRf5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 13:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60178 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726422AbgIQRfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 13:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600364101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q+83hoCC8etUTtp1Otolz7gtotiWTZYHL3m+YrbQw9k=;
        b=PX8+n2BK9Ixj/ERZ7gpdbH45bclrsBA058XOmq7QciuAQrCNHAXZaLhrD2UA/Y7/Or/OT/
        EeTCrKydehs22d0rmkq4x0BFEoDzzpWYDxmTBpLo7uJSXqqq3OGvzMlFEgMasnZpx4PVbW
        HcGAU+WVLPO5z+4gxOAp/c90hUtrgGA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-dv8GRO19NUOZGsAhkrSjnA-1; Thu, 17 Sep 2020 13:27:07 -0400
X-MC-Unique: dv8GRO19NUOZGsAhkrSjnA-1
Received: by mail-ed1-f69.google.com with SMTP id d27so1178813edj.21
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 10:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q+83hoCC8etUTtp1Otolz7gtotiWTZYHL3m+YrbQw9k=;
        b=lgn76Nn4XqVEeuEqX5lAJH2SEzwMyzbl3qx7o/mzLZhau7uc5WniH3znvL0oDe4jYB
         WBUpHozzRQuKE/Lu5V22Nfyo4Weyz2E4hCHSOA5tIF+RU4x9PkjUjIF7WZlDDaAWJuBd
         fjWy4SstZ0nmx2WOl0rKn4mOsXGbgFS1N4liwKdz4apNwWMhcVzgFR5HzqMVh8sMTQHT
         jpHHxb2DxPjCvwQDPGN3GWhLYAMOwav5KgDFiWnSpji/bBy1Y2MdijTJytv/VxgE43eu
         1rs/03kWFhHUDQ1KnKlGcWpUNzZdF57UYhPSimAhrBfdNLqWPbeppddcYUfIQ3ZASjlD
         zsuQ==
X-Gm-Message-State: AOAM533NA6751Xpq2No2oELHjxOwusS853OJptKfFkqovqj5IuyOZ6Q4
        xsV3QXj135w0hgViTY8wUhTcGHifaalJm7W9NF8HsvN/u/1yIA4M+5hxNgPOP3P4CtervN5GhWz
        6pVhIdDxCwhAPIeqAM0X/
X-Received: by 2002:a50:cf8a:: with SMTP id h10mr34761384edk.43.1600363626035;
        Thu, 17 Sep 2020 10:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJsgXiDLTsh//zkey+FBL7p31vqLsIs6TAHS/mdxz9GFyt1DwGVKW43CxxxStGxPrqX7sxXw==
X-Received: by 2002:a50:cf8a:: with SMTP id h10mr34761361edk.43.1600363625742;
        Thu, 17 Sep 2020 10:27:05 -0700 (PDT)
Received: from x1.localdomain ([109.37.143.101])
        by smtp.gmail.com with ESMTPSA id j15sm240730eds.33.2020.09.17.10.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 10:27:05 -0700 (PDT)
Subject: Re: How to set USB_PORT_QUIRK_OLD_SCHEME on an usb-port ?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <2f2dd720-3ab4-ba0a-16bf-8b899aafa26d@redhat.com>
 <20200906022229.GA729107@rowland.harvard.edu>
 <28948e6c-b67b-5b5c-daeb-070a1dadf9c8@redhat.com>
 <20200910154109.GC849569@rowland.harvard.edu>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <495851d0-0ae0-e01b-bbd0-7c41c7e3f620@redhat.com>
Date:   Thu, 17 Sep 2020 19:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910154109.GC849569@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/10/20 5:41 PM, Alan Stern wrote:
> On Thu, Sep 10, 2020 at 03:58:49PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9/6/20 4:22 AM, Alan Stern wrote:
>>> On Sat, Sep 05, 2020 at 01:37:38PM +0200, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> I have been debugging an issue with a 2-in-1 which
>>>> consists of a tablet + a kbd-dock, where the device
>>>> turns into a clamshell when docked into the kbd-dock.
>>>>
>>>> The kbd dock is connected via pogo-pins. This works
>>>> fine when docked at boot. But there is an enumeration
>>>> issue when hot-docked (and the keyboard looses power
>>>> when the lid is closedm so this also triggers after
>>>> a suspend/resume):
>>>>
>>>> [ 3498.924190] usb 1-3: new full-speed USB device number 5 using xhci_hcd
>>>> [ 3499.041725] usb 1-3: device descriptor read/64, error -71
>>>> [ 3515.215890] usb 1-3: device descriptor read/64, error -110
>>>> [ 3515.440369] usb 1-3: new full-speed USB device number 6 using xhci_hcd
>>>> [ 3515.603544] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>>>> [ 3515.603574] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>>> [ 3515.603596] usb 1-3: Product: ITE Device(8910)
>>>> [ 3515.603614] usb 1-3: Manufacturer: ITE Tech. Inc.
>>>>
>>>> Note there is about 6 seconds before the keyboard becomes
>>>> usable, which is quite long when trying to unlock the
>>>> laptop after opening the lid.
>>>>
>>>> If I set the USB_PORT_QUIRK_OLD_SCHEME on the port used by the kbd-dock:
>>>>
>>>> echo 1 >  /sys/devices/pci0000\:00/0000\:00\:14.0/usb1/1-0\:1.0/usb1-port3/quirks
>>>>
>>>> Then this changes to:
>>>>
>>>> [ 4467.875008] usb 1-3: new full-speed USB device number 7 using xhci_hcd
>>>> [ 4467.878483] usb 1-3: Device not responding to setup address.
>>>> [ 4468.082476] usb 1-3: Device not responding to setup address.
>>>> [ 4468.289990] usb 1-3: device not accepting address 7, error -71
>>>> [ 4468.614928] usb 1-3: new full-speed USB device number 8 using xhci_hcd
>>>> [ 4468.662392] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>>>> [ 4468.662423] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>>> [ 4468.662444] usb 1-3: Product: ITE Device(8910)
>>>> [ 4468.662461] usb 1-3: Manufacturer: ITE Tech. Inc.
>>>>
>>>> Which is a lot better wrt making the keyboard available for
>>>> use in a timely manner.
>>>>
>>>> So now I'm looking into a way to automatically do this. I would
>>>> prefer to keep the handling of this out of the kernel, so I looked into
>>>> udev, but it seems that the usb_port_device_type device-s registered by
>>>> usb_hub_create_port_device() are not visible to udev?
>>>>
>>>> At least I'm not seeing them, in the output of "udevadm info -e"
>>>
>>> My impression is that fixing this would be the simplest approach.
>>
>> I agree that first trying to fix it is a good idea.

<snip>

>>> Have you tried decreasing the initial_descriptor_timeout module
>>> parameter for usbcore?  That would probably help, but it's kind of a
>>> sledgehammer.
>>
>> So I tried this:
>>
>> [root@localhost ~]# cat /sys/module/usbcore/parameters/initial_descriptor_timeout
>> 1000
>>
>> But it does not really seem to help:
>>
>> [ 1171.435346] usb 1-3: USB disconnect, device number 2
>> [ 1180.430958] usb 1-3: new full-speed USB device number 3 using xhci_hcd
>> [ 1180.551543] usb 1-3: device descriptor read/64, error -71
>> [ 1184.045548] usb 1-3: device descriptor read/64, error -110
>> [ 1184.270924] usb 1-3: new full-speed USB device number 4 using xhci_hcd
>> [ 1184.438336] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>> [ 1184.438371] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> [ 1184.438399] usb 1-3: Product: ITE Device(8910)
>> [ 1184.438425] usb 1-3: Manufacturer: ITE Tech. Inc.
> 
> That part of hub.c is a real mess.  Coincidentally, I just posted a
> patch to try and fix it up a bit:
> 
> 	https://marc.info/?l=linux-usb&m=159959185227447&w=2

Ok, I've applied the patch and tried again (with initial_descriptor_timeout still set to 1000),
so now the log from the reconnect looks look this:

[ 1157.248439] usb 1-3: new full-speed USB device number 3 using xhci_hcd
[ 1157.254234] usb 1-3: device descriptor read/64, error -71
[ 1157.371442] usb 1-3: new full-speed USB device number 4 using xhci_hcd
[ 1158.377895] usb 1-3: device descriptor read/64, error -110
[ 1158.379646] usb usb1-port3: attempt power cycle
[ 1159.014480] usb 1-3: new full-speed USB device number 5 using xhci_hcd
[ 1159.176112] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
[ 1159.176138] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 1159.176156] usb 1-3: Product: ITE Device(8910)
[ 1159.176172] usb 1-3: Manufacturer: ITE Tech. Inc.

Still a bit slower then the old probe method, but much better then the
new probe method with the default initial_descriptor_timeout.

> If you apply that along with module parameter change, does it make any
> difference?
> 
> (Or maybe you don't care to pursue this course and would prefer to work
> on the udev approach...)

No, I would like to see this fixed properly in the kernel, but this is
somewhat low on my prioritry list, esp. during workdays, so that why I'm
a bit slow with responding, sorry.

Regards,

Hans


