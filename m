Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7F954A189
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jun 2022 23:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351873AbiFMVcw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jun 2022 17:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348358AbiFMVcg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jun 2022 17:32:36 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063A063D4
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 14:31:59 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-30ec2aa3b6cso11124797b3.11
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 14:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AzIcFLo40szEo8NB3C26osOjMm8AR4JFYYSSCxGXUzk=;
        b=ShDtYk6H7kkrvQKbFaiZr/GGViq9bAOA5saB3I1LBZp4qhZdW32ELCGywORdkM2mWO
         teE5ojAN4Q/3RgiE+4vnzhZVMpFwV6APbDCXq971wovCl7VaQH8CFG0QmKmpOHKti3TT
         DtO5SSvAocag0HEsWkXcpTk7eq63Ep735cYnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AzIcFLo40szEo8NB3C26osOjMm8AR4JFYYSSCxGXUzk=;
        b=FHrloJIh4usZQ6HglENqUuZihKb8A8egDlyvIUpBuCu0lF/I3EcUFdUzRWftwkjRo7
         pECqJA6tDWPj/8hwkuIBzsziN7GFsDupc88t5EKmLZkzzrX0cn68zZx6T37dE2twzfn2
         xlxXJzEq2+5kNs4s3sbgvk2qRb3nx15I6aV2H/EpOvxNtdM39wvD/0ak7F8d9dQGIoZM
         cPd10mDIMwsqDWh4KFuFQLenHDvboHT/K/ZLbHd+Bj9OiHnAilUYFQcr1G5gKy9c0D8S
         8cDbsokSvVAvNI3nx30JNFK5teSxN51udzeAEHn5h2M7Y502MjTyDUoP51bXpl3wwREV
         hBbg==
X-Gm-Message-State: AJIora92R7qqBmig6TcMh62fdk9BKPXbeTz6dqzdPurO07SNSXODZNvL
        ucYwMsuNE8UPCOUqMm2d6lVqKW+elHs4Lq3Kjdnqfw==
X-Google-Smtp-Source: AGRyM1vL0X6zp+Csj7ElCzV0tWeqEtHwHFfwLFaToB5K7vj9b8ikJ76sVZ8Lz1Z94W8ZMlFmQyrXFDjWyUpsBFwv9zM=
X-Received: by 2002:a0d:f882:0:b0:2f4:d830:6fd with SMTP id
 i124-20020a0df882000000b002f4d83006fdmr1965406ywf.387.1655155918117; Mon, 13
 Jun 2022 14:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220609181106.3695103-1-pmalani@chromium.org>
 <20220609181106.3695103-8-pmalani@chromium.org> <20220613205117.aewpbdjolxmys4vy@notapiano>
In-Reply-To: <20220613205117.aewpbdjolxmys4vy@notapiano>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Mon, 13 Jun 2022 14:31:47 -0700
Message-ID: <CACeCKafc22gEL5e6pBidNBSh71AAcghaCn=e0U65prPDkp_x=A@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/bridge: anx7625: Add typec_mux_set callback function
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Pin-Yen Lin <treapking@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi N=C3=ADcolas,

On Mon, Jun 13, 2022 at 1:51 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Hi Prashant,
>
> On Thu, Jun 09, 2022 at 06:09:46PM +0000, Prashant Malani wrote:
> > From: Pin-Yen Lin <treapking@chromium.org>
> >
> > Add the callback function when the driver receives state
> > changes of the Type-C port. The callback function configures the
> > crosspoint switch of the anx7625 bridge chip, which can change the
> > output pins of the signals according to the port state.
> >
> > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes since v2:
> > - No changes.
> >
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 58 +++++++++++++++++++++++
> >  drivers/gpu/drm/bridge/analogix/anx7625.h | 13 +++++
> >  2 files changed, 71 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/dr=
m/bridge/analogix/anx7625.c
> > index d41a21103bd3..2c308d12fab2 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> > +#include <linux/usb/typec_dp.h>
> >  #include <linux/usb/typec_mux.h>
> >  #include <linux/workqueue.h>
> >
> > @@ -2582,9 +2583,66 @@ static void anx7625_runtime_disable(void *data)
> >       pm_runtime_disable(data);
> >  }
> >
> > +static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
> > +                                       enum typec_orientation orientat=
ion)
> > +{
> > +     if (orientation =3D=3D TYPEC_ORIENTATION_NORMAL) {
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_=
0,
> > +                               SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_=
1,
> > +                               SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
> > +     } else if (orientation =3D=3D TYPEC_ORIENTATION_REVERSE) {
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_=
0,
> > +                               SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
> > +             anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_=
1,
> > +                               SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
> > +     }
> > +}
> > +
> > +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> > +{
> > +     if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_co=
nnected)
> > +             /* Both ports available, do nothing to retain the current=
 one. */
> > +             return;
> > +     else if (ctx->typec_ports[0].dp_connected)
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORM=
AL);
> > +     else if (ctx->typec_ports[1].dp_connected)
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVE=
RSE);
> > +}
> > +
> >  static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> >                                struct typec_mux_state *state)
> >  {
> > +     struct anx7625_port_data *data =3D typec_mux_get_drvdata(mux);
> > +     struct anx7625_data *ctx =3D data->ctx;
> > +     struct device *dev =3D &ctx->client->dev;
> > +
> > +     bool old_dp_connected =3D (ctx->typec_ports[0].dp_connected ||
> > +                              ctx->typec_ports[1].dp_connected);
>
> Here you're assuming you have 2 switches. Given that this on its own does=
n't do
> anything, just move it after the
>
>         if (ctx->num_typec_switches =3D=3D 1)
>                 return 0;
>
> check.

Sure. I will fix this up in v3. Thanks!

>
> Thanks,
> N=C3=ADcolas
>
> > +     bool new_dp_connected;
> > +
> > +     if (ctx->num_typec_switches =3D=3D 1)
> > +             return 0;
> > +
> > +     dev_dbg(dev, "mux_set dp_connected: c0=3D%d, c1=3D%d\n",
> > +             ctx->typec_ports[0].dp_connected, ctx->typec_ports[1].dp_=
connected);
> > +
> > +     data->dp_connected =3D (state->alt && state->alt->svid =3D=3D USB=
_TYPEC_DP_SID &&
> > +                           state->alt->mode =3D=3D USB_TYPEC_DP_MODE);
> > +
> > +     new_dp_connected =3D (ctx->typec_ports[0].dp_connected ||
> > +                         ctx->typec_ports[1].dp_connected);
> > +
> > +     /* dp on, power on first */
> > +     if (!old_dp_connected && new_dp_connected)
> > +             pm_runtime_get_sync(dev);
> > +
> > +     anx7625_typec_two_ports_update(ctx);
> > +
> > +     /* dp off, power off last */
> > +     if (old_dp_connected && !new_dp_connected)
> > +             pm_runtime_put_sync(dev);
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/dr=
m/bridge/analogix/anx7625.h
> > index 76cfc64f7574..7d6c6fdf9a3a 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> > @@ -55,6 +55,18 @@
> >  #define HPD_STATUS_CHANGE 0x80
> >  #define HPD_STATUS 0x80
> >
> > +#define TCPC_SWITCH_0 0xB4
> > +#define SW_SEL1_DPTX0_RX2 BIT(0)
> > +#define SW_SEL1_DPTX0_RX1 BIT(1)
> > +#define SW_SEL1_SSRX_RX2 BIT(4)
> > +#define SW_SEL1_SSRX_RX1 BIT(5)
> > +
> > +#define TCPC_SWITCH_1 0xB5
> > +#define SW_SEL2_DPTX1_TX2 BIT(0)
> > +#define SW_SEL2_DPTX1_TX1 BIT(1)
> > +#define SW_SEL2_SSTX_TX2 BIT(4)
> > +#define SW_SEL2_SSTX_TX1 BIT(5)
> > +
> >  /******** END of I2C Address 0x58 ********/
> >
> >  /***************************************************************/
> > @@ -444,6 +456,7 @@ struct anx7625_i2c_client {
> >  };
> >
> >  struct anx7625_port_data {
> > +     bool dp_connected;
> >       struct typec_mux_dev *typec_mux;
> >       struct anx7625_data *ctx;
> >  };
> > --
> > 2.36.1.476.g0c4daa206d-goog
> >
