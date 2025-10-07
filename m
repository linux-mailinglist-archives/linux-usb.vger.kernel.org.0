Return-Path: <linux-usb+bounces-28987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AC9BC2DEC
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 00:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18B544E619A
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 22:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADC32580FB;
	Tue,  7 Oct 2025 22:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrCIZzf9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73F158DAC
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 22:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759876241; cv=none; b=MOCE5uWjzb+LttbuphZ9eqKv5JGljShofkErMrMTp1O5B17cam2mlHEPH0Qgfy325c4Xx2jfGF2ye10AQoMQNrEgjJDtk07C6U2q1iAWfXpTBVhKRSJXG5t8Tl5RGV0CMbZXd1/cYPJr5qlVGYX0w17FC3xb4Ow44pbjFv6vN4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759876241; c=relaxed/simple;
	bh=bj4X8gaRzDMPQc3R44ls7nSN6XDjdW4fHZLVjLGLENs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pp8ReN0CmNV2u9YO6kQFrCC3UDpm7fQOMYmXlLtqzuQrvcIEelWrf784yu16qUrFPWmkz+5ag1KlDH3kQk9wCLZ2wLCHQPeeqGZOD9aYPKMkR5VHjXqhzPGYJM6+uIJFLAlnQ3KpVoR1UXlN3+5Pq93mycPHxv5vEsfob8hcEUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrCIZzf9; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-556f7e21432so5473134137.2
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759876237; x=1760481037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj4X8gaRzDMPQc3R44ls7nSN6XDjdW4fHZLVjLGLENs=;
        b=DrCIZzf9ohA0wQ58Y4enEQtTrIgly4c2eclF2feUv4VTIiq1KOLHG3sih8HXTaAhvx
         EZHJLHiSM+JrHAXGMRZQNbT5N2k/oqep73i4DAKYVsHlUEdgq8cTvMFprs24qFDy2rqh
         +cj6hT4YKW0PRoGsfCnE+ILQey6M/Oq7q29ItETtUuLB8tJKENIbeBHY6CbHZkjBWlFH
         j4935NUzuUemkMej3IeBEC182AZRp/BVbt0nvWJZdNRVh+LNFR1HyfyJHISCjbw+Wm+s
         4EqcIcSWM5qWg/SDjh+YGXN/XeoLOK/RLmt61jv/XZuWdmnq75LMlSeOp3Px6WCvIKg7
         UdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759876237; x=1760481037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bj4X8gaRzDMPQc3R44ls7nSN6XDjdW4fHZLVjLGLENs=;
        b=ut11fDv81qmLxVqWqgD13NN/BKiSVZav/Mqd/Lx7P1KFKQ2I7fPdGDGiY9TOVXoSjx
         kAXso3pDiKeOiDfCMi8Pd9kDeKt9RWuq5+dQF9qN5KM7yVTEB116XsXcJ+Bo2+Y5Ctk9
         O3o3LavhtqEjyfD4c4QiOiMMcUPxrI70xAMXO6BDXI9+euMUuJUpIc5Sk4kmq0VcASx6
         x+aGju9K3N+erZHNYU6yWc4VPe5SzOgTo8IEaR9TcqHsdv0c5xUlK/obligswwWstIT0
         eBceEvUiNJplfPBlFAXGFRXixI5JsRv9B2txm+C6hR8x2aOa6gRrJdbvguwci6KP8MCV
         NOyQ==
X-Gm-Message-State: AOJu0YzBT0GdOnftbcMxHPqwv5EYK4V9N46p8LOTaxyQu9mKqpb1vGuh
	X94JnFrPKaKZhcbRtDE0DwRQqm2E4Itna3Xp53OI7m7QRpVvqn6JPUs21pWSkOU3tHXskDLNhOJ
	ffOkqJPjjsm5U+Th7tXEjQhV3c8eLQxH7RgU0RlM=
X-Gm-Gg: ASbGncuRhKJttDLN4eNS7f/cgMyxfBX8pbwNkXMSfcBkMtAFbke6/v9pIvWPBUJBjZF
	dtUn6D9Kw7fNND8I/CwM3wcjmu7zD+L2D5gtW6zLJHtJaUuTJ4qz8x3D3BK969CiwgKsSwnbtMK
	4r+CTfAXpMC0l5m5O5UbWf25qPPofb6IoPuYHNsVr10SSv8NMacm1umX5O99gc9n3578L6EZjcG
	VZWzpMrxwdQqfHBFm2bOchq45X5M98=
X-Google-Smtp-Source: AGHT+IGNWhs41vZWOP9iMSxsWEkBKyq8QhSV+L8WXV/JAaG1zxnyWuMVtljMD9GQuLUBjHh5TVhkO2UYAwyEm7f5cfE=
X-Received: by 2002:a05:6102:c8e:b0:5d4:222:9f8a with SMTP id
 ada2fe7eead31-5d5e2322d17mr489450137.19.1759876237624; Tue, 07 Oct 2025
 15:30:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com>
In-Reply-To: <20251007231709.6c16802e.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Wed, 8 Oct 2025 00:30:26 +0200
X-Gm-Features: AS18NWBipKlIi_Dy3WcWABdKfWSnOmxZ0TtdmCzEQpBd_-O7SfykRdaXJ-eyaIM
Message-ID: <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gonna try to bisect it, might take a while tho.

Thanks,
Arisa

On Tue, Oct 7, 2025 at 11:17=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Tue, 7 Oct 2025 22:47:52 +0200, Arisa Snowbell wrote:
> > Hello,
> >
> > this is my first time here, so I hope I am doing everything correctly,
> > if not - help would be appreciated.
> >
> > I found regression in the linux-mainline aka linuses branch, more
> > specifically in the recent USB merge (commit
> > c6006b8ca14dcc604567be99fc4863e6e11ab6e3).
> >
> > All my USB-C client -> USB-A host aka computer(probably all USB-A
> > devices but I don't have more to test) - devices are not detected when
> > I boot with this patch, I have to replug the device for it to even
> > show up in dmesg logs.
> > One device is mice and another one is audio DAC that also shows up as
> > hub in the dmesg normally.
> >
> > I reverted the USB merge and everything is fine again.
>
> Hi,
>
> Can you bisect the merged USB development branch?
>
> It looks like 8f5ae30d69d7 (v6.17-rc1) is likely good
> and e40b984b6c4c is the merged commit, should be bad.
>
> Regards,
> Michal

