Return-Path: <linux-usb+bounces-18813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1FC9FC770
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 02:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEC0B162884
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 01:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10CE1BC41;
	Thu, 26 Dec 2024 01:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuaUOtho"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8D520EB;
	Thu, 26 Dec 2024 01:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735176944; cv=none; b=n4baMF3NvnlSh8B9GVsy3eGuVnR66uWrO4nGD+NlFzU5b5Qa+kEV4kEplO/WYAEZ3HUxfJvSii14t+j2oCMsYLy5qFne2x3w9+dI3pII0b4hgW/cxaeEE42a4Qb1MgeIDBtOUGm+7eygSa8ADtVkzUxnRoKlhMIyDw6Pngx4kzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735176944; c=relaxed/simple;
	bh=hqKmU9L97aSvrnVadHRl9QT6k8PjNZM0UpyewhJ7Ip0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doV/B+B323XALQzJqutGnzTJtamgcV7z+Xn6OMdAeeNMABdJr+J2uqQYJrUDAcdGYsxd3kgqvnKwTzp1cX3bdFlci/aMwcW4v4hepOxzs1IlkbVwNkcUR86sQ1wTR6ACtUaiYr1wFmG11NVfQ+eEjq+ovhBXdGQ7wBcHAPV5Kxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuaUOtho; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3ea065b79so9022864a12.3;
        Wed, 25 Dec 2024 17:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735176940; x=1735781740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4PenrIQNnHsGl2cUrcpXDd5akVF04hTEthBHZkORDk=;
        b=AuaUOtho0LTkDkopsTfVvgVjRK/Y5HIRFa2LCoeEottzVsL+6aNH+D2DMzZ6O8b5gZ
         +o0M1EfFDyRH/ZnFI2OBOl3XW6omUQ81u2rOu9SpoY4rMi25TKZ3ltUFV6+CUPLPj59u
         BMiquIS7ttG79JQrKHxFY9K5yaLIjVXWI1O9UCW8/3YONf9pVzK1sHiKRTRph4c6MkVk
         8WzGTZRgYL7mWfPAbt2ggCPCMCtPIYJQoS5rdE4I5aqc6Aw+uiiSW4wcdTn/SYNuZ7g+
         S/JS4PYbIZ64xHW1UcpOpZoFZScH9gvC1+7Fy9uMTJE5aJ4uqLRfFnNkk387jOQRXAbj
         gASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735176940; x=1735781740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4PenrIQNnHsGl2cUrcpXDd5akVF04hTEthBHZkORDk=;
        b=IJz8D3uC/FIJhatp8NUInUO5gM5DqVRsNGTBLES5M2Kw3teZJR+s4mNBapmgbrKgLE
         qFrmGW6efhoigVA7UALGP55ewDb+RMoN7Mbs/OhPaIf/RDOjMUkdt3CkPPfJ3DUovXMO
         kmF3A81gK2FdyEwVfls3j78ED4wqkZ/p9XGKCEMM3HrLkCkAT75oatBC9M/XXF/vcZCJ
         d5VB9ZM1hlQt/GaXNyMDWjvv7Y+rYly/VVpo9ew7OFspf7wgAIN+PrtS+uno60PpDEIi
         wJdvn0Atu7AxUVGUjOiSjNOhVgibZSosgmrRdMeEG7yFeGPvqWwzrOPVULf2ztfVc5QK
         DzTw==
X-Forwarded-Encrypted: i=1; AJvYcCU/cCGUEqvOJWnWwab1eZc3JoyDelDTbW+IzGdMOC0biA6a3wlMP59ryfVvCa4ddYNH6sYGStQi+hrpffo=@vger.kernel.org, AJvYcCVqVHYWpbFxsPz0uGN1Boqk1z9qBw2nfdB4ASvjgWkK55pRJwnYhyfw+LFi6WGgbuX7Cma5LtBVaW8p@vger.kernel.org
X-Gm-Message-State: AOJu0YwhF3MkQPwnVYfD+nlPI2B/oxU3hm37sC8XSbOTQrHp2ZQZIRo8
	WbKtX0cfOmg/aT7Gw8h13pihG4MZVz5xnD8kIqmbZTxrbp8XtHKfXR5Mqkqx8FRcyYOyVorEKWv
	6MsU4fkhr5Rs/BczOKk5/VVcGts0=
X-Gm-Gg: ASbGncsFkGaHPjOuBbrHuYLvT+eyrm4jsc3c9HMASgxnkq2q/S8WtLtpyPB65QeYzVz
	38/ElX9Oz3HrYMsjwtwXgy06CXXZIH/aQ0MJ4ztNOwX2G+z4T8qY4OBZJvg9YWDBQWvEoSUY=
X-Google-Smtp-Source: AGHT+IHOo8dbTtET0zbKZz5hsSDElTNRWem7NsZ2Vsu3n7rE5HSJZiGeJzKFZ6lfAMkOSBKbaLdpndnMuHf0LrQ16xY=
X-Received: by 2002:a05:6402:50d0:b0:5d1:1f1:a283 with SMTP id
 4fb4d7f45d1cf-5d81dd849efmr17302409a12.4.1735176939747; Wed, 25 Dec 2024
 17:35:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215205358.4100142-1-zmw12306@gmail.com> <2024121606-preflight-lure-e02c@gregkh>
 <CAN4iqtQGJw+Nyt_K+uMSfpqXhfzGN4nLmFTPdEydyAf_wsWMog@mail.gmail.com> <2024122307-thaw-payback-b175@gregkh>
In-Reply-To: <2024122307-thaw-payback-b175@gregkh>
From: Mingwei Zheng <zmw12306@gmail.com>
Date: Wed, 25 Dec 2024 20:35:28 -0500
X-Gm-Features: AbW1kvZfQCAUmWejgjD_45nPBJrc3nM6sCEQMIG7NJ4x-Pr71rqva-jSqioW84Q
Message-ID: <CAN4iqtSCaty9XwBVPMUDm_M=tsSHGnjc0=YokW_WanZXa7qaPg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: m66592-udc: Add check for clk_enable()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, Dec 23, 2024 at 12:46=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Dec 17, 2024 at 10:06:26PM -0500, Mingwei Zheng wrote:
> > Hi Greg,
> >
> > On Mon, Dec 16, 2024 at 2:56=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Sun, Dec 15, 2024 at 03:53:58PM -0500, Mingwei Zheng wrote:
> > > > Add check for the return value of clk_enable() to catch the potenti=
al
> > > > error.
> > > >
> > > > Fixes: b4822e2317e8 ("usb: gadget: m66592-udc: Convert to use modul=
e_platform_driver()")
> > > > Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> > > > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > >
> > > Why this order of signed-off-by lines?  Shouldn't yours be last?  Who
> > > wrote this patch?
> > >
> >
> > I listed two names because both of us co-authored this patch.
> >
> > > > ---
> > > >  drivers/usb/gadget/udc/m66592-udc.c | 6 +++++-
> > > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadg=
et/udc/m66592-udc.c
> > > > index a938b2af0944..bf408476a24c 100644
> > > > --- a/drivers/usb/gadget/udc/m66592-udc.c
> > > > +++ b/drivers/usb/gadget/udc/m66592-udc.c
> > > > @@ -1606,7 +1606,11 @@ static int m66592_probe(struct platform_devi=
ce *pdev)
> > > >                       ret =3D PTR_ERR(m66592->clk);
> > > >                       goto clean_up2;
> > > >               }
> > > > -             clk_enable(m66592->clk);
> > > > +             ret =3D clk_enable(m66592->clk);
> > > > +             if (ret) {
> > > > +                     clk_put(m66592->clk);
> > > > +                     goto clean_up2;
> > > > +             }
> > >
> > > How did you find this and how was it tested?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > We found it through a static analysis tool.
>
> Then you need to properly document that as our documentation says it is
> required, right?
>
> thanks,
>
> greg k-h

   I send a PATCH v2 specifying the tool name in the commit msg for
your review. Thank you so much for your suggestion!

Best,
Mingwei

