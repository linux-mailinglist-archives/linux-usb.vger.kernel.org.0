Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A27A54CF4B
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 19:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356579AbiFORBa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 13:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357227AbiFORBB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 13:01:01 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC424FC69
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:01:00 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3137c877092so67238297b3.13
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/r7XkSh5TUFeVMIe3mikVGP0QRjTftc0VpzQNshFaLA=;
        b=YEY/aa02EjDu6Gde1XwVcHQ2DxuVZ2OBrNiKoejQ6TtQOhFwmhY/+9cbq0+Zp16lgL
         kD0eDwPqS+oBorSD1W7GoPu2sDRE+nxUfCEwkCsccSZERq+ao/DOWBL9pvFtSCfC1EpI
         87llx6q+yjmXGkCBE1CGNto4D1wXfUoFpyPr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/r7XkSh5TUFeVMIe3mikVGP0QRjTftc0VpzQNshFaLA=;
        b=CVUI0IiQuDhFPaZXSXVFBv4Ws/xosBZMLKnnH8ROKw2a2jnf6SzQ1JLYuTRIrMc8Q5
         nH4h2GaSfOQL7WOWAjwpddHN42b1TPgAiKXZOnL1RFYdW4rckueAZA82GatuyX2U5oua
         xlZJYcGsUNtZfboR+lKNbMukq+WiXOxhR+/1HsDEL8R8xDPLeH/Fg7ukWwddCws8s352
         uUG9q5LjaRTn8HyQG7kC09pnsFWWEAr34zLbjhrr9xkUYATVtdyTjtkgujBQO7v3Zauz
         5HkXkswcafqgdRgrEquk32T/yP1zJwUCFtCA3hEHilwvLHmBvbSLEQuTaea9/uHaLqN9
         xe3w==
X-Gm-Message-State: AJIora+wAmMjlsgp7WRFuRU/pChIiZ4GXDLLGrUBnqUpK8i5n2x4KUIE
        yMdttxKtncIc6MwESglTvsrEQnfwfQUjGm+ysGNNsg==
X-Google-Smtp-Source: AGRyM1vwSIJrbZk5hnWNUg96C0Ni2qFhhTib83BhjFCpBSWqIWSHHXOiLELU1pSyNWuERIOYn4A4WUHEnANs0z8CtuA=
X-Received: by 2002:a0d:f882:0:b0:2f4:d830:6fd with SMTP id
 i124-20020a0df882000000b002f4d83006fdmr656389ywf.387.1655312459179; Wed, 15
 Jun 2022 10:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-7-pmalani@chromium.org> <b3b9768d-e0d0-7132-5f50-dd6aa53a68ee@collabora.com>
 <CACeCKaexczFCja_ndndb_A58yZYQ98rTtgY4vHMknENTLxBPPA@mail.gmail.com> <28135a2f-bf02-fd0b-e881-0ce9d68bd764@collabora.com>
In-Reply-To: <28135a2f-bf02-fd0b-e881-0ce9d68bd764@collabora.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 15 Jun 2022 10:00:48 -0700
Message-ID: <CACeCKadK0A4YD6+Nu=j9dw-dkhkj4ShkpEpSqH_bODjn8wniMg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/bridge: anx7625: Register Type-C mode switches
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        heikki.krogerus@linux.intel.com,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
        swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Xin Ji <xji@analogixsemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Foss <robert.foss@linaro.org>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 15, 2022 at 1:45 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 14/06/22 18:57, Prashant Malani ha scritto:
> > On Tue, Jun 14, 2022 at 1:18 AM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 09/06/22 20:09, Prashant Malani ha scritto:
> >>> When the DT node has "switches" available, register a Type-C mode-switch
> >>> for each listed "switch". This allows the driver to receive state
> >>> information about what operating mode a Type-C port and its connected
> >>> peripherals are in, as well as status information (like VDOs) related to
> >>> that state.
> >>>
> >>> The callback function is currently a stub, but subsequent patches will
> >>> implement the required functionality.
> >>>
> >>> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> >>> ---
> >>>
> >>> Changes since v2:
> >>> - No changes.
> >>>
> >>>    drivers/gpu/drm/bridge/analogix/anx7625.c | 73 +++++++++++++++++++++++
> >>>    drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++
> >>>    2 files changed, 79 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >>> index 07ed44c6b839..d41a21103bd3 100644
> >>> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >>> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >>> @@ -15,6 +15,7 @@
> >>>    #include <linux/regulator/consumer.h>
> >>>    #include <linux/slab.h>
> >>>    #include <linux/types.h>
> >>> +#include <linux/usb/typec_mux.h>
> >>>    #include <linux/workqueue.h>
> >>>
> >>>    #include <linux/of_gpio.h>
> >>> @@ -2581,9 +2582,59 @@ static void anx7625_runtime_disable(void *data)
> >>>        pm_runtime_disable(data);
> >>>    }
> >>>
> >>> +static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> >>> +                              struct typec_mux_state *state)
> >>> +{
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int anx7625_register_mode_switch(struct device *dev, struct device_node *node,
> >>> +                                     struct anx7625_data *ctx)
> >>> +{
> >>> +     struct anx7625_port_data *port_data;
> >>> +     struct typec_mux_desc mux_desc = {};
> >>> +     char name[32];
> >>> +     u32 port_num;
> >>> +     int ret;
> >>> +
> >>> +     ret = of_property_read_u32(node, "reg", &port_num);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     if (port_num >= ctx->num_typec_switches) {
> >>> +             dev_err(dev, "Invalid port number specified: %d\n", port_num);
> >>> +             return -EINVAL;
> >>> +     }
> >>> +
> >>> +     port_data = &ctx->typec_ports[port_num];
> >>> +     port_data->ctx = ctx;
> >>> +     mux_desc.fwnode = &node->fwnode;
> >>> +     mux_desc.drvdata = port_data;
> >>> +     snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
> >>> +     mux_desc.name = name;
> >>> +     mux_desc.set = anx7625_typec_mux_set;
> >>> +
> >>> +     port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> >>> +     if (IS_ERR(port_data->typec_mux)) {
> >>> +             ret = PTR_ERR(port_data->typec_mux);
> >>> +             dev_err(dev, "Mode switch register for port %d failed: %d", port_num, ret);
> >>> +     }
> >>
> >> Please return 0 at the end of this function.
> >>
> >>          if (IS_ERR(....)) {
> >>                  ......code......
> >>                  return ret;
> >>          }
> >>
> >>          return 0;
> >> }
> >
> > May I ask why? We're not missing any return paths. I would rather we
> > keep it as is (which has the valid return value).
> >
>
> I know that you're not missing any return paths.
>
> That's only because the proposed one is a common pattern in the kernel
> and it's only for consistency.

Thanks for the additional details. Since this isn't addressing any
specific bug, and I
notice varied usages of "return ret" in this file itself [1][2], I'd
prefer keeping it as is.

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/analogix/anx7625.c#L296
[2]: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/analogix/anx7625.c#L436

>
> Regards,
> Angelo
>
