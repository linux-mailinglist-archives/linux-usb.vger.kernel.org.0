Return-Path: <linux-usb+bounces-29179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 081BFBD0BD8
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 21:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D57C94E2C5F
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 19:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BBE21E0AD;
	Sun, 12 Oct 2025 19:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XXV4yvFk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F01461FFE
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 19:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760298843; cv=none; b=gIbJLqHcKG4+S55QF9Jqmi0AmXgEuEdi8tmk/EAYLhfskn10VmTAZis+flVcdcNvFufCzc1NbsSYy7R65S/UB/L1hz1xaQrSltv45foiygitdTa5B2rmUvN/PZRFOUqJf9HPTm9et0BaMQrhwMr21ZntcVoHdig4YcRBQsmQq6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760298843; c=relaxed/simple;
	bh=K/Ep1Ej5ZdPhtQVWS3PsE0f3Zx1iGX8PDWAMOa69ueg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Trhu5uT8E7ocD9hc4ZozUyr+kuOQbg9VevMawO2sI1O1hKOllAPH6BXFLxjW+GFqOPss1/fBI3lAq643+/DneJ5uNA/otdAlNJ3xebm27UXapUc2rYznZhbWZPl+TOSpl4zMHlXUFIuykl/vwYj8GPOkm062E3Y2IXbKFtEDonk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XXV4yvFk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41061C4CEE7;
	Sun, 12 Oct 2025 19:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760298841;
	bh=K/Ep1Ej5ZdPhtQVWS3PsE0f3Zx1iGX8PDWAMOa69ueg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXV4yvFkzkxAncsGjENcWn/QpbyHZAHDRIBE1gCJJdA/c+bE7Ta/0iTew8anF+Hnc
	 PBMMh8SE1zePYRd0ePNHE4g4fdJ/ATQyrdrnfp0gp6PAhU4RrHZUxsVrzy3lzG8QA/
	 9SNfJbpZ18jMx4n5m7yqjOy043Mb5/Jdm4rZj9KU=
Date: Sun, 12 Oct 2025 21:53:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com,
	Johan Hovold <johan@kernel.org>, vojtech@suse.cz
Subject: Re: ttyACM versus ttyUSB
Message-ID: <2025101210-gap-gravy-ae8c@gregkh>
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
 <2025101243-ongoing-truce-3aa5@gregkh>
 <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>
 <2025101238-mastiff-decibel-4b4f@gregkh>
 <CAMMLpeQvb1SJ=_kC+N1pGHkh36yrORJq+Der7fDzPj_urzefow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMMLpeQvb1SJ=_kC+N1pGHkh36yrORJq+Der7fDzPj_urzefow@mail.gmail.com>

On Sun, Oct 12, 2025 at 01:01:00PM -0600, Alex Henrie wrote:
> On Sun, Oct 12, 2025 at 10:21 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Oct 12, 2025 at 09:55:27AM -0600, Alex Henrie wrote:
> > > On Sun, Oct 12, 2025 at 12:07 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Sat, Oct 11, 2025 at 11:00:00PM -0600, Alex Henrie wrote:
> > > > > Dear kernel developers,
> > > > >
> > > > > I am very curious and I haven't been able to find a definitive answer
> > > > > anywhere: Why is the cdc-acm driver separate from the general
> > > > > usbserial driver? There are lots of drivers that use usbserial, each
> > > > > with its own unique protocol. What makes ACM so special that it needs
> > > > > to be separated out as /dev/ttyACM* instead of going with everything
> > > > > else in /dev/ttyUSB*?
> > > > >
> > > > > I can think of several possible reasons, but I'd really like to know
> > > > > what reasons matter to the kernel architects/maintainers.
> > > >
> > > > cdc-acm implements the USB specification for that protocol, which is
> > > > defined by the USB group.  All of the usb-serial drivers do NOT follow
> > > > that protocol and use their own vendor-specific ways of talking to the
> > > > device.
> > >
> > > OK, so it's just a matter of policy that drivers for standard USB
> > > protocols name the device nodes differently than drivers for
> > > vendor-defined USB protocols do?
> >
> > These drivers are decades old, originally written in 1999 and handled
> > different hardware types so they got different device nodes.  Just like
> > many different serial drivers today have different named device nodes,
> > it was just following that well-known practice at the time.
> >
> > And that practice continues today, when people write new serial/tty
> > drivers, they usually name the device nodes something new, much to many
> > of us arguing that maybe they shouldn't do that and they should learn
> > from our past history :)
> >
> > Also, cdc-acm does not support as wide of a range of devices as the
> > usb-serial driver does, which can handle multiple-port devices and full
> > hardware line controls, which cdc-acm can not as it's not part of the
> > spec for that protocol.
> >
> > There was a time that cdc-acm almost did not become a specification due
> > to internal arguments at USB-IF, which is why the usb-serial devices all
> > were using custom vendor protocols first, before cdc-acm eventually got
> > ratified.
> 
> Ah, so the name ttyACM is a historical accident, from the time when it
> was the norm to use different device node names in different serial
> drivers.

It wasn't an "accident", it was on purpose at the time.

> I did notice that the ACM protocol has no way to set the baud rate or
> read the CTS line and I wondered if those limitations were the reason
> for keeping its driver separate. Today there are ttyUSB drivers that
> likewise have limitations on the baud rate and the flow control lines
> (some are even based on ACM), but they weren't around in 1999, so I
> can see how the difference in capabilities would have been another
> motivation for the difference in naming conventions.

Yes, baud rate and line control is important for the usb-serial devices
that were real serial ports.  The ACM protocol did not want to implement
those for various reasons best discussed over your favorite beverage :)

thanks,

greg k-h

