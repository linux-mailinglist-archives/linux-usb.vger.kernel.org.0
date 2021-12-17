Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1D8478F1C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 16:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237938AbhLQPJT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 10:09:19 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37202
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237934AbhLQPJT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 10:09:19 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0316B402FC
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639753758;
        bh=Ekcv8bNIXIYPhjro0Nb278CmOGUMMLIkTcaAs3AM2AE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=kgs1Uc1F0BASNMDcnAVM1T4h5vTCAF5MxScMYFVPkY1IaTcYibCq511hOY98bLlWL
         q3/M+7u7eYGKCCBuy8GMUh3BcEHjVbUrymm09cn2sm1o1cTWixBbzUHhDUYSXYH2RF
         1T7NI+bVIyugqLDz3mjyKIXtOuWU+Pm+FZZnfOhBktvCjyQq3l+sN53IunP3DWZaOP
         6NF0nrc/sBKyf0jhLxZgUKYjDlfZONuc81dqIN/5frLNJj5pbJdMmr7D4w0qAfrdd5
         GaH2Dt6ukszjKSc2rxc60+jPy4wYzjYkdSsIxgi7SIgCT48Mgnk49p3GSWUvrqNELm
         ltKGFOPD/89KA==
Received: by mail-lf1-f72.google.com with SMTP id a28-20020ac2505c000000b0042524c397cfso1036904lfm.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 07:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ekcv8bNIXIYPhjro0Nb278CmOGUMMLIkTcaAs3AM2AE=;
        b=ZAtflJI6kIBxnbT8e12vhrApnPsoGMGP4c1NvhPwe3V/0Ri+dRdFP0plqKb1QXRO8d
         srbVBU4TNgHRYnYLCczZY5RllR+5h043S3rRydQ/NHn7I9sqQreD7m0GyzRmgUlRpFcw
         IGoYCW1M1CxsXVjZB7gt8/zF7Hkh/KxOqnvoYF5rOYcOopHiefCeB1NyhrhgtBFS8HhK
         NIDoVOzgOH4qS0pJ20/xuD5Ipv+W2/OcFbRiXUPSbxnHZO3Cex5GYlXj1zj8Crd/P4bX
         WH3EQi4AWVUXSzlsHzedA0hIhQ41ZHp32xnOm8Snk3VnmeP35d4EmVn7UFxGiidstW8n
         x81Q==
X-Gm-Message-State: AOAM532DUg8RkBqeFv75Eyggpr+gy7zuUwLWXKPqHkLkmGGPPs36VaXf
        wgM8PFiMDCcq/xNGc6u1WZTvTkda9WYr/rEthO0mW8amp4rlPhcI0izGaGN07LLIWNXaP9FX8Cl
        yS6BiyQQI4bGKv3ohYkJRAva57GYpzDTWHpkQ1A==
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr3004608ljp.188.1639753756752;
        Fri, 17 Dec 2021 07:09:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHJzYnX2gs6VoqK9iRkmiSREooJ2FXXIbMDOX3XDHzAr4mBWfowLrbkwZGknR7FEjLbWDk2Q==
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr3004581ljp.188.1639753756369;
        Fri, 17 Dec 2021 07:09:16 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d4sm1429654lfg.82.2021.12.17.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 07:09:15 -0800 (PST)
Message-ID: <61ae4cfd-a544-96d3-d521-877b8b38b5fc@canonical.com>
Date:   Fri, 17 Dec 2021 16:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-18-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-18-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update the RISC-V/Microchip entry by adding the microchip dts
> directory and myself as maintainer
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a2345ce8521..3b1d6be7bd56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16348,8 +16348,10 @@ K:	riscv
>  
>  RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>  M:	Lewis Hanly <lewis.hanly@microchip.com>
> +M:	Conor Dooley <conor.dooley@microchip.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	arch/riscv/boot/dts/microchip/
>  F:	drivers/mailbox/mailbox-mpfs.c
>  F:	drivers/soc/microchip/
>  F:	include/soc/microchip/mpfs.h
> 

Good to have the DTS covered, so FWIW:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

You still should get Lewis' ack (unless he merges it)

Best regards,
Krzysztof
