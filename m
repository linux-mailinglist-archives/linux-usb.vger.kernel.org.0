Return-Path: <linux-usb+bounces-16811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 249999B4118
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 04:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE159282913
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 03:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EF82003BC;
	Tue, 29 Oct 2024 03:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fUJKg0GF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E44F16F84F
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 03:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730173028; cv=none; b=pT1ozWT7uN9WzgllDpQ5C1neylAfsQfUVlYZNkqFoL9RSLoJGm4DLf4bIJ41iXIECVHVGsL7oaK1YLfk0A0qo0A6bl84jcrX+tOIEviDeotFw3VMX4r8ZbfXwfoNJJ/vM77lL7i2FKlfXHo4HOfAnZpef/sDF7b/mAOpelW0n7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730173028; c=relaxed/simple;
	bh=HRn1toq/5qVFeRzLqPfOhuW7IvNy/J4Q+/jFQgX29Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLwhMjOeM0jf+80JWEsBwCM/1q/Kh+encKNNqOJWbg2yNHNxf/rpIkdH5WeMW2moCIvAmRParYNQMGIRrpWAcDtDUIV5v++85RCSe5qDonqKKkPw2w9PT5f7Es4uWHfbrI8OZFNsPDJUuCZDtJgacrdEl4i+Bv+oC2giRiaMVXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fUJKg0GF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE72C4CECD;
	Tue, 29 Oct 2024 03:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730173028;
	bh=HRn1toq/5qVFeRzLqPfOhuW7IvNy/J4Q+/jFQgX29Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUJKg0GF1aZo7BDDtztoM2ab49xYOO0Uvg8lwPP/k5oCNMQ42wzIHfeAGpMBUiCKS
	 IFeCkkSbSTXB/CczCSQUzMHCZ9jYFCELzM5s2I/Ejnz1aubAVi9UsczR2AH+4emeKF
	 7VpXCj6mMTIhYQNYp9TZEHKDbd+fMbYk1M7/xXkw=
Date: Tue, 29 Oct 2024 04:36:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yi Yang <yiyang13@huawei.com>
Cc: pawell@cadence.com, linux-usb@vger.kernel.org, wangweiyang2@huawei.com
Subject: Re: [PATCH] usb: cdns2: fix possible null-ptr-deref in
 cdns2_gadget_ep_queue()
Message-ID: <2024102943-such-dismantle-0946@gregkh>
References: <20241028035028.2657102-1-yiyang13@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028035028.2657102-1-yiyang13@huawei.com>

On Mon, Oct 28, 2024 at 03:50:28AM +0000, Yi Yang wrote:
> The cdns2_gadget_ep_alloc_request() will return NULL when kzalloc() fails,
> fix possible null-ptr-deref by check return value.
> 
> Fixes: 3eb1f1efe204 ("usb: cdns2: Add main part of Cadence USBHS driver")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>
> ---
>  drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> index 62fce42ef2da..c06a50af268e 100644
> --- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> +++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
> @@ -1724,6 +1724,10 @@ static int cdns2_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
>  		struct cdns2_request *preq;
>  
>  		zlp_request = cdns2_gadget_ep_alloc_request(ep, GFP_ATOMIC);
> +		if (!zlp_request) {
> +			spin_unlock_irqrestore(&pdev->lock, flags);
> +			return -ENOMEM;
> +		}
>  		zlp_request->buf = pdev->zlp_buf;
>  		zlp_request->length = 0;
>  
> -- 
> 2.25.1
> 
> 

How was this tested to verify it works properly?

thanks,

greg k-h

