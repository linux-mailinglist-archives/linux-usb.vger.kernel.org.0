Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E70906F4B03
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 22:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjEBUKL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 16:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjEBUKJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 16:10:09 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A545C1BE5
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 13:10:08 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-958bb7731a9so857231466b.0
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683058207; x=1685650207;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrkwBFguAbANKPkb92jEkKp9+9ycK8gx4NZ9hGUSGSY=;
        b=mqQc6SihWNja/CcPZKDwDck5+pdV+Y3BmQ53O9JbGmLQD63uGzx8KPqgDp5x6uy522
         X0s2lU/rPVVYwpBQsz4zYlRS1kpO/REsm+f/T/KTdbD+qWYxCzV83n7uyGyBdCxHmJIs
         zXVtdmtAhmrhOl2UnbQFTd6L31iPq5cuPERX5htQq/Sf85f0h4uwqc2oFM6yblvowfqa
         9Hz8FfsuITZiS0ibTLuykT2dU/4rX6NUfrqvnW2UZr9/Z7Yj2xIPh/Vb1NMPTbcAs24C
         gINb3Uo2rGp6pgWGyFiN32p8JQjOmw1tPf9E2QqwQQl/PZ7hLUvt3noViSMEX6KucAnE
         YKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683058207; x=1685650207;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrkwBFguAbANKPkb92jEkKp9+9ycK8gx4NZ9hGUSGSY=;
        b=aFLLLJJozGeS41PevIeByztw2lF1pwigndTUeYxujC7vyusI9A/CNwQdm7vHTY0SgB
         rOd3MFamG5yDfuwWR7eQ82ybGwy4nEgfuZXTh+SWIoiuAfQvlQHNtm1JixzhVrX4xcyI
         /oTXAszEwkcePAZ0P5RoZtXh3j9N0e56sBXRYW9FOn/RZrZfiFPl7DyZ8B3jd1u9fUq/
         n4npzbZiOHuERLX0df9luf3R3agIWey+OygEEDAHPmQXcoNQNWwwGFmzYg58iMAHI3P8
         PQpAfrHHlwPds1gTn64/sN5qrUGe047q97KNqvyx1hXVNyVVNZYz3Ozf0OJWJSLC0FzW
         V9Vw==
X-Gm-Message-State: AC+VfDyU9eKZIRndDw75dWmtNKJYRao+6VWHj7t/kEsEJVXtzZHdVEiM
        qNWYLrZr9kLfWYBuMfVY9UE04A==
X-Google-Smtp-Source: ACHHUZ7zECZ2pF61UvoVQHbwGavK/W0U/U0D6d4F+vmFcyV9bCmuiX8I9x+CGfE7E8oFUZgMZ9Fs6A==
X-Received: by 2002:a17:906:eec8:b0:94a:58a5:2300 with SMTP id wu8-20020a170906eec800b0094a58a52300mr1070369ejb.27.1683058206988;
        Tue, 02 May 2023 13:10:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:37be:eda5:e303:19e0? ([2a02:810d:15c0:828:37be:eda5:e303:19e0])
        by smtp.gmail.com with ESMTPSA id tl18-20020a170907c31200b0095ed3befbedsm9405106ejc.54.2023.05.02.13.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 13:10:06 -0700 (PDT)
Message-ID: <c2b7fce9-0ca4-31ed-b851-cc415984add5@linaro.org>
Date:   Tue, 2 May 2023 22:10:05 +0200
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

s/. Add/, add/
(although still weird sentence)

> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 12 ++++++++++++

Also update the example or any in-tree DTS. Why existing users do not
need it? Aren't you duplicating clocks with wrapping node?

Best regards,
Krzysztof

