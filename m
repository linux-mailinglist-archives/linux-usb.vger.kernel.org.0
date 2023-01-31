Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51BC7683303
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 17:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjAaQtt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 11:49:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjAaQto (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 11:49:44 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9012BEF0
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 08:49:42 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id m7so14807417wru.8
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSEGD/xtm60wXblc08WxZnGDiXJW2nRLYVCmhXmbvbU=;
        b=sI6MVev051pwPuQouBouY5CRhRalEeyBc2HL3Oenf9AMJkJiruJWCxtQEUpfN0TXsy
         4AdXKyBWpql5XCFfT2FHoB8t+KmHaob7Z4DamBo1nOJWzfsyJiwPZRjIfDNq1X2fqqUS
         5IpFfIVNRtJxIqaXHGDrx2OEQwwB1uJxLDcOpg1J9X1IzgzH9gLxDKnVik1lTrE5LxR4
         tgJt4DK6d+HTmxPx35PZSArq1gbHRvbdwxzG3OvDBm8ld8evbwpmbSshxYu2EeoZ6MHd
         TIvT8p0KQaAtNo1GSBkvSmkBG0A3CtBexJK5CSDEpF5VbNrbcLncsvHtJGa8kwC46ce/
         1jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSEGD/xtm60wXblc08WxZnGDiXJW2nRLYVCmhXmbvbU=;
        b=trRfW3gG8VUi740G1wCuEEM4AfQ/m1smgSCUYnn6y67IMbnQBjOweS5QoloTog6Vio
         Orb5H0v2mGTXyyeYNK6TIMKAMGOJSBHGy/9alslTNJEbUQxPolpYJFBdg7+Q/+cBUkeN
         2o8nAoQtR753VgOvDqAe+vlHMKM+6qv60Vb0Ec5NK/FgTc3r53ExKsATVWz8dDbuV5RC
         uNWpOKC/A/DhctRrvR/T+FqtMzRTa/DfRdG4HKOsNKFr1bjTQZlwl8FUkfkv3UYGxGBf
         Sg57C5ok4KqURw9AA3svBf1iR2m4dgKLNKxJUac0RTAuIIic1bi01MAaM1qul6j2YIUB
         eQLw==
X-Gm-Message-State: AO0yUKUT54W2gW+5CbbP/y6pNFi7d7mP4pw9ud5YizK2TWTe3xJbcEpU
        XfEORRcj/sJywap/WhSfbC5H7w==
X-Google-Smtp-Source: AK7set8gCTTdCs4CtmgPn0TiWDEaYi9+OBM5a1Cnbi014YeUlhU/J/O2Aj/AOOfRzYg06BmxtncQwQ==
X-Received: by 2002:a5d:4f06:0:b0:2bf:dbe3:eb9c with SMTP id c6-20020a5d4f06000000b002bfdbe3eb9cmr3291839wru.4.1675183781515;
        Tue, 31 Jan 2023 08:49:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t16-20020adfe450000000b002bbdcd15e44sm14805071wrm.37.2023.01.31.08.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 08:49:41 -0800 (PST)
Message-ID: <a929d517-bbb3-fca2-71cf-6f3870969016@linaro.org>
Date:   Tue, 31 Jan 2023 17:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V9 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
 <20230127151041.65751-2-jonathanh@nvidia.com>
 <be2a9eaa-d049-c249-0c1b-d0eb50b25c3d@linaro.org>
 <9708e6a5-1cde-425a-d463-61d82ccae232@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9708e6a5-1cde-425a-d463-61d82ccae232@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30/01/2023 22:10, Jon Hunter wrote:
> 
> On 28/01/2023 10:29, Krzysztof Kozlowski wrote:
> 
> ...
> 
>>> +    $ref: /schemas/connector/usb-connector.yaml#
>>> +    unevaluatedProperties: false
>>> +    properties:
>>> +      reg:
>>> +        maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>
>> I would assume that at least one connector is required (oneOf: required:).
> 
> 
> I have been looking at this and wondered if we need the 'oneOf' in this 
> case? Shouldn't we just add 'connector@0' to the required properties?
> 
> At first I added ...
> 
> oneOf:
>      - required:
>          - connector@0
>      - required:
>          - connector@1
> 
> But this is not correct, because the above will cause warnings if both 
> connector@0 and connector@1 are present.

Right, then anyOf should do the trick.

Best regards,
Krzysztof

