Return-Path: <linux-usb+bounces-13803-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0929295A019
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 16:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BA9B1C22905
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 14:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757951B253F;
	Wed, 21 Aug 2024 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NRoVT830"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD8F7D3E2
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251078; cv=none; b=b7qNSYNbpCwl4+5Xo4HjL7Jaff+DVmA815Xo0/Gc9qZ6Vr0i4jJaGiepC//8E7QAaX/SiyG7fKRONSkGfIDjaAjxDtdWzImN/P0Ab+vOkSq/FWuen40+mBH0vACjM8P30SvLnLO2Hafw+FdGtGhqCxoow2uhvTsZ9RQe1mwiD28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251078; c=relaxed/simple;
	bh=FVsYbPAvgMgCGwds8h/Wi00szbGFYrxetnC7hv6av3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzIXanC2LtD9Zam/4jS5JCE7jElAc8XIPevnLh/9fQqBobzyWtaphIpfbuZ18HPmyovczbFHSn3s5izgMw+Km2zq/7rcwbfGCAPGdvO9D1H+J5A2RxY8pYYm9e8AGrgFCzKBy7Y/1gv/G4n91Dmv4YvFUu5Y0HbNrfdnshoQPr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NRoVT830; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5d5c324267aso3920047eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724251075; x=1724855875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eeL7Rd+axk/Z65jpbD90HZ1f75grRQAJLvS6IO1HwSQ=;
        b=NRoVT830iciUuRsuW02ZFmmFWt9yGbe0e+uD7Bs4GmhHmF4WSlJfW4C6hZ9dmwyH4D
         nrcQtEL3no8kEGaXquxsRCgQYGxXjWcLlG8e2VBjGLGVYgHL9RYKnc6l27XQdx3t3yR6
         JaPvY8b6QKl82nYxje0IPFSV+zhNt5mx5tmwRNLa2pyyF37fKUfsGn2X5YOysBoxYpCE
         U6EcWCaI2JEx42wsaKop1Nnpmu6e8+R0qyEF1QME7HYDU2X9/nYuD9L+kRCUH86UT4io
         3Z22/UmLxrG3Q8cunF6ySq5eej3hrtvR5GUUGMPm4SqEzBBP9pee0DTiaj2IQnjPE2rO
         HVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724251075; x=1724855875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeL7Rd+axk/Z65jpbD90HZ1f75grRQAJLvS6IO1HwSQ=;
        b=S4zBHqi6zQvtgIxlyHrt3+ylHO/QDyyrWK2B7Vx15xOeiCq4xeZNLHHfNcBBESiqMs
         7zXYvML6axVap430iaJ3zV9ymU8Busjgmir7kTUNcbF2FB3wdYAi8aBUdoPszgFw7MO0
         leEK30+tnCR8QpB7cIegZxlz+ZREB1jtUAK/kEVfISVIt7jXctonm0Su8Ubg66EFXk5o
         b67xbKabhY66vEw0dY3VfG6flu3o4sao7ZkDEv+XjRQ8BSQF7xw+YUPbcCpR64LgEoVv
         Ts4pbCVsfS42gHRTSf2JbWWd193TF6b+YpOwH4Nb9ssnGGgIeBE+rb/DJ3kRasxXyS/W
         vbiA==
X-Forwarded-Encrypted: i=1; AJvYcCWWxNOART1jOx3e3PUmVN2UGZnrgQVfaB6EbxFnZ2K7dH/JBa0es48sih/dg7trbSaPEBqHsvFmXfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKV59FX9pjNhGW+oUPjcw/PCmYDPzojS+/9xe3iJ9VCEjK5+Mx
	ZBxy0I/nVuJEGKMYm1OHu5n38pde6E1eu2gjDJ2RByBBMCoDoniHCM3FTfQHEw==
X-Google-Smtp-Source: AGHT+IHKVXgXnNh7Vl7MHFbNLldyo3rr8hecTtlHKuooYloN/lFestiTEiQL1vaPhuibzDM+/2G0Ow==
X-Received: by 2002:a05:6820:1ac6:b0:5c9:d9db:6a51 with SMTP id 006d021491bc7-5dca34e2eb9mr2653269eaf.0.1724251075012;
        Wed, 21 Aug 2024 07:37:55 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-8.wrls-client.fas.harvard.edu. [140.247.12.8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe25970sm61342326d6.60.2024.08.21.07.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:37:54 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:37:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: gregkh@linuxfoundation.org, krzk@kernel.org, alim.akhtar@samsung.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] usb: ehci-exynos: Simplify with scoped for each
 OF child loop
Message-ID: <a3ec2bbd-9f0a-4378-a3fa-8e0a82c8b808@rowland.harvard.edu>
References: <20240821071856.2335529-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821071856.2335529-1-ruanjinjie@huawei.com>

On Wed, Aug 21, 2024 at 03:18:56PM +0800, Jinjie Ruan wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> v2:
> - Update the commit subject.
> - Spilit into 2 patches.
> - Add Reviewed-by.
> ---
>  drivers/usb/host/ehci-exynos.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index f40bc2a7a124..e3a961d3f5fc 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -48,7 +48,6 @@ struct exynos_ehci_hcd {
>  static int exynos_ehci_get_phy(struct device *dev,
>  				struct exynos_ehci_hcd *exynos_ehci)
>  {
> -	struct device_node *child;
>  	struct phy *phy;
>  	int phy_number, num_phys;
>  	int ret;
> @@ -66,26 +65,22 @@ static int exynos_ehci_get_phy(struct device *dev,
>  		return 0;
>  
>  	/* Get PHYs using legacy bindings */
> -	for_each_available_child_of_node(dev->of_node, child) {
> +	for_each_available_child_of_node_scoped(dev->of_node, child) {
>  		ret = of_property_read_u32(child, "reg", &phy_number);
>  		if (ret) {
>  			dev_err(dev, "Failed to parse device tree\n");
> -			of_node_put(child);
>  			return ret;
>  		}
>  
>  		if (phy_number >= PHY_NUMBER) {
>  			dev_err(dev, "Invalid number of PHYs\n");
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>  
>  		phy = devm_of_phy_optional_get(dev, child, NULL);
>  		exynos_ehci->phy[phy_number] = phy;
> -		if (IS_ERR(phy)) {
> -			of_node_put(child);
> +		if (IS_ERR(phy))
>  			return PTR_ERR(phy);
> -		}
>  	}
>  
>  	exynos_ehci->legacy_phy = true;
> -- 
> 2.34.1
> 

