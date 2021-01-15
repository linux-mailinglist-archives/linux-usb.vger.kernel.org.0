Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60022F8328
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 18:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbhAOR6H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jan 2021 12:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbhAOR6G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jan 2021 12:58:06 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5945DC0613C1
        for <linux-usb@vger.kernel.org>; Fri, 15 Jan 2021 09:57:26 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id d9so19763505iob.6
        for <linux-usb@vger.kernel.org>; Fri, 15 Jan 2021 09:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=M5BcvnzgflJduEgKE2tu+RY63yJ/WtPEtTDr/c+TeE0=;
        b=ZW5wj3+U+c90HGP5GaNhKJ2gsEvMj6pxKQrrnVzHqrsKDGbvbXy+wgKbBTxWeo0g/f
         FZjdRxhnICm0GU8xIzBOydRTChXCzMLS9/aGuruWEJ/Ik0BUM+3llZlxz3xcwWenwfSo
         ObeznzDrdtzgT/B1NaSsHrLyytHz9VkfwVEio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M5BcvnzgflJduEgKE2tu+RY63yJ/WtPEtTDr/c+TeE0=;
        b=acS+kOiW9Y+Mtcv8SE9AQidQ/13ieCdZUScd7t5jn6v0O7RjUqXP4lzSA0ADlC/ksz
         o6nBQct7yRD70RCgXRs8kQod03WQYblJSfGOq9wdplZKmTv5EWufw+VOIQd2oHZsNQBw
         xLwZ5iYi3ZBzVVIG5rnV59JMTJlxZjaGlY/lQmBDmvAPcjWXpCsoZHxr/oziU2Tw+aIt
         Zte3bNuHdc4MEds5G2wOPrx3Pt7XzhyVSV6Sps2mBTJ0+QiF8yhP0VSvK52aa4EeMI5k
         hGjf/JWmgJsdcFnKZf1fgh3NqL51q6zC7n2iorZA4uDuoxbz5HemWAjhgwr8w8SSIZTX
         /7pA==
X-Gm-Message-State: AOAM531OtEuf1o3TpHxUU6vrcxvVb2lywLzuQQPNVc05lnBeO/yGwakG
        oeaprJO+zjO1HcUvEghDavT3rg==
X-Google-Smtp-Source: ABdhPJwojGycUje7NlW8TGiVdxup+AVmyN/RuH9EDoAAE6grjW/n8pvUKxk7ZASjnBeUQ9Lu6ewI0Q==
X-Received: by 2002:a92:4101:: with SMTP id o1mr12217020ila.82.1610733444929;
        Fri, 15 Jan 2021 09:57:24 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id i4sm1610172ios.54.2021.01.15.09.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 09:57:24 -0800 (PST)
Subject: Re: [PATCH -next] usb: usbip: Use DEFINE_SPINLOCK() for spinlock
To:     Zheng Yongjun <zhengyongjun3@huawei.com>,
        valentina.manea.m@gmail.com, shuah@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20201223141431.835-1-zhengyongjun3@huawei.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <de699446-4f00-ce6a-4dfb-1f95669325f1@linuxfoundation.org>
Date:   Fri, 15 Jan 2021 10:57:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201223141431.835-1-zhengyongjun3@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/23/20 7:14 AM, Zheng Yongjun wrote:
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>   drivers/usb/usbip/stub_main.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.c
> index c1c0bbc9f8b1..77a5b3f8736a 100644
> --- a/drivers/usb/usbip/stub_main.c
> +++ b/drivers/usb/usbip/stub_main.c
> @@ -23,7 +23,7 @@ struct kmem_cache *stub_priv_cache;
>    */
>   #define MAX_BUSID 16
>   static struct bus_id_priv busid_table[MAX_BUSID];
> -static spinlock_t busid_table_lock;
> +static DEFINE_SPINLOCK(busid_table_lock);
>   
>   static void init_busid_table(void)
>   {
> @@ -35,8 +35,6 @@ static void init_busid_table(void)
>   	 */
>   	memset(busid_table, 0, sizeof(busid_table));
>   
> -	spin_lock_init(&busid_table_lock);
> -
>   	for (i = 0; i < MAX_BUSID; i++)
>   		spin_lock_init(&busid_table[i].busid_lock);
>   }
> 


Sorry for the delay on this.

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
