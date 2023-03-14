Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1836B8DF2
	for <lists+linux-usb@lfdr.de>; Tue, 14 Mar 2023 09:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjCNI7N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Mar 2023 04:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbjCNI7L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Mar 2023 04:59:11 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F02E87A2B
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 01:59:09 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id cy23so58823848edb.12
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678784347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ts5E2sXV5q4edQqbRirKYvhO74M+RYRaYKodfMUcirQ=;
        b=iicfWPR3lBSHsyCrq40UcWRog8OWEFrzUbTXz9m9SdgjiscGI1iKnif8rFKLdM4fq3
         +Q5iyufNvMZufKCrDDR93yFxYvoUJUOcOhKaqlwgBGKVTwsa8D3hsJoeLFoX8GDw61rN
         3KmfsT9dUKEdSOLFKFpdUc+MsUBo/4YCr/3XMz/vbs6DT5AGRtvebNy0cutDoNMdOJ53
         beCJbASv8ZkvpzViWIqXPc+CQm/8Eb7qZCOPCMzyuYFRFnncgtMVWgbBboO0+hEwA4ku
         HDIlx27qHVQUwN+7dTIxuaMQ4EBp0MVOez1CQay+WqK1aTRFAPW+7MuISABO1XLBX2sO
         hYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678784347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ts5E2sXV5q4edQqbRirKYvhO74M+RYRaYKodfMUcirQ=;
        b=nbvVhIaxzypinkr7gLSoos55Z8nJoLLOSVYjlK9ef1p3NrYUPGW6VMugchrS3Z2pEU
         0mat/tFAQXtrDjINqJx++2I9ibdMOXNqrvsNYiJISd89UDNJafwf+w50V0Bcfb4cjlJB
         dvCImxH7z9j3gvqYu/5cYLBbSiQMszPTjjMrjVFOAloIbPOnK9CAI4y+DqMAQh496DiX
         pztHtTLDcmrTI4J6F340NcqsNEWr0Dn+ULUwiQqNwwdTh4sAT/X1lNbWepSgk/UNAbJK
         qsdTYNT7Q1ZdIqS1gzmgk4PWb1V1Z7fyZTsafvVw72qAzanWFl5uOW2MbVbgAa5aeooo
         PleA==
X-Gm-Message-State: AO0yUKWHKmIv6ZyBYd3nzn//yJfWSLoBKIPESH8nKtgaIkXZ22Jutya+
        VnN9kHesjtTEjXjKUD/kMBqErg==
X-Google-Smtp-Source: AK7set8lPVQtf/O3goUKBQW0LJ3wMGByz1frmbj0AsmC0okH05SeQ67LrbiCtH+SKdv9XJ69QOj1rA==
X-Received: by 2002:a50:fa97:0:b0:4fb:999:e04b with SMTP id w23-20020a50fa97000000b004fb0999e04bmr8145031edr.39.1678784347630;
        Tue, 14 Mar 2023 01:59:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id b3-20020a170906660300b008c16025b318sm819538ejp.155.2023.03.14.01.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 01:59:07 -0700 (PDT)
Message-ID: <f2330802-da0e-f446-e9ac-ce256ba7acaf@linaro.org>
Date:   Tue, 14 Mar 2023 09:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: smsc,usb3503: Add usb3803
Content-Language: en-US
To:     Francesco Dolcini <francesco@dolcini.it>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dongjin Kim <tobetter@gmail.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20230313165039.255579-1-francesco@dolcini.it>
 <20230313165039.255579-2-francesco@dolcini.it>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313165039.255579-2-francesco@dolcini.it>
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

On 13/03/2023 17:50, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Add support for usb3803, compared to usb3503 it uses a regular USB
> connection to upstream instead of HSIC, it has an additional
> low power mode (bypass) and an additional control signal (BYPASS_N).
> 
> In bypass mode the downstream port 3 is connected to the upstream port
> with low switch resistance R_on.
> 
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

