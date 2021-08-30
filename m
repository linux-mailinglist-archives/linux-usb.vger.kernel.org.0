Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE2D3FB872
	for <lists+linux-usb@lfdr.de>; Mon, 30 Aug 2021 16:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237203AbhH3OrK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Aug 2021 10:47:10 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35319 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231757AbhH3OrJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Aug 2021 10:47:09 -0400
Received: (qmail 333900 invoked by uid 1000); 30 Aug 2021 10:46:13 -0400
Date:   Mon, 30 Aug 2021 10:46:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
Message-ID: <20210830144613.GA332514@rowland.harvard.edu>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
 <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 30, 2021 at 09:56:50AM +0200, Johan Hovold wrote:
> On Sat, Aug 28, 2021 at 09:58:25PM -0400, Alan Stern wrote:
> > This patch fixes the problem by converting the uninterruptible wait to
> > an interruptible one.  For the most part this won't affect calls to
> > usb_start_wait_urb(), because they are made by kernel threads and so
> > can't receive most signals.
> > 
> > But in some cases such calls may occur in user threads in contexts
> > other than usbfs ioctls.  A signal in these circumstances could cause
> > a USB transfer to fail when otherwise it wouldn't.  The outcome
> > wouldn't be too dreadful, since USB transfers can fail at any time and
> > the system is prepared to handle these failures gracefully.  In
> > theory, for example, a signal might cause a driver's probe routine to
> > fail; in practice if the user doesn't want a probe to fail then he
> > shouldn't send interrupt signals to the probing process.
> 
> While probe() triggered through sysfs or by module loading is one
> example, the USB msg helpers are also called in a lot of other
> user-thread contexts such as open() calls etc. It might even be that the
> majority of these calls can be done from user threads (post
> enumeration).

Could be.  It's not a well defined matter; it depends on what drivers 
are in use and how they are used.

Consider that a control message in a driver is likely to use the 
default USB_CTRL_[GS]ET_TIMEOUT value of 5 seconds.  Does it make sense 
to allow uninterruptible wait states to last as long as that?

And to what extent does it matter if we make these delays 
interruptible?  A signal delivered during a system call will be fielded 
when the call returns if not earlier; the only difference will be that 
now some USB messages may be aborted.  For things like SIGINT or 
SIGTERM this seems reasonable.  (I'm not so sure about things like 
SIGALRM, SIGIO, or SIGSTOP, though.)

> > Overall, then, making these delays interruptible seems to be an
> > acceptable risk.
> 
> Possibly, but changing the API like this to fix the usbfs ioctls seems
> like using a bit of a too big hammer to me, especially when backporting
> to stable.

Perhaps the stable backport could be delayed for a while (say, one 
release cycle).

Do you have alternative suggestions?  I don't think we want special 
interruptible versions of usb_control_msg() and usb_bulk_msg() just for 
use by usbfs.

Alan Stern
