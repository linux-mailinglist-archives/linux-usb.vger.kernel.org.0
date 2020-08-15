Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3555F2454F1
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 01:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgHOXgm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Aug 2020 19:36:42 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56143 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726717AbgHOXgm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Aug 2020 19:36:42 -0400
Received: (qmail 52323 invoked by uid 1000); 14 Aug 2020 21:50:00 -0400
Date:   Fri, 14 Aug 2020 21:50:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        John Garry <john.garry@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
Message-ID: <20200815015000.GA52242@rowland.harvard.edu>
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
 <20200813182811.GA4035999@kroah.com>
 <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
 <30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com>
 <20200814180720.GE1891694@smile.fi.intel.com>
 <20200814195119.GA45072@rowland.harvard.edu>
 <CAHp75VdMXd3LWLM5ooBsWGZnSXnJBW3R5gH9Cpux0EHmcxjTvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdMXd3LWLM5ooBsWGZnSXnJBW3R5gH9Cpux0EHmcxjTvQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 15, 2020 at 12:55:57AM +0300, Andy Shevchenko wrote:
> On Friday, August 14, 2020, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> > On Fri, Aug 14, 2020 at 09:07:20PM +0300, Andy Shevchenko wrote:
> > > On Fri, Aug 14, 2020 at 06:18:16PM +0100, John Garry wrote:
> >
> > > > diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> > > > index 4dc443aaef5c..44a8d3644973 100644
> > > > --- a/drivers/usb/core/hcd-pci.c
> > > > +++ b/drivers/usb/core/hcd-pci.c
> > > > @@ -346,9 +346,9 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
> > > >             dev_set_drvdata(&dev->dev, NULL);
> > > >             up_read(&companions_rwsem);
> > > >     }
> > > > -   usb_put_hcd(hcd);
> > > >     if ((hcd->driver->flags & HCD_MASK) < HCD_USB3)
> > > >             pci_free_irq_vectors(dev);
> > > > +   usb_put_hcd(hcd);
> > >
> > > It's not correct approach.
> > > We need to copy flags to a temporary variable.
> > > I will send a new patch soon to test, thanks!
> >
> > Just out of curiosity, can you explain what is wrong with John's
> > approach?  The problem isn't obvious to me.
> 
> 
> Alloc vector -> create HCD -> put HCD -> free vector
> 
> VS.
> 
> Alloc vector -> create HCD -> free vector -> put HCD
> 
> Of course I might miss something...

Sure, the difference in ordering was pretty obvious.  What is not 
obvious is why this should cause a problem.

Do you think that the host controller driver is going to try to use the 
IRQ vector somewhere between the pci_free_irq_vectors call and the 
usb_put_hcd call?  If that's not going to happen then I don't see what 
difference the order of the two calls makes.

Alan Stern
