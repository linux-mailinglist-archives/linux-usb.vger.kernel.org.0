Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 943384BBD7
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 16:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfFSOk6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 10:40:58 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:54344 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726865AbfFSOk6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 10:40:58 -0400
Received: (qmail 3582 invoked by uid 2102); 19 Jun 2019 10:40:57 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Jun 2019 10:40:57 -0400
Date:   Wed, 19 Jun 2019 10:40:57 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1560935981.4587.10.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1906191024150.1596-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 19 Jun 2019, Oliver Neukum wrote:

> Am Dienstag, den 18.06.2019, 11:50 -0400 schrieb Alan Stern:
> > On Tue, 18 Jun 2019, Mayuresh Kulkarni wrote:
> > 
> > > > You're right that the program needs to know when the device is about
> > > > to 
> > > > be suspended.  But waiting for an ioctl to return isn't a good way 
> > > > to do it; this needs to be a callback of some sort.  That is, the 
> > > > kernel also needs to know when the program is ready for the suspend.
> > > > 
> > > > I don't know what is the best approach.
> > > 
> > > This is becoming tricky now.
> > 
> > Yes.  There probably are mechanisms already in use in other parts of 
> > the kernel that would be suitable here, but I don't know what they are.  
> > We could try asking some other people for advice.
> 
> Waiting for an ioctl() is horrible. If you really want to do this
> poll() would be the obvious API. It is made for waiting for changes
> of states.
> 
> [..]
> > The suspend callback is _not_ responsible for actually suspending the
> > device; that is handled by the USB subsystem core.
> > 
> > These ideas are indeed applicable to programs using usbfs.  The kernel
> 
> Not fully. Usbfs has the same issue as FUSE here. Drivers are per
> interface but power management is per device. Hence every driver
> is in the block IO path for these issues. You cannot do block IO
> in user space. The best you can do is notify of state changes,
> but you cannot wait for them.

usbfs access is per-device, not per-interface, but your point remains 
valid.

> > needs to have a way to inform the program that the device is about
> > enter (or has just left) a low-power state, so that the program can
> > stop (or start) trying to communicate with the device.  And the kernel 
> > needs to know when the program is ready for the state change.
> 
> That has difficulties based in fundamental issues. We can let user
> space block power transitions. We can notify it. But we cannot
> block on it.
> 
> It would be easiest to export the usb_autopm_* API to user space.

But ->suspend and ->resume callbacks are part of that API, and as you 
say, it is not feasible to have these callbacks run in userspace.

The only solution I can think of is for the userspace program to first
set the device's autosuspend delay to 0.  Then whenever the
WAIT_FOR_RESUME ioctl returns -- even if it returns immediately -- the
program should assume the suspend is over or is not going to happen.  
Then the program can run normally for a short while (10 seconds,
perhaps) before making another attempt to suspend.

The only change I would make to the patch posted earlier is to have 
proc_wait_for_resume() call usb_autoresume_device() and set 
ps->suspend_requested = false before returning.

Mayuresh, how does that sound?

Alan Stern

