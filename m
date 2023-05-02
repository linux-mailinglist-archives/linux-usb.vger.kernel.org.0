Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707D36F4AE6
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 22:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjEBUIM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 16:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjEBUIH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 16:08:07 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7FA198C
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 13:08:05 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-959a3e2dc72so850869866b.2
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 13:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683058084; x=1685650084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RqIi6IvcdeuU0KYQE4Z8uSC27gkyAcL78XpC/FHuojo=;
        b=z0PGfQl1sdu0SPr1lcAsrKinpMmdDtmFFNAQNUrPQQohxTUGannTjljIHqGwrDl/yX
         I6s2ZkoNRBmbD1Z0jELAJXiBUWVRG56d0lFzubKXsHLHVZBXJ5EwLtQ/JRJ+4w9GsBcI
         soEGIPgwqTTQC/MbbP49KJehYOGz5RShaPorm7TtT1E5BxV52QtftwQNrVs9fu4qNA78
         HsH+TTPoDbLBJQKJElXMvf+d/3CLWYigDKcURXLI8k/Ez605TtB/Kjf3NPvRX+r6NCGn
         X9SgpUxsBhlp+eX7wVLXp6qjJmnOvnFBA1T023iR2AF3CLuViQXrVJhlejD6UiGhk/Tn
         u/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683058084; x=1685650084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RqIi6IvcdeuU0KYQE4Z8uSC27gkyAcL78XpC/FHuojo=;
        b=OJOBXDvj8LWQzcWaVA765PwoI2lJ6PgSX1ph3hsyjojtq2UCnXT9iw79e4XG9Bn5Xj
         AWXiNzRSLPLCKQli+1FNyz2PNmByFuaC50UruCBzk9s3gAtAeygcCbzqvMu45vrKQ8Xl
         jhiMw0f8gwVATSFgtH4B4koifm9tXMe72LW0ATkJcmgfJfLHXFyJ6ye+iw6/Bl/rVVBI
         jxDm7LFCFE6W76V3t8MNawI2Ulz3qsBma1TEyx+ip+0o1QxnDd0CzLa5tXzT7ZjuQB2o
         R14dURwv2OCLW3A/jaN0/vcyYfmJcpHLlmr+m7E2PneAxz/ftdYzyQ026WOjzK0DiQq+
         4OwQ==
X-Gm-Message-State: AC+VfDzpH73PG5gsB/M0Ss/LNcKqAcC8bQrLCPQrGWoumjJPDOFhlC2d
        5yBYj3ezV826IO0U6NfR4uknvA==
X-Google-Smtp-Source: ACHHUZ7f0OZxRF1W5f7zHOtmLIacEffm2Y54nHgHHQa7Nlc8GDC5YkXBLpB86wa2xsrxeWY1Rk97uw==
X-Received: by 2002:a17:907:1ca5:b0:94e:4489:f24d with SMTP id nb37-20020a1709071ca500b0094e4489f24dmr1251365ejc.61.1683058084097;
        Tue, 02 May 2023 13:08:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:37be:eda5:e303:19e0? ([2a02:810d:15c0:828:37be:eda5:e303:19e0])
        by smtp.gmail.com with ESMTPSA id bv13-20020a170907934d00b009584c5bcbc7sm13457255ejc.49.2023.05.02.13.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 13:08:03 -0700 (PDT)
Message-ID: <154c67fc-3c4c-f65d-cf23-9c127175472f@linaro.org>
Date:   Tue, 2 May 2023 22:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 1/2] dt-binding: cdns,usb3: Add clock and reset
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
References: <20230502081805.112149-1-minda.chen@starfivetech.com>
 <20230502081805.112149-2-minda.chen@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230502081805.112149-2-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02/05/2023 10:18, Minda Chen wrote:
> To support generic clock and reset init in Cadence USBSS
> controller. Add clock and reset dts configuration.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Subject prefix: dt-bindings

> ---
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> index cae46c4982ad..7bffd8fb1e38 100644
> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
> @@ -42,6 +42,18 @@ properties:
>        - const: otg
>        - const: wakeup
>  
> +  clocks:
> +    minItems: 1

no, this must maxItems.

> +
> +  clock-names:
> +    minItems: 1

Drop entire property, not useful without descriptive name.

> +
> +  resets:
> +    minItems: 1

instead maxItems.

> +
> +  reset-names:
> +    minItems: 1

Drop entire property, not useful without descriptive name.

> +
>    dr_mode:
>      enum: [host, otg, peripheral]
>  

Best regards,
Krzysztof

