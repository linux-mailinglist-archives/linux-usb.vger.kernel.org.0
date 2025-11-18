Return-Path: <linux-usb+bounces-30664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E59C6A562
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 16:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 224C04F199B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Nov 2025 15:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16B6364EBA;
	Tue, 18 Nov 2025 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mp+qZB6I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A0364E9C
	for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763479805; cv=none; b=FsLl4a/BA2ZelBwsurDVrrz0IyjTLzc03sjpdKBi4WHplzCuqmC/gN787ls/hlV6l7kv9Btcy2HQVOLw9CQNJnr+zaxkWx92QpJnsD7iZYNVM3dlh6iH31vgw1SR2lLkntQMECXDfoe4nnAX4YkDK+uqtopxHhhiEmoGut+9aX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763479805; c=relaxed/simple;
	bh=+24wzuM2d6/z3za5a1bgC0s4AxWk02vt3UgqBsXcTlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AazgpVz79FmAHR4QQdB5aTbiPWUI2+iMrSbf0/Ia0cDx4i8RqAVZUWNbnCb4n+80QrpfBa8GpnDLLivJwr86rTYZehFSXW/pKekSXpVhglIQhySACRZHnPoohjZI/Zj9znSKsLe28+viSQpH7mwV8qFKm81AFDWweXijJgXSbFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mp+qZB6I; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-595819064cdso7274337e87.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Nov 2025 07:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763479801; x=1764084601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rn2Mbn8QjQbEvF6k9evaAStTuEpXTz+uPHt8wyM8qmw=;
        b=mp+qZB6IFxuGs/ZIOUbbwH2hkW+io5rL8djVbyeGARDShJHloy4ScEwrsHfC3tz06W
         28WQ+JKl3Qb60xmphyAYWpp/jjaFfmBzOS9A59IYgAE8YFPF/QC8cpJh26mWwvuYZxjI
         ciKepYk7HMBSynJjnqJI5jac1AoJSoi8faOZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479801; x=1764084601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rn2Mbn8QjQbEvF6k9evaAStTuEpXTz+uPHt8wyM8qmw=;
        b=QQfI846yWjpwtJ7qG1PHOeZ0YDFXy5D/U+l+kaydFicHsq/cpr6QwEUpZWWGgnHUwt
         0YhJS74wYPoJhkA4CYA5csS0eLJomFhMAPDZcnFWaAxoMyctCBNHmy5XBVVHb/GGDoaE
         qEuVI+VDNm5ulGNSiiqKC1xY+cKy20bmLqhhkqdrAtjUEMv+3jsk/x0w5/yrYAr6M+Bb
         sTAt0/weWPetPUB0ZDiQeIKGpxQlcxrQto1DQTZ6TkkaiINchuefZsJzrxMoumZsAe+5
         2ljrsBq5qPsjM7Gc83RVT1uw/kDgZbzNZnU5QBckMJC6ecL5Ej0lfb1FlE4T47HBqNhx
         bkzw==
X-Forwarded-Encrypted: i=1; AJvYcCXxAjPU+E18E2Rz1FJrm7fbZzBojSADaf2VGvR6xRdXW+ioUedgooCsjghxlRaIvCxizj9dwypeYz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0IP3Csvghm2mLg98Kl0uyBvL+ZN88hH6/KBSCkhjKSNh5Wo+V
	UEKeGO0oe6aSyFMy8rlBCpcytzttZSJlginfiRtx9o9v8pr6O+rL6FL8qOx/TWRGVXmpvjhWVyl
	9bSiUiNe/iYNudFeLdTAgCMT+ckiFogq8ftn0qR8=
X-Gm-Gg: ASbGncsLTGgQyZv/uU+nl1OKeK+wi5VpEiInGx83frfDymilaTEHzcbByzVsKo6uMQv
	Nsbj5rF0j0zVaXxs8GT1mvFlNaOaRfy6Kei30MekyLiNiCNepqMPSEN7TjUDJwDKM5YAW86QaTa
	2R4LG8VSv9s6uVmAPJ5tWuSbXNOxDZsCYSZHbHBGrdWQRSqJsimMM+obRX9O18RhpUXV9G1VNVM
	v3OIkpu2HT8c4Lh6+bSORGIbleKL1XEUkJWybboXVYFvajTzztD3yMphRzrgdgZOzwNus0OxVrD
	Nfcl0NAynCIMzeAuY4Myh+E=
X-Google-Smtp-Source: AGHT+IFFn0iZrBboNmpo+GWX933TjZSX5IzQqp3ykGo3xqUxB4suwykCgvLFrDK8JHzKa6iA2K0HWWhX6jwphVg8q2U=
X-Received: by 2002:a05:6512:acf:b0:594:5d87:af7f with SMTP id
 2adb3069b0e04-59598742395mr1159221e87.4.1763479801549; Tue, 18 Nov 2025
 07:30:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114150147.584150-1-ukaszb@google.com> <d25feb0d-2ede-4722-a499-095139870c96@linux.intel.com>
In-Reply-To: <d25feb0d-2ede-4722-a499-095139870c96@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 18 Nov 2025 16:29:49 +0100
X-Gm-Features: AWmQ_bmz55YLXjTAhJXuGphxL9YPobTssZXYQUGDPJV1iIgwZl4moU_XRjcmm0g
Message-ID: <CALwA+NZRXEGMsmjmEa1NUEO78yfw1CDz8tbc=zL=bhV6gRs5fA@mail.gmail.com>
Subject: Re: [PATCH v1] xhci: dbgtty: fix device unregister
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 4:23=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> Hi =C5=81ukasz
>
> On 11/14/25 17:01, =C5=81ukasz Bartosik wrote:
> > From: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >
> > When DbC is disconnected then xhci_dbc_tty_unregister_device()
> > is called. However if there is any user space process blocked
> > on write to DbC terminal device then it will never be signalled
> > and thus stay blocked indifinitely.
> >
> > This fix adds a tty_hangup() call in xhci_dbc_tty_unregister_device().
> > The tty_hangup() wakes up any blocked writers and causes subsequent
> > write attempts to DbC terminal device to fail.
>
> Nice catch
>
> >
> > Cc: stable@vger.kernel.org
> > Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >   drivers/usb/host/xhci-dbgtty.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbg=
tty.c
> > index d894081d8d15..6ea31af576c7 100644
> > --- a/drivers/usb/host/xhci-dbgtty.c
> > +++ b/drivers/usb/host/xhci-dbgtty.c
> > @@ -535,6 +535,13 @@ static void xhci_dbc_tty_unregister_device(struct =
xhci_dbc *dbc)
> >
> >       if (!port->registered)
> >               return;
> > +     /*
> > +      * Hang up the TTY. This wakes up any blocked
> > +      * writers and causes subsequent writes to fail.
> > +      */
> > +     if (port->port.tty)
> > +             tty_hangup(port->port.tty);
>
> I'm not a tty expert but would the tty_port_tty_vhangup(&port->port) make
> sense here?
>
> No need to check for port->port.tty, and it does all the needed locking a=
nd
> tty reference counting.
>
> It is also synchronous which should probably be ok as this is either call=
ed
> from a delayed workqueue, during suspend, or remove()
>

Hi Mathias,

Thanks. Good point to call tty_vhangup instead of tty_hangup.

Let me test it and if it looks good I will send an updated patch.

Thanks,
=C5=81ukasz

> Thanks
> Mathias

