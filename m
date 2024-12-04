Return-Path: <linux-usb+bounces-18094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C99E3D70
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 15:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 194411636BB
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 14:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216E120B1E6;
	Wed,  4 Dec 2024 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="00wFZg2i"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9261B4124;
	Wed,  4 Dec 2024 14:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324194; cv=none; b=ZosFuYM8RtuqMXBPHqjL7JCeUkgERiHjdlRUXra3vqUYs9dsE4BjlwJW97YBdXa/XKXSZxqykVublRndeibKrYOgR/ITvmEIYi4eFuBvZpPjrn6/T4fN8akiD1xjv5zMpT6LVzzOt8KcEhDyuCNQUeyPu5x8zXt61oFpklOYSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324194; c=relaxed/simple;
	bh=VrApkmCQ7OLsx/HiaNNmAgFTOOUbcnn1Hg4GyGxNkg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7pbsHwgY4HJ6SrDb8zRlZDJjcRKmCqm0wljOOThtG2QbAIbcNipJLlqEf+cuW4EO6oodP7v58PdRx66TtPKv6cVXvxu0ZAO0KODaYS8ftYK9Nzp3K2ESidInNUCtnkrnwqbM/zT6z/HMNxs8gL8QzSVEFz2MdFda/FGAffvCyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=00wFZg2i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9123FC4CECD;
	Wed,  4 Dec 2024 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733324194;
	bh=VrApkmCQ7OLsx/HiaNNmAgFTOOUbcnn1Hg4GyGxNkg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=00wFZg2iCDEA+yYAGVNIilVjNHb/PkMT7u36jhDJHmCjTiSpTl9GWdl9NVTchz/fd
	 GNpu3Lvx4WhfCAUKmz/6Neidzv9DiryQ284aofvjJPlF4FcI23Zyqm/LQ9TQqhgHk8
	 a4MTa2nb1hiCYNpX3ffEOeWY2W5UikabaXnZg3nI=
Date: Wed, 4 Dec 2024 15:56:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: host: xhci-plat: set skip_phy_initialization if
 software node has XHCI_SKIP_PHY_INIT property
Message-ID: <2024120402-applause-perky-223c@gregkh>
References: <20241105073904.2416057-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105073904.2416057-1-xu.yang_2@nxp.com>

On Tue, Nov 05, 2024 at 03:39:04PM +0800, Xu Yang wrote:
> The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
> software node property. This will set skip_phy_initialization if software
> node also has XHCI_SKIP_PHY_INIT property.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/host/xhci-plat.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index e6c9006bd568..77853b86794a 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -290,7 +290,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>  
>  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
>  
> -	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
> +	if ((priv && (priv->quirks & XHCI_SKIP_PHY_INIT)) ||
> +		(xhci->quirks & XHCI_SKIP_PHY_INIT))

Wrong indentation :(

Also, what commit id does this fix?  Should it go to stable kernels, and
if so, how far back?  And if not, why not?

thanks,

greg k-h

