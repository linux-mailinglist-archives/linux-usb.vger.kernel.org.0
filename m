Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2430F332A64
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 16:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbhCIP07 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 10:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhCIP0u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 10:26:50 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB88C06174A;
        Tue,  9 Mar 2021 07:26:50 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 2so21172578ljr.5;
        Tue, 09 Mar 2021 07:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rFC6JX2geeI70fyZtdsl3qpdPvdXkbuAh4i2jTWjv1s=;
        b=r5n2LJiAeojyOblPJVf02Wc3nAGV4oBPT5YVDFyVwrLoCwAmsX2M5JT2Fj5FXqGyHO
         49rdQ7ddXulHm/VIR26i40uECtW9dkHi5pN0ygPhAHSiImm1BKNzSKJCphm4aXJYk+/A
         OU+Ce4qFg0ZeyGgOTno65vs4Z32vipU9yUGPE1oxvkkjCeAo7bb/jUoAU74f1RD8dCw4
         XvufXizwmbg2mfNsPrIJerKaONy7L4OwIG/yWgnq8eA25Ig/GJynwMz5ZXZH3inOUNYv
         Lxjmps1xWSDp1iCLcsxC3iRWN9zLUE33LwBZVPOxu/2qnYcVZUGkoSQ3OH7EqsVSLiPO
         tvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rFC6JX2geeI70fyZtdsl3qpdPvdXkbuAh4i2jTWjv1s=;
        b=eYus24UMan3+gU+Fchq4xOcjsu2/sU0qGGHaoITUz4+PnCIAjGywwlN9VG4k8gp55D
         E7ndM4i8kaXnx7bocQUbd712f0cDpmKGVGQtYntWqd0GtuZyirxXTKBkImpgSbdgkER9
         uuvDwk007mE7zqK/KDZBnlLSt+muB/dUjOaLVtibEbQpygEoYJiSkfz2E1WItkYOfoZK
         iGx39SfFSnJJJ9Ld23n8NvI65SUL4a4irDSXVDYpGuQgvJjDtADNZ+UVcsnudSaCjXzO
         4VqmSTzcw68BE1lt0mVKczmdcYxv3txp8+s4JlUOsFMO+hN+hpbAmUxdsSNxvVPkpbDe
         noLg==
X-Gm-Message-State: AOAM531J0fbKopusUbleSBg2jLivLqYuTqMPsQ1RzYixjV7Q7HijF8hF
        o98IMLQHfG4/vD74O4bnhfo=
X-Google-Smtp-Source: ABdhPJzp48kyS6lakDiPeXkABIMcEFvpWehCfF7cx+K8mxcfh7ESPxIO281C8KNqeHZht8CUivIhyA==
X-Received: by 2002:a2e:3907:: with SMTP id g7mr17948263lja.159.1615303608630;
        Tue, 09 Mar 2021 07:26:48 -0800 (PST)
Received: from [192.168.1.101] ([178.176.72.196])
        by smtp.gmail.com with ESMTPSA id m1sm2043055ljg.111.2021.03.09.07.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 07:26:48 -0800 (PST)
Subject: Re: [PATCH -next] usb: cdns3: imx: mark cdns_imx_resume as
 __maybe_unused
To:     'Wei Yongjun <weiyongjun1@huawei.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Frank Li <frank.li@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210309131457.1884112-1-weiyongjun1@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <03c23018-f26d-0aa2-e319-efb2683d633d@gmail.com>
Date:   Tue, 9 Mar 2021 18:26:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309131457.1884112-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 3/9/21 4:14 PM, 'Wei Yongjun wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The function cdns_imx_resume() may have no callers depending
> on configuration, so it must be marked __maybe_unused to avoid
> harmless warning:
> 
> drivers/usb/cdns3/cdns3-imx.c:378:12: warning:
>  'cdns_imx_system_resume' defined but not used [-Wunused-function]
>   378 | static int cdns_imx_system_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~

   Looks like that warning was copied from another kernel, where this function
was named differently?

> 
> Fixes: 67982dfa59de ("usb: cdns3: imx: add power lost support for system resume")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/cdns3/cdns3-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> index 708b51cc5844..96fff823a594 100644
> --- a/drivers/usb/cdns3/cdns3-imx.c
> +++ b/drivers/usb/cdns3/cdns3-imx.c
> @@ -346,7 +346,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
>  
>  }
>  
> -static int cdns_imx_resume(struct device *dev)
> +static int __maybe_unused cdns_imx_resume(struct device *dev)
>  {
>  	struct cdns_imx *data = dev_get_drvdata(dev);
>  

MBR, Sergei
