Return-Path: <linux-usb+bounces-18077-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4F9E30F8
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 02:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6EBC1671CF
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 01:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7E817BCA;
	Wed,  4 Dec 2024 01:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBvYPnnT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221EFC0B;
	Wed,  4 Dec 2024 01:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733277453; cv=none; b=r/GN30220msiXWJevTJSA/DsKWl9xwECAoF4s6djlLDW48YoZbA1dnwGj/Kdu6QWFvMuMualos08/PT5ZFJpW5PmStuzup/lglxo8nz/41fP7KCv7LgLtCqN5uyfDDn6sbiCfhBphA0JQ7wJJJeO0GVgVJSLcfWz+IERO/zSj8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733277453; c=relaxed/simple;
	bh=sKwXakM97Vy+gvHGlUI4SqD61uEpcyla7i9isnlALto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+l1itlTs1otXrPoozmcM5X8xbWIgd645wQH+NuSwYKdkh4TgPTsbHot1JfJv2CDJjapl+65ldgcQsazkgspz4FLEwvcYy+R9T4N2GwSlcnVCHiE37rga98ECuaqtEySrWZRwTyfT/pJPcLbgKiY2AVRBQXDUZw6uRMcajFP2jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBvYPnnT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B41DC4CEDC;
	Wed,  4 Dec 2024 01:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733277453;
	bh=sKwXakM97Vy+gvHGlUI4SqD61uEpcyla7i9isnlALto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBvYPnnT7QkWJOzM6TkwEOU6NE9n+4mHRD89feqklWqRB0k8Om9aFfgGhp3hv73ia
	 87jELIhFeDCglwdxcLEmG2aIXcXNv0Ja7Q1/ZU14eEY5e2E9C54NC/vY+LVcgGr42x
	 5afgClVdGpoQYX2cLgQY/hKDYERPAImV9oFSS+hIByu9xqFqg3c8fhZT4OTipllhXb
	 4dYwmg9XyvOG3ajvTpySaH1hxSvMEXVuiZkUYavfHuRPYk9SmqBKibQeIRaQdMrhbX
	 dbfNKxui6REjW4UejweBMqHkVOWTnWtbbWzXFEjytDgEm+FcqonpJC3lNg2DYJ08tu
	 Po9YZZkJIiEmw==
Date: Wed, 4 Dec 2024 09:57:24 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: chipidea: host: Improve port index sanitizing
Message-ID: <20241204015724.GA2610544@nchen-desktop>
References: <20241202083453.704533-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202083453.704533-1-xu.yang_2@nxp.com>

On 24-12-02 16:34:53, Xu Yang wrote:
> Coverity from Synopsys complains "Illegal address computation (OVERRUN)"
> on status_reg.
> 
> After below code executed,
> 
>   port_index = wIndex & 0xff;
>   port_index -= (port_index > 0);
> 
> the static analysis tool see the value of port_index is now between 0 and
> 254 (inclusive).
> 
> However, ehci_def.h define port_status as below:
> 
>   #define HCS_N_PORTS_MAX         15
>   u32     port_status[HCS_N_PORTS_MAX];
> 
> So the tool think illegal array pointer may be obtained.
> 
>   status_reg = &ehci->regs->port_status[port_index];
> 
> This will follow "846cbf98cbef USB: EHCI: Improve port index sanitizing" to
> improve port index sanitizing.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> Changes in v2:
>  - rewrite commit message to better understand the issue
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
> +	 */
> +	port_index = (wIndex - 1) & 0xff;
> +	if (port_index >= HCS_N_PORTS_MAX)
> +		port_index = 0;
>  	status_reg = &ehci->regs->port_status[port_index];
>  
>  	spin_lock_irqsave(&ehci->lock, flags);
> -- 
> 2.34.1
> 

