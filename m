Return-Path: <linux-usb+bounces-17964-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D549DC34B
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 13:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97A44B2169D
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 12:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B0F19CC28;
	Fri, 29 Nov 2024 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U90MOdSp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654A198E74;
	Fri, 29 Nov 2024 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732882479; cv=none; b=j8uBqngydIbZ78wPiy0jFOIV1GT7GLJqrPKnMQUV9I0+RvaRltBqhrpxvWEuNnNX3ph742QDkDl7oACywDwQVbp7r1BGwHIqqteRxwfoIIql7HmghI8RLKpZWGvJuvauwacgYwN3AdLz7j1gbArW0ozO/l6Z30xYAtkApuwMTIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732882479; c=relaxed/simple;
	bh=KNBM0GaRgnPk305c4Fsh25ZFOqB+MVYew4pF/nSBnkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j32Mk3FSpvtZCzaFSUhuPOqclikRfOGLt2hPAtr7ZqbKyH8NL421+/HDpFsGqBCxAHCZD9Odby3OxpYuk2grGTP1ZH0/XzsqAfl3NxMx1j+Zc7+jtVSSg92gWZ4oYaMKTfyqJW2ow0rB3Tn569lhVhwf9yGDrg6F5FZUsPFYlek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=U90MOdSp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33499C4CED2;
	Fri, 29 Nov 2024 12:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1732882478;
	bh=KNBM0GaRgnPk305c4Fsh25ZFOqB+MVYew4pF/nSBnkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U90MOdSpLEmbg4fgh6H1sqUYn5LQVVIpaNSQgXf8jSJ//8syCrbCIr77htfqKByue
	 CwkbPdT2lTMFbkwKhDqb2wQCOp3xSpe6AThFXvZODhM+m7Q+h85SLfJKA3YR7g561N
	 1c2a+URg7CxY7zmCE6d9z+pxJ//bHsAB1OSFI0GA=
Date: Fri, 29 Nov 2024 13:14:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: host: Improve port index sanitizing
Message-ID: <2024112946-undercut-ivory-5fe2@gregkh>
References: <20241129113318.296073-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129113318.296073-1-xu.yang_2@nxp.com>

On Fri, Nov 29, 2024 at 07:33:18PM +0800, Xu Yang wrote:
> Coverity complains "Illegal address computation (OVERRUN)" on status_reg.
> This will follow "846cbf98cbef USB: EHCI: Improve port index sanitizing" to
> improve port index sanitizing.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/host.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index 0cce19208370..442d79e32a65 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -256,8 +256,14 @@ static int ci_ehci_hub_control(
>  	struct device *dev = hcd->self.controller;
>  	struct ci_hdrc *ci = dev_get_drvdata(dev);
>  
> -	port_index = wIndex & 0xff;
> -	port_index -= (port_index > 0);
> +	/*
> +	 * Avoid out-of-bounds values while calculating the port index
> +	 * from wIndex. The compiler doesn't like pointers to invalid
> +	 * addresses, even if they are never used.

The compiler does not care so what does care?  Why is this needed if it
is never accessed?  This comment is odd to me.

thanks,

greg k-h


> +	 */
> +	port_index = (wIndex - 1) & 0xff;
> +	if (port_index >= HCS_N_PORTS_MAX)
> +		port_index = 0;
>  	status_reg = &ehci->regs->port_status[port_index];

So this is used?  But what controls wIndex here and how can it be too
big?

thanks,

greg k-h

