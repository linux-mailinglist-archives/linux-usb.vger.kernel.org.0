Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E869D245875
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 18:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgHPQFv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Aug 2020 12:05:51 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57547 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726407AbgHPQFv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Aug 2020 12:05:51 -0400
Received: (qmail 87302 invoked by uid 1000); 16 Aug 2020 12:05:50 -0400
Date:   Sun, 16 Aug 2020 12:05:50 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        John Garry <john.garry@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
Message-ID: <20200816160550.GB86937@rowland.harvard.edu>
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
 <20200813182811.GA4035999@kroah.com>
 <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
 <30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com>
 <20200814180720.GE1891694@smile.fi.intel.com>
 <20200814195119.GA45072@rowland.harvard.edu>
 <CAHp75VdMXd3LWLM5ooBsWGZnSXnJBW3R5gH9Cpux0EHmcxjTvQ@mail.gmail.com>
 <20200815015000.GA52242@rowland.harvard.edu>
 <CAHp75VdCCe=sKuas+sdu__qYVSEO4pKqZ8RGq_Jxaoh91HXZ+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdCCe=sKuas+sdu__qYVSEO4pKqZ8RGq_Jxaoh91HXZ+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 16, 2020 at 11:33:14AM +0300, Andy Shevchenko wrote:
> On Sat, Aug 15, 2020 at 4:50 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Sat, Aug 15, 2020 at 12:55:57AM +0300, Andy Shevchenko wrote:
> > > On Friday, August 14, 2020, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > On Fri, Aug 14, 2020 at 09:07:20PM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Aug 14, 2020 at 06:18:16PM +0100, John Garry wrote:
> 
> ...
> 
> > > > > > -   usb_put_hcd(hcd);
> > > > > >     if ((hcd->driver->flags & HCD_MASK) < HCD_USB3)
> > > > > >             pci_free_irq_vectors(dev);
> > > > > > +   usb_put_hcd(hcd);
> > > > >
> > > > > It's not correct approach.
> > > > > We need to copy flags to a temporary variable.
> > > > > I will send a new patch soon to test, thanks!
> > > >
> > > > Just out of curiosity, can you explain what is wrong with John's
> > > > approach?  The problem isn't obvious to me.
> > >
> > >
> > > Alloc vector -> create HCD -> put HCD -> free vector
> > >
> > > VS.
> > >
> > > Alloc vector -> create HCD -> free vector -> put HCD
> > >
> > > Of course I might miss something...
> >
> > Sure, the difference in ordering was pretty obvious.  What is not
> > obvious is why this should cause a problem.
> 
> It may be not causing any problem right now, but with all these small
> steps we may come to the case like DWC3 removal mess.
> 
> > Do you think that the host controller driver is going to try to use the
> > IRQ vector somewhere between the pci_free_irq_vectors call and the
> > usb_put_hcd call?  If that's not going to happen then I don't see what
> > difference the order of the two calls makes.
> 
> I think that this is a bit incorrect to rely on side-effects to ruin
> the clear understanding of what ordering is going on. If you insist,
> you can take John's solution, but I won't give a tag on such.
> 
> Also take into consideration the possible copy'n'paste of this example
> to other drivers. I have seen a lot of bad examples were
> copied'n'pasted all over the kernel during my reviews. I don't want to
> give another one.
> 
> So, the review process, in my opinion, should be slightly broader that
> we usually understand it, i.e. take into account:
> - *run-time* bisectability
> - possible copy'n'paste of the code excerpts

I see.  So you use "correct" in the broader sense of "good form" as well 
as strict correctness.  (It was confusing because I wouldn't conflate 
those two different concepts.)

Okay, now your reply makes sense.

Alan Stern
