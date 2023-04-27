Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65FC96F0817
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 17:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243932AbjD0PSX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 11:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243404AbjD0PSV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 11:18:21 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 23E3544A0
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 08:18:18 -0700 (PDT)
Received: (qmail 165979 invoked by uid 1000); 27 Apr 2023 11:18:17 -0400
Date:   Thu, 27 Apr 2023 11:18:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss (bitmap).
Message-ID: <8b0684fc-c312-4315-ab01-d45ef7a87725@rowland.harvard.edu>
References: <20230426114528.3996-1-wlodzimierz.lipert@gmail.com>
 <99b09680-b362-431c-aa9f-a07722d0eba3@rowland.harvard.edu>
 <CABygZEqTLfa3ydW_HAdGmBVCgr0nXyj9k0ZFeHGcy+tMDmgm_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABygZEqTLfa3ydW_HAdGmBVCgr0nXyj9k0ZFeHGcy+tMDmgm_g@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 27, 2023 at 07:55:13AM +0200, Wlodzimierz Lipert wrote:
> Hi Alan,
> 
> Thanks for the feedback, could you please see my comments below.
> Mask logic is not clear straight away and I probably should be more
> verbose in patch description.
> Maybe you could reconsider the changes.
> 
> On Thu, Apr 27, 2023 at 3:08 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Wed, Apr 26, 2023 at 01:45:28PM +0200, Wlodzimierz Lipert wrote:
> > > usb_ep_autoconfig_ss tries to use endpoint name or internal counters to generate
> > > bEndpointAddress - this leads to duplicate addresses. Fix changes the
> > > way in/out_epnum is used, now as bitmap which represents unavailable ep numbers.
> > >
> > > Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
> > > ---
> > >  drivers/usb/gadget/epautoconf.c | 35 ++++++++++++++++++++++-----------
> > >  include/linux/usb/gadget.h      |  4 ++--
> > >  2 files changed, 26 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epautoconf.c
> > > index 1eb4fa2e623f..50a2e8a90447 100644
> > > --- a/drivers/usb/gadget/epautoconf.c
> > > +++ b/drivers/usb/gadget/epautoconf.c
> > > @@ -67,6 +67,11 @@ struct usb_ep *usb_ep_autoconfig_ss(
> > >  )
> > >  {
> > >       struct usb_ep   *ep;
> > > +     unsigned *epnum_map;
> > > +     /* ep num 0 is reserved: not available for auto configuration */
> > > +     u8 num = 1;
> > > +     /* USB allows up to 16 IN and 16 OUT enpoints */
> > > +     unsigned num_mask = 0xFFFFU;
> >
> > I think these initializers aren't needed.  They apply only in the case
> > where the endpoint name doesn't encode a number.
> 
> initialization is needed to ensure we stay within 16 bits and we don't
> try to use bit 0.
> 
> >
> > >       if (gadget->ops->match_ep) {
> > >               ep = gadget->ops->match_ep(gadget, desc, ep_comp);
> > > @@ -94,18 +99,25 @@ struct usb_ep *usb_ep_autoconfig_ss(
> > >       /* report address */
> > >       desc->bEndpointAddress &= USB_DIR_IN;
> > >       if (isdigit(ep->name[2])) {
> > > -             u8 num = simple_strtoul(&ep->name[2], NULL, 10);
> > > -             desc->bEndpointAddress |= num;
> > > -     } else if (desc->bEndpointAddress & USB_DIR_IN) {
> > > -             if (++gadget->in_epnum > 15)
> > > +             num = simple_strtoul(&ep->name[2], NULL, 10);
> > > +             if (num > 15)
> > >                       return NULL;
> >
> > This check shouldn't be here, at least, not in this form.  If num > 15
> > it's a bug in the UDC driver; we could report it that way.
> >
> 
> the check is there to make logic below work,
> its return value is consistent with the rest of the cases.
> 
> > > -             desc->bEndpointAddress = USB_DIR_IN | gadget->in_epnum;
> > > -     } else {
> > > -             if (++gadget->out_epnum > 15)
> > > -                     return NULL;
> > > -             desc->bEndpointAddress |= gadget->out_epnum;
> > > +             num_mask = 1U << num;
> > >       }
> > >
> > > +     epnum_map = desc->bEndpointAddress & USB_DIR_IN
> > > +             ? &gadget->in_epnum : &gadget->out_epnum;
> > > +
> > > +     /* check if requested ep number (if name encodes it) or any is available */
> > > +     if (num_mask == (*epnum_map & num_mask))
> > > +             return NULL;
> > > +
> > > +     /* find first available ep number (if not encoded in ep name) */
> > > +     while (*epnum_map & (1U << num))
> > > +             ++num;
> >
> > This rearrangement of the code is kind of awkward.  It would be better
> > to put the availability check for the encoded-number case into the "if"
> > clause, and put the search inside an "else" section, rather than trying
> > to combine two rather different computations into a single piece of
> > code.  That way you wouldn't need num_mask at all.
> >
> > Also, your "while" loop doesn't enforce num <= 15.  For that matter, it
> > might be more efficient to use a "find first bit" library routine rather
> > than coding your own loop.
> 
> The code structure tries to make the amount of branches minimal,
>  this why I introduced mask and epnum_map ptr.
> num <= 15 is enforced by mask itself:
>  " if (num_mask == (*epnum_map & num_mask))" will return NULL
> in case "encoded" ep is already unavailable or all the ep are unavailable so
> we wont go any further (avoiding inc. num above 15).
> 
> >
> > > +
> > > +     *epnum_map |= 1U << num;
> > > +     desc->bEndpointAddress |= num;
> > >       ep->address = desc->bEndpointAddress;
> > >       ep->desc = NULL;
> > >       ep->comp_desc = NULL;

Here's what I was thinking of.  Maybe when you see it written out, 
you'll agree that this approach is simpler and easier to follow.

	...
	unsigned int	*epmap;
	unsigned int	num;

	...
	epmap = (usb_endpoint_dir_in(desc) ?
			&gadget->in_epnum : &gadget->out_epnum);
	if (isdigit(ep->name[2])) {		/* Number encoded in name */
		num = simple_strtoul(&ep->name[2], NULL, 10);
		if (*epmap & (1 << num))
			return NULL;		/* Endpoint is unavailable */

	} else {				/* Find first available */
		num = ffz(*epnum_map) - 1;
		if (num > 15)
			return NULL;		/* No endpoints available */
	}

	*epmap |= 1 << num;
	desc->bEndpointAddress |= num;
	...

And then of course the usb_ep_autoconfig_reset() routine would set 
both gadget->in_epnum and gadget->out_epnum to 1, like in your patch.
You could even change their names to in_epmap and out_epmap, which 
better describes their new meaning.

If you want, you could add

		WARN_ON(num > 15);

immediately after the simple_strtoul() line.  But since it's not there 
now, I don't think it is needed.

Alan Stern
