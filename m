Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F25F38E591
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 13:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhEXLlO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 07:41:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232070AbhEXLlO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 May 2021 07:41:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB1D7611CE;
        Mon, 24 May 2021 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621856386;
        bh=L9ZyLUY4HIHc32Nt2D9VCC3J9L5MFaaCUqZULLClRRE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BA2i65iFm2TZRVLSHkexshPEoIBTfkkcVOdXSIyf8we/eksrjw6cYctKWPNEPumCB
         sqrg2Toem1Qp94J7brYpIWV78bAwWYhpN8PAV21dYrb5QP0GbRaofiOsYYM8bwvtGm
         CnlIh9fKcdr87sNb+szOa6n3AQCtW3F17xmoSjHhrYC7C7OkMpLsdWo0bxqrkfArJT
         EGvxysVn/2pVg4CAH6GMyxAtOX68zbumnDudXmZvWDRok0M7EjyVnaeHUnpyPPoHhg
         Wu8Q5BlM7Y0L7iw73PbqVkfgKWK9/m9QlgYLpJVmUFXjVva8CKttaFlBvhcGmSGZvu
         VXQyN6HBB8hzw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ll8vw-0006aZ-MZ; Mon, 24 May 2021 13:39:44 +0200
Date:   Mon, 24 May 2021 13:39:44 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <YKuQgPd+JFNnNcfd@hovoldconsulting.com>
References: <20210520202056.GB1216852@rowland.harvard.edu>
 <YKdpThmE1xenUjhI@hovoldconsulting.com>
 <YKey+pWP8iKkCV1Q@hovoldconsulting.com>
 <20210522021623.GB1260282@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522021623.GB1260282@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 10:16:23PM -0400, Alan Stern wrote:
> When a control URB is submitted, the direction indicated by URB's pipe
> member is supposed to match the direction indicated by the setup
> packet's bRequestType member.  A mismatch could lead to trouble,
> depending on which field the host controller drivers use for
> determining the actual direction.
> 
> This shouldn't ever happen; it would represent a careless bug in a
> kernel driver somewhere.  This patch adds a dev_WARN_ONCE to let
> people know about the potential problem.
> 
> Suggested-by: "Geoffrey D. Bennett" <g@b4.vu>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
> ---
> 
> v2: Use dev_WARN_ONCE instead of dev_WARN
> 
> 
> [as1960b]
> 
> 
>  drivers/usb/core/urb.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> Index: usb-devel/drivers/usb/core/urb.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/urb.c
> +++ usb-devel/drivers/usb/core/urb.c
> @@ -407,6 +407,9 @@ int usb_submit_urb(struct urb *urb, gfp_
>  			return -ENOEXEC;
>  		is_out = !(setup->bRequestType & USB_DIR_IN) ||
>  				!setup->wLength;
> +		dev_WARN_ONCE(&dev->dev, (usb_pipeout(urb->pipe) != is_out),
> +				"BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
> +				urb->pipe, setup->bRequestType);

Note that the above will trigger for requests without a data stage also
when the pipe and request type agree in case the direction is IN (due to
the !wLength check).

According to the spec the direction bit should just be ignored for such
requests, but we now mandate that usb_sndpipectrl() is always used (i.e.
even when USB_DIR_IN is set).

Requiring this seems reasonable, but I did find a couple of media
drivers (and syszbot reported another) that did "zero-length" reads.

Johan
