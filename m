Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197A83D1305
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 17:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239930AbhGUPRm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 11:17:42 -0400
Received: from netrider.rowland.org ([192.131.102.5]:42487 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S239841AbhGUPRl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 11:17:41 -0400
Received: (qmail 637742 invoked by uid 1000); 21 Jul 2021 11:58:17 -0400
Date:   Wed, 21 Jul 2021 11:58:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Matt Corallo <oc2udbzfd@mattcorallo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Message-ID: <20210721155817.GC633399@rowland.harvard.edu>
References: <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
 <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
 <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
 <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
 <20210715014451.GA397753@rowland.harvard.edu>
 <CAFBinCD0GKcc8veWAkWG=NCban4k8n5E-QdhNfccuH8OXvtA6g@mail.gmail.com>
 <20210719145322.GA565905@rowland.harvard.edu>
 <CAFBinCDAXzDugaCcf52ubE+a==7CtDkmHpX2hAeO+DkJWQCNSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCDAXzDugaCcf52ubE+a==7CtDkmHpX2hAeO+DkJWQCNSg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Minas, some of the things noted below may require your attention.  In 
particular, the usbmon traces don't show the root hub doing what it should, 
which leads me to wonder whether the Genesys Logic hub attached to port 1 
really is getting suspended and resumed properly.

On Tue, Jul 20, 2021 at 11:55:05PM +0200, Martin Blumenstingl wrote:
> > That's what it looks like to me too.  This means that the hub on the
> > Odroid doesn't support remote wakeup properly.  Or else the root hub
> > gets the remote-wakeup message and doesn't handle it properly.  Either
> > way it's a pretty nasty bug for a significant piece of hardware.
> as a wild idea: I do have a 24MHz logic analyzer. If there was a way
> for me to force the communication between the hub and dwc2 to use
> "full speed" or or slower I might be able to look at the signals on
> the bus.
> in case you're aware of any possibility to force the communication to
> use a slower speed then please let me know.

In theory you don't need to worry about this.  When a high-speed device such 
as the Genesys Logic hub goes into suspend, it reverts to full-speed 
signalling (see section 7.1.7.6 of the USB-2 specification).

As such, you can easily measure the change from a suspend signal to a wakeup 
or resume signal, although you can't easily tell which device (the computer 
or the hub) caused the change.  A suspend signal has the D+ line steady at 
high voltage (> 3 V) and the D- line at low voltage (close to 0 V).  A 
resume signal is the opposite, typically lasting only a few (or a few tens) 
of microseconds.

> I misread your comment at first and used slightly different steps:
> - boot without usbcore.autosuspend=-1
> - plug in my Corsair Voyager USB 3.0 flash drive
> - start the usbmon dump
> - echo -1 >/sys/bus/usb/devices/1-1/power/autosuspend
> - (the flash drive is detected automatically)
> - stop the usbmon dump
> 
> The result of this test can be found in:
> 0u.mon-odroidc1-plugged-after-boot-disable-autosuspend.out

This was the second attachment to your email.

> After that I did the test as I believe you're expecting it to be done:
> - plug in my Corsair Voyager USB 3.0 flash drive
> - boot without usbcore.autosuspend=-1
> - start the usbmon dump
> - echo -1 >/sys/bus/usb/devices/1-1/power/autosuspend
> - (the flash drive is detected automatically)

This is weird.  Didn't you say earlier that doing the same thing, except for 
using "lsusb -vvv" to wake up the GL hub rather than this sysfs write, would 
not lead to the Corsair drive being detected?

> - stop the usbmon dump
> 
> The result of this test can be found in:
> 0u.mon-odroidc1-plugged-during-boot-disable-autosuspend.out

That was the first attachment.

> In both tests I observe the following in the kernel log:
>   usb 1-1: reset high-speed USB device number 2 using dwc2
> I assume that this brings the hub into a well-defined state where
> remote wakeup may not be relevant

I saw such a reset only in the first usbmon trace, not the second.  It looks 
like the reset was performed because of a communication error (the -71 
status code near the beginning of the trace), but it's not at all clear why 
the error occurred.

In fact, there were a few strange things in the traces.  Let's look at the 
start of the first one.  The trace starts by showing the root hub 
being resumed, which involves asking for the port status:

c57f1680 41352445 S Ci:1:001:0 s a3 00 0000 0001 0004 4 <
c57f1680 41352762 C Ci:1:001:0 0 4 = 03050000

The status for port 1 shows that the port isn't suspended and hasn't 
undergone a wakeup transition.  It's simply active, as though it had never 
been suspended in the first place.

(For those unaccustomed to reading these traces, the 03050000 status value 
above means the following: The two bits in the "3" are "Port connected" and 
"Port enabled", and the two bits in the "5" are "Port power on" and "Port is 
high-speed".  If the port were still suspended, the 04000000 bit would be 
set.  Notably missing is the bit which would indicate "Port suspend status 
change", which is in the 00000400 position and is supposed to be set 
whenever the port is resumed because of a wakeup request from the attached 
device.)

c5753280 41352977 S Ii:1:001:1 -115:2048 4 <

The shows the root hub's interrupt URB starting up, the last part of a 
normal resume.

So was the GL hub actually suspended?  It's hard to tell exactly what the 
hardware's doing, but you can get a trace that will help.  Do the following:

Boot with no device plugged in and with "usbcore.autosuspend=-1" on the 
command line.  Then start a usbmon trace.

Next, do

	echo 2 >/sys/bus/usb/devices/1-1/power/autosuspend

and wait a few seconds for the GL hub to be suspended.  To make sure it has, 
do "grep . /sys/bus/usb/devices/1-1/power/*" and include the output in your 
reply.

Then do

	echo 2 >/sys/bus/usb/devices/usb1/power/autosuspend

and wait a few seconds for the root hub to be suspended.  Again, to make 
sure it has, do "grep . /sys/bus/usb/devices/usb1/power/*".

Once that has settled down, wake up the root hub by doing

	echo -1 >/sys/bus/usb/devices/usb1/power/autosuspend

and a few seconds later, wake up the GL hub by doing

	echo -1 >/sys/bus/usb/devices/1-1/power/autosuspend

All these suspends and resumes should show up in the usbmon trace.  I'd like 
to see what it really says; my guess is that it won't show quite what it 
should.

> > It's possible to create a udev script that will perform this action
> > automatically at startup (does your OS use udev?).  Again, the only way
> > to see if the Corsair drive will then work is to try it.
> I am an Arch Linux ARM user so udev scripts are possible.
> 
> > If this doesn't work, I think the only solution will be a kernel patch.
> Personally I'd prefer a kernel patch (maybe with some flag in
> device-tree like broken-remote-wakeup) as from my understanding all
> Odroid-C1 and Odroid-C2 (both using Amlogic SoCs) boards are affected.
> As a reviewer of the Amlogic platform patches I'd rather avoid
> recommending some udev rules for every user.

I want to nail down the actual reason for the problem before recommending 
any changes.

> > One other thought: It may be that the reason the Corsair drive and
> > others don't work when they are plugged in before boot-up is because
> > they are too slow to connect to the USB bus.  That would cause the
> > Genesys Logic hub to go into runtime suspend before the drive is
> > detected, and then the hub never resumes because its remote wakeup
> > support is faulty.
> >
> > You can test this guess by plugging the Corsair drive into the Odroid
> > before booting, and adding "usbcore.autosuspend=10" to the boot command
> > line.  This will cause the hub to delay for ten seconds before going
> > into runtime suspend, and that might be enough time for the drive to
> > connect to the bus and be detected.
> usbcore.autosuspend=10 doesn't make any difference for me, the device
> is still not detected.
> With autosuspend disabled it's quick to detect the device (I haven't
> timed it but it's below 2 seconds).

In the second usbmon trace, the detection required 2.05 seconds from the 
time when the GL hub was resumed.  This may explain why waking up the hub 
with "lsusb -vvv" doesn't cause the drive to be detected; the hub may be 
suspended again before the drive shows up.

But it doesn't tell us what happens during boot-up, and unfortunately 
there's no way to start a usbmon trace at that time.

Alan Stern
