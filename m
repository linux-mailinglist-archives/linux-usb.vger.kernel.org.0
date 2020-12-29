Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635D72E6F97
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 11:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgL2KQ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 05:16:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:52360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgL2KQz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Dec 2020 05:16:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 322ED207BC;
        Tue, 29 Dec 2020 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609236974;
        bh=wUm/zzedT7r+fNRkot4idMV+kPkdHVUgjB5hzgCC4BA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wgc26PCNIKSJfE7e6A4JBNpkL2G2L1R8T73LGQRs+I8uYqYyAKx4pamG8wTsDl3ty
         CgcOmP0He8KFZYdBoq33TTmTM/ElHvYtftUOz4ZjWVgpGJ14vcXIQ9r7sD5yh+ITJj
         FfTqV4zTfiqHCcT2nJyxrkK++CJkwY7pVWJbN1A8=
Date:   Tue, 29 Dec 2020 11:17:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     balbi@kernel.org, USB list <linux-usb@vger.kernel.org>,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH RESEND 1/2] usb: gadget: core: change the comment for
 usb_gadget_connect
Message-ID: <X+sCPgjjpTQ0z633@kroah.com>
References: <20201013092746.10602-1-peter.chen@nxp.com>
 <CAL411-p+6q9U91H+9-jTtkenxhS3FZNgFREjOr1GYoosE4oB_g@mail.gmail.com>
 <CAL411-pcwrRyPCnq79JHZRH4db39Ke31E4tNH2W3vAbwJc=2xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL411-pcwrRyPCnq79JHZRH4db39Ke31E4tNH2W3vAbwJc=2xA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 29, 2020 at 01:55:07PM +0800, Peter Chen wrote:
> On Tue, Dec 1, 2020 at 2:46 PM Peter Chen <hzpeterchen@gmail.com> wrote:
> 
> > On Tue, Oct 13, 2020 at 8:01 PM Peter Chen <peter.chen@nxp.com> wrote:
> > >
> > > The pullup does not need to be enabled at below situations:
> > > - For platforms which the hardware pullup starts after setting
> > > register even they do not see the VBUS. If the pullup is always
> > > enabled for these platforms, it will consume more power and
> > > break the USB IF compliance tests [1].
> > > - For platforms which need to do BC 1.2 charger detection after
> > > seeing the VBUS. Pullup D+ will break the charger detection
> > > flow.
> > > - For platforms which the system suspend is allowed when the
> > > connection with host is there but the bus is not at suspend.
> > > For these platforms, it is better to disable pullup when
> > > entering the system suspend otherwise the host may confuse
> > > the device behavior after controller is in low power mode.
> > > Disable pullup is considered as a disconnection event from
> > > host side.
> > >
> > > [1] USB-IF Full and Low Speed Compliance Test Procedure
> > > F Back-voltage Testing
> > > Section 7.2.1 of the USB specification requires that no device
> > > shall supply (source) current on VBUS at its upstream facing
> > > port at any time. From VBUS on its upstream facing port,
> > > a device may only draw (sink) current. They may not provide power
> > > to the pull-up resistor on D+/D- unless VBUS is present (see
> > > Section 7.1.5).
> > >
> > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > ---
> > >  drivers/usb/gadget/udc/core.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/usb/gadget/udc/core.c
> > b/drivers/usb/gadget/udc/core.c
> > > index debf54205d22..215ecbe8b692 100644
> > > --- a/drivers/usb/gadget/udc/core.c
> > > +++ b/drivers/usb/gadget/udc/core.c
> > > @@ -659,8 +659,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_vbus_disconnect);
> > >   *
> > >   * Enables the D+ (or potentially D-) pullup.  The host will start
> > >   * enumerating this gadget when the pullup is active and a VBUS session
> > > - * is active (the link is powered).  This pullup is always enabled
> > unless
> > > - * usb_gadget_disconnect() has been used to disable it.
> > > + * is active (the link is powered).
> > >   *
> > >   * Returns zero on success, else negative errno.
> > >   */
> > > --
> > > 2.17.1
> > >
> >
> > Ping...
> >
> > Peter
> >
> 
> Greg, would you please help to catch it up?

Can you resend the patches please?  Digging it out from a response like
this is a bit difficult :)

thanks,

greg k-h
