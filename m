Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E78C219E839
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2020 03:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgDEB1n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Apr 2020 21:27:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42437 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726283AbgDEB1n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Apr 2020 21:27:43 -0400
Received: (qmail 25974 invoked by uid 500); 4 Apr 2020 21:27:42 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Apr 2020 21:27:42 -0400
Date:   Sat, 4 Apr 2020 21:27:42 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
cc:     Colin Williams <colin.williams.seattle@gmail.com>,
        Linux USB <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
Subject: Re:
In-Reply-To: <CAB=otbS1RTnn9PixJYjsW4U_37GcFvR-O3WZ-7YnamdcDGKvRA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004042124390.25831-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 5 Apr 2020, Ruslan Bilovol wrote:

> Hi,
> 
> Please also add to CC related mailing lists (alsa-devel, linux-usb) rather
> then directly emailing - community may also help with the issue. Also it can be
> googled so if somebody else have same issue it can find answers faster.
> 
> On Fri, Apr 3, 2020 at 10:56 AM Colin Williams
> <colin.williams.seattle@gmail.com> wrote:
> >
> > https://ubuntuforums.org/showthread.php?t=2439897
> >
> > On Thu, Apr 2, 2020 at 4:50 PM Colin Williams <colin.williams.seattle@gmail.com> wrote:
> >>
> >> Hello,
> >>
> >> Is it possible that one of these commits or related broke support for the Blue Mic Yeti?
> >>
> >> https://github.com/torvalds/linux/blame/ac438771ccb4479528594c7e19f2c39cf1814a86/sound/usb/stream.c#L816
> 
> Tha'ts workaround to ignore last altsetting which is the same as previous.
> During UAC3 implementation, I reimplemented that workaround carefully,
> but I didn't have (and still do not own) any Blue Mic USB device.
> I don't know whether it was tested after that by anyone.
> 
> >>
> >> I am getting the following when I plug my mic in:
> 
> Which kernel version is that? Have you tried latest Linux Kernel?
> 
> >>
> >> [ 1283.848740] usb 1-1.2: new full-speed USB device number 82 using ehci-pci
> >> [ 1283.964802] usb 1-1.2: New USB device found, idVendor=b58e, idProduct=9e84, bcdDevice= 1.00
> >> [ 1283.964808] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> >> [ 1283.964810] usb 1-1.2: Product: Yeti Stereo Microphone
> >> [ 1283.964812] usb 1-1.2: Manufacturer: Blue Microphones
> >> [ 1284.080671] usb 1-1.3: new low-speed USB device number 83 using ehci-pci
> >> [ 1284.784678] usb 1-1.3: device descriptor read/64, error -32
> >> [ 1285.180674] usb 1-1.3: device descriptor read/64, error -32
> >> [ 1285.992682] usb 1-1.3: new low-speed USB device number 84 using ehci-pci
> >> [ 1286.696672] usb 1-1.3: device descriptor read/64, error -32
> >> [ 1287.092695] usb 1-1.3: device descriptor read/64, error -32
> >> [ 1287.200804] usb 1-1-port3: attempt power cycle
> >> [ 1287.804662] usb 1-1.3: new low-speed USB device number 85 using ehci-pci
> >> [ 1288.220686] usb 1-1.3: device not accepting address 85, error -32
> >> [ 1288.508685] usb 1-1.3: new low-speed USB device number 86 using ehci-pci
> >> [ 1288.924690] usb 1-1.3: device not accepting address 86, error -32
> >> [ 1288.924916] usb 1-1-port3: unable to enumerate USB device
> >> [ 1288.925391] usb 1-1.2: USB disconnect, device number 82
> >> [ 1289.308736] usb 1-1.3: new low-speed USB device number 87 using ehci-pci
> >> [ 1289.596727] usb 1-1.3: device descriptor read/64, error -32
> >> [ 1289.992635] usb 1-1.3: device descriptor read/64, error -32
> >> [ 1290.596683] usb 1-1.3: new low-speed USB device number 88 using ehci-pci
> >> [ 1290.888718] usb 1-1.3: device descriptor read/64, error -32
> >> [ 1291.284673] usb 1-1.3: device descriptor read/64, error -32
> >> [ 1291.392928] usb 1-1-port3: attempt power cycle
> 
> Looking at this log, it seems the issue happens during enumeration,
> so mentioned workaround isn't executed yet at this moment.
> So it seems this is related to USB core, not to ALSA driver.

All those errors were for the 1-1.3 device.  The microphone was 1-1.2.
It's not clear from the log above what the relationship between those 
two devices is, but it sure looks like the microphone was enumerated 
okay.

What shows up in /sys/kernel/debug/usb/devices?

Alan Stern

