Return-Path: <linux-usb+bounces-20119-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC1A27582
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 16:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92FAD7A15B8
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 15:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36302139DC;
	Tue,  4 Feb 2025 15:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CXWaKSpd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8A205519
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681942; cv=none; b=c7BANzbhQLKZAXhGE/Mgif/vtJIo6vDeqqwC7625oaWq8wkVvFNOIpLPw+Bagj788BF3L+qERl1D/YuPvMR2XaiBMd7NqchUMWLTDo+kztscn/CkrRGpwfp9M+3aJ3oOqml5/mtybQOMcVzWz2W7gwRVGE90YntyB66pz/SUffY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681942; c=relaxed/simple;
	bh=vEg1T8/MwUn36zXk/yj6LDVNwrBqNF7NWh7EyuxzvSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIfi2KNEkNe+xLxDWs5u3ND9WdGK0Mmu5I8Y9HK0Bdb8pZaPGsi/VujLpKv+vQXJUgGv5Cqu4qYISqj7y5CUBKRtzvroYbyZlzEfKkIENUkC2m2ZXbH7V23L5LBDWUJrm+REYOuwA2pvyZgE4IrtNnpNrQrYOFblkrQ7Uytmj7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CXWaKSpd; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30036310158so42186721fa.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 07:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738681939; x=1739286739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54shYnDt35zDT9Qq10+3QpMg62F5m3j18XmDWSEaqWo=;
        b=CXWaKSpdTphTKgJ3eAM5WgOP5Vg2Sjg0udgBZJnMB+6KrxEgBjFCkTbF+UF+UgMZ4l
         meQCfBtgb1JUcC8pZw2/kbd8WMfJ/nSLrcKvK2WQbnby35eo4P9GGPdxxH2CbN7kEN+z
         2WCTOoxNaUEj7RQ87XImH1e+Uc2NHYoBAa0X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681939; x=1739286739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54shYnDt35zDT9Qq10+3QpMg62F5m3j18XmDWSEaqWo=;
        b=RzdZVoGpwTuKCHz3WhCHLL67YwDg8QokqtTbmoJUm/ESPE71Vzyr+CK86MDPv3WqPw
         O10iYf6hErejrIT7UmfxeXXgcBTfqIp7EM2idYh8NWNnh+sCgEVqOm/GPKzHBrnV/yID
         BKNHUT2qXS4xdqGpO+4UOhnXehSdKDBONMMogEb92akQ7h2uAsHCBXMu6wVG4xJH2/l8
         jPh3AYXkijgad8kauGHcGxtYD5Crl80/QMmWXsl6RAHzggyKYytW/RCCVlMUGsH3dOXY
         7Xyxud8VKoyIxSrQw+onyWy64TdhWqxqUyo4wCMfDmWq5SZC8x4fDkUnHsKvY1JGjUqH
         H3wA==
X-Forwarded-Encrypted: i=1; AJvYcCU+4T7n0cTVkzm3Vw1VWu4zofmDWRxLnOg9vB6WMRhmbSOvq5HPd5gabL2/ypwZr22bc7q5Rgeh3IM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGOqYHyf7bzJrTaoJpadrTl9R3Af68LtqQdQTnEgFSep/ymu87
	VC28iL2oD5No9YqS51TYMRm4JKr8v02NbeGnK8hqfgU0llZPIS3otBYbhdN9Wph4pB8Tc7SNx/p
	gkVTlbIPBki3SE8eq3ElJ8O0FL5IvvLduMEA=
X-Gm-Gg: ASbGncvKy0xH8uM3nK+kBztD3IlGnssm052r0H1K2ujr3c0GuczxdELp4eKdvorraLq
	0dJbZJzSAKOHL0Y9sNr8zX/CmCbW9QhALPXQLGaF0N21V2Ya54ByZ2RGA6gkwE4rnWIIytNFbgr
	n9ml+dW738gqeo9jCo1Wdz5nio
X-Google-Smtp-Source: AGHT+IGAHQQeLqE0F5UIqZHCMeBFhochWigyW/GzL17fCCpnJ2XXS4B8O6yfzgAzJzJDZ24G0GdZnvAY5GzJA15wcmk=
X-Received: by 2002:a2e:b8cb:0:b0:302:2598:dec2 with SMTP id
 38308e7fff4ca-307968d698emr95776721fa.14.1738681938649; Tue, 04 Feb 2025
 07:12:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204024600.4138776-1-jthies@google.com> <20250204024600.4138776-3-jthies@google.com>
 <Z6Ilasq-FdKlfsYx@google.com>
In-Reply-To: <Z6Ilasq-FdKlfsYx@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 4 Feb 2025 16:12:07 +0100
X-Gm-Features: AWEUYZmgKBlaNixW1GPkhE_rD3pNbT8hKMLNHzVXXWrr7xfTkE2QXVzt22Lg_Xw
Message-ID: <CALwA+NYb1oKrpXv7EDi4Oqhm0TMv2yHB3qgry9K2HBMu29q0sw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: typec: ucsi: resume work after EC init
To: Jameson Thies <jthies@google.com>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	dmitry.baryshkov@linaro.org, abhishekpandit@chromium.org, 
	akuchynski@chromium.org, Benson Leung <bleung@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 3:34=E2=80=AFPM Benson Leung <bleung@google.com> wro=
te:
>
> Hi Jameson,
>
> On Tue, Feb 04, 2025 at 02:45:59AM +0000, Jameson Thies wrote:
> > A manual EC sysjump will restart the PPM and break communication with
> > the UCSI driver by disabling notifications in the initial PPM state.
> > Update cros_ec_ucsi to listen for PPM init events and treat them as a
> > system resume to re-establish communication with the PPM (ChromeOS EC).
> >
> > Signed-off-by: Jameson Thies <jthies@google.com>
>
> Reviewed-by: Benson Leung <bleung@chromium.org>
>

Reviewed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

> > ---
> >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi.c
> > index c605c8616726..5f17fcbda059 100644
> > --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > @@ -205,12 +205,19 @@ static int cros_ucsi_event(struct notifier_block =
*nb,
> >  {
> >       struct cros_ucsi_data *udata =3D container_of(nb, struct cros_ucs=
i_data, nb);
> >
> > -     if (!(host_event & PD_EVENT_PPM))
> > -             return NOTIFY_OK;
> > +     if (host_event & PD_EVENT_INIT) {
> > +             /* Late init event received from ChromeOS EC. Treat this =
as a
> > +              * system resume to re-enable communication with the PPM.
> > +              */
> > +             dev_dbg(udata->dev, "Late PD init received\n");
> > +             ucsi_resume(udata->ucsi);
> > +     }
> >
> > -     dev_dbg(udata->dev, "UCSI notification received\n");
> > -     flush_work(&udata->work);
> > -     schedule_work(&udata->work);
> > +     if (host_event & PD_EVENT_PPM) {
> > +             dev_dbg(udata->dev, "UCSI notification received\n");
> > +             flush_work(&udata->work);
> > +             schedule_work(&udata->work);
> > +     }
> >
> >       return NOTIFY_OK;
> >  }
> > --
> > 2.48.1.362.g079036d154-goog
> >

