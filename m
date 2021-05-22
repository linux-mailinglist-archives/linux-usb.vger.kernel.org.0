Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE1638D458
	for <lists+linux-usb@lfdr.de>; Sat, 22 May 2021 09:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhEVH6R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 May 2021 03:58:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:35698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230000AbhEVH6R (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 22 May 2021 03:58:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 049E1611CB;
        Sat, 22 May 2021 07:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621670213;
        bh=47llbiSSOoHXlj+qrcqnOYk3KKY1V8xK1W7I5Z/Ha/w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sb2ilKp18SwPgeWYr89o4MXJVcqggncaZiRqk4IU/wKQLWuatllKWeyubQlBD5CwX
         pPO4ad3JLCSL/gNkwxlvqhdDe81buNxZ3+OJzChop/pPumrxCKxsmXKi72vA31Ks57
         kvqt1kPUd5vBRPIolNZgYXel93j145fsaHxIajl46rYQrbC4lmAqL3TnLoMjIprfri
         4kcDsiOkb5aFFhlYV/YEskp/e/J7/hyBoDPNLWINnUwIiBp28EAutIvraX2cZAOZRy
         6CDb0a+3Fq3/dgo3TO1tRrbIP/2kvgBxGDnuOnvzH/J/4eK7glE1TUJ0Gw19Y2VkcJ
         0+f0V+Llv98Iw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lkMVC-0007uI-7s; Sat, 22 May 2021 09:56:54 +0200
Date:   Sat, 22 May 2021 09:56:54 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, "Geoffrey D. Bennett" <g@b4.vu>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] USB: core: WARN if pipe direction != setup packet
 direction
Message-ID: <YKi5RgP98sa8OcJL@hovoldconsulting.com>
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
> ---
> 
> v2: Use dev_WARN_ONCE instead of dev_WARN

Reviewed-by: Johan Hovold <johan@kernel.org>

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
>  	} else {
>  		is_out = usb_endpoint_dir_out(&ep->desc);
>  	}

Johan
