Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0223D251BE2
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 17:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHYPKo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 11:10:44 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34033 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726096AbgHYPKn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 11:10:43 -0400
Received: (qmail 369150 invoked by uid 1000); 25 Aug 2020 11:10:42 -0400
Date:   Tue, 25 Aug 2020 11:10:42 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Martin Thierer <mthierer@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
Message-ID: <20200825151042.GC365901@rowland.harvard.edu>
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
 <20200821160321.GA256196@rowland.harvard.edu>
 <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
 <20200821170106.GB256196@rowland.harvard.edu>
 <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
 <CAL3BvCyxTvfUjecoYO0ie1vt4_+1cad+8Dt=xmcXogZSooGj+A@mail.gmail.com>
 <cbdfafed-b8d4-ca07-bde1-4598f5117f04@linux.intel.com>
 <a66ea20a-5406-ed31-e607-08552598ed68@linux.intel.com>
 <CAL3BvCzsAZjt23XjD-9T2JyUtLFPLB0prKn3Bw3nC4AC1nTbgA@mail.gmail.com>
 <9017830d-a4d2-66d5-6b42-b1162856ef90@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9017830d-a4d2-66d5-6b42-b1162856ef90@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 25, 2020 at 02:53:56PM +0300, Mathias Nyman wrote:
> On 25.8.2020 11.00, Martin Thierer wrote:
> >> Can you try the code below? It should force dropping and adding the endpoints
> >> for the intrface(s) of that configuration, and xhci should reset the toggles.
> >>
> >> Completely untested, it compiles :)
> > 
> > Sorry, no, that doesn't work:
> > 
> > xhci_hcd 0000:00:14.0: Trying to add endpoint 0x83 without dropping it.
> > BUG: kernel NULL pointer dereference, address: 0000000000000010
> 
> Ah, I see.
> Endpoints weren't dropped on host side as pointer to the endpoints were cleaned up before this.
> And the code to recover from a failed call got messed up as we removed some stuff it depends on.
> 
> Here's a second version. 
> I'm again not able to test this at all from my current location, so it might fail because
> of some silly mistake, but it compiles..
> 
> This version keeps endpoint pointers intact until endpoints are dropped from hcd side, 
> it also removes the recover path (might need to fix one later) 
> 
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 6197938dcc2d..e90e8781f872 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1537,9 +1537,21 @@ int usb_reset_configuration(struct usb_device *dev)
>  	 * calls during probe() are fine
>  	 */
>  
> +	/*
> +	 * TEST2 flush and disable endpoints but leave the pointers intact until
> +	 * usb_hcd_alloc_bandwidth() has dropped them from host controller side
> +	 */
>  	for (i = 1; i < 16; ++i) {
> -		usb_disable_endpoint(dev, i, true);
> -		usb_disable_endpoint(dev, i + USB_DIR_IN, true);
> +		if (dev->ep_out[i]) {
> +			dev->ep_out[i]->enabled = 0;
> +			usb_hcd_flush_endpoint(dev, dev->ep_out[i]);
> +			usb_hcd_disable_endpoint(dev, dev->ep_out[i]);
> +		}
> +		if (dev->ep_in[i]) {
> +			dev->ep_in[i]->enabled = 0;
> +			usb_hcd_flush_endpoint(dev, dev->ep_in[i]);
> +			usb_hcd_disable_endpoint(dev, dev->ep_in[i]);
> +		}
>  	}

There's got to be a better way to do this, something that doesn't 
involve so much code duplication.  For instance, maybe we could make 
this routine and usb_set_configuration() both call a new 
__usb_set_config(), with an extra flag telling the routine whether to 
change the interface devices and bindings.

Alan Stern
