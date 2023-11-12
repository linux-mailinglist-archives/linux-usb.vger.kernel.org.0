Return-Path: <linux-usb+bounces-2805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAC7E91A5
	for <lists+linux-usb@lfdr.de>; Sun, 12 Nov 2023 17:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BDFB1C204D6
	for <lists+linux-usb@lfdr.de>; Sun, 12 Nov 2023 16:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D740015480;
	Sun, 12 Nov 2023 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE2914F86
	for <linux-usb@vger.kernel.org>; Sun, 12 Nov 2023 16:28:52 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 9363110F
	for <linux-usb@vger.kernel.org>; Sun, 12 Nov 2023 08:28:48 -0800 (PST)
Received: (qmail 1152001 invoked by uid 1000); 12 Nov 2023 11:28:47 -0500
Date: Sun, 12 Nov 2023 11:28:47 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Andreas Kempf <aakempf@gmail.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Message-ID: <c8868479-2fc7-4891-a008-bd9b685c6b48@rowland.harvard.edu>
References: <e478e2c3-cc43-492a-989f-21bce674b1b8@rowland.harvard.edu>
 <ZVCxDvNt3ERzZBpu@ryzen7700x.fritz.box>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVCxDvNt3ERzZBpu@ryzen7700x.fritz.box>

On Sun, Nov 12, 2023 at 12:03:42PM +0100, Andreas Kempf wrote:
> On Sat, Nov 11, 2023 at 03:01:24PM -0500, Alan Stern wrote:
> > On Sat, Nov 11, 2023 at 05:58:08PM +0100, Andreas Kempf wrote:
> > > Hi,
> > > 
> > > I apologize if this is the wrong mailing list but my investigation
> > > led me to the USB subsystem and I do not know how to proceed.
> > > 
> > > My system:
> > > Arch Linux
> > > Linux kernel 6.6.1 (-arch1-1)
> > > Motherboard: ASRock X670E PG Lightning
> > > Device: Creative Sound Blaster G3
> > > 
> > > I have a Creative Technology Sound Blaster G3 USB sound device that
> > > seems to work perfectly on Windows. It used to work just fine on Linux,
> > > as well. However, at some point a few weeks ago, it started behaving
> > > oddly. Unfortunately, I cannot pinpoint exactly when the problems
> > > started happening because the symptoms did not immediately point me
> > > toward the device and I did not immediately figure out what was going
> > > on as I only noticed hangs when shutting down the system.
> > 
> > Did you update your kernel between the time when the device was
> > working okay and now?
> > 
> Unfortunately, I cannot really pinpoint when the issues started to
> appear, but on Arch Linux, almost every stable release gets picked up and
> a new kernel package is pushed every few days, so it is very likely.
> What confuses me, though, is that switching to a 6.1 LTS kernel did not
> seem to change anything.

If the problem was caused by a change in the kernel, the change might
have been included in the LTS kernels.

> > > After some testing I figured out that it takes several minutes for the
> > > device to be recognized. Having plugged in the device, a command like
> > > 
> > > $ cat /sys/devices/pci0000:00/0000:00:02.1/0000:04:00.0/ \
> > >   0000:05:0c.0/0000:17:00.0/usb5/5-4/manufacturer
> > > 
> > > blocks for several minutes, until, at some point, it correctly prints
> > > Creative Technology Ltd
> > 
> > It sounds like the device isn't behaving properly.  Or maybe the USB
> > cable, but I assume you checked that.
> > 
> > Have you tried plugging the device into a different computer?  And
> > have you tried plugging other devices into the same USB port?
> > 
> The device has a permanently attached cable that cannot be swapped,
> unfortunately.

In any case, it's very unlikely that the cable is at fault.

> This whole issue is extremely confusing to me as I cannot really figure
> out a pattern. Today I tried the following:
> - I plugged the device in on Linux: issue occurred
> - I plugged the device into a different port on the same machine on
>   Linux: issue occurred.
> - I plugged the device into an Android phone: played audio immediately
> - I plugged the device into a Laptop running Arch on 6.6.1: played audio
>   immediately (?!)

Is that the same kernel as on the first system?  (Just want to be
certain.)  If it is then the kernel probably isn't the cause.

Can you collect a usbmon trace on that machine?  And also, can you
post the output from "lsusb -v" for the Sound Blaster?

> - I booted the machine on Linux with the device already plugged in:
>   played audio immediately (?!)
> - I booted Windows and plugged in the device: played audio immediately
> - I plugged a keyboard and a mouse into the port: no issues

Yeah, it's really hard to tell what's happening.

> At this point I am more interested in figuring out what the heck is
> going on than actually getting this device to work.
> 
> Andreas Kempf

I've removed the first part of the usbmon trace.  It shows an ordinary
device detection and enumeration.

> ffff888106725d40 503577493 S Co:5:002:0 s 00 09 0001 0000 0000 0
> ffff888106725d40 503578614 C Co:5:002:0 0 0
> ffff888106725d40 503578910 S Ci:5:002:0 s 80 06 0309 0409 00ff 255 <
> ffff888106725d40 503581615 C Ci:5:002:0 0 34 = 22033100 35004300 31004500 35004500 33003100 36003500 42003900 42003300
> ffff888106725d40 503581622 S Co:5:002:0 s 21 0a 0000 0000 0000 0
> ffff888106725d40 503583615 C Co:5:002:0 0 0
> ffff888106725d40 503583619 S Ci:5:002:0 s 81 06 2200 0000 004f 79 <
> ffff888106725d40 503587625 C Ci:5:002:0 0 79 = 050c0901 a1011600 00260100 09e909ea 09e209cd 09b509b6 09b109b3 09b409cf
> ffff888106725d40 503587756 S Ii:5:002:6 -115:32 64 <
> ffff888106725c80 503644602 S Ci:5:002:0 s 80 06 0302 0409 00ff 255 <
> ffff888106725c80 503646631 C Ci:5:002:0 0 34 = 22035300 6f007500 6e006400 20004200 6c006100 73007400 65007200 20004700
> ffff888106725c80 503646635 S Ci:5:002:0 s 80 06 0301 0409 00ff 255 <
> ffff888106725c80 503649624 C Ci:5:002:0 0 50 = 32034300 72006500 61007400 69007600 65002000 54006500 63006800 6e006f00

That part is normal also.  It shows a Set-Configuration request, HID
Set-Idle and Get-Report-Descriptor requests, and a few Get-Descriptor
requests for some strings.

> ffff888106725140 503649650 S Co:5:002:0 s 21 01 0100 2203 0001 1 = 01

I don't recognize this request.  It's probably a USB audio thing.  Its
most notable aspect is that the device doesn't send a reply.  Maybe it
gets confused?

> ffff888101f31680 503651820 C Ii:5:001:1 0:2048 2 = 1000
> ffff888101f31680 503651824 S Ii:5:001:1 -115:2048 4 <
...

This next part is just a bunch of root-hub statuses, which I am leaving
out.  They don't make any progress because the system is waiting for
the device to respond to the earlier request.

> ffff888106725140 508701320 C Co:5:002:0 -2 0

After five seconds (the second column is a timestamp in microseconds)
with no response, the request times out and is aborted (the -2 status
code).

> ffff8881067255c0 508701366 S Co:5:002:0 s 01 0b 0000 0004 0000 0

This is a standard request telling the device to install alternate
setting 0 on interface 4 (probably one of the audio interfaces).
Again there's no reply.

> ffff888101f31680 508913548 C Ii:5:001:1 0:2048 2 = 1000
> ffff888101f31680 508913567 S Ii:5:001:1 -115:2048 4 <
...

> ffff8881067255c0 513820637 C Co:5:002:0 -2 0

And again the request times out after five seconds and is aborted.
There's no point going through the rest of the trace; it all looks
like this.

One gets the definite impression that the audio part of the device
simply isn't working.  But it can't be as straightforward as that,
because your tests show the device does work with other computers.

Alan Stern

