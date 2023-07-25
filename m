Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943AB7610FE
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jul 2023 12:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbjGYKfj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jul 2023 06:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233440AbjGYKfi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 06:35:38 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2039C131
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 03:35:36 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9924ac01f98so913865466b.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690281334; x=1690886134;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRSCjzoFlf7+1pwK2274OEG2qCHzv1zVFI3OEYWB7Ic=;
        b=L1ESNfLDThRmEQmyq3QCUnymgcDRa9+iMV1l0gch6YrnemwC+/tkPL+B7TmaO6Pvh/
         5cd2FDEeuJQZIe2/kkjbqTU/2w1ChrWHkTx17VDsvmmaxwtSdMzHv8SdYlfffCAvLpL4
         cxK4SgaE4gUXapWGotW0u05hBwCqeOqqr8mV/isGLZ2NC/QJ4mKTs+EXHZhceS3HCwfT
         KQMmYBIfazv7GjgIue973VYyYpM1JrkbDjTTwfSc0+9WUkdHDR41tItjmPoQ3FzHg+V+
         74mH8j3bp0zDZxr+Vu30SMhl4s8eMqlBL9R681gqSTTacMQzTHLLYslGKHjsMmBwrSGi
         BRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690281334; x=1690886134;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRSCjzoFlf7+1pwK2274OEG2qCHzv1zVFI3OEYWB7Ic=;
        b=Vazms8H68pW0RzU0Ii3vbABrhz1StPziSnZ3IniwW4SM7hDomAmSFJoF92FVjdUoXC
         Y17JCccWcfCM0etYVKklC8iqloyR0Xuasmm0J7eIwn9p2stcKMMUUi7hQAeIHuQiF1jg
         JSRwyHEOf3ZBh8HCvHogesanztarHdwAcMGZ/41ik9EtcvqhV1QtUQZ/2RDgwdPeIRQg
         y5pNOJMRVXYn9+mY5a5wWNnclak0qt4y94GTxqXs3mib4g5fN9rMYfLOYo67/BHHSlBT
         F4/7LmpTGz/AikPUvD26/HVeWrSFY20TUcyVnAjnEcN+hseAsVhoB5+iqucFTtAYid2Q
         /p6A==
X-Gm-Message-State: ABy/qLY0j21Slg3HrV+kGzuE4z2M6T7qs3THUfxMzXBXfYHZ7pC28YlH
        NGhEoqwcgcP94RyKX2f0ONag4Q==
X-Google-Smtp-Source: APBJJlEeAYXZil/XyuB5ylTiwIPKbvsDFmDdl0tv2VrAlD7DtAQVb1lRFLJxpnumFOyiReYDJEeKFg==
X-Received: by 2002:a17:906:cc0e:b0:99b:465c:fb9f with SMTP id ml14-20020a170906cc0e00b0099b465cfb9fmr12834886ejb.8.1690281334516;
        Tue, 25 Jul 2023 03:35:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id dt19-20020a170906b79300b0098242730348sm8090252ejb.72.2023.07.25.03.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:35:28 -0700 (PDT)
Message-ID: <00980fa2-5f8c-d616-ef3f-957090c25d48@linaro.org>
Date:   Tue, 25 Jul 2023 12:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] dt-bindings: usb: connector: disallow additional
 properties
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Prashant Malani <pmalani@chromium.org>,
        Wayne Chang <waynec@nvidia.com>, devicetree@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/07/2023 12:23, Krzysztof Kozlowski wrote:
> USB connector bindings is complete, thus no additional properties should
> be allowed.  Add missing 'reg' property and change additionalProperties
> to false, so the schema will check for anything not unexpected.  This

An MIT linguistics professor was lecturing his class the other day. "In
English," he said, "a double negative forms a positive. However, in some
languages, such as Polish, a double negative remains a negative. But
there isn't a single language, not one, in which a double positive can
express a negative."

A voice from the back of the room piped up, "Yeah, right."

Obviously:
"... will check for anything unexpected".


> also allows to drop the 'reg' from other bindings referencing the
> usb-connector.yaml and make it required.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Best regards,
Krzysztof

