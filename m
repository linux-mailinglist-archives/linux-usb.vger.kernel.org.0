Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C604AF5EE
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 17:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236407AbiBIQAi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 11:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232587AbiBIQAh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 11:00:37 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD80AC0613C9
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 08:00:40 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id p190-20020a4a2fc7000000b0031820de484aso2912355oop.9
        for <linux-usb@vger.kernel.org>; Wed, 09 Feb 2022 08:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1YePSlQ5EwpZBNMyDNsyYlHPfN4e3TfbrJwBxdB39JQ=;
        b=NgnKy7LBcwpLnybKELxuQOm1oeOGsUO/FUJ2vhXTYjCSE/ojTU1W+yJxBMOxEk0Py6
         kzBhjAxpRUrCyR3qZw5Rskh7lLELlRoYCGuZjsQ3ZRNf6dJMI9eEjc+1b5cKOuI6L7M+
         VhxnUyw0s4+r8ucHBuUSYau3tai3DNdOWxFhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1YePSlQ5EwpZBNMyDNsyYlHPfN4e3TfbrJwBxdB39JQ=;
        b=NSJSkdzQFDyqHEqu2JZacxFEUAIA/agWcqShNn307VLazY9aGZiMRKPpqPq2bL4e1r
         RV4E76s6cZ0XHfTIIwkKi44UubYRVhTDWXzMVG9qFnfB4LwFnHsZZrp6Mtbsz31FulKv
         54vK2kg70fUDj24BjXPd0bQgPXG2SCz3u62lonVgCGGF6QzLG0xTI2g5GgJjZoIwftCo
         lh3Olg7nYGSNfLRWN2bXrISrIafFNnA33ggfkMyLJVLwZ7FXpiuJS/swUVBXepV04lUD
         mFONeqJeMb3cOnR3PJLFLu5+C2Cf5D+GzbHVeLIdTRNw1aYGtpqru9swHIvqVbaN6+XM
         CsSA==
X-Gm-Message-State: AOAM531mNJ7U8DP2jq+5oLrv7Xud9zm+iiTnQ7P4RQ6O2T/yB6wCFjZ5
        CyGKANcZFqp+Kgq3u1hb/lSHag==
X-Google-Smtp-Source: ABdhPJw6jBlqUuKldGND4hrHbvy0UVWDs4h1q2Fee93ioDMqgj7258+KfYdD+dLRrUBZnnn3P410ZQ==
X-Received: by 2002:a4a:9723:: with SMTP id u32mr1116247ooi.5.1644422439602;
        Wed, 09 Feb 2022 08:00:39 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id t13sm1613361oai.37.2022.02.09.08.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 08:00:39 -0800 (PST)
Subject: Re: [PATCH] usbip: vudc: Make use of the helper macro LIST_HEAD()
To:     Cai Huoqing <cai.huoqing@linux.dev>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220209032813.38703-1-cai.huoqing@linux.dev>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8c8bcf5b-bbda-55e0-6a61-35bfafbafb78@linuxfoundation.org>
Date:   Wed, 9 Feb 2022 09:00:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220209032813.38703-1-cai.huoqing@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/8/22 8:28 PM, Cai Huoqing wrote:
> Replace "struct list_head head = LIST_HEAD_INIT(head)" with
> "LIST_HEAD(head)" to simplify the code.
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> ---
>   drivers/usb/usbip/vudc_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/vudc_main.c b/drivers/usb/usbip/vudc_main.c
> index 678faa82598c..d43252b77efd 100644
> --- a/drivers/usb/usbip/vudc_main.c
> +++ b/drivers/usb/usbip/vudc_main.c
> @@ -26,7 +26,7 @@ static struct platform_driver vudc_driver = {
>   	},
>   };
>   
> -static struct list_head vudc_devices = LIST_HEAD_INIT(vudc_devices);
> +static LIST_HEAD(vudc_devices);
>   
>   static int __init init(void)
>   {
> 

Explain why this change simplifies the code and also add a comment
above LIST_HEAD

LIST_HEAD_INIT clearly states what it does, as a result it is easier
to understand the code.

thanks,
-- Shuah
