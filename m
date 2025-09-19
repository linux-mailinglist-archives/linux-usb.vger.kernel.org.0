Return-Path: <linux-usb+bounces-28334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616AB8A328
	for <lists+linux-usb@lfdr.de>; Fri, 19 Sep 2025 17:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BADEB4E64CA
	for <lists+linux-usb@lfdr.de>; Fri, 19 Sep 2025 15:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90146313264;
	Fri, 19 Sep 2025 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TRX/sHYK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2DE274B55
	for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758294529; cv=none; b=i0nAhHPN3cXQxvQ1diBWAbqxQVzT7x9v1p3wOYqjRScFBHt+wyZ9dPpMTSB2/hhq/DaNmj8rJqKCWqtipeLIJii31GGol0Uu0wk/PH07FZcV9NiCSrRxX9sLBmdY3xRdvQAeYHSm/Q+xYSCD5ilyaObrSVn5cpjubqONiyp4bsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758294529; c=relaxed/simple;
	bh=/a0kQx40XROJgZ3EOPUHwIoezHFZS6LbJ+em6MLV0LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adI0XHZ4J14CM/az3Wd+EkR2hZDRctxRSvfVVpt1bRPTAnc/n3IjP2TEznfccqF0C3246dcM2BMeT56LvG2uo2b5BR/x4JoRsaWMHgAtP+ivEM4YW7Lnotuj2WWrLpTTejNj8m1Z0cUrpYfkeX90W0xjOmwoK56zyzZvbks+HkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TRX/sHYK; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-79ad9aa2d95so8836606d6.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 08:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758294526; x=1758899326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/cJcwvwR+y6h1p4tywJwvr+RXXJL/piF54RClFTejJg=;
        b=TRX/sHYKm84dQYwnoHQPhZP1r/huy/qUdqvHlov6LeD3s7OlAKbDCdzKiCvuGhG0SY
         88sVXWaLOUKtlxiGzBHkmZqbvXa78OFx6SkkPBcFFGCtz8E00OU4+TOQRKz1D7DxSp1F
         7IjqJNuIeS+QzTMhbnn6UpFmrhIeTteGqv46ASHxw9Q9l0hZJBxfG9IDa71kfL+aHD2j
         FoIi6MbI/IJggupnumy3RYwdogzZ4iosuUx+IsMgelddwICG0P9X5behPcyD9PRB0lZP
         MlgJCjqxoIT3TaKXAVsDSbhF15Bk9t+M7EKFYzCn2mTUmCn8Uoo4a/5qNzek4cLfrdfX
         rPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758294526; x=1758899326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cJcwvwR+y6h1p4tywJwvr+RXXJL/piF54RClFTejJg=;
        b=ICs5fk3OHEk0+U2huzToQklXz81c2iKJUpx/Cfd0zLf15P1n5iIpCFSAr1PJ3aDk7a
         p127QSjF4qrrxuDrDzxbZKU1XVrxiFxlfG97TYhl4xNXcMFilbSckDoKswz+6o86y4L6
         Zo+KgUEjIqpiFakYQ0UtvZI6LQtuwOOovM1GbwX/Kf16g4Nf6A64fF44JXtxgcleE+XT
         /6m7uThSI6PTqk9CDkKzvd1sFZRt0gNrQdbyBKuuk3D9hQKFEKSv7n59/nrvsCIxEW7P
         uyD5CRQWj4edYta2fzcc+pC7BtTQQhYYrOVAV1ouHP8eBj0Uukw/DBxF72rRTtRQXpaY
         HlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlgF+zx0iJ12RXKTIy1u5oP6AKOgWa1YH7EtfVDTD1lTRr76yiuxrRoCWB0plYff+/r88GNVpEVqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvzVb2DowJm4qDj7wFlxRiOquw7bGmhuS+/8S2HNTksakFR4rf
	dxnGfmgiQAKTh/A2vZqUzr8JnugUqrabhXdv00Tt57RiCYJ4Svh6OMzp6PSPnUEvFw==
X-Gm-Gg: ASbGncv3Luz5OqPrL4KCaT1KR22U/xNlPtvkhzVFeeXTHU2iH8TEY8oUu0U/Jd3V3hT
	XqIXp/j6NU6usiZC9a+5vErOu++Ep807ZyJvbLAzvfCLYawNlqflix/KS8p51m+vJdoZcgSSFRW
	0lYEHBW6BqTw80q3y/MIcILxVgsXHnswZtdWaXzJhVxPn8xlhYT9CcXcZsO/O+ckazBSJ4EpyaE
	PuPcKnBfmDcJdNhUuw/q/sGtb/NsXS6KZwiL0d/oC72hxHGHEFP99xC53kd6xqpLsROLuolky/f
	qBNR2YX6FPkcooDAoWBomK9wqYxpyJh8543C0zyiNA4xZyAsnnooIkhBXX8bHPtvg4TXsUJyIy9
	7ILbNAW1PiF9NTch4bPJm+vYJ5DA2i2ciDzQ=
X-Google-Smtp-Source: AGHT+IHbpkXQZhe+Jnrr9L+se/U4Bba6Omx0NL0JhE8vgSxjcjks/kfv+u5a4rDegESNS9rEBeb68Q==
X-Received: by 2002:a05:6214:daf:b0:77a:29ba:1b68 with SMTP id 6a1803df08f44-799212d1809mr46426076d6.63.1758294526374;
        Fri, 19 Sep 2025 08:08:46 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::bb27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-79351b9ddffsm30204296d6.37.2025.09.19.08.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:08:45 -0700 (PDT)
Date: Fri, 19 Sep 2025 11:08:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] usb: uhci: Add Aspeed AST2700 support
Message-ID: <9bb18e89-13bc-469b-8c05-61f8d55a558e@rowland.harvard.edu>
References: <20250919025712.719246-1-ryan_chen@aspeedtech.com>
 <20250919025712.719246-5-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919025712.719246-5-ryan_chen@aspeedtech.com>

On Fri, Sep 19, 2025 at 10:57:12AM +0800, Ryan Chen wrote:
> Unlike earlier Aspeed SoCs (AST2400/2500/2600) which are limited to
> 32-bit DMA addressing, the UHCI controller in AST2700 supports 64-bit
> DMA. Update the platform UHCI driver to select the appropriate DMA
> mask based on the device tree compatible string.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/usb/host/uhci-platform.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
> index f255358d6242..5b4be9a5764a 100644
> --- a/drivers/usb/host/uhci-platform.c
> +++ b/drivers/usb/host/uhci-platform.c
> @@ -71,6 +71,7 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  	struct usb_hcd *hcd;
>  	struct uhci_hcd	*uhci;
>  	struct resource *res;
> +	u64 *dma_mask_ptr;
>  	int ret;
>  
>  	if (usb_disabled())
> @@ -81,7 +82,8 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  	 * Since shared usb code relies on it, set it here for now.
>  	 * Once we have dma capability bindings this can go away.
>  	 */
> -	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	dma_mask_ptr = (u64 *)of_device_get_match_data(&pdev->dev);
> +	ret = dma_coerce_mask_and_coherent(&pdev->dev, *dma_mask_ptr);

What will happen here if of_device_get_match_data() returns 0 or an 
error?  Shouldn't you test for that and then use dma_mask_32 as the 
default mask?

And if you do this then do you need to add the .data fields to the 
existing entries in the platform_uhci_ids table below?

Alan Stern

>  	if (ret)
>  		return ret;
>  
> @@ -114,7 +116,8 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
>  		}
>  		if (of_device_is_compatible(np, "aspeed,ast2400-uhci") ||
>  		    of_device_is_compatible(np, "aspeed,ast2500-uhci") ||
> -		    of_device_is_compatible(np, "aspeed,ast2600-uhci")) {
> +		    of_device_is_compatible(np, "aspeed,ast2600-uhci") ||
> +		    of_device_is_compatible(np, "aspeed,ast2700-uhci")) {
>  			uhci->is_aspeed = 1;
>  			dev_info(&pdev->dev,
>  				 "Enabled Aspeed implementation workarounds\n");
> @@ -189,9 +192,13 @@ static void uhci_hcd_platform_shutdown(struct platform_device *op)
>  	uhci_hc_died(hcd_to_uhci(hcd));
>  }
>  
> +static const u64 dma_mask_32 =	DMA_BIT_MASK(32);
> +static const u64 dma_mask_64 =	DMA_BIT_MASK(64);
> +
>  static const struct of_device_id platform_uhci_ids[] = {
> -	{ .compatible = "generic-uhci", },
> -	{ .compatible = "platform-uhci", },
> +	{ .compatible = "generic-uhci", .data = &dma_mask_32},
> +	{ .compatible = "platform-uhci", .data = &dma_mask_32},
> +	{ .compatible = "aspeed,ast2700-uhci", .data = &dma_mask_64},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, platform_uhci_ids);
> -- 
> 2.34.1
> 

