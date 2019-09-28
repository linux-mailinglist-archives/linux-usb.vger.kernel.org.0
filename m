Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 810CEC1017
	for <lists+linux-usb@lfdr.de>; Sat, 28 Sep 2019 09:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbfI1Hjl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Sep 2019 03:39:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:37208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbfI1Hjl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 28 Sep 2019 03:39:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B5B820815;
        Sat, 28 Sep 2019 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569656377;
        bh=Od80tw1ri2lknlUo2dO6eu6M4CSNmvPUa3sfrSkQbR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iWgQFh8z0zoY5auu7cEhwu/+KN3tyAZgXnmtEU7w4uPjtwevfxHOTIAKW+KSiLRK8
         tpCckr6nkGn3naE4IHMKLx26Urr25AGs3Pszlg373RbF5AQJcTOAYrNOC6mkd07mNt
         c7b6Im0RWp6DvVhQU1zXs5O2KfiTjZSZEuZdfD6A=
Date:   Sat, 28 Sep 2019 09:39:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
Message-ID: <20190928073935.GB1836895@kroah.com>
References: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
 <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
 <20190927192554.GB1805907@kroah.com>
 <48bcb34194695566b9c59f6e814706f8d65be962.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48bcb34194695566b9c59f6e814706f8d65be962.camel@hadess.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 27, 2019 at 10:12:14PM +0200, Bastien Nocera wrote:
> On Fri, 2019-09-27 at 21:25 +0200, Greg KH wrote:
> > On Fri, Sep 27, 2019 at 08:49:12PM +0200, Bastien Nocera wrote:
> > > On Fri, 2019-09-27 at 13:56 -0400, Alan Stern wrote:
> > > <snip>
> > > > Is there any reason this needs to be done in a kernel driver?
> > > 
> > > To offer a unified interface all the devices with similar needs.
> > 
> > What "other devices with similar needs?"
> 
> I would expect Android phones to be able to offer up a different
> charging method depending on policy, and wanting to be able to switch
> charging methods.

I doubt it, it "should" be automatic based on the USB hardware
configurations in the charger, not based on a random undocumented USB
command sent from the host.  The USB spec describes how to do all of
this properly without any commands at all, why not just rely on that?

Do you know of any Android device that requires a USB command like this?

> > > >   Can it 
> > > > be handled from userspace instead?
> > > 
> > > It could, at a great infrastructure cost, trying to get buy-in from
> > > various distributions, at the very least.
> > 
> > For USB devices that _can_ be handled in userspace, we ask that they
> > be
> > done in userspace and not with a kernel driver.  Something that only
> > does usb control messages with no other in-kernel api interfaces is
> > ripe
> > for a tiny userspace program using libusb.  Not for an in-kernel
> > driver.
> 
> I don't quite understand why that would be when the kernel already
> offers the API to be able to control it.

Again, if it _can_ be done in userspace, it _should_ be done in
userspace when it comes to USB drivers/commands.

> > > > You said this was for a "power supply" class driver.  It's not
> > > > clear 
> > > > what that means -- the devices you want to communicate with are 
> > > > iphones, ipads, etc., not power supplies.
> > > 
> > > There's tons of "device" scope "power_supply" devices in the
> > > kernel,
> > > which don't power the Linux machine they're running on. Grep for
> > > "POWER_SUPPLY_SCOPE_DEVICE" in the kernel, most wireless mice and
> > > keyboards implement this already.
> > 
> > Yes, but those are real devices that the "Host" uses for power or
> > something else.  wireless mice and keyboards already have kernel
> > drivers
> > so that's fine as well (but probably could be done from userspace
> > too.)
> 
> It probably couldn't when the pipes to get key presses and the battery
> info are the same.

Are you sure?  They are really part of the USB HID spec?  Do you have
pointers to that, for some reason I thought those were "out-of-band"
vendor specific commands.

> > > > Under what circumstances would these messages need to get sent?  
> > > 
> > > User-space would control it by changing the device's
> > > POWER_SUPPLY_PROP_CHARGE_TYPE to "Fast", if available.
> > > 
> > > eg.
> > > # echo "Fast" > /sys/devices/pci0000:00/0000:00:14.0/usb3/3-
> > > 1/power_supply/apple_mfi_fastcharge/charge_type
> > 
> > power_supply class is for the power supply that is charging the cpu
> > you
> > type that on.  Not for the cpu of an attached device, right?
> 
> Again, power_supply class has a scope attached to it, so having the
> driver in the kernel would actually make it easier, with user-space not
> having to care whether the device uses an "Apple" method or something
> else.

Again, power_supply is for the power being sent to the host computer,
right?  I don't think it is for power being sent from the host to
another device, are you sure it is set up to control/monitor/handle that
type of thing?

I do know that there are some USB power control things that probably
should be tied into the power_supply logic sometime soon, but I do not
know if that plumbing has been put into place yet in the power_supply
class code.  Do you know if it has?

thanks,

greg k-h
