Return-Path: <linux-usb+bounces-15451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D4986369
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 17:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 383CC289092
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 15:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FCE183CAF;
	Wed, 25 Sep 2024 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZEsCmHCj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F991D5AA8
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276857; cv=none; b=SPatzD/Kuh0lDyeSDPOzzDbsJmQIecil6+2p/fGMExqVA/XSin7aLDj0zMTYeyhruykJ75y8LfyiJGX89w0/hgt0wLyAYqxwLUOC0q6fL/zLjWMggychBwRv+h8XuTZ5okUbnOIWQ/fDz9/YwKgrd1iNhn+0HGZnOzQVbVfqFZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276857; c=relaxed/simple;
	bh=WsCh6ssXxMdWFTiE+4Zre6Ax1+Bve0twBDDs58T2ZRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKER8YAVgyRdSW4h8WLTJjANLfv9vFp0T6zdbdkta9Zo+hUiWcsPXQjoDlRX8rY2vuGoeT/9mxeSTaPsjz4WfEy0e62ByKovkMxYMawJaNDrPcqTyR8NGrGyhvSMBkfDSySYN2ZMO3o0v09oCazKCOVkfmkaPVOb8WGBQ4Lu4us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZEsCmHCj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cae102702so56541895e9.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727276854; x=1727881654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DWF83HMoN2Ea7DGvk+6V2CllZTFpJS9ca4WBd4vItNM=;
        b=ZEsCmHCj3lrnFRi8vjShxG34AysoU5V+qkOFhYEUn8SCCLowq4X2IXZcUm/h9E9HFM
         cuL3PwVbEHUzrs7VE+sh7GocG2V78AoDZk3pKrPI/QqjuaKchng1AtLBSedyUj+delBG
         47BOwoepMeSXTank4RQY+x5NkaWOsoEuv1kr1BKwLfRhEA6SHLaaSbM4UvssHZ8W8ORA
         6ooDuZ7l97JDMCqr8ptjzbRM6KnGscM5UwJFDn1zvvfaY3xjmT/srTg2ru9rX7MOCuCT
         LbdYYqlh+PypQ3TGAd63lhoiHMLltEVDmTsS2/6YT6LCteupM92p6blD0A7qMi8fNoSE
         XLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276854; x=1727881654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWF83HMoN2Ea7DGvk+6V2CllZTFpJS9ca4WBd4vItNM=;
        b=eVsDWrih62pgeftOhWJz1/D3+wFecfZMMxrIr3Vp6dR9M//GvzTgirlMSPaQ3YuE9W
         oIcoVRLwWVO+d8XPkTKeX9XnGgsyHYC9CXaIiRGU7m8crvQ6gNzyAKVAMfkuV0ow9srm
         VzSNFm4CGJC+/Xl57KGM5dABb2NA0l3n1zpoFl8BtAIa7zGlwk6L/5cF+M3tjZckfxJ/
         DIrYpfjYhnm0hkSYD0XSFENQ+CmoxLcmYnTk9N7LB8O9Cq+hw8QWLr+t5a3gglyekYwd
         5Ayxyv+fI0nMhLrVOR4lsKzcpmk4/CUKXhzPVI5rjAd1cSPpj66jgrod2GgR1sVt9TVE
         GfTw==
X-Forwarded-Encrypted: i=1; AJvYcCU8OgMMYXNi5Ia7wJURvUell5OOXH0ummo7R80mJ1NzZTYcE/Zqo4oe7pEkx8GcsgjOWAukAGFHqdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFqOv1oqvwA35RrganY0n5s8qAb5eIpDZ3vQOUgXwKvv7lG75l
	FW9xqcVJBr4KzzliQ4uyWQLZVi9APazlbRDL112P4D/sE1vgnRjfCawNlZxbGak=
X-Google-Smtp-Source: AGHT+IGip3sOgl+bQOmdyqaao7YVehMer8d8+AYC1VqOmcY2i0t8OPHuGhScpGVwZxC3FqSYI+aIsw==
X-Received: by 2002:a05:600c:470e:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-42e96144a7cmr19014655e9.25.1727276853820;
        Wed, 25 Sep 2024 08:07:33 -0700 (PDT)
Received: from localhost (amontpellier-556-1-151-252.w109-210.abo.wanadoo.fr. [109.210.7.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm21474945e9.43.2024.09.25.08.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:07:33 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:07:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v3 1/5] usb: aspeed_udc: Use devm_clk_get_enabled()
 helpers
Message-ID: <zi5lq44bc4vd33y42zkmn7hr7rw64wfxe2rvuvkekola6ctckc@buv7ybvq5skt>
References: <20240826081900.2284-1-liulei.rjpt@vivo.com>
 <20240826082140.2311-1-liulei.rjpt@vivo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6dsn6gbwes7baogl"
Content-Disposition: inline
In-Reply-To: <20240826082140.2311-1-liulei.rjpt@vivo.com>


--6dsn6gbwes7baogl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Aug 26, 2024 at 04:21:39PM +0800, Lei Liu wrote:
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc=
/aspeed_udc.c
> index f4781e611aaa..a362e31f7550 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1459,8 +1459,6 @@ static void ast_udc_remove(struct platform_device *=
pdev)
>  	ctrl =3D ast_udc_read(udc, AST_UDC_FUNC_CTRL) & ~USB_UPSTREAM_EN;
>  	ast_udc_write(udc, ctrl, AST_UDC_FUNC_CTRL);
> =20
> -	clk_disable_unprepare(udc->clk);
> -
>  	spin_unlock_irqrestore(&udc->lock, flags);

Isn't it broken to call clk_disable_unprepare() while holding a
spinlock?

I guess that means that the remove path is untested in practise and this
patches fixes a sleep-in-atomic. IMHO this invalidates Ulf's concern in
his reply to the cover letter for this patch at least.
 =20
>  	if (udc->ep0_buf)
> @@ -1500,16 +1498,11 @@ static int ast_udc_probe(struct platform_device *=
pdev)
> =20
>  	platform_set_drvdata(pdev, udc);
> =20
> -	udc->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	udc->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(udc->clk)) {
>  		rc =3D PTR_ERR(udc->clk);

An error message here would be nice. Something like

	rc =3D dev_err_probe(&pdev->dev, PTR_ERR(udc->clk), "Failed to get clock\n=
");

should work.

>  		goto err;
>  	}
> -	rc =3D clk_prepare_enable(udc->clk);
> -	if (rc) {
> -		dev_err(&pdev->dev, "Failed to enable clock (0x%x)\n", rc);
> -		goto err;
> -	}
> =20
>  	/* Check if we need to limit the HW to USB1 */
>  	max_speed =3D usb_get_maximum_speed(&pdev->dev);

Best regards
Uwe

--6dsn6gbwes7baogl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb0JzEACgkQj4D7WH0S
/k7BAggAkHqZteCrETJY7VyuZN1rZlaLtOcZtOwWhGS/VU77rZ3XggeRv3m4vC47
hPTn3yyiJND47OJu6fIC9tSLUrY8K1HNI1kZ03J3SiDOrPevc0wzDlNITQCENVL4
Nc4lAtMYR1ZfCzNJ7+MK0PXCHZGkREp7DF8RLnvp2EOqdSadL6ZOexvONaOp0z2w
fI+4yzo1++k7+EBuSnnL7xVwk+T55OezIBpcy0cLeQRgcjOrbhPd7Evo8VtyGLAe
ZkZW3RhxSAIMpu1Kux0lFaFV+0Zp+piZSwYUIet5L87cJhdOy5gKFnSDTQp1U+tk
RwwyaG8WrFuECHX+T+NlpPRYc0btYw==
=rUO+
-----END PGP SIGNATURE-----

--6dsn6gbwes7baogl--

