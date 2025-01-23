Return-Path: <linux-usb+bounces-19649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F389A19BA5
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 01:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43943AC933
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 00:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFE72C9A;
	Thu, 23 Jan 2025 00:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S+5/m7fA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C836C
	for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737590461; cv=none; b=g3EYROSjIqWDGfBQx3BKY2WLVvnnHWHxIzluS8eHAeYf/KudT061GG2GHzNGzPkVYDT8VhWRQsYrQTYPAhSrYi9VB26kAvVo++NQN1GVYlouKWTQO2w+OLCdfJ/W9ZtXlvGXh0vrPUxG/ZhPWKl6wnsJ/dH1BR/g4HrD+DQIODY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737590461; c=relaxed/simple;
	bh=czFFAOFhAeYtNlHJ/Lqn4n5evVP5KIctMvZBUx8xMpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bdlc9M4aM/6AP1b57yMJ1PdFYWx7ccDOi7BXVlo1pO/W/jtU+Rk0EzN/bHX9uMD6LGwt+4AMJ09OvU5MPEQa3Hkqu+QWoPlAkCDJqDvRjbE051wqbH3rJhu2E7rBPdU8e5I5jd//6spQhuBFrwN1YVXWThzT+isx+MqlFXSLS1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S+5/m7fA; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e5447fae695so569828276.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 16:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737590459; x=1738195259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MU78eXkhvy7UdjKRx5UsAHgvjfZYnTpHMz6s2QRID4w=;
        b=S+5/m7fAWiciatUu7taqvSAfprbE4uC/HuWTfX3s6ekl8IMbl+s7Oxm61fpjTWIKXn
         gFkmr9HxpczR3Kl100u+Pl8vGDfdR/G3KwTLWLnnRcZN7s9//WAgy09Lo+aC31+z04iL
         1/Yj62LNfhfy8CnfS7aGes00mlVbOMW+1oRl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737590459; x=1738195259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU78eXkhvy7UdjKRx5UsAHgvjfZYnTpHMz6s2QRID4w=;
        b=LCKjd+itnfThJhDq5SKaoxxQ7dfyIrrnjhBwRP5OeBas51OuFlxUacdaQ8AtiLSS4c
         uT1RrPKf72ud1kINjNjguYlByvveXOCV7aiL1C0xYVgG1W9WQ8o4UpwGUXFRySvmKxdH
         kPD9tGAK5d0jKNTSTCuziFUWsbhFKID9YWeGGvt2rcZ7jbZIa/OsFOeCTekGujeW3Mdc
         fTravla7Nx45QvMlGpaX4RltQr6003TNHuGhwD503BY58UynfrdccerXhsJIZ8+k/Wik
         OVoMIVsBXVfydxTD1HVoE8uHoZJISMuPpaVIB+k5VZuFkoskRA0Wt6VEdYQFdPc4wl2R
         FTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3/KozLraLfO3VbSb300vq8tscjBCIx8pe2DiJ7Rkk3/Do4TtaXmwFkgy6gzX8hSV3Lb5dMMbv/K8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Q2ifCZLZQkecghn8g0WhQnLGs2UUaVVZUv8wUOWJ3GiOC5Ot
	q1I88RFH/GC5K2VSJn2yDKU22R39IgqJ1FgAiDKG96Kn3EWCsv5kouW7YM90zjSuTVuPxkJyMTI
	6vTl2Oms7u31MuxnlU80i19/hCJZmFvmzDSBz
X-Gm-Gg: ASbGncsXliwd7VW7KeW1c62JT0w0RsHDBK/jLDEtZczqUiRtsjP0abQQaurVbCPRz3c
	ab92wPliobxiM2a+wcSGBnkIj+1V3QuSyCflaIustqmkRxgkanuc=
X-Google-Smtp-Source: AGHT+IHgoqnnI3sbWs70pvxDgrAz86axGiJcVS9Fs9rDQOAKm72VcX938jRQgn9jPvLXMyT4AuXI4ik7YEn10IE+ZAk=
X-Received: by 2002:a05:690c:6510:b0:6ee:4eae:5551 with SMTP id
 00721157ae682-6f6eb6b47a2mr183284857b3.21.1737590459014; Wed, 22 Jan 2025
 16:00:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <48dbbbab-3d09-4162-9d76-74c9baca6603@stanley.mountain> <Z305AQk4awMzPycL@kuha.fi.intel.com>
In-Reply-To: <Z305AQk4awMzPycL@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 22 Jan 2025 16:00:47 -0800
X-Gm-Features: AbW1kvYWDpaUO1E1iu_RUOAao9k9v_GPVG8shQcwaZGf9bpaXyg11GXNEp3bo5A
Message-ID: <CANFp7mXEkESZ9Z6waroa_8zVv1PtBTWqfEFSzpzBZ6WEjLDa9A@mail.gmail.com>
Subject: Re: [bug report] usb: typec: Add driver for Thunderbolt 3 Alternate Mode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 6:24=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> +Abhishek
>
> On Tue, Jan 07, 2025 at 05:16:43PM +0300, Dan Carpenter wrote:
> > Hello Heikki Krogerus,
> >
> > Commit 100e25738659 ("usb: typec: Add driver for Thunderbolt 3
> > Alternate Mode") from Dec 13, 2024 (linux-next), leads to the
> > following (unpublished) Smatch static checker warnings:
> >
> > drivers/usb/typec/altmodes/thunderbolt.c:116 tbt_altmode_work() warn: w=
hy is zero skipped 'i'
> > drivers/usb/typec/altmodes/thunderbolt.c:147 tbt_enter_modes_ordered() =
warn: why is zero skipped 'i'
> > drivers/usb/typec/altmodes/thunderbolt.c:153 tbt_enter_modes_ordered() =
info: return a literal instead of 'ret'
> > drivers/usb/typec/altmodes/thunderbolt.c:328 tbt_altmode_remove() warn:=
 why is zero skipped 'i'
> > drivers/usb/typec/altmodes/thunderbolt.c:354 tbt_ready() warn: 'plug' i=
s not an error pointer
> >
> > drivers/usb/typec/altmodes/thunderbolt.c
> >     66 static void tbt_altmode_work(struct work_struct *work)
> >     67 {
> >     68         struct tbt_altmode *tbt =3D container_of(work, struct tb=
t_altmode, work);
> >     69         int ret;
> >     70
> >     71         mutex_lock(&tbt->lock);
> >     72
> >     73         switch (tbt->state) {
> >     74         case TBT_STATE_SOP_P_ENTER:
> >     75                 ret =3D typec_cable_altmode_enter(tbt->alt, TYPE=
C_PLUG_SOP_P, NULL);
> >     76                 if (ret) {
> >     77                         dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_P]->de=
v,
> >     78                                 "failed to enter mode (%d)\n", r=
et);
> >     79                         goto disable_plugs;
> >     80                 }
> >     81                 break;
> >     82         case TBT_STATE_SOP_PP_ENTER:
> >     83                 ret =3D typec_cable_altmode_enter(tbt->alt, TYPE=
C_PLUG_SOP_PP,  NULL);
> >     84                 if (ret) {
> >     85                         dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_PP]->d=
ev,
> >     86                                 "failed to enter mode (%d)\n", r=
et);
> >     87                         goto disable_plugs;
> >     88                 }
> >     89                 break;
> >     90         case TBT_STATE_ENTER:
> >     91                 ret =3D tbt_enter_mode(tbt);
> >     92                 if (ret)
> >     93                         dev_dbg(&tbt->alt->dev, "failed to enter=
 mode (%d)\n",
> >     94                                 ret);
> >     95                 break;
> >     96         case TBT_STATE_EXIT:
> >     97                 typec_altmode_exit(tbt->alt);
> >     98                 break;
> >     99         case TBT_STATE_SOP_PP_EXIT:
> >     100                 typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG_S=
OP_PP);
> >     101                 break;
> >     102         case TBT_STATE_SOP_P_EXIT:
> >     103                 typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG_S=
OP_P);
> >     104                 break;
> >     105         default:
> >     106                 break;
> >     107         }
> >     108
> >     109         tbt->state =3D TBT_STATE_IDLE;
> >     110
> >     111         mutex_unlock(&tbt->lock);
> >     112         return;
> >     113
> >     114 disable_plugs:
> >     115         for (int i =3D TYPEC_PLUG_SOP_PP; i > 0; --i) {
> >                                                 ^^^^^
> > These should be >=3D 0.  Humans are bad at counting backwards.
> >
> > --> 116                 if (tbt->plug[i])
> >     117                         typec_altmode_put_plug(tbt->plug[i]);
> >     118
> >     119                 tbt->plug[i] =3D NULL;
> >     120         }
> >     121
> >     122         tbt->state =3D TBT_STATE_ENTER;
> >     123         schedule_work(&tbt->work);
> >     124         mutex_unlock(&tbt->lock);
> >     125 }
>
> Abhishek, this looks straighforward, but just in case, can you take
> look?
>
> thanks,
>
> --
> heikki

+Benson Leung +=C5=81ukasz Bartosik can help with a patch to address this
while I'm out on baby bonding leave. As you noted, they look pretty
straightforward.

