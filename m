Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4BD40465C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 09:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352733AbhIIHjg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 03:39:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:39722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352740AbhIIHj1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 03:39:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5010610A3;
        Thu,  9 Sep 2021 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631173098;
        bh=BziEnBDZXcaxKfzf/plQuTPW+UE4821IsYrdUDoocBE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pzpaT7ydMGM57gUidLds1DPHb0j3BN+9rEn960fDiJzqTK9ATJwZxbKDFWv7JB03C
         LLTzcXAx3PRfR2l+1e+M2sJKXjnV5Iw6tan5OFQgnuPEcSn1CiYwEOtYCCYp9UvxJt
         ZtO3z9hs+/LIXsTiNX1ac+tnypd125IJ+e+kBkt4=
Date:   Thu, 9 Sep 2021 09:37:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Message-ID: <YTm51tmCXRtKZIcx@kroah.com>
References: <1631166347-25021-1-git-send-email-quic_linyyuan@quicinc.com>
 <YTmlbFw9DufQc6gU@kroah.com>
 <DM8PR02MB819856E1A159D7D3F820555FE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB819856E1A159D7D3F820555FE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 09, 2021 at 07:17:57AM +0000, Linyu Yuan (QUIC) wrote:
> 
> 
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Thursday, September 9, 2021 2:11 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
> > 
> > On Thu, Sep 09, 2021 at 01:45:47PM +0800, Linyu Yuan wrote:
> > > change device release function to clear gadget pointer.
> > 
> > That does not properly describe what and why this change is needed.
> > 
> > >
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > >  drivers/usb/dwc3/gadget.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > index 804b505..e2ab5f6 100644
> > > --- a/drivers/usb/dwc3/gadget.c
> > > +++ b/drivers/usb/dwc3/gadget.c
> > > @@ -4188,9 +4188,10 @@ static int dwc3_gadget_get_irq(struct dwc3
> > *dwc)
> > >
> > >  static void dwc_gadget_release(struct device *dev)
> > >  {
> > > -	struct usb_gadget *gadget = container_of(dev, struct usb_gadget,
> > dev);
> > > +	struct dwc3 *dwc = dev_get_platdata(dev);
> > 
> > Are you sure this is the same?
> Yes, in dwc3_gadget_init()
> 	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
> 	dev				= &dwc->gadget->dev;
> 	dev->platform_data		= dwc;
> 
> here original code use follow container_of, it use same dev,
> container_of(dev, struct usb_gadget, dev);
> > 
> > >
> > > -	kfree(gadget);
> > > +	kfree(dwc->gadget);
> > > +	dwc->gadget = NULL;
> > 
> > Why set this to NULL?  Who cares about this now?  What changed to make
> > it required?
> It better to set to NULL for better understanding.

Understanding of what?  What issue does this fix?  You need a reason to
make this, or any, kernel change.

thanks,

greg k-h
