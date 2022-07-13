Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4ADA573F3D
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 23:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237287AbiGMV6V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 17:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbiGMV6T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 17:58:19 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5194041D0F
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 14:58:18 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31caffa4a45so126958307b3.3
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 14:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Y/kMPSFak6KTkDH8JrbRublyvpU6jPq482xurs5eSI=;
        b=Pg8WFVRV86+5cOKU60Qmv48iCaAGyTTjOhRWK3NKVzBIbS/gpDDLSZqiEOvAwGhA1w
         eC+Rpyx6Ranio0sdXI60+nvvCdWxK/oy3Lg5TfHGhVqSseUCZiZFdLIFn3WE5gmHC+Iu
         eGp12EEND6O4XUTvWCyBwcnm44P/YV+oYrBVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Y/kMPSFak6KTkDH8JrbRublyvpU6jPq482xurs5eSI=;
        b=0PZ27uooyNG0rOlqbeMM702Wlh1U0UcVaC/LGDZSENgY5aAv2+K3ze6k9+S5rsZO9j
         dewnyjW9y3pLweUqWE3gdI3f0dpqf0P2WwLq3ogAtHnVzYv93OKLswgFM1F/OcOVl5Ms
         PKzno4p7s5ijGrzVMESnkzARWCF9O1iwOwu2jN1lZSaTW4hwl9YiSK7BSTWKnWvyTqM3
         h92uN48/8DNcdKDu9es/ASbo6UEzPyjDc9GXCxSYIaGpzaCzb+PUta4fWCoHgl0E0kwI
         Q0GDVOxWS2q30NH65ak3JpODZUvOdR2tWubnVu9HB31hor0DfQLHPVSzZHKFk3OG1q+s
         QugA==
X-Gm-Message-State: AJIora+y+iZJS8eTslSqPHd9OKyYJcfpygaOj6NGmrK3UF4eWMsLHzhI
        Jkvj3HgOEGKLGlCY85zRhy5N0HuYLIRr7FfWiK3JyA==
X-Google-Smtp-Source: AGRyM1uOLl/nyHKXS2jhjDxyKbBGONhgOkRFVWmPxxPn9Mf/Wi0UT72Je7hCFLzPAuLiJemb/Bk4TEMynSpqwiPKvDM=
X-Received: by 2002:a81:7b8b:0:b0:31d:17d1:4666 with SMTP id
 w133-20020a817b8b000000b0031d17d14666mr6695386ywc.269.1657749497528; Wed, 13
 Jul 2022 14:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220627210407.GA2905757-robh@kernel.org> <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org> <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
 <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
 <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
 <CAE-0n53ers881LOTCEmKDDxJQt+5vvXJSURs=o6TcOiR5m_EAw@mail.gmail.com>
 <CACeCKacJnnk4_dXEX7XiboOWrYpfAcE=ukP63agVAYUxWR9Vbg@mail.gmail.com>
 <CAE-0n50jm1ovUcBC0GCQJszk-4u+0vDQtAxHxsu9SLyn_CkQuQ@mail.gmail.com>
 <CACeCKadtmGZ5iuTHdMms6ZHGn-Uv=MbcdtqmUzqCb=5WHuPj2Q@mail.gmail.com> <20220712174551.GG1823936-robh@kernel.org>
In-Reply-To: <20220712174551.GG1823936-robh@kernel.org>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 13 Jul 2022 14:58:05 -0700
Message-ID: <CACeCKafRuzk3nWbkgjM1kz9aUhcnttaVq9P1q9M8Pfba-hBpvQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Pin-yen Lin <treapking@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 12, 2022 at 10:45 AM Rob Herring <robh@kernel.org> wrote:
>
> > I agree with you; I'm saying my interpretation of the comments of this
> > thread are that it's not the intended usage of the it6505 part, so the driver
> > shouldn't be updated to support that.
>
> That's not the right interpretation. There should not be some Type-C
> specific child mux/switch node because the device has no such h/w within
> it. Assuming all the possibilities Stephen outlined are valid, it's
> clear this lane selection has nothing to do with Type-C. It does have an
> output port for its DP output already and using that to describe the
> connection to DP connector(s) and/or Type-C connector(s) should be
> handled.

Got it. Thanks for the clarification.

>
> Whether the driver is type-C aware is a separate question from the
> binding. I would think the driver just needs to be told (or it can ask)
> which endpoint should be active and it just enables output on the
> corresponding lanes for that endpoint.

Is it acceptable to tag the end-points with a "mode-switch" /
"orientation-switch"
property? Something like the following:

```
        dp-bridge@5c {
            compatible = "ite,it6505";
            ...
            port {
                #adderss-cells = <1>;
                #size-cells = <0>;

                ite_typec0: endpoint@0 {
                    reg = <0>;
                    mode-switch;
                    remote-endpoint = <&typec_connector0>;
                };
                ite_typec1: endpoint@1 {
                    reg = <1>;
                    mode-switch;
                    remote-endpoint = <&typec_connector1>;
                };
            };
        };
```
Or should the DRM bridge device binding not have those properties in
the end-points either?
The reasons those are required are:
- The Type-C matching code looks for the "mode-switch" identifier in
the fwnode while performing the switch matching [1]
- While we can look up whether the remote-endpoint is a
"usb-c-connector" in the bridge driver the
"mode-switch"/"orientation-switch" property tells the bridge driver
whether to register just a mode-switch, an orientation switch or both.

Best regards,

- Prashant

[1] https://elixir.bootlin.com/linux/v5.19-rc6/source/drivers/usb/typec/mux.c#L347
