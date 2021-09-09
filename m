Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E010D4046F4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 10:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhIIIYf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 04:24:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231206AbhIIIYe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 04:24:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E6A960FE3;
        Thu,  9 Sep 2021 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631175805;
        bh=6/mHkfBv8i+EEzeDDGxG5IazSKqcsb6ITzuwcgykfZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PbettJBnPeYdw230nYTg/4tL0PAAv8NKbGhay7GfUfSlhcowppvFuQihzaipUO4aN
         N3wXlQLACkCJRC+FGx6Rfwg4HxUES07tvdegp5SwfCL8sRh7J78K/UZPbprlWtuLv7
         RBmiMl9O8fn3WFNpXp991vagErTZsS/KQ87b4oH0=
Date:   Thu, 9 Sep 2021 10:23:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Message-ID: <YTnEe1iV8EPCdsZV@kroah.com>
References: <1631166347-25021-1-git-send-email-quic_linyyuan@quicinc.com>
 <YTmlbFw9DufQc6gU@kroah.com>
 <DM8PR02MB819856E1A159D7D3F820555FE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YTm51tmCXRtKZIcx@kroah.com>
 <DM8PR02MB8198F1672DD3A8179B5DF097E3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB8198F1672DD3A8179B5DF097E3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 09, 2021 at 08:02:19AM +0000, Linyu Yuan (QUIC) wrote:
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Thursday, September 9, 2021 3:38 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
> > 
> > On Thu, Sep 09, 2021 at 07:17:57AM +0000, Linyu Yuan (QUIC) wrote:
> > >
> > >
> > > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Sent: Thursday, September 9, 2021 2:11 PM
> > > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > > > Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
> > > >
> > > > On Thu, Sep 09, 2021 at 01:45:47PM +0800, Linyu Yuan wrote:
> > > > > change device release function to clear gadget pointer.
> > > >
> > > > That does not properly describe what and why this change is needed.
> > > >
> > > > >
> > > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > > > ---
> > > > >  drivers/usb/dwc3/gadget.c | 5 +++--
> > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > > > index 804b505..e2ab5f6 100644
> > > > > --- a/drivers/usb/dwc3/gadget.c
> > > > > +++ b/drivers/usb/dwc3/gadget.c
> > > > > @@ -4188,9 +4188,10 @@ static int dwc3_gadget_get_irq(struct dwc3
> > > > *dwc)
> > > > >
> > > > >  static void dwc_gadget_release(struct device *dev)
> > > > >  {
> > > > > -	struct usb_gadget *gadget = container_of(dev, struct usb_gadget,
> > > > dev);
> > > > > +	struct dwc3 *dwc = dev_get_platdata(dev);
> > > >
> > > > Are you sure this is the same?
> > > Yes, in dwc3_gadget_init()
> > > 	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
> > > 	dev				= &dwc->gadget->dev;
> > > 	dev->platform_data		= dwc;
> > >
> > > here original code use follow container_of, it use same dev,
> > > container_of(dev, struct usb_gadget, dev);
> > > >
> > > > >
> > > > > -	kfree(gadget);
> > > > > +	kfree(dwc->gadget);
> > > > > +	dwc->gadget = NULL;
> > > >
> > > > Why set this to NULL?  Who cares about this now?  What changed to
> > make
> > > > it required?
> > > It better to set to NULL for better understanding.
> > 
> > Understanding of what?  What issue does this fix?  You need a reason to
> > make this, or any, kernel change.
> Sorry, let explain, for example, when do role switch, we can check it value to make sure it switch complete,
> If we do not set to NULL, it will be invalid.

Are you checking that already?  If not, there is no need for this.

Please see the kernel documentation for how to write a changelog text,
otherwise we have no idea why you are wanting to make a change.

Please fix this all up when resubmitting the patch.

thanks,

greg k-h
