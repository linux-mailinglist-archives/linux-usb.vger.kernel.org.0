Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26A1B31892
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jun 2019 02:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfFAAEV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 May 2019 20:04:21 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40813 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726610AbfFAAEV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 May 2019 20:04:21 -0400
Received: (qmail 18106 invoked by uid 500); 31 May 2019 20:04:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 31 May 2019 20:04:20 -0400
Date:   Fri, 31 May 2019 20:04:20 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Geoff Winkless <geoff@defgeoff.co.uk>
cc:     Linux-USB <linux-usb@vger.kernel.org>
Subject: Re: ehci support on old VIA vt82xxx disappeared around kernel 3.8.
In-Reply-To: <CAEzk6fe0+LHFbZgN4t8_NVS_fysj7wHFGerMB1fhoHmXsCogVw@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1905311957100.14800-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 31 May 2019, Geoff Winkless wrote:

> Hi
> 
> Apologies if this is the incorrect place to post this, if so please
> feel free to call me names and then suggest somewhere more appropriate
> :)
> 
> We have an embedded device on an old EPIA Mini-ITX board that runs
> Linux 2.6. There are features in more recent (>3.10) kernels that
> would be useful to us, so I tried to build them for it; however while
> the kernel runs perfectly fine, ehci support simply fails, which is
> catastrophic for the device's use - we need USB2 speeds.
> 
> I worked backwards and found that it runs normally on 3.7.9, but on
> 3.7.10 it starts throwing up errors:
> 
> usb 1-5: new high-speed USB device number 3 using ehci_hcd
> usb 1-5: device descriptor read/8, error -110
> usb 1-5: device descriptor read/8, error -110
> usb 1-5: new high-speed USB device number 4 using ehci_hcd
> usb 1-5: device not accepting address 4, error -110
> usb 1-5: new high-speed USB device number 5 using ehci_hcd
> 
> By 3.8.0 ehci simply doesn't work, as if someone decided these errors
> were too hard to deal with and just disabled the device support.
> 
> Chipset is VIA vt82xxx; the ID of the offending bus is 1106:3104
> 
> I tried every combination of loading ehci before and after etc,
> setting the old_scheme_first value, disabling acpi/apm, basically
> anything I could find on the web that seems related to ehci problems,
> but nothing seems to make the ehci driver even recognise the device.
> 
> /proc/bus/pci/devices shows
> 
> 0000 11063123 0  e6000008        0   0   0    0 0     0  400000
> 0 0 0  0 0     0 agpgart-via
> 0008 1106b091 0         0        0   0   0    0 0     0       0
> 0 0 0  0 0     0
> 0080 11063038 c         0        0   0   0 d001 0     0       0
> 0 0 0 20 0     0 uhci_hcd
> 0081 11063038 c         0        0   0   0 d401 0     0       0
> 0 0 0 20 0     0 uhci_hcd
> 0082 11063038 5         0        0   0   0 d801 0     0       0
> 0 0 0 20 0     0 uhci_hcd
> 0083 11063104 9  e6400000        0   0   0    0 0     0     100
> 0 0 0  0 0     0
> 0088 11063177 0         0        0   0   0    0 0     0       0
> 0 0 0  0 0     0
> 0089 11060571 0       1f0      3f6 170 376 dc01 0     0       8
> 0 8 0 10 0     0 VIA_IDE
> 008d 11063059 5      e001        0   0   0    0 0     0     100
> 0 0 0  0 0     0 snd_via82xx
> 0090 11063065 c      e801 e6401000   0   0    0 0     0     100
> 100 0 0  0 0     0 via-rhine
> 0100 11063122 c  e0000008 e4000000   0   0    0 0 c0002 4000000
> 1000000 0 0  0 0 20000
> 
> (apologies for the long lines, I cut down the spacing as much as I could).
> 
> So you can see that the 11063104 line doesn't even have the ehci-hcd
> driver associated; on earlier kernel versions the line reads
> 
> 0083 11063104 9  e6400000 0 0 0 0 0 0 100 0 0 0 0 0 0 ehci_hcd
> 
> Output from lsmod, just in case you're thinking I just haven't
> inserted the ehci driver...
> 
> usbnet 10726 0 - Live 0xcfb4f000
> ohci_hcd 15520 0 - Live 0xcfad9000
> uhci_hcd 15679 0 - Live 0xcfa94000
> ehci_hcd 30853 0 - Live 0xcfa49000
> pl2303 6016 0 - Live 0xcf979000
> ftdi_sio 25410 0 - Live 0xcf940000
> option 18882 0 - Live 0xcf8e7000
> usb_wwan 4082 1 option, Live 0xcf8a2000
> 
> I'm happy to dig for myself - I appreciate this is a fairly niche
> problem; I have getting on for 30 years' development experience in
> various platforms, including low-level hardware access in assembly
> when I was young, but all I've ever done with the kernel is modify in
> a very small way a few device drivers and I don't even know where to
> start with this so could do with some pointers.
> 
> I tried running a diff on drivers/usb between 3.7.9 and 3.7.10, but
> other than a few changes around usbserial there doesn't seem to be
> much, which seems odd given that the behaviour clearly changed. The
> 3.7.10 changelog only lists some usb-audio changes, a change for
> memory allocation for some urb blocks, and some fixes for usb-serial,
> so I guess something else changing has modified the way the USB core
> interacts with the hardware.

It is quite likely that the changes responsible for your problem are 
not located under drivers/usb.  I would guess they are in the 
platform-specific code somewhere.  In any case, you should broaden your 
approach.  Greg's suggestion about using git bisect, say between 3.7.9 
and 3.7.10, would be an excellent start.

> Did we intentionally simply drop support for this chipset in 3.8?

Not as far as I'm aware.  But I don't pay much attention to the
platform-specific chipset details, so I wouldn't really know.  You'd be 
better off asking the maintainers responsible for your platform.

Alan Stern

