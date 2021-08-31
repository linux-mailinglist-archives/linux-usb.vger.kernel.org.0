Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1823FC4EC
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 11:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240544AbhHaJPC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 05:15:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:42874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240521AbhHaJPC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Aug 2021 05:15:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09E386023F;
        Tue, 31 Aug 2021 09:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630401247;
        bh=IAgHR91hKhEicj3zgg8Vg+lZRalB+3Ppldexn4sH1GQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JwfUu1H/yTWW5uUUqExro8s28ISrHZV5+3i/NtOQKqk4QYTmnjV7LdRutCWaH4Nni
         l8vmwTulK3TiiT6sF5+YnleuetkhopVYAkcItAE2HXLVboyKZpjSutMjZwyMta2sgi
         Eqy/3b1wTsmhBNar5BjWj2V4s6gShxD8hlxRqbMe5adJoY/4gFPQ+Ip10/g7mP8gtD
         73yOaS6Vyzv+HOBKsfwXgiTsOGZTk+Wc22AkieDR99iNBB5hmpZiaR2Guek848NrYX
         bSDkeOiJwIwec1qIxqoRxPGH5ck8ZhZjkuhN3E227Meoud7goJbmSPzGbtTked05TB
         iE9cG7AmcecyA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mKzqB-0007T2-Ur; Tue, 31 Aug 2021 11:14:00 +0200
Date:   Tue, 31 Aug 2021 11:13:59 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
Message-ID: <YS3y14DBrg0+n/iI@hovoldconsulting.com>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
 <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
 <20210830144613.GA332514@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830144613.GA332514@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 30, 2021 at 10:46:13AM -0400, Alan Stern wrote:
> On Mon, Aug 30, 2021 at 09:56:50AM +0200, Johan Hovold wrote:
> > On Sat, Aug 28, 2021 at 09:58:25PM -0400, Alan Stern wrote:
> > > This patch fixes the problem by converting the uninterruptible wait to
> > > an interruptible one.  For the most part this won't affect calls to
> > > usb_start_wait_urb(), because they are made by kernel threads and so
> > > can't receive most signals.
> > > 
> > > But in some cases such calls may occur in user threads in contexts
> > > other than usbfs ioctls.  A signal in these circumstances could cause
> > > a USB transfer to fail when otherwise it wouldn't.  The outcome
> > > wouldn't be too dreadful, since USB transfers can fail at any time and
> > > the system is prepared to handle these failures gracefully.  In
> > > theory, for example, a signal might cause a driver's probe routine to
> > > fail; in practice if the user doesn't want a probe to fail then he
> > > shouldn't send interrupt signals to the probing process.
> > 
> > While probe() triggered through sysfs or by module loading is one
> > example, the USB msg helpers are also called in a lot of other
> > user-thread contexts such as open() calls etc. It might even be that the
> > majority of these calls can be done from user threads (post
> > enumeration).
> 
> Could be.  It's not a well defined matter; it depends on what drivers 
> are in use and how they are used.

Right, but the commit message seemed to suggest that these helpers being
run from interruptible threads was the exception.

> Consider that a control message in a driver is likely to use the 
> default USB_CTRL_[GS]ET_TIMEOUT value of 5 seconds.  Does it make sense 
> to allow uninterruptible wait states to last as long as that?

Perhaps sometimes? I don't have a use case at hand, but I haven't
reviewed all drivers either.

The comment above usb_start_wait_urb() (which also needs to be updated,
by the way) even suggests that drivers should "implement their own
interruptible routines" so perhaps this has just gone unnoticed for 20
odd years. And the question then becomes, why didn't we use
interruptible sleep from the start?

And trying to answer that I find that that's precisely what we did, but
for some reason it was changed to uninterruptible sleep in v2.4.11
without a motivation (that I could easily find spelled out).

> And to what extent does it matter if we make these delays 
> interruptible?  A signal delivered during a system call will be fielded 
> when the call returns if not earlier; the only difference will be that 
> now some USB messages may be aborted.  For things like SIGINT or 
> SIGTERM this seems reasonable.  (I'm not so sure about things like 
> SIGALRM, SIGIO, or SIGSTOP, though.)

I'm not saying I'm necessarily against the change. It just seemed a bit
rushed to change the (stable) API like this while claiming it won't
affect most call sites.

> > > Overall, then, making these delays interruptible seems to be an
> > > acceptable risk.
> > 
> > Possibly, but changing the API like this to fix the usbfs ioctls seems
> > like using a bit of a too big hammer to me, especially when backporting
> > to stable.
> 
> Perhaps the stable backport could be delayed for a while (say, one 
> release cycle).

That might work.

> Do you have alternative suggestions?  I don't think we want special 
> interruptible versions of usb_control_msg() and usb_bulk_msg() just for 
> use by usbfs.

usbfs could carry a temporary local implementation as the documentation
for usb_start_wait_urb() currently suggests. I assume we can't limit the
usbfs timeouts.

Johan
