Return-Path: <linux-usb+bounces-2799-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2537B7E8C68
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 20:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E6B31C2042F
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 19:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD921D531;
	Sat, 11 Nov 2023 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5D1D524
	for <linux-usb@vger.kernel.org>; Sat, 11 Nov 2023 19:56:21 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 1E3403A82
	for <linux-usb@vger.kernel.org>; Sat, 11 Nov 2023 11:56:19 -0800 (PST)
Received: (qmail 1129203 invoked by uid 1000); 11 Nov 2023 14:56:18 -0500
Date: Sat, 11 Nov 2023 14:56:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: linux-usb@vger.kernel.org
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Message-ID: <df282d44-b11c-427d-ae69-cfdfb21d1565@rowland.harvard.edu>
References: <ZU-xz52-1QMregso@ryzen7700x.fritz.box>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZU-xz52-1QMregso@ryzen7700x.fritz.box>

On Sat, Nov 11, 2023 at 05:58:08PM +0100, Andreas Kempf wrote:
> Hi,
> 
> I apologize if this is the wrong mailing list but my investigation
> led me to the USB subsystem and I do not know how to proceed.
> 
> My system:
> Arch Linux
> Linux kernel 6.6.1 (-arch1-1)
> Motherboard: ASRock X670E PG Lightning
> Device: Creative Sound Blaster G3
> 
> I have a Creative Technology Sound Blaster G3 USB sound device that
> seems to work perfectly on Windows. It used to work just fine on Linux,
> as well. However, at some point a few weeks ago, it started behaving
> oddly. Unfortunately, I cannot pinpoint exactly when the problems
> started happening because the symptoms did not immediately point me
> toward the device and I did not immediately figure out what was going
> on as I only noticed hangs when shutting down the system.

Did you update your kernel between the time when the device was
working okay and now?

> After some testing I figured out that it takes several minutes for the
> device to be recognized. Having plugged in the device, a command like
> 
> $ cat /sys/devices/pci0000:00/0000:00:02.1/0000:04:00.0/ \
>   0000:05:0c.0/0000:17:00.0/usb5/5-4/manufacturer
> 
> blocks for several minutes, until, at some point, it correctly prints
> Creative Technology Ltd

It sounds like the device isn't behaving properly.  Or maybe the USB
cable, but I assume you checked that.

Have you tried plugging the device into a different computer?  And
have you tried plugging other devices into the same USB port?

> The kernel seems to slowly figure out what to do with the device:
> 
> Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: new high-speed USB device number 2 using xhci_hcd
> Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: config 1 interface 2 altsetting 0 bulk endpoint 0x82 has invalid maxpacket 256

This message indicates the device does not follow the USB spec, but it
isn't a bad error.  Certainly not the sort of thing that would cause
the behavior you're seeing.

> Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: New USB device found, idVendor=041e, idProduct=3267, bcdDevice=10.40
> Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: New USB device strings: Mfr=1, Product=2, SerialNumber=9
> Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: Product: Sound Blaster G3
> Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: Manufacturer: Creative Technology Ltd
> Nov 11 16:25:29 ryzen7700x kernel: usb 5-4: SerialNumber: 15C1E5E3165B9B3D
> Nov 11 16:25:29 ryzen7700x kernel: input: Creative Technology Ltd Sound Blaster G3 as /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:17:00.0/usb5/5-4/5-4:1.0/0003:041E:3267.0007/input/input28
> Nov 11 16:25:29 ryzen7700x kernel: hid-generic 0003:041E:3267.0007: input,hidraw6: USB HID v1.10 Device [Creative Technology Ltd Sound Blaster G3] on usb-0000:17:00.0-4/input0
> Nov 11 16:25:34 ryzen7700x kernel: usb 5-4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -110)
> Nov 11 16:25:44 ryzen7700x kernel: usb 5-4: uac_clock_source_is_valid(): cannot get clock validity for id 33
> Nov 11 16:25:44 ryzen7700x kernel: usb 5-4: clock source 33 is not valid, cannot use

These -110 errors mean that the system is not getting a reply from the
device within the usual 5-second time limit.

> After these 9 minutes, the device seems to be able to play audio
> normally. Most of these messages I recognize, I think they have always
> been there but did not cause any issues. If I unplug the device (not
> sure if it has to happen during these 9 minutes), I encounter a hung
> task:
> 
> Nov 11 16:48:49 ryzen7700x kernel: INFO: task (udev-worker):9428 blocked for more than 122 seconds.

Probably not really hung, just waiting for the device to send some replies.

> I am not sure how to proceed. From what I gather, the "invalid maxpacket
> 256" message suggests that the device's firmware is iffy and the other
> messages do not inspire confidence either. It used to work without
> noticeable issues though. In any case, these issues seem to block
> shutdown sometimes and, all in all, these delays seem problematic.
> 
> I captured a few seconds of the devices usbmon interface and, during the
> long initialization in case they are useful:
> 
> ffff888106921980 1731857265 S Co:5:007:0 s 21 01 0100 2203 0001 1 = 01
> ffff888106a91d40 1731859450 C Ii:5:001:1 0:2048 2 = 1000
> ffff888106a91d40 1731859451 S Ii:5:001:1 -115:2048 4 <

These message do not show the initialization, or at least, they don't
show the beginning of the initialization.  You should start the usbmon
capture before plugging in the device and stop it after the device has
been plugged in for 30 seconds or so.  However, I suspect it will just
show that the system is only occasionally getting replies from the
device.

Alan Stern

