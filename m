Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FB92970F2
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 15:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750092AbgJWN4p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 09:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465165AbgJWN4o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Oct 2020 09:56:44 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88929C0613CE;
        Fri, 23 Oct 2020 06:56:44 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m16so1664343ljo.6;
        Fri, 23 Oct 2020 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mrjmQdpFWxRqp3JZm9wZ+ifKSEzDJgWLaCcyk7l1whQ=;
        b=FR4ctzNQkmmlwL5u7uEiLuOC9PwVPNasdasDOmxZILOGpOePdVWRJQbh3Hp2V4JVyj
         etoawLeaXDRTNmyzjKiu4dZyM/3xv/isdUuyjN6X5UIndEZbGmJqFf5U57JWXzfTfPBZ
         1qUUZkISOOca8hro6ZWy1z1BafjAdbB04wB/tKfiQLqmmxNHDZA3J/Ha9CnNzn4VhrKx
         xVDXTvlD9K/TgrRFS+Js4pzQpeIRY38PprHVjLAeXBAV6O2IoitfKruxWNSW9oxZ6NmW
         gUJrdD0YOTJ0bE/15O0DsA++vM0FQN3IFgjcbw4r9xFnEge+7jYmFGruF7p02kmqtkpi
         ocwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mrjmQdpFWxRqp3JZm9wZ+ifKSEzDJgWLaCcyk7l1whQ=;
        b=pwyXIPpZ99oHRTdt9eoWnv7RGfzWOY2xKMHfEw3hk0AmGbFzuZ6W/TrSi8sZLV8unr
         7W9Oa0uStjxA6e61ko2A9D4XOxKRVvN60mGKXXcqXGWxM5JsNAZdfGtFyc5OPdVQvEUT
         jS/npTKrlvfhBiFmztFhovWpQTM3XHvex/GvkkRJLJSYuAIOmeFx45LbYz153r1ak3Tr
         AVoafO3g2I2HHYDPZ7h2lnhc3kv2GYfJoA0biMF1r2VLwAGl3hn41u3kbBW/JV6Mbt1H
         X1vnJUaYSOpWNStnhlrNhu7ic6LeoFATVU5ACVwAtpwbMSX/Y9+0iMS0dPrr1V+PjgJu
         9d3A==
X-Gm-Message-State: AOAM531YMDPyd2e9ZuQNMseIqeuIvbUIPKvkTJyHAIyFuuRZE14pACT3
        ZKNGrc68Wxpb4EBDzzzes7UXeo9ztkU=
X-Google-Smtp-Source: ABdhPJwAQk3q3DvPy4iacrVhwEfcye6jO3A+P4gPd4GayUKmVSumaKsI9vXqysK6OREG5PMIaUwVzA==
X-Received: by 2002:a2e:8815:: with SMTP id x21mr1001943ljh.312.1603461402895;
        Fri, 23 Oct 2020 06:56:42 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8f2:d847:22a0:43e5:8ef0:4c80? ([2a00:1fa0:8f2:d847:22a0:43e5:8ef0:4c80])
        by smtp.gmail.com with ESMTPSA id d7sm146366lfs.83.2020.10.23.06.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 06:56:42 -0700 (PDT)
Subject: Re: [PATCH 1/2] usb: typec: stusb160x: fix an IS_ERR() vs NULL check
 in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20201023112347.GC282278@mwanda>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <60829133-4154-4109-5d07-a5adf923b135@gmail.com>
Date:   Fri, 23 Oct 2020 16:56:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201023112347.GC282278@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 10/23/20 2:23 PM, Dan Carpenter wrote:

> The typec_register_port() function doesn't return error pointers, it

   s/error/NULL/, maybe? :-)

> returns error pointers.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/typec/stusb160x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index ce0bd7b3ad88..f7369e371dd4 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -729,8 +729,8 @@ static int stusb160x_probe(struct i2c_client *client)
>  	}
>  
>  	chip->port = typec_register_port(chip->dev, &chip->capability);
> -	if (!chip->port) {
> -		ret = -ENODEV;
> +	if (IS_ERR(chip->port)) {
> +		ret = PTR_ERR(chip->port);
>  		goto all_reg_disable;
>  	}
>  

MBR, Sergei
