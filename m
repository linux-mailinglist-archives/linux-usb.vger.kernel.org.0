Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70C4254D065
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 19:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358019AbiFORvd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 13:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358007AbiFORvc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 13:51:32 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072AD544C0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:51:30 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id cx11so11896914pjb.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XGLjS63dUzAW1Zo2zi7t3U1pShICtS96lOWIeEhU5mo=;
        b=lpQYopi0CgQAcKG+v+jImrlkuTJE1F5WMT7t0KYH0fvucudjwtBJJjq6vtnyd3Ec8p
         9pXQkLNI8Oc9J61ZgUslVUtfIMNiyLJ8felTz/mXvGKZUZ3m9+x8ulV6z3UEMExuMSiB
         2NzDllVXpV8Rl7njT/x3rihrMaWf8btUvJ8zcF3TvQzHeCBnnMMBR1Mhdt+RGunBnogV
         aUdQSgsE9RDZAb6azyJgO5ibHmcMJW+85U8gNqfAv5peDiNg6DX/pAa6oha9oTH063+S
         3MdYzebMRwyMlyFaSEuaorfkbp0lLUxjseOk46+6sDQP5R+8882mhkqO0tgNpzIJwUPX
         hnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XGLjS63dUzAW1Zo2zi7t3U1pShICtS96lOWIeEhU5mo=;
        b=yv7spZbVBrgykuA/+lavmdO5hqt0qaQlYqyPtmaJ0jFffkeMu7fJlIo9RlAx+gcbj+
         FNLIuitbL3ADbCmOquJkYCWomH1zu1weepb8NSk72a9TX9B34k2xSzJs0NTQCSCkgUKH
         ukXlkKITKHsKk0ASbDvYEUogpj6LgVb+Qor2WZhNHkFHF9s66RC/p0R8v7ptmh9W94n/
         vUROlnIE5OJA2typnHpZiGzuU1iw7Dg/Ct3OIoyXpatoqG4bZN30SQJHqYRWyWoMT+W4
         b1xmNm9ThR/yyQHfv17zSXAxgctc6QUj0mQLc05UZZcoiBn/3VdpWFKxdl1PObuyQ1M4
         Fybg==
X-Gm-Message-State: AJIora9rXeJP6qNH0k/J7ou63osjxMLetfiNCg9M3ymAK9Cu6r+9AHYX
        v47hqG+ZjFz054aeOQVNZ2f6aA==
X-Google-Smtp-Source: AGRyM1utGKyiREa4WVXSvBtvrEyoGENTUB491xhdN0Jo6qHBF7XUH5VzUDiIIM4B3tzwCaRcE420qg==
X-Received: by 2002:a17:902:8343:b0:167:8899:2f92 with SMTP id z3-20020a170902834300b0016788992f92mr878435pln.117.1655315489664;
        Wed, 15 Jun 2022 10:51:29 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709026bcc00b00162037fbacdsm9544311plt.187.2022.06.15.10.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 10:51:29 -0700 (PDT)
Message-ID: <ff25e7ed-1074-3d90-75c0-d62f03825e3e@linaro.org>
Date:   Wed, 15 Jun 2022 10:51:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Content-Language: en-US
To:     Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= 
        <nfraprado@collabora.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <20220615172129.1314056-5-pmalani@chromium.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220615172129.1314056-5-pmalani@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15/06/2022 10:20, Prashant Malani wrote:
> Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
> alternate mode lane traffic between 2 Type-C ports.
> 
> Update the binding to accommodate this usage by introducing a switch
> property.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v3:
> - Fix unevaluatedProperties usage.
> - Add additionalProperties to top level "switches" nodes.
> - Make quotes consistent.
> - Add '^..$' to regex.
> (All suggested by Krzysztof Kozlowski)

Looks good to me.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
