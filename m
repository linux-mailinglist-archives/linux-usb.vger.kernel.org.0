Return-Path: <linux-usb+bounces-31683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6ACD6B4E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 17:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B009A3014B66
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 16:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361533328F6;
	Mon, 22 Dec 2025 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbxREXt8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E102C11E2
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 16:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422182; cv=none; b=nwhrwmDoyKKF9HIHbQVQyMn6OIV28bPCvXUykPdlXXeeggJ8mxEqgGnGFfAwI38CN37gHS2YU6vyzWc9k+Bh/k6JmmdbK1Ap5caq/RB8wjqDdkEkzrX2dBYnBh0fO4cSpXiFsOU5Zr0EyP96CEDRyMZ860forkNzWx4bF+56sXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422182; c=relaxed/simple;
	bh=s4al1YcouowCwEMJpRHJhKgg9Wb10qp8TsQHudR5GSw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zw/LmxIJAvT6fisrwSpflSCdV9RisMnlvOPtjBmVshtpjfI1fdIWNh+L7aN5kOL3gZsPcbRzIYS4CBqnscuN+dezWtg+gt01EkihJZNCbnDUGC9siJYqY0WF7/uR5mEMf1lxFVaaSHh8iq4YzgTYzR4Svb4L6JUEpzxte2SKlsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbxREXt8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so5819930a12.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 08:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766422179; x=1767026979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2TeGU1yZihTwXXuF0l6WZeB3CYaTSrLUKvNNXrmTmU=;
        b=NbxREXt8qrNLnJ9WJw2LUuohXLeqz0qvRZ8rkDShgbA5sxQ/e/dXXnLRVn/ERxiIBQ
         /qOkS++HMW3xw2WP0gRCDrSfAIhhkffA8PG9Rbaq6YreG7cKviBVvgUJp/rWhGm6p16s
         wmT3IWrqEqEEzVwJ9t+Q2rEkFsIiG7TNgXBrvhQSyeYxoyP99kLGGLetTUJn1gUWHTiy
         HYAQhJ+yvkzm6TgfUn/0ve12JWO1tpJNELbAykbxgGNFrLO7okhWoMM8Z/f+KfguvOeV
         6q3n3q0eIbN7qxlR4JUx5+p0cfqytytjy7njQunyezYMGFyQ1ivtx1V/WbsN16UDNVOH
         /pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422179; x=1767026979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y2TeGU1yZihTwXXuF0l6WZeB3CYaTSrLUKvNNXrmTmU=;
        b=UlJw1XML2qNDKCTZe+Kz1DKQihHCSuIU0UAz4XQWN/tDf/iM7dZmGhvitil6JMka+l
         IVmOdd3uVbK7I8EuP9ViEItKKRNmZtrRvwB6if8WA4yJLwMqcdGiAv7yV1wHCAGlquWH
         29LHKSQiac4ZeXgIUuxTRicYuYllb/FLii8aJHGvLkx4+pr5KA8LXnz1P9VqhVsozdV9
         tHKICugiChwoYk1f526nCAxMRliVVR6Q/KJ3r1BWvUcIsAhOEjLEX5AXZXzf9Wb2Ijse
         CkVP0gM2203QW3DLf4YJZpWGtKbkvZc1FvZ+vaRzQHAM32WXAvkRvg/8oovwPY4PA69S
         qhzA==
X-Forwarded-Encrypted: i=1; AJvYcCVQW3J3QPTp/ggZJyADVkkNysAhXPTi/ugoMKyslYcc3K1YNcZhOs2cCaOKIEfVTrSO1qBUV9Sgin0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8MK1ykSYYY3W1iS+w2mwOj9YM++Q3dtpwg3dyCxOr08uL00c
	Opo5qN+2BYQYjUg249I0hxuJqT/4cxsaE3P9Pr9cPBC3sMbSxx36drhq
X-Gm-Gg: AY/fxX4strrW0E/2lOv92phnNwu2PgBe0BcdjDionRAy9iy2jOqKqZWAgUvdVHBolpR
	a1ritEvBq0jd3PSs1lfPvxbwIjO3j6nJSjl+QmoAMKeZtZ8/9Uy+z2uRzK4KU55R6pn1zpNWHvY
	5kpQ0y3wp/AX5t7ywjHYKH1Qz6IgYM/KGUHswYnYRQ+LB1NXGyXP2JYRzaci+tzyOgYIJXbQpag
	r95y3+dw3B9cs6aZvcLZ5ySNalCwGjMBPCpuD/AmzV+VZsHM98OBkrUDEasJC228OBLaRuJSswh
	CH/yWAxK5vpi+/9qLkRj184VDiEDKy93NEVldlbmZTjEFw96SGgRkkbRl45+gVc/TzekVzIHlzb
	mvbdl3pH+wRX+id3zjjVz3yCdAgh0u1Rvk4G4jBtFdpumsEGDTJH7+AvBQZPK5/pjPrtwI7hrn1
	ohJp96I+HbQI9chgjQ5HcUmF0=
X-Google-Smtp-Source: AGHT+IEuoajuyQPlnJMJHAzpLoiP+2gWrQxeVR+VMMx8YYpqOOZ/n023XBImwrvD2WSRLXwF4/OUGg==
X-Received: by 2002:a05:6402:3c6:b0:647:a127:7c1e with SMTP id 4fb4d7f45d1cf-64b8ec6dfb0mr8295768a12.20.1766422179064;
        Mon, 22 Dec 2025 08:49:39 -0800 (PST)
Received: from foxbook (bfd193.neoplus.adsl.tpnet.pl. [83.28.41.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm10993483a12.12.2025.12.22.08.49.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 22 Dec 2025 08:49:38 -0800 (PST)
Date: Mon, 22 Dec 2025 17:49:34 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Sarah Sharp <sarah.a.sharp@linux.intel.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <20251222174934.4c9b62d2.michal.pecio@gmail.com>
In-Reply-To: <eb5715b5-613a-4610-9852-1a6ae67b4153@rowland.harvard.edu>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
	<TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20251220141510.1bc1ef19.michal.pecio@gmail.com>
	<20251222064252.GA1196800@google.com>
	<2025122253-stopper-tweed-6e68@gregkh>
	<20251222085543.4d7430d5.michal.pecio@gmail.com>
	<TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<eb5715b5-613a-4610-9852-1a6ae67b4153@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Dec 2025 08:34:14 -0500, Alan Stern wrote:
> On Mon, Dec 22, 2025 at 12:21:09PM +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wro=
te:
> > Hi Michal:
> >  =20
> > > On Mon, 22 Dec 2025 08:13:21 +0100, Greg Kroah-Hartman wrote: =20
> > > > > An API that insists on its users exercising care, knowledge
> > > > > and cognisance sounds fragile and vulnerable. =20
> > > >
> > > > Fragile yes, vulnerable no.  Let's fix the fragility then, but
> > > > as has been pointed out in this thread, we don't know the root
> > > > cause, and I don't even think this "fix" would do the right
> > > > thing anyway. =20
> > >=20
> > > The patch looks wrong. I suspect this happens when add_endpoint()
> > > is called concurrently with resume(), which makes little sense.
> > > And it means the same code can probably call add_endpoint()
> > > before resume(), which makes no sense either. We can't do that
> > > with suspended HW.
> > >=20
> > > Chances are that this crash isn't even the only thing that could
> > > go wrong when such calls are attempted. For one, xhci_resume()
> > > drops the spinlock after reporting usb_root_hub_lost_power(), so
> > > your guess elsewhere was correct - this code isn't even locked
> > > properly.
> > >=20
> > > It seems no operations on USB devices during resume() are
> > > expected. =20
>=20
> Let's be more precise.  No extraneous operations are expected on a
> USB device while that device is being resumed (i.e., no operations
> other than those directly involved with the resume itself).  However,=20
> operations on a USB hub or controller are expected and allowed while
> a downstream device is being resumed.

That's not the situation here. The problematic resume is that of the
host controller itself, it's the only place I see which is expected to
destroy the segment pool at runtime (other than stop()) and possibly
cause the reported NULL derefence.

It is not expected that anyone will add endpoints (and probably do
anything) while the HC is resuming. No sanity checks for that either,
the driver just does stupid things. It likely does stupid things too
if you try to manipulate devices while the HC is suspended.

And it looks like somebody found a way of doing just that, by calling
snd_usb_autoresume() at inappropriate time for some reason. The export
was added by Wesley Chang, so I guess it was part of "audio offload".
IDK if offload uses it correctly. Somebody uses it incorrectly.

> > Currently, after checking the logic of our KO section, we found that
> > there might be two places simultaneously calling snd_usb_autoresume
> > to wake up the headset device.

Resuming some USB device wouldn't destroy the segment pool and cause
this crash. Here, device resume tries to add an endpoint and crashes
because something else has destroyed the pool.

Regards,
Michal

