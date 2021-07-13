Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D8D3C769F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 20:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhGMSpm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 14:45:42 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52485 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229500AbhGMSpm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 14:45:42 -0400
Received: (qmail 358363 invoked by uid 1000); 13 Jul 2021 14:42:51 -0400
Date:   Tue, 13 Jul 2021 14:42:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hylke Hellinga <hylke.hellinga@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing
 random full speed USB resets
Message-ID: <20210713184251.GC355405@rowland.harvard.edu>
References: <CABUoX8tR+DpknjXCwtVkBh6O-rUisZ2V5RepzxRO-k5XBX7J=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABUoX8tR+DpknjXCwtVkBh6O-rUisZ2V5RepzxRO-k5XBX7J=g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 13, 2021 at 08:19:23PM +0200, Hylke Hellinga wrote:
> Hey there,
> 
> For my desktop setup I have a usb kvm switch ordered from amazon.
> Found here:
> https://www.amazon.com/Switcher-Selector-Computers-Keyboard-Compatbile/dp/B082K87B87/ref=sr_1_6?dchild=1&keywords=usb+switch&qid=1626199073&sr=8-6
> 
> I've got 3 usb devices attached to this switch. A full speed ROG
> Claymore keyboard, a full speed Roccat Tyon mouse, and a full speed
> Arctis 5 headset.

Oddly, the log you provided indicates that the ROCCAT mouse could run 
at high speed but it running only at full speed.  No obvious reason 
why.

> Whenever I have this switch connected and I'm on my gentoo linux
> system with kernel:
> 
> Linux 5.12.9-gentoo-x86_64 #1 SMP Mon Jul 5 03:11:12 CEST 2021 x86_64
> AMD Ryzen 9 3950X 16-Core Processor AuthenticAMD GNU/Linux
> 
> It is randomly disconnecting and connecting my devices.
> So I figured this would be a power issue, where the usb port of my
> desktop is drawing not enough power for the supported devices.
> 
> The switch comes with a 5v micro usb power interface. I have this
> micro usb connected to a 5v power adapter at all times in a separate
> power socket.
> 
> This problem does not occur on proprietary operating systems such as
> Windows 10 and Mac OS X on the same hardware.
> Which has led me to believe that perhaps this has to do with the USB
> chipset drivers for my motherboard in the linux kernel.
> 
> Underneath is my dmesg log that will display the following entries at the end:
> [ 5620.383044] usb 1-7.2: reset full-speed USB device number 7 using xhci_hcd
> [ 5649.905700] usb 1-7.3: reset full-speed USB device number 9 using xhci_hcd
> 
> https://gist.github.com/Simbaclaws/3cde9ea6732b1db151e69a71c1978965
> 
> Here is my lspci output:
> 
> https://gist.github.com/Simbaclaws/b88b7d0e2fd7609af1cf579527b6326f
> 
> I think the one that is causing issues is:
> 04:00.0 USB controller: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller

Actually it's the 02:00.0 controller (the one connected to USB buses 
1 and 2).

> The motherboard that I am using is a Crosshair VI Hero, I doubt that
> the motherboard hardware is the issue here, since these issues don't
> seem to apply to other operating systems.
> 
> Are there any further steps I can take to diagnose this issue any further?
> Perhaps I can debug the kernel that I'm using somehow?

You can collect a usbmon trace showing the problem:

	cat /sys/kernel/debug/usb/usbmon/1u >usbmon.txt

Let the trace run long enough to encounter two or three of these 
resets, then kill the "cat" process and post the output file.

> I'm not that familiar with C code, the best I can do is write some
> small patches for DWM. Just so you get a feeling of what my current
> expertise is at in this regard.
> 
> Please help me fix this annoying bug, since it is literally
> disconnecting my keyboard every random amount of seconds causing me to
> have a hard time on linux.
> 
> 
> Let me know if this is the right place to ask these kind of things.
> I've never reported a kernel issue before.

Yes, this mailing list is absolutely the right place to report such 
issues.

Alan Stern
