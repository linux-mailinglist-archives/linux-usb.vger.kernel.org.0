Return-Path: <linux-usb+bounces-31624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E47CCE0D4
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 01:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6646302E2CA
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 00:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9081E47A3;
	Fri, 19 Dec 2025 00:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="RxwEVGVy";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="RxwEVGVy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0421C5F1B;
	Fri, 19 Dec 2025 00:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766103779; cv=none; b=ByerQrgEb4j04b+SZZm7HJ50P39fJQ1wUl6veuQ1VwEfK6rNqTS7LRkrEltFky+VvdLFxtYwYVwRHh8cwOOBXuR1cmi5mmn+XHnIFnC2LBwBYlhKWSq3rqmkdCTjwdgVX9RCbwq7LxByJPQEqVnXrUmQlU/QHz3sAq/jYH32XGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766103779; c=relaxed/simple;
	bh=Z5aZjMwXFY/aS1eZq1wTS+FU56hpQXgJwOCzQYAdrf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hG8jjPL/f9h+ZMGUoODU6Ccgg7ywmUs6YLtymtbnBJv7XjQGRoiOLOPEaPF+59sVFWtVg2qxwjvqmM47l9V5f+F6AOzONXYdptdzuCJoRhcGAEx0kZ41KK2WBTBgbFeIxFAcTwa+1m+luEbFWZTSFs5KKLhXeymA341YTj1tavA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=RxwEVGVy; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=RxwEVGVy; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766103776; bh=Z5aZjMwXFY/aS1eZq1wTS+FU56hpQXgJwOCzQYAdrf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RxwEVGVyP4CGlvuGTWNs3xA+Z2QRmSe8TnmujZbdivxrazNkNOwuZty7Wo9dUZPTb
	 hyzfEJIk47QQV/7eRtMtcqo2tzLAnwHWUgxDt3kBZWABAyEA1BUIi4ylzVXF2bJuVf
	 B88KtVoVIxxII5AWMhj2jMr6P3Saz+niGZKVRaam89RfAtLVndmHELcrCEkasRNIe5
	 pOvhx+flaZAYm1y5F4f7BtEPRTtD7csPGL4gC25IgjiVQ5Xtl73ke3g+UwKShnjhgW
	 eRH9eR/BfliYsfYHXyXFxVyDJ2hX3rRY/2WE+bqFPYe2GSCD2FrWR6ytKZI/J6h3xJ
	 cp7yDWLvglPug==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id CE6D53E7A9A;
	Fri, 19 Dec 2025 00:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766103776; bh=Z5aZjMwXFY/aS1eZq1wTS+FU56hpQXgJwOCzQYAdrf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RxwEVGVyP4CGlvuGTWNs3xA+Z2QRmSe8TnmujZbdivxrazNkNOwuZty7Wo9dUZPTb
	 hyzfEJIk47QQV/7eRtMtcqo2tzLAnwHWUgxDt3kBZWABAyEA1BUIi4ylzVXF2bJuVf
	 B88KtVoVIxxII5AWMhj2jMr6P3Saz+niGZKVRaam89RfAtLVndmHELcrCEkasRNIe5
	 pOvhx+flaZAYm1y5F4f7BtEPRTtD7csPGL4gC25IgjiVQ5Xtl73ke3g+UwKShnjhgW
	 eRH9eR/BfliYsfYHXyXFxVyDJ2hX3rRY/2WE+bqFPYe2GSCD2FrWR6ytKZI/J6h3xJ
	 cp7yDWLvglPug==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 61FC73E769B;
	Fri, 19 Dec 2025 00:22:56 +0000 (UTC)
Message-ID: <f9251c13-a4d7-4ccd-a0ea-abfaa02a8639@mleia.com>
Date: Fri, 19 Dec 2025 02:22:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] usb: ohci-nxp: clean up probe error labels
To: Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Alan Stern <stern@rowland.harvard.edu>, Ma Ke <make24@iscas.ac.cn>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251218153519.19453-1-johan@kernel.org>
 <20251218153519.19453-6-johan@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20251218153519.19453-6-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251219_002256_861187_33FFC6E7 
X-CRM114-Status: GOOD (  17.36  )

On 12/18/25 17:35, Johan Hovold wrote:
> Error labels should be named after what they do rather than after from
> where they are jumped to.
> 
> Rename the probe error labels for consistency and to improve
> readability.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   drivers/usb/host/ohci-nxp.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 509ca7d8d513..7663f2aa35e9 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -169,13 +169,13 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>   
>   	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>   	if (ret)
> -		goto fail_disable;
> +		goto err_put_client;
>   
>   	dev_dbg(&pdev->dev, "%s: " DRIVER_DESC " (nxp)\n", hcd_name);
>   	if (usb_disabled()) {
>   		dev_err(&pdev->dev, "USB is disabled\n");
>   		ret = -ENODEV;
> -		goto fail_disable;
> +		goto err_put_client;
>   	}
>   
>   	/* Enable USB host clock */
> @@ -183,7 +183,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>   	if (IS_ERR(usb_host_clk)) {
>   		dev_err(&pdev->dev, "failed to acquire and start USB OHCI clock\n");
>   		ret = PTR_ERR(usb_host_clk);
> -		goto fail_disable;
> +		goto err_put_client;
>   	}
>   
>   	isp1301_configure();
> @@ -192,13 +192,13 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>   	if (!hcd) {
>   		dev_err(&pdev->dev, "Failed to allocate HC buffer\n");
>   		ret = -ENOMEM;
> -		goto fail_disable;
> +		goto err_put_client;
>   	}
>   
>   	hcd->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(hcd->regs)) {
>   		ret = PTR_ERR(hcd->regs);
> -		goto fail_resource;
> +		goto err_put_hcd;
>   	}
>   	hcd->rsrc_start = res->start;
>   	hcd->rsrc_len = resource_size(res);
> @@ -206,7 +206,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0) {
>   		ret = -ENXIO;
> -		goto fail_resource;
> +		goto err_put_hcd;
>   	}
>   
>   	ohci_nxp_start_hc();
> @@ -220,9 +220,9 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>   	}
>   
>   	ohci_nxp_stop_hc();
> -fail_resource:
> +err_put_hcd:
>   	usb_put_hcd(hcd);
> -fail_disable:
> +err_put_client:
>   	put_device(&isp1301_i2c_client->dev);
>   	isp1301_i2c_client = NULL;
>   	return ret;

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Thank you for the fixes!

-- 
Best wishes,
Vladimir

