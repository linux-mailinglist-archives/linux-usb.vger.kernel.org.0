Return-Path: <linux-usb+bounces-15320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6DF97ED48
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 16:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C77D1C211FF
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 14:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA0A19CC27;
	Mon, 23 Sep 2024 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FTo0CJMd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27A819993E
	for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727102545; cv=none; b=VGIUFWKeCXM4H4RJwDEmwtpRIX1p0dyGhmxGvNy91Abk63ArJdyKcdJcFqK5kfHzB4FckyGR7k6VNmrF+O4e8ogtgM/6MiddbLT7qtCyWtkoqehtcechVXV7ZzWRZPLZexiEx3tLQkwO1sNecy7slz8ebTmMUshuNcjvmAhY9T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727102545; c=relaxed/simple;
	bh=vU8ioi5N7K5XbEkcwYbIT4dyO2PigjG7Ya9snrOWYUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRX0HKmVE7807M0SsFH4qdQxw8kga1oxIjxmYhhXUvl3L1SrnEUCi062R03iW+7/1xxrYrxTW+yFexJkIes3kC182hGfzhMBkjQ0o0Oekpauu6vmjfTMNUTD5XPIv3M3w74hwzRbALaXxa4Rj0alleEnVQO4+JZktNb5/cvTVjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FTo0CJMd; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so4380393e87.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727102542; x=1727707342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vU8ioi5N7K5XbEkcwYbIT4dyO2PigjG7Ya9snrOWYUY=;
        b=FTo0CJMd21doUcDCO/VJMz/TQHZ9XlQJ1BsXQoNwVJ5yN6+P+zEzw4bKQ14enbX7rB
         SXSQu+xchQi0Qrow9i538lepDw+2/rgkD+i61BW33C2oUGAYhq5domSdTdo/ZF762YaO
         QuR+/oa6oAE3K4eHkhM49YTbpdayru5czK/So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727102542; x=1727707342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU8ioi5N7K5XbEkcwYbIT4dyO2PigjG7Ya9snrOWYUY=;
        b=AzMOKwpUE5+rGSs7C4GQqzyvmzvUjd8ai7GE6Jmx+DObbiWU2g2GMIkH7DNNIiwRVi
         9l8ZnxR/gbfC/d4F7+bTjytfmoraYqiaUvAy5FnFvzumloFT+5hMN+QKUYxlhDT6i2hf
         MzdMZZhd0AqwmC+giNTrF2ixgnQp276utfXZHNJBwxQC+z2L0SxuWHM9v3kqMpkwheVI
         L74FlTE6XVuII31pr6mBrrFWtZO6OQu6m6zpH2jRgkeI3yCajx853sy/edlrXBUtB539
         +Wq5fnL5jJ63SMbNBB7gXXYK/jtMth69ycFd8NPhyjCgyuwBGt5PeJuDlEl1nHcpdSBK
         FfVg==
X-Forwarded-Encrypted: i=1; AJvYcCUyUWwdNNzkm1JLdYUMROYVeAHiXYtUJ5RSRleOdyyrgXhBGSVCQlfJCfk8pejDp64wslfV2sEYc+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YznK8Nmn3Va88AKV/7yJCQn7jPhG4qCaZ1LxkRxCKwG3Ym4ww0m
	47c3Zoo0GtuuuPTIgn9Bbzmwfyi6cARna6s0TqsjYSXUyB3oi6EhBXwg5+QUtF9Cpi16Q28LLHW
	YJ+xjeEpBpzJJlagjDzHnUjretgEPDs99ydiBKOazbyywVhkZ
X-Google-Smtp-Source: AGHT+IEyzRp+m5fX0Jn/4p0AtI5S98zIO8YX46Tb3tM2f55jAtIo+osTIQ0rtGntwdrcI8jdgzFRH/Fq5s75pk0IuUU=
X-Received: by 2002:a05:6512:12ca:b0:535:3cdc:8755 with SMTP id
 2adb3069b0e04-536ac2e5b93mr6116785e87.20.1727102541860; Mon, 23 Sep 2024
 07:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-7-ukaszb@chromium.org>
 <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com> <CALwA+Nb6zWe-WOgcu8-ni5OCx9XxerVhi76fZze2KP_kmFVonA@mail.gmail.com>
 <ZuvxAQmMsnIYZMTP@kuha.fi.intel.com> <CALwA+NYmKm0sVT=NPfJU7Ena__P5ec451nhViXFhK9BYu87jxg@mail.gmail.com>
 <rpdbzy5ldlsq2ahvuyrzx6tprgtgxpftd4xbos7cd3wwnhapvu@2hstbs5qg65h>
In-Reply-To: <rpdbzy5ldlsq2ahvuyrzx6tprgtgxpftd4xbos7cd3wwnhapvu@2hstbs5qg65h>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 23 Sep 2024 16:42:10 +0200
Message-ID: <CALwA+NZoA4myUcYNMb6d-sN=YAp8njWDBW9RwgXiPTyTPtv=4g@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 10:00=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Sep 19, 2024 at 08:03:37PM GMT, =C5=81ukasz Bartosik wrote:
> > On Thu, Sep 19, 2024 at 11:38=E2=80=AFAM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > On Sun, Sep 15, 2024 at 12:08:45AM +0200, =C5=81ukasz Bartosik wrote:
> > > > On Wed, Sep 11, 2024 at 4:09=E2=80=AFPM Heikki Krogerus
> > > > <heikki.krogerus@linux.intel.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Tue, Sep 10, 2024 at 10:15:25AM +0000, =C5=81ukasz Bartosik wr=
ote:
> > > > > > Add netlink to ChromeOS UCSI driver to allow forwarding
> > > > > > of UCSI messages to userspace for debugging and testing
> > > > > > purposes.
> > > > >
> > > > > Why does this need to be cros_ec specific?
> > > > >
> > > >
> > > > You're right. Netlink does not have to be cros_ec_ucsi specific.
> > > > Would you like to have netlink in typec_ucsi ?
> > >
> > > Does it need to be netlink? We would then have tracepoints, the
> > > custom debugfs interface, and this netlink interface.
> > >
> > > I think this information could be exposed via trancepoints (unless I'=
m
> > > missing something).
> > >
> >
> > Hi Heikki,
> >
> > I agree that there is a common area which is covered by both trace
> > events and netlink.
> > However netlink also has advantages which IMHO trace events lack. One
> > of our cases is that
> > from userspace it is easy to forward the UCSI messages to a Wireshark
> > with a plugin
> > which can decode it. Another case is to use UCSI forwarded messages
> > through netlink
> > for testing and validation of chromebooks.
> >
> > How about leaving netlink specific to cros_ec_ucsi driver ? Would you
> > consent to that ?
>
> I think having it specific to cros_ec_ucsi is the worst option out of
> three. It should either be generified to work with all UCSI drivers or
> go away and be replaced by tracepoints (against, generic to all UCSI
> drivers) or some other mechanism (e.g. TCPM has rolling log of
> messages).
>

I will come up with a proposal to make netlink generic to all UCSI
drivers.

Thanks,
Lukasz

> --
> With best wishes
> Dmitry

