Return-Path: <linux-usb+bounces-31483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E230CC3CBA
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 15:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A02EA302E95F
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 14:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321D4313E02;
	Tue, 16 Dec 2025 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D4DNtpaz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D0230DD1B
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765897073; cv=none; b=upo6zjradzTJoXU4dvuL+Y9gx8aBokmEY8p1O3icwtp/Xls8sl3ASfzGmJRaO7c8V9w554qHhCxVqj0jCaS0iCrLsjofdUnTMOo8o/o9/uZCSAVIDZGQIy2AE8NEaScMUCkvEZAjV/YnDYi1MfRb3onh9vA7q9+JwnOci1TArjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765897073; c=relaxed/simple;
	bh=2wMthbHVjjP+gIScZhyEdoOnajehfZ/046O1h3WJBQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GV6OsF/bCNyy+RBco/mKcOUppTZfwJVMX43caSfb6k4SeGjiXo0cB+ktZzEUhBbEm9B8xHM9z8uUjzZHXBMohtObQ+/baZfd9F6XhxAvdhxaQ/HeCHah2E4cR0toLCT0cXX5sXiM6xEsVxqbZ6Nu+HdBVtWbqbQbKK0vGiukVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D4DNtpaz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0d52768ccso29763335ad.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 06:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765897071; x=1766501871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJMwXlx2Rjl+EioxGE3frGq2agjzpjGGNIFFQoMj4s8=;
        b=D4DNtpazOQqYDLWP6S6lS+t2nMQpRNlT+AS75TKnxyYu/H4UjgzSnwgmDC1Fom35Fy
         feIWzs4ekvpXumQBBbR9jEvBkUKPPWAw725vWjctAGuwb3DcaiTGNHyRYlsch+b5f61E
         ccykeXKbeR1vWQ+fXM/zPFMXgYMcPSDumFZXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765897071; x=1766501871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UJMwXlx2Rjl+EioxGE3frGq2agjzpjGGNIFFQoMj4s8=;
        b=GbQnkbgpXeLPjErua3qgQc+EAh+5xXk/Tfjw6g41yodgyI9gKD+RWvUfXVLZulL7EK
         xQoC8rYZEyfm2uPXyix/wRtU9N35owqAtBNaLL+pJsntyY2ltZNh8casWbMXFO3aZGj/
         E+CLVVFLw0fkUiNGZ+rNLHjzDmovXlte9BYaeGlBLccpQSh9bUru6RsUO2w1nWuPT5LG
         nV1TM9o/N2OM6bEf5/pn3zsugoJWolSMqGIyDJL9qkVoKDzpdWVGlDeHSPlz3PcOl7nI
         58V/dWGAkR7bPMCqxRwC5bJxeBc766xLOr73HTXNx1pO5y51gDphM6wb5DCHtTpS/KF4
         J5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWgJQ/kt92rCZOYh1JAQFuL7W+YC7zj6/VsvwUCGh/an8GXDdbq16dmwrYfMYnXBqM/bvh1XxLwnWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS/MpYgLCwCbMGY2fDm4e1q3K5CchjaGY9iCe8IMsAeMTks6cM
	RtNSPYhKRGVYbjWGjRvWqvTjNvj6aNO5ZmKGAKfV6aoxp5t8epErQzpw7hchD9zECEOSMJwDrVM
	pXA/7HZeLK5TqX17oPiQLqrN/c2zFRzYpgeZwC/tz
X-Gm-Gg: AY/fxX7utXfEb5CXiWY7YQ/xCtzNa4YEfIuIBRdVmDdupr4TOH5jlnrBXTppMBWj9c4
	p8MeBuuQFXOuIu8/HZbuGRxXIvKm61F9qQeG/jxWfLIrixCH/pv6WDquCg+vGULjA9khRjflEQv
	06eBoPgNED3yx6qZSvKk2NLyMmWkHkmDr4VlIDYpvF+IqwQyWXn4emIKpmnXaF1ISyMd0269RNl
	bsg3tubSkJhyyoNqPdOvmcRK6xaVYvMlsWIyzejag8QmUxJ1VSqHTXsM+bPlZDN875HBE4uwozP
	UvFV9R2e2P2ka5hqRaTFl68ywgBkB8A=
X-Google-Smtp-Source: AGHT+IFq/YJLo2S94WSmkV3peCfI5q+2HJAgkoWlsWR59YkyvNZbaVFa1+jxfVtOJWIj3uj/WxaOViW9ql8LtSIDXIs=
X-Received: by 2002:a17:902:f686:b0:2a0:b3d5:5c3b with SMTP id
 d9443c01a7336-2a0b3d55dbcmr110163575ad.29.1765897071499; Tue, 16 Dec 2025
 06:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201122604.1268071-1-akuchynski@chromium.org>
 <aTrJwA7Y4fWiTMzB@kuha> <aTrTvA8Srak1mNGS@kuha>
In-Reply-To: <aTrTvA8Srak1mNGS@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 16 Dec 2025 15:57:40 +0100
X-Gm-Features: AQt7F2qeZ_WfsLUra7491GkxZMYka8CwuiO4xGxfSOYVSZ4rrkAarfhEbx97JRI
Message-ID: <CAMMMRMdwX8wKJz6OEvosVXFH2npr+7pd0pdq3eY9r-Pbr3tjMw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/8] USB Type-C alternate mode selection
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Pavan Holla <pholla@chromium.org>, Madhu M <madhu.m@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 3:23=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Thu, Dec 11, 2025 at 03:40:24PM +0200, Heikki Krogerus kirjoitti:
> > Without going into the code review yet, I'm okay with this in general,
> > except with the artificial SID for the USB4. I still don't understand
> > why do you guys think we should use that instead of an USB4 specific
> > device type?
> >
> > I think somebody said earlier that the user space can't see the device
> > type of the alt modes? If that's really the case, then I think there
> > is some bigger issue here. Are you really sure that if you check the
> > device type of an alternate mode for example with udevadm, it does not
> > say DEVTYPE=3Dtypec_alternate_mode ?
> >
> >         % udevadm info -q property --property=3DDEVTYPE /sys/bus/typec/=
devices/port0-partner.0
> >         DEVTYPE=3Dtypec_alternate_mode
>
> Or just use grep :)
>
>         % grep DEVTYPE /sys/bus/typec/devices/port0-partner.0/uevent
>         DEVTYPE=3Dtypec_alternate_mode
>
> So, if that really does not work, then there is a bug somewhere that
> we obviously need to fix.
>
> Please note that the port altmodes are now also part of the bus.
>
> Br,
>
> --
> heikki

Thank you for the review, Heikki.

The USB4 SID is utilized for distinguishing between USB4 and alternate
modes internally and is not exposed to user-space. This represents internal
implementation detail, for example the boolean variable `is_alternate`
could serve the same purpose as the SID.
This patch series introduces no new sysfs entries; the only new attribute,
`priority`, was introduced in the mode priority series, available at
https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.or=
g/

It is possible to use already existing `usb_capabily` and `usb_mode`
attributes to manage USB4 mode, allowing verification of USB4 support on
both the port and the partner. The activation of USB4 is accomplished
through the implementation of the `enter_usb_mode` typec operation.

I would like your opinion on whether using a USB4 device type would be a
better approach.

Please note that patches 6 and 7 are not part of the mode selection series.
They are not yet complete and are provided only to demonstrate how the
entire feature should work.

I confirm there is no issue with the DEVTYPE. Thank you.

Thanks,
Andrei

