Return-Path: <linux-usb+bounces-29376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14FBE3EB1
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 16:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C2F2504717
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 14:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08BE32863A;
	Thu, 16 Oct 2025 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sw0Rukdt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE2306B33
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625096; cv=none; b=qUR4k0Wvert8ulFKSG2kp11e3Rbyqtb395DNNkpbidh2mQyrV4sey14TFi4pkAjt8GIM4d1XqiSM69zQqruHGd9uZGpYPf7lI2hYnA1T2GtjiuAjFhMJmmVywIWGs4l0bCrSxb83sMYjE6BytmmkXsQ1BOnkK8ViRw6bfzRNF2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625096; c=relaxed/simple;
	bh=lvv/q6f1GEV+LErpc4c4IG2SgBPFN1MBxDkUmkxyNp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxeSYyQSuh79Pe7lcXNxbSdoy38bq0lss1obYaXx/BlrGHxhbNSjvbdoxJcKq0BxbgJOcAG4daGdhHZG4HPHWFRfuOc60CURicoK1hldAzOyG5duGt+YnCeWDycOb9YVn98ckRY4b2LNR9WpoqU62WVHQMQx4qg/8jk2n3ngFLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sw0Rukdt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso1514140a12.0
        for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760625092; x=1761229892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V1kLmLPNSPS6OkDuCkt8UFV4ChXzHxX4sNdTY920Lk=;
        b=Sw0RukdtWxsDKOgGNtuLa4PDq1o5bom2d8FQKUW6FHIpTK4Ei+9hYdjsrkG9goH0xX
         l5UJbl/UIrqiIO4rBx6utvqdiexBlff1+jCbxDXJp8YbemahnafU4DbiPA5MiCrDsrZg
         MJcH7SdedxgJb47+LVVdDIE77WTByfj+Jb72u4DUTvO0wpU4LUPt3wfr+YqqDV69lvu4
         NGXMYb70KjAiiXiy4zdbdLvNnYEyqYq14AFMmXEBI5amvUYVG+1m3fmzD04mz4BJk322
         o789DiDd+vEg75+HUvy6AnTW0ugfc+MwOH73PlUdwejtNb8nU5aP/gIen5ULtaAh2K92
         8GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760625092; x=1761229892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V1kLmLPNSPS6OkDuCkt8UFV4ChXzHxX4sNdTY920Lk=;
        b=RT6sBmLfAiDqFrn1lgsVJt2ApEb0aFD7AUPD3aBeIlV2DZtmX2acty3EcnSo5stVHA
         iCAad43GNGJlGtKSlUVfkaMDQPJlV/gcarPE1z8CiR+P1t0lp+OBTMb19ymICfQGIfbE
         V2HD+K/VbHNebpflV+6Wwg5xJZyBeasd0dc/K0D+K1RtSXLz3msOjW9ZOgmRkvk1BeEZ
         j5UOUsMQAD77mckQMzb/DHknvpSnjGdy9YDCsaR2xnAVoj/P0nreDb99+N6ePnfEXJZl
         epz7xy35x3WvgLfxoBqhPNO+wz6BmEBmU0FUC0y/IRCyfmJGQpOeGNW25Ia1knKxm5Az
         TqYg==
X-Forwarded-Encrypted: i=1; AJvYcCUELKSi4BEt3g/Q3SH2nl2iRnQ7XGJRMSNRq/zxUmwrJXINk+LZ4R9VBuvr3d0s3dwSubEH/QuoXBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwXtRbE8lprx1QX6JCIMaJekHk1lROEYwNhuLjIwfMjFTdrIgl
	HNXsqdkompoaOuyHF47Lhjehc8Mhj0VgBzBf1Jb+3/bATh06XDP6fPuJH6pFMZihAhUvB6Jnwrt
	JRi9WUmnB92nSA7MLmM7+WYT2kRZ/QA==
X-Gm-Gg: ASbGncs/WFiG9V/quXSQ6dKKVFXNcPcWk8mMFqCou3hlM2LXZTtiBdzMieo2YXjjGn8
	hgc+SmQk3BeaILdEyNqlSIUOfz731gNH7HEq1EF3FmNk5aBS1XFcJKL5EWdLX8eV0r4AtQs5Q8L
	nuMegzdVIIy2jlF5lkwcpLDdNXwKPa16beUMdnB8G8nFe28ksbXR6/4i/VXfgYeJ5lteJ13snrI
	mCheeV/UQiMxNgWPV8c+u36DJApz8vQUGVExQGj6oMLs+91DTeG9n/vZbsi
X-Google-Smtp-Source: AGHT+IEvBm2gREFYCspUhNXnTOyppv66TmYCPuqMBSs/sy9/OLrFTRYpLCHkasxDmXpTfOXPnuI/X2ZUtGqHF49eWoM=
X-Received: by 2002:a17:907:2686:b0:b41:873d:e218 with SMTP id
 a640c23a62f3a-b64730451abmr15679066b.14.1760625090018; Thu, 16 Oct 2025
 07:31:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh> <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com>
In-Reply-To: <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com>
From: Milan Oravec <migo.oravec@gmail.com>
Date: Thu, 16 Oct 2025 16:31:16 +0200
X-Gm-Features: AS18NWBWSntQNeUkEDrRxTZVq9Kz3NOETdmbxVhXokeioasZri8jhFDWDLmtuvg
Message-ID: <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mathias

On Thu, Oct 16, 2025 at 3:42=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 10/15/25 22:11, Milan Oravec wrote:
> > Hello Greg,
> > thank you for looking into it.
> >
> > On Wed, Oct 15, 2025 at 11:13=E2=80=AFAM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> >>
> >> On Wed, Oct 15, 2025 at 09:43:02AM +0200, Milan Oravec wrote:
> >>> Hello, I'm trying to debug some hibernation related problems on my
> >>> system, and need a USB DBC to see what is going on after screen off.
> >>> I've connected USB debugging cable and got this error:
> > > [St okt 15 20:57:24 2025] Linux version 6.17.3 (migo@migoG17) (gcc
> > (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #55 SMP
> > PREEMPT_DYNAMIC Wed Oct 15 19:24:41 CEST 2025
> > [St okt 15 20:57:24 2025] Command line: BOOT_IMAGE=3D/vmlinuz
> > root=3DUUID=3D584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=3Dkeep,x=
dbc1
> > debug ignore_loglevel sysrq_always_enabled
> > force_early_printk sched_verbose ft usbcore.autosuspend=3D-1
> > no_console_suspend hib_compression=3Dlz4
> > resume=3DUUID=3D54ed98b5-56c0-4ab9-95ea-da1a9322ce49
> > [St okt 15 20:57:24 2025] BIOS-provided physical RAM map:
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x0000000000000000-0x000000000009ffff] usable
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x00000000000a0000-0x00000000000fffff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x0000000000100000-0x0000000009afefff] usable
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x0000000009aff000-0x0000000009ffffff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000000a000000-0x000000000a1fffff] usable
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000000a200000-0x000000000a211fff] ACPI NVS
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000000a212000-0x000000008e43dfff] usable
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000008e43e000-0x000000009443dfff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000009443e000-0x000000009453dfff] ACPI data
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000009453e000-0x000000009653dfff] ACPI NVS
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000009653e000-0x000000009a5fefff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000009a5ff000-0x000000009bffafff] usable
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000009bffb000-0x000000009cffffff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000009d7f3000-0x000000009fffffff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x00000000f0000000-0x00000000f7ffffff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x00000000fd000000-0x00000000ffffffff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x0000000100000000-0x0000000837ffffff] usable
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x0000000838000000-0x0000000857ffffff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x0000000858000000-0x000000085de7ffff] usable
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000085eec0000-0x00000008801fffff] reserved
> > [St okt 15 20:57:24 2025] BIOS-e820: [mem
> > 0x000000fd00000000-0x000000ffffffffff] reserved
> > [St okt 15 20:57:24 2025] xhci_dbc:early_xdbc_parse_parameter: dbgp_num=
: 1
> > [St okt 15 20:57:24 2025] ------------[ cut here ]------------
> > [St okt 15 20:57:24 2025] WARNING: CPU: 0 PID: 0 at
> > mm/early_ioremap.c:139 __early_ioremap+0xae/0x190
>
> This WARN in __early_ioremap() is triggered when the size is too large
>
>         /*
>          * Mappings have to fit in the FIX_BTMAP area.
>          */
>         nrpages =3D size >> PAGE_SHIFT;
>         if (WARN_ON(nrpages > NR_FIX_BTMAPS))
>                 return NULL;
>
> The size is in this case read from the PCI config space of the second xHC=
I PCI
> controller.
>
> Maybe the controller returns odd BAR Address0 size, or we parse it incorr=
ectly.
>
> what does "lspci -vv -d ::0c03:30" show?

Here is requested output:

root@migoG17:/home/migo# lspci -vv -d ::0c03:30
07:00.0 USB controller: ASMedia Technology Inc. Device 242c (rev 01)
(prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device 20af
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 25
        IOMMU group: 20
        Region 0: Memory at fc600000 (64-bit, non-prefetchable) [size=3D32K=
]
        Capabilities: [50] MSI: Enable- Count=3D1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [68] MSI-X: Enable+ Count=3D8 Masked-
                Vector table: BAR=3D0 offset=3D00002000
                PBA: BAR=3D0 offset=3D00002080
        Capabilities: [78] Power Management version 3
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D55mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [80] Express (v2) Legacy Endpoint, IntMsgNum 0
                DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s
<64ns, L1 unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- TEE=
-IO-
                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 512 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr- TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <4us, L1 <64us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
FltModeDis-
                LnkSta: Speed 2.5GT/s, Width x1
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported,
TimeoutDis- NROPrPrP- LTR+
                         10BitTagComp+ 10BitTagReq- OBFF Not
Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                         AtomicOpsCtl: ReqEn-
                         IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink-
Retimer+ 2Retimers+ DRS-
                LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- Speed=
Dis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance Preset/De-emphasis: -6dB
de-emphasis, 0dB preshoot
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, Flt=
Mode-
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr-
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
UnxCmplt- RxOF+ MalfTLP+
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr- CorrIntErr- HeaderOF-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+ CorrIntErr+ HeaderOF+
                AERCap: First Error Pointer: 00, ECRCGenCap-
ECRCGenEn- ECRCChkCap- ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [160 v1] Latency Tolerance Reporting
                Max snoop latency: 1048576ns
                Max no snoop latency: 1048576ns
        Capabilities: [178 v1] Device Serial Number 45-1e-ca-ff-ff-51-77-a0
        Kernel driver in use: xhci_hcd

09:00.3 USB controller: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device 20af
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin D routed to IRQ 48
        IOMMU group: 24
        Region 0: Memory at fc300000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
<4us, L1 unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+
FLReset- SlotPowerLimit 0W TEE-IO-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr- TransPend-
                LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1,
Exit Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
FltModeDis-
                LnkSta: Speed 16GT/s, Width x16
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
NROPrPrP- LTR-
                         10BitTagComp+ 10BitTagReq- OBFF Not
Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS- TPHComp- ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                         AtomicOpsCtl: ReqEn-
                         IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, Flt=
Mode-
        Capabilities: [a0] MSI: Enable- Count=3D1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [c0] MSI-X: Enable+ Count=3D8 Masked-
                Vector table: BAR=3D0 offset=3D000fe000
                PBA: BAR=3D0 offset=3D000ff000
        Capabilities: [100 v1] Vendor Specific Information: ID=3D0001
Rev=3D1 Len=3D010 <?>
        Capabilities: [2a0 v1] Access Control Services
                ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
UpstreamFwd- EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
UpstreamFwd- EgressCtrl- DirectTrans-
        Kernel driver in use: xhci_hcd

09:00.4 USB controller: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device 20af
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 57
        IOMMU group: 25
        Region 0: Memory at fc200000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
<4us, L1 unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+
FLReset- SlotPowerLimit 0W TEE-IO-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr- TransPend-
                LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1,
Exit Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
FltModeDis-
                LnkSta: Speed 16GT/s, Width x16
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
NROPrPrP- LTR-
                         10BitTagComp+ 10BitTagReq- OBFF Not
Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS- TPHComp- ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                         AtomicOpsCtl: ReqEn-
                         IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, Flt=
Mode-
        Capabilities: [a0] MSI: Enable- Count=3D1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [c0] MSI-X: Enable+ Count=3D8 Masked-
                Vector table: BAR=3D0 offset=3D000fe000
                PBA: BAR=3D0 offset=3D000ff000
        Capabilities: [100 v1] Vendor Specific Information: ID=3D0001
Rev=3D1 Len=3D010 <?>
        Capabilities: [2a0 v1] Access Control Services
                ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
UpstreamFwd- EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
UpstreamFwd- EgressCtrl- DirectTrans-
        Kernel driver in use: xhci_hcd

0a:00.0 USB controller: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 2.0 xHCI (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device 20af
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 24
        IOMMU group: 28
        Region 0: Memory at fca00000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
<4us, L1 unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+
FLReset- SlotPowerLimit 0W TEE-IO-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr- TransPend-
                LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1,
Exit Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
FltModeDis-
                LnkSta: Speed 16GT/s, Width x16
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
NROPrPrP- LTR-
                         10BitTagComp+ 10BitTagReq- OBFF Not
Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS- TPHComp- ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                         AtomicOpsCtl: ReqEn-
                         IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink-
Retimer+ 2Retimers+ DRS-
                LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedD=
is-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance Preset/De-emphasis: -6dB
de-emphasis, 0dB preshoot
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
                         EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported, Flt=
Mode-
        Capabilities: [a0] MSI: Enable- Count=3D1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [c0] MSI-X: Enable+ Count=3D8 Masked-
                Vector table: BAR=3D0 offset=3D000fe000
                PBA: BAR=3D0 offset=3D000ff000
        Capabilities: [100 v1] Vendor Specific Information: ID=3D0001
Rev=3D1 Len=3D010 <?>
        Capabilities: [270 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [2a0 v1] Access Control Services
                ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
UpstreamFwd- EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [410 v1] Physical Layer 16.0 GT/s
                Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+
EquPhase3+ LinkEquRequest-
        Capabilities: [450 v1] Lane Margining at the Receiver
                PortCap: Uses Driver-
                PortSta: MargReady- MargSoftReady-
        Kernel driver in use: xhci_hcd
Thanks
Milan

>
> Thanks
> Mathias
>

