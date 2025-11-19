Return-Path: <linux-usb+bounces-30727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A7C6FAC6
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 16:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26DD74E9D50
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBCB365A12;
	Wed, 19 Nov 2025 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WbB0qgwJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C771364049;
	Wed, 19 Nov 2025 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566054; cv=none; b=D9Ps6itUj+AEvi1LX585+4ipA/iM98/IaBU7m2EILVkFBikcXL2iJwKpyhiJHfs/L+0uYyuzEKrFiLYWPN8hHXwM1VP6o+s6Eyt1q9ZJqOj6rUfc5nfqGCZC3daqjA3DDDPtlG5LPswnrwqO8SqI4Gscm4rCoKEnaalnocohP4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566054; c=relaxed/simple;
	bh=Kyim5J6U2rc7hXTioiiHbXG5j73GOLkTP0Y2x8v9tQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fp1G39Bx7PDBWS7/zbg1JGF+BeujUNOP1C2VSa33gfO4jJzcd/rcClRGDSSbJL6bsMdDB/nezFu5ykxWAh+sftF2f5VziOp+Vaph32ywqDxISjEflRb9n7BzF9YKvnnHn4mMgOTi6rLfl1oPQPJ9bH57EQ2iLFLpdYu85TEpbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WbB0qgwJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130B2C2BCB0;
	Wed, 19 Nov 2025 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763566053;
	bh=Kyim5J6U2rc7hXTioiiHbXG5j73GOLkTP0Y2x8v9tQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WbB0qgwJehwZpTVUlvsr450/EFxb0xxAVJnKf62UMEUt1Zm1V9Gwua9+ydZFRxVil
	 aXMRnkKZ4aQJPFRXE0XJGUX87fBwfr62wsu2kH9H6E9eKUBk6/B351cLWFYhxnKPEP
	 7mQBfnTrscwjkbMF8NV2L4LloWPLCru/FRebPwcU=
Date: Wed, 19 Nov 2025 16:27:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Clint George <clintbgeorge@gmail.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	khalid@kernel.org
Subject: Re: [PATCH 1/8] usb: gadget: dummy_hcd: replace BUG() with
 WARN_ON_ONCE()
Message-ID: <2025111950-early-grumbly-b1e4@gregkh>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251119130840.14309-2-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130840.14309-2-clintbgeorge@gmail.com>

On Wed, Nov 19, 2025 at 06:38:33PM +0530, Clint George wrote:
> Replace BUG() with WARN_ON_ONCE() in dummy_validate_stream()
> when stream_id exceeds max_streams. This allows the kernel to
> continue running with a warning instead of crashing.

Nope, you still crashed given that BILLIONS of devices out there have
panic-on-warn enabled :(

> 
> Signed-off-by: Clint George <clintbgeorge@gmail.com>
> ---
> 
> Testing:
> - The function dummy_validate_stream() was tested using a test module
>   that i created where i sent value of urb->stream_id greater than
>   max_streams. When using BUG(), the kernel-space used to crash but
>   after using WARN_ON_ONCE() the kernel-space does not crash and the
>   module terminates gracefully
> - Ensured that the module builds properly
> 
>  drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 1cefca660..41b7b6907 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -1254,7 +1254,7 @@ static int dummy_validate_stream(struct dummy_hcd *dum_hcd, struct urb *urb)
>  	if (urb->stream_id > max_streams) {
>  		dev_err(dummy_dev(dum_hcd), "Stream id %d is out of range.\n",
>  				urb->stream_id);
> -		BUG();
> +		WARN_ON_ONCE(1);

If this can actually be hit, PROPERLY HANDLE THE ISSUE!

Don't paper over bugs in the code, handle them correctly.  This change
does not do any of that as obviously the author thought that if the
code path got here, the system was so broken it needed to be halted.
Your change could cause it to continue on, in a very vulnerable state
(i.e. broken.)

So I can't take this, sorry.  Nor should you want me to take it :)

thanks,

greg k-h

