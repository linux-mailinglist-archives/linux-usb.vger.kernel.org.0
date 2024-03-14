Return-Path: <linux-usb+bounces-7956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A619187BF80
	for <lists+linux-usb@lfdr.de>; Thu, 14 Mar 2024 16:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6D321C2250D
	for <lists+linux-usb@lfdr.de>; Thu, 14 Mar 2024 15:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C92F7173F;
	Thu, 14 Mar 2024 15:02:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C1DBB71720
	for <linux-usb@vger.kernel.org>; Thu, 14 Mar 2024 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710428537; cv=none; b=q3USwDFmGk5CwCR7LGIEM0BVi3InZWACO6wi4KSkXSFVuHX+apiedCtfGWHYoPfDd4tpald5tewuwdlz5eTytJpfHMu8BkWPSg+RszLRQTtlsYv/meKQTjE94+0ynt3c8dFktIHVHiz+KLzmUPwOcUtjP+/Cb6Sg2Om7BQJltXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710428537; c=relaxed/simple;
	bh=J2az5xit6S97FuikUD3ut1qxE0/67NvxNSHUOkn1EQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwsxZdYXWhogOAKfgqtbJof+7dp75YmVD4Hoi4R1rRIewAT+xJbE/opf2scGT+2+fdlnw44ezGgH6ijgu0B5jMNWPHz50basfS2NmPTPyp7FgwH82bjVXCBjmKTj67lCKB1/yRj88Yal394Nt8ZE5kgMoMiXJWOBNMgcRtXo1mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 453699 invoked by uid 1000); 14 Mar 2024 11:02:10 -0400
Date: Thu, 14 Mar 2024 11:02:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: yuan linyu <yuanlinyu@hihonor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: f_mass_storage: reduce chance to queue disable ep
Message-ID: <e0717340-9f13-4ae9-b3e6-f12811024244@rowland.harvard.edu>
References: <20240314065949.2627778-1-yuanlinyu@hihonor.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314065949.2627778-1-yuanlinyu@hihonor.com>

On Thu, Mar 14, 2024 at 02:59:49PM +0800, yuan linyu wrote:
> It is possible trigger below warning message from mass storage function,
> 
> ------------[ cut here ]------------
> WARNING: CPU: 6 PID: 3839 at drivers/usb/gadget/udc/core.c:294 usb_ep_queue+0x7c/0x104
> CPU: 6 PID: 3839 Comm: file-storage Tainted: G S      WC O       6.1.25-android14-11-g354e2a7e7cd9 #1
> pstate: 22400005 (nzCv daif +PAN -UAO +TCO -DIT -SSBS BTYPE=--)
> pc : usb_ep_queue+0x7c/0x104
> lr : fsg_main_thread+0x494/0x1b3c
> 
> Root cause is mass storage function try to queue request from main thread,
> but other thread may already disable ep when function disable.
> 
> As mass storage function have record of ep enable/disable state, let's
> add the state check before queue request to UDC, it maybe avoid warning.
> 
> Also use common lock to protect ep state which avoid race between main
> thread and function disable.

This seems like a lot of effort just to avoid a harmless WARNING.  How 
about instead changing the WARNING to a debug-level message?

Alan Stern

> Cc: <stable@vger.kernel.org> # 6.1
> Signed-off-by: yuan linyu <yuanlinyu@hihonor.com>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index c265a1f62fc1..056083cb68cb 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -520,12 +520,25 @@ static int fsg_setup(struct usb_function *f,
>  static int start_transfer(struct fsg_dev *fsg, struct usb_ep *ep,
>  			   struct usb_request *req)
>  {
> +	unsigned long flags;
>  	int	rc;
>  
> -	if (ep == fsg->bulk_in)
> +	spin_lock_irqsave(&fsg->common->lock, flags);
> +	if (ep == fsg->bulk_in) {
> +		if (!fsg->bulk_in_enabled) {
> +			spin_unlock_irqrestore(&fsg->common->lock, flags);
> +			return -ESHUTDOWN;
> +		}
>  		dump_msg(fsg, "bulk-in", req->buf, req->length);
> +	} else {
> +		if (!fsg->bulk_out_enabled) {
> +			spin_unlock_irqrestore(&fsg->common->lock, flags);
> +			return -ESHUTDOWN;
> +		}
> +	}
>  
>  	rc = usb_ep_queue(ep, req, GFP_KERNEL);
> +	spin_unlock_irqrestore(&fsg->common->lock, flags);
>  	if (rc) {
>  
>  		/* We can't do much more than wait for a reset */
> @@ -2406,8 +2419,10 @@ static int fsg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
>  static void fsg_disable(struct usb_function *f)
>  {
>  	struct fsg_dev *fsg = fsg_from_func(f);
> +	unsigned long flags;
>  
>  	/* Disable the endpoints */
> +	spin_lock_irqsave(&fsg->common->lock, flags);
>  	if (fsg->bulk_in_enabled) {
>  		usb_ep_disable(fsg->bulk_in);
>  		fsg->bulk_in_enabled = 0;
> @@ -2416,6 +2431,7 @@ static void fsg_disable(struct usb_function *f)
>  		usb_ep_disable(fsg->bulk_out);
>  		fsg->bulk_out_enabled = 0;
>  	}
> +	spin_unlock_irqrestore(&fsg->common->lock, flags);
>  
>  	__raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE, NULL);
>  }
> -- 
> 2.25.1
> 

