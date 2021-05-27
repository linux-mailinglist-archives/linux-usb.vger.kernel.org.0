Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA95392975
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 10:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbhE0IYx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 04:24:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235278AbhE0IYw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 May 2021 04:24:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB500611CD;
        Thu, 27 May 2021 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622103799;
        bh=IWzmtMIigiETQ9F1Lqgxy6i5wNAWADpAfNp7kDU1rnw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GMh4Ok7DS+4KLuPUxj6cl0JBh8OO4mtso3zJkPKvIe15RAAf+aiHrNfUWFOJeq0op
         jwDxCb5nGIU6n3a/d7EDq2m4jUaidhTLxAc7EzNYWabwBuV3h0z/TSt9DjW5OEqkIo
         xUuKHFmWfD+gjgtH2J4ULmTqfSJ5kICm1Tt38mFU4pwdc/MkEIZYbKoN+xwmcNHxHA
         7PW4tOAWphmBMC8JUtVAFv3yZDzDRBMjRwNPye99HdpiSxufTwJ4JMqsiolXHibOL0
         NLKhESPC6P9Vitb0V9Kv9SqTmEJyxutfsAHavJlKtnMWY5BTBglA3+NmonmzucGO5x
         dhzAJ2GG8vbjA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lmBIT-0000Ew-7a; Thu, 27 May 2021 10:23:17 +0200
Date:   Thu, 27 May 2021 10:23:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Check buffer length matches wLength for
 control transfers
Message-ID: <YK9W9X8lwqpBWNE+@hovoldconsulting.com>
References: <20210526153244.GA1400430@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526153244.GA1400430@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 26, 2021 at 11:32:44AM -0400, Alan Stern wrote:
> A type of inconsistency that can show up in control URBs is when the
> setup packet's wLength value does not match the URB's
> transfer_buffer_length field.  The two should always be equal;
> differences could lead to information leaks or undefined behavior for
> OUT transfers or overruns for IN transfers.
> 
> This patch adds a test for such mismatches during URB submission.  If
> the test fails, the submission is rejected with a -EBADR error code
> (which is not used elsewhere in the USB core), and a debugging message
> is logged for people interested in tracking down these errors.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: Johan Hovold <johan@kernel.org>

Looks good.

Reviewed-by: Johan Hovold <johan@kernel.org>

> ---
> 
> 
> [as1961]
> 
> 
>  Documentation/driver-api/usb/error-codes.rst |    3 +++
>  drivers/usb/core/urb.c                       |    6 ++++++
>  2 files changed, 9 insertions(+)
> 
> Index: usb-devel/drivers/usb/core/urb.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/urb.c
> +++ usb-devel/drivers/usb/core/urb.c
> @@ -410,6 +410,12 @@ int usb_submit_urb(struct urb *urb, gfp_
>  		dev_WARN_ONCE(&dev->dev, (usb_pipeout(urb->pipe) != is_out),
>  				"BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
>  				urb->pipe, setup->bRequestType);
> +		if (le16_to_cpu(setup->wLength) != urb->transfer_buffer_length) {
> +			dev_dbg(&dev->dev, "BOGUS control len %d doesn't match transfer length %d\n",
> +					le16_to_cpu(setup->wLength),
> +					urb->transfer_buffer_length);
> +			return -EBADR;
> +		}
>  	} else {
>  		is_out = usb_endpoint_dir_out(&ep->desc);
>  	}
> Index: usb-devel/Documentation/driver-api/usb/error-codes.rst
> ===================================================================
> --- usb-devel.orig/Documentation/driver-api/usb/error-codes.rst
> +++ usb-devel/Documentation/driver-api/usb/error-codes.rst
> @@ -61,6 +61,9 @@ USB-specific:
>  			(c) requested data transfer length is invalid: negative
>  			    or too large for the host controller.
>  
> +``-EBADR``		The wLength value in a control URB's setup packet does
> +			not match the URB's transfer_buffer_length.
> +
>  ``-ENOSPC``		This request would overcommit the usb bandwidth reserved
>  			for periodic transfers (interrupt, isochronous).
>  
