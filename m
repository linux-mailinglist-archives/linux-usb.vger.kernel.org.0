Return-Path: <linux-usb+bounces-32148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF21FD0EF3B
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 14:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8430C3009F05
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 13:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B4A33AD9E;
	Sun, 11 Jan 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zBb+ZNwF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03CDDAB;
	Sun, 11 Jan 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768136815; cv=none; b=u59GqOPjgUCP30RunPhshDTynln5oOKZS/8s3C6Ad7L/1YzncnINErga5egjwzu4+xJRKCskni1d8KvCKyEbvIJuXGdFzfQfteJ+XQU3JvVfC02HSWDWf/H2LPzI1kA+SaJ/lpOddEdTeE2P57fe1rqeD2cU4gzXkhi2sonxFPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768136815; c=relaxed/simple;
	bh=4YmINbsMJGQjkU7KoPYRi//+xFRoGyqm0OtaZaVtAg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHeS1FWa/LbRTRW60Uf//5f/lnrJsxHCeIt75bP3DJnJvcuHLp2m343lYdeQ1xdRLaF2O0qT88ftrcdaIUcmPb9yQ66nxMqBgQlo8DTdKmIVRNPHIhgrQcoPIk8L9IRgxBu2efdzQEFOF/9lZ2SzTf5okyBedAqTitxupnsw2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zBb+ZNwF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57351C4CEF7;
	Sun, 11 Jan 2026 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768136814;
	bh=4YmINbsMJGQjkU7KoPYRi//+xFRoGyqm0OtaZaVtAg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zBb+ZNwFyTJ1vwG3FIf5Pp77U7BeetxOSCTpoSQzsc3SU3PIE9aCQpYw/5KwocVkG
	 Kb+rzN5Niqqvyl0O5sRtQL0rat9tdKGqtfyvgNULFMjTsweycSF0y7TM2NAJtqPbvO
	 LAMjl1QSauuAVGa/W/ioLyAlDbe1HZN8dux9Wg7I=
Date: Sun, 11 Jan 2026 14:06:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Karthikeyan K S <karthiproffesional@gmail.com>
Cc: hminas@synopsys.com, gregory.herrero@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc2: add missing SLAB_CACHE_DMA flag for
 desc_hsisoc_cache
Message-ID: <2026011101-important-hermit-3a31@gregkh>
References: <20260111123218.15972-1-karthiproffesional@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111123218.15972-1-karthiproffesional@gmail.com>

On Sun, Jan 11, 2026 at 12:32:18PM +0000, Karthikeyan K S wrote:
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

Nit, no blank line needed after the Fixes: line and before your s-o-b
line.

Also, should this go to stable kernels?

But:

> ---
> v2: Resend with proper formatting (previous was corrupted by email client)
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

Are you sure this is ok?  You are now taking from a _very_ limited chunk
of memory for this controller.  What platform is this that requires
this, and what changed to suddenly need this to be this way?  The driver
has been working for a very long time without this, and I am loath to
change this now as it might hit many existing systems that have a very
limited GFP_DMA memory range that did not expect a new allocation there
now.

So I would like to find out why this is needed now, all these years
later.  What caused this to show up at this point in time?

thanks,

greg k-h

