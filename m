Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F716184C6
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 17:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbiKCQfJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 12:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbiKCQew (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 12:34:52 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1186E1E70F
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 09:33:00 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id k26so1499088qkg.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Nov 2022 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RKUFy7ieLF5LsV/tUUgZVZtMlIYHNIb+otGAUnhMelU=;
        b=IamZAUgJg0IXAd4USwAjT5ZVQ8xTLKBUgUKDR8JA/fKfgQ0LwEwruIj7GQtAy93jKz
         7KPDfurJsfUro8NuhfcsJqTjK1gYGUoFnZ7Q0f/alKn+aOdlXYAUaDTHKD5R08ilNbDB
         9R1F6fvIUqh+/tVEKZ7tN99fj0/Fp9KZvo3uw3AJ/PxGLw1X4trHHwN9FXgefABFVuUS
         kcgBfxZTXuGPLwM1RNY+Ffe/YeUSkdPaBpEwd+KYVAVKUH8NpodXTXuD7dShHCunYbgq
         tOJNaDwSSpop2KZex1SVWKGvf+idhPavQ6DutT4jq6BXaP7rDRpCMo08Pw40zOSISfe/
         CneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RKUFy7ieLF5LsV/tUUgZVZtMlIYHNIb+otGAUnhMelU=;
        b=NouYkcEMS71AklWv/I8vNqGXGGw1jSu32sAQhq17Dm9UVulSO8VYYEb9IJFfCv1NKR
         WRLlzVr9UWjzsWD/2sguvLm5Bih3LcZYn99uU1mJV7icAKEkgCmCF2lxqWjMFy52LJGd
         /J5VY/TZzqDhtBTe1VNWBtKAJ9C0KGcZQJgXJ3udDEhflo9x0z5K4p351+iESYAWqEIs
         9rPIImk25WZK2epiCQKtVZT1dMGPFnNHXBj4tTIq4xQYIIg/02iLO9b2NFvsDpW+YkBa
         4ms2IPypnRLTb7qktAJJHDo9wunv4XnIS/o9HWlCBIs/9oFc532b7k842sUSrQ8qbrrG
         bJJQ==
X-Gm-Message-State: ACrzQf0DmO04UyGNKfplRl3wvQ67rpmOCxcITzNBDhWMLO+dtdnaNqt9
        C1+O2+/Gn5Fd5veWpD/k3+4dT4waM4JSyg==
X-Google-Smtp-Source: AMsMyM7u/7kABK8eTzftwB5GlQ2WHsPpYG8n1Mx/V5Muo7sySe6zOp+2bo/Nbr6YpLLWyqANV+zpWQ==
X-Received: by 2002:a05:620a:ec6:b0:6fa:1c5b:2be4 with SMTP id x6-20020a05620a0ec600b006fa1c5b2be4mr20378775qkm.85.1667493179131;
        Thu, 03 Nov 2022 09:32:59 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id y19-20020a05620a44d300b006fa2dde9db8sm1033150qkp.95.2022.11.03.09.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 09:32:58 -0700 (PDT)
Message-ID: <a3dee3e4-a245-3198-301e-b1812bd6983c@linaro.org>
Date:   Thu, 3 Nov 2022 12:32:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 6/7] ARM: configs: multi_v7_defconfig: Enable HPE GXP
 USB Driver
Content-Language: en-US
To:     richard.yu@hpe.com, verdun@hpe.com, nick.hawkins@hpe.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221103160625.15574-1-richard.yu@hpe.com>
 <20221103160625.15574-7-richard.yu@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103160625.15574-7-richard.yu@hpe.com>
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
> Enable the USB driver on the HPE GXP BMC.
> 
> Signed-off-by: Richard Yu <richard.yu@hpe.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 12b35008571f..940632995b9b 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -836,6 +836,7 @@ CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_MVEBU=y
>  CONFIG_USB_XHCI_TEGRA=m
>  CONFIG_USB_BRCMSTB=m
> +CONFIG_USB_GXP_UDC=y

Module

Best regards,
Krzysztof

