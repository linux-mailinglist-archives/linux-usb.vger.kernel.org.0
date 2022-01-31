Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800CC4A4B05
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 16:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379910AbiAaPyI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 10:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245307AbiAaPyH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 10:54:07 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A245C06173B
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 07:54:07 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id e2so26362074wra.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 07:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7Gy5UW1fWfYNjiBYU6VT4K4G1ACnF1QWzkEUjeRjyVM=;
        b=QC8Hbp3YDZL1XPZQtcsDsq3tgT37d1hv4VhJGbgqIYCUyf8N8FD7u9yJxnhJVb3Mtr
         zfVcqhkaxtb1/jyAPQFInfEyWQMxQRgGKibIR0sIERVHoXCf0+28dGENmQvyeLw1t/eU
         J/Jd5gnNokoM+9G31GufeEjj+RhMvR9EoV8iwvDnV0NvPvqAdgej3b6kKbzI3wNNEQcG
         VuSJlNx7P5lj2MUxXNI56MjeGtAaIKKtex68om4cEDGqKLuAx26xnWV2rousTmXXI7QH
         sgpXPhsde06UtIx4gOTALN8K+7YfHLHJh7QzbBNTkLp9oUWVXOPRVuXhdJ7PUJgAd7Qd
         FJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7Gy5UW1fWfYNjiBYU6VT4K4G1ACnF1QWzkEUjeRjyVM=;
        b=sBNzTDUPcW7waml8Q/snJbWed4HeSSJo8iDIS97r6mFmGWzWLA40QJfkkbTa1bHY0R
         TEcSqmoPHAE+/SCfJM5zjEeWbvqpSGZsAoGR5prbgnq1LPV2uYGk0CnMVxYLnnLZLk3G
         vtF37LilupLQWZIPoDBdpRJ7OFHWuO2jK09mz7SiPEdw8dG8NrhTH5iYt1RqQdZwBV0f
         3BPRChrcwykbJg72w715idV0DFsLEJWVPvO/o4JFlMg4e2sILuG7nhqs5YwFCm8X6cJH
         1avxxrfme0nWjCZ1alQ/VoHfu6ppG1IZWS7YwTe+UUZs0rus8GGBAS3sr9nZ3WqezyTG
         d7EA==
X-Gm-Message-State: AOAM531ucm7TvdJYHgAhz5VJNKuXQsGOZuPad/SQi79ygUB85ljkwxpD
        8wSpcJf7iz7AnjNDYtA1ptJRTQ==
X-Google-Smtp-Source: ABdhPJwR5vQXkMM6SlNUC6W39RCaocup+suVldKGwB3rvUuLoX1E9Y2tm0+t3CiCdEKCpzkvw5fsaw==
X-Received: by 2002:a05:6000:15c5:: with SMTP id y5mr17937388wry.94.1643644445795;
        Mon, 31 Jan 2022 07:54:05 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id f14sm9743053wmq.40.2022.01.31.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 07:54:05 -0800 (PST)
Date:   Mon, 31 Jan 2022 15:54:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH v2 4/7] mfd: hi6421-spmi-pmic: Use
 generic_handle_irq_safe().
Message-ID: <YfgGG0v/zhQp41tr@google.com>
References: <20220131123404.175438-1-bigeasy@linutronix.de>
 <20220131123404.175438-5-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220131123404.175438-5-bigeasy@linutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 31 Jan 2022, Sebastian Andrzej Siewior wrote:

> generic_handle_irq() is invoked from a regular interrupt service
> routine. This handler will become a forced-threaded handler on
> PREEMPT_RT and will be invoked with enabled interrupts. The
> generic_handle_irq() must be invoked with disabled interrupts in order
> to avoid deadlocks.
> 
> Instead of manually disabling interrupts before invoking use
> generic_handle_irq_safe() which can be invoked with enabled and disabled
> interrupts.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/misc/hi6421v600-irq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

The subject line should be "misc".

> diff --git a/drivers/misc/hi6421v600-irq.c b/drivers/misc/hi6421v600-irq.c
> index 1c763796cf1fa..caa3de37698b0 100644
> --- a/drivers/misc/hi6421v600-irq.c
> +++ b/drivers/misc/hi6421v600-irq.c
> @@ -117,8 +117,8 @@ static irqreturn_t hi6421v600_irq_handler(int irq, void *__priv)
>  			 * If both powerkey down and up IRQs are received,
>  			 * handle them at the right order
>  			 */
> -			generic_handle_irq(priv->irqs[POWERKEY_DOWN]);
> -			generic_handle_irq(priv->irqs[POWERKEY_UP]);
> +			generic_handle_irq_safe(priv->irqs[POWERKEY_DOWN]);
> +			generic_handle_irq_safe(priv->irqs[POWERKEY_UP]);
>  			pending &= ~HISI_IRQ_POWERKEY_UP_DOWN;
>  		}
>  
> @@ -126,7 +126,7 @@ static irqreturn_t hi6421v600_irq_handler(int irq, void *__priv)
>  			continue;
>  
>  		for_each_set_bit(offset, &pending, BITS_PER_BYTE) {
> -			generic_handle_irq(priv->irqs[offset + i * BITS_PER_BYTE]);
> +			generic_handle_irq_safe(priv->irqs[offset + i * BITS_PER_BYTE]);
>  		}
>  	}
>  

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
