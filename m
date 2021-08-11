Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BE43E97D4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Aug 2021 20:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhHKSox (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Aug 2021 14:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhHKSox (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Aug 2021 14:44:53 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D02C0613D3
        for <linux-usb@vger.kernel.org>; Wed, 11 Aug 2021 11:44:29 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id m18so6230882ljo.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Aug 2021 11:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iHat3XoCIw1ghVDFVOlf+KTgdGyI4p73gjc9fHcDt9k=;
        b=tA+2vnIcaSVNffeIrHKBJfwxlA+5lyhcCXNvKXrVmWPYIqA5ux7Z/FQ5gdfzJaUa4t
         JTIo6Rn6yKf/B4z1kvI3JlfeaCPrZwcSFjOrznVpUb/N3pU2SHtI2cot+xtGyEx/QCOz
         gqxD9YOd7+OO+OKJTzTfG7+T7VIDb4h5fz2s2uCDuQJqjaCjrxhRzcX+BBtnIdfmkTRh
         bLBdfDm8acE/C807m/NBskEohpt/FN7R75JV+FZk0iQXEqbPJKvKkew6LPaE68VBVchN
         7ew3bPT4vjNLaqCNezGFMUHEkxJdr6F6P+FYityGbWsxYkVs9g02UhyzWpcFdPae/dtF
         LVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iHat3XoCIw1ghVDFVOlf+KTgdGyI4p73gjc9fHcDt9k=;
        b=QfL4w0mkb0VXl7C9MOTG0BYOSe/FcadAULEJ6uvHGnEkRZS81kMlwfZA0oRf2QWLJ3
         k26qAOQvq+IfQAXAZ9xk3YhMprwcC7r6L9Uv/HGrY6fSTpkS/oWDjR0pmvyxjr9PA1Nd
         XUhML2EhVGDNjSYwJROfdQLjLhRCCFxRksxHWC0Mfkk/l3TtE9K8xSAwivqx+//Vb4VL
         lWjCuO7ZgZcDT3C4WzHFUmEprI4bPaCdw3VZnJSdGbE5nnGY2TxIurNS58rVMWSaZrpg
         dkFmtRDu0eKSLnK7oxLpHrmNH7tOi4UJt3W+yqoIqupfZyBrAF4VJPLYMclx5n6O3Lnm
         UBFA==
X-Gm-Message-State: AOAM531OyaCb4Gv2Xxr8XMwD+yJq0damnAv6iCkxhY+rJii2chQV6eih
        eoNSehLXVxA4yX1Y6WMEOLow4L7UMCB77w==
X-Google-Smtp-Source: ABdhPJzm521hnshhR5mJhPT7xHMNmBjXdgOaKcA35W+lUgmBRQdb7L36clI8KKgwyn4UV6jkUlUKbQ==
X-Received: by 2002:a2e:96d0:: with SMTP id d16mr62899ljj.279.1628707467451;
        Wed, 11 Aug 2021 11:44:27 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id j4sm14916lfu.35.2021.08.11.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:44:26 -0700 (PDT)
Date:   Wed, 11 Aug 2021 20:44:25 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: Fix soc_device_match()
 abuse
Message-ID: <YRQaiVPZU7YLxlOT@oden.dyn.berto.se>
References: <760981fb4cd110d7cbfc9dcffa365e7c8b25c6e5.1628696960.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <760981fb4cd110d7cbfc9dcffa365e7c8b25c6e5.1628696960.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Geert,

Thanks for your work.

On 2021-08-11 17:52:54 +0200, Geert Uytterhoeven wrote:
> soc_device_match() is intended as a last resort, to handle e.g. quirks
> that cannot be handled by matching based on a compatible value.
> 
> As the device nodes for the Renesas USB 3.0 Peripheral Controller on
> R-Car E3 and RZ/G2E do have SoC-specific compatible values, the latter
> can and should be used to match against these devices.
> 
> This also fixes support for the USB 3.0 Peripheral Controller on the
> R-Car E3e (R8A779M6) SoC, which is a different grading of the R-Car E3
> (R8A77990) SoC, using the same SoC-specific compatible value.
> 
> Fixes: 30025efa8b5e75f5 ("usb: gadget: udc: renesas_usb3: add support for r8a77990")
> Fixes: 546970fdab1da5fe ("usb: gadget: udc: renesas_usb3: add support for r8a774c0")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index f1b35a39d1ba8712..57d417a7c3e0a687 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -2707,10 +2707,15 @@ static const struct renesas_usb3_priv renesas_usb3_priv_r8a77990 = {
>  
>  static const struct of_device_id usb3_of_match[] = {
>  	{
> +		.compatible = "renesas,r8a774c0-usb3-peri",
> +		.data = &renesas_usb3_priv_r8a77990,
> +	}, {
>  		.compatible = "renesas,r8a7795-usb3-peri",
>  		.data = &renesas_usb3_priv_gen3,
> -	},
> -	{
> +	}, {
> +		.compatible = "renesas,r8a77990-usb3-peri",
> +		.data = &renesas_usb3_priv_r8a77990,
> +	}, {
>  		.compatible = "renesas,rcar-gen3-usb3-peri",
>  		.data = &renesas_usb3_priv_gen3,
>  	},
> @@ -2719,18 +2724,10 @@ static const struct of_device_id usb3_of_match[] = {
>  MODULE_DEVICE_TABLE(of, usb3_of_match);
>  
>  static const struct soc_device_attribute renesas_usb3_quirks_match[] = {
> -	{
> -		.soc_id = "r8a774c0",
> -		.data = &renesas_usb3_priv_r8a77990,
> -	},
>  	{
>  		.soc_id = "r8a7795", .revision = "ES1.*",
>  		.data = &renesas_usb3_priv_r8a7795_es1,
>  	},
> -	{
> -		.soc_id = "r8a77990",
> -		.data = &renesas_usb3_priv_r8a77990,
> -	},
>  	{ /* sentinel */ },
>  };
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
