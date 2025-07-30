Return-Path: <linux-usb+bounces-26279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD42B16916
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 00:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94BAC5439C6
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jul 2025 22:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D3D22ACF3;
	Wed, 30 Jul 2025 22:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dPu+AXX7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C650F442C
	for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753914830; cv=none; b=G6kExAhxmuI1ZiTrEZTCAY9oDw1Vn1lZrIC4w9CGbIrzXBRMOOMKpHnrRgshhS0BQm+Ps1onIvGl/ERridy2DrDHSDUbcFCaYoKlPLqg0NLdKCMLUfo8Not1SpiuacOn33wzsyl3zKulw/zOZZ17WVmSeEjOwxAImYwz64qn2fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753914830; c=relaxed/simple;
	bh=G31ZBFxdaIwjZdalNPuw0PPxQDTalTmUbnAC3X61TFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m4oz4Sb5m8NRwymF3iPh/B2Ih0RR9OMgON8PuePOyh44aLdDzzCT6BJkU9tWLYy+rEwn7f4j48YhVOKA7VWFOGaoinkBLMRa3umEA76WQdlcjjm7ycyJd+Y5uzzXz7S4Jn1/Vuz+k7WYEBeXnN5s9/KbWo7iooo7qrFghUE6hKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dPu+AXX7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76858e9e48aso278962b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Jul 2025 15:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753914828; x=1754519628; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qbwIpZpuxTW6ypBRd+8DYZv7Z1puN1Qod/Cu72dMNU4=;
        b=dPu+AXX7Y3GArpIgv4xZVpqiSxrwinPnobGAtqvYwgu8jWN96JEZgn+F9AbkLsMeSt
         T+r39xk2U/SLqZW1q6SdRxRm8uoJ0mM5gvjArOYxHA4t9t6l70j/oEju9bJ0DgIvDKcN
         Rnyia/34ZIcJO1tJhe3vUS8qfPfqrAtG9uM1fv4HwMX8X/kg5pctN2yJU1NwUHjHYc3X
         ki9F695SIUXnW6LW5BmjlV0eERhvNruf+lImFBDsA0rRYNH2xSXGNmjEUhBob9KAqXhg
         DsJSnRMu8oT7o5evsGBhKaMbpS4gjiWI2qkSVUGS30q5/shsRGuxi0UO93HoWUFPd2DR
         gqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753914828; x=1754519628;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbwIpZpuxTW6ypBRd+8DYZv7Z1puN1Qod/Cu72dMNU4=;
        b=HZJFqMHfXKbq/Xhm7msZqHctFi4NmgJop4uHy3Ir5cBW03ZNqij/hJPNhzFxi7hVRC
         crtG011Wn3CL4WUBa/uin/AJ0E/9RffgQ8vhZt0KvBC9OnXi7ld6hLOykLL14FWFfp5N
         KsE6vB29f+P946aWl0Kdn6QeWkIxkkLM++FZQhUqQv8FMA3QjrdpXcwYvI4GC8ItLwLe
         j/imDprFgvRdCpGANHC2zNw2qB/sBP/AZ38EAvIbkR987uN/LhNfO9qwa1hu4SI3PKB9
         5mHMjXY0NV7K0Y0bZSr1pcatW+OLlc2yoMNTsPMa985j3VwrKU2RkuqHCpkgb/2RL9nZ
         CG0g==
X-Forwarded-Encrypted: i=1; AJvYcCWo9qsW0Kiscyst0w29F8L2kVfhwXdIoI0IeoXpl6QpxymK6/gF0vIf3KhiGu2G6JH4OtuVDWpPDqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBEyKkcIfT8MmJg+ebQ90sVFa6iQsoRqmUyP+ikMjgRVcc5g5d
	thdsbU+dPL6EsCUQ5zzQfSynxvMTKtVt90rvRJNAfGP5+LyWNgCygD6FSW3uQs4aSEM=
X-Gm-Gg: ASbGncvZ/voIF2V5b8HGTNSZzIwzUjTQJtxtnufEsCuWjfWd5cqbXKN9hGsmAdWoMtZ
	wBJqM3710J4+HXjraB+NQqMoOHuT2rdGS/yKx55M5qh+lA0jEm4fPtctq2bBx58xHKyx/ks3ysu
	SeFaVufL7AZyxhSI+EzEaFLe6EC4XXQFoppJTCDbZnT+kswYuvsdrdtlBTbARDG1TvHMzmeavYD
	FMzrwDKzVj3PupCEVqLfRHtYkV5kC0dgAIIXi58teugL38+Hn1w8qp8UvZ9qwbmeKIQgoeMjBx0
	fqd1LJYY6p5feFCJp8G3nXzO3iu6oIk0ZaT1rC1QtvTl+uB5yzLhSf3bccpc8lBXyP0Ckzu7tcy
	Xqj2CcEfx20W0vTw/Zu+C
X-Google-Smtp-Source: AGHT+IFVvG5XIQBkbLCl5VPYmjOAUtErQAK865HSjh3e0RWA3HBC5WeLm+CN3RJVo/WaONO1qtxrDQ==
X-Received: by 2002:a17:902:eb8a:b0:237:d734:5642 with SMTP id d9443c01a7336-24096b4bd4bmr70980755ad.41.1753914828003;
        Wed, 30 Jul 2025 15:33:48 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207eba6bb8sm195736a91.4.2025.07.30.15.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 15:33:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Bin Liu <b-liu@ti.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 5/5] usb: musb: omap2430: clean up probe error handling
In-Reply-To: <20250724091910.21092-6-johan@kernel.org>
References: <20250724091910.21092-1-johan@kernel.org>
 <20250724091910.21092-6-johan@kernel.org>
Date: Wed, 30 Jul 2025 15:33:47 -0700
Message-ID: <7ho6t1b96c.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Johan Hovold <johan@kernel.org> writes:

> Using numbered error labels is discouraged (e.g. as it requires
> renumbering them when adding a new intermediate error path).
>
> Rename the error labels after what they do.
>
> While at it, drop the redundant platform allocation failure dev_err()
> as the error would already have been logged by the allocator.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/usb/musb/omap2430.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
> index 36f756f9b7f6..c35c07b7488c 100644
> --- a/drivers/usb/musb/omap2430.c
> +++ b/drivers/usb/musb/omap2430.c
> @@ -318,13 +318,11 @@ static int omap2430_probe(struct platform_device *pdev)
>  
>  	glue = devm_kzalloc(&pdev->dev, sizeof(*glue), GFP_KERNEL);
>  	if (!glue)
> -		goto err0;
> +		return -ENOMEM;
>  
>  	musb = platform_device_alloc("musb-hdrc", PLATFORM_DEVID_AUTO);
> -	if (!musb) {
> -		dev_err(&pdev->dev, "failed to allocate musb device\n");
> -		goto err0;
> -	}
> +	if (!musb)
> +		return -ENOMEM;
>  
>  	musb->dev.parent		= &pdev->dev;
>  	musb->dev.dma_mask		= &omap2430_dmamask;
> @@ -349,15 +347,15 @@ static int omap2430_probe(struct platform_device *pdev)
>  
>  	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
> -		goto err2;
> +		goto err_put_musb;
>  
>  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> -		goto err2;
> +		goto err_put_musb;
>  
>  	config = devm_kzalloc(&pdev->dev, sizeof(*config), GFP_KERNEL);
>  	if (!config)
> -		goto err2;
> +		goto err_put_musb;
>  
>  	of_property_read_u32(np, "mode", (u32 *)&pdata->mode);
>  	of_property_read_u32(np, "interface-type",
> @@ -380,7 +378,7 @@ static int omap2430_probe(struct platform_device *pdev)
>  		if (!control_pdev) {
>  			dev_err(&pdev->dev, "Failed to get control device\n");
>  			ret = -EINVAL;
> -			goto err2;
> +			goto err_put_musb;
>  		}
>  		glue->control_otghs = &control_pdev->dev;
>  	}
> @@ -456,20 +454,19 @@ static int omap2430_probe(struct platform_device *pdev)
>  	ret = platform_device_add(musb);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to register musb device\n");
> -		goto err3;
> +		goto err_disable_rpm;
>  	}
>  
>  	return 0;
>  
> -err3:
> +err_disable_rpm:
>  	pm_runtime_disable(glue->dev);
>  err_put_control_otghs:
>  	if (!IS_ERR(glue->control_otghs))
>  		put_device(glue->control_otghs);
> -err2:
> +err_put_musb:
>  	platform_device_put(musb);
>  
> -err0:
>  	return ret;
>  }
>  
> -- 
> 2.49.1

