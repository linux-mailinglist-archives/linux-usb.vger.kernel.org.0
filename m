Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBBB84EAF4E
	for <lists+linux-usb@lfdr.de>; Tue, 29 Mar 2022 16:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237899AbiC2Ofr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Mar 2022 10:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238006AbiC2Oed (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Mar 2022 10:34:33 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB071D0CF
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 07:32:50 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id z7so21185158iom.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qSTrUL6WlyOgAbYd80glH9hQCFNO5qIECH8QC7MsZz0=;
        b=BzP5Vs5piewGOcMGK+PbvKkzV47OGA/ob4vuN1NMspDx8Y39MtQLR3PC5d1JDBTYoB
         GaboRGeOd2ntywJe32ct9vlJTtMx9t3x0SXCZDIUElARJwvkRP17EtlgC26exdZVuSiR
         jk0U7rd0yJPJP+H8mPYNbV6HpQo6OhNp1+aDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qSTrUL6WlyOgAbYd80glH9hQCFNO5qIECH8QC7MsZz0=;
        b=lml3Ov13bxiDv25Pg4GoSNaDgpD21VH02B9otfw8uCFxDDZJ+kzKfDu7V+mBGwAoQx
         GleukBXkdbfb/fPrwxWrSGeETh0RJQGd8E2eILvHtf8wh30IdrXCsQLw3M5EHQo60ize
         KoprqPBYMPAg5orMXdZRxiDGDxy8s60bG807YuoOpYltlVYhLBPV/xLEFWqqs2ezbwTi
         ZP+fFqJKc61DUEsSBNQWJSXAWXCzdJrICazMZ3QRznaakyFMxQN18rY1TktMEYVbVKYe
         fR7tyb00X40kOebvbFmawKH4QXps5/dC6FWIXkOVHJjO2bovn7Zs3XIqVT9+Oht2Ox2o
         2ePw==
X-Gm-Message-State: AOAM531vXd454TVF1nuTRfUuLdau14rM+qrXgnXvaiHfcN15t64QR0Oh
        4l/kZm1nh+L+d8ME2BgV9jw3Nw==
X-Google-Smtp-Source: ABdhPJz9sAJRWgIir4HFvWl6YO/q2eo3ky5z8M8Vi7tTknpv4sKuYPaYlOmwcyj0LGnEZvi4JXjehQ==
X-Received: by 2002:a02:604f:0:b0:30f:e6f1:3883 with SMTP id d15-20020a02604f000000b0030fe6f13883mr16742779jaf.266.1648564369340;
        Tue, 29 Mar 2022 07:32:49 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id n4-20020a92d9c4000000b002c886034defsm6932289ilq.62.2022.03.29.07.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 07:32:48 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: udc: add NULL pointer check
To:     cgel.zte@gmail.com, balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, peter.chen@kernel.or,
        christophe.jaillet@wanadoo.fr, lv.ruyi@zte.com.cn,
        johan@kernel.org, jakobkoschel@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220329055407.2375626-1-lv.ruyi@zte.com.cn>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <adab4546-632b-ae73-f3bc-b7fd306eedca@linuxfoundation.org>
Date:   Tue, 29 Mar 2022 08:32:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220329055407.2375626-1-lv.ruyi@zte.com.cn>
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

On 3/28/22 11:54 PM, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> kzalloc() is a memory allocation function which can return NULL when some
> internal memory errors happen. It is safer to check NULL pointer.
> 

Please add information on how this problem was found, including the
tool used and warn message.

> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>   drivers/usb/gadget/udc/mv_udc_core.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
> index fdb17d86cd65..f52eb3f2420a 100644
> --- a/drivers/usb/gadget/udc/mv_udc_core.c
> +++ b/drivers/usb/gadget/udc/mv_udc_core.c
> @@ -2231,6 +2231,10 @@ static int mv_udc_probe(struct platform_device *pdev)
>   
>   	/* allocate a small amount of memory to get valid address */
>   	udc->status_req->req.buf = kzalloc(8, GFP_KERNEL);
> +	if (!udc->status_req->req.buf) {
> +		retval = -ENOMEM;
> +		goto err_destroy_dma;
> +	}

Looks good to me.

>   	udc->status_req->req.dma = DMA_ADDR_INVALID;
>   
>   	udc->resume_state = USB_STATE_NOTATTACHED;
> 

With that change to the commit log

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
