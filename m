Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D56185BCA
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 11:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbgCOKBW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 06:01:22 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41235 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgCOKBV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 06:01:21 -0400
Received: by mail-lf1-f67.google.com with SMTP id q10so11455351lfo.8
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 03:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=71ORSjZ3Dn1AeJ5HCzovvghC6s/uKrTIuOwAzA8cnlc=;
        b=b5O729U+kA6wNZMWkRMZ2f+9gLV2ekOaJTecFIJtCJuzYBWqPUm8CzUVYcJgBisJWT
         GLuL7jk9X1V0nyATtENYx1uBjEs+rCulddzR0yw0WgnGPQjAABnlVb1uNPyCJLkl1iok
         vMDJWuaIuZEsGdABO+3ZXiUIs8oCGiqETweY2dNRwfDh9OMBi06mpi19FPeUeyQYg5TJ
         ZuQiARjLsFNIP3icVlxCX9Tyb63CL0JW9/XUZr95bpntxgXQZvWniZB/6a9QKtOZAWh2
         5rUPRevjrLAiCDo3iiqmCdYyN1SAcz4M/58X8ub1ba3YqijNeICS9FmqqSczcfipFrZB
         E4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=71ORSjZ3Dn1AeJ5HCzovvghC6s/uKrTIuOwAzA8cnlc=;
        b=RZAIVUsVbAiiKcmDQeoqmpcz2GMjAg7zF4d00A14EP+wzuVnBiCEl6A9Nrzek9SzZa
         JZ/Tdb3ueGlV51hxn0VeiunsBrx9ugq6FXfnucHYO84xPEenscs+/zz2yJhNqS54/K35
         iuW8zTyd+EWQBRFH5yzat1ea5vFXgUqSOAnHqDP47BvaMf8WKTHaQNWmvTjNTurClWnw
         hRmiq07ZTz47vi2bFf+ZJMZUh8ScHlmopYh09pnh8YOOWtcIQdPqmTbmTFgRViVZwTuk
         0Y+VLTm74S4VvPDfVfvMYn6Js2lO5hKramds73wU+FxgaxmrHNZPBR9hVX25yaWqa402
         voPQ==
X-Gm-Message-State: ANhLgQ13cyvzO3NJybCwo5rI2h97L7sW0rfAW4k5G8MnXKX7UAFm644v
        OfT8pyZONYdGVKt8Y8uTQ+EaSA==
X-Google-Smtp-Source: ADFU+vuZsCqDScD5JeOlek4PJ1cGVfZOBeUno5n2lRms8OCKw1HTXMMiaSeqFlVPKJo2nj/7Ihtp3A==
X-Received: by 2002:a19:ca46:: with SMTP id h6mr1688652lfj.108.1584266477579;
        Sun, 15 Mar 2020 03:01:17 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:86a:1c7c:64a6:f77:4be8:4439? ([2a00:1fa0:86a:1c7c:64a6:f77:4be8:4439])
        by smtp.gmail.com with ESMTPSA id t15sm3353585lfl.79.2020.03.15.03.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 03:01:16 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] drivers: provide
 devm_platform_ioremap_and_get_resource()
To:     Dejin Zheng <zhengdejin5@gmail.com>, gregkh@linuxfoundation.org,
        rafael@kernel.org, hminas@synopsys.com, mathias.nyman@intel.com,
        bgolaszewski@baylibre.com, arnd@arndb.de, geert@linux-m68k.org,
        mchehab+samsung@kernel.org, treding@nvidia.com, tglx@linutronix.de,
        suzuki.poulose@arm.com, hdegoede@redhat.com,
        linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20200314052638.6008-1-zhengdejin5@gmail.com>
 <20200314052638.6008-2-zhengdejin5@gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a7cbeabf-a7c3-b960-7aca-e124e98f9c7f@cogentembedded.com>
Date:   Sun, 15 Mar 2020 13:01:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200314052638.6008-2-zhengdejin5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 14.03.2020 8:26, Dejin Zheng wrote:

> Since commit "drivers: provide devm_platform_ioremap_resource()",
> It was wrap platform_get_resource() and devm_ioremap_resource() as
   ^^ it

> single helper devm_platform_ioremap_resource(). but now, many drivers
> still used platform_get_resource() and devm_ioremap_resource()
> together in the kernel tree. The reason can not be replaced is they
> still need use the resource variables obtained by platform_get_resource().
> so provide this helper.

    Not really sure that's worth the effort...

> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
>   drivers/base/platform.c         | 18 ++++++++++++++++++
>   include/linux/platform_device.h |  3 +++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 7fa654f1288b..b3e2409effae 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -62,6 +62,24 @@ struct resource *platform_get_resource(struct platform_device *dev,
>   EXPORT_SYMBOL_GPL(platform_get_resource);
>   
>   #ifdef CONFIG_HAS_IOMEM
> +/**
> + * devm_platform_ioremap_and_get_resource - call devm_ioremap_resource() for a
> + *					    platform device and get resource
> + *
> + * @pdev: platform device to use both for memory resource lookup as well as
> + *        resource management
> + * @index: resource index
> + * @res: get the resource
> + */
> +void __iomem *
> +devm_platform_ioremap_and_get_resource(struct platform_device *pdev,
> +				unsigned int index, struct resource **res)
> +{
> +	*res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> +	return devm_ioremap_resource(&pdev->dev, *res);
> +}
> +EXPORT_SYMBOL_GPL(devm_platform_ioremap_and_get_resource);

    That looks more like devm_platform_get_and_ioremap_resource().

[...]

MBR, Sergei
