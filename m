Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBE42823C6
	for <lists+linux-usb@lfdr.de>; Sat,  3 Oct 2020 13:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgJCLJv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Oct 2020 07:09:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21837 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725767AbgJCLJv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Oct 2020 07:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601723388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vWaHbZFgHTfg+J55hByEDwBdA7HpJhhudtEPyB7Phfk=;
        b=M++aN46/Pj7iq7OSyoCQgt+JNA1/5YiWB6dd4PW+sUud06ETUDcvARxxeJtXsZD6i3G7KK
        LqnYWBhLY4jyVuqpGWZt9bwvI5eIJRf4hjaJz4FFrkB3kIycHjkLzR6QtBVud24NymlXvP
        wJPErq3TETv7iulGu29HoB5htxNIY4w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-K3Q6xf4VNR-oaQSK7baBtA-1; Sat, 03 Oct 2020 07:09:44 -0400
X-MC-Unique: K3Q6xf4VNR-oaQSK7baBtA-1
Received: by mail-ed1-f72.google.com with SMTP id f16so2110436edm.10
        for <linux-usb@vger.kernel.org>; Sat, 03 Oct 2020 04:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vWaHbZFgHTfg+J55hByEDwBdA7HpJhhudtEPyB7Phfk=;
        b=b1ww5Vviv9gVxH57W6MZfCIdu8WLlybLYtqn4tQEU9pIcLnyXwcUcSeg+MrBOs1/0p
         iUFR/sAUPzY7I4aIda+ieRgse8rHpK+M7yNyNOsmIRy2kKh6xl/IkXxIPBQKM29oEm3a
         7QBdDAr3xm0w/sjIxeRLMQYGTesmI3T18WYwAsAwYelkcXmE4lkTWdHwGaWoQluGWK/y
         sSU+5n6hUPDojsHP4+Vtv5rpN8rpIhVejzfM1dOd1dq2UtOHURuCBCxRWuJHVpyH97zC
         oRy4LVqI0IxLeAwP76alENWRQqiQyrtYVL0i79a7xRxgpOXpoM96GVjrFy9wdtiYC3++
         tRFg==
X-Gm-Message-State: AOAM532FvI4XlFXlS2JaPlOqb6DWX04l60ORDgc8cvxpXgPQmmGWXLdh
        whgfozqJAFBlaWP2TdEO+jKN34rKmAl3gavuu4idyLZuqueI9fnvskQXRDjuhNCsekdXiU0rdKn
        JcBnYe7RXUGCXyq5mVIRH
X-Received: by 2002:a05:6402:3193:: with SMTP id di19mr7667262edb.211.1601723382908;
        Sat, 03 Oct 2020 04:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4Wc859KwFUvaFE+QqNfGdGACpV1dTegHWbK4FhGxUELngp++8uoXgF9MNPk0hRKD5650/yw==
X-Received: by 2002:a05:6402:3193:: with SMTP id di19mr7667241edb.211.1601723382619;
        Sat, 03 Oct 2020 04:09:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id j10sm4068287edy.97.2020.10.03.04.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 04:09:41 -0700 (PDT)
Subject: Re: How to set USB_PORT_QUIRK_OLD_SCHEME on an usb-port ?
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <2f2dd720-3ab4-ba0a-16bf-8b899aafa26d@redhat.com>
 <20200906022229.GA729107@rowland.harvard.edu>
 <28948e6c-b67b-5b5c-daeb-070a1dadf9c8@redhat.com>
 <20200910154109.GC849569@rowland.harvard.edu>
 <495851d0-0ae0-e01b-bbd0-7c41c7e3f620@redhat.com>
 <20200917200949.GC1099735@rowland.harvard.edu>
 <db64c49e-6e1a-c12d-7340-e88edb06c30e@redhat.com>
 <20201003075252.GB109727@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1d34b4ff-0240-1d51-a028-cb9e616a919f@redhat.com>
Date:   Sat, 3 Oct 2020 13:09:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201003075252.GB109727@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 10/3/20 9:52 AM, Greg Kroah-Hartman wrote:
> On Fri, Oct 02, 2020 at 10:10:52PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9/17/20 10:09 PM, Alan Stern wrote:
>>> On Thu, Sep 17, 2020 at 07:27:03PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/10/20 5:41 PM, Alan Stern wrote:
>>>>> On Thu, Sep 10, 2020 at 03:58:49PM +0200, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 9/6/20 4:22 AM, Alan Stern wrote:
>>>>>>> On Sat, Sep 05, 2020 at 01:37:38PM +0200, Hans de Goede wrote:
>>>>>>>> Hi All,
>>>>>>>>
>>>>>>>> I have been debugging an issue with a 2-in-1 which
>>>>>>>> consists of a tablet + a kbd-dock, where the device
>>>>>>>> turns into a clamshell when docked into the kbd-dock.
>>>>>>>>
>>>>>>>> The kbd dock is connected via pogo-pins. This works
>>>>>>>> fine when docked at boot. But there is an enumeration
>>>>>>>> issue when hot-docked (and the keyboard looses power
>>>>>>>> when the lid is closedm so this also triggers after
>>>>>>>> a suspend/resume):
>>>>>>>>
>>>>>>>> [ 3498.924190] usb 1-3: new full-speed USB device number 5 using xhci_hcd
>>>>>>>> [ 3499.041725] usb 1-3: device descriptor read/64, error -71
>>>>>>>> [ 3515.215890] usb 1-3: device descriptor read/64, error -110
>>>>>>>> [ 3515.440369] usb 1-3: new full-speed USB device number 6 using xhci_hcd
>>>>>>>> [ 3515.603544] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>>>>>>>> [ 3515.603574] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>>>>>>> [ 3515.603596] usb 1-3: Product: ITE Device(8910)
>>>>>>>> [ 3515.603614] usb 1-3: Manufacturer: ITE Tech. Inc.
>>>>>>>>
>>>>>>>> Note there is about 6 seconds before the keyboard becomes
>>>>>>>> usable, which is quite long when trying to unlock the
>>>>>>>> laptop after opening the lid.
>>>>>>>>
>>>>>>>> If I set the USB_PORT_QUIRK_OLD_SCHEME on the port used by the kbd-dock:
>>>>>>>>
>>>>>>>> echo 1 >  /sys/devices/pci0000\:00/0000\:00\:14.0/usb1/1-0\:1.0/usb1-port3/quirks
>>>>>>>>
>>>>>>>> Then this changes to:
>>>>>>>>
>>>>>>>> [ 4467.875008] usb 1-3: new full-speed USB device number 7 using xhci_hcd
>>>>>>>> [ 4467.878483] usb 1-3: Device not responding to setup address.
>>>>>>>> [ 4468.082476] usb 1-3: Device not responding to setup address.
>>>>>>>> [ 4468.289990] usb 1-3: device not accepting address 7, error -71
>>>>>>>> [ 4468.614928] usb 1-3: new full-speed USB device number 8 using xhci_hcd
>>>>>>>> [ 4468.662392] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>>>>>>>> [ 4468.662423] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>>>>>>> [ 4468.662444] usb 1-3: Product: ITE Device(8910)
>>>>>>>> [ 4468.662461] usb 1-3: Manufacturer: ITE Tech. Inc.
>>>>>>>>
>>>>>>>> Which is a lot better wrt making the keyboard available for
>>>>>>>> use in a timely manner.
>>>>>>>>
>>>>>>>> So now I'm looking into a way to automatically do this. I would
>>>>>>>> prefer to keep the handling of this out of the kernel, so I looked into
>>>>>>>> udev, but it seems that the usb_port_device_type device-s registered by
>>>>>>>> usb_hub_create_port_device() are not visible to udev?
>>>>>>>>
>>>>>>>> At least I'm not seeing them, in the output of "udevadm info -e"
>>>>>>>
>>>>>>> My impression is that fixing this would be the simplest approach.
>>>>>>
>>>>>> I agree that first trying to fix it is a good idea.
>>>>
>>>> <snip>
>>>>
>>>>>>> Have you tried decreasing the initial_descriptor_timeout module
>>>>>>> parameter for usbcore?  That would probably help, but it's kind of a
>>>>>>> sledgehammer.
>>>>>>
>>>>>> So I tried this:
>>>>>>
>>>>>> [root@localhost ~]# cat /sys/module/usbcore/parameters/initial_descriptor_timeout
>>>>>> 1000
>>>>>>
>>>>>> But it does not really seem to help:
>>>>>>
>>>>>> [ 1171.435346] usb 1-3: USB disconnect, device number 2
>>>>>> [ 1180.430958] usb 1-3: new full-speed USB device number 3 using xhci_hcd
>>>>>> [ 1180.551543] usb 1-3: device descriptor read/64, error -71
>>>>>> [ 1184.045548] usb 1-3: device descriptor read/64, error -110
>>>>>> [ 1184.270924] usb 1-3: new full-speed USB device number 4 using xhci_hcd
>>>>>> [ 1184.438336] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>>>>>> [ 1184.438371] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>>>>> [ 1184.438399] usb 1-3: Product: ITE Device(8910)
>>>>>> [ 1184.438425] usb 1-3: Manufacturer: ITE Tech. Inc.
>>>>>
>>>>> That part of hub.c is a real mess.  Coincidentally, I just posted a
>>>>> patch to try and fix it up a bit:
>>>>>
>>>>> 	https://marc.info/?l=linux-usb&m=159959185227447&w=2
>>>>
>>>> Ok, I've applied the patch and tried again (with initial_descriptor_timeout still set to 1000),
>>>> so now the log from the reconnect looks look this:
>>>>
>>>> [ 1157.248439] usb 1-3: new full-speed USB device number 3 using xhci_hcd
>>>> [ 1157.254234] usb 1-3: device descriptor read/64, error -71
>>>> [ 1157.371442] usb 1-3: new full-speed USB device number 4 using xhci_hcd
>>>> [ 1158.377895] usb 1-3: device descriptor read/64, error -110
>>>> [ 1158.379646] usb usb1-port3: attempt power cycle
>>>> [ 1159.014480] usb 1-3: new full-speed USB device number 5 using xhci_hcd
>>>> [ 1159.176112] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>>>> [ 1159.176138] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>>> [ 1159.176156] usb 1-3: Product: ITE Device(8910)
>>>> [ 1159.176172] usb 1-3: Manufacturer: ITE Tech. Inc.
>>>>
>>>> Still a bit slower then the old probe method, but much better then the
>>>> new probe method with the default initial_descriptor_timeout.
>>>
>>> Yeah, okay, it's good to see that the patch helps.  But I'm doubtful
>>> that the change it makes will become part of the standard (i.e., not
>>> for embedded systems) kernel.
>>>
>>> I still think the udev approach will be best.  That will require adding
>>> various *_uevent_* calls in usb_hub_create_port_device, and adding a
>>> .uevent member to usb_port_device_type.
>>
>> So I tried this and it does not work, the problem is that
>> dev_uevent_filter() from drivers/base/core.c
>> filters out uevents for anything which is not either a device
>> on a bus or a class device:
>>
>> static int dev_uevent_filter(struct kset *kset, struct kobject *kobj)
>> {
>>          struct kobj_type *ktype = get_ktype(kobj);
>>
>>          if (ktype == &device_ktype) {
>>                  struct device *dev = kobj_to_dev(kobj);
>>                  if (dev->bus)
>>                          return 1;
>>                  if (dev->class)
>>                          return 1;
>>          }
>>          return 0;
>> }
>>
>> (as mentioned this is a low priority thing for me, so hence
>>   the long time between replies)
> 
> I'm kind of lost in this thread, but what part of the USB device tree in
> sysfs is getting "caught" by this filter and does not belong to a bus or
> class?  We can always fix that up if needed.

So usb_ports, can have per port quirks, e.g.:

/sys/bus/usb/devices/1-0\:1.0/usb1-port1/quirks

On a device I have I would like to set such a quirk from a
udev rule (see below for why), but the filter causes no
udev events to be generated for the port.  So in essence it
is not possible to actually use the per-port-quirks in
a sensible (e.g. through udev hwdb) manner. I can put
something in rc.local for this, but I was looking for an
upstreamable solution.

So I guess that maybe we should consider generating (not filtering)
udev events for usb-port devices. The code to do this could be
as simple as a flag in the device struct which the filter checks.

But this will cause a whole bunch of extra udev events on all
machines for something which is somewhat of a corner case...
Which brings me to why I was looking into this:

One of these quirks is to use the old-probe-scheme instead of the
new one.  On a 2-in-1 with a detachable USB keyboard (*) I noticed
that probing the kbd with the new probe scheme takes 7 seconds,
where as the old scheme does it in 1.5.

Since the usb-port gets turned off when suspending by closing the
LID, the 7s probe is pretty annoying, since you need to wait a
long time before you can type your password to unlock after the
suspend.  And I've also had several times where I attached the
kbd more then once, simply because I ran out of patience and
thought the connection (pogo pins) was not aligned properly.

> This is the second time this week I have seen this happen in different
> subsystems where people wanted to do things in userspace for devices
> that were caught by this.  Odd coincidence :)

Odd coincidence indeed.

Regards,

Hans


*) An Acer One 10 S1003

