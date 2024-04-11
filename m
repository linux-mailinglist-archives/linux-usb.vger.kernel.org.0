Return-Path: <linux-usb+bounces-9275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 759CF8A1963
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 18:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D7B41F21278
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 16:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B1115A4B2;
	Thu, 11 Apr 2024 15:35:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 94DBD159919
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849712; cv=none; b=t8Pd5pjdvwRm670GnfIB016qevgq3o/jUKGbr06dzsJtljBp73Dip4w1VcNXM3nLZjPWgq1au/NtkOiYBOCTiIcTuGX/wnbTJpWPmRHVz6Hjo67b5RTIHpNoGoSna+GB7JRX+YPQfc7j9lTzmubWIIgH5Rbx/zsAEpRpvJrUH6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849712; c=relaxed/simple;
	bh=1CY3Ors66moucfBSLVNIixH/f2akNrg+Ymftjc7GzUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUZQm/BTsV6C7u+aSPMi2YTUpqvZ/NpbgUwj5sS9i20ITc8rTF+/sESs5UGqR6BwyzxqzEQpA6thGpOP/53gXPrLzYDTHreFuQWtjL8Pq4nMaSe5a0LX/mzrcK48HFos1G6+7p7GlEmZckF102WVyvblrp9xSWXYDi+I2kqWbfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 248841 invoked by uid 1000); 11 Apr 2024 11:35:07 -0400
Date: Thu, 11 Apr 2024 11:35:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC 1/6] usb: usb_parse_endpoint ignore reserved bits
Message-ID: <3257a17c-cb38-4cc1-94ca-3e6dc4bb5d88@rowland.harvard.edu>
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-2-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411124722.17343-2-oneukum@suse.com>

On Thu, Apr 11, 2024 at 02:42:59PM +0200, Oliver Neukum wrote:
> We have to ignore the higher bits in bEndpointAddress

Mention that these bits are reserved.  That's why we ought to ignore 
them.

Also, this is not really an example of hardening; it's more like 
future-proofing the code.  The existing code will work fine with a 
malicious device; your real concern is about possible changes to the 
spec in the future.

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/config.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 7f8d33f92ddb..c7056b123d46 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -279,11 +279,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  		goto skip_to_next_endpoint_or_interface_descriptor;
>  	}
>  
> -	i = d->bEndpointAddress & ~USB_ENDPOINT_DIR_MASK;
> -	if (i >= 16 || i == 0) {
> +	i = d->bEndpointAddress & 0x0f;

Use USB_ENDPOINT_NUMBER_MASK, not 0x0f.

> +	if (i == 0) {
>  		dev_notice(ddev, "config %d interface %d altsetting %d has an "
> -		    "invalid endpoint with address 0x%X, skipping\n",
> -		    cfgno, inum, asnum, d->bEndpointAddress);
> +		    "invalid descriptor for the common control endpoint, skipping\n",

It would be clearer to say "endpoint 0" instead of "the common control 
endpoint".  (The spec uses that phrase; it doesn't mean this is the best 
way of saying it.)

> +		    cfgno, inum, asnum);
>  		goto skip_to_next_endpoint_or_interface_descriptor;
>  	}

Otherwise this is okay.

Alan Stern

