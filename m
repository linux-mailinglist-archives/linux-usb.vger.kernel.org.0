Return-Path: <linux-usb+bounces-32291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B15D1A30A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 17:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDF8230E8422
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CAF262FC1;
	Tue, 13 Jan 2026 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="f1N7exyY"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7601D1494C3
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320976; cv=none; b=IzL1l5AWNeGnTCOnsgPR+7ZaItbBmzYDlO99P08FsXFFZmMXGy58jA/uyi3al3x9ByWgaO0oM6TfWfL8IzLCy5/cG0dz8ZAGndQzON88RZlXjFvkEcf1OvPzDAV9R2vk6zWsLJdmyG0HoKXApNIslNr5lhwz+RzLSf2FqfALwR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320976; c=relaxed/simple;
	bh=Ih2wprFj9ebh6n5trquqbqhFyRV4aBHlducm/G84yhE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=JmS6LPm2lrL1NSYEaIMEr4dgbPiYJLaAlRWTQLk1tA/QVd3qZuW/+Xd4TRu2sz+PrsU3kBzrbV8ieGpACRFV1hU2HGFQhPktENkdIvgHn8KpGof4RnwcVoTxCu5pTBJuDe31GO0BpF+algDe3UaHzTRkPEirCdSL0gxyvVpl4ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=f1N7exyY; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768320971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/0vSieeJBhG2qqh8FuHToqqUBQ13qnWcsKX9OripvA=;
	b=f1N7exyYHC0gwKdI3cs107pjDJZN/XVYu3bsLBMn70zVirBaVQqOU/+RQUcTEVTlK3TvS9
	zAt7qroBHbBnQJkXZoUUug+RzuhPTLMrkEMg0yQn+HEpii4TSnRQfsCeXqePpUZqYWrIco
	wI5H9Y0GQ4kAh3n1k/w+DFyO55FIFXQOECF8PbQE6Fosv0mIf1CfhPhHI/nS4LEyfc+xvX
	lBNwUv3LxhCi2qo13Dg8JsfT6r2MxBFoUWjBiCqPSGqa3yYJHRz0iXr01ukztbq2JkSnhu
	pAK47TU0IxCBSjVzYAEQgQiwLcnFsv2Y3d7O9S7ID2cjaH+siSb41fimNWThtg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 17:16:05 +0100
Message-Id: <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>
To: "Alan Stern" <stern@rowland.harvard.edu>
Cc: "USB mailing list" <linux-usb@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
 <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
In-Reply-To: <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
X-Migadu-Flow: FLOW_OUT

On Tue Jan 13, 2026 at 4:47 PM CET, Alan Stern wrote:
> On Tue, Jan 13, 2026 at 02:35:21PM +0100, Diederik de Haas wrote:
>> Got my (gtkgreet) login screen and plugged in my keyboard adapter in the
>> *bottom* USB2 port ... and that did NOT work.
>>=20
>> Logged in via SSH and noticed it was indeed not listed in ``lsusb``.
>> Checked ``lsmod`` and ``dmesg | tail`` ... and noticed the kernel *did*
>> notice plugging in the keyboard adapter, so did ``lsusb`` *again* and
>> then it *did* list my keyboard adapter.
>> I did NOT employ my usual 'workaround' by plugging it into a USB3 port.
>>=20
>> So it may be that it would have always worked ... eventually ... if I
>> had just waited long enough?
>> While 'dmesg' seems to suggest it took little over 0.5 seconds, I'm
>> really not that fast ;-P (or that impatient)
>
> Is this repeatable?

It doesn't happen every time, but it did actually happen another time.
After that test, I shutdown the device and unplugged the keyboard
adapter. Then I powered on the device and waited till it had completed
the boot process.
Logged in via SSH, retrieved my usual boot process data (what you saw in
my 'paste' starting with ``uname -a``) and then did ``dmesg -W``.

Then I plugged in my keyboard adapter in the bottom port and noticed it
didn't work (straight away). This time I waited, pressed various keys on
my keyboard, turned the keyboard off and on again, pressed some more
keys ... and after ~20 (or 30?) seconds, my keyboard started to work.
When I then switched back to my SSH session, I saw dmesg had (then)
printed messages indicating it saw the adapter plugged in and ``lsusb``
did see the device.

But that ~20 seconds is key here. Normally I would conclude that "it
doesn't work" after (say) >5 seconds of nothing happening.

> If it is, try doing the following.  After a fresh boot, log in via SSH=20
> and turn on dynamic debugging for USB:
>
> 	echo module usbcore =3Dp >/sys/kernel/debug/dynamic_debug/control
>
> and clear the kernel's log buffer:
>
> 	dmesg -C

Would ``dmesg -W`` also work?

> Then plug the keyboard adapter into the non-working bottom USB2 port and=
=20
> wait a short time (say, 30 seconds).
>
> Then get a copy of the dmesg output and post it here.  Also, check to=20
> see whether the keyboard is working.  In fact, you should check the=20
> keyboard during that 30-second wait, so you will know just how long the=
=20
> delay was before it started working.

Normally my SSH session is displayed on the same monitor as the desktop
session of the Quartz64-A (I switch between HDMI-1 and HDMI-2 input
sources of my monitor). This makes doing any kind of precise timing
activity impossible. I'll try doing the SSH session via my laptop, which
hopefully allows timings to be closer (but likely still not precise).

> Another thing you can try is to force the necessary module(s) to load=20
> before plugging in the keyboard adapter.  For now, a simple modprobe=20
> issued over the SSH connection will do the job.  If this turns out to=20
> help, you can configure modprobe to load the module(s) automatically at=
=20
> boot time.

I was already planning to make it built-in as the chances of me not
needing USB2 in some way, are quite slim. And they should (hopefully)
prevent such issues and I'd have a warning less in dmesg.

Cheers,
  Diederik

