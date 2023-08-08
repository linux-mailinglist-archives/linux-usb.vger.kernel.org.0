Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71D3077412D
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 19:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234108AbjHHRPp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 13:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234196AbjHHRPK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 13:15:10 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8417C6BD15
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:06:15 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so48655775e9.3
        for <linux-usb@vger.kernel.org>; Tue, 08 Aug 2023 09:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510774; x=1692115574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Go6XT9Xkscl41fZ/aEq4wJ8QEtBrmQLK5ZjjJvK6FoU=;
        b=p9b5+hGE2/AbeSYNBjrMGMxHswW5vX2S9elo/jVQnzvMadroKhj6i0Gx9GjxvwPBZm
         zlP1fU5QEx7kO2oyfW+2dF3ZD0/P31YRnV9K2X2zbBPaLYDvoTPHmV8uLucYGNGbkoSY
         lApHg8PkbE9Jk2ClXAXGPLcABCg/4Ir6Hz8E9+WiLRBFOg9DCIOIcGG+y5WRbrAgbhQp
         EnnDdmf5YbvIbYWNgvw1qPPiOUSsM+Im5mA6SAR9obAo0wUvD4TzpPoiHu3j8+qiWtHA
         47CdCvv4NW+m81dBaFrW/w7TDZLb3UlfvEcR7P106IwKr0zM5AWF3euwDo7oX5xKvlox
         0OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510774; x=1692115574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Go6XT9Xkscl41fZ/aEq4wJ8QEtBrmQLK5ZjjJvK6FoU=;
        b=SQnsPV1qdASv9My1CBdBokZLqEWjrkgqtNCR8z8mVIacUAOZ2M1BjhnUnGjIXRegbY
         456wXkt9Wm1YuEFU4yTfak1SikGZvpqPiyOwduFchjfYwk43qAOzGVtAL23ZzKbP+i21
         JNzRQT8ONxYODlDL0MvAh73LP6VG3oKuOA/ZrI2niKpPx2oO++N0GWWJBZgb/ozU2dCQ
         J3kMdRz/FwmfiMMpgT83m0Ap10HVmk3QDSDkqHNmwt2h2NyC2/2vmoa4InzZouB9/1w6
         Mu+2AOG5FwDmNZVYSCJAmGXhV5BsUxytB/n4MOpcWkJAY3WqUKd86PbigTlGv+3nhE16
         m78Q==
X-Gm-Message-State: AOJu0YzyFxWEFVu1Fd/oWPG+etY2Q+oVVtgRSkmNflOaVA6xA4xMf3uY
        hcQSDzqtuNN9vS7IJK/V/Q/H1ZGwsuYvdklI3f8=
X-Google-Smtp-Source: AGHT+IHyamondwf86gYopYCiGXf9C3pe+fwNo5AweauN2G6KAu88O/9463pYl6fAJQL0APVu83+16A==
X-Received: by 2002:a7b:c5cc:0:b0:3fe:785:abf9 with SMTP id n12-20020a7bc5cc000000b003fe0785abf9mr9253537wmk.2.1691489859599;
        Tue, 08 Aug 2023 03:17:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id v3-20020a05600c214300b003fe407ca05bsm14651226wml.37.2023.08.08.03.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 03:17:39 -0700 (PDT)
Message-ID: <258045bb-b84e-3811-65a3-20ede71118d3@linaro.org>
Date:   Tue, 8 Aug 2023 12:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: add device for Genesys Logic hub
 gl3510
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Da Xue <da@libre.computer>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230808100746.391365-1-jbrunet@baylibre.com>
 <20230808100746.391365-2-jbrunet@baylibre.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808100746.391365-2-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/08/2023 12:07, Jerome Brunet wrote:
> Add gl3510 USB 3 root hub device id
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

