Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 828E35696CA
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 02:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234642AbiGGAR5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 20:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbiGGAR4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 20:17:56 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35CA2DAA2
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 17:17:55 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-10c0e6dd55eso9554843fac.7
        for <linux-usb@vger.kernel.org>; Wed, 06 Jul 2022 17:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=A9KMWBQbXLx/bx1xZ0Ut5YH6Gehkg3o6EpAfQEv3oiQ=;
        b=aFZdN/uwvv5by+9RhHiClMYZnVo6UGSzcXWWtCAt5r2fbdoUTBbHZ9NDK6Jj0z1pNd
         T38kEws2G5cAXs85Wvufk9YgEiWLP8NOvEtr1Snrb9gDrm/lX9iG4ufe56aRHSMlmDW1
         eNHW9MDnS+MOypb2lP2JCNoRd/AhNVVaO2PaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=A9KMWBQbXLx/bx1xZ0Ut5YH6Gehkg3o6EpAfQEv3oiQ=;
        b=i7pt30IopLIOLYfX9Q9LZi3bEyr0RyPV7brY8BIUWLW7ljpvtEfyyPWQQ0gFGSAnti
         3ODCoiex9fPKytBiTrdRZbyzApW2zgw35Kb8OF9gEUbk4tEwWLDfMiR4dZToAlEtR9Rj
         vlfpTaWfnkjmwHScFtjloYko+1K9H4IGlwbI8e+TxL8GtGaCzWA/nu2aGHMkwUQZRcgh
         Opa3Hudnuycd9OWYngbhZUO8bWFJkytWcKOyWrgUNLCxwP9e8Psm23gOsRNfktRDIb5/
         qBDW99STimAWWil68+autO03AmBSpwIpFkT3+2QmJ6Kvq2rAlo004PmEyVG6oCzLwn7K
         BqeQ==
X-Gm-Message-State: AJIora/wKqVGIdV2asgcWGfkBfiLQc6Q+Gc+uxJzpHr7F7MjMjSeCVjw
        pY8sGqXwfj1BL6pFUW6cACXZOWH9Luh4qcSbt08Y8v0jP6A=
X-Google-Smtp-Source: AGRyM1vRIZqEOwogKZJcIXv6VDYldqs4L085Qun9gEFdF2cBslF60GMIX99hLqqjzW1HACZsMRx+6b3IRlXWzJ9eHZs=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr961649oap.63.1657153075078; Wed, 06 Jul
 2022 17:17:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Jul 2022 20:17:54 -0400
MIME-Version: 1.0
In-Reply-To: <CACeCKafya_XA+C3eJUvT4vjQSgsjdewVkCb+Jr2tA1605jjfjg@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org> <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
 <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
 <CAE-0n50XbO5Wu4-429Ao05A4QrbSXoi1wBjTpGFjKm3pZj1Ybg@mail.gmail.com>
 <CACeCKafzB0wW_B2TOEWywLMyB+UhYCpXYDVBV=UbyxBiGnv1Rw@mail.gmail.com>
 <CAE-0n50Akd8QikGhaAQgxLkJBhE-7KQf5aJ_P2ajOmCjLk555g@mail.gmail.com>
 <CACeCKafQT_RBrkHJNE2ezahSsHLPrbnS69QbfnjxBoUhi6hjwQ@mail.gmail.com> <CACeCKafya_XA+C3eJUvT4vjQSgsjdewVkCb+Jr2tA1605jjfjg@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Jul 2022 20:17:54 -0400
Message-ID: <CAE-0n53kujMrzFG++5kaS4QKj2YrzLJEu5R76W887rCW_S592g@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback function
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Pin-Yen Lin <treapking@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Allen Chen <allen.chen@ite.com.tw>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Prashant Malani (2022-07-06 11:26:19)
>
> Stephen, any pending concerns?

No more pending concerns.

> If not,I will post a v6 series with the suggested changes:
> - Drop typec-switch binding; instead add a new top-level port with
> end-points for each Type-C connector's switch.
> - Drop it6505 patches.
> - Squash anx7625 driver patches into one patch.
> - Add a comment mentioning that we aren't registering the orientation-switch.

Ok. I'll take a look on v6.
