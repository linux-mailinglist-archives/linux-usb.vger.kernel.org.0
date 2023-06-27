Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6714173F73C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 10:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjF0I3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 04:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbjF0I3P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 04:29:15 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB932D49
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 01:28:27 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fa94ea1caaso17964575e9.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 01:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687854505; x=1690446505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYisvyfd+rF4H58wJe4eQFLmEyiMEUswId3Wk9c1n3Y=;
        b=wH7eTy9awNOzwL5utRtT3C5wEiMycWy0sEiaOMdHrzNDJto8y9YfPlQJSrQehR/IlK
         r4uMh/ndv62GDY36Dge7xUrBV7ZozorvsfuGEDaXtYg+uRhfYrVZGtybNoSqh2Ln88CW
         dTkqiZ3BaPG19VU6sLUAhdede4DquVamESgRPAZnQnd5kN6TCb3gp1JrdnovbKxeqcT6
         ocoJ30rCOYa0E9o+yvzAlDAfTKlR69TaT8yRVPix6hXriXj/Yr4bDyNcMQDz8DUd9fbf
         knmU51SJoZ7B3LGjK3Bi/WmXwMItT/h0C2Pbai4asAVNn294qfUP7mCQzsynsubWQoHg
         u2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854505; x=1690446505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYisvyfd+rF4H58wJe4eQFLmEyiMEUswId3Wk9c1n3Y=;
        b=IYMrNGW6GSzWvkAlsFme8imF9E57nbz3nqPmI+9kM9sU1wKi1DyZlFtAMYai09yp4m
         BfrvTgjQ0ztgyhvm1zte1pSoLwDwOI0vgYkY2SfnHMRSP3MnW5QaIL/j9M5YXViZc+ki
         CtXuKa4h0Ihs/siRhxzN9WhnlQBUd/wfgLYnUWaelEjZTaL3lLwq0rFvvjwUUvbS8eiH
         +SErrBbK0SVwqE+5QQVSplESQC0DFko2/EGsjf7WI8mvdJB9Nc12jsPFXiQKlHwdm34O
         1CYgaeiSHpCXeBEklWAaCSGOBFMRpqGFY+J1HLzZN0N+LbPLCbY/NBLQHFfQLg8HIP73
         C1gg==
X-Gm-Message-State: AC+VfDyVd7aUFbd4Ni1Xd6lT1wt82yS9PcKdH/J/IkQ7gHUSW3Knq82C
        WdeAmFe8CX1Stw/fPjmiW5hK0A==
X-Google-Smtp-Source: ACHHUZ5nvEEEqnMcktYAI6is2hSR9HD1+QyfTyrqMOqlGkEkZjtq0427Hllsu2wMsfSR5lT62fh2lw==
X-Received: by 2002:a7b:c5d7:0:b0:3f9:fd12:a8b0 with SMTP id n23-20020a7bc5d7000000b003f9fd12a8b0mr12919290wmk.20.1687854505552;
        Tue, 27 Jun 2023 01:28:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c210600b003fafe32c8f6sm3766671wml.10.2023.06.27.01.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 01:28:25 -0700 (PDT)
Message-ID: <5c384322-5321-f3c5-f0c5-0558c344eef5@linaro.org>
Date:   Tue, 27 Jun 2023 10:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 4/5] dt-bindings: phy: realtek: Add the doc about the
 Realtek SoC USB 2.0 PHY
Content-Language: en-US
To:     Stanley Chang <stanley_chang@realtek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Douglas Anderson <dianders@chromium.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Ray Chi <raychi@google.com>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230627082022.22902-1-stanley_chang@realtek.com>
 <20230627082022.22902-4-stanley_chang@realtek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230627082022.22902-4-stanley_chang@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/06/2023 10:20, Stanley Chang wrote:
> Add the documentation explain the property about Realtek USB PHY driver.
> 
> Realtek DHC (digital home center) RTD SoCs support DWC3 XHCI USB
> controller. Added the driver to drive the USB 2.0 PHY transceivers.
> 
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
> ---
> v4 to v5 change:
>     1. Add more examples.

Not more examples. Just give one or two relevant examples.

>     2. Remove the compatible realtek,usb2phy.
>     3. Revise the descriptor of the property.
>     4. Add the default of the property.

...


> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usb_port0_usb2phy: usb-phy@13214 {

Drop also the labels.

> +        compatible = "realtek,rtd1319d-usb2phy";
> +        reg = <0x13214 0x4>, <0x28280 0x4>;
> +        #phy-cells = <0>;
> +        nvmem-cells = <&otp_usb_port0_dc_cal>, <&otp_usb_port0_dc_dis>;
> +        nvmem-cell-names = "usb-dc-cal", "usb-dc-dis";
> +
> +        realtek,driving-level = <0xe>;

Why keeping this example? I asked to grow it and instead there are two
more. Just keep one describing as much as possible. Second is useful if
you have there different properties.

Your third is almost the same as second, so no need for it at all.

Best regards,
Krzysztof

