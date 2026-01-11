Return-Path: <linux-usb+bounces-32146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9AED0ED70
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 13:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DF5E300EA06
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 12:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0470E3314A4;
	Sun, 11 Jan 2026 12:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WrS7C6k0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DD12206AC;
	Sun, 11 Jan 2026 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134216; cv=none; b=D0cQ3HN3rIoiJnV39a8sZSJX6jcgStYMXga5ha32npi6E9B/ePXfYwLxN5ywSlbH6OhyB0HHAEdEj4dGN6OmR9DmAQrvWC3ibPsd5PWx4oCo4GcuWrhbt1zSft5kpb5JaEwXeK/y+NV+eDkVpZyjOwnHoq2RRr51BzgLBcUh7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134216; c=relaxed/simple;
	bh=iEw3KpgtZ8Hf0aJOkDexH3OYdCfYEQXBdxMxM2Vmd8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWXp7BD9C3KRTDnfUqBR5/6E/sBRvdGwz+6IDd6u4zUVLSU/5EIa1zIzlpHTnfvP4I+db96qgsaFvLCaHwmyFJkdFB5O9D7bEROK/6gF5Z5Sf5MTPiQIHVmOHwZiGSukg5HqtAZGi3lcs6nuB5Ui/9P4JHmTcNEH9w63jN3F6CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WrS7C6k0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56A6C4CEF7;
	Sun, 11 Jan 2026 12:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768134216;
	bh=iEw3KpgtZ8Hf0aJOkDexH3OYdCfYEQXBdxMxM2Vmd8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrS7C6k0ky6iQ5rbV6HVFVM3rCKPSWfcd0w+b3Q0055AJgexGR6ifKxdaZ6U9fChO
	 77ASk3E6xfMqe8uOSnPc0x9Fl8ldIkCYTkfjj7T5FPVJbcJJJjGrpugCr3cbJXE9qt
	 cztZ99k3NyN5kErrG+Rlx2dL2/p4trovrM5dS514=
Date: Sun, 11 Jan 2026 13:23:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Karthikeyan K S <karthiproffesional@gmail.com>
Cc: hminas@synopsys.com, gregory.herrero@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: add missing SLAB_CACHE_DMA flag for
 desc_hsisoc_cache
Message-ID: <2026011120-thirty-brick-70ff@gregkh>
References: <20260111113625.4810-1-karthiproffesional@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111113625.4810-1-karthiproffesional@gmail.com>

On Sun, Jan 11, 2026 at 11:36:25AM +0000, Karthikeyan K S wrote:
> The desc_hsisoc_cache kmem_cache is used to allocate DMA descriptors
> for High-Speed isochronous transfers. These descriptors are passed to
> the hardware via dma_map_single() in dwc2_desc_list_alloc().
> 
> The desc_gen_cache, which serves the same purpose for other transfer
> types, correctly specifies SLAB_CACHE_DMA. However, desc_hsisoc_cache
> was created without this flag, despite both caches being used
> identically for DMA descriptor allocation.
> 
> Add the missing SLAB_CACHE_DMA flag to desc_hsisoc_cache for
> consistency and correctness on platforms with DMA zone restrictions.
> This also protects against future allocations from this cache that
> might omit GFP_DMA.
> 
> Fixes: 3b5fcc9ac2f4 ("usb: dwc2: host: use kmem cache to allocate descriptors")
> 
> Signed-off-by: Karthikeyan K S <karthiproffesional@gmail.com>
> ---
>  drivers/usb/dwc2/hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index 30eb85066..556d6ab36 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -5273,7 +5273,7 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg)
>  
>  		hsotg->desc_hsisoc_cache = kmem_cache_create("dwc2-hsisoc-desc",
>  				sizeof(struct dwc2_dma_desc) *
> -				MAX_DMA_DESC_NUM_HS_ISOC, 512, 0, NULL);
> +				MAX_DMA_DESC_NUM_HS_ISOC, 512, SLAB_CACHE_DMA, NULL);
>  		if (!hsotg->desc_hsisoc_cache) {
>  			dev_err(hsotg->dev,
>  				"unable to create dwc2 hs isoc desc cache\n");
> -- 
> 2.43.0
> 
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

