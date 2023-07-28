Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B05C766C05
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 13:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235065AbjG1LsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 07:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbjG1LsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 07:48:06 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BAC3AB4
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 04:48:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bed101b70so92023766b.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 04:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690544883; x=1691149683;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GxgOtzBuLYyfviZOOW9JXIN01QggGcxGmGJNSoHve2c=;
        b=KjP90aul3E1qUz5a7QjFSxgi0PymJO63gA2TGEZ7fLtBeGWkT16EaPL2cnNZbCzKsD
         gvtZ8vvfryQc0kwy5t/jQDXRWNLW3HIw9rrDhpvi1GnXby/ZgiEKXSO4i/v+Af0nVhcg
         8Q5X/H91IQtIb/kAWLLHqtLL8bu8xWQcMzyr4kE37emQ/ZHQvvFur5VxV84lvkXo/E2G
         xB6HzNvDxZpTnWthal/gTeSHoAUxS83VSFcC0xOKMK9HJKNzZX11ee0vGWTz20gqvbIl
         JgGV6NjMiCRaHQuZSYAmXisEJ3McIFOeaLgFOV6Wj8GYtpnfKZVURiEM6KUvmyUs9q+R
         PHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690544883; x=1691149683;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxgOtzBuLYyfviZOOW9JXIN01QggGcxGmGJNSoHve2c=;
        b=E8APc+YQXpukpG8ZfveVLNWNy71bEyphXVLhIB8SLULNs1OEvHeku12zYmZgAUWR1W
         Uw5tbwwDedJ1zaFgBJJjtAbiO6sCsvGjqtvjEkRnkVQd8ymc8jK/2K+BAHaPy/5+8aBn
         FpulWA90EIWBqr9o4noqaUSh21R0rABqKT8EgfEICga7d1xHUwqp+2cDBRYIqNqlMnoy
         83we/HWzD0Fygv2vG+qqfCDlRgjCagw3S0gOgVZz8+VJ5LEbOApkdxEIxwZgGPR/9a5/
         NhfakBUm02+yJxUjAGz/Y5EtUuXDoXeFISbq5SK6xsHdV6E+8pxH1j0a7ODWz7C/LW2N
         BReQ==
X-Gm-Message-State: ABy/qLaL6r74TWF6YUmb3vrP+AjFaiku4v4OIFjtlEqSLwz8LnAxcPZA
        LASm7I47KksKvrwnzqJJyQClqQ==
X-Google-Smtp-Source: APBJJlEOJTYXsUqSyoBXk9V8NH/2sBHkUas8PA2itvpjORW5eb4j5gim/aHfTji1iBZPzqn9UK4vkg==
X-Received: by 2002:a17:906:3f1b:b0:99b:5689:1331 with SMTP id c27-20020a1709063f1b00b0099b56891331mr2096268ejj.59.1690544883508;
        Fri, 28 Jul 2023 04:48:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709063c0f00b009929ab17be0sm1972098ejg.162.2023.07.28.04.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:48:03 -0700 (PDT)
Message-ID: <c03f4364-3d97-531a-8acc-aae68de39562@linaro.org>
Date:   Fri, 28 Jul 2023 13:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 33/50] dt-bindings: usb: add sam9x7
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230728102843.266967-1-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102843.266967-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28/07/2023 12:28, Varshini Rajendran wrote:
> Document sam9x7 compatible for usb ohci.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> index be268e23ca79..a2490759f694 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -57,6 +57,12 @@ properties:
>                - nxp,ohci-nxp
>                - st,spear600-ohci
>            - const: usb-ohci
> +      - items:
> +          - enum:
> +              - microchip,sam9x7-ohci
> +          - enum:

That's not an enum. You cannot have here different compatibles.

> +              - atmel,at91rm9200-ohci
> +          - const: usb-ohci
>  
>    reg:
>      maxItems: 1

Best regards,
Krzysztof

