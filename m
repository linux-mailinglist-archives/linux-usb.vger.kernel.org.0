Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 480DA67CA10
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 12:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236303AbjAZLgd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 06:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237282AbjAZLgc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 06:36:32 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAE55A81F
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 03:36:30 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so940079wmq.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 03:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hl/a8BXil34Dd1xmwlklcoeX/6IXUtWITBfuvXQCOXo=;
        b=UxNvHxJMBwh9M4Dtwp7Fvn1E5vPF//Oip1Q4ccpMftVAQhfZE8XwAaZUatATbf4uSh
         OuvkCAyo58p2LmKMIsqYQF7YulYinmWnFtYx/I3ta3s3T+uxJc2KEmS4N8/1jtmyoZYi
         Vhr+obNcrRVaGoCnKKBzZcmKy0iI+MUoXFl2khK01qpPRzupdJKKk+JhjOPMC8oPJhNC
         wEQMoPFcffayl5fq+MAf74pU/7vu+DYFU5wHoYBYFHPuNs5hAg9/x21G28PzkgiOAzoV
         /+UZz25AKpQ7NQOfuMHN2ZMCnyVfZdobYawmsA+x1ykw7TXm8njjZosST5L89oBCVH33
         IDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hl/a8BXil34Dd1xmwlklcoeX/6IXUtWITBfuvXQCOXo=;
        b=p9g92p7g+NRfRGogN7fru6tIOJtRqKTOsfK0/iXDnaVDKW8z2FFmNZTqIeDpsFFdJX
         AF1j1Qk3fMy0rywEB9oDm2JM/0KN9txmhmxQzwSVu4Hn1AbCOlJqLdTC/AxJFI7A7V6f
         iTEoKYiQumE2OIKfeOR9ad1K9foWaJMQuV8h75uVRpwPajZ+ZWCF5sdDm+8oZKzKMtSO
         A8z3GQEh65woRKnOAzsV+wXfbjyfkJ1tDRecyWq6Wxpu77Fogzxxx30ZhC14fLhE/ZSA
         6Bcp2o9G6Q0tE9gweIjj5Fke/0uxDSIqdGbN027sOmgHs7eVectlRxvEQa7zAQZpm8un
         9ZIQ==
X-Gm-Message-State: AFqh2koQZleud0vUOZG8Zf1qRdlTJvOOVbdFsf79dDMa24fvJy68hLdQ
        eczn3ZhMRWX24b4IpKHn740UxQ==
X-Google-Smtp-Source: AMrXdXvSPs5FOKaLoPa9AO/U0s8GP2Wme9+5u2/mv0T/gk3FOCViIO+fX1jSNuS5BRtkpjgFYxkhbg==
X-Received: by 2002:a05:600c:3ca6:b0:3d1:caf1:3f56 with SMTP id bg38-20020a05600c3ca600b003d1caf13f56mr42994645wmb.9.1674732988825;
        Thu, 26 Jan 2023 03:36:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i21-20020a05600c071500b003db1ca20170sm1174394wmn.37.2023.01.26.03.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 03:36:28 -0800 (PST)
Message-ID: <db7646a3-330f-b9cb-161a-ddf31dc679d5@linaro.org>
Date:   Thu, 26 Jan 2023 12:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V8 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
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
References: <20230125204211.63680-1-jonathanh@nvidia.com>
 <20230125204211.63680-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125204211.63680-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/01/2023 21:42, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add the device-tree binding documentation for Cypress cypd4226 dual
> Type-C controller.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

> +
> +  firmware-name:
> +    enum:
> +      - nvidia,gpu
> +      - nvidia,jetson-agx-xavier
> +    description: |
> +      The name of the CCGx firmware built for product series.
> +      should be set one of following:
> +      - "nvidia,gpu" for the NVIDIA RTX product series
> +      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
> +
> +patternProperties:
> +  '^connector@[0-1]+$':
> +    $ref: /schemas/connector/usb-connector.yaml#

No improvements here

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +unevaluatedProperties: false

This goes after required: block

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +

Best regards,
Krzysztof

