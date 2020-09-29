Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D65F27BC92
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 07:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgI2FyN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 01:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI2FyN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 01:54:13 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026F8C061755
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 22:54:11 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id y13so3592234iow.4
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 22:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e6but8RkMpZ2ay5Js7fg30daL8lLCRE+bPr6PDQwWb4=;
        b=vGwbJIMgwCiyzR6rYEK5wxij+u932sKCK3vcJbb5rBJDL8/sPJVVyXWwEfKkVWypWY
         CafTl5UellAvBIDZSUeyAEK2MtNg5CUvrRnuZoizZbcLIGx3iaU17pSrZQt8Qz83xTOq
         7i98n0SfqhFx7rn2tRNHEb8USFPvyYtkZf5qvz/uVhFlYIknL+U9sXNQe9F5gbhxc+6I
         tyDFUzvc4XxFeCmg9P9dVfSa9VgPWVeSpFArMc9RC9uYt9SJobITIFy9BD+mqzJgeWC/
         UodeKrK29W/3uylcBhcBuzNXEo1+kiHLPFx5xEhKmnQWFU2ypDQXbBKSwSel2ONtiJ/Q
         MvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e6but8RkMpZ2ay5Js7fg30daL8lLCRE+bPr6PDQwWb4=;
        b=jY18Y1Lx5T/Cvxzk0rCl4PGGVZYbeXR+r/VIsz9gRYCzAWrrqAUIxTzbBOLFU7rp5t
         H0PapInaCLzDbaQyIW4IH3dJxtDh1U34oOcE6VuJ7f8v3tBy45a4PQCUq69Cav1Pgfx1
         IXUUA+T2LrmQW4+3uOSVkC8BKWCMetQ3CT0DtYCu7pkmow7BSXNAkr4o9ru4uh+vwMUw
         iGVqhiw5pgs1tniYNisG73vBy4ghhGrnORZrd1PSWI8qO09vDcINeufX63RybNaC5/oM
         wgs1IjX9i8uLWkADqlncT7Cwmafe8+GtMVLUp/WMW8LfXxTHSZ+WSWGM860XKXKoDJaI
         +xGw==
X-Gm-Message-State: AOAM533KcswBKZQEByJxIxQ8vakjR96hCj0/EuN0uBoIabpmKlyZlYBv
        gem8TTqWAZBvSIILzAtPJGRhhspE9IxJ/eoIUihRbqBjJwPUww==
X-Google-Smtp-Source: ABdhPJwwN5a3pMaamss2W0fCl0xWz7Jo7m/hsAkJVW6x4OJLOSnRbuSOGgH2gFsgHyeX5SxXu9InDgcrnbhFSPBXLiA=
X-Received: by 2002:a05:6602:2003:: with SMTP id y3mr1282125iod.203.1601358850816;
 Mon, 28 Sep 2020 22:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200825055505.765782-1-lorenzo@google.com> <20200825055505.765782-2-lorenzo@google.com>
 <6e4fe5a7-5088-4b31-9477-9cdb2ad83f9d@www.fastmail.com> <CAKD1Yr0+z1+Mr70_kPyc2p+pPHEUwwVtHhtQ7kTaLe8w4PSMCg@mail.gmail.com>
In-Reply-To: <CAKD1Yr0+z1+Mr70_kPyc2p+pPHEUwwVtHhtQ7kTaLe8w4PSMCg@mail.gmail.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date:   Mon, 28 Sep 2020 22:53:59 -0700
Message-ID: <CANP3RGfB0g_kMK_yVLD52-VtBG0buk6PNbKoe7O14Tk-9zsu3g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed
 and above.
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     Sid Spry <sid@aeam.us>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 28, 2020 at 9:30 PM Lorenzo Colitti <lorenzo@google.com> wrote:
> On Tue, Sep 29, 2020 at 11:52 AM Sid Spry <sid@aeam.us> wrote:
> > I apologize for hijacking your patch message, but on what hardware
> > are you testing? I've been trying to find USB3 device-mode-capable
> > hardware for ages.
>
> I'm using a rooted Pixel phone. Not great as a development platform though.
>
> I think my colleague Maciej (CCd) has a better option involving a
> developer board.

I spent some time trying to figure out how to test gadget stuff on x86
with recent kernels.
This is so that I don't have to futz about with all sorts of out of
tree patches and crazy arm dev boards that usually don't just work
with vanilla kernels.
I also wanted to use x86 because I understand the x86 memory
model/assembly/etc a lot better, and can directly compare against
'standard' server grade nics (like the Ethernet controller [0200]:
Intel Corporation Ethernet Controller 10G X550T [8086:1563]) and
various other 1/2.5/5gbps ethernet dongles.

This is all still very much a work in progress...

I found two kind-of solutions:

(a) USB3.1 10gbps

https://www.datapro.net/products/usb-3-0-super-speed-a-a-debugging-cable.html

Notes:
- this cost 14.95$ + 9.50$ S&H = 24.45$ (to the bay area)
- my understanding is the debug cable does not include the USB2 data
connection that a normal USB3 cable would have
- this allows connecting two USB3 A ports to each other (or I guess
USB-C ports with C2A adapters).
  (Maybe a C-C cable or C-A cable would also work, not sure? I don't
remember what I already tried...)
- AFAIK the longer cables won't maintain 10gbps speeds, the shortest
<1m one should be able to on a good day

This is not a real 'gadget' solution... but could probably be made
into one with 'just' some kernel code (any takers?).
It probably should be sufficient to enable some sort of decent
networking over it.

Here's how it works:

# lspci -nn | egrep -i USB
00:14.0 USB controller [0c03]: Intel Corporation Cannon Lake PCH USB
3.1 xHCI Host Controller [8086:a36d] (rev 10)

# cat /sys/bus/pci/devices/0000:00:14.0/dbc
disabled

# echo enable > /sys/bus/pci/devices/0000:00:14.0/dbc

# cat /sys/bus/pci/devices/0000:00:14.0/dbc
configured
(due to previously plugged in cable it immediately moves to
'configured' instead of 'enabled')

Related dmesg:
...(lots of spewing about bad cable prior to dbc enablement)...
[765163.777035] usb usb2-port4: Cannot enable. Maybe the USB cable is bad?
[765163.777094] usb usb2-port3: config error
[765167.833012] usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
[765167.833063] usb usb2-port4: config error
[765167.941988] xhci_hcd 0000:00:14.0: DbC connected   (this is where
the above echo happened)
[765168.561094] usb usb2-port3: config error
[765168.783042] usb 2-3: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
[765168.795266] usb 2-3: LPM exit latency is zeroed, disabling LPM.
[765168.795506] usb 2-3: New USB device found, idVendor=1d6b,
idProduct=0010, bcdDevice= 0.10
[765168.795515] usb 2-3: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[765168.795522] usb 2-3: Product: Linux USB Debug Target
[765168.795527] usb 2-3: Manufacturer: Linux Foundation
[765168.795532] usb 2-3: SerialNumber: 0001
[765168.797997] xhci_hcd 0000:00:14.0: DbC configured
[765168.798300] xhci_hcd 0000:00:14.0: DbC now attached to /dev/ttyDBC0
[765168.804804] usbcore: registered new interface driver usb_debug
[765168.804810] usbserial: USB Serial support registered for debug
[765168.804814] usbserial: USB Serial support registered for xhci_dbc
[765168.804823] usb_debug 2-3:1.0: xhci_dbc converter detected
[765168.804877] usb 2-3: xhci_dbc converter now attached to ttyUSB0
(I think what would normally be 2-4 ended up being the 'device' side
and 2-3 the 'host' side, but both ports are on the same pci device
which makes this more confusing)

echo hi > /dev/ttyDBC0; cat /dev/ttyUSB0
hi

# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 10000M
    |__ Port 3: Dev 3, If 0, Class=Diagnostic, Driver=usb_debug, 5000M

(so it connected at 5gbps, I think I've seen it connect at 10gbps as
well, though using a pair of computers instead of loopback on one...)

There's some docs at Documentation/driver-api/usb/usb3-debug-port.rst,
and it looks like it might be possible to adjust this to be a more
generic usb3-only gadget...

drivers/usb/host/xhci-dbgcap.c - seems to have a lot of the
configuration hardcoded, but in ways that make it seem like it might
be possible to use it in a more generic fashion...

(b) USB3.0 5gbps

http://www.hwtools.net/Adapter/USB3380EVB.html  (not the RC 'root
complex' version)
http://www.bplus.com.tw/Adapter/USB3380EVB.html  [156$ + 45$ S&H to
bay area = 201$ USD total via paypal]

This is a gadget capable usb3 capable chipset in a x86 compatible form
factor with linux gadget drivers (USB_NET2280 Kconfig option).
It shows up as:
02:00.0 USB controller [0c03]: PLX Technology, Inc. Device [10b5:3380] (rev ab)

They don't appear to have any of the nice pcie adapters that expose
the port available (in stock) any more.

The following:
  https://www.startech.com/en-us/cards-adapters/pex2mpex
works, but you end up with a port inside your case...

I didn't have a free pcie slot on my motherboard, so I ended up going
via an on-the-motherboard SSD slot.
You need to have an NGFF(M.2) socket with the key in the 'M' position,
so it can serve as a mPCIe x4 slot.

Then a https://www.amazon.com/gp/product/B08D3N2284/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1
converter works.
(presumably https://www.amazon.com/gp/product/B07BWQTQG2/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1
+ the above pex2mpex adapter would also work, but why bother...)

With this approach I'm seeing pci errors:

[768796.304490] pcieport 0000:00:1b.0: AER: Corrected error received:
0000:00:1b.0
[768796.304495] pcieport 0000:00:1b.0: AER: PCIe Bus Error:
severity=Corrected, type=Data Link Layer, (Transmitter ID)
[768796.304496] pcieport 0000:00:1b.0: AER:   device [8086:a340] error
status/mask=00001000/00002000
[768796.304497] pcieport 0000:00:1b.0: AER:    [12] Timeout

but I do get:

[768797.724834] usb 2-7: new SuperSpeed Gen 1 USB device number 8 using xhci_hcd

--

Not sure how much help this will be.  I'm still poking at it, this is
a relatively fresh setup, I'm trying to run both device and host sides
as Fedora VMs (on a Fedora host) with KVM & VFIO and running into all
sorts of unrelated problems (like VM kernel not finding rootfs and
panicking).
