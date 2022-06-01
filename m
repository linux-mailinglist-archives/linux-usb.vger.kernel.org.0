Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADB5539E76
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 09:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349968AbiFAHgw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 03:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345925AbiFAHgv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 03:36:51 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E236388
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 00:36:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id rs12so1886457ejb.13
        for <linux-usb@vger.kernel.org>; Wed, 01 Jun 2022 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xBCpf2ijkY04JO9G9o2+kZbRlNvwewrf/4U7CP2kV/Q=;
        b=gV+J5H9vudoy1jXIIq0cFUYJVb6S3uq/9ey4aCormFoudezlzz0SFq7wkA1hjz6aaD
         uZEaWAamHW72+BF8B9dQ2dFnzJTLO90WFV3Xl4RCcTXViWv8Hy3EYyLIntuRwnlUvp3t
         /NCbF/kU8/v+ouGvLC0hs90dMzJPm2NWb1muqvS4/CrcHEUj69BtVLPwb1vslUmvz1O0
         Kc/IJTYIGHFIoIWTDsw0iAQ7LoihyDvNMwjrlsY18IxjajxaWxO0CwAoBDvu/nw7Ebge
         EnlPx3uK1SAR/GeSWt3TqDfZYsaqZA6CuMo1CtVUlAvVreobSOg77dv0D0pT9+x3zf1W
         GJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xBCpf2ijkY04JO9G9o2+kZbRlNvwewrf/4U7CP2kV/Q=;
        b=w9NW/yd1vNXRi73tWrtdcCRut5sOUnugy/G2vYDV0dGZsqgyZ/tchrlt/UwyajBUsl
         WPP8PH8ry2WS0LuRpuAObrmNKzgiz9HHcOb32DrySMRUyhV19jHVVfgzr8PhAAuzoxpG
         lXBZoo7DDsSTdfSQYpWwRwfwa9oGP8fnZK4KY1fLEzeZ/djtXUiGn4mUhv6UpGyXeq7u
         lDk2LuF3JCulupCOcp21FLn/bLP+LAvOuyD7N8o5PFFO+H1NL9y/cYZiOm4pY4VCM8LL
         NWpD/6pA6h8T/IaVrev7BfSSXVm/dO0XZl42nvg0HNM90OENIh7aYqY704mn/34jQVPo
         PL4w==
X-Gm-Message-State: AOAM531JOuYTPj83XkJis6f3jL5pmi87Qmn7h44lF6f1U/OxsCiN+NvY
        HzIUZlmNkjurcqdvZUFIMQ1IZg==
X-Google-Smtp-Source: ABdhPJxfd2wQq5+y/1mKBm1VxIcQyViT4mU2wnLCba4T6VYB+uuoOMJoXI413QaVy+3m4ZkIk2bPnw==
X-Received: by 2002:a17:906:974e:b0:6f5:2d44:7e3c with SMTP id o14-20020a170906974e00b006f52d447e3cmr55781341ejy.167.1654069008364;
        Wed, 01 Jun 2022 00:36:48 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v4-20020aa7dbc4000000b0042de38b8c49sm516690edt.34.2022.06.01.00.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:36:47 -0700 (PDT)
Message-ID: <e58cc626-a5dd-4926-5192-cd85d16c797f@linaro.org>
Date:   Wed, 1 Jun 2022 09:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 04/14] dt-bindings: leds: Add Mediatek MT6370 flashlight
 binding
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
 <20220531111900.19422-5-peterwu.pub@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-5-peterwu.pub@gmail.com>
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
> From: Alice Chen <alice_chen@richtek.com>
> 
> Add Mediatek MT6370 flashlight binding documentation
> 

Please apply my previous comments.


Best regards,
Krzysztof
