Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C24976E661
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 13:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbjHCLJS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 07:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233753AbjHCLIw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 07:08:52 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41274215
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 04:07:14 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9c0391749so12893891fa.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Aug 2023 04:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691060832; x=1691665632;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6nUnKRiPGY7q2uLC2+7EQAM1zGol5rKnVXtlfeFaIQ=;
        b=H9t5pKWLDQAjvpbHeqJ4AE0BpHWJZ1151eBddqPKDEu0aaCuU6dfYbcMpN+XDoWNve
         xPSBHKMU52K8TEC5+pMhBLvoZpJftLCQC5yquGE8I5e2Xy8XEywRCB2Occ1Ye9UV2eYl
         BD9nD8sb7ax7aoeIO8fOQIdRoEWoO9gc6MaIDLouQoLlEGI33uqmevyBSNth7Mbp5orj
         IC9ii6PDaN1GQOSEnkj7KLgKZjOnce1Fc1wiV0u1qAWn65Qkp3AE2xlW6COVbjwX2toC
         UpbaEGuZOzfkPrAFHh/LG4XWCbwxqtNvK+viPZuwdE+Wal0GB6ONtMD4JYpQ0WRcYZwi
         yMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691060832; x=1691665632;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6nUnKRiPGY7q2uLC2+7EQAM1zGol5rKnVXtlfeFaIQ=;
        b=Z8MAqwmbZp+OILMTAT7T4RXY+mWGbY3zBtkAGHMLu+6Zl31j/F3DzFMk+hWESbLbkM
         ThPXX2LTBvhNJiK2uZx/+tFX0YfK2WjDmQ+2G5LebEAyiauU+f5O7D2iPcvwCGG5kI2j
         Bf/A49aOpz0I9aeJ/4QyFJqRDhhnWJwIwnKlEVl6DtXuTxv9rrj57k2z4SLgQ8ttVJCA
         OOuBntO3iZQoOI64LKY5EzQiFaamHa/0dBC3Aj0iJ/xGcq/mA/E5jlVF5NJ7SRFUhba1
         0dJNO42ZjYDgCMMTEgvwm4FMnFySjtqoOa57OR5uQwk9C2XPqk0KxcfIryNtDGAbxX+s
         LAqw==
X-Gm-Message-State: ABy/qLbHfR5ETQ5KVprI871EjjWDWOTaqWrZyYhL3UNWMHABemFulPds
        LiNYuHiW96Xh4zsWsvidmJpwYJzNRL0=
X-Google-Smtp-Source: APBJJlGfBlv1yOZyEO35I78t2Zn7hcnGTNoHGxcihBrnslzAb2EDuQb3z6WXMacSMs82F7xEASy+MQ==
X-Received: by 2002:a2e:7011:0:b0:2b6:a827:164f with SMTP id l17-20020a2e7011000000b002b6a827164fmr6712681ljc.10.1691060831517;
        Thu, 03 Aug 2023 04:07:11 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.75.73])
        by smtp.gmail.com with ESMTPSA id z15-20020a2e7e0f000000b002b9f0b25ff6sm1631306ljc.4.2023.08.03.04.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 04:07:11 -0700 (PDT)
Subject: Re: [PATCH -next] usb: musb: Do not check 0 for platform_get_irq()
To:     Zhu Wang <wangzhu9@huawei.com>, b-liu@ti.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20230803035800.32891-1-wangzhu9@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <dea0676c-3204-3c3a-9b66-99a169fd42b7@gmail.com>
Date:   Thu, 3 Aug 2023 14:07:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230803035800.32891-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/3/23 6:58 AM, Zhu Wang wrote:

> Since platform_get_irq() never returned zero, so it need not to check
> whether it returned zero, and we use the return error code of
> platform_get_irq() to replace the current return error code.

   You don't say anything about fixing the deferred probing which
this patch mainly does...

> Please refer to the commit a85a6c86c25b ("driver core: platform: Clarify
> that IRQ 0 is invalid") to get that platform_get_irq() never returned
> zero.

   Not true, it only WARNs about IRQ0. Commit ce753ad1549c ("platform:
finally disallow IRQ0 in platform_get_irq() and its ilk") makes sure
IRQ0 is not returned.

> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/usb/musb/musb_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index ecbd3784bec3..b24adb5b399f 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -2610,8 +2610,8 @@ static int musb_probe(struct platform_device *pdev)
>  	int		irq = platform_get_irq_byname(pdev, "mc");
>  	void __iomem	*base;
>  
> -	if (irq <= 0)
> -		return -ENODEV;
> +	if (irq < 0)
> +		return irq;

   Hm, I thought I've done it long ago, but apparently not... :-(

[...]

   So, the change is OK but the description is not...

MBR, Sergey
