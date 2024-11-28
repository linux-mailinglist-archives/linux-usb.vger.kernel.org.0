Return-Path: <linux-usb+bounces-17944-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C73229DBA9D
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 16:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27958B245C3
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 15:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F3F1DA23;
	Thu, 28 Nov 2024 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PppgPyiX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01ED25761
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808176; cv=none; b=jbmNNeBYkBVDHY9/qNxV/sLg75nmj937NY1PNBZAJ8ClD3IJeJ/ub20JmUMuQvLDlsNsyOxbiPW1PFJevOIiLpDC9jtFjvzWUKGInF9cV04nCKOL6ZAQzUZmpXlq2LGAR5YjgSuIJAvEkwD/20k31opx/oQRBVxGsQh+Lh+aJPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808176; c=relaxed/simple;
	bh=iKmGxWR3SCPnTr9MmZjU5whhKxQRR6eabS48BJf4/e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4B38J/v+PaanckH1Ll8+ukTw2/F2NG2kqlloflZCBBGWAweG0fnl3jalEbP057HjMEvE+hOgHVEIW7slPkCu2C7D2aMHRd54PzKQ5bB+GExzMHyjSW+ryKG8mu11qDTGY8rpdUxaNQpOLOd9h4Nt6XbBsF5D62xdIhjtHEHiUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PppgPyiX; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffc016f301so10484581fa.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 07:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732808173; x=1733412973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4x8/klYZb6w+q3jJndkpAwg46a3f9b5Itiq/5RBjupE=;
        b=PppgPyiXvOt/X98cK1J5ARgUTMtUsEn42DsQRoIbdDocsUDSpjxNaXQAu+XEpdWBIv
         462rN1NsTjkjk1p8Q6aqO42Neh7Sko7g1BO9m0hIunIHPKV0JGYvMxyj2h7r/rxPCNdI
         JbHdKEoFiXomyC6FRqwJv9VPhW5A+2PESDCbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732808173; x=1733412973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4x8/klYZb6w+q3jJndkpAwg46a3f9b5Itiq/5RBjupE=;
        b=CqfkYt0pUeuRkvINm1fMgGHLF8LrbmvgcruJFH0+93N6Cw/Mfw6+PB5WqTMMpovs5s
         7lLsJ7J0d/dZzPM1eKzE5Ti4sOVnCuSv7jSD71NHzlJLqwgwJNHPwbpCVwfVRVsU+BIt
         x/X6mD9OC/JpVbTmwkV3cfNUy4y586MBWXXB48GbJt6vRzvE3rWuowNOZqBjA35WvbwJ
         9Il5fRqK7ptk7wzP2odkfSNO1OLnj3IxqlrQDvyNqyhKc/F4Xw7qBXtlminSkTCX2SG2
         820qTfCH7kIAzBcxcga+1872E31YKycJy5RNaWPYiJXg1GjH9EvS/s8+tM90URRK5avj
         NvMw==
X-Forwarded-Encrypted: i=1; AJvYcCU42KfTHB7Bo9MpmbPtXD5G6XZeEvWokPY/YrHcPJDAR7heHwWH8J3fBRwHwhQjQhtCqtnBB6YAeFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwocrsTgvgSIKOslKJfmdag+ZH9hG/OwkiSCdUN1+qFgl/E6F4i
	MNlVnd2lD60a/UCKiFKxTJ/ytFNu5J+hVQLhyMWiJMAL1p3HdJ1GGvQXNeI6YV4eIO/gbS8CEsO
	dG0MtcbM2srgW6e2xj7bqsMIJDbRI8cTatoo=
X-Gm-Gg: ASbGncuyqmCIGDKMozF4Wnh1xTiLiFVE1Ib7VBr/63kELZWIoJXUY91rqQVXa/eJRhU
	iKLyIhhf0eH35jg1kpzIs2xTe7kVRSaWPUvsss0IL+xvkcbVDuPjY/xMiEV0=
X-Google-Smtp-Source: AGHT+IGmRQWOUKzM5MLkJ1jlcef7zw+jO3ZoNUzMkDKt1VFUb2Mx0ndQxLmBfkKjQttZK35T1KWw1y0Arwjt2DkVCoQ=
X-Received: by 2002:a05:651c:220d:b0:2fa:cc50:3f2 with SMTP id
 38308e7fff4ca-2ffd604a2b1mr46164301fa.5.1732808172924; Thu, 28 Nov 2024
 07:36:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104154252.1463188-1-ukaszb@chromium.org> <5iacpnq5akk3gk7kdg5wkbaohbtwtuc6cl7xyubsh2apkteye3@2ztqtkpoauyg>
 <CALwA+Nb31ukU2Ox782Mq+ucBvEqm9_SioSAE23ifhX7DsHayhA@mail.gmail.com>
 <yphjztfvehbqd4xbdo7wtdfd4d3ziibq6hytuuxnoypdpsr462@zwl2cfj6f5kw>
 <CALwA+NYOm5mrw7=PSD+w_ma0hzR2CQ5dspz5X-bqi1o7ikfq6Q@mail.gmail.com> <7e5p2ekpvxosb4axrzenifrtitzof6femyzld6wdcp3i7a5jh6@v476mzjit5zw>
In-Reply-To: <7e5p2ekpvxosb4axrzenifrtitzof6femyzld6wdcp3i7a5jh6@v476mzjit5zw>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Thu, 28 Nov 2024 16:36:01 +0100
Message-ID: <CALwA+NaWkmcCYKn0eiA75dRo-tKu2+exrrGKrSgtNGXZzPGBug@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: Fix completion notifications
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 3:16=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Nov 28, 2024 at 11:08:46AM +0100, =C5=81ukasz Bartosik wrote:
> > On Thu, Nov 21, 2024 at 11:53=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Wed, Nov 20, 2024 at 03:56:41PM +0100, =C5=81ukasz Bartosik wrote:
> > > > On Mon, Nov 18, 2024 at 6:58=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Mon, Nov 04, 2024 at 03:42:52PM +0000, =C5=81ukasz Bartosik wr=
ote:
> > > > > > OPM                         PPM                         LPM
> > > > > >  |        1.send cmd         |                           |
> > > > > >  |-------------------------->|                           |
> > > > > >  |                           |--                         |
> > > > > >  |                           |  | 2.set busy bit in CCI  |
> > > > > >  |                           |<-                         |
> > > > > >  |      3.notify the OPM     |                           |
> > > > > >  |<--------------------------|                           |
> > > > > >  |                           | 4.send cmd to be executed |
> > > > > >  |                           |-------------------------->|
> > > > > >  |                           |                           |
> > > > > >  |                           |      5.cmd completed      |
> > > > > >  |                           |<--------------------------|
> > > > > >  |                           |                           |
> > > > > >  |                           |--                         |
> > > > > >  |                           |  | 6.set cmd completed    |
> > > > > >  |                           |<-       bit in CCI        |
> > > > > >  |                           |                           |
> > > > > >  |   7.handle notification   |                           |
> > > > > >  |   from point 3, read CCI  |                           |
> > > > > >  |<--------------------------|                           |
> > > > > >  |                           |                           |
> > > > > >  |     8.notify the OPM      |                           |
> > > > > >  |<--------------------------|                           |
> > > > > >  |                           |                           |
> > > > > >
> > > > > > When the PPM receives command from the OPM (p.1) it sets the bu=
sy bit
> > > > > > in the CCI (p.2), sends notification to the OPM (p.3) and forwa=
rds the
> > > > > > command to be executed by the LPM (p.4). When the PPM receives =
command
> > > > > > completion from the LPM (p.5) it sets command completion bit in=
 the CCI
> > > > > > (p.6) and sends notification to the OPM (p.8). If command execu=
tion by
> > > > > > the LPM is fast enough then when the OPM starts handling the no=
tification
> > > > > > from p.3 in p.7 and reads the CCI value it will see command com=
pletion bit
> > > > > > and will call complete(). Then complete() might be called again=
 when the
> > > > > > OPM handles notification from p.8.
> > > > >
> > > > > I think the change is fine, but I'd like to understand, what code=
 path
> > > > > causes the first read from the OPM side before the notification f=
rom
> > > > > the PPM?
> > > > >
> > > >
> > > > The read from the OPM in p.7 is a result of notification in p.3 but=
 I agree
> > > > it is misleading since you pointed it out. I will reorder p.7 and p=
.8.
> > >
> > > Ack, thanks for the explanation. Do you think that it also might be
> > > beneficial to call reinit_completion() when sending the command? I th=
ink
> > > we discussed this change few months ago on the ML, but I failed to se=
nd
> > > the patch...
> > >
> >
> > Dmitry sorry for delayed response.
> >
> > IMHO it makes sense to clear completion in ucsi_sync_control_common()
> > with reinit_completion().
>
> yes. before sending the command.
>

Ack

> > But I wonder whether with this change moving from test_bit ->
> > test_and_clear_bit do you still see a potential
> > scenario for a race ?
>
> Two notifications coming close enough so that the second one starts being
> processed after receiving the first one but before completing it? On the
> other hand, test_and_clear_bit() will handle that already.
>

I agree test_and_clear_bit() should handle such a scenario.
Nonetheless I will add a call to reinit_completion() in
ucsi_sync_control_common().

Thanks,
Lukasz

> > > > > > This fix replaces test_bit() with test_and_clear_bit()
> > > > > > in ucsi_notify_common() in order to call complete() only
> > > > > > once per request.
> > > > > >
> > > > > > Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for=
 command handling")
> > > > > > Cc: stable@vger.kernel.org
> > > > > > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > > > > > ---
> > > > > >  drivers/usb/typec/ucsi/ucsi.c | 4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/=
ucsi/ucsi.c
> > > > > > index e0f3925e401b..7a9b987ea80c 100644
> > > > > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > > > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > > > > @@ -46,11 +46,11 @@ void ucsi_notify_common(struct ucsi *ucsi, =
u32 cci)
> > > > > >               ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cc=
i));
> > > > > >
> > > > > >       if (cci & UCSI_CCI_ACK_COMPLETE &&
> > > > > > -         test_bit(ACK_PENDING, &ucsi->flags))
> > > > > > +         test_and_clear_bit(ACK_PENDING, &ucsi->flags))
> > > > > >               complete(&ucsi->complete);
> > > > > >
> > > > > >       if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> > > > > > -         test_bit(COMMAND_PENDING, &ucsi->flags))
> > > > > > +         test_and_clear_bit(COMMAND_PENDING, &ucsi->flags))
> > > > > >               complete(&ucsi->complete);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(ucsi_notify_common);
>
> --
> With best wishes
> Dmitry

