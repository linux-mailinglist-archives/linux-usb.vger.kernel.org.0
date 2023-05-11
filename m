Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1349F6FEEC3
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 11:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237411AbjEKJ1I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 May 2023 05:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237695AbjEKJ0a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 May 2023 05:26:30 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87B5D06A
        for <linux-usb@vger.kernel.org>; Thu, 11 May 2023 02:26:22 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-965d2749e2eso1196567766b.1
        for <linux-usb@vger.kernel.org>; Thu, 11 May 2023 02:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683797181; x=1686389181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1IslJ7/3eQpHk0/ZONImP6ek9rvCI7d+h3hwQhusW0=;
        b=A3Lr/820FEisUc53N/6tIVzuEVp+khhimTcSLGsHq/i4fzqx7tp7I5DIC8bO/XwKAj
         DeCiey9CQk6CwmWdxVDc0ZLz0mFUSFVrXlg5gDkLclK8DPZxwGUd8Yk6O8WeNnw0ZD8n
         Y/BfVlIyj84qT8f0TXBAstume3ASfUzN6q65DvvZ74VUOE188xiWnitj/+IhI6/eUNgH
         i4cs5MlkAoXkApk/gkivGx4lkUZfcNoETbCpJEgZmTQtRt1GRkblYskEkCSle1KNUfwd
         kYSffouJuyUP8LZi2uM6C0wNwsQ+oJ+XUE/aeW0qabBZyLyg45XDKfxconB4I5sjwxsd
         TJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683797181; x=1686389181;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1IslJ7/3eQpHk0/ZONImP6ek9rvCI7d+h3hwQhusW0=;
        b=GdHq4s+jF8Q99zdtF6nVyxFOEvEWQ7T9YeJcwsBb1qm3MmGkzp/kE7cW4IH55yXeXp
         5VDf/Y5JowLtkCXkdzkVKJryNiVXGoxQnvRrec5DKkqWqkL94VhUvDg07fplrVT8y2et
         mz9uT28HAsooh7Men1hh1NsIkb0djGmskTgdp9WKW8FLeiztdQPWC6D5hG5ro+gWjjZd
         QI1MHmuR5gwSB/WL1Y0O77R9UKI6mTYDfUH/djEa1k0frVrFuG9mxWKe7NlkKlMJS0ev
         0UVJmiE6daE24F5f5TzRVgUkDXTnYmS6vJ5WwqKNB8SATQzAvHgUiMDKSmr+Z0UlW9IU
         JGjg==
X-Gm-Message-State: AC+VfDySkgK4ODKmm0bNfyvtOjhrTa9Ttbl/t2X/O0mDA+hwoF1pSOCE
        gCVYKSVWV4Y1GpEP/uQtjIv0bA==
X-Google-Smtp-Source: ACHHUZ74t7K+CeQz4z8BQyobf4t7TRb93OAiK2Zks93fMy5n6HFkZY/H0v/9xh4mpxhbpUlCfqdB2A==
X-Received: by 2002:a17:907:78c:b0:953:43a1:1988 with SMTP id xd12-20020a170907078c00b0095343a11988mr17157850ejb.46.1683797181377;
        Thu, 11 May 2023 02:26:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e? ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id n7-20020aa7d047000000b004fbdfbb5acesm2818308edo.89.2023.05.11.02.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:26:20 -0700 (PDT)
Message-ID: <9cf5965a-8290-dfff-9f92-07ed2df66650@linaro.org>
Date:   Thu, 11 May 2023 11:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: cdns,usb3: Add clock and reset
Content-Language: en-US
To:     Minda Chen <minda.chen@starfivetech.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230510132816.108820-1-minda.chen@starfivetech.com>
 <20230510132816.108820-2-minda.chen@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510132816.108820-2-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/05/2023 15:28, Minda Chen wrote:
> To support generic clock and reset init in Cadence USBSS
> controller, add clock and reset dts configuration.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../devicetree/bindings/usb/cdns,usb3.yaml         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> index cae46c4982ad..623c6b34dee3 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -42,6 +42,18 @@ properties:
>        - const: otg
>        - const: wakeup
>  
> +  clocks:
> +    minItems: 1
> +    maxItems: 8
> +    description:
> +      USB controller clocks.

You need to list the items. And why is it variable? Your clock choice in
the example is poor, I doubt it is real.

> +
> +  resets:
> +    minItems: 1
> +    maxItems: 8
> +    description:
> +      USB controller generic resets.

Here as well.

You had one clock last time, thus the review was - drop the names. Now
you changed it to 8 clocks... I don't understand.

Best regards,
Krzysztof

