Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3768D4B2BF4
	for <lists+linux-usb@lfdr.de>; Fri, 11 Feb 2022 18:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352246AbiBKRmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Feb 2022 12:42:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352251AbiBKRmv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Feb 2022 12:42:51 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7829AD41
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 09:42:50 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id h11so7406134ilq.9
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 09:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AMl5Q0l7ZBAg1CxVaEuv9tRWUWqxdjJpFGZMnk/aFes=;
        b=dNGqNvfx+XKo5zJD/uEbB2fpRt+NFL+fhiO5iceJWSW2cNK50VGMqcoieBtuvf4d3+
         jEprErP6DRajqrEvksNJKmN5CL94fYw5s8INt4+TcaVgM+oyBuDe1rLa644xJAaCCA3W
         YpPgKf2Lh/eAZ97rqSRt0owCG3J8a0t8c0VcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AMl5Q0l7ZBAg1CxVaEuv9tRWUWqxdjJpFGZMnk/aFes=;
        b=ATg/wK8KbzxmQX1n215Rm6UMwLOn+jV961uwc6x6DzT/1dEyiYBzhjSjcN3DwxV/ft
         WyP1Pvt6Er4zxKQrB3LKbUj0dpLbqbmPyyyOmIt6W1crieWdDjCbViTGPX92xL3I+Szk
         J6hVyeRwUIqiJd0AIY7CUmfsZekLHp+L3T8SYteJgL05JiplkYrNWF2sqr/jIA6XiGzJ
         SMADDZkA3NF065MQWXpr/YnKbZjNF7tK8k9Um1vM3quXpfGoij6TFyIeAC3OIRUERLEv
         nt5+ovDcv63gZo2dLqpuKTvXQbfyAaXMbQeYWVSPT1WTQmxHOf4AAgtpTDB9CmqgJSi4
         qrsA==
X-Gm-Message-State: AOAM532dnzmyAwB/rrBs015bI86WdWPDPAMy8jtxxIB3AJ0G/v7sLFif
        IisaipI3Dh5f0uYWbp9k9Ou2lw==
X-Google-Smtp-Source: ABdhPJzzOoMxzA43l+WUTJEuCQn3QALtkrzfNcOD73zJZ4CC4hxTj1Pfbl8rlwihxlkhWcrl4ODCJg==
X-Received: by 2002:a92:c644:: with SMTP id 4mr1512366ill.211.1644601369951;
        Fri, 11 Feb 2022 09:42:49 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id d12sm13057140ilv.42.2022.02.11.09.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 09:42:49 -0800 (PST)
Subject: Re: [PATCH v2] usbip: vudc: Make use of the helper macro LIST_HEAD()
To:     Cai Huoqing <cai.huoqing@linux.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220211012807.7415-1-cai.huoqing@linux.dev>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <bfefe6a9-b4c8-e40e-3526-7b53bc5d715d@linuxfoundation.org>
Date:   Fri, 11 Feb 2022 10:42:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220211012807.7415-1-cai.huoqing@linux.dev>
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

On 2/10/22 6:28 PM, Cai Huoqing wrote:
> Replace "struct list_head head = LIST_HEAD_INIT(head)" with
> "LIST_HEAD(head)" to simplify the code.
> 
> LIST_HEAD() helps to clean up the code "struct list_head vudc_devices =",
> only to care about the variable 'vudc_devices'.
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> ---
> v1->v2: update the changelog to explain why this change simplifies the code.
> 
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

Hi Greg,

Please pick this up.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
