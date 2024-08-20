Return-Path: <linux-usb+bounces-13738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E4958839
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 15:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B61D1F231F3
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 13:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E796319066D;
	Tue, 20 Aug 2024 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PAMGYst3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A776190462
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724161619; cv=none; b=BjpWtnZe3u6tmFGlmug1DwHWlHesPmNWktBnWVgrrkl4+gztznmyHKIWCjIzt4bmPyMK9u4gZbjwzenFCNACcrLy23wjFOo5AJNmGjv5nYWREUaHDmNy1YesMVDmLfd1CdiBHWpu2FEUyF2BqvDBwKQ8wflCuwW8VBFKe+pvKPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724161619; c=relaxed/simple;
	bh=DGs+YQ/MemHzCI0cJ+pHenoa+Ft3gJVm3OGIx/wVAbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXV60eBqpYiLpa+RQHvYSGnJ0yYwzqQ3G8AbBCWErgRKdb+aNe4tSrHADZihP4m2g1GRgxpJy0k/B0JEk20c+9qJTsiL7yKPrcHGNtJI09al4ZMtATHKQhmDIkIqfqZPv5YrO4hVVjgd9YIRLElT8WVFUgQtMVWf8QBDF0RRV6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PAMGYst3; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a35eff1d06so17047685a.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 06:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724161616; x=1724766416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I830akbhhKKwI8d91ZRK8IKM+grDVk/w+Lt2TLToceE=;
        b=PAMGYst3Nj/JhGJ71MXqkUV/SIynbVvumC+1lXIwIt2QPhKYPAol+A+gfYYfnuTK/I
         FAFFw/UIONRPTxfPbw1oGNS2HV0gdVljp7R13dgbBUtQvMTmckNPdp17iXzp7gG3WgN0
         ca45ayelOQKnKlf7l/+Kq+2qUjmv1oqwsxi0WLn+IpSOKl5X8yw+L+OS8ASnP47wIYIA
         fdTYkbj0Q6Eg7pV2DPXo/F7iYE9FkBy/C2jY5niDtmOvLtH3EgGlnxtQPXYHtMoDig96
         lKNR+ggoa0DerzY/ZV6jw4+IyGUj5q6HpJaRKtZYHHKhUqPoXstb+fSFMQQibYbxFylI
         kLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724161616; x=1724766416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I830akbhhKKwI8d91ZRK8IKM+grDVk/w+Lt2TLToceE=;
        b=tTy9nOkOD7DaqQgm590bFdcKq7EPQiqlu9bZTFih5LpUeQab+/V6oeTvXr5bCACcgR
         O9B6Yfo8aMCV1Z4ermjg6WJ+fEskwUOeUgVI8sQzgf+mFThA3fjFWAzqPrZcOnsL3jrA
         ZsgMhTDqqaQsR0Elz9mZYNPVk3oj7KWw/Xmy+S2fs8/u4zqANMt1yHZVqsicFI6OxVmY
         2k8PDB1WEWdsIfHSu8UdCasckt4u9wjzz29F7Coo42ZXahXEYi4Bnc38jx26s1PtfL8P
         XEtGfOhD1kfHQ1IJksnOuYvqkJ2eGwJwipOZ7erHzZ/kCgHRu5Xdtl7wMrcV7Qdwesed
         L7BA==
X-Forwarded-Encrypted: i=1; AJvYcCVWMtCk1GRT8ccP5HUd7zW2Ttn7YqKhWV+6nQfRLTY6pCs6864E9JDkSiZZkgVtQMFg3krWpf1iHvx72bXJQ4DG6KgBDLc/1lpF
X-Gm-Message-State: AOJu0YzsfAJDGEWtVvbXlCPjPvBaf/KCZ5GnzCOZfZKjMkk1vGJTbIyM
	Ht9GHU4ECvYmHkkUd65TakFOiMWAWWu/L25YBi+XdhDODFVRKHy6AXPRSnX6AQ==
X-Google-Smtp-Source: AGHT+IEI4p59YOvtEm63+a/jQKuInzhxdbxB8AjFcSMqvIayjz8ztlKu6vsDqXATlGHaKRjS/mRyUQ==
X-Received: by 2002:a05:620a:1a12:b0:7a6:6b98:8e36 with SMTP id af79cd13be357-7a66b988f33mr163494185a.16.1724161615865;
        Tue, 20 Aug 2024 06:46:55 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-8.wrls-client.fas.harvard.edu. [140.247.12.8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff112b45sm527883485a.125.2024.08.20.06.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 06:46:55 -0700 (PDT)
Date: Tue, 20 Aug 2024 09:46:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: gregkh@linuxfoundation.org, krzk@kernel.org, alim.akhtar@samsung.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next RESEND] usb: xhci: Simplify with scoped for each OF
 child loop
Message-ID: <435bde54-aa08-47d1-8fe0-980bcc577803@rowland.harvard.edu>
References: <20240820065635.560427-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820065635.560427-1-ruanjinjie@huawei.com>

On Tue, Aug 20, 2024 at 02:56:35PM +0800, Jinjie Ruan wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/usb/host/ehci-exynos.c | 9 ++-------
>  drivers/usb/host/ohci-exynos.c | 9 ++-------
>  2 files changed, 4 insertions(+), 14 deletions(-)

The patch changes ehci-exynos.c and ohci-exynos.c.  So then why does the 
Subject: line say "xhci"?

The contents of the patch look okay.

Alan Stern

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

