Return-Path: <linux-usb+bounces-3144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2687F37CA
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 22:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9CE728283A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 21:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D0E51026;
	Tue, 21 Nov 2023 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 7F998D45
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:59:49 -0800 (PST)
Received: (qmail 1502171 invoked by uid 1000); 21 Nov 2023 15:59:48 -0500
Date: Tue, 21 Nov 2023 15:59:48 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Message-ID: <e7046e12-9240-4574-8d66-191d6cc1eacd@rowland.harvard.edu>
References: <e478e2c3-cc43-492a-989f-21bce674b1b8@rowland.harvard.edu>
 <ZVCxDvNt3ERzZBpu@ryzen7700x.fritz.box>
 <c8868479-2fc7-4891-a008-bd9b685c6b48@rowland.harvard.edu>
 <ZVJ2EBlh8We2NrcF@ryzen7700x.fritz.box>
 <98418f3d-79d7-44e8-897b-de8e0e20f968@rowland.harvard.edu>
 <ZVzvtmDaNj223or8@ryzen7700x.fritz.box>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVzvtmDaNj223or8@ryzen7700x.fritz.box>

On Tue, Nov 21, 2023 at 06:58:14PM +0100, Andreas Kempf wrote:
> On Mon, Nov 13, 2023 at 03:58:03PM -0500, Alan Stern wrote:
> I finally bought a powered hub, plugged it into the same USB port and
> plugged the audio device into the hub. From what I can tell, the device
> was recognized quickly and seems to work. So, I guess you were probably
> right about insufficient power being an issue. This is pretty annoying
> because this motherboard is not exactly a budget model.
> Now, there are a ton of errors in the kernel log for the hub itself (see
> attachment), but that might be because it has seven ports and only one
> is in use?

No, that's not the reason for the errors...

> In any case, the mystery seems to be solved. Thank you very much for
> your time and support!

I'm not so sure.  All those error messages in the log are worrisome.

> Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: new high-speed USB device number 12 using xhci_hcd
> Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: New USB device found, idVendor=2109, idProduct=2822, bcdDevice= 8.b4
> Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: Product: USB2.0 Hub             
> Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: Manufacturer: VIA Labs, Inc.         
> Nov 21 18:49:16 ryzen7700x kernel: hub 5-4:1.0: USB hub found
> Nov 21 18:49:16 ryzen7700x kernel: hub 5-4:1.0: 4 ports detected
> Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
> Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
> Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: device not accepting address 125, error -71
> Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
> Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
> Nov 21 18:49:17 ryzen7700x kernel: usb 6-4: device not accepting address 126, error -71
> Nov 21 18:49:17 ryzen7700x kernel: usb usb6-port4: attempt power cycle

All those errors, and the similar ones later on, indicate that the
hub's USB-3 portion isn't communicating properly with the computer.

> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: new high-speed USB device number 14 using xhci_hcd
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: config 1 interface 2 altsetting 0 bulk endpoint 0x82 has invalid maxpacket 256
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: New USB device found, idVendor=041e, idProduct=3267, bcdDevice=10.40
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=9
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: Product: Sound Blaster G3
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: Manufacturer: Creative Technology Ltd
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: SerialNumber: 15C1E5E3165B9B3D
> Nov 21 18:49:20 ryzen7700x kernel: input: Creative Technology Ltd Sound Blaster G3 as /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:17:00.0/usb5/5-4/5-4.4/5-4.4.4/5-4.4.4:1.0/0003:041E:3267.000D/input/input35
> Nov 21 18:49:20 ryzen7700x kernel: hid-generic 0003:041E:3267.000D: input,hidraw6: USB HID v1.10 Device [Creative Technology Ltd Sound Blaster G3] on usb-0000:17:00.0-4.4.4/input0
> Nov 21 18:49:20 ryzen7700x kernel: cdc_acm 5-4.4.4:1.1: ttyACM0: USB ACM device

That part looks okay.

> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -71)
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: uac_clock_source_is_valid(): cannot get clock validity for id 33
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: clock source 33 is not valid, cannot use
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -71)
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: uac_clock_source_is_valid(): cannot get clock validity for id 33
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: clock source 33 is not valid, cannot use
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -71)
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: uac_clock_source_is_valid(): cannot get clock validity for id 37
> Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: clock source 37 is not valid, cannot use

Those and similar error messsages should not appear.  Do you also get 
them when you connect the device to the laptop?

> Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: new high-speed USB device number 15 using xhci_hcd
> Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: config 1 interface 2 altsetting 0 bulk endpoint 0x82 has invalid maxpacket 256
> Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: New USB device found, idVendor=041e, idProduct=3267, bcdDevice=10.40
> Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=9
> Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: Product: Sound Blaster G3
> Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: Manufacturer: Creative Technology Ltd
> Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: SerialNumber: 15C1E5E3165B9B3D
> Nov 21 18:49:21 ryzen7700x kernel: input: Creative Technology Ltd Sound Blaster G3 as /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:17:00.0/usb5/5-4/5-4.4/5-4.4.4/5-4.4.4:1.0/0003:041E:3267.000E/input/input36
> Nov 21 18:49:21 ryzen7700x kernel: hid-generic 0003:041E:3267.000E: input,hidraw6: USB HID v1.10 Device [Creative Technology Ltd Sound Blaster G3] on usb-0000:17:00.0-4.4.4/input0
> Nov 21 18:49:21 ryzen7700x kernel: cdc_acm 5-4.4.4:1.1: ttyACM0: USB ACM device

It looks like the device disconnected itself electronically and then
reconnected.  Not what you would expect.

> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [12] FU [SPDIF In Playback Volume] ch = 1, val = -20493/0/24
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=1120), cval->res is probably wrong.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [13] FU [Microphone Playback Volume] ch = 1, val = -24576/2304/24
> Nov 21 18:49:22 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=1120), cval->res is probably wrong.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [11] FU [Aux In Playback Volume] ch = 1, val = -24576/2304/24
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [1] FU [Speaker Playback Volume] ch = 1, val = -20493/0/24
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [14] FU [Headset Playback Volume] ch = 1, val = -20493/0/24
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=1120), cval->res is probably wrong.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [2] FU [Microphone Capture Volume] ch = 1, val = -24576/2304/24
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [23] FU [What U Hear Capture Volume] ch = 1, val = -20493/0/24
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=1120), cval->res is probably wrong.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [25] FU [Aux In Capture Volume] ch = 1, val = -24576/2304/24
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
> Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [8] FU [SPDIF In Capture Volume] ch = 1, val = -20493/0/24

Again, unexpected errors.  There's definitely something wrong
somewhere.  It could be a hardware problem, or a problem in the Sound
Blaster, or a software incompatibility.  But if none of these errors
show up on the laptop then we can rule out the last two possibilities.

> Nov 21 18:49:22 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
> Nov 21 18:49:22 ryzen7700x kernel: usb 6-4: device not accepting address 7, error -71
> Nov 21 18:49:22 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
> Nov 21 18:49:23 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
> Nov 21 18:49:23 ryzen7700x kernel: usb 6-4: device not accepting address 8, error -71
> Nov 21 18:49:23 ryzen7700x kernel: usb usb6-port4: attempt power cycle

These messages show that the hub's SuperSpeed (USB-3) connections still
aren't transferring data properly.  I doubt that the hub is at fault
here; more likely there's a problem in your computer's USB controller.

> Nov 21 18:49:48 ryzen7700x kernel: usb 6-4: new SuperSpeed USB device number 36 using xhci_hcd
> Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: New USB device found, idVendor=2109, idProduct=0822, bcdDevice= 8.b4
> Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: Product: USB3.1 Hub             
> Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: Manufacturer: VIA Labs, Inc.         
> Nov 21 18:49:49 ryzen7700x kernel: hub 6-4:1.0: USB hub found
> Nov 21 18:49:49 ryzen7700x kernel: hub 6-4:1.0: 4 ports detected

The SuperSpeed connection finally started working for a little while...

> Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: USB disconnect, device number 36

and then stopped working.

Do you have any other USB-3 devices you can try plugging into the same
USB port?

Alan Stern

