Return-Path: <linux-usb+bounces-28996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06598BC31E1
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 03:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8B583A467A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 01:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F299296BDF;
	Wed,  8 Oct 2025 01:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drWW8fzq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A4C1E32D6
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 01:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759887703; cv=none; b=OQecEeeFdwPw+rVa1Sg3UKXdzr3F43q+m9OHgysujN/O9mCqD6z5TbqSvGmfFExoxm7xmo3ik3Fm9rO13Bjp3ERtghFJF4rdIu4bYIETUAgGmbapOJ0brPB0ost8qOu4yzyhJDNferEY/6JfVth/BbIGp9pDwI04DWDSDQKP6PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759887703; c=relaxed/simple;
	bh=2d1Chcz0fALCnLCYlxrm+Gb5iqPnYg/zPWKHCApOPCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aE6E+ajrurQjFdI5FpBaq4utypiuYvRP8W1Nz/9Cc6GDW2PlqzNufNuYP7sWQN2ewtKEKywDVxpqp+B7nwN0B1OKrFUcEEzyH8dTkcqeq/6PGG9dFJjEkgUGiMWEVxgH0582ze4A832AmEol6/b+Wa3MNSwfcjexrGoD5KRspEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drWW8fzq; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso1996946241.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 18:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759887701; x=1760492501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d1Chcz0fALCnLCYlxrm+Gb5iqPnYg/zPWKHCApOPCA=;
        b=drWW8fzqcdKla9Q+SoaLsgJPcKDAZ+L0wPrAOPXf3SDnFJBT+oroR0/WXH2EdzwiNP
         QMPhNQXnpKSX34ssQRZQviWDr25kEsNtsTKMWtFfvR+jzM1p04gho8al7xuIiZNpvR2S
         auTsI4HQptAn4SMMlpl6z5natxzDJRQbfFXk8otgYGudmMKNMtZd/Zj3jVsEVW3UaXV1
         Uu4dvDb21v5X2p7Iwl5JJemE2z3pXwK2xIuO5gN1S/RR+y+zVDb/VRXbcpIUWdi37zEH
         mJpbdohtlTb9M4P2f+Ila6MZcUl/MhZja29oNZI2vltHYfbpLchfG1XVxS3QaTaYdt4l
         snww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759887701; x=1760492501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2d1Chcz0fALCnLCYlxrm+Gb5iqPnYg/zPWKHCApOPCA=;
        b=lmC5V/gIpFwmELn/i0GLMyHrp1jS0Apm0bybLvX2s3VAWmZHxqq3fnP4iWpF6IWTN0
         1OOjKlQhNNjc+C+vxCe8yIRNZJX4M5gUdq3obPpmhfNvKYwruskARfx0VhwOZUgnBUWm
         y4KrmpsOfE2NEwa+oRozOG0PQP3u49pnnWwOarGNhoDFVnDTyYoSepAE+A3n5rfoyPYJ
         WmzFlWyOMzg72jGHTygm3tum8s4eQnibbr1Sb41/w1xJZvPvHZCG+UWNM7CbzbiZc1Sc
         6d2FJ2rRaZpzqjHpkRoLT4w8P5bPPlZz6i6tTP5LirWITMlCkuNWecMTCUp1nfoXdeTi
         TdWA==
X-Gm-Message-State: AOJu0YwWKbYRYDIrBiFJ9EwMHL5qt7wUwoDhOYwvOro40SQR/V1Dofaz
	f5RA1zVY149boXshIueOYW5FLxmy89TEwiUwiluV1xltOX7brNS6TR3ntUh5OZqdD+xrolnujzv
	uCl4GJYUy3ILkKROU/p5ECE9ltx/tMQo=
X-Gm-Gg: ASbGncvgtYcC+DASmkU+zW/pIMcaplUwXdwzXMQadlqbZbixKDT98PbEF2V8aan7tbc
	j7RnDtzKSQxDzh4LP1I5pcETMQ3twLIpQKMLb0BIZtvGaU8XYr7mEZl2YWqcUSJaDStYl8gsFIK
	ErXVWJNH/u/p7Q/47KlWMJpwQJTcZPwalkO7VnQHaRmxKBKsCpYK0Qrs2ftrUv3IuQ9exRWLEYn
	q/aoZ3ASi0SDvf/RgwK/FtNXzHI0dg=
X-Google-Smtp-Source: AGHT+IGCLzw8WrTFnL/ewjI/Iek6ECuNetgGdJHAkt6Ut0FaA9jDYls/J/bs7lN9TsiAMr5oerf2CaQVNXadJ1cFuYc=
X-Received: by 2002:a05:6102:290c:b0:522:255d:4d19 with SMTP id
 ada2fe7eead31-5d5e23b3488mr660405137.23.1759887700976; Tue, 07 Oct 2025
 18:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
In-Reply-To: <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Wed, 8 Oct 2025 03:41:30 +0200
X-Gm-Features: AS18NWAbL3rEdHwwOMOieX7OCd_BiXsywtAo1FCHES514GK3zV1v4o64ASieQXM
Message-ID: <CABpa4MC4rj+OY=Qv7=YwEHC6HbMu3qLEorjmopWEJ_XVhWZ+zA@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see the commit closes bug I had myself, when I have my USB audio DAC
connected, its print error message about no ports on hub but all USB
devices work fine.

My motherboard is MSI PRO X870-P WIFI.

Thanks, Arisa

On Wed, Oct 8, 2025 at 3:15=E2=80=AFAM Arisa Snowbell <arisa.snowbell@gmail=
.com> wrote:
>
> Hey, I am back from bisecting it.
>
> The bisect log:
>
> ```# bad: [e40b984b6c4ce3f80814f39f86f87b2a48f2e662] usb: vhci-hcd:
> Prevent suspending virtually attached devices
> # good: [8f5ae30d69d7543eee0d70083daf4de8fe15d585] Linux 6.17-rc1
> git bisect start 'e40b984b6c4c' '8f5ae30d69d7'
> # good: [e580beaf43d563aaf457f1c7f934002355ebfe7b] eth: mlx4: Fix
> IS_ERR() vs NULL check bug in mlx4_en_create_rx_ring
> git bisect good e580beaf43d563aaf457f1c7f934002355ebfe7b
> # good: [b7369eb7319d0cb94ad2ea5b5486e276339c595a] Merge tag
> 'locking-urgent-2025-09-07' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good b7369eb7319d0cb94ad2ea5b5486e276339c595a
> # good: [965c995c9a4b395471ff48790a0155ee986ca405] Merge tag
> 'drm-fixes-2025-09-12' of https://gitlab.freedesktop.org/drm/kernel
> git bisect good 965c995c9a4b395471ff48790a0155ee986ca405
> # good: [82432bbfb9e83b7e81d04660fe129b99a29b2ac2] usb: typec: tipd:
> Handle mode transitions for CD321x
> git bisect good 82432bbfb9e83b7e81d04660fe129b99a29b2ac2
> # good: [79e8447ec66289745d1b38679b16dd6c654ff578] Merge tag
> 'phy-fix-6.17' of
> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
> git bisect good 79e8447ec66289745d1b38679b16dd6c654ff578
> # good: [ea6bb47fd6a4c5a332f9349c39bf7462e3e7a35b] thunderbolt: Update
> thunderbolt.h header file
> git bisect good ea6bb47fd6a4c5a332f9349c39bf7462e3e7a35b
> # good: [5db5025d32e5b0b4c13198b5570f33d92ae941d3] usb: host:
> xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support
> git bisect good 5db5025d32e5b0b4c13198b5570f33d92ae941d3
> # good: [0ed023a88396088d4221c345a3911f553dd42598] usb: xhci: Update a
> comment about Stop Endpoint retries
> git bisect good 0ed023a88396088d4221c345a3911f553dd42598
> # bad: [a4e143636d5def935dd461539b67b61287a8dfef] usb: xhci: align
> PORTSC trace with one-based port numbering
> git bisect bad a4e143636d5def935dd461539b67b61287a8dfef
> # bad: [931e468764b22a587febf562e57249e95e84350d] usb: xhci: improve
> TR Dequeue Pointer mask
> git bisect bad 931e468764b22a587febf562e57249e95e84350d
> # bad: [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb: xhci-pci: add
> support for hosts with zero USB3 ports
> git bisect bad 719de070f764e079cdcb4ddeeb5b19b3ddddf9c1
> # first bad commit: [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb:
> xhci-pci: add support for hosts with zero USB3 ports
> ```
>
> The first bad commit seems to be
> [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb: xhci-pci: add support
> for hosts with zero USB3 ports. All USB-A devices stop being
> visible/detected.
>
> Thanks,
> Arisa
>
> On Wed, Oct 8, 2025 at 12:30=E2=80=AFAM Arisa Snowbell <arisa.snowbell@gm=
ail.com> wrote:
> >
> > Gonna try to bisect it, might take a while tho.
> >
> > Thanks,
> > Arisa
> >
> > On Tue, Oct 7, 2025 at 11:17=E2=80=AFPM Michal Pecio <michal.pecio@gmai=
l.com> wrote:
> > >
> > > On Tue, 7 Oct 2025 22:47:52 +0200, Arisa Snowbell wrote:
> > > > Hello,
> > > >
> > > > this is my first time here, so I hope I am doing everything correct=
ly,
> > > > if not - help would be appreciated.
> > > >
> > > > I found regression in the linux-mainline aka linuses branch, more
> > > > specifically in the recent USB merge (commit
> > > > c6006b8ca14dcc604567be99fc4863e6e11ab6e3).
> > > >
> > > > All my USB-C client -> USB-A host aka computer(probably all USB-A
> > > > devices but I don't have more to test) - devices are not detected w=
hen
> > > > I boot with this patch, I have to replug the device for it to even
> > > > show up in dmesg logs.
> > > > One device is mice and another one is audio DAC that also shows up =
as
> > > > hub in the dmesg normally.
> > > >
> > > > I reverted the USB merge and everything is fine again.
> > >
> > > Hi,
> > >
> > > Can you bisect the merged USB development branch?
> > >
> > > It looks like 8f5ae30d69d7 (v6.17-rc1) is likely good
> > > and e40b984b6c4c is the merged commit, should be bad.
> > >
> > > Regards,
> > > Michal

