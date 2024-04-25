Return-Path: <linux-usb+bounces-9745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 101ED8B179E
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 02:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C6351F2553F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 00:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E30F9F0;
	Thu, 25 Apr 2024 00:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iMjaJ6VT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9E3D6A
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 00:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714003238; cv=none; b=D9lTnFrEDhe3UMXXNCAgzGKYdqD3OGojL49+UWIqvtHAHf5ohqPfjW8H5hvZpxL74jnvEMUKcef4qNnFr7c3VOoFEjH1zaENkw25ArTFjf0p+xyQB1scpsBPC0S2UyxXY/5UrcLIzxte/j9xYY1bYlOzQbMdw4kgdE5LHyEocFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714003238; c=relaxed/simple;
	bh=MBEImIE/uf/WSqljiC9XbZNccgouCdO8Skm4a/1yecU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FL6TucjJcrMBJCutl8iUe66FHcRIpDrfx9rfHg//ifogySs6wA+kzBMMPILJzUoaggRcEYpUY8sos2hXuUAq//Ydc9qyv3ioKWVCGSq+qF1+skhRq5SIDLhHmWw/hpWY0wevCtrWZRdLs5sxlIKThkbP/vQHMBRH4vjbKYGEPwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iMjaJ6VT; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso524745276.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 17:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714003236; x=1714608036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8amuByFemR4m00/qLVXHYywQQB/OO/nQVwREqVEGLXs=;
        b=iMjaJ6VTO6QzBbOQsShcIZdpJmlk8p0WE6lBOGeIXijjWg21TZNxSSEjouFgrCHR3V
         KdJgCbTU7BhnXmnkWbkwaN+KSWrK4nLLEAmdNaf10GzBKNCayf7g9TzihSAjx6DM2Jg8
         8P6BL08ndLUmnsvJgXsYzAHRr1ysx7eAOlDxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714003236; x=1714608036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8amuByFemR4m00/qLVXHYywQQB/OO/nQVwREqVEGLXs=;
        b=QkmGiGK4FSREpmho53yy8MUDjzSefm1Gw2lMrFkUjVr4ygGeafbKFIvyc+NXmYfhRM
         ADum6gXezYfRHWvMTUBzrizO4Bxi6ZdB3SIQ5hzccRjYnCwohOCdQtdZJus+SVPUP8Wf
         alN7Goo0FXXCe4f/ng1fjpOMIGe90HPJWGhnaQgYiSxbdPm1I+LayVRw95nX72f+fRgl
         llslsjgXpjz5+0m8Fwbhp82QnGC3VbMjf4wmnIbw4uPBcLQDbK0i8L45EukjvjELEHgd
         aaNEmGEbeBLdZgTvuM6KK0C9nTlGFKqcjjiKepkI8oW2k6lMOwfnSuiWxrZo/wd/8/6N
         E++A==
X-Forwarded-Encrypted: i=1; AJvYcCXgSX985T6JXXZ7rNT1MJhQYEFcxmnfRxFHiLU7suXMs2fCc8I9TRexNLIJoJyAI64NvhxXtypeY56wGefv5PDk/IznLNF6MKzo
X-Gm-Message-State: AOJu0Yw1TpcWMjXBtOt13kVD/MkePClLtbdn8e1qv55AH+Yzqrd28BA/
	Z8UZK6HfrHoNB1ezqL/lljDDuBXT3nmGG3HSPcU48l1rjOELyCwSB3w+H5HAspn4e6t7dCzaWTI
	/29w4L60A2a1Yk9WKKDiFXogkMz0RyR61xk2F
X-Google-Smtp-Source: AGHT+IH7S3Ay2JrJHBsmbPvnAj1QI5yAXv3Ej/lVdIrjvv1IozZI+l3zW9bj/sSEleLf2fkzcVwUwR3dmow/4Hn/FWc=
X-Received: by 2002:a25:26d2:0:b0:dcf:b5b7:c72 with SMTP id
 m201-20020a2526d2000000b00dcfb5b70c72mr4116337ybm.0.1714003235737; Wed, 24
 Apr 2024 17:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424014821.4154159-1-jthies@google.com> <20240424014821.4154159-2-jthies@google.com>
 <CAA8EJpq_DujhwoJ87Cg4gZ4LNdPu4i93EQ0VeKrCJPkeDj9ThQ@mail.gmail.com>
In-Reply-To: <CAA8EJpq_DujhwoJ87Cg4gZ4LNdPu4i93EQ0VeKrCJPkeDj9ThQ@mail.gmail.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 24 Apr 2024 17:00:24 -0700
Message-ID: <CANFp7mVGYhMYXdCGEJQ9GoqB-kpk4UquUWEcvqVnRFMrih+R9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jameson Thies <jthies@google.com>, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@google.com, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 7:06=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 24 Apr 2024 at 04:48, Jameson Thies <jthies@google.com> wrote:
> >
> > From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> >
> > ucsi_register_altmode checks IS_ERR on returned pointer and treats
> > NULL as valid. This results in a null deref when
> > trace_ucsi_register_altmode is called. Return an error from
> > ucsi_register_displayport when it is not supported and register the
> > altmode with typec_port_register_altmode.
> >
> > Reviewed-by: Jameson Thies <jthies@google.com>
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> > Changes in V2:
> > - Checks for error response from ucsi_register_displayport when
> > registering DisplayPort alternate mode.
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 3 +++
> >  drivers/usb/typec/ucsi/ucsi.h | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index cb52e7b0a2c5c..f3b413f94fd28 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -361,6 +361,9 @@ static int ucsi_register_altmode(struct ucsi_connec=
tor *con,
> >                 switch (desc->svid) {
> >                 case USB_TYPEC_DP_SID:
> >                         alt =3D ucsi_register_displayport(con, override=
, i, desc);
> > +                       if (IS_ERR(alt) && PTR_ERR(alt) =3D=3D -EOPNOTS=
UPP)
>
> This makes it ignore EOPNOTSUPP if it is returned by the non-stub
> implementation. I think the current state is actually better than the
> implementation found in this patch. I'd suggest adding a comment to
> ucsi_register_displayport() stub instead.

So originally on my system, I didn't have the displayport driver
config enabled. My expectation was that the alt-mode would show up but
would not be controllable (like all other alt-modes without drivers).
What ends up happening is that no alt-mode shows up and trying to
enable the trace crashes.

When the displayport support isn't there, I think it should just be
enumerated as a normal, unsupported alt-mode.



>
> > +                               alt =3D typec_port_register_altmode(con=
->port, desc);
> > +
> >                         break;
> >                 case USB_TYPEC_NVIDIA_VLINK_SID:
> >                         if (desc->vdo =3D=3D USB_TYPEC_NVIDIA_VLINK_DBG=
_VDO)
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucs=
i.h
> > index c4d103db9d0f8..c663dce0659ee 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -496,7 +496,7 @@ ucsi_register_displayport(struct ucsi_connector *co=
n,
> >                           bool override, int offset,
> >                           struct typec_altmode_desc *desc)
> >  {
> > -       return NULL;
> > +       return ERR_PTR(-EOPNOTSUPP);
> >  }
> >
> >  static inline void
> > --
> > 2.44.0.769.g3c40516874-goog
> >
>
>
> --
> With best wishes
> Dmitry

