Return-Path: <linux-usb+bounces-29949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56455C253A9
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 14:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B3BE4F3AD8
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 13:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4190819539F;
	Fri, 31 Oct 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHowvhEL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0363372614
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916560; cv=none; b=FWx4QCgSvuqn7Q24VfUGBiXR3VuuzdzFO/blY+M89O80QX2dye1tX/Aicjet9ofsMA4UqVLTEZFF1lJ3KtX7hO8kwoYcpk6NpDFT+YP42TI2iKvLvCfHdSzF2osqHK8nbev3IoNBrmtkc0nE2Z+oPlh7e94yn0xvTfW5qNtKT24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916560; c=relaxed/simple;
	bh=GkPuSGqhn36REhOUqjYoy+b4rtrgr9x4nHEr+AVYj9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zgf5gQZS4Gi8rR5axzICQM36w+Mfl9XmkuOV8xMjmd5AdvKIVDVXPAapVaGpa1OApfbGxWiOIG197kdZViKxJLWw/+CF4uQrDqUbbvUIcL5Gnvdf3CngdPxGm7jbgO1tJKjCi5viH+nEMCFOVhHyOQz+DoHyUaNhFTICZKLmPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHowvhEL; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b6d70df0851so459785066b.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761916557; x=1762521357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFOxiVss0HRKnpAlz3H4jzYjQoU8YpgzNxAJkbQGhsE=;
        b=kHowvhELGd4hzIWGygeGUfbGEyrf+cqh3VtJ+TAlOyJEq8eBSRHL5dUlhVhv3NknLL
         Cbl/i8n1FOSA6bRQN7QgG+8jDCMFkbhxYrmyU8NYP8lwlPX3yVG3TvKlJ5Hy7wt4kw3P
         FyLeLap0NfR17+GHGbPy1+qmihDq+T40S4pabAJRAOJxWwKxMzufxDwEeDDhInKQ/7RT
         vpjULKwmv9R5qDWfhouAs0EOyFoP4vucJbf/PVFdY13FTeEKpAjMvkiOSw4DkLA/6v3U
         hK5Is4WwYruNT4Fi4uGmkaD73KEdQwDNgoS3CTWNg0BmbyS8qROI4P3lssp9Xb5n60Ke
         ZboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761916557; x=1762521357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFOxiVss0HRKnpAlz3H4jzYjQoU8YpgzNxAJkbQGhsE=;
        b=HkEOJ/eg1SUvMPxXf50+4y2jwQaN6R1hn9o8af+FFRB8mm0iIaiD6MvuUUdy0dVqqX
         WrYpSx/gfKEpEjEsCHcw6sFivcl2l5I1OPgjt1z4zFkB6S0xJRx7be/Nqk8ZD8zR6Una
         tejLIsco7TeRY6V74bthXuJobE5SkEupL5BSbaBe0E+ohiCCUGTcp8DFT6WizIVXiYVz
         ApyJR5k5ZkvFCI4/kqfXzzXaYiYdoiwAvmf+j1hD7FFf8quang0DuP3LbUD+9gxvV+P7
         6szyFLXASGhbyBUNbosNcvUjsSdItVehU/dkn3sDGjG1tr17+aTrL6kts42B+D5NIIVV
         PwVw==
X-Forwarded-Encrypted: i=1; AJvYcCUVhpG3FBtMK+0KNR/EVvavptrk6l9B/UliZV7O0LyugGBkNk9kahU+bYPptU4Wm7s76dXSs+s7A6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOkkSdLMUI4uO3BuLnwVVOFTJA0DrCXWltDvieNPkizFlXv1aD
	VVEzClsO29GOWHZPsKk9+Qojq63FTMmpG9BDKeJ+nvrpWe7TRD4K3u5BbqFk9Sbm1BaQQKtNcNG
	q49HCur1NAPdUfe/5vf87/F2YvcuXsQ==
X-Gm-Gg: ASbGncvFMmqv0M+78kYR85Wc0T0WDWjl2MFAlM71Tbghe4S1VfjbN4D2GtCBVJCEcdl
	u6qFhJ2PDon6UDF216cidAxbTT1GPfjV2i2e5i+ScZ/wmKc0YrIJBf1nDS49L+0dmB5wYFTGegn
	uzpP/1KxXSbshEp3toEA6IIP3zZpvGK+e6MLwE5ONzQVfDNEUBhAchvLlCVwsdYGKtmWOMHacd1
	U971RTeLJvqV2kZK7dqkgDelJDmHGslFnRDBR46itwc6R70QenjL245VkCO
X-Google-Smtp-Source: AGHT+IFZfHfYqfEHl+L7rhL+k/guQjQ8ttdlPs8om4oqNdpHZfgfcBSrtjOXGWwoy8eYcc0DqlemA1nls3dFNgeDEiU=
X-Received: by 2002:a17:907:3f13:b0:b0e:d477:4972 with SMTP id
 a640c23a62f3a-b707019d264mr394593766b.25.1761916556937; Fri, 31 Oct 2025
 06:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh> <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com> <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com> <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
 <8fe27842-8155-44db-b262-a148b5ce5436@linux.intel.com> <CAAcb1K9MDvqJgVbV29ax8tQhXoepJr5ABuh1NHoNpmFdnGxVHw@mail.gmail.com>
 <65b65e02-e51e-4e7e-ae9e-78d755eb8566@linux.intel.com> <ba3692e7-6818-41af-8748-71a91cb13db5@linux.intel.com>
 <CAAcb1K9X+ZgigmiQ9btvV5vs+1UmxyZC39RCnS0tVZZUuYjToQ@mail.gmail.com>
 <9dc78bbb-b9db-4ab3-8cd9-bac40e0c8653@linux.intel.com> <CAAcb1K_piCRo07Jf3Bzd9tzH9HKxPFisPARGE6OZOhd55-NLyQ@mail.gmail.com>
In-Reply-To: <CAAcb1K_piCRo07Jf3Bzd9tzH9HKxPFisPARGE6OZOhd55-NLyQ@mail.gmail.com>
From: Milan Oravec <migo.oravec@gmail.com>
Date: Fri, 31 Oct 2025 14:15:44 +0100
X-Gm-Features: AWmQ_bmZVH1t8SCwCb_G-XiPZRpvdOwsbz4pi_v4yNohhD2BOQwt4u8mwrmiBn4
Message-ID: <CAAcb1K9QEzaDnTKZJ1AiZ18iLL50z91F6BOB=uj47ma2NLwM8g@mail.gmail.com>
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry but I can't provide better feedback. When the USB cable is
connected during initramfs loading DbC is connected, but the system
stops booting with no messages in the DbC host. When I let USB
connected prior to the boot, DbC is not initialized. What should I try
else? Any ideas? Thank you!

On Tue, Oct 28, 2025 at 7:10=E2=80=AFPM Milan Oravec <migo.oravec@gmail.com=
> wrote:
>
> Thank you, with earlyprintk=3Dkeep,xdbc2 it establishes connection, but
> I need to plug in the usb cable after the system starts booting, when
> I let it plugged in all the time I get timeout like in my previous
> posts.  Discovered this randomly by forgetting to plug in the usb
> cable... Is this normal behaviour?
>
> After establishing a connection system hangs :( it doesn't boot any
> further. I can only power the system off. :( Here is picture from
> debugging host:
>
> Any ideas? Thank you,
>
> Milan
>
> On Tue, Oct 28, 2025 at 6:19=E2=80=AFPM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
> >
> > On 10/28/25 15:29, Milan Oravec wrote:
> > > Hello Mathias, here is dmesg output after applying additional patch:
> > >
> > > [Ut okt 28 14:07:39 2025] Linux version 6.17.5-dirty (migo@migoG17)
> > > (gcc (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #59 SMP
> > > PREEMPT_DYNAMIC Tue Oct 28 11:54:08 CET
> > >   2025
> > > [Ut okt 28 14:07:39 2025] Command line: BOOT_IMAGE=3D/vmlinuz
> > > root=3DUUID=3D584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=3Dkeep=
,xdbc1
> >
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Failed to
> > > ioremap xhci-dbc with size 0x100000
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc
> > > ioremap with reduced size 0x80000
> > > [Ut okt 28 14:07:39 2025] ------------[ cut here ]------------
> > > [Ut okt 28 14:07:39 2025] WARNING: CPU: 0 PID: 0 at
> > ...> [Ut okt 28 14:07:39 2025] ---[ end trace 0000000000000000 ]---
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Failed to
> > > ioremap xhci-dbc with size 0x80000
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc
> > > ioremap with reduced size 0x40000
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Lookin=
g
> > > for DbC capability at offset 0x480
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Lookin=
g
> > > for DbC capability at offset 0x490
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Lookin=
g
> > > for DbC capability at offset 0x4a0
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Lookin=
g
> > > for DbC capability at offset 0x4c0
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Lookin=
g
> > > for DbC capability at offset 0x4e0
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: DbC
> > > capability found at offset 0x4e0
> > ...> [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: DCE successfu=
lly cleared
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully got
> > > xdbc table_dma page
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully got
> > > xdbc out_dma page
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully
> > > allocated event ring
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully
> > > allocated in ring
> > > [Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully
> > > allocated out ring
> > > [Ut okt 28 14:07:44 2025] xhci_dbc:xdbc_start: waiting for connection=
 timed out
> >
> > This is promising, looks like code successfully interacts with hardware=
.
> >
> > > [Ut okt 28 14:07:44 2025] xhci_dbc:xdbc_early_setup: Failed to start
> > > xdbc ret: -110
> > > [Ut okt 28 14:07:44 2025] xhci_dbc:early_xdbc_setup_hardware: failed
> > > to setup the connection to host
> > > [Ut okt 28 14:07:44 2025] Zone ranges:
> > > [Ut okt 28 14:07:44 2025]   DMA      [mem 0x0000000000001000-0x000000=
0000ffffff]
> > > [Ut okt 28 14:07:44 2025]   DMA32    [mem 0x0000000001000000-0x000000=
00ffffffff]
> > > [Ut okt 28 14:07:44 2025]   Normal   [mem 0x0000000100000000-0x000000=
085de7ffff]
> > > [Ut okt 28 14:07:44 2025]   Device   empty
> > > [Ut okt 28 14:07:44 2025] Movable zone start for each node
> > > [Ut okt 28 14:07:44 2025] Early memory node ranges
> > >
> > > I've tested cable afterwards:
> > >
> > > echo enable > /sys/devices/pci0000:00/0000:00:08.1/0000:09:00.4/dbc
> > >
> > > [Ut okt 28 14:12:28 2025] xhci_hcd 0000:09:00.4: DbC connected
> > > [Ut okt 28 14:12:29 2025] xhci_hcd 0000:09:00.4: DbC configured
> > >
> > > so cable is not the problem here...
> > >
> > > Thank you!
> >
> > your lspci listed four xHCI controllers:
> >
> > 07:00.0 USB controller: ASMedia Technology Inc. Device 242c (rev 01)
> >         (prog-if 30 [XHCI])
> >         Region 0: Memory at fc600000 (64-bit, non-prefetchable) [size=
=3D32K]
> >
> > 09:00.3 USB controller: Advanced Micro Devices, Inc. [AMD]
> >         Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
> >         Region 0: Memory at fc300000 (64-bit, non-prefetchable) [size=
=3D1M]
> >
> > 09:00.4 USB controller: Advanced Micro Devices, Inc. [AMD]
> >         Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
> >         Region 0: Memory at fc200000 (64-bit, non-prefetchable) [size=
=3D1M]
> >
> > 0a:00.0 USB controller: Advanced Micro Devices, Inc. [AMD]
> >          Raphael/Granite Ridge USB 2.0 xHCI (prog-if 30 [XHCI])
> >          Region 0: Memory at fca00000 (64-bit, non-prefetchable) [size=
=3D1M]
> >
> > Could it be that the cable is connected to xHCI at 09:00.4 while
> > earlyprintk=3Dkeep,xdbc1 refers to different xHCI? possibly the one at =
09:00.3?
> >
> > Does earlyprintk=3Dkeep,xdbc2 work? or trying a different usb port?
> >
> > Thanks
> > Mathias
> >
> >

