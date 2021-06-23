Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666293B190E
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jun 2021 13:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhFWLiR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Jun 2021 07:38:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:43504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230031AbhFWLiQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Jun 2021 07:38:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC5E76102A;
        Wed, 23 Jun 2021 11:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624448159;
        bh=ULWB5KI+zjDyMD0EzoZpOHi/DdRro5AI6tgZ+h/zzr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JFYjYfsPgBYnn1bWADVLquINtLQ7FoXgseSi7z3HTLd4K4CDj+iL8tSv/mQJrTaws
         yKSow+w65tKtGKLQ8LrPzMS/TVpeS8CzW8TSpZkekpRaTvw4TdT/OVbDymMUJLES+4
         s7Kwy6tcihIqEsuGy4wlGrZxVYKM9svzywvhaSRY=
Date:   Wed, 23 Jun 2021 13:35:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
Subject: Re: [PATCH v10 2/6] usb: gadget: configfs: Check USB configuration
 before adding
Message-ID: <YNMcnISDv2e7bze1@kroah.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <1623923899-16759-3-git-send-email-wcheng@codeaurora.org>
 <YMss5tFFBjokk1k6@kroah.com>
 <012b0264-107a-5596-d73f-3a2fd20470cf@codeaurora.org>
 <YNF9kv0kWAz6Pp00@kroah.com>
 <afe0c718-1c16-1b20-4b0c-d8592a13af42@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afe0c718-1c16-1b20-4b0c-d8592a13af42@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 23, 2021 at 02:38:55AM -0700, Wesley Cheng wrote:
> 
> 
> On 6/21/2021 11:05 PM, Greg KH wrote:
> > On Mon, Jun 21, 2021 at 10:27:09PM -0700, Wesley Cheng wrote:
> >>
> >>
> >> On 6/17/2021 4:07 AM, Greg KH wrote:
> >>> On Thu, Jun 17, 2021 at 02:58:15AM -0700, Wesley Cheng wrote:
> >>>> Ensure that the USB gadget is able to support the configuration being
> >>>> added based on the number of endpoints required from all interfaces.  This
> >>>> is for accounting for any bandwidth or space limitations.
> >>>>
> >>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> >>>> ---
> >>>>  drivers/usb/gadget/configfs.c | 22 ++++++++++++++++++++++
> >>>>  1 file changed, 22 insertions(+)
> >>>>
> >>>> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> >>>> index 15a607c..76b9983 100644
> >>>> --- a/drivers/usb/gadget/configfs.c
> >>>> +++ b/drivers/usb/gadget/configfs.c
> >>>> @@ -1374,6 +1374,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
> >>>>  		struct usb_function *f;
> >>>>  		struct usb_function *tmp;
> >>>>  		struct gadget_config_name *cn;
> >>>> +		unsigned long ep_map = 0;
> >>>>  
> >>>>  		if (gadget_is_otg(gadget))
> >>>>  			c->descriptors = otg_desc;
> >>>> @@ -1403,7 +1404,28 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
> >>>>  				list_add(&f->list, &cfg->func_list);
> >>>>  				goto err_purge_funcs;
> >>>>  			}
> >>>> +			if (f->fs_descriptors) {
> >>>> +				struct usb_descriptor_header **d;
> >>>> +
> >>>> +				d = f->fs_descriptors;
> >>>> +				for (; *d; ++d) {
> >>
> >> Hi Greg,
> >>
> >> Thanks for the review and feedback.
> >>
> >>>
> >>> With this check, there really is not a need to check for
> >>> f->fs_descriptors above in the if statement, right?
> >>>
> >>
> >> f->fs_descriptor will carry the table of descriptors that a particular
> >> function driver has assigned to it.  The for loop here, will dereference
> >> the individual descriptors within that descriptor array, so we need to
> >> first ensure the descriptor array is present before traversing through
> >> the individual entries/elements.
> > 
> > Ah, it's a dereference of an array element.  Subtle.  Tricky.  Messy :(
> > 
> >>>> +					struct usb_endpoint_descriptor *ep;
> >>>> +					int addr;
> >>>> +
> >>>> +					if ((*d)->bDescriptorType != USB_DT_ENDPOINT)
> >>>> +						continue;
> >>>> +
> >>>> +					ep = (struct usb_endpoint_descriptor *)*d;
> >>>> +					addr = ((ep->bEndpointAddress & 0x80) >> 3) |
> >>>> +						(ep->bEndpointAddress & 0x0f);
> >>>
> >>> Don't we have direction macros for this type of check?
> >>>
> >>
> >> I don't believe we have a macro which would be able to convert the
> >> bEndpointAddress field into the bit which needs to be set, assuming that
> >> the 32bit ep_map has the lower 16bits carrying OUT EPs, and the upper
> >> 16bits carrying the IN EPs.
> 
> Hi Greg,
> 
> > 
> > We have macros to tell if an endpoint is IN or OUT, please use those.
> > 
> > And this "cram the whole thing into 64 bits" is not obvious at all.
> > Just pass around the original pointer to the descriptors if someone
> > wants to use it or not, don't make up yet-another-data-structure here
> > for no good reason.  We aren't so memory constrained we need to pack
> > stuff into bits here.
> > 
> 
> Hmm ok, what I can do is to move this logic into the check_config()
> callback itself, which is implemented by the UDC driver.  So now, the
> DWC3 will have to do something similar to what is done here, ie loop the
> EP descriptors for each function to determine the number of IN endpoints
> being used.

We have common USB core functions for this, why can't you just use them?

Please do not take data that we already have in one format, and convert
it to another one just for a single driver to consume.  That's
pointless.

thanks,

greg k-h
