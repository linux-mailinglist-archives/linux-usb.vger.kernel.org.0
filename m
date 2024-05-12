Return-Path: <linux-usb+bounces-10243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C928C36CB
	for <lists+linux-usb@lfdr.de>; Sun, 12 May 2024 16:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00354B21666
	for <lists+linux-usb@lfdr.de>; Sun, 12 May 2024 14:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4F929414;
	Sun, 12 May 2024 14:20:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id DCCB223748
	for <linux-usb@vger.kernel.org>; Sun, 12 May 2024 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715523619; cv=none; b=MduefX5ZtlEaNUDh/5RGG0YcZTVyAQ66emIgex3KT84VPPpM6HCrI8Hja5D1mfVVkB6R+GlQNy2cklU8PV+JvjOys+kE49pcSuD9bteoQJIq3OM3y7xFX7f2uCPNoeFkr/mXNdn0zteJZuye6Dap0uwf45l/qqucSS5zkPDVPuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715523619; c=relaxed/simple;
	bh=a0A8pwD9ZmoCiCoZbcWzgTRwXaXeHu8CSQz49Daf0k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hq8Gf4GF3zEw6zCDeeukKgmfCfGyJIMSCXtMF1kmWjSvXukIov3CmMbX3UZKjHsqbqhe+B3WCaB21Am5vEQZKSqcNdUtbCpfvd7i1ny85dHNDM+3OXFj0COO1qC43h9wrHt8fAnc6OFHkKS5zmRdwo3CBxO/y7C/z9efO+6+yI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 111570 invoked by uid 1000); 12 May 2024 10:13:33 -0400
Date: Sun, 12 May 2024 10:13:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ethin Probst <ethindp@pm.me>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Assistance getting the Universal Audio Apollo Solo USB to work
 with Linux
Message-ID: <ab4d0394-0d71-45a7-a79b-02e3c90f8ac8@rowland.harvard.edu>
References: <DJiA8anOC3V1gHoj0H-8pmsXujLNu7IlZvNmvUEoDfnjC5VIzZ3YsoTgnUD-zVTsnhgln5BzEsy1n4YkoqkEd_pvTF9oZaukzUoyL-pDfRs=@pm.me>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJiA8anOC3V1gHoj0H-8pmsXujLNu7IlZvNmvUEoDfnjC5VIzZ3YsoTgnUD-zVTsnhgln5BzEsy1n4YkoqkEd_pvTF9oZaukzUoyL-pDfRs=@pm.me>

On Sat, May 11, 2024 at 08:07:33PM +0000, Ethin Probst wrote:
> Hi everyone,

Please have your mail program wrap lines after 72 columns or so for this 
mailing list.

> I recently acquired a Universal Audio Apollo Solo USB audio interface 
> and am curious about getting it to work with Linux. There are no 
> official drivers, but I'm hoping that we can at least get the audio 
> interface part of it working. The Apollo Solo is a professional audio 
> audio interface with an onboard DSP engine and audio interface. It 
> doesn't quite conform to the UAC, but it does present 
> input/output/clock source terminals via audio class descriptors. Or, 
> rather, it does... On Windows, anyway.
> 
> And this is where everything gets confusing, so I hope I'm explaining 
> everything properly.
> 
> When the device is plugged into a machine that doesn't have Universal 
> Audio's special drivers installed, it presents itself as a Cypress 
> WestBridge, vendor ID 2b5a and product ID 000c. However, when the 
> drivers are installed, the drivers do something I'm struggling to 
> identify to "boot" the device and many things change. When it's in 
> it's "special boot mode" (or whatever you'd like to call it) it runs 
> at USB 2.0 speeds and presents a significantly different device 
> descriptor:
> 
>     bLength: 18
>     bDescriptorType: 0x01 (DEVICE)
>     bcdUSB: 0x0200
>     bDeviceClass: Device (0x00)
>     bDeviceSubClass: 0
>     bDeviceProtocol: 0 (Use class code info from Interface Descriptors)
>     bMaxPacketSize0: 64
>     idVendor: Unknown (0x2b5a)
>     idProduct: Unknown (0x000c)
>     bcdDevice: 0x0100
>     iManufacturer: 1
>     iProduct: 2
>     iSerialNumber: 3
>     bNumConfigurations: 1
> 
> However, when it's booted, the device descriptor is:
> 
>     bLength: 18
>     bDescriptorType: 0x01 (DEVICE)
>     bcdUSB: 0x0320
>     bDeviceClass: Miscellaneous (0xef)
>     bDeviceSubClass: 2
>     bDeviceProtocol: 1 (Interface Association Descriptor)
>     bMaxPacketSize0: 9
>     idVendor: Unknown (0x2b5a)
>     idProduct: Unknown (0x000d)
>     bcdDevice: 0x0000
>     iManufacturer: 1
>     iProduct: 2
>     iSerialNumber: 3
>     bNumConfigurations: 1
> 
> Through careful analysis of the firmware (which ships with the drivers 
> and doesn't need us to dump it manually), I believe the onboard board 
> is a Cypress (now Infineon) EZ-USB 3.0 FX3, hence Linux identifying it 
> as a "Cypress WestBridge". The MCU is an ARM processor, though I am 
> not certain which ISA revision it uses.
> 
> When plugged in and in it's boot mode, Linux is able to extract the 
> first device descriptor above, but is unable to enumerate the device:
> 
> [   61.091703] usb 3-3: new high-speed USB device number 4 using xhci_hcd
> [   61.299491] usb 3-3: New USB device found, idVendor=2b5a, idProduct=000c, bcdDevice= 1.00
> [   61.299502] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [   61.299505] usb 3-3: Product: WestBridge 
> 
> [   61.299508] usb 3-3: Manufacturer: Cypress
> [   61.299510] usb 3-3: SerialNumber: 0000000004BE
> [   66.674005] usb usb2-port1: attempt power cycle
> [   75.107555] usb usb2-port1: unable to enumerate USB device
> 
> If I try to force-bind the driver, this of course fails:
> 
> [  220.383312] usbcore: registered new interface driver snd-usb-audio
> [  257.877076] usb 3-3: cannot find UAC_HEADER
> [  257.877401] snd-usb-audio: probe of 3-3:1.0 failed with error -22
> 
> However, when plugged in and I'm booted into Windows, and then I 
> reboot into Linux without powering off the device (such that it 
> remains in it's normal mode that Windows sets it up in), the 
> snd-usb-audio driver is able to enumerate the device but can't figure 
> out the sample rates:
> 
> [  100.447871] usb 2-1: reset SuperSpeed USB device number 2 using xhci_hcd
> [  100.464845] usb 2-1: LPM exit latency is zeroed, disabling LPM.
> [  100.467241] usb 2-1: parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates (clock 128)
> [  100.467444] usb 2-1: parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates (clock 128)
> [  100.467798] usb 2-1: parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates (clock 128)
> [  100.468047] usb 2-1: parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates (clock 128)
> [  100.468249] usb 2-1: parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates (clock 128)
> 
> So, what I crucially couldn't figure out -- and what I still don't 
> precisely know -- is what Windows does that Linux does not which 
> causes the device to boot up and present itself appropriately as a USB 
> audio device, at least basically.

Most likely, Windows sends some firmware to the device (which it needs 
in order to run properly) and then restarts the device.

Alan Stern

