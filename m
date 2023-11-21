Return-Path: <linux-usb+bounces-3127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EDF7F356B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 18:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D5CBB21A7E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 17:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6615B1E5;
	Tue, 21 Nov 2023 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUCelc8D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8805E8
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 09:58:18 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso9277a12.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700589497; x=1701194297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H3ricPprk4PThAvzJjyy3kfjs+KwtKxEOnnv8x9UsEo=;
        b=GUCelc8D+RWEzbfMS3dLIAb14MsirGhuks26N6bIOa2iDHbskySJQXE0smV1gSnGgt
         AdqCR2gE3wqtiFen5Gy7vXOL9XU7Ls7LuOWzT3KshIVq7ivHAOfuxFaX4y4IQ2rPcCZa
         pmh2NkvbbHHDMH1P0YZ5KQIIpBMVS4tpGmCN5QGwdhj3qouAGbKlrViKp7dQIEZaZOey
         0IoWnbJfTxcCgq/jnr5J0ykgxPIUD3sdr6TbtE83LvA4UKXqRZR9smJcxyG1zBomEFwb
         eDYAZ0zfG80Il+bedNsQ/3fBFIzXBy2klvQAXd6udOTkBtuiEfXIxzqaJg6ZGAZstXl6
         oFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700589497; x=1701194297;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3ricPprk4PThAvzJjyy3kfjs+KwtKxEOnnv8x9UsEo=;
        b=siuEhN6Rm4gZ0I3ZYEOk55KHoNlYiY/FpKKRSHODfp5EDEpmJO50CXCOuLASxAzuGl
         AA3OYRaD13xSqtdCsKP27aEvR28JPfuW0Ri+jMzKMtUrLBfzTOuSPAWFOPJYosBwu+d8
         no/BDZ1APIWDWQF58NFU/TlomqG0UtCJyejvPBmqBSGPmTBvwAVMnI5SyhD4lke4JuO6
         qZG15yf098p6ELTWPetAtSGfbwAPitHdNkDI/rz2wialm0IYgsc23GAABH+SymGpVddm
         ZXYATtuQoaOQYpOKn6YWz1ytkLtic1hXF/wyhzElc20TYcFowCmt3XuUcwXwdbwtr4e2
         afTg==
X-Gm-Message-State: AOJu0YzgomRNdk9Hwn+P5F8AlzZB4+jf2PLDRkDNpqQeMB+LGpwrtZmi
	9spAaCDoe3Zz/TigTPmw3qSc1NX2tu0=
X-Google-Smtp-Source: AGHT+IH3zVonBbkSifFDqzHLeMYGlcUtKAHEm9RRYk+zjlkQ67DwCvAmDYBcQCx6eADuMrdrcf6b+w==
X-Received: by 2002:a17:906:73c5:b0:9fc:f9da:3161 with SMTP id n5-20020a17090673c500b009fcf9da3161mr3298816ejl.23.1700589497076;
        Tue, 21 Nov 2023 09:58:17 -0800 (PST)
Received: from ryzen7700x.fritz.box (p200300ee972a9800aaa159fffee94020.dip0.t-ipconnect.de. [2003:ee:972a:9800:aaa1:59ff:fee9:4020])
        by smtp.gmail.com with ESMTPSA id cm7-20020a170906f58700b009e5e1710ae7sm4311572ejd.191.2023.11.21.09.58.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 09:58:16 -0800 (PST)
Date: Tue, 21 Nov 2023 18:58:14 +0100
From: Andreas Kempf <aakempf@gmail.com>
To: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Message-ID: <ZVzvtmDaNj223or8@ryzen7700x.fritz.box>
Mail-Followup-To: USB mailing list <linux-usb@vger.kernel.org>
References: <e478e2c3-cc43-492a-989f-21bce674b1b8@rowland.harvard.edu>
 <ZVCxDvNt3ERzZBpu@ryzen7700x.fritz.box>
 <c8868479-2fc7-4891-a008-bd9b685c6b48@rowland.harvard.edu>
 <ZVJ2EBlh8We2NrcF@ryzen7700x.fritz.box>
 <98418f3d-79d7-44e8-897b-de8e0e20f968@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tZAmPlNxn7rZAmmh"
Content-Disposition: inline
In-Reply-To: <98418f3d-79d7-44e8-897b-de8e0e20f968@rowland.harvard.edu>


--tZAmPlNxn7rZAmmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 13, 2023 at 03:58:03PM -0500, Alan Stern wrote:
> On Mon, Nov 13, 2023 at 08:16:32PM +0100, Andreas Kempf wrote:
> > On Sun, Nov 12, 2023 at 11:28:47AM -0500, Alan Stern wrote:
> > I attached the usbmon output collected on my laptop and the lsusb -v
> > output for the device (collected on the "problematic" desktop).
> > As far as I can tell, the first column and the timestamp, as well as the
> > bus number are different, so the following command might remove these
> > parts:
> > 
> > sdiff <(cut -d ' ' -f 3- busdata.txt | cut -d ':' -f1,3-) \
> >   <(cut -d ' ' -f 3- busdata_laptop.txt | cut -d ':' -f1,3-)
> > 
> > I cut the laptop file short as I started playing something which created
> > a lot of data quickly.
> > 
> > I should say that the laptop is a few years old and slower (Thinkpad
> > E485) and probably does not support the same USB versions as my desktop.
> 
> That probably doesn't make any difference.
> 
> > > I've removed the first part of the usbmon trace.  It shows an ordinary
> > > device detection and enumeration.
> > > 
> > > > ffff888106725d40 503577493 S Co:5:002:0 s 00 09 0001 0000 0000 0
> > > > ffff888106725d40 503578614 C Co:5:002:0 0 0
> > > > ffff888106725d40 503578910 S Ci:5:002:0 s 80 06 0309 0409 00ff 255 <
> > > > ffff888106725d40 503581615 C Ci:5:002:0 0 34 = 22033100 35004300 31004500 35004500 33003100 36003500 42003900 42003300
> > > > ffff888106725d40 503581622 S Co:5:002:0 s 21 0a 0000 0000 0000 0
> > > > ffff888106725d40 503583615 C Co:5:002:0 0 0
> > > > ffff888106725d40 503583619 S Ci:5:002:0 s 81 06 2200 0000 004f 79 <
> > > > ffff888106725d40 503587625 C Ci:5:002:0 0 79 = 050c0901 a1011600 00260100 09e909ea 09e209cd 09b509b6 09b109b3 09b409cf
> > > > ffff888106725d40 503587756 S Ii:5:002:6 -115:32 64 <
> > > > ffff888106725c80 503644602 S Ci:5:002:0 s 80 06 0302 0409 00ff 255 <
> > > > ffff888106725c80 503646631 C Ci:5:002:0 0 34 = 22035300 6f007500 6e006400 20004200 6c006100 73007400 65007200 20004700
> > > > ffff888106725c80 503646635 S Ci:5:002:0 s 80 06 0301 0409 00ff 255 <
> > > > ffff888106725c80 503649624 C Ci:5:002:0 0 50 = 32034300 72006500 61007400 69007600 65002000 54006500 63006800 6e006f00
> > > 
> > > That part is normal also.  It shows a Set-Configuration request, HID
> > > Set-Idle and Get-Report-Descriptor requests, and a few Get-Descriptor
> > > requests for some strings.
> 
> This part is the same in the new usbmon trace.
> 
> > > > ffff888106725140 503649650 S Co:5:002:0 s 21 01 0100 2203 0001 1 = 01
> > > 
> > > I don't recognize this request.  It's probably a USB audio thing.  Its
> > > most notable aspect is that the device doesn't send a reply.  Maybe it
> > > gets confused?
> 
> This request is also the same.  But in the new usbmon trace, the device 
> sends a reply almost immediately (under 1 microsecond).
> 
> So there's no difference in the data being sent back and forth on the 
> two systems. The difference must lie somewhere else, and available power 
> is a likely candidate.
I finally bought a powered hub, plugged it into the same USB port and
plugged the audio device into the hub. From what I can tell, the device
was recognized quickly and seems to work. So, I guess you were probably
right about insufficient power being an issue. This is pretty annoying
because this motherboard is not exactly a budget model.
Now, there are a ton of errors in the kernel log for the hub itself (see
attachment), but that might be because it has seven ports and only one
is in use?

In any case, the mystery seems to be solved. Thank you very much for
your time and support!

> 
> If you decide that you don't want to pursue this any farther because
> it evidently isn't caused by a software bug, let us know.
> 
> Alan Stern
> 

Best regards,

Andreas Kempf

--tZAmPlNxn7rZAmmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=dmesg_usb

Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: new high-speed USB device number 12 using xhci_hcd
Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: New USB device found, idVendor=2109, idProduct=2822, bcdDevice= 8.b4
Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: Product: USB2.0 Hub             
Nov 21 18:49:15 ryzen7700x kernel: usb 5-4: Manufacturer: VIA Labs, Inc.         
Nov 21 18:49:16 ryzen7700x kernel: hub 5-4:1.0: USB hub found
Nov 21 18:49:16 ryzen7700x kernel: hub 5-4:1.0: 4 ports detected
Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: device not accepting address 125, error -71
Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:16 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:17 ryzen7700x kernel: usb 6-4: device not accepting address 126, error -71
Nov 21 18:49:17 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:17 ryzen7700x kernel: usb 5-4.4: new high-speed USB device number 13 using xhci_hcd
Nov 21 18:49:17 ryzen7700x kernel: usb 5-4.4: New USB device found, idVendor=0bda, idProduct=5411, bcdDevice= 0.04
Nov 21 18:49:17 ryzen7700x kernel: usb 5-4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Nov 21 18:49:17 ryzen7700x kernel: usb 5-4.4: Product: USB2.1 Hub
Nov 21 18:49:17 ryzen7700x kernel: usb 5-4.4: Manufacturer: Generic
Nov 21 18:49:17 ryzen7700x kernel: hub 5-4.4:1.0: USB hub found
Nov 21 18:49:17 ryzen7700x kernel: hub 5-4.4:1.0: 4 ports detected
Nov 21 18:49:17 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:17 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:17 ryzen7700x kernel: usb 6-4: device not accepting address 127, error -71
Nov 21 18:49:18 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:18 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:18 ryzen7700x kernel: usb 6-4: device not accepting address 2, error -71
Nov 21 18:49:18 ryzen7700x kernel: usb usb6-port4: unable to enumerate USB device
Nov 21 18:49:18 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:19 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:19 ryzen7700x kernel: usb 6-4: device not accepting address 3, error -71
Nov 21 18:49:19 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:19 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:20 ryzen7700x kernel: usb 6-4: device not accepting address 4, error -71
Nov 21 18:49:20 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: new high-speed USB device number 14 using xhci_hcd
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: config 1 interface 2 altsetting 0 bulk endpoint 0x82 has invalid maxpacket 256
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: New USB device found, idVendor=041e, idProduct=3267, bcdDevice=10.40
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=9
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: Product: Sound Blaster G3
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: Manufacturer: Creative Technology Ltd
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: SerialNumber: 15C1E5E3165B9B3D
Nov 21 18:49:20 ryzen7700x kernel: input: Creative Technology Ltd Sound Blaster G3 as /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:17:00.0/usb5/5-4/5-4.4/5-4.4.4/5-4.4.4:1.0/0003:041E:3267.000D/input/input35
Nov 21 18:49:20 ryzen7700x kernel: hid-generic 0003:041E:3267.000D: input,hidraw6: USB HID v1.10 Device [Creative Technology Ltd Sound Blaster G3] on usb-0000:17:00.0-4.4.4/input0
Nov 21 18:49:20 ryzen7700x kernel: cdc_acm 5-4.4.4:1.1: ttyACM0: USB ACM device
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: uac_clock_source_is_valid(): cannot get clock validity for id 33
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: clock source 33 is not valid, cannot use
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: uac_clock_source_is_valid(): cannot get clock validity for id 33
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: clock source 33 is not valid, cannot use
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: uac_clock_source_is_valid(): cannot get clock validity for id 37
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: clock source 37 is not valid, cannot use
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: uac_clock_source_is_valid(): cannot get clock validity for id 37
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: clock source 37 is not valid, cannot use
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: uac_clock_source_is_valid(): cannot get clock validity for id 35
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: clock source 35 is not valid, cannot use
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: parse_audio_format_rates_v2v3(): unable to find clock source (clock -71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: uac_clock_source_is_valid(): cannot get clock validity for id 35
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: clock source 35 is not valid, cannot use
Nov 21 18:49:20 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 12:3: failed to get current value for ch 0 (-71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 12:3: cannot get min/max values for control 2 (id 12)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 13:3: failed to get current value for ch 0 (-71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 13:3: cannot get min/max values for control 2 (id 13)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 11:3: failed to get current value for ch 0 (-71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 11:3: cannot get min/max values for control 2 (id 11)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 1:3: failed to get current value for ch 0 (-71)
Nov 21 18:49:20 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 1:3: cannot get min/max values for control 2 (id 1)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 14:3: failed to get current value for ch 0 (-71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 14:3: cannot get min/max values for control 2 (id 14)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 2:3: failed to get current value for ch 0 (-71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 2:3: cannot get min/max values for control 2 (id 2)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 23:3: failed to get current value for ch 0 (-71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 23:3: cannot get min/max values for control 2 (id 23)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 25:3: failed to get current value for ch 0 (-71)
Nov 21 18:49:20 ryzen7700x kernel: usb 6-4: device not accepting address 5, error -71
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 25:3: cannot get min/max values for control 2 (id 25)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 8:3: failed to get current value for ch 0 (-71)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: 8:3: cannot get min/max values for control 2 (id 8)
Nov 21 18:49:20 ryzen7700x kernel: usb 5-4.4.4: USB disconnect, device number 14
Nov 21 18:49:21 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:21 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:21 ryzen7700x kernel: usb 6-4: device not accepting address 6, error -71
Nov 21 18:49:21 ryzen7700x kernel: usb usb6-port4: unable to enumerate USB device
Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: new high-speed USB device number 15 using xhci_hcd
Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: config 1 interface 2 altsetting 0 bulk endpoint 0x82 has invalid maxpacket 256
Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: New USB device found, idVendor=041e, idProduct=3267, bcdDevice=10.40
Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=9
Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: Product: Sound Blaster G3
Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: Manufacturer: Creative Technology Ltd
Nov 21 18:49:21 ryzen7700x kernel: usb 5-4.4.4: SerialNumber: 15C1E5E3165B9B3D
Nov 21 18:49:21 ryzen7700x kernel: input: Creative Technology Ltd Sound Blaster G3 as /devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:17:00.0/usb5/5-4/5-4.4/5-4.4.4/5-4.4.4:1.0/0003:041E:3267.000E/input/input36
Nov 21 18:49:21 ryzen7700x kernel: hid-generic 0003:041E:3267.000E: input,hidraw6: USB HID v1.10 Device [Creative Technology Ltd Sound Blaster G3] on usb-0000:17:00.0-4.4.4/input0
Nov 21 18:49:21 ryzen7700x kernel: cdc_acm 5-4.4.4:1.1: ttyACM0: USB ACM device
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [12] FU [SPDIF In Playback Volume] ch = 1, val = -20493/0/24
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=1120), cval->res is probably wrong.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [13] FU [Microphone Playback Volume] ch = 1, val = -24576/2304/24
Nov 21 18:49:22 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=1120), cval->res is probably wrong.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [11] FU [Aux In Playback Volume] ch = 1, val = -24576/2304/24
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [1] FU [Speaker Playback Volume] ch = 1, val = -20493/0/24
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [14] FU [Headset Playback Volume] ch = 1, val = -20493/0/24
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=1120), cval->res is probably wrong.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [2] FU [Microphone Capture Volume] ch = 1, val = -24576/2304/24
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [23] FU [What U Hear Capture Volume] ch = 1, val = -20493/0/24
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=1120), cval->res is probably wrong.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [25] FU [Aux In Capture Volume] ch = 1, val = -24576/2304/24
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: Warning! Unlikely big volume range (=853), cval->res is probably wrong.
Nov 21 18:49:22 ryzen7700x kernel: usb 5-4.4.4: [8] FU [SPDIF In Capture Volume] ch = 1, val = -20493/0/24
Nov 21 18:49:22 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:22 ryzen7700x kernel: usb 6-4: device not accepting address 7, error -71
Nov 21 18:49:22 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:23 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:23 ryzen7700x kernel: usb 6-4: device not accepting address 8, error -71
Nov 21 18:49:23 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:23 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:23 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:24 ryzen7700x kernel: usb 6-4: device not accepting address 9, error -71
Nov 21 18:49:24 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:24 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:24 ryzen7700x kernel: usb 6-4: device not accepting address 10, error -71
Nov 21 18:49:24 ryzen7700x kernel: usb usb6-port4: unable to enumerate USB device
Nov 21 18:49:25 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:25 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:25 ryzen7700x kernel: usb 6-4: device not accepting address 11, error -71
Nov 21 18:49:25 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:26 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:26 ryzen7700x kernel: usb 6-4: device not accepting address 12, error -71
Nov 21 18:49:26 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:26 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:26 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:27 ryzen7700x kernel: usb 6-4: device not accepting address 13, error -71
Nov 21 18:49:27 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:27 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:27 ryzen7700x kernel: usb 6-4: device not accepting address 14, error -71
Nov 21 18:49:27 ryzen7700x kernel: usb usb6-port4: unable to enumerate USB device
Nov 21 18:49:28 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:29 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:29 ryzen7700x kernel: usb 6-4: device not accepting address 15, error -71
Nov 21 18:49:29 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:29 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:29 ryzen7700x kernel: usb 6-4: device not accepting address 16, error -71
Nov 21 18:49:29 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:30 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:30 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:30 ryzen7700x kernel: usb 6-4: device not accepting address 17, error -71
Nov 21 18:49:31 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:31 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:31 ryzen7700x kernel: usb 6-4: device not accepting address 18, error -71
Nov 21 18:49:31 ryzen7700x kernel: usb usb6-port4: unable to enumerate USB device
Nov 21 18:49:32 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:32 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:32 ryzen7700x kernel: usb 6-4: device not accepting address 19, error -71
Nov 21 18:49:33 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:33 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:33 ryzen7700x kernel: usb 6-4: device not accepting address 20, error -71
Nov 21 18:49:33 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:33 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:34 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:34 ryzen7700x kernel: usb 6-4: device not accepting address 21, error -71
Nov 21 18:49:34 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:34 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:34 ryzen7700x kernel: usb 6-4: device not accepting address 22, error -71
Nov 21 18:49:34 ryzen7700x kernel: usb usb6-port4: unable to enumerate USB device
Nov 21 18:49:35 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:35 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:36 ryzen7700x kernel: usb 6-4: device not accepting address 23, error -71
Nov 21 18:49:36 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:36 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:36 ryzen7700x kernel: usb 6-4: device not accepting address 24, error -71
Nov 21 18:49:36 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:37 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:37 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:37 ryzen7700x kernel: usb 6-4: device not accepting address 25, error -71
Nov 21 18:49:37 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:38 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:38 ryzen7700x kernel: usb 6-4: device not accepting address 26, error -71
Nov 21 18:49:38 ryzen7700x kernel: usb usb6-port4: unable to enumerate USB device
Nov 21 18:49:40 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:40 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:40 ryzen7700x kernel: usb 6-4: device not accepting address 27, error -71
Nov 21 18:49:41 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:41 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:41 ryzen7700x kernel: usb 6-4: device not accepting address 28, error -71
Nov 21 18:49:41 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:41 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:42 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:42 ryzen7700x kernel: usb 6-4: device not accepting address 29, error -71
Nov 21 18:49:42 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:42 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:42 ryzen7700x kernel: usb 6-4: device not accepting address 30, error -71
Nov 21 18:49:42 ryzen7700x kernel: usb usb6-port4: unable to enumerate USB device
Nov 21 18:49:44 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:44 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:44 ryzen7700x kernel: usb 6-4: device not accepting address 31, error -71
Nov 21 18:49:44 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:45 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:45 ryzen7700x kernel: usb 6-4: device not accepting address 32, error -71
Nov 21 18:49:45 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:45 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:45 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:46 ryzen7700x kernel: usb 6-4: device not accepting address 33, error -71
Nov 21 18:49:46 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:46 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:46 ryzen7700x kernel: usb 6-4: device not accepting address 34, error -71
Nov 21 18:49:46 ryzen7700x kernel: usb usb6-port4: unable to enumerate USB device
Nov 21 18:49:48 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:48 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:48 ryzen7700x kernel: usb 6-4: device not accepting address 35, error -71
Nov 21 18:49:48 ryzen7700x kernel: usb 6-4: new SuperSpeed USB device number 36 using xhci_hcd
Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: New USB device found, idVendor=2109, idProduct=0822, bcdDevice= 8.b4
Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: Product: USB3.1 Hub             
Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: Manufacturer: VIA Labs, Inc.         
Nov 21 18:49:49 ryzen7700x kernel: hub 6-4:1.0: USB hub found
Nov 21 18:49:49 ryzen7700x kernel: hub 6-4:1.0: 4 ports detected
Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: USB disconnect, device number 36
Nov 21 18:49:49 ryzen7700x kernel: usb 6-4: Failed to suspend device, error -19
Nov 21 18:49:50 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:50 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:50 ryzen7700x kernel: usb 6-4: device not accepting address 37, error -71
Nov 21 18:49:50 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:51 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:51 ryzen7700x kernel: usb 6-4: device not accepting address 38, error -71
Nov 21 18:49:51 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:49:51 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:52 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:52 ryzen7700x kernel: usb 6-4: device not accepting address 39, error -71
Nov 21 18:49:52 ryzen7700x kernel: usb 6-4: new SuperSpeed USB device number 40 using xhci_hcd
Nov 21 18:49:52 ryzen7700x kernel: usb 6-4: New USB device found, idVendor=2109, idProduct=0822, bcdDevice= 8.b4
Nov 21 18:49:52 ryzen7700x kernel: usb 6-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Nov 21 18:49:52 ryzen7700x kernel: usb 6-4: Product: USB3.1 Hub             
Nov 21 18:49:52 ryzen7700x kernel: usb 6-4: Manufacturer: VIA Labs, Inc.         
Nov 21 18:49:52 ryzen7700x kernel: hub 6-4:1.0: USB hub found
Nov 21 18:49:52 ryzen7700x kernel: hub 6-4:1.0: 4 ports detected
Nov 21 18:49:57 ryzen7700x kernel: hub 6-4:1.0: set hub depth failed
Nov 21 18:49:57 ryzen7700x kernel: usb 6-4: USB disconnect, device number 40
Nov 21 18:49:58 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:58 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:49:58 ryzen7700x kernel: usb 6-4: device not accepting address 41, error -71
Nov 21 18:49:59 ryzen7700x kernel: usb 6-4: new SuperSpeed USB device number 42 using xhci_hcd
Nov 21 18:49:59 ryzen7700x kernel: usb 6-4: New USB device found, idVendor=2109, idProduct=0822, bcdDevice= 8.b4
Nov 21 18:49:59 ryzen7700x kernel: usb 6-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Nov 21 18:49:59 ryzen7700x kernel: usb 6-4: Product: USB3.1 Hub             
Nov 21 18:49:59 ryzen7700x kernel: usb 6-4: Manufacturer: VIA Labs, Inc.         
Nov 21 18:49:59 ryzen7700x kernel: hub 6-4:1.0: USB hub found
Nov 21 18:49:59 ryzen7700x kernel: hub 6-4:1.0: 4 ports detected
Nov 21 18:50:04 ryzen7700x kernel: hub 6-4:1.0: set hub depth failed
Nov 21 18:50:04 ryzen7700x kernel: usb 6-4: USB disconnect, device number 42
Nov 21 18:50:04 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:50:05 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:50:05 ryzen7700x kernel: usb 6-4: device not accepting address 43, error -71
Nov 21 18:50:05 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:50:05 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:50:05 ryzen7700x kernel: usb 6-4: device not accepting address 44, error -71
Nov 21 18:50:05 ryzen7700x kernel: usb usb6-port4: attempt power cycle
Nov 21 18:50:07 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:50:07 ryzen7700x kernel: usb 6-4: Device not responding to setup address.
Nov 21 18:50:07 ryzen7700x kernel: usb 6-4: device not accepting address 45, error -71
Nov 21 18:50:07 ryzen7700x kernel: usb 6-4: new SuperSpeed USB device number 46 using xhci_hcd
Nov 21 18:50:07 ryzen7700x kernel: usb 6-4: New USB device found, idVendor=2109, idProduct=0822, bcdDevice= 8.b4
Nov 21 18:50:07 ryzen7700x kernel: usb 6-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Nov 21 18:50:07 ryzen7700x kernel: usb 6-4: Product: USB3.1 Hub             
Nov 21 18:50:07 ryzen7700x kernel: usb 6-4: Manufacturer: VIA Labs, Inc.         
Nov 21 18:50:07 ryzen7700x kernel: hub 6-4:1.0: USB hub found
Nov 21 18:50:07 ryzen7700x kernel: hub 6-4:1.0: 4 ports detected

--tZAmPlNxn7rZAmmh--

