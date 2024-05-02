Return-Path: <linux-usb+bounces-9978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7B8B9BF2
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 16:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AC7B2845FB
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 14:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C235213C67E;
	Thu,  2 May 2024 14:00:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id DBA7A152788
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714658412; cv=none; b=GgJy9AfCal0+03ygN8fNWT/ACR1/ZVQOl5Kv/LlU0sN2GJSPO5Yv7+xD61Faaap7Zk0pNvqu6nWB6BsK2oKv0DNWBcUj31L5lKtiv2M/UQOJsyKEVyN7nkmRJqD7RShuSNuz17bBXZ9P9UTyAl/a8cMV7MI4Kap8ElKo53NEn7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714658412; c=relaxed/simple;
	bh=wSk+XEUZsqf9PDZ1vWv5ysBQLJ9fWgK7G29Bey8Oz00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIperxD5wUIz8dFx4ZTjDqdy+Y3M1Eljck4iyz6JvUXMbONsOmyZ1NwVh8lmZqQuzpJ2Aw6l0UetvhTMhgtrpDrcYQ8HK0jCac0VLTvphxBAzAQahbyrMcgtguv0jkhE8hTMCZVvYigsmafI/lD43qB8Q2mw1UPG4LH9KvQpQcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 731655 invoked by uid 1000); 2 May 2024 10:00:03 -0400
Date: Thu, 2 May 2024 10:00:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, gregKH@linuxfoundation.org
Subject: Re: [PATCHv3] usb: usb_parse_endpoint ignore reserved bits
Message-ID: <ad307bb5-d48a-4319-9cbf-205faf1c460b@rowland.harvard.edu>
References: <20240502115259.31076-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502115259.31076-1-oneukum@suse.com>

On Thu, May 02, 2024 at 01:51:40PM +0200, Oliver Neukum wrote:
> Reading bEndpointAddress the spec tells is
> that
> 
> b7 is direction, which must be ignored
> b6:4 are reserved which are to be set to zero
> b3:0 are the endpoint address
> 
> In order to be backwards compatible with possible
> future versions of USB we have to be ready with
> devices using those bits. That means that we
> also have to ignore them like we do with the direction
> bit.
> In consequence the only illegal address you can
> encoding in four bits is endpoint zero, for which
> no descriptor must exist. Hence the check for exceeding
> the upper limit on endpoint addresses is removed.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> v2: Improved commit log
> v3: Symbolic mask and improved error message
>  drivers/usb/core/config.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 7f8d33f92ddb..3362af165ef5 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -279,11 +279,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  		goto skip_to_next_endpoint_or_interface_descriptor;
>  	}
>  
> -	i = d->bEndpointAddress & ~USB_ENDPOINT_DIR_MASK;
> -	if (i >= 16 || i == 0) {
> +	i = d->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
> +	if (i == 0) {
>  		dev_notice(ddev, "config %d interface %d altsetting %d has an "
> -		    "invalid endpoint with address 0x%X, skipping\n",
> -		    cfgno, inum, asnum, d->bEndpointAddress);
> +		    "invalid descriptor for endpoint zero, skipping\n",
> +		    cfgno, inum, asnum);
>  		goto skip_to_next_endpoint_or_interface_descriptor;
>  	}
>  
> -- 
> 2.44.0
> 

