Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44D90718B11
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 22:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbjEaUXu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 16:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjEaUXt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 16:23:49 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFBD126
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 13:23:47 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96f9cfa7eddso1042569466b.2
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 13:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685564626; x=1688156626;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WoA429uBHsqE72Bl0zQUUozB1UEGxVybsnvTmOvszI=;
        b=RMRhA2UKUeqGMd2ieRdFlsKBONeO9YwhQZKN8ga/pPbZDZbfIz0TWSVLxwRwulZ0Rh
         kONrDOvSNRmMLvV3ZsYn/WnNpXosBc0tTCeAr7nQO9RlR5cJJPRSHrY/lJ7sIZFk0u5s
         KJD7VplyVbguV+JaPlOUqaLs/l2OyoL+1qg6JRKtBTrRwbS925UgHF7ZhStgnpkf8q0w
         Cznlf6BaRi4INkJ+w5NIQIj2jAbGe9yG5YpOt32n6nnp/zXknRWw9fzD5m7jRRvHPOc9
         TBUST9vTMBsk73HS8B0Ttrl9E06TgLyuaUTBlVj//8J42KNKUWjIHc7DH0cedjfRCJBl
         rnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685564626; x=1688156626;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WoA429uBHsqE72Bl0zQUUozB1UEGxVybsnvTmOvszI=;
        b=XBy5cO8rGROG9rd7jHV+cIqXcaczhDIZVKZeUyePcgzs2ajGgO00czPsxU4QpufwZ5
         48ls4ugKG6QX2ORniru5fPBwhnACpzRAS9ZLQrp/KAaB5BMdYOXRX8HtbiOFqADAIjSM
         ExtBFQYyWYJJKXlrYgvxnmMiXYe5cbwLeaJ6+hGPaU2lMV1cbp5AvcrTuoBUy1MIvzMK
         S/Mcm8w4my0WpuBvzLtYPjuBONV7UwiLmKMm9HKlE4FAXXCErWkervpQG4mqv6vOfw5F
         hVUG6UbfIBYIdQmhRml0xJk0/yEPZf2SgwJITgIYcvlxFmlWIm9/sn0YVERVC+NHYgDC
         jHaQ==
X-Gm-Message-State: AC+VfDw79QfJi6DC21XLK8LGVy1ObZytsB4d0BtMhiKqafeU7DUHvEDu
        ltL+ORXCziUlkfyrDjKdNdPs8Q==
X-Google-Smtp-Source: ACHHUZ6K7iEXKLx1j42PtldbQ+1OBmxdk5gXvdN7DJAoB1oBzbxoOOau5N+VcrUXRSCVks1QgehjMw==
X-Received: by 2002:a17:907:7f8c:b0:96f:a0ee:113c with SMTP id qk12-20020a1709077f8c00b0096fa0ee113cmr7447073ejc.19.1685564626382;
        Wed, 31 May 2023 13:23:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id f19-20020a170906139300b0095fd0462695sm9437456ejc.5.2023.05.31.13.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 13:23:45 -0700 (PDT)
Message-ID: <88d41769-ebfa-5d79-3a0f-0b33241c9295@linaro.org>
Date:   Wed, 31 May 2023 22:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: usb: xilinx: Replace Manish by Piyush
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
        piyush.mehta@amd.com
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
References: <504444f5c2f4e725ac39cba1d72032d5a00c7cda.1684828805.git.michal.simek@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <504444f5c2f4e725ac39cba1d72032d5a00c7cda.1684828805.git.michal.simek@amd.com>
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

On 23/05/2023 10:00, Michal Simek wrote:
> Manish no longer works for AMD/Xilinx and there is also no activity from
> him. That's why proposing Piyush as the best candidate instead.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

