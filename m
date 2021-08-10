Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC973E53F0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 08:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbhHJGyT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 02:54:19 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:33018
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235351AbhHJGyT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 02:54:19 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id CDFAB40C76
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 06:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628578434;
        bh=naRS7CwaU7aZcp3xZ2tFKyzYWCR0lqnUKpwy/5eVcB8=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=k4tZQBq7+kVOPS7y63j/9Mfro4cN59IiTwL9lGZHJZOX1n0dOE/x3D/+mawu87LYC
         fXHYO57kp7JetjgNj1D67NYU8TkUXvIeHL2+z8wpNiDMUmOvkdaQHQFftXijKNKLS2
         gmyBzZfPyL+WLqXYomu8XTLoDtb3RVJj1Puy/dIXTRbxZWLXQdhYamI+QR/NY76S0g
         8sM8xLllorzE2GpOOUnPh6Q1qGjKbZ9uBpe83IR7bqKwXfhhGHhFEuGnLbvzLHXrB/
         LFaXNkLyli44bFb2ytlyai6zZBHbQiwBd4SKFLxjut9DyVEXF2qTdHd3JzttPUokN/
         ZNQFuMY1RGMSg==
Received: by mail-ed1-f69.google.com with SMTP id v11-20020a056402348bb02903be68e116adso2406988edc.14
        for <linux-usb@vger.kernel.org>; Mon, 09 Aug 2021 23:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=naRS7CwaU7aZcp3xZ2tFKyzYWCR0lqnUKpwy/5eVcB8=;
        b=cRd7n02CvOpMYuNC0EFNXQROqgVqq8JlV2YrSx77mfqR23p4+raQpqLN7dnCte6n8m
         NgsqAwHPR0azdM+qYA/S7fJ2fMFJVXaQICkrIczimTp4/vJrVEuk/LIqZrvcjJzDGN+/
         xvNw/E1FnMvsDqrTXQWbWWyD9bYUz+NSh9R2M1ZC5JDSn45rp45sZsNu2+K8s4OiRuye
         hrfVWuDnaL/A7jabGD3n/9a4ActDbRvAysTYOLyTY4BmVv2uxJPy5KxggEF9Cu7YXQT4
         3wAzzu13+1veFVEXceXff5zvu4kMUayheGfVlTRuZMoi76qz9ES0a9pNGm8ua7UsyNhi
         hYdg==
X-Gm-Message-State: AOAM531lO33EY4bhbgV9/8QY+TIOC3lNoRbtSvqxDXUIA6QJfCtb1O+w
        ZUK05WhDshKnEPoFHHfCgEZ5GBrL0tV3+5NaVMSTrlTIoqCUv+ZA9nU3l4ETZbvw8JbHdRy2Hbd
        lNDh/aGbVMkPmiFTXHJUbhDiTq6PebLAba9hgNw==
X-Received: by 2002:a05:6402:34c4:: with SMTP id w4mr3061924edc.67.1628578434627;
        Mon, 09 Aug 2021 23:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt5lJkSnz2CsK2GprdZMkQVhxvGiMbsBmVqAjsI2uQfnOW7rXeLh7k2sxFeX91CAgklSqXHg==
X-Received: by 2002:a05:6402:34c4:: with SMTP id w4mr3061912edc.67.1628578434454;
        Mon, 09 Aug 2021 23:53:54 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id t15sm6483770ejf.119.2021.08.09.23.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 23:53:54 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] usb: gadget: udc: s3c2410: add IRQ check
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <bd69b22c-b484-5a1f-c798-78d4b78405f2@omp.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9db78434-6eb0-0094-3ed6-9b355eb923dc@canonical.com>
Date:   Tue, 10 Aug 2021 08:53:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bd69b22c-b484-5a1f-c798-78d4b78405f2@omp.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/08/2021 22:35, Sergey Shtylyov wrote:
> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code. Stop calling request_irq() with the invalid IRQ #s.
> 
> Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
>  drivers/usb/gadget/udc/s3c2410_udc.c |    4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
