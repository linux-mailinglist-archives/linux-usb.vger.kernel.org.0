Return-Path: <linux-usb+bounces-31072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E67C97C6F
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 15:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D28E04E1053
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 14:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF37F317701;
	Mon,  1 Dec 2025 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfS1iz0T"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677E9313E30;
	Mon,  1 Dec 2025 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764598209; cv=none; b=p9zzgnUWvbEyBeZrLYz4900/c/F4lT/3ZAY7duk4sArB7pvSYBfCzW2oKvK9hjhuvQai80sQA5R45c9biIx77ik7BF1pI0fTgJbJKp/IMXlRUvlZx6BIgV662IAyHwgV2/5QVP2z4mNqlQtUKdDa63Mm5+jIuAYp5+te9+hMW80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764598209; c=relaxed/simple;
	bh=vM8Pcuxndksg//KT0vON0wqdKnhOz3BwXym2nSLEXws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvSyVxOUwyomOWTjugfDwY76GxUybKCm85EzWvfaWWZAFq7uoW94BC+pWY2t9C1Q38PzIRqgPujRWm6dvi1NUVIoGTP1DBUWk3ZEu1fJqY0chZf715ut2cW3WYFA6XAptAyRSHf2VdTx80ON1JCvFrdF6UcOcfZf1On/L3JMsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfS1iz0T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75FBC4CEF1;
	Mon,  1 Dec 2025 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764598207;
	bh=vM8Pcuxndksg//KT0vON0wqdKnhOz3BwXym2nSLEXws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QfS1iz0T93ORkhDmI7MEsWvlQ8eAwvCNIlQ5mgllBiQOm+aZqmVnrZ9xpV3eoN9ge
	 4yietxd/KCy2UqLKWzSkFA+Sn7xkYdeRPxDlrsqBjHmZCdFBHjzYYznjo6mKzQv9uG
	 JCLMOlnuCzbkgqXZVKw/0+M5uljpfwJXTGSUPax4XUk71aIHPY31k4OYUpbCbn9dr3
	 SkDC+u/LXJ/eKSktswku3nI+yiRTeg/pxbsL8jZbf8XvXzbh8D0g5GpX/Ap9QuC5NP
	 l0iu8P4NXMBIZW7iGpbenunZUiqstiQWMagnpF56z3CQho1h02Eqp7x89iYlKHekTS
	 qSGnNNcaD1Zow==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQ4bV-000000003yd-0BWU;
	Mon, 01 Dec 2025 15:10:13 +0100
Date: Mon, 1 Dec 2025 15:10:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH v8 1/2] usb: serial: add support for CH348
Message-ID: <aS2hxeBR-tptevYd@hovoldconsulting.com>
References: <aCHHfY2FkVW2j0ML@hovoldconsulting.com>
 <CAFBinCAUNNfOp4qvn2p8AETossePv2aL7jBkFxVZV_XzzULgVg@mail.gmail.com>
 <aINXS813fmWNJh3A@hovoldconsulting.com>
 <CAFBinCBMTOM-FMgENS-mrnV17HbKzhtPUd44_dDiwnD=+HVMWQ@mail.gmail.com>
 <aIiXyEuPmWU00hFf@hovoldconsulting.com>
 <CAFBinCBZhjs7DGEgxhz54Dg8aW3NX9_LdnoZeUZpm5ohaT_-oQ@mail.gmail.com>
 <aJCoRFe-RFW1MuDk@hovoldconsulting.com>
 <CAFBinCCYsWHsNwi99kFqvLv+xOYtp9u3omhrPdV-hdH+5Cfyew@mail.gmail.com>
 <aK7Y9rRIsGBKRFAO@hovoldconsulting.com>
 <CAFBinCD19CVc0kX-aqa8pw71O2F3Nwy9ght+2TCn9B4PbOCBfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCD19CVc0kX-aqa8pw71O2F3Nwy9ght+2TCn9B4PbOCBfw@mail.gmail.com>

On Sat, Nov 29, 2025 at 04:59:36PM +0100, Martin Blumenstingl wrote:
> On Wed, Aug 27, 2025 at 12:08 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Aug 04, 2025 at 11:35:35PM +0200, Martin Blumenstingl wrote:
> > > On Mon, Aug 4, 2025 at 2:32 PM Johan Hovold <johan@kernel.org> wrote:

> > The host controller should split the buffer, but apparently this crashes
> > the device firmware.

> I think having a 512 - 3 (TX header) byte limitation for the TX buffer
> is acceptable for the first upstream version of this driver.

It's probably even required given how the firmware behaves.

> > > I think I made it work, sort of.
> > > It's a bit annoying because of code I don't understand. It seems that
> > > R_4 has the following settings:
> > > 0x00 DTR off
> > > 0x01 DTR on
> > > 0x10 RTS off
> > > 0x11 RTS on
> > > 0x08 activate (used during port initialization)
> > > 0x50 HW flow on
> > > 0x51 no RTS / HW flow off
> > >
> > > That said, poking 0x00, 0x01, 0x10 and 0x11 by themselves didn't do much.
> > > One also has to write 0x06 to the per-port VEN_R register.
> > > The vendor driver only does that in .set_termios, which I call
> > > questionable until someone calls me out on this and is willing to
> > > share a good reason why that's a good idea ;-)
> > >
> > > However, I'm unable to control the RTS line of port 1. It works for
> > > port 0, port 2 and 3 but not for port 1.
> > > Ports 4-7 don't have the TNOW/DTR and RTS lines routed outside the
> > > package, so I can't test these.
> >
> > Sounds like good progress. Have you made sure HW flow isn't just enabled
> > by default on port 1 or similar?

> Unfortunately I don't know how to read the HW flow control state from
> the hardware.
> Do you have any suggestions, how I can test HW flow control (after
> manually enabling it for a port)?

You can try disabling reading from the device (e.g. never submit the
read urbs) and see if the RTS is deasserted when the buffer fills up.

And in the other direction, verify that writes are buffered after you
deassert RTS manually on the other end. That should be easier.

> In case I can't easily figure it out: would you also accept a driver
> that doesn't support RTS/CTS for its initial version?

It's good to at least be able to control DTR/RST at open/close (i.e.
implement dtr_rts()) so that you can communicate when the other end
has hw flow enabled. Sound like you're really close to doing so.

> On another note: after walking away from the driver for some time I
> came back to day and spotted a comment in usb serial core's
> usb-serial.c:

> > /* we don't use num_ports here because some devices have more endpoint pairs than ports */

> With that I'm now setting num_bulk_out to 8 (number of ports) + 1 (for
> the config endpoint).

You should not be able to probe() if you set num_bulk_out higher than
the actual number of bulk out endpoints the device has as core verifies
that during probe.

You can (should) set num_ports higher (e.g. indirectly via
calc_num_ports()) for devices that mux data for multiple ports over
a shared endpoint (like this device, iirc).

mxuport and a couple of other drivers implements such a scheme.

> This, together with delaying the call to
> usb_serial_generic_write_bulk_callback() until we receive
> UART_IIR_THRI allowed me to get rid of the workqueue and re-use a lot
> more code from the USB serial core.

For writing if you need to wait for THRE per port then it may be best to
just use a driver specific write implementation (using a single urb per
port). That should be more readable/maintainable.

You can still let core allocate the urb and writer buffer for you (by
providing the endpoint mapping in calc_num_ports()).

Johan

