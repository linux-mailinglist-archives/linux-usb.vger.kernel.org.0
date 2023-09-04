Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A25C791241
	for <lists+linux-usb@lfdr.de>; Mon,  4 Sep 2023 09:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352455AbjIDHdL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Sep 2023 03:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350962AbjIDHdK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Sep 2023 03:33:10 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD5D187
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 00:32:54 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52a3ff5f0abso1397980a12.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Sep 2023 00:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693812773; x=1694417573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhTAFGnsVoqLTcm8h8mzntPyuNhrH73QT8Eg7bcGb7k=;
        b=NXk5yeDazbgPqQT+5s5CRAQz1KnhNLmGn+ZNjOyF3NBv93LBBYGXxR2XO8Iil5IGlv
         9jQygbLikeMupQfQ7iwsrRVRj+lj/aKAq6kD/T4W/0XRWs3ThTUg/1SRhxeujeukRKRU
         oNeH9V8hHoCf0f4mfAl8izG4zoEfhTjiIQzqA8DZf6chxc40A25Qk5cyYfM1NoMwcAG3
         +G+XqIB/x3d++R45a3Goyh5Ia3f3kW+UxuxrQXnyck0i3/5rq65hSixpYgM4/sFuwtDp
         2CHjeZ4gc3qPJDouzIa7FzsBr7+PO4oe/IhNTdVqFb6yVEndPFILDUKUUoaLXNWQ3Vkc
         tEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693812773; x=1694417573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhTAFGnsVoqLTcm8h8mzntPyuNhrH73QT8Eg7bcGb7k=;
        b=SBZBiENr9ehxVamoqWVTscDqEvSUt+HyVLDrWy3IKstx18n7hjL5NHJU36C3474ysm
         FZp8IfzYkgMsVGaL6UqZNfdm4XgAnl2PGcSmc03c4znMluVw2SysNr9ziJUvWlLkwwWJ
         DFNXBXV0/roMzMBptV63oqwW8rB4VWQpzNAZwSn533NJh5tqRqyub63LXa82e29I5Qug
         oF7fiZ+9iYMcwZW28kIDML3Y1I9nO2UCHonQmLjiZQLW8QCjjqmAd8Ukey022tlZn7Fm
         ax5CiPaHl8pRkvr56M8PJZ2FC21suu+eJvn++MuUS0Nrn8bTlTKbw3WVCuFeta7B7OjX
         N57Q==
X-Gm-Message-State: AOJu0YzGWcZZ5tb1WLKTt7Xspedjh5p4XCRAt36+/ABix1qBw5WIgwdz
        KWYzsZ9Sci/Hi3XFjPOl+5Z09A==
X-Google-Smtp-Source: AGHT+IHLCGU7QZ3/lBZzj0ivBPbzCaQpMJ4BLvGGZ5i7y+pf7z7KyjWQ3UpgOEwIEn3G4OfLNSnBAw==
X-Received: by 2002:aa7:d6cb:0:b0:523:2274:91cb with SMTP id x11-20020aa7d6cb000000b00523227491cbmr6202273edr.12.1693812772975;
        Mon, 04 Sep 2023 00:32:52 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id a9-20020aa7d749000000b005257da6be23sm5499027eds.75.2023.09.04.00.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 00:32:52 -0700 (PDT)
Message-ID: <fc410f25-dc98-6d2f-2ada-4ba2aa8c799d@linaro.org>
Date:   Mon, 4 Sep 2023 09:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/2] dt-bindings: usb: Add Realtek DHC RTD SoC Type-C
Content-Language: en-US
To:     Stanley Chang <stanley_chang@realtek.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230904051253.23208-1-stanley_chang@realtek.com>
 <20230904051253.23208-2-stanley_chang@realtek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904051253.23208-2-stanley_chang@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 04/09/2023 07:12, Stanley Chang wrote:
> Document the device-tree bindings for Realtek SoCs Type-C.
> Realtek DHC (digital home center) RTD SoCs support a Type-C module.
> 
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

