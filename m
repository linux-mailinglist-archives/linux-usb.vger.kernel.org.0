Return-Path: <linux-usb+bounces-32143-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABD9D0E215
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 08:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 162DA30124C3
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jan 2026 07:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970992F5311;
	Sun, 11 Jan 2026 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rWVTV5VN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F70223AE62;
	Sun, 11 Jan 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768117822; cv=none; b=L+LPM3raQQtI/mRSShS4cicJMMoR5rNTHYfHaKh+KiRi3cN5Zvg2vFbPcjOuAX/+fmUmP301QkPwZ4j14MuinmphPt/aUBta8d8qWEnnFsbaSl2BO8R4JzCimWZU+QgXT0cMq/1EZou4M69JZBVy7K8KVBxMaKeCLw+V3BKdSGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768117822; c=relaxed/simple;
	bh=lSl+sxJUkiqRKsklznYNdONe6X730IEWNgyBEI4yIa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mc1GH8J5IW5AMEuy2GuhmQHAJ2XFvxg/T8nitX42dQpHDfB6eP04P55p0ebBbWNREvaw6qwLqlR2KmcdA0l/GRAyUOOaOGKwYKlAF3Jcsj8H8fubvP+L0wMidswTSd4PymdY778Gx9np/Ft8RcUM4vnaCANtk1o9Xm7s5Zx1YKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rWVTV5VN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F310C4CEF7;
	Sun, 11 Jan 2026 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768117821;
	bh=lSl+sxJUkiqRKsklznYNdONe6X730IEWNgyBEI4yIa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWVTV5VNRfqpLgK8oJAT/KuBY2n+S8KRDR0zDWKVVKiOqxRADvLS1Rg0xGp/SYqWA
	 lylVDz/IZy0Bpxi90i2AZOvCL8se04ANavM6cWtD+NtUr08mB/lcnoXvzZSPuti8gU
	 nnfq61IJ2NzJcTDXKNA+HXNAO5J+zFHSvx+5Q1I4=
Date: Sun, 11 Jan 2026 08:50:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: karthikeyan K S <karthiproffesional@gmail.com>
Cc: hminas@synopsys.com, gregory.herrero@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: add missing SLAB_CACHE_DMA flag for
 desc_hsisoc_cache
Message-ID: <2026011146-diaper-purchase-8933@gregkh>
References: <CAP_JKPvQj518Y6J0em=fwM0SeLhba8YCoTyHzWoDjq7zph33vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP_JKPvQj518Y6J0em=fwM0SeLhba8YCoTyHzWoDjq7zph33vw@mail.gmail.com>

On Sun, Jan 11, 2026 at 01:01:51PM +0530, karthikeyan K S wrote:
> >From 39cd652d071184e3bab97ba92f6da30152289905 Mon Sep 17 00:00:00 2001
> From: karthikeyan <karthiproffesional@gmail.com>
> Date: Sun, 11 Jan 2026 08:36:25 +0200
> Subject: [PATCH] usb: dwc2: add missing SLAB_CACHE_DMA flag for
>  desc_hsisoc_cache
> 
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
> Signed-off-by: karthikeyan <karthiproffesional@gmail.com>
> ---
>  drivers/usb/dwc2/hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index 30eb8506617c..556d6ab36930 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -5273,7 +5273,7 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg)
> 
>                 hsotg->desc_hsisoc_cache = kmem_cache_create("dwc2-hsisoc-desc",
>                                 sizeof(struct dwc2_dma_desc) *
> -                               MAX_DMA_DESC_NUM_HS_ISOC, 512, 0, NULL);
> +                               MAX_DMA_DESC_NUM_HS_ISOC, 512,
> SLAB_CACHE_DMA, NULL);
>                 if (!hsotg->desc_hsisoc_cache) {
>                         dev_err(hsotg->dev,
>                                 "unable to create dwc2 hs isoc desc cache\n");
> --
> 2.34.1
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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

