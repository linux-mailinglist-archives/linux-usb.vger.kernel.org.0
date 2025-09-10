Return-Path: <linux-usb+bounces-27897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B660BB5212A
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 21:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71DF4481F29
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 19:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAB52D77F7;
	Wed, 10 Sep 2025 19:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QGxFpKUV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6187D255F31
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757532908; cv=none; b=CHh6CJqfVo4WBWH2F50z8yOltMR9TjeuJ9So0HwkeuhDr6hDaJbTodMG9pLHTCu/2zjBrWiq8uQO1sDYvERr9+RDVGaeNP1GPT/Bad9w5YC2SbPfi20Y0uc3FAE/IlpEAJKShqPvE1m/GbgDDbadEkxDewUDZhp7ZnnuM5pm++c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757532908; c=relaxed/simple;
	bh=CsZgHZkr4tn7L9FbK2mdWISDN6hWIqOwGACNjs21v8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2jDHlNC5D5I5ZUXuktrTSCygRLBUc4uzwrQ/29rmFkeqQVysy5YQSMpUsiweMZEHPKmkuyRIzh14nHTmgmm8kRJp7DWmFaKI4nrlNbUPy38VDF9nH7cMGrTnsVIfisjmlLm0D6FjHr9FxFu07ox0WXGHkmwBHOUqP0q8R4EsAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QGxFpKUV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24b28de798cso48469765ad.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757532907; x=1758137707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaN2dDw0Si752HU39sC2oh3UCwyC8xRttQsbnNuAuQ0=;
        b=QGxFpKUVtXTLaLVdDTt+Hvu/saubc3dj7bkeZ3pCFdTr3C4IYOub65Sc66GbbItL+r
         ay/4IFRXKsiTJFt2RMEZFbDM42Zpf8sOR7mdOq0Ut3Yu3nLZtlS/WFQ/znRkCWSXxTod
         OCjD1A1UOJ+vdYy0eO3ImoamujrInjjv+sWhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757532907; x=1758137707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaN2dDw0Si752HU39sC2oh3UCwyC8xRttQsbnNuAuQ0=;
        b=O+kbg9MswjVhtUxfCbaQeaYP130bNDqUFt43k0ZO/eNJmAsTPLvfiQRurvIdHpAb9L
         piAGPhJ+lsx7u6tU6PGVnymB43TyhID1omiSqsd6j1p2HtWwDTVnl0MKLrwdgLwcbc1A
         OX+oBMV58dfQ7pGrAQxbP7mqiJdY2nmGNMUiqdtJXmTWMXojGW7mI3bs20IwqiBV8j3G
         M7vX7PoKvAnXf5RfmccofvJtlrmaPMTbal4lel710o1qP8HCZ6xvvmS+5ywV7u3Jc8KB
         gGvAAS+FDo4zdTEZGesG/Wvp6oYU1quS1PVCIQmDvUAr9G2EhFRJ0blGOr5XA5/JhVOb
         IqQA==
X-Forwarded-Encrypted: i=1; AJvYcCVOdZ4fsZD24sO9OfBrGT9G4zcNbhBQ0KITowGYv4FPNTsWDlex2D/HMkFOvtp84I45djF0A0d5fIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXVsydVaNFkmhQxpcL4xtkdi8tESv15WGnSmGMB07CHw4aTAlv
	0xs44cedDU9ha+T/Cr8lNWWPD/UI3ycTKAj0U3ZSc/KdXEOKnhVP8ZOJJUSFFp12m0UWhuN9jt/
	h7WfyaKw45Xv/HbeQNK7xrxyDTYFcAciIrDQ/oY7G
X-Gm-Gg: ASbGncshrptPrj3FiK4bSeaulDm9mji9+WxOkLZTJGYHN0ERiCYpIAyd7XMcy5+JA8K
	EG8ZinCoiGGs++o1Mlc5VNdCrITiXrCgR7Ss/iKPnh+PZ2vyBBY6tAV6cl7spQ/djc/lvTmv0kK
	wfPBwwyTdrGRuDbJ4zxotBD6YNjNVEHYv0QFV5PTucPlLAdyS9oNoBSzdSaihG6Bz3FXVRGNu83
	R3yzrZpV1LvQJ0PDYrPKXK4ZTGGqBgHrRu+ukR3Y9fG1Q==
X-Google-Smtp-Source: AGHT+IHcU/z69xvrbw57LzdGyVMdV8NdA7YqwzpxDCURSyY8jW/b/eLvZUrXOdxkZd3mY3GdzlFaYXFYXK/MVdtoUuA=
X-Received: by 2002:a17:903:1cd:b0:24b:270e:56f0 with SMTP id
 d9443c01a7336-25173118c26mr237438225ad.29.1757532906699; Wed, 10 Sep 2025
 12:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-2-akuchynski@chromium.org> <2025091018-slather-dispose-015d@gregkh>
In-Reply-To: <2025091018-slather-dispose-015d@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 10 Sep 2025 19:34:55 +0000
X-Gm-Features: Ac12FXwfN-e75qxmficq3kKl06l1JoLVbDE-L4oJXX6Yd_sZeBHeIpXc0h2q7D8
Message-ID: <CAMMMRMcqty7dC=UvwNZX90iVMnJATTPWYTf1fiee5_OoKfxSJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] usb: typec: Add mode_control field to port property
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 1:30=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 05, 2025 at 02:22:02PM +0000, Andrei Kuchynski wrote:
> > This new field in the port properties dictates whether the Platform Pol=
icy
> > Manager (PPM) allows the OS Policy Manager (OPM) to change the currentl=
y
> > active, negotiated alternate mode.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/class.c | 9 ++++++---
> >  drivers/usb/typec/class.h | 2 ++
> >  include/linux/usb/typec.h | 2 ++
> >  3 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 67a533e35150..9f86605ce125 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -457,11 +457,13 @@ static umode_t typec_altmode_attr_is_visible(stru=
ct kobject *kobj,
> >                                            struct attribute *attr, int =
n)
> >  {
> >       struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj)=
);
> > +     struct typec_port *port =3D typec_altmode2port(adev);
> >
> >       if (attr =3D=3D &dev_attr_active.attr)
> > -             if (!is_typec_port(adev->dev.parent) &&
> > -                 (!adev->ops || !adev->ops->activate))
> > -                     return 0444;
> > +             if (!is_typec_port(adev->dev.parent)) {
> > +                     if (!port->mode_control || !adev->ops || !adev->o=
ps->activate)
> > +                             return 0444;
> > +             }
> >
> >       return attr->mode;
> >  }
> > @@ -2681,6 +2683,7 @@ struct typec_port *typec_register_port(struct dev=
ice *parent,
> >       }
> >
> >       port->pd =3D cap->pd;
> > +     port->mode_control =3D !cap->no_mode_control;
> >
> >       ret =3D device_add(&port->dev);
> >       if (ret) {
> > diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> > index db2fe96c48ff..c53a04b9dc75 100644
> > --- a/drivers/usb/typec/class.h
> > +++ b/drivers/usb/typec/class.h
> > @@ -80,6 +80,8 @@ struct typec_port {
> >        */
> >       struct device                   *usb2_dev;
> >       struct device                   *usb3_dev;
> > +
> > +     bool                            mode_control;
>
> Shouldn't this go up higher in this structure, to avoid the hole you
> created, and to take advantage of the existing hole?  Perhaps after
> orientation?
>

I will replace the variable.

Thanks,
Andrei

