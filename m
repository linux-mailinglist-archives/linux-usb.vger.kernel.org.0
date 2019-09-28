Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0EEC109D
	for <lists+linux-usb@lfdr.de>; Sat, 28 Sep 2019 12:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbfI1KmZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Sep 2019 06:42:25 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50899 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfI1KmZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Sep 2019 06:42:25 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C2864240002;
        Sat, 28 Sep 2019 10:42:21 +0000 (UTC)
Message-ID: <c47cfdbe937b209eb84af7de3aea7faf3faa5ca8.camel@hadess.net>
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        benjamin.tissoires@redhat.com
Date:   Sat, 28 Sep 2019 12:42:21 +0200
In-Reply-To: <20190928073935.GB1836895@kroah.com>
References: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
         <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
         <20190927192554.GB1805907@kroah.com>
         <48bcb34194695566b9c59f6e814706f8d65be962.camel@hadess.net>
         <20190928073935.GB1836895@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 2019-09-28 at 09:39 +0200, Greg KH wrote:
> On Fri, Sep 27, 2019 at 10:12:14PM +0200, Bastien Nocera wrote:
> > On Fri, 2019-09-27 at 21:25 +0200, Greg KH wrote:
> > > On Fri, Sep 27, 2019 at 08:49:12PM +0200, Bastien Nocera wrote:
> > > > On Fri, 2019-09-27 at 13:56 -0400, Alan Stern wrote:
> > > > <snip>
> > > > > Is there any reason this needs to be done in a kernel driver?
> > > > 
> > > > To offer a unified interface all the devices with similar
> > > > needs.
> > > 
> > > What "other devices with similar needs?"
> > 
> > I would expect Android phones to be able to offer up a different
> > charging method depending on policy, and wanting to be able to
> > switch
> > charging methods.
> 
> I doubt it, it "should" be automatic based on the USB hardware
> configurations in the charger, not based on a random undocumented USB
> command sent from the host.  The USB spec describes how to do all of
> this properly without any commands at all, why not just rely on that?

That's not true, no. Until USB PD, there wasn't a way any ways for
devices to know that they could draw more current without either being
told so (as is done here), hardware modifications (with resistors being
wired to GND/VCC), or violating the USB spec.

In this case, Apple worked around the problem by having their OS,
running on their hardware, tell their peripherals to draw more power,
because the spec didn't allow this.

Those 2 articles should help understand the complexities of the
problem:
https://lwn.net/Articles/693027/
https://lwn.net/Articles/694062/

> Do you know of any Android device that requires a USB command like
> this?

Not that I could find, the Blackberry Q10 did though.

> > > > >   Can it 
> > > > > be handled from userspace instead?
> > > > 
> > > > It could, at a great infrastructure cost, trying to get buy-in
> > > > from
> > > > various distributions, at the very least.
> > > 
> > > For USB devices that _can_ be handled in userspace, we ask that
> > > they
> > > be
> > > done in userspace and not with a kernel driver.  Something that
> > > only
> > > does usb control messages with no other in-kernel api interfaces
> > > is
> > > ripe
> > > for a tiny userspace program using libusb.  Not for an in-kernel
> > > driver.
> > 
> > I don't quite understand why that would be when the kernel already
> > offers the API to be able to control it.
> 
> Again, if it _can_ be done in userspace, it _should_ be done in
> userspace when it comes to USB drivers/commands.

That's clear enough, although I still think it's wrong to try and move
to user-space things that have an existing clearly defined API in
kernel space. This would be akin to not allowing any new drivers for
webcams or USB sound cards because "they can be done in user-space".
Sure they can, but there's already an established API to handle them in
the kernel.

> > > > > You said this was for a "power supply" class driver.  It's
> > > > > not
> > > > > clear 
> > > > > what that means -- the devices you want to communicate with
> > > > > are 
> > > > > iphones, ipads, etc., not power supplies.
> > > > 
> > > > There's tons of "device" scope "power_supply" devices in the
> > > > kernel,
> > > > which don't power the Linux machine they're running on. Grep
> > > > for
> > > > "POWER_SUPPLY_SCOPE_DEVICE" in the kernel, most wireless mice
> > > > and
> > > > keyboards implement this already.
> > > 
> > > Yes, but those are real devices that the "Host" uses for power or
> > > something else.  wireless mice and keyboards already have kernel
> > > drivers
> > > so that's fine as well (but probably could be done from userspace
> > > too.)
> > 
> > It probably couldn't when the pipes to get key presses and the
> > battery
> > info are the same.
> 
> Are you sure?  They are really part of the USB HID spec?  Do you have
> pointers to that, for some reason I thought those were "out-of-band"
> vendor specific commands.

They're not part of the HID spec, but they don't have to be out-of-
band, or separate from the rest of the communication.

> > > > > Under what circumstances would these messages need to get
> > > > > sent?  
> > > > 
> > > > User-space would control it by changing the device's
> > > > POWER_SUPPLY_PROP_CHARGE_TYPE to "Fast", if available.
> > > > 
> > > > eg.
> > > > # echo "Fast" > /sys/devices/pci0000:00/0000:00:14.0/usb3/3-
> > > > 1/power_supply/apple_mfi_fastcharge/charge_type
> > > 
> > > power_supply class is for the power supply that is charging the
> > > cpu
> > > you
> > > type that on.  Not for the cpu of an attached device, right?
> > 
> > Again, power_supply class has a scope attached to it, so having the
> > driver in the kernel would actually make it easier, with user-space 
> > not
> > having to care whether the device uses an "Apple" method or
> > something
> > else.
> 
> Again, power_supply is for the power being sent to the host computer,
> right?  I don't think it is for power being sent from the host to
> another device, are you sure it is set up to control/monitor/handle
> that
> type of thing?

Yes I'm absolutely certain that user-space and the kernel can already
handle devices being powered by the . UPower has had support for
"device" power supply scope since 2012, which means that the kernel
support came before that.

> I do know that there are some USB power control things that probably
> should be tied into the power_supply logic sometime soon, but I do
> not
> know if that plumbing has been put into place yet in the power_supply
> class code.  Do you know if it has?

I don't know about the state of USB PD support I'm afraid.

