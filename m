Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A1334633E
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 16:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbhCWPqG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 11:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbhCWPpv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Mar 2021 11:45:51 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E209BC061574
        for <linux-usb@vger.kernel.org>; Tue, 23 Mar 2021 08:45:50 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id r8so18534869ilo.8
        for <linux-usb@vger.kernel.org>; Tue, 23 Mar 2021 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eNcwAhe8EECmJ+67E5IQtqOhMGQZ7Q8SnR6/Iu7GDqo=;
        b=fVK+hoNA6Z2If7+jw9Gya5oau5Kach+9ONPCC98VmVCKgB4pZffbmH6s/XcAaWqPqD
         M/uzfO6MA60ffmQUFGfBsII0Gs3aEnnfEkQa/S1AUZa7pRXV5MHBEzpsG9anLsb2jYRm
         nw4KRLJGJ66ZASt/uEssfPghYVLeDMv9fin5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eNcwAhe8EECmJ+67E5IQtqOhMGQZ7Q8SnR6/Iu7GDqo=;
        b=ZIFPFXGGS22uQW7ZbrcxxjhNBqdfkSCFoDJ+vui6g70smKFiVCb9aEWBUl5KV6OL1h
         hEY2f+WpAsXX9E2bMK330yt2tYJAT8QzXOXf82opwy4bYEmZZ2V7AspO/i5yNVK7UP2P
         bwrAHLAhjQArtM3eFmQw1JbWEZf/SAEMQqWzV3fge/xCxTBR2FTbnyGFZHp1M1jCZ1Te
         k+skG8IeCV33L4BAqBvp47vWWUiGZgTOsP36rm6X4t67G5AtvDvN/sXFlKgauBWspOl5
         COREBYmDlFn45JbBwEbn9zNpUG5jTraMiFisvYLmOH3TGvwzlUR44rx3eFK0pJ2eoK9A
         veEA==
X-Gm-Message-State: AOAM533U8M3wtmgAq07NHUd8pnARNTJyfq/5pLmqRAIVDK/dnYBmmhwc
        tCbQk9RVdPxn1uCVTWfNc84HLg==
X-Google-Smtp-Source: ABdhPJwzXXZ1kbUwrfW/PKshnh8p7S8RyqnAU3cfcJS+Mlzbh8jJMJWVUnCNfW1coxUngiS3AGwGqQ==
X-Received: by 2002:a92:2c04:: with SMTP id t4mr5377940ile.99.1616514350412;
        Tue, 23 Mar 2021 08:45:50 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 18sm9742312ilj.59.2021.03.23.08.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 08:45:49 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] usbip: tools: add usage of device mode in
 usbip_list.c
To:     "Hongren Zheng (Zenithal)" <i@zenithal.me>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Antonio Borneo <borneo.antonio@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        matt mooney <mfm@muteddisk.com>, linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <YFnmlwlau57tj3dE@Sun>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3d5c3b76-40a4-8db7-8e12-a210f0c52e51@linuxfoundation.org>
Date:   Tue, 23 Mar 2021 09:45:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFnmlwlau57tj3dE@Sun>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/23/21 7:01 AM, Hongren Zheng (Zenithal) wrote:
> The option '-d/--device' was implemented in 'usbip list' but not
> shown in usage. Hence this commit adds this option to usage.
> 
> Signed-off-by: Hongren Zheng <i@zenithal.me>
> ---
>   tools/usb/usbip/src/usbip_list.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> PATCH v2:
>      Add signed-off-by line
> 
> PATCH v3:
>      Move patch changelog after the marker line
>      Remove nickname in signed-off-by line
> 
> PATCH v4:
>      Use commit short hash and message instead of long hash only when
>        referring to commit in the kernel
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

Looks good to me. Thanks for adding this.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
