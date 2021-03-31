Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A0734858E
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 00:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhCXXvr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 19:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239110AbhCXXvO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 19:51:14 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCAC1C06174A
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 16:51:13 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id l5so605146ilv.9
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 16:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7XTK4pfMTsotcaP5+2Vj8/Qac6gMAPIaZt5ETGgCIFo=;
        b=b7XZC/L+OqytHSKu0P7/BLgH65SL/j3EHuHAKaM8Q2xIXApeIK/eISqSYhC7OYPLfW
         w9ZP4ora+/dt4DL0LXf6Q9B8+edU3OLylOuomnC6a0RJY6z72ODQRqxe/BPg+D1gw3AW
         LCxMUvvfd6nKfkVyxzHRTHFiddUpWiWys8kpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7XTK4pfMTsotcaP5+2Vj8/Qac6gMAPIaZt5ETGgCIFo=;
        b=HrP99jDDBSkVHOK1VPXCh43zHb+VJyU57R0tuPe5bSyCW9ZZwa14GoMCt0tUpNX1/k
         eMkHaSdUkmsTtnGEoMJg+Y5Jasx9L/4uTQcLzcG6sRuyGU9rH1egHBn/JmTGNMncwo1L
         7AruFaIIXiJ4fGvsWYOxC8LblHb2jWccrguyzACtgJz7lViWbPFGtHrertZQWd6nkvCw
         +8Hcvmv7nW8HSIeedkOk49I2vzo3mzG/oNj7/35lAM4Fd6+urWTSZhxu14v45l0x2m/D
         q8Lncsudnz+hH2Vsl0MeWPQ1uRqyPrDkAwb1WUXtwrZI5tvygH8B7A66lbk0Kd3/grND
         eGhQ==
X-Gm-Message-State: AOAM5323DBQcozw8sT2fQbXVdmScmjAuc/kMraQkp+qps3HjckfQtG7U
        2a9qAhMOYSYaFADe5HyRlS271w==
X-Google-Smtp-Source: ABdhPJxmECCjjcag7/SmTMG9j5dECGFCG2N3hQHz+4de8wrTVbLP3j3X8C7g8snHvDhdX3s4l1W8Cw==
X-Received: by 2002:a05:6e02:128e:: with SMTP id y14mr4494924ilq.239.1616629873367;
        Wed, 24 Mar 2021 16:51:13 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id s9sm1676981iob.33.2021.03.24.16.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 16:50:37 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] usbip: tools: add usage of device mode in
 usbip_list.c
To:     "Hongren Zheng (Zenithal)" <i@zenithal.me>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Antonio Borneo <borneo.antonio@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        matt mooney <mfm@muteddisk.com>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org
References: <YFrwq75Uyef3c9gz@Sun>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <719c16e1-c220-3ff4-9389-bf2ae098e5dc@linuxfoundation.org>
Date:   Wed, 24 Mar 2021 17:50:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFrwq75Uyef3c9gz@Sun>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/24/21 1:56 AM, Hongren Zheng (Zenithal) wrote:
> The option '-d/--device' was implemented in 'usbip list' but not
> shown in usage. Hence this commit adds this option to usage.
> 
> Signed-off-by: Hongren Zheng <i@zenithal.me>
> ---
>   tools/usb/usbip/src/usbip_list.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> PATCH v2:
>       Add signed-off-by line
> 
> PATCH v3:
>       Move patch changelog after the marker line
>       Remove nickname in signed-off-by line
> 
> PATCH v4:
>       Use commit short hash and message instead of long hash only when
>         referring to commit in the kernel
> 
> PATCH v5:
>      Add documentation of `usbip port` and its usage in examples
>      Add flow of detaching in examples
>      Rephrase some description and add punctuations
>      Fix typo of `usbip attach --ev-id` to `--dev-id`
> 
> diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
> index 8625b0f514ee..3d810bcca02f 100644
> --- a/tools/usb/usbip/src/usbip_list.c
> +++ b/tools/usb/usbip/src/usbip_list.c
> @@ -33,7 +33,8 @@ static const char usbip_list_usage_string[] =
>   	"usbip list [-p|--parsable] <args>\n"
>   	"    -p, --parsable         Parsable list format\n"
>   	"    -r, --remote=<host>    List the exportable USB devices on <host>\n"
> -	"    -l, --local            List the local USB devices\n";
> +	"    -l, --local            List the local USB devices\n"
> +	"    -d, --device           List the local USB gadgets bound to usbip-vudc\n";
>   
>   void usbip_list_usage(void)
>   {
> 

Thank you. Looks good.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
