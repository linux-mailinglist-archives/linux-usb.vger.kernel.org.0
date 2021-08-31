Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274F73FCC07
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 19:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233834AbhHaRGL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 13:06:11 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33041 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S240535AbhHaREf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Aug 2021 13:04:35 -0400
Received: (qmail 373237 invoked by uid 1000); 31 Aug 2021 13:03:38 -0400
Date:   Tue, 31 Aug 2021 13:03:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
Message-ID: <20210831170338.GA371511@rowland.harvard.edu>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
 <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
 <20210830144613.GA332514@rowland.harvard.edu>
 <YS3y14DBrg0+n/iI@hovoldconsulting.com>
 <YS4OKKox+gZZZ/vV@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS4OKKox+gZZZ/vV@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 31, 2021 at 01:10:32PM +0200, Johan Hovold wrote:
> On Tue, Aug 31, 2021 at 11:13:59AM +0200, Johan Hovold wrote:
> > On Mon, Aug 30, 2021 at 10:46:13AM -0400, Alan Stern wrote:
> 
> > > Consider that a control message in a driver is likely to use the 
> > > default USB_CTRL_[GS]ET_TIMEOUT value of 5 seconds.  Does it make sense 
> > > to allow uninterruptible wait states to last as long as that?
> > 
> > Perhaps sometimes? I don't have a use case at hand, but I haven't
> > reviewed all drivers either.
> > 
> > The comment above usb_start_wait_urb() (which also needs to be updated,
> > by the way) even suggests that drivers should "implement their own
> > interruptible routines" so perhaps this has just gone unnoticed for 20
> > odd years. And the question then becomes, why didn't we use
> > interruptible sleep from the start?
> > 
> > And trying to answer that I find that that's precisely what we did, but
> > for some reason it was changed to uninterruptible sleep in v2.4.11
> > without a motivation (that I could easily find spelled out).
> 
> Here it is:
> 
> 	https://lore.kernel.org/lkml/20010818013101.A7058@devserv.devel.redhat.com/
> 
> It's rationale does not seem valid anymore (i.e. the NULL deref), but
> the example is still instructive.
> 
> If you close for example a v4l application you still expect the device
> to be shut down orderly but with interruptible sleep all control
> requests during shutdown will be aborted immediately.
> 
> Similar for USB serial devices which would for example fail to deassert
> DTR/RTS, etc. (I just verified with the patch applied.)

On Tue, Aug 31, 2021 at 01:02:11PM +0200, Oliver Neukum wrote:
> Upon further considerations forcing user space to handle signals also
> breaks the API, albeit in a more subtle manner. I'd suggest that we use
> wait_event_killable_timeout(). And do it the way Alan initially disliked,
> that is code a version for use by usbfs.
>
> Thus we'd avoid the issue of having an unkillable process, but we do
> not impose a need to handle signals.

Okay, I'll play it safe and rewrite the patch, adding special-purpose 
routines just for usbfs.

Will wait_event_killable_timeout() prevent complaints about tasks being 
blocked for too long (the reason syzbot reported this in the first 
place)?

Alan Stern
