Return-Path: <linux-usb+bounces-29444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A658BEF811
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 08:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E07303A7A2B
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 06:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2692D8DBB;
	Mon, 20 Oct 2025 06:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAcJlhRW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706501F30A9
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 06:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760942633; cv=none; b=UEzKBupIc2DprtEVcmN3J8MAgeuWz9DScVi5zVYe2vi5PVVUgCPof/eOM7VJO7JLaWkrQXZbXJ8eOz4Ckz3YFBsy7Q+kkbKsga6xKU3WSeF3FDNsnmT2K+q2Nt2miGBXbsQODXocdVsPZmxuCIx8BIf0wOWd2pcgLqO0MW5f8tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760942633; c=relaxed/simple;
	bh=2k7HLnAjDVfMJvPh/RRA0KRtOQcsT4DZfUKZHaZ4u1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6EYUYsPOsSsYPHmuYwaF8ORbt228xFapUsqcdO878YVHomsvYtHMyHRa5tG2Bp7kVA+/VFunIwRNX1UHpWGGkxSQjGo6nI/og1FUqPJocc7FGrm2DBTUFgEN278lF7rurH9w/dr1QkLjgs/276oEzW+ue3QWVOWIEGp2kUzHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAcJlhRW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3dbf11fa9eso759891366b.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 23:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760942630; x=1761547430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WyLRKOr/0giWjrpHjhQlmRlfEhsBEY0F6Ly4XQ5V78=;
        b=SAcJlhRWkiUw2/pNcl+P2nX/bmUz2OgT7Hp+XfyAnAnuktceXO4HqTZxSfbfjzPyAv
         52tAxLAaZnIeXIX8vmeQlkGq8JlXD+39UE42ZRR3qw/EcNZ1qdJdeYaIjeLLyOSwkMxQ
         21XcxjqNGqY0NTOj5sLitR27wyfJ3loTV6CpoCaGlqDQLpXxHW0oKU+B+t5bccirIR2+
         KajykEDx+UZDp+SaEUYGctMtK8b6BhGsz4nH8xrskY3JyqZFx4aoLeXJcfN7UaQGm5mQ
         9Qc7igV6XGi6cy5SBHzu71RT8uPcSc540pUqiUpJ8jeAmJ1wxo0cARHSPIyDVt4nbJsD
         aWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760942630; x=1761547430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WyLRKOr/0giWjrpHjhQlmRlfEhsBEY0F6Ly4XQ5V78=;
        b=X4FUxlIPaiSrf2/dS8aEnxfXp8oZCHb1nWp8g/TdpWNtMljM3o2LrE85lJ8CDJT5xm
         qrHVLXgz/iD11PkV4cWmpEYMTcBfgOpYGubn9bZpp4Rod5T3tlleVrXD6goQE85IHxbl
         Bia1JIxcvEQZvbFx7ifGaqEIKCILz0zbURHRyHOtb3KSy7MvdwDc+6RNBWRLd/GDoOoZ
         Qp9vDQZBYoX4nx5K3H4mW9NQ8unZlfZx1N1yY2eSWA91KHlotReCphTnhn+tqUpI7Ibs
         vlcgtQiicTNc26WWg0DOadlDjUFERORrGe8952UjPgi1ryptV7D7LXRRffiePI0gTQtv
         jwWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCZMCtilDIFAmX6uJbjPuW5aDm0R37p4qC5l347OpoEdbRA8LCLUB3AgNS3NWtzpkJeVTnU3B7jBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHG77iqOn3DglE5EZHsL1K5zIl8JjyUJE1qcNc+PNDaggzmIq
	vJK7dQEgvh6ejjYjFUjl/9YGmeIEKJ11d6qhqAq6t8Df6aV0VogtvdVvsB7+CWnTYSxmjuqZ79s
	ozpdAXa0eHSJMq4NNsqpLAiRycIMz+g==
X-Gm-Gg: ASbGncsLheNAu4vpYqLsnvXdNuGfA9YaEjfR4nZwR5pf0iGQTUboNG4z6jIAa7Vwr7f
	T2nafVismQ/XKTqL7XfsyBNA6Ic+hFCUl5wQsk2y5/ryIb/IJ7VmdTQyWcvtHQKEbdMnPOhdhhu
	beNjE/N4UBnJz3iSud7ZQwwGCAhpm1y3Y6tk4IAcnsQ5pdPYA1ojn6MlovIWGaofXBnre+7gebj
	3VQrPAoRtARB0LNn1hebGNCsqEzxcOwasxosgV6Fae3alHx614+PuzCj74K53VcLfr79Zo=
X-Google-Smtp-Source: AGHT+IEBsfi1/1nfztgRJBlAsiE/F+uytJ4YZudmttC7JleG2N+3mHUW83et337DOqTIo438mBcaDeOGSvKknlAwYdY=
X-Received: by 2002:a17:907:7f0e:b0:b24:7806:b59 with SMTP id
 a640c23a62f3a-b6473f43c96mr1558408466b.55.1760942627571; Sun, 19 Oct 2025
 23:43:47 -0700 (PDT)
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
 <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com>
In-Reply-To: <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com>
From: Milan Oravec <migo.oravec@gmail.com>
Date: Mon, 20 Oct 2025 08:43:35 +0200
X-Gm-Features: AS18NWB0C2al7UPOoaQIrsFsdHezK1Wi0hMwO89pqTcHK9s4GANC0FcR_FiBueM
Message-ID: <CAAcb1K-o7DY3Kvqdr+=MN8OsgRZr+g43-zC6YSLG0hbNxEQUeg@mail.gmail.com>
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, is there any workaround for this to get DbC working for me?

On Thu, Oct 16, 2025 at 10:49=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 10/16/25 17:31, Milan Oravec wrote:
> > Hello Mathias
> >
> > On Thu, Oct 16, 2025 at 3:42=E2=80=AFPM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> >>
> >> On 10/15/25 22:11, Milan Oravec wrote:
> >>> Hello Greg,
> >>> thank you for looking into it.
> >>>
> >>> On Wed, Oct 15, 2025 at 11:13=E2=80=AFAM Greg KH <gregkh@linuxfoundat=
ion.org> wrote:
> >>>>
> >>>> On Wed, Oct 15, 2025 at 09:43:02AM +0200, Milan Oravec wrote:
> >>>>> Hello, I'm trying to debug some hibernation related problems on my
> >>>>> system, and need a USB DBC to see what is going on after screen off=
.
> >>>>> I've connected USB debugging cable and got this error:
> >>>> [St okt 15 20:57:24 2025] Linux version 6.17.3 (migo@migoG17) (gcc
> >>> (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #55 SMP
> >>> PREEMPT_DYNAMIC Wed Oct 15 19:24:41 CEST 2025
> >>> [St okt 15 20:57:24 2025] Command line: BOOT_IMAGE=3D/vmlinuz
> >>> root=3DUUID=3D584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=3Dkeep=
,xdbc1
> >>> debug ignore_loglevel sysrq_always_enabled
> >>> force_early_printk sched_verbose ft usbcore.autosuspend=3D-1
> >>> no_console_suspend hib_compression=3Dlz4
> >>> resume=3DUUID=3D54ed98b5-56c0-4ab9-95ea-da1a9322ce49
> >>> [St okt 15 20:57:24 2025] BIOS-provided physical RAM map:
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x0000000000000000-0x000000000009ffff] usable
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x00000000000a0000-0x00000000000fffff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x0000000000100000-0x0000000009afefff] usable
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x0000000009aff000-0x0000000009ffffff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000000a000000-0x000000000a1fffff] usable
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000000a200000-0x000000000a211fff] ACPI NVS
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000000a212000-0x000000008e43dfff] usable
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000008e43e000-0x000000009443dfff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000009443e000-0x000000009453dfff] ACPI data
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000009453e000-0x000000009653dfff] ACPI NVS
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000009653e000-0x000000009a5fefff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000009a5ff000-0x000000009bffafff] usable
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000009bffb000-0x000000009cffffff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000009d7f3000-0x000000009fffffff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x00000000f0000000-0x00000000f7ffffff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x00000000fd000000-0x00000000ffffffff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x0000000100000000-0x0000000837ffffff] usable
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x0000000838000000-0x0000000857ffffff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x0000000858000000-0x000000085de7ffff] usable
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000085eec0000-0x00000008801fffff] reserved
> >>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
> >>> 0x000000fd00000000-0x000000ffffffffff] reserved
> >>> [St okt 15 20:57:24 2025] xhci_dbc:early_xdbc_parse_parameter: dbgp_n=
um: 1
> >>> [St okt 15 20:57:24 2025] ------------[ cut here ]------------
> >>> [St okt 15 20:57:24 2025] WARNING: CPU: 0 PID: 0 at
> >>> mm/early_ioremap.c:139 __early_ioremap+0xae/0x190
> >>
> >> This WARN in __early_ioremap() is triggered when the size is too large
> >>
> >>          /*
> >>           * Mappings have to fit in the FIX_BTMAP area.
> >>           */
> >>          nrpages =3D size >> PAGE_SHIFT;
> >>          if (WARN_ON(nrpages > NR_FIX_BTMAPS))
> >>                  return NULL;
> >>
> >> The size is in this case read from the PCI config space of the second =
xHCI PCI
> >> controller.
> >>
> >> Maybe the controller returns odd BAR Address0 size, or we parse it inc=
orrectly.
> >>
> >> what does "lspci -vv -d ::0c03:30" show?
> >
> > Here is requested output:
> >
> > root@migoG17:/home/migo# lspci -vv -d ::0c03:30
> > 07:00.0 USB controller: ASMedia Technology Inc. Device 242c (rev 01)
> > (prog-if 30 [XHCI])
> >          Subsystem: ASUSTeK Computer Inc. Device 20af
> >          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> > ParErr- Stepping- SERR- FastB2B- DisINTx+
> >          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbor=
t-
> > <TAbort- <MAbort- >SERR- <PERR- INTx-
> >          Latency: 0, Cache Line Size: 64 bytes
> >          Interrupt: pin A routed to IRQ 25
> >          IOMMU group: 20
> >          Region 0: Memory at fc600000 (64-bit, non-prefetchable) [size=
=3D32K]
>
> The first xHCI reports size=3D32K
>
> >
> > 09:00.3 USB controller: Advanced Micro Devices, Inc. [AMD]
> > Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
> >          Subsystem: ASUSTeK Computer Inc. Device 20af
> >          Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> > ParErr- Stepping- SERR- FastB2B- DisINTx+
> >          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbor=
t-
> > <TAbort- <MAbort- >SERR- <PERR- INTx-
> >          Latency: 0, Cache Line Size: 64 bytes
> >          Interrupt: pin D routed to IRQ 48
> >          IOMMU group: 24
> >          Region 0: Memory at fc300000 (64-bit, non-prefetchable) [size=
=3D1M]
> And the second xHCI has size 1M
>
> Best guess is that early_ioremap() doesn't support this large size.
>
> -Mathias
>
>
>
>
>
>

