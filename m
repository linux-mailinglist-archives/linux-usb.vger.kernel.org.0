Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 338E96F0878
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 17:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244178AbjD0PhO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 11:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbjD0PhN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 11:37:13 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B743FFF
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 08:37:11 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-76fd0036c7fso2479320241.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682609831; x=1685201831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8H+Ae2x09VxlZvAPPxcNnM+S7wCQOF3wW+awX90keE=;
        b=SylQFBebzMs5/wF9TDbQcNGFwpnbgxAeLIEUVbk4RWu2bHYQEBdAGm9VXOdtC951ci
         yELx24El2d+9lBQMVNHjIdIPQW0PycYSNJTCNW+uzGNk8t16eSbzvggpvteGPps91m4/
         yGl1CLNZ8x5L53odm7d8t46R5AHjafAqr8YP1NHVhRX3EzOpqGbaNFhmD2ynQBdAWuHb
         g/ZVRZ6rmv5R6c4GgO/jgkjadetPsLiDq/IhNGP0rL/w+tR6whHbb/+1TV+w/sozB0YT
         oMkG4lss1OgKTal5de4OIA4AhrGAZYFuxCFPEG/N4nNf1rDbRVABBoDeFL5mN+gr5mKK
         xOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682609831; x=1685201831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8H+Ae2x09VxlZvAPPxcNnM+S7wCQOF3wW+awX90keE=;
        b=jhssmueDdb2+qlwjW3Mn18iJyB/fSUFZ58GmmmDsUzZqMyy9SIyAD+ZNcmKMUhHkns
         DZXd6EPVWqbCgDEOp1AoW2GgivYOpprVBiEpv1HWppsIvu5uRlfLM72k7wruhAmy6+b4
         vEoCw6iz26MUaYyxNFvc9n00/XWZBKMz/EWSNCqLsQT7K8Vt4vYqavOtuJ8RX//GCuaS
         SuEfq7WMrPYBaE8iFgjyC/GrG/01HeM9VvimsObO0mdytr3vfrxrSmgmEndjOMNHFm2/
         s02iDXeYgejgmx69Cs1GMi5XC9ln6S9QFxiqSA/ePmYuAQdPXIQH+N0ZbrvZjV7fDK1X
         Ur4w==
X-Gm-Message-State: AC+VfDzyf+mLiYOQLR52gpzqfe+PvWgoBkTN+GGAXWo//p9Al2S8yVtg
        uvpwew2CjB7/BQiSWz986FqsuQ3nRu7Qllz+XPo=
X-Google-Smtp-Source: ACHHUZ4xu8HmEn6Njvy7iNrUs2S/Sun1zUWT/2q0vccVesjBLsjRD35as7VorgZco3wJXicChYZ6I5+cNhhW9ROarnQ=
X-Received: by 2002:a67:f98b:0:b0:426:4773:963 with SMTP id
 b11-20020a67f98b000000b0042647730963mr1329224vsq.34.1682609830690; Thu, 27
 Apr 2023 08:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230426114528.3996-1-wlodzimierz.lipert@gmail.com>
 <99b09680-b362-431c-aa9f-a07722d0eba3@rowland.harvard.edu>
 <CABygZEqTLfa3ydW_HAdGmBVCgr0nXyj9k0ZFeHGcy+tMDmgm_g@mail.gmail.com> <8b0684fc-c312-4315-ab01-d45ef7a87725@rowland.harvard.edu>
In-Reply-To: <8b0684fc-c312-4315-ab01-d45ef7a87725@rowland.harvard.edu>
From:   Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Date:   Thu, 27 Apr 2023 17:36:34 +0200
Message-ID: <CABygZEq1u6FXbvjWPsnuiVzRvKNDF+EUYZ8Ze0QARZr3A=amWA@mail.gmail.com>
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

Indeed, easier to follow. What you think about adding the check (below),
IMHO we should not test bits outside of valid range, and it will cover
bugs in ep name.

On Thu, Apr 27, 2023 at 5:18=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Apr 27, 2023 at 07:55:13AM +0200, Wlodzimierz Lipert wrote:
> > Hi Alan,
> >
> > Thanks for the feedback, could you please see my comments below.
> > Mask logic is not clear straight away and I probably should be more
> > verbose in patch description.
> > Maybe you could reconsider the changes.
> >
> > On Thu, Apr 27, 2023 at 3:08=E2=80=AFAM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> > >
> > > On Wed, Apr 26, 2023 at 01:45:28PM +0200, Wlodzimierz Lipert wrote:
> > > > usb_ep_autoconfig_ss tries to use endpoint name or internal counter=
s to generate
> > > > bEndpointAddress - this leads to duplicate addresses. Fix changes t=
he
> > > > way in/out_epnum is used, now as bitmap which represents unavailabl=
e ep numbers.
> > > >
> > > > Signed-off-by: Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
> > > > ---
> > > >  drivers/usb/gadget/epautoconf.c | 35 ++++++++++++++++++++++-------=
----
> > > >  include/linux/usb/gadget.h      |  4 ++--
> > > >  2 files changed, 26 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/gadget/epautoconf.c b/drivers/usb/gadget/e=
pautoconf.c
> > > > index 1eb4fa2e623f..50a2e8a90447 100644
> > > > --- a/drivers/usb/gadget/epautoconf.c
> > > > +++ b/drivers/usb/gadget/epautoconf.c
> > > > @@ -67,6 +67,11 @@ struct usb_ep *usb_ep_autoconfig_ss(
> > > >  )
> > > >  {
> > > >       struct usb_ep   *ep;
> > > > +     unsigned *epnum_map;
> > > > +     /* ep num 0 is reserved: not available for auto configuration=
 */
> > > > +     u8 num =3D 1;
> > > > +     /* USB allows up to 16 IN and 16 OUT enpoints */
> > > > +     unsigned num_mask =3D 0xFFFFU;
> > >
> > > I think these initializers aren't needed.  They apply only in the cas=
e
> > > where the endpoint name doesn't encode a number.
> >
> > initialization is needed to ensure we stay within 16 bits and we don't
> > try to use bit 0.
> >
> > >
> > > >       if (gadget->ops->match_ep) {
> > > >               ep =3D gadget->ops->match_ep(gadget, desc, ep_comp);
> > > > @@ -94,18 +99,25 @@ struct usb_ep *usb_ep_autoconfig_ss(
> > > >       /* report address */
> > > >       desc->bEndpointAddress &=3D USB_DIR_IN;
> > > >       if (isdigit(ep->name[2])) {
> > > > -             u8 num =3D simple_strtoul(&ep->name[2], NULL, 10);
> > > > -             desc->bEndpointAddress |=3D num;
> > > > -     } else if (desc->bEndpointAddress & USB_DIR_IN) {
> > > > -             if (++gadget->in_epnum > 15)
> > > > +             num =3D simple_strtoul(&ep->name[2], NULL, 10);
> > > > +             if (num > 15)
> > > >                       return NULL;
> > >
> > > This check shouldn't be here, at least, not in this form.  If num > 1=
5
> > > it's a bug in the UDC driver; we could report it that way.
> > >
> >
> > the check is there to make logic below work,
> > its return value is consistent with the rest of the cases.
> >
> > > > -             desc->bEndpointAddress =3D USB_DIR_IN | gadget->in_ep=
num;
> > > > -     } else {
> > > > -             if (++gadget->out_epnum > 15)
> > > > -                     return NULL;
> > > > -             desc->bEndpointAddress |=3D gadget->out_epnum;
> > > > +             num_mask =3D 1U << num;
> > > >       }
> > > >
> > > > +     epnum_map =3D desc->bEndpointAddress & USB_DIR_IN
> > > > +             ? &gadget->in_epnum : &gadget->out_epnum;
> > > > +
> > > > +     /* check if requested ep number (if name encodes it) or any i=
s available */
> > > > +     if (num_mask =3D=3D (*epnum_map & num_mask))
> > > > +             return NULL;
> > > > +
> > > > +     /* find first available ep number (if not encoded in ep name)=
 */
> > > > +     while (*epnum_map & (1U << num))
> > > > +             ++num;
> > >
> > > This rearrangement of the code is kind of awkward.  It would be bette=
r
> > > to put the availability check for the encoded-number case into the "i=
f"
> > > clause, and put the search inside an "else" section, rather than tryi=
ng
> > > to combine two rather different computations into a single piece of
> > > code.  That way you wouldn't need num_mask at all.
> > >
> > > Also, your "while" loop doesn't enforce num <=3D 15.  For that matter=
, it
> > > might be more efficient to use a "find first bit" library routine rat=
her
> > > than coding your own loop.
> >
> > The code structure tries to make the amount of branches minimal,
> >  this why I introduced mask and epnum_map ptr.
> > num <=3D 15 is enforced by mask itself:
> >  " if (num_mask =3D=3D (*epnum_map & num_mask))" will return NULL
> > in case "encoded" ep is already unavailable or all the ep are unavailab=
le so
> > we wont go any further (avoiding inc. num above 15).
> >
> > >
> > > > +
> > > > +     *epnum_map |=3D 1U << num;
> > > > +     desc->bEndpointAddress |=3D num;
> > > >       ep->address =3D desc->bEndpointAddress;
> > > >       ep->desc =3D NULL;
> > > >       ep->comp_desc =3D NULL;
>
> Here's what I was thinking of.  Maybe when you see it written out,
> you'll agree that this approach is simpler and easier to follow.
>
>         ...
>         unsigned int    *epmap;
>         unsigned int    num;
>
>         ...
>         epmap =3D (usb_endpoint_dir_in(desc) ?
>                         &gadget->in_epnum : &gadget->out_epnum);
>         if (isdigit(ep->name[2])) {             /* Number encoded in name=
 */
>                 num =3D simple_strtoul(&ep->name[2], NULL, 10);
                 if (num > 15 || *epmap & (1 << num))
>                         return NULL;            /* Endpoint is unavailabl=
e */
>
>         } else {                                /* Find first available *=
/
>                 num =3D ffz(*epnum_map) - 1;
>                 if (num > 15)
>                         return NULL;            /* No endpoints available=
 */
>         }
>
>         *epmap |=3D 1 << num;
>         desc->bEndpointAddress |=3D num;
>         ...
>
> And then of course the usb_ep_autoconfig_reset() routine would set
> both gadget->in_epnum and gadget->out_epnum to 1, like in your patch.
> You could even change their names to in_epmap and out_epmap, which
> better describes their new meaning.
>
> If you want, you could add
>
>                 WARN_ON(num > 15);
>
> immediately after the simple_strtoul() line.  But since it's not there
> now, I don't think it is needed.
>
> Alan Stern



--=20
BR/Pozdrawiam. Wlodzimierz Lipert
