Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD98E534016
	for <lists+linux-usb@lfdr.de>; Wed, 25 May 2022 17:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245049AbiEYPNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 May 2022 11:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245068AbiEYPMx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 May 2022 11:12:53 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE15AFB27
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 08:12:51 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id i74so14973638ioa.4
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0bQnxjKs1pIJTlibykKQy+NCTN/zN06hUmrppkpIOS4=;
        b=AccCEGTCaYA5vbnwf8qeKJXaaVYCTcXqtW09HSCF7NRrSJMEqNwbUzPBeW8Ei9plUD
         Mb+azUUjPI4Hu+fjoZZr5khoKMQqr8d9KDsyFk4dKfOoFSd36O0IfiSijchtD2CNbqWl
         aExNpRtbCT0PzvO1Y/sQnsLMTjyGCUSkkmkvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0bQnxjKs1pIJTlibykKQy+NCTN/zN06hUmrppkpIOS4=;
        b=JcmbLUcroG4qBOSdONQNhblJ47Pawcdw5HGBeAi9E5S9Gc6tt+SrhDzQaAglIxc8AW
         QwFAx4xKOjbK/U7KYizl95HXfSoBb9x/xQEKTMjXiE+JJ/uVTLWKJTPYY/2TCeOuV8SR
         /QrSizMW2zoTwnPYXKXMRmbzVWSyKP1pa8fHmunI0onRDinXuIo4EmM0i99O+qptW63g
         GuAspb0daXybjsiZbOPAPACpRD0lB1TmanoUGD+1Ic1r+X+Q35j66jdQASAsVXbrVi8g
         /H2N6y32u2g7OmaAZ403mYVyyCfR+EUzcZvwoBs6KWLm2hWYcnYpA4OcvbdmsQHaWUA3
         yGMg==
X-Gm-Message-State: AOAM532qMqFgppRcVNVSYKqVSZvGL7PgRJu9SWizjYCZH1wDtJ4G+BIo
        Bz3IV6qSDSWxg3EpGuq/oy+aCg==
X-Google-Smtp-Source: ABdhPJzy5M5hjOTuZdP/RuCmpjy8lT7iHrjZQ7qALqzx6xhWxBPw2nnkRYaRXbCOETkjLNqsjTZAfg==
X-Received: by 2002:a05:6638:2042:b0:32b:c513:21b2 with SMTP id t2-20020a056638204200b0032bc51321b2mr16864739jaj.90.1653491571341;
        Wed, 25 May 2022 08:12:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id a9-20020a921a09000000b002d1d8de99e7sm745107ila.40.2022.05.25.08.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:12:50 -0700 (PDT)
Subject: Re: [PATCH] USB: usbip: clean up mixed use of _irq() and _irqsave()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <Yo4gqLPtHO6XKMLn@kili>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <5a66600c-f8b6-de5d-44ad-4f6f0eb3934d@linuxfoundation.org>
Date:   Wed, 25 May 2022 09:12:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <Yo4gqLPtHO6XKMLn@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/25/22 6:27 AM, Dan Carpenter wrote:
> It generally doesn't make sense to use _irq() and _irqsave() in the same
> function because either some of the callers have disabled IRQs or they
> haven't.  In this case, the v_recv_cmd_submit() appears to always be
> called with IRQs enabled so the code works fine.  That means I could
> convert it to either _irq() or _irqsave() but I chose to use _irqsave()
> because it's more conservative and easier to review.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/usb/usbip/vudc_rx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc_rx.c b/drivers/usb/usbip/vudc_rx.c
> index 1e8a23d92cb4..d4a2f30a7580 100644
> --- a/drivers/usb/usbip/vudc_rx.c
> +++ b/drivers/usb/usbip/vudc_rx.c
> @@ -104,18 +104,18 @@ static int v_recv_cmd_submit(struct vudc *udc,
>   	if (pdu->base.direction == USBIP_DIR_IN)
>   		address |= USB_DIR_IN;
>   
> -	spin_lock_irq(&udc->lock);
> +	spin_lock_irqsave(&udc->lock, flags);
>   	urb_p->ep = vudc_find_endpoint(udc, address);
>   	if (!urb_p->ep) {
>   		/* we don't know the type, there may be isoc data! */
>   		dev_err(&udc->pdev->dev, "request to nonexistent endpoint");
> -		spin_unlock_irq(&udc->lock);
> +		spin_unlock_irqrestore(&udc->lock, flags);
>   		usbip_event_add(&udc->ud, VUDC_EVENT_ERROR_TCP);
>   		ret = -EPIPE;
>   		goto free_urbp;
>   	}
>   	urb_p->type = urb_p->ep->type;
> -	spin_unlock_irq(&udc->lock);
> +	spin_unlock_irqrestore(&udc->lock, flags);
>   
>   	urb_p->new = 1;
>   	urb_p->seqnum = pdu->base.seqnum;
> 

Thank you for the patch.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this up.

thanks,
-- Shuah
