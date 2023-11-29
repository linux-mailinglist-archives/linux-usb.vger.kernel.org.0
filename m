Return-Path: <linux-usb+bounces-3466-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF727FDF99
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 19:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAB36B2108D
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 18:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6243D3B790;
	Wed, 29 Nov 2023 18:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shruggie-ro.20230601.gappssmtp.com header.i=@shruggie-ro.20230601.gappssmtp.com header.b="u89uDbQp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E94139
	for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 10:46:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bb92811c0so85198e87.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 10:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20230601.gappssmtp.com; s=20230601; t=1701283560; x=1701888360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTW57efAuxSSRueibpkzKisRS1k6zgyzQKApp1f7su4=;
        b=u89uDbQpVVGRPNanbmEUct8rZDb7XbzI1tvYLueQI2xq5Wk4Lt/Ipn0Cs+hiRMSQyi
         pmUo6XVcAnPot7rt3sOU1RH4NEEiw98m0C0OWazrDwwyc/mIbkTs5jdzNaNLqNvoQD8j
         2pHu+3uXorckVPiurnfpzoZYaGSQA0jia+SGsGJM/A/7CT8jNL1+u5y5MdvJUC0/WMuM
         K4uy4RbQASIPJwjJkJBB32A8Ytw6Ek6+O71N42JMVcD4BpPx66CKRPVa5ik3M0Ymvp0c
         ecNpYexAIWHkqAHoDvCtQiE+6+xOWkGORY65x0+faUUkEYaeanBxcrObn/M5NHj5JmR1
         HSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701283560; x=1701888360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTW57efAuxSSRueibpkzKisRS1k6zgyzQKApp1f7su4=;
        b=Zv9QTWT13/X6SDTnPscT4iRhdWOfYdQDV1/usQsIIYxj+tV0Wu2R2rw+UbPpcTocH2
         9W4Xdbq2yABBkwxzcGqI7z/MiJH06n/57TtEg1DGKbcuGry0ZU2oSTqLjzc54ZlAHb5T
         TTUgAWC8CPwEgrRzT5xHEXR2gyP9iR8w1gk5pRfGMQ8A7nTz7GDNzh7DoVfganpfXSks
         qOa+gL+4gcAs06XlNSq5bxDZAwCtFvRM2vbxXpjf/D38Hsg42Wst6vTpQsY5emqG9gCH
         9n9WjKeweTFn4h3cFxZiOvQhlpsIFHdSEnsLxa6r/j6b89UM+yBt0l9aoW4bUgbifJL3
         0KWg==
X-Gm-Message-State: AOJu0YxFUD3ldnHF4lD3d5trAHaNF/BRPzCEIwji1ucLgqMO+wzYeoad
	s3d8FRQsdGkx0mcr6L78cJNPAiZG+QMQ6beqxBpXog==
X-Google-Smtp-Source: AGHT+IHinnpjTagz4lA2T84GiL/o+Z5th6mVMQ7WVhyeqVAAQ1jnXf5ERR/ixK7q2A0bojvaICmXcfj2gPwUzXOD7CA=
X-Received: by 2002:a05:6512:2207:b0:500:7aba:4d07 with SMTP id
 h7-20020a056512220700b005007aba4d07mr6087967lfu.22.1701283560046; Wed, 29 Nov
 2023 10:46:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123210021.463122-1-alex@shruggie.ro> <ZWdKI9UOZ6INP0Tu@kuha.fi.intel.com>
In-Reply-To: <ZWdKI9UOZ6INP0Tu@kuha.fi.intel.com>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Wed, 29 Nov 2023 20:45:48 +0200
Message-ID: <CAH3L5QoisDsG3Lk_uKL73MbV8KeJFDj=fBCV7dRoYKjCgzwSYw@mail.gmail.com>
Subject: Re: [PATCH] USB: typec: tps6598x: use device 'type' field to identify devices
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, rogerq@kernel.org, christophe.jaillet@wanadoo.fr, 
	a-govindraju@ti.com, trix@redhat.com, abdelalkuor@geotab.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 4:26=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> Sorry to keep you waiting.

No worries.
I know how this works: maintainers do what they can, when they can.

>
> On Thu, Nov 23, 2023 at 11:00:21PM +0200, Alexandru Ardelean wrote:
> > Using the {of_}device_is_compatible function(s) is not too expensive.
> > But since the driver already needs to match for the 'struct tipd_data'
> > device parameters (via device_get_match_data()), we can add a simple 't=
ype'
> > field.
> >
> > This adds a minor optimization in certain operations, where we the chec=
k
> > for TPS25750 (or Apple CD321X) is a bit faster.
> >
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >  drivers/usb/typec/tipd/core.c | 34 ++++++++++++++++++++++------------
> >  1 file changed, 22 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/cor=
e.c
> > index fbd23de5c5cb..69d3e11bb30c 100644
> > --- a/drivers/usb/typec/tipd/core.c
> > +++ b/drivers/usb/typec/tipd/core.c
> > @@ -105,7 +105,14 @@ static const char *const modes[] =3D {
> >
> >  struct tps6598x;
> >
> > +enum tipd_type {
> > +     TIPD_TYPE_TI_TPS6598X,
> > +     TIPD_TYPE_APPLE_CD321X,
> > +     TIPD_TYPE_TI_TPS25750X,
> > +};
> > +
> >  struct tipd_data {
> > +     enum tipd_type type;
> >       irq_handler_t irq_handler;
> >       int (*register_port)(struct tps6598x *tps, struct fwnode_handle *=
node);
> >       void (*trace_power_status)(u16 status);
>
> Why not just match against the structures themselves?
>
>         if (tps->data =3D=3D &tps25750_data)

Sure.
This version also works.
I've been more accustomed to the enum version.
Will update.

As a broader context, this patch came along from trying to backport
some patches back to 5.15.
device_is_compatible() is not present i 5.15
of_device_is_compatible is present there.
It seemed like doing a neutral version (between 5.15 and latest
kernel) looks like a good idea.

>                 ...
>
> > @@ -1195,7 +1202,6 @@ tps25750_register_port(struct tps6598x *tps, stru=
ct fwnode_handle *fwnode)
> >
> >  static int tps6598x_probe(struct i2c_client *client)
> >  {
> > -     struct device_node *np =3D client->dev.of_node;
> >       struct tps6598x *tps;
> >       struct fwnode_handle *fwnode;
> >       u32 status;
> > @@ -1211,11 +1217,19 @@ static int tps6598x_probe(struct i2c_client *cl=
ient)
> >       mutex_init(&tps->lock);
> >       tps->dev =3D &client->dev;
> >
> > +     if (dev_fwnode(tps->dev))
> > +             tps->data =3D device_get_match_data(tps->dev);
> > +     else
> > +             tps->data =3D i2c_get_match_data(client);
> > +
> > +     if (!tps->data)
> > +             return -EINVAL;
> > +
> >       tps->regmap =3D devm_regmap_init_i2c(client, &tps6598x_regmap_con=
fig);
> >       if (IS_ERR(tps->regmap))
> >               return PTR_ERR(tps->regmap);
> >
> > -     is_tps25750 =3D device_is_compatible(tps->dev, "ti,tps25750");
> > +     is_tps25750 =3D (tps->data->type =3D=3D TIPD_TYPE_TI_TPS25750X);
> >       if (!is_tps25750) {
> >               ret =3D tps6598x_read32(tps, TPS_REG_VID, &vid);
> >               if (ret < 0 || !vid)
> > @@ -1229,7 +1243,7 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
> >       if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> >               tps->i2c_protocol =3D true;
> >
> > -     if (np && of_device_is_compatible(np, "apple,cd321x")) {
> > +     if (tps->data->type =3D=3D TIPD_TYPE_APPLE_CD321X) {
> >               /* Switch CD321X chips to the correct system power state =
*/
> >               ret =3D cd321x_switch_power_state(tps, TPS_SYSTEM_POWER_S=
TATE_S0);
> >               if (ret)
> > @@ -1247,13 +1261,6 @@ static int tps6598x_probe(struct i2c_client *cli=
ent)
> >                       TPS_REG_INT_PLUG_EVENT;
> >       }
> >
> > -     if (dev_fwnode(tps->dev))
> > -             tps->data =3D device_get_match_data(tps->dev);
> > -     else
> > -             tps->data =3D i2c_get_match_data(client);
> > -     if (!tps->data)
> > -             return -EINVAL;
> > -
> >       /* Make sure the controller has application firmware running */
> >       ret =3D tps6598x_check_mode(tps);
> >       if (ret < 0)
> > @@ -1366,7 +1373,7 @@ static void tps6598x_remove(struct i2c_client *cl=
ient)
> >       usb_role_switch_put(tps->role_sw);
> >
> >       /* Reset PD controller to remove any applied patch */
> > -     if (device_is_compatible(tps->dev, "ti,tps25750"))
> > +     if (tps->data->type =3D=3D TIPD_TYPE_TI_TPS25750X)
> >               tps6598x_exec_cmd_tmo(tps, "GAID", 0, NULL, 0, NULL, 2000=
, 0);
> >  }
> >
> > @@ -1396,7 +1403,7 @@ static int __maybe_unused tps6598x_resume(struct =
device *dev)
> >       if (ret < 0)
> >               return ret;
> >
> > -     if (device_is_compatible(tps->dev, "ti,tps25750") && ret =3D=3D T=
PS_MODE_PTCH) {
> > +     if (tps->data->type =3D=3D TIPD_TYPE_TI_TPS25750X && ret =3D=3D T=
PS_MODE_PTCH) {
> >               ret =3D tps25750_init(tps);
> >               if (ret)
> >                       return ret;
> > @@ -1419,6 +1426,7 @@ static const struct dev_pm_ops tps6598x_pm_ops =
=3D {
> >  };
> >
> >  static const struct tipd_data cd321x_data =3D {
> > +     .type =3D TIPD_TYPE_APPLE_CD321X,
> >       .irq_handler =3D cd321x_interrupt,
> >       .register_port =3D tps6598x_register_port,
> >       .trace_power_status =3D trace_tps6598x_power_status,
> > @@ -1426,6 +1434,7 @@ static const struct tipd_data cd321x_data =3D {
> >  };
> >
> >  static const struct tipd_data tps6598x_data =3D {
> > +     .type =3D TIPD_TYPE_TI_TPS6598X,
> >       .irq_handler =3D tps6598x_interrupt,
> >       .register_port =3D tps6598x_register_port,
> >       .trace_power_status =3D trace_tps6598x_power_status,
> > @@ -1433,6 +1442,7 @@ static const struct tipd_data tps6598x_data =3D {
> >  };
> >
> >  static const struct tipd_data tps25750_data =3D {
> > +     .type =3D TIPD_TYPE_TI_TPS25750X,
> >       .irq_handler =3D tps25750_interrupt,
> >       .register_port =3D tps25750_register_port,
> >       .trace_power_status =3D trace_tps25750_power_status,
> > --
> > 2.42.1
>
> thanks,
>
> --
> heikki

