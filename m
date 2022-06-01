Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66AA3539E6A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 09:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbiFAHgq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 03:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346849AbiFAHgo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 03:36:44 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9DB92D24
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 00:36:35 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id fd25so984034edb.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Jun 2022 00:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8rVL+zCqV2ClaM1IvMumDzQRQgddNQZVClfHLs1uusg=;
        b=sKQZ120R1iNb1rrMlm+ciOWFgz2PLWOBBf6zbwbmdaEX01gTOn/F5DMc8O+KkNCiHw
         T0m20IjcUP0Eo8mLj+H/3+5syyMtRoDVL/qxR1hMbk+xqkOdvJyxyp/NmQntmgb9I/Yc
         qYzkVKnMibnBSzM81g/9+4tzNkOx2Da1ZcTaPbH07baNz3cxSOkhLHJwBjFq5Py8hrNF
         AxIj5Viuqo8Ew+VWIw8UYTSegDJPEe5MD3lpJPzUcbL+pHlyLXh2VZD9lfolWyqGBOSS
         DBHhSAi3rsjvnaRJKZxp8eOnMKiFDzetWvlMI+m3lx+rqJpy/8zmCVrvhXwrimuVrJdW
         INYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8rVL+zCqV2ClaM1IvMumDzQRQgddNQZVClfHLs1uusg=;
        b=qM6vKI6KHr9dC4mb8A9Kilomjflv820btcbvWzfA/OqE1jLFwNlzQwguEW2MCkvrxM
         HaK2XWGs0YKeazbWOCrZY2V8vKZ/m9lhU1/SozKwkV/RlwTRiDvTudkOrVgv8WxXrKsR
         fAUagmXZZ30dQ0p4Rcud0a6lDmkqHKSUURjZkcNUwzn9l0WH+UULkmZSGlEFuXXHgfxG
         oPN6QdlQ7XL00wL8FjdPTWnuvf3LR80R76Vpn+3YlcJEDc8YdKAMBTJtpYw7CUZDybRg
         sfto/L6Z5+PHOP1Vw+T+5IDRV59tKhHzy09HeuCjyWCrxQEhWJ1LLvuCTHyJe5vi5PbV
         YeBA==
X-Gm-Message-State: AOAM531mITsb5vuldsJwkaL4vruu8bghY1FhWr9lONA4ug1UjXY+oaiS
        Mb0lwMnKiqlPFJ7CX8azzErqyw==
X-Google-Smtp-Source: ABdhPJxXmZbLT6U4B5wdKbc3qaM3fx5m6yRjmA3N01Sc1bKs2gwCTbf0eEckNJ1b2uUmeUtTa2N70g==
X-Received: by 2002:aa7:db02:0:b0:42d:c3ba:9c86 with SMTP id t2-20020aa7db02000000b0042dc3ba9c86mr20256525eds.337.1654068993673;
        Wed, 01 Jun 2022 00:36:33 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f8-20020a170906824800b006fe7725ed7dsm372355ejx.34.2022.06.01.00.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:36:33 -0700 (PDT)
Message-ID: <2f292066-4cf0-165e-c4cd-fbba9c548b6b@linaro.org>
Date:   Wed, 1 Jun 2022 09:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370
 indicator
Content-Language: en-US
To:     ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, deller@gmx.de
Cc:     cy_huang@richtek.com, alice_chen@richtek.com,
        chiaen_wu@richtek.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-4-peterwu.pub@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-4-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31/05/2022 13:18, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek mt6370 indicator documentation.

Please apply my previous comments.


Best regards,
Krzysztof
