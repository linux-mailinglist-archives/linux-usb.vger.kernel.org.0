Return-Path: <linux-usb+bounces-12440-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D976293CE5D
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 08:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16DB81C20D73
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 06:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD6E17622D;
	Fri, 26 Jul 2024 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ldU7r6Ix"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C6173332;
	Fri, 26 Jul 2024 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721976953; cv=none; b=RE2TIYCjaNXa01H9rYp3w6e76aHTV1OTQhu37EQItZbwbp74Z03uGWDuZeW71D27w63h89NI0ULSFvOUIaDJwRM1YKaOEJIWzVI306JvCnUOCRVSG5HMh4s1gI0Mz3UdAFnPbIhGdzP6/Yi15E2y4BP8n1dyHwhuc9LwbyAmzW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721976953; c=relaxed/simple;
	bh=bdIwJ/4nu4+KCxJe0alUQUJf38MsA69moluw9BRz+lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhUHkdoum0c820p5V/EYgqrHk+o3e/V4h5DuVYHJwEeJa8d7Y6ez0GLnfqcPBb+xKOJDT4u78b94g3LMbOd7/b7QQ0WHdRWoZ8Pd39SD7sW90hZJQFSSriHHxV8cUrpLXNgktiRLiJ7dTJGs0RdxGdQoqyskK/7eRduBTRMa3Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ldU7r6Ix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35FBC32782;
	Fri, 26 Jul 2024 06:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721976952;
	bh=bdIwJ/4nu4+KCxJe0alUQUJf38MsA69moluw9BRz+lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldU7r6IxYyHdQvPgsui9cjPZ36y6gCclT7KzRjlOQan3mtNbRhCI7MsRbkQSCfsuh
	 tHDGh8c3KiQ+NtGlGYVgT1cN6cnCr59Ilk0pSdCIl60LbCJlXgWsYKUX9hRSG+/5Op
	 LqonJE9tNjbh7nBGaOBz1TB+QQgPPCRE3iPFe5OE=
Date: Fri, 26 Jul 2024 08:55:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Roger Quadros <rogerq@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH] usb: cdns3: imx: simplify system pm using
 _force_suspend/_resume
Message-ID: <2024072635-egging-suffix-92d5@gregkh>
References: <20240725212811.296307-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725212811.296307-1-shenwei.wang@nxp.com>

On Thu, Jul 25, 2024 at 04:28:11PM -0500, Shenwei Wang wrote:
> By utilizing _force_suspend and _force_resume, ensures a more consistent
> and simple approach to handling system sleep states. It also aligns the
> driver's PM behavior with the other drivers' common practices.
> 
> Fixes: db3c4e366287 ("usb: cdns3: imx: Rework system PM to avoid duplicated operations")
> Reviewed-by: Frank Li <frank.li@nxp.com>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/usb/cdns3/cdns3-imx.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> index 281de47e2a3b..9051cbe9d68b 100644
> --- a/drivers/usb/cdns3/cdns3-imx.c
> +++ b/drivers/usb/cdns3/cdns3-imx.c
> @@ -360,7 +360,6 @@ static int cdns_imx_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -
>  /* Indicate if the controller was power lost before */
>  static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
>  {

Unneeded change here?


