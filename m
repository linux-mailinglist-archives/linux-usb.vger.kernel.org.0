Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95F96C0C71
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 22:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbfI0UMS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 16:12:18 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:60055 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728236AbfI0UMS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 16:12:18 -0400
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BE35A24000B;
        Fri, 27 Sep 2019 20:12:15 +0000 (UTC)
Message-ID: <48bcb34194695566b9c59f6e814706f8d65be962.camel@hadess.net>
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        benjamin.tissoires@redhat.com
Date:   Fri, 27 Sep 2019 22:12:14 +0200
In-Reply-To: <20190927192554.GB1805907@kroah.com>
References: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
         <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
         <20190927192554.GB1805907@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-09-27 at 21:25 +0200, Greg KH wrote:
> On Fri, Sep 27, 2019 at 08:49:12PM +0200, Bastien Nocera wrote:
> > On Fri, 2019-09-27 at 13:56 -0400, Alan Stern wrote:
> > <snip>
> > > Is there any reason this needs to be done in a kernel driver?
> > 
> > To offer a unified interface all the devices with similar needs.
> 
> What "other devices with similar needs?"

I would expect Android phones to be able to offer up a different
charging method depending on policy, and wanting to be able to switch
charging methods.

> > >   Can it 
> > > be handled from userspace instead?
> > 
> > It could, at a great infrastructure cost, trying to get buy-in from
> > various distributions, at the very least.
> 
> For USB devices that _can_ be handled in userspace, we ask that they
> be
> done in userspace and not with a kernel driver.  Something that only
> does usb control messages with no other in-kernel api interfaces is
> ripe
> for a tiny userspace program using libusb.  Not for an in-kernel
> driver.

I don't quite understand why that would be when the kernel already
offers the API to be able to control it.

> > > You said this was for a "power supply" class driver.  It's not
> > > clear 
> > > what that means -- the devices you want to communicate with are 
> > > iphones, ipads, etc., not power supplies.
> > 
> > There's tons of "device" scope "power_supply" devices in the
> > kernel,
> > which don't power the Linux machine they're running on. Grep for
> > "POWER_SUPPLY_SCOPE_DEVICE" in the kernel, most wireless mice and
> > keyboards implement this already.
> 
> Yes, but those are real devices that the "Host" uses for power or
> something else.  wireless mice and keyboards already have kernel
> drivers
> so that's fine as well (but probably could be done from userspace
> too.)

It probably couldn't when the pipes to get key presses and the battery
info are the same.

> > > Under what circumstances would these messages need to get sent?  
> > 
> > User-space would control it by changing the device's
> > POWER_SUPPLY_PROP_CHARGE_TYPE to "Fast", if available.
> > 
> > eg.
> > # echo "Fast" > /sys/devices/pci0000:00/0000:00:14.0/usb3/3-
> > 1/power_supply/apple_mfi_fastcharge/charge_type
> 
> power_supply class is for the power supply that is charging the cpu
> you
> type that on.  Not for the cpu of an attached device, right?

Again, power_supply class has a scope attached to it, so having the
driver in the kernel would actually make it easier, with user-space not
having to care whether the device uses an "Apple" method or something
else.

