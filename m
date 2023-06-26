Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9A973E3C9
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jun 2023 17:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbjFZPpK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jun 2023 11:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjFZPpI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jun 2023 11:45:08 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AE210FD
        for <linux-usb@vger.kernel.org>; Mon, 26 Jun 2023 08:44:50 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fa9850bfd9so10228185e9.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jun 2023 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687794288; x=1690386288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UrxXEvatNL5MUfAwzDvwxvX1r/I0ElFELnqWIQmCbcc=;
        b=XkuLF5VFHIYw+9DNJxiGi8PkAKiyD7fIBCjdXmLenBb4SK3SYPUS0dW/5NDKZzLFWM
         2Sd4JQaxzgs4s6GFUYR6UsPXdt363q5vJBEUaYDSTRDsV9gKWEWP8Bte5pVB+SwCpvDT
         1inpgwVEZYQtspqGGUoIZEg9R/NW2Y5nK3Nh3fHxRhLKLUuXQQujpMSYknaYfy3mi4GQ
         bUwk21diV3N9uVtojV++PfRgqML6qFWd/MjgfAK4JguG7wVu/P4GnsNJFdLAiwEOGIdr
         ww6iGt7Sww1dhOYxGByPovC+cuwgFwwX3yn/WggII8iB4i5/0no5h3RMVThPZ0bMEixt
         VfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687794288; x=1690386288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UrxXEvatNL5MUfAwzDvwxvX1r/I0ElFELnqWIQmCbcc=;
        b=PX+dcFTiNFZoYIEGznNKh30kNYZ8hL/8uJfq27Ivi70T4m8O9xcEbyNqTajAN2v07H
         v8GEoX7LDd74tPS9U8mcSzaDtnBH6eKWcdCd6d4vESSaKbx/+TRqT/SnmmUk7rjklVk2
         HLO+h0ZEQkVsfh5jS2SNyhj0M/WHh0RRzTYeo0pGXq6dOEtaeKf69upWU2meo8Mt4U0j
         Ckl6URFgn8CcinsWpQRolPsvOB7DZ06caaw0hmCGEGGpYg8mPsoM7xGaw0VPyx4zMafk
         s4iwkCVB88uQ3OT6+3sCQraf0syxUnDKiM+VCJwH6FzOxqT+pk+JC4KER7N9csv+lPlS
         O9PA==
X-Gm-Message-State: AC+VfDwJsETHGkAvheK0nXL+6kvG2hZM+7FMzStP91rzrKfabAcXLmFF
        pe2HVX5HsIC82FjQryO1naZzBw==
X-Google-Smtp-Source: ACHHUZ42CLhgk+7E/Osrdko45QPD2ragNDfnVh4audo9Vam953slWEl7qgMXhdVnhv6HxHDxlMYAhg==
X-Received: by 2002:a1c:f310:0:b0:3f8:f382:8e1f with SMTP id q16-20020a1cf310000000b003f8f3828e1fmr8247952wmq.24.1687794288529;
        Mon, 26 Jun 2023 08:44:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c029800b003fa52928fcbsm8094691wmk.19.2023.06.26.08.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:44:48 -0700 (PDT)
Message-ID: <f7bca54b-9de1-be9a-ad46-3502df58289f@linaro.org>
Date:   Mon, 26 Jun 2023 17:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: ci-hdrc-usb2: add
 samsung,picophy-rise-fall-time-adjust property
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, peter.chen@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org
Cc:     conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com
References: <20230626092952.1115834-1-xu.yang_2@nxp.com>
 <20230626092952.1115834-2-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626092952.1115834-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26/06/2023 11:29, Xu Yang wrote:
> The samsung,picophy-rise-fall-time-adjust property can help to adjust the
> rise/fall times of the high-speed transmitter waveform. The value can be
> 0~3.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 782402800d4a..d84c66c342ac 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -292,6 +292,16 @@ properties:
>      minimum: 0x0
>      maximum: 0xf
>  
> +  samsung,picophy-rise-fall-time-adjust:
> +    description:
> +      HS Transmitter Rise/Fall Time Adjustment. Adjust the rise/fall times

Adjust with/by what? What are the units?

> +      of the high-speed transmitter waveform. The range is from 0x0 to 0x3,
> +      the default value is 0x1. Details can refer to TXRISETUNE0 bit of

default: 1

Don't repeat constraints in free form text.

> +      USBNC_n_PHY_CFG1.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x0
> +    maximum: 0x3

Why "samsung" prefix? If this is specific to samsung, make it
specific/narrowed like other properties.

There are no Samsung compatibles here, so what is exactly here made by
Samsung? Which device?

Best regards,
Krzysztof

