Return-Path: <linux-usb+bounces-28283-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E36B84F30
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 16:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DA2D7C11A8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 14:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836412FD7A7;
	Thu, 18 Sep 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="U1kYPwFI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2B4212566
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204159; cv=none; b=CiF9dcRbaSrNsAuwCaaI5jdYMwbHNyRI6znd80a4L3dy5ANFD+na+7aw36evLKotu7P6CgzdBiZKjCp03/MgGTAEj8fDQW3jm3phQs+1u6K/x76PnObCJgfHUGgC8UJoGpoQd6PSlqatIzoRJdVdgnkzQUX4Het9ihQxAFU498g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204159; c=relaxed/simple;
	bh=sGKZ00n5UDQXEyHBMBFXRLZojhXv5KW24a44k+cS0BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUpUxjJGvVYLVBzU3gVhqTHlfZZOSUQfxB7rXjhS2V8D1yPy1IpHJw5TVWG5LaGI40hGIGbAJnOSUWata8E8VP71Uy7wT92z5lRy5tZ+A/kLNDLiQ480wLgCnWDohBUwIX1UqVw9eJbz4fJIFHd6x/FnMw4xe15MOJa/0iO+L1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=U1kYPwFI; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-78de32583fbso5153226d6.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758204156; x=1758808956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mN2EtEp97sJogExyeUW2p5bKBNRveeYjjBUrQmZ9S8k=;
        b=U1kYPwFI09c9NCUMeznb5gL6M14UadhybYyX9w1RfKhHjMfKUzDr7EsopyBjycR122
         qK4Xb9ugumoxe5n+HKTQEPq8QRYbN26ewX7NDSKJozxAhBo9QJKvNlOZKh3N1n1PI81S
         y7ZfeZdb/TdDQYmDMY66+GtH0ONrDdNqIYkDplhSIUChxMSgfZVqmIR0XSmakr3VJIFg
         +XhPIumLdnwxacng2T+sYyjqZBz9MIn3DeejPTIyvXCHidwiEgrsF8akZI/QdhIOKmTu
         Rz8Fu+8O0IbZymSIGEGSNGKQHlD3Rrq/2xi/HmS6WuNt+g5qZY52jpmhi/NPuo9tNPN+
         mxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204156; x=1758808956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mN2EtEp97sJogExyeUW2p5bKBNRveeYjjBUrQmZ9S8k=;
        b=v7R3LMIXMhoZCSQaykCiiVSGXxoSU9uhX8M2uxTbsgeS9tTyvz7sSDO7sIawpBvJ3j
         dJiIrlm3wEV4cAhYT+CKzDCCA1FP5zOB5kAgKLko49vRASS8Z3HJAoTGJohBgWFqb6Ia
         /9orX0qyiJCApSfJDqeOeF6a6rwObZs5m9ZPyNEG4mMW22zenyiFRtCXwVhfjYobQl0h
         KyONBxTS79TO7rjGQ6NkCKsol3LgVM9WNVysML0BLOmp2ITKWjIoZKZufRf97gAbTGqi
         +WEIxua9WRKqLWOHrmk0VkuCX+qkcSTWDax6qEGHN5QumioNtRK0ChLC2fGFj/ceTCjS
         vpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVA+PIcgdbr2iq/+vlgof4NOJYxfWtQm/Fih4bxl1bj/W40IkluG8wo3N+vUOPV+AHghShBNRFRPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIQpiEaiqcbZMf23gVYVHjG1wUBVf7lmbdWvWti54k9/YBq8E
	/01DBgwmDcWcZzbLTNtoQoyjEGp7ShL3aQ2QnYstibyGpfdgaA7O4aMN2UIgD6lKGA==
X-Gm-Gg: ASbGncsxBmGptUpUukOE1/bnnXnVmRffwztrrx6ICllJxUVgT2zpaJrYPKU44zoXFtV
	qkIMMupOseTXDDpzxsqXD+3yVBgLiZcNvbEH4I8Cu/IyYldHYqcaqs1oq1GuyGv6OgjLzNHn89C
	TgK7Zgh4lyH/4ucM7gVvkzXDsmhA4JTQ8ScmORX93+0vR6Vnl9NATAEtH2kaSVveRups2uPbeGr
	jFtjom02bDwoyXmNN+37x7pQ2sT0TaasXjCpkc7WVmJbCetr/TwgNWbQrHgh/l24VoUGcb55vN6
	iv2L8iiNw//Uyj035Sdyy7gGYm4wY8+HRGpDQkMd+ri/FtVKxfDNj/xQnvKSpQ9klJSHCKLRqmA
	SHXNNd3zGz4u7wKVDuJN+0WQtMDGeLXcIQYOg6PiYg6rlQiHfRXal/YgjtaZyvsxu
X-Google-Smtp-Source: AGHT+IGlt2hbobisXSeZHsNze0BfPPP53bsTOpqMhw+K8n1S/Ym1JROT13oEyZ3NdZHmGsAomrN0gQ==
X-Received: by 2002:a05:6214:252b:b0:70d:6df3:9a88 with SMTP id 6a1803df08f44-78ecf4ffb35mr51718416d6.56.1758204154421;
        Thu, 18 Sep 2025 07:02:34 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7934693139asm13525086d6.21.2025.09.18.07.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:02:33 -0700 (PDT)
Date: Thu, 18 Sep 2025 10:02:29 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: ehci: Add Aspeed AST2700 support
Message-ID: <95dfea8a-f5ec-488b-bdd0-fa12acd3dce8@rowland.harvard.edu>
References: <20250918064919.224927-1-ryan_chen@aspeedtech.com>
 <20250918064919.224927-3-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918064919.224927-3-ryan_chen@aspeedtech.com>

On Thu, Sep 18, 2025 at 02:49:19PM +0800, Ryan Chen wrote:
> Unlike earlier Aspeed SoCs (AST2400/2500/2600) which are limited to
> 32-bit DMA addressing, the EHCI controller in AST2700 supports 64-bit
> DMA. Update the EHCI platform driver to make use of this capability by
> selecting a 64-bit DMA mask when the "aspeed,ast2700-ehci" compatible
> is present in device tree.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/usb/host/ehci-platform.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index 6aab45c8525c..edf1fb4033c2 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -27,6 +27,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/sys_soc.h>
> @@ -122,10 +123,18 @@ static const struct ehci_driver_overrides platform_overrides __initconst = {
>  	.extra_priv_size =	sizeof(struct ehci_platform_priv),
>  };
>  
> +#define EHCI_PDATA_COMMON        \
> +	.power_on		= ehci_platform_power_on,	\
> +	.power_suspend	= ehci_platform_power_off,	\
> +	.power_off		= ehci_platform_power_off
> +
>  static struct usb_ehci_pdata ehci_platform_defaults = {
> -	.power_on =		ehci_platform_power_on,
> -	.power_suspend =	ehci_platform_power_off,
> -	.power_off =		ehci_platform_power_off,
> +	EHCI_PDATA_COMMON,
> +};
> +
> +static const struct usb_ehci_pdata ehci_ast2700_platform = {
> +	EHCI_PDATA_COMMON,
> +	.dma_mask_64 = 1,
>  };

Arggh!  This is dreadful.  Just have two copies of the initializers.

Better yet, change your of_match data into a boolean property for 
overriding the default DMA mask and then use the original 
ehci_platform_defaults structure.  Look at ohci_platform_probe() in 
ohci-platform.c for an example.

>  
>  /**
> @@ -239,6 +248,7 @@ static int ehci_platform_probe(struct platform_device *dev)
>  	struct usb_hcd *hcd;
>  	struct resource *res_mem;
>  	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
> +	const struct of_device_id *match;
>  	struct ehci_platform_priv *priv;
>  	struct ehci_hcd *ehci;
>  	int err, irq, clk = 0;
> @@ -250,7 +260,10 @@ static int ehci_platform_probe(struct platform_device *dev)
>  	 * Use reasonable defaults so platforms don't have to provide these
>  	 * with DT probing on ARM.
>  	 */
> -	if (!pdata)
> +	match = of_match_device(dev->dev.driver->of_match_table, &dev->dev);
> +	if (match && match->data)
> +		pdata = (struct usb_ehci_pdata *)match->data;

Do you really want the of_match data to override the platform data?  
Consider a system that has both.  Which one do you think would be more 
important?

(If you take my suggestion above, this question becomes moot.)

Alan Stern

> +	else if (!pdata)
>  		pdata = &ehci_platform_defaults;
>  
>  	err = dma_coerce_mask_and_coherent(&dev->dev,
> @@ -298,7 +311,9 @@ static int ehci_platform_probe(struct platform_device *dev)
>  		if (of_device_is_compatible(dev->dev.of_node,
>  					    "aspeed,ast2500-ehci") ||
>  		    of_device_is_compatible(dev->dev.of_node,
> -					    "aspeed,ast2600-ehci"))
> +					    "aspeed,ast2600-ehci") ||
> +		    of_device_is_compatible(dev->dev.of_node,
> +					    "aspeed,ast2700-ehci"))
>  			ehci->is_aspeed = 1;
>  
>  		if (soc_device_match(quirk_poll_match))
> @@ -485,6 +500,7 @@ static const struct of_device_id vt8500_ehci_ids[] = {
>  	{ .compatible = "wm,prizm-ehci", },
>  	{ .compatible = "generic-ehci", },
>  	{ .compatible = "cavium,octeon-6335-ehci", },
> +	{ .compatible = "aspeed,ast2700-ehci",	.data = &ehci_ast2700_platform },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, vt8500_ehci_ids);
> -- 
> 2.34.1
> 

