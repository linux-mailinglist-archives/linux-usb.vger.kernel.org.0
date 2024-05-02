Return-Path: <linux-usb+bounces-9979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D78B9C4C
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 16:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4466C2829FD
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 14:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9311534F1;
	Thu,  2 May 2024 14:32:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704D7152DEE
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.2.72.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714660344; cv=none; b=dG0aFxS7QNCZVRYMD0VaW7QsOzgDi1jgFFVElEYUbCA4ePSKxO/LwPxohViAdiaOCSjrKp/hr+pSIAVQ+Oau9OY8eYcPUx2R/Aegbjo36x0dfQayMYF7Pv7UX2Q/iQYVmuaILPDQhizTaYMeJNAT0c4V14YKKnN77l27/jmj0t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714660344; c=relaxed/simple;
	bh=50b3UNYn6OSUOrLdkYETNBj/2ljl9MrhnhFN4TaJYQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tHRWTJJvd6W25EWf0dw3KQrYH4EbhkK6rL43pv9t+Ux1w05Yv2dNZv53jIcSbEinFUo1Bc4X7deJSenueGeSAETj+1apVL8T9Y/s1hqSzoM7SiMZfPFnqJ4i5r52fZjDhIUNQRdAD/tKsT7zv0Uau/7cGSTM0i4RNeCwDhRsbkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com; spf=pass smtp.mailfrom=mansr.com; arc=none smtp.client-ip=81.2.72.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mansr.com
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
	by unicorn.mansr.com (Postfix) with ESMTPS id 1634D15360;
	Thu,  2 May 2024 15:32:20 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 04D7221339E; Thu,  2 May 2024 15:32:19 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: use tty_port_register_device_serdev
In-Reply-To: <2024050228-emission-ointment-88de@gregkh> (Greg Kroah-Hartman's
	message of "Thu, 2 May 2024 15:57:56 +0200")
References: <20240502100728.7914-1-mans@mansr.com>
	<ZjNoWq0r7CJJptRk@hovoldconsulting.com> <yw1xmsp8big7.fsf@mansr.com>
	<2024050204-recreate-exerciser-bd62@gregkh>
	<yw1xikzwbb3a.fsf@mansr.com>
	<2024050228-emission-ointment-88de@gregkh>
Date: Thu, 02 May 2024 15:32:19 +0100
Message-ID: <yw1xedakb7yk.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.3 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Thu, May 02, 2024 at 02:24:41PM +0100, M=E5ns Rullg=E5rd wrote:
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>>=20
>> > On Thu, May 02, 2024 at 11:45:44AM +0100, M=E5ns Rullg=E5rd wrote:
>> >> Johan Hovold <johan@kernel.org> writes:
>> >>=20
>> >> > On Thu, May 02, 2024 at 11:07:28AM +0100, Mans Rullgard wrote:
>> >> >> Use tty_port_register_device_serdev() so that usb-serial devices
>> >> >> can be used as serdev controllers.
>> >> >
>> >> > I'm afraid it's not that easy. The reason serdev is not enabled for
>> >> > usb-serial is that there's currently no support for handling hotplu=
g in
>> >> > serdev. The device can go away from under you at any time and then =
you'd
>> >> > crash the kernel.
>> >>=20
>> >> Oh, that's unfortunate.  Regular serial ports can go away too, though,
>> >> and that seems to be handled fine.  What am I missing?
>> >
>> > How is it handled?  Normal serial ports can go away but in practice,
>> > it's a rare occurance, and usually people use serdev for devices where
>> > the ports can not be removed (i.e. internal connections).
>>=20
>> If I unbind a regular serial port from its driver using sysfs, a serdev
>> device defined in a device tree gets removed as expected.  Binding the
>> serial port makes everything come back again.  I fail to see any problem
>> here.  If there is one, you'll have to be less evasive in explaining
>> what it is.
>
> Try yanking a usb-serial device out with this patch applied and see what
> happens.  I'm pretty sure serdev will not handle that well, just like if
> you yank out a pci serial device while it is being used.  Doing
> bind/unbind is not a "surprise" removal, but a nice orderly one :)
>
> If this does now work, nice, but I haven't seen the changes to serdev to
> make this happen, I wonder what changed...

Turns out I missed one change that is needed for unplugging to be
handled:

--- a/drivers/usb/serial/bus.c
+++ b/drivers/usb/serial/bus.c
@@ -91,7 +91,7 @@ static void usb_serial_device_remove(struct device *dev)
        autopm_err =3D usb_autopm_get_interface(port->serial->interface);
=20
        minor =3D port->minor;
-       tty_unregister_device(usb_serial_tty_driver, minor);
+       tty_port_unregister_device(&port->port, usb_serial_tty_driver, mino=
r);
=20
        driver =3D port->serial->type;
        if (driver->port_remove)

With this additional change, yanking (shorting the data lines; the thing
is soldered) the usb-serial converter works, although a couple of
warnings are printed:

[   28.678301] usb 1-1: USB disconnect, device number 2
[   28.683695] ttyUSB ttyUSB0: tty_hangup: tty->count(1) !=3D (#fd's(0) + #=
kopen's(0))
[   28.691516] ftdi_sio ttyUSB0: error from flowcontrol urb
[   28.759056] ttyUSB ttyUSB0: tty_port_close_start: tty->count =3D 1 port =
count =3D 0
[   28.772531] ftdi_sio ttyUSB0: FTDI USB Serial Device converter now disco=
nnected from ttyUSB0
[   28.781346] ftdi_sio 1-1:1.0: device disconnected

Where should I go looking for the cause of these?

--=20
M=E5ns Rullg=E5rd

