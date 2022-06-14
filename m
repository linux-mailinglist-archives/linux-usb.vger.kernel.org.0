Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7EEA54B6F9
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jun 2022 18:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237013AbiFNQ6A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 12:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351578AbiFNQ5u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 12:57:50 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321805596
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 09:57:42 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id t32so16114504ybt.12
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F6g97R91sjtVG6ei6JULqw4mFypOAKmb8KKUSEZQlEM=;
        b=OhorWc2mjBDno2pDG8ZqawT9/vJ1MCCttW7q1lpoz7gdDgLYrJO6STISprKObl3IED
         V3HLrokuHjWh5byp4w9ZoEsXDb/AF69KJt0nEdSktT7jcbnUUmVYFVjf4E92yn15pJLR
         bncnJl6LfB4Py3RYJgpdu03zYHSoBIp1zBwT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F6g97R91sjtVG6ei6JULqw4mFypOAKmb8KKUSEZQlEM=;
        b=JiPc9OzCQ+UJaePWopGgNbFL7gYVJVsEx8r5bHaB8zcF+4TNjqc2FQGJF9OqQ1amlv
         3XoWKWqjaFliaLlAArIQ8bkEA3gRA6XkWbebT/nxbaNGSc7f06XW4GbWbHN9eYaL+lVg
         E4t/X7Hn/+CH4yQXJJTTegu7MrXVHZUANyHulbMejpvc0H1Esvr+oT5aKOVsK6Wi1VTC
         lHTtLPcc5ewlBYtjiUQilHL4IxZKiNzE5T+46CcxNJIKmpEFuu3VxmSJSO9YF2UQapF1
         V/XMm8IirZL9AH/eccvXWdlvxiKqZuOrUSTi5d3oAN7w3JkZhRNVy/4fyHGtMY1ayoh2
         gHuw==
X-Gm-Message-State: AJIora8evBsYZ8uP8Tdmtzs7OplgRcIR+FVq6JzHVvovbiGhnJmv9xyJ
        8iTDKY7FoUaTrpsak87BbhTUpdkSr1yXWrQY2RKrlQ==
X-Google-Smtp-Source: AGRyM1tBFSQKwmiU3taZuWEgZ831zxUtkuGEWQfjxumQkpHwHDXWgjfEd+gTnhSaXwdtdDj3Em9Aee5szsA1eFQ4c8U=
X-Received: by 2002:a25:67c2:0:b0:65d:555b:8f59 with SMTP id
 b185-20020a2567c2000000b0065d555b8f59mr5855580ybc.240.1655225860885; Tue, 14
 Jun 2022 09:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-7-pmalani@chromium.org> <b3b9768d-e0d0-7132-5f50-dd6aa53a68ee@collabora.com>
In-Reply-To: <b3b9768d-e0d0-7132-5f50-dd6aa53a68ee@collabora.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 14 Jun 2022 09:57:29 -0700
Message-ID: <CACeCKaexczFCja_ndndb_A58yZYQ98rTtgY4vHMknENTLxBPPA@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 14, 2022 at 1:18 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/06/22 20:09, Prashant Malani ha scritto:
> > When the DT node has "switches" available, register a Type-C mode-switch
> > for each listed "switch". This allows the driver to receive state
> > information about what operating mode a Type-C port and its connected
> > peripherals are in, as well as status information (like VDOs) related to
> > that state.
> >
> > The callback function is currently a stub, but subsequent patches will
> > implement the required functionality.
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes since v2:
> > - No changes.
> >
> >   drivers/gpu/drm/bridge/analogix/anx7625.c | 73 +++++++++++++++++++++++
> >   drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++
> >   2 files changed, 79 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 07ed44c6b839..d41a21103bd3 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/regulator/consumer.h>
> >   #include <linux/slab.h>
> >   #include <linux/types.h>
> > +#include <linux/usb/typec_mux.h>
> >   #include <linux/workqueue.h>
> >
> >   #include <linux/of_gpio.h>
> > @@ -2581,9 +2582,59 @@ static void anx7625_runtime_disable(void *data)
> >       pm_runtime_disable(data);
> >   }
> >
> > +static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> > +                              struct typec_mux_state *state)
> > +{
> > +     return 0;
> > +}
> > +
> > +static int anx7625_register_mode_switch(struct device *dev, struct device_node *node,
> > +                                     struct anx7625_data *ctx)
> > +{
> > +     struct anx7625_port_data *port_data;
> > +     struct typec_mux_desc mux_desc = {};
> > +     char name[32];
> > +     u32 port_num;
> > +     int ret;
> > +
> > +     ret = of_property_read_u32(node, "reg", &port_num);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (port_num >= ctx->num_typec_switches) {
> > +             dev_err(dev, "Invalid port number specified: %d\n", port_num);
> > +             return -EINVAL;
> > +     }
> > +
> > +     port_data = &ctx->typec_ports[port_num];
> > +     port_data->ctx = ctx;
> > +     mux_desc.fwnode = &node->fwnode;
> > +     mux_desc.drvdata = port_data;
> > +     snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
> > +     mux_desc.name = name;
> > +     mux_desc.set = anx7625_typec_mux_set;
> > +
> > +     port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> > +     if (IS_ERR(port_data->typec_mux)) {
> > +             ret = PTR_ERR(port_data->typec_mux);
> > +             dev_err(dev, "Mode switch register for port %d failed: %d", port_num, ret);
> > +     }
>
> Please return 0 at the end of this function.
>
>         if (IS_ERR(....)) {
>                 ......code......
>                 return ret;
>         }
>
>         return 0;
> }

May I ask why? We're not missing any return paths. I would rather we
keep it as is (which has the valid return value).

>
> > +
> > +     return ret;
> > +}
> > +
> > +static void anx7625_unregister_typec_switches(struct anx7625_data *ctx)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < ctx->num_typec_switches; i++)
> > +             typec_mux_unregister(ctx->typec_ports[i].typec_mux);
> > +}
> > +
> >   static int anx7625_register_typec_switches(struct device *device, struct anx7625_data *ctx)
> >   {
> >       struct device_node *of = NULL;
> > +     struct device_node *sw;
> >       int ret = 0;
> >
> >       of = of_get_child_by_name(device->of_node, "switches");
> > @@ -2594,6 +2645,26 @@ static int anx7625_register_typec_switches(struct device *device, struct anx7625
> >       if (ctx->num_typec_switches <= 0)
> >               return -ENODEV;
> >
> > +     ctx->typec_ports = devm_kzalloc(device,
> > +                                     ctx->num_typec_switches * sizeof(struct anx7625_port_data),
> > +                                     GFP_KERNEL);
> > +     if (!ctx->typec_ports)
> > +             return -ENOMEM;
> > +
> > +     /* Register switches for each connector. */
> > +     for_each_available_child_of_node(of, sw) {
> > +             if (!of_property_read_bool(sw, "mode-switch"))
> > +                     continue;
> > +             ret = anx7625_register_mode_switch(device, sw, ctx);
> > +             if (ret) {
> > +                     dev_err(device, "Failed to register mode switch: %d\n", ret);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (ret)
> > +             anx7625_unregister_typec_switches(ctx);
> > +
> >       return ret;
> >   }
> >
> > @@ -2759,6 +2830,8 @@ static int anx7625_i2c_remove(struct i2c_client *client)
> >
> >       drm_bridge_remove(&platform->bridge);
> >
> > +     anx7625_unregister_typec_switches(platform);
> > +
> >       if (platform->pdata.intp_irq)
> >               destroy_workqueue(platform->workqueue);
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > index d5cbca708842..76cfc64f7574 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -443,6 +443,11 @@ struct anx7625_i2c_client {
> >       struct i2c_client *tcpc_client;
> >   };
> >
> > +struct anx7625_port_data {
> > +     struct typec_mux_dev *typec_mux;
> > +     struct anx7625_data *ctx;
> > +};
> > +
> >   struct anx7625_data {
> >       struct anx7625_platform_data pdata;
> >       struct platform_device *audio_pdev;
> > @@ -474,6 +479,7 @@ struct anx7625_data {
> >       struct mipi_dsi_device *dsi;
> >       struct drm_dp_aux aux;
> >       int num_typec_switches;
> > +     struct anx7625_port_data *typec_ports;
> >   };
> >
> >   #endif  /* __ANX7625_H__ */
>
