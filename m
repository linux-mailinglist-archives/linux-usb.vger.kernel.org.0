Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46A44A5D4
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 17:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbfFRPuC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 11:50:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:40226 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729272AbfFRPuC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 11:50:02 -0400
Received: (qmail 5882 invoked by uid 2102); 18 Jun 2019 11:50:01 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 18 Jun 2019 11:50:01 -0400
Date:   Tue, 18 Jun 2019 11:50:01 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <oneukum@suse.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1560866441.8425.8.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1906181133570.1659-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 18 Jun 2019, Mayuresh Kulkarni wrote:

> > You're right that the program needs to know when the device is about
> > to 
> > be suspended.  But waiting for an ioctl to return isn't a good way 
> > to do it; this needs to be a callback of some sort.  That is, the 
> > kernel also needs to know when the program is ready for the suspend.
> > 
> > I don't know what is the best approach.
> 
> This is becoming tricky now.

Yes.  There probably are mechanisms already in use in other parts of 
the kernel that would be suitable here, but I don't know what they are.  
We could try asking some other people for advice.

> I think my point is - usbfs driver is actually doing nothing w.r.t USB-
> 2.0 L2 state, right? The root-hub's suspend will invoke the USB-2.0 L2
> transitions. This will happen when all the USB devices on that port
> report idle to USB-core.
> I agree that usually driver's suspend/resume call-back will put the
> device in its low power state. But that is not applicable to udev of
> usbfs driver, right?

It doesn't work quite the way you think.  The suspend callback informs
the driver that the device is about to enter a low-power state.  The
callback's job is to make the driver stop trying to communicate with
the device, since all such communication attempts will fail once the
device is suspended.

The suspend callback is _not_ responsible for actually suspending the
device; that is handled by the USB subsystem core.

These ideas are indeed applicable to programs using usbfs.  The kernel
needs to have a way to inform the program that the device is about
enter (or has just left) a low-power state, so that the program can
stop (or start) trying to communicate with the device.  And the kernel 
needs to know when the program is ready for the state change.

> So, doesn't it makes sense to tell user-space about actual USB-2.0 L2
> state transitions rather than suspend/resume entry call-backs of device-
> driver model of kernel (which are stub in this context)?

Yes, that's what we need to figure out.  But things have to happen in 
the right order; otherwise you could encounter a situation where the 
userspace program's URBs start failing and the program doesn't learn 
until later that the reason is because the device is being suspended.

Alan Stern

