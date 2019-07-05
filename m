Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E74D560DA8
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 00:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbfGEWMA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 18:12:00 -0400
Received: from gate.crashing.org ([63.228.1.57]:57779 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfGEWMA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 18:12:00 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x65MBlIZ013990;
        Fri, 5 Jul 2019 17:11:49 -0500
Message-ID: <7469123f1d33e5aacdabc447cd124ca173bf350d.camel@kernel.crashing.org>
Subject: Re: [PATCH V3] usb: gadget: storage: Remove warning message
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     EJ Hsu <ejh@nvidia.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        WK Tsai <wtsai@nvidia.com>
Date:   Sat, 06 Jul 2019 08:11:47 +1000
In-Reply-To: <Pine.LNX.4.44L0.1907051422000.1606-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1907051422000.1606-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-05 at 14:28 -0400, Alan Stern wrote:
> On Fri, 5 Jul 2019, Benjamin Herrenschmidt wrote:
> 
> > (following our conversation)
> > 
> > Here's a completely untested alternative patch (it replaces my previous
> > one) that fixes it a bit differently.
> > 
> > This time it should handle the case of a disconnect happening
> > before we have dequeued a config change.
> > 
> > This assumes that it's correct to never call
> > usb_composite_setup_continue() if an fsg_disable() happens after a
> > fsg_set_alt() and before we have processed the latter.
> 
> That should be handled okay.  If it isn't, the composite core needs to 
> be fixed.

Ok. I'll have a quick look to make sure.

 .../...

> Yes, this looks just right.  If I had thought about this a little more
> deeply earlier on, I would have come up with a patch very much like
> this.

Right, so as I grow more familiar with that code and its intent, I
agree, I'm much happier with this. Hopefully it passes my tests. I'll
tidy up as per your comments and repost properly if all goes well along
with some other things I piled up.

Cheers,
Ben.


> My only comments are cosmetic.
> 
> > ---
> >  drivers/usb/gadget/function/f_mass_storage.c | 26 ++++++++++++--------
> >  1 file changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> > index 043f97ad8f22..2ef029413b01 100644
> > --- a/drivers/usb/gadget/function/f_mass_storage.c
> > +++ b/drivers/usb/gadget/function/f_mass_storage.c
> 
> > @@ -2285,16 +2292,14 @@ static int do_set_interface(struct fsg_common *common, struct fsg_dev *new_fsg)
> >  static int fsg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
> >  {
> >       struct fsg_dev *fsg = fsg_from_func(f);
> 
> While you're changing this, it would be nice to add the customary blank 
> line here.
> 
> > -     fsg->common->new_fsg = fsg;
> > -     raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);
> > +     __raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE, fsg);
> >       return USB_GADGET_DELAYED_STATUS;
> >  }
> >  
> >  static void fsg_disable(struct usb_function *f)
> >  {
> >       struct fsg_dev *fsg = fsg_from_func(f);
> 
> And here.  Otherwise:
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Alan Stern

