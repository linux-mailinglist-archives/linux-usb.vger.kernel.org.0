Return-Path: <linux-usb+bounces-29776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B35C14D93
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 14:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23E7F4F8BB7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 13:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FE7265620;
	Tue, 28 Oct 2025 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEMP81Hy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBA724166E
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761658170; cv=none; b=IhiK6AfDhKxonzTQ3cnkLZ3Pg6n8G+vhx1bosRR8UojQCCYV9ASwURQnoAI1RSOVxX2RkvlBJVICH7u5+oMcjhUmgcBufzvm8QEw3tZwrBAmb5SzqADaSXpI940OrW58b0RWMQXZehFthPcqYz0lHN5bgyFGXN5jfaN1RF+U9DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761658170; c=relaxed/simple;
	bh=rGP2SFeYz8AeRhJJeUhhdMMz3RIugWBcmURcGTTz3MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjyNxIQ33Ud0E42s52/FfXpDu4pAfqDxuB7IQtIKo6a43M83ep1bOJTiDr65MBWmLTcgVvq6V8eAdc6K/rBtKWCD76bZfeYB0XVWieIrAZ8EASL4GMJYfkEWULTvhxAg6Pf8m97xGCJ8dq80SWp/Vgzi+7a+rB/1GC0fPju2zIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEMP81Hy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b6d83bf1077so223422166b.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761658164; x=1762262964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMIABnMmrgCMsRtAU1WkqkjPS0EunSHlrmToP30kQxo=;
        b=XEMP81HytbxC0dKsTZHIXiZ8D2TKFIOo8oBJTqu9XyM5SWQzIkgktVbQfSl9h59n4a
         rPD7sLDNpSKQkLJi0K55mHueMKYCeIWUTqxwHVI6U93jqSNgSt6shNQ6REmxU/hhIuFQ
         uemcOFqphnr7nggFmkFqC2+XrfTIL8kxdCgofSLWaYD8BH8MUJcU/aCm0cT+qneWit0J
         KEGnpaNyooH/lekkCXeULGiZU9tLbXsZTc6WCo2NmpreSf7c+vEIbdz7+C3YOqq19Eia
         cYVGSYRuBqcOOGdX/Bqpi1aqpd9xuZkcgC156H4R6NmJspcBzEih4sdvxFI1D+hBzjtR
         ieYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761658164; x=1762262964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMIABnMmrgCMsRtAU1WkqkjPS0EunSHlrmToP30kQxo=;
        b=NkChu86NPqjSQcKUJS8XH/eW3amFxHdmosxL51bKKT7UPfJJbCkn5pYS5CFiOAshaa
         0MhI62pqX590vCooj3tpj1k59wwC6bWzs/37zikG18e0lb3+rHpTrUCcCJFb/Q8+DF72
         L2eBdXmXBL7TrvPCi9ApKqtj1wD1rg3spfQIXBtuqSepw+R4wA8qGz71UPr8n7vYyKzt
         u2ohLbRSYoDxjtdHBzMQzewGb93+XBRwL73fg62uCUkBDz6zHH1YaMFWV2AuK5AI2CiJ
         Rha9/hj/fqQZDqkzxJnch6VWP2PpXKkoZw2Ak9J/YUIWDmDyA+P5zyXN9QzbG5gtdRBK
         J/rA==
X-Forwarded-Encrypted: i=1; AJvYcCUBH7NvHQAQkOBFdgnPLnxTJnI9tPbm9bfL1cHmNGVPMpaKWmIzhjtU2xpMrssAZHpAZsFBifEIvaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/FRaXCu5C8wZ0stIg7LAQLVY0CGzoYEnlGAwxS1z7Qfi6kwAF
	dj0xH198eWXzOH+LlNltk8eOi7DAHAaFZRfHqbcakelhYdWbDh7NTbbblheHWU1KosS8kAj3KJC
	EeveFxfjoiyJ5YEjmBkmJ56lAQrG6vH5uKWk=
X-Gm-Gg: ASbGncv1fFFzr2lRGwdmhQGItt0lEGPQ7shLnhu+JE4oyqKK95EKSU+zh2ke8WAXr/C
	Zw2n7U8Y1SoxJYq95jg7J0akLC1dWVnJdubwG/xrJsTMUOKWjBWXqf5MOOdQxCpkwvxZZYbVyHG
	XWKwOiXa3QKvA1m8GqJkfieHIKoa2YzmFTupKQ5bLpSIuvBEUc/6ssUWTv20AruqopWWMRjCM2z
	QZGmnjUnxdYGaUA3HTtz6ucJIiBO9OcvX78z/qPI4sTgl/myaVoG0m8aAOq
X-Google-Smtp-Source: AGHT+IHWsa8veDt3FFa6IowiJhEbDSh93oz0Vt7tz0gLmHuNs4/kWzw4ge3CltN1gQ9nqLRViRkQFn+4dNrpGPDmCdk=
X-Received: by 2002:a17:907:6e90:b0:b0d:ee43:d762 with SMTP id
 a640c23a62f3a-b6dba463bf0mr390637466b.4.1761658163307; Tue, 28 Oct 2025
 06:29:23 -0700 (PDT)
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
In-Reply-To: <ba3692e7-6818-41af-8748-71a91cb13db5@linux.intel.com>
From: Milan Oravec <migo.oravec@gmail.com>
Date: Tue, 28 Oct 2025 14:29:11 +0100
X-Gm-Features: AWmQ_bmAksqewlQ1bD-yZqkctwBzHgFkDMfb4-L0f-mwdS5z8jnkZqtVsZdew9s
Message-ID: <CAAcb1K9X+ZgigmiQ9btvV5vs+1UmxyZC39RCnS0tVZZUuYjToQ@mail.gmail.com>
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Mathias, here is dmesg output after applying additional patch:

[Ut okt 28 14:07:39 2025] Linux version 6.17.5-dirty (migo@migoG17)
(gcc (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #59 SMP
PREEMPT_DYNAMIC Tue Oct 28 11:54:08 CET
 2025
[Ut okt 28 14:07:39 2025] Command line: BOOT_IMAGE=3D/vmlinuz
root=3DUUID=3D584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=3Dkeep,xdbc1
debug ignore_loglevel sysrq_always_enabled
force_early_printk sched_verbose ft usbcore.autosuspend=3D-1
no_console_suspend resume=3DUUID=3D54ed98b5-56c0-4ab9-95ea-da1a9322ce49
[Ut okt 28 14:07:39 2025] BIOS-provided physical RAM map:
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x0000000000000000-0x000000000009ffff] usable
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x00000000000a0000-0x00000000000fffff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x0000000000100000-0x0000000009afefff] usable
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x0000000009aff000-0x0000000009ffffff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000000a000000-0x000000000a1fffff] usable
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000000a200000-0x000000000a211fff] ACPI NVS
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000000a212000-0x000000008e43bfff] usable
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000008e43c000-0x000000009443bfff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000009443c000-0x000000009453bfff] ACPI data
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000009453c000-0x000000009653bfff] ACPI NVS
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000009653c000-0x000000009a5fefff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000009a5ff000-0x000000009bffafff] usable
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000009bffb000-0x000000009cffffff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000009d7f3000-0x000000009fffffff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x00000000f0000000-0x00000000f7ffffff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x00000000fd000000-0x00000000ffffffff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x0000000100000000-0x0000000837ffffff] usable
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x0000000838000000-0x0000000857ffffff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x0000000858000000-0x000000085de7ffff] usable
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000085eec0000-0x00000008801fffff] reserved
[Ut okt 28 14:07:39 2025] BIOS-e820: [mem
0x000000fd00000000-0x000000ffffffffff] reserved
[Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 1
[Ut okt 28 14:07:39 2025] ------------[ cut here ]------------
[Ut okt 28 14:07:39 2025] WARNING: CPU: 0 PID: 0 at
mm/early_ioremap.c:139 __early_ioremap+0xae/0x190
[Ut okt 28 14:07:39 2025] Modules linked in:
[Ut okt 28 14:07:39 2025] RIP: __early_ioremap+0xae/0x190
[Ut okt 28 14:07:39 2025] Code: 00 3b 98 b7 4c 89 ca 48 81 e3 00 f0 ff
ff 48 81 e2 00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89
d5 83 fa 40 76 04 <0f> 0b eb a2 6
b c0 c0 4d 89 ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:   00 3b                   add    %bh,(%rbx)
   2:   98                      cwtl
   3:   b7 4c                   mov    $0x4c,%bh
   5:   89 ca                   mov    %ecx,%edx
   7:   48 81 e3 00 f0 ff ff    and    $0xfffffffffffff000,%rbx
   e:   48 81 e2 00 f0 ff ff    and    $0xfffffffffffff000,%rdx
  15:   48 29 d3                sub    %rdx,%rbx
  18:   48 89 14 24             mov    %rdx,(%rsp)
  1c:   48 89 da                mov    %rbx,%rdx
  1f:   48 c1 ea 0c             shr    $0xc,%rdx
  23:   89 d5                   mov    %edx,%ebp
  25:   83 fa 40                cmp    $0x40,%edx
  28:   76 04                   jbe    0x2e
  2a:*  0f 0b                   ud2             <-- trapping instruction
  2c:   eb a2                   jmp    0xffffffffffffffd0
  2e:   6b c0 c0                imul   $0xffffffc0,%eax,%eax
  31:   4d 89 ce                mov    %r9,%r14
  34:   41 81 e6 ff 0f 00 00    and    $0xfff,%r14d
  3b:   44                      rex.R
  3c:   8d                      .byte 0x8d
  3d:   b8                      .byte 0xb8
  3e:   ff                      .byte 0xff
  3f:   05                      .byte 0x5

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:   0f 0b                   ud2
   2:   eb a2                   jmp    0xffffffffffffffa6
   4:   6b c0 c0                imul   $0xffffffc0,%eax,%eax
   7:   4d 89 ce                mov    %r9,%r14
   a:   41 81 e6 ff 0f 00 00    and    $0xfff,%r14d
  11:   44                      rex.R
  12:   8d                      .byte 0x8d
  13:   b8                      .byte 0xb8
  14:   ff                      .byte 0xff
  15:   05                      .byte 0x5
[Ut okt 28 14:07:39 2025] RSP: 0000:ffffffffb7003cb8 EFLAGS: 00010006
ORIG_RAX: 0000000000000000
[Ut okt 28 14:07:39 2025] RAX: 0000000000000000 RBX: 0000000000100000
RCX: 0000000000100000
[Ut okt 28 14:07:39 2025] RDX: 0000000000000100 RSI: 0000000000100000
RDI: 00000000fc300000
[Ut okt 28 14:07:39 2025] RBP: 0000000000000100 R08: 0000000000000000
R09: 00000000fc300000
[Ut okt 28 14:07:39 2025] R10: ffffffffb7079660 R11: ffffffffb7003ad0
R12: 8000000000000163
[Ut okt 28 14:07:39 2025] R13: 0000000000000000 R14: 0000000000000000
R15: 00000000fc300000
[Ut okt 28 14:07:39 2025] FS:  0000000000000000(0000)
GS:0000000000000000(0000) knlGS:0000000000000000
[Ut okt 28 14:07:39 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Ut okt 28 14:07:39 2025] CR2: ffff888000000413 CR3: 00000001ce68a000
CR4: 00000000000000b0
[Ut okt 28 14:07:39 2025] Call Trace:
[Ut okt 28 14:07:39 2025]  <TASK>
[Ut okt 28 14:07:39 2025] ? early_xdbc_parse_parameter+0x3b7/0x430
[Ut okt 28 14:07:39 2025] ? setup_early_printk+0x51b/0x540
[Ut okt 28 14:07:39 2025] ? do_early_param+0x41/0x70
[Ut okt 28 14:07:39 2025] ? parse_args+0x210/0x3e0
[Ut okt 28 14:07:39 2025] ? __pfx_do_early_param+0x10/0x10
[Ut okt 28 14:07:39 2025] ? parse_early_options+0x29/0x30
[Ut okt 28 14:07:39 2025] ? __pfx_do_early_param+0x10/0x10
[Ut okt 28 14:07:39 2025] ? parse_early_param+0x64/0xc0
[Ut okt 28 14:07:39 2025] ? setup_arch+0x4c4/0xb40
[Ut okt 28 14:07:39 2025] ? _printk+0x6b/0x90
[Ut okt 28 14:07:39 2025] ? start_kernel+0x6b/0x9b0
[Ut okt 28 14:07:39 2025] ? x86_64_start_reservations+0x24/0x30
[Ut okt 28 14:07:39 2025] ? x86_64_start_kernel+0xd3/0xe0
[Ut okt 28 14:07:39 2025] ? common_startup_64+0x13e/0x141
[Ut okt 28 14:07:39 2025]  </TASK>
[Ut okt 28 14:07:39 2025] ---[ end trace 0000000000000000 ]---
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Failed to
ioremap xhci-dbc with size 0x100000
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc
ioremap with reduced size 0x80000
[Ut okt 28 14:07:39 2025] ------------[ cut here ]------------
[Ut okt 28 14:07:39 2025] WARNING: CPU: 0 PID: 0 at
mm/early_ioremap.c:139 __early_ioremap+0xae/0x190
[Ut okt 28 14:07:39 2025] Modules linked in:
[Ut okt 28 14:07:39 2025] Tainted: [W]=3DWARN
[Ut okt 28 14:07:39 2025] RIP: __early_ioremap+0xae/0x190
[Ut okt 28 14:07:39 2025] Code: 00 3b 98 b7 4c 89 ca 48 81 e3 00 f0 ff
ff 48 81 e2 00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89
d5 83 fa 40 76 04 <0f> 0b eb a2 6
b c0 c0 4d 89 ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:   00 3b                   add    %bh,(%rbx)
   2:   98                      cwtl
   3:   b7 4c                   mov    $0x4c,%bh
   5:   89 ca                   mov    %ecx,%edx
   7:   48 81 e3 00 f0 ff ff    and    $0xfffffffffffff000,%rbx
   e:   48 81 e2 00 f0 ff ff    and    $0xfffffffffffff000,%rdx
  15:   48 29 d3                sub    %rdx,%rbx
  18:   48 89 14 24             mov    %rdx,(%rsp)
  1c:   48 89 da                mov    %rbx,%rdx
  1f:   48 c1 ea 0c             shr    $0xc,%rdx
  23:   89 d5                   mov    %edx,%ebp
  25:   83 fa 40                cmp    $0x40,%edx
  28:   76 04                   jbe    0x2e
  2a:*  0f 0b                   ud2             <-- trapping instruction
  2c:   eb a2                   jmp    0xffffffffffffffd0
  2e:   6b c0 c0                imul   $0xffffffc0,%eax,%eax
  31:   4d 89 ce                mov    %r9,%r14
  34:   41 81 e6 ff 0f 00 00    and    $0xfff,%r14d
  3b:   44                      rex.R
  3c:   8d                      .byte 0x8d
  3d:   b8                      .byte 0xb8
  3e:   ff                      .byte 0xff
  3f:   05                      .byte 0x5

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:   0f 0b                   ud2
   2:   eb a2                   jmp    0xffffffffffffffa6
   4:   6b c0 c0                imul   $0xffffffc0,%eax,%eax
   7:   4d 89 ce                mov    %r9,%r14
   a:   41 81 e6 ff 0f 00 00    and    $0xfff,%r14d
  11:   44                      rex.R
  12:   8d                      .byte 0x8d
  13:   b8                      .byte 0xb8
  14:   ff                      .byte 0xff
  15:   05                      .byte 0x5
[Ut okt 28 14:07:39 2025] RSP: 0000:ffffffffb7003cb8 EFLAGS: 00010002
ORIG_RAX: 0000000000000000
[Ut okt 28 14:07:39 2025] RAX: 0000000000000000 RBX: 0000000000080000
RCX: 0000000000080000
[Ut okt 28 14:07:39 2025] RDX: 0000000000000080 RSI: 0000000000080000
RDI: 00000000fc300000
[Ut okt 28 14:07:39 2025] RBP: 0000000000000080 R08: 0000000000000000
R09: 00000000fc300000
[Ut okt 28 14:07:39 2025] R10: ffffffffb7079660 R11: ffffffffb7003ad0
R12: 8000000000000163
[Ut okt 28 14:07:39 2025] R13: 0000000000000000 R14: 0000000000000000
R15: 00000000fc300000
[Ut okt 28 14:07:39 2025] FS:  0000000000000000(0000)
GS:0000000000000000(0000) knlGS:0000000000000000
[Ut okt 28 14:07:39 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Ut okt 28 14:07:39 2025] CR2: ffff888000000413 CR3: 00000001ce68a000
CR4: 00000000000000b0
[Ut okt 28 14:07:39 2025] Call Trace:
[Ut okt 28 14:07:39 2025]  <TASK>
[Ut okt 28 14:07:39 2025] ? early_xdbc_parse_parameter+0x3b7/0x430
[Ut okt 28 14:07:39 2025] ? setup_early_printk+0x51b/0x540
[Ut okt 28 14:07:39 2025] ? do_early_param+0x41/0x70
[Ut okt 28 14:07:39 2025] ? parse_args+0x210/0x3e0
[Ut okt 28 14:07:39 2025] ? __pfx_do_early_param+0x10/0x10
[Ut okt 28 14:07:39 2025] ? parse_early_options+0x29/0x30
[Ut okt 28 14:07:39 2025] ? __pfx_do_early_param+0x10/0x10
[Ut okt 28 14:07:39 2025] ? parse_early_param+0x64/0xc0
[Ut okt 28 14:07:39 2025] ? setup_arch+0x4c4/0xb40
[Ut okt 28 14:07:39 2025] ? _printk+0x6b/0x90
[Ut okt 28 14:07:39 2025] ? start_kernel+0x6b/0x9b0
[Ut okt 28 14:07:39 2025] ? x86_64_start_reservations+0x24/0x30
[Ut okt 28 14:07:39 2025] ? x86_64_start_kernel+0xd3/0xe0
[Ut okt 28 14:07:39 2025] ? common_startup_64+0x13e/0x141
[Ut okt 28 14:07:39 2025]  </TASK>
[Ut okt 28 14:07:39 2025] ---[ end trace 0000000000000000 ]---
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Failed to
ioremap xhci-dbc with size 0x80000
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc
ioremap with reduced size 0x40000
[Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
for DbC capability at offset 0x480
[Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
for DbC capability at offset 0x490
[Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
for DbC capability at offset 0x4a0
[Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
for DbC capability at offset 0x4c0
[Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: Looking
for DbC capability at offset 0x4e0
[Ut okt 28 14:07:39 2025] xhci_dbc:early_xdbc_parse_parameter: DbC
capability found at offset 0x4e0
[Ut okt 28 14:07:39 2025] printk: debug: ignoring loglevel setting.
[Ut okt 28 14:07:39 2025] NX (Execute Disable) protection: active
[Ut okt 28 14:07:39 2025] APIC: Static calls initialized
[Ut okt 28 14:07:39 2025] efi: EFI v2.8 by American Megatrends
[Ut okt 28 14:07:39 2025] efi: ACPI=3D0x9453b000 ACPI 2.0=3D0x9453b014
TPMFinalLog=3D0x964f2000 SMBIOS=3D0x9a165000 SMBIOS 3.0=3D0x9a164000
MEMATTR=3D0x8a08d318 ESRT=3D0x8b3d2118 INITRD=3D0
x888efb18 RNG=3D0x944cf018 TPMEventLog=3D0x944ce018
[Ut okt 28 14:07:39 2025] random: crng init done
[Ut okt 28 14:07:39 2025] efi: Remove mem50: MMIO
range=3D[0xf0000000-0xf7ffffff] (128MB) from e820 map
[Ut okt 28 14:07:39 2025] e820: remove [mem 0xf0000000-0xf7ffffff] reserved
[Ut okt 28 14:07:39 2025] efi: Remove mem51: MMIO
range=3D[0xfd000000-0xfedfffff] (30MB) from e820 map
[Ut okt 28 14:07:39 2025] e820: remove [mem 0xfd000000-0xfedfffff] reserved
[Ut okt 28 14:07:39 2025] efi: Not removing mem52: MMIO
range=3D[0xfee00000-0xfee00fff] (4KB) from e820 map
[Ut okt 28 14:07:39 2025] efi: Remove mem53: MMIO
range=3D[0xfee01000-0xffffffff] (17MB) from e820 map
[Ut okt 28 14:07:39 2025] e820: remove [mem 0xfee01000-0xffffffff] reserved
[Ut okt 28 14:07:39 2025] efi: Remove mem56: MMIO
range=3D[0x860000000-0x8801fffff] (514MB) from e820 map
[Ut okt 28 14:07:39 2025] e820: remove [mem 0x860000000-0x8801fffff] reserv=
ed
[Ut okt 28 14:07:39 2025] SMBIOS 3.5.0 present.
[Ut okt 28 14:07:39 2025] DMI: ASUSTeK COMPUTER INC. ROG Strix
G713PV_G713PV/G713PV, BIOS G713PV.336 10/01/2025
[Ut okt 28 14:07:39 2025] DMI: Memory slots populated: 2/2
[Ut okt 28 14:07:39 2025] tsc: Fast TSC calibration using PIT
[Ut okt 28 14:07:39 2025] tsc: Detected 2994.158 MHz processor
[Ut okt 28 14:07:39 2025] e820: update [mem 0x00000000-0x00000fff]
usable =3D=3D> reserved
[Ut okt 28 14:07:39 2025] e820: remove [mem 0x000a0000-0x000fffff] usable
[Ut okt 28 14:07:39 2025] last_pfn =3D 0x85de80 max_arch_pfn =3D 0x40000000=
0
[Ut okt 28 14:07:39 2025] MTRR map: 6 entries (3 fixed + 3 variable;
max 20), built from 9 variable MTRRs
[Ut okt 28 14:07:39 2025] x86/PAT: Configuration [0-7]: WB  WC  UC- UC
 WB  WP  UC- WT
[Ut okt 28 14:07:39 2025] last_pfn =3D 0x9bffb max_arch_pfn =3D 0x400000000
[Ut okt 28 14:07:39 2025] esrt: Reserving ESRT space from
0x000000008b3d2118 to 0x000000008b3d2150.
[Ut okt 28 14:07:39 2025] e820: update [mem 0x8b3d2000-0x8b3d2fff]
usable =3D=3D> reserved
[Ut okt 28 14:07:39 2025] Using GB pages for direct mapping
[Ut okt 28 14:07:39 2025] Secure boot disabled
[Ut okt 28 14:07:39 2025] RAMDISK: [mem 0x79b00000-0x84c36fff]
[Ut okt 28 14:07:39 2025] ACPI: Early table checksum verification disabled
[Ut okt 28 14:07:39 2025] ACPI: RSDP 0x000000009453B014 000024 (v02 _ASUS_)
[Ut okt 28 14:07:39 2025] ACPI: XSDT 0x000000009453A728 00014C (v01
_ASUS_ Notebook 01072009 AMI  01000013)
[Ut okt 28 14:07:39 2025] ACPI: FACP 0x000000009452F000 000114 (v06
_ASUS_ Notebook 01072009 AMI  00010013)
[Ut okt 28 14:07:39 2025] ACPI: DSDT 0x0000000094520000 00EF7C (v02
_ASUS_ Notebook 01072009 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: FACS 0x0000000096522000 000040
[Ut okt 28 14:07:39 2025] ACPI: IVRS 0x0000000094539000 0001A4 (v02
AMD    AmdTable 00000001 AMD  00000001)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x0000000094531000 007F51 (v02
AMD    Vortex   00000002 MSFT 05000000)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x0000000094530000 000309 (v02
_ASUS_ CPUSSDT  01072009 AMI  01072009)
[Ut okt 28 14:07:39 2025] ACPI: FIDT 0x000000009451F000 00009C (v01
_ASUS_ Notebook 01072009 AMI  00010013)
[Ut okt 28 14:07:39 2025] ACPI: MCFG 0x000000009451E000 00003C (v01
_ASUS_ Notebook 01072009 MSFT 00010013)
[Ut okt 28 14:07:39 2025] ACPI: HPET 0x000000009451D000 000038 (v01
_ASUS_ Notebook 01072009 AMI  00000005)
[Ut okt 28 14:07:39 2025] ACPI: FPDT 0x000000009451C000 000044 (v01
_ASUS_ A M I    01072009 AMI  01000013)
[Ut okt 28 14:07:39 2025] ACPI: VFCT 0x0000000094511000 00AE84 (v01
_ASUS_ Notebook 00000001 AMD  33504F47)
[Ut okt 28 14:07:39 2025] ACPI: BGRT 0x0000000094510000 000038 (v01
_ASUS_ Notebook 01072009 AMI  00010013)
[Ut okt 28 14:07:39 2025] ACPI: TPM2 0x000000009450F000 00004C (v04
_ASUS_ Notebook 00000001 AMI  00000000)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x0000000094507000 0074CE (v02
AMD    AmdTable 00000001 AMD  00000001)
[Ut okt 28 14:07:39 2025] ACPI: CRAT 0x0000000094505000 001628 (v01
AMD    AmdTable 00000001 AMD  00000001)
[Ut okt 28 14:07:39 2025] ACPI: CDIT 0x0000000094504000 000029 (v01
AMD    AmdTable 00000001 AMD  00000001)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944F9000 00A9F1 (v02
AMD    DISCUSB4 00000002 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944F8000 0006B5 (v02
AMD    CPMWLRC  00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944F6000 0015B8 (v02
AMD    CPMDFIG2 00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944F3000 0029DC (v02
AMD    CDFAAIG2 00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944ED000 003949 (v02
_ASUS_ Nv18dGPU 00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944E3000 009713 (v02
AMD    CPMCMN   00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944E0000 0022AD (v02
AMD    AOD      00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944F2000 000EA2 (v02
AMD    NVME     00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944F1000 000EA2 (v02
AMD    NVME     00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: WSMT 0x00000000944DF000 000028 (v01
_ASUS_ Notebook 01072009 AMI  00010013)
[Ut okt 28 14:07:39 2025] ACPI: APIC 0x00000000944DE000 00015E (v05
_ASUS_ Notebook 01072009 AMI  00010013)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944DC000 001BAF (v02
AMD    GPP_PME_ 00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944DB000 0006DA (v02
AMD    EXTGPP00 00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944DA000 000952 (v02
AMD    CPMMSOSC 00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944D9000 000464 (v02
AMD    AMDWOV   00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944D8000 000E06 (v02
AMD    CPMUCSI  00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944D7000 00008D (v02
AMD    CPMMSLPI 00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944D6000 0008F2 (v02
AMD    TZ01     00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944D5000 00066F (v02
AMD    XHCI     00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944D4000 00070D (v02
AMD    GPIORPL  00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944D3000 000D67 (v02
AMD    UPEPRPL  00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944D2000 00067B (v02
AMD    GPPRPL   00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: SSDT 0x00000000944D0000 00102E (v02
AMD    CPMACPV7 00000001 INTL 20230331)
[Ut okt 28 14:07:39 2025] ACPI: Reserving FACP table memory at [mem
0x9452f000-0x9452f113]
[Ut okt 28 14:07:39 2025] ACPI: Reserving DSDT table memory at [mem
0x94520000-0x9452ef7b]
[Ut okt 28 14:07:39 2025] ACPI: Reserving FACS table memory at [mem
0x96522000-0x9652203f]
[Ut okt 28 14:07:39 2025] ACPI: Reserving IVRS table memory at [mem
0x94539000-0x945391a3]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x94531000-0x94538f50]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x94530000-0x94530308]
[Ut okt 28 14:07:39 2025] ACPI: Reserving FIDT table memory at [mem
0x9451f000-0x9451f09b]
[Ut okt 28 14:07:39 2025] ACPI: Reserving MCFG table memory at [mem
0x9451e000-0x9451e03b]
[Ut okt 28 14:07:39 2025] ACPI: Reserving HPET table memory at [mem
0x9451d000-0x9451d037]
[Ut okt 28 14:07:39 2025] ACPI: Reserving FPDT table memory at [mem
0x9451c000-0x9451c043]
[Ut okt 28 14:07:39 2025] ACPI: Reserving VFCT table memory at [mem
0x94511000-0x9451be83]
[Ut okt 28 14:07:39 2025] ACPI: Reserving BGRT table memory at [mem
0x94510000-0x94510037]
[Ut okt 28 14:07:39 2025] ACPI: Reserving TPM2 table memory at [mem
0x9450f000-0x9450f04b]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x94507000-0x9450e4cd]
[Ut okt 28 14:07:39 2025] ACPI: Reserving CRAT table memory at [mem
0x94505000-0x94506627]
[Ut okt 28 14:07:39 2025] ACPI: Reserving CDIT table memory at [mem
0x94504000-0x94504028]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944f9000-0x945039f0]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944f8000-0x944f86b4]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944f6000-0x944f75b7]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944f3000-0x944f59db]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944ed000-0x944f0948]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944e3000-0x944ec712]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944e0000-0x944e22ac]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944f2000-0x944f2ea1]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944f1000-0x944f1ea1]
[Ut okt 28 14:07:39 2025] ACPI: Reserving WSMT table memory at [mem
0x944df000-0x944df027]
[Ut okt 28 14:07:39 2025] ACPI: Reserving APIC table memory at [mem
0x944de000-0x944de15d]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944dc000-0x944ddbae]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944db000-0x944db6d9]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944da000-0x944da951]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944d9000-0x944d9463]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944d8000-0x944d8e05]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944d7000-0x944d708c]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944d6000-0x944d68f1]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944d5000-0x944d566e]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944d4000-0x944d470c]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944d3000-0x944d3d66]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944d2000-0x944d267a]
[Ut okt 28 14:07:39 2025] ACPI: Reserving SSDT table memory at [mem
0x944d0000-0x944d102d]
[Ut okt 28 14:07:39 2025] No NUMA configuration found
[Ut okt 28 14:07:39 2025] Faking a node at [mem
0x0000000000000000-0x000000085de7ffff]
[Ut okt 28 14:07:39 2025] NODE_DATA(0) allocated [mem 0x85de552c0-0x85de7ff=
ff]
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: DCE successfully clear=
ed
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully got
xdbc table_dma page
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully got
xdbc out_dma page
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully
allocated event ring
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully
allocated in ring
[Ut okt 28 14:07:39 2025] xhci_dbc:xdbc_early_setup: Successfully
allocated out ring
[Ut okt 28 14:07:44 2025] xhci_dbc:xdbc_start: waiting for connection timed=
 out
[Ut okt 28 14:07:44 2025] xhci_dbc:xdbc_early_setup: Failed to start
xdbc ret: -110
[Ut okt 28 14:07:44 2025] xhci_dbc:early_xdbc_setup_hardware: failed
to setup the connection to host
[Ut okt 28 14:07:44 2025] Zone ranges:
[Ut okt 28 14:07:44 2025]   DMA      [mem 0x0000000000001000-0x0000000000ff=
ffff]
[Ut okt 28 14:07:44 2025]   DMA32    [mem 0x0000000001000000-0x00000000ffff=
ffff]
[Ut okt 28 14:07:44 2025]   Normal   [mem 0x0000000100000000-0x000000085de7=
ffff]
[Ut okt 28 14:07:44 2025]   Device   empty
[Ut okt 28 14:07:44 2025] Movable zone start for each node
[Ut okt 28 14:07:44 2025] Early memory node ranges

I've tested cable afterwards:

echo enable > /sys/devices/pci0000:00/0000:00:08.1/0000:09:00.4/dbc

[Ut okt 28 14:12:28 2025] xhci_hcd 0000:09:00.4: DbC connected
[Ut okt 28 14:12:29 2025] xhci_hcd 0000:09:00.4: DbC configured

so cable is not the problem here...

Thank you!

On Tue, Oct 28, 2025 at 11:13=E2=80=AFAM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 10/27/25 11:34, Mathias Nyman wrote:
> > On 10/24/25 21:48, Milan Oravec wrote:
> >> Thank you, should try this patch against stable 6.17.5 or 6.18 branch?
> >> It fails with 6.17.5
> >>
> >
> > It was on top of 6.18-rc1, but should apply fine on 6.17.5
> > Tried myself, saved the email as patch.eml and applied with patch:
> >
>
> List was accidentally dropped.
> Milan got patch running, DbC tried ioremapping smaller and smaller size u=
ntil it was successful.
> DbC capability was within successfully mapped size, but DbC failed to sta=
rt properly.
>
> Log:
> [    0.000000] Linux version 6.17.5-dirty (migo@migoG17) (gcc (GCC)
> ...
> [    0.000000] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 1
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139
> __early_ioremap+0xae/0x190
> [    0.000000] Modules linked in:
> [    0.000000] RIP: __early_ioremap+0xae/0x190
> ...
> [    0.000000] xhci_dbc:xdbc_map_pci_mmio: Failed to ioremap xhci-dbc wit=
h size 0x100000
> [    0.000000] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc ioremap with re=
duced size 0x80000
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139
> __early_ioremap+0xae/0x190
> [    0.000000] Modules linked in:
> [    0.000000] Tainted: [W]=3DWARN
> [    0.000000] RIP: __early_ioremap+0xae/0x190
> ...
> [    0.000000] xhci_dbc:xdbc_map_pci_mmio: Failed to ioremap xhci-dbc wit=
h size 0x80000
> [    0.000000] xhci_dbc:xdbc_map_pci_mmio: Retry xhci-dbc ioremap with re=
duced size 0x40000
> [    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capab=
ility at offset 0x480
> [    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capab=
ility at offset 0x490
> [    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capab=
ility at offset 0x4a0
> [    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capab=
ility at offset 0x4c0
> [    0.000000] xhci_dbc:early_xdbc_parse_parameter: Looking for DbC capab=
ility at offset 0x4e0
> [    0.000000] xhci_dbc:early_xdbc_parse_parameter: DbC capability found =
at offset 0x4e0
> ...
> [    5.018291] xhci_dbc:early_xdbc_setup_hardware: failed to setup the co=
nnection to host
>
> Milan, can you add more debugging into early dbc, showing in detail where=
 it fails.
> On top op previous patch:
>
> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
> index 9a7f3f12f18f..dc372f028dc3 100644
> --- a/drivers/usb/early/xhci-dbc.c
> +++ b/drivers/usb/early/xhci-dbc.c
> @@ -29,11 +29,7 @@
>   static struct xdbc_state xdbc;
>   static bool early_console_keep;
>
> -#ifdef XDBC_TRACE
> -#define        xdbc_trace      trace_printk
> -#else
> -static inline void xdbc_trace(const char *fmt, ...) { }
> -#endif /* XDBC_TRACE */
> +#define        xdbc_trace      pr_err
>
>   static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 fu=
nc)
>   {
> @@ -568,35 +564,42 @@ static int __init xdbc_early_setup(void)
>         ret =3D handshake(&xdbc.xdbc_reg->control, CTRL_DBC_ENABLE, 0, 10=
0000, 100);
>         if (ret)
>                 return ret;
> +       pr_notice("DCE successfully cleared");
>
>         /* Allocate the table page: */
>         xdbc.table_base =3D xdbc_get_page(&xdbc.table_dma);
>         if (!xdbc.table_base)
>                 return -ENOMEM;
> +       pr_notice("Successfully got xdbc table_dma page");
>
>         /* Get and store the transfer buffer: */
>         xdbc.out_buf =3D xdbc_get_page(&xdbc.out_dma);
>         if (!xdbc.out_buf)
>                 return -ENOMEM;
> +       pr_notice("Successfully got xdbc out_dma page");
>
>         /* Allocate the event ring: */
>         ret =3D xdbc_alloc_ring(&xdbc.evt_seg, &xdbc.evt_ring);
>         if (ret < 0)
>                 return ret;
> +       pr_notice("Successfully allocated event ring");
>
>         /* Allocate IN/OUT endpoint transfer rings: */
>         ret =3D xdbc_alloc_ring(&xdbc.in_seg, &xdbc.in_ring);
>         if (ret < 0)
>                 return ret;
> +       pr_notice("Successfully allocated in ring");
>
>         ret =3D xdbc_alloc_ring(&xdbc.out_seg, &xdbc.out_ring);
>         if (ret < 0)
>                 return ret;
> +       pr_notice("Successfully allocated out ring");
>
>         xdbc_mem_init();
>
>         ret =3D xdbc_start();
>         if (ret < 0) {
> +               pr_notice("Failed to start xdbc ret: %d", ret);
>                 writel(0, &xdbc.xdbc_reg->control);
>                 return ret;
>         }
>

