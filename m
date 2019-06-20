Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4834D26F
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 17:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbfFTPtb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 11:49:31 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:44756 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726530AbfFTPtb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 11:49:31 -0400
Received: (qmail 4478 invoked by uid 2102); 20 Jun 2019 11:49:30 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Jun 2019 11:49:30 -0400
Date:   Thu, 20 Jun 2019 11:49:30 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1561043507.20348.26.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1906201145280.1512-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 20 Jun 2019, Mayuresh Kulkarni wrote:

> On Wed, 2019-06-19 at 10:40 -0400, Alan Stern wrote:

> > The only solution I can think of is for the userspace program to first
> > set the device's autosuspend delay to 0.  Then whenever the
> > WAIT_FOR_RESUME ioctl returns -- even if it returns immediately -- the
> > program should assume the suspend is over or is not going to happen.  
> > Then the program can run normally for a short while (10 seconds,
> > perhaps) before making another attempt to suspend.
> > 
> 
> Looks like usb_autosuspend_delay parameter is applicable to all USB
> devices. Also, since it is a module parameter, it might be tuned on a
> particular platform (e.g.: from init.<vendor>.rc on Android).
> So, I am not sure if it is good idea to rely on user-space to change it
> and restore it to original value when the USB device of interest is
> detached.

That's up to you.  There are lots of different ways to set the 
autosuspend delay.  For example, you could create a udev rule that 
would do it only for the devices your program handles.

> > The only change I would make to the patch posted earlier is to have 
> > proc_wait_for_resume() call usb_autoresume_device() and set 
> > ps->suspend_requested = false before returning.
> > 
> > Mayuresh, how does that sound?
> 
> With the code-changes you send me (in response to the
> patch), usb_autoresume_device() will be called when the waiter
> in proc_wait_for_resume() will return and send some message to "know"
> why resume happened.
> 
> With above proposed change, proc_wait_for_resume() will return
> with usb_autoresume_device() and suspend_requested = false. So when the
> user-space will send some message to "know" resume reason, the checks in
> ioctl() handler will be skipped.
> 
> (Apologies if above is obvious, but still wanted to comment so that we
> are on same page).
> 
> With that said, I think there would be an issue with "host-wake" case as
> below - the sequence of operations are:
> - suspend ioctl called: assume actual bus suspend happens
> - wait-for-resume ioctl called
> - after a while user-space wants to send a message (due to end user
> interaction for example)
> 
> Here the ioctl() will do usb_autoresume_device() since suspend_requested
> = true. This will end up calling usbfs_notify_resume() which will
> release waiter in proc_wait_for_resume(). And due to above proposed
> change, it will end up calling usb_autoresume_device() again.
> 
> As a result, suspend will not happen for next suspend ioctl call.

Obviously the code would need to be more careful.  It would call 
usb_autoresume_device() only if ps->suspend_requested was true.

Alan Stern

> So, looks like the original proposed change seems better here. On the
> side note, I am still in process of verifying the code changes.

