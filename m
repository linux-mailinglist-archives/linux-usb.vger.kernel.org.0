Return-Path: <linux-usb+bounces-32334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE39D1F983
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 16:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 374813093B03
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 14:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57382522A1;
	Wed, 14 Jan 2026 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="GW4YKCSL"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6E92F90E0
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768402779; cv=none; b=CaT+5v5s17iADONTj356WVH9IJdBwbIMRU8q3B4emAbpFEEyuG3B8Ho0kwnXYShLAmuyZiA5V/1u8QrKtqKFeOdBspPS/Ufu8LnEgQoqPHnjUPJhD6LAAeWuokSt6L1V4Ih1jVrsz/BjkfRew0cRhHStckDzkIUOmf0tK8eBPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768402779; c=relaxed/simple;
	bh=78Z8Rlr5J7ybqESg0Jaxeg2NEeACwiHDcXQfoR4FqSo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XLeQV5ygtE2L2Bk+kN5VYUe0T5BuffL2N3ns+VzeonzGAy/+tdldh/K+jj38xgTo95q/ksJjO7JTUYck0nNn2Sn31Gfbcn7SIBvHgViENDerNyqM/OsmBwaOnIo3kDz++egIUiIQ8FbR4UPsR9CNtf0r8dzjSmDH2DAEyhbV7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=GW4YKCSL; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768402771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FIMxu/hWbq7bQWtXRRovePTYLW/ZHcdUA2i84ufAmXs=;
	b=GW4YKCSLMT8n/AvWcyi681ac7w29jlRS3SzlqlbSk3ocdEyVQxwVvlAvTO71R3I2Oeq0Pv
	5zrKZoewevadqxDleVkPZ0d3xZaZu/mauyfC+cLKVWejzpQQeujvisJsPsrtWkrrNOdRIN
	tzZDrKYg06HisSBpZboYB4PI0bjU1WWYl5DavmmTq2ISNcRIKGXDTla0aR46PFTnAcjH/K
	Gsu2ztqHErDhBGpD65mg+BXmGFHS34rLaaWJozC/xOr/d6ubILRaYO4cUpJm8YSXjSwB9G
	UgKg08lIIfEQOXVPac/RTV/7wA7UoIR3EagJl8wz9scLDONmzNg9KqXEzJJUOg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 15:59:28 +0100
Message-Id: <DFOEGOTI1AQ9.175GP7V1VK1XU@cknow-tech.com>
Cc: "USB mailing list" <linux-usb@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Alan Stern" <stern@rowland.harvard.edu>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
 <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
 <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>
 <b9041d32-1eab-4428-ab2b-769daefdbdcd@rowland.harvard.edu>
 <DFNRUF2LUPH4.1493G2SYERZ7Q@cknow-tech.com>
 <b108b747-cc7c-4537-b9bc-b0862bac71ff@rowland.harvard.edu>
In-Reply-To: <b108b747-cc7c-4537-b9bc-b0862bac71ff@rowland.harvard.edu>
X-Migadu-Flow: FLOW_OUT

On Wed Jan 14, 2026 at 4:20 AM CET, Alan Stern wrote:
> On Tue, Jan 13, 2026 at 10:15:59PM +0100, Diederik de Haas wrote:
>> I'm now wondering if there's something wrong with the Quartz64-A ...
>> I already thought that it took way too long before I got a login prompt.
>>=20
>> In my first attempt I noticed I did NOT have the "Warning! ehci_hcd
>> should always be loaded before uhci_hcd and ohci_hcd, not after"
>> It took so long I forgot to keep counting, but most of all I forgot the
>> dynamic debug command, so I tried again ...

I know it didn't result in the requested dmesg log, but isn't it
significant I had the problem *without* the warning? IOW: the connection
(correlation or causation) I thought there was, (possibly) isn't there?
=20
>> This time I did the dynamic debug command and the above "Warning!" was
>> present. Plugged in the keyboard adapter, started a stopwatch on my
>> phone and monitored the ``dmesg -W`` for any changes ...
>>=20
>> It took slightly more then a MINUTE for anything to appear in dmesg :-O
>>=20
>> ```
>> root@quartz64a:~# dmesg -W
>> [  357.343890] usb usb4: usb wakeup-resume
>> [  357.343970] usb usb4: usb auto-resume
>> [  357.344023] hub 4-0:1.0: hub_resume
>> [  357.344243] usb usb4-port1: status 0501 change 0001
>> [  357.446845] hub 4-0:1.0: state 7 ports 1 chg 0002 evt 0000
>> [  357.447094] usb usb4-port1: status 0501, change 0000, 480 Mb/s
>
> That's the EHCI controller detecting the new connection.  If this took=20
> more than a minute to happen then something is wrong with the EHCI=20
> controller or its associated hardware.  Or possibly with the way the=20
> computer handles wakeup signals.

This was with a 6.19-rc5 based kernel (with mostly media patches added
on top) and on a Rock64 (rk3328) I got a whole bunch of these warnings:

WARNING: drivers/gpio/gpiolib.c:3523 at gpiod_get_value+0x64/0x98, CPU#0: s=
wapper/0/0

log of a few of them:
https://paste.sr.ht/~diederik/154c5023a3a50d77f1da2195e7bb9a96f6a88555

and I suspect (but don't KNOW!) this commit is relevant:
20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleeping")

So I'll switch to a 6.19-rc4 based kernel, which is mostly the same,
but doesn't have that commit.

FWIW: I'd expect to see sth in dmesg within a second of me plugging sth
in, so I was surprised by you calling '30 secs' a short period.

I'll re-do the test and the addional tests you requested, but right now
I need to focus on some other things, so may take a few days.

Cheers,
  Diederik

>> [  357.510889] hub 4-0:1.0: port_wait_reset: err =3D -16
>> [  357.510909] usb usb2: usb wakeup-resume
>> [  357.510956] usb usb4-port1: not enabled, trying reset again...
>> [  357.510980] usb usb2: usb auto-resume
>> [  357.586708] hub 2-0:1.0: hub_resume
>> [  357.586936] usb usb2-port1: status 0101 change 0001
>> [  357.690841] hub 2-0:1.0: state 7 ports 1 chg 0002 evt 0000
>> [  357.691090] usb usb2-port1: status 0101, change 0000, 12 Mb/s
>> [  357.714843] usb usb4-port1: not reset yet, waiting 200ms
>> [  357.874717] usb 2-1: new full-speed USB device number 2 using ohci-pl=
atform
>
> This usb2 stuff is the OHCI controller reacting to the new connection,=20
> after the connection was switched from the EHCI controller to OHCI.
>
>> [  357.918838] usb usb4-port1: not reset yet, waiting 200ms
>
> These messages aren't supposed to occur.  The EHCI controller is=20
> supposed to realize that there is no device connected to it any more,=20
> now that the connection has been switched over to the OHCI controller.
>
>> [  358.082679] usb 2-1: ep0 maxpacket =3D 32
>> [  358.087855] usb 2-1: skipped 1 descriptor after interface
>> [  358.087926] usb 2-1: skipped 1 descriptor after interface
>> [  358.089798] usb 2-1: default language 0x0409
>> [  358.093839] usb 2-1: udev 2, busnum 2, minor =3D 129
>> [  358.093904] usb 2-1: New USB device found, idVendor=3D1997, idProduct=
=3D2433, bcdDevice=3D 1.06
>> [  358.094803] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
>> [  358.095481] usb 2-1: Product: mini keyboard
>> [  358.095889] usb 2-1: Manufacturer:
>> [  358.097629] usb 2-1: usb_probe_device
>> [  358.097691] usb 2-1: configuration #1 chosen from 1 choice
>> [  358.099335] usb 2-1: adding 2-1:1.0 (config #1, interface 0)
>> [  358.100603] usb 2-1: adding 2-1:1.1 (config #1, interface 1)
>> [  358.101371] hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0002
>> [  358.126129] usb usb4-port1: not reset yet, waiting 200ms
>> [  358.203797] hid: raw HID events driver (C) Jiri Kosina
>> [  358.227055] usbhid 2-1:1.0: usb_probe_interface
>> [  358.227080] usbhid 2-1:1.0: usb_probe_interface - got id
>> [  358.231307] usbhid 2-1:1.1: usb_probe_interface
>> [  358.231331] usbhid 2-1:1.1: usb_probe_interface - got id
>> [  358.236333] usbcore: registered new interface driver usbhid
>> [  358.236850] usbhid: USB HID core driver
>> [  358.267050] input:   mini keyboard as /devices/platform/fd8c0000.usb/=
usb2/2-1/2-1:1.0/0003:1997:2433.0001/input/input2
>> [  358.326722] usb usb4-port1: not reset yet, waiting 200ms
>> [  358.326992] hub 4-0:1.0: state 7 ports 1 chg 0000 evt 0002
>> [  358.327125] usb usb4-port1: status 0100, change 0001, 12 Mb/s
>
> And here is where the EHCI controller finally reported that nothing was=
=20
> connected.
>
> It certainly looks like the EHCI controller isn't working right.  Just=20
> as a test, you can try unloading the ehci-hcd module, together with any=
=20
> modules depending on it, before you plug in the keyboard adapter.  It=20
> would be interesting to see if that makes any difference.
>
> Another thing to try is to see if disabling EHCI runtime suspend changes=
=20
> anything.  To do this, don't remove any modules.  Instead, before=20
> plugging in the keyboard adapter, do:
>
> 	echo on >/sys/bus/usb/devices/usb4/power/control
>
> Alan Stern
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


