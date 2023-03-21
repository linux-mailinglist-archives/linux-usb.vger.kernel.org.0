Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC8056C2B49
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 08:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjCUHU5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 03:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjCUHUz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 03:20:55 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C26E18AB1
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 00:20:52 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id cy23so55834403edb.12
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679383251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=G6ekUazE6TcVZTpMdj9FhFeFggQPVT2VFUWaVtSaXIXTASqF++fMNxdF9KK8E6jaSL
         ZxuQCYzENQ9eYwWdylaKVB8cU5qUsu4R5sIwD0IIrNZX+Oo0AX814EHrHOZ4nB7WYMax
         YUWo1MqBTLRXOMVVr9tYCNrgu923Xrw6URPxwNxkAEkDp7epE2F8hgxV4cZiji7lOREJ
         niygwQoFXhUPEUDsSetV6Edn47C9sgSWqXDTI3Dz/fCXVRaHBilN6IPoShYT9gKzSq2h
         v+dykiWM/hzx+RdJMIfdogOBRMX12snNrk7GfqZ43S8HyiNmdwkPfVFwvscVb/2iLiXG
         aCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679383251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=T+a2oGll86cy8vJ+gsQ8YgXhDma+JVM6RYu8zOtUpbNnH2eDCTdmPn2oRTpJWlHQGq
         leaZBvf8eb0tBYQWl85dnhcq2mkFT/GQTPaOEry5b7YKKf41QgIHk1xvjCkbl3RQAJjk
         dAl92sZX9EHGphQjyzU/2CSVGNvy8K/iz7Y5gCZDKT4E4xo8hXHcK/EAhfPkX6n5fDLD
         UTb27WJuR6d4YYAjZmZjp/7aTMQV69EdWVybrPu1GZe+0Oqv+5tthHCh5hNVJL5FasJd
         SUxvPsnGAt9kqola4fF7Z1G/QiRicqyIjvnFHJieuSW6k0ScMrWD/kK8LW4KM3sFGwjh
         UxmQ==
X-Gm-Message-State: AO0yUKU+kDuvuHtLIUErODLnyjhyTaVzvA/cprAlNANMbtftCTVNpK3F
        XCPzXrnAJOvzwR0/oTXntqaM0Q==
X-Google-Smtp-Source: AK7set9ajV2h8MoJNZmNzFZ4RL5J57SDG8cMw8WnAC78cNBMYl3mTmrve+NyaqmHOj1gJroxcZnYrQ==
X-Received: by 2002:a17:906:607:b0:932:be78:a728 with SMTP id s7-20020a170906060700b00932be78a728mr1688168ejb.68.1679383251026;
        Tue, 21 Mar 2023 00:20:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id qn17-20020a170907211100b0093048a8bd31sm5385926ejb.68.2023.03.21.00.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 00:20:50 -0700 (PDT)
Message-ID: <cc45efa0-e2c6-525a-e3f3-7f87e8762e2e@linaro.org>
Date:   Tue, 21 Mar 2023 08:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: usb: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Al Cooper <alcooperx@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20230320233904.2920197-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233904.2920197-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/03/2023 00:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

