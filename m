Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62D54239D1
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 10:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237694AbhJFIew (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 04:34:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237551AbhJFIew (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Oct 2021 04:34:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B7DF610FB;
        Wed,  6 Oct 2021 08:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633509180;
        bh=At48FTFicQnKeJmHtzyyKpGrdBYohygMpiapQ823+lM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X6DhU+Z45sVaW+n0vGVGo1i7Rlh2907epzFQ2MeVi9R+HwrhJHNthiw96daNYE1Yq
         qQz1q/GvyKZ2H+v/wme7eUktmtPIb33mIVocOs0k2JxOo/IpEIUbWtABw+y+kiPzej
         KAl4ubsEe+KOUuXztjlXYMoTuckwbA/Nwe+HX/3l7lzpishNgGvleMwHfEegoaDcJH
         5RLuAaCVkGdw/HwvknZ8Qtni/TcDgHBd+HWQ0Ia9gbOYWFrnXeVcxCZRj6eqpndi1f
         2JdXLBKk0Tq8zOnhyCD5xTJV9SYhiar5Mf8P3wdsiHtksoiATGxg5JrS7ib+Thq3r7
         zzVKXvNWx7WGA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mY2MG-0005SK-Eo; Wed, 06 Oct 2021 10:33:01 +0200
Date:   Wed, 6 Oct 2021 10:33:00 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Adrian Knagg-Baugh <aje.baugh@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303 unknown device type bug report
Message-ID: <YV1fPO3cQW0U2i6F@hovoldconsulting.com>
References: <CADyrKj--r7mdyE39z5-Q-5RjBNu1Zvh_5qf4j69SRt01aJSJFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADyrKj--r7mdyE39z5-Q-5RjBNu1Zvh_5qf4j69SRt01aJSJFg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 05, 2021 at 05:28:24PM +0100, Adrian Knagg-Baugh wrote:
> Hi,
> As requested in dmesg I'm reporting an unknown device type for the
> pl2303 driver. Here's the extract from dmesg:
> 
> [ 2824.450073] usb 1-2: new full-speed USB device number 5 using xhci_hcd
> [ 2824.621910] usb 1-2: New USB device found, idVendor=067b,
> idProduct=23d3, bcdDevice= 4.05
> [ 2824.621922] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [ 2824.621926] usb 1-2: Product: USB-Serial Controller
> [ 2824.621928] usb 1-2: Manufacturer: Prolific Technology Inc.
> [ 2824.621931] usb 1-2: SerialNumber: EKCRb19B616
> [ 2824.630068] pl2303 1-2:1.0: pl2303 converter detected
> [ 2824.630084] pl2303 1-2:1.0: unknown device type, please report to
> linux-usb@vger.kernel.org
> 
> adrian@mononoke:~$ uname -a
> Linux mononoke 5.13.0-16-generic #16-Ubuntu SMP Fri Sep 3 14:53:27 UTC
> 2021 x86_64 x86_64 x86_64 GNU/Linux
> 
> The pl2303 is in a Skywatcher telescope synscan handset, the behaviour
> is a regression since it was working fine in the 5.11 kernels packaged
> with Ubuntu 21.04, it's only since updating to 5.13 (which I've had to
> do to resolve issues with the graphics card in my new laptop) that
> I've seen the problem.
> 
> See below for the output of sudo lsusb -v
> 
> I hope this helps.

Thanks for the report. This should already have been fixed by commit
dcf097e7d21f ("USB: serial: pl2303: fix GL type detection") which was
backported to v5.13.15 (released about a month ago).

Do you know what type of pl2303 you have in your device by any chance?
The author of the above patch had a PL2303GL but it would be useful to
know if there are other types using the same bcdDevice.

Johan

> Bus 003 Device 003: ID 067b:23d3 Prolific Technology, Inc. USB-Serial Controller
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0        64
>   idVendor           0x067b Prolific Technology, Inc.
>   idProduct          0x23d3
>   bcdDevice            4.05
>   iManufacturer           1 Prolific Technology Inc.
>   iProduct                2 USB-Serial Controller
>   iSerial                 3 EKCRb19B616
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0027
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0xa0
>       (Bus Powered)
>       Remote Wakeup
>     MaxPower              100mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x000a  1x 10 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
> Device Status:     0x0000
>   (Bus Powered)
