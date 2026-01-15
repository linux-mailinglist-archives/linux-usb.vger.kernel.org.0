Return-Path: <linux-usb+bounces-32371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 035F1D22937
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 07:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 060D13054666
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 06:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F5529D26D;
	Thu, 15 Jan 2026 06:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TTRP9IwM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C900A2741DF;
	Thu, 15 Jan 2026 06:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768458974; cv=none; b=R/Mz+G/0mObiauRxxVbf04ZtI7T60R8yP3v3fhHMeJjDbvBecf0CjHaRrJgEwKSzV0/gRJP8qhrb+GE0JYpZpHecwdteWt5wtOp3kqAfbmrvHV8VZjOTYioiYJUf3v3f9cimk9hZw5IQ23jrah1rivLg7JDjTj56HbL9r5QU8Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768458974; c=relaxed/simple;
	bh=Zgq1odwLUragddvsxqM93E56MmQAFOhziStzXlaAP+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cE5H8Ml1jRfCY5uPT1r/C3DAz50EyWjo86GMTwUiTekgjZuNlGr0Yzjh6/ZQ0OFvQbIXPEMwOdVueJKLo+oZxvhtm78FdnGWTvbNtvfpc1JKXJ/KsBYmLXR+/nBWGIYl1e3t1Hd4dso1HVGvivG96ttrJ6Dk0WzugdGfwmRk0tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TTRP9IwM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D19CC116D0;
	Thu, 15 Jan 2026 06:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768458974;
	bh=Zgq1odwLUragddvsxqM93E56MmQAFOhziStzXlaAP+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTRP9IwM4N2i6JXuEgDc4DjutcpTwLRqA3e99eGkfYqqEJeI17FrdggcJI/W78MFR
	 TyApgu8lPKa3w75NyIVk+dVlunY0bQPZ7tr857fTUMmGabNkXrqUlhjl9p91piMb6H
	 n5Og0ZVNuSsxXqifqq5c8iYk7EUBA0ZPeAWRI7Ls=
Date: Thu, 15 Jan 2026 07:36:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Cc: pawell@cadence.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns2: fix use-after-free in cdns2_gadget_giveback
Message-ID: <2026011553-seltzer-scouring-8ce2@gregkh>
References: <CALEuBamV3oXcTm1bE=m6O6XcXR=rrFaMgjaLyZqSOG2ghDDqqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALEuBamV3oXcTm1bE=m6O6XcXR=rrFaMgjaLyZqSOG2ghDDqqw@mail.gmail.com>

On Thu, Jan 15, 2026 at 04:32:21AM +0800, 齐柯宇 wrote:
> This fix addresses a use-after-free vulnerability discovered through
> static code analysis of the cdns2_gadget_giveback() function.
> 
> The vulnerability exists because after usb_gadget_giveback_request()
> is called, the code continues to access request->buf. However,
> usb_gadget_giveback_request() invokes the request's complete callback,
> and certain gadget function drivers (such as FunctionFS with DMABUF)
> may directly free the request within this callback.
> 
> Call flow leading to use-after-free:
> 
>   cdns2_gadget_giveback()
>     -> usb_gadget_giveback_request()
>        -> request->complete()  [e.g., ffs_epfile_dmabuf_io_complete]
>           -> usb_ep_free_request()  // request is freed here
>     -> if (request->buf == pdev->zlp_buf)  // UAF: accessing freed memory
>        -> cdns2_gadget_ep_free_request()   // potential double-free
> 
> Data flow analysis shows that this vulnerability can be triggered when:
> 1. A user application uses FunctionFS with DMABUF transfer capability
> 2. The user attaches a DMABUF via FUNCTIONFS_DMABUF_ATTACH ioctl
> 3. The user initiates a transfer via FUNCTIONFS_DMABUF_TRANSFER ioctl
> 4. Upon transfer completion, ffs_epfile_dmabuf_io_complete() is called
>    as the complete callback, which frees the request
> 5. cdns2_gadget_giveback() then accesses the freed request->buf field
> 
> Evidence that complete callback can free the request (f_fs.c):
> 
>   static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
>                                             struct usb_request *req)
>   {
>       ffs_dmabuf_signal_done(req->context, req->status);
>       usb_ep_free_request(ep, req);  // frees the request directly
>   }
> 
> The fix saves the ZLP check result before calling the complete callback
> and uses mutually exclusive logic: requests with complete callbacks are
> owned by the gadget function driver, while only ZLP requests without
> complete callbacks are freed by the UDC driver.
> 
> Fixes: 3eb1f1efe204 ("usb: cdns2: Add main part of Cadence USBHS driver")
> Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
> ---
>  drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> index 9b53daf76583..8997623cca5a 100644
> --- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> +++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> @@ -240,6 +240,7 @@ void cdns2_gadget_giveback(struct cdns2_endpoint *pep,
>  {
>    struct usb_request *request = &preq->request;
>    struct cdns2_device *pdev = pep->pdev;
> +  bool is_zlp = (request->buf == pdev->zlp_buf);
> 
>    list_del_init(&preq->list);
> 
> @@ -257,10 +258,14 @@ void cdns2_gadget_giveback(struct cdns2_endpoint *pep,
>       spin_unlock(&pdev->lock);
>       usb_gadget_giveback_request(&pep->endpoint, request);
>       spin_lock(&pdev->lock);
> -  }
> -
> -  if (request->buf == pdev->zlp_buf)
> +  } else if (is_zlp) {
> +     /*
> +      * Only ZLP requests without a complete callback are freed
> +      * by the driver. Requests with complete callbacks are
> +      * owned by the gadget function driver.
> +      */
>       cdns2_gadget_ep_free_request(&pep->endpoint, request);
> +  }
>  }
> 
>  static void cdns2_wa1_restore_cycle_bit(struct cdns2_endpoint *pep)
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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

