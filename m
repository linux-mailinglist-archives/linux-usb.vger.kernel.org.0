Return-Path: <linux-usb+bounces-9281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A38A1BE3
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 19:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E2701C22462
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 17:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A72713A242;
	Thu, 11 Apr 2024 16:04:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7E4E913791E
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712851476; cv=none; b=uiQrmPO7H9BTSlVlhaZCB15rnRKW+eY1OOaxC7AqZ+mMfOvhJIMneeV1s8viv0WR+XeqjwHxz/hm9utsx/vMaGwuyuAhdeZ78NSe50xgUoW/vcjctkDrN38dvswEwqBmVMfk7177Ox9XWTJdyqjO81oDdQO3m0bls6i0mc3UHe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712851476; c=relaxed/simple;
	bh=EuUWZVbva357J4Xi06GUfZLnCSYiyXKKX97FEbh4LMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbBnPI1AEX+xEBLX5b34rSt8tdQJIlNjYzG+0bDi/PWVZJO2wLDHL4g1jkbHtNjK0U//ur3OFfpfvRnR/eJ/GUEUY0tXFItZNG1ZcHDiCqqomWJ/C5z5nDuQnX1GGR0gh0atX3jDm/X+HM1pzo3dJ9cvfa5FVfwQGKkiMwka5SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 249899 invoked by uid 1000); 11 Apr 2024 12:04:33 -0400
Date: Thu, 11 Apr 2024 12:04:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC 5/6] usb: usb_parse_endpoint must not count duplicated
 endpoints
Message-ID: <f2ea66c0-f753-4c29-b762-7775cd5b4c2d@rowland.harvard.edu>
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-6-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411124722.17343-6-oneukum@suse.com>

On Thu, Apr 11, 2024 at 02:43:03PM +0200, Oliver Neukum wrote:
> When an interface is parsed the number of endpoints claimed to exist
> is compared to the number of endpoint descriptors actually found.
> Duplicated endpoints are not parsed in usb_parse_endpoint but
> usb_parse_interface counts them. That makes no sense.

It _does_ make sense.  If there are 4 endpoint descriptors in the buffer 
then "the number of endpoint descriptors actually found" is 4, even if 
some of them are duplicates.

> To correct this usb_parse_endpoint needs to return feedback
> about the validity of parsed endpoints.

If you make this change then the following error message:

		dev_notice(ddev, "config %d interface %d altsetting %d has %d "
		    "endpoint descriptor%s, different from the interface "
		    "descriptor's value: %d\n",
		    cfgno, inum, asnum, n, plural(n), num_ep_orig);

would be wrong, since n would not be the number of endpoint descriptors 
but rather the number of descriptors after duplicates were removed.

This does not need to be changed.

Alan Stern

> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/config.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 055910fc6b19..50acc9021247 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -254,7 +254,7 @@ static bool config_endpoint_is_duplicate(struct usb_host_config *config,
>  static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  		struct usb_host_config *config, int inum, int asnum,
>  		struct usb_host_interface *ifp, int num_ep,
> -		unsigned char *buffer, int size)
> +		unsigned char *buffer, int size, bool *valid)
>  {
>  	struct usb_device *udev = to_usb_device(ddev);
>  	unsigned char *buffer0 = buffer;
> @@ -270,6 +270,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  
>  	buffer += d->bLength;
>  	size -= d->bLength;
> +	*valid = false;
>  
>  	if (d->bDescriptorType != USB_DT_ENDPOINT)
>  		goto skip_to_next_endpoint_or_interface_descriptor;
> @@ -313,6 +314,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  		}
>  	}
>  
> +	*valid = true;
>  	endpoint = &ifp->endpoint[ifp->desc.bNumEndpoints];
>  	++ifp->desc.bNumEndpoints;
>  
> @@ -581,14 +583,17 @@ static int usb_parse_interface(struct device *ddev, int cfgno,
>  	/* Parse all the endpoint descriptors */
>  	n = 0;
>  	while (size >= sizeof(struct usb_descriptor_header)) { /* minimum length to get bDescriptorType */
> +		bool valid;
> +
>  		if (((struct usb_descriptor_header *) buffer)->bDescriptorType
>  		     == USB_DT_INTERFACE)
>  			break;
>  		retval = usb_parse_endpoint(ddev, cfgno, config, inum, asnum,
> -				alt, num_ep, buffer, size);
> +				alt, num_ep, buffer, size, &valid);
>  		if (retval < 0)
>  			return retval;
> -		++n;
> +		if (valid)
> +			++n;
>  
>  		buffer += retval;
>  		size -= retval;
> -- 
> 2.44.0
> 
> 

