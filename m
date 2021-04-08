Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BCF3587FC
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 17:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbhDHPPW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 11:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbhDHPPM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 11:15:12 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D086C061762
        for <linux-usb@vger.kernel.org>; Thu,  8 Apr 2021 08:15:01 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id c15so2101818ilj.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=85kkfIswLuoyUKdChOk6bwmW6em+yMiFLM6GSD1Vz+w=;
        b=UxR8guO2+QBmjvBXTHfU3TrnjTLXGB/rpN4yGxgMKaCnZlErxegdiuCocndr1XwZJE
         Z03P9f+y8KRjRhEkURkpiqAmwMsH7jKqFWMWmZXv6CfJM1rJsisARVXNKS8xVykGd223
         RzxGRkO9zQLdLg/2I7lR0zgQZ27SLyYpmu9CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=85kkfIswLuoyUKdChOk6bwmW6em+yMiFLM6GSD1Vz+w=;
        b=YgGLd76TJsnUny9xrVURLic5s56bastxmuokOSqsbjykStCuMGn6dQej6lp0NCEDNi
         4dIXcoP1ewIU/0c+E2ef8wjn/sNSDVIdTLjKeU+SNoXaC3/R05lxhxWvMDCf2XJn7sYx
         mEXKqPXEs+/z363TUFEmWEza1t5YIKp2HgGQ102UCGPc/2VVmei6gp5YoxNl0Q22tyAt
         wpeEPWauCpSTlHIorcLkHDjI1UoIF7P6OVeRrJ6lIU9czwUagC0ThTtGpYOMQhse8Fz2
         6kzBNJW33K6MzvsURv2nkrTHY1ZnLIdhRD7bbducEG8cUhOTJ+A23F8g4Z8tUrEMzLvV
         pn9g==
X-Gm-Message-State: AOAM533Fbs+6hhaOj/blg55Q+IjzesV8zfW1bB1/LzYZdFlNtS19aCNs
        fnjawclmAphwT+T22QNhcMCFoA==
X-Google-Smtp-Source: ABdhPJxT/m27imyzig9yj82cGktoO9X19cPVaCJyT7gU/zz+xQ6gKHUzQqpYgW9AjM/rlrnCWujPZw==
X-Received: by 2002:a05:6e02:1989:: with SMTP id g9mr7297653ilf.40.1617894900846;
        Thu, 08 Apr 2021 08:15:00 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id i13sm15843090ilm.86.2021.04.08.08.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 08:15:00 -0700 (PDT)
Subject: Re: [PATCH -next v2] usbip: vudc: fix missing unlock on error in
 usbip_sockfd_store()
To:     Ye Bin <yebin10@huawei.com>, valentina.manea.m@gmail.com,
        shuah@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        hulkci@huawei.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20210408112305.1022247-1-yebin10@huawei.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9f8939f4-5292-fc0f-7a09-ee3f6de4a132@linuxfoundation.org>
Date:   Thu, 8 Apr 2021 09:14:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408112305.1022247-1-yebin10@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/8/21 5:23 AM, Ye Bin wrote:
> Add the missing unlock before return from function usbip_sockfd_store()
> in the error handling case.
> 
> Fixes: bd8b82042269 ("usbip: vudc synchronize sysfs code paths")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>   drivers/usb/usbip/vudc_sysfs.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
> index f7633ee655a1..d1cf6b51bf85 100644
> --- a/drivers/usb/usbip/vudc_sysfs.c
> +++ b/drivers/usb/usbip/vudc_sysfs.c
> @@ -156,12 +156,14 @@ static ssize_t usbip_sockfd_store(struct device *dev,
>   		tcp_rx = kthread_create(&v_rx_loop, &udc->ud, "vudc_rx");
>   		if (IS_ERR(tcp_rx)) {
>   			sockfd_put(socket);
> +			mutex_unlock(&udc->ud.sysfs_lock);
>   			return -EINVAL;
>   		}
>   		tcp_tx = kthread_create(&v_tx_loop, &udc->ud, "vudc_tx");
>   		if (IS_ERR(tcp_tx)) {
>   			kthread_stop(tcp_rx);
>   			sockfd_put(socket);
> +			mutex_unlock(&udc->ud.sysfs_lock);
>   			return -EINVAL;
>   		}
>   
> 

Thank you for finding and fixing this.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
