Return-Path: <linux-usb+bounces-13802-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2995A00D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 16:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03126284561
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 14:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6B319993B;
	Wed, 21 Aug 2024 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KbFyL/vA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4D763F8
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251047; cv=none; b=a40+cPkY2XTAzDghl6SIMvgG77QEK1MH2QbRIgwYAZawELrqdXfiDM1QTU5bkbwd2Elxxv6dzIfhHw5OI0WV29GpQhZ1r80WJmB2oYrgrHoP92OA/zL37veak+D+GH182xLZSIpqSxISROKLDO7csDgVfMyU0rOuwWcaf265NvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251047; c=relaxed/simple;
	bh=2cPqzWCRj3Vvt56r6GVcESbl1xYdPYP6aaV1iUouy28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfV8cpiKmq8KC+V2pzTH8l7QFUZQibyfWpRVdXtQPf5/GgYh5c4vtE0WJUx7lo6zn9VXDwP/Dd79XcA/HqrIfTor8t617UeTFt7QGvzHhY2+/aZ0k2Qk4s6WPNosWNYsxFDjhSMPibc5mQXboycaRAv4oQQqrnAOuFGq6v3PyQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KbFyL/vA; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-44fe188d25cso26800701cf.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724251044; x=1724855844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2O/+O/6znUkgPNntFe8RASVvsMxUVtklQ41xqZRo80Q=;
        b=KbFyL/vALa/j3O0KfIhqb67VLug8Ks8gFF/y9f9uk40j2IdZ+p18171xsq/krh0//0
         oVPul0OQjZkStwpeXdTJgOEJWVQ5R3BNwhbLaSiRpg3u3KGj7R+eV9iyqA2RBdB370Z9
         BtOfGOx7om9r80ljVT3wLtbALlMJ1X/zQJCmM9bxYmaRHpAhQ28MNDax5enRpB1EeNDX
         dFv92yn8QcvcQGBkDaOOb7EMyNR5iqTJ0mpK+19wGMRj1TTdlnI60WEATyzHWMRZ6+zR
         NBTmL+YANsjMg/NUdnT101yugoeW8EVe0Zu4+L8YuS14SfxzxXhthY9oXx9VHXlteo9F
         wY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724251044; x=1724855844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2O/+O/6znUkgPNntFe8RASVvsMxUVtklQ41xqZRo80Q=;
        b=fDFfME/Aw8jbSEJjYYYN2yGVp6GB5e1qQbGB+6syM2Ykygzd0cVea9R6uTXOwK+Plg
         FwFOL5MaiyghTPucVAuK2OBysWLzh27cSxLRo+WS3Wl38aHfihe7q3iGHpZjMhHEIk9j
         ttM7XYoFDbgYf4JbDiESDcgtl269LSv/RuSmacaic8Zv/7MkZRlXosz861tg7C7Y3tf9
         GTYPEXnCZ9TR6RkJFSjjiedklHYlccIfzdE/+nxBs5ropZWzMLDZOoeOaZTljIagMKAn
         YnNz41d416nqBv+UL+RKHV5YuGQWTxIeFb+Irls+zGblGuqA3nzgNkN8d33+GWU3F1PH
         A90w==
X-Forwarded-Encrypted: i=1; AJvYcCV4KKGPrbjIPfouV3K4LLGSAtfk75m5+RJzkZEZYXHxkRDPlpbno0iSotyuSWgfIAYaGHNsWeRW4rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyadDn6Y0H6/sKKhs9AEckWSBtJQbrysTq4E4PiDNRAJuyglyRR
	Jy39D06CccMNAopuzkk0QypzPKLeuJW4M342W7qvbsmbG9OcoEfTKdb2yb58DQ==
X-Google-Smtp-Source: AGHT+IFQ0USsIGAqI9Y1Ekn9vVQD7FDO2tsMe7yJMeS9XLQJli9cS0UjPRk/Jhqd242nAV02esYKcA==
X-Received: by 2002:a05:622a:248e:b0:44f:8870:185f with SMTP id d75a77b69052e-454f26949a1mr27426161cf.61.1724251044108;
        Wed, 21 Aug 2024 07:37:24 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-8.wrls-client.fas.harvard.edu. [140.247.12.8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4536a050f7esm59433781cf.66.2024.08.21.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:37:23 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:37:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: gregkh@linuxfoundation.org, krzk@kernel.org, alim.akhtar@samsung.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] usb: ohci-exynos: Simplify with scoped for each
 OF child loop
Message-ID: <72adad30-7af4-48d2-a5ed-bf7ddc26ac40@rowland.harvard.edu>
References: <20240821071752.2335406-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821071752.2335406-1-ruanjinjie@huawei.com>

On Wed, Aug 21, 2024 at 03:17:52PM +0800, Jinjie Ruan wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> ---
> v2:
> - Update the commit subject.
> - Spilit into 2 patches.
> - Add Reviewed-by.
> ---
>  drivers/usb/host/ohci-exynos.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
> index bfa2eba4e3a7..1379e03644b2 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -37,7 +37,6 @@ struct exynos_ohci_hcd {
>  static int exynos_ohci_get_phy(struct device *dev,
>  				struct exynos_ohci_hcd *exynos_ohci)
>  {
> -	struct device_node *child;
>  	struct phy *phy;
>  	int phy_number, num_phys;
>  	int ret;
> @@ -55,26 +54,22 @@ static int exynos_ohci_get_phy(struct device *dev,
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
>  		exynos_ohci->phy[phy_number] = phy;
> -		if (IS_ERR(phy)) {
> -			of_node_put(child);
> +		if (IS_ERR(phy))
>  			return PTR_ERR(phy);
> -		}
>  	}
>  
>  	exynos_ohci->legacy_phy = true;
> -- 
> 2.34.1
> 

