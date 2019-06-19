Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D5D4BDB0
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 18:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729701AbfFSQH3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 12:07:29 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:54572 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727880AbfFSQH3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 12:07:29 -0400
Received: (qmail 5122 invoked by uid 2102); 19 Jun 2019 12:07:28 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Jun 2019 12:07:28 -0400
Date:   Wed, 19 Jun 2019 12:07:28 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1560957124.4587.20.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1906191153310.1596-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 19 Jun 2019, Oliver Neukum wrote:

> Am Mittwoch, den 19.06.2019, 10:40 -0400 schrieb Alan Stern:
> > On Wed, 19 Jun 2019, Oliver Neukum wrote:
> 
> > > It would be easiest to export the usb_autopm_* API to user space.
> > 
> > But ->suspend and ->resume callbacks are part of that API, and as you 
> > say, it is not feasible to have these callbacks run in userspace.
> 
> We can notify user space about resume(). There will be a delay, but
> there will always be a delay, even in kernel space.
> 
> > The only solution I can think of is for the userspace program to first
> > set the device's autosuspend delay to 0.  Then whenever the
> > WAIT_FOR_RESUME ioctl returns -- even if it returns immediately -- the
> > program should assume the suspend is over or is not going to happen.  
> > Then the program can run normally for a short while (10 seconds,
> > perhaps) before making another attempt to suspend.
> 
> That is ugly. Quite ugly actually.
> 
> Why actually do we care about suspend()? Would the user space
> task do anything else but cease IO? We can do that in usbfs,
> assuming we do not care about the order of killing.
> User space will learn from an appropriate error code the device
> went to power save. And if it does not do IO, why care?
> I have never seen a driver that actually saves device state in
> suspend().

Learning from error codes is problematic.  According to the current
design, any usbfs interaction (except for the specific suspend/resume
ioctls) will cause usbfs to do a usb_autoresume_device(), thus
preventing a suspend from occurring.

Evidently we need to rethink this.  In fact, the userspace program
needs to be able to interact with the device right up until the point
where it actually gets suspended.  And of course, this implies that the
program needs to be able to reap URBs even after the device is
suspended.

That sort of approach ought to be workable.  Once the program sees that 
its URBs are failing with the appropriate error codes, it can call the 
WAIT_FOR_RESUME ioctl.

Alan Stern

