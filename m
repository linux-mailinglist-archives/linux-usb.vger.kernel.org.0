Return-Path: <linux-usb+bounces-15470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F79865A2
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 19:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBF7AB22DBB
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 17:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF53E57880;
	Wed, 25 Sep 2024 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M4mDH0/i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD7722EE8
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727285509; cv=none; b=dTvtp0xjWe00OGF3YFpO2+LwnQtMesuvoKMu1kFmcuf0ZExQgZCJnUcasDrjWuOSMuKLg4tze7LlvYYrrEyCsi4LVwydjvITcC2MIZ1kKYxH0dmmlWis1l3zWIq0xk6cIAnYXD33CRMIN39W5YQ3eqH5XeI+eFAtnci7e7BMHsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727285509; c=relaxed/simple;
	bh=AsiidYyDiQ7aCzf8VNXogBUE8Ky+6+7IQkomdzNyO1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkq6PXzx5WII6zYRZAgUUIXZlbpAjwYlt4R/YwdPf+m3DTV0pIYO6GDkqlS6EcL4pK3Z27MtXRKCDZiRAKuRdorLDzx4auIoqZ/8DBVCZPGTmPvwaS5hl9ATFZzNXk+GeqaHxoMXakzygdD9921g0giU3Ej20Aun+rtWjCtqgNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M4mDH0/i; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e1a90780f6dso102012276.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 10:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727285507; x=1727890307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foQOdpYay332QgWU2K1U9huYqUmxout+sEt9nqJbTuc=;
        b=M4mDH0/iypWi+S+UHz7k2z1zL/YZcTrFCs8Mw8YDRCIa7vQ+5PLkt3t9Zzda14oR6n
         J9to4j6u5WdJydlM9vIKODWRbLF0xRmkzOef9ipDd5CG6BC3yUKheVtnfLCZCCh2Ur4w
         4Y71qDK6S0Ze5pSoI5F1UCjQuP6qst8n3nnFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727285507; x=1727890307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foQOdpYay332QgWU2K1U9huYqUmxout+sEt9nqJbTuc=;
        b=YH8OzivgKsbJJCohnF/oUHSrC5npnGswoemrhAftDsHI9Xs4DVa8ssfv51rbdE/Qz+
         HA/+pfVvGj0CutBroK4H70f8MprDFeqQKu5P0bw2vqR2tX0QSBaFpYiLW6f2oZpOBTZ4
         37w+Ugm8Tdx4D7lZWlPJu9KI3Ue1E1zY9jC460bVbYPU7rxXcrL1laYjv5GsGe45h8CX
         WIsUHuQpefhAJKQVnY4RHlyB9Pb05m/J7wm71ulLY1KWasIWyU7LrPLMfPKRZ0klCS4e
         o+t6T505Zr2yS9znryZSC02eDDltb61oPNHLtdfKmOA+veVb9pjtkfBcnYTRPkkn0hXi
         Fxlw==
X-Forwarded-Encrypted: i=1; AJvYcCWGtPgA5/V9pibLXNSmeBWCDCON7hMqTBg63BMTq5+qM1bjxzFllSOeliDlZWCVxHxHyqKZCftUlIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQNMfEJ5HzfLXGZyWyhFTH1ct47K9r542bOXqaGQYmaeCkqe0
	4vsDR2ZSCCI7bfXM5BYx2o/mEHZb6Jlej6QefoABLujVKwysKllZgVDMYOMXukkFb5qVHbNa1GV
	sq6j33kdsgwiJJQcuoaL2XzIyQ4tRbYusHI6L
X-Google-Smtp-Source: AGHT+IGDyjRSElFnaMnXIeXsT+1r7wgSbMDhOYbLu5UUMTpYavmhKmGkvO/4gbtslkfwpxqyNkClPrrpGW6Xol0KjPs=
X-Received: by 2002:a05:690c:2e88:b0:6e2:413:f19 with SMTP id
 00721157ae682-6e21d84c892mr27692897b3.27.1727285506776; Wed, 25 Sep 2024
 10:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.2.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid> <oedfq4fkjlbalytba7fxg462tyutgxxk5wnhg2mhkfevclv33q@ugc472nkwpo6>
In-Reply-To: <oedfq4fkjlbalytba7fxg462tyutgxxk5wnhg2mhkfevclv33q@ugc472nkwpo6>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 25 Sep 2024 10:31:33 -0700
Message-ID: <CANFp7mXEx370EpWPcsFpiN9jW0iJzjr1povO89bTRX91dZ3XQQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] usb: typec: altmode_match should handle TYPEC_ANY_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 9:54=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 09:25:03AM GMT, Abhishek Pandit-Subedi wrote:
> > altmode_match is used when searching for the first port altmode that
> > matches the partner or plug altmode. If the port registered with mode
> > set to TYPEC_ANY_MODE, it should always match if the SVID matches.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>
> Fixes?

This is new for Thunderbolt which registers as TYPEC_ANY_MODE so
there's no FIXES. I think Heikki may need to chime in on how the
`mode` is supposed to be used.

IMO, it may be appropriate to get rid of the mode check entirely.

>
> > ---
> >
> >  drivers/usb/typec/class.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 9262fcd4144f..179856503d5d 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -230,7 +230,8 @@ static int altmode_match(struct device *dev, void *=
data)
> >       if (!is_typec_altmode(dev))
> >               return 0;
> >
> > -     return ((adev->svid =3D=3D id->svid) && (adev->mode =3D=3D id->mo=
de));
> > +     return ((adev->svid =3D=3D id->svid) &&
> > +             (adev->mode =3D=3D id->mode || adev->mode =3D=3D TYPEC_AN=
Y_MODE));
> >  }
> >
> >  static void typec_altmode_set_partner(struct altmode *altmode)
> > --
> > 2.46.0.792.g87dc391469-goog
> >
>
> --
> With best wishes
> Dmitry

