Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882E622D67F
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 11:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgGYJn6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 05:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgGYJn6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 05:43:58 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72C4C0619D3
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 02:43:57 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s9so12326910ljm.11
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2RACL/t3HCkJsaLvweG4olAZhUtJ576uobXZ4sGzrh8=;
        b=QLmY7pejTzFpz5Zf1g6IxCcpNWkK6Ayh9KpOeOb1VKMiQZQGNGt8+NnK7AZR3g/5RE
         j2liurGrxuf6uX1gvTDLSQnnMUHTal1WDVeZxsXM2mPBch8Yw26td6A97jLdlht57oPG
         uRQTDh6Op1S7bGJhI9hgj8UUcrbUXi/43ZKQkpvZhCE5o+0h2fawnf3VBpB3Eokubd68
         845A06diWc2Bzxo47BjHAKStIh2Gz/uhZpUIiVh6BEU6XRaziQrMNtgZaasMB+Tt9pmB
         1QZYd/OQvM/0gUHL/XyVhlvFjnp+NcvjoUTnZHZQIBoc/6URODvdtZ+8Z7EGZh16Ds2X
         A6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2RACL/t3HCkJsaLvweG4olAZhUtJ576uobXZ4sGzrh8=;
        b=oMUMSdQLgb8SdMBfCYTd03iqtFFzw1cEbtcK1i4N0mmIwizF6F5ZwgqYVn6Ik7wcfU
         mQlDzAXrcCoCO8iemk0132xddcyeEE420leXJHnj4K7jKvAtySFuwbr0ItDeBm/i0/JL
         gknwTOfruiLTl+eFEMF1K7pCAXHThNXR2DEyECRMCBbC4kEDcjuxi+ycKdGtHprrILXY
         KtyWXCzR4Ou8wpaqSBQqgJrRt66WcoX/Ob+k8+u12PBro8CM+d01EexURZn14XDPxX4D
         pxv8xFt37xfHqLBEeWnF+c1JqXNBedvwdF/WATzkO7ik0uxnMLlM4+Keq3FRUymOirxe
         px4g==
X-Gm-Message-State: AOAM533F2XGk1igA2zUehYDjDTcAHFdLVG9eMvC1Ljb8YRFHtBThmyvQ
        TS63cElFUnaSqvlgAQuzXJADJni1jS8=
X-Google-Smtp-Source: ABdhPJzt401qPWqS1V3FNGgGAyRhP+XSiw4qLFHHUKvIZs04gcERAZJj9L5RUfWoigPBXolzW5c8yQ==
X-Received: by 2002:a2e:1502:: with SMTP id s2mr5563008ljd.236.1595670236016;
        Sat, 25 Jul 2020 02:43:56 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:253:4416:cc94:657b:2972:b01d? ([2a00:1fa0:253:4416:cc94:657b:2972:b01d])
        by smtp.gmail.com with ESMTPSA id c23sm1129395lfg.87.2020.07.25.02.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 02:43:55 -0700 (PDT)
Subject: Re: [PATCH 2/3] USB: Also check for ->match
To:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
References: <25f9d978b791d25583b18f4b5d0a929e031fec1f.camel@hadess.net>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <4243455c-e000-3ca4-c583-0c829f2fbf86@gmail.com>
Date:   Sat, 25 Jul 2020 12:43:52 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <25f9d978b791d25583b18f4b5d0a929e031fec1f.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 25.07.2020 12:14, Bastien Nocera wrote:

> We only ever used a the ID table matching before, but we should probably

   So "a" (actually "an") or "the"? :-)

> also support an open-coded match function.
> 
> Fixes: 88b7381a939de ("USB: Select better matching USB drivers when available")
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>   drivers/usb/core/generic.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index b6f2d4b44754..2b2f1ab6e36a 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -205,8 +205,9 @@ static int __check_usb_generic(struct device_driver *drv, void *data)
>   	udrv = to_usb_device_driver(drv);
>   	if (udrv == &usb_generic_driver)
>   		return 0;
> -
> -	return usb_device_match_id(udev, udrv->id_table) != NULL;
> +	if (usb_device_match_id(udev, udrv->id_table) != NULL)
> +		return 1;
> +	return (udrv->match && udrv->match(udev));

    Outer () not neccesary...

[...]

MBR, Sergei
