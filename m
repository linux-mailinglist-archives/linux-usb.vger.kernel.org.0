Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD6B281CA4
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 22:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725648AbgJBULG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 16:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34825 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725300AbgJBULG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 16:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601669463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qGOyMX5bbDaa46N90y1d8gAYIQ8yg12+30FiC/fu2hY=;
        b=e9U/dtH1A0J68/vn+efbPs6f5clT4nCNYYHpBcHbqVm9/EkHlexJt/+urB/axqbTz61BEV
        q1a3ZbFu3vM6hFs4aPvTztXibjqu94COelT8per8owC8a5qOS7nBNrs5eax2/sUQ3NOfCu
        NeR31Q8ZpGY1gAd4pGePsFeJvsgxACI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-AuAEmL2yPGepVOhQGfYdqg-1; Fri, 02 Oct 2020 16:10:59 -0400
X-MC-Unique: AuAEmL2yPGepVOhQGfYdqg-1
Received: by mail-ej1-f69.google.com with SMTP id y25so1034357ejj.4
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2020 13:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qGOyMX5bbDaa46N90y1d8gAYIQ8yg12+30FiC/fu2hY=;
        b=AUE77opoAa4+n0xgffDwfcQ+m7ndJ89yTWvDoDN3eNFcYxLBc7SYB4Y8NX3C/UPNDp
         UhFL1gKiE/qb5D4ycdAC5JE+mrPeOSfcaUW0tWXGfOVgeRqnz+ad7wytF25W9eGwVVwz
         s0D5igJzENaHFoZEWHhjeytOxop7HikilVvrB/k6Nsxg3mV4ndWVuxar0efy1C1NCDoD
         EWD6BBUOD1zxI6oG/awG7NPRPIbtPoAnUUdGvyzK71wERWqBGwi/C/M5z5VtduAESCVv
         R+ReOGA46l6GKfImjy5onQ85jQkTFkBsss/rT00TcPTVEJ0DzZJKv9PsXf8wPLlJAhBg
         0UEg==
X-Gm-Message-State: AOAM531XOOyd8t5ieAnlBRYzS2+UjGQ+41qBcMDqABXv34eaITnWaa3t
        5l1QOks23QTRF8izEtKXQfNxnfKqj7p26/tTs4E8EIqm2W1aoQJ9uhwRFaxJR3RvAJ5RKGR22hn
        vcblSLY//pzcp6Zvningn
X-Received: by 2002:aa7:c6ce:: with SMTP id b14mr4486317eds.174.1601669456183;
        Fri, 02 Oct 2020 13:10:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHqT2wmQUfwM7gGATHDCG7MKNw5D1lY39JRGH9ab4WmpfPFIIBP2yN40hAZ1GhpLUnITy17A==
X-Received: by 2002:aa7:c6ce:: with SMTP id b14mr4486294eds.174.1601669455866;
        Fri, 02 Oct 2020 13:10:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v1sm948157eds.47.2020.10.02.13.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 13:10:53 -0700 (PDT)
Subject: Re: How to set USB_PORT_QUIRK_OLD_SCHEME on an usb-port ?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <2f2dd720-3ab4-ba0a-16bf-8b899aafa26d@redhat.com>
 <20200906022229.GA729107@rowland.harvard.edu>
 <28948e6c-b67b-5b5c-daeb-070a1dadf9c8@redhat.com>
 <20200910154109.GC849569@rowland.harvard.edu>
 <495851d0-0ae0-e01b-bbd0-7c41c7e3f620@redhat.com>
 <20200917200949.GC1099735@rowland.harvard.edu>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <db64c49e-6e1a-c12d-7340-e88edb06c30e@redhat.com>
Date:   Fri, 2 Oct 2020 22:10:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917200949.GC1099735@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/17/20 10:09 PM, Alan Stern wrote:
> On Thu, Sep 17, 2020 at 07:27:03PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9/10/20 5:41 PM, Alan Stern wrote:
>>> On Thu, Sep 10, 2020 at 03:58:49PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/6/20 4:22 AM, Alan Stern wrote:
>>>>> On Sat, Sep 05, 2020 at 01:37:38PM +0200, Hans de Goede wrote:
>>>>>> Hi All,
>>>>>>
>>>>>> I have been debugging an issue with a 2-in-1 which
>>>>>> consists of a tablet + a kbd-dock, where the device
>>>>>> turns into a clamshell when docked into the kbd-dock.
>>>>>>
>>>>>> The kbd dock is connected via pogo-pins. This works
>>>>>> fine when docked at boot. But there is an enumeration
>>>>>> issue when hot-docked (and the keyboard looses power
>>>>>> when the lid is closedm so this also triggers after
>>>>>> a suspend/resume):
>>>>>>
>>>>>> [ 3498.924190] usb 1-3: new full-speed USB device number 5 using xhci_hcd
>>>>>> [ 3499.041725] usb 1-3: device descriptor read/64, error -71
>>>>>> [ 3515.215890] usb 1-3: device descriptor read/64, error -110
>>>>>> [ 3515.440369] usb 1-3: new full-speed USB device number 6 using xhci_hcd
>>>>>> [ 3515.603544] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>>>>>> [ 3515.603574] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>>>>> [ 3515.603596] usb 1-3: Product: ITE Device(8910)
>>>>>> [ 3515.603614] usb 1-3: Manufacturer: ITE Tech. Inc.
>>>>>>
>>>>>> Note there is about 6 seconds before the keyboard becomes
>>>>>> usable, which is quite long when trying to unlock the
>>>>>> laptop after opening the lid.
>>>>>>
>>>>>> If I set the USB_PORT_QUIRK_OLD_SCHEME on the port used by the kbd-dock:
>>>>>>
>>>>>> echo 1 >  /sys/devices/pci0000\:00/0000\:00\:14.0/usb1/1-0\:1.0/usb1-port3/quirks
>>>>>>
>>>>>> Then this changes to:
>>>>>>
>>>>>> [ 4467.875008] usb 1-3: new full-speed USB device number 7 using xhci_hcd
>>>>>> [ 4467.878483] usb 1-3: Device not responding to setup address.
>>>>>> [ 4468.082476] usb 1-3: Device not responding to setup address.
>>>>>> [ 4468.289990] usb 1-3: device not accepting address 7, error -71
>>>>>> [ 4468.614928] usb 1-3: new full-speed USB device number 8 using xhci_hcd
>>>>>> [ 4468.662392] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>>>>>> [ 4468.662423] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>>>>> [ 4468.662444] usb 1-3: Product: ITE Device(8910)
>>>>>> [ 4468.662461] usb 1-3: Manufacturer: ITE Tech. Inc.
>>>>>>
>>>>>> Which is a lot better wrt making the keyboard available for
>>>>>> use in a timely manner.
>>>>>>
>>>>>> So now I'm looking into a way to automatically do this. I would
>>>>>> prefer to keep the handling of this out of the kernel, so I looked into
>>>>>> udev, but it seems that the usb_port_device_type device-s registered by
>>>>>> usb_hub_create_port_device() are not visible to udev?
>>>>>>
>>>>>> At least I'm not seeing them, in the output of "udevadm info -e"
>>>>>
>>>>> My impression is that fixing this would be the simplest approach.
>>>>
>>>> I agree that first trying to fix it is a good idea.
>>
>> <snip>
>>
>>>>> Have you tried decreasing the initial_descriptor_timeout module
>>>>> parameter for usbcore?  That would probably help, but it's kind of a
>>>>> sledgehammer.
>>>>
>>>> So I tried this:
>>>>
>>>> [root@localhost ~]# cat /sys/module/usbcore/parameters/initial_descriptor_timeout
>>>> 1000
>>>>
>>>> But it does not really seem to help:
>>>>
>>>> [ 1171.435346] usb 1-3: USB disconnect, device number 2
>>>> [ 1180.430958] usb 1-3: new full-speed USB device number 3 using xhci_hcd
>>>> [ 1180.551543] usb 1-3: device descriptor read/64, error -71
>>>> [ 1184.045548] usb 1-3: device descriptor read/64, error -110
>>>> [ 1184.270924] usb 1-3: new full-speed USB device number 4 using xhci_hcd
>>>> [ 1184.438336] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>>>> [ 1184.438371] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>>> [ 1184.438399] usb 1-3: Product: ITE Device(8910)
>>>> [ 1184.438425] usb 1-3: Manufacturer: ITE Tech. Inc.
>>>
>>> That part of hub.c is a real mess.  Coincidentally, I just posted a
>>> patch to try and fix it up a bit:
>>>
>>> 	https://marc.info/?l=linux-usb&m=159959185227447&w=2
>>
>> Ok, I've applied the patch and tried again (with initial_descriptor_timeout still set to 1000),
>> so now the log from the reconnect looks look this:
>>
>> [ 1157.248439] usb 1-3: new full-speed USB device number 3 using xhci_hcd
>> [ 1157.254234] usb 1-3: device descriptor read/64, error -71
>> [ 1157.371442] usb 1-3: new full-speed USB device number 4 using xhci_hcd
>> [ 1158.377895] usb 1-3: device descriptor read/64, error -110
>> [ 1158.379646] usb usb1-port3: attempt power cycle
>> [ 1159.014480] usb 1-3: new full-speed USB device number 5 using xhci_hcd
>> [ 1159.176112] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>> [ 1159.176138] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> [ 1159.176156] usb 1-3: Product: ITE Device(8910)
>> [ 1159.176172] usb 1-3: Manufacturer: ITE Tech. Inc.
>>
>> Still a bit slower then the old probe method, but much better then the
>> new probe method with the default initial_descriptor_timeout.
> 
> Yeah, okay, it's good to see that the patch helps.  But I'm doubtful
> that the change it makes will become part of the standard (i.e., not
> for embedded systems) kernel.
> 
> I still think the udev approach will be best.  That will require adding
> various *_uevent_* calls in usb_hub_create_port_device, and adding a
> .uevent member to usb_port_device_type.

So I tried this and it does not work, the problem is that
dev_uevent_filter() from drivers/base/core.c
filters out uevents for anything which is not either a device
on a bus or a class device:

static int dev_uevent_filter(struct kset *kset, struct kobject *kobj)
{
         struct kobj_type *ktype = get_ktype(kobj);

         if (ktype == &device_ktype) {
                 struct device *dev = kobj_to_dev(kobj);
                 if (dev->bus)
                         return 1;
                 if (dev->class)
                         return 1;
         }
         return 0;
}

(as mentioned this is a low priority thing for me, so hence
  the long time between replies)

Regards,

Hans

