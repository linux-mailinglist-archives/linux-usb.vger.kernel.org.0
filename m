Return-Path: <linux-usb+bounces-32490-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9DD3A31F
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 10:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFD2303898C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 09:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD66F1D5174;
	Mon, 19 Jan 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OQMc4otX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2233ADB4;
	Mon, 19 Jan 2026 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815215; cv=none; b=ijTx34CE4m/pEgM6lEgSRc+lvvyA2CmsFxoLJjJZDY4s3SUATQilHi5nlKItEJePX/BKflenXvf7mDW7smDRBF0Lo0ASs8z0RU+Lrd3q9unZF8DJrEknl5mkAQl3smXqc9kUckAITg5RorF9EutettjcL6qdVTrZmKNTxKYFMt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815215; c=relaxed/simple;
	bh=/4SR4V4CxGLt5YZR1VuSCKd7opFB3UpRFapIrS+K6Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUb+1k3T/SEkIZgOJ8wYev1xhLCnoOOH452VQXpKKLpglp0FiFNLG1yV/w+5cbu5hDOnGoULMiOEP4m03bpFh+JPKzJAPdYEaPHQpjSMbkCmaaKOy3oT3jTsRRzzg8B5j0TYkuqPDzWzgQkjcqygO3ks+8reNiGWzZEp7O5qnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OQMc4otX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC1BC116C6;
	Mon, 19 Jan 2026 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768815214;
	bh=/4SR4V4CxGLt5YZR1VuSCKd7opFB3UpRFapIrS+K6Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQMc4otX7TzNsUxgq+3vqJY7WADVUcOotynEgop6JKkAftaKHNK9pzTlY1I5chFPy
	 v0HJ1TWzaYSLOcHJ18dG7RFBE7nmtuiTWwAVSSsGniFgNdcJ3QEQadNVArH6WKynGB
	 xvEVfJiREpj9USkaJP00p/xit4+UD9/vMMnoL9dM=
Date: Mon, 19 Jan 2026 10:33:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhash Kumar Jha <a-kumar2@ti.com>
Cc: pawell@cadence.com, peter.chen@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rogerq@kernel.org, u-kumar1@ti.com,
	p-mantena@ti.com, theo.lebrun@bootlin.com
Subject: Re: [PATCH] usb: cdns3: host: Add null check for host_device before
 accessing its members
Message-ID: <2026011935-ransack-unworldly-7cf5@gregkh>
References: <20260119082242.1922599-1-a-kumar2@ti.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119082242.1922599-1-a-kumar2@ti.com>

On Mon, Jan 19, 2026 at 01:52:42PM +0530, Abhash Kumar Jha wrote:
> In cases when the xhci device is not populated, we see a nullptr
> exception when resuming.

How can that happen?  What changed to cause this?

> Add a nullptr check for the host_dev before accessing its private data.
> 
> Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")

No cc: stable?

> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> ---
>  drivers/usb/cdns3/host.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> index f0df114c2b53b..8cc7fc1de6193 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -141,9 +141,12 @@ static void cdns_host_exit(struct cdns *cdns)
>  static int cdns_host_resume(struct cdns *cdns, bool power_lost)
>  {
>  	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
> -	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> +	struct xhci_plat_priv *priv;
>  
> -	priv->power_lost = power_lost;
> +	if (hcd) {
> +		priv = hcd_to_xhci_priv(hcd);
> +		priv->power_lost = power_lost;
> +	}

Shouldn't you be returning an error if something went wrong?

And what protects hcd from changing right after you tested it?

thanks,

greg k-h

