Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B5B361D88
	for <lists+linux-usb@lfdr.de>; Fri, 16 Apr 2021 12:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239294AbhDPJ4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Apr 2021 05:56:53 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43127 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239448AbhDPJ4w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Apr 2021 05:56:52 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 39E2F5C004E;
        Fri, 16 Apr 2021 05:56:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 16 Apr 2021 05:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=PNo+MXXcZaQb9URT/gFCrHWYzSG
        /q5YXL+qrijAUAtk=; b=sPRKmCjbAO1FiyDOYRIJmImjwwrS8p6UwmEis1u+5Yb
        BLZw9bEEtp2dFWhj3MjZMS+seamVmXwe1nEUzgPaKpeZgZgOdW5Vn64cUnC95W5O
        qq7pQ0IGqzDzb4GiZt1lFEm6q5JPsOySdOBGVJIkyCzPAAko8c2HqsH+1h+Izoc5
        3Gateqz4SIUogyocZ+U5+IE33KG/v8hZ8nNZfWfgyp03UIQ6DDBiYJnAYPDpTAeo
        nZu8K7WWrKLIc2QMZ2MDvabzgQUdqKl1AF0Y+JN/LUG04ctA8r01F/jlxjtkByPC
        ln0tcL797aAOozXwtrDICLeusuej9GkNhWbNJ98Ltwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PNo+MX
        XcZaQb9URT/gFCrHWYzSG/q5YXL+qrijAUAtk=; b=mRnAx6Nssk4Qf18d05OvEU
        rbrhkpowWWtGXgfz+LXtCzIppe+xqvueT70QFRXcYw01OnWoZkwIgBuxvAaEbrDU
        wPbODoQGPTojLVZHKsjBq0LrwOG6jCfLSVP1h0LEMbi5+nbP4BBil4j3BmomEuPl
        LUGmlVWQLYEia2h2ixJCBB8SdFhrmiedsX3UyyhI7ON1MYUtzCAZpBEQr1q7UEbW
        6XyEpmzrTsAlKcy0R8fwXGxeStZo39bt0vM5WvsmQJ28BM3IPkMFBB0NfFF7NJ7w
        8cmz4X6uZBi/VyfDZNrAUlslX8DZ74L+WsDFxDXgV0Dc8WXnEzj+kfMhz7ASthyQ
        ==
X-ME-Sender: <xms:Sl95YGrdHz_dZ677GWHRPGfXDYbiNGSHIZUntoWCgyiLHJmBE2aqrw>
    <xme:Sl95YEqeLNOKL3e3Fe0XscT6asUM88QPKRyzTEj4s1dD8yacGFMZUpr2dhmxt_COs
    E_I4K9IZ5PVXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeetffegve
    evtedvtddtkeehfefgvefgvddvkeeukeefieelveeiueevudevueehheenucffohhmrghi
    nheplhhkmhhlrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrjeegrd
    eigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehg
    rhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:Sl95YLM5zg8ckuz6Yf4mKz2vbkk2rdpP_G35zdksWLGas8ul7g70wQ>
    <xmx:Sl95YF7PjLIbqUTVFxOsRo1jSnHMJAXB_rXOIRIjzPx0M_Sqbrnwxw>
    <xmx:Sl95YF6DLnNfpDuF31FCSlObAUfaiTmVV-HBPvv-NGMvsiXscxICjw>
    <xmx:S195YCi6l8vJOr3AdQKG8JGw2PTZ3f1mLbk0g-T504PMKLoos9Fyhw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1CE22240054;
        Fri, 16 Apr 2021 05:56:26 -0400 (EDT)
Date:   Fri, 16 Apr 2021 11:56:23 +0200
From:   Greg KH <greg@kroah.com>
To:     Ole Salscheider <ole@salscheider.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH] [RFC] xhci: Add Link TRB sync quirk for ASM3142
Message-ID: <YHlfR9sO7L2plt2b@kroah.com>
References: <20210416093729.41865-1-ole@salscheider.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416093729.41865-1-ole@salscheider.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 16, 2021 at 11:37:29AM +0200, Ole Salscheider wrote:
> This patch adds a quirk to the xhci driver so that link TRBs are only
> given to the host controller once it has processed all previous TRBs on
> this segment.
> 
> This quirk is necessary for me on an ASMedia ASM3142 host controller.
> Without it, I get the following errors when accessing a SuperSpeed UVC
> camera:
> 
> Transfer event TRB DMA ptr not part of current TD ep_index XX comp_code XX
> 
> You can find more details in my previous mail about the problem:
> https://lkml.org/lkml/2021/3/31/355

Please use links to lore.kernel.org instead, we have no idea if lkml.org
will be around tomorrow or not.

> 
> This patch fixes my problem, but it is probably terribly wrong. I am not
> even sure if I can rely on handle_tx_event being called before each link
> TRB in the segment. Some feedback would be very welcome.
> ---
>  drivers/usb/host/xhci-pci.c  |  4 +++-
>  drivers/usb/host/xhci-ring.c | 34 ++++++++++++++++++++++++++++++----
>  drivers/usb/host/xhci.h      |  1 +
>  3 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 5bbccc9a0179..4b02ac34934e 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -284,8 +284,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
>  	    (pdev->device == PCI_DEVICE_ID_ASMEDIA_1142_XHCI ||
>  	     pdev->device == PCI_DEVICE_ID_ASMEDIA_2142_XHCI ||
> -	     pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI))
> +	     pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI)) {
>  		xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
> +		xhci->quirks |= XHCI_SYNC_ON_LINK_TRB;
> +	}
>  
>  	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
>  		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index ce38076901e2..17f9484f1b0d 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -257,8 +257,13 @@ static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
>  			next->link.control |= cpu_to_le32(chain);
>  		}
>  		/* Give this link TRB to the hardware */
> -		wmb();
> -		next->link.control ^= cpu_to_le32(TRB_CYCLE);
> +		if (!(xhci->quirks & XHCI_SYNC_ON_LINK_TRB) ||
> +				(ring->type != TYPE_BULK &&
> +				 ring->type != TYPE_STREAM &&
> +				 ring->type != TYPE_COMMAND)) {
> +			wmb();
> +			next->link.control ^= cpu_to_le32(TRB_CYCLE);
> +		}
>  
>  		/* Toggle the cycle bit after the last ring segment. */
>  		if (link_trb_toggles_cycle(next))
> @@ -2530,6 +2535,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  	dma_addr_t ep_trb_dma;
>  	struct xhci_segment *ep_seg;
>  	union xhci_trb *ep_trb;
> +	union xhci_trb *next_ep_trb;
> +	int next_ep_trb_idx;
>  	int status = -EINPROGRESS;
>  	struct xhci_ep_ctx *ep_ctx;
>  	struct list_head *tmp;
> @@ -2860,6 +2867,20 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  		else
>  			process_bulk_intr_td(xhci, td, ep_trb, event, ep);
>  cleanup:
> +		if (xhci->quirks & XHCI_SYNC_ON_LINK_TRB &&
> +				(ep_ring->type == TYPE_BULK ||
> +				 ep_ring->type == TYPE_STREAM ||
> +				 ep_ring->type == TYPE_COMMAND)) {
> +			next_ep_trb_idx = (ep_trb_dma - ep_seg->dma) /
> +				sizeof(*ep_trb) + 1;
> +			next_ep_trb = ep_trb = &ep_seg->trbs[next_ep_trb_idx];
> +			if (next_ep_trb_idx < TRBS_PER_SEGMENT &&
> +					trb_is_link(next_ep_trb)) {
> +				wmb();
> +				next_ep_trb->link.control ^= cpu_to_le32(TRB_CYCLE);
> +			}
> +		}
> +
>  		handling_skipped_tds = ep->skip &&
>  			trb_comp_code != COMP_MISSED_SERVICE_ERROR &&
>  			trb_comp_code != COMP_NO_PING_RESPONSE_ERROR;
> @@ -3192,8 +3213,13 @@ static int prepare_ring(struct xhci_hcd *xhci, struct xhci_ring *ep_ring,
>  			ep_ring->enqueue->link.control |=
>  				cpu_to_le32(TRB_CHAIN);
>  
> -		wmb();
> -		ep_ring->enqueue->link.control ^= cpu_to_le32(TRB_CYCLE);
> +		if (!(xhci->quirks & XHCI_SYNC_ON_LINK_TRB) ||
> +				(ep_ring->type != TYPE_BULK &&
> +				 ep_ring->type != TYPE_STREAM &&
> +				 ep_ring->type != TYPE_COMMAND)) {
> +			wmb();
> +			ep_ring->enqueue->link.control ^= cpu_to_le32(TRB_CYCLE);
> +		}
>  
>  		/* Toggle the cycle bit after the last ring segment. */
>  		if (link_trb_toggles_cycle(ep_ring->enqueue))
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index ca822ad3b65b..fd98f86cde37 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1892,6 +1892,7 @@ struct xhci_hcd {
>  #define XHCI_DISABLE_SPARSE	BIT_ULL(38)
>  #define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
>  #define XHCI_NO_SOFT_RETRY	BIT_ULL(40)
> +#define XHCI_SYNC_ON_LINK_TRB	BIT_ULL(41)
>  
>  	unsigned int		num_active_eps;
>  	unsigned int		limit_active_eps;
> -- 
> 2.25.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
