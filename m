Return-Path: <linux-usb+bounces-29351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B3BE0520
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 21:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B61F427962
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 19:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54122302750;
	Wed, 15 Oct 2025 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ec3i48xS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A324E016
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 19:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760555503; cv=none; b=M5TdOwlECTDEtBG0h5dY4WlAY3EvoaT8cR0HPhA1/Kc97SYa8Rs8gcuYtunnGD3ry6+lD4wwx4/DmbwEWOm0E1JnEtKKcq3TscNYORJRJ5Z0dnnJKlrFj5BMkIw4AZjU0b57J0vqqJPHQjkhYLNe8WbHsnbbHCba2+psja013qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760555503; c=relaxed/simple;
	bh=bGS9dczZMJybQ1gFzLJ5UimEIATZTnsS134NIVD3Nk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gp5xQE9y1pKE5BHLFroPH3VqDUgUuRY//u6PEqZq6yJN27mQ+va8fNQzJii8kZppNNrckB5hlMaVQHPSG2ofEPxwuutZ89beaZrgJHKGEjjg8YlP4i032P6mgrYwFTKWPHxw+dFTuXGQs39Ztk7UJU7PTSAR1JkUIg8Rl845ucU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ec3i48xS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3ee18913c0so1136745466b.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 12:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760555500; x=1761160300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMdpCI+VJ8/7kxjqIOD2GTKlgW8klbSAbkD2wU3VuG4=;
        b=ec3i48xSTN86JjG0R4Oa4RjFyL/pMioi0QRcBmc/GRGS25/tK6Z6FCH1baLw6Xql4U
         1V2EpbVuv8wDiTMAMqtylD86lwW+U75Rl9KBYlErIjujkR2IeUo/9Oux5FgS/+MUI/Ol
         XJ/WrOo1RVFzjn1T6F2VHUUgx1F4oSdCJ+7ZzpSeBKW0e0aJagniKkGkA+5KKcrYjBtV
         LzAfn/bbsGzavjGqH3q9bkj+fmUjrWrAdjqRfoL6Dm+0uH6BXpRO/Rp0FOX0/KtS3qES
         XYiR2NMijqizHR/tkxoA2787YimmAxiHoNobfat2z6sjwAFpKA8OevLYJkNdvWQecReF
         RsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760555500; x=1761160300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMdpCI+VJ8/7kxjqIOD2GTKlgW8klbSAbkD2wU3VuG4=;
        b=c6YIG1VCBVuZxn6hoUdEDWs2B+DzY5o8EntrhC2aJtrdiZUFmqdJbRoX62le1FNb4k
         GGAz+QfmvmORrMgOfeqbi3zTn0ay7bzNyfkr3/qxLsLAJTRq0dXs3HCZIfOGxmCKBGk4
         DH8+WRaBp02X900yORXSnWNojB+lqK0UMT9CVK/QY/W5kMHLT3pXb3WbNBVzVy2VPD8t
         HYCgKh8I7btdrqtcPzy8rGPkxsbg2WGYyqepQ4J2aiN9f5SWjzL2/sh+TraRuETNAaei
         tdV0/Mviu1O8L6mjfQ5NoKfe11bGMYzLP/o3N+VWy06UsyOKo1HyIgeA8uWnVzL+OcI7
         i2wg==
X-Gm-Message-State: AOJu0Ywmqs9eGxA1qQCf1PkGZDVupRS+wKONbc9iTHEgD77Tbb+PqvBc
	2lBcArdWV02xUffi3YCw8GA4bPLMopvYKFVq6bd6aO2LkZ+z6r+NEotpW1pkNgZ5cjskcgxHdxL
	qBcK3t/hVEzmVRV7FFbW7Q0qgL00r4vnDKT4=
X-Gm-Gg: ASbGncsmjF+9zTYPPA1asutWEQ5kKkW6YkGafLBz3UWJEbPoraNJP8ssx1eUKarQPVl
	qGir/L2/PAtcmPsiubc9C76mhc9zscjv3DPl56ZxXkorBKolsySsAGs5CAtCEFcCaEuBiJLBBxt
	zNo/ENhTSspGo5U4oNNiJi28v7G/+bvQcx/FWfyQsPJWIygKN0RTMbu1V4nBYXMJGSW43E2DH/A
	aF2R1jgybK24V/Ko1Kn0/6iIg==
X-Google-Smtp-Source: AGHT+IFWqwQjYYM8l4FgY5mn301H9aOIHZBdLRJvRYmVWWJS5gzza4cDhL0R7CaNpr0v5lkBcueJjWnoXUddayvDZew=
X-Received: by 2002:a17:907:3daa:b0:b45:60ad:daf9 with SMTP id
 a640c23a62f3a-b50a9a6cb4fmr3408125166b.3.1760555499766; Wed, 15 Oct 2025
 12:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com> <2025101544-galore-sculpture-b243@gregkh>
In-Reply-To: <2025101544-galore-sculpture-b243@gregkh>
From: Milan Oravec <migo.oravec@gmail.com>
Date: Wed, 15 Oct 2025 21:11:28 +0200
X-Gm-Features: AS18NWDSpDa188ZggBFA2OZVxB6w_v_e2PIvi5XCh9nFFSK8Y_NMGWaI7o1U88Q
Message-ID: <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Greg,
thank you for looking into it.

On Wed, Oct 15, 2025 at 11:13=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Wed, Oct 15, 2025 at 09:43:02AM +0200, Milan Oravec wrote:
> > Hello, I'm trying to debug some hibernation related problems on my
> > system, and need a USB DBC to see what is going on after screen off.
> > I've connected USB debugging cable and got this error:
> >
> > [    0.000000] Linux version 6.17.2 (migo@migoG17) (gcc (GCC) 15.2.1
> > 20250813, GNU ld (GNU Binutils) 2.45.0) #54 SMP PREEMPT_DYNAMIC Sun
> > Oct 12 19:07:00 CEST 2025
> > [    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz
> > root=3DUUID=3D584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=3Dxdbc1,=
keep
> > debug ignore_loglevel sysrq_always_enabled force_early
> > _printk sched_verbose ft usbcore.autosuspend=3D-1 no_console_suspend
> > hib_compression=3Dlz4 resume=3DUUID=3D54ed98b5-56c0-4ab9-95ea-da1a9322c=
e49
> > [    0.000000] BIOS-provided physical RAM map:
> > [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009afefff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x0000000009aff000-0x0000000009ffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a211fff] A=
CPI NVS
> > [    0.000000] BIOS-e820: [mem 0x000000000a212000-0x000000008e43dfff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x000000008e43e000-0x000000009443dfff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x000000009443e000-0x000000009453dfff] A=
CPI data
> > [    0.000000] BIOS-e820: [mem 0x000000009453e000-0x000000009653dfff] A=
CPI NVS
> > [    0.000000] BIOS-e820: [mem 0x000000009653e000-0x000000009a5fefff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x000000009a5ff000-0x000000009bffafff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x000000009bffb000-0x000000009cffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x000000009d7f3000-0x000000009fffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000ffffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000837ffffff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x0000000838000000-0x0000000857ffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x0000000858000000-0x000000085de7ffff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x000000085eec0000-0x00000008801fffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] r=
eserved
> > [    0.000000] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 1
>
> What is the exact command line that you are passing into the xdbc
> driver?  That seems to be crashing the parsing logic here.
>
> Ah, I see it above, sorry, it is "xdbc1,keep", right?

Right

>
> Do you really have 2 different xhci debug controllers in the system?
> You are asking to connect to the second one, what happens if you change
> it to just "xdbc,keep"?

IDK if there are two debug controllers (doubt it), but this was the
only way to get DBC registered, xdbc alone does not detect any
connection:

okt 15 20:55:10 migoG17 kernel: Linux version 6.17.3 (migo@migoG17)
(gcc (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #55 SMP
PREEMPT_DYNAMIC Wed Oct 15 19:24:41 CES
T 2025
okt 15 20:55:10 migoG17 kernel: Command line: BOOT_IMAGE=3D/vmlinuz
root=3DUUID=3D584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=3Dxdbc,keep
debug ignore_loglevel sysrq_always_ena
bled force_early_printk sched_verbose ft usbcore.autosuspend=3D-1
no_console_suspend hib_compression=3Dlz4
resume=3DUUID=3D54ed98b5-56c0-4ab9-95ea-da1a9322ce49
okt 15 20:55:10 migoG17 kernel: BIOS-provided physical RAM map:
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x0000000000000000-0x000000000009ffff] usable
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x00000000000a0000-0x00000000000fffff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x0000000000100000-0x0000000009afefff] usable
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x0000000009aff000-0x0000000009ffffff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000000a000000-0x000000000a1fffff] usable
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000000a200000-0x000000000a211fff] ACPI NVS
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000000a212000-0x000000008e43dfff] usable
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000008e43e000-0x000000009443dfff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000009443e000-0x000000009453dfff] ACPI data
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000009453e000-0x000000009653dfff] ACPI NVS
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000009653e000-0x000000009a5fefff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000009a5ff000-0x000000009bffafff] usable
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000009bffb000-0x000000009cffffff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000009d7f3000-0x000000009fffffff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x00000000f0000000-0x00000000f7ffffff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x00000000fd000000-0x00000000ffffffff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x0000000100000000-0x0000000837ffffff] usable
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x0000000838000000-0x0000000857ffffff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x0000000858000000-0x000000085de7ffff] usable
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000085eec0000-0x00000008801fffff] reserved
okt 15 20:55:10 migoG17 kernel: BIOS-e820: [mem
0x000000fd00000000-0x000000ffffffffff] reserved
okt 15 20:55:10 migoG17 kernel: xhci_dbc:early_xdbc_parse_parameter: dbgp_n=
um: 0

>
> Also, how about switching them around:
>         "keep,xdbc"
> ?
> In looking at the code, i think order matters.
>

no luck:

[St okt 15 21:07:12 2025] Linux version 6.17.3 (migo@migoG17) (gcc
(GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #55 SMP
PREEMPT_DYNAMIC Wed Oct 15 19:24:41 CEST 2025
[St okt 15 21:07:12 2025] Command line: BOOT_IMAGE=3D/vmlinuz
root=3DUUID=3D584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=3Dkeep,xdbc
debug ignore_loglevel sysrq_always_enabled f
orce_early_printk sched_verbose ft usbcore.autosuspend=3D-1
no_console_suspend hib_compression=3Dlz4
resume=3DUUID=3D54ed98b5-56c0-4ab9-95ea-da1a9322ce49
[St okt 15 21:07:12 2025] BIOS-provided physical RAM map:
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x0000000000000000-0x000000000009ffff] usable
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x00000000000a0000-0x00000000000fffff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x0000000000100000-0x0000000009afefff] usable
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x0000000009aff000-0x0000000009ffffff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000000a000000-0x000000000a1fffff] usable
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000000a200000-0x000000000a211fff] ACPI NVS
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000000a212000-0x000000008e43dfff] usable
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000008e43e000-0x000000009443dfff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000009443e000-0x000000009453dfff] ACPI data
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000009453e000-0x000000009653dfff] ACPI NVS
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000009653e000-0x000000009a5fefff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000009a5ff000-0x000000009bffafff] usable
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000009bffb000-0x000000009cffffff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000009d7f3000-0x000000009fffffff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x00000000f0000000-0x00000000f7ffffff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x00000000fd000000-0x00000000ffffffff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x0000000100000000-0x0000000837ffffff] usable
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x0000000838000000-0x0000000857ffffff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x0000000858000000-0x000000085de7ffff] usable
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000085eec0000-0x00000008801fffff] reserved
[St okt 15 21:07:12 2025] BIOS-e820: [mem
0x000000fd00000000-0x000000ffffffffff] reserved
[St okt 15 21:07:12 2025] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0

neither:

[St okt 15 20:57:24 2025] Linux version 6.17.3 (migo@migoG17) (gcc
(GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #55 SMP
PREEMPT_DYNAMIC Wed Oct 15 19:24:41 CEST 2025
[St okt 15 20:57:24 2025] Command line: BOOT_IMAGE=3D/vmlinuz
root=3DUUID=3D584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=3Dkeep,xdbc1
debug ignore_loglevel sysrq_always_enabled
force_early_printk sched_verbose ft usbcore.autosuspend=3D-1
no_console_suspend hib_compression=3Dlz4
resume=3DUUID=3D54ed98b5-56c0-4ab9-95ea-da1a9322ce49
[St okt 15 20:57:24 2025] BIOS-provided physical RAM map:
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x0000000000000000-0x000000000009ffff] usable
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x00000000000a0000-0x00000000000fffff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x0000000000100000-0x0000000009afefff] usable
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x0000000009aff000-0x0000000009ffffff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000000a000000-0x000000000a1fffff] usable
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000000a200000-0x000000000a211fff] ACPI NVS
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000000a212000-0x000000008e43dfff] usable
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000008e43e000-0x000000009443dfff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000009443e000-0x000000009453dfff] ACPI data
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000009453e000-0x000000009653dfff] ACPI NVS
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000009653e000-0x000000009a5fefff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000009a5ff000-0x000000009bffafff] usable
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000009bffb000-0x000000009cffffff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000009d7f3000-0x000000009fffffff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x00000000f0000000-0x00000000f7ffffff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x00000000fd000000-0x00000000ffffffff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x0000000100000000-0x0000000837ffffff] usable
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x0000000838000000-0x0000000857ffffff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x0000000858000000-0x000000085de7ffff] usable
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000085eec0000-0x00000008801fffff] reserved
[St okt 15 20:57:24 2025] BIOS-e820: [mem
0x000000fd00000000-0x000000ffffffffff] reserved
[St okt 15 20:57:24 2025] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 1
[St okt 15 20:57:24 2025] ------------[ cut here ]------------
[St okt 15 20:57:24 2025] WARNING: CPU: 0 PID: 0 at
mm/early_ioremap.c:139 __early_ioremap+0xae/0x190
[St okt 15 20:57:24 2025] Modules linked in:
[St okt 15 20:57:24 2025] CPU: 0 UID: 0 PID: 0 Comm: swapper Not
tainted 6.17.3 #55 PREEMPT(undef)
501a37b6ad520b28774b9873acfc48864a80a689
[St okt 15 20:57:24 2025] RIP: 0010:__early_ioremap+0xae/0x190
[St okt 15 20:57:24 2025] Code: 00 3b 38 b1 4c 89 ca 48 81 e3 00 f0 ff
ff 48 81 e2 00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89
d5 83 fa 40 76 04 <0f> 0b eb a2 6
b c0 c0 4d 89 ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
[St okt 15 20:57:24 2025] RSP: 0000:ffffffffb0a03cb8 EFLAGS: 00010006
ORIG_RAX: 0000000000000000
[St okt 15 20:57:24 2025] RAX: 0000000000000000 RBX: 0000000000100000
RCX: 0000000000100000
[St okt 15 20:57:24 2025] RDX: 0000000000000100 RSI: 0000000000100000
RDI: 00000000fc300000
[St okt 15 20:57:24 2025] RBP: 0000000000000100 R08: 0000000000000000
R09: 00000000fc300000
[St okt 15 20:57:24 2025] R10: ffffffffb0a79660 R11: ffffffffb0a03ad0
R12: 8000000000000163
[St okt 15 20:57:24 2025] R13: 0000000000000000 R14: 0000000000000000
R15: 00000000fc300000
[St okt 15 20:57:24 2025] FS:  0000000000000000(0000)
GS:0000000000000000(0000) knlGS:0000000000000000
[St okt 15 20:57:24 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[St okt 15 20:57:24 2025] CR2: ffff888000000413 CR3: 00000003c7e8a000
CR4: 00000000000000b0
[St okt 15 20:57:24 2025] Call Trace:
[St okt 15 20:57:24 2025]  <TASK>
[St okt 15 20:57:24 2025]  ? early_xdbc_parse_parameter+0x32b/0x360
[St okt 15 20:57:24 2025]  ? setup_early_printk+0x51b/0x540
[St okt 15 20:57:24 2025]  ? do_early_param+0x41/0x70
[St okt 15 20:57:24 2025]  ? parse_args+0x210/0x3e0
[St okt 15 20:57:24 2025]  ? __pfx_do_early_param+0x10/0x10
[St okt 15 20:57:24 2025]  ? parse_early_options+0x29/0x30
[St okt 15 20:57:24 2025]  ? __pfx_do_early_param+0x10/0x10
[St okt 15 20:57:24 2025]  ? parse_early_param+0x64/0xc0
[St okt 15 20:57:24 2025]  ? setup_arch+0x4c4/0xb40
[St okt 15 20:57:24 2025]  ? _printk+0x6b/0x90
[St okt 15 20:57:24 2025]  ? start_kernel+0x6b/0x9b0
[St okt 15 20:57:24 2025]  ? x86_64_start_reservations+0x24/0x30
[St okt 15 20:57:24 2025]  ? x86_64_start_kernel+0xd3/0xe0
[St okt 15 20:57:24 2025]  ? common_startup_64+0x13e/0x141
[St okt 15 20:57:24 2025]  </TASK>
[St okt 15 20:57:24 2025] ---[ end trace 0000000000000000 ]---

> thanks,
>
> greg k-h

Thanks,
Milan

