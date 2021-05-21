Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878A338C13B
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 10:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhEUIFQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 04:05:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:45362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236322AbhEUIEs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 04:04:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1203600CC;
        Fri, 21 May 2021 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621584205;
        bh=a0t3WD4UC27EPy2xUu8ScpsD4LiO+xkj3W79qcaz3X8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OOzN/y70CRZNSXi6VI6Ksldu9sgSf3FJBA6C3R30dZPVScVkstAh6qEduDQXwThoh
         VDKGNz4eZMFyJCv0WFInfTV5QOtpyLt8f76IGtC4zcbEzqhiYo9ziRYeb3DoFvgMRc
         zwwBX+ka6d9LcJ5lxuHHZX8MHi40zwQkAb7ebylvy47zDiLgIUL2qc2xI0OEHvYjL7
         AWnIPZkADAKqyq3I8vbP1rOQi4fAjq6sqeKBSxgyXTslhyiKHfiZ2NqLtZ9QnMtbrb
         g5oH+ogIvlAcvPLHRBDmyu97CScMzuZbtiekxcpzy5UOzypFoPqlcwitCIGDB15zir
         5dgAvwnQfi0sw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lk07y-0004xo-3o; Fri, 21 May 2021 10:03:26 +0200
Date:   Fri, 21 May 2021 10:03:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <YKdpThmE1xenUjhI@hovoldconsulting.com>
References: <20210520202056.GB1216852@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520202056.GB1216852@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 20, 2021 at 04:20:56PM -0400, Alan Stern wrote:
> When a control URB is submitted, the direction indicated by URB's pipe
> member is supposed to match the direction indicated by the setup
> packet's bRequestType member.  A mismatch could lead to trouble,
> depending on which field the host controller drivers use for
> determining the actual direction.
> 
> This shouldn't ever happen; it would represent a careless bug in a
> kernel driver somewhere.  This patch adds a dev_WARN to let people
> know about the potential problem.
> 
> Suggested-by: "Geoffrey D. Bennett" <g@b4.vu>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
> ---
> 
> 
> [as1960]
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
> +		if (usb_pipeout(urb->pipe) != is_out)
> +			dev_WARN(&dev->dev, "BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
> +					urb->pipe, setup->bRequestType);
>  	} else {
>  		is_out = usb_endpoint_dir_out(&ep->desc);
>  	}

While I agree with intention here, I'm worried that this will start
flooding the logs of users.

So first, this should probably be rate limited.

Second, did you try to estimate how many call sites that get this wrong?
I always felt a bit pedantic when pointing out that the pipe direction
should match the request type to driver author's during review when (in
almost all cases?) this hasn't really mattered. I fear we may have
accumulated a fairly large number of these mismatches over the years but
I haven't verified that.

Johan
