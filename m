Return-Path: <linux-usb+bounces-28995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0E7BC31B6
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 03:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7D03AAAD6
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 01:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7227028DB49;
	Wed,  8 Oct 2025 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqZyOFCJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A481E32B9
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 01:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759886145; cv=none; b=rrxqpaycq0Jt31AsyUARezARUkBeQjIYDEDYtsRuAQEW36YEusmdmKAmpD3D9D9ucIA5HTVrvR7KFYvYjd2chLMQpgHylFRvaVV/SO8/hbQkelPlbV/DOlIiuv5fq1xwBj4S2TAbBoZ9vc5dvZA0v8bBFZy1pMK7hi8nya8t2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759886145; c=relaxed/simple;
	bh=okr4oLIpl5iYzEdbqi66GV0ZgeoKenkhmPNbhYngG7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uegukDWYq5jlEnCEEOr2U+aWXjYcAEJfCNjEfNNlkiyV+jOcEgwurhufsOGf+87ndw+Um3nGq6hjzQ/Ajkro1/3rPsiILhHHxEvW/OuWrS9yLi71dAHD4dMDJ64W0Xytz041/fCVd0TqH0B5ffOGWcSGkCabRUrlORXJ/PjvRkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqZyOFCJ; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54aa789f9b5so5245851e0c.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 18:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759886142; x=1760490942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okr4oLIpl5iYzEdbqi66GV0ZgeoKenkhmPNbhYngG7o=;
        b=cqZyOFCJoZcPC26Si0/ZS7ag+VHWrA9JMY6fy+II58k6nN3NdJTqDQC5K16Nwgd4J+
         +y/iYQ4p9VXy0fk+V7zZdt0O5rw6j+Nmpx/52u63Rx28XdfY/Fh6FfSnuw5Cs209ct/k
         MkGReBTssvjkvQjhjAmkhMa0SB/9wkOOCDaimF1HExINk6U/xq2GzdEDkw0InLddXPm3
         ctHXH5cRscP5aeB+9b1sU4AATfPOCI67+YY8WFmssL+vDnxi3W/a99bejwupKU1ReILo
         sRx+peuaprXyoKgv0q/jbXip1t/OWK7fHI2yzywRzawErRNN4gGV7Iij6s0mG5pA/8Os
         upHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759886142; x=1760490942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okr4oLIpl5iYzEdbqi66GV0ZgeoKenkhmPNbhYngG7o=;
        b=MKrFqXMmyVvgYRJauYg0Y5H6tw6MbInwGNnntUFwkEhZjj5qHZ9kJPdBA9/gTwDaOu
         emVhXAuTRvKqFIpKK+BfNap22OMQTm5Ss409OE2x66hBHTL4w9jkmg3+b+zKZZXVjzNa
         hh/u/+U3jxJ4dIHKfir96ARpk8UWAX4LVRwOJMP7R46X0tJTCnb6jKdYhbn1FYsxW6eN
         I/0XryMZoKQ0mZcb2YYWQL6pyWHQ6DdJjlX1zeL0irKPZdLyZ4mwEGx3kFzLMwIdYe1n
         wfKfetIZD3gBjnmjZq1pZYydMBD276RRA88R1/foMsr2ZQOoxu+Y/mlTTTRsrIySeP/T
         NTTw==
X-Gm-Message-State: AOJu0YyXsu77QCm+7bG5xzaWtkV7gNYdxuWxFn46QyPQl3Fc711FlEFP
	Jyftj/vknIDvaiSE7Q9pNulQS61hw4bhYNpsC4pboAgMWU0BPCwfoHavvZLboQq/6GaA0FlTB2B
	yqlYL+O/pMtMiG6u596tvl1sBOiYU4wY=
X-Gm-Gg: ASbGncsacfjhg7Jp6lZ6oX0q8Lv8tpcYMwzxQ6aK+pPdlmJrjN+AVYKPMNXxfI9pAR+
	ZsjqXhLzJ01Iju4kmKUVs3zL5GMXWCFER4qL5CAayNTffVQY2FBFkgFOHc/dC4rLMr9aZkhcpnt
	/0Y3kfGGSd2I3FBxFCqPmuj5ISWNpv1PdJlYvEl6chSSysexiAhFLFKFlaY1zNiVR5MF/QwMTj0
	XICTSRMmZTlE7qR+3+1yS4ZN25cOfM=
X-Google-Smtp-Source: AGHT+IFbvHrYntSb5b5KzP+4ThpoXJn6bMbhvY1D/lMso9o9fb01e8c1+2ZEKVDwi+H5I2TCeSfe+XtXjruvnXawd4Y=
X-Received: by 2002:a05:6122:3d09:b0:54a:87d3:2f0c with SMTP id
 71dfb90a1353d-554b8adf4c8mr758000e0c.8.1759886142114; Tue, 07 Oct 2025
 18:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
In-Reply-To: <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Wed, 8 Oct 2025 03:15:31 +0200
X-Gm-Features: AS18NWAVbai0vxZVzPN2SXqI5zOrLEFJYtTYfx6NNu1O3cxM-jkF6vYbeOkMZTw
Message-ID: <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey, I am back from bisecting it.

The bisect log:

```# bad: [e40b984b6c4ce3f80814f39f86f87b2a48f2e662] usb: vhci-hcd:
Prevent suspending virtually attached devices
# good: [8f5ae30d69d7543eee0d70083daf4de8fe15d585] Linux 6.17-rc1
git bisect start 'e40b984b6c4c' '8f5ae30d69d7'
# good: [e580beaf43d563aaf457f1c7f934002355ebfe7b] eth: mlx4: Fix
IS_ERR() vs NULL check bug in mlx4_en_create_rx_ring
git bisect good e580beaf43d563aaf457f1c7f934002355ebfe7b
# good: [b7369eb7319d0cb94ad2ea5b5486e276339c595a] Merge tag
'locking-urgent-2025-09-07' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good b7369eb7319d0cb94ad2ea5b5486e276339c595a
# good: [965c995c9a4b395471ff48790a0155ee986ca405] Merge tag
'drm-fixes-2025-09-12' of https://gitlab.freedesktop.org/drm/kernel
git bisect good 965c995c9a4b395471ff48790a0155ee986ca405
# good: [82432bbfb9e83b7e81d04660fe129b99a29b2ac2] usb: typec: tipd:
Handle mode transitions for CD321x
git bisect good 82432bbfb9e83b7e81d04660fe129b99a29b2ac2
# good: [79e8447ec66289745d1b38679b16dd6c654ff578] Merge tag
'phy-fix-6.17' of
git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
git bisect good 79e8447ec66289745d1b38679b16dd6c654ff578
# good: [ea6bb47fd6a4c5a332f9349c39bf7462e3e7a35b] thunderbolt: Update
thunderbolt.h header file
git bisect good ea6bb47fd6a4c5a332f9349c39bf7462e3e7a35b
# good: [5db5025d32e5b0b4c13198b5570f33d92ae941d3] usb: host:
xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support
git bisect good 5db5025d32e5b0b4c13198b5570f33d92ae941d3
# good: [0ed023a88396088d4221c345a3911f553dd42598] usb: xhci: Update a
comment about Stop Endpoint retries
git bisect good 0ed023a88396088d4221c345a3911f553dd42598
# bad: [a4e143636d5def935dd461539b67b61287a8dfef] usb: xhci: align
PORTSC trace with one-based port numbering
git bisect bad a4e143636d5def935dd461539b67b61287a8dfef
# bad: [931e468764b22a587febf562e57249e95e84350d] usb: xhci: improve
TR Dequeue Pointer mask
git bisect bad 931e468764b22a587febf562e57249e95e84350d
# bad: [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb: xhci-pci: add
support for hosts with zero USB3 ports
git bisect bad 719de070f764e079cdcb4ddeeb5b19b3ddddf9c1
# first bad commit: [719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb:
xhci-pci: add support for hosts with zero USB3 ports
```

The first bad commit seems to be
[719de070f764e079cdcb4ddeeb5b19b3ddddf9c1] usb: xhci-pci: add support
for hosts with zero USB3 ports. All USB-A devices stop being
visible/detected.

Thanks,
Arisa

On Wed, Oct 8, 2025 at 12:30=E2=80=AFAM Arisa Snowbell <arisa.snowbell@gmai=
l.com> wrote:
>
> Gonna try to bisect it, might take a while tho.
>
> Thanks,
> Arisa
>
> On Tue, Oct 7, 2025 at 11:17=E2=80=AFPM Michal Pecio <michal.pecio@gmail.=
com> wrote:
> >
> > On Tue, 7 Oct 2025 22:47:52 +0200, Arisa Snowbell wrote:
> > > Hello,
> > >
> > > this is my first time here, so I hope I am doing everything correctly=
,
> > > if not - help would be appreciated.
> > >
> > > I found regression in the linux-mainline aka linuses branch, more
> > > specifically in the recent USB merge (commit
> > > c6006b8ca14dcc604567be99fc4863e6e11ab6e3).
> > >
> > > All my USB-C client -> USB-A host aka computer(probably all USB-A
> > > devices but I don't have more to test) - devices are not detected whe=
n
> > > I boot with this patch, I have to replug the device for it to even
> > > show up in dmesg logs.
> > > One device is mice and another one is audio DAC that also shows up as
> > > hub in the dmesg normally.
> > >
> > > I reverted the USB merge and everything is fine again.
> >
> > Hi,
> >
> > Can you bisect the merged USB development branch?
> >
> > It looks like 8f5ae30d69d7 (v6.17-rc1) is likely good
> > and e40b984b6c4c is the merged commit, should be bad.
> >
> > Regards,
> > Michal

