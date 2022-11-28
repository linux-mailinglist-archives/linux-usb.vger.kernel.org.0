Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED32663A357
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 09:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbiK1IpF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 03:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiK1IpD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 03:45:03 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1306611C19
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 00:45:01 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f13so16233734lfa.6
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 00:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nenci7t4rhCZdpWVoRxbMnQAdlppXCobPbi7wEBQtJY=;
        b=THlpyONNZdQgCWbS1nPUbGlrjy7aLrSQSgr5nxOn94srvrNVV1E9iiBaMWwkdvVPjP
         wfeIT1KR0qdEGzKORsWz4uV/skULyk14PVaH99PblmmW1b2+M7SxwGLl2+FgwvR3XQpw
         Mb6MjJ7rIGPkwbo1ZL99Ah6MJhMFe4qNtEEMkVeWdorV5JFgVIi4Qbqomo7VH5eWWCoi
         tx32qaw0sjUH4cQJuxavrKpOP+Imm4rpTaFAR7YZzqUQBHp5pnZUwwfSjrcSGLBobBdU
         KbWQdBQh+XpT4OItk5xOlklNH17Ln+GSrmxYO4JgOTdkxHz/4pA6MLrr1RVaIO3eL0GY
         sAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nenci7t4rhCZdpWVoRxbMnQAdlppXCobPbi7wEBQtJY=;
        b=AR8IU6YqGlpwthaJb+vBvrrcnRrs1gZ2sCQCRgFIQAswWfj+qRvhK3fP5o5EKDbnrZ
         Ss+zklGXv6WnguB5v4GPFL+pocwSbEQFZdE8QjL6aZacluuGtx3xyOSBWGboGbZURZwU
         abBsciWK/F3JpdJuE+svs2WRFhIq/sYVxOAPYB3Ab4qX66xhTKZZehKnJNTqq0Us6hk0
         YyFrSQRGW2xb0uucxNBwvdX9EpSPRR9EQ/V3BpWzDIqQJUFcCECODmGM5+Gc/jZykNbT
         R3iQB9AEHcTXPuPDFtSDw34+FL3RawWT84/Y6ub5H3lIMeMZKuEv587lkj0QW8MCVUhA
         lebA==
X-Gm-Message-State: ANoB5pmtOQJgP7XYY/K/4GINslP/nZ2YAPV6KKx0lZdwEK4PG4OvOaPp
        NgjjAhAnEj95O/YPU4ffqj6+hw==
X-Google-Smtp-Source: AA0mqf5n4p6pcFE0b6JaosOzLcEa0TroXRfYPjChVw+bV7Typ63sv24F7H3QKzd6B6431QojswjUFw==
X-Received: by 2002:ac2:4bd0:0:b0:4af:ad36:7a85 with SMTP id o16-20020ac24bd0000000b004afad367a85mr16358692lfq.617.1669625098004;
        Mon, 28 Nov 2022 00:44:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bs21-20020a05651c195500b0026c35c4720esm1158464ljb.24.2022.11.28.00.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:44:57 -0800 (PST)
Message-ID: <26577515-0681-60be-17ff-dbceb7b9a083@linaro.org>
Date:   Mon, 28 Nov 2022 09:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] dt-bindings: vendor-prefixes: add Genesys Logic
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
References: <20221127073140.2093897-1-uwu@icenowy.me>
 <20221127073140.2093897-2-uwu@icenowy.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127073140.2093897-2-uwu@icenowy.me>
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

On 27/11/2022 08:31, Icenowy Zheng wrote:
> Genesys Logic, Inc. is a manufacturer for interface chips, especially
> USB hubs.
> 
> https://www.genesyslogic.com.tw/


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

