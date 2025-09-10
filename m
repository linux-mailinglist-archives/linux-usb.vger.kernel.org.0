Return-Path: <linux-usb+bounces-27899-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC853B52132
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 21:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37A011C87C4D
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 19:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26312D8DA9;
	Wed, 10 Sep 2025 19:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DlC3EKUD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E172D7DC0
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757532975; cv=none; b=KkUFUNiyWwYr2pWOpwh8goFnk0832sA8u/BTs5aXr1rcKhn1A2q/vYwajGfUcAEWGQHrGyV9Y0E7M8A+DUCqQLNPY+sPZAr30pmCRTIOXS1ZxYT0QKMQiOjet/6VEBdGoOzj/HAhZC7lpQ418GsHD/BwsRx1JNFjKfHmm2wOGpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757532975; c=relaxed/simple;
	bh=AV456wGx4AS1v+tWNKPuHFhSCTC9E7/Gz+sOHtQdrVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cL83eaJMJ4R9QYAvH868vbv9+9/gW11MMwVLw+C8vU4UIlNShRgL3rMwVqyMY5ayRZNdOmzToYmixeQHBXq3s9/8mEK0azdjBhxOF1vttD9OVfwDBs5gXYjfBnX63WdiKKpvyPgwBbPb7P1sE6Ze4kbTXBjQKa3lOBIIEuTr0V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DlC3EKUD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-323266d6f57so8105181a91.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 12:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757532973; x=1758137773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQPkqSciunRqKLia3Mm+0rllHHUFhVihDlipeR5N4p8=;
        b=DlC3EKUDkhA7/Dt14CSo/RkGBxbWyLGRPmRws0lHHwYpthqEOQrvmh2gS5E//6bimv
         i0ZYRDeCbEYQlXs1n5F5HuuXaJxT8CLxfnPg6qHyy2tdxZIUvbO3IuWvhBG7qtjddyXm
         VN3w0/3gqRELfdHRlgOJiqF5ldFDjIKMZ44iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757532973; x=1758137773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQPkqSciunRqKLia3Mm+0rllHHUFhVihDlipeR5N4p8=;
        b=db2UKUYsyNX4ypF51u8sElFKJR7Er79TJ5JATX0n2RmCSDI/eGUS/Q7djf7q70ckQF
         d+aOvZFUuC/MM9PKuqfnrCwCH76yw7R9OR8kY+9ri1R8r3fOeNxDMzDHlBYOD5ytgUCs
         xFyOt4AyqobiDNQu6Zzsyq6YarXGr0ecpZeKBZRbPchXwX5szqUyzv6NvOF+6bJ7LrDf
         kHEv6+mLlzm6RBS02fLFDraYT1Q6yP6jxqWhHiilTx+cr4tP0iMkCmMIeTTmNIEYDnRr
         3CZhZeaioigTv/tSR3axEtj8JvdKpPBrF7g3GToSVfeBhHOgVHWNbVaDQXdFFH5l53Yj
         Locw==
X-Forwarded-Encrypted: i=1; AJvYcCWbXOOpLpUkwewk38TL9x68n/lRwcISzAom/v4YoirZy0AdkuaDpjpXqMo3oY6TwOVYnoqBQvq3Ygw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnynzfnWDaQofQQ31p60RMjR6lzXUudbmMWiQvnyGVfiL3EG+e
	MWaAg+d9AoVPvTvJ9XrMDbPoBmBoAnHU3TnePdogWMbAyvWUNYDPMyVcX739YioENKPwcallq8s
	AOCds8z1SZTvmbp57ZWUs+tKzKd/tdGOKr3Yamd7r
X-Gm-Gg: ASbGncscWOIbtP3RFxL/AbTnDmDLzoro3RfgaIfftrPozH0DG2XADFfLn+juml93Ku8
	bkE8POFW8eyB7DvzNOqsHAW3ajTsSsUZgho4jfTQHHHEwEzGwdKCbT21hO2oZ5i2K1s0mmYzW/D
	IRRq0jGE3gRIy3HHNOUDqzQoAP+4KFdyFAJ8q+9VENmTDxuRniBSEdAWYTnTH0DK1B1cFsvdS1A
	up5BW2hl7/mcnIj0QQuiQecByYVhn+v6Fk=
X-Google-Smtp-Source: AGHT+IFLlqBtDvao2RSq+mhvGeHwBwcVPZTa96veAgv1c4asfQuU7YhSG8xzoqQz1gsfHfDLzgkwBOAWmBsrpMX6k00=
X-Received: by 2002:a17:90b:350b:b0:32b:9d3c:13c4 with SMTP id
 98e67ed59e1d1-32d43f8ea76mr22921491a91.24.1757532972973; Wed, 10 Sep 2025
 12:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-4-akuchynski@chromium.org> <aL_uZxBkBfC9Etrk@kuha.fi.intel.com>
 <CAMMMRMf_zDx43-Orf1zE31hE+QmPgkDMz2UTrYjyS=pjHUZvYA@mail.gmail.com>
In-Reply-To: <CAMMMRMf_zDx43-Orf1zE31hE+QmPgkDMz2UTrYjyS=pjHUZvYA@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 10 Sep 2025 19:36:01 +0000
X-Gm-Features: Ac12FXxddXEMRnJtLrfvERjfHZezzuZuMnfwdZigQDg7YqiQEYPvS9eHewf1Njc
Message-ID: <CAMMMRMcX4k3Ry6ruQhA39hFze+fMttUajwaBP5TrbvP7Ryy9zg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] usb: typec: ucsi: Set no_mode_control flag
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 9:22=E2=80=AFAM Andrei Kuchynski <akuchynski@chromiu=
m.org> wrote:
>
> On Tue, Sep 9, 2025 at 11:08=E2=80=AFAM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Fri, Sep 05, 2025 at 02:22:04PM +0000, Andrei Kuchynski wrote:
> > > This flag indicates that the PPM allows the OPM to change the current=
ly
> > > negotiated alternate mode using the SET_NEW_CAM command.
> > >
> > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/u=
csi.c
> > > index 0d6b0cf5a7cd..9f754344a841 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -1632,6 +1632,7 @@ static int ucsi_register_port(struct ucsi *ucsi=
, struct ucsi_connector *con)
> > >
> > >       cap->driver_data =3D con;
> > >       cap->ops =3D &ucsi_ops;
> > > +     cap->no_mode_control =3D !(con->ucsi->cap.features & UCSI_CAP_A=
LT_MODE_OVERRIDE);
> >
> > The flag is now used to expose the priority file, but you can't affect
> > the order in which the UCSI attempts to enter the modes, or can you?
> >
> > thanks,
> >
> > --
> > heikki
>
> Hello Heikki,
> Thank you for your review!
>
> You are right, this patch does not affect the order in which UCSI
> attempts to enter modes. Currently, UCSI implementation only has
> DisplayPort alternate mode support. We are preparing to submit patches
> for Thunderbolt.
>

Hi Heikki,

should I send this patch later with the Thunderbolt UCSI support
implementation?

Thanks,
Andrei

