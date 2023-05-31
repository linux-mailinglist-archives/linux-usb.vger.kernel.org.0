Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13008717499
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 06:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbjEaEAl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 00:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbjEaEAk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 00:00:40 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498F1FC
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 21:00:38 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-39817f3e08eso1803905b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 21:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685505637; x=1688097637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHDjygTzLc8sdyc1LG6xEWQa/iYL6FBSkCQhU3z4NP8=;
        b=JN3BNR5Fi0IsPQhZUhp+eZFypsOzPoYvnVm5WW9sYoUlnByaWouL4H3+bGoR1b8yXi
         gpn59Xd6SlU7dChSNjbUY1lbCrm6/ELMrWQpiIDYvdoyB8Ij+FyUNSUSHATgMHohb4bF
         j1PzGfJOZ3D26vbXPP+yHhfG0eGDYVM/uoUbpPA0X0TsJN0kN50Kizeek36AooaBIpuD
         hNFnKn+NDmTG5PlINhGk47zGTmEz6vyMyHMSaGLvPUA/OIyEcve8wEnw5EnYg56V9EPT
         zyokWa/WGuE6y+TSkk5cYyukWu7TsBp2Bo0d6HmCCNCMvStAoNC/qRcYZ0TPG+OVPxLB
         DWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685505637; x=1688097637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHDjygTzLc8sdyc1LG6xEWQa/iYL6FBSkCQhU3z4NP8=;
        b=jEy/bNYJGRPVng2hfmlexidPJRirPwOFxnWn2seestO/iG7JhYIq11o4nmVywOnJtr
         5UNNqDO2GHY4mE+X7OxPO5ey8dMfpXIPLZzzJgdFHfqLN1JHTlcdsBFO4Mg+KSFkTHB2
         zH2Pye8h1NKMjkAr6o3kHWxQLEld83OrF3716CuWPxQQSkTGQ1mYdYgbxM5bvYdZLvf1
         Vf4eiTMLBYFWAuo0+eT5G7FIVfyq1PTnHEHwSEaur0CK+0Wt51r5oQivcxvEvDdPNL2p
         hmS2u1ovWtimD4ZTpWY/71p+YKWXqtI8fA7cgdRMixHi0pOCR753yyJPJPCyrdd0mPEP
         NMHg==
X-Gm-Message-State: AC+VfDwWsMrDc49R3uSQEC4XrAM1HX6Y+bluLresXMdS5HTET5Y5de7q
        9W5Wv7e/ciZrYureJ3EG1ZkVZzA+qN/g9eDQ1CQcmw==
X-Google-Smtp-Source: ACHHUZ4XQp19jHbybQDPbBGoNA4plMsHL9Pu5+K+hOlTvfM9WMNUJ4Sh840UxXWosKdyIljG4Tc3rz1Gg86cx0wV84Q=
X-Received: by 2002:a05:6808:3315:b0:398:45e0:38c0 with SMTP id
 ca21-20020a056808331500b0039845e038c0mr2361190oib.15.1685505637404; Tue, 30
 May 2023 21:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230529234816.3720623-1-badhri@google.com> <20230529234816.3720623-3-badhri@google.com>
 <eca2b381-2b1f-47de-8385-ea448f2cbdb3@rowland.harvard.edu>
In-Reply-To: <eca2b381-2b1f-47de-8385-ea448f2cbdb3@rowland.harvard.edu>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 30 May 2023 21:00:00 -0700
Message-ID: <CAPTae5+iPW2Cr-+yodZ26wtSTo=GAwAZn9q39JyAcUBJ1CzmKw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] usb: gadget: udc: core: Offload
 usb_udc_vbus_handler processing
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, colin.i.king@gmail.com,
        xuetao09@huawei.com, quic_eserrao@quicinc.com,
        water.zhangjiantao@huawei.com, peter.chen@freescale.com,
        balbi@ti.com, francesco@dolcini.it, alistair@alistair23.me,
        stephan@gerhold.net, bagasdotme@gmail.com, luca@z3ntu.xyz,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 29, 2023 at 6:08=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, May 29, 2023 at 11:48:16PM +0000, Badhri Jagan Sridharan wrote:
> > chipidea udc calls usb_udc_vbus_handler from udc_start gadget
> > ops causing a deadlock. Avoid this by offloading usb_udc_vbus_handler
> > processing.
>
> This is not a good explanation.  In particular, it doesn't explain why
> moving the processing to a workqueue is the proper solution.
>
> You should describe the issue I raised earlier, namely, that
> usb_udc_vbus_handler() has to run in interrupt context but it calls
> usb_udc_connect_control(), which has to run in process context.  And
> explain _why_ these routines have to run in those contexts.
>
> > ---
> >  drivers/usb/gadget/udc/core.c | 269 ++++++++++++++++------------------
> >  1 file changed, 123 insertions(+), 146 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/cor=
e.c
> > index 4641153e9706..26380e621e9f 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> > @@ -38,9 +38,10 @@ static const struct bus_type gadget_bus_type;
> >   * for udcs who do not care about vbus status, this value is always tr=
ue
> >   * @started: the UDC's started state. True if the UDC had started.
> >   * @connect_lock: protects udc->vbus, udc->started, gadget->connect, g=
adget->deactivate related
> > - * functions. usb_gadget_connect_locked, usb_gadget_disconnect_locked,
> > - * usb_udc_connect_control_locked, usb_gadget_udc_start_locked, usb_ga=
dget_udc_stop_locked are
> > - * called with this lock held.
> > + * functions. usb_gadget_pullup_update_locked called with this lock he=
ld.
> > + * @vbus_events: list head for processing vbus updates on usb_udc_vbus=
_handler.
> > + * @vbus_events_lock: protects vbus_events list
> > + * @vbus_work: work item that invokes usb_gadget_pullup_update_locked.
> >   *
> >   * This represents the internal data structure which is used by the UD=
C-class
> >   * to hold information about udc driver and gadget together.
> > @@ -53,6 +54,20 @@ struct usb_udc {
> >       bool                            vbus;
> >       bool                            started;
> >       struct mutex                    connect_lock;
> > +     struct list_head                vbus_events;
> > +     spinlock_t                      vbus_events_lock;
> > +     struct work_struct              vbus_work;
>
> Do you really need three new fields here?  Isn't vbus_work sufficient?

Ack. Just the vbus_work is sufficient as vbus can be updated to the
latest value.
Addressing in v5.

>
> > +     bool                            unbinding;
>
> Do not include this in the same patch.  The unbinding flag does
> something different from the vbus_work structure, so it belongs in a
> different patch.

Sure, uploaded as a separate patch in v5.
However, I named it allow_start instead as I believe that UDC should
neither be started nor pulled up when unbound.
Let me know your thoughts in v5 !

>
> > +};
> > +
> > +/**
> > + * struct vbus_event - used to notify vbus updates posted through usb_=
udc_vbus_handler.
> > + * @vbus_on: true when vbus is on. false other wise.
> > + * @node: list node for maintaining a list of pending updates to be pr=
ocessed.
> > + */
> > +struct vbus_event {
> > +     bool vbus_on;
> > +     struct list_head node;
> >  };
>
> Why do we need this?  Why can't the work routine simply set the pullup
> according to the current setting of vbus and the other flags?  That's
> what usb_udc_vbus_handler() does now.

Ack. Dropping vbus_event and related fields.
>
> >
> >  static struct class *udc_class;
> > @@ -693,40 +708,46 @@ int usb_gadget_vbus_disconnect(struct usb_gadget =
*gadget)
> >  EXPORT_SYMBOL_GPL(usb_gadget_vbus_disconnect);
> >
> >  /* Internal version of usb_gadget_connect needs to be called with conn=
ect_lock held. */
> > -static int usb_gadget_connect_locked(struct usb_gadget *gadget)
> > +static int usb_gadget_pullup_update_locked(struct usb_gadget *gadget)
> >       __must_hold(&gadget->udc->connect_lock)
> >  {
> >       int ret =3D 0;
> > +     bool connect =3D !gadget->deactivated && gadget->udc->started && =
gadget->udc->vbus &&
> > +                    !gadget->udc->unbinding;
>
> Since you are wrapping this line anyway, you might as well wrap it
> before column 76.
>
> >
> >       if (!gadget->ops->pullup) {
> >               ret =3D -EOPNOTSUPP;
> >               goto out;
> >       }
> >
> > -     if (gadget->connected)
> > -             goto out;
> > -
> > -     if (gadget->deactivated || !gadget->udc->started) {
> > -             /*
> > -              * If gadget is deactivated we only save new state.
> > -              * Gadget will be connected automatically after activatio=
n.
> > -              *
> > -              * udc first needs to be started before gadget can be pul=
led up.
> > -              */
> > -             gadget->connected =3D true;
> > -             goto out;
> > +     if (connect !=3D gadget->connected) {
> > +             ret =3D gadget->ops->pullup(gadget, connect);
> > +             if (!ret)
> > +                     gadget->connected =3D connect;
> > +             mutex_lock(&udc_lock);
> > +             if (!connect)
> > +                     gadget->udc->driver->disconnect(gadget);
> > +             mutex_unlock(&udc_lock);
> >       }
>
> What will happen if the gadget isn't deactivated, but it is started and
> VBUS power is prevent and the driver isn't unbinding, but the gadget
> driver decides to call usb_gadget_disconnect()?

Simplified as you recommended to directly call
usb_udc_connect_control() from the work item. So, this is no longer an
issue.

>
> >
> > -     ret =3D gadget->ops->pullup(gadget, 1);
> > -     if (!ret)
> > -             gadget->connected =3D 1;
> > -
> >  out:
> >       trace_usb_gadget_connect(gadget, ret);
> >
> >       return ret;
> >  }
> >
> > +static int usb_gadget_set_vbus(struct usb_gadget *gadget, bool vbus)
> > +{
> > +     int ret;
> > +
> > +     mutex_lock(&gadget->udc->connect_lock);
> > +     gadget->udc->vbus =3D vbus;
>
> Why does this have to be here?  What's wrong with setting vbus in
> interrupt context?
>
> > +     ret =3D usb_gadget_pullup_update_locked(gadget);
> > +     mutex_unlock(&gadget->udc->connect_lock);
>
> Sorry, but at this point I'm getting tired of pointing out all the
> problems in this patch, so I'm going to stop here.
>
> How about instead doing something really simple, like just make
> usb_udc_vbus_handler() queue up a work routine that calls
> usb_udc_connect_control()?  Just a minimal change that will be really
> easy to review.

Ack. v5 now does this.

Thanks for all the feedback,
Badhri
>
> Alan Stern
