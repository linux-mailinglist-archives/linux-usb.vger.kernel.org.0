Return-Path: <linux-usb+bounces-20699-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B9BA37810
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 23:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4CB16C0AF
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 22:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EF61A23B5;
	Sun, 16 Feb 2025 22:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1q9/ySNc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10117B421
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 22:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739745148; cv=none; b=ogyIZ1lK+aQSD6sIC52LeN0BMsZsSdF5c893A5xBB+mH4KyQbnXyAzTf8V4IhejptmKOk0wyRPJa/BbC/r+jkGHbs7vRODs6djQk87M+FLmJXWAyngl14NS+dmJoDWpv7LUjhxxHRiI2U3yWRcCfeEE7rjJK0aLBDkFFkmtf9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739745148; c=relaxed/simple;
	bh=tdI+oIN/tO9TuxIoZAOrI65UU5MhsPdm2dzbxucnf08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5sj/EObhrPa6Zf++xZncgOhkAcboNEl5u9mY5wZoSN2a/tzB94XimaJ5pvjt0hm924aNotkrBbP/BAFD7H4lRHtcjkIJKq+P6at1DD4+XGGogVf5OZJ525wNJT4ZLG48PpPyPEpnbdxdr59APBrmEmJdiNggQGZFAgQGsrPJg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1q9/ySNc; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3f3e8e959d5so1033704b6e.0
        for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 14:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739745145; x=1740349945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/rUh+CVB78Vypb0kxzr8Cgzng5gMOmCsEYl8kNCe+o=;
        b=1q9/ySNc1umN3IYybaXt1E7TBJzk/3tptp9xk7E0PFvy3sDmfbpNuARBKoICUFvvdJ
         TUscyeQC9mq8xxDCReKk484Ht/w1A54TU3CrUjz3uGhbcrOkFnvrBT4iyTnDe0kfpyS6
         HxJFv87Emh68Up15s2Er8b1+kDYzNVEnipKwp/Id6k0KGobZZVDSewePBalMfh88UIGD
         Z8NHqrECABDL7UzHOVy4AtM9Xbdk2OaORFKcXLyJMBp0N4jfvd4wgsOeX8J5EVPj3hlf
         Oi6hJdxmXXouA52pDshULX46iWs9tEVpLtnZvY24rXH9Et5FGIZimbpGFH/KrJEGufC4
         etDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739745145; x=1740349945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/rUh+CVB78Vypb0kxzr8Cgzng5gMOmCsEYl8kNCe+o=;
        b=QqQiOioN54A4IMxdbnfEhtRK0RgQGkybr7h4YVObtL1rj8cs8Sy9xhY19KjdsOJ4rR
         xF7WN/15aXrCTy8PbjWh9pgTzjoWTugx3OWxoS7e26un37MvSAR9YLkO2xx6AIWpdX7l
         /pqlzwv8VCJvkL3Vyt6weJLwvbA8EWWzfThbMegCXlGqXlMcJhy3VFsorKBUhlvHg78B
         ISDsIWNkwo5nmWV+zAuEn86hOXalu0PUExoxDi5fE/0iMn/XkTV27MXy8cMffZHVSbG9
         0DI0RSL+F3e9Cv3zpvGTBP07W5YRvha4KOX2x4VK6zlee17lPTW4a7KCMfadZdYe7gwt
         8dIg==
X-Forwarded-Encrypted: i=1; AJvYcCW679FVG7Ps7BIfDf4WDKel1mjNbMV0hzdfWkA3kuY/0vLL50ENQCtXO7Tjq/Sw4JQQwAOj7KchWjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6hSD/lFrwc92ORINxS2iBpoG8WgSnS0CBPsuA3Y/7OYA8F3mR
	R22keH3cK5QDVEeOaaBZluVbLu4RFFd0knTfj7P3EPv5ZuhG0PApt+RNyQI8iWATchyAapasDTI
	jCzAO0hM83Gb/EQtilzRumnGrj553OaFuZN7izsVFTV/to2Fj0w1F
X-Gm-Gg: ASbGnctwe5a/pE4kYK1cO05bZH7oa80dFuZvKJPhgvaJfMxBWgW/CRgT5sd+yNLCY0m
	zoEuiftHcsZ1oVSg6+9kDZYETw3nXqh2Y2gy5HuRQBC56ColoCKTAJBFvL9cQpjcWcu/xS206Bj
	l4ZplyRPXKP9MennO5gpKzQVFiFJ0=
X-Google-Smtp-Source: AGHT+IFbi7s1NIZvofF0AhrEdWXltDvRZei3qZG3g4jM5ZlkUT7bIV9G/wo6MQGk38JgDazQH3mQqvFARhsBlIaAp3Y=
X-Received: by 2002:a05:6808:384d:b0:3f3:ba6b:8174 with SMTP id
 5614622812f47-3f3d90d9ad6mr10333175b6e.8.1739745145024; Sun, 16 Feb 2025
 14:32:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208033129.3524423-1-badhri@google.com> <20250211002155.62lyfqjlygod7cdp@synopsys.com>
 <CAPTae5LisYMjx63Jz_xmZ9zA5PtaxRA49gh2FA-fONsJ12sXeg@mail.gmail.com>
 <20250211005508.qeselc6eakgnys74@synopsys.com> <CAPTae5+RENJkgSLJAfzh-LryHvkU+i12ELjYqo_b22CT5HXm7w@mail.gmail.com>
 <20250213222858.3l54lmgfq55o7yc5@synopsys.com>
In-Reply-To: <20250213222858.3l54lmgfq55o7yc5@synopsys.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Sun, 16 Feb 2025 14:31:48 -0800
X-Gm-Features: AWEUYZmkRrQrQdokNUgGybniLGe4W3P_6erF9zgnNPRfR9oMjd1lIsIHVIkfe4w
Message-ID: <CAPTae5KEc+E7FyY-k11v3NJFzOwwPO29v8+zqqapAdO5STjh_w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Prevent irq storm when TH re-executes
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 2:29=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Wed, Feb 12, 2025, Badhri Jagan Sridharan wrote:
> > On Mon, Feb 10, 2025 at 4:55=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Mon, Feb 10, 2025, Badhri Jagan Sridharan wrote:
> > > > .
> > > >
> > > > On Mon, Feb 10, 2025 at 4:22=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@=
synopsys.com> wrote:
> > > > >
> > > > > On Sat, Feb 08, 2025, Badhri Jagan Sridharan wrote:
> > > > > > While commit d325a1de49d6 ("usb: dwc3: gadget: Prevent losing e=
vents in
> > > > > > event cache") makes sure that top half(TH) does not end up over=
writing the
> > > > > > cached events before processing them when the TH gets invoked m=
ore than one
> > > > > > time, returning IRQ_HANDLED results in occasional irq storm whe=
re the TH
> > > > > > hogs the CPU. The irq storm can be prevented by clearing the fl=
ag before
> > > > > > event handler busy is cleared. Default enable interrupt moderat=
ion in all
> > > > > > versions which support them.
> > > > > >
> > > > > > ftrace event stub during dwc3 irq storm:
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000866: irq_handle=
r_exit: irq=3D14 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000872: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000874: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000881: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000883: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000889: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000892: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000898: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000901: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000907: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000909: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000915: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000918: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000924: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000927: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000933: irq_handle=
r_entry: irq=3D504 name=3Ddwc3
> > > > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000935: irq_handle=
r_exit: irq=3D504 ret=3Dhandled
> > > > > >     ....
> > > > > >
> > > > > > Cc: stable@kernel.org
> > > > > > Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > > > > > Fixes: d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events =
in event cache")
> > > > > > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > > > > > ---
> > > > > >  drivers/usb/dwc3/core.c   |  2 +-
> > > > > >  drivers/usb/dwc3/gadget.c | 10 +++++++---
> > > > > >  2 files changed, 8 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > > > > > index dfa1b5fe48dc..6df971ef7285 100644
> > > > > > --- a/drivers/usb/dwc3/core.c
> > > > > > +++ b/drivers/usb/dwc3/core.c
> > > > > > @@ -1835,7 +1835,7 @@ static void dwc3_get_properties(struct dw=
c3 *dwc)
> > > > > >       dwc->tx_thr_num_pkt_prd =3D tx_thr_num_pkt_prd;
> > > > > >       dwc->tx_max_burst_prd =3D tx_max_burst_prd;
> > > > > >
> > > > > > -     dwc->imod_interval =3D 0;
> > > > > > +     dwc->imod_interval =3D 1;
> > > > >
> > > > > Use dwc3_has_imod() to determine whether to set this. Otherwise w=
e get
> > > > > a warning on setups that don't support imod.
> > > >
> > > > Hi Thinh,
> > > >
> > > > dwc3_check_params() which gets invoked after dwc3_get_properties() =
at
> > > > https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v6.14-=
rc1/source/drivers/usb/dwc3/core.c*L1851__;Iw!!A4F2R9G_pg!Zar83WUe4sM-EF4c2=
wR2-vWBJHgYOCWEc1ijhOsWQHiXtzCF0d_t2gckS0YJUv4lAZgGZl2C-oSp1QMIx28$
> > > > seems to already call dwc3_has_imod(). Do you prefer me to add an
> > > > explicit check here as well ?
> > > >
> > >
> > > Yes. I don't want to see dev_warn print when there shouldn't be any f=
or
> > > setup that don't support imod.
> >
> > Hi Thinh,
> >
> > Looks like adding dwc3_has_imod() in dwc3_get_properties() would not
> > be possible as the dwc->revision gets filled in much later at
> > dwc3_core_is_valid():
> > https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v6.14-rc2/=
source/drivers/usb/dwc3/core.c*L2218__;Iw!!A4F2R9G_pg!d67RghVyoDYTtMqlnAcNg=
HywoW0ZfJnYX1NSjokyqaBnPrdiF4w0FlFgTGDEVcSZeUHfpBGIgQtx_UAa1t0$ ,
> > also, the core is still not brought out of reset yet. Would it be
> > reasonable to initialize dwc->imod_interval to 1 in
> > dwc3_check_params() like below ?
> >
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1835,8 +1835,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >         dwc->tx_thr_num_pkt_prd =3D tx_thr_num_pkt_prd;
> >         dwc->tx_max_burst_prd =3D tx_max_burst_prd;
> >
> > -       dwc->imod_interval =3D 1;
> > -
> >         dwc->tx_fifo_resize_max_num =3D tx_fifo_resize_max_num;
> >  }
> >
> > @@ -1858,6 +1856,8 @@ static void dwc3_check_params(struct dwc3 *dwc)
> >         if (dwc->imod_interval && !dwc3_has_imod(dwc)) {
> >                 dev_warn(dwc->dev, "Interrupt moderation not supported\=
n");
> >                 dwc->imod_interval =3D 0;
> > +       } else if (!dwc->imod_interval && dwc3_has_imod(dwc)) {
> > +               dwc->imod_interval =3D 1;
> >         }
> >
>
> Can you consolidate all the settings of IMOD to the below:

Done Thinh !
Sent out V3 version of the patch:
https://lore.kernel.org/all/20250216223003.3568039-1-badhri@google.com/

Thanks,
Badhri

>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 423866b2ffaa..a485fef82301 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2021,21 +2021,19 @@ static void dwc3_check_params(struct dwc3 *dwc)
>         unsigned int hwparam_gen =3D
>                 DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3);
>
> -       /* Check for proper value of imod_interval */
> -       if (dwc->imod_interval && !dwc3_has_imod(dwc)) {
> -               dev_warn(dwc->dev, "Interrupt moderation not supported\n"=
);
> -               dwc->imod_interval =3D 0;
> -       }
> -
>         /*
> +        * Enable IMOD for all supporting controllers.
> +        *
> +        * Particularly, DWC_usb3 v3.00a must enable this feature for
> +        * the following reason:
> +        *
>          * Workaround for STAR 9000961433 which affects only version
>          * 3.00a of the DWC_usb3 core. This prevents the controller
>          * interrupt from being masked while handling events. IMOD
>          * allows us to work around this issue. Enable it for the
>          * affected version.
>          */
> -       if (!dwc->imod_interval &&
> -           DWC3_VER_IS(DWC3, 300A))
> +       if (dwc3_has_imod((dwc)))
>                 dwc->imod_interval =3D 1;
>
>
> Thanks,
> Thinh

