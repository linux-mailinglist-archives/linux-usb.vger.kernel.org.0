Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F18542BFE
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 11:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235321AbiFHJwa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 05:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235479AbiFHJvz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 05:51:55 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66DD3F62CC
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 02:22:05 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bg6so20397199ejb.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jun 2022 02:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=b6d5Zv3xL/KRcHb8xiVxMyuc8Dp70Lb5vZZ6lK/eQQ8=;
        b=aWRg82jWnaqTYIJkWdAoYFsulyS+0ED8k9qWSWTafVRswt4QT/KPr/HCidmmrSSJX8
         tfca1NHPxgMJmxYSHrD/3zNh5EPJ31fwoiCsD1K8O5c/O/8/JWOsSPzC89o6EWXn3pqP
         gzEWvKriNebG1p7w2dC9QI4gxrEsRsuRmS/c/4Ip2KOQroKlr16Fuy4Jj9vhiJOofPMK
         K9w0Dz7H1NZzSdze8fZB6cOPgsvaSwWUKasKI8GTMIsVTk2eKLHwG2VFP6qzKTaOHWcw
         U5xnEL/rRNieyscQYA52PqHA4mHngv/wQInPwTpT5Z/EOOq+AJrSowSntyREp7fNuEPm
         DzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=b6d5Zv3xL/KRcHb8xiVxMyuc8Dp70Lb5vZZ6lK/eQQ8=;
        b=3pXucVhXFkvnJ+3N+GR9uNnd2FY4a5WBOyhYFzCixG1X8l0u/KW1SzrtPtgDxGaYZT
         GCLn8M+DGhmJwbbJvhutbRM94PJFfFSTKcjV0SBWv7xAnWmSd9QDVuErujy2CpENqipS
         F6TfqMk53EouXkeMFpuFbbsdWXFWNKW9djVf2gLG8mVYZL05JMYig47T6EfvPAATZ3n0
         Su7GoNq5BXdolhW23liFXePfr42AQOIRk1iPOPfpYS8hNF9SUUzPP2kNS6KAQH9V/Sdj
         qcbTP+t018RtGo8qCUaGlt1z6WLA1tARXEP6oN/wyqC2bPcweoB4YEplSDU+VfUNXUg7
         VfOA==
X-Gm-Message-State: AOAM533q+3wm2RFzqpATmvNTKSmUPQLNPS8GiMVj8TyTkFt1XbSoQgfA
        /nVBw/ve8XGiy/QWFmp0oLadEQ==
X-Google-Smtp-Source: ABdhPJxz145Vpj4ktqjR1qJFt+oTGwPOr1TCBpytpxOHAUmGx3AhpWrzgmr1hjNaMOMoO/gmolJmTw==
X-Received: by 2002:a17:906:180c:b0:6fe:9a3e:3d5b with SMTP id v12-20020a170906180c00b006fe9a3e3d5bmr30464668eje.202.1654680103174;
        Wed, 08 Jun 2022 02:21:43 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p9-20020a170906614900b00711c7cca428sm4515540ejl.155.2022.06.08.02.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 02:21:42 -0700 (PDT)
Message-ID: <0d891f54-4a81-549b-8365-fb40cd077c83@linaro.org>
Date:   Wed, 8 Jun 2022 11:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] dt-bindings: usb: Add Type-C switch binding
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Xin Ji <xji@analogixsemi.com>
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-4-pmalani@chromium.org>
 <ba499783-1794-1c00-348a-d912c9562e1e@linaro.org>
In-Reply-To: <ba499783-1794-1c00-348a-d912c9562e1e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/06/2022 11:18, Krzysztof Kozlowski wrote:
>> +anyOf:
>> +  - required:
>> +      - mode-switch
>> +  - required:
>> +      - orientation-switch
>> +
>> +additionalProperties: true
> 
> Why true? I see usb-connector has it from commit 6a0e321ea735
> ("dt-bindings: Explicitly allow additional properties in common schemas")
>  but that looks also weird - this is not a common schema, but a
> complete, generic one.
> 

Ah, I see now, the parent device uses the additional properties. It's
ok, skip the comment.


Best regards,
Krzysztof
