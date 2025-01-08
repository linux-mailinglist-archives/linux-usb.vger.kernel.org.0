Return-Path: <linux-usb+bounces-19123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A52A05525
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 09:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13AD93A6226
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 08:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967811B0406;
	Wed,  8 Jan 2025 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bIb1ZOzw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190BB2594B3
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324357; cv=none; b=Od4h+PZoj1hTxLpI4iL9b8RWaJO2n+6LH3fqdM/BuofdrSaitG9RfXxbQbRMRY0nwLBuD6bweArqYRJAXIM/pUDdGZjfckrnCaIwt6OA5GLQtSpcOEibxT7ObyiAxx8OcEWuHRVFGEv9nPzcil4NeEAku2cI0NCwlIO3gh/thM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324357; c=relaxed/simple;
	bh=d5POTk92L68Fn7m7LqhWZaUyPqC9ZP5I9B5gy46esRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nchvnSIxpbKdIO8OI0D+ndZzE5YMRL12Y2mQcjjRmHSYrHI/6rhplYPkbNmUtL7gis23nipGSfyQwyJVKBnO0fZFtatAcJA+SU23nP+7hlFQL+ZTUX+nnM5KO0dtlez/ZXyj1CeomzS1CBYXkjrecwlDmehDNjwwx2N/fpS4DK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bIb1ZOzw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DD3C4CEE0;
	Wed,  8 Jan 2025 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736324356;
	bh=d5POTk92L68Fn7m7LqhWZaUyPqC9ZP5I9B5gy46esRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIb1ZOzw7s0dSglPKAlrIE6d/aOJWDeyu34wXvh/gwP8xtoZopUdwMZhEYCNF57Mh
	 p/tv8DlTqL47MG1lh8Wz5QEVqeq6fi3Mx1Jy322Tl+lD6NhhFTY9//uj3CiHWb97jm
	 4sWte+J63wK9zrUFPbWJgcpi9zmXmlETPYiNcKq0=
Date: Wed, 8 Jan 2025 09:19:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3-am62: Fix an OF node leak in
 phy_syscon_pll_refclk()
Message-ID: <2025010855-streak-unnatural-ca01@gregkh>
References: <20250108012826.2764119-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108012826.2764119-1-joe@pf.is.s.u-tokyo.ac.jp>

On Wed, Jan 08, 2025 at 10:28:26AM +0900, Joe Hattori wrote:
> phy_syscon_pll_refclk() leaks an OF node obtained by
> of_parse_phandle_with_fixed_args(), thus add an of_node_put() call.
> 
> Fixes: e8784c0aec03 ("drivers: usb: dwc3: Add AM62 USB wrapper driver")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/usb/dwc3/dwc3-am62.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
> index 5e3d1741701f..0a33ed958ebb 100644
> --- a/drivers/usb/dwc3/dwc3-am62.c
> +++ b/drivers/usb/dwc3/dwc3-am62.c
> @@ -166,6 +166,7 @@ static int phy_syscon_pll_refclk(struct dwc3_am62 *am62)
>  	if (ret)
>  		return ret;
>  
> +	of_node_put(args.np);
>  	am62->offset = args.args[0];
>  
>  	/* Core voltage. PHY_CORE_VOLTAGE bit Recommended to be 0 always */
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

