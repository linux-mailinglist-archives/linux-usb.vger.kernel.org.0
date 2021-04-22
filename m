Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396DA367CCB
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 10:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbhDVIrT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 04:47:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:33584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235518AbhDVIrT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Apr 2021 04:47:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E6576142F;
        Thu, 22 Apr 2021 08:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619081203;
        bh=lPoVItRpfDtjsfnJbzqbFt6aiWyosdsGvIQl1vV8Qtc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1G+BZ6zaQbKqihJ4rsMoB1TwlMIJmEHBbyxxD++eilCJSA9VuFnf5e0oWdZ+waTwH
         BZ+5caQKJWe/mohyzdsqoDLkVjbinxtSsv8hzY3Y0B8urMFDAYnimb02XLifEv4xjb
         At91ja8+P83wCKLPs+tm0ab8eEhnITidKf8Og1sk=
Date:   Thu, 22 Apr 2021 10:46:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Li Jun <jun.li@nxp.com>, peter.chen@kernel.org,
        stern@rowland.harvard.edu, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 1/2] usb: host: move EH SINGLE_STEP_SET_FEATURE
 implementation to core
Message-ID: <YIE38ep8DwW6JMAC@kroah.com>
References: <1618212134-20416-1-git-send-email-jun.li@nxp.com>
 <20210412182215.GC17922@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412182215.GC17922@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 11:22:16AM -0700, Jack Pham wrote:
> Hi Jun & Peter,
> 
> On Mon, Apr 12, 2021 at 03:22:13PM +0800, Li Jun wrote:
> > From: Peter Chen <peter.chen@nxp.com>
> > 
> > It is needed at USB Certification test for Embedded Host 2.0, and
> > the detail is at CH6.4.1.1 of On-The-Go and Embedded Host Supplement
> > to the USB Revision 2.0 Specification. Since other USB 2.0 capable
> > host like XHCI also need it, so move it to HCD core.
> > 
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > Signed-off-by: Jun Li <jun.li@nxp.com>
> > ---
> >  drivers/usb/core/hcd.c      | 134 ++++++++++++++++++++++++++++++++++
> >  drivers/usb/host/ehci-hcd.c |   4 ++
> >  drivers/usb/host/ehci-hub.c | 139 ------------------------------------
> >  drivers/usb/host/ehci-q.c   |   2 +-
> >  include/linux/usb/hcd.h     |  13 +++-
> >  5 files changed, 151 insertions(+), 141 deletions(-)
> > 
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index 6119fb41d736..d7eb9f179ca6 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -2110,6 +2110,140 @@ int usb_hcd_get_frame_number (struct usb_device *udev)
> >  	return hcd->driver->get_frame_number (hcd);
> >  }
> >  
> > +/*-------------------------------------------------------------------------*/
> > +#ifdef CONFIG_USB_HCD_TEST_MODE
> > +
> > +static void usb_ehset_completion(struct urb *urb)
> > +{
> > +	struct completion  *done = urb->context;
> > +
> > +	complete(done);
> > +}
> > +/*
> > + * Allocate and initialize a control URB. This request will be used by the
> > + * EHSET SINGLE_STEP_SET_FEATURE test in which the DATA and STATUS stages
> > + * of the GetDescriptor request are sent 15 seconds after the SETUP stage.
> > + * Return NULL if failed.
> > + */
> > +static struct urb *request_single_step_set_feature_urb(
> > +	struct usb_device	*udev,
> > +	void			*dr,
> > +	void			*buf,
> > +	struct completion	*done)
> > +{
> > +	struct urb *urb;
> > +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> > +	struct usb_host_endpoint *ep;
> > +
> > +	urb = usb_alloc_urb(0, GFP_KERNEL);
> > +	if (!urb)
> > +		return NULL;
> > +
> > +	urb->pipe = usb_rcvctrlpipe(udev, 0);
> > +	ep = (usb_pipein(urb->pipe) ? udev->ep_in : udev->ep_out)
> > +				[usb_pipeendpoint(urb->pipe)];
> > +	if (!ep) {
> > +		usb_free_urb(urb);
> > +		return NULL;
> > +	}
> > +
> > +	urb->ep = ep;
> > +	urb->dev = udev;
> > +	urb->setup_packet = (void *)dr;
> > +	urb->transfer_buffer = buf;
> > +	urb->transfer_buffer_length = USB_DT_DEVICE_SIZE;
> > +	urb->complete = usb_ehset_completion;
> > +	urb->status = -EINPROGRESS;
> > +	urb->actual_length = 0;
> > +	urb->transfer_flags = URB_DIR_IN;
> > +	usb_get_urb(urb);
> > +	atomic_inc(&urb->use_count);
> > +	atomic_inc(&urb->dev->urbnum);
> > +	urb->setup_dma = dma_map_single(
> > +			hcd->self.sysdev,
> > +			urb->setup_packet,
> > +			sizeof(struct usb_ctrlrequest),
> > +			DMA_TO_DEVICE);
> > +	urb->transfer_dma = dma_map_single(
> > +			hcd->self.sysdev,
> > +			urb->transfer_buffer,
> > +			urb->transfer_buffer_length,
> > +			DMA_FROM_DEVICE);
> 
> Maybe better to replace both of these dma_map_single() calls with
> one call to usb_hcd_map_urb_for_dma(hcd, urb, GFP_KERNEL)? 

In later patches, yes.  Not in this one that only moves code around.

thanks,

greg k-h
