Return-Path: <linux-usb+bounces-29318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C09BDD2E0
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 09:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4E33AF95F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 07:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75F72FE577;
	Wed, 15 Oct 2025 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JntihMVk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C7A21B9F5
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514198; cv=none; b=X+pZnMxQkfXvCsw8m+1xVxuHacjiorFcx+0GOOaoayrDrf0TvnL27Bd8zyip2qVEH8SMo3ZhCNrfvAugpry/VNRjVDWvPMmkMYZfalE6CtDHFaY9rVi8q6yvGEvb6ki+vzhWvVtDQMZaVzh9eO+422TkKI6YGDH2p0tPpv/7j98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514198; c=relaxed/simple;
	bh=AXB6cKibqAa9xYGeGDnyqUSdb5rNgkTthIVX13eFozY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nmCM7Wk4UKxd43anuuIZ4wMg49e9GHJO5hwryXcvAl594h45NWH41iIDL0UnkCtw2oikoW3hmimDdfRh9WwmuxfzkoR5hsFMfuOhtrbQaqJbNL+CGC9eoesJFXWXUUsEiYTYfMpRTHwDPJowPKvm6EABD5JUm7FWTyXyXmzj6kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JntihMVk; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso14011871a12.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760514194; x=1761118994; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=abWFhoZk6TYssFualYpCvNAZ/RX8rBMa6F75DAZVMJc=;
        b=JntihMVkXm/Q1pFu4QNbgR9hlJ/1VoSbKQ3Q8hQbIIOLqpCexOcXegE00jo2LoHTfi
         u5b+ufFVrxuhCP/9QKs3IQXqLYjvjT7oy+19UXZLi8vsovLYo/f3HS7O6tXpA05BLhKC
         35z8kReGFK3pn2pbSlVmZZN2tnbbLTiWiKXi/fb8mkkfBX8Ng0l2CkYVZtU+gRx7sKcg
         tdhFCHI52Awg1ceM74LAYWDRftW5EVpCVZ0Bx4/Qv4ozIoRUVi4xQ86Z5xSI9hTBmwq/
         +6Vxfox59lCnMOU3nIgU+A4783oNz9mG43jHvMpuKjixjUnou8kTHJpCXOUKCvmJLQW+
         KJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760514194; x=1761118994;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abWFhoZk6TYssFualYpCvNAZ/RX8rBMa6F75DAZVMJc=;
        b=k72aYXB3QyK0AX498n+XOx38ZD7I9YvpeOpTh3vOazAhSh6wTrWCkzRrcEE2Mch2UE
         P3uUhymFvvqvHOJHR6FwUlfrXHTNwZ9Om5cg48y7lY3CyeigO7+09BldDsP65pQeWGFl
         670hqROVk9Q2Nx1ewL2gjMUHWqzj2bJmuM6nnYSIsAmRyGhGljjeysycGzHZyzHETHIn
         nV+MOM2cRlOOqBWTDF4eE3G0ia2oFMSNqwUmm7CyPkNfS2qJxP5yaQuqu/T5xou6NF0p
         62+hpwb1NBPfHOkRcAnfKFW7PqSMSLrQeO8PihnAGwiNopoBah7PQe7HI8fGmI1V/gyk
         b2Jw==
X-Gm-Message-State: AOJu0Yw2Tlr13M8kYWTs0geue2fXIeGSB4yd3atERTsU5/JZuXzdJBql
	vvL6S16jNALi1bn1UIjogOjSvD1j3GRN4SqLualx00KqVVUcLlrBlrICGmn9j+Nmup23nl3Qa/c
	52ho4ajK+tm53hApE794BruwP67tHXcsP
X-Gm-Gg: ASbGncsd4ZQJJB2jzqVVtvARuUwFtgEOoSZD4G81F405N5RgkKy+Im/jM1pnu3kXfWr
	CST1zr6Yh6fq6adMnoFEDhAkPMVx/rxwLCWu+qFa3n6TynLhXVgPcS0jXL0uxT4jIzzxZygBAFd
	sq9LoXAkAdmnWQ8nQqkhn0nbpCuHP8T69zguZGsBDtlwRn9CvU47dBDNf4x+1+8vzSfS25NP4RX
	7Qmnj6DY+D72S8kQV/oFnkZh3GR8daolAQm
X-Google-Smtp-Source: AGHT+IHIW3rB20VYockyRmzxxmVSCPBZGooMip7tQDgDAJczGBk2ytJJ9qbeUjUg2NUJV3+1a5hp5cLXyayVeKoH3yc=
X-Received: by 2002:a17:907:d06:b0:b28:b057:3958 with SMTP id
 a640c23a62f3a-b50ac5d1e14mr3004630066b.48.1760514193917; Wed, 15 Oct 2025
 00:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
In-Reply-To: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
From: Milan Oravec <migo.oravec@gmail.com>
Date: Wed, 15 Oct 2025 09:43:02 +0200
X-Gm-Features: AS18NWAjMGIxcESWAOaXCLxMQM-W_2DWj8iwD16pxFfo9tp3VDVpGCoiwuxJw3o
Message-ID: <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
Subject: Fwd: USB DBC hang during earlyprintk initialization
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello, I'm trying to debug some hibernation related problems on my
system, and need a USB DBC to see what is going on after screen off.
I've connected USB debugging cable and got this error:

[    0.000000] Linux version 6.17.2 (migo@migoG17) (gcc (GCC) 15.2.1
20250813, GNU ld (GNU Binutils) 2.45.0) #54 SMP PREEMPT_DYNAMIC Sun
Oct 12 19:07:00 CEST 2025
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz
root=UUID=584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=xdbc1,keep
debug ignore_loglevel sysrq_always_enabled force_early
_printk sched_verbose ft usbcore.autosuspend=-1 no_console_suspend
hib_compression=lz4 resume=UUID=54ed98b5-56c0-4ab9-95ea-da1a9322ce49
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009afefff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009aff000-0x0000000009ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a211fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000000a212000-0x000000008e43dfff] usable
[    0.000000] BIOS-e820: [mem 0x000000008e43e000-0x000000009443dfff] reserved
[    0.000000] BIOS-e820: [mem 0x000000009443e000-0x000000009453dfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000009453e000-0x000000009653dfff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000009653e000-0x000000009a5fefff] reserved
[    0.000000] BIOS-e820: [mem 0x000000009a5ff000-0x000000009bffafff] usable
[    0.000000] BIOS-e820: [mem 0x000000009bffb000-0x000000009cffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000009d7f3000-0x000000009fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000837ffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000838000000-0x0000000857ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000858000000-0x000000085de7ffff] usable
[    0.000000] BIOS-e820: [mem 0x000000085eec0000-0x00000008801fffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 1
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139
__early_ioremap+0xae/0x190
[    0.000000] Modules linked in:
[    0.000000] RIP: __early_ioremap+0xae/0x190
[ 0.000000] Code: 00 1b d8 b1 4c 89 ca 48 81 e3 00 f0 ff ff 48 81 e2
00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89 d5 83 fa 40
76 04 <0f> 0b eb a2 6b c0 c0 4d 89
ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
All code
========
   0: 00 1b                 add    %bl,(%rbx)
   2: d8 b1 4c 89 ca 48     fdivs  0x48ca894c(%rcx)
   8: 81 e3 00 f0 ff ff     and    $0xfffff000,%ebx
   e: 48 81 e2 00 f0 ff ff and    $0xfffffffffffff000,%rdx
  15: 48 29 d3             sub    %rdx,%rbx
  18: 48 89 14 24           mov    %rdx,(%rsp)
  1c: 48 89 da             mov    %rbx,%rdx
  1f: 48 c1 ea 0c           shr    $0xc,%rdx
  23: 89 d5                 mov    %edx,%ebp
  25: 83 fa 40             cmp    $0x40,%edx
  28: 76 04                 jbe    0x2e
  2a:* 0f 0b                 ud2 <-- trapping instruction
  2c: eb a2                 jmp    0xffffffffffffffd0
  2e: 6b c0 c0             imul   $0xffffffc0,%eax,%eax
  31: 4d 89 ce             mov    %r9,%r14
  34: 41 81 e6 ff 0f 00 00 and    $0xfff,%r14d
  3b: 44                   rex.R
  3c: 8d                   .byte 0x8d
  3d: b8                   .byte 0xb8
  3e: ff                   .byte 0xff
  3f: 05                   .byte 0x5

Code starting with the faulting instruction
===========================================
   0: 0f 0b                 ud2
   2: eb a2                 jmp    0xffffffffffffffa6
   4: 6b c0 c0             imul   $0xffffffc0,%eax,%eax
   7: 4d 89 ce             mov    %r9,%r14
   a: 41 81 e6 ff 0f 00 00 and    $0xfff,%r14d
  11: 44                   rex.R
  12: 8d                   .byte 0x8d
  13: b8                   .byte 0xb8
  14: ff                   .byte 0xff
  15: 05                   .byte 0x5
[    0.000000] RSP: 0000:ffffffffb1403cb8 EFLAGS: 00010006 ORIG_RAX:
0000000000000000
[    0.000000] RAX: 0000000000000000 RBX: 0000000000100000 RCX: 0000000000100000
[    0.000000] RDX: 0000000000000100 RSI: 0000000000100000 RDI: 00000000fc300000
[    0.000000] RBP: 0000000000000100 R08: 0000000000000000 R09: 00000000fc300000
[    0.000000] R10: ffffffffb1479660 R11: ffffffffb1403ad0 R12: 8000000000000163
[    0.000000] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000fc300000
[    0.000000] FS:  0000000000000000(0000) GS:0000000000000000(0000)
knlGS:0000000000000000
[    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.000000] CR2: ffff888000000413 CR3: 000000016c088000 CR4: 00000000000000b0
[    0.000000] Call Trace:
[    0.000000]  <TASK>
[    0.000000] ? early_xdbc_parse_parameter+0x32b/0x360
[    0.000000] ? setup_early_printk+0x51b/0x540
[    0.000000] ? do_early_param+0x41/0x70
[    0.000000] ? parse_args+0x210/0x3e0
[    0.000000] ? __pfx_do_early_param+0x10/0x10
[    0.000000] ? parse_early_options+0x29/0x30
[    0.000000] ? __pfx_do_early_param+0x10/0x10
[    0.000000] ? parse_early_param+0x64/0xc0
[    0.000000] ? setup_arch+0x4c4/0xb40
[    0.000000] ? _printk+0x6b/0x90
[    0.000000] ? start_kernel+0x6b/0x9b0
[    0.000000] ? x86_64_start_reservations+0x24/0x30
[    0.000000] ? x86_64_start_kernel+0xd3/0xe0
[    0.000000] ? common_startup_64+0x13e/0x141
[    0.000000]  </TASK>
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.8 by American Megatrends
[    0.000000] efi: ACPI=0x9453d000 ACPI 2.0=0x9453d014
TPMFinalLog=0x964f4000 SMBIOS=0x9a165000 SMBIOS 3.0=0x9a164000
MEMATTR=0x89fc8018 ESRT=0x8b20c018 INITRD=0x8882cb18 R
NG=0x944d0018 TPMEventLog=0x944cf018
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem47: MMIO range=[0xf0000000-0xf7ffffff]
(128MB) from e820 map
[    0.000000] e820: remove [mem 0xf0000000-0xf7ffffff] reserved


Can anybody help me with this problem please?

Thank you!

Milan

