Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEC5539E5A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 09:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344701AbiFAHgX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 03:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbiFAHgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 03:36:21 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2198F8CCC8
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 00:36:18 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id n10so1940463ejk.5
        for <linux-usb@vger.kernel.org>; Wed, 01 Jun 2022 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0q3wt29aNZiv6jXypasXo5xqD+y2Dp/M8UIl5yGQ+OU=;
        b=EqmxQDYflsUcRFsBVf/C3LdLhNCWjjkgpV6d3FyTWbkOsrcS2A39iklfOv0rM7Dcsr
         ZRdPNxhAVzy9A0PBcWP+r849b7PsmV7Lfnj0rig+AgIFCXYaGYBX0R5lcfCIDptvbdBE
         Tp0zFqG7kZqXGeKPL8/WPYye5vZacc2NLr+yGZw8m+H/DUXabvU81+dQFiAyaa0k2K15
         b665tJpSN/mwuqMv6l+GAfNzMOytdKbvDfmKDBhef3zm7x4zrQdfzY1AqYEUFZFD82Vq
         zQrKkqgdLe7tfAeCmaW6ERzoNTgcj74viKMPs0J34io1jsptMuGJT2yN9/wTDSrilBkB
         WhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0q3wt29aNZiv6jXypasXo5xqD+y2Dp/M8UIl5yGQ+OU=;
        b=lRZUiFblVOzDfpW4UemKv9TQ5S8mWUhgaqPzZvoEoFyWR8xbzujBRWiIF6hoTlIc9E
         OdoVZUFn4RHR8ZyN4aewV9+KL5TPTUAbMO6m+e63mHE2a8OBDanQmiec1LjENQ/+sIY1
         +H5gaF22Lth0bt9qK2k30RUwRsn4ZmikiTWg1+NgtZMyINcHfJ9expLODK9WRo5psnu8
         qJ4DG6wNgY1OkZgcGpINTssKDUhLIHLhOCmCdbsLJuNjbxHZ6EIfLTtpuUZt2ZMAxP8G
         R/N5lzCgyUwK/ZL4BmT6im/mLQhKjG2pzeYl3f9UJzuQ2Sz3nzmE3C1d1EUSa6VwGonu
         XJSQ==
X-Gm-Message-State: AOAM533wRwjHY7OnrmpENlJbWeU4jL1QUh5zxDKNRaIau4qulK/9TBba
        wyg+Nsphc0IpHcu5frTJLaPxgw==
X-Google-Smtp-Source: ABdhPJygn1kSoBskFVxX1NTOvT9WDOZ5vbePTEPzYPwUrOV6DSTk5mMP3EMwBrRPRSlIzj9AM+6EXQ==
X-Received: by 2002:a17:907:7e84:b0:6fe:cded:7d1f with SMTP id qb4-20020a1709077e8400b006fecded7d1fmr42958260ejc.35.1654068976668;
        Wed, 01 Jun 2022 00:36:16 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o22-20020a170906601600b006fe8b456672sm382548ejj.3.2022.06.01.00.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:36:16 -0700 (PDT)
Message-ID: <2926e4f5-1322-f1c6-f43a-c4a09f5751de@linaro.org>
Date:   Wed, 1 Jun 2022 09:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 01/14] dt-bindings: usb: Add Mediatek MT6370 TCPC binding
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
 <20220531111900.19422-2-peterwu.pub@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-2-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31/05/2022 13:18, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 TCPC binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

Please apply my previous comments.


Best regards,
Krzysztof
