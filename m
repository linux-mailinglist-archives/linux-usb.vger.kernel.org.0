Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A955F3457
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 19:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiJCRT2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 13:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJCRT1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 13:19:27 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625E9B78
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 10:19:26 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id z191so8601585iof.10
        for <linux-usb@vger.kernel.org>; Mon, 03 Oct 2022 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8rrlYqw5111qfS17TjZkX27+ixYP8EZDfM/qUW40/bA=;
        b=ZYQxCeZYZHzgsqIa7E3+tgmPDN6b6zMGwZpsF5lmiv0OsA1ULf4wkBQ+JHVOuFR4uu
         f3olbMnLYPoXtSILmDWDZBrK9d4hXGk9izxxawpHrbta8sJF2f+1HK41r2bREIQH/cgi
         NlNhudiUA5UGOLM03ofGeKp7/V431EzBIg6dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8rrlYqw5111qfS17TjZkX27+ixYP8EZDfM/qUW40/bA=;
        b=wm/HgV7UNq6xmsE8jDh+dzf9EcKiZZ/JFYJNS5s4agulpzjhfVxV92w44v4VaEr6Qu
         mwbz4b4++AEnSnlVWwbmAQtBBniRkZOSXb9nX9vWyblAMwL4XfumN4rpDGtwblzOIjbZ
         tBRPvxqff7X9RYGQWdU39qQsVc0QLnI9He3N43malNjMAZe8yfmyYXIgZogP2kZqdwkm
         x3afbJGtw+J2FJArztVGDqXHdtFNBq95gIQdmR8gnDt/8tkrqNkoboCwP2ON+yb+kdVu
         OkptLVJx4iXGNGryOsLPtC9OSSfMKfwNe2WhZxas96+npoYh958R2dfa96eNZ9XRQgxW
         HmhA==
X-Gm-Message-State: ACrzQf2K0ckidz49kBvrg2Y04BTJ8piGR1dwIk2SS7npL6Ro7MgMDP8m
        Xx0uJwqW6yvtZxyk1Jd7/3vxtg==
X-Google-Smtp-Source: AMsMyM7VWVEKKx2I08k8QbxaGhkalu8hMOnXYkDKQsw+x6B9U4KvA4/ug70Al/2fwogUAEy6ELmuDg==
X-Received: by 2002:a5d:924b:0:b0:6a4:c19d:c5b3 with SMTP id e11-20020a5d924b000000b006a4c19dc5b3mr9280080iol.147.1664817565616;
        Mon, 03 Oct 2022 10:19:25 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id a13-20020a027a0d000000b0034a6d12aa25sm4289196jac.4.2022.10.03.10.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 10:19:24 -0700 (PDT)
Message-ID: <f01c0f9c-3a9d-074d-6e63-c04514a43812@linuxfoundation.org>
Date:   Mon, 3 Oct 2022 11:19:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] usbip: vudc: Convert snprintf() to sysfs_emit()
Content-Language: en-US
To:     Jules Irenge <jbi.octave@gmail.com>, shuah@kernel.org,
        gregkh@linuxfoundation.org
Cc:     valentina.manea.m@gmail.com, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <YzhVIaNGdM33pcts@octinomon>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <YzhVIaNGdM33pcts@octinomon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/1/22 08:56, Jules Irenge wrote:
> Coccinnelle reports a warning
> Warning: Use scnprintf or sprintf
> 
> Following the advice on kernel documentation
> https://www.kernel.org/doc/html/latest/filesystems/sysfs.html
> 
> For show(device *...) functions we should only use sysfs_emit() or sysfs_emit_at()
> especially when formatting the value to be returned to user space.
> Convert snprintf() to sysfs_emit()
> 
> Signed-off-by: Jules Irenge <jules.irenge@postgrad.manchester.ac.uk>
> ---
>   drivers/usb/usbip/vudc_sysfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
> index c95e6b2bfd32..907a43a00896 100644
> --- a/drivers/usb/usbip/vudc_sysfs.c
> +++ b/drivers/usb/usbip/vudc_sysfs.c
> @@ -242,7 +242,7 @@ static ssize_t usbip_status_show(struct device *dev,
>   	status = udc->ud.status;
>   	spin_unlock_irq(&udc->ud.lock);
>   
> -	return snprintf(out, PAGE_SIZE, "%d\n", status);
> +	return sysfs_emit(out, "%d\n", status);
>   }
>   static DEVICE_ATTR_RO(usbip_status);
>   

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this up.

thanks,
-- Shuah


