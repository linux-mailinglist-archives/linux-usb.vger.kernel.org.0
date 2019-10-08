Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB6FCFD24
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 17:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfJHPGB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 11:06:01 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40505 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfJHPGB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 11:06:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id x127so10922845pfb.7
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=tzsRg9pgEa9ifvg41ObkDkwx5TvwMyRk1wxFJpblvlg=;
        b=G8uczl3RULQcRPZNuuCGSUomb/snylYiJ6arGsUloQ3Wa2+dSUqI/YENI2cilQPHq+
         eA3+zmXi0bCaRtlqrEy+DS9RnTMUiUNxO7mtjIW0Oiv+ayXsEwyO1XyYkZs+MHOgW5wu
         oo7eY39CvJcRKrVWmog/2bO2uGO+77/Ey6dQDwRu2cePnp97SenCamFTlNwEhPwdn30b
         eKObB9wkms+pp9bQfr6USpdBqSs/idPOEUXkd5ziVWpP5BZomIUV9TSOmhWqXpWjNkHv
         7mqwMZ5Q2KRhss4E0XnwCxFBcGdvFhuBOHQT+4vIwhLu6XPGYqhiiyZVyUyltufgpUw1
         LQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=tzsRg9pgEa9ifvg41ObkDkwx5TvwMyRk1wxFJpblvlg=;
        b=jbGyPXCRrZBLKSXa5sBepKxFAYW0V/HNg+eR9JIz6vINXbsBdMqokcMkUhQbetDhyu
         Fj/lHYdcGKcSAACut3jewxKrmB3R4mvCtoEXy3P5GrwOuEwPQTSL5JxlSs9NeUGWijdR
         iT5jdiNA9m8hMI/EffDBB61fMwB7ftnuFYfD/LCqFpUPWMB7w294/NYlcSc8FANIZmz5
         JEzF8aGQx1uNbQXAu4U6BFgoP1jZv7phy0qevsfenFhxCoaQ6uVDMtgXrxjLe8HOUjsc
         rGHekacZDo+FshmchYngS4jydKVUvjRyIcCqMizWKfZJwu1oRG8j3X4VdCUYT0FeAGxN
         1tVg==
X-Gm-Message-State: APjAAAV9/5MKGdF+S9eHnYEuYgYEQL1dyUVKWG54yTWvFsaB+KHzWu7j
        el6Y+dv3G5IZ2PAWSPUk5hJ1mA==
X-Google-Smtp-Source: APXvYqxhixa3F/cEc785OVOZs0F2stbVxXL2Q91Zz8G3dA0FQLAg7s6F+eNuzgo0xQ6EBlfs3p8Uew==
X-Received: by 2002:a65:48ca:: with SMTP id o10mr7551202pgs.116.1570547160188;
        Tue, 08 Oct 2019 08:06:00 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:8d4b:adae:e1eb:fe8e])
        by smtp.gmail.com with ESMTPSA id u3sm17330522pfn.134.2019.10.08.08.05.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 08:05:59 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Saurav Girepunje <saurav.girepunje@gmail.com>, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     saurav.girepunje@hotmail.com
Subject: Re: [PATCH] usb: dwc3: dwc3-meson-g12a.c: use devm_platform_ioremap_resource()
In-Reply-To: <20191008102751.GA10401@saurav>
References: <20191008102751.GA10401@saurav>
Date:   Tue, 08 Oct 2019 08:05:58 -0700
Message-ID: <7h7e5f5lbd.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Saurav Girepunje <saurav.girepunje@gmail.com> writes:

> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together in dwc3_meson_g12a_probe().
>
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/usb/dwc3/dwc3-meson-g12a.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index bca7e92a10e9..d73ccd9e1366 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -386,7 +386,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	struct device		*dev = &pdev->dev;
>  	struct device_node	*np = dev->of_node;
>  	void __iomem *base;
> -	struct resource *res;
>  	enum phy_mode otg_id;
>  	int ret, i, irq;
>  
> @@ -394,8 +393,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.20.1
