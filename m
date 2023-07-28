Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEED0766C08
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 13:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236308AbjG1LsX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 07:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236310AbjG1LsU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 07:48:20 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4240B3C38
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 04:48:17 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98e39784a85so701271366b.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690544895; x=1691149695;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OuzUyywHxT84EL99s/bvwXYrYcfjNmcsDh9sDx8tOW0=;
        b=mD9j05W91EisOUuFMiWr/AiUJLILh/ARnNVvyMNOB4nHCrxhYMTXwCNiSE7cGf+4JO
         M2GuQI4Uh4kKMTXSB1u/4k2WS5ut3NfxGfC68aoTWT1DWL5oFThepmJg84h5G8febWNg
         0Uobzl8dWM48vd+rHuR7Uk7bZtM2vZHPuEBFKQ/8aweaa8vF61xfTXwphRmEY4Pl/u4a
         nJDCmiHwuLcoMQdjVznZIfjYysRCor+g0ak3MBejxuqpQgnmiSzssGOEOIHoZVuionem
         G60vIK9vD/64mXZlzukSmuUEHyyCdqPeV9Kn72biGcFoyehHq+1vxBEpu5/qh6lIpN8B
         btzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690544895; x=1691149695;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OuzUyywHxT84EL99s/bvwXYrYcfjNmcsDh9sDx8tOW0=;
        b=FcUt8ltrpfKg3/jR7OhCdD4BNNss39bhiZHDR9XpztL2bLUZsQPS8ndineRevXRM13
         MUNkiDOeItXTYvDebvcoo2/ICFv1CRXEe5xUqC1EW0tU7oOrFdKQoaU6nAz9OrOiu28z
         zh/3kUWT8RmobWfCYLzxD9nbHqSnSfetoO3Q4AGuBng/vWiX0/kLftwosiNhi+2v67j0
         0uFG8Rl/9rmgQ8XtVY6T1xPkkxEvxnVOYGPtIC6q9lSivYnKoz8rX9pHBxI36eL605P0
         1ofoXQkCU3F1E7Lp4FRXbWYaGzgne3LMd7hghIBhYyQ23a88RQEGIDrDpHH436apvZAR
         wDYg==
X-Gm-Message-State: ABy/qLaaiWOnxEULJMlN3nMfjnd+mdJ5eyFvaNRD2Y2MnXpSfjRl8OcK
        TRFQYHXxF/eQhN1s4cmtaW0O0A==
X-Google-Smtp-Source: APBJJlFN40fawfB2fPkyvs17Fx56bmLcdHZCsN5xZrwBk3BeuyDYH1/Jc5kIbpeFt4dhtEVuMqjwVw==
X-Received: by 2002:a17:907:c0f:b0:99b:56d4:82bb with SMTP id ga15-20020a1709070c0f00b0099b56d482bbmr6567885ejc.6.1690544895724;
        Fri, 28 Jul 2023 04:48:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id se27-20020a170906ce5b00b00992d122af63sm1980122ejb.89.2023.07.28.04.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:48:15 -0700 (PDT)
Message-ID: <60a915aa-520a-b275-cc7f-9a409610181b@linaro.org>
Date:   Fri, 28 Jul 2023 13:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 32/50] dt-bindings: usb: ehci: Add sam9x7
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230728102836.266918-1-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102836.266918-1-varshini.rajendran@microchip.com>
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
> Document sam9x7 compatible for usb-ehci.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> index e5c8f4e085de..afc4da89dde5 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -82,6 +82,12 @@ properties:
>            - nuvoton,npcm845-ehci
>            - ti,ehci-omap
>            - usb-ehci
> +      - items:
> +          - enum:
> +              - microchip,sam9x7-ehci
> +          - enum:
> +              - atmel,at91sam9g45-ehci

Same problem.

Best regards,
Krzysztof

