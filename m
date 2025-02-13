Return-Path: <linux-usb+bounces-20578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F01A33908
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 08:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3BAA188706D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 07:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F5120AF87;
	Thu, 13 Feb 2025 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DCqA4QEy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22420AF7A
	for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2025 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739432403; cv=none; b=KHksI231XpRVHSjx6MaxFC/rVkkfSzBCMFXHYvwClOpMu8/Lu3BYRuXIMM1LJHuLvfhHZoL39kiZoL2s2ljSO1aCliklfw+5SLHGDuA2cIpY7xjM4myRP/NzLHFOoRs3j5X9q/uqwu4ovVvZjTyTflcF33EON39tar6kLwvkV2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739432403; c=relaxed/simple;
	bh=2T30BevOB9XiIxAoHVVgmvnHj9B+QRiUyFtk7KSMJE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukDXyacoZ2aDd+mTIuVsk8/SCwkg2DBbs7sDbgpXt+kf9OK6h/RBHr4aBqja1JlQX74700jiF6Zj07d0hIo0HEazhbVlia6e3g7yByNtUNM9/ya300KKxNerRtlMHQc9ZFqaAfm4vLuiMO1LFmJTCrVjMqXkiqVC/eguXMfgOoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DCqA4QEy; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5fc69795ecbso284900eaf.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2025 23:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739432400; x=1740037200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nn3iWZ9Vvx98SyYpyhfzHaWOOngUmcQwzZmkfNNZfS8=;
        b=DCqA4QEyU1gPMGh2pDHzuRIZk2Z/7fUD6S8/D7/YFC5GSoOqm+mbzA5BoGOW+nLpGh
         KbmWY2oN8qZB5LKrkjE4m2gbHkXiub6Lr/Yi61TQHV8ziwwSULPM/imMYNmWcL2LQSKB
         HTzEggFXxN/ovRk/fkqICEDJmZAkvgYqoj+MTwmw8EUFGpT0RRpbfQpbOhyi8F4PdDtV
         J6EdvfSVWox2Gmd3R9D7OKoOslakbA9KX6x02EMHqN2EQh7zW1kxApanqpYBFlTBFk31
         Ct4eZMM9Q3ZuIZOvw2KcZGa8PfT25C0f2cOcYrx7R3FQAqvl17CV2/kT6lOAf6odsRxH
         TqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739432400; x=1740037200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nn3iWZ9Vvx98SyYpyhfzHaWOOngUmcQwzZmkfNNZfS8=;
        b=uTIdrU14auSHxgPWuojxdVY2AdkOMRXuRJe9RSB8skW8kiNyDZ1Z3fpTEVLM/A0EAa
         BK+JwB9B0PoECWTKl8ZOtyB6EmrpyzvtrY3EVGouEZzlqAW8Yjb4kECGbs17v9K2smzB
         KPkrJYUpzCoFLjEkZZEYP29vVA06No265SEclDWT8K8J+O3wp0wZBrBl2GwhpJw34FPJ
         ZhdfwKmW5ZL8Zle/dnaiX6tk6VozfFIgim+PFNYC3yMsaJSR9P+zwSpMzUUP+EH53RI3
         kzNU57q0McqMDN5k9CnrVrhmKJukGfaK97V+Hc2Mv1Q04vOT+fTxSArczeQLF4zEq/Co
         7JDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9NMBsfnU0TtYSdOfmH89pktRN7KUrNOTond8MeM2SFy+7mtn6GvfBpsKJxdLMY424/uHygjoDRHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEgwwg9z8HEm3yGb0bFrFK3TDWy2c0hWWpLd5nn8mcqm6d19vI
	bkmP57aE9DuBPTSVVyWPXz8Au1j7QKFzpqVS/9ex73wxgD6BnVRZ+ImotEYtC7xVsEU6wBRhbke
	L/1nRxAuGLLSzkvkjrS+YIlZZ4Z6oep1E0KDU
X-Gm-Gg: ASbGnctjEcv1HZf1AnmRPwa/e7OM7EwLnSF7qN/R2568HDCNZrPX25ZsPk7psK3Jclu
	Jg9GWQhvnnN4QLpPSJrLY5fuJxOzbmcBAb1YBOSLwaOrcMkFh6MKw0OXNAHY/JjDTZKVGmmynU5
	zZjXS6J4NRUWTgOlFU0RSaDMVs4bptvA==
X-Google-Smtp-Source: AGHT+IEmWRZMThO2wEWSszSDzWm2q2TnncSjr48IcwK+B9Ld8r0dbyztwtW5YcyGOGFQFHmYF4WhC8//RaVtCQyIZYI=
X-Received: by 2002:a05:6871:551:b0:28c:8476:dd76 with SMTP id
 586e51a60fabf-2b8d67bc79fmr4365708fac.29.1739432400498; Wed, 12 Feb 2025
 23:40:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208033129.3524423-1-badhri@google.com> <20250211002155.62lyfqjlygod7cdp@synopsys.com>
 <CAPTae5LisYMjx63Jz_xmZ9zA5PtaxRA49gh2FA-fONsJ12sXeg@mail.gmail.com> <20250211005508.qeselc6eakgnys74@synopsys.com>
In-Reply-To: <20250211005508.qeselc6eakgnys74@synopsys.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 12 Feb 2025 23:39:24 -0800
X-Gm-Features: AWEUYZnIe5TMgsUPDmshm_Nttj-h2KlK1DcEzbN4aiPOxceFmMNfSjaqjTDAWOo
Message-ID: <CAPTae5+RENJkgSLJAfzh-LryHvkU+i12ELjYqo_b22CT5HXm7w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Prevent irq storm when TH re-executes
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 4:55=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Mon, Feb 10, 2025, Badhri Jagan Sridharan wrote:
> > .
> >
> > On Mon, Feb 10, 2025 at 4:22=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Sat, Feb 08, 2025, Badhri Jagan Sridharan wrote:
> > > > While commit d325a1de49d6 ("usb: dwc3: gadget: Prevent losing event=
s in
> > > > event cache") makes sure that top half(TH) does not end up overwrit=
ing the
> > > > cached events before processing them when the TH gets invoked more =
than one
> > > > time, returning IRQ_HANDLED results in occasional irq storm where t=
he TH
> > > > hogs the CPU. The irq storm can be prevented by clearing the flag b=
efore
> > > > event handler busy is cleared. Default enable interrupt moderation =
in all
> > > > versions which support them.
> > > >
> > > > ftrace event stub during dwc3 irq storm:
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000866: irq_handler_ex=
it: irq=3D14 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000872: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000874: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000881: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000883: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000889: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000892: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000898: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000901: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000907: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000909: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000915: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000918: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000924: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000927: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000933: irq_handler_en=
try: irq=3D504 name=3Ddwc3
> > > >     irq/504_dwc3-1111  ( 1111) [000] .... 70.000935: irq_handler_ex=
it: irq=3D504 ret=3Dhandled
> > > >     ....
> > > >
> > > > Cc: stable@kernel.org
> > > > Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > > > Fixes: d325a1de49d6 ("usb: dwc3: gadget: Prevent losing events in e=
vent cache")
> > > > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > > > ---
> > > >  drivers/usb/dwc3/core.c   |  2 +-
> > > >  drivers/usb/dwc3/gadget.c | 10 +++++++---
> > > >  2 files changed, 8 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > > > index dfa1b5fe48dc..6df971ef7285 100644
> > > > --- a/drivers/usb/dwc3/core.c
> > > > +++ b/drivers/usb/dwc3/core.c
> > > > @@ -1835,7 +1835,7 @@ static void dwc3_get_properties(struct dwc3 *=
dwc)
> > > >       dwc->tx_thr_num_pkt_prd =3D tx_thr_num_pkt_prd;
> > > >       dwc->tx_max_burst_prd =3D tx_max_burst_prd;
> > > >
> > > > -     dwc->imod_interval =3D 0;
> > > > +     dwc->imod_interval =3D 1;
> > >
> > > Use dwc3_has_imod() to determine whether to set this. Otherwise we ge=
t
> > > a warning on setups that don't support imod.
> >
> > Hi Thinh,
> >
> > dwc3_check_params() which gets invoked after dwc3_get_properties() at
> > https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v6.14-rc1/=
source/drivers/usb/dwc3/core.c*L1851__;Iw!!A4F2R9G_pg!Zar83WUe4sM-EF4c2wR2-=
vWBJHgYOCWEc1ijhOsWQHiXtzCF0d_t2gckS0YJUv4lAZgGZl2C-oSp1QMIx28$
> > seems to already call dwc3_has_imod(). Do you prefer me to add an
> > explicit check here as well ?
> >
>
> Yes. I don't want to see dev_warn print when there shouldn't be any for
> setup that don't support imod.

Hi Thinh,

Looks like adding dwc3_has_imod() in dwc3_get_properties() would not
be possible as the dwc->revision gets filled in much later at
dwc3_core_is_valid():
https://elixir.bootlin.com/linux/v6.14-rc2/source/drivers/usb/dwc3/core.c#L=
2218,
also, the core is still not brought out of reset yet. Would it be
reasonable to initialize dwc->imod_interval to 1 in
dwc3_check_params() like below ?

+++ b/drivers/usb/dwc3/core.c
@@ -1835,8 +1835,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
        dwc->tx_thr_num_pkt_prd =3D tx_thr_num_pkt_prd;
        dwc->tx_max_burst_prd =3D tx_max_burst_prd;

-       dwc->imod_interval =3D 1;
-
        dwc->tx_fifo_resize_max_num =3D tx_fifo_resize_max_num;
 }

@@ -1858,6 +1856,8 @@ static void dwc3_check_params(struct dwc3 *dwc)
        if (dwc->imod_interval && !dwc3_has_imod(dwc)) {
                dev_warn(dwc->dev, "Interrupt moderation not supported\n");
                dwc->imod_interval =3D 0;
+       } else if (!dwc->imod_interval && dwc3_has_imod(dwc)) {
+               dwc->imod_interval =3D 1;
        }

Thanks,
Badhri

>
> BR,
> Thinh

