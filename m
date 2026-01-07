Return-Path: <linux-usb+bounces-32005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C9094CFE7D8
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 160FE3004848
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6CE34B195;
	Wed,  7 Jan 2026 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BNw0uauL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B3C348889
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798310; cv=none; b=RjlBx/eiYQlpgzlDKP46epxZ9Wd+gqbYhbdWB85g6NoVcR2OAiBkVtlXQMua1epB4U2iCSBdrrRBdpKJEdH5ELoZEuh2anRya/sn75nRCdQom2ndc88AM/HLYwsHnDWYSooYAQmUOt21bsMH3a8+y+MEbDKQ2czWn8S7ZHm4W1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798310; c=relaxed/simple;
	bh=CP11WCeOLtBJMPyNR8ieAUx1dyBAnAKL0tsEuG12P9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzHC0inQzS2+4XP70muiiePwSvRWlQkX5Tx+usS5pjSm1Wn4WIzu2GFp8Xr2WwPdlgKs1AIhTZSMoGi64qUo7V1RgHb/k0YpNZufaFaSbbQ6hpWl2VdNs5VJaLsaRj+R/8okAcizHkUf8ifHd1NQdkOY9WcbuIPX3pKsnNj+h2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BNw0uauL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C77C4CEF1;
	Wed,  7 Jan 2026 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798309;
	bh=CP11WCeOLtBJMPyNR8ieAUx1dyBAnAKL0tsEuG12P9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNw0uauL5o0vtyNk4/iWc6SjyXrfzoUMWg/aKeHMm8twtYTUT1OR2akYhtVYsl9l8
	 iYwCoGZj4srBNOUgUHzCSfD4/RD41yNA2G4SubCOHXslGsn1xhapJg15F0YkOhjIKx
	 T3z2yKskHcxbpQpL+VCg5gai3KIYAojWjMGY426w=
Date: Wed, 7 Jan 2026 16:05:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ReBeating <rebeating@163.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: cdns2: fix memory double free in
 cdns2_gadget_giveback
Message-ID: <2026010753-ship-paying-dd30@gregkh>
References: <20251226031713.1682-1-rebeating@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226031713.1682-1-rebeating@163.com>

On Fri, Dec 26, 2025 at 11:17:13AM +0800, ReBeating wrote:
> A patch similar to commit 5fd9e45f1ebc("usb: cdns3: fix memory double
>  free when handle zero packet").
> 
> As 5fd9e45f1ebc points out, the cdns2_gadget_giveback() function also has
> the same memory double free issue when handling zero-length packets.
> 
> Add check for usb_gadget_giveback_request() to avoid double free of memory.
> If it's additional zero length packet request, do not call 
> usb_gadget_giveback_request().
> 
> Signed-off-by: ReBeating <rebeating@163.com>
> ---
>  drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> index 7e69944ef18a..4f7898c2e364 100644
> --- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> +++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> @@ -253,7 +253,7 @@ void cdns2_gadget_giveback(struct cdns2_endpoint *pep,
>  
>  	trace_cdns2_request_giveback(preq);
>  
> -	if (request->complete) {
> +	if (request->complete && request->buf != pdev->zlp_buf) {
>  		spin_unlock(&pdev->lock);
>  		usb_gadget_giveback_request(&pep->endpoint, request);
>  		spin_lock(&pdev->lock);
> -- 
> 2.34.1
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

