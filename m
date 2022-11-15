Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815AF629608
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 11:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiKOKgT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 05:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiKOKgA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 05:36:00 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B1B26120
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 02:35:59 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p8so23742833lfu.11
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 02:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4UHGwxwnt4Cc6rH/RttAuD4Amllt6tSRn4Nm+z5DoY=;
        b=cHznuR12/gE+BOW9xg+YW6XmVqpxjnb7ke+DgJambMA+vmlrRniD9930zKDtQqbU2J
         kUOQyUJlwr7OD8BjraGTuVh6KtB+gTEcR5HtvL1IXj8QgZqfdQ+W1pxgaIrpL34yYAYg
         zYqLIfgIFhhKzGDkFHVM2ak5CmtSuJi6KDD7FESP/tjDdhujuCcdowIoi+SMbRPGCOR1
         l2Qu/Br1aZOwvbRod0u3n8ilsRdj/oOyLwkMwxNqGeyfKkFJqrO0egNs0zOidZg+DYNU
         rNXlcBux6uvsa58FeOns9tK1MWVapp3zx0dxr8ZuaG9juGNM4Je796d3jQhEfjcCO/vy
         +sbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4UHGwxwnt4Cc6rH/RttAuD4Amllt6tSRn4Nm+z5DoY=;
        b=nOdqISuUKO66uLppvwnwq4ocnz7ijdGF4E/TxfCkOYl4CJ/80WpyCaTA9Xlv8YkYVa
         dUTWFUG+tjo+u/FJJsR3unbSp6lWA52jT+mKF0rBHUVOmLckc+rSCURjq+7k1NRZdIdI
         D+aAOkYenr4CknC/j3D0pxX41wtvdBAaYUcX8Wrcso7v4GV8NMG2NhdhkD1poC1iA4qE
         gCvc3hTNU7aEeOuYoWvGeZQcvoKaYpg+G7q4GlsSyeMQKaDaiugoeFhuuaj1xRxTOyuv
         yiJnoBkUiOKgcKiA2Ud+eNzgiEgTrjWeNVGySu+hjRtMorobTwr8ES+lnWdF/KV7i9fN
         vANQ==
X-Gm-Message-State: ANoB5pmN+mwfdD9MPFpzYk/cuq+2jSv0oXhBBtaFqxNng2Ii7KqWsGsR
        KZa5YEYgAoRan+ZiuYiNO5Djk2TM2QE8jsE7
X-Google-Smtp-Source: AA0mqf5BL3d+Gx9BcXZAHwX3sxhZR5kOKFTc3DJNBiRO1IsIjv+y+PQZA406NjuyI+8pDf/3Vvi6Gg==
X-Received: by 2002:a05:6512:12c4:b0:4a2:4df9:4cab with SMTP id p4-20020a05651212c400b004a24df94cabmr5600420lfg.56.1668508557768;
        Tue, 15 Nov 2022 02:35:57 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512070b00b004a46a9cebe2sm2152572lfs.289.2022.11.15.02.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 02:35:57 -0800 (PST)
Message-ID: <c21e0e3d-5970-d905-3b6f-54a1ddacd052@linaro.org>
Date:   Tue, 15 Nov 2022 11:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] MAINTAINERS: rectify entry for MICROCHIP USB251XB DRIVER
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Marek Vasut <marex@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Richard Leitner <richard.leitner@skidata.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221115103153.28502-1-lukas.bulwahn@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115103153.28502-1-lukas.bulwahn@gmail.com>
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

On 15/11/2022 11:31, Lukas Bulwahn wrote:
> Commit fff61d4ccf3d ("dt-bindings: usb: usb251xb: Convert to YAML schema")
> converts usb251xb.txt to usb251xb.yaml, but misses to adjust its reference
> in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> Repair this file reference in MICROCHIP USB251XB DRIVER.
> 
You know this could be just one sentence (instead of three paragraphs)
with a Fixes tag...

Best regards,
Krzysztof

