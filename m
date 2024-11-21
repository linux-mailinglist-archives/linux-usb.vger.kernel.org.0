Return-Path: <linux-usb+bounces-17775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D69D4E6E
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 15:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F7411F2147D
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 14:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B541D932F;
	Thu, 21 Nov 2024 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EKm1ZzKW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18981D9324
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732198503; cv=none; b=lTLBSBTXz4+Q9PeRHkJijpZFDWrFxrKc4NIRHlfCcMiNj1Q4eH9/eC/SJ7lGhvl4de0rLLAOnjdidHM5iMhhX9aPUa7g7QyEeVM62ub5/xd7+h5Hxpsjr/N2UKiUQe7Y9vo+ds2kPrjnFuQ1SilyFVL9S1ezy90Tu/V5fXgQV6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732198503; c=relaxed/simple;
	bh=erThW1OGyGmnngei9Q/m2VLvSn8gzUyk3dmtRCfhvtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cB8TMXmF3jQS/f1TerqIAYFOrDmwqaQGMmpEozGN/8ujFWpV660y8eYUhdUHhmGQqn5oNy+tiiIdPzeKH55nBgHoAERGGAI82qq+zg7yNwYYn0ZgJifNd8DoSb8xMynF8X/9eJo4kS4upatXp6Kvr+Z8gStWjG5pbR+pSWFAthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EKm1ZzKW; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b175e059bdso55200585a.0
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 06:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1732198501; x=1732803301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PjKzNa4Wt9P5AMmEq40asXaTN0r0As03Gh+lkx3j2Nw=;
        b=EKm1ZzKWcDi/VSb7ugbGEdvQpFEl22YQsXxQXBvIpIAHH/aRc70X+i4VqA+g+f/vDa
         /9LXFyizda20XZZVMVxxLFEP0iTpLO2PUQRN3fMGytBDE2Q3Uh+JG+IaMUBkEhHmFslO
         +9Y7wrXCzxFCKZ7wR3ACunlTjQQge4afQq1/MkDruobiUzzFo3azW1LoUkpRNq4alI/Y
         I2kVqqEbgL2+Plt3c4HSPAsNUfrs/jsR6hULl7lzMFPuZ4kO3M0sg+Dl/6Nx8ULsKPfv
         A60QMeZWtINfW5EGhpfAUL6QLeacJw8cbXupto1nVBm+GRA7FeSEDBEG3bTR0TOtVliB
         AYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732198501; x=1732803301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjKzNa4Wt9P5AMmEq40asXaTN0r0As03Gh+lkx3j2Nw=;
        b=vrdYRmRiM6nueAasfBJXli0HCyftAc8aSPR7DIXztDumMa5EgNrPESWyHuv2Tn6Qik
         2S5wFUcvpmmgUgv6myAydDBWWqv/JKdoZ/22b2UnyCXHwKQfrzQEMJifNGjRYXU3MUoC
         cXl9tJ98f+GHNackslM6lZ9HGl5IpuBQKg56HK24sRH1owT9BtyGSfVMy3Z50SLHzywS
         xOEgjFOC8NpkWE+Y0QhZlX10Qy+tr7N2D0kwXt6biebZWhH8kD4dcLXQ7d8feFoJtbDH
         mXh15cNfYh0bmTjEUFBgCyoPLJsM4hdiMTBEsZLq8o8imZ+mAzEyBSQdG3F+gdip/J8R
         2zXA==
X-Forwarded-Encrypted: i=1; AJvYcCX5rsA1BfSOolwFkiPYKVnRLhcJgXfnXvz/n+J+mPXa6ZAl05AKmdtBn96HYbi451UoGepZBrKg8Zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsRkJRxm7ps2M34yBDeX6emT19a3iK270G8oSYUoTbGYGr3o7i
	e1HA9NW/d/1h0jt/1ceTpaMwK/LO5tfwYOjnD++mmEFjNYAkpz/JVgZiMsVPQwY3swS0ZFHfOWw
	=
X-Gm-Gg: ASbGncuZVSwyuNvDsqAIMrWbf0VZkwXru4PWzdsPgaaQgr0Esze3vfCN5DKPdYNUlpK
	RZHQierq2zW+QIk/mgOmqgwzlpNP0hI+FxVfIMpZtaKOTuZhedKG6e/0XVuHakHUYTR3pM6TUS/
	kehXqITraPesQpy25YWVdtK3aKosWpkYZionad+1SvN8oisqPTs5lDEYjC8kAC5j5+5MMfl9zIS
	+lS7exLp/alGGnNfRleI9MC5MU5uLCqqzrQP94lPSjk6ychvTQ=
X-Google-Smtp-Source: AGHT+IEjivB/S41tjWIV/c8AS6tlp/Mnmwua/auantw80dON5nrXFhojr6Y6q+wWhOW2Zgz/hnhLlA==
X-Received: by 2002:a05:620a:44d5:b0:7b1:7da1:e733 with SMTP id af79cd13be357-7b42edbd036mr1042684585a.30.1732198500717;
        Thu, 21 Nov 2024 06:15:00 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24f4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b48524101dsm213697485a.100.2024.11.21.06.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 06:15:00 -0800 (PST)
Date: Thu, 21 Nov 2024 09:14:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>, stable@vger.kernel.org
Subject: Re: [PATCH] usb: ehci-hcd: fix call balance of clocks handling
 routines
Message-ID: <23e85b98-92bc-46a5-a36f-fd5d7cfa944d@rowland.harvard.edu>
References: <20241121114700.2100520-1-mordan@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121114700.2100520-1-mordan@ispras.ru>

On Thu, Nov 21, 2024 at 02:47:00PM +0300, Vitalii Mordan wrote:
> If the clocks priv->iclk and priv->fclk were not enabled in ehci_hcd_sh_probe,
> they should not be disabled in any path.
> 
> Conversely, if they was enabled in ehci_hcd_sh_probe, they must be disabled
> in all error paths to ensure proper cleanup.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: 63c845522263 ("usb: ehci-hcd: Add support for SuperH EHCI.")
> Cc: stable@vger.kernel.org # ff30bd6a6618: sh: clk: Fix clk_enable() to return 0 on NULL clk
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-sh.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-sh.c b/drivers/usb/host/ehci-sh.c
> index d31d9506e41a..77460aac6dbd 100644
> --- a/drivers/usb/host/ehci-sh.c
> +++ b/drivers/usb/host/ehci-sh.c
> @@ -119,8 +119,12 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->iclk))
>  		priv->iclk = NULL;
>  
> -	clk_enable(priv->fclk);
> -	clk_enable(priv->iclk);
> +	ret = clk_enable(priv->fclk);
> +	if (ret)
> +		goto fail_request_resource;
> +	ret = clk_enable(priv->iclk);
> +	if (ret)
> +		goto fail_iclk;
>  
>  	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (ret != 0) {
> @@ -136,6 +140,7 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
>  
>  fail_add_hcd:
>  	clk_disable(priv->iclk);
> +fail_iclk:
>  	clk_disable(priv->fclk);
>  
>  fail_request_resource:
> -- 
> 2.25.1
> 

