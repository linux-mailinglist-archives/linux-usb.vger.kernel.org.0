Return-Path: <linux-usb+bounces-5492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEAF83B50C
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 23:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD5C283ED5
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 22:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80EE136648;
	Wed, 24 Jan 2024 22:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bwqIVgNF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8797135419
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706137055; cv=none; b=eNS+vqUNRPmU5vtMzeScrrwADhoHAMHWCkEW0mhyzT4QzzCrtz2VRs+lgADX+UFhnCvipcIcRLgJa3gr1whvQR64Z/Jz2JBl43n/75PpX2tgQbBcz5Q0mZ2YRDO1ChYbJB1qF8lqFV+PV/Us24ka50beP1gbhQNzZ55paubae8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706137055; c=relaxed/simple;
	bh=ZIIZJ+Jcrl8bt49eFQOrQKNSd6j5uMTJKgZ/QcCvINA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyJVSurrIHGaYzu7FbgQZoTGputkDZTsYP9covA5Hkk1ap/rc8TaSpUlgAQtTMrWzgRJDkhj71Es/QCHqELa9S1bBS5jW4pX+2YjlIYLhdyJ5rl45W6wZ7I3vvI/GjfpS3kY9z0s1HQHRspT+s/L+rxvqe5OcGI1EArVfBQ3Ks0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bwqIVgNF; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc221f01302so4799504276.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 14:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706137053; x=1706741853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBrbySQu5iKGr9sNkUAtBVzTaLxKFzMhJjClQoKf5+M=;
        b=bwqIVgNFNGiMnlcm0xoHKmZV95ePMfSOWLHqJSoXyvNIKcQAVgYewoWP2lHdS3ACQJ
         ETYVKOQnyPPqoSBYAPAusohRtqznkbyfPh8NzYiYbBCtMwK3wCp8nu+iPOn09ODHtunR
         Hq54FBZdUo99tXE0DidJqwhxyrOikFjh8G3g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706137053; x=1706741853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBrbySQu5iKGr9sNkUAtBVzTaLxKFzMhJjClQoKf5+M=;
        b=IwjxHAvqYKMHD18KnvJt2umAWARDE3ZWiIyIXBI2nxieGu6RWBFqS8X8U5nWPBvFbP
         NdB8wBia3YN7rqdFN/3IzNU944GIDFnMBoam0MgdwwELDfKGs70Bme4iu907gWixFtOj
         ioT6UW91fbvpQ8tYTAcsO9riGwjRC7YRG32rMR6KUjbZlMYDZBxRBd+fdGalAD41XX8+
         Xs2HiFEbATs3SDTKZfukMtGCyON2zfDpKpoDo9DgfitRCjg+Cd3XCQQy+4jbxxu0cd89
         LS1ytowCVQweiRbl25zMVbifEScBQ3NjJgMjcaVT9VdFWue146bgMbeVOrjtTFWYKiMs
         5y2g==
X-Gm-Message-State: AOJu0Yzned7AaAThioNywcXRQibcGmIqaFzrHjMVx1EFJUn87MWQCR0u
	We2TfbrVXGTpZfhjbVnKXnjarNlxA2NScBeRe3qqJpwgrb2LxaVm04j2BMsvqvi08PS0GvfD74/
	jjqGXX1wfh0/n9nwMafWukZlp/p+gMSbRgBZ6h0jRg/t+TQk=
X-Google-Smtp-Source: AGHT+IEQ97tfB49p3fcFLXBhQDHGRAdqBwWwjOzKotG3aWQFBLjfSZX0iISlu5Utag72IuSP8N6D2OqUUVGz6p2rDk8=
X-Received: by 2002:a5b:348:0:b0:dc2:66d6:b32 with SMTP id q8-20020a5b0348000000b00dc266d60b32mr96351ybp.54.1706137052904;
 Wed, 24 Jan 2024 14:57:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123223039.1471557-1-abhishekpandit@google.com>
 <20240123143026.v1.3.Idf7d373c3cbb54058403cb951d644f1f09973d15@changeid>
 <CACeCKafTBwSgRXLFA3HC7cBe8hD=PSgSmR=TWy1oF3Rkn+hK4g@mail.gmail.com>
 <CANFp7mUFvRnb1BF=vzNE+BxMcjZi_o0wwJVw=Ty+zEG+JTzA1w@mail.gmail.com> <CACeCKacH4zJGNqFKjLoaHzM59nSGdaWkNXec2GM=0kfafPBgqA@mail.gmail.com>
In-Reply-To: <CACeCKacH4zJGNqFKjLoaHzM59nSGdaWkNXec2GM=0kfafPBgqA@mail.gmail.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 24 Jan 2024 14:57:21 -0800
Message-ID: <CANFp7mXP=aN8bQi4akKKcoMZE8RaCBuFnwTa5hbp0MZvZe0hYQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] usb: typec: ucsi: Get PD revision for partner
To: Prashant Malani <pmalani@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	jthies@google.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 11:34=E2=80=AFAM Prashant Malani <pmalani@chromium.=
org> wrote:
>
> On Wed, Jan 24, 2024 at 11:18=E2=80=AFAM Abhishek Pandit-Subedi
> <abhishekpandit@chromium.org> wrote:
> >
> > On Wed, Jan 24, 2024 at 10:49=E2=80=AFAM Prashant Malani <pmalani@chrom=
ium.org> wrote:
> > >
> > > Hi Abhishek,
> > >
> > > On Tue, Jan 23, 2024 at 2:30=E2=80=AFPM Abhishek Pandit-Subedi
> > > <abhishekpandit@google.com> wrote:
> > > >
> > > > From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > >
> > > > PD major revision for the port partner is described in
> > > > GET_CONNECTOR_CAPABILITY and is only valid on UCSI 2.0 and newer. U=
pdate
> > > > the pd_revision on the partner if the UCSI version is 2.0 or newer.
> > > >
> > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > ---
> > > > $ cat /sys/class/typec/port2-partner/usb_power_delivery_revision
> > > > 3.0
> > > >
> > > >  drivers/usb/typec/ucsi/ucsi.c | 25 +++++++++++++++++++++++++
> > > >  drivers/usb/typec/ucsi/ucsi.h |  3 +++
> > > >  2 files changed, 28 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi=
/ucsi.c
> > > > index 4edf785d203b..8e0a512853ba 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > > @@ -782,6 +782,8 @@ static int ucsi_register_partner(struct ucsi_co=
nnector *con)
> > > >         }
> > > >
> > > >         desc.usb_pd =3D pwr_opmode =3D=3D UCSI_CONSTAT_PWR_OPMODE_P=
D;
> > > > +       desc.pd_revision =3D
> > > > +               UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->c=
ap.flags);
> > > >
> > > >         partner =3D typec_register_partner(con->port, &desc);
> > > >         if (IS_ERR(partner)) {
> > > > @@ -856,6 +858,28 @@ static void ucsi_partner_change(struct ucsi_co=
nnector *con)
> > > >                         con->num, u_role);
> > > >  }
> > > >
> > > > +static int ucsi_check_connector_capability(struct ucsi_connector *=
con)
> > > > +{
> > > > +       u64 command;
> > > > +       int ret;
> > > > +
> > > > +       if (!con->partner && !IS_MIN_VERSION_2_0(con->ucsi))
> > >
> > > (Mentioned side-band but reproducing here for consistency)
> > > This macro is unnecessary. It's just doing a comparison, which can be=
 inlined
> > > without any perceptible change in readability (actually, I'd argue ad=
ding the !
> > > to an english idiom makes things *less* readable):
> >
> > I prefer the macro because it makes it easier to search where version
> > checks are being done.
>
> I don't see how searching for "IS_MIN_VERSION_2_0" is easier
> than just searching for "UCSI_VERSION_2_0".
>
> I didn't quite understand what you meant by
>
> >  it keeps the `<` vs `<=3D` consistent.
>
> Perhaps I'm missing something... (are these comparisons being
> used elsewhere/in some other fashion?).

Let's say someone wants to guard code for UCSI 2.0.
Should they use:

// Guard against older versions.
if (ucsi->version < UCSI_VERSION_2_0) return;

// This also guards since the version jumps from 1.2 to 2.0.
if (ucsi->version <=3D UCSI_VERSION_1_2) return;

// Only do something on newer versions.
if (ucsi->version >=3D UCSI_VERSION_2_0) {
  // Fill out something available in newer spec.
}

I'd rather everyone just use a macro that normalizes comparisons. It's
always IS_MIN_VERSION and its inverse !IS_MIN_VERSION.
It's personal preference so deferring to the maintainer is IMO the
right call here.

>
> In any case, I don't want to bike-shed so I'll defer to the
> maintainer's call on this.
>
> BR,
>
> -Prashant

