Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDF61953F6
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 10:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgC0J2E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 05:28:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgC0J2D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Mar 2020 05:28:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9CC020705;
        Fri, 27 Mar 2020 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585301283;
        bh=kSV1h8M9PsDakgcYsgT5ikOQZeqk+TIKYnnDYgOD4Sc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cLDPoWDryNzecZRv5gY5Ffr2OI2YuWcD9k8Ri/YE8McwELrQlNcl4HGVYK37tdQHO
         B39UZG+XYOjWHOYF9sQt1vbQ96iuQy3TJg6Iq897tS8PsAXRHlfeO03g7EXsPwAs3V
         0NdZWA9YmNVC17vu2vjyAEfZxfrDCchzV6gp8f2g=
Date:   Fri, 27 Mar 2020 10:27:59 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Fredrik Noring <noring@nocrew.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Raul E Rangel <rrangel@chromium.org>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RESENDING RFC PATCH 4/4] usb: xhci: Use temporary buffer to
 consolidate SG
Message-ID: <20200327092759.GA1693819@kroah.com>
References: <cover.1585297723.git.joglekar@synopsys.com>
 <5f7605b9f4cd2d6de4f0ef7d25be9a99d92c5aee.1585297723.git.joglekar@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f7605b9f4cd2d6de4f0ef7d25be9a99d92c5aee.1585297723.git.joglekar@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 27, 2020 at 02:23:46PM +0530, Tejas Joglekar wrote:
> The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
> each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
> for HS. The controller loads and updates the TRB cache from the transfer
> ring in system memory whenever the driver issues a start transfer or
> update transfer command.
> 
> For chained TRBs, the Synopsys xHC requires that the total amount of
> bytes for all TRBs loaded in the TRB cache be greater than or equal to 1
> MPS. Or the chain ends within the TRB cache (with a last TRB).
> 
> If this requirement is not met, the controller will not be able to send
> or receive a packet and it will hang causing a driver timeout and error.

Sounds like broken hardware, or is this requirement in the xhci spec?

> 
> This can be a problem if a class driver queues SG requests with many
> small-buffer entries. The XHCI driver will create a chained TRB for each
> entry which may trigger this issue.
> 
> This patch adds logic to the XHCI driver to detect and prevent this from
> happening.
> 
> For every (TRB_CACHE_SIZE - 2), we check the total buffer size of
> the SG list and if the last window of (TRB_CACHE_SIZE - 2) SG list length
> and we don't make up at least 1 MPS, we create a temporary buffer to
> consolidate full SG list into the buffer.
> 
> We check at (TRB_CACHE_SIZE - 2) window because it is possible that there
> would be a link and/or event data TRB that take up to 2 of the cache
> entries.
> 
> We discovered this issue with devices on other platforms but have not
> yet come across any device that triggers this on Linux. But it could be
> a real problem now or in the future. All it takes is N number of small
> chained TRBs. And other instances of the Synopsys IP may have smaller
> values for the TRB_CACHE_SIZE which would exacerbate the problem.
> 
> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> ---
> 
> Resending as 'umlaut' in email are not accepted by some servers.
> 
>  drivers/usb/core/hcd.c       |   8 +++
>  drivers/usb/host/xhci-ring.c |   2 +-
>  drivers/usb/host/xhci.c      | 128 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci.h      |   4 ++
>  4 files changed, 141 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index aa45840d8273..fdd257a2b8a6 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1459,6 +1459,14 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  					return -EINVAL;
>  				}
>  
> +				/*
> +				 * If SG is consolidate into single buffer
> +				 * return early

I do not understand this comment.

> +				 */
> +				if ((urb->transfer_flags &
> +				     URB_DMA_MAP_SINGLE))
> +					return ret;

Why?  Isn't this now going to affect other host controllers (like all of
them?)

> +
>  				n = dma_map_sg(
>  						hcd->self.sysdev,
>  						urb->sg,
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index a78787bb5133..2fad9474912a 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3291,7 +3291,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  
>  	full_len = urb->transfer_buffer_length;
>  	/* If we have scatter/gather list, we use it. */
> -	if (urb->num_sgs) {
> +	if (urb->num_sgs && !(urb->transfer_flags & URB_DMA_MAP_SINGLE)) {
>  		num_sgs = urb->num_mapped_sgs;
>  		sg = urb->sg;
>  		addr = (u64) sg_dma_address(sg);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index fe38275363e0..94fddbd06179 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1256,6 +1256,109 @@ EXPORT_SYMBOL_GPL(xhci_resume);
>  
>  /*-------------------------------------------------------------------------*/
>  
> +static int xhci_map_temp_buffer(struct usb_hcd *hcd, struct urb *urb)
> +{
> +	void *temp;
> +	int ret = 0;
> +	unsigned int len;
> +	unsigned int buf_len;
> +	enum dma_data_direction dir;
> +	struct xhci_hcd *xhci;
> +
> +	xhci = hcd_to_xhci(hcd);
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +	buf_len = urb->transfer_buffer_length;
> +
> +	temp = kzalloc_node(buf_len, GFP_ATOMIC,
> +			    dev_to_node(hcd->self.sysdev));
> +	if (!temp) {
> +		xhci_warn(xhci, "Failed to create temp buffer, HC may fail\n");

Didn't kzalloc just warn before this?

And isn't this whole thing going to cause a lot more memory allocations
per submission than before?

> +		return -ENOMEM;
> +	}
> +
> +	if (usb_urb_dir_out(urb)) {
> +		len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
> +					 temp, buf_len, 0);
> +		if (len != buf_len)
> +			xhci_warn(xhci, "Wrong temp buffer write length\n");

How could this happen?  And if it does, why spam the kernel log about it
and yet not return an error?

> +	}
> +
> +	urb->transfer_buffer = temp;
> +	urb->transfer_dma = dma_map_single(hcd->self.sysdev,
> +					   urb->transfer_buffer,
> +					   urb->transfer_buffer_length,
> +					   dir);
> +	if (dma_mapping_error(hcd->self.sysdev,
> +			      urb->transfer_dma)) {
> +		xhci_err(xhci, "dma mapping error\n");

Again, didn't dma_mapping_error() spit out a message?

> +		ret = -EAGAIN;
> +		kfree(temp);
> +	} else {
> +		urb->transfer_flags |= URB_DMA_MAP_SINGLE;
> +	}
> +
> +	return ret;
> +}

thanks,

greg k-h
