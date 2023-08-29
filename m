Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4D978C9FE
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 18:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237284AbjH2Qz2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 12:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237622AbjH2QzX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 12:55:23 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C9E1B6
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 09:55:20 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52a1ce529fdso6154080a12.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 09:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693328119; x=1693932919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BpJgivS3dlGuz7t1+9iCEke02uZzCJ683AvwGIuOoo=;
        b=tmGtO8ZTCn9K5zClsMbwhH/hKL3nvRuCXYjKmcjwde5Wwp78tv7UrrrXnc81b4MW21
         pURng7CBFFmptMmXxVGEalJfHtBIzDcPgRXVL+e/Myfsu095i34PWzY+BhIKQDDz7aax
         lTCspFt/UKeML95+kyrbtwqlGOFsEc6z2WlbMNlreIy4nNJCqxzC6bnkr1IXaVqtMc5e
         tawyC/68XUzeyaYUbRtp2oT7uq8z31mfckmw39E4NV5mnfwbLlBUP18DlzKS5gcKs+G+
         ApGPLCnqGczjxCqDmL+wGJEmPxL6kzAbPCJ1zxvgZRXMTdOdz5p5peSp9A2WkA4ciCQu
         ShFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328119; x=1693932919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BpJgivS3dlGuz7t1+9iCEke02uZzCJ683AvwGIuOoo=;
        b=Fjl41/ntbxeanEIks2itgh5zUqZqUhyAOJJP3vUzuG82fBn/JAYJLj8mzk2JueNnKC
         J4MbhKcAXIru4PyC33rxt2bRYPNG4syVUuDBT0MwJQ1UuShSZ2LkVkUEk8/K4O2SPwQ7
         ZgbMPzadpvCOn4RYasB53NP17zeb3iwsWAYYNj9jav8qOM+w/WJ6WBW/i83uyd6mCT8a
         6/iTdtvROWd9EjFzK+3E0LtzFognxrzPgOKKxt5tqfy88NMWLHmBvzfYrrXWspTEWRr8
         lEKFf6jy9EZpNgsFe6KygVrsoqlqOR8HqytEQx3Mb+bHoLFE5sEkXpLQPdIU5UQVoQmR
         LFIg==
X-Gm-Message-State: AOJu0YzdlgE81TpJSLTIjtbmubA2a2mX9OYpGjYjudXSUhoax2YK7PYr
        GQ4yNiKFSpdK+drrkiBNKLsDYg==
X-Google-Smtp-Source: AGHT+IF0hK7L2NbSch0GNoms7PJA7260zSeTpFfKq5naoZ4uA3lJ3h0h8FizIDcR0esq873qWjKw+g==
X-Received: by 2002:a50:ef0d:0:b0:52a:250e:a04a with SMTP id m13-20020a50ef0d000000b0052a250ea04amr15569445eds.7.1693328118928;
        Tue, 29 Aug 2023 09:55:18 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id r9-20020aa7da09000000b005236b47116asm5860050eds.70.2023.08.29.09.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 09:55:18 -0700 (PDT)
Message-ID: <d30742d6-7fe2-c5fe-ac42-86642acc076e@linaro.org>
Date:   Tue, 29 Aug 2023 18:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/9] phy: qcom: uniphy: Rename ipq4019 USB phy driver to
 UNIPHY driver
Content-Language: en-US
To:     Praveenkumar I <quic_ipkumar@quicinc.com>, robert.marko@sartura.hr,
        luka.perkov@sartura.hr, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, vkoul@kernel.org, kishon@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        arnd@arndb.de, geert+renesas@glider.be, nfraprado@collabora.com,
        rafal@milecki.pl, peng.fan@nxp.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_varada@quicinc.com
References: <20230829135818.2219438-1-quic_ipkumar@quicinc.com>
 <20230829135818.2219438-3-quic_ipkumar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829135818.2219438-3-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29/08/2023 15:58, Praveenkumar I wrote:
> UNIPHY / Combo PHY used on various qualcomm SoC's are very similar to
> ipq4019 PHY. Hence renaming this driver to uniphy driver and can be
> used for other SoC's which are having the similar UNIPHY.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
>  MAINTAINERS                                                | 7 ++++---
>  drivers/phy/qualcomm/Kconfig                               | 7 ++++---
>  drivers/phy/qualcomm/Makefile                              | 2 +-
>  .../qualcomm/{phy-qcom-ipq4019-usb.c => phy-qcom-uniphy.c} | 0
>  4 files changed, 9 insertions(+), 7 deletions(-)
>  rename drivers/phy/qualcomm/{phy-qcom-ipq4019-usb.c => phy-qcom-uniphy.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ff1f273b4f36..7f4553c1a69a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17774,13 +17774,14 @@ F:	Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>  F:	drivers/mailbox/qcom-ipcc.c
>  F:	include/dt-bindings/mailbox/qcom-ipcc.h
>  
> -QUALCOMM IPQ4019 USB PHY DRIVER
> +QUALCOMM UNIPHY DRIVER
>  M:	Robert Marko <robert.marko@sartura.hr>
>  M:	Luka Perkov <luka.perkov@sartura.hr>
> +M:	Praveenkumar I <quic_ipkumar@quicinc.com>
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
> -F:	drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> +F:	Documentation/devicetree/bindings/phy/qcom,uniphy.yaml

You broke the path in your previous commit, but anyway this will go away.

> +F:	drivers/phy/qualcomm/phy-qcom-uniphy.c
>  
>  QUALCOMM IPQ4019 VQMMC REGULATOR DRIVER
>  M:	Robert Marko <robert.marko@sartura.hr>
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index d891058b7c39..e6981bc212b3 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -28,12 +28,13 @@ config PHY_QCOM_EDP
>  	  Enable this driver to support the Qualcomm eDP PHY found in various
>  	  Qualcomm chipsets.
>  
> -config PHY_QCOM_IPQ4019_USB
> -	tristate "Qualcomm IPQ4019 USB PHY driver"
> +config PHY_QCOM_UNIPHY
> +	tristate "Qualcomm UNIPHY driver"
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
>  	select GENERIC_PHY
>  	help
> -	  Support for the USB PHY-s on Qualcomm IPQ40xx SoC-s.
> +	  Enable this driver to support the Qualcomm UNIPHY found in various
> +	  Qualcomm chipsets.

I don't quite get why this is renamed, either. Just because you re-use
it? Re-usage is not affected with old name...

Best regards,
Krzysztof

