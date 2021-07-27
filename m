Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FB43D73F2
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 13:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236460AbhG0LCc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 07:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236221AbhG0LC0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 07:02:26 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AA0C061764
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 04:02:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id a192-20020a1c7fc90000b0290253b32e8796so1178717wmd.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J9R+xR9XQJyVnXbfl0cnNumj6WAwyXywyD8m1wG+ufg=;
        b=VGFdfEduE8vl8osxCgE7vB3F66wmbSVyoGJEwwZ/bGS2wD1rUlu1XsKd5YWpYG25tx
         aivRnN8Soe1hWOFr5KXOpaUA8axDaA9yg6k4lbCFaL1fcBQKWvWCBDd6j5/Ojz0cj7Sw
         q6Uq9zHTuFNkZS6sUlk227z/YazXyO3PciucTWxirTEVhvLC/mWUNl+exQFQMzpW8y9A
         1S8qdx9CreUq4jzNdaXvq6W2nqYPhv4FbwVWxgV514eL7TAOMZ0t1tK0eCEg6MNvX5NQ
         ot4AEb48q1cpZlrCpIaPcw4JA/7tkUk8Xn/0pW8n7zq+PnJOV+kyDtivXi8Q+qSfTvSK
         06dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J9R+xR9XQJyVnXbfl0cnNumj6WAwyXywyD8m1wG+ufg=;
        b=AoSJHCSgVukLvYyRKY/iNgbiv+1BQgdC+VccfKH/WpWTDoHiLiAEAi6Jt/MmvypO8d
         l3OtSDQ8+MVXdY9oSc3t3KEWzv+kbjFJlEq8LkF/ypuktUgd2n1tPXb7Y61wzB6YBpT/
         u2Et5AD7jdj6TWQDUvccV/lEgLcW/9gYp05yRgPH42/OCh3PHKPdZ84BX7ig+Dl2OqtF
         BLDRmz/OSw5KINDE5/m4u1L7jIAH5rfZBeGmqGu2c0iNklPNt4NAYLMQxtcF1VsByTDq
         drpYoHIc1F2gkPVFP+daxdyUmkoBFU4nKXXnn+guQrdxin5LdhWrvnHm6JTzUhAaRVLA
         ZY4Q==
X-Gm-Message-State: AOAM531fP6UrSJ1htpJxowB4yoT8VrpmIUZrTgyXLOQLP4xAzEQLzdk0
        9Wcy4BFNkS0Z9qJkYGeCZgQ=
X-Google-Smtp-Source: ABdhPJx/tpu5zZ+WCw2tzjMSjk60xNJiecZG1rrYyBvqmvrtaMwbBQSYACjX7IQBWbbp1gTpJ4zSwQ==
X-Received: by 2002:a05:600c:2942:: with SMTP id n2mr3540303wmd.152.1627383742113;
        Tue, 27 Jul 2021 04:02:22 -0700 (PDT)
Received: from [192.168.86.232] (xo2wyvern.plus.com. [195.166.158.71])
        by smtp.gmail.com with ESMTPSA id a8sm2856802wrt.61.2021.07.27.04.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 04:02:21 -0700 (PDT)
Date:   Tue, 27 Jul 2021 12:02:15 +0100
From:   AMoonRabbit <razgriz.wilson6@gmail.com>
Subject: RE: Fwd: Linux Kernel 5.12.10 Walkman USB DAC support issues
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Message-Id: <RBHWWQ.R54EUTRRR5DN@gmail.com>
In-Reply-To: <a59c1173b77b4ace8db7181b1b0fc446@SVR-IES-MBX-03.mgc.mentorg.com>
References: <QUKVWQ.1T8HV94AM5X6@gmail.com>
        <CAJpVOidqd+tpNNkHGvC6fUQ7g3Z+FLpiDJrmPWtQmiL-AsYsLw@mail.gmail.com>
        <YP+kqqimY1BYZAwL@kroah.com>
        <a59c1173b77b4ace8db7181b1b0fc446@SVR-IES-MBX-03.mgc.mentorg.com>
X-Mailer: geary/3.38.2
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

So this is the Dmesg output from 5.10.17 with working output to USB DAC=20
(Walkman visually gets audio as the amp meter visualiser works where as=20
on newer kernels, whilst the system looks to be outputting sound, the=20
Walkman shows it's receiving nothing).

DMESG:
[    0.000000]microcode: microcode updated early to revision 0xea, date=20
=3D 2021-01-25
[    0.000000]Linux version 5.10.17-surface (root@60fe0e716c6b) (gcc=20
(Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubu
ntu) 2.34) #1 SMP Sat Feb 20 23:29:14 UTC 2021
[    0.000000]Command line:=20
initrd=3D\EFI\Pop_OS-42a72843-c385-422e-ba58-25988f813a20\initrd.img-5.10.1=
7-surface=20
root=3DUUID=3D42a72843-c385-
422e-ba58-25988f813a20 ro quiet loglevel=3D0 systemd.show_status=3Dfalse=20
splash
[    0.000000]KERNEL supported cpus:
[    0.000000]  Intel GenuineIntel
[    0.000000]  AMD AuthenticAMD
[    0.000000]  Hygon HygonGenuine
[    0.000000]  Centaur CentaurHauls
[    0.000000]  zhaoxin   Shanghai
[    0.000000]x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating=20
point registers'
[    0.000000]x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000]x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000]x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds=20
registers'
[    0.000000]x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000]x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000]x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000]x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000]x86/fpu: Enabled xstate features 0x1f, context size is=20
960 bytes, using 'compacted' format.
[    0.000000]BIOS-provided physical RAM map:
[    0.000000]BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff]=20
usable
[    0.000000]BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff]=20
reserved
[    0.000000]BIOS-e820: [mem 0x0000000000100000-0x000000003fffffff]=20
usable
[    0.000000]BIOS-e820: [mem 0x0000000040000000-0x00000000403fffff]=20
reserved
[    0.000000]BIOS-e820: [mem 0x0000000040400000-0x000000008ab41fff]=20
usable
[    0.000000]BIOS-e820: [mem 0x000000008ab42000-0x000000008ab42fff]=20
ACPI NVS
[    0.000000]BIOS-e820: [mem 0x000000008ab43000-0x000000008ab43fff]=20
reserved
[    0.000000]BIOS-e820: [mem 0x000000008ab44000-0x000000008bdeffff]=20
usable
[    0.000000]BIOS-e820: [mem 0x000000008bdf0000-0x000000008be9efff]=20
reserved
[    0.000000]BIOS-e820: [mem 0x000000008be9f000-0x000000008bec4fff]=20
ACPI NVS
[    0.000000]BIOS-e820: [mem 0x000000008bec5000-0x000000008befefff]=20
ACPI data
[    0.000000]BIOS-e820: [mem 0x000000008beff000-0x000000008befffff]=20
usable
[    0.000000]BIOS-e820: [mem 0x000000008bf00000-0x000000008f7fffff]=20
reserved
[    0.000000]BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff]=20
reserved
[    0.000000]BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff]=20
reserved
[    0.000000]BIOS-e820: [mem 0x0000000100000000-0x000000016f7fffff]=20
usable
[    0.000000]NX (Execute Disable) protection: active
[    0.000000]efi: EFI v2.70 by MSFT
[    0.000000]efi: ACPI=3D0x8befe000 ACPI 2.0=3D0x8befe014=20
TPMFinalLog=3D0x8bebb000 SMBIOS=3D0x8be60000 SMBIOS 3.0=3D0x8be5e000=20
MEMATTR=3D0x8891651
8 ESRT=3D0x88f03118 RNG=3D0x8be72a18 TPMEventLog=3D0x88914018
[    0.000000]efi: seeding entropy pool
[    0.000000]random: fast init done
[    0.000000]SMBIOS 3.2.0 present.
[    0.000000]DMI: Microsoft Corporation Surface Pro 4/Surface Pro 4,=20
BIOS 109.3192.768 03.24.2020
[    0.000000]tsc: Detected 2500.000 MHz processor
[    0.000000]tsc: Detected 2499.952 MHz TSC
[    0.000952]e820: update [mem 0x00000000-0x00000fff] usable =3D=3D>=20
reserved
[    0.000955]e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000962]last_pfn =3D 0x16f800 max_arch_pfn =3D 0x400000000
[    0.000966]MTRR default type: write-back
[    0.000967]MTRR fixed ranges enabled:
[    0.000969]  00000-9FFFF write-back
[    0.000970]  A0000-BFFFF uncachable
[    0.000972]  C0000-FFFFF write-protect
[    0.000972]MTRR variable ranges enabled:
[    0.000974]  0 base 00C0000000 mask 7FC0000000 uncachable
[    0.000975]  1 base 00A0000000 mask 7FE0000000 uncachable
[    0.000976]  2 base 0090000000 mask 7FF0000000 uncachable
[    0.000978]  3 base 008E000000 mask 7FFE000000 uncachable
[    0.000979]  4 base 008D000000 mask 7FFF000000 uncachable
[    0.000979]  5 disabled
[    0.000980]  6 disabled
[    0.000981]  7 disabled
[    0.000981]  8 disabled
[    0.000982]  9 disabled
[    0.001577]x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC-=20
WT
[    0.002008]last_pfn =3D 0x8bf00 max_arch_pfn =3D 0x400000000
[    0.016390]esrt: Reserving ESRT space from 0x0000000088f03118 to=20
0x0000000088f03218.
[    0.016397]e820: update [mem 0x88f03000-0x88f03fff] usable =3D=3D>=20
reserved
[    0.016438]check: Scanning 1 areas for low memory corruption
[    0.016443]Using GB pages for direct mapping
[    0.017097]Secure boot disabled
[    0.017099]RAMDISK: [mem 0x7a19f000-0x7fffffff]
[    0.017114]ACPI: Early table checksum verification disabled
[    0.017117]ACPI: RSDP 0x000000008BEFE014 000024 (v02 MSFT  )
[    0.017121]ACPI: XSDT 0x000000008BEFD0E8 0000B4 (v01 MSFT   MSFT    =20
00000000 MSFT 0000005F)
[    0.017127]ACPI: FACP 0x000000008BEFA000 00010C (v05 MSFT   MSFT    =20
00000000 MSFT 0000005F)
[    0.017133]ACPI: DSDT 0x000000008BEDD000 018057 (v02 MSFT   MSFT    =20
00000000 INTL 20160422)
[    0.017137]ACPI: FACS 0x000000008BEA9000 000040
[    0.017140]ACPI: BBRT 0x000000008BEFC000 00002C (v01 MSFT   MSFT    =20
00000002 MSFT 0000005F)
[    0.017144]ACPI: MSDM 0x000000008BEFB000 000055 (v01 MSFT           =20
00000001 MSFT 00000001)
[    0.017148]ACPI: HPET 0x000000008BEF9000 000038 (v01 MSFT   MSFT    =20
00000001 MSFT 0000005F)
[    0.017151]ACPI: APIC 0x000000008BEF8000 00012C (v03 MSFT   MSFT    =20
00000001 MSFT 0000005F)
[    0.017155]ACPI: MCFG 0x000000008BEF7000 00003C (v01 MSFT   MSFT    =20
00000001 MSFT 0000005F)
[    0.017159]ACPI: LPIT 0x000000008BEF6000 000094 (v01 MSFT   MSFT    =20
00000000 MSFT 0000005F)
[    0.017162]ACPI: SSDT 0x000000008BEDA000 00260B (v02 MSFT   RTD3APNV=20
00001000 INTL 20160422)
[    0.017166]ACPI: SSDT 0x000000008BED9000 0008CD (v02 MSFT   xh_ap000=20
00000000 INTL 20160422)
[    0.017169]ACPI: SSDT 0x000000008BED8000 000574 (v02 MSFT   Tpm2Tabl=20
00001000 INTL 20160422)
[    0.017173]ACPI: TPM2 0x000000008BED7000 000034 (v03 MSFT   MSFT    =20
00000002 MSFT 0000005F)
[    0.017177]ACPI: SSDT 0x000000008BED3000 003151 (v02 SaSsdt SaSsdt  =20
00003000 INTL 20160422)
[    0.017181]ACPI: SSDT 0x000000008BED1000 0017AE (v02 CpuRef CpuSsdt =20
00003000 INTL 20160422)
[    0.017184]ACPI: DMAR 0x000000008BED0000 000088 (v01 MSFT   MSFT    =20
00000001 INTL 00000001)
[    0.017188]ACPI: NHLT 0x000000008BECF000 00002D (v00 MSFT   MSFT    =20
00000002 MSFT 0000005F)
[    0.017191]ACPI: BGRT 0x000000008BECE000 000038 (v01 MSFT   MSFT    =20
00000002 MSFT 0000005F)
[    0.017195]ACPI: WSMT 0x000000008BECD000 000028 (v01 MSFT   MSFT    =20
00000002 MSFT 0000005F)
[    0.017198]ACPI: FPDT 0x000000008BECC000 000034 (v01 MSFT   MSFT    =20
00000002 MSFT 0000005F)
[    0.017208]ACPI: Local APIC address 0xfee00000
[    0.017540]No NUMA configuration found
[    0.017541]Faking a node at [mem=20
0x0000000000000000-0x000000016f7fffff]
[    0.017552]NODE_DATA(0) allocated [mem 0x16f7d2000-0x16f7fcfff]
[    0.017918]cma: Reserved 32 MiB at 0x000000016d400000
[    0.017934]Zone ranges:
[    0.017935]  DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.017937]  DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.017939]  Normal   [mem 0x0000000100000000-0x000000016f7fffff]
[    0.017940]  Device   empty
[    0.017941]Movable zone start for each node
[    0.017945]Early memory node ranges
[    0.017946]  node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.017947]  node   0: [mem 0x0000000000100000-0x000000003fffffff]
[    0.017948]  node   0: [mem 0x0000000040400000-0x000000008ab41fff]
[    0.017949]  node   0: [mem 0x000000008ab44000-0x000000008bdeffff]
[    0.017950]  node   0: [mem 0x000000008beff000-0x000000008befffff]
[    0.017951]  node   0: [mem 0x0000000100000000-0x000000016f7fffff]
[    0.018149]Zeroed struct page in unavailable ranges: 20082 pages
[    0.018150]Initmem setup node 0 [mem=20
0x0000000000001000-0x000000016f7fffff]
[    0.018152]On node 0 totalpages: 1028494
[    0.018153]  DMA zone: 64 pages used for memmap
[    0.018154]  DMA zone: 24 pages reserved
[    0.018155]  DMA zone: 3999 pages, LIFO batch:0
[    0.018189]  DMA32 zone: 8872 pages used for memmap
[    0.018190]  DMA32 zone: 567791 pages, LIFO batch:63
[    0.021691]  Normal zone: 7136 pages used for memmap
[    0.021692]  Normal zone: 456704 pages, LIFO batch:63
[    0.024549]Reserving Intel graphics memory at [mem=20
0x8d800000-0x8f7fffff]
[    0.025046]ACPI: PM-Timer IO Port: 0x1808
[    0.025048]ACPI: Local APIC address 0xfee00000
[    0.025055]ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.025056]ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.025057]ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.025058]ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.025059]ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.025060]ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.025060]ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.025061]ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.025062]ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.025063]ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.025064]ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.025064]ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.025065]ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.025066]ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.025067]ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.025068]ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.025095]IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI=20
0-119
[    0.025098]ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.025099]ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high=20
level)
[    0.025101]ACPI: IRQ0 used by override.
[    0.025102]ACPI: IRQ9 used by override.
[    0.025104]Using ACPI (MADT) for SMP configuration information
[    0.025106]ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.025115]e820: update [mem 0x88e31000-0x88e63fff] usable =3D=3D>=20
reserved
[    0.025124]TSC deadline timer available
[    0.025125]smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.025143]PM: hibernation: Registered nosave memory: [mem=20
0x00000000-0x00000fff]
[    0.025145]PM: hibernation: Registered nosave memory: [mem=20
0x000a0000-0x000fffff]
[    0.025147]PM: hibernation: Registered nosave memory: [mem=20
0x40000000-0x403fffff]
[    0.025148]PM: hibernation: Registered nosave memory: [mem=20
0x88e31000-0x88e63fff]
[    0.025150]PM: hibernation: Registered nosave memory: [mem=20
0x88f03000-0x88f03fff]
[    0.025152]PM: hibernation: Registered nosave memory: [mem=20
0x8ab42000-0x8ab42fff]
[    0.025153]PM: hibernation: Registered nosave memory: [mem=20
0x8ab43000-0x8ab43fff]
[    0.025155]PM: hibernation: Registered nosave memory: [mem=20
0x8bdf0000-0x8be9efff]
[    0.025155]PM: hibernation: Registered nosave memory: [mem=20
0x8be9f000-0x8bec4fff]
[    0.025156]PM: hibernation: Registered nosave memory: [mem=20
0x8bec5000-0x8befefff]
[    0.025158]PM: hibernation: Registered nosave memory: [mem=20
0x8bf00000-0x8f7fffff]
[    0.025159]PM: hibernation: Registered nosave memory: [mem=20
0x8f800000-0xdfffffff]
[    0.025160]PM: hibernation: Registered nosave memory: [mem=20
0xe0000000-0xefffffff]
[    0.025160]PM: hibernation: Registered nosave memory: [mem=20
0xf0000000-0xfe00ffff]
[    0.025161]PM: hibernation: Registered nosave memory: [mem=20
0xfe010000-0xfe010fff]
[    0.025162]PM: hibernation: Registered nosave memory: [mem=20
0xfe011000-0xffffffff]
[    0.025164][mem 0x8f800000-0xdfffffff] available for PCI devices
[    0.025165]Booting paravirtualized kernel on bare hardware
[    0.025168]clocksource: refined-jiffies: mask: 0xffffffff=20
max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.025175]setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4=20
nr_node_ids:1
[    0.025331]percpu: Embedded 56 pages/cpu s192512 r8192 d28672 u524288
[    0.025337]pcpu-alloc: s192512 r8192 d28672 u524288 alloc=3D1*2097152
[    0.025339]pcpu-alloc: [0] 0 1 2 3
[    0.025369]Built 1 zonelists, mobility grouping on.  Total pages:=20
1012398
[    0.025370]Policy zone: Normal
[    0.025371]Kernel command line:=20
initrd=3D\EFI\Pop_OS-42a72843-c385-422e-ba58-25988f813a20\initrd.img-5.10.1=
7-surface=20
root=3DUUID=3D42a7284
3-c385-422e-ba58-25988f813a20 ro quiet loglevel=3D0=20
systemd.show_status=3Dfalse splash
[    0.025711]Dentry cache hash table entries: 524288 (order: 10,=20
4194304 bytes, linear)
[    0.025824]Inode-cache hash table entries: 262144 (order: 9, 2097152=20
bytes, linear)
[    0.025876]mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.038184]Memory: 3753036K/4113976K available (14345K kernel code,=20
3519K rwdata, 5272K rodata, 2664K init, 5960K bss, 327912K reser
ved, 32768K cma-reserved)
[    0.038192]random: get_random_u64 called from=20
__kmem_cache_create+0x31/0x430 with crng_init=3D1
[    0.038314]SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, No=
des=3D1
[    0.038327]Kernel/User page tables isolation: enabled
[    0.038340]ftrace: allocating 47603 entries in 186 pages
[    0.057081]ftrace: allocated 186 pages with 5 groups
[    0.057186]rcu: Hierarchical RCU implementation.
[    0.057187]rcu:     RCU restricting CPUs from NR_CPUS=3D8192 to=20
nr_cpu_ids=3D4.
[    0.057188] Trampoline variant of Tasks RCU enabled.
[    0.057189] Rude variant of Tasks RCU enabled.
[    0.057190] Tracing variant of Tasks RCU enabled.
[    0.057191]rcu: RCU calculated value of scheduler-enlistment delay=20
is 25 jiffies.
[    0.057191]rcu: Adjusting geometry for rcu_fanout_leaf=3D16,=20
nr_cpu_ids=3D4
[    0.061216]NR_IRQS: 524544, nr_irqs: 1024, preallocated irqs: 16
[    0.061713]random: crng done (trusting CPU's manufacturer)
[    0.061739]Console: colour dummy device 80x25
[    0.061756]printk: console [tty0] enabled
[    0.061775]ACPI: Core revision 20200925
[    0.062031]clocksource: hpet: mask: 0xffffffff max_cycles:=20
0xffffffff, max_idle_ns: 79635855245 ns
[    0.062107]APIC: Switch to symmetric I/O mode setup
[    0.062109]DMAR: Host address width 39
[    0.062110]DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.062117]DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap=20
1c0000c40660462 ecap 7e3ff0505e
[    0.062119]DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.062122]DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap=20
d2008c40660462 ecap f050da
[    0.062123]DMAR: RMRR base: 0x0000008d000000 end: 0x0000008f7fffff
[    0.062126]DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.062127]DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.062128]DMAR-IR: Queued invalidation will be enabled to support=20
x2apic and Intr-remapping.
[    0.063677]DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.063678]x2apic enabled
[    0.063696]Switched APIC routing to cluster x2apic.
[    0.067777]..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-=
1
[    0.086040]clocksource: tsc-early: mask: 0xffffffffffffffff=20
max_cycles: 0x24090c9bc00, max_idle_ns: 440795288559 ns
[    0.086044]Calibrating delay loop (skipped), value calculated using=20
timer frequency.. 4999.90 BogoMIPS (lpj=3D9999808)
[    0.086047]pid_max: default: 32768 minimum: 301
[    0.088614]LSM: Security Framework initializing
[    0.088626]Yama: becoming mindful.
[    0.088651]AppArmor: AppArmor initialized
[    0.088693]Mount-cache hash table entries: 8192 (order: 4, 65536=20
bytes, linear)
[    0.088700]Mountpoint-cache hash table entries: 8192 (order: 4,=20
65536 bytes, linear)
[    0.088987]mce: CPU0: Thermal monitoring enabled (TM1)
[    0.089004]process: using mwait in idle threads
[    0.089006]Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.089007]Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.089010]Spectre V1: Mitigation: usercopy/swapgs barriers and=20
__user pointer sanitization
[    0.089012]Spectre V2: Mitigation: Full generic retpoline
[    0.089013]Spectre V2: Spectre v2 / SpectreRSB mitigation: Filling=20
RSB on context switch
[    0.089013]Spectre V2: Enabling Restricted Speculation for firmware=20
calls
[    0.089015]Spectre V2: mitigation: Enabling conditional Indirect=20
Branch Prediction Barrier
[    0.089016]Spectre V2: User space: Mitigation: STIBP via seccomp and=20
prctl
[    0.089017]Speculative Store Bypass: Mitigation: Speculative Store=20
Bypass disabled via prctl and seccomp
[    0.089019]TAA: Mitigation: Clear CPU buffers
[    0.089022]SRBDS: Mitigation: Microcode
[    0.089023]MDS: Mitigation: Clear CPU buffers
[    0.089310]Freeing SMP alternatives memory: 40K
[    0.091940]smpboot: CPU0: Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz=20
(family: 0x6, model: 0x4e, stepping: 0x3)
[    0.092114]Performance Events: PEBS fmt3+, Skylake events, 32-deep=20
LBR, full-width counters, Intel PMU driver.
[    0.092125]... version:                4
[    0.092126]... bit width:              48
[    0.092127]... generic registers:      4
[    0.092128]... value mask:             0000ffffffffffff
[    0.092128]... max period:             00007fffffffffff
[    0.092129]... fixed-purpose events:   3
[    0.092129]... event mask:             000000070000000f
[    0.092237]rcu: Hierarchical SRCU implementation.
[    0.092960]NMI watchdog: Enabled. Permanently consumes one hw-PMU=20
counter.
[    0.093007]smp: Bringing up secondary CPUs ...
[    0.093105]x86: Booting SMP configuration:
[    0.093106].... node  #0, CPUs:      #1 #2
[    0.094630]MDS CPU bug present and SMT on, data leak possible. See=20
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.ht
ml for more details.
[    0.094630]TAA CPU bug present and SMT on, data leak possible. See=20
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_as
ync_abort.html for more details.
[    0.094630] #3
[    0.094630]smp: Brought up 1 node, 4 CPUs
[    0.094630]smpboot: Max logical packages: 1
[    0.094630]smpboot: Total of 4 processors activated (19999.61=20
BogoMIPS)
[    0.095858]devtmpfs: initialized
[    0.095858]x86/mm: Memory block size: 128MB
[    0.098090]PM: Registering ACPI NVS region [mem=20
0x8ab42000-0x8ab42fff] (4096 bytes)
[    0.098092]PM: Registering ACPI NVS region [mem=20
0x8be9f000-0x8bec4fff] (155648 bytes)
[    0.098167]clocksource: jiffies: mask: 0xffffffff max_cycles:=20
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.098174]futex hash table entries: 1024 (order: 4, 65536 bytes,=20
linear)
[    0.098323]pinctrl core: initialized pinctrl subsystem
[    0.098484]PM: RTC time: 10:57:25, date: 2021-07-27
[    0.098608]NET: Registered protocol family 16
[    0.098728]DMA: preallocated 512 KiB GFP_KERNEL pool for atomic=20
allocations
[    0.098728]DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for=20
atomic allocations
[    0.098728]DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for=20
atomic allocations
[    0.098728]audit: initializing netlink subsys (disabled)
[    0.098728]audit: type=3D2000 audit(1627383445.036:1):=20
state=3Dinitialized audit_enabled=3D0 res=3D1
[    0.098728]thermal_sys: Registered thermal governor 'fair_share'
[    0.098728]thermal_sys: Registered thermal governor 'bang_bang'
[    0.098728]thermal_sys: Registered thermal governor 'step_wise'
[    0.098728]thermal_sys: Registered thermal governor 'user_space'
[    0.098728]thermal_sys: Registered thermal governor 'power_allocator'
[    0.098728]EISA bus registered
[    0.098728]cpuidle: using governor ladder
[    0.098728]cpuidle: using governor menu
[    0.098728]ACPI: bus type PCI registered
[    0.098728]acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.098728]PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem=20
0xe0000000-0xefffffff] (base 0xe0000000)
[    0.098728]PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in=20
E820
[    0.098728]PCI: Using configuration type 1 for base access
[    0.098728]ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.099318]HugeTLB registered 1.00 GiB page size, pre-allocated 0=20
pages
[    0.099318]HugeTLB registered 2.00 MiB page size, pre-allocated 0=20
pages
[    0.102139]ACPI: Added _OSI(Module Device)
[    0.102140]ACPI: Added _OSI(Processor Device)
[    0.102141]ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.102142]ACPI: Added _OSI(Processor Aggregator Device)
[    0.102143]ACPI: Added _OSI(Linux-Dell-Video)
[    0.102144]ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.102145]ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.139799]ACPI: 6 ACPI AML tables successfully acquired and loaded
[    0.142786]ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.146657]ACPI: Dynamic OEM Table Load:
[    0.146667]ACPI: SSDT 0xFFFF972080C02800 000672 (v02 PmRef  Cpu0Ist =20
00003000 INTL 20160422)
[    0.148372]ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[    0.149540]ACPI: Dynamic OEM Table Load:
[    0.149547]ACPI: SSDT 0xFFFF972080E7B000 0003FF (v02 PmRef  Cpu0Cst =20
00003001 INTL 20160422)
[    0.151157]ACPI: Dynamic OEM Table Load:
[    0.151163]ACPI: SSDT 0xFFFF972080BFE180 0000BA (v02 PmRef  Cpu0Hwp =20
00003000 INTL 20160422)
[    0.152659]ACPI: Dynamic OEM Table Load:
[    0.152665]ACPI: SSDT 0xFFFF972080C04000 000628 (v02 PmRef  HwpLvt  =20
00003000 INTL 20160422)
[    0.154647]ACPI: Dynamic OEM Table Load:
[    0.154656]ACPI: SSDT 0xFFFF972080C57000 000D14 (v02 PmRef  ApIst   =20
00003000 INTL 20160422)
[    0.157193]ACPI: Dynamic OEM Table Load:
[    0.157198]ACPI: SSDT 0xFFFF972080E79000 000317 (v02 PmRef  ApHwp   =20
00003000 INTL 20160422)
[    0.158853]ACPI: Dynamic OEM Table Load:
[    0.158859]ACPI: SSDT 0xFFFF972080E7A000 00030A (v02 PmRef  ApCst   =20
00003000 INTL 20160422)
[    0.162012]ACPI: EC: EC started
[    0.162013]ACPI: EC: interrupt blocked
[    0.165162]ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.165164]ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle=20
transactions
[    0.165165]ACPI: Interpreter enabled
[    0.165217]ACPI: (supports S0 S4 S5)
[    0.165218]ACPI: Using IOAPIC for interrupt routing
[    0.165264]PCI: Using host bridge windows from ACPI; if necessary,=20
use "pci=3Dnocrs" and report a bug
[    0.165955]ACPI: Enabled 11 GPEs in block 00 to 7F
[    0.175370]ACPI: Power Resource [PX01] (on)
[    0.175466]ACPI: Power Resource [PX02] (on)
[    0.175551]ACPI: Power Resource [PX03] (on)
[    0.175551]ACPI: Power Resource [PX04] (on)
[    0.175551]ACPI: Power Resource [PX05] (on)
[    0.175551]ACPI: Power Resource [PX06] (on)
[    0.175551]ACPI: Power Resource [PX07] (on)
[    0.176200]ACPI: Power Resource [USBC] (on)
[    0.176425]ACPI: Power Resource [PAUD] (on)
[    0.178991]ACPI: Power Resource [PXP] (off)
[    0.181901]ACPI: Power Resource [PXP] (off)
[    0.182199]ACPI: Power Resource [PRWF] (on)
[    0.192747]ACPI: Power Resource [CAMP] (on)
[    0.198935]ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.198942]acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM=20
ClockPM Segments MSI HPX-Type3]
[    0.202423]acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug=20
SHPCHotplug PME AER PCIeCapability LTR]
[    0.205107]PCI host bridge to bus 0000:00
[    0.205109]pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7=20
window]
[    0.205111]pci_bus 0000:00: root bus resource [io  0x0d00-0xffff=20
window]
[    0.205112]pci_bus 0000:00: root bus resource [mem=20
0x000a0000-0x000bffff window]
[    0.205113]pci_bus 0000:00: root bus resource [mem=20
0x000c0000-0x000c3fff window]
[    0.205114]pci_bus 0000:00: root bus resource [mem=20
0x000c4000-0x000c7fff window]
[    0.205116]pci_bus 0000:00: root bus resource [mem=20
0x000c8000-0x000cbfff window]
[    0.205117]pci_bus 0000:00: root bus resource [mem=20
0x000cc000-0x000cffff window]
[    0.205118]pci_bus 0000:00: root bus resource [mem=20
0x000d0000-0x000d3fff window]
[    0.205119]pci_bus 0000:00: root bus resource [mem=20
0x000d4000-0x000d7fff window]
[    0.205120]pci_bus 0000:00: root bus resource [mem=20
0x000d8000-0x000dbfff window]
[    0.205121]pci_bus 0000:00: root bus resource [mem=20
0x000dc000-0x000dffff window]
[    0.205122]pci_bus 0000:00: root bus resource [mem=20
0x000e0000-0x000e3fff window]
[    0.205123]pci_bus 0000:00: root bus resource [mem=20
0x000e4000-0x000e7fff window]
[    0.205125]pci_bus 0000:00: root bus resource [mem=20
0x000e8000-0x000ebfff window]
[    0.205127]pci_bus 0000:00: root bus resource [mem=20
0x000ec000-0x000effff window]
[    0.205128]pci_bus 0000:00: root bus resource [mem=20
0x000f0000-0x000fffff window]
[    0.205130]pci_bus 0000:00: root bus resource [mem=20
0x8f800000-0xdfffffff window]
[    0.205131]pci_bus 0000:00: root bus resource [mem=20
0xfd000000-0xfe7fffff window]
[    0.205132]pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.205150]pci 0000:00:00.0: [8086:1904] type 00 class 0x060000
[    0.206162]pci 0000:00:02.0: [8086:1916] type 00 class 0x030000
[    0.206172]pci 0000:00:02.0: reg 0x10: [mem 0xa0000000-0xa0ffffff=20
64bit]
[    0.206178]pci 0000:00:02.0: reg 0x18: [mem 0x90000000-0x9fffffff=20
64bit pref]
[    0.206182]pci 0000:00:02.0: reg 0x20: [io  0x4000-0x403f]
[    0.206199]pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.207245]pci 0000:00:05.0: [8086:1919] type 00 class 0x048000
[    0.207255]pci 0000:00:05.0: reg 0x10: [mem 0xa1000000-0xa13fffff=20
64bit]
[    0.208285]pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
[    0.208294]pci 0000:00:08.0: reg 0x10: [mem 0xa1738000-0xa1738fff=20
64bit]
[    0.209336]pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.209357]pci 0000:00:14.0: reg 0x10: [mem 0xa1700000-0xa170ffff=20
64bit]
[    0.209427]pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.210543]pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.210564]pci 0000:00:14.2: reg 0x10: [mem 0xa1739000-0xa1739fff=20
64bit]
[    0.211668]pci 0000:00:14.3: [8086:9d32] type 00 class 0x048000
[    0.211757]pci 0000:00:14.3: reg 0x10: [mem 0xa1710000-0xa171ffff=20
64bit]
[    0.213263]pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[    0.213471]pci 0000:00:15.0: reg 0x10: [mem 0xa173a000-0xa173afff=20
64bit]
[    0.215475]pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[    0.215684]pci 0000:00:15.1: reg 0x10: [mem 0xa173b000-0xa173bfff=20
64bit]
[    0.217690]pci 0000:00:15.2: [8086:9d62] type 00 class 0x118000
[    0.217899]pci 0000:00:15.2: reg 0x10: [mem 0xa173c000-0xa173cfff=20
64bit]
[    0.219893]pci 0000:00:15.3: [8086:9d63] type 00 class 0x118000
[    0.220101]pci 0000:00:15.3: reg 0x10: [mem 0xa173d000-0xa173dfff=20
64bit]
[    0.221979]pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.222003]pci 0000:00:16.0: reg 0x10: [mem 0xa173e000-0xa173efff=20
64bit]
[    0.222083]pci 0000:00:16.0: PME# supported from D3hot
[    0.223152]pci 0000:00:16.4: [8086:9d3e] type 00 class 0x078000
[    0.223176]pci 0000:00:16.4: reg 0x10: [mem 0xa173f000-0xa173ffff=20
64bit]
[    0.223254]pci 0000:00:16.4: PME# supported from D3hot
[    0.224269]pci 0000:00:1c.0: [8086:9d14] type 01 class 0x060400
[    0.224357]pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.225493]pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
[    0.225581]pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.226714]pci 0000:00:1f.0: [8086:9d48] type 00 class 0x060100
[    0.227854]pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.227869]pci 0000:00:1f.2: reg 0x10: [mem 0xa1734000-0xa1737fff]
[    0.228949]pci 0000:00:1f.3: [8086:9d70] type 00 class 0x040380
[    0.228972]pci 0000:00:1f.3: reg 0x10: [mem 0xa1730000-0xa1733fff=20
64bit]
[    0.229000]pci 0000:00:1f.3: reg 0x20: [mem 0xa1720000-0xa172ffff=20
64bit]
[    0.229051]pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.230294]pci 0000:01:00.0: [144d:a802] type 00 class 0x010802
[    0.230315]pci 0000:01:00.0: reg 0x10: [mem 0xa1600000-0xa1603fff=20
64bit]
[    0.230324]pci 0000:01:00.0: reg 0x18: [io  0x3000-0x30ff]
[    0.230493]pci 0000:01:00.0: 15.752 Gb/s available PCIe bandwidth,=20
limited by 8.0 GT/s PCIe x2 link at 0000:00:1c.0 (capable of 31.5
04 Gb/s with 8.0 GT/s PCIe x4 link)
[    0.230570]pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.230573]pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.230576]pci 0000:00:1c.0:   bridge window [mem=20
0xa1600000-0xa16fffff]
[    0.230737]pci 0000:02:00.0: [11ab:2b38] type 00 class 0x020000
[    0.230767]pci 0000:02:00.0: reg 0x10: [mem 0xa1500000-0xa15fffff=20
64bit pref]
[    0.230786]pci 0000:02:00.0: reg 0x18: [mem 0xa1400000-0xa14fffff=20
64bit pref]
[    0.230938]pci 0000:02:00.0: supports D1 D2
[    0.230939]pci 0000:02:00.0: PME# supported from D0 D1 D3hot D3cold
[    0.231227]pci 0000:00:1d.0: PCI bridge to [bus 02]
[    0.231235]pci 0000:00:1d.0:   bridge window [mem=20
0xa1400000-0xa15fffff 64bit pref]
[    0.236333]ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12=20
14 15)
[    0.236422]ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12=20
14 15)
[    0.236506]ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12=20
14 15)
[    0.236590]ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12=20
14 15)
[    0.236673]ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12=20
14 15)
[    0.236756]ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12=20
14 15)
[    0.236839]ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12=20
14 15)
[    0.236922]ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12=20
14 15)
[    0.246378]ACPI Warning: GPE type mismatch (level/edge)=20
(20200925/evxface-791)
[    0.246402]ACPI: EC: interrupt unblocked
[    0.246403]ACPI: EC: event unblocked
[    0.246418]ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.246418]ACPI: EC: GPE=3D0x50
[    0.246420]ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization=20
complete
[    0.246422]ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle=20
transactions and events
[    0.246525]iommu: Default domain type: Translated
[    0.246525]pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.246525]pci 0000:00:02.0: vgaarb: VGA device added:=20
decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
[    0.246525]pci 0000:00:02.0: vgaarb: bridge control possible
[    0.246525]vgaarb: loaded
[    0.246525]SCSI subsystem initialized
[    0.246525]libata version 3.00 loaded.
[    0.246525]ACPI: bus type USB registered
[    0.246525]usbcore: registered new interface driver usbfs
[    0.246525]usbcore: registered new interface driver hub
[    0.246525]usbcore: registered new device driver usb
[    0.246525]pps_core: LinuxPPS API ver. 1 registered
[    0.246525]pps_core: Software ver. 5.3.6 - Copyright 2005-2007=20
Rodolfo Giometti <giometti@linux.it>
[    0.246525]PTP clock support registered
[    0.246525]EDAC MC: Ver: 3.0.0
[    0.246525]Registered efivars operations
[    0.246525]NetLabel: Initializing
[    0.246525]NetLabel:  domain hash size =3D 128
[    0.246525]NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.246525]NetLabel:  unlabeled traffic allowed by default
[    0.246525]PCI: Using ACPI for IRQ routing
[    0.281816]PCI: pci_cache_line_size set to 64 bytes
[    0.282218]e820: reserve RAM buffer [mem 0x88e31000-0x8bffffff]
[    0.282220]e820: reserve RAM buffer [mem 0x88f03000-0x8bffffff]
[    0.282221]e820: reserve RAM buffer [mem 0x8ab42000-0x8bffffff]
[    0.282222]e820: reserve RAM buffer [mem 0x8bdf0000-0x8bffffff]
[    0.282223]e820: reserve RAM buffer [mem 0x8bf00000-0x8bffffff]
[    0.282224]e820: reserve RAM buffer [mem 0x16f800000-0x16fffffff]
[    0.283283]hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.283291]hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.290043]clocksource: Switched to clocksource tsc-early
[    0.306328]VFS: Disk quotas dquot_6.6.0
[    0.306344]VFS: Dquot-cache hash table entries: 512 (order 0, 4096=20
bytes)
[    0.306455]AppArmor: AppArmor Filesystem Enabled
[    0.306493]pnp: PnP ACPI init
[    0.306641]system 00:00: [mem 0x40000000-0x403fffff] has been=20
reserved
[    0.306647]system 00:00: Plug and Play ACPI device, IDs PNP0c02=20
(active)
[    0.307957]system 00:01: [mem 0xfd000000-0xfdabffff] has been=20
reserved
[    0.307959]system 00:01: [mem 0xfdad0000-0xfdadffff] has been=20
reserved
[    0.307960]system 00:01: [mem 0xfdb00000-0xfdffffff] has been=20
reserved
[    0.307962]system 00:01: [mem 0xfe000000-0xfe01ffff] could not be=20
reserved
[    0.307963]system 00:01: [mem 0xfe036000-0xfe03bfff] has been=20
reserved
[    0.307965]system 00:01: [mem 0xfe03d000-0xfe3fffff] has been=20
reserved
[    0.307966]system 00:01: [mem 0xfe410000-0xfe7fffff] has been=20
reserved
[    0.307970]system 00:01: Plug and Play ACPI device, IDs PNP0c02=20
(active)
[    0.337541]system 00:02: [io  0x2000-0x20fe] has been reserved
[    0.337546]system 00:02: Plug and Play ACPI device, IDs PNP0c02=20
(active)
[    0.351784]system 00:03: [io  0x0680-0x069f] has been reserved
[    0.351785]system 00:03: [io  0xffff] has been reserved
[    0.351787]system 00:03: [io  0xffff] has been reserved
[    0.351788]system 00:03: [io  0xffff] has been reserved
[    0.351789]system 00:03: [io  0x1800-0x18fe] has been reserved
[    0.351790]system 00:03: [io  0x164e-0x164f] has been reserved
[    0.351794]system 00:03: Plug and Play ACPI device, IDs PNP0c02=20
(active)
[    0.356685]pnp 00:04: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.356730]system 00:05: [io  0x1854-0x1857] has been reserved
[    0.356734]system 00:05: Plug and Play ACPI device, IDs INT3f0d=20
PNP0c02 (active)
[    0.452883]system 00:06: [mem 0xfe020000-0xfe021fff] has been=20
reserved
[    0.452885]system 00:06: [mem 0xfe022000-0xfe023fff] has been=20
reserved
[    0.452887]system 00:06: [mem 0xfe024000-0xfe025fff] has been=20
reserved
[    0.452888]system 00:06: [mem 0xfe026000-0xfe027fff] has been=20
reserved
[    0.452889]system 00:06: [mem 0xfe028000-0xfe029fff] has been=20
reserved
[    0.452891]system 00:06: [mem 0xfe02a000-0xfe02bfff] has been=20
reserved
[    0.452892]system 00:06: [mem 0xfe02c000-0xfe02dfff] has been=20
reserved
[    0.452893]system 00:06: [mem 0xfe02e000-0xfe02ffff] has been=20
reserved
[    0.452895]system 00:06: [mem 0xfe030000-0xfe031fff] has been=20
reserved
[    0.452896]system 00:06: [mem 0xfe032000-0xfe033fff] has been=20
reserved
[    0.452898]system 00:06: [mem 0xfe034000-0xfe035fff] has been=20
reserved
[    0.452902]system 00:06: Plug and Play ACPI device, IDs PNP0c02=20
(active)
[    0.498708]system 00:07: [mem 0xfed10000-0xfed17fff] has been=20
reserved
[    0.498710]system 00:07: [mem 0xfed18000-0xfed18fff] has been=20
reserved
[    0.498711]system 00:07: [mem 0xfed19000-0xfed19fff] has been=20
reserved
[    0.498714]system 00:07: [mem 0xe0000000-0xefffffff] has been=20
reserved
[    0.498715]system 00:07: [mem 0xfed20000-0xfed3ffff] has been=20
reserved
[    0.498717]system 00:07: [mem 0xfed90000-0xfed93fff] could not be=20
reserved
[    0.498718]system 00:07: [mem 0xfed45000-0xfed8ffff] has been=20
reserved
[    0.498722]system 00:07: [mem 0xff000000-0xffffffff] has been=20
reserved
[    0.498723]system 00:07: [mem 0xfee00000-0xfeefffff] has been=20
reserved
[    0.498725]system 00:07: [mem 0x8f800000-0x8f81ffff] has been=20
reserved
[    0.498729]system 00:07: Plug and Play ACPI device, IDs PNP0c02=20
(active)
[    0.520548]pnp: PnP ACPI: found 8 devices
[    0.526371]clocksource: acpi_pm: mask: 0xffffff max_cycles:=20
0xffffff, max_idle_ns: 2085701024 ns
[    0.526449]NET: Registered protocol family 2
[    0.526616]tcp_listen_portaddr_hash hash table entries: 2048 (order:=20
3, 32768 bytes, linear)
[    0.526640]TCP established hash table entries: 32768 (order: 6,=20
262144 bytes, linear)
[    0.526713]TCP bind hash table entries: 32768 (order: 7, 524288=20
bytes, linear)
[    0.526780]TCP: Hash tables configured (established 32768 bind 32768)
[    0.526843]MPTCP token hash table entries: 4096 (order: 4, 98304=20
bytes, linear)
[    0.526874]UDP hash table entries: 2048 (order: 4, 65536 bytes,=20
linear)
[    0.526892]UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes,=20
linear)
[    0.526934]NET: Registered protocol family 1
[    0.526941]NET: Registered protocol family 44
[    0.526955]pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.526960]pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.526969]pci 0000:00:1c.0:   bridge window [mem=20
0xa1600000-0xa16fffff]
[    0.526988]pci 0000:00:1d.0: PCI bridge to [bus 02]
[    0.527002]pci 0000:00:1d.0:   bridge window [mem=20
0xa1400000-0xa15fffff 64bit pref]
[    0.527014]pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.527015]pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.527017]pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff=20
window]
[    0.527018]pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff=20
window]
[    0.527020]pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff=20
window]
[    0.527021]pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff=20
window]
[    0.527022]pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff=20
window]
[    0.527024]pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff=20
window]
[    0.527025]pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff=20
window]
[    0.527027]pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff=20
window]
[    0.527028]pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff=20
window]
[    0.527029]pci_bus 0000:00: resource 15 [mem 0x000e0000-0x000e3fff=20
window]
[    0.527031]pci_bus 0000:00: resource 16 [mem 0x000e4000-0x000e7fff=20
window]
[    0.527032]pci_bus 0000:00: resource 17 [mem 0x000e8000-0x000ebfff=20
window]
[    0.527033]pci_bus 0000:00: resource 18 [mem 0x000ec000-0x000effff=20
window]
[    0.527035]pci_bus 0000:00: resource 19 [mem 0x000f0000-0x000fffff=20
window]
[    0.527036]pci_bus 0000:00: resource 20 [mem 0x8f800000-0xdfffffff=20
window]
[    0.527037]pci_bus 0000:00: resource 21 [mem 0xfd000000-0xfe7fffff=20
window]
[    0.527039]pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
[    0.527040]pci_bus 0000:01: resource 1 [mem 0xa1600000-0xa16fffff]
[    0.527042]pci_bus 0000:02: resource 2 [mem 0xa1400000-0xa15fffff=20
64bit pref]
[    0.527246]pci 0000:00:02.0: Video device with shadowed ROM at [mem=20
0x000c0000-0x000dffff]
[    0.527917]PCI: CLS 0 bytes, default 64
[    0.527980]Trying to unpack rootfs image as initramfs...
[    0.775330]Freeing initrd memory: 96644K
[    0.775409]PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.775411]software IO TLB: mapped [mem=20
0x0000000082da8000-0x0000000086da8000] (64MB)
[    0.775641]check: Scanning for low memory corruption every 60 seconds
[    0.776061]Initialise system trusted keyrings
[    0.776073]Key type blacklist registered
[    0.776111]workingset: timestamp_bits=3D36 max_order=3D20 bucket_order=
=3D0
[    0.777250]zbud: loaded
[    0.777514]squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.777637]fuse: init (API version 7.32)
[    0.777772]integrity: Platform Keyring initialized
[    0.787424]Key type asymmetric registered
[    0.787426]Asymmetric key parser 'x509' registered
[    0.787435]Block layer SCSI generic (bsg) driver version 0.4 loaded=20
(major 243)
[    0.787462]io scheduler mq-deadline registered
[    0.834426]pcieport 0000:00:1c.0: PME: Signaling with IRQ 122
[    0.886387]pcieport 0000:00:1d.0: PME: Signaling with IRQ 123
[    0.886482]shpchp: Standard Hot Plug PCI Controller Driver version:=20
0.4
[    0.886539]efifb: probing for efifb
[    0.886552]efifb: showing boot graphics
[    0.887974]efifb: framebuffer at 0x90000000, using 19496k, total=20
19494k
[    0.887975]efifb: mode is 2736x1824x32, linelength=3D10944, pages=3D1
[    0.887976]efifb: scrolling: redraw
[    0.887977]efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.888017]fbcon: Deferring console take-over
[    0.888018]fb0: EFI VGA frame buffer device
[    0.888025]intel_idle: MWAIT substates: 0x11142120
[    0.888026]intel_idle: v0.5.1 model 0x4E
[    0.888273]intel_idle: Local APIC timer is reliable in all C-states
[    0.889651]ACPI: AC Adapter [ADP1] (on-line)
[    0.889771]input: Lid Switch as=20
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[    0.889789]ACPI: Lid Switch [LID0]
[    0.902529]thermal LNXTHERM:00: registered as thermal_zone0
[    0.902531]ACPI: Thermal Zone [TZ00] (31 C)
[    0.916484]thermal LNXTHERM:01: registered as thermal_zone1
[    0.916486]ACPI: Thermal Zone [TZ01] (0 C)
[    0.927151]thermal LNXTHERM:02: registered as thermal_zone2
[    0.927153]ACPI: Thermal Zone [TZ02] (26 C)
[    0.938688]thermal LNXTHERM:03: registered as thermal_zone3
[    0.938689]ACPI: Thermal Zone [TZ03] (25 C)
[    0.938978]Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.944546]Linux agpgart interface v0.103
[    0.962259]tpm_tis IFX0562:00: 2.0 TPM (device-id 0x1A, rev-id 16)
[    1.069511]loop: module loaded
[    1.069870]libphy: Fixed MDIO Bus: probed
[    1.069871]tun: Universal TUN/TAP device driver, 1.6
[    1.069898]PPP generic driver version 2.4.2
[    1.069941]VFIO - User Level meta-driver version: 0.3
[    1.070244]ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.070247]ehci-pci: EHCI PCI platform driver
[    1.070260]ehci-platform: EHCI generic platform driver
[    1.070277]ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.070279]ohci-pci: OHCI PCI platform driver
[    1.070288]ohci-platform: OHCI generic platform driver
[    1.070301]uhci_hcd: USB Universal Host Controller Interface driver
[    1.070358]i8042: PNP: No PS/2 controller found.
[    1.070463]rtc_cmos 00:04: RTC can wake from S4
[    1.071046]rtc_cmos 00:04: registered as rtc0
[    1.071177]rtc_cmos 00:04: setting system clock to=20
2021-07-27T10:57:26 UTC (1627383446)
[    1.071198]rtc_cmos 00:04: alarms up to one month, y3k, 242 bytes=20
nvram, hpet irqs
[    1.071252]device-mapper: uevent: version 1.0.3
[    1.071318]device-mapper: ioctl: 4.43.0-ioctl (2020-10-01)=20
initialised: dm-devel@redhat.com
[    1.071346]platform eisa.0: Probing EISA bus 0
[    1.071349]platform eisa.0: EISA: Cannot allocate resource for=20
mainboard
[    1.071351]platform eisa.0: Cannot allocate resource for EISA slot 1
[    1.071352]platform eisa.0: Cannot allocate resource for EISA slot 2
[    1.071353]platform eisa.0: Cannot allocate resource for EISA slot 3
[    1.071354]platform eisa.0: Cannot allocate resource for EISA slot 4
[    1.071356]platform eisa.0: Cannot allocate resource for EISA slot 5
[    1.071357]platform eisa.0: Cannot allocate resource for EISA slot 6
[    1.071358]platform eisa.0: Cannot allocate resource for EISA slot 7
[    1.071359]platform eisa.0: Cannot allocate resource for EISA slot 8
[    1.071361]platform eisa.0: EISA: Detected 0 cards
[    1.071364]intel_pstate: Intel P-state driver initializing
[    1.072050]intel_pstate: HWP enabled
[    1.072257]ledtrig-cpu: registered to indicate activity on CPUs
[    1.072259]EFI Variables Facility v0.08 2004-May-17
[    1.091777]battery: ACPI: Battery Slot [BAT1] (battery present)
[    1.095847]intel_pmc_core INT33A1:00:  initialized
[    1.095916]drop_monitor: Initializing network drop monitor service
[    1.096049]NET: Registered protocol family 10
[    1.101144]Segment Routing with IPv6
[    1.101166]NET: Registered protocol family 17
[    1.101196]Key type dns_resolver registered
[    1.101430]microcode: sig=3D0x406e3, pf=3D0x80, revision=3D0xea
[    1.101464]microcode: Microcode Update Driver: v2.2.
[    1.101468]IPI shorthand broadcast: enabled
[    1.101475]sched_clock: Marking stable (1100974252,=20
486043)->(1103956934, -2496639)
[    1.101559]registered taskstats version 1
[    1.101574]Loading compiled-in X.509 certificates
[    1.102162]Loaded X.509 cert 'Build time autogenerated kernel key:=20
78c087fff7762bc7d7aa17c86f3b971aceb33f73'
[    1.102181]zswap: loaded using pool lzo/zbud
[    1.102354]Key type ._fscrypt registered
[    1.102355]Key type .fscrypt registered
[    1.102356]Key type fscrypt-provisioning registered
[    1.102394]Key type trusted registered
[    1.104990]Key type encrypted registered
[    1.104994]AppArmor: AppArmor sha1 policy hashing enabled
[    1.105599]ima: Allocated hash algorithm: sha1
[    1.166337]ima: No architecture policies found
[    1.166377]evm: Initialising EVM extended attributes:
[    1.166380]evm: security.selinux
[    1.166381]evm: security.SMACK64
[    1.166383]evm: security.SMACK64EXEC
[    1.166384]evm: security.SMACK64TRANSMUTE
[    1.166386]evm: security.SMACK64MMAP
[    1.166388]evm: security.apparmor
[    1.166389]evm: security.ima
[    1.166391]evm: security.capability
[    1.166393]evm: HMAC attrs: 0x1
[    1.169094]PM:   Magic number: 13:537:983
[    1.169698]RAS: Correctable Errors collector initialized.
[    1.172394]Freeing unused decrypted memory: 2036K
[    1.173172]Freeing unused kernel image (initmem) memory: 2664K
[    1.173237]Write protecting the kernel read-only data: 22528k
[    1.174348]Freeing unused kernel image (text/rodata gap) memory:=20
2036K
[    1.174824]Freeing unused kernel image (rodata/data gap) memory: 872K
[    1.253648]x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.253649]x86/mm: Checking user space page tables
[    1.303828]x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.303833]Run /init as init process
[    1.303834]  with arguments:
[    1.303835]    /init
[    1.303835]    splash
[    1.303836]  with environment:
[    1.303836]    HOME=3D/
[    1.303837]    TERM=3Dlinux
[    1.424825]cryptd: max_cpu_qlen set to 1000
[    1.425197]hid: raw HID events driver (C) Jiri Kosina
[    1.429687]xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.429694]xhci_hcd 0000:00:14.0: new USB bus registered, assigned=20
bus number 1
[    1.430784]xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version=20
0x100 quirks 0x0000000081109810
[    1.431047]xhci_hcd 0000:00:14.0: cache line size of 64 is not=20
supported
[    1.431917]AVX2 version of gcm_enc/dec engaged.
[    1.431918]AES CTR mode by8 optimization enabled
[    1.437111]intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    1.437447]idma64 idma64.0: Found Intel integrated DMA 64-bit
[    1.439027]usb usb1: New USB device found, idVendor=3D1d6b,=20
idProduct=3D0002, bcdDevice=3D 5.10
[    1.439030]usb usb1: New USB device strings: Mfr=3D3, Product=3D2,=20
SerialNumber=3D1
[    1.439032]usb usb1: Product: xHCI Host Controller
[    1.439033]usb usb1: Manufacturer: Linux 5.10.17-surface xhci-hcd
[    1.439035]usb usb1: SerialNumber: 0000:00:14.0
[    1.439480]hub 1-0:1.0: USB hub found
[    1.439503]hub 1-0:1.0: 12 ports detected
[    1.445386]xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.445391]xhci_hcd 0000:00:14.0: new USB bus registered, assigned=20
bus number 2
[    1.445395]xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    1.445991]usb usb2: New USB device found, idVendor=3D1d6b,=20
idProduct=3D0003, bcdDevice=3D 5.10
[    1.445993]usb usb2: New USB device strings: Mfr=3D3, Product=3D2,=20
SerialNumber=3D1
[    1.445996]usb usb2: Product: xHCI Host Controller
[    1.445997]usb usb2: Manufacturer: Linux 5.10.17-surface xhci-hcd
[    1.445998]usb usb2: SerialNumber: 0000:00:14.0
[    1.450430]hub 2-0:1.0: USB hub found
[    1.450451]hub 2-0:1.0: 6 ports detected
[    1.451696]intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    1.452048]nvme nvme0: pci function 0000:01:00.0
[    1.452236]idma64 idma64.1: Found Intel integrated DMA 64-bit
[    1.458689]intel-lpss 0000:00:15.2: enabling device (0000 -> 0002)
[    1.459002]idma64 idma64.2: Found Intel integrated DMA 64-bit
[    1.459303]intel-lpss 0000:00:15.3: enabling device (0000 -> 0002)
[    1.459559]idma64 idma64.3: Found Intel integrated DMA 64-bit
[    1.462432]nvme nvme0: 4/0/0 default/read/poll queues
[    1.464077] nvme0n1: p1 p2 p3 p4
[    1.538109]i2c_hid i2c-MSHW0030:00: supply vdd not found, using=20
dummy regulator
[    1.538232]i2c_hid i2c-MSHW0030:00: supply vddl not found, using=20
dummy regulator
[    1.613224]checking generic (90000000 130a000) vs hw (a0000000=20
1000000)
[    1.613225]checking generic (90000000 130a000) vs hw (90000000=20
10000000)
[    1.613226]fb0: switching to inteldrmfb from EFI VGA
[    1.613282]i915 0000:00:02.0: vgaarb: deactivate vga console
[    1.616344]i915 0000:00:02.0: vgaarb: changed VGA decodes:=20
olddecodes=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
[    1.616806]i915 0000:00:02.0: [drm] Finished loading DMC firmware=20
i915/skl_dmc_ver1_27.bin (v1.27)
[    1.640057][drm] Initialized i915 1.6.0 20200917 for 0000:00:02.0 on=20
minor 0
[    1.642662]ACPI: Video Device [GFX0] (multi-head: yes  rom: no =20
post: no)
[    1.643012]input: Video Bus as=20
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input1
[    1.655435]fbcon: i915drmfb (fb0) is primary device
[    1.655437]fbcon: Deferring console take-over
[    1.655441]i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer=20
device
[    1.752331]hid-generic 0018:045E:0915.0001: hidraw0: I2C HID v1.00=20
Device [MSHW0030:00 045E:0915] on i2c-MSHW0030:00
[    1.782127]usb 1-7: new full-speed USB device number 2 using xhci_hcd
[    1.790126]tsc: Refined TSC clocksource calibration: 2495.999 MHz
[    1.790140]clocksource: tsc: mask: 0xffffffffffffffff max_cycles:=20
0x23fa763a3d1, max_idle_ns: 440795313647 ns
[    1.790171]clocksource: Switched to clocksource tsc
[    1.931445]usb 1-7: New USB device found, idVendor=3D045e,=20
idProduct=3D07e8, bcdDevice=3D 2.07
[    1.931447]usb 1-7: New USB device strings: Mfr=3D1, Product=3D2,=20
SerialNumber=3D0
[    1.931448]usb 1-7: Product: Surface Type Cover
[    1.931449]usb 1-7: Manufacturer: Microsoft
[    1.937746]input: Microsoft Surface Type Cover Keyboard as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/inp
ut/input2
[    1.938048]raid6: avx2x4   gen() 31473 MB/s
[    1.994166]input: Microsoft Surface Type Cover Mouse as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/input=
/
input3
[    1.994222]input: Microsoft Surface Type Cover Consumer Control as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.
0002/input/input4
[    1.994265]input: Microsoft Surface Type Cover as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/input=
/input5
[    1.994304]input: Microsoft Surface Type Cover Touchpad as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/inp
ut/input6
[    1.994343]input: Microsoft Surface Type Cover as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/input=
/input7
[    1.994380]input: Microsoft Surface Type Cover as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/input=
/input8
[    1.994416]input: Microsoft Surface Type Cover as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/input=
/input9
[    1.994485]hid-generic 0003:045E:07E8.0002: input,hiddev0,hidraw0:=20
USB HID v1.11 Keyboard [Microsoft Surface Type Cover] on usb-0000
:00:14.0-7/input0
[    1.994511]usbcore: registered new interface driver usbhid
[    1.994512]usbhid: USB HID core driver
[    2.006084]raid6: avx2x4   xor() 15312 MB/s
[    2.074086]raid6: avx2x2   gen() 32409 MB/s
[    2.142081]raid6: avx2x2   xor() 19021 MB/s
[    2.210085]raid6: avx2x1   gen() 27643 MB/s
[    2.278084]raid6: avx2x1   xor() 15231 MB/s
[    2.346082]raid6: sse2x4   gen() 13506 MB/s
[    2.414082]raid6: sse2x4   xor()  7802 MB/s
[    2.482085]raid6: sse2x2   gen() 13662 MB/s
[    2.550083]raid6: sse2x2   xor()  8315 MB/s
[    2.618084]raid6: sse2x1   gen() 11528 MB/s
[    2.686083]raid6: sse2x1   xor()  5884 MB/s
[    2.686084]raid6: using algorithm avx2x2 gen() 32409 MB/s
[    2.686085]raid6: .... xor() 19021 MB/s, rmw enabled
[    2.686086]raid6: using avx2x2 recovery algorithm
[    2.687023]xor: automatically using best checksumming function   avx
[    2.687733]async_tx: api initialized (async)
[   12.202312]usb 1-1: new high-speed USB device number 3 using xhci_hcd
[   12.351838]usb 1-1: New USB device found, idVendor=3D054c,=20
idProduct=3D0b8c, bcdDevice=3D 1.00
[   12.351844]usb 1-1: New USB device strings: Mfr=3D2, Product=3D3,=20
SerialNumber=3D4
[   12.351847]usb 1-1: Product: WALKMAN
[   12.351850]usb 1-1: Manufacturer: Sony
[   12.351852]usb 1-1: SerialNumber: 10458B55477916
[   36.849562]EXT4-fs (dm-1): mounted filesystem with ordered data=20
mode. Opts: (null)
[   37.091396]systemd[1]: Inserted module 'autofs4'
[   37.140225]systemd[1]: Successfully credited entropy passed from=20
boot loader.
[   37.143659]systemd[1]: systemd=20
247.3-3ubuntu3.4pop0~1626806865~21.04~19f7a6d running in system mode.=20
(+PAM +AUDIT +SELINUX +IMA +APP
ARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ=20
+LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 defaul
t-hierarchy=3Dhybrid)
[   37.162213]systemd[1]: Detected architecture x86-64.
[   37.180029]systemd[1]: Set hostname to <bunpad>.
[   37.340538]systemd[1]:=20
/lib/systemd/system/plymouth-start.service:17: Unit configured to use=20
KillMode=3Dnone. This is unsafe, as it di
sables systemd's process lifecycle management for the service. Please=20
update your service to use a safer KillMode=3D, such as 'mixed' or '
control-group'. Support for KillMode=3Dnone is deprecated and will=20
eventually be removed.
[   37.370222]systemd[1]: Configuration file=20
/etc/systemd/system/piavpn.service is marked executable. Please remove=20
executable permissi
on bits. Proceeding anyway.
[   37.380436]systemd[1]: Queued start job for default target Graphical=20
Interface.
[   37.387194]systemd[1]: Created slice system-modprobe.slice.
[   37.387482]systemd[1]: Created slice Cryptsetup Units Slice.
[   37.387696]systemd[1]: Created slice User and Session Slice.
[   37.387762]systemd[1]: Started Forward Password Requests to Wall=20
Directory Watch.
[   37.387903]systemd[1]: Set up automount Arbitrary Executable File=20
Formats File System Automount Point.
[   37.387978]systemd[1]: Reached target User and Group Name Lookups.
[   37.387997]systemd[1]: Reached target Remote File Systems.
[   37.388006]systemd[1]: Reached target Slices.
[   37.388087]systemd[1]: Listening on Device-mapper event daemon FIFOs.
[   37.388174]systemd[1]: Listening on LVM2 poll daemon socket.
[   37.388245]systemd[1]: Listening on Syslog Socket.
[   37.388290]systemd[1]: Listening on initctl Compatibility Named Pipe.
[   37.388456]systemd[1]: Listening on Journal Audit Socket.
[   37.388535]systemd[1]: Listening on Journal Socket (/dev/log).
[   37.388628]systemd[1]: Listening on Journal Socket.
[   37.388739]systemd[1]: Listening on udev Control Socket.
[   37.388823]systemd[1]: Listening on udev Kernel Socket.
[   37.389542]systemd[1]: Mounting Huge Pages File System...
[   37.390303]systemd[1]: Mounting POSIX Message Queue File System...
[   37.391603]systemd[1]: Mounting Kernel Debug File System...
[   37.392671]systemd[1]: Mounting Kernel Trace File System...
[   37.394322]systemd[1]: Starting Journal Service...
[   37.394665]systemd[1]: Finished Availability of block devices.
[   37.396134]systemd[1]: Starting Set the console keyboard layout...
[   37.397459]systemd[1]: Starting Create list of static device nodes=20
for the current kernel...
[   37.398466]systemd[1]: Starting Monitoring of LVM2 mirrors,=20
snapshots etc. using dmeventd or progress polling...
[   37.399724]systemd[1]: Starting Load Kernel Module configfs...
[   37.400852]systemd[1]: Starting Load Kernel Module drm...
[   37.404438]systemd[1]: Starting Load Kernel Module fuse...
[   37.405980]systemd[1]: Started Nameserver information manager.
[   37.406164]systemd[1]: Reached target Network (Pre).
[   37.406691]systemd[1]: Condition check resulted in Set Up Additional=20
Binary Formats being skipped.
[   37.409963]systemd[1]: Starting Load Kernel Modules...
[   37.410997]systemd[1]: Starting Remount Root and Kernel File=20
Systems...
[   37.412178]systemd[1]: Starting Coldplug All udev Devices...
[   37.413285]systemd[1]: Starting Uncomplicated firewall...
[   37.416002]systemd[1]: Mounted Huge Pages File System.
[   37.416208]systemd[1]: Mounted POSIX Message Queue File System.
[   37.416372]systemd[1]: Mounted Kernel Debug File System.
[   37.416518]systemd[1]: Mounted Kernel Trace File System.
[   37.417208]systemd[1]: Finished Create list of static device nodes=20
for the current kernel.
[   37.417515]systemd[1]: modprobe@configfs.service: Succeeded.
[   37.417930]systemd[1]: Finished Load Kernel Module configfs.
[   37.419305]systemd[1]: modprobe@drm.service: Succeeded.
[   37.419769]systemd[1]: Finished Load Kernel Module drm.
[   37.420445]systemd[1]: modprobe@fuse.service: Succeeded.
[   37.420877]systemd[1]: Finished Load Kernel Module fuse.
[   37.422337]systemd[1]: Mounting FUSE Control File System...
[   37.423572]systemd[1]: Mounting Kernel Configuration File System...
[   37.427383]systemd[1]: Mounted FUSE Control File System.
[   37.427547]systemd[1]: Mounted Kernel Configuration File System.
[   37.429309]EXT4-fs (dm-1): re-mounted. Opts: errors=3Dremount-ro
[   37.430190]ashmem_linux: module is from the staging directory, the=20
quality is unknown, you have been warned.
[   37.430575]ashmem: initialized
[   37.431113]systemd[1]: Finished Remount Root and Kernel File Systems.
[   37.432832]systemd[1]: Condition check resulted in Rebuild Hardware=20
Database being skipped.
[   37.432896]systemd[1]: Condition check resulted in Platform=20
Persistent Storage Archival being skipped.
[   37.434023]systemd[1]: Starting Load/Save Random Seed...
[   37.435050]systemd[1]: Starting Create System Users...
[   37.435960]systemd[1]: Finished Uncomplicated firewall.
[   37.461710]systemd[1]: Finished Monitoring of LVM2 mirrors,=20
snapshots etc. using dmeventd or progress polling.
[   37.464636]systemd[1]: Finished Load/Save Random Seed.
[   37.464798]systemd[1]: Condition check resulted in First Boot=20
Complete being skipped.
[   37.468585]systemd[1]: Finished Create System Users.
[   37.470877]systemd[1]: Starting Create Static Device Nodes in /dev...
[   37.472031]lp: driver loaded but no devices found
[   37.480890]systemd[1]: Finished Create Static Device Nodes in /dev.
[   37.482608]systemd[1]: Starting Rule-based Manager for Device Events=20
and Files...
[   37.494068]ppdev: user-space parallel port driver
[   37.501808]systemd[1]: Started Journal Service.
[   37.518346]systemd-journald[543]: Received client request to flush=20
runtime journal.
[   37.876161]input: Surface Pro 3/4 Buttons as=20
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:19/PNP0C09:00/MSHW0040:0=
0/input/inpu
t11
[   37.881232]surface_pro3_button MSHW0040:00: Surface Pro 3/4 Buttons=20
[VGBI]
[   37.947906]mc: Linux media interface: v0.10
[   37.970034]videodev: Linux video capture interface: v2.00
[   38.015669]mei_me 0000:00:16.0: enabling device (0004 -> 0006)
[   38.018953]ov5693 i2c-INT33BE:00: ov5693_probe() called
[   38.019121]ov5693 i2c-INT33BE:00: supply avdd not found, using dummy=20
regulator
[   38.019155]ov5693 i2c-INT33BE:00: supply dovdd not found, using=20
dummy regulator
[   38.019931]mei_me 0000:00:16.4: enabling device (0004 -> 0006)
[   38.037182]ipu3_imgu: module is from the staging directory, the=20
quality is unknown, you have been warned.
[   38.055022]ov5693 i2c-INT33BE:00: sensor_revision =3D 0x2
[   38.055025]ov5693 i2c-INT33BE:00: sensor_address =3D 0x36
[   38.055027]ov5693 i2c-INT33BE:00: detect ov5693 success
[   38.056540]ipu3-cio2 0000:00:14.3: Found supported sensor INT33BE:00
[   38.056599]ipu3-cio2 0000:00:14.3: Connected 1 cameras
[   38.056613]ipu3-cio2 0000:00:14.3: enabling device (0000 -> 0002)
[   38.056785]ipu3-cio2 0000:00:14.3: device 0x9d32 (rev: 0x1)
[   38.081286]pstore: Using crash dump compression: deflate
[   38.081295]pstore: Registered efi as persistent store backend
[   38.118690]ipu3-imgu 0000:00:05.0: enabling device (0000 -> 0002)
[   38.118915]ipu3-imgu 0000:00:05.0: device 0x1919 (rev: 0x1)
[   38.118939]ipu3-imgu 0000:00:05.0: physical base address=20
0x00000000a1000000, 4194304 bytes
[   38.126677]RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters,=20
655360 ms ovfl timer
[   38.126680]RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[   38.126681]RAPL PMU: hw unit of domain package 2^-14 Joules
[   38.126682]RAPL PMU: hw unit of domain dram 2^-14 Joules
[   38.126683]RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[   38.126684]RAPL PMU: hw unit of domain psys 2^-14 Joules
[   38.222738]cfg80211: Loading compiled-in X.509 certificates for=20
regulatory database
[   38.228287]cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   38.290475]mwifiex_pcie 0000:02:00.0: quirk reset_d3cold enabled
[   38.290478]mwifiex_pcie 0000:02:00.0: quirk no_brigde_d3 enabled
[   38.290577]mwifiex_pcie 0000:02:00.0: enabling device (0000 -> 0002)
[   38.290806]mwifiex_pcie: PCI memory map Virt0: ffffb16441900000 PCI=20
memory map Virt2: ffffb16461400000
[   38.327199]ipu3-imgu 0000:00:05.0: loaded firmware version=20
irci_irci_ecr-master_20161208_0213_20170112_1500, 17 binaries, 1212984=20
by
tes
[   38.413587]ipts 0000:00:16.4-3e8d0870-271a-4208-8eb5-9acb9402ae04:=20
Starting IPTS
[   38.423232]ipts 0000:00:16.4-3e8d0870-271a-4208-8eb5-9acb9402ae04:=20
Device 1B96:0021 ready
[   38.457592]intel_rapl_common: Found RAPL domain package
[   38.457595]intel_rapl_common: Found RAPL domain core
[   38.457596]intel_rapl_common: Found RAPL domain uncore
[   38.457598]intel_rapl_common: Found RAPL domain dram
[   38.457599]intel_rapl_common: Found RAPL domain psys
[   38.560172]usb 1-1: 1:7 : unsupported format bits 0x100000000
[   38.562750]usbcore: registered new interface driver snd-usb-audio
[   38.630995]snd_hda_intel 0000:00:1f.3: DSP detected with PCI=20
class/subclass/prog-if info 0x040380
[   38.631030]snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[   38.631314]snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops=20
i915_audio_component_bind_ops [i915])
[   38.670990]snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC298:=20
line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[   38.670994]snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0=20
(0x0/0x0/0x0/0x0/0x0)
[   38.670996]snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1=20
(0x21/0x0/0x0/0x0/0x0)
[   38.670997]snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
[   38.670999]snd_hda_codec_realtek hdaudioC0D0:    inputs:
[   38.671001]snd_hda_codec_realtek hdaudioC0D0:      Mic=3D0x18
[   38.671002]snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=3D0x12
[   38.745448]input: Microsoft Surface Type Cover Keyboard as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/inp
ut/input14
[   38.748392]input: HDA Intel PCH Mic as=20
/devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[   38.802394]input: Microsoft Surface Type Cover Mouse as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/input=
/
input15
[   38.802640]input: Microsoft Surface Type Cover Consumer Control as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.
0002/input/input16
[   38.802688]input: HDA Intel PCH Headphone as=20
/devices/pci0000:00/0000:00:1f.3/sound/card0/input13
[   38.802726]input: Microsoft Surface Type Cover UNKNOWN as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/inpu
t/input17
[   38.802757]input: HDA Intel PCH HDMI/DP,pcm=3D3 as=20
/devices/pci0000:00/0000:00:1f.3/sound/card0/input23
[   38.802801]input: Microsoft Surface Type Cover Touchpad as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/inp
ut/input18
[   38.802813]input: HDA Intel PCH HDMI/DP,pcm=3D7 as=20
/devices/pci0000:00/0000:00:1f.3/sound/card0/input24
[   38.802873]input: Microsoft Surface Type Cover UNKNOWN as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/inpu
t/input19
[   38.802892]input: HDA Intel PCH HDMI/DP,pcm=3D8 as=20
/devices/pci0000:00/0000:00:1f.3/sound/card0/input25
[   38.802941]input: Microsoft Surface Type Cover UNKNOWN as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/inpu
t/input20
[   38.802955]input: HDA Intel PCH HDMI/DP,pcm=3D9 as=20
/devices/pci0000:00/0000:00:1f.3/sound/card0/input26
[   38.803008]input: Microsoft Surface Type Cover UNKNOWN as=20
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/0003:045E:07E8.0002/inpu
t/input21
[   38.803011]input: HDA Intel PCH HDMI/DP,pcm=3D10 as=20
/devices/pci0000:00/0000:00:1f.3/sound/card0/input27
[   38.803111]hid-multitouch 0003:045E:07E8.0002:=20
input,hiddev0,hidraw0: USB HID v1.11 Keyboard [Microsoft Surface Type=20
Cover] on usb-0
000:00:14.0-7/input0
[   38.828480]mousedev: PS/2 mouse device common for all mice
[   39.674157]mwifiex_pcie 0000:02:00.0: info: FW download over, size=20
723540 bytes
[   40.418055]usb 1-5: new high-speed USB device number 4 using xhci_hcd
[   40.568691]usb 1-5: New USB device found, idVendor=3D1286,=20
idProduct=3D204c, bcdDevice=3D32.01
[   40.568694]usb 1-5: New USB device strings: Mfr=3D1, Product=3D2,=20
SerialNumber=3D3
[   40.568696]usb 1-5: Product: Bluetooth and Wireless LAN Composite=20
Device
[   40.568698]usb 1-5: Manufacturer: Marvell
[   40.568699]usb 1-5: SerialNumber: 0000000000000000
[   40.607676]Bluetooth: Core ver 2.22
[   40.607704]NET: Registered protocol family 31
[   40.607706]Bluetooth: HCI device and connection manager initialized
[   40.607709]Bluetooth: HCI socket layer initialized
[   40.607711]Bluetooth: L2CAP socket layer initialized
[   40.607715]Bluetooth: SCO socket layer initialized
[   40.616054]usbcore: registered new interface driver btusb
[   40.619814]Bluetooth: hci0: unexpected event for opcode 0x0000
[   40.620058]Bluetooth: hci0: unexpected event for opcode 0x0000
[   40.650190]mwifiex_pcie 0000:02:00.0: WLAN FW is active
[   40.783752]mwifiex_pcie 0000:02:00.0: info: MWIFIEX VERSION: mwifiex=20
1.0 (15.68.19.p21)
[   40.783755]mwifiex_pcie 0000:02:00.0: driver_version =3D mwifiex 1.0=20
(15.68.19.p21)
[   40.788239]mwifiex_pcie 0000:02:00.0 wlp2s0: renamed from mlan0
[   41.382070]FAT-fs (nvme0n1p1): Volume was not properly unmounted.=20
Some data may be corrupt. Please run fsck.
[   41.383458]FAT-fs (nvme0n1p2): Volume was not properly unmounted.=20
Some data may be corrupt. Please run fsck.
[   41.427711]audit: type=3D1400 audit(1627383486.851:2):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"libreoffi
ce-xpdfimport" pid=3D927 comm=3D"apparmor_parser"
[   41.428511]audit: type=3D1400 audit(1627383486.851:3):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"libreoffi
ce-oosplash" pid=3D926 comm=3D"apparmor_parser"
[   41.431560]audit: type=3D1400 audit(1627383486.855:4):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"/usr/bin/
man" pid=3D928 comm=3D"apparmor_parser"
[   41.431565]audit: type=3D1400 audit(1627383486.855:5):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"man_filte
r" pid=3D928 comm=3D"apparmor_parser"
[   41.431568]audit: type=3D1400 audit(1627383486.855:6):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"man_groff
" pid=3D928 comm=3D"apparmor_parser"
[   41.434679]audit: type=3D1400 audit(1627383486.859:7):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"libreoffi
ce-senddoc" pid=3D932 comm=3D"apparmor_parser"
[   41.445102]audit: type=3D1400 audit(1627383486.863:8):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"/usr/lib/
cups/backend/cups-pdf" pid=3D929 comm=3D"apparmor_parser"
[   41.445108]audit: type=3D1400 audit(1627383486.863:9):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"/usr/sbin
/cupsd" pid=3D929 comm=3D"apparmor_parser"
[   41.445111]audit: type=3D1400 audit(1627383486.863:10):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"/usr/sbi
n/cupsd//third_party" pid=3D929 comm=3D"apparmor_parser"
[   41.449939]audit: type=3D1400 audit(1627383486.871:11):=20
apparmor=3D"STATUS" operation=3D"profile_load" profile=3D"unconfined"=20
name=3D"lxc-cont
ainer-default" pid=3D931 comm=3D"apparmor_parser"
[   41.646112]Adding 4193784k swap on /dev/mapper/cryptswap. =20
Priority:-2 extents:1 across:4193784k SSFS
[   41.726121]input: IPTS Touch as /devices/virtual/input/input28
[   41.727105]input: IPTS Stylus as /devices/virtual/input/input29
[   41.913695]Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   41.913696]Bluetooth: BNEP filters: protocol multicast
[   41.913699]Bluetooth: BNEP socket layer initialized
[   41.945429]NET: Registered protocol family 38
[   42.196046]mwifiex_pcie 0000:02:00.0: Enabling ps_mode disallowed by=20
modparam
[   44.129195]Bluetooth: RFCOMM TTY layer initialized
[   44.129202]Bluetooth: RFCOMM socket layer initialized
[   44.129207]Bluetooth: RFCOMM ver 1.11
[   45.374442]mwifiex_pcie 0000:02:00.0: Enabling ps_mode disallowed by=20
modparam
[   45.404171]mwifiex_pcie 0000:02:00.0: info: trying to associate to=20
'Gensokyo' bssid 28:bd:89:c2:a7:59
[   45.496473]rfkill: input handler disabled
[   45.593493]mwifiex_pcie 0000:02:00.0: info: associated to bssid=20
28:bd:89:c2:a7:59 successfully
[   46.511019]i915 0000:00:02.0: [drm] Reducing the compressed=20
framebuffer size. This may lead to less power savings than a non-reduced
-size. Try to increase stolen memory size if available in BIOS.
[   46.522956]IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   57.570233]rfkill: input handler enabled
[   63.947048]rfkill: input handler disabled
[   73.876396]process '/usr/bin/glava' started with executable stack


On Tue, 27 Jul, 2021 at 7:43 am, "Schmid, Carsten"=20
<Carsten_Schmid@mentor.com> wrote:
> Hi Greg,
>=20
> On Tue, Jul 27, 2021 at 12:37:28AM +0100, Razgriz375 (Neil) wrote:
>=20
>>>  [  109.668465] usb 1-1: USB disconnect, device number 2
>>>  [  110.084429] usb 1-1: new high-speed USB device number 5 using=20
>>> xhci_hcd
>>>  [  110.237963] usb 1-1: New USB device found, idVendor=3D054c,=20
>>> idProduct=3D0b8c, bcdDevice=3D 1.00
>>>  [  110.237989] usb 1-1: New USB device strings: Mfr=3D2, Product=3D3,=20
>>> SerialNumber=3D4
>>>  [  110.238002] usb 1-1: Product: WALKMAN
>>>  [  110.238011] usb 1-1: Manufacturer: Sony
>>>  [  110.238019] usb 1-1: SerialNumber: 10458B55477916
>>>  [  110.342104] usb 1-1: 1:7 : unsupported format bits 0x100000000
>>>  [  110.343953] usbcore: registered new interface driver=20
>>> snd-usb-audio
>>>=20
>>=20
>>=20
>>  Looks like you removed the device and then added it back?  And it=20
>> says
>>  the device is supported by the kernel now, what does not work=20
>> properly?
>=20
> But earlier in boot these messages are seen:
> [    1.908489] usb 1-1: New USB device found, idVendor=3D054c,=20
> idProduct=3D0ca1, bcdDevice=3D 1.00
> [    1.908503] usb 1-1: New USB device strings: Mfr=3D2, Product=3D3,=20
> SerialNumber=3D4
> [    1.908508] usb 1-1: Product: WALKMAN
> [    1.908513] usb 1-1: Manufacturer: Sony
> [    1.908516] usb 1-1: SerialNumber: 10458B55477916
> [    2.195821] usb-storage 1-1:1.0: USB Mass Storage device detected
> [    2.195988] scsi host0: usb-storage 1-1:1.0
>=20
> ProductId is different, that's strange.
>=20
> Neil, could you collect the dmesg from the working kernel 5.10 please?
> And: is the device expected to be a mass storage (aka USB disk) and=20
> sound card in one?
>=20
> Thanks,
> Carsten
>=20
>=20
> -----------------
> Siemens Electronic Design Automation GmbH; Anschrift: Arnulfstra=DFe=20
> 201, 80634 M=FCnchen; Gesellschaft mit beschr=E4nkter Haftung;=20
> Gesch=E4ftsf=FChrer: Thomas Heurung, Frank Th=FCrauf; Sitz der=20
> Gesellschaft: M=FCnchen; Registergericht M=FCnchen, HRB 106955


