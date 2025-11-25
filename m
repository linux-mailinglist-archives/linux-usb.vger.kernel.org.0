Return-Path: <linux-usb+bounces-30885-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BAC83D0F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 08:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5901F3B07E2
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 07:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5282DE6FE;
	Tue, 25 Nov 2025 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DjICRCdF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9B52DC32A
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764057212; cv=none; b=VBERAmKMkys/gqPNufKOKsdfRu3b7iJyW7PStqa/vRYTA5bmge4I59vgZSAsiI2VJYdFZGYbak5BCv3Wc4xrfmXiBPPdJqnsOEI516kACHZC8raDi9IBtyXDuBqbLt04ZSSFkHBVXWYhUphSovtmN7BXkeqh3bl6cyfks8o5+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764057212; c=relaxed/simple;
	bh=QALkO2l63ElPL+SM8EnCE5RvNLGszpSTCE8PUQlaRbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjmRpB2J/Rg1xWNTXANpCbkNWnnP0wDMMqFJPU5bgO3JeDmCm0U7YAQOf4WkE4mM7JRwsdNLETleQIQmlNZyVL+L0ZUAz1dQ1Drf2tLlpRVuiLJCRfdE1z36hqnAXpCD+dD6yNp//SDqb6l/oATusUw1/4FjMd01N4QYPC5TRdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DjICRCdF; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594516d941cso5892592e87.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764057209; x=1764662009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW9fk+eRBqur6OCFMItr5F2cEB0RbZrpC7YKLRabMpw=;
        b=DjICRCdFmQ2GXQivrzEIDEf+EiAVYtD8PSnFuV17YCQ6F2krCQWR8sQT2hVT1n2H5c
         5qPEPaYM5WRtL8iorylT3sNZmF1xj7Qo+J6WLT3hr/oEW2/HNbE9rbg4MSim3yHpEgVN
         G5TY3zyYGe4bgLDIsXI/to6bibGgxp2rPSED8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764057209; x=1764662009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VW9fk+eRBqur6OCFMItr5F2cEB0RbZrpC7YKLRabMpw=;
        b=Bx6X9ZTkNFm0ZEhpqNsnJn7KYRwZ1sYhZfTjrCE2DpDPQAgaMsvIiLjqzDn0IArW69
         OoePvljd7n1WiOPWz20ToSDs7NxyxgTKYZp/+jsA9RtVXv0KbufnCBGU++Yj8FeL8HJu
         hw9urAsMW1fZjw6K2qS24snryNOnk85KFHtdPt4yZVnwTFcFuRKxBMaY3ZSPHGbJm8BR
         lO2C5OTbqRMsmO0hkXtxwF3FQb8qew6t/r1Ph/JlKHz0jialU0T4IZfakAKuA6SVFDCL
         rtppQU9XokPxxJQKGOaYrCt4ozF0eTJElE5D27s7nG87Olewg0H/sjbRmhggGI0gEcgm
         oIYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHk6XFWKGkyW+UxJ9/jj5Mq97egIuL7lZm7Yr50Wp87bFfNqLeGm5Rv+CJYse+fKdzj41F7VK4LSk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6oEHQEQyHPPg+ClwHCrn+UjBNJRVX2XYBxl+/4UeNzYWR+EZG
	W1iA/Np/uyUJWwfZbSKTIi3SXF2C6TQ2C+2gGW2lH6iFg4kepywMo51KxrAi6nDQd7a3UECRzvq
	V0RqgPY8GDrscPrEcI9LMbI2dcXD2atQ+yApUxus=
X-Gm-Gg: ASbGncuSSxN4vyuxH9NIZ/IGCjQTJGue/Wq1aWIaD8hmNtwm2oow4ecLVff4BY3VWWU
	fIFg3anefXXVCntH1rSS9EbMcNGJRvbKgp5zac4iwAwSkkDJ6sqNspJAXejMu4x0Jb4nmMJMn2v
	IlBLvmtJ1UZG1/cvoRP9CmbXDbCBP0SK79lMLRmphKryWQZMaVDV+af2XqBsWo1yvBQUCSC5Wx+
	6/RQNVssSI8J36WpJzc31GRxFqskiYWY6GFZ5zr7TzPchGcbKwZp0HWFzRHrmxrLlraTtikQVjN
	pg==
X-Google-Smtp-Source: AGHT+IEifOJmyiCsFOT5OGXNBDuJrumS8e1OEbDl+tOphrhwx2KdXAfOkAoydLQJLpGr9qVTDLsmhvdTzuXB8683cTM=
X-Received: by 2002:a05:6512:398c:b0:592:f9dd:8f28 with SMTP id
 2adb3069b0e04-596a3ed25cemr4985472e87.35.1764057208763; Mon, 24 Nov 2025
 23:53:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119212910.1245694-1-ukaszb@google.com> <2f05eedd-f152-4a4a-bf6c-09ca1ab7da40@kernel.org>
 <6171754f-1b84-47e0-a4da-0d045ea7546e@linux.intel.com> <e7ebc1da-1a94-4465-bc79-de9ad8ba1cb6@kernel.org>
In-Reply-To: <e7ebc1da-1a94-4465-bc79-de9ad8ba1cb6@kernel.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 25 Nov 2025 08:53:17 +0100
X-Gm-Features: AWmQ_bk4hTtCGqfI6AKAS5toTSvyk-WSSSR6OjN0qv3zrxaYyCIn6l2upPhGeBg
Message-ID: <CALwA+NakWZSY-NOebF9E+gGPf2p0Y5FLOZcpLfSbt5zkNm_qxQ@mail.gmail.com>
Subject: Re: [PATCH v2] xhci: dbgtty: fix device unregister
To: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 10:11=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> =
wrote:
>
> On 24. 11. 25, 8:48, Mathias Nyman wrote:
> > On 11/24/25 08:42, Jiri Slaby wrote:
> >> Hmm, CCing TTY MAINTAINERS entry would not hurt.
> >>

Fair point. I will keep it in mind in the future.

> >> On 19. 11. 25, 22:29, =C5=81ukasz Bartosik wrote:
> >>> From: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >>>
> >>> When DbC is disconnected then xhci_dbc_tty_unregister_device()
> >>> is called. However if there is any user space process blocked
> >>> on write to DbC terminal device then it will never be signalled
> >>> and thus stay blocked indifinitely.
> >>
> >> indefinitely
> >>

Thanks for spotting this.

> >>> This fix adds a tty_vhangup() call in xhci_dbc_tty_unregister_device(=
).
> >>> The tty_vhangup() wakes up any blocked writers and causes subsequent
> >>> write attempts to DbC terminal device to fail.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
> >>> Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >>> ---
> >>> Changes in v2:
> >>> - Replaced tty_hangup() with tty_vhangup()
> >>
> >> Why exactly?
> >
> > I recommended using tty_vhangup(), well actually tty_port_tty_vhangup()
> > to solve
> > issue '2' you pointed out.
> > To me it looks like tty_vhangup() is synchronous so it won't schedule
> > hangup work
> > and should be safe to call right before we destroy the port.
>
> Oops, right, my cscope DB was old and lead me to tty_hangup() instead
> (that schedules).
>
> >> 2) you schedule a tty hangup work and destroy the port right after:
> >>>       tty_unregister_device(dbc_tty_driver, port->minor);
> >>>       xhci_dbc_tty_exit_port(port);
> >>>       port->registered =3D false;
> >> You should to elaborate how this is supposed to work?
> >
> > Does tty_port_tty_vhangup() work here? it
> > 1. checks if tty is NULL
> > 2. is synchronous and should be safe to call before tty_unregister_devi=
ce()
>
> Yes, this works for me.
>

Greg should I send v3 with typo fix  indifinitely -> indefinitely and
elaborate on
the tty_hangup() -> tty_vhangup() replacement in changes ?

Thank you,
=C5=81ukasz



> thanks,
> --
> js
> suse labs

