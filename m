Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB7F702AB3
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 12:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbjEOKjA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 06:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjEOKi7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 06:38:59 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFBD819D
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 03:38:57 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-966287b0f72so1900854466b.0
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684147136; x=1686739136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/nTx9hmlUL6TU23fREGfCZtuapdJOL4NbbNwFkln+A=;
        b=LlwnNEWPWSEmn/2Z7lso1y40/VcXYnHPU9MP890uFAX/YJYJwp8QlCLgcY6+rng33Q
         Coi3dr9rihZsvfvod5uw0wpY4XgRPVZm+TVqXgmW9jstBBSr3CGeZzYy2lg/AI2oVDCs
         6jJBpUW5hIrcxwkEcd8sj3Ve7MtSQ1W0gaojjAb756Ju7PoH3kvlwU54ch+nogsypPYh
         z0DSVCmz8TuRgN13EBNtUm7irfAmUCACShNJZPxj6nkFR8sNQVQyHUOPbDiNYtSqQC9y
         ehj302MqCMtIeIix5XAoIWn585DZqh7NQZpz5zFi/lPez8T+2fJX7XR5QbhBOy1bvYLl
         l6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684147136; x=1686739136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/nTx9hmlUL6TU23fREGfCZtuapdJOL4NbbNwFkln+A=;
        b=EbaiywAXa9nWq8sfuJTlTNNkyjyz4uWNNjqYro+Zh/D8NTIoyolwSOLT/Xl2XMjLCt
         3cdiSkV/CxfUfmSKQTeEvK4/o0vOWCx8kGUc+nSq22Ohu3+s6qOvDF+f9kMVLlsNkufD
         FGZeAqyxDpppmR7XGYGK8p9B5+ScjYvWbn18kGWzLyU31xXKBb9cN8aucu4owrqsAQM0
         L37JBS62oAAZTR7tt9+HdV6THJOLBeuYpFdvOoe+S/uafd6mCm0El4CT5f5DsdkDWs5P
         xeQ0KmDGiDH85CzR5YUmELOcxDyp74ETBLphSGjJnEBqMEzJMQFkcitWuJDeyUJ42BtT
         GKKQ==
X-Gm-Message-State: AC+VfDyG4+rfsfkmEnSNKW85fDDYkItXwiuBc5Dac41z5GzalpLcCgfg
        no8dis5TUlR0KjutU+RKoHPEVA==
X-Google-Smtp-Source: ACHHUZ4ZZP7nQe2gpC8ZBs9Np+KlkaFn0KYAak4TZdTfhaVfQhMaofuij5JjMlCuyHXuwsegqY7bAg==
X-Received: by 2002:a17:907:1b06:b0:94e:cefc:8df0 with SMTP id mp6-20020a1709071b0600b0094ecefc8df0mr31469529ejc.61.1684147136355;
        Mon, 15 May 2023 03:38:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id hb38-20020a170907162600b009661cf921b4sm9107205ejc.202.2023.05.15.03.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 03:38:55 -0700 (PDT)
Message-ID: <d880d18d-5a2c-ad69-fe9f-56f98056b9c6@linaro.org>
Date:   Mon, 15 May 2023 12:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add microchip USB5807 HUB
Content-Language: en-US
To:     Mike Looijmans <mike.looijmans@topic.nl>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f4f6ec47-9e6b-4978-b229-53520227ed28@emailsignatures365.codetwo.com>
 <20230515062502.29273-1-mike.looijmans@topic.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515062502.29273-1-mike.looijmans@topic.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15/05/2023 08:25, Mike Looijmans wrote:
> The USB5807 is a 7-port USB 3.1 hub that can be configured by I2C.


Thank you for your patch. There is something to discuss/improve.

> +
> +  swap-dx-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 8

Missing minItems. Bug in the other binding caused this one to be hidden.

> +    description:
> +      Specifies the ports which will swap the differential-pair (D+/D-),
> +      default is not-swapped.


Best regards,
Krzysztof

