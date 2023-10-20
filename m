Return-Path: <linux-usb+bounces-2014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A37D17E9
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 23:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A088B215E0
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 21:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F256E24A1A;
	Fri, 20 Oct 2023 21:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fFR+74so"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7379200D9
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 21:19:18 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DE0D65
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:19:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507c50b7c36so1734171e87.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697836751; x=1698441551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLj+SmhNGHAbmx7AtEGeh++5cFknBV82w6tQGWOTRUk=;
        b=fFR+74soHuuLOlXUYvHepesfgIPohteqQgR7zOji2DGkYHOGiBKmZ6SZafwfNwOv/k
         JLArwadnDndto4/O0BnTKetXFa17Q8g4CSQR3feRPFk4CHtiudoOmAtxX+PRySf6lsyl
         3eBVL4P9bOl+lW/rC+vvutAQG2vCyYOFLKosE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697836751; x=1698441551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLj+SmhNGHAbmx7AtEGeh++5cFknBV82w6tQGWOTRUk=;
        b=k+2m+SaXLn9aKtT68I2wKWDh71iCUvveXBGxwrTQs4uxouA2ouetfC9U7TEzv0UUPO
         CKPVhgdtsToYexmsgJpH8HevRlhfDtdgn8VPgRwbC4i/7q2hSeLjpLsEmXwqYoEhKuor
         qqELZhsYDR2KOMqkDcM4od1GzvLgC7TDc46FOtsm61ts7LcPIZDKipE4VgIwUm0PkA1e
         I2VJNUFO9gbl2Sj3mxxc2YpvbUc2tozyC1pRgHx9KPvZEmTuCdeERInRqC3WduRChmZo
         7d2pz4gl9O+Y95yEiZiIbo5o7G0JirbfmiPigSiZoNYjRC0cOZnZ5bS5dswdZ5joX28B
         jsEQ==
X-Gm-Message-State: AOJu0YyO1DC4KhBJWZEZ7GLqdYurGz+8adQ2Pjmg/EgoAYXnCvGJ3jJi
	fM92ySoAurzsxj+DuUKIOuCjwhqQULj0GHSp7aEKQkZz
X-Google-Smtp-Source: AGHT+IFMKRNaAQW+A4gGDjlg3deKHVrGzTvuSs4itCHnauFrziz4jz24YzKAV3Fra6Q6z9mLCt4Wqg==
X-Received: by 2002:ac2:5548:0:b0:507:9996:f62b with SMTP id l8-20020ac25548000000b005079996f62bmr2146884lfk.56.1697836751230;
        Fri, 20 Oct 2023 14:19:11 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 22-20020a508756000000b00532eba07773sm2172493edv.25.2023.10.20.14.19.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 14:19:11 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-53f98cbcd76so1457a12.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:19:11 -0700 (PDT)
X-Received: by 2002:a05:600c:4f91:b0:408:3e63:f457 with SMTP id
 n17-20020a05600c4f9100b004083e63f457mr157300wmq.2.1697836257414; Fri, 20 Oct
 2023 14:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231019212130.3146151-1-dianders@chromium.org>
 <20231019142019.v4.5.Ib2affdbfdc2527aaeef9b46d4f23f7c04147faeb@changeid>
 <eaf05cf1486c418790a1b54cbcda3a98@realtek.com> <CAD=FV=XZQ0XXY7XpX2_ubOwGsi0Hw5otHyuJS2=9QzDJsaSGWg@mail.gmail.com>
In-Reply-To: <CAD=FV=XZQ0XXY7XpX2_ubOwGsi0Hw5otHyuJS2=9QzDJsaSGWg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Oct 2023 14:10:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vx60LchWqQbALx_tAzK3hnqwSF949KY+R7yWvxfYPQAQ@mail.gmail.com>
Message-ID: <CAD=FV=Vx60LchWqQbALx_tAzK3hnqwSF949KY+R7yWvxfYPQAQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] r8152: Block future register access if register
 access fails
To: Hayes Wang <hayeswang@realtek.com>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Grant Grundler <grundler@chromium.org>, Edward Hill <ecgh@chromium.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Simon Horman <horms@kernel.org>, 
	Laura Nao <laura.nao@collabora.com>, Alan Stern <stern@rowland.harvard.edu>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 20, 2023 at 8:42=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > > @@ -8293,6 +8394,8 @@ static int rtl8152_post_reset(struct usb_interf=
ace *intf)
> > >         if (!tp)
> > >                 return 0;
> > >
> > > +       rtl_set_accessible(tp);
> > > +
> >
> > Excuse me. I have a new idea. You could check if it is possible.
> > If you remove test_bit(PROBED_WITH_NO_ERRORS, &tp->flags) in pre_reset(=
),
> > the driver wouldn't be unbound and rebound. Instead, you test PROBED_WI=
TH_NO_ERRORS
> > here to re-initialize the device. Then, you could limit the times of US=
B reset, and
> > the infinite loop wouldn't occur. The code would be like the following,
> >
> >         if (!test_bit(PROBED_WITH_NO_ERRORS, &tp->flags)) {
> >                 /* re-init */
> >                 mutex_lock(&tp->control);
> >                 tp->rtl_ops.init(tp);
> >                 mutex_unlock(&tp->control);
> >                 rtl_hw_phy_work_func_t(&tp->hw_phy_work.work);
> >
> >                 /* re-open(). Maybe move after checking netif_running(n=
etdev) */
> >                 mutex_lock(&tp->control);
> >                 tp->rtl_ops.up(tp);
> >                 mutex_unlock(&tp->control);
> >
> >                 /* check if there is any control error */
> >                 if (test_bit(RTL8152_INACCESSIBLE, &tp->flags) {
> >                         if (tp->reg_access_reset_count < REGISTER_ACCES=
S_MAX_RESETS) {
> >                                 /* queue reset again ? */
> >                         } else {
> >                                 ...
> >                         }
> >                         /* return 0 ? */
> >                 } else {
> >                         set_bit(PROBED_WITH_NO_ERRORS, &tp->flags)
> >                 }
> >         }
>
> The above solution worries me.
>
> I guess one part of this is that it replicates some logic that's in
> probe(). That's not necessarily awful, but we'd at least want to
> reorganize things so that they could share code if possible, though
> maybe that's hard to do with the extra grabs of the mutex?
>
> The other part that worries me is that in the core when we added the
> network device that something in the core might have cached bogus data
> about our network device. This doesn't seem wonderful to me.
>
> I guess yet another part is that your proposed solution there has a
> whole bunch of question marks on it. If it's not necessarily obvious
> what we should do in this case then it doesn't feel like a robust
> solution.
>
> It seems like your main concern here is with the potential for an
> infinite number of resets. I have sent up a small patch to the USB
> core [1] addressing this concern. Let's see what folks say about that
> patch. If it is accepted then it seems like we could just not worry
> about it. If it's not accepted then perhaps feedback on that patch
> will give us additional guidance.
>
> In the meantime I'll at least post v5 since I don't want to leave the
> patch up there with the mismatched mutex. I'll have my v5 point at my
> USB core patch.
>
> [1] https://lore.kernel.org/r/20231020083125.1.I3e5f7abcbf6f08d392e31a582=
6b7f234df662276@changeid

OK, Alan responded to the patch above and suggested simply putting the
retry in the probe routine itself. I think that's actually in the same
spirit as your suggestion but addresses the concerns that I had. I
coded it up and tested it and it seems to work, so I posted that as v5
[2]. Please take a look.

[2] https://lore.kernel.org/r/20231020210751.3415723-1-dianders@chromium.or=
g

