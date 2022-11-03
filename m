Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1AB1618425
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 17:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbiKCQVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 12:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbiKCQVa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 12:21:30 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197C1183AE
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 09:21:30 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id i12so1473670qvs.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Nov 2022 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FueTyq3jCO+nGowNH1FjZouY98Fz6x+u6x8FD3bMKA=;
        b=O33+YvIsWNgjf3X3iu2rc+EAINEVt0tRYauFsKKrcgeG88NfKYtUKWAbZmUWxdP8h0
         SSEwG/MwFCuG2C2qN0YSQ3x+VpZ5IbsNsdnOhdKC4jSOLriVwlnUBD35Qt2VYuPJ8t/J
         2/PfS7KB2S4gWESgkbTfWxHpPPeIx86yDpazI1rGR1Gx9t0CC6K/jtPBAQldGJSbBIiI
         U6N8mOt7rwFAsXD9FPZ+Vj1swa7srEjSqS4QrnTV46sb8nyW3Td3lbRzTzfTLuPTuFLi
         uhsoS4ONEdYbuL+mn5T05Mxo55f2ijtWO7eLZt6vR9bsxmc8rGNYO9zRVQZ/5AAx0qVG
         S2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FueTyq3jCO+nGowNH1FjZouY98Fz6x+u6x8FD3bMKA=;
        b=beZqeDIvrA9AH/zp4CkkqWFZHiL6fgmPEljXuWozusRnvyj95uW4Bs9MvUSREt6IlC
         20klxkIE6+ZwPe4FDovRKys1juFy313rXacKgz4bOgHRHUFEbPr/Y8HLCdx+yXP/Nscw
         G89bRsbYtiIdTr5+iURImkO1UkSZ4XcXwUgECdaFlzUcuJde189fza9N/lqMWcSW00M9
         Sf+kLxSQmoftqorywmpFeQOyT/iEAsUzVXwtxEgqdsMutaLCQqplmzA5zvU0VAWecHSa
         8yD2RcTHrZEiYz6CGIijxNkg3jm2UcnOBY5glSQ7CCtIcM2Dx/xrndZmIShFgyobsqlV
         GPNg==
X-Gm-Message-State: ACrzQf10yQy0ywKOlCnrRZFLK+Mb48zWvHS8WsfRsQNNvhXE05XKLHuy
        Fyx+rJ8DCGmlDPdh/osV0q3otw==
X-Google-Smtp-Source: AMsMyM56ymLJ4b0TV7mgfj/qyHJuoN5MlKZEVVhtss6lk0D94PK+ptxd6dMtmTcTmS2FxxKkl2foYw==
X-Received: by 2002:ad4:5ba3:0:b0:4bb:62e5:1db6 with SMTP id 3-20020ad45ba3000000b004bb62e51db6mr27660288qvq.89.1667492489267;
        Thu, 03 Nov 2022 09:21:29 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id j8-20020a05620a288800b006fa4cac54a4sm993456qkp.133.2022.11.03.09.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 09:21:28 -0700 (PDT)
Message-ID: <9f9e9907-4cb2-9d41-6d14-b4917e71a643@linaro.org>
Date:   Thu, 3 Nov 2022 12:21:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 7/7] MAINTAINERS: add USB support to GXP
Content-Language: en-US
To:     richard.yu@hpe.com, verdun@hpe.com, nick.hawkins@hpe.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221103160625.15574-1-richard.yu@hpe.com>
 <20221103160625.15574-8-richard.yu@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103160625.15574-8-richard.yu@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 03/11/2022 12:06, richard.yu@hpe.com wrote:
> From: Richard Yu <richard.yu@hpe.com>
> 
> Add the usb driver and dt-binding documents
> 
> Signed-off-by: Richard Yu <richard.yu@hpe.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56ff555ed5a4..b7280eb2dacd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2176,15 +2176,20 @@ F:	arch/arm/mach-sa1100/jornada720.c
>  ARM/HPE GXP ARCHITECTURE
>  M:	Jean-Marie Verdun <verdun@hpe.com>
>  M:	Nick Hawkins <nick.hawkins@hpe.com>
> +M:	Richard Yu <richard.yu@hpe.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/hpe,gxp.yaml
>  F:	Documentation/devicetree/bindings/spi/hpe,gxp-spifi.yaml
>  F:	Documentation/devicetree/bindings/timer/hpe,gxp-timer.yaml
> +F:	Documentation/devicetree/bindings/usb/hpe,gxp-udc.yaml

Just:

Documentation/devicetree/bindings/usb/hpe,gxp*

Best regards,
Krzysztof

