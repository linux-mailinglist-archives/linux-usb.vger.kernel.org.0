Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A3B6384E7
	for <lists+linux-usb@lfdr.de>; Fri, 25 Nov 2022 09:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiKYIBJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Nov 2022 03:01:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiKYIAx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Nov 2022 03:00:53 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3FA30554
        for <linux-usb@vger.kernel.org>; Fri, 25 Nov 2022 00:00:52 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id be13so5699546lfb.4
        for <linux-usb@vger.kernel.org>; Fri, 25 Nov 2022 00:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+bRkIbss5zipQAYfmEG1otWWm3m3WZIhza+y6Bahr8o=;
        b=sGfn8TkmI9i8hDYhSPtxrhgE9Ta2hjWcuRVfxBsq+wFViSgQThbXHefc5He9zVvod6
         Pin0n6FgG4F6LIZW41SgphvW7G8D91elQxFI2Y1Bsw4MihTCHpsI+RY3CwENvePEcfSO
         qFh0eFkioWbfV6HelKsiLUAOeMeJCa+u6fS+m2XGjdWNOrJtG8wyIYq3Deqc7/FNlzLa
         FMU+AuywRJzy2hiJa1v02aooRuAHDffXgmrc82JRSG8lwMG3GcN81fqteJELIi4ZDHK6
         2ZidDipoOyScEPq6jARLw08OwKjOg4mukZBZe95f9LS7QOZ9onYuaB5rUZoY89gG39tA
         eS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+bRkIbss5zipQAYfmEG1otWWm3m3WZIhza+y6Bahr8o=;
        b=klgi71aQkw+SnMav01RBiNh8fQ9mhO9JxisB6XoaHfG9+oPP7PQ7RdbpzN2/TeRm9N
         7i+py6uDcKVtlHWzSFepKwWaQmKSho4oMTCsqKjSd0sU9eT9BeIaP30coXVbezSPo7gv
         VECwLk1P/XB5HShe+YXKRVRPGOZYV89dfiKvoTnDJU5k4oSeLEVJbBFzWHOwXiVXn55U
         tMLmRxbNrz140eatKJfIR4YAyQb3n1MeXOIiOpEIxSJVP/MM0V4JeWF4+QmJvG2/o6I4
         3NBzU1aWrr6NjVXDE7GDP5bKSH6cL+bfUboB0/x7xJmVazl3ZDiO8yTteQYG1nXTRj9S
         HB+w==
X-Gm-Message-State: ANoB5pk4vosv6iFhpizyQWAEAxSvncXZcUieo50YkOtfpw/vt8Ww+2my
        jIO5yfGrCYjacfHa1pj9BNpmsw==
X-Google-Smtp-Source: AA0mqf4tC0yYx22o080fuOAVsXbq5M6KzNEEE4YG4Rls+xEOywYr+ZZATK5FUXFRtoxeN9OQNqnPtQ==
X-Received: by 2002:a19:9155:0:b0:492:f5b6:2124 with SMTP id y21-20020a199155000000b00492f5b62124mr11548307lfj.369.1669363250409;
        Fri, 25 Nov 2022 00:00:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651220c400b004a4731f75a5sm428893lfr.250.2022.11.25.00.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 00:00:49 -0800 (PST)
Message-ID: <4ffbba83-d23c-59ef-0b01-eeb80ea70219@linaro.org>
Date:   Fri, 25 Nov 2022 09:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: mtu3: add compatible for mt8186
Content-Language: en-US
To:     Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org
References: <20221123135531.23221-1-allen-kh.cheng@mediatek.com>
 <20221123135531.23221-2-allen-kh.cheng@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123135531.23221-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23/11/2022 14:55, Allen-KH Cheng wrote:
> Add a new compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +

Any reason for using different email address than what
get_maintainers.pl prints?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

