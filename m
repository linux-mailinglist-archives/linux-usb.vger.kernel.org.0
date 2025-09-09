Return-Path: <linux-usb+bounces-27778-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B99B4A7F1
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 11:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22333160CE8
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 09:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987E828935A;
	Tue,  9 Sep 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k9y6Adkt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8D52882B6
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409792; cv=none; b=dMXu+kED/EqiE7DyoSFQnJuHAwhheGF2BRx8BgreRpfz8zhdSTCw8+2yRunuMof3rCH75O727qIJTx4/BhcWVvkZtS7GZOlfq8rsumonFaTqfTWoc+1fgcIhnev2NIOMhlWl/UD/931eqyh6M6NaZrE3QlA3KKLzoKlHxVqShF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409792; c=relaxed/simple;
	bh=IhwGmnTPROJ8UMJ/ZIJKXloDry6OSxr5zsCSo3X2V4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JD4ZynPaBOoe6ckCZ0yCRd9Wt5UvRtRjYhkQgQB1HOi+d3j3KmRLqBQEGVZCYnJ7bpxDTy1uRnKevlGwPt3wjkAKeGMWebnSSz08P1XXUXYnaxNuc1rlfZTwFCg/T2wuYvo5EeyjL4f68FvQyTm+aYeDlu59ECLGcdCzFGDQdF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k9y6Adkt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32d9f725f68so909006a91.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757409790; x=1758014590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0w3Ph4E5BTw4rV1tmXtmqkj8lq5Hk2RR7067ccGSdZI=;
        b=k9y6Adktq1Fn1bgDuPjvDdP3h7Ft/LwbACtAoVMbBezqAg2E6Msn4GRo+/GWvuJFPV
         bAgOAW9BwQ3b6vJ7BsiawgFD8UFU2EFK2OsFBxqWAzBzL8xtUoUd6A8n9CLtZG0MyZRm
         6vgqnHLAwbpWXeIA1ypbmEGHF1G3kUojv2MiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409790; x=1758014590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0w3Ph4E5BTw4rV1tmXtmqkj8lq5Hk2RR7067ccGSdZI=;
        b=Mdssn0BuBc7DzFZlMTojMf2UeZsjz+EyTxrFsHqcolHYcRsbT7jczh11AtSE86VcNF
         IarMbuvei5MEOivd41GZIlcC2gDC4MtMjZoy6btL33xMMuhUyi5o705hokrR2PPd0dbt
         DJEZupZFce/nHuM32KOHQdAD8IkL7Xll9b2YLij3UA+zNPDskly3GmxAF3Av8lUiO1wh
         D3zCKhSjYy0cWsf7GXhMiZ2tFhbNZBDwaiw2Kjw1yrDiAvXrhuslsfvAjYWZ4D8DI6Vs
         vLqAhZLZBwpamAhe2lHoW/Ic8VqHJ7gvelsPcd8dNq0N1O/WgVvG+K52Nqo/PuOvefWJ
         UASw==
X-Forwarded-Encrypted: i=1; AJvYcCV0TUcqlcK2s2AMQm1Z8c0uNOA8bNIMJpYSKGOX8PXiIZnrH2tERXVavdXvc4iPmsrMjS1u97SXQj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDrIr9PBS7w0pMcDAdjwStXrQcvKOKaZGl8IR2BbsVJNwqq0U
	DUMsuVbxCxxDo3YED2WYqJN2Wt1i1O/0CUZXaFFobIOykXn/3ie2Os6QK0xZtD7T1ioExXdO53L
	BvonK6QzDH1FkLp4LmDMAL+5u5Pf0SCWRa4MXFgpxVCX9XGdasuqQTw==
X-Gm-Gg: ASbGncvdvje8ziffWIQdFB4FC35PLfDy9wg6XaPlgzrn20RYQR5gvlIpDWFLp8mnIu/
	yGssoevcwYDXWmR3Itxcy6WNZeEB04+QNBGzdOnNKQWnKgA8EV3z40JRhXvoIvK87937q0vWpY6
	thfeltTGjViZ9m8MvEaNZplhJpFFoaNveMr6voiwgQpXPaGGICjfaHoCGA60rWbyl1ffE41wuxL
	2TIGTZxYDO27AKFrp23zOTmK5aN6+Wsq7NuEMG2KgYN
X-Google-Smtp-Source: AGHT+IFW+hLO5Yu6lqanuOKaST+yfom90ApVBsBONoL1QtFCXG1kgy1XSNSymbhKgjXDmLZVRuj1xAmF3kl3ji8pOsQ=
X-Received: by 2002:a17:90b:3952:b0:32b:b514:3935 with SMTP id
 98e67ed59e1d1-32d43f006f7mr15206818a91.16.1757409789756; Tue, 09 Sep 2025
 02:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-4-akuchynski@chromium.org> <aL_uZxBkBfC9Etrk@kuha.fi.intel.com>
In-Reply-To: <aL_uZxBkBfC9Etrk@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 9 Sep 2025 11:22:57 +0200
X-Gm-Features: Ac12FXw4Dq1SaeVI2SOpFgqyAjRayu5Yet0cmirzQc2om1uhPkt-AFM8Ejmd-cE
Message-ID: <CAMMMRMf_zDx43-Orf1zE31hE+QmPgkDMz2UTrYjyS=pjHUZvYA@mail.gmail.com>
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

On Tue, Sep 9, 2025 at 11:08=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Fri, Sep 05, 2025 at 02:22:04PM +0000, Andrei Kuchynski wrote:
> > This flag indicates that the PPM allows the OPM to change the currently
> > negotiated alternate mode using the SET_NEW_CAM command.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index 0d6b0cf5a7cd..9f754344a841 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1632,6 +1632,7 @@ static int ucsi_register_port(struct ucsi *ucsi, =
struct ucsi_connector *con)
> >
> >       cap->driver_data =3D con;
> >       cap->ops =3D &ucsi_ops;
> > +     cap->no_mode_control =3D !(con->ucsi->cap.features & UCSI_CAP_ALT=
_MODE_OVERRIDE);
>
> The flag is now used to expose the priority file, but you can't affect
> the order in which the UCSI attempts to enter the modes, or can you?
>
> thanks,
>
> --
> heikki

Hello Heikki,
Thank you for your review!

You are right, this patch does not affect the order in which UCSI
attempts to enter modes. Currently, UCSI implementation only has
DisplayPort alternate mode support. We are preparing to submit patches
for Thunderbolt.

Thanks,
Andrei

