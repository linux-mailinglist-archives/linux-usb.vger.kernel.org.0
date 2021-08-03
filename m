Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDCD3DF6E8
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 23:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbhHCVcd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 17:32:33 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49017 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232478AbhHCVc3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Aug 2021 17:32:29 -0400
Received: (qmail 377994 invoked by uid 1000); 3 Aug 2021 17:32:16 -0400
Date:   Tue, 3 Aug 2021 17:32:16 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Message-ID: <20210803213216.GA376608@rowland.harvard.edu>
References: <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
 <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
 <20210715014451.GA397753@rowland.harvard.edu>
 <CAFBinCD0GKcc8veWAkWG=NCban4k8n5E-QdhNfccuH8OXvtA6g@mail.gmail.com>
 <20210719145322.GA565905@rowland.harvard.edu>
 <CAFBinCDAXzDugaCcf52ubE+a==7CtDkmHpX2hAeO+DkJWQCNSg@mail.gmail.com>
 <20210721155817.GC633399@rowland.harvard.edu>
 <CAFBinCBkUsTsPiMQ2iN5U63NczxXFHv818O-G01WzJXZ36ybeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCBkUsTsPiMQ2iN5U63NczxXFHv818O-G01WzJXZ36ybeA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Minas, you should look at analysis of the usbmon information below.

On Tue, Aug 03, 2021 at 10:20:54PM +0200, Martin Blumenstingl wrote:
> > This is weird.  Didn't you say earlier that doing the same thing, except for
> > using "lsusb -vvv" to wake up the GL hub rather than this sysfs write, would
> > not lead to the Corsair drive being detected?
> I just verified this again
> - plug in my Corsair Voyager USB 3.0 flash drive
> - boot without usbcore.autosuspend=-1
> - (device is not detected)
> - lsusb -vvv
> - (nothing happens, device is not detected)
> - wait at least 5 seconds
> - start the usbmon dump
> - echo -1 >/sys/bus/usb/devices/1-1/power/autosuspend
> - (the flash drive is detected automatically)
> - stop the usbmon dump
> 
> So it seems that telling the hub not to auto-suspend seems to work
> around it enough?
> I attached test-1_hub-autosuspend-1.out to document this result

It would be better if you started the usbmon trace before doing the 
lsusb -vvv, so that the trace would show everything you did.  Next 
time...

> > So was the GL hub actually suspended?  It's hard to tell exactly what the
> > hardware's doing, but you can get a trace that will help.  Do the following:
> at this point I'd like to point out again that it's amazing to have
> someone with your knowledge about the whole USB subsystem help out on
> this
> 
> > Boot with no device plugged in and with "usbcore.autosuspend=-1" on the
> > command line.  Then start a usbmon trace.
> >
> > Next, do
> >
> >         echo 2 >/sys/bus/usb/devices/1-1/power/autosuspend
> >
> > and wait a few seconds for the GL hub to be suspended.  To make sure it has,
> > do "grep . /sys/bus/usb/devices/1-1/power/*" and include the output in your
> > reply.
> # grep . /sys/bus/usb/devices/1-1/power/*
> /sys/bus/usb/devices/1-1/power/active_duration:104940
> /sys/bus/usb/devices/1-1/power/autosuspend:2
> /sys/bus/usb/devices/1-1/power/autosuspend_delay_ms:2000
> /sys/bus/usb/devices/1-1/power/connected_duration:116500
> /sys/bus/usb/devices/1-1/power/control:auto
> /sys/bus/usb/devices/1-1/power/level:auto
> /sys/bus/usb/devices/1-1/power/runtime_active_time:104511
> /sys/bus/usb/devices/1-1/power/runtime_status:suspended

Yep, the GL hub was suspended.

> /sys/bus/usb/devices/1-1/power/runtime_suspended_time:11562
> /sys/bus/usb/devices/1-1/power/wakeup:disabled
> 
> (I ran this command twice by accident, but I guess this makes no
> difference. this is the output of the second run)
> 
> > Then do
> >
> >         echo 2 >/sys/bus/usb/devices/usb1/power/autosuspend
> >
> > and wait a few seconds for the root hub to be suspended.  Again, to make
> > sure it has, do "grep . /sys/bus/usb/devices/usb1/power/*".
> # grep . /sys/bus/usb/devices/usb1/power/*
> /sys/bus/usb/devices/usb1/power/active_duration:130880
> /sys/bus/usb/devices/usb1/power/autosuspend:2
> /sys/bus/usb/devices/usb1/power/autosuspend_delay_ms:2000
> /sys/bus/usb/devices/usb1/power/connected_duration:140000
> /sys/bus/usb/devices/usb1/power/control:auto
> /sys/bus/usb/devices/usb1/power/level:auto
> /sys/bus/usb/devices/usb1/power/runtime_active_time:130872
> /sys/bus/usb/devices/usb1/power/runtime_status:suspended

And the root hub was suspended.

> /sys/bus/usb/devices/usb1/power/runtime_suspended_time:9120
> /sys/bus/usb/devices/usb1/power/wakeup:disabled
> 
> > Once that has settled down, wake up the root hub by doing
> >
> >         echo -1 >/sys/bus/usb/devices/usb1/power/autosuspend
> >
> > and a few seconds later, wake up the GL hub by doing
> >
> >         echo -1 >/sys/bus/usb/devices/1-1/power/autosuspend
> >
> > All these suspends and resumes should show up in the usbmon trace.  I'd like
> > to see what it really says; my guess is that it won't show quite what it
> > should.
> I attached test-2_autosuspend-steps-without-device-plugged-in.out
> which contains the usbmon dump for these steps
> At no point I had a USB device plugged in

Okay.  The trace shows something unexpected and strange.  It starts out 
normally:

dfa09a80 109714572 S Ci:1:002:0 s a3 00 0000 0001 0004 4 <
dfa09a80 109715294 C Ci:1:002:0 0 4 = 00010000
dfb50480 109722588 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
dfb50480 109729096 C Ci:1:002:0 0 4 = 00010000
dfb50480 109731181 S Ci:1:002:0 s a3 00 0000 0003 0004 4 <
dfb50480 109731855 C Ci:1:002:0 0 4 = 00010000
dfb50480 109731955 S Ci:1:002:0 s a3 00 0000 0004 0004 4 <
dfb50480 109732354 C Ci:1:002:0 0 4 = 00010000
c53fde80 109732473 C Ii:1:002:1 -2:2048 0

These show the kernel checking that there are no changes pending on any 
of the Genesys Logic hub's four ports and shutting down the interrupt 
URB, which are the first steps it takes when suspending the hub.

dfb50480 109732541 S Co:1:002:0 s 00 03 0001 0000 0000 0
dfb50480 109732785 C Co:1:002:0 0 0
dfb50480 109732874 S Co:1:001:0 s 23 03 0002 0001 0000 0
dfb50480 109732945 C Co:1:001:0 0 0

Next the kernel enables remote wakeup on the GL hub and turns on the 
suspend feature on the root hub's port 1.  At this point the GL hub 
should be fully suspended.

c53f4880 135532734 C Ii:1:001:1 -2:2048 0

A few seconds later (the second column in the usbmon output is a 
timestamp, in microseconds), the root hub's interrupt URB is shut down.  
This is the only part of suspending the root hub that shows up in a 
usbmon trace.

dfb50a80 167772234 S Ci:1:001:0 s a3 00 0000 0001 0004 4 <
dfb50a80 167772741 C Ci:1:001:0 0 4 = 03050000
c53f4880 167773132 S Ii:1:001:1 -115:2048 4 <

A few seconds later the root hub is resumed.  This involves checking the 
status of the root hub's downstream port and restarting the interrupt 
URB.

The unexpected behavior shows up in the second line above: The port 
status is 03050000 rather than 07050000.  This means the port is 
connected and enabled, but not suspended!  It also explains why later 
on, when the GL hub is resumed, we get:

dfb02a80 243483471 S Ci:1:001:0 s a3 00 0000 0001 0004 4 <
dfb02a80 243484838 C Ci:1:001:0 0 4 = 03050000
dfb02a80 243504208 S Ci:1:002:0 s 80 00 0000 0000 0002 2 <
dfb02a80 243552775 C Ci:1:002:0 0 2 = 0300
dfb02a80 243553536 S Co:1:002:0 s 00 01 0001 0000 0000 0
dfb02a80 243554358 C Co:1:002:0 0 0

This shows the port status being checked again.  The suspend status bit 
is still clear, so the kernel skips the step in which it tells the root 
hub to resume the port.  Instead, it immediately goes ahead to check the 
GL hub's device status and to turn off the hub's remote wakeup feature.  
These requests succeed, which wouldn't have happened if the port were 
still suspended.

In other words, the trace shows that the GL hub was never fully 
suspended!

So the question is: Why doesn't the port status on the DWC2 root hub 
show the suspend feature set, and why doesn't the root hub port get 
suspended?  This looks like a bug in the dwc2 driver.  It could well 
account for at least some of the problems you've been seeing.

Minas, any suggestions?

Alan Stern
