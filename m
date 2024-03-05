Return-Path: <linux-usb+bounces-7550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03979872287
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 16:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 355921C216D1
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 15:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0270B1272A8;
	Tue,  5 Mar 2024 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xd+RLHP8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80923126F11
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709651866; cv=none; b=bdONbNBTbR+niC2a5OiXmhwJrPw6yAUj0qB3Vfw2CXM/JKMzNYtb63IphJPXgZ1S5myUE6GG0VwQSQ3q2PAg4DSxpuBdkYlwZ9OzvwPdM1/bbpNbJiRbTdXzS2eCtauuMrnHn2+Z8DXy56r/28Xau1b9jL/jjRbXrBkMqGeY8dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709651866; c=relaxed/simple;
	bh=IpbO9r4iYjiAkuYkmFPgdHhsccL3pjk3CctMn8K3YW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sg0ksEh3DQBQ+/Jv6NeciNH4jhXaYHjEL72ZF4GW7bS307gEnt64RSH5x8QNcldlAz93Oj6/t0+7FqvhvXROGWC6q8TdGHG6SnuA1683HN8lLRU5SwANUzBZ6wjk8JHgsXoBYfXoSPrdS74flWNBympedy8L+wJzp/uPgob6xDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xd+RLHP8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56005C433C7;
	Tue,  5 Mar 2024 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709651866;
	bh=IpbO9r4iYjiAkuYkmFPgdHhsccL3pjk3CctMn8K3YW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xd+RLHP8+gKHHdsRqccLHG4W1R4L/BGznEg6/9XRr987UmXM/WzBAz48gIv8gDfM5
	 rLDb9LNb2XexoqL6NJZs0Qu9upqDCwsIDdNG6pdF6oWa5PXGMx0T+g+wVkgO+4QPoB
	 N13yg5MVUc5MMWtjEYgQ6RP3fTalTnPlGGaLDIRIkPvCUEE33aAqmR0yN3FkKT+m3j
	 CbLU/XK9YudRNnLxc6oqPHrh6sr4t2FJVtf3asyVpnvy8IP7Bth46AO/Ia46syDXA9
	 867XB7sztegO0GigslMXl831tcNFsvRk7Ylm37MZsnJSp+WCp8nAUabesmY6GXYSlY
	 sLaxNHymX+A2g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rhWYE-000000000X9-03a4;
	Tue, 05 Mar 2024 16:17:54 +0100
Date: Tue, 5 Mar 2024 16:17:54 +0100
From: Johan Hovold <johan@kernel.org>
To: Mike Miller <u492758@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Tell linux-usb@vger.kernel.org to add your device to a proper
 driver
Message-ID: <Zec3oiuao-jnN09x@hovoldconsulting.com>
References: <b133097f-0793-47bb-953f-4c31a721a5c6@gmail.com>
 <ZeWgs0ZClpCwE5lT@hovoldconsulting.com>
 <d7e18ecb-a239-4dfd-8df2-c0df89997b98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7e18ecb-a239-4dfd-8df2-c0df89997b98@gmail.com>

On Tue, Mar 05, 2024 at 09:50:09PM +0800, Mike Miller wrote:

> Since sending you the email, a couple of things I have also noticed.
> 
> 1. If I run the Audrino IDE (on windows), I have to plug in the device 
> after I initiate the upload of the script (it actally tells me to do it).
> 
> 2. I have to use a specific cable (1 of 3 I have tried).
> 
> 3. It doesnt create the ACM0 device I was expecting and ttyS0 doesnt 
> work (not ttys4, which are the only 2 options).

The generic USB serial driver, which you tried to use and which printed
the message about reporting this upstream, would have created a ttyUSB0
character device if it worked.

But as I mentioned below, and as is clear from the lsusb output you
posted, the device in question does not have any bulk endpoints, which
the USB serial driver requires.

I don't know how this device is expected to work, but it does not look
like a serial device in its current (default) configuration. Perhaps it
needs to be reconfigured before you can use it somehow.

> Anyway, to your particular request, with the "right" cable, the lsusb -v 
> output is

> Bus 001 Device 022: ID 16d0:0753 MCS Digistump DigiSpark
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               1.10
>    bDeviceClass          255 Vendor Specific Class
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0         8
>    idVendor           0x16d0 MCS
>    idProduct          0x0753 Digistump DigiSpark
>    bcdDevice            2.02
>    iManufacturer           0
>    iProduct                0
>    iSerial                 0
>    bNumConfigurations      1
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
>      wTotalLength       0x0012
>      bNumInterfaces          1
>      bConfigurationValue     1
>      iConfiguration          0
>      bmAttributes         0x80
>        (Bus Powered)
>      MaxPower              100mA
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           0
>        bInterfaceClass         0
>        bInterfaceSubClass      0
>        bInterfaceProtocol      0
>        iInterface              0
> Device Status:     0x0067
>    Self Powered
>    Remote Wakeup Enabled
>    Test Mode
>    Debug Mode

> On 4/3/24 18:21, Johan Hovold wrote:
> > On Wed, Feb 07, 2024 at 08:48:12PM +0800, Mike Miller wrote:
 
> >> I am struggling to get a cheap arse Chinese knock-off Arduino Nano
> >> working on my
> >>
> >> Linux MyLinux 6.5.0-15-generic #15~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC
> >> Fri Jan 12 18:54:30 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
> >>
> >> and I get the message
> >>
> >> [ 2840.099780] usb 2-1.2: new low-speed USB device number 8 using ehci-pci
> >> [ 2840.210523] usb 2-1.2: New USB device found, idVendor=16d0,
> >> idProduct=0753, bcdDevice= 2.02
> >> [ 2840.210537] usb 2-1.2: New USB device strings: Mfr=0, Product=0,
> >> SerialNumber=0
> >> [ 2840.211335] usbserial_generic 2-1.2:1.0: The "generic" usb-serial
> >> driver is only for testing and one-off prototypes.
> >> [ 2840.211338] usbserial_generic 2-1.2:1.0: Tell
> >> linux-usb@vger.kernel.org to add your device to a proper driver.
> >> [ 2840.211340] usbserial_generic 2-1.2:1.0: device has no bulk endpoints

> > Hmm. Without bulk endpoints you shouldn't be able to actually use the
> > device with the generic driver.

Johan

