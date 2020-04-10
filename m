Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B176F1A4481
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2020 11:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgDJJhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Apr 2020 05:37:01 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33788 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgDJJhB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Apr 2020 05:37:01 -0400
Received: by mail-lf1-f66.google.com with SMTP id h6so978189lfc.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2020 02:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=exkqUjBnwAnJKQjQDn5TTL2pNxP0x0Ucz4ZEQEg/hEg=;
        b=lgJpULrKJ6u0MBT6ETzC4LiBEhCZXXocwkaDpsNGyo+5DkK/1JJ3+dBXaGC75FVsov
         bH+k6fpG+BLwP0tcO0pyfY3vH+sGMIfLvBCbC9OD2r5O+oN8hKfshtHylLi4mpnOwi6C
         hJ66MH7utQ1iIsSbMh6ILLq0zOCC0+d4WSktropS7gTaBzyOI6QTTw1x0zpq7rEzneCW
         IPmNcigCV9clxXSwgQ7cexhTSUl2yyjReBPfsstRpBt9BN5y9SgAKdGgrmcrsnatkiMP
         7qLFkYb2K2u3Vr6hY7CFZi+dHAFgfnd8RpHAtF/paP9L52ILXLLHY09AS5+Zo5e37lxW
         ePUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=exkqUjBnwAnJKQjQDn5TTL2pNxP0x0Ucz4ZEQEg/hEg=;
        b=POqSCi7nL+bau62ge8X4b6+jwzLb+EiJoPjLfEIt5IPz1Ex5Xr//arDGrErcP7XYvt
         d1ON+sV4wt9in7wH/cpzbVji1/i359msxSc3ap6NpCMMRn05dAQPYnbjoAFA2L8sI/rL
         5JD5VNkiINSzB1wRyNFy1zzWFKkHU0c+Vtnf53gumAS9V644B8rqHpJkCAP1rgYVDXlx
         B5l4+tAwSUyuL+64iwHxDA0Me1/o2BVy/u49vvhGfDl0noze2keR2axna18W2Mg9lq5u
         sPZEYlkP+ZHD6G/POgjs4WPesLs+vXdPUFl7VsEk1eoRe+AiJBpNu+AonCqgUnVfGzeT
         AaxA==
X-Gm-Message-State: AGi0PubMI0qfUVxgmqQZNaYWIEoE2MH46/4Y88lHMDDDwHQWnCNb9iRE
        /P6cJ3W3TF0MQYbl3KlnZs/8Ww==
X-Google-Smtp-Source: APiQypIMcfl4zC6vz1w5b1PCJyqjTtBx2aRTNE1jqnlOUglSVyui2mwUKgIsqdT82ZXwaL+19jwFPw==
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr2065861lfp.4.1586511419309;
        Fri, 10 Apr 2020 02:36:59 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:449c:a024:b8e5:a34a:c38e:b427? ([2a00:1fa0:449c:a024:b8e5:a34a:c38e:b427])
        by smtp.gmail.com with ESMTPSA id r23sm963123lfi.33.2020.04.10.02.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 02:36:58 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
To:     Tang Bin <tangbin@cmss.chinamobile.com>, leoyang.li@nxp.com,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Markus.Elfring@web.de,
        Shengju Zhang <zhangshengju@cmss.chinamobile.com>
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0ee67579-8c65-bde1-e458-50344d3100b9@cogentembedded.com>
Date:   Fri, 10 Apr 2020 12:36:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 10.04.2020 4:58, Tang Bin wrote:

> If the function "platform_get_irq()" failed, the negative value
> returned will not be detected here, including "-EPROBE_DEFER", which
> causes the application to fail to get the correct error message.
> Thus it must be fixed.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
> ---
>   drivers/usb/gadget/udc/fsl_udc_core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
> index ec6eda426..60853ad10 100644
> --- a/drivers/usb/gadget/udc/fsl_udc_core.c
> +++ b/drivers/usb/gadget/udc/fsl_udc_core.c
> @@ -2441,8 +2441,8 @@ static int fsl_udc_probe(struct platform_device *pdev)
>   	udc_controller->max_ep = (dccparams & DCCPARAMS_DEN_MASK) * 2;
>   
>   	udc_controller->irq = platform_get_irq(pdev, 0);
> -	if (!udc_controller->irq) {

    This check has always been wrong, doesn't account for real errors and
probe deferral...

> -		ret = -ENODEV;
> +	if (udc_controller->irq <= 0) {

    Note that platfrom_get_irq() no longer returns 0 on error.

> +		ret = udc_controller->irq ? : -ENODEV;
>   		goto err_iounmap;
>   	}

MBR, Sergei
