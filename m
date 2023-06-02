Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F6072047F
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235566AbjFBOai (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbjFBOah (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:30:37 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51079F
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:30:35 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-97392066d04so301657866b.3
        for <linux-usb@vger.kernel.org>; Fri, 02 Jun 2023 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685716234; x=1688308234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iz3EiuLQkvt9izfvyoQpEiizvgQ9e4YlnvOx76NrFwY=;
        b=ZWtKC8AqHPXLEz2K6eOmqn1usR4MgPYMh+M829yTormlDAG8mLuISRYI4M0iFTZIfd
         xKTpdsH86YF1yY+bj3Yp0CVfEuggC2DiJ3Vtpvx5CenKr37GkQqhiqw27z85/AtDMM0S
         PfrFXsTu5Ory1tZDYcnVNC6jd+x/LyuwcQrFBiPe7iCjvcgh2uiXdFUUvO4pNZ0TnoH6
         IlCc3JL6lRc3I3K12ARHILwvvyRGm1iV1HXuHVGCJULxQFm0SCb4WWLkZ2vXa/5wJvOi
         JmcnlMeWVMlSrT/Ucff/1Rsh6j61d24aq0M67GNuGS8M0rRa34D2iKzx29Tlctqx761c
         AaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685716234; x=1688308234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iz3EiuLQkvt9izfvyoQpEiizvgQ9e4YlnvOx76NrFwY=;
        b=G/tztIDTLrPO733JwqTkNBtE/xt/kyz8GsW+vzuhh26WK7UAAwyfWjJt85/8J+TBeO
         Zbr/fR21/4W9WNySRO9qXT7NSQrliCWD60hQY7RWeshynuD3+FA6GXI6NII3pGh/0C+v
         qDsKLaMtUA7WOD9EIEe204NskOCQ/3BPco6x69fJGRoc9lmW9kYxNyvSg5PCE/Yn4AHe
         wjDWCyJLybJeKcKY4zwLHnmFqfWL6nxNYWF9rorJy3nZNoFerKKzKPjuWTT9xuJ6bv2K
         E0H/gRgYJMNZRVnhssfoPNtpyGCHOobS4kLcipQFhNp+R0bZOAbNmeKW9cwAW5kB8vE4
         v+Pg==
X-Gm-Message-State: AC+VfDwrys9RhE3jeXEHOV1nJZzJ3yVg8muUGLDzUDzxLngQvIztST8M
        TJEviA8jpZmFH85hLXuZssQumY0094kgfCjO90s=
X-Google-Smtp-Source: ACHHUZ4UcaG8arANlfaUOZBVkk1iNwBRIL7OU1zab+ZWua9cjYpORVIfVutSVC0iqeRU+fJ6cll7FQ==
X-Received: by 2002:a17:907:1c22:b0:94b:cd7c:59f4 with SMTP id nc34-20020a1709071c2200b0094bcd7c59f4mr11753218ejc.16.1685716234169;
        Fri, 02 Jun 2023 07:30:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id w21-20020a170906185500b00968db60e070sm820853eje.67.2023.06.02.07.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 07:30:33 -0700 (PDT)
Message-ID: <ac3c1067-8567-78b6-6592-2157461cdeed@linaro.org>
Date:   Fri, 2 Jun 2023 16:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] dt-bindings: usb: add ON Semiconductor nb7vpq904m
 Type-C Linear Redriver bindings
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230601-topic-sm8x50-upstream-redriver-v1-0-6ad21094ff6f@linaro.org>
 <20230601-topic-sm8x50-upstream-redriver-v1-1-6ad21094ff6f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601-topic-sm8x50-upstream-redriver-v1-1-6ad21094ff6f@linaro.org>
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

On 01/06/2023 11:21, Neil Armstrong wrote:
> Document bindings for this ON Semiconductor Type-C USB SuperSpeed
> and DisplayPort ALT Mode Linear Redriver.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


...

> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
> +          handling altmode muxing and orientation switching.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c13 {

If there is going to be resend: i2c


> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

