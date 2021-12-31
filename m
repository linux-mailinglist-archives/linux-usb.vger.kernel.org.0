Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A65148220D
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 05:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242702AbhLaEwt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 23:52:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237595AbhLaEwt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Dec 2021 23:52:49 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DE2C061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 20:52:49 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id x10so38153876oix.6
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 20:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=zdFfgl4bfGXdDlY5mJ6nRAz6XcG501IxlOjVRTmGFjY=;
        b=PPwJCTFhgYysFQuPVON4VEzEjyFtkLDojGTvCWroOVZiSwR4s4AS/MWKmOVeoyQcCI
         NtJapW77xP95BADO8QZQ3yd+NQ1ZTln+ohY+zB/gZk2/dzZdfvUrnl0nNLcrQRCsUOGQ
         OLtioQVRtlL1FoOhuy26zgqxApyfWUh1wjkuMbIoPmUFWi7N/9xE2CA092sUyh21W+Mk
         +U64KujAR7S+TZRqUb6IaLpGiK9hdI3dtw8bG6WU7t1Phft0uabO6928H2uw4zgpExQj
         57Acu/anxtjpIbyuoN8O4TW3B1TacZsu1pWyyW7+zj1SWrbXToLYYmW0Yq0gJHGKD/NX
         315A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=zdFfgl4bfGXdDlY5mJ6nRAz6XcG501IxlOjVRTmGFjY=;
        b=cxda/HAn8TmrfayI+MTaMk2ADhQSxDiFKJ+++v868GLhUySp+TGq9K3wFk3Orczk+Q
         3AksAKFqfp3x3NUu9wuRz8k5eO7tZ0FVJdWe6CJ/d4OfwsxhYQyzCcoaLhAs6OLdKEYE
         k4TbzDxoeS8+/pTWKucliaTaJ3d3aEOoYIk2EZlF3QTQz+SkAA1JbAGTRKfXZdE/wb7D
         3y4WrW07iZALZvsrppW7/09A72AxOtPUOXpN4pRcqVtKQ+mMe1wuQWN9CCdRGVlhKSOJ
         ANFCHDGKbQkgUISUreKUehxnUGemMX67NkmK88h3Mhi8R0HovOyBk1A3Yv56Mz48RZJk
         3MGg==
X-Gm-Message-State: AOAM532kVP06IWeTixPFO/3E6pHQ3Ez6/2st3lCTar+DRyT6Vl5I224M
        UvkDyTsr1M1ctjlS5hzeW+5ARBX21ER2USsn7SA=
X-Google-Smtp-Source: ABdhPJwLLbdYY7yjzOYNga/rlzzYgsPc1/u70yXkFk66kmzeFWycSF6iNYOKGYL5pJBV5mL/zGGqmdSS4ZIYWKP85Xk=
X-Received: by 2002:aca:3015:: with SMTP id w21mr26161281oiw.50.1640926368585;
 Thu, 30 Dec 2021 20:52:48 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4007:0:0:0:0:0 with HTTP; Thu, 30 Dec 2021 20:52:48
 -0800 (PST)
In-Reply-To: <1d63d954-13fb-f9c6-b2e7-d350ace2aa5a@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com>
 <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com> <CAOzgRdb+Ru8AL=wUquysbqd8uGkNSDzSNfOSW3Fs2Pd6BGxo1w@mail.gmail.com>
 <1d63d954-13fb-f9c6-b2e7-d350ace2aa5a@synopsys.com>
From:   youling 257 <youling257@gmail.com>
Date:   Fri, 31 Dec 2021 12:52:48 +0800
Message-ID: <CAOzgRdbgepUHKCmg8wR0s0bvYyuWNachi_EP6c9n_mRvQkXmGw@mail.gmail.com>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "william.allentx@gmail.com" <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

2021-12-31 11:46 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
> Hi,
>
> youling 257 wrote:
>> test this patch, cat /sys/bus/usb/devices/4-1/speed, 10000
>> [   74.694284] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number
>> 2 using xhci_hcd
>> [   74.750329] usb-storage 4-1:1.0: USB Mass Storage device detected
>>
>> but speed, pcie to usb3.2 gen2x2, WRITE: bw=642MiB/s (673MB/s),
>> 642MiB/s-642MiB/s (673MB/s-673MB/s), io=1000MiB (1049MB),
>> run=1557-1557msec
>> READ: bw=467MiB/s (490MB/s), 467MiB/s-467MiB/s (490MB/s-490MB/s),
>> io=1000MiB (1049MB), run=2140-2140msec
>>
>> the mainboard usb3.2 gen2x1, WRITE: bw=838MiB/s (878MB/s),
>> 838MiB/s-838MiB/s (878MB/s-878MB/s), io=1000MiB (1049MB),
>> run=1194-1194msec
>> READ: bw=753MiB/s (790MB/s), 753MiB/s-753MiB/s (790MB/s-790MB/s),
>> io=1000MiB (1049MB), run=1328-1328msec
>>
>
> Let's avoid top-post.
>
> Some comments:
> 1) Just because the host is capable of gen2x2, it doesn't mean it will
> run at gen2x2 speed. Your device can only operate up to gen2x1 speed, so
> that's the limit. The test speed for gen2x1 above is not unreasonable.
my device can only operate up to gen2x1 10gbps speed on window, only
5gbps on linux kernel 5.16rc7.
> 2) You're comparing 2 different controllers performance. The "mainboard"
> performs better for the specific setup and specific test that you use.
> (I'm assuming that the only difference in your test setup is the host
> controller and rest is the same).
>
> 3) Find a gen2x2 capable device to test ASmedia gen2x2 speed if that's
> what you're checking for.
>
> BR,
> Thinh
>
>> 2021-12-31 9:39 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
>>> Hi,
>>>
>>> youling 257 wrote:
>>>> 2021-12-30 21:30 GMT+08:00, Greg KH <gregkh@linuxfoundation.org>:
>>>>> On Thu, Dec 30, 2021 at 09:10:14PM +0800, youling257 wrote:
>>>>>> where i can find the series patch?
>>>>>> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-usb/list/?series=427561__;!!A4F2R9G_pg!M_zXKjO1JtIkz57qZ7BEEL7zjx2QXQTfau26hBNLX7bKEL_vOP-m8Xn1eZ14VRpY-0Ga$
>>>>>>
>>>>>
>>>>> There is nothing at that link.
>>>>>
>>>>> What is the lore.kernel.org link for the patch you are curious about?
>>>>>
>>>>>> when i used maiwo k1690(10gbps) connect to ASM3242 Controller, only
>>>>>> 500MB/s.
>>>>>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb3/speed, 480
>>>>>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/speed,
>>>>>> 20000
>>>>>> maiwo k1690 is on
>>>>>> /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1.
>>>>>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1/speed,
>>>>>> 5000
>>>>>>
>>>>>>
>>>>>> 01:00.0 USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host
>>>>>> Controller (prog-if 30 [XHCI])
>>>>>>         Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host
>>>>>> Controller
>>>>>>
>>>>>> [    0.359281] xhci_hcd 0000:01:00.0: xHCI Host Controller
>>>>>> [    0.359283] xhci_hcd 0000:01:00.0: new USB bus registered,
>>>>>> assigned
>>>>>> bus
>>>>>> number 2
>>>>>> [    0.359285] xhci_hcd 0000:01:00.0: Host supports USB 3.2 Enhanced
>>>>>> SuperSpeed
>>>>>>
>>>>>> [ 1191.734123] usb 4-1: new SuperSpeed USB device number 2 using
>>>>>> xhci_hcd
>>>>>> [ 1191.794767] usb-storage 4-1:1.0: USB Mass Storage device detected
>>>>>> [ 1191.795049] scsi host9: usb-storage 4-1:1.0
>>>>>> [ 1051.051274] scsi 9:0:0:0: Direct-Access     Realtek  USB 3.2
>>>>>> Device
>>>>>> 1.00 PQ: 0 ANSI: 6
>>>>>> [ 1051.051442] sd 9:0:0:0: Attached scsi generic sg0 type 0
>>>>>> [ 1051.054461] sd 9:0:0:0: [sda] 500118192 512-byte logical blocks:
>>>>>> (256
>>>>>> GB/238 GiB)
>>>>>> [ 1051.055068] sd 9:0:0:0: [sda] Write Protect is off
>>>>>> [ 1051.055073] sd 9:0:0:0: [sda] Mode Sense: 37 00 00 08
>>>>>> [ 1051.055716] sd 9:0:0:0: [sda] Write cache: disabled, read cache:
>>>>>> enabled, doesn't support DPO or FUA
>>>>>> [ 1051.072131]  sda: sda1 sda2
>>>>>>
>>>>>> i don't have NVMe to USB 2x2 Enclosure (ASM2364 chipset), i have NVMe
>>>>>> to
>>>>>> USB 2x1 Enclosure (RTL9120B chipset), maiwo k1690, using it on
>>>>>> PciExpress
>>>>>> X4 add in card (ASM3242 chipset), it only 5Gbps speed, should be
>>>>>> 10Gbps.
>>>>>>
>>>>>
>>>>> Are you sure that your hardware can really support this?  Do you have
>>>>> the right cable and the device will support this speed?
>>>> 02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 400 Series
>>>> Chipset USB 3.1 XHCI Controller (rev 01) (prog-if 30 [XHCI])
>>>>         Subsystem: ASMedia Technology Inc. 400 Series Chipset USB 3.1
>>>> XHCI Controller
>>>>
>>>> maiwo k1690 connect to mainboard usb3.2 gen2x1 port can 10gbps.
>>>> [ 1049.965556] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number
>>>> 2 using xhci_hcd
>>>> [ 1050.028280] usb-storage 2-2:1.0: USB Mass Storage device detected
>>>> [ 1050.028560] scsi host9: usb-storage 2-2:1.0
>>>>
>>>> pcie to usb3.2 gen2x2 asm3242 should be compatible usb3.2 gen2x1.
>>>> I don't have windows os to test them, may be 5gbps on windows yet.
>>>> Is there a way to hack them to 10Gbps on linux?
>>>>
>>>>> And most important, what kernel version are you using?
>>>> kernel 5.16 rc7.
>>>>> thanks,
>>>>>
>>>>> greg k-h
>>>>>
>>>
>>> The ASmedia host controller incorrectly reports the speed ID in the
>>> port-status mismatching with its PSI capability for SSP devices. As
>>> a result, the host/hub driver will report the wrong speed.
>>>
>>> To resolve/workaround this, the xHCI driver can capture the device speed
>>> from sublink speed notification of a SSP device. All SSP devices must
>>> send sublink speed device notification, so this method should resolve
>>> your issue.
>>>
>
