Return-Path: <linux-usb+bounces-17377-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D9E9C24E3
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 19:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006E62847D1
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 18:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CA61A9B2A;
	Fri,  8 Nov 2024 18:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R96atp3O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9625D193075
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 18:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731090546; cv=none; b=Q1hTOhEGz31SgILROtk3idILiWQS8QQEVkwO/IUTy2zuEhCqUcfYgdod0EgSsr+jqFPfQ9dhLJkv725ri54CT5EEOJQCFmFyzKDNfjwzyKhdnv93w1pYVwGk0+duk7RrvVV5glJ/t29B+D9B2Ilwbni4S6lHNWahAhMdW+DgErs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731090546; c=relaxed/simple;
	bh=02QQS4FNdXeeDmAaZnAYT1g9MLTNG9MtUURxZt8MuQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDwKgPXBp3kj9GkdyGsRCmJc3pUCbGRuw5WUNC0SQs8+XqBq96l75sv0VT9Wf7UJAWHO+hF0ZMKZfX+sv2DYEn0S+HOTvoSL0wYXYa5ESOcbXAhwKIcUUZLK0nvVK5/Ka+GjKPt/cFG7a76mM/ibP1Pb7Vax3nDIUpCdJFIaACc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R96atp3O; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e38ebcc0abso27035787b3.2
        for <linux-usb@vger.kernel.org>; Fri, 08 Nov 2024 10:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731090543; x=1731695343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXU0VBJGl3bTzKZlhr2VmDp9XP+CtZacH9WA2Oh4T1A=;
        b=R96atp3O0cyEwiqYfBNrTrOiT+DkV9C8VdHeKZ3a49OA34ijunT0G4uIMJZV+C9a/g
         FhhqDvNka9mpTYThzmt98daI3Ok7EOopBYOX+wRaOAFyD/vjEwSxRN+UlLl9327oqSn4
         2C/av+q5xUzHSRm/yu5vpAXMBvE7egDcA6nrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731090543; x=1731695343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXU0VBJGl3bTzKZlhr2VmDp9XP+CtZacH9WA2Oh4T1A=;
        b=rxc8HsIjdRfMJKgZHpwuQKwRnrx00qzvhxW/s99ZNMLxlwjnau3DuDfR+iiCIzVqUY
         JwC5gj64dBLXB0ZDDmZVHbILszH9f3qsh0E35be3bTmYg2GVmMKEojGvwgw46VBNxxMj
         CVtucqbu9vLtRG2hc4VTGCIG4bHL0ObJlNh7F4UGew5O+byJEtfosdwftJ33qiBz2fmA
         fhessDlir50sJ/g4EvPeN5YXnp+eOzdY+jjtf8E8SVqhLJA2HnEa3O/9QFMnyAtY4ecs
         iunyJd9zQDLRa3ao6Uyc1Qq0/c3ziQGMIh+GkOBG8EcICbKe/a7H2lyaHpx6H1rEKqRp
         VluA==
X-Forwarded-Encrypted: i=1; AJvYcCWfdCQgG/1SsPnRGCfyunS03ONdej9mzeHKpowWG04zr/0mqH5/Dx7thQL6gn8doPM0CcEDAPftYrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh9HnWr2kCYbxNq2ugPTEc91hrNBJSNYmeCzfEtoEcEHe6evFy
	Ou4XttwT+ypNRLf6zvjjIyKoc8VCCsDWC6G4PaeOdDqlZhhWO6r2cqZ/cS1gQKUW2EVPTKCDyme
	Jiq64oo8lOi9uF0rAdm2Ld2Fcr/fbpC9tq34q
X-Google-Smtp-Source: AGHT+IFVH2rH/3J3+EfLqdmi06+2WK6Q7MhT8hFjbr9Dp+zaWTVq58fsnki1FEj5p7N6Y4mQH7jaBBjr/gCjs3pLBvA=
X-Received: by 2002:a05:690c:60c4:b0:6e7:e3a9:f30d with SMTP id
 00721157ae682-6eaddda335emr46720207b3.15.1731090543616; Fri, 08 Nov 2024
 10:29:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
 <20241107112955.v3.3.I439cffc7bf76d94f5850eb85980f1197c4f9154c@changeid> <2024110849-bonded-flatten-5f5e@gregkh>
In-Reply-To: <2024110849-bonded-flatten-5f5e@gregkh>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 8 Nov 2024 10:28:52 -0800
Message-ID: <CANFp7mU0h0=UimV_tCDw=YuQcdPZsSZ0sJEMv1kNJKiDjs1KHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] usb: typec: Check port is active before enter mode
 on probe
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev, jthies@google.com, 
	akuchynski@google.com, pmalani@chromium.org, dmitry.baryshkov@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 5:17=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Nov 07, 2024 at 11:29:56AM -0800, Abhishek Pandit-Subedi wrote:
> > Enforce the same requirement as when we attempt to activate altmode via
> > sysfs (do not enter partner mode if port mode is not active). In order
> > to set a default value for this field, also introduce the inactive fiel=
d
> > in struct typec_altmode_desc.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Use port.active instead of introducing auto-enter field
> > - Introduce inactive field to typec_altmode_desc to set default value
> >   for active.
> > - Always make port 'active' field writable
> >
> >  drivers/usb/typec/altmodes/displayport.c | 7 +++++--
> >  drivers/usb/typec/altmodes/thunderbolt.c | 6 +++++-
> >  drivers/usb/typec/class.c                | 5 +++--
> >  include/linux/usb/typec.h                | 2 ++
> >  4 files changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typ=
ec/altmodes/displayport.c
> > index 3245e03d59e6..f4116e96f6a1 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -767,8 +767,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
> >       if (plug)
> >               typec_altmode_set_drvdata(plug, dp);
> >
> > -     dp->state =3D plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
> > -     schedule_work(&dp->work);
> > +     /* Only attempt to enter altmode if port is active. */
> > +     if (port->active) {
> > +             dp->state =3D plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTE=
R;
> > +             schedule_work(&dp->work);
> > +     }
>
> What prevents active from changing right after you checked it?

There's another check in `typec_altmode_enter` for the port itself:
https://github.com/torvalds/linux/blob/master/drivers/usb/typec/bus.c#L138

If I leave this out, it will just fail in `dp_altmode_work` when it
calls `typec_altmode_enter` and will leave a dev_err("failed to enter
mode"). This might be more user friendly since it's visible to the
user that the partner supports the mode but the port blocked entry.
I'll update the message on mode entry to also print the return value
(-EPERM) in the next patch.

>
> > @@ -150,6 +151,7 @@ struct typec_altmode_desc {
> >       u32                     vdo;
> >       /* Only used with ports */
> >       enum typec_port_data    roles;
> > +     bool                    inactive : 1;
>
> A boolean bitfield?  That's not needed, please just do this properly.

Ack - will remove the bitfield. `struct typec_altmode` also does this
-- I'll remove that in a cleanup patch too.

>
> thanks,
>
> greg k-h

