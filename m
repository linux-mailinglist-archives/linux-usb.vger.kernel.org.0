Return-Path: <linux-usb+bounces-23285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF0A95F09
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 09:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0B463AB70F
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 07:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154A422F3AB;
	Tue, 22 Apr 2025 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vFEvgPZG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D41990C4
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 07:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305932; cv=none; b=JjJ874z50QxIbdoivV/Zbd4/+RNssGQrg21hSFN/aFLtSq4cXn1BCpeL/Zh1U6oDsTKAWnSEOoHCU9rsSwmJfhEqpsjE6UzKgrrRqg+YERwCw39+Ec0rh04aZ7NwsFVWDGagYgoFB65lByWiE7HLqAzHfD04q7fK+Zl/LBGuc5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305932; c=relaxed/simple;
	bh=bF7/0rcglb2JlFZMD64zPeqk6Y+60ao0Y+6V0yZbbFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN7ZMc6mjhIDUeQb6REHm4Lhe1nvupFlB2WRJPw4ZmUwIboSrdSPpGoKsmp6XATWh2OHiFs2s+MH68Qz/X2NqN2vV5xd8NQf99C5X23OVzQNxcgbl60NmT4c22vXxQv6EpUdSFpOP4hRE4gZHGRbpGWu5634YzgAP7bg5jY3PhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vFEvgPZG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A4EC4CEE9;
	Tue, 22 Apr 2025 07:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745305932;
	bh=bF7/0rcglb2JlFZMD64zPeqk6Y+60ao0Y+6V0yZbbFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFEvgPZGFXiZCWvSVL76HcxyYHgdpr96MK21538f5Ln+0IB3d9n7tCj1ayFSRvPyw
	 sodvCYu8xzI7lieOs5hPvy9v/yx/3gvWJVWojYbJOueoQXmqKxmMQ6A3pSl+nuLTPS
	 EJj/xAk93BuXmnHUlbJqYvsSmPRDCUbtfV5FBMN8=
Date: Tue, 22 Apr 2025 09:12:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc2: gadget: Fix enter to hibernation for UTMI+ PHY
Message-ID: <2025042259-aide-unlimited-a1e2@gregkh>
References: <ebb0ddd4b18be292e98a25ccbdf74802ba8d77c5.1744021784.git.Minas.Harutyunyan@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebb0ddd4b18be292e98a25ccbdf74802ba8d77c5.1744021784.git.Minas.Harutyunyan@synopsys.com>

On Tue, Apr 22, 2025 at 06:59:54AM +0000, Minas Harutyunyan wrote:
> For UTMI+ PHY, according to programming guide, first should be set
> PMUACTV bit then STOPPCLK bit. Otherwise, when the device issues
> Remote Wakeup, then host notices disconnect instead.
> For ULPI PHY, above mentioned bits must be set in reversed order:
> STOPPCLK then PMUACTV.
> 
> Fixes: 4483ef3c1685 ("usb: dwc2: Add hibernation updates for ULPI PHY")
> Reported-by: Tomasz Mon <tomasz.mon@nordicsemi.no>
> Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> ---
>  drivers/usb/dwc2/gadget.c | 37 +++++++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index e7bf9cc635be..be6b792e9a7d 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -5345,20 +5345,33 @@ int dwc2_gadget_enter_hibernation(struct dwc2_hsotg *hsotg)
>  	if (gusbcfg & GUSBCFG_ULPI_UTMI_SEL) {
>  		/* ULPI interface */
>  		gpwrdn |= GPWRDN_ULPI_LATCH_EN_DURING_HIB_ENTRY;
> -	}
> -	dwc2_writel(hsotg, gpwrdn, GPWRDN);
> -	udelay(10);
> +		dwc2_writel(hsotg, gpwrdn, GPWRDN);
> +		udelay(10);
>  
> -	/* Suspend the Phy Clock */
> -	pcgcctl = dwc2_readl(hsotg, PCGCTL);
> -	pcgcctl |= PCGCTL_STOPPCLK;
> -	dwc2_writel(hsotg, pcgcctl, PCGCTL);
> -	udelay(10);
> +		pcgcctl = dwc2_readl(hsotg, PCGCTL);
> +		pcgcctl |= PCGCTL_STOPPCLK;
> +		dwc2_writel(hsotg, pcgcctl, PCGCTL);
> +		udelay(10);
>  
> -	gpwrdn = dwc2_readl(hsotg, GPWRDN);
> -	gpwrdn |= GPWRDN_PMUACTV;
> -	dwc2_writel(hsotg, gpwrdn, GPWRDN);
> -	udelay(10);
> +		gpwrdn = dwc2_readl(hsotg, GPWRDN);
> +		gpwrdn |= GPWRDN_PMUACTV;
> +		dwc2_writel(hsotg, gpwrdn, GPWRDN);
> +		udelay(10);
> +	} else {
> +		/* UTMI+ Interface */
> +		dwc2_writel(hsotg, gpwrdn, GPWRDN);
> +		udelay(10);
> +
> +		gpwrdn = dwc2_readl(hsotg, GPWRDN);
> +		gpwrdn |= GPWRDN_PMUACTV;
> +		dwc2_writel(hsotg, gpwrdn, GPWRDN);
> +		udelay(10);
> +
> +		pcgcctl = dwc2_readl(hsotg, PCGCTL);
> +		pcgcctl |= PCGCTL_STOPPCLK;
> +		dwc2_writel(hsotg, pcgcctl, PCGCTL);
> +		udelay(10);
> +	}
>  
>  	/* Set flag to indicate that we are in hibernation */
>  	hsotg->hibernated = 1;
> 
> base-commit: 12393996c1b28cd944465d2f55500ca84399a7f1
> -- 
> 2.41.0
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

