Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0DB22E6F98
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 11:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgL2KRH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 05:17:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:52456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgL2KRH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Dec 2020 05:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA55C207BD;
        Tue, 29 Dec 2020 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609236986;
        bh=uufs6DJrGS/lUOpgUpch4XaxQsDi8lVZvra3wq+Uiz4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HJ8zmuMw5fDsoKvrGbcBRtILH0heX+pvzW4rHjATUt4fFX9D/9mnlLU7lh9B/KpEx
         BMNPMGvF2O6PKM7EV8+6TQQRCzLccRiNQLuwm/2+Ftpb1v7VLGndNXTRFvFEBPeOPA
         24cqIQQxaqpq0J4rKZ9DiMXGoEmWlyyZCb5rJ0YI=
Date:   Tue, 29 Dec 2020 11:17:46 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     balbi@kernel.org, USB list <linux-usb@vger.kernel.org>,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH RESEND 2/2] usb: gadget: core: do not try to disconnect
 gadget if it is not connected
Message-ID: <X+sCSg8TsBfzrlHV@kroah.com>
References: <20201013092746.10602-1-peter.chen@nxp.com>
 <20201013092746.10602-2-peter.chen@nxp.com>
 <CAL411-rS0Fa4Z7emwAC6wcMnBGJ9+y8X_-64Q7XB_BOz_DGOgQ@mail.gmail.com>
 <CAL411-qOjz+Ut1de8VLS2miM7JEJ4s6x-AhYqhcSxDou6DU-jg@mail.gmail.com>
 <CAL411-pgUVSieBSCa1D8CLL+qSJ8SHTVWt998XgJp0UVNWp1Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL411-pgUVSieBSCa1D8CLL+qSJ8SHTVWt998XgJp0UVNWp1Mg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 29, 2020 at 01:56:00PM +0800, Peter Chen wrote:
> On Tue, Dec 1, 2020 at 2:45 PM Peter Chen <hzpeterchen@gmail.com> wrote:
> 
> > BR,
> > Peter Chen
> >
> > On Thu, Oct 29, 2020 at 6:45 PM Peter Chen <hzpeterchen@gmail.com> wrote:
> > >
> > > On Tue, Oct 13, 2020 at 8:01 PM Peter Chen <peter.chen@nxp.com> wrote:
> > > >
> > > > Current UDC core connects gadget during the loading gadget flow
> > > > (udc_bind_to_driver->usb_udc_connect_control), but for
> > > > platforms which do not connect gadget if the VBUS is not there,
> > > > they call usb_gadget_disconnect, but the gadget is not connected
> > > > at this time, notify disconnecton for the gadget driver is meaningless
> > > > at this situation.
> > > >
> > > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > > ---
> > > >  drivers/usb/gadget/udc/core.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/gadget/udc/core.c
> > b/drivers/usb/gadget/udc/core.c
> > > > index 215ecbe8b692..8ad4203dea8c 100644
> > > > --- a/drivers/usb/gadget/udc/core.c
> > > > +++ b/drivers/usb/gadget/udc/core.c
> > > > @@ -672,6 +672,9 @@ int usb_gadget_connect(struct usb_gadget *gadget)
> > > >                 goto out;
> > > >         }
> > > >
> > > > +       if (!gadget->connected)
> > > > +               goto out;
> > > > +
> > > >         if (gadget->deactivated) {
> > > >                 /*
> > > >                  * If gadget is deactivated we only save new state.
> > > > --
> > > > 2.17.1
> > > >
> > >
> > > A gentle ping.
> > >
> >
> > ping again.
> >
> > Peter
> >
> 
> Greg, would you please help to catch it up?

Again, can you please resend?

thanks,

greg k-h
