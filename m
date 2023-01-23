Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E77167854D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 19:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbjAWSwz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 13:52:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjAWSwv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 13:52:51 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08192C65F
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 10:52:46 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso11293943wmc.4
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2cQoEb75EczKKjAWZYjz35p/GfaCp/uIVzj7rfHuXk=;
        b=XpG4yI3/+KzK/651AVNtQXF87SFqCv1BdZOVTWxCyvnrqmLbAjPrgKR+g9KZCHxmwP
         5hA3Rex9rTzQcVLyxyhmT/r5+97QWNHcMbdAO6vNUNyGCiSKApgKASAYT8+2qhBWhPw/
         hFytiZqMYyzkz+zUTebHScKj0hOoa8p9eNVsDrNu0V708RlYF6nHdX3s92uaTAn+gI9b
         hiniRGrVYil/QLPWoXnuIsP72DwIecqwbDFcaIhgFq3k3Trohb6m9T9HBotVrrYCfSeX
         cTfDt8omtqQIlRJI08xFo4saKDNIZy/IEX27ZG/HrObQePeqLgmNpuukPZmI9VdAzOKM
         mIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2cQoEb75EczKKjAWZYjz35p/GfaCp/uIVzj7rfHuXk=;
        b=QB8IUm8KF2hLJlUoWyZtJrZeO5DaGQ2oXWpMufJuvmxQcyk8t09lH+jpGDxt38q/fl
         TRf6ufMd6auWY5RkAQNtolO+qD1yb2kGpUrifnGGZHfCsOKrN6srcpUvQXjKvWWS9q1N
         fGiRQB6Iq3HMM+1rQjTlbJ1CM9Xg/x+p07+3QrEPlpHL6X4wBOJjjfcH3k+AzxcXSnN5
         uAd6wfIorRWWHtyBh1d9vKKTpme6gJDJl04EN4aVLFkNQ6HxwzRr9nO6b1QD/2z1JIAT
         3dUTPIcMDSOBWRondgtL75H8Vlg3MIGqIPh0wzBrElwkwRw7Nb+Z4CVGxa61JeBoPxz0
         jcAw==
X-Gm-Message-State: AFqh2komSTY3hjNJhpAVkp49kHaA2IfGdODXujpt+qTkfuTykGReVPpU
        lRKPapj1qHR6SfLTtWdX2KZrZg==
X-Google-Smtp-Source: AMrXdXsjZJWtWk61ODR4rKw5oKMzXA5JdwT6IU1QwVh5Rfk+vxs//732Udxrc+zaRJ/w1+a/X2T5ow==
X-Received: by 2002:a05:600c:4d81:b0:3d0:6c60:b4d1 with SMTP id v1-20020a05600c4d8100b003d06c60b4d1mr26206864wmp.6.1674499965361;
        Mon, 23 Jan 2023 10:52:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p1-20020a1c7401000000b003b3307fb98fsm11165968wmc.24.2023.01.23.10.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 10:52:44 -0800 (PST)
Message-ID: <b3f563e3-6ecf-75b8-0978-d00358bb8ac2@linaro.org>
Date:   Mon, 23 Jan 2023 19:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v8 7/9] dt-bindings: timer: mediatek,mtk-timer: add MT8365
 SoC bindings
Content-Language: en-US
To:     =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
        maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, gregkh@linuxfoundation.org,
        daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com,
        angelogioacchino.delregno@collabora.com,
        allen-kh.cheng@mediatek.com, nfraprado@collabora.com,
        andrew@lunn.ch, gtk3@inbox.ru, sean.wang@mediatek.com,
        zhiyong.tao@mediatek.com
References: <20230123163833.1007181-1-bero@baylibre.com>
 <20230123163833.1007181-8-bero@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123163833.1007181-8-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23/01/2023 17:38, Bernhard Rosenkränzer wrote:
> Add binding description for mediatek,mt8365-systimer
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

