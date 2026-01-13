Return-Path: <linux-usb+bounces-32301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E7CD1B608
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 22:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 220C7305844B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 21:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556A3332EB3;
	Tue, 13 Jan 2026 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="LaGfwg6T"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14512F9984
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 21:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338966; cv=none; b=nUZ/UkcZwzphSQHehi+ehcUmmrgt4oJt+AInJ9An1PTVmj7TuUYlnL84Nq5diu/OYDB94WQhev2ssPqo3jYNuRmFYDQ75OE9406+MBfURkj4/CLxa7UYngAPt//7R/YnUurQh51XtrGeKPAk7ygI/Q2zmr+juDwg68cPA7QpKdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338966; c=relaxed/simple;
	bh=xwNP49waK/9UZ0Ivaj1yZ52k4OF4H9WPcJ4YvtZ/DkY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=N+/mM/3IX106pzNgwkRG+eZ34ZVRi89Iq1vaTPWfGSvU6LZgq/syjzSVQMoqvxhg8PQIod4aTwNOGu1uDF4lxcOd3pWVMvdqfcOlUZUfzPPsDjjMQv5nSY8Gv1mR+ecwvZDo4jUnrZPlktGm6r81h0NqTV8zaQ52b2c/h2PiWoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=LaGfwg6T; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768338961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3TmHyCor2thpq9gG/LBS3Ye9/5pOSFmT3vv7kpli5zY=;
	b=LaGfwg6T8HyNlC3F3NF3U+zWgcPCyqP3DxTssFpY19S1CoeXik/dmhS72geKQJcg5AE3UD
	ddjvk2CzGauLEGbhSxQ63xI2Q/Y9tVQdAjHUl4DAKSzzMZsDbrLDIxDQVCTtJxPKzC6510
	nGQLcxyftg4i1eE8jYIURopyi5gMaPVYXDsi6FOaR+SmAIuir1c5qjhbHkKfjDie395W+t
	9CIHIyR90cyijV4ngiNtpgNOc5sqUq1d53fAdl9/OgxNYpxBx2W1qqQeV5CX1sBKTfAmr/
	92Ud+zJytErsrRKQ9t2/w1VZQOh2BHXkPKcDXxd/JUwchFML9DxuACgGTNEclw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 22:15:59 +0100
Message-Id: <DFNRUF2LUPH4.1493G2SYERZ7Q@cknow-tech.com>
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Alan Stern" <stern@rowland.harvard.edu>
Cc: "USB mailing list" <linux-usb@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
 <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
 <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>
 <b9041d32-1eab-4428-ab2b-769daefdbdcd@rowland.harvard.edu>
In-Reply-To: <b9041d32-1eab-4428-ab2b-769daefdbdcd@rowland.harvard.edu>
X-Migadu-Flow: FLOW_OUT

On Tue Jan 13, 2026 at 5:22 PM CET, Alan Stern wrote:
> On Tue, Jan 13, 2026 at 05:16:05PM +0100, Diederik de Haas wrote:
>> On Tue Jan 13, 2026 at 4:47 PM CET, Alan Stern wrote:
>> > Is this repeatable?
>>=20
>> It doesn't happen every time, but it did actually happen another time.
>> After that test, I shutdown the device and unplugged the keyboard
>> adapter. Then I powered on the device and waited till it had completed
>> the boot process.
>> Logged in via SSH, retrieved my usual boot process data (what you saw in
>> my 'paste' starting with ``uname -a``) and then did ``dmesg -W``.
>>=20
>> Then I plugged in my keyboard adapter in the bottom port and noticed it
>> didn't work (straight away). This time I waited, pressed various keys on
>> my keyboard, turned the keyboard off and on again, pressed some more
>> keys ... and after ~20 (or 30?) seconds, my keyboard started to work.
>> When I then switched back to my SSH session, I saw dmesg had (then)
>> printed messages indicating it saw the adapter plugged in and ``lsusb``
>> did see the device.
>>=20
>> But that ~20 seconds is key here. Normally I would conclude that "it
>> doesn't work" after (say) >5 seconds of nothing happening.
>>=20
>> > If it is, try doing the following.  After a fresh boot, log in via SSH=
=20
>> > and turn on dynamic debugging for USB:
>> >
>> > 	echo module usbcore =3Dp >/sys/kernel/debug/dynamic_debug/control
>> >
>> > and clear the kernel's log buffer:
>> >
>> > 	dmesg -C
>> >
>> > Then plug the keyboard adapter into the non-working bottom USB2 port a=
nd=20
>> > wait a short time (say, 30 seconds).
>> >
>> > Then get a copy of the dmesg output and post it here.  Also, check to=
=20
>> > see whether the keyboard is working.  In fact, you should check the=20
>> > keyboard during that 30-second wait, so you will know just how long th=
e=20
>> > delay was before it started working.
>>=20
>> I'll try doing the SSH session via my laptop, which
>> hopefully allows timings to be closer (but likely still not precise).
>
> Exact timing isn't important.  An approximate number that can be=20
> compared with the log is what we want.

I'm now wondering if there's something wrong with the Quartz64-A ...
I already thought that it took way too long before I got a login prompt.

In my first attempt I noticed I did NOT have the "Warning! ehci_hcd
should always be loaded before uhci_hcd and ohci_hcd, not after"
It took so long I forgot to keep counting, but most of all I forgot the
dynamic debug command, so I tried again ...

This time I did the dynamic debug command and the above "Warning!" was
present. Plugged in the keyboard adapter, started a stopwatch on my
phone and monitored the ``dmesg -W`` for any changes ...

It took slightly more then a MINUTE for anything to appear in dmesg :-O

```
root@quartz64a:~# dmesg -W
[  357.343890] usb usb4: usb wakeup-resume
[  357.343970] usb usb4: usb auto-resume
[  357.344023] hub 4-0:1.0: hub_resume
[  357.344243] usb usb4-port1: status 0501 change 0001
[  357.446845] hub 4-0:1.0: state 7 ports 1 chg 0002 evt 0000
[  357.447094] usb usb4-port1: status 0501, change 0000, 480 Mb/s
[  357.510889] hub 4-0:1.0: port_wait_reset: err =3D -16
[  357.510909] usb usb2: usb wakeup-resume
[  357.510956] usb usb4-port1: not enabled, trying reset again...
[  357.510980] usb usb2: usb auto-resume
[  357.586708] hub 2-0:1.0: hub_resume
[  357.586936] usb usb2-port1: status 0101 change 0001
[  357.690841] hub 2-0:1.0: state 7 ports 1 chg 0002 evt 0000
[  357.691090] usb usb2-port1: status 0101, change 0000, 12 Mb/s
[  357.714843] usb usb4-port1: not reset yet, waiting 200ms
[  357.874717] usb 2-1: new full-speed USB device number 2 using ohci-platf=
orm
[  357.918838] usb usb4-port1: not reset yet, waiting 200ms
[  358.082679] usb 2-1: ep0 maxpacket =3D 32
[  358.087855] usb 2-1: skipped 1 descriptor after interface
[  358.087926] usb 2-1: skipped 1 descriptor after interface
[  358.089798] usb 2-1: default language 0x0409
[  358.093839] usb 2-1: udev 2, busnum 2, minor =3D 129
[  358.093904] usb 2-1: New USB device found, idVendor=3D1997, idProduct=3D=
2433, bcdDevice=3D 1.06
[  358.094803] usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[  358.095481] usb 2-1: Product: mini keyboard
[  358.095889] usb 2-1: Manufacturer:
[  358.097629] usb 2-1: usb_probe_device
[  358.097691] usb 2-1: configuration #1 chosen from 1 choice
[  358.099335] usb 2-1: adding 2-1:1.0 (config #1, interface 0)
[  358.100603] usb 2-1: adding 2-1:1.1 (config #1, interface 1)
[  358.101371] hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0002
[  358.126129] usb usb4-port1: not reset yet, waiting 200ms
[  358.203797] hid: raw HID events driver (C) Jiri Kosina
[  358.227055] usbhid 2-1:1.0: usb_probe_interface
[  358.227080] usbhid 2-1:1.0: usb_probe_interface - got id
[  358.231307] usbhid 2-1:1.1: usb_probe_interface
[  358.231331] usbhid 2-1:1.1: usb_probe_interface - got id
[  358.236333] usbcore: registered new interface driver usbhid
[  358.236850] usbhid: USB HID core driver
[  358.267050] input:   mini keyboard as /devices/platform/fd8c0000.usb/usb=
2/2-1/2-1:1.0/0003:1997:2433.0001/input/input2
[  358.326722] usb usb4-port1: not reset yet, waiting 200ms
[  358.326992] hub 4-0:1.0: state 7 ports 1 chg 0000 evt 0002
[  358.327125] usb usb4-port1: status 0100, change 0001, 12 Mb/s
[  358.368453] hid-generic 0003:1997:2433.0001: input,hidraw0: USB HID v1.0=
1 Keyboard [  mini keyboard] on usb-fd8c0000.usb-1/input0
[  358.372573] input:   mini keyboard Mouse as /devices/platform/fd8c0000.u=
sb/usb2/2-1/2-1:1.1/0003:1997:2433.0002/input/input3
[  358.376787] input:   mini keyboard System Control as /devices/platform/f=
d8c0000.usb/usb2/2-1/2-1:1.1/0003:1997:2433.0002/input/input4
[  358.432171] input:   mini keyboard Consumer Control as /devices/platform=
/fd8c0000.usb/usb2/2-1/2-1:1.1/0003:1997:2433.0002/input/input5
[  358.434480] hid-generic 0003:1997:2433.0002: input,hidraw1: USB HID v1.0=
1 Mouse [  mini keyboard] on usb-fd8c0000.usb-1/input1
[  358.455095] usb usb4-port1: debounce total 100ms stable 100ms status 0x1=
00
[  358.455209] hub 4-0:1.0: hub_suspend
[  358.455285] usb usb4: bus auto-suspend, wakeup 1
^C
root@quartz64a:~# lsusb -tv
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dohci-platform/1p,=
 12M
    ID 1d6b:0001 Linux Foundation 1.1 root hub
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dohci-platform/1p,=
 12M
    ID 1d6b:0001 Linux Foundation 1.1 root hub
    |__ Port 001: Dev 002, If 0, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        ID 1997:2433 Shenzhen Riitek Technology Co., Ltd wireless mini keyb=
oard with touchpad
    |__ Port 001: Dev 002, If 1, Class=3DHuman Interface Device, Driver=3Du=
sbhid, 12M
        ID 1997:2433 Shenzhen Riitek Technology Co., Ltd wireless mini keyb=
oard with touchpad
/:  Bus 003.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-platform/1p,=
 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 004.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dehci-platform/1p,=
 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 005.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 006.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000=
M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 007.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 008.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci-hcd/1p, 5000=
M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
```

HTH,
  Diederik

