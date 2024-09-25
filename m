Return-Path: <linux-usb+bounces-15471-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF49865A4
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 19:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54D972866A2
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 17:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9986E614;
	Wed, 25 Sep 2024 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eq/O4Dj8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5A822318
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 17:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727285528; cv=none; b=tPFemkY/KUPB9AftSxMoofCDr78kxapbCSOqRzMHcrZvpKMvvtXbOLvx8HlcO1eQDVEYzoQ96rPyOjpktSsEazzKeedAeEfHjWMr+PQvif1dkUhDjNq3AyYVI88GTeifxwgYESjmxcIH7QOeBIMvX1/f061jxaCpq1dHub76C/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727285528; c=relaxed/simple;
	bh=AsiidYyDiQ7aCzf8VNXogBUE8Ky+6+7IQkomdzNyO1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4+la7EkeN+jNcsQBdpLqkiHg1Y3n7reBlnJjH1KHEXQM+wi3/TG9aoYmopnkSJ32//w77vzr0XF99zh7Lyn1TkI4BpaK4isDCV39Nz2u40sHr5C7rKbJIEtEf2ivqPKzZkGKXRXXp42gFe+WSrqB/PglLanWfqjbUywoT0sr+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eq/O4Dj8; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e03a5ed4d7so110429b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 10:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727285526; x=1727890326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foQOdpYay332QgWU2K1U9huYqUmxout+sEt9nqJbTuc=;
        b=eq/O4Dj8PCkov+HOp/SxvGSJ00gZYJ9fxuObNgP5D7tCnUC7JPuS5xVQEdlIiycE4p
         A8ZezW7g5Mg2bcdd+QbQYGdl/yrNRD+vh3ZDV7Gbeo4n3vq2nMh4vIu8fHa0ah30s0lR
         3BPPd9TTQ+bu4mNUAIUc0574i6/sTk/Z8DxUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727285526; x=1727890326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foQOdpYay332QgWU2K1U9huYqUmxout+sEt9nqJbTuc=;
        b=noLf7fvAoM5Q305oSKQO5fdqAo6spM3iQpN0Nvqf3K3R5eR6KJzSe0TJIFPodItq2I
         g8j8V7+xDbBQEAcPdj1p/PV2UvXZPlp4u4dlH2743dbEaAyXjVlPeQV0g8T8GBL5e5ld
         hEnM4/QJbtWySRhzlmU/sB/8WzZ3Z0vJt7HW5o9E0PTNuuSxKeLEGPtkmNZToqza9sgd
         kPsGYBOP+tXPVNJ1lXtqE8/DKQXa9rqag8pCB4SCsinjtdNm1zmUEzLrS9vdAE7XgVxb
         /JU4UXC7FIR1kObWSkBZetcoYVhDH5TeyFpIBbwOUqB4C/f1FPInxZ10RPx4ioAaEdvF
         lhOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnTuzH0jdJVF9erLLT1Yl353nCUgsMVPDjBbclO5mc3jmg4/3pEIoPZu2o6uR9hQKlb5EFJsVShpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQsT6CzhLl1LRGEXSpvrmaeG57Yw0kJLNE+gtCSoLJmhZKpyQv
	niuv2ru6yfE80ePRCuReqJAzlcMN5s588l2vRVqsjtyIslfee6fBFrwpMui4wqIHJbH52BzgvTk
	C4fbWzmCSGU2RXnJuZZeStlxtFdhhZAWLR1mqiXDBLfRdAuY=
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

