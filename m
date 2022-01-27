Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9407549E183
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 12:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240851AbiA0LsG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 06:48:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52462 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240824AbiA0LsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jan 2022 06:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643284085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HGE7gxF/PrZOO5rcFzZ+w+MYUdoGMxbWWIjy9mknwZE=;
        b=i7jHfFD6GHIUq+GaqQH75gIOYuVAhNEoGoxpf4XsVhrkQuNpyQe9a3P55Q9djwgZjCYJIU
        bv2VhUniS2H/Yx2v3W+EeGjrZbs5/r6pguZyWk+7spWldVDBhjmubI0RvNCdz7bM6gb1IP
        WfhPjqd6oesvHid94oGYAVlfVboYxzs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-_VnLyZHNPxyq0Sq57s4m_g-1; Thu, 27 Jan 2022 06:48:04 -0500
X-MC-Unique: _VnLyZHNPxyq0Sq57s4m_g-1
Received: by mail-ej1-f72.google.com with SMTP id lb14-20020a170907784e00b006aa178894fcso1225276ejc.6
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 03:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HGE7gxF/PrZOO5rcFzZ+w+MYUdoGMxbWWIjy9mknwZE=;
        b=uWEobuGhFPdkDxDzNrfuZ5Ni0oT6DfO52EhgFelo1xYA/ukAVllon6gGGW0B5u5d3r
         FHGRHLz5sykKvy2TRMbiopI3imLUt2EX7q1YxR9RIjtMG1usav7Yv7fbmOMLgufq12Yb
         DJl4EfdVMmjcI+aGud8tvBzUwZhlGCRx14W+DFj6H2rNbYYPZcJ0hDB/gXVjmynd4iUB
         PT+ULg5weCoRtxqzhKvF6JWOnjZB9/xpuOMSuBSZPjFCxuyjo3tWZAabJEIdp6W/9WUM
         HpwwPS1eIL+0gOEapQkIn6v+BOoPXovfioe/2iJ4NQZGcLXv9oAixr6rPXI5LcTAIodG
         8qJA==
X-Gm-Message-State: AOAM530fYhi4mmwh+qa9ThxsUNzYwC4QQsWK08BiomcTQs+awkTXvTRd
        Zd0L1iv3pKi2Penr4cEGm1//Fu6Ei4lNK4I+tz4HNS7Zt1IyPbqDOgylWG/bFuS8SUqRgTug1fG
        5kxOiZBAB26gXrOQJeqRy
X-Received: by 2002:a17:907:7241:: with SMTP id ds1mr2705651ejc.199.1643284082711;
        Thu, 27 Jan 2022 03:48:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxALJ4orODysCyzf5OM83HGtMr7Bi36PqNUiGN5jpHNx9oPF+XO/JirOr44geRnmCZ4NtbP3g==
X-Received: by 2002:a17:907:7241:: with SMTP id ds1mr2705630ejc.199.1643284082537;
        Thu, 27 Jan 2022 03:48:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id cf13sm8735609ejb.141.2022.01.27.03.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 03:48:02 -0800 (PST)
Message-ID: <bd44bba7-de30-bb65-a328-1bc3c44b53eb@redhat.com>
Date:   Thu, 27 Jan 2022 12:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
Content-Language: en-US
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-2-bigeasy@linutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220127113303.3012207-2-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 1/27/22 12:32, Sebastian Andrzej Siewior wrote:
> Provide generic_handle_irq_safe() which can be used can used from any
> context.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  include/linux/irqdesc.h |  1 +
>  kernel/irq/irqdesc.c    | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
> index 93d270ca0c567..a77584593f7d1 100644
> --- a/include/linux/irqdesc.h
> +++ b/include/linux/irqdesc.h
> @@ -160,6 +160,7 @@ static inline void generic_handle_irq_desc(struct irq_desc *desc)
>  
>  int handle_irq_desc(struct irq_desc *desc);
>  int generic_handle_irq(unsigned int irq);
> +int generic_handle_irq_safe(unsigned int irq);
>  
>  #ifdef CONFIG_IRQ_DOMAIN
>  /*
> diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
> index 2267e6527db3c..97223df2f460e 100644
> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c
> @@ -662,6 +662,27 @@ int generic_handle_irq(unsigned int irq)
>  }
>  EXPORT_SYMBOL_GPL(generic_handle_irq);
>  
> +/**
> + * generic_handle_irq_safe - Invoke the handler for a particular irq
> + * @irq:	The irq number to handle
> + *
> + * Returns:	0 on success, or -EINVAL if conversion has failed
> + *
> + * This function must be called either from an IRQ context with irq regs
> + * initialized or with care from any context.
> + */
> +int generic_handle_irq_safe(unsigned int irq)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	local_irq_save(flags);
> +	ret = handle_irq_desc(irq_to_desc(irq));
> +	local_irq_restore(flags);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(generic_handle_irq_safe);
> +
>  #ifdef CONFIG_IRQ_DOMAIN
>  /**
>   * generic_handle_domain_irq - Invoke the handler for a HW irq belonging
> 

