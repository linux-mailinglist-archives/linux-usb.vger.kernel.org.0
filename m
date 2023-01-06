Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A9965F946
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 02:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbjAFBpR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 20:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjAFBpP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 20:45:15 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9203E32264
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 17:45:14 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id s22so212089ljp.5
        for <linux-usb@vger.kernel.org>; Thu, 05 Jan 2023 17:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eo6Au0G3Kir1k6soEftFaIGSQxJPJXA0HZtGP6fqjD8=;
        b=H0x6yGqQNDn/cOKPJVisflhd5HwSljldTw6Ha11o1L+UA7v3mfbW2A3BqZetBa1X63
         xKKbXEbSItcDgN0oPSe5Sfszd9e1svWpCTs+YZgVHhgXnQSYWGbgUcC9T1db5wvJ8LHy
         pZwRU8wmD9T8ivyH3a0jbjLBVXROWmdRCk4Yr84e2QWFov3AoP94ycluN6tNEEafIydS
         V1tinkM7GQtJpvWDVQYeCFfV+17QCMYlRjX/ojFrMM6LkPnuco29MvoNib3wMttuD5MM
         /vdMzYHgU1zU1qaeOtMtvoudCLozfZ9IqYeZofSTc/g5DQR73NQoNb0cvGyazJTm9Ym8
         VnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eo6Au0G3Kir1k6soEftFaIGSQxJPJXA0HZtGP6fqjD8=;
        b=V7TtiW4PPds66EiPR1bofN55Lvl97MRG05M/J/YCjZ2ZcuQhmBZM7KmvhYuP3s7WYc
         Lw7Jz1AKJaNTgF2hRfZce+K1HamXhaCFcfY8pvz/KwdYQ40k/RoInSwOgjAAnAVOZRtO
         8tPCXJagwNPSIm8cgtV3tbWYu9Db8Qr47kpa25Cgxc9wCFpc+xKo0nMy5A4uFGYlkP1Y
         o+JR+YaXHva8i/5YJHGotkek5uWD4r11LqRjoca4PmoDky/9HHgzrChTqtVWvjCKC6dR
         LpsQeJSMmUBLkIieEPET9nA4h0d28iLYHCRhxxvc6tgz1qWmispXLVVA0GKyOfBKnC5W
         FApA==
X-Gm-Message-State: AFqh2krK0rk2erQukn2jxSWqRJoJ6bgfDbgkN7u5ZLaYdE69EalAS5Y7
        yOvi/fHVQrTm9bta0QxL4JmH7iQjy+Z4/cZ+F/Ojkw==
X-Google-Smtp-Source: AMrXdXuicmNVxBgzkhQL2j1AFOlDVjKAnFnaOTtDcQi+ULtJIGHNG+o18ue68tQqol6nYpK3WVFmySVC9Izhxar61BU=
X-Received: by 2002:a2e:9c88:0:b0:27f:c33f:e732 with SMTP id
 x8-20020a2e9c88000000b0027fc33fe732mr1481495lji.91.1672969512862; Thu, 05 Jan
 2023 17:45:12 -0800 (PST)
MIME-Version: 1.0
References: <20230105075058.924680-1-jun.nie@linaro.org> <20230105075058.924680-2-jun.nie@linaro.org>
 <d0191001-d31e-1e65-0594-12dbb789392e@linaro.org>
In-Reply-To: <d0191001-d31e-1e65-0594-12dbb789392e@linaro.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Fri, 6 Jan 2023 09:45:39 +0800
Message-ID: <CABymUCMnBmGDjZtu2eHoRRBrsBT22JXfmYJWOXb3urUhgho+mQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: tipd: Support wakeup
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, sven@svenpeter.dev,
        shawn.guo@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bryan O'Donoghue <bryan.odonoghue@linaro.org> =E4=BA=8E2023=E5=B9=B41=E6=9C=
=885=E6=97=A5=E5=91=A8=E5=9B=9B 19:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On 05/01/2023 07:50, Jun Nie wrote:
> > Enable wakeup when pluging or unpluging USB cable. It is up to other
> > components to hold system in active mode, such as display, so that
> > user can receive the notification.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >   drivers/usb/typec/tipd/core.c | 38 ++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 38 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/cor=
e.c
> > index 46a4d8b128f0..485b90c13078 100644
> > --- a/drivers/usb/typec/tipd/core.c
> > +++ b/drivers/usb/typec/tipd/core.c
> > @@ -95,6 +95,7 @@ struct tps6598x {
> >       struct power_supply_desc psy_desc;
> >       enum power_supply_usb_type usb_type;
> >
> > +     int wakeup;
> >       u16 pwr_status;
> >   };
> >
> > @@ -846,6 +847,12 @@ static int tps6598x_probe(struct i2c_client *clien=
t)
> >       i2c_set_clientdata(client, tps);
> >       fwnode_handle_put(fwnode);
> >
> > +     tps->wakeup =3D device_property_read_bool(tps->dev, "wakeup-sourc=
e");
> > +     if (tps->wakeup) {
> > +             device_init_wakeup(&client->dev, true);
> > +             enable_irq_wake(client->irq);
> > +     }
>
> Does the ordering of device_init_wakeup() and enable_irq_wake() matter ?
>
> The sequence in drivers/usb/typec/tcpm/tcpci_maxim.c is
> enable_irq_wake() and then device_init_wakeup() ?

With reading related code, I believe it is better to put device_init_wakeup=
()
before enable_irq_wake() logically. Though it shall not matter in real worl=
d.

device_init_wakeup() register the wakeup source and setup sysfs etc, which
is puerly software side infrastructure. enable_irq_wake() setup interrupt
configuration, including software and hardware sides. I assume there is no
suspend/resume process involves wakeup event before probe function finish
in real world. If there is, device_init_wakeup() should come before before
enable_irq_wake() strictly.

- Jun

>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
