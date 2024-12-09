Return-Path: <linux-usb+bounces-18247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4DF9E90D6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 11:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A711F1881CE6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 10:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA854219EB2;
	Mon,  9 Dec 2024 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BB7M/WCG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D0219EA6;
	Mon,  9 Dec 2024 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733741223; cv=none; b=SqFKM22OD4i/2K1qwZd4POBGtWdTas6tNz/hOrt8yrSohu5gz1vDaBymZ+CQFN65uzftRDUdpyWclEjVb1Rq21JD6+UCkiTARPnWdvPYxqYOYRWMDIUJrcin8g+7ubhpGJ7MpmJYFDaE7T4nJjWhIHjc671AIBkaprA5cz4GzW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733741223; c=relaxed/simple;
	bh=p40zvoqNnmMgLDzeT3TQxp7nVKwGGO8zm87pc/8n94Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aa54bmgTQ0WcL8etDuy5as6V9810gTVuu/zUzPMYtZG0ot3k9O0yudZHxId6HZluXDMR5/1uv2+ty9BZd+/wa8l0XcCIgSlhb3WEcWZ+GRPuOkDZiskfFVZ5hKdZog0EL6fkJfTS2z6FfCeWjo3a6aMM8fofyiNssGBZIne09ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BB7M/WCG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B16EC4CEE0;
	Mon,  9 Dec 2024 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733741222;
	bh=p40zvoqNnmMgLDzeT3TQxp7nVKwGGO8zm87pc/8n94Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BB7M/WCGd4Ehth9tpTcT4MBtPYH6ps0dNh6ohkxy0xyqoQ9ziw2lvu3WJCcJ5hP1w
	 tdPvZKDL6uoap5GwEnhgvQ+hPPh/ygkdDbAL/Po3kBSp8k7brhQHRB+WRCd1lzcgqE
	 lxTQDmDLHr9DjIMJbwA5AltKHZwI/MxUX5DijM14=
Date: Mon, 9 Dec 2024 11:46:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: mathias.nyman@intel.com, Frank.Li@nxp.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: host: xhci-plat: set skip_phy_initialization if
 software node has XHCI_SKIP_PHY_INIT property
Message-ID: <2024120913-exploring-pueblo-da0e@gregkh>
References: <20241209104149.4080315-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209104149.4080315-1-xu.yang_2@nxp.com>

On Mon, Dec 09, 2024 at 06:41:49PM +0800, Xu Yang wrote:
> The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
> software node property. This will set skip_phy_initialization if software
> node also has XHCI_SKIP_PHY_INIT property.
> 
> Fixes: a6cd2b3fa894 ("usb: host: xhci-plat: Parse xhci-missing_cas_quirk and apply quirk")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - fix indentation
>  - add fix tag and stable list
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

Doesn't checkpatch.pl complain about this?  This is still not correct,
please follow the proper indentation rules here.  If you have questions
about this, please ask your coworkers who understand the style
requirements for Linux.

thanks,

greg k-h

