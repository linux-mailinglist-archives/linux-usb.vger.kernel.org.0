Return-Path: <linux-usb+bounces-18646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77C9F681B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 15:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D07CD16C77C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 14:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7141A23B6;
	Wed, 18 Dec 2024 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCUYdCub"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39F635948;
	Wed, 18 Dec 2024 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531602; cv=none; b=Z+6HuPoYUaRfi84qWT85zCPrsgivGd3GblOmA2t+dtTDIEMg8onBn5yV/dHRIqLrzkVtCNlctW1G6oz3Tmv8+dIi9KuUrA+zyF8klVWPPZ5kSm7FXKlJtmOZpaybe8F8FMf3KG/5LkP0X7GbEadDj1wQTlaSCKsO8BbOjUt803o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531602; c=relaxed/simple;
	bh=UsSVhquvmKegmwVZsJ6ZmS/tYmCX/L5FwMWIqR/HyDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYC26qn2+JuIUbuGbF3SwmMjwYAGuN5/gVvLELw4kfHZu1FDNpFVTp8+oxhnJy2HRxHVohx3EogZalHE/7FRNWZt67CoJ+IfaqZtWD8Rj+RW9hKKZ+J6U1Vbz8ppq1+tXha32+elUGBuUyF33vHcg+mWn+WDzlX/5VmOqij3DEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCUYdCub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B48C4CECD;
	Wed, 18 Dec 2024 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734531602;
	bh=UsSVhquvmKegmwVZsJ6ZmS/tYmCX/L5FwMWIqR/HyDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCUYdCubwH3fOyAdR7iYwx3XGYguu2Ecq5LnAJgyKEclrhnETkkZJcc4qlEN5zfDQ
	 its92BxAIS7RCp0vXA/TLvJJK/7I48kx0zvmjByngHwo+iWb17q7lqJHtZdebBxgWm
	 6IQDA6PvQVxmIzmZXNjjFzdi0548HcV7IKFsbPA7MAkhm32oceR5yrUp2NyM14eJsG
	 WPBfJ6JLiEfRGMdAE1VkWsjWNVN7UTX6GiFTYEUoMhHdBdigfhQg7MR4VYRyG+PWor
	 9hQ3UabjAXKla6LHen4NXjNxieL47uUJYWzr8Ax04KTEviP7J0VyoxuqSgY4GbClFK
	 xrBTS9QnBLOmg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNuuE-000000002cf-1fKK;
	Wed, 18 Dec 2024 15:20:06 +0100
Date: Wed, 18 Dec 2024 15:20:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Lode Willems <me@lodewillems.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] USB: serial: CH341: add hardware flow control
 RTS/CTS
Message-ID: <Z2LaFv_ZQIikbp6_@hovoldconsulting.com>
References: <20241113180930.3741-1-me@lodewillems.com>
 <Z12-hZKS83WQ5bYd@hovoldconsulting.com>
 <55c078d2-80de-4eaf-afc3-d470a712bd49@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55c078d2-80de-4eaf-afc3-d470a712bd49@lodewillems.com>

On Tue, Dec 17, 2024 at 09:08:23PM +0100, Lode Willems wrote:
> On 14/12/2024 18:21, Johan Hovold wrote:
> > On Wed, Nov 13, 2024 at 07:08:27PM +0100, Lode Willems wrote:
> >> This adds support for enabling and disabling
> >> RTS/CTS hardware flow control.
> >> Tested using a CH340E in combination with a CP2102.
> >>
> >> Fixes part of the following bug report:
> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=197109
> >>
> >> Signed-off-by: Lode Willems <me@lodewillems.com>
> > 
> > Thanks for the patch and sorry about the late feedback on this one. I
> > wanted to give it a spin with the devices I have here (ch340g and
> > ch341a).
> 
> Thanks for the review. Sorry in advance if this e-mail is formatted
> incorrectly, this is my first time replaying to a review.

Looks all good.

> > Appears to the modem control lines are not wired up on the ch341a
> > evaluation board I have, but the device accepts the request and stops
> > transmitting with hardware flow control enabled.
> 
> Since creating this patch I've acquired a ch341a breakout board and can
> confirm that it transmits with hardware flow control enabled and CTS
> asserted.

Thanks for checking.

> > With ch340g in loopback, I also see it refuse to transmit unless cts is
> > asserted. I was not able to get the device to deassert rts when
> > attempting to fill its receive buffers, however. Perhaps the hardware
> > does not support this, but is this something you tried?
> 
> I didn't try this before. Just trying a couple of things now I also
> couldn't seem to make it deassert RTS, but this may be a failure of
> how I'm testing this.

Or it's a limitation of the hardware (e.g. it really only support
auto-cts). I patched the driver to not submit any read urbs, which
should eventually fill up the receive buffers.

> >> +#define CH341_FLOW_CTL_NONE    0x000
> >> +#define CH341_FLOW_CTL_RTSCTS  0x101
> > 
> > The registers are eight bits wide, but the driver writes two at a time.
> > So this should just be 0x00 and 0x01.
> 
> Ok. I'm guessing I don't have to send the same request twice and can
> just leave the top eight bits of the value and index empty?
> It seems to work in the quick testing I've done.

Possibly, but writing the same register twice is what the vendor driver
is doing here (e.g. otherwise you may actually write to offset 0 as
well).
 
> >> +static void ch341_set_flow_control(struct tty_struct *tty,
> >> +				   struct usb_serial_port *port,
> >> +				   const struct ktermios *old_termios)
> >> +{
> >> +	int r;
> >> +
> >> +	if (old_termios &&
> >> +	    C_CRTSCTS(tty) == (old_termios->c_cflag & CRTSCTS))
> >> +		return;
> > 
> > Just drop this and set the requested setting unconditionally.
> 
> Ok
> 
> > 
> >> +
> >> +	if (C_CRTSCTS(tty)) {
> >> +		r = ch341_control_out(port->serial->dev, CH341_REQ_WRITE_REG,
> >> +				      CH341_REG_FLOW_CTL |
> >> +				      ((u16)CH341_REG_FLOW_CTL << 8),
> >> +				      CH341_FLOW_CTL_RTSCTS);
> >> +		if (r < 0) {
> >> +			dev_err(&port->dev,
> >> +				"%s - failed to enable flow control: %d\n",
> >> +				__func__, r);
> >> +			tty->termios.c_cflag &= ~CRTSCTS;
> >> +		}
> >> +	} else {
> >> +		r = ch341_control_out(port->serial->dev, CH341_REQ_WRITE_REG,
> >> +				      CH341_REG_FLOW_CTL |
> >> +				      ((u16)CH341_REG_FLOW_CTL << 8),
> >> +				      CH341_FLOW_CTL_NONE);
> >> +		if (r < 0) {
> >> +			dev_err(&port->dev,
> >> +				"%s - failed to disable flow control: %d\n",
> >> +				__func__, r);
> >> +			tty->termios.c_cflag |= CRTSCTS;
> >> +		}
> >> +	}
> > 
> > Please rewrite this so that you prepare the value and index parameters
> > based on the termios settings and then do one control request. If it
> > fails you can restore the old setting (if old_termios is non-NULL).
> 
> Ok, I haven't seen any other driver restore the old setting on request
> failure, now I'm questioning if it's actually necessary?

Not all drivers do, but it is the right thing to do as that's the only
way we have to report failure to change a setting.

> If it is, I'll change it to the following:
> 	tty->termios.c_cflag = (tty->termios.c_cflag & !CRTSCTS)

You meant bitwise negation here (~) as you used above.

> 		| (old_termios->c_cflag & CRTSCTS);

But remember to only do this if old_termios is non-NULL.

Might be cleaner as two separate statements (&= and |=).

> > And please drop the redundant __func__ from the error message (even if
> > the driver still uses it in some other functions still).
> 
> Ok. Looking at the code again, the error already gets logged in
> ch341_control_out on failure. Maybe this log line shouldn't be added?

Yeah, I guess that's more in line with what the driver is currently
doing. We could always amend those printk to include index and value to
make it easier to figure out which call is failing if this becomes an
issue.

Johan

