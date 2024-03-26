Return-Path: <linux-usb+bounces-8429-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7A88C91A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 17:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAEA23261AB
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BEB13C9DC;
	Tue, 26 Mar 2024 16:26:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 436D36CDD9
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711470381; cv=none; b=QKwbSjmonUcwerqiOaB1kk411sgLqbuz6Lc1RNIQAH9Vcxr5GZQj/ww2SQN1kZ8jZirpkLv70CarjjKs/8bKh+cFUvpJC0Uug9u1ggvlbg9HHVMJMbdmO5OCwM0zrejNmNdgMElslewPt9Kw6Nfs3Qll0GKpdjWd4P8l2Qx/was=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711470381; c=relaxed/simple;
	bh=EZIF94LZzzEEKqplHRLHOvHHBgTmJhdsmWbrIdUaubo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEmvnv++tl3xCCq7wq+WsK/0KURyxOv5i0RIIUk+8EPQ0legvrrv1EkT7LPiYAt688Os1eBsvoLl50kcxXAOKysXERCi5Hw53OWJ6bwh5eBWzWI4oFI3TqkQ+tQGW6sdzkv8WU6ThW8wc+wuXPBlX/hNpBhuqujjNrsmobGHupc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 896256 invoked by uid 1000); 26 Mar 2024 12:26:15 -0400
Date: Tue, 26 Mar 2024 12:26:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
  Jakob Koschel <jakobkoschel@gmail.com>,
  Randy Dunlap <rdunlap@infradead.org>, Ira Weiny <ira.weiny@intel.com>,
  Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] USB: gadget: dummy_hcd: switch char * to u8 *
Message-ID: <64c14f99-526b-41d2-a0c0-edbefba5a4a1@rowland.harvard.edu>
References: <20240326160342.3588864-2-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326160342.3588864-2-gregkh@linuxfoundation.org>

On Tue, Mar 26, 2024 at 05:03:43PM +0100, Greg Kroah-Hartman wrote:
> The function handle_control_request() casts the urb buffer to a char *,
> and then treats it like a unsigned char buffer when assigning data to
> it.  On some architectures, "char" is really signed, so let's just
> properly set this pointer to a u8 to take away any potential problems as
> that's what is really wanted here.

Yes, it certainly ought to be u8 rather than char.

> Document that we are only using the lower 8 bits for the devstatus
> variable (only 7 are currently used), as the cast from 16 to 8 is not
> obvious.

It wouldn't hurt to change the code so that it copies all 16 bits.  I 
think it was originally done the way it is now because that was easier, 
not because there was any significance to the 8-bit/16-bit alteration.

> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Jakob Koschel <jakobkoschel@gmail.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 0953e1b5c030..1139fc8c03f0 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -1739,13 +1739,13 @@ static int handle_control_request(struct dummy_hcd *dum_hcd, struct urb *urb,
>  		if (setup->bRequestType == Dev_InRequest
>  				|| setup->bRequestType == Intf_InRequest
>  				|| setup->bRequestType == Ep_InRequest) {
> -			char *buf;
> +			u8 *buf;
>  			/*
> -			 * device: remote wakeup, selfpowered
> +			 * device: remote wakeup, selfpowered, LTM, U1, or U2

Also B_HNP_ENABLE, A_HNP_SUPPORT, A_ALT_HNP_SUPPORT.  Not sure it's 
really worthwhile to list all these things in a comment.

Also, it would be good to reorder the comment lines so that they match 
the code: endpoint first, then device, then interface.

Alan Stern

>  			 * interface: nothing
>  			 * endpoint: halt
>  			 */
> -			buf = (char *)urb->transfer_buffer;
> +			buf = urb->transfer_buffer;
>  			if (urb->transfer_buffer_length > 0) {
>  				if (setup->bRequestType == Ep_InRequest) {
>  					ep2 = find_endpoint(dum, w_index);
> @@ -1754,11 +1754,12 @@ static int handle_control_request(struct dummy_hcd *dum_hcd, struct urb *urb,
>  						break;
>  					}
>  					buf[0] = ep2->halted;
> -				} else if (setup->bRequestType ==
> -					   Dev_InRequest) {
> +				} else if (setup->bRequestType == Dev_InRequest) {
> +					/* Only take the lower 8 bits */
>  					buf[0] = (u8)dum->devstatus;
> -				} else
> +				} else {
>  					buf[0] = 0;
> +				}
>  			}
>  			if (urb->transfer_buffer_length > 1)
>  				buf[1] = 0;
> -- 
> 2.44.0
> 

