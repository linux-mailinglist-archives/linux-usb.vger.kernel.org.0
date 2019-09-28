Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8454C10CE
	for <lists+linux-usb@lfdr.de>; Sat, 28 Sep 2019 14:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbfI1MSR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Sep 2019 08:18:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:39354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbfI1MSR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 28 Sep 2019 08:18:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55F3920863;
        Sat, 28 Sep 2019 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569673094;
        bh=qVv42rMxZDDzChavxv2ld+IgkfGiTd+qiynoZnkPNvg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vx99vcXs23AS2N2fj6O8fwf+g6P4QRdJFaEpNmWHoz0eKBqL+ob1bSy6us/KfoMuK
         /XXacTnCbRXA9uXvKMDY/SPGSwrboDm8/3NZVe5du5/cG85yQaDIhg1l0ReWOP2EyC
         QnG8WPKqkoGngePzhVJxbHr6MJqDmF5o5XvdefZI=
Date:   Sat, 28 Sep 2019 14:18:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
Message-ID: <20190928121809.GB1845030@kroah.com>
References: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
 <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
 <20190927192554.GB1805907@kroah.com>
 <48bcb34194695566b9c59f6e814706f8d65be962.camel@hadess.net>
 <20190928073935.GB1836895@kroah.com>
 <c47cfdbe937b209eb84af7de3aea7faf3faa5ca8.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c47cfdbe937b209eb84af7de3aea7faf3faa5ca8.camel@hadess.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 28, 2019 at 12:42:21PM +0200, Bastien Nocera wrote:
> On Sat, 2019-09-28 at 09:39 +0200, Greg KH wrote:
> > On Fri, Sep 27, 2019 at 10:12:14PM +0200, Bastien Nocera wrote:
> > > On Fri, 2019-09-27 at 21:25 +0200, Greg KH wrote:
> > > > On Fri, Sep 27, 2019 at 08:49:12PM +0200, Bastien Nocera wrote:
> > > > > On Fri, 2019-09-27 at 13:56 -0400, Alan Stern wrote:
> > > > > <snip>
> > > > > > Is there any reason this needs to be done in a kernel driver?
> > > > > 
> > > > > To offer a unified interface all the devices with similar
> > > > > needs.
> > > > 
> > > > What "other devices with similar needs?"
> > > 
> > > I would expect Android phones to be able to offer up a different
> > > charging method depending on policy, and wanting to be able to
> > > switch
> > > charging methods.
> > 
> > I doubt it, it "should" be automatic based on the USB hardware
> > configurations in the charger, not based on a random undocumented USB
> > command sent from the host.  The USB spec describes how to do all of
> > this properly without any commands at all, why not just rely on that?
> 
> That's not true, no. Until USB PD, there wasn't a way any ways for
> devices to know that they could draw more current without either being
> told so (as is done here), hardware modifications (with resistors being
> wired to GND/VCC), or violating the USB spec.

It is the resistor thing.  And other "tricks" that hardware could play.
My 3 year old phone could go into "high power" charging if it could
figure out if it was connected to the special charger that came with it.
All of that was done outside of the USB protocol stack, using hardware
tricks.

And all of that not USB PD.

> In this case, Apple worked around the problem by having their OS,
> running on their hardware, tell their peripherals to draw more power,
> because the spec didn't allow this.

And because Apple "knew" that their laptops could provide that kind of
power.  How do you know that a random USB hub can provide that properly?

> Those 2 articles should help understand the complexities of the
> problem:
> https://lwn.net/Articles/693027/
> https://lwn.net/Articles/694062/

Those are all from the viewpoint of Linux running on the device itself,
not Linux running on the host like you are talking about here.

> > > > > >   Can it 
> > > > > > be handled from userspace instead?
> > > > > 
> > > > > It could, at a great infrastructure cost, trying to get buy-in
> > > > > from
> > > > > various distributions, at the very least.
> > > > 
> > > > For USB devices that _can_ be handled in userspace, we ask that
> > > > they
> > > > be
> > > > done in userspace and not with a kernel driver.  Something that
> > > > only
> > > > does usb control messages with no other in-kernel api interfaces
> > > > is
> > > > ripe
> > > > for a tiny userspace program using libusb.  Not for an in-kernel
> > > > driver.
> > > 
> > > I don't quite understand why that would be when the kernel already
> > > offers the API to be able to control it.
> > 
> > Again, if it _can_ be done in userspace, it _should_ be done in
> > userspace when it comes to USB drivers/commands.
> 
> That's clear enough, although I still think it's wrong to try and move
> to user-space things that have an existing clearly defined API in
> kernel space. This would be akin to not allowing any new drivers for
> webcams or USB sound cards because "they can be done in user-space".
> Sure they can, but there's already an established API to handle them in
> the kernel.

Again, the power_supply api is for power going the other way in the
system.  That's not an "existing clearly defined API in kernel space".

> > > > > > You said this was for a "power supply" class driver.  It's
> > > > > > not
> > > > > > clear 
> > > > > > what that means -- the devices you want to communicate with
> > > > > > are 
> > > > > > iphones, ipads, etc., not power supplies.
> > > > > 
> > > > > There's tons of "device" scope "power_supply" devices in the
> > > > > kernel,
> > > > > which don't power the Linux machine they're running on. Grep
> > > > > for
> > > > > "POWER_SUPPLY_SCOPE_DEVICE" in the kernel, most wireless mice
> > > > > and
> > > > > keyboards implement this already.
> > > > 
> > > > Yes, but those are real devices that the "Host" uses for power or
> > > > something else.  wireless mice and keyboards already have kernel
> > > > drivers
> > > > so that's fine as well (but probably could be done from userspace
> > > > too.)
> > > 
> > > It probably couldn't when the pipes to get key presses and the
> > > battery
> > > info are the same.
> > 
> > Are you sure?  They are really part of the USB HID spec?  Do you have
> > pointers to that, for some reason I thought those were "out-of-band"
> > vendor specific commands.
> 
> They're not part of the HID spec, but they don't have to be out-of-
> band, or separate from the rest of the communication.

If they are not separate then they are not part of the HID driver bound
to that interface, so userspace can communicate just fine with the
endpoint that does require that custom command.

Have you looked at how that power setting is transfered to userspace
today?  Is it done in a kernel driver or just using libusb?

Anyway, we will be glad to review code if you submit it, but again,
remember that we might say it is better to just do this in userspace,
like we have done for many other submissions in the past.

Note, there is the "fun" idea of using eBPF to run userspace USB drivers
from a kernel module that I have had for a year or so, and want to get
around to trying to do.  But that's probably _way_ outside the scope of
what you are thinking of doing here...

thanks,

greg k-h
