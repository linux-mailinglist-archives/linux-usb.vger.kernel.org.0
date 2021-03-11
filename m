Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56170337D04
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 19:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCKS5y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 13:57:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhCKSzd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 13:55:33 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79A2C061760
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 10:55:32 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id z13so23052283iox.8
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 10:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=stRVno9z/DCS0wZx7I98P8EWMS6yZuT8s6v7jBQ49hM=;
        b=BMoGUsO4GNIbTwMGxgFtKIi3ncJzrgl+1h85yF0gmLnayDHFLpLPkhRm6g3mxSD7xL
         +E6IVqxRiF49V91lnMdlLbzeDKbqvcmBoEz3F9tFSCrzgK0f7cd2Y6G/AU3DZqFcJ67M
         Q+73CxlhW5rv7fcbNMQhEHe2fvGcle/qvBlzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=stRVno9z/DCS0wZx7I98P8EWMS6yZuT8s6v7jBQ49hM=;
        b=Qy6paY6zKhVSqbwws7gTY5mEaL02fm+Ke24+sXoM4TLkCxQvh2dmNSar+agfxeXH12
         5TbK/4lk7BLZDUkvRHs2WWaJwqueJWwQfCRjQM8Wux7RsF24UlrKiGqqqJqSDAJGYJ8C
         WiqCpRkBPO8y6P78ODKwQc09+1M48/chLsXZO1J+96+bPyoZWHdHVMNPp+N//PM0tf+6
         VCxjadoyf4qT1y5Cv1jU+qC95HmL5ywQu8cJaYQ/lghuJs/geL7cyaD+qly10AqlfCa/
         FUTQmo+R908xzzEyvPh7qAy0MM1P6+KIaOthrhg5C/ig8mImKUR24YSzw4Y1fexuEf2d
         8S6A==
X-Gm-Message-State: AOAM5311L3Hbq/fNVlaSNxqTxHpgydrOf7fxFnu4LviOCAesqWDko0hu
        p+b5fN+WVmHWSOoMmrdVwscOLg==
X-Google-Smtp-Source: ABdhPJw4udqsFDFZUWvVbNULF5TWf0ztq74YOCcgDSPWaVveOnaqhlFTiqS51B7eMoc+nsI6kywBog==
X-Received: by 2002:a6b:1415:: with SMTP id 21mr7585518iou.147.1615488932245;
        Thu, 11 Mar 2021 10:55:32 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v4sm1691239ilo.26.2021.03.11.10.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 10:55:31 -0800 (PST)
Subject: Re: [PATCH][next] usbip: Fix incorrect double assignment to
 udc->ud.tcp_rx
To:     Colin King <colin.king@canonical.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210311104445.7811-1-colin.king@canonical.com>
 <8862cf33-dc2b-1d62-d7ef-56f34c5b358d@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <89eb8a32-8d43-cf0c-d460-9c25655141b4@linuxfoundation.org>
Date:   Thu, 11 Mar 2021 11:55:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8862cf33-dc2b-1d62-d7ef-56f34c5b358d@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/11/21 7:16 AM, Shuah Khan wrote:
> On 3/11/21 3:44 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently udc->ud.tcp_rx is being assigned twice, the second assignment
>> is incorrect, it should be to udc->ud.tcp_tx instead of rx. Fix this.
>>
>> Addresses-Coverity: ("Unused value")
>> Fixes: 46613c9dfa96 ("usbip: fix vudc usbip_sockfd_store races leading 
>> to gpf")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/usb/usbip/vudc_sysfs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/usbip/vudc_sysfs.c 
>> b/drivers/usb/usbip/vudc_sysfs.c
>> index a3ec39fc6177..7383a543c6d1 100644
>> --- a/drivers/usb/usbip/vudc_sysfs.c
>> +++ b/drivers/usb/usbip/vudc_sysfs.c
>> @@ -174,7 +174,7 @@ static ssize_t usbip_sockfd_store(struct device *dev,
>>           udc->ud.tcp_socket = socket;
>>           udc->ud.tcp_rx = tcp_rx;
>> -        udc->ud.tcp_rx = tcp_tx;
>> +        udc->ud.tcp_tx = tcp_tx;
>>           udc->ud.status = SDEV_ST_USED;
>>           spin_unlock_irq(&udc->ud.lock);
>>
> 
> Thank you for finding and fixing this. This is my bad.
> 
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> 

Applies to stables as well since the 46613c9dfa96 is marked for
stables.

thanks,
-- Shuah

