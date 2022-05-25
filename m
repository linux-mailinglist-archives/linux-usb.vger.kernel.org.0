Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C55B53401D
	for <lists+linux-usb@lfdr.de>; Wed, 25 May 2022 17:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243550AbiEYPNb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 May 2022 11:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245146AbiEYPNY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 May 2022 11:13:24 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D193B225A
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 08:13:21 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id q2so5612645ils.0
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GdVXDiBTvDsGSp4gN7P3+qWOHyyVf7qzlb5UHFgMfDQ=;
        b=b4wHeygbsIeo4NVYzDdomfgzLiq/t/x5cyEzlGM6NAz1ILFgOtx9BtuNP861SjtiDx
         nd/T3BZbDVrpQLQR10r4IgScjxztwfsRk126/1HGktqLvFD4pRgpad52yH1Bwq2aL3Qz
         JAgAnsp2jjHnawnIlW8F51Tj8iRrEZr+f8gnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GdVXDiBTvDsGSp4gN7P3+qWOHyyVf7qzlb5UHFgMfDQ=;
        b=574KW9yeqV1/jNmmBGkTOGcROzRU+MOqGFI7a92Uuhj26dMjw0vXCxnXWIpR7RM4TU
         EPESfru4iyqyP4Oc7b8TD2GwbqtTsDKjosW6QmbDiUAGvPl8u6edcLs/CDOdZyBGivRW
         qSIZNaniQCNlu3DPXXW+t2kdCwst5vBuc9E6PKxlnvCEbsX3LOyyIlXmdmxxSCscfyGt
         e8pKheDmFJxiG7DPFC9ptsdl/7WbFARmkIJGlvq4oYsrsrw1znpTXNUPbQXA2hSYVt20
         9AF27/NzCqR14urj16Q468tEQKdAJoCrUxwaU52NC6cQfJQZV8HB1bdgTG8/gnpPKLX9
         PRHw==
X-Gm-Message-State: AOAM530pwA2qVBT6PWaf1Xyk/+yagXwojyJh1B9d4NlZImKB18+7oNI6
        WQvqoh/O8iu0lERVzCS52nBu7w==
X-Google-Smtp-Source: ABdhPJw7noa1HtR4Ak6KYzkBU2fFGxwdHHwQ2YkMao3TZhxjvPlXMjXcupLi+OzrR1Dd7utepFGtJg==
X-Received: by 2002:a92:cbd0:0:b0:2d1:48cb:1739 with SMTP id s16-20020a92cbd0000000b002d148cb1739mr16227573ilq.10.1653491601136;
        Wed, 25 May 2022 08:13:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id o30-20020a056602125e00b0065dc93eae5dsm5725027iou.7.2022.05.25.08.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:13:20 -0700 (PDT)
Subject: Re: [PATCH] usbip: vudc: Don't enable IRQs prematurely
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Igor Kotrasinski <i.kotrasinsk@samsung.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <Yo4hVWcZNYzKEkIQ@kili>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3f9926ac-9586-522e-e70b-d524b7cd19cd@linuxfoundation.org>
Date:   Wed, 25 May 2022 09:13:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <Yo4hVWcZNYzKEkIQ@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/25/22 6:30 AM, Dan Carpenter wrote:
> This code does:
> 
> 	spin_unlock_irq(&udc->ud.lock);
> 	spin_unlock_irqrestore(&udc->lock, flags);
> 
> which does not make sense.  In theory, the first unlock could enable
> IRQs and then the second _irqrestore could disable them again.  There
> would be a brief momemt where IRQs were enabled improperly.
> 
> In real life, however, this function is always called with IRQs enabled
> and the bug does not affect runtime.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> An alternative fix would be to make changes below and also change the
> outside _irqsave/_irqrestore() to just _irq().  However, that's more
> invasive and riskier with no upside.
> 

Thank you for the patch.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this up.

thanks,
-- Shuah
