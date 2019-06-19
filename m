Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E492D4B4D2
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 11:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfFSJTo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 05:19:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:34356 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731293AbfFSJTo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jun 2019 05:19:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 91AB1ADCF;
        Wed, 19 Jun 2019 09:19:43 +0000 (UTC)
Message-ID: <1560935981.4587.10.camel@suse.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        patches@opensource.cirrus.com, linux-usb@vger.kernel.org
Date:   Wed, 19 Jun 2019 11:19:41 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906181133570.1659-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906181133570.1659-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 18.06.2019, 11:50 -0400 schrieb Alan Stern:
> On Tue, 18 Jun 2019, Mayuresh Kulkarni wrote:
> 
> > > You're right that the program needs to know when the device is about
> > > to 
> > > be suspended.  But waiting for an ioctl to return isn't a good way 
> > > to do it; this needs to be a callback of some sort.  That is, the 
> > > kernel also needs to know when the program is ready for the suspend.
> > > 
> > > I don't know what is the best approach.
> > 
> > This is becoming tricky now.
> 
> Yes.  There probably are mechanisms already in use in other parts of 
> the kernel that would be suitable here, but I don't know what they are.  
> We could try asking some other people for advice.

Waiting for an ioctl() is horrible. If you really want to do this
poll() would be the obvious API. It is made for waiting for changes
of states.

[..]
> The suspend callback is _not_ responsible for actually suspending the
> device; that is handled by the USB subsystem core.
> 
> These ideas are indeed applicable to programs using usbfs.  The kernel

Not fully. Usbfs has the same issue as FUSE here. Drivers are per
interface but power management is per device. Hence every driver
is in the block IO path for these issues. You cannot do block IO
in user space. The best you can do is notify of state changes,
but you cannot wait for them.

> needs to have a way to inform the program that the device is about
> enter (or has just left) a low-power state, so that the program can
> stop (or start) trying to communicate with the device.  And the kernel 
> needs to know when the program is ready for the state change.

That has difficulties based in fundamental issues. We can let user
space block power transitions. We can notify it. But we cannot
block on it.

It would be easiest to export the usb_autopm_* API to user space.

	Regards
		Oliver

