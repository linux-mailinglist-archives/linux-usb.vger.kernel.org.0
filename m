Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA266402DC
	for <lists+linux-usb@lfdr.de>; Fri,  2 Dec 2022 10:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiLBJDj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Dec 2022 04:03:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbiLBJCz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Dec 2022 04:02:55 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F9354B22
        for <linux-usb@vger.kernel.org>; Fri,  2 Dec 2022 01:02:53 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g12so6451291lfh.3
        for <linux-usb@vger.kernel.org>; Fri, 02 Dec 2022 01:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d357RzDjtKPp3WWfYQH7heJGal+F6FSfSLrUVjGFkq4=;
        b=mqQDCmyQG/5SbngulvRTuzJ+3MSK7nhUjoSr1pO3OsabBxMFkZxkO57kyM54zuuIlB
         KvuYqLNBYLzbVUlhIF1Xq9kJ/6T5lSjKU3IjlcPtmtmiNa8jFtHjtOI3fSz9iaDpi3Jf
         Z837xjUXND20xRlWba3kft1qe4e8wAn+2XlY/diMNcATQayBieQEt0z9pCv/7GK8PzVO
         X4h4rXXG7YuPpG99jceY92wBuxwH3OgCy8hSdkxXayq3uI0MAcLLJa1295zN3js5Y5N4
         i1UOpLtoy0M08qaURXJlaVd/NPxCyq9yRsWjbLcgWzvqJ2oWNO2ZlskojhIVGPbrHO17
         ybzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d357RzDjtKPp3WWfYQH7heJGal+F6FSfSLrUVjGFkq4=;
        b=VCs12W4d4/TcVWCZUSUZSaM3YTCxFdST0XL8SiwUl5FNqH6fPbXgpBb+b7pzvgDACx
         hORWiKnIcRCWHkNBZdcJSsU1HJb07W3Gt/LKUmeecvsP5dHdktCJEquq/TKK9NsoiPmc
         HUuRQ/w4nonm9uDGoaiNK+s0GCvsVFOOJolBZ3F+rgttRtbblRmeqKMuhJM0DPNhmvbq
         Cmc0Vbly9/9XnRtJrAK0cP3XN1Bk8hAnvgb57QLf58IyX9oDZCjJSOqLSpsKdsTvR4zl
         XDlHlMn/4Hb5Uno8XD+p9GKVuyLwfz7JiDtWtkssUW3mP38xbYy/U2ujV9BECASx2rmp
         U0Kg==
X-Gm-Message-State: ANoB5pn7T79O7qfzpDB7nPBtqAm3gVqyFT2+SxeRh38nNx+ObAR1lXcW
        WFK0WaXRVCI5w8Cz/JMKXljI1A==
X-Google-Smtp-Source: AA0mqf6orlGlnS1Quh4XPH1Nz+WLhaE31FI5CTQ7FzMVAJbD5FIAGwSYxFTHdfAgFkxWB1dNmxZ5EQ==
X-Received: by 2002:a05:6512:b8f:b0:4a2:3953:7e43 with SMTP id b15-20020a0565120b8f00b004a239537e43mr18056878lfv.229.1669971772101;
        Fri, 02 Dec 2022 01:02:52 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b6-20020ac25e86000000b004a95d5098f2sm948550lfq.226.2022.12.02.01.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 01:02:51 -0800 (PST)
Message-ID: <b4ddf139-5604-bd04-e309-d7bc15e9d23b@linaro.org>
Date:   Fri, 2 Dec 2022 10:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/6] dt-bindings: usb: Add binding for Genesys Logic
 GL850G hub controller
Content-Language: en-US
To:     Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20221202081647.3183870-1-uwu@icenowy.me>
 <20221202081647.3183870-3-uwu@icenowy.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202081647.3183870-3-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02/12/2022 09:16, Icenowy Zheng wrote:
> The Genesys Logic GL850G is a USB 2.0 Single TT hub controller that
> features 4 downstream ports, an internal 5V-to-3.3V LDO regulator (can
> be bypassed) and an external reset pin.
> 
> Add a device tree binding for its USB protocol part. The internal LDO is
> not covered by this and can just be modelled as a fixed regulator.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> Changes in v2:
> - Misc fixes suggested by Krzysztof, including property descriptions,
>   single-item "items" and fixing the example's gpio property.
> - Fixed $id.
> 
(...)

> +
> +examples:
> +  - |
> +    usb {
> +        dr_mode = "host";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub: hub@1 {
> +            compatible = "usb5e3,608";
> +            reg = <1>;
> +            reset-gpios = <&pio 7 2>;

Use GPIO flags. What did you fix in the example?



Best regards,
Krzysztof

