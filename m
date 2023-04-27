Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAF76F0086
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 07:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239435AbjD0Fzw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 01:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjD0Fzw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 01:55:52 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD143585
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 22:55:50 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-44066390652so2897599e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 22:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682574950; x=1685166950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2xEoH6z4fSJ9lyG0SfoAWXa7481t4r9SXTo268fZqI=;
        b=At3ufFwDR6jeLBEorzHtARerjvaKekwdwwVlCG4LCiiaBL9XxQgAEelcwvKFZznUMu
         rQqdZexNFB571dBaGAcpQFVfUQ4woLS5bb3cM2q6JoaPbQ7ohxGzTvVJAZpIzM1U3AHh
         8jfGszgLMlZLW8KMnqPttATakSTFZb8TViEvmFh+mXfKzV5pmjjq2G1m5ixwM8eesBDj
         LbklOGyOeOKzjXZ0zcQusfKsGJf7NzpYAqW6yYdppCeyw0i6G35HLS1uZqGGz2LAXivs
         cfRJKsZpybMqwVml+Oibv58bNqi2Hu/Yfm42AK8XjsXuU2ZVJohiKqhvg1wi6ADGoUEQ
         HLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682574950; x=1685166950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2xEoH6z4fSJ9lyG0SfoAWXa7481t4r9SXTo268fZqI=;
        b=Urukyv77dxOdAwl2KwN2RFkWBGmf8y0oYVBrPoroPGUc9TSZ7LJv3yy+zuO60IPYg8
         9m5JPELlRV0/T+zUkjDdF/zCslDeB/r2vjg46FxMvKGy/op5FGvGmXVElo2e5E7kOnrs
         Vk7SykAIBFxy+CQ0gyH+6r3na1cf3xWQN9qmOxl4z8r5/XZ0PAt7rROhw2wCo+39XR1i
         YHBjHFtvvlA/lR2X3XdDt3SNJeUGt3C1hse2MnjkLp41PYutK/5T+vNy4nFwrT0rw5jF
         0t1X13xBbBaFVGRTW6D2/Y3MMcusnBkrF8w3AEbcu6X/ETlL1Qtz37MLgKqMt06aduhO
         YF0Q==
X-Gm-Message-State: AC+VfDzZa5f0FyOQDWAZMJRUWETTOgiE9+2t0vh5yrvOSZkRoqO5hCTv
        quHi0jwbeWN36hE9zLUK81o2Mb5QuG27xgtIrD3Tvvh2mTStZw==
X-Google-Smtp-Source: ACHHUZ4Px+9f/a8MHPhcQIgGHuqb9aQbrfIthSq0lkBl3Oz8FFBuqH9PRYBQhYK5E46dVIL+RjX3dMl/SeCYgn3NzDg=
X-Received: by 2002:a67:ebd2:0:b0:430:2ac0:ed10 with SMTP id
 y18-20020a67ebd2000000b004302ac0ed10mr236638vso.18.1682574949510; Wed, 26 Apr
 2023 22:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230426114528.3996-1-wlodzimierz.lipert@gmail.com> <99b09680-b362-431c-aa9f-a07722d0eba3@rowland.harvard.edu>
In-Reply-To: <99b09680-b362-431c-aa9f-a07722d0eba3@rowland.harvard.edu>
From:   Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Date:   Thu, 27 Apr 2023 07:55:13 +0200
Message-ID: <CABygZEqTLfa3ydW_HAdGmBVCgr0nXyj9k0ZFeHGcy+tMDmgm_g@mail.gmail.com>
Subject: Re: [PATCH v2] usb: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss (bitmap).
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Thanks for the feedback, could you please see my comments below.
Mask logic is not clear straight away and I probably should be more
verbose in patch description.
Maybe you could reconsider the changes.

On Thu, Apr 27, 2023 at 3:08=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Wed, Apr 26, 2023 at 01:45:28PM +0200, Wlodzimierz Lipert wrote:
> > usb_ep_autoconfig_ss tries to use endpoint name or internal counters to=
 generate
> > bEndpointAddress - this leads to duplicate addresses. Fix changes the
> > way in/out_epnum is used, now as bitmap which represents unavailable ep=
 numbers.
> >
> > Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
> > ---
> >  drivers/usb/gadget/epautoconf.c | 35 ++++++++++++++++++++++-----------
> >  include/linux/usb/gadget.h      |  4 ++--
> >  2 files changed, 26 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/epaut=
oconf.c
> > index 1eb4fa2e623f..50a2e8a90447 100644
> > --- a/drivers/usb/gadget/epautoconf.c
> > +++ b/drivers/usb/gadget/epautoconf.c
> > @@ -67,6 +67,11 @@ struct usb_ep *usb_ep_autoconfig_ss(
> >  )
> >  {
> >       struct usb_ep   *ep;
> > +     unsigned *epnum_map;
> > +     /* ep num 0 is reserved: not available for auto configuration */
> > +     u8 num =3D 1;
> > +     /* USB allows up to 16 IN and 16 OUT enpoints */
> > +     unsigned num_mask =3D 0xFFFFU;
>
> I think these initializers aren't needed.  They apply only in the case
> where the endpoint name doesn't encode a number.

initialization is needed to ensure we stay within 16 bits and we don't
try to use bit 0.

>
> >       if (gadget->ops->match_ep) {
> >               ep =3D gadget->ops->match_ep(gadget, desc, ep_comp);
> > @@ -94,18 +99,25 @@ struct usb_ep *usb_ep_autoconfig_ss(
> >       /* report address */
> >       desc->bEndpointAddress &=3D USB_DIR_IN;
> >       if (isdigit(ep->name[2])) {
> > -             u8 num =3D simple_strtoul(&ep->name[2], NULL, 10);
> > -             desc->bEndpointAddress |=3D num;
> > -     } else if (desc->bEndpointAddress & USB_DIR_IN) {
> > -             if (++gadget->in_epnum > 15)
> > +             num =3D simple_strtoul(&ep->name[2], NULL, 10);
> > +             if (num > 15)
> >                       return NULL;
>
> This check shouldn't be here, at least, not in this form.  If num > 15
> it's a bug in the UDC driver; we could report it that way.
>

the check is there to make logic below work,
its return value is consistent with the rest of the cases.

> > -             desc->bEndpointAddress =3D USB_DIR_IN | gadget->in_epnum;
> > -     } else {
> > -             if (++gadget->out_epnum > 15)
> > -                     return NULL;
> > -             desc->bEndpointAddress |=3D gadget->out_epnum;
> > +             num_mask =3D 1U << num;
> >       }
> >
> > +     epnum_map =3D desc->bEndpointAddress & USB_DIR_IN
> > +             ? &gadget->in_epnum : &gadget->out_epnum;
> > +
> > +     /* check if requested ep number (if name encodes it) or any is av=
ailable */
> > +     if (num_mask =3D=3D (*epnum_map & num_mask))
> > +             return NULL;
> > +
> > +     /* find first available ep number (if not encoded in ep name) */
> > +     while (*epnum_map & (1U << num))
> > +             ++num;
>
> This rearrangement of the code is kind of awkward.  It would be better
> to put the availability check for the encoded-number case into the "if"
> clause, and put the search inside an "else" section, rather than trying
> to combine two rather different computations into a single piece of
> code.  That way you wouldn't need num_mask at all.
>
> Also, your "while" loop doesn't enforce num <=3D 15.  For that matter, it
> might be more efficient to use a "find first bit" library routine rather
> than coding your own loop.

The code structure tries to make the amount of branches minimal,
 this why I introduced mask and epnum_map ptr.
num <=3D 15 is enforced by mask itself:
 " if (num_mask =3D=3D (*epnum_map & num_mask))" will return NULL
in case "encoded" ep is already unavailable or all the ep are unavailable s=
o
we wont go any further (avoiding inc. num above 15).

>
> > +
> > +     *epnum_map |=3D 1U << num;
> > +     desc->bEndpointAddress |=3D num;
> >       ep->address =3D desc->bEndpointAddress;
> >       ep->desc =3D NULL;
> >       ep->comp_desc =3D NULL;
> > @@ -208,7 +220,8 @@ void usb_ep_autoconfig_reset (struct usb_gadget *ga=
dget)
> >               ep->claimed =3D false;
> >               ep->driver_data =3D NULL;
> >       }
> > -     gadget->in_epnum =3D 0;
> > -     gadget->out_epnum =3D 0;
> > +     /* ep num 0 is reserved: not available for auto configuration */
> > +     gadget->in_epnum =3D 1U;
> > +     gadget->out_epnum =3D 1U;
>
> This change doesn't really do anything, since the search doesn't allow
> num =3D=3D 0 anyway.

yes this change is there for consistency - if anyone tries to use it.

>
> >  }
> >  EXPORT_SYMBOL_GPL(usb_ep_autoconfig_reset);
> > diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> > index 6a178177e4c9..1e00e22202bc 100644
> > --- a/include/linux/usb/gadget.h
> > +++ b/include/linux/usb/gadget.h
> > @@ -343,8 +343,8 @@ struct usb_gadget_ops {
> >   *   and sometimes configuration.
> >   * @dev: Driver model state for this abstract device.
> >   * @isoch_delay: value from Set Isoch Delay request. Only valid on SS/=
SSP
> > - * @out_epnum: last used out ep number
> > - * @in_epnum: last used in ep number
> > + * @out_epnum: bitmap of allocated out ep numbers
> > + * @in_epnum: bitmap of allocated in ep numbers
>
> Should these be changed to u16?  I guess it doesn't matter...

tried to avoid struct padding changes

>
> >   * @mA: last set mA value
> >   * @otg_caps: OTG capabilities of this gadget.
> >   * @sg_supported: true if we can handle scatter-gather
>
> Alan Stern



--=20
BR/Pozdrawiam. Wlodzimierz Lipert
