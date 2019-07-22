Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3106FC6E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 11:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbfGVJoS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 05:44:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38185 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbfGVJoR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jul 2019 05:44:17 -0400
Received: from mail-pg1-f200.google.com ([209.85.215.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hpUre-0007e2-Ch
        for linux-usb@vger.kernel.org; Mon, 22 Jul 2019 09:44:14 +0000
Received: by mail-pg1-f200.google.com with SMTP id p29so15097566pgm.10
        for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2019 02:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=T+CGFXP/ZTkPSuuKplrt+BimTSZT5d2EvBWr5Dwk8x4=;
        b=iOJ3SyyBIK4kQsGAUFA5Oh3W3+sPqGc9QhLhDjACirlStaGNoRlskEV965q2bfwq+8
         w8qZ8u+AcCDsDzN7AlEzfLtmE+W4gZ5qSZSuAykuTZa4Mnr7YAwLuyFugJ+8HOakx39S
         SLFiRGv/39NN5oWhAz46VkQsLEqTYjdQZaGGG6ICIeaaiGuwZi5DIPGcWOCeejyMTB28
         aZ5/IKGlUyGRc2EcjLaUDLl3rVVn4o3gfQf8TsdLF9C1XUJok1iBn9qspzVganZAf+gD
         gLK0ciBl8XbFnB8QRp8dG3SZBN9xIv6MJqAmIfwASdX1otqK6+l3vEw+7fuopjf4VJoD
         xYKQ==
X-Gm-Message-State: APjAAAWkkkTLFtGSi5haVbGhHxkdmighmIuKrV8YTnCBW0Xe7BzY05iK
        a1FK/SbBwnWlwWf2F9IjnpV9w3IjEWEFjTgh5peOLcyuaaovnIjtWUCbBn2b8rpoQFTliBMHKLW
        aPSyuFivN44VhjHaQ8Ef2l2BlwHyTDHGkdEK+XQ==
X-Received: by 2002:a17:902:6a85:: with SMTP id n5mr69442589plk.73.1563788653094;
        Mon, 22 Jul 2019 02:44:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8atjxygD9Z7zS/ir9XN5E7ZaqOBDCRcYgCxfsVIs+5JAPFZuiswiENCHJuX+Hlf1oEnRQZg==
X-Received: by 2002:a17:902:6a85:: with SMTP id n5mr69442545plk.73.1563788652761;
        Mon, 22 Jul 2019 02:44:12 -0700 (PDT)
Received: from 2001-b011-380f-3c20-e8e0-1150-3bec-1563.dynamic-ip6.hinet.net (2001-b011-380f-3c20-e8e0-1150-3bec-1563.dynamic-ip6.hinet.net. [2001:b011:380f:3c20:e8e0:1150:3bec:1563])
        by smtp.gmail.com with ESMTPSA id i124sm71547785pfe.61.2019.07.22.02.44.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 02:44:12 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Titan Ridge xHCI may stop to working after re-plugging the dock
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <87blxqs3fh.fsf@linux.intel.com>
Date:   Mon, 22 Jul 2019 17:44:09 +0800
Cc:     Oliver Neukum <oneukum@suse.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Lin <kent.lin@canonical.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: 8bit
Message-Id: <749516DB-65B6-4D59-8C77-7883649D1F25@canonical.com>
References: <993E78A1-2A60-46D8-AA51-F4CB077E48D1@canonical.com>
 <1562759399.5312.6.camel@suse.com> <87pnm6sd10.fsf@linux.intel.com>
 <77580193-D67B-48B1-8528-03ED4E7E8D64@canonical.com>
 <87blxqs3fh.fsf@linux.intel.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

at 18:51, Felipe Balbi <felipe.balbi@linux.intel.com> wrote:

>
> Hi,
>
> Kai Heng Feng <kai.heng.feng@canonical.com> writes:
>>> Oliver Neukum <oneukum@suse.com> writes:
>>>> Am Dienstag, den 09.07.2019, 21:10 +0800 schrieb Kai-Heng Feng:
>>>>> Hi Mika and Mathias,
>>>>>
>>>>> I’ve filed a bug [1] which renders docking station unusable.
>>>>>
>>>>> I am not sure it's a bug in PCI, Thunderbolt or xHCI so raise the issue
>>>>> to
>>>>> you both.
>>>>>
>>>>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=203885
>>>>>
>>>>> Kai-Heng
>>>>
>>>> The issue starts before you unplug. In fact it starts before
>>>> the dock is even detected the first time:
>>>>
>>>> [   13.171167] rfkill: input handler disabled
>>>> [   19.781905] pcieport 0000:00:1c.0: PME: Spurious native interrupt!
>>>> [   19.781909] pcieport 0000:00:1c.0: PME: Spurious native interrupt!
>>>> [   20.109251] usb 4-1: new SuperSpeedPlus Gen 2 USB device number 2
>>>> using xhci_hcd
>>>> [   20.136000] usb 4-1: New USB device found, idVendor=0bda,
>>>> idProduct=0487, bcdDevice= 1.47
>>>> [   20.136004] usb 4-1: New USB device strings: Mfr=1, Product=2,
>>>> SerialNumber=0
>>>> [   20.136007] usb 4-1: Product: Dell dock
>>>> [   20.136009] usb 4-1: Manufacturer: Dell Inc.
>>>> [   20.140607] hub 4-1:1.0: USB hub found
>>>> [   20.141004] hub 4-1:1.0: 4 ports detected
>>>> [   20.253025] usb 1-4: new high-speed USB device number 5 using  
>>>> xhci_hcd
>>>> [   20.403520] usb 1-4: New USB device found, idVendor=0bda,
>>>> idProduct=5487, bcdDevice= 1.47
>>>> [   20.403521] usb 1-4: New USB device strings: Mfr=1, Product=2,
>>>> SerialNumber=0
>>>> [   20.403522] usb 1-4: Product: Dell dock
>>>> [   20.403522] usb 1-4: Manufacturer: Dell Inc.
>>>> [   20.404348] hub 1-4:1.0: USB hub found
>>>>
>>>> This looks like a PCI issue.
>>>> In general, this kind of reporting sucks. We have to guess what you did
>>>> at 19.781905
>>>
>>> It might be nice to know which device is generating that and why it's
>>> not found. This may help:
>>>
>>> diff --git a/drivers/pci/pcie/pme.c b/drivers/pci/pcie/pme.c
>>> index f38e6c19dd50..33285ef29362 100644
>>> --- a/drivers/pci/pcie/pme.c
>>> +++ b/drivers/pci/pcie/pme.c
>>> @@ -203,7 +203,7 @@ static void pcie_pme_handle_request(struct pci_dev
>>> *port, u16 req_id)
>>>
>>>   out:
>>>  	if (!found)
>>> -		pci_info(port, "Spurious native interrupt!\n");
>>> +		pci_info(port, "Spurious native interrupt! (Bus# %d DevFn
>>> %d)\n", busnr, devfn);
>>>  }
>>>
>>>  /**
>>>
>>>
>>> Also, according to what Kai-Heng said, xHCI stops working even after
>>> repluggin the Dock. We could be dealing with two bugs here:
>>>
>>> 1. Spurious PME event being generated by an unexistent device
>>> 2. xHCI not handling hot-plug very well
>>>
>>> Kai-Heng,
>>>
>>> please run your tests again and make note of when you unplugged the dock
>>> and when you replugged it so we can correlate the time stampts with what
>>> you have done otherwise we will never be able to pin-point what's going
>>> on.
>>
>> I upgraded the system firmware, TBT firmware and docking station firmware
>> to latest, and used latest mainline kernel.
>> Now the issue can be reproduced at the very first time I plugged the
>> docking station.
>>
>> Attach dmesg to BKO since there are lots of message after XHCI dyndbg is
>> enabled.
>
> I saw that you annotated the plug, but not the unplug. Where does the
> unplug start? There are many places where it could be, but I need to be
> sure.

Request log attached to Bugzilla.

>
> Also, wasn't it so that the problem is when you *replug* the dock? So
> can you better describe what you're doing? Are you booting with dock
> connected then disconnect and reconnect or are you booting without dock
> and it fails on first plug?

The weird behavior I described in my previous replay is because the devices  
need to be fully power cycled after firmware upgrade.
So it’s false alarm.

The only issue now is the original bug.

>
> What are you consider a fail here? Can't you see the xhci bus? USB
> Devices don't show? What do you have on lsusb -t?

The 0000:39:00.0 xHCI stops working, so the USB ethernet (r8152) connects  
to it doesn’t work anymore.

Normal case:
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
         |__ Port 3: Dev 3, If 0, Class=Hub, Driver=hub/4p, 5000M
         |__ Port 4: Dev 4, If 0, Class=Vendor Specific Class, Driver=r8152, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
     |__ Port 4: Dev 2, If 0, Class=Hub, Driver=hub/5p, 480M
         |__ Port 5: Dev 6, If 0, Class=Human Interface Device, Driver=usbhid, 480M
         |__ Port 3: Dev 4, If 0, Class=Hub, Driver=hub/6p, 480M
             |__ Port 4: Dev 7, If 0, Class=Audio, Driver=snd-usb-audio, 480M
             |__ Port 4: Dev 7, If 3, Class=Audio, Driver=snd-usb-audio, 480M
             |__ Port 4: Dev 7, If 1, Class=Audio, Driver=snd-usb-audio, 480M
             |__ Port 4: Dev 7, If 2, Class=Audio, Driver=snd-usb-audio, 480M
             |__ Port 5: Dev 9, If 0, Class=Human Interface Device, Driver=usbhid, 480M
     |__ Port 9: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid, 12M
     |__ Port 10: Dev 5, If 2, Class=Chip/SmartCard, Driver=, 480M
     |__ Port 10: Dev 5, If 0, Class=Application Specific Interface, Driver=, 480M
     |__ Port 10: Dev 5, If 3, Class=Vendor Specific Class, Driver=, 480M
     |__ Port 10: Dev 5, If 1, Class=Chip/SmartCard, Driver=, 480M
     |__ Port 11: Dev 8, If 0, Class=Video, Driver=uvcvideo, 480M
     |__ Port 11: Dev 8, If 1, Class=Video, Driver=uvcvideo, 480M
     |__ Port 14: Dev 10, If 0, Class=Wireless, Driver=btusb, 12M
     |__ Port 14: Dev 10, If 1, Class=Wireless, Driver=btusb, 12M

Once the issue occurs:
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
     |__ Port 4: Dev 2, If 0, Class=Hub, Driver=hub/5p, 480M
         |__ Port 5: Dev 6, If 0, Class=Human Interface Device, Driver=usbhid, 480M
         |__ Port 3: Dev 4, If 0, Class=Hub, Driver=hub/6p, 480M
             |__ Port 4: Dev 7, If 0, Class=Audio, Driver=snd-usb-audio, 480M
             |__ Port 4: Dev 7, If 3, Class=Audio, Driver=snd-usb-audio, 480M
             |__ Port 4: Dev 7, If 1, Class=Audio, Driver=snd-usb-audio, 480M
             |__ Port 4: Dev 7, If 2, Class=Audio, Driver=snd-usb-audio, 480M
             |__ Port 5: Dev 9, If 0, Class=Human Interface Device, Driver=usbhid, 480M
     |__ Port 9: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid, 12M
     |__ Port 10: Dev 5, If 2, Class=Chip/SmartCard, Driver=, 480M
     |__ Port 10: Dev 5, If 0, Class=Application Specific Interface, Driver=, 480M
     |__ Port 10: Dev 5, If 3, Class=Vendor Specific Class, Driver=, 480M
     |__ Port 10: Dev 5, If 1, Class=Chip/SmartCard, Driver=, 480M
     |__ Port 11: Dev 8, If 0, Class=Video, Driver=uvcvideo, 480M
     |__ Port 11: Dev 8, If 1, Class=Video, Driver=uvcvideo, 480M
     |__ Port 14: Dev 10, If 0, Class=Wireless, Driver=btusb, 12M
     |__ Port 14: Dev 10, If 1, Class=Wireless, Driver=btusb, 12M

So we don’t have USB ethernet anymore.

Kai-Heng

>
> Best regards
>
> -- 
> balbi


