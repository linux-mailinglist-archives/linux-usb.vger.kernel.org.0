Return-Path: <linux-usb+bounces-38134-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIw3MTwkGGrkeAgAu9opvQ
	(envelope-from <linux-usb+bounces-38134-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 13:17:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 290695F128F
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 13:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02D973050936
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 11:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC45E3E0731;
	Thu, 28 May 2026 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fttSM5E5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C893C6600
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 11:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966782; cv=pass; b=rLL84dEB53CqqMkjLRoYx1rledWqNP/s5d8CqW/1Bw8A8613Lb5SUgEvpOMc5nTQmeBKCBeFEnoKMK9WNNdk6q8lRA727JIqK2HX5dPxZ5sNmiKTM1j4yH/ch3O6tfH8NpvqhJkUbZ6s8U+7aCM7feF1l4iNMMwUDpMNpH8oTsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966782; c=relaxed/simple;
	bh=8xs8o7d5xVd5v5gOiZojxwL5cP8epJ07iWJ6BZxR0Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WejkJ21gGOvAyD2KlJEzaULyfMeiyp8sYdGIY9+fBX1GRQmWmsRQT9E44yhmGlZBywB6ZwysZ5MG+mWPspPHRCyfp33NbNAND2aQDhElk94ehZR7/QB4vFkFBFLWzy4weWEe0ojdZHk+3kIsTtNeiw4rPq/oK6RorK2YJlTS2Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fttSM5E5; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso7448093eec.0
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 04:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779966780; cv=none;
        d=google.com; s=arc-20240605;
        b=Py+9XDUQoGQcUR0CzBadwx7Z99xpNGLFUJCqBkLhh/uo9+u4kyOrMv0/okcUPSMckT
         J/dljJloj/dZY4c4Blo79ZAbz99+ULwsiQ38lQdZ47qRvrad7k0NXmdBbwbxBoRjRb+v
         ok6A2r+gUwHqttPjtUb3LCO+r0BbaSF1108MnvQe4RPeq7Rdg81ehjRXcffyNStpyElz
         NNSEDtH9Fj5bwASUQ8Bxko4tC0jW2r+UgzXjFV3zaxHWl7lQYPVoEQESsJyEzK/+iiV5
         xsoJarqApXMTnNVT1HgCtzidx+TTx72pL3DIfGFegVgV0mcuNSzK6n8LgbSuGz4GcWGF
         DP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ZLlaza02i6od9UOBE2Q8vK6W//FnjYjw79bpWQOWZo=;
        fh=4H8ZXF16/yaCyhroJpP2AAXmDzawJEYwifM7RODQr1I=;
        b=X1fXCiFU3CgVruR2naZJSabwLtG+yWKmdT2cVnvk/BEuLOgPtBKmrqOi64BcZwPqC/
         N0Sg70aUrLN9V3pqypsdRYn6qm865N/sdlMTkxeBSDk4zthdhhADz0ct50tVdxpAcAmg
         /Utf8SmL0kDHo/6PSAJfwK7f/y73UCJxL3Uu2V9gqlzLQkb2G9qQpecrB962mWSrQMA5
         j6LICUmzOpdHOATYnDPBAqkPKqvJr/zMozn8nluULvmTsbjd7YcoTF9CcJdWwfflWEnI
         7XWbMKKPcL3BROXXGhhoZOiJk9fIJ1PiTwo63H2113oDtLpSm8E11CRZs+WLvBjv8mF6
         tSlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779966780; x=1780571580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZLlaza02i6od9UOBE2Q8vK6W//FnjYjw79bpWQOWZo=;
        b=fttSM5E5JYMQfhm1yM/48MKeV8frkXmOHnGH2GjIOFFkyMfQeRfHv8SBgmzzjId1fV
         rK6a+01NFfjfQyiF8Kpa8ltI3c2KQZ9uGtUy6rTdA8fHIbULZQJ/4KtRBcmmknlqrEXL
         y4y8ay09klgIjvoupBatEnlQZxnFN83AolhKrqHkfBK8KYynUOcn2vDzTgWkq1SUAe58
         Wqc7c9G7tiBNEN7Ia4xEcAajaJt65ivqbBuZ6uREioSet2qwOA6/BqQoAmbUGb7Jb2V1
         nQt+T2gOF3dO25T3edsjP9PS+Q27sifwVUxKc3n+tBFqszjEdB3YClg5CmYQ27jnyeWS
         L1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779966780; x=1780571580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ZLlaza02i6od9UOBE2Q8vK6W//FnjYjw79bpWQOWZo=;
        b=h/N3djpysCujaWzNtHdrWd81XN3F2SqS9fEmmX6TJG8GiqusXk8os6+qhd9GJ0nwpW
         YEp3NuchGE5u1gQwjZhRKYUnNIeHd5O3rnksG0fQBNtK+FU8nsAmgDnpWy0aY5XIo46g
         3+cfA8wQspTidAHQacxNCpTMcTS5nTwbWiebc5wHq6P6fsZVhmSPYo7TFFa5nh8Jb2mV
         ne7rnvxiUVOd3J7cM3ogFS4TRbCTr/5IY5pX4V92PqUZmHDneG4BasId1Jau4FpjBMFA
         ITIkzPsvcO9xyPFiGpaSQj/Lq/QSXQlu6HgxbHlW4MSbOsW9vuBLFzYQS6EeSsWx20nu
         UPlg==
X-Forwarded-Encrypted: i=1; AFNElJ/kPBtTY6trV3oKLy4d2wdU67T77z+7ZIeTpY9bquIuqHsjAEnRy4FOGTiWePWqcqFooHDCS9449w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvRBuvb4UiKZbnwpenEt43jv30tYl+UXAf3l1kHWQDIX72/Mg
	a2UskKBwBPJ/zqclKTJe4go1c54JVMSIF3nuKZS8VOko28OPDLQYLQtsLyTWqeGhjyUV33tjyOo
	mH9LNIeNaQoeJGBxQ3VjAm04RTEjYPPI=
X-Gm-Gg: Acq92OG9NL8PvgOXka82n2JUnROWGhGkEGyCjcI+ovok0RhPcSgHiN1+sFhkIk6KwtA
	v9jnMNcEV1lRJIiKuGJ2hZ/wXg8m6UtZo/G92ZkDzReW1fx1ZNPPf+eItw7HlDvKkUmvdkz9OJl
	HduDTzKVY10g/DrIWQ544oGr9DCnoA3qv1sPwVpHxuuWKc31/xTSx9DEMfWjeOlqCxr1m1SyBa0
	YszA5LZ56plKgIcUwujIk/MIOtRWQwxk7wiTPY5OyhD2gfglXp94Pz7CDhS5FtlcR8bKxoMML+7
	8dTcLUG0XDhC5Jr7O39WnvrAbX6h2A==
X-Received: by 2002:a05:7300:6919:b0:2dd:6937:79b8 with SMTP id
 5a478bee46e88-30449035bf9mr14390183eec.5.1779966780131; Thu, 28 May 2026
 04:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523083013.46372-1-clamor95@gmail.com> <20260523083013.46372-4-clamor95@gmail.com>
 <CAPVz0n0jpnPFh0f=CWHufzZ+e24xsem5DFTKdFu6sczCLk08Fg@mail.gmail.com> <ahfte9D4TsbgzFQx@nchen-desktop>
In-Reply-To: <ahfte9D4TsbgzFQx@nchen-desktop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 May 2026 14:12:48 +0300
X-Gm-Features: AVHnY4I6ZYIo6G4qxQVAoz1DWMNlxLUEPsCkVjwlCGPGnzxU6KzdrmxGygvJbpA
Message-ID: <CAPVz0n0UO=cJXnSA3hzXy5ye2TTb5UXGdVnqiTKAdaUYUfr5YQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] usb: chipidea: tegra: Avoid controller/PHY init if
 bus is externally controlled
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38134-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 290695F128F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:2=
3 Peter Chen (CIX) <peter.chen@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 26-05-25 17:43:42, Svyatoslav Ryhel wrote:
> > =D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
11:30 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > If the USB controller and PHY are externally controlled, then the
> > > registration of the controller and the PHY initialization should be
> > > skipped, since these configurations must be done by the device that
> > > controls the bus to work correctly.
> > >
> > > Since USB PHY in Tegra controls clock gates required by the controlle=
r
> > > itself, Chipidea core PHY management is not suitable for Tegra.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/usb/chipidea/ci_hdrc_tegra.c | 32 ++++++++++++++++++--------=
--
> > >  1 file changed, 21 insertions(+), 11 deletions(-)
> > >
> >
> > Hello there!
> >
> > This patch is required because I could not find an acceptable way to
> > manually remove and add a platform device. I will explain the details
> > below and hope that someone can give me some suggestions on how to
> > handle this situation.
> >
> > The Tegra USB controller is the root node, and it is bound and probed
> > automatically. This is perfectly fine for ordinary use cases. On the
> > other hand, the modem used in Tegra 3 devices requires the USB
> > controller to be registered at the exact moment when the modem is
> > ready to handle USB. If this window is not respected, the modem will
> > not expose the USB device, and all you get is a cascade of enumeration
> > failures.
>
> Could you add USB controller device node as the child node for modem,
> and dynamic creating USB controller device during modem probe?
>
> Peter
>

That might be an option, thank you! I have to tinker a bit this this.

Patch 1 of this sequence can be applied as it is.

Patches 2 and 3 should be dropped for now. There may be no need in them at =
all.

Patch 4 would be needed by modem, if it is appropriate to be applied,
I can resend patch 1 and 4 and that would be it.

> >
> > The solution as I see it right now: The modem has a power sequencing
> > driver, and the USB controller can either be autoprobed and
> > unregistered in the pseq probe and then registered/unregistered in the
> > on/off sequences, or it can have a status =3D "reserved" set in the USB
> > node and manually register/unregister it during the pseq on/off
> > sequences. This would eliminate the need for this patch.
> >
> > The problem I have faced is that I cannot properly and manually
> > control the USB controller driver to bind -> probe it and remove ->
> > unbind it from within powerseq.
> >
> > Help is appreciated. Thanks!
> >
> > Best regards,
> > Svyatoslav R.
>
> --
>
> Best regards,
> Peter

