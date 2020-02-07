Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C85155D36
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 18:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgBGR4p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 12:56:45 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:43087 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbgBGR4p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 12:56:45 -0500
Received: by mail-ua1-f43.google.com with SMTP id o42so149525uad.10
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2020 09:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZMggcx/1ZS1KSp7N1n/GhUbLvPsSJci3onIqR+5N68E=;
        b=NkqdJinty6rhmVb9uCqkAy3NgJq+Aq9CucJxNVhiHdVqww4y63WlGPrW72zXCfFsij
         5PaHPUw0wdtmAmordHbbKXfh8sn9Llb88Tq5Pxhg4NDojuXmsXf6Bke0rrYb4Du+GRDp
         TftPY6J/F12sd1bE/x2rY21jGBaBeNzkzf4BMXpzmXM40KdotW0UN/Lx1BjzVlhXEPa+
         b3s6SlnpTToyJmCJqNo7ESf9/0qjslD28ci7mO76xCrCoDPjB547iJ9gu5akxUh5R3i5
         Xp2U5IbBoX5UeLWQgoRgrkqNfiu1DobFJsJArxeG7Q6HgO3VfKomasN7bxCi2XOj5Mgg
         R5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZMggcx/1ZS1KSp7N1n/GhUbLvPsSJci3onIqR+5N68E=;
        b=k8XeFm3uRO4p7gHoJ/uZsUVgs+8khNWLIuNLpA69EkL6BI8qWt8acROjIzf/svfCb8
         2aKOjgSKW3s/VwtJtsxuaVUwjtRoUiFZiMHO35aBrWaRlJb2Bp6xf1fKxmWaB39Horu2
         mfAEkY6tw6sc1G/7+NPpgC1DKueF5o5ey3oA/XlopXCf+LW3AKQnU4d3cysj3DzE5+bA
         c1a2ZRXOXbXTH8kOGC0WahCWo8Ewq/68x3WdMESgQHzTW1MRCgDE6+hcxr8axMLGUhR+
         N74iGPdxu9PzZxGSzeK401m901kTushzeOLIKEkFVh3Y4KCnwKchcXKEUlwF4Xww7CwG
         u/EQ==
X-Gm-Message-State: APjAAAUJ5w74Y2qqSvv5uur4iZuFy7lmmSLKm7o2vzrlnvHwHNKqWYcZ
        79iVfmVQWK4JXO6dYkuUClg=
X-Google-Smtp-Source: APXvYqz/vP6gteZYpIzImoZFX+cZHgbchEEwiIb6k6V7t06TWngwe01uxyzoBHf/PPgs6pY1P2nqZQ==
X-Received: by 2002:a9f:3e9e:: with SMTP id x30mr5464231uai.122.1581098195152;
        Fri, 07 Feb 2020 09:56:35 -0800 (PST)
Received: from [10.100.110.140] ([190.119.190.102])
        by smtp.gmail.com with ESMTPSA id l125sm1293960vke.24.2020.02.07.09.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 09:56:34 -0800 (PST)
From:   Johannes Goepfert <goepfert.johannes@gmail.com>
Subject: [Regression] [Bug 206271] New: Trackpoint stops working after
 updating from Kernel 5.4.11 to 5.4.12
To:     linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
References: <bug-206271-208809@https.bugzilla.kernel.org/>
 <1580735890.23243.6.camel@suse.com>
Message-ID: <c7ba7340-2f2a-7761-4d1c-7e5b53619030@gmail.com>
Date:   Fri, 7 Feb 2020 12:56:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1580735890.23243.6.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

My Email is related to the following Bug:

https://bugzilla.kernel.org/show_bug.cgi?id=206271


Thank you for the reply Oliver. Attached three different outputs from dmesg.

The first one is from Kernel 5.3.18, where the Trackpoint still works. 
(Trackpoint started working from Kernel >5.0). The second one is from 
Kernel 5.4.17 where the Trackpoint doesn't work, it stopped working from 
 >5.4.11.

The last one is a modification of Kernel 5.5.1. There I made some 
investigations in the HID-module and figured out, that the change in

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/hid?h=v5.5.2&id=4f3882177240a1f55e45a3d241d3121341bead78

is related to the issue. If I build the Kernel without this change the 
trackpoint works normal.

The Trackpoint I'm talking about is listed as:

Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Mouse


#####################################################################################################################################################################################################################################################################

*[jogo8307@x1tab**~**]$*  sudo dmesg
[ 0.000000] Linux version 5.3.18-1-MANJARO (builduser@development) (gcc version 9.2.0 (GCC)) #1 SMP PREEMPT Wed Dec 18 18:34:35 UTC 2019
[ 0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.3-x86_64 root=UUID=c9ad2991-8862-4e66-934c-12a746df30f6 rw quiet apparmor=1 security=apparmor resume=UUID=d22f4cd6-54d3-4f6c-ada2-7dc78de3cb4d udev.log_priority=3 mem_sleep_default=deep
[ 0.000000] KERNEL supported cpus:
[ 0.000000]    Intel GenuineIntel
[ 0.000000]    AMD AuthenticAMD
[ 0.000000]    Hygon HygonGenuine
[ 0.00000fff0]    Centaur CentaurHauls
[ 0.000000]    zhaoxin   Shanghai
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[ 0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[ 0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[ 0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[ 0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[ 0.000000] BIOS-provided physical RAM map:
[ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usable
[ 0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000009bfff] usable
[ 0.000000] BIOS-e820: [mem 0x000000000009c000-0x000000000009cfff] unusable
[ 0.000000] BIOS-e820: [mem 0x000000000009d000-0x00000000000fffff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001edfcfff] usable
[ 0.000000] BIOS-e820: [mem 0x000000001edfd000-0x000000001ee3dfff] ACPI data
[ 0.000000] BIOS-e820: [mem 0x000000001ee3e000-0x00000000219e2fff] usable
[ 0.000000] BIOS-e820: [mem 0x00000000219e3000-0x00000000219e3fff] ACPI NVS
[ 0.000000] BIOS-e820: [mem 0x00000000219e4000-0x00000000219e4fff] reserved
[ 0.000000] BIOS-e820: [mem 0x00000000219e5000-0x000000004ee58fff] usable
[ 0.000000] BIOS-e820: [mem 0x000000004ee59000-0x000000004ef32fff] type 20
[ 0.000000] BIOS-e820: [mem 0x000000004ef33000-0x000000004ff10fff] reserved
[ 0.000000] BIOS-e820: [mem 0x000000004ff11000-0x000000004ff7efff] ACPI NVS
[ 0.000000] BIOS-e820: [mem 0x000000004ff7f000-0x000000004fffefff] ACPI data
[ 0.000000] BIOS-e820: [mem 0x000000004ffff000-0x000000004fffffff] usable
[ 0.000000] BIOS-e820: [mem 0x0000000050000000-0x0000000057ffffff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000058600000-0x000000005c7fffff] reserved
[ 0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
[ 0.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000002a17fffff] usable
[ 0.000000] NX (Execute Disable) protection: active
[ 0.000000] efi: EFI v2.50 by Lenovo
[ 0.000000] efi:  TPMFinalLog=0x4ff77000  SMBIOS=0x4f0f7000  SMBIOS 3.0=0x4f0f4000  ACPI 2.0=0x1ee3d9c1  ESRT=0x4ef81000
[ 0.000000] SMBIOS 3.0.0 present.
[ 0.000000] DMI: LENOVO 20KKS0PG01/20KKS0PG01, BIOS N1ZET79W(1.35 ) 11/28/2019
[ 0.000000] tsc: Detected 1900.000 MHz processor
[ 0.001033] tsc: Detected 1899.950 MHz TSC
[ 0.001033] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[ 0.001036] e820: remove [mem 0x000a0000-0x000fffff] usable
[ 0.001046] last_pfn = 0x2a1800 max_arch_pfn = 0x400000000
[ 0.001052] MTRR default type: write-back
[ 0.001053] MTRR fixed ranges enabled:
[ 0.001055]    00000-9FFFF write-back
[ 0.001056]    A0000-BFFFF uncachable
[ 0.001058]    C0000-FFFFF write-protect
[ 0.001059] MTRR variable ranges enabled:
[ 0.001061]    0 base 0080000000 mask 7F80000000 uncachable
[ 0.001063]    1 base 0060000000 mask 7FE0000000 uncachable
[ 0.001064]    2 base 005C000000 mask 7FFC000000 uncachable
[ 0.001066]    3 base 005A000000 mask 7FFE000000 uncachable
[ 0.001067]    4 base 2000000000 mask 7000000000 uncachable
[ 0.001068]    5 disabled
[ 0.001069]    6 disabled
[ 0.001070]    7 disabled
[ 0.001071]    8 disabled
[ 0.001071]    9 disabled
[ 0.001956] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[ 0.002402] last_pfn = 0x50000 max_arch_pfn = 0x400000000
[ 0.021796] esrt: Reserving ESRT space from 0x000000004ef81000 to 0x000000004ef810b0.
[ 0.021809] check: Scanning 1 areas for low memory corruption
[ 0.021815] Using GB pages for direct mapping
[ 0.021818] BRK [0x22ce01000, 0x22ce01fff] PGTABLE
[ 0.021820] BRK [0x22ce02000, 0x22ce02fff] PGTABLE
[ 0.021822] BRK [0x22ce03000, 0x22ce03fff] PGTABLE
[ 0.021879] BRK [0x22ce04000, 0x22ce04fff] PGTABLE
[ 0.021882] BRK [0x22ce05000, 0x22ce05fff] PGTABLE
[ 0.022148] BRK [0x22ce06000, 0x22ce06fff] PGTABLE
[ 0.022192] BRK [0x22ce07000, 0x22ce07fff] PGTABLE
[ 0.022272] BRK [0x22ce08000, 0x22ce08fff] PGTABLE
[ 0.022364] BRK [0x22ce09000, 0x22ce09fff] PGTABLE
[ 0.022437] BRK [0x22ce0a000, 0x22ce0afff] PGTABLE
[ 0.022549] BRK [0x22ce0b000, 0x22ce0bfff] PGTABLE
[ 0.022642] Secure boot could not be determined
[ 0.022643] RAMDISK: [mem 0x369a1000-0x374c7fff]
[ 0.022660] ACPI: Early table checksum verification disabled
[ 0.022664] ACPI: RSDP 0x000000001EE3D9C1 000024 (v02 LENOVO)
[ 0.022669] ACPI: XSDT 0x000000001EE3D89D 000124 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022678] ACPI: UEFI 0x000000001EE2583F 00013E (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022683] ACPI: BGRT 0x000000001EE2597D 000038 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022687] ACPI: FPDT 0x000000001EE259B5 000044 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022691] ACPI: ASF! 0x000000001EE259F9 0000A0 (v32 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022695] ACPI: NHLT 0x000000001EE25A99 00002D (v00 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022699] ACPI: DMAR 0x000000001EE25AC6 0000A8 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022703] ACPI: MSDM 0x000000001EE25B6E 000055 (v03 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022707] ACPI: DBG2 0x000000001EE25BC3 000054 (v00 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022711] ACPI: DBGP 0x000000001EE25C17 000034 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022715] ACPI: SSDT 0x000000001EE25C4B 000544 (v02 LENOVO TbtTypeC 00000000 INTL 20160527)
[ 0.022719] ACPI: SSDT 0x000000001EE2618F 00029F (v02 LENOVO sensrhub 00000000 INTL 20160527)
[ 0.022723] ACPI: SSDT 0x000000001EE2642E 000141 (v02 LENOVO HdaDsp   00000000 INTL 20160527)
[ 0.022728] ACPI: WSMT 0x000000001EE2656F 000028 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022732] ACPI: LPIT 0x000000001EE26597 000094 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022736] ACPI: SSDT 0x000000001EE2662B 000B0A (v02 LENOVO UsbCTabl 00001000 INTL 20160527)
[ 0.022740] ACPI: SSDT 0x000000001EE27135 00056D (v02 LENOVO CtdpB    00001000 INTL 20160527)
[ 0.022744] ACPI: SSDT 0x000000001EE276A2 0017AE (v02 LENOVO CpuSsdt  00003000 INTL 20160527)
[ 0.022749] ACPI: BATB 0x000000001EE28E50 00004A (v02 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022753] ACPI: BOOT 0x000000001EE28E9A 000028 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022756] ACPI: SSDT 0x000000001EE28EC2 0015AE (v02 LENOVO ProjSsdt 00000010 INTL 20160527)
[ 0.022762] ACPI: SSDT 0x000000001EE2A470 002025 (v02 LENOVO RVP7Rtd3 00001000 INTL 20160527)
[ 0.022766] ACPI: ECDT 0x000000001EE2C495 000053 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022770] ACPI: MCFG 0x000000001EE2C4E8 00003C (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022774] ACPI: APIC 0x000000001EE2C524 00012C (v03 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022778] ACPI: HPET 0x000000001EE2C650 000038 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022782] ACPI: SSDT 0x000000001EE2C688 0005C6 (v02 LENOVO PerfTune 00001000 INTL 20160527)
[ 0.022786] ACPI: SSDT 0x000000001EE2CC4E 0030B0 (v02 LENOVO SaSsdt   00003000 INTL 20160527)
[ 0.022790] ACPI: UEFI 0x000000001EE2FCFE 000042 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022795] ACPI: TPM2 0x000000001EE2FD40 000034 (v03 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022798] ACPI: SSDT 0x000000001EE2FD74 0003DB (v02 LENOVO Tpm2Tabl 00001000 INTL 20160527)
[ 0.022802] ACPI: SSDT 0x000000001EE3014F 00D5B6 (v02 LENOVO DptfTabl 00001000 INTL 20160527)
[ 0.022807] ACPI: FACP 0x000000001EE3D705 0000F4 (v05 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022813] ACPI: DSDT 0x000000001EDFD000 02883F (v02 LENOVO SKL      00000000 INTL 20200110)
[ 0.022817] ACPI: FACS 0x000000004FF23000 000040
[ 0.022820] ACPI: FACS 0x000000004FF23000 000040
[ 0.022831] ACPI: Local APIC address 0xfee00000
[ 0.023070] No NUMA configuration found
[ 0.023072] Faking a node at [mem 0x0000000000000000-0x00000002a17fffff]
[ 0.023077] NODE_DATA(0) allocated [mem 0x2a17fc000-0x2a17fffff]
[ 0.023122] Zone ranges:
[ 0.023123]    DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[ 0.023125]    DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[ 0.023127]    Normal   [mem 0x0000000100000000-0x00000002a17fffff]
[ 0.023128]    Device   empty
[ 0.023130] Movable zone start for each node
[ 0.023131] Early memory node ranges
[ 0.023132] node 0: [mem 0x0000000000001000-0x0000000000057fff]
[ 0.023133] node 0: [mem 0x0000000000059000-0x000000000009bfff]
[ 0.023134] node 0: [mem 0x0000000000100000-0x000000001edfcfff]
[ 0.023136] node 0: [mem 0x000000001ee3e000-0x00000000219e2fff]
[ 0.023137] node 0: [mem 0x00000000219e5000-0x000000004ee58fff]
[ 0.023138] node 0: [mem 0x000000004ffff000-0x000000004fffffff]
[ 0.023139] node 0: [mem 0x0000000100000000-0x00000002a17fffff]
[ 0.023186] Zeroed struct page in unavailable ranges: 4687 pages
[ 0.023188] Initmem setup node 0 [mem 0x0000000000001000-0x00000002a17fffff]
[ 0.023190] On node 0 totalpages: 2033073
[ 0.023192] DMA zone: 64 pages used for memmap
[ 0.023193] DMA zone: 22 pages reserved
[ 0.023194] DMA zone: 3994 pages, LIFO batch:0
[ 0.023278] DMA32 zone: 4985 pages used for memmap
[ 0.023279] DMA32 zone: 318999 pages, LIFO batch:63
[ 0.032517] Normal zone: 26720 pages used for memmap
[ 0.032518] Normal zone: 1710080 pages, LIFO batch:63
[ 0.061247] Reserving Intel graphics memory at [mem 0x5a800000-0x5c7fffff]
[ 0.061569] ACPI: PM-Timer IO Port: 0x1808
[ 0.061571] ACPI: Local APIC address 0xfee00000
[ 0.061582] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[ 0.061583] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[ 0.061584] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[ 0.061585] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[ 0.061586] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[ 0.061587] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[ 0.061588] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[ 0.061589] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[ 0.061590] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[ 0.061591] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[ 0.061591] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[ 0.061592] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[ 0.061593] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[ 0.061594] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[ 0.061595] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[ 0.061596] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[ 0.061632] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[ 0.061635] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[ 0.061637] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[ 0.061639] ACPI: IRQ0 used by override.
[ 0.061641] ACPI: IRQ9 used by override.
[ 0.061644] Using ACPI (MADT) for SMP configuration information
[ 0.061646] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[ 0.061671] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[ 0.061705] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[ 0.061708] PM: Registered nosave memory: [mem 0x00058000-0x00058fff]
[ 0.061710] PM: Registered nosave memory: [mem 0x0009c000-0x0009cfff]
[ 0.061711] PM: Registered nosave memory: [mem 0x0009d000-0x000fffff]
[ 0.061713] PM: Registered nosave memory: [mem 0x1edfd000-0x1ee3dfff]
[ 0.061716] PM: Registered nosave memory: [mem 0x219e3000-0x219e3fff]
[ 0.061717] PM: Registered nosave memory: [mem 0x219e4000-0x219e4fff]
[ 0.061719] PM: Registered nosave memory: [mem 0x4ee59000-0x4ef32fff]
[ 0.061720] PM: Registered nosave memory: [mem 0x4ef33000-0x4ff10fff]
[ 0.061721] PM: Registered nosave memory: [mem 0x4ff11000-0x4ff7efff]
[ 0.061721] PM: Registered nosave memory: [mem 0x4ff7f000-0x4fffefff]
[ 0.061724] PM: Registered nosave memory: [mem 0x50000000-0x57ffffff]
[ 0.061725] PM: Registered nosave memory: [mem 0x58000000-0x585fffff]
[ 0.061726] PM: Registered nosave memory: [mem 0x58600000-0x5c7fffff]
[ 0.061726] PM: Registered nosave memory: [mem 0x5c800000-0xefffffff]
[ 0.061727] PM: Registered nosave memory: [mem 0xf0000000-0xf7ffffff]
[ 0.061728] PM: Registered nosave memory: [mem 0xf8000000-0xfe00ffff]
[ 0.061729] PM: Registered nosave memory: [mem 0xfe010000-0xfe010fff]
[ 0.061730] PM: Registered nosave memory: [mem 0xfe011000-0xffffffff]
[ 0.061732] [mem 0x5c800000-0xefffffff] available for PCI devices
[ 0.061734] Booting paravirtualized kernel on bare hardware
[ 0.061738] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[ 0.223566] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:8 nr_node_ids:1
[ 0.223876] percpu: Embedded 54 pages/cpu s184320 r8192 d28672 u262144
[ 0.223887] pcpu-alloc: s184320 r8192 d28672 u262144 alloc=1*2097152
[ 0.223889] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
[ 0.223920] Built 1 zonelists, mobility grouping on. Total pages: 2001282
[ 0.223922] Policy zone: Normal
[ 0.223924] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.3-x86_64 root=UUID=c9ad2991-8862-4e66-934c-12a746df30f6 rw quiet apparmor=1 security=apparmor resume=UUID=d22f4cd6-54d3-4f6c-ada2-7dc78de3cb4d udev.log_priority=3 mem_sleep_default=deep
[ 0.224857] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[ 0.225227] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[ 0.225355] mem auto-init: stack:byref_all, heap alloc:on, heap free:off
[ 0.231232] Calgary: detecting Calgary via BIOS EBDA area
[ 0.231235] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[ 0.260311] Memory: 7769040K/8132292K available (12291K kernel code, 1321K rwdata, 4016K rodata, 1636K init, 3536K bss, 363252K reserved, 0K cma-reserved)
[ 0.260527] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[ 0.260543] Kernel/User page tables isolation: enabled
[ 0.260565] ftrace: allocating 38028 entries in 149 pages
[ 0.285186] rcu: Preemptible hierarchical RCU implementation.
[ 0.285187] rcu: 	RCU dyntick-idle grace-period acceleration is enabled.
[ 0.285189] rcu: 	RCU restricting CPUs from NR_CPUS=320 to nr_cpu_ids=8.
[ 0.285190] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[ 0.285191] 	Tasks RCU enabled.
[ 0.285192] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[ 0.285193] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[ 0.288087] NR_IRQS: 20736, nr_irqs: 2048, preallocated irqs: 16
[ 0.288534] random: get_random_bytes called from start_kernel+0x3c9/0x5a4 with crng_init=0
[ 0.288573] Console: colour dummy device 80x25
[ 0.288580] printk: console [tty0] enabled
[ 0.288603] ACPI: Core revision 20190703
[ 0.289122] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[ 0.289224] APIC: Switch to symmetric I/O mode setup
[ 0.289227] DMAR: Host address width 39
[ 0.289229] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[ 0.289237] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 19e2ff0505e
[ 0.289239] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[ 0.289244] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[ 0.289245] DMAR: RMRR base: 0x0000004f45f000 end: 0x0000004f47efff
[ 0.289246] DMAR: RMRR base: 0x0000005a000000 end: 0x0000005c7fffff
[ 0.289249] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[ 0.289250] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[ 0.289252] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[ 0.290974] DMAR-IR: Enabled IRQ remapping in x2apic mode
[ 0.290976] x2apic enabled
[ 0.290994] Switched APIC routing to cluster x2apic.
[ 0.295117] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[ 0.309145] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x36c5f9386c6, max_idle_ns: 881590416379 ns
[ 0.309154] Calibrating delay loop (skipped), value calculated using timer frequency.. 3801.22 BogoMIPS (lpj=6333166)
[ 0.309157] pid_max: default: 32768 minimum: 301
[ 0.315707] LSM: Security Framework initializing
[ 0.315714] Yama: becoming mindful.
[ 0.315771] AppArmor: AppArmor initialized
[ 0.315823] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[ 0.315861] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[ 0.316090] *** VALIDATE proc ***
[ 0.316154] *** VALIDATE cgroup1 ***
[ 0.316156] *** VALIDATE cgroup2 ***
[ 0.316253] mce: CPU0: Thermal monitoring enabled (TM1)
[ 0.316288] process: using mwait in idle threads
[ 0.316292] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[ 0.316293] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[ 0.316297] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[ 0.316299] Spectre V2 : Mitigation: Full generic retpoline
[ 0.316300] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[ 0.316301] Spectre V2 : Enabling Restricted Speculation for firmware calls
[ 0.316303] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[ 0.316304] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[ 0.316306] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[ 0.316310] TAA: Mitigation: Clear CPU buffers
[ 0.316311] MDS: Mitigation: Clear CPU buffers
[ 0.316734] Freeing SMP alternatives memory: 32K
[ 0.319288] TSC deadline timer enabled
[ 0.319296] smpboot: CPU0: Intel(R) Core(TM) i5-8350U CPU @ 1.70GHz (family: 0x6, model: 0x8e, stepping: 0xa)
[ 0.339188] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[ 0.339220] ... version:                4
[ 0.339221] ... bit width:              48
[ 0.339221] ... generic registers:      4
[ 0.339223] ... value mask:             0000ffffffffffff
[ 0.339223] ... max period:             00007fffffffffff
[ 0.339224] ... fixed-purpose events:   3
[ 0.339225] ... event mask:             000000070000000f
[ 0.345834] rcu: Hierarchical SRCU implementation.
[ 0.369497] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[ 0.375848] smp: Bringing up secondary CPUs ...
[ 0.415890] x86: Booting SMP configuration:
[ 0.415891] .... node #0, CPUs:      #1 #2 #3 #4
[ 0.538605] *MDS CPU bug present and SMT on, data leak possible. See 
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for 
more details.*
[ 0.538605] *TAA CPU bug present and SMT on, data leak possible. See 
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html 
for more details.*
[ 0.575902] *#5 #6 #7*
[ 0.657686] smp: Brought up 1 node, 8 CPUs
[ 0.657686] smpboot: Max logical packages: 1
[ 0.657686] smpboot: Total of 8 processors activated (30411.83 BogoMIPS)
[ 0.659535] devtmpfs: initialized
[ 0.659535] x86/mm: Memory block size: 128MB
[ 0.660335] PM: Registering ACPI NVS region [mem 0x219e3000-0x219e3fff] (4096 bytes)
[ 0.660335] PM: Registering ACPI NVS region [mem 0x4ff11000-0x4ff7efff] (450560 bytes)
[ 0.660335] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[ 0.660335] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[ 0.660335] pinctrl core: initialized pinctrl subsystem
[ 0.660335] PM: RTC time: 16:39:30, date: 2020-02-07
[ 0.660335] NET: Registered protocol family 16
[ 0.660335] audit: initializing netlink subsys (disabled)
[ 0.660335] audit: type=2000 audit(1581093569.369:1): state=initialized audit_enabled=0 res=1
[ 0.660335] cpuidle: using governor ladder
[ 0.660335] cpuidle: using governor menu
[ 0.660335] Simple Boot Flag at 0x47 set to 0x1
[ 0.660335] KVM setup pv remote TLB flush
[ 0.660335] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[ 0.660335] ACPI: bus type PCI registered
[ 0.660335] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[ 0.662511] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000-0xf7ffffff] (base 0xf0000000)
[ 0.662515] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
[ 0.662530] PCI: Using configuration type 1 for base access
[ 0.663284] ENERGY_PERF_BIAS*: Set to 'normal', was 'performance'*
[ 0.663696] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[ 0.663696] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[ 0.665971] ACPI: Added _OSI(Module Device)
[ 0.665972] ACPI: Added _OSI(Processor Device)
[ 0.665973] ACPI: Added _OSI(3.0 _SCP Extensions)
[ 0.665975] ACPI: Added _OSI(Processor Aggregator Device)
[ 0.665976] ACPI: Added _OSI(Linux-Dell-Video)
[ 0.665977] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[ 0.665979] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[ 0.766905] ACPI: 13 ACPI AML tables successfully acquired and loaded
[ 0.770297] ACPI: EC: EC started
[ 0.770298] ACPI: EC: interrupt blocked
[ 0.774530] ACPI: \: Used as first EC
[ 0.774533] ACPI: \: GPE=0x16, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[ 0.774534] ACPI: EC: Boot ECDT EC used to handle transactions
[ 0.777887] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[ 0.798922] ACPI: Dynamic OEM Table Load:
[ 0.798931] ACPI: SSDT 0xFFFF9D4657FA5800 0005AC (v02 PmRef  Cpu0Ist  00003000 INTL 20160527)
[ 0.802165] ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[ 0.803879] ACPI Warning*: \_SB.PCI0.LNK2._HID: Invalid zero-length _HID 
or _CID string (20190703/nsrepair2-507)*
[ 0.804383] ACPI Warning*: \_SB.PCI0.LNK2._CID: Invalid zero-length _HID 
or _CID string (20190703/nsrepair2-507)*
[ 0.805724] ACPI: Dynamic OEM Table Load:
[ 0.805732] ACPI: SSDT 0xFFFF9D46574EC800 0003FF (v02 PmRef  Cpu0Cst  00003001 INTL 20160527)
[ 0.808831] ACPI: Dynamic OEM Table Load:
[ 0.808838] ACPI: SSDT 0xFFFF9D4657F77840 0000BA (v02 PmRef  Cpu0Hwp  00003000 INTL 20160527)
[ 0.811817] ACPI: Dynamic OEM Table Load:
[ 0.811825] ACPI: SSDT 0xFFFF9D4657FA0800 000628 (v02 PmRef  HwpLvt   00003000 INTL 20160527)
[ 0.815484] ACPI: Dynamic OEM Table Load:
[ 0.815494] ACPI: SSDT 0xFFFF9D4657FF6000 000D14 (v02 PmRef  ApIst    00003000 INTL 20160527)
[ 0.819893] ACPI: Dynamic OEM Table Load:
[ 0.819901] ACPI: SSDT 0xFFFF9D46574EB400 000317 (v02 PmRef  ApHwp    00003000 INTL 20160527)
[ 0.823110] ACPI: Dynamic OEM Table Load:
[ 0.823117] ACPI: SSDT 0xFFFF9D46574EE400 00030A (v02 PmRef  ApCst    00003000 INTL 20160527)
[ 0.832462] ACPI: Interpreter enabled
[ 0.832545] ACPI: (supports S0 S3 S4 S5)
[ 0.832547] ACPI: Using IOAPIC for interrupt routing
[ 0.832617] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[ 0.835357] ACPI: Enabled 7 GPEs in block 00 to 7F
[ 0.842951] ACPI: Power Resource [PUBS] (on)
[ 0.865465] ACPI: Power Resource [PAUD] (on)
[ 0.867973] ACPI: Power Resource [WRST] (on)
[ 0.871260] ACPI: Power Resource [PXP] (on)
[ 0.887544] ACPI: Power Resource [PXTC] (on)
[ 1.099185] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-7e])
[ 1.099196] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[ 1.099483] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME AER PCIeCapability]
[ 1.099617] acpi PNP0A08:00: _OSC: not requesting control; platform does not support [PCIeCapability]
[ 1.099620] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR]
[ 1.099621] acpi PNP0A08:00: _OSC: platform willing to grant [LTR]
[ 1.099623] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM
[ 1.103773] PCI host bridge to bus 0000:00
[ 1.103776] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[ 1.103779] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[ 1.103781] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[ 1.103782] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3fff window]
[ 1.103784] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]
[ 1.103786] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbfff window]
[ 1.103787] pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cffff window]
[ 1.103789] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff window]
[ 1.103790] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff window]
[ 1.103792] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff window]
[ 1.103793] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff window]
[ 1.103795] pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3fff window]
[ 1.103796] pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7fff window]
[ 1.103798] pci_bus 0000:00: root bus resource [mem 0x000e8000-0x000ebfff window]
[ 1.103799] pci_bus 0000:00: root bus resource [mem 0x000ec000-0x000effff window]
[ 1.103801] pci_bus 0000:00: root bus resource [mem 0x000f0000-0x000fffff window]
[ 1.103803] pci_bus 0000:00: root bus resource [mem 0x5c800000-0xefffffff window]
[ 1.103804] pci_bus 0000:00: root bus resource [mem 0x2000000000-0x2fffffffff window]
[ 1.103806] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
[ 1.103808] pci_bus 0000:00: root bus resource [bus 00-7e]
[ 1.103826] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000
[ 1.105743] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000
[ 1.105762] pci 0000:00:02.0: reg 0x10: [mem 0x2ffa000000-0x2ffaffffff 64bit]
[ 1.105771] pci 0000:00:02.0: reg 0x18: [mem 0x2fa0000000-0x2fafffffff 64bit pref]
[ 1.105778] pci 0000:00:02.0: reg 0x20: [io  0xe000-0xe03f]
[ 1.105804] pci 0000:00:02.0: BAR 2: assigned to efifb
[ 1.107296] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[ 1.107316] pci 0000:00:04.0: reg 0x10: [mem 0x2ffb430000-0x2ffb437fff 64bit]
[ 1.108921] pci 0000:00:05.0: [8086:1919] type 00 class 0x048000
[ 1.108938] pci 0000:00:05.0: reg 0x10: [mem 0x2ffb000000-0x2ffb3fffff 64bit]
[ 1.110438] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
[ 1.110458] pci 0000:00:08.0: reg 0x10: [mem 0x2ffb445000-0x2ffb445fff 64bit]
[ 1.111964] pci 0000:00:13.0: [8086:9d35] type 00 class 0x000000
[ 1.111992] pci 0000:00:13.0: reg 0x10: [mem 0x2ffb444000-0x2ffb444fff 64bit]
[ 1.113612] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[ 1.113640] pci 0000:00:14.0: reg 0x10: [mem 0x2ffb420000-0x2ffb42ffff 64bit]
[ 1.113734] pci 0000:00:14.0: PME# supported from D3hot D3cold
[ 1.115424] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[ 1.115452] pci 0000:00:14.2: reg 0x10: [mem 0x2ffb443000-0x2ffb443fff 64bit]
[ 1.117003] pci 0000:00:14.3: [8086:9d32] type 00 class 0x048000
[ 1.117117] pci 0000:00:14.3: reg 0x10: [mem 0x2ffb410000-0x2ffb41ffff 64bit]
[ 1.119017] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[ 1.119279] pci 0000:00:15.0: reg 0x10: [mem 0x2ffb442000-0x2ffb442fff 64bit]
[ 1.121755] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[ 1.122018] pci 0000:00:15.1: reg 0x10: [mem 0x2ffb441000-0x2ffb441fff 64bit]
[ 1.124484] pci 0000:00:15.2: [8086:9d62] type 00 class 0x118000
[ 1.124747] pci 0000:00:15.2: reg 0x10: [mem 0x2ffb440000-0x2ffb440fff 64bit]
[ 1.127170] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[ 1.127220] pci 0000:00:16.0: reg 0x10: [mem 0x2ffb43f000-0x2ffb43ffff 64bit]
[ 1.127365] pci 0000:00:16.0: PME# supported from D3hot
[ 1.128934] pci 0000:00:16.3: [8086:9d3d] type 00 class 0x070002
[ 1.128967] pci 0000:00:16.3: reg 0x10: [io  0xe060-0xe067]
[ 1.128979] pci 0000:00:16.3: reg 0x14: [mem 0xee404000-0xee404fff]
[ 1.130551] pci 0000:00:1c.0: [8086:9d11] type 01 class 0x060400
[ 1.130674] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[ 1.132274] pci 0000:00:1c.3: [8086:9d13] type 01 class 0x060400
[ 1.132396] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[ 1.134003] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
[ 1.134137] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[ 1.135741] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
[ 1.135872] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[ 1.137568] pci 0000:00:1e.0: [8086:9d27] type 00 class 0x118000
[ 1.137834] pci 0000:00:1e.0: reg 0x10: [mem 0x2ffb43e000-0x2ffb43efff 64bit]
[ 1.140327] pci 0000:00:1e.3: [8086:9d2a] type 00 class 0x118000
[ 1.140593] pci 0000:00:1e.3: reg 0x10: [mem 0x2ffb43d000-0x2ffb43dfff 64bit]
[ 1.143013] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100
[ 1.144693] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[ 1.144713] pci 0000:00:1f.2: reg 0x10: [mem 0xee400000-0xee403fff]
[ 1.146331] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380
[ 1.146368] pci 0000:00:1f.3: reg 0x10: [mem 0x2ffb438000-0x2ffb43bfff 64bit]
[ 1.146410] pci 0000:00:1f.3: reg 0x20: [mem 0x2ffb400000-0x2ffb40ffff 64bit]
[ 1.146483] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[ 1.148117] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[ 1.148175] pci 0000:00:1f.4: reg 0x10: [mem 0x2ffb43c000-0x2ffb43c0ff 64bit]
[ 1.148229] pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
[ 1.150002] pci 0000:02:00.0: [10ec:522a] type 00 class 0xff0000
[ 1.150033] pci 0000:02:00.0: reg 0x10: [mem 0xee300000-0xee300fff]
[ 1.150178] pci 0000:02:00.0: supports D1 D2
[ 1.150179] pci 0000:02:00.0: PME# supported from D1 D2 D3hot D3cold
[ 1.150411] pci 0000:00:1c.0: PCI bridge to [bus 02]
[ 1.150417] pci 0000:00:1c.0:   bridge window [mem 0xee300000-0xee3fffff]
[ 1.150901] pci 0000:04:00.0: [8086:24fd] type 00 class 0x028000
[ 1.151005] pci 0000:04:00.0: reg 0x10: [mem 0xee200000-0xee201fff 64bit]
[ 1.151410] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
[ 1.152272] pci 0000:00:1c.3: PCI bridge to [bus 04]
[ 1.152278] pci 0000:00:1c.3:   bridge window [mem 0xee200000-0xee2fffff]
[ 1.152504] pci 0000:05:00.0: [144d:a804] type 00 class 0x010802
[ 1.152538] pci 0000:05:00.0: reg 0x10: [mem 0xee100000-0xee103fff 64bit]
[ 1.153022] pci 0000:00:1c.4: PCI bridge to [bus 05]
[ 1.153028] pci 0000:00:1c.4:   bridge window [mem 0xee100000-0xee1fffff]
[ 1.153101] pci 0000:00:1d.0: PCI bridge to [bus 06-70]
[ 1.153109] pci 0000:00:1d.0:   bridge window [mem 0xc0000000-0xee0fffff]
[ 1.153118] pci 0000:00:1d.0:   bridge window [mem 0x2fb0000000-0x2ff9ffffff 64bit pref]
[ 1.162103] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.162222] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[ 1.162337] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.162451] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.162573] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.162687] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.162801] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.162914] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.175031] ACPI: EC: interrupt unblocked
[ 1.175031] ACPI: EC: event unblocked
[ 1.175031] ACPI: \_SB_.PCI0.LPCB.EC__: GPE=0x16, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[ 1.175031] ACPI: \_SB_.PCI0.LPCB.EC__: Boot DSDT EC used to handle transactions and events
[ 1.175034] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=mem,locks=none
[ 1.175034] pci 0000:00:02.0: vgaarb: bridge control possible
[ 1.175034] pci 0000:00:02.0: vgaarb: setting as boot device
[ 1.175034] vgaarb: loaded
[ 1.175034] ACPI: bus type USB registered
[ 1.175034] usbcore: registered new interface driver usbfs
[ 1.175034] usbcore: registered new interface driver hub
[ 1.175825] usbcore: registered new device driver usb
[ 1.175825] pps_core: LinuxPPS API ver. 1 registered
[ 1.175825] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti<giometti@linux.it>
[ 1.175825] PTP clock support registered
[ 1.175825] EDAC MC: Ver: 3.0.0
[ 1.175840] Registered efivars operations
[ 1.175874] PCI: Using ACPI for IRQ routing
[ 1.179573] PCI: pci_cache_line_size set to 64 bytes
[ 1.180953] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[ 1.180955] e820: reserve RAM buffer [mem 0x0009c000-0x0009ffff]
[ 1.180956] e820: reserve RAM buffer [mem 0x1edfd000-0x1fffffff]
[ 1.180957] e820: reserve RAM buffer [mem 0x219e3000-0x23ffffff]
[ 1.180958] e820: reserve RAM buffer [mem 0x4ee59000-0x4fffffff]
[ 1.180960] e820: reserve RAM buffer [mem 0x2a1800000-0x2a3ffffff]
[ 1.181104] NetLabel: Initializing
[ 1.181105] NetLabel:  domain hash size = 128
[ 1.181106] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[ 1.181125] NetLabel:  unlabeled traffic allowed by default
[ 1.183818] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[ 1.183818] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[ 1.185819] clocksource: Switched to clocksource tsc-early
[ 1.202394] VFS: Disk quotas dquot_6.6.0
[ 1.202417] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[ 1.202457] *** VALIDATE hugetlbfs ***
[ 1.202593] AppArmor: AppArmor Filesystem Enabled
[ 1.202641] pnp: PnP ACPI init
[ 1.203043] system 00:00: [mem 0xfd000000-0xfdabffff] has been reserved
[ 1.203046] system 00:00: [mem 0xfdad0000-0xfdadffff] has been reserved
[ 1.203048] system 00:00: [mem 0xfdb00000-0xfdffffff] has been reserved
[ 1.203050] system 00:00: [mem 0xfe000000-0xfe01ffff] could not be reserved
[ 1.203052] system 00:00: [mem 0xfe036000-0xfe03bfff] has been reserved
[ 1.203054] system 00:00: [mem 0xfe03d000-0xfe3fffff] has been reserved
[ 1.203056] system 00:00: [mem 0xfe420000-0xfe7fffff] has been reserved
[ 1.203063] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.203628] system 00:01: [io  0xff00-0xfffe] has been reserved
[ 1.203634] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.204538] system 00:02: [io  0x0680-0x069f] has been reserved
[ 1.204541] system 00:02: [io  0xffff] has been reserved
[ 1.204543] system 00:02: [io  0xffff] has been reserved
[ 1.204544] system 00:02: [io  0xffff] has been reserved
[ 1.204546] system 00:02: [io  0x1800-0x18fe] has been reserved
[ 1.204548] system 00:02: [io  0x164e-0x164f] has been reserved
[ 1.204553] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.204736] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
[ 1.204807] system 00:04: [io  0x1854-0x1857] has been reserved
[ 1.204811] system 00:04: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[ 1.204840] pnp 00:05: Plug and Play ACPI device, IDs LEN0071 PNP0303 (active)
[ 1.205058] system 00:06: [io  0x1800-0x189f] could not be reserved
[ 1.205060] system 00:06: [io  0x0800-0x087f] has been reserved
[ 1.205062] system 00:06: [io  0x0880-0x08ff] has been reserved
[ 1.205064] system 00:06: [io  0x0900-0x097f] has been reserved
[ 1.205066] system 00:06: [io  0x0980-0x09ff] has been reserved
[ 1.205068] system 00:06: [io  0x0a00-0x0a7f] has been reserved
[ 1.205069] system 00:06: [io  0x0a80-0x0aff] has been reserved
[ 1.205071] system 00:06: [io  0x0b00-0x0b7f] has been reserved
[ 1.205073] system 00:06: [io  0x0b80-0x0bff] has been reserved
[ 1.205075] system 00:06: [io  0x15e0-0x15ef] has been reserved
[ 1.205077] system 00:06: [io  0x1600-0x167f] could not be reserved
[ 1.205079] system 00:06: [io  0x1640-0x165f] could not be reserved
[ 1.205081] system 00:06: [mem 0xf0000000-0xf7ffffff] has been reserved
[ 1.205084] system 00:06: [mem 0xfed10000-0xfed13fff] has been reserved
[ 1.205086] system 00:06: [mem 0xfed18000-0xfed18fff] has been reserved
[ 1.205088] system 00:06: [mem 0xfed19000-0xfed19fff] has been reserved
[ 1.205089] system 00:06: [mem 0xfeb00000-0xfebfffff] has been reserved
[ 1.205091] system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved
[ 1.205093] system 00:06: [mem 0xfed90000-0xfed93fff] could not be reserved
[ 1.205096] system 00:06: [mem 0xeffe0000-0xefffffff] has been reserved
[ 1.205100] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.207229] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.208800] system 00:08: [mem 0xfed10000-0xfed17fff] could not be reserved
[ 1.208803] system 00:08: [mem 0xfed18000-0xfed18fff] has been reserved
[ 1.208805] system 00:08: [mem 0xfed19000-0xfed19fff] has been reserved
[ 1.208807] system 00:08: [mem 0xf0000000-0xf7ffffff] has been reserved
[ 1.208808] system 00:08: [mem 0xfed20000-0xfed3ffff] has been reserved
[ 1.208811] system 00:08: [mem 0xfed90000-0xfed93fff] could not be reserved
[ 1.208812] system 00:08: [mem 0xfed45000-0xfed8ffff] has been reserved
[ 1.208814] system 00:08: [mem 0xff000000-0xffffffff] has been reserved
[ 1.208816] system 00:08: [mem 0xfee00000-0xfeefffff] has been reserved
[ 1.208818] system 00:08: [mem 0xeffe0000-0xefffffff] has been reserved
[ 1.208824] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.209859] system 00:09: [mem 0x00000000-0x0009ffff] could not be reserved
[ 1.209861] system 00:09: [mem 0x000f0000-0x000fffff] could not be reserved
[ 1.209863] system 00:09: [mem 0x00100000-0x5c7fffff] could not be reserved
[ 1.209865] system 00:09: [mem 0xfec00000-0xfed3ffff] could not be reserved
[ 1.209868] system 00:09: [mem 0xfed4c000-0xffffffff] could not be reserved
[ 1.209872] system 00:09: Plug and Play ACPI device, IDs PNP0c01 (active)
[ 1.210197] pnp: PnP ACPI: found 10 devices
[ 1.212029] thermal_sys: Registered thermal governor 'fair_share'
[ 1.212030] thermal_sys: Registered thermal governor 'bang_bang'
[ 1.212031] thermal_sys: Registered thermal governor 'step_wise'
[ 1.212032] thermal_sys: Registered thermal governor 'user_space'
[ 1.212033] thermal_sys: Registered thermal governor 'power_allocator'
[ 1.216586] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[ 1.216638] pci 0000:00:1d.0: bridge window [io  0x1000-0x0fff] to [bus 06-70] add_size 1000
[ 1.216646] pci 0000:00:1d.0: BAR 13: assigned [io  0x2000-0x2fff]
[ 1.216655] pci 0000:00:1c.0: PCI bridge to [bus 02]
[ 1.216675] pci 0000:00:1c.0:   bridge window [mem 0xee300000-0xee3fffff]
[ 1.216685] pci 0000:00:1c.3: PCI bridge to [bus 04]
[ 1.216692] pci 0000:00:1c.3:   bridge window [mem 0xee200000-0xee2fffff]
[ 1.216702] pci 0000:00:1c.4: PCI bridge to [bus 05]
[ 1.216716] pci 0000:00:1c.4:   bridge window [mem 0xee100000-0xee1fffff]
[ 1.216727] pci 0000:00:1d.0: PCI bridge to [bus 06-70]
[ 1.216733] pci 0000:00:1d.0:   bridge window [io  0x2000-0x2fff]
[ 1.216740] pci 0000:00:1d.0:   bridge window [mem 0xc0000000-0xee0fffff]
[ 1.216747] pci 0000:00:1d.0:   bridge window [mem 0x2fb0000000-0x2ff9ffffff 64bit pref]
[ 1.216756] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[ 1.216758] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[ 1.216760] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[ 1.216762] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff window]
[ 1.216764] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff window]
[ 1.216765] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff window]
[ 1.216767] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff window]
[ 1.216768] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff window]
[ 1.216770] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff window]
[ 1.216772] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff window]
[ 1.216773] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff window]
[ 1.216775] pci_bus 0000:00: resource 15 [mem 0x000e0000-0x000e3fff window]
[ 1.216777] pci_bus 0000:00: resource 16 [mem 0x000e4000-0x000e7fff window]
[ 1.216778] pci_bus 0000:00: resource 17 [mem 0x000e8000-0x000ebfff window]
[ 1.216780] pci_bus 0000:00: resource 18 [mem 0x000ec000-0x000effff window]
[ 1.216781] pci_bus 0000:00: resource 19 [mem 0x000f0000-0x000fffff window]
[ 1.216783] pci_bus 0000:00: resource 20 [mem 0x5c800000-0xefffffff window]
[ 1.216785] pci_bus 0000:00: resource 21 [mem 0x2000000000-0x2fffffffff window]
[ 1.216787] pci_bus 0000:00: resource 22 [mem 0xfd000000-0xfe7fffff window]
[ 1.216789] pci_bus 0000:02: resource 1 [mem 0xee300000-0xee3fffff]
[ 1.216790] pci_bus 0000:04: resource 1 [mem 0xee200000-0xee2fffff]
[ 1.216792] pci_bus 0000:05: resource 1 [mem 0xee100000-0xee1fffff]
[ 1.216794] pci_bus 0000:06: resource 0 [io  0x2000-0x2fff]
[ 1.216796] pci_bus 0000:06: resource 1 [mem 0xc0000000-0xee0fffff]
[ 1.216797] pci_bus 0000:06: resource 2 [mem 0x2fb0000000-0x2ff9ffffff 64bit pref]
[ 1.217120] NET: Registered protocol family 2
[ 1.217298] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
[ 1.217377] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
[ 1.217601] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[ 1.217712] TCP: Hash tables configured (established 65536 bind 65536)
[ 1.217762] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[ 1.217795] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
[ 1.217933] NET: Registered protocol family 1
[ 1.217940] NET: Registered protocol family 44
[ 1.217956] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[ 1.219134] PCI: CLS 0 bytes, default 64
[ 1.219210] Trying to unpack rootfs image as initramfs...
[ 1.427892] Freeing initrd memory: 11420K
[ 1.462583] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[ 1.462586] software IO TLB: mapped [mem 0x43eae000-0x47eae000] (64MB)
[ 1.462851] check: Scanning for low memory corruption every 60 seconds
[ 1.463480] Initialise system trusted keyrings
[ 1.463494] Key type blacklist registered
[ 1.463557] workingset: timestamp_bits=41 max_order=21 bucket_order=0
[ 1.465352] zbud: loaded
[ 1.472814] Key type asymmetric registered
[ 1.472816] Asymmetric key parser 'x509' registered
[ 1.472828] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[ 1.472888] io scheduler mq-deadline registered
[ 1.472889] io scheduler kyber registered
[ 1.472930] io scheduler bfq registered
[ 1.474641] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[ 1.474780] efifb: probing for efifb
[ 1.474807] efifb: showing boot graphics
[ 1.479231] efifb: framebuffer at 0x2fa0000000, using 23552k, total 23552k
[ 1.479233] efifb: mode is 3000x2000x32, linelength=12032, pages=1
[ 1.479233] efifb: scrolling: redraw
[ 1.479235] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[ 1.479300] fbcon: Deferring console take-over
[ 1.479301] fb0: EFI VGA frame buffer device
[ 1.479314] intel_idle: MWAIT substates: 0x11142120
[ 1.479315] intel_idle: v0.4.1 model 0x8E
[ 1.479969] intel_idle: lapic_timer_reliable_states 0xffffffff
[ 1.480116] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[ 1.482604] ACPI: Lid Switch [LID]
[ 1.482694] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[ 1.485911] ACPI: Power Button [PWRB]
[ 1.500514] thermal LNXTHERM:00: registered as thermal_zone0
[ 1.500516] ACPI: Thermal Zone [THM0] (48 C)
[ 1.501057] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[ 1.501990] serial 0000:00:16.3: enabling device (0000 -> 0003)
[ 1.523113] 0000:00:16.3: ttyS0 at I/O 0xe060 (irq = 19, base_baud = 115200) is a 16550A
[ 1.523577] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel<jroedel@suse.de>
[ 1.523578] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[ 1.525535] nvme nvme0: pci function 0000:05:00.0
[ 1.525601] usbcore: registered new interface driver usbserial_generic
[ 1.525607] usbserial: USB Serial support registered for generic
[ 1.525811] rtc_cmos 00:03: RTC can wake from S4
[ 1.526602] rtc_cmos 00:03: registered as rtc0
[ 1.526641] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram
[ 1.526746] intel_pstate: Intel P-state driver initializing
[ 1.527717] intel_pstate: HWP enabled
[ 1.527923] ledtrig-cpu: registered to indicate activity on CPUs
[ 1.528026] intel_pmc_core INT33A1:00:  initialized
[ 1.528321] NET: Registered protocol family 10
[ 1.538692] Segment Routing with IPv6
[ 1.538716] NET: Registered protocol family 17
[ 1.539858] RAS: Correctable Errors collector initialized.
[ 1.539950] microcode: sig=0x806ea, pf=0x80, revision=0xca
[ 1.540277] microcode: Microcode Update Driver: v2.2.
[ 1.540289] sched_clock: Marking stable (1539572992, 699142)->(1549592791, -9320657)
[ 1.540804] registered taskstats version 1
[ 1.540812] Loading compiled-in X.509 certificates
[ 1.546197] Loaded X.509 cert 'Build time autogenerated kernel key: 956e4543a460fae278c69c2bdc27e77d37b6a9e9'
[ 1.546241] zswap: loaded using pool lzo/zbud
[ 1.555997] Key type big_key registered
[ 1.556001] AppArmor: AppArmor sha1 policy hashing enabled
[ 1.557918] PM:   Magic number: 8:330:691
[ 1.558147] rtc_cmos 00:03: setting system clock to 2020-02-07T16:39:31 UTC (1581093571)
[ 1.769296] nvme nvme0: 7/0/0 default/read/poll queues
[ 1.787283] nvme0n1: p1 p2 p3 p4 p5 p6 p7
[ 1.791340] Freeing unused decrypted memory: 2040K
[ 1.792113] Freeing unused kernel image memory: 1636K
[ 1.822958] Write protecting the kernel read-only data: 18432k
[ 1.824333] Freeing unused kernel image memory: 2012K
[ 1.824704] Freeing unused kernel image memory: 80K
[ 1.850506] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[ 1.850509] x86/mm: Checking user space page tables
[ 1.867850] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[ 1.867852] Run /init as init process
[ 2.028970] i8042: PNP: PS/2 Controller [PNP0303:KBD] at 0x60,0x64 irq 1
[ 2.028971] i8042*: PNP: PS/2 appears to have AUX port disabled, if this 
is incorrect please boot with i8042.nopnp*
[ 2.029803] serio: i8042 KBD port at 0x60,0x64 irq 1
[ 2.033600] rtsx_pci 0000:02:00.0: enabling device (0000 -> 0002)
[ 2.037700] xhci_hcd 0000:00:14.0: xHCI Host Controller
[ 2.037707] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[ 2.038790] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000081109810
[ 2.038795] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[ 2.038992] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.03
[ 2.038993] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[ 2.038994] usb usb1: Product: xHCI Host Controller
[ 2.038995] usb usb1: Manufacturer: Linux 5.3.18-1-MANJARO xhci-hcd
[ 2.038995] usb usb1: SerialNumber: 0000:00:14.0
[ 2.039113] hub 1-0:1.0: USB hub found
[ 2.039130] hub 1-0:1.0: 12 ports detected
[ 2.039875] xhci_hcd 0000:00:14.0: xHCI Host Controller
[ 2.039879] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[ 2.039882] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[ 2.039912] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.03
[ 2.039913] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[ 2.039914] usb usb2: Product: xHCI Host Controller
[ 2.039914] usb usb2: Manufacturer: Linux 5.3.18-1-MANJARO xhci-hcd
[ 2.039915] usb usb2: SerialNumber: 0000:00:14.0
[ 2.040012] hub 2-0:1.0: USB hub found
[ 2.040022] hub 2-0:1.0: 6 ports detected
[ 2.048668] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input2
[ 2.057281] PM: Image not found (code -22)
[ 2.089364] EXT4-fs (nvme0n1p7): mounted filesystem with ordered data mode. Opts: (null)
[ 2.099063] random: fast init done
[ 2.229171] systemd[1]: systemd 242.153-3-manjaro running in system mode. (+PAM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[ 2.246482] systemd[1]: Detected architecture x86-64.
[ 2.249168] systemd[1]: Set hostname to <x1tab>.
[ 2.369222] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[ 2.427826] systemd[1]: Created slice User and Session Slice.
[ 2.427911] systemd[1]: Listening on initctl Compatibility Named Pipe.
[ 2.428070] systemd[1]: Listening on LVM2 metadata daemon socket.
[ 2.428145] systemd[1]: Listening on Journal Socket.
[ 2.428852] systemd[1]: Mounting Kernel Debug File System...
[ 2.429392] systemd[1]: Starting Setup keyboard layout...
[ 2.429522] systemd[1]: Listening on udev Control Socket.
[ 2.440152] EXT4-fs (nvme0n1p7): re-mounted. Opts: (null)
[ 2.443717] random: lvm: uninitialized urandom read (4 bytes read)
[ 2.457307] random: systemd-random-: uninitialized urandom read (512 bytes read)
[ 2.475843] tsc: Refined TSC clocksource calibration: 1896.004 MHz
[ 2.475849] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x36a8da782d4, max_idle_ns: 881590735038 ns
[ 2.475873] clocksource: Switched to clocksource tsc
[ 2.519747] usb 1-1: New USB device found, idVendor=17ef, idProduct=60b5, bcdDevice= 0.12
[ 2.519749] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 2.519751] usb 1-1: Product: ThinkPad X1 Tablet Thin Keyboard Gen 3
[ 2.519752] usb 1-1: Manufacturer: Chicony
[ 2.642508] usb 1-2: new high-speed USB device number 3 using xhci_hcd
[ 2.661157] random: crng init done
[ 2.661373] audit: type=1400 audit(1581093572.597:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=354 comm="apparmor_parser"
[ 2.661741] audit: type=1400 audit(1581093572.597:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=354 comm="apparmor_parser"
[ 2.693942] audit: type=1130 audit(1581093572.631:4): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 2.701173] systemd-journald[349]: Received request to flush runtime journal from PID 1
[ 2.709073] audit: type=1400 audit(1581093572.644:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=364 comm="apparmor_parser"
[ 2.732260] audit: type=1130 audit(1581093572.667:6): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-udevd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 2.777757] input: Intel HID events as /devices/platform/INT33D5:00/input/input3
[ 2.781287] audit: type=1400 audit(1581093572.717:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=373 comm="apparmor_parser"
[ 2.781641] audit: type=1400 audit(1581093572.717:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=373 comm="apparmor_parser"
[ 2.789258] usb 1-2*: config 1 has an invalid interface number: 12 but 
max is 1*
[ 2.789260] usb 1-2*: config 1 has an invalid interface number: 13 but 
max is 1*
[ 2.789261] usb 1-2*: config 1 has an invalid interface number: 13 but 
max is 1*
[ 2.789262] usb 1-2*: config 1 has no interface number 0*
[ 2.789263] usb 1-2*: config 1 has no interface number 1*
[ 2.793089] usb 1-2: New USB device found, idVendor=1199, idProduct=9079, bcdDevice= 0.06
[ 2.793092] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 2.793094] usb 1-2: Product: Sierra Wireless EM7455 Qualcomm® Snapdragon™ X7 LTE-A
[ 2.793095] usb 1-2: Manufacturer: Sierra Wireless, Incorporated
[ 2.793096] usb 1-2: SerialNumber: LF80552789021022
[ 2.842374] ACPI: AC Adapter [AC] (on-line)
[ 2.844687] input: Intel Virtual Button driver as /devices/pci0000:00/0000:00:1f.0/PNP0C09:00/INT33D6:00/input/input4
[ 2.849565] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[ 2.853778] acpi PNP0C14:02*: duplicate WMI GUID 
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)*
[ 2.853961] acpi PNP0C14:03*: duplicate WMI GUID 
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)*
[ 2.854073] acpi PNP0C14:04*: duplicate WMI GUID 
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)*
[ 2.858933] audit: type=1130 audit(1581093572.794:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-journal-flush comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 2.883794] hidraw: raw HID events driver (C) Jiri Kosina
[ 2.885183] mc: Linux media interface: v0.10
[ 2.929218] usb 1-8: new high-speed USB device number 4 using xhci_hcd
[ 2.950869] idma64 idma64.0: Found Intel integrated DMA 64-bit
[ 2.950899] intel_ish_ipc 0000:00:13.0: enabling device (0000 -> 0002)
[ 2.952098] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[ 2.952963] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[ 2.953012] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[ 2.962263] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[ 2.967176] mei_me 0000:00:16.0: enabling device (0004 -> 0006)
[ 2.968560] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[ 2.968562] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[ 2.968563] RAPL PMU: hw unit of domain package 2^-14 Joules
[ 2.968563] RAPL PMU: hw unit of domain dram 2^-14 Joules
[ 2.968564] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[ 2.968565] RAPL PMU: hw unit of domain psys 2^-14 Joules
[ 2.971888] Non-volatile memory driver v1.3
[ 2.972014] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[ 2.982991] Adding 11718652k swap on /dev/nvme0n1p5.  Priority:-2 extents:1 across:11718652k SSFS
[ 2.984377] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[ 2.997525] audit: type=1130 audit(1581093572.934:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=lvm2-monitor comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 2.998932] videodev: Linux video capture interface: v2.00
[ 3.022726] intel_rapl_common: Found RAPL domain package
[ 3.022728] intel_rapl_common: Found RAPL domain dram
[ 3.023465] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THERMAL_PCI
[ 3.025988] input: PC Speaker as /devices/platform/pcspkr/input/input5
[ 3.028312] resource sanity check*: requesting [mem 
0xfed10000-0xfed15fff], which spans more than pnp 00:06 [mem 
0xfed10000-0xfed13fff]*
[ 3.028324] *caller snb_uncore_imc_init_box+0x74/0xb0 [intel_uncore] 
mapping multiple BARs*
[ 3.037746] tpm_tis STM7304:00: 2.0 TPM (device-id 0x0, rev-id 78)
[ 3.066544] battery: ACPI: Battery Slot [BAT0] (battery present)
[ 3.068760] thinkpad_acpi: ThinkPad ACPI Extras v0.26
[ 3.068761] thinkpad_acpi:http://ibm-acpi.sf.net/
[ 3.068762] thinkpad_acpi: ThinkPad BIOS N1ZET79W(1.35 ), EC N1ZHT43W
[ 3.068763] thinkpad_acpi: Lenovo ThinkPad X1 Tablet Gen 3, model 20KKS0PG01
[ 3.073653] thinkpad_acpi: radio switch found; radios are enabled
[ 3.074035] thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
[ 3.074036] thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
[ 3.077091] intel_rapl_common: Found RAPL domain package
[ 3.077093] intel_rapl_common: Found RAPL domain core
[ 3.077094] intel_rapl_common: Found RAPL domain uncore
[ 3.077095] intel_rapl_common: Found RAPL domain dram
[ 3.077257] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
[ 3.079613] thinkpad_acpi: rfkill switch tpacpi_wwan_sw: radio is unblocked
[ 3.085935] thinkpad_acpi: Standard ACPI backlight interface available, not loading native one
[ 3.091160] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[ 3.095011] idma64 idma64.1: Found Intel integrated DMA 64-bit
[ 3.111195] usb 1-8: New USB device found, idVendor=04ca, idProduct=706b, bcdDevice= 0.23
[ 3.111197] usb 1-8: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[ 3.111199] usb 1-8: Product: Integrated Camera
[ 3.111199] usb 1-8: Manufacturer: 8SSC20F27052L1GZ81E04E4
[ 3.111200] usb 1-8: SerialNumber: 200901010001
[ 3.120211] cryptd: max_cpu_qlen set to 1000
[ 3.128125] thinkpad_acpi: battery 1 registered (start 70, stop 90)
[ 3.128132] battery: new extension: ThinkPad Battery Extension
[ 3.128191] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/input6
[ 3.140117] fuse: init (API version 7.31)
[ 3.143227] Intel(R) Wireless WiFi driver for Linux
[ 3.143228] Copyright(c) 2003- 2015 Intel Corporation
[ 3.143676] iwlwifi 0000:04:00.0: enabling device (0000 -> 0002)
[ 3.144811] iTCO_vendor_support: vendor-support=0
[ 3.148753] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[ 3.148958] iTCO_wdt: Found a Intel PCH TCO device (Version=4, TCOBASE=0x0400)
[ 3.149072] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[ 3.157762] iwlwifi 0000:04:00.0: Found debug destination: EXTERNAL_DRAM
[ 3.157765] iwlwifi 0000:04:00.0: Found debug configuration: 0
[ 3.158454] iwlwifi 0000:04:00.0: loaded firmware version 36.77d01142.0 op_mode iwlmvm
[ 3.164360] ipu3_imgu*: module is from the staging directory, the 
quality is unknown, you have been warned.*
[ 3.165603] i2c_hid i2c-WCOM511A:00*: i2c-WCOM511A:00 supply vdd not 
found, using dummy regulator*
[ 3.165617] i2c_hid i2c-WCOM511A:00*: i2c-WCOM511A:00 supply vddl not 
found, using dummy regulator*
[ 3.223499] intel-lpss 0000:00:15.2: enabling device (0000 -> 0002)
[ 3.234020] idma64 idma64.2: Found Intel integrated DMA 64-bit
[ 3.236630] AVX2 version of gcm_enc/dec engaged.
[ 3.236634] AES CTR mode by8 optimization enabled
[ 3.242542] usb 1-9: new full-speed USB device number 5 using xhci_hcd
[ 3.280413] Linux agpgart interface v0.103
[ 3.346381] ipu3-cio2 0000:00:14.3: enabling device (0000 -> 0002)
[ 3.346642] ipu3-imgu 0000:00:05.0: enabling device (0000 -> 0002)
[ 3.358032] ipu3-imgu 0000:00:05.0: device 0x1919 (rev: 0x1)
[ 3.358114] ipu3-imgu 0000:00:05.0: physical base address 0x0000002ffb000000, 4194304 bytes
[ 3.364426] ipu3-cio2 0000:00:14.3: device 0x9d32 (rev: 0x1)
[ 3.384427] usb 1-9*: config 1 interface 1 altsetting 0 endpoint 0x3 has 
wMaxPacketSize 0, skipping*
[ 3.384436] usb 1-9*: config 1 interface 1 altsetting 0 endpoint 0x83 
has wMaxPacketSize 0, skipping*
[ 3.384450] usb 1-9: New USB device found, idVendor=8087, idProduct=0a2b, bcdDevice= 0.10
[ 3.384454] usb 1-9: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[ 3.532915] intel-lpss 0000:00:1e.0: enabling device (0000 -> 0002)
[ 3.534361] idma64 idma64.3: Found Intel integrated DMA 64-bit
[ 3.540613] intel-lpss 0000:00:1e.3: enabling device (0000 -> 0002)
[ 3.552954] idma64 idma64.4: Found Intel integrated DMA 64-bit
[ 3.728690] ipu3-imgu 0000:00:05.0: loaded firmware version irci_irci_ecr-master_20161208_0213_20170112_1500, 17 binaries, 1212984 bytes
[ 3.794789] dw-apb-uart.3: ttyS1 at MMIO 0x2ffb43e000 (irq = 20, base_baud = 115200) is a 16550A
[ 3.912461] usbcore: registered new interface driver qcserial
[ 3.923072] usbserial: USB Serial support registered for Qualcomm USB modem
[ 3.935766] input: WCOM511A:00 056A:511A Touchscreen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input7
[ 3.976043] input: WCOM511A:00 056A:511A as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input8
[ 3.977211] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:17EF:60B5.0002/input/input12
[ 3.992876] input: WCOM511A:00 056A:511A as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input9
[ 4.026102] input: WCOM511A:00 056A:511A as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input10
[ 4.089773] hid-generic 0003:17EF:60B5.0002: input,hidraw0: USB HID v1.11 Keyboard [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input0
[ 4.090174] input: WCOM511A:00 056A:511A Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input11
[ 4.093657] hid-generic 0018:056A:511A.0001: input,hidraw1: I2C HID v1.00 Mouse [WCOM511A:00 056A:511A] on i2c-WCOM511A:00
[ 4.110092] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 System Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input13
[ 4.172947] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input14
[ 4.177532] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input15
[ 4.182017] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Wireless Radio Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input16
[ 4.192748] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input17
[ 4.193227] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input18
[ 4.193495] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input19
[ 4.193967] hid-generic 0003:17EF:60B5.0003: input,hiddev0,hidraw2: USB HID v1.11 Device [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input1
[ 4.216272] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=2
[ 4.218299] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input20
[ 4.220428] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Touchpad as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input21
[ 4.220863] hid-generic 0003:17EF:60B5.0004: input,hiddev1,hidraw3: USB HID v1.11 Mouse [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input2
[ 4.221018] usbcore: registered new interface driver usbhid
[ 4.221020] usbhid: USB HID core driver
[ 4.288193] iwlwifi 0000:04:00.0: Detected Intel(R) Dual Band Wireless AC 8265, REV=0x230
[ 4.297534] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 4.298936] iwlwifi 0000:04:00.0: Allocated 0x00400000 bytes for firmware monitor.
[ 4.308068] usbcore: registered new interface driver cdc_ncm
[ 4.322597] hid-generic 001F:8087:0AC2.0005: hidraw4: <UNKNOWN> HID v2.00 Device [hid-ishtp 8087:0AC2] on
[ 4.326857] uvcvideo: Found UVC 1.00 device Integrated Camera (04ca:706b)
[ 4.328949] hid-generic 001F:8087:0AC2.0006: hidraw5: <UNKNOWN> HID v2.00 Device [hid-ishtp 8087:0AC2] on
[ 4.352817] uvcvideo 1-8:1.0*: Entity type for entity Realtek Extended 
Controls Unit was not initialized!*
[ 4.352826] uvcvideo 1-8:1.0*: Entity type for entity Extension 4 was 
not initialized!*
[ 4.352832] uvcvideo 1-8:1.0*: Entity type for entity Processing 2 was 
not initialized!*
[ 4.352839] uvcvideo 1-8:1.0*: Entity type for entity Camera 1 was not 
initialized!*
[ 4.353114] input: Integrated Camera: Integrated C as /devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0/input/input23
[ 4.353401] usbcore: registered new interface driver uvcvideo
[ 4.353407] USB Video Class driver (1.1.1)
[ 4.355956] iwlwifi 0000:04:00.0: base HW address: 94:b8:6d:82:b8:c4
[ 4.410149] usbcore: registered new interface driver cdc_wdm
[ 4.433188] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[ 4.435207] thermal thermal_zone10*: failed to read out thermal zone (-61)*
[ 4.451851] iwlwifi 0000:04:00.0 wlp4s0: renamed from wlan0
[ 4.657689] cdc_mbim 1-2:1.12: cdc-wdm2: USB WDM device
[ 4.658232] cdc_mbim 1-2:1.12 wwan0: register 'cdc_mbim' at usb-0000:00:14.0-2, CDC MBIM, ca:72:a4:95:1f:15
[ 4.662777] usbcore: registered new interface driver cdc_mbim
[ 4.712718] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input24
[ 4.736638] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Touchpad as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input25
[ 4.778450] cdc_mbim 1-2:1.12 wwp0s20f0u2i12: renamed from wwan0
[ 4.780928] hid-multitouch 0003:17EF:60B5.0004: input,hiddev1,hidraw3: USB HID v1.11 Mouse [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input2
[ 4.839201] Bluetooth: Core ver 2.22
[ 4.839260] NET: Registered protocol family 31
[ 4.839264] Bluetooth: HCI device and connection manager initialized
[ 4.839276] Bluetooth: HCI socket layer initialized
[ 4.839284] Bluetooth: L2CAP socket layer initialized
[ 4.839296] Bluetooth: SCO socket layer initialized
[ 4.973071] mousedev: PS/2 mouse device common for all mice
[ 5.055113] i915 0000:00:02.0: enabling device (0006 -> 0007)
[ 5.071249] checking generic (2fa0000000 1700000) vs hw (2fa0000000 10000000)
[ 5.071255] fb0: switching to inteldrmfb from EFI VGA
[ 5.071964] i915 0000:00:02.0: vgaarb: deactivate vga console
[ 5.106071] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[ 5.106075] [drm] Driver supports precise vblank timestamp query.
[ 5.115660] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=mem
[ 5.122151] [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[ 5.128546] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[ 5.180053] [drm] Initialized i915 1.6.0 20190619 for 0000:00:02.0 on minor 0
[ 5.189867] usbcore: registered new interface driver btusb
[ 5.193701] Bluetooth: hci0: Firmware revision 0.1 build 50 week 12 2019
[ 5.207013] input: Wacom HID 511A Pen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input27
[ 5.208729] input: Wacom HID 511A Finger as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input28
[ 5.212891] wacom 0018:056A:511A.0001: hidraw1: I2C HID v1.00 Mouse [WCOM511A:00 056A:511A] on i2c-WCOM511A:00
[ 5.227909] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[ 5.233841] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input30
[ 5.238023] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[ 5.276627] fbcon: i915drmfb (fb0) is primary device
[ 5.276631] fbcon: Deferring console take-over
[ 5.276643] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[ 5.460709] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[ 5.460714] Bluetooth: BNEP filters: protocol multicast
[ 5.460724] Bluetooth: BNEP socket layer initialized
[ 5.500929] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC295: line_outs=2 (0x14/0x1b/0x0/0x0/0x0) type:speaker
[ 5.500941] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[ 5.500948] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[ 5.500952] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[ 5.500956] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[ 5.500962] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x19
[ 5.500968] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
[ 5.510798] loop: module loaded
[ 5.540511] NET: Registered protocol family 38
[ 5.603513] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[ 5.731416] kauditd_printk_skb*: 31 callbacks suppressed*
[ 5.731421] audit: type=1130 audit(1581093575.667:42): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=snapd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.827329] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1f.3/sound/card0/input31
[ 5.827535] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input32
[ 5.827725] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input33
[ 5.827913] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input34
[ 5.828078] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input35
[ 5.828265] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input36
[ 5.828439] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input37
[ 5.828616] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input38
[ 5.868535] audit: type=1130 audit(1581093575.804:43): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-backlight@backlight:intel_backlight comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.977812] audit: type=1130 audit(1581093575.914:44): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=org.cups.cupsd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.236068] i2c_hid i2c-WCOM511A:00: failed to set a report to device.
[ 6.236074] wacom 0018:056A:511A.0001: wacom_set_report: ran out of 
retries (last error = -121)
[ 6.236185] i2c_hid i2c-WCOM511A:00: failed to set a report to device.
[ 6.330352] audit: type=1130 audit(1581093576.267:45): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.409341] audit: type=1130 audit(1581093576.347:46): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.428875] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 6.564306] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 6.633028] iwlwifi 0000:04:00.0*: FW already configured (0) - 
re-configuring*
[ 6.682908] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 6.818267] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 6.827762] audit: type=1130 audit(1581093576.764:47): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-logind comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.843074] audit: type=1130 audit(1581093576.781:48): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=lightdm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.877230] audit: type=1130 audit(1581093576.814:49): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=intel-undervolt comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.877266] audit: type=1131 audit(1581093576.814:50): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=intel-undervolt comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.885628] iwlwifi 0000:04:00.0*: FW already configured (0) - 
re-configuring*
[ 6.938387] audit: type=1130 audit(1581093576.874:51): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=accounts-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 10.737578] kauditd_printk_skb*: 2 callbacks suppressed*
[ 10.737584] audit: type=1131 audit(1581093580.674:54): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=snapd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 10.976721] audit: type=1103 audit(1581093580.914:55): pid=1152 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:setcred grantors=pam_env,pam_permit acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 11.037777] audit: type=1130 audit(1581093580.974:56): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user-runtime-dir@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 11.059311] audit: type=1101 audit(1581093580.997:57): pid=1156 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:accounting grantors=pam_tally2,pam_access,pam_unix,pam_permit,pam_time acct="lightdm" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 11.059547] audit: type=1006 audit(1581093580.997:58): pid=1156 uid=0 subj==unconfined old-auid=4294967295 auid=970 tty=(none) old-ses=4294967295 ses=1 res=1
[ 11.063343] audit: type=1105 audit(1581093581.001:59): pid=1156 uid=0 auid=970 ses=1 subj==unconfined msg='op=PAM:session_open grantors=pam_loginuid,pam_loginuid,pam_keyinit,pam_limits,pam_unix,pam_permit,pam_mail,pam_systemd,pam_env acct="lightdm" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 11.267307] audit: type=1130 audit(1581093581.204:60): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 11.286189] audit: type=1105 audit(1581093581.224:61): pid=1152 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:session_open grantors=pam_unix,pam_systemd acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 11.346446] audit: type=1131 audit(1581093581.284:62): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 16.923636] audit: type=1100 audit(1581093586.861:63): pid=1198 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:authentication grantors=pam_tally2,pam_shells,pam_unix,pam_permit,pam_gnome_keyring acct="jogo8307" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 16.933252] audit: type=1101 audit(1581093586.871:64): pid=1198 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:accounting grantors=pam_tally2,pam_access,pam_unix,pam_permit,pam_time acct="jogo8307" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 17.014498] audit: type=1131 audit(1581093586.951:65): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 17.034967] audit: type=1106 audit(1581093586.971:66): pid=1152 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:session_close grantors=pam_unix,pam_systemd acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 17.035229] audit: type=1104 audit(1581093586.971:67): pid=1152 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:setcred grantors=pam_env,pam_permit acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 17.044813] audit: type=1103 audit(1581093586.981:68): pid=1198 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:setcred grantors=pam_tally2,pam_shells,pam_unix,pam_permit,pam_gnome_keyring acct="jogo8307" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 17.044984] audit: type=1006 audit(1581093586.981:69): pid=1198 uid=0 subj==unconfined old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=2 res=1
[ 17.123165] audit: type=1130 audit(1581093587.061:70): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user-runtime-dir@1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 17.140987] audit: type=1101 audit(1581093587.077:71): pid=1208 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:accounting grantors=pam_tally2,pam_access,pam_unix,pam_permit,pam_time acct="jogo8307" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 17.141146] audit: type=1006 audit(1581093587.077:72): pid=1208 uid=0 subj==unconfined old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=3 res=1
[ 19.043935] wlp4s0: authenticate with 10:05:ca:d0:16:6f
[ 19.054206] wlp4s0: send auth to 10:05:ca:d0:16:6f (try 1/3)
[ 19.060234] wlp4s0: authenticated
[ 19.062553] wlp4s0: associate with 10:05:ca:d0:16:6f (try 1/3)
[ 19.063928] wlp4s0: RX AssocResp from 10:05:ca:d0:16:6f (capab=0x111 status=0 aid=20)
[ 19.066590] wlp4s0: associated
[ 19.131499] IPv6: ADDRCONF(NETDEV_CHANGE): wlp4s0: link becomes ready
[ 19.139335] wlp4s0: Limiting TX power to 14 dBm as advertised by 10:05:ca:d0:16:6f
[ 20.020032] Bluetooth: RFCOMM TTY layer initialized
[ 20.020047] Bluetooth: RFCOMM socket layer initialized
[ 20.020063] Bluetooth: RFCOMM ver 1.11
[ 22.572247] kauditd_printk_skb*: 6 callbacks suppressed*
[ 22.572254] audit: type=1130 audit(1581093592.504:79): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=udisks2 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 23.440397] audit: type=1130 audit(1581093593.377:80): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=pamac-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 23.458939] audit: type=1131 audit(1581093593.394:81): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=pamac-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 24.254596] audit: type=1130 audit(1581093594.191:82): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=upower comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 24.632768] audit: type=1130 audit(1581093594.571:83): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=blueman-mechanism comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 27.345364] audit: type=1131 audit(1581093597.281:84): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 27.417466] audit: type=1131 audit(1581093597.354:85): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user-runtime-dir@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 30.016822] audit: type=1131 audit(1581093599.954:86): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 32.720857] input: MX Vertical Mouse as /devices/virtual/misc/uhid/0005:046D:B020.0007/input/input39
[ 32.721581] hid-generic 0005:046D:B020.0007: input,hidraw4: BLUETOOTH HID v0.09 Mouse [MX Vertical] on 94:B8:6D:82:B8:C8
[ 36.377218] audit: type=1131 audit(1581093606.306:87): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 41.307769] audit: type=1100 audit(1581093611.089:88): pid=1568 uid=1000 auid=1000 ses=2 subj==unconfined msg='op=PAM:authentication grantors=pam_unix,pam_permit acct="jogo8307" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 41.308522] audit: type=1101 audit(1581093611.092:89): pid=1568 uid=1000 auid=1000 ses=2 subj==unconfined msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="jogo8307" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 41.309415] audit: type=1110 audit(1581093611.092:90): pid=1568 uid=0 auid=1000 ses=2 subj==unconfined msg='op=PAM:setcred grantors=pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 41.319726] audit: type=1105 audit(1581093611.102:91): pid=1568 uid=0 auid=1000 ses=2 subj==unconfined msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'


#####################################################################################################################################################################################################################################################################
#####################################################################################################################################################################################################################################################################
#####################################################################################################################################################################################################################################################################


*[jogo8307@x1tab**~**]$*  sudo dmesg
[ 0.000000] Linux version 5.4.17-1-MANJARO (builder@cbec20020b85) (gcc version 9.2.0 (GCC)) #1 SMP PREEMPT Tue Feb 4 11:40:50 UTC 2020
[ 0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.4-x86_64 root=UUID=c9ad2991-8862-4e66-934c-12a746df30f6 rw quiet apparmor=1 security=apparmor resume=UUID=d22f4cd6-54d3-4f6c-ada2-7dc78de3cb4d udev.log_priority=3 mem_sleep_default=deep
[ 0.000000] KERNEL supported cpus:
[ 0.000000]    Intel GenuineIntel
[ 0.000000]    AMD AuthenticAMD
[ 0.000000]    Hygon HygonGenuine
[ 0.000000]    Centaur CentaurHauls
[ 0.000000]    zhaoxin   Shanghai
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[ 0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[ 0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[ 0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[ 0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[ 0.000000] BIOS-provided physical RAM map:
[ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usable
[ 0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000009bfff] usable
[ 0.000000] BIOS-e820: [mem 0x000000000009c000-0x000000000009cfff] unusable
[ 0.000000] BIOS-e820: [mem 0x000000000009d000-0x00000000000fffff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001edfcfff] usable
[ 0.000000] BIOS-e820: [mem 0x000000001edfd000-0x000000001ee3dfff] ACPI data
[ 0.000000] BIOS-e820: [mem 0x000000001ee3e000-0x00000000219e2fff] usable
[ 0.000000] BIOS-e820: [mem 0x00000000219e3000-0x00000000219e3fff] ACPI NVS
[ 0.000000] BIOS-e820: [mem 0x00000000219e4000-0x00000000219e4fff] reserved
[ 0.000000] BIOS-e820: [mem 0x00000000219e5000-0x000000004ee58fff] usable
[ 0.000000] BIOS-e820: [mem 0x000000004ee59000-0x000000004ef32fff] type 20
[ 0.000000] BIOS-e820: [mem 0x000000004ef33000-0x000000004ff10fff] reserved
[ 0.000000] BIOS-e820: [mem 0x000000004ff11000-0x000000004ff7efff] ACPI NVS
[ 0.000000] BIOS-e820: [mem 0x000000004ff7f000-0x000000004fffefff] ACPI data
[ 0.000000] BIOS-e820: [mem 0x000000004ffff000-0x000000004fffffff] usable
[ 0.000000] BIOS-e820: [mem 0x0000000050000000-0x0000000057ffffff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000058600000-0x000000005c7fffff] reserved
[ 0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
[ 0.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000002a17fffff] usable
[ 0.000000] NX (Execute Disable) protection: active
[ 0.000000] efi: EFI v2.50 by Lenovo
[ 0.000000] efi:  TPMFinalLog=0x4ff77000  SMBIOS=0x4f0f7000  SMBIOS 3.0=0x4f0f4000  ACPI 2.0=0x1ee3d9c1  ESRT=0x4ef81000
[ 0.000000] SMBIOS 3.0.0 present.
[ 0.000000] DMI: LENOVO 20KKS0PG01/20KKS0PG01, BIOS N1ZET79W(1.35 ) 11/28/2019
[ 0.000000] tsc: Detected 1900.000 MHz processor
[ 0.001269] tsc: Detected 1899.950 MHz TSC
[ 0.001269] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[ 0.001272] e820: remove [mem 0x000a0000-0x000fffff] usable
[ 0.001283] last_pfn = 0x2a1800 max_arch_pfn = 0x400000000
[ 0.001288] MTRR default type: write-back
[ 0.001289] MTRR fixed ranges enabled:
[ 0.001291]    00000-9FFFF write-back
[ 0.001293]    A0000-BFFFF uncachable
[ 0.001294]    C0000-FFFFF write-protect
[ 0.001295] MTRR variable ranges enabled:
[ 0.001297]    0 base 0080000000 mask 7F80000000 uncachable
[ 0.001299]    1 base 0060000000 mask 7FE0000000 uncachable
[ 0.001300]    2 base 005C000000 mask 7FFC000000 uncachable
[ 0.001301]    3 base 005A000000 mask 7FFE000000 uncachable
[ 0.001303]    4 base 2000000000 mask 7000000000 uncachable
[ 0.001304]    5 disabled
[ 0.001305]    6 disabled
[ 0.001305]    7 disabled
[ 0.001306]    8 disabled
[ 0.001307]    9 disabled
[ 0.002183] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[ 0.002630] last_pfn = 0x50000 max_arch_pfn = 0x400000000
[ 0.021954] esrt: Reserving ESRT space from 0x000000004ef81000 to 0x000000004ef810b0.
[ 0.021966] check: Scanning 1 areas for low memory corruption
[ 0.021976] Using GB pages for direct mapping
[ 0.021988] BRK [0x26d201000, 0x26d201fff] PGTABLE
[ 0.021992] BRK [0x26d202000, 0x26d202fff] PGTABLE
[ 0.021994] BRK [0x26d203000, 0x26d203fff] PGTABLE
[ 0.022041] BRK [0x26d204000, 0x26d204fff] PGTABLE
[ 0.022043] BRK [0x26d205000, 0x26d205fff] PGTABLE
[ 0.022267] BRK [0x26d206000, 0x26d206fff] PGTABLE
[ 0.022304] BRK [0x26d207000, 0x26d207fff] PGTABLE
[ 0.022366] BRK [0x26d208000, 0x26d208fff] PGTABLE
[ 0.022442] BRK [0x26d209000, 0x26d209fff] PGTABLE
[ 0.022508] BRK [0x26d20a000, 0x26d20afff] PGTABLE
[ 0.022612] BRK [0x26d20b000, 0x26d20bfff] PGTABLE
[ 0.022692] Secure boot could not be determined
[ 0.022693] RAMDISK: [mem 0x34240000-0x35f33fff]
[ 0.022707] ACPI: Early table checksum verification disabled
[ 0.022712] ACPI: RSDP 0x000000001EE3D9C1 000024 (v02 LENOVO)
[ 0.022717] ACPI: XSDT 0x000000001EE3D89D 000124 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022726] ACPI: UEFI 0x000000001EE2583F 00013E (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022731] ACPI: BGRT 0x000000001EE2597D 000038 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022735] ACPI: FPDT 0x000000001EE259B5 000044 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022739] ACPI: ASF! 0x000000001EE259F9 0000A0 (v32 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022743] ACPI: NHLT 0x000000001EE25A99 00002D (v00 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022747] ACPI: DMAR 0x000000001EE25AC6 0000A8 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022751] ACPI: MSDM 0x000000001EE25B6E 000055 (v03 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022755] ACPI: DBG2 0x000000001EE25BC3 000054 (v00 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022759] ACPI: DBGP 0x000000001EE25C17 000034 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022763] ACPI: SSDT 0x000000001EE25C4B 000544 (v02 LENOVO TbtTypeC 00000000 INTL 20160527)
[ 0.022767] ACPI: SSDT 0x000000001EE2618F 00029F (v02 LENOVO sensrhub 00000000 INTL 20160527)
[ 0.022771] ACPI: SSDT 0x000000001EE2642E 000141 (v02 LENOVO HdaDsp   00000000 INTL 20160527)
[ 0.022776] ACPI: WSMT 0x000000001EE2656F 000028 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022779] ACPI: LPIT 0x000000001EE26597 000094 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022783] ACPI: SSDT 0x000000001EE2662B 000B0A (v02 LENOVO UsbCTabl 00001000 INTL 20160527)
[ 0.022788] ACPI: SSDT 0x000000001EE27135 00056D (v02 LENOVO CtdpB    00001000 INTL 20160527)
[ 0.022792] ACPI: SSDT 0x000000001EE276A2 0017AE (v02 LENOVO CpuSsdt  00003000 INTL 20160527)
[ 0.022796] ACPI: BATB 0x000000001EE28E50 00004A (v02 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022800] ACPI: BOOT 0x000000001EE28E9A 000028 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022804] ACPI: SSDT 0x000000001EE28EC2 0015AE (v02 LENOVO ProjSsdt 00000010 INTL 20160527)
[ 0.022813] ACPI: SSDT 0x000000001EE2A470 002025 (v02 LENOVO RVP7Rtd3 00001000 INTL 20160527)
[ 0.022820] ACPI: ECDT 0x000000001EE2C495 000053 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022824] ACPI: MCFG 0x000000001EE2C4E8 00003C (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022828] ACPI: APIC 0x000000001EE2C524 00012C (v03 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022832] ACPI: HPET 0x000000001EE2C650 000038 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022836] ACPI: SSDT 0x000000001EE2C688 0005C6 (v02 LENOVO PerfTune 00001000 INTL 20160527)
[ 0.022840] ACPI: SSDT 0x000000001EE2CC4E 0030B0 (v02 LENOVO SaSsdt   00003000 INTL 20160527)
[ 0.022844] ACPI: UEFI 0x000000001EE2FCFE 000042 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022848] ACPI: TPM2 0x000000001EE2FD40 000034 (v03 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022852] ACPI: SSDT 0x000000001EE2FD74 0003DB (v02 LENOVO Tpm2Tabl 00001000 INTL 20160527)
[ 0.022856] ACPI: SSDT 0x000000001EE3014F 00D5B6 (v02 LENOVO DptfTabl 00001000 INTL 20160527)
[ 0.022860] ACPI: FACP 0x000000001EE3D705 0000F4 (v05 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.022867] ACPI: DSDT 0x000000001EDFD000 02883F (v02 LENOVO SKL      00000000 INTL 20200110)
[ 0.022872] ACPI: FACS 0x000000004FF23000 000040
[ 0.022875] ACPI: FACS 0x000000004FF23000 000040
[ 0.022886] ACPI: Local APIC address 0xfee00000
[ 0.023125] No NUMA configuration found
[ 0.023127] Faking a node at [mem 0x0000000000000000-0x00000002a17fffff]
[ 0.023132] NODE_DATA(0) allocated [mem 0x2a17fc000-0x2a17fffff]
[ 0.023181] Zone ranges:
[ 0.023182]    DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[ 0.023184]    DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[ 0.023185]    Normal   [mem 0x0000000100000000-0x00000002a17fffff]
[ 0.023187]    Device   empty
[ 0.023188] Movable zone start for each node
[ 0.023189] Early memory node ranges
[ 0.023191] node 0: [mem 0x0000000000001000-0x0000000000057fff]
[ 0.023192] node 0: [mem 0x0000000000059000-0x000000000009bfff]
[ 0.023193] node 0: [mem 0x0000000000100000-0x000000001edfcfff]
[ 0.023194] node 0: [mem 0x000000001ee3e000-0x00000000219e2fff]
[ 0.023195] node 0: [mem 0x00000000219e5000-0x000000004ee58fff]
[ 0.023196] node 0: [mem 0x000000004ffff000-0x000000004fffffff]
[ 0.023197] node 0: [mem 0x0000000100000000-0x00000002a17fffff]
[ 0.023264] Zeroed struct page in unavailable ranges: 4687 pages
[ 0.023266] Initmem setup node 0 [mem 0x0000000000001000-0x00000002a17fffff]
[ 0.023269] On node 0 totalpages: 2033073
[ 0.023270] DMA zone: 64 pages used for memmap
[ 0.023271] DMA zone: 22 pages reserved
[ 0.023273] DMA zone: 3994 pages, LIFO batch:0
[ 0.023371] DMA32 zone: 4985 pages used for memmap
[ 0.023373] DMA32 zone: 318999 pages, LIFO batch:63
[ 0.037525] Normal zone: 26720 pages used for memmap
[ 0.037526] Normal zone: 1710080 pages, LIFO batch:63
[ 0.073934] Reserving Intel graphics memory at [mem 0x5a800000-0x5c7fffff]
[ 0.074257] ACPI: PM-Timer IO Port: 0x1808
[ 0.074259] ACPI: Local APIC address 0xfee00000
[ 0.074269] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[ 0.074270] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[ 0.074271] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[ 0.074272] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[ 0.074273] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[ 0.074274] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[ 0.074275] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[ 0.074276] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[ 0.074277] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[ 0.074278] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[ 0.074279] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[ 0.074279] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[ 0.074280] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[ 0.074281] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[ 0.074282] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[ 0.074283] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[ 0.074319] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[ 0.074324] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[ 0.074332] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[ 0.074338] ACPI: IRQ0 used by override.
[ 0.074340] ACPI: IRQ9 used by override.
[ 0.074343] Using ACPI (MADT) for SMP configuration information
[ 0.074345] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[ 0.074354] e820: update [mem 0x48b8d000-0x48cecfff] usable ==> reserved
[ 0.074366] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[ 0.074396] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[ 0.074399] PM: Registered nosave memory: [mem 0x00058000-0x00058fff]
[ 0.074401] PM: Registered nosave memory: [mem 0x0009c000-0x0009cfff]
[ 0.074402] PM: Registered nosave memory: [mem 0x0009d000-0x000fffff]
[ 0.074404] PM: Registered nosave memory: [mem 0x1edfd000-0x1ee3dfff]
[ 0.074406] PM: Registered nosave memory: [mem 0x219e3000-0x219e3fff]
[ 0.074407] PM: Registered nosave memory: [mem 0x219e4000-0x219e4fff]
[ 0.074409] PM: Registered nosave memory: [mem 0x48b8d000-0x48cecfff]
[ 0.074412] PM: Registered nosave memory: [mem 0x4ee59000-0x4ef32fff]
[ 0.074413] PM: Registered nosave memory: [mem 0x4ef33000-0x4ff10fff]
[ 0.074413] PM: Registered nosave memory: [mem 0x4ff11000-0x4ff7efff]
[ 0.074414] PM: Registered nosave memory: [mem 0x4ff7f000-0x4fffefff]
[ 0.074417] PM: Registered nosave memory: [mem 0x50000000-0x57ffffff]
[ 0.074418] PM: Registered nosave memory: [mem 0x58000000-0x585fffff]
[ 0.074418] PM: Registered nosave memory: [mem 0x58600000-0x5c7fffff]
[ 0.074419] PM: Registered nosave memory: [mem 0x5c800000-0xefffffff]
[ 0.074420] PM: Registered nosave memory: [mem 0xf0000000-0xf7ffffff]
[ 0.074421] PM: Registered nosave memory: [mem 0xf8000000-0xfe00ffff]
[ 0.074422] PM: Registered nosave memory: [mem 0xfe010000-0xfe010fff]
[ 0.074423] PM: Registered nosave memory: [mem 0xfe011000-0xffffffff]
[ 0.074425] [mem 0x5c800000-0xefffffff] available for PCI devices
[ 0.074427] Booting paravirtualized kernel on bare hardware
[ 0.074431] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[ 0.226255] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:8 nr_node_ids:1
[ 0.226565] percpu: Embedded 54 pages/cpu s184320 r8192 d28672 u262144
[ 0.226575] pcpu-alloc: s184320 r8192 d28672 u262144 alloc=1*2097152
[ 0.226577] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
[ 0.226609] Built 1 zonelists, mobility grouping on. Total pages: 2001282
[ 0.226611] Policy zone: Normal
[ 0.226613] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.4-x86_64 root=UUID=c9ad2991-8862-4e66-934c-12a746df30f6 rw quiet apparmor=1 security=apparmor resume=UUID=d22f4cd6-54d3-4f6c-ada2-7dc78de3cb4d udev.log_priority=3 mem_sleep_default=deep
[ 0.227487] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[ 0.227863] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[ 0.227982] mem auto-init: stack:byref_all, heap alloc:on, heap free:off
[ 0.233864] Calgary: detecting Calgary via BIOS EBDA area
[ 0.233867] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[ 0.264067] Memory: 7748804K/8132292K available (12291K kernel code, 1329K rwdata, 4100K rodata, 1660K init, 3428K bss, 383488K reserved, 0K cma-reserved)
[ 0.264276] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[ 0.264303] Kernel/User page tables isolation: enabled
[ 0.264325] ftrace: allocating 38506 entries in 151 pages
[ 0.288997] rcu: Preemptible hierarchical RCU implementation.
[ 0.288999] rcu: 	RCU dyntick-idle grace-period acceleration is enabled.
[ 0.289000] rcu: 	RCU restricting CPUs from NR_CPUS=320 to nr_cpu_ids=8.
[ 0.289001] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[ 0.289002] 	Tasks RCU enabled.
[ 0.289003] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[ 0.289004] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[ 0.293321] NR_IRQS: 20736, nr_irqs: 2048, preallocated irqs: 16
[ 0.293756] random: get_random_bytes called from start_kernel+0x390/0x56b with crng_init=0
[ 0.293789] Console: colour dummy device 80x25
[ 0.293796] printk: console [tty0] enabled
[ 0.293820] ACPI: Core revision 20190816
[ 0.294273] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[ 0.294357] APIC: Switch to symmetric I/O mode setup
[ 0.294371] DMAR: Host address width 39
[ 0.294374] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[ 0.294384] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 19e2ff0505e
[ 0.294386] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[ 0.294391] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[ 0.294392] DMAR: RMRR base: 0x0000004f45f000 end: 0x0000004f47efff
[ 0.294394] DMAR: RMRR base: 0x0000005a000000 end: 0x0000005c7fffff
[ 0.294396] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[ 0.294397] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[ 0.294398] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[ 0.296127] DMAR-IR: Enabled IRQ remapping in x2apic mode
[ 0.296129] x2apic enabled
[ 0.296147] Switched APIC routing to cluster x2apic.
[ 0.300261] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[ 0.314284] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x36c5f9386c6, max_idle_ns: 881590416379 ns
[ 0.314291] Calibrating delay loop (skipped), value calculated using timer frequency.. 3801.22 BogoMIPS (lpj=6333166)
[ 0.314294] pid_max: default: 32768 minimum: 301
[ 0.320772] LSM: Security Framework initializing
[ 0.320778] Yama: becoming mindful.
[ 0.320845] AppArmor: AppArmor initialized
[ 0.320889] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[ 0.320909] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[ 0.320925] *** VALIDATE tmpfs ***
[ 0.321172] *** VALIDATE proc ***
[ 0.321255] *** VALIDATE cgroup1 ***
[ 0.321256] *** VALIDATE cgroup2 ***
[ 0.321336] mce: CPU0: Thermal monitoring enabled (TM1)
[ 0.321373] process: using mwait in idle threads
[ 0.321377] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[ 0.321378] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[ 0.321382] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[ 0.321385] Spectre V2 : Mitigation: Full generic retpoline
[ 0.321386] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[ 0.321386] Spectre V2 : Enabling Restricted Speculation for firmware calls
[ 0.321389] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[ 0.321389] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[ 0.321391] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[ 0.321396] TAA: Mitigation: Clear CPU buffers
[ 0.321397] MDS: Mitigation: Clear CPU buffers
[ 0.321947] Freeing SMP alternatives memory: 32K
[ 0.324428] TSC deadline timer enabled
[ 0.324436] smpboot: CPU0: Intel(R) Core(TM) i5-8350U CPU @ 1.70GHz (family: 0x6, model: 0x8e, stepping: 0xa)
[ 0.344324] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[ 0.344367] ... version:                4
[ 0.344368] ... bit width:              48
[ 0.344369] ... generic registers:      4
[ 0.344370] ... value mask:             0000ffffffffffff
[ 0.344371] ... max period:             00007fffffffffff
[ 0.344372] ... fixed-purpose events:   3
[ 0.344372] ... event mask:             000000070000000f
[ 0.350972] rcu: Hierarchical SRCU implementation.
[ 0.374612] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[ 0.380989] smp: Bringing up secondary CPUs ...
[ 0.421028] x86: Booting SMP configuration:
[ 0.421029] .... node #0, CPUs:      #1 #2 #3 #4
[ 0.541727] *MDS CPU bug present and SMT on, data leak possible. See 
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for 
more details.*
[ 0.541727] *TAA CPU bug present and SMT on, data leak possible. See 
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html 
for more details.*
[ 0.581035] *#5 #6 #7*
[ 0.661645] smp: Brought up 1 node, 8 CPUs
[ 0.661645] smpboot: Max logical packages: 1
[ 0.661645] smpboot: Total of 8 processors activated (30411.83 BogoMIPS)
[ 0.664721] devtmpfs: initialized
[ 0.664721] x86/mm: Memory block size: 128MB
[ 0.665487] PM: Registering ACPI NVS region [mem 0x219e3000-0x219e3fff] (4096 bytes)
[ 0.665487] PM: Registering ACPI NVS region [mem 0x4ff11000-0x4ff7efff] (450560 bytes)
[ 0.665487] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[ 0.665487] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[ 0.665487] pinctrl core: initialized pinctrl subsystem
[ 0.665487] PM: RTC time: 16:31:43, date: 2020-02-07
[ 0.665487] NET: Registered protocol family 16
[ 0.665487] audit: initializing netlink subsys (disabled)
[ 0.665487] audit: type=2000 audit(1581093102.369:1): state=initialized audit_enabled=0 res=1
[ 0.665487] cpuidle: using governor ladder
[ 0.670991] cpuidle: using governor menu
[ 0.674315] Simple Boot Flag at 0x47 set to 0x1
[ 0.674339] KVM setup pv remote TLB flush
[ 0.674344] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[ 0.674346] ACPI: bus type PCI registered
[ 0.674348] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[ 0.674791] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000-0xf7ffffff] (base 0xf0000000)
[ 0.674795] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
[ 0.674810] PCI: Using configuration type 1 for base access
[ 0.675579] ENERGY_PERF_BIAS*: Set to 'normal', was 'performance'*
[ 0.677682] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[ 0.677682] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[ 0.681117] ACPI: Added _OSI(Module Device)
[ 0.681119] ACPI: Added _OSI(Processor Device)
[ 0.681120] ACPI: Added _OSI(3.0 _SCP Extensions)
[ 0.681121] ACPI: Added _OSI(Processor Aggregator Device)
[ 0.681123] ACPI: Added _OSI(Linux-Dell-Video)
[ 0.681124] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[ 0.681126] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[ 0.785039] ACPI: 13 ACPI AML tables successfully acquired and loaded
[ 0.788470] ACPI: EC: EC started
[ 0.788471] ACPI: EC: interrupt blocked
[ 0.792714] ACPI: \: Used as first EC
[ 0.792717] ACPI: \: GPE=0x16, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[ 0.792718] ACPI: EC: Boot ECDT EC used to handle transactions
[ 0.796077] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[ 0.821029] ACPI: Dynamic OEM Table Load:
[ 0.821039] ACPI: SSDT 0xFFFF8D54D795B000 0005AC (v02 PmRef  Cpu0Ist  00003000 INTL 20160527)
[ 0.824256] ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[ 0.825985] ACPI Warning*: \_SB.PCI0.LNK2._HID: Invalid zero-length _HID 
or _CID string (20190816/nsrepair2-507)*
[ 0.826494] ACPI Warning*: \_SB.PCI0.LNK2._CID: Invalid zero-length _HID 
or _CID string (20190816/nsrepair2-507)*
[ 0.827874] ACPI: Dynamic OEM Table Load:
[ 0.827883] ACPI: SSDT 0xFFFF8D54D767E800 0003FF (v02 PmRef  Cpu0Cst  00003001 INTL 20160527)
[ 0.831016] ACPI: Dynamic OEM Table Load:
[ 0.831023] ACPI: SSDT 0xFFFF8D54D78EC0C0 0000BA (v02 PmRef  Cpu0Hwp  00003000 INTL 20160527)
[ 0.833994] ACPI: Dynamic OEM Table Load:
[ 0.834002] ACPI: SSDT 0xFFFF8D54D795F000 000628 (v02 PmRef  HwpLvt   00003000 INTL 20160527)
[ 0.837714] ACPI: Dynamic OEM Table Load:
[ 0.837725] ACPI: SSDT 0xFFFF8D54D79AF000 000D14 (v02 PmRef  ApIst    00003000 INTL 20160527)
[ 0.842168] ACPI: Dynamic OEM Table Load:
[ 0.842177] ACPI: SSDT 0xFFFF8D54D767D400 000317 (v02 PmRef  ApHwp    00003000 INTL 20160527)
[ 0.845399] ACPI: Dynamic OEM Table Load:
[ 0.845407] ACPI: SSDT 0xFFFF8D54D7678400 00030A (v02 PmRef  ApCst    00003000 INTL 20160527)
[ 0.854887] ACPI: Interpreter enabled
[ 0.854969] ACPI: (supports S0 S3 S4 S5)
[ 0.854971] ACPI: Using IOAPIC for interrupt routing
[ 0.855048] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[ 0.857827] ACPI: Enabled 7 GPEs in block 00 to 7F
[ 0.865596] ACPI: Power Resource [PUBS] (on)
[ 0.887326] ACPI: Power Resource [PAUD] (on)
[ 0.889888] ACPI: Power Resource [WRST] (on)
[ 0.893230] ACPI: Power Resource [PXP] (on)
[ 0.909801] ACPI: Power Resource [PXTC] (on)
[ 1.124514] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-7e])
[ 1.124524] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[ 1.124819] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME AER PCIeCapability]
[ 1.124955] acpi PNP0A08:00: _OSC: not requesting control; platform does not support [PCIeCapability]
[ 1.124957] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR]
[ 1.124959] acpi PNP0A08:00: _OSC: platform willing to grant [LTR]
[ 1.124961] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM
[ 1.129222] PCI host bridge to bus 0000:00
[ 1.129226] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[ 1.129228] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[ 1.129230] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[ 1.129232] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3fff window]
[ 1.129233] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]
[ 1.129235] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbfff window]
[ 1.129236] pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cffff window]
[ 1.129238] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff window]
[ 1.129239] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff window]
[ 1.129241] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff window]
[ 1.129242] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff window]
[ 1.129244] pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3fff window]
[ 1.129245] pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7fff window]
[ 1.129247] pci_bus 0000:00: root bus resource [mem 0x000e8000-0x000ebfff window]
[ 1.129248] pci_bus 0000:00: root bus resource [mem 0x000ec000-0x000effff window]
[ 1.129250] pci_bus 0000:00: root bus resource [mem 0x000f0000-0x000fffff window]
[ 1.129251] pci_bus 0000:00: root bus resource [mem 0x5c800000-0xefffffff window]
[ 1.129253] pci_bus 0000:00: root bus resource [mem 0x2000000000-0x2fffffffff window]
[ 1.129255] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
[ 1.129257] pci_bus 0000:00: root bus resource [bus 00-7e]
[ 1.129275] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000
[ 1.131255] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000
[ 1.131273] pci 0000:00:02.0: reg 0x10: [mem 0x2ffa000000-0x2ffaffffff 64bit]
[ 1.131283] pci 0000:00:02.0: reg 0x18: [mem 0x2fa0000000-0x2fafffffff 64bit pref]
[ 1.131290] pci 0000:00:02.0: reg 0x20: [io  0xe000-0xe03f]
[ 1.131316] pci 0000:00:02.0: BAR 2: assigned to efifb
[ 1.132867] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[ 1.132886] pci 0000:00:04.0: reg 0x10: [mem 0x2ffb430000-0x2ffb437fff 64bit]
[ 1.134560] pci 0000:00:05.0: [8086:1919] type 00 class 0x048000
[ 1.134578] pci 0000:00:05.0: reg 0x10: [mem 0x2ffb000000-0x2ffb3fffff 64bit]
[ 1.136125] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
[ 1.136145] pci 0000:00:08.0: reg 0x10: [mem 0x2ffb445000-0x2ffb445fff 64bit]
[ 1.137707] pci 0000:00:13.0: [8086:9d35] type 00 class 0x000000
[ 1.137736] pci 0000:00:13.0: reg 0x10: [mem 0x2ffb444000-0x2ffb444fff 64bit]
[ 1.139421] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[ 1.139453] pci 0000:00:14.0: reg 0x10: [mem 0x2ffb420000-0x2ffb42ffff 64bit]
[ 1.139550] pci 0000:00:14.0: PME# supported from D3hot D3cold
[ 1.141303] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[ 1.141331] pci 0000:00:14.2: reg 0x10: [mem 0x2ffb443000-0x2ffb443fff 64bit]
[ 1.142927] pci 0000:00:14.3: [8086:9d32] type 00 class 0x048000
[ 1.143041] pci 0000:00:14.3: reg 0x10: [mem 0x2ffb410000-0x2ffb41ffff 64bit]
[ 1.145011] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[ 1.145276] pci 0000:00:15.0: reg 0x10: [mem 0x2ffb442000-0x2ffb442fff 64bit]
[ 1.147814] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[ 1.148077] pci 0000:00:15.1: reg 0x10: [mem 0x2ffb441000-0x2ffb441fff 64bit]
[ 1.150605] pci 0000:00:15.2: [8086:9d62] type 00 class 0x118000
[ 1.150869] pci 0000:00:15.2: reg 0x10: [mem 0x2ffb440000-0x2ffb440fff 64bit]
[ 1.153335] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[ 1.153385] pci 0000:00:16.0: reg 0x10: [mem 0x2ffb43f000-0x2ffb43ffff 64bit]
[ 1.153530] pci 0000:00:16.0: PME# supported from D3hot
[ 1.155181] pci 0000:00:16.3: [8086:9d3d] type 00 class 0x070002
[ 1.155209] pci 0000:00:16.3: reg 0x10: [io  0xe060-0xe067]
[ 1.155221] pci 0000:00:16.3: reg 0x14: [mem 0xee404000-0xee404fff]
[ 1.156827] pci 0000:00:1c.0: [8086:9d11] type 01 class 0x060400
[ 1.156951] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[ 1.158646] pci 0000:00:1c.3: [8086:9d13] type 01 class 0x060400
[ 1.158769] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[ 1.160443] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
[ 1.160577] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[ 1.162263] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
[ 1.162387] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[ 1.164138] pci 0000:00:1e.0: [8086:9d27] type 00 class 0x118000
[ 1.164403] pci 0000:00:1e.0: reg 0x10: [mem 0x2ffb43e000-0x2ffb43efff 64bit]
[ 1.166955] pci 0000:00:1e.3: [8086:9d2a] type 00 class 0x118000
[ 1.167220] pci 0000:00:1e.3: reg 0x10: [mem 0x2ffb43d000-0x2ffb43dfff 64bit]
[ 1.169693] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100
[ 1.171446] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[ 1.171466] pci 0000:00:1f.2: reg 0x10: [mem 0xee400000-0xee403fff]
[ 1.173128] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380
[ 1.173165] pci 0000:00:1f.3: reg 0x10: [mem 0x2ffb438000-0x2ffb43bfff 64bit]
[ 1.173207] pci 0000:00:1f.3: reg 0x20: [mem 0x2ffb400000-0x2ffb40ffff 64bit]
[ 1.173280] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[ 1.174980] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[ 1.175038] pci 0000:00:1f.4: reg 0x10: [mem 0x2ffb43c000-0x2ffb43c0ff 64bit]
[ 1.175092] pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
[ 1.176912] pci 0000:02:00.0: [10ec:522a] type 00 class 0xff0000
[ 1.176943] pci 0000:02:00.0: reg 0x10: [mem 0xee300000-0xee300fff]
[ 1.177150] pci 0000:02:00.0: supports D1 D2
[ 1.177152] pci 0000:02:00.0: PME# supported from D1 D2 D3hot D3cold
[ 1.177391] pci 0000:00:1c.0: PCI bridge to [bus 02]
[ 1.177397] pci 0000:00:1c.0:   bridge window [mem 0xee300000-0xee3fffff]
[ 1.177810] pci 0000:04:00.0: [8086:24fd] type 00 class 0x028000
[ 1.177960] pci 0000:04:00.0: reg 0x10: [mem 0xee200000-0xee201fff 64bit]
[ 1.178553] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
[ 1.179476] pci 0000:00:1c.3: PCI bridge to [bus 04]
[ 1.179482] pci 0000:00:1c.3:   bridge window [mem 0xee200000-0xee2fffff]
[ 1.179784] pci 0000:05:00.0: [144d:a804] type 00 class 0x010802
[ 1.179817] pci 0000:05:00.0: reg 0x10: [mem 0xee100000-0xee103fff 64bit]
[ 1.180317] pci 0000:00:1c.4: PCI bridge to [bus 05]
[ 1.180323] pci 0000:00:1c.4:   bridge window [mem 0xee100000-0xee1fffff]
[ 1.180396] pci 0000:00:1d.0: PCI bridge to [bus 06-70]
[ 1.180404] pci 0000:00:1d.0:   bridge window [mem 0xc0000000-0xee0fffff]
[ 1.180413] pci 0000:00:1d.0:   bridge window [mem 0x2fb0000000-0x2ff9ffffff 64bit pref]
[ 1.189623] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.189743] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[ 1.189861] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.189977] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.190092] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.190208] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.190324] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.190439] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.202615] ACPI: EC: interrupt unblocked
[ 1.202615] ACPI: EC: event unblocked
[ 1.202615] ACPI: \_SB_.PCI0.LPCB.EC__: GPE=0x16, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[ 1.202615] ACPI: \_SB_.PCI0.LPCB.EC__: Boot DSDT EC used to handle transactions and events
[ 1.202615] iommu: Default domain type: Translated
[ 1.202615] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=mem,locks=none
[ 1.202615] pci 0000:00:02.0: vgaarb: bridge control possible
[ 1.202615] pci 0000:00:02.0: vgaarb: setting as boot device
[ 1.202615] vgaarb: loaded
[ 1.202615] ACPI: bus type USB registered
[ 1.202615] usbcore: registered new interface driver usbfs
[ 1.202615] usbcore: registered new interface driver hub
[ 1.202619] usbcore: registered new device driver usb
[ 1.202619] pps_core: LinuxPPS API ver. 1 registered
[ 1.202619] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti<giometti@linux.it>
[ 1.202619] PTP clock support registered
[ 1.202619] EDAC MC: Ver: 3.0.0
[ 1.204817] Registered efivars operations
[ 1.204817] PCI: Using ACPI for IRQ routing
[ 1.210953] PCI: pci_cache_line_size set to 64 bytes
[ 1.212340] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[ 1.212342] e820: reserve RAM buffer [mem 0x0009c000-0x0009ffff]
[ 1.212343] e820: reserve RAM buffer [mem 0x1edfd000-0x1fffffff]
[ 1.212344] e820: reserve RAM buffer [mem 0x219e3000-0x23ffffff]
[ 1.212346] e820: reserve RAM buffer [mem 0x48b8d000-0x4bffffff]
[ 1.212347] e820: reserve RAM buffer [mem 0x4ee59000-0x4fffffff]
[ 1.212349] e820: reserve RAM buffer [mem 0x2a1800000-0x2a3ffffff]
[ 1.212492] NetLabel: Initializing
[ 1.212493] NetLabel:  domain hash size = 128
[ 1.212493] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[ 1.212512] NetLabel:  unlabeled traffic allowed by default
[ 1.212519] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[ 1.212519] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[ 1.214375] clocksource: Switched to clocksource tsc-early
[ 1.231184] *** VALIDATE bpf ***
[ 1.231298] VFS: Disk quotas dquot_6.6.0
[ 1.231318] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[ 1.231353] *** VALIDATE ramfs ***
[ 1.231358] *** VALIDATE hugetlbfs ***
[ 1.231493] AppArmor: AppArmor Filesystem Enabled
[ 1.231544] pnp: PnP ACPI init
[ 1.231966] system 00:00: [mem 0xfd000000-0xfdabffff] has been reserved
[ 1.231968] system 00:00: [mem 0xfdad0000-0xfdadffff] has been reserved
[ 1.231970] system 00:00: [mem 0xfdb00000-0xfdffffff] has been reserved
[ 1.231973] system 00:00: [mem 0xfe000000-0xfe01ffff] could not be reserved
[ 1.231975] system 00:00: [mem 0xfe036000-0xfe03bfff] has been reserved
[ 1.231977] system 00:00: [mem 0xfe03d000-0xfe3fffff] has been reserved
[ 1.231978] system 00:00: [mem 0xfe420000-0xfe7fffff] has been reserved
[ 1.231985] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.232564] system 00:01: [io  0xff00-0xfffe] has been reserved
[ 1.232570] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.233470] system 00:02: [io  0x0680-0x069f] has been reserved
[ 1.233472] system 00:02: [io  0xffff] has been reserved
[ 1.233473] system 00:02: [io  0xffff] has been reserved
[ 1.233475] system 00:02: [io  0xffff] has been reserved
[ 1.233477] system 00:02: [io  0x1800-0x18fe] has been reserved
[ 1.233479] system 00:02: [io  0x164e-0x164f] has been reserved
[ 1.233484] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.233664] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
[ 1.233736] system 00:04: [io  0x1854-0x1857] has been reserved
[ 1.233741] system 00:04: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[ 1.233774] pnp 00:05: Plug and Play ACPI device, IDs LEN0071 PNP0303 (active)
[ 1.233991] system 00:06: [io  0x1800-0x189f] could not be reserved
[ 1.233993] system 00:06: [io  0x0800-0x087f] has been reserved
[ 1.233995] system 00:06: [io  0x0880-0x08ff] has been reserved
[ 1.233997] system 00:06: [io  0x0900-0x097f] has been reserved
[ 1.233998] system 00:06: [io  0x0980-0x09ff] has been reserved
[ 1.234000] system 00:06: [io  0x0a00-0x0a7f] has been reserved
[ 1.234002] system 00:06: [io  0x0a80-0x0aff] has been reserved
[ 1.234004] system 00:06: [io  0x0b00-0x0b7f] has been reserved
[ 1.234006] system 00:06: [io  0x0b80-0x0bff] has been reserved
[ 1.234007] system 00:06: [io  0x15e0-0x15ef] has been reserved
[ 1.234009] system 00:06: [io  0x1600-0x167f] could not be reserved
[ 1.234011] system 00:06: [io  0x1640-0x165f] could not be reserved
[ 1.234014] system 00:06: [mem 0xf0000000-0xf7ffffff] has been reserved
[ 1.234016] system 00:06: [mem 0xfed10000-0xfed13fff] has been reserved
[ 1.234018] system 00:06: [mem 0xfed18000-0xfed18fff] has been reserved
[ 1.234020] system 00:06: [mem 0xfed19000-0xfed19fff] has been reserved
[ 1.234022] system 00:06: [mem 0xfeb00000-0xfebfffff] has been reserved
[ 1.234024] system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved
[ 1.234026] system 00:06: [mem 0xfed90000-0xfed93fff] could not be reserved
[ 1.234028] system 00:06: [mem 0xeffe0000-0xefffffff] has been reserved
[ 1.234033] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.236207] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.237820] system 00:08: [mem 0xfed10000-0xfed17fff] could not be reserved
[ 1.237823] system 00:08: [mem 0xfed18000-0xfed18fff] has been reserved
[ 1.237825] system 00:08: [mem 0xfed19000-0xfed19fff] has been reserved
[ 1.237827] system 00:08: [mem 0xf0000000-0xf7ffffff] has been reserved
[ 1.237829] system 00:08: [mem 0xfed20000-0xfed3ffff] has been reserved
[ 1.237831] system 00:08: [mem 0xfed90000-0xfed93fff] could not be reserved
[ 1.237833] system 00:08: [mem 0xfed45000-0xfed8ffff] has been reserved
[ 1.237835] system 00:08: [mem 0xff000000-0xffffffff] has been reserved
[ 1.237836] system 00:08: [mem 0xfee00000-0xfeefffff] has been reserved
[ 1.237839] system 00:08: [mem 0xeffe0000-0xefffffff] has been reserved
[ 1.237844] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.238890] system 00:09: [mem 0x00000000-0x0009ffff] could not be reserved
[ 1.238892] system 00:09: [mem 0x000f0000-0x000fffff] could not be reserved
[ 1.238894] system 00:09: [mem 0x00100000-0x5c7fffff] could not be reserved
[ 1.238896] system 00:09: [mem 0xfec00000-0xfed3ffff] could not be reserved
[ 1.238899] system 00:09: [mem 0xfed4c000-0xffffffff] could not be reserved
[ 1.238903] system 00:09: Plug and Play ACPI device, IDs PNP0c01 (active)
[ 1.239244] pnp: PnP ACPI: found 10 devices
[ 1.241076] thermal_sys: Registered thermal governor 'fair_share'
[ 1.241078] thermal_sys: Registered thermal governor 'bang_bang'
[ 1.241079] thermal_sys: Registered thermal governor 'step_wise'
[ 1.241080] thermal_sys: Registered thermal governor 'user_space'
[ 1.241081] thermal_sys: Registered thermal governor 'power_allocator'
[ 1.245634] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[ 1.245683] pci 0000:00:1d.0: bridge window [io  0x1000-0x0fff] to [bus 06-70] add_size 1000
[ 1.245700] pci 0000:00:1d.0: BAR 13: assigned [io  0x2000-0x2fff]
[ 1.245709] pci 0000:00:1c.0: PCI bridge to [bus 02]
[ 1.245724] pci 0000:00:1c.0:   bridge window [mem 0xee300000-0xee3fffff]
[ 1.245734] pci 0000:00:1c.3: PCI bridge to [bus 04]
[ 1.245741] pci 0000:00:1c.3:   bridge window [mem 0xee200000-0xee2fffff]
[ 1.245751] pci 0000:00:1c.4: PCI bridge to [bus 05]
[ 1.245765] pci 0000:00:1c.4:   bridge window [mem 0xee100000-0xee1fffff]
[ 1.245776] pci 0000:00:1d.0: PCI bridge to [bus 06-70]
[ 1.245782] pci 0000:00:1d.0:   bridge window [io  0x2000-0x2fff]
[ 1.245789] pci 0000:00:1d.0:   bridge window [mem 0xc0000000-0xee0fffff]
[ 1.245796] pci 0000:00:1d.0:   bridge window [mem 0x2fb0000000-0x2ff9ffffff 64bit pref]
[ 1.245805] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[ 1.245807] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[ 1.245809] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[ 1.245811] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff window]
[ 1.245812] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff window]
[ 1.245814] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff window]
[ 1.245816] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff window]
[ 1.245817] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff window]
[ 1.245819] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff window]
[ 1.245820] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff window]
[ 1.245822] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff window]
[ 1.245824] pci_bus 0000:00: resource 15 [mem 0x000e0000-0x000e3fff window]
[ 1.245825] pci_bus 0000:00: resource 16 [mem 0x000e4000-0x000e7fff window]
[ 1.245827] pci_bus 0000:00: resource 17 [mem 0x000e8000-0x000ebfff window]
[ 1.245829] pci_bus 0000:00: resource 18 [mem 0x000ec000-0x000effff window]
[ 1.245830] pci_bus 0000:00: resource 19 [mem 0x000f0000-0x000fffff window]
[ 1.245832] pci_bus 0000:00: resource 20 [mem 0x5c800000-0xefffffff window]
[ 1.245834] pci_bus 0000:00: resource 21 [mem 0x2000000000-0x2fffffffff window]
[ 1.245835] pci_bus 0000:00: resource 22 [mem 0xfd000000-0xfe7fffff window]
[ 1.245837] pci_bus 0000:02: resource 1 [mem 0xee300000-0xee3fffff]
[ 1.245839] pci_bus 0000:04: resource 1 [mem 0xee200000-0xee2fffff]
[ 1.245841] pci_bus 0000:05: resource 1 [mem 0xee100000-0xee1fffff]
[ 1.245843] pci_bus 0000:06: resource 0 [io  0x2000-0x2fff]
[ 1.245845] pci_bus 0000:06: resource 1 [mem 0xc0000000-0xee0fffff]
[ 1.245846] pci_bus 0000:06: resource 2 [mem 0x2fb0000000-0x2ff9ffffff 64bit pref]
[ 1.246181] NET: Registered protocol family 2
[ 1.246391] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
[ 1.246454] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
[ 1.246643] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[ 1.246753] TCP: Hash tables configured (established 65536 bind 65536)
[ 1.246804] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[ 1.246838] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
[ 1.246970] NET: Registered protocol family 1
[ 1.246977] NET: Registered protocol family 44
[ 1.246993] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[ 1.248219] PCI: CLS 0 bytes, default 64
[ 1.248269] Trying to unpack rootfs image as initramfs...
[ 2.022976] Freeing initrd memory: 29648K
[ 2.041053] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[ 2.041056] software IO TLB: mapped [mem 0x43eae000-0x47eae000] (64MB)
[ 2.041354] check: Scanning for low memory corruption every 60 seconds
[ 2.041970] Initialise system trusted keyrings
[ 2.041982] Key type blacklist registered
[ 2.042043] workingset: timestamp_bits=41 max_order=21 bucket_order=0
[ 2.043811] zbud: loaded
[ 2.051048] Key type asymmetric registered
[ 2.051049] Asymmetric key parser 'x509' registered
[ 2.051059] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[ 2.051145] io scheduler mq-deadline registered
[ 2.051146] io scheduler kyber registered
[ 2.051182] io scheduler bfq registered
[ 2.052951] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[ 2.053106] efifb: probing for efifb
[ 2.053137] efifb: showing boot graphics
[ 2.057565] efifb: framebuffer at 0x2fa0000000, using 23552k, total 23552k
[ 2.057567] efifb: mode is 3000x2000x32, linelength=12032, pages=1
[ 2.057568] efifb: scrolling: redraw
[ 2.057571] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[ 2.057640] fbcon: Deferring console take-over
[ 2.057641] fb0: EFI VGA frame buffer device
[ 2.057652] intel_idle: MWAIT substates: 0x11142120
[ 2.057654] intel_idle: v0.4.1 model 0x8E
[ 2.058313] intel_idle: lapic_timer_reliable_states 0xffffffff
[ 2.058484] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[ 2.061094] ACPI: Lid Switch [LID]
[ 2.061156] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[ 2.064409] ACPI: Power Button [PWRB]
[ 2.071274] thermal LNXTHERM:00: registered as thermal_zone0
[ 2.071276] ACPI: Thermal Zone [THM0] (46 C)
[ 2.071793] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[ 2.072804] serial 0000:00:16.3: enabling device (0000 -> 0003)
[ 2.093903] 0000:00:16.3: ttyS0 at I/O 0xe060 (irq = 19, base_baud = 115200) is a 16550A
[ 2.094413] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel<jroedel@suse.de>
[ 2.094414] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[ 2.096037] nvme nvme0: pci function 0000:05:00.0
[ 2.096084] usbcore: registered new interface driver usbserial_generic
[ 2.096089] usbserial: USB Serial support registered for generic
[ 2.096320] rtc_cmos 00:03: RTC can wake from S4
[ 2.097109] rtc_cmos 00:03: registered as rtc0
[ 2.097129] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram
[ 2.097226] intel_pstate: Intel P-state driver initializing
[ 2.098133] intel_pstate: HWP enabled
[ 2.098317] ledtrig-cpu: registered to indicate activity on CPUs
[ 2.098438] intel_pmc_core INT33A1:00:  initialized
[ 2.098549] drop_monitor: Initializing network drop monitor service
[ 2.098745] NET: Registered protocol family 10
[ 2.109046] Segment Routing with IPv6
[ 2.109073] NET: Registered protocol family 17
[ 2.109978] RAS: Correctable Errors collector initialized.
[ 2.110064] microcode: sig=0x806ea, pf=0x80, revision=0xca
[ 2.110344] microcode: Microcode Update Driver: v2.2.
[ 2.110348] IPI shorthand broadcast: enabled
[ 2.110356] sched_clock: Marking stable (2109728082, 610277)->(2116608667, -6270308)
[ 2.110544] registered taskstats version 1
[ 2.110553] Loading compiled-in X.509 certificates
[ 2.115827] Loaded X.509 cert 'Build time autogenerated kernel key: 5aa7727d55353cb69b77c1240cb20f516d1ac6c9'
[ 2.115875] zswap: loaded using pool lzo/zbud
[ 2.116109] Key type ._fscrypt registered
[ 2.116110] Key type .fscrypt registered
[ 2.125659] Key type big_key registered
[ 2.125663] AppArmor: AppArmor sha1 policy hashing enabled
[ 2.128137] PM:   Magic number: 8:674:539
[ 2.128390] rtc_cmos 00:03: setting system clock to 2020-02-07T16:31:44 UTC (1581093104)
[ 2.345446] nvme nvme0: 7/0/0 default/read/poll queues
[ 2.363723] nvme0n1: p1 p2 p3 p4 p5 p6 p7
[ 2.367761] Freeing unused decrypted memory: 2040K
[ 2.368536] Freeing unused kernel image memory: 1660K
[ 2.388002] Write protecting the kernel read-only data: 20480k
[ 2.389401] Freeing unused kernel image memory: 2012K
[ 2.390363] Freeing unused kernel image memory: 2044K
[ 2.419266] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[ 2.419267] x86/mm: Checking user space page tables
[ 2.434177] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[ 2.434179] Run /init as init process
[ 2.596005] i8042: PNP: PS/2 Controller [PNP0303:KBD] at 0x60,0x64 irq 1
[ 2.596007] i8042*: PNP: PS/2 appears to have AUX port disabled, if this 
is incorrect please boot with i8042.nopnp*
[ 2.596860] serio: i8042 KBD port at 0x60,0x64 irq 1
[ 2.598987] acpi PNP0C14:02*: duplicate WMI GUID 
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)*
[ 2.599154] acpi PNP0C14:03*: duplicate WMI GUID 
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)*
[ 2.599336] acpi PNP0C14:04*: duplicate WMI GUID 
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)*
[ 2.602424] rtsx_pci 0000:02:00.0: enabling device (0000 -> 0002)
[ 2.606703] cryptd: max_cpu_qlen set to 1000
[ 2.608622] xhci_hcd 0000:00:14.0: xHCI Host Controller
[ 2.608628] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[ 2.609770] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000081109810
[ 2.609780] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[ 2.610201] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.04
[ 2.610202] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[ 2.610203] usb usb1: Product: xHCI Host Controller
[ 2.610204] usb usb1: Manufacturer: Linux 5.4.17-1-MANJARO xhci-hcd
[ 2.610205] usb usb1: SerialNumber: 0000:00:14.0
[ 2.610488] hub 1-0:1.0: USB hub found
[ 2.610535] hub 1-0:1.0: 12 ports detected
[ 2.614019] xhci_hcd 0000:00:14.0: xHCI Host Controller
[ 2.614022] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[ 2.614026] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[ 2.614087] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.04
[ 2.614088] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[ 2.614089] usb usb2: Product: xHCI Host Controller
[ 2.614090] usb usb2: Manufacturer: Linux 5.4.17-1-MANJARO xhci-hcd
[ 2.614091] usb usb2: SerialNumber: 0000:00:14.0
[ 2.614208] hub 2-0:1.0: USB hub found
[ 2.614241] hub 2-0:1.0: 6 ports detected
[ 2.614534] AVX2 version of gcm_enc/dec engaged.
[ 2.614534] AES CTR mode by8 optimization enabled
[ 2.619773] battery: ACPI: Battery Slot [BAT0] (battery present)
[ 2.623806] random: fast init done
[ 2.628368] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input2
[ 2.669119] PM: Image not found (code -22)
[ 2.720810] EXT4-fs (nvme0n1p7): mounted filesystem with ordered data mode. Opts: (null)
[ 2.832821] systemd[1]: systemd 242.153-3-manjaro running in system mode. (+PAM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[ 2.847968] systemd[1]: Detected architecture x86-64.
[ 2.885807] systemd[1]: Set hostname to <x1tab>.
[ 2.941026] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[ 3.064735] systemd[1]: Listening on Journal Socket.
[ 3.066671] systemd[1]: Starting Load Kernel Modules...
[ 3.066784] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[ 3.066941] systemd[1]: Listening on udev Control Socket.
[ 3.067691] tsc: Refined TSC clocksource calibration: 1895.999 MHz
[ 3.067701] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x36a8d041f91, max_idle_ns: 881590460728 ns
[ 3.067736] clocksource: Switched to clocksource tsc
[ 3.067819] systemd[1]: Mounting Kernel Debug File System...
[ 3.068658] systemd[1]: Starting Setup keyboard layout...
[ 3.069667] systemd[1]: Mounting POSIX Message Queue File System...
[ 3.080688] EXT4-fs (nvme0n1p7): re-mounted. Opts: (null)
[ 3.087860] random: lvm: uninitialized urandom read (4 bytes read)
[ 3.089889] usb 1-1: New USB device found, idVendor=17ef, idProduct=60b5, bcdDevice= 0.12
[ 3.089891] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 3.089895] usb 1-1: Product: ThinkPad X1 Tablet Thin Keyboard Gen 3
[ 3.089899] usb 1-1: Manufacturer: Chicony
[ 3.095300] random: systemd-random-: uninitialized urandom read (512 bytes read)
[ 3.214302] usb 1-2: new high-speed USB device number 3 using xhci_hcd
[ 3.232633] usb 1-2*: config 1 has an invalid interface number: 12 but 
max is 1*
[ 3.232634] usb 1-2*: config 1 has an invalid interface number: 13 but 
max is 1*
[ 3.232635] usb 1-2*: config 1 has an invalid interface number: 13 but 
max is 1*
[ 3.232636] usb 1-2*: config 1 has no interface number 0*
[ 3.232637] usb 1-2*: config 1 has no interface number 1*
[ 3.233188] usb 1-2: New USB device found, idVendor=1199, idProduct=9079, bcdDevice= 0.06
[ 3.233191] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 3.233195] usb 1-2: Product: Sierra Wireless EM7455 Qualcomm® Snapdragon™ X7 LTE-A
[ 3.233196] usb 1-2: Manufacturer: Sierra Wireless, Incorporated
[ 3.233197] usb 1-2: SerialNumber: LF80552789021022
[ 3.297452] random: crng init done
[ 3.315285] audit: type=1130 audit(1581093105.682:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 3.322568] systemd-journald[377]: Received request to flush runtime journal from PID 1
[ 3.331364] audit: type=1400 audit(1581093105.699:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=394 comm="apparmor_parser"
[ 3.331733] audit: type=1400 audit(1581093105.699:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=394 comm="apparmor_parser"
[ 3.357644] usb 1-8: new high-speed USB device number 4 using xhci_hcd
[ 3.362811] audit: type=1130 audit(1581093105.729:5): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-udevd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 3.415571] usb 1-8: New USB device found, idVendor=04ca, idProduct=706b, bcdDevice= 0.23
[ 3.415577] usb 1-8: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[ 3.415581] usb 1-8: Product: Integrated Camera
[ 3.415585] usb 1-8: Manufacturer: 8SSC20F27052L1GZ81E04E4
[ 3.415588] usb 1-8: SerialNumber: 200901010001
[ 3.423984] audit: type=1400 audit(1581093105.789:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=406 comm="apparmor_parser"
[ 3.454130] input: Intel HID events as /devices/platform/INT33D5:00/input/input3
[ 3.488286] ACPI: AC Adapter [AC] (on-line)
[ 3.493106] input: Intel Virtual Button driver as /devices/pci0000:00/0000:00:1f.0/PNP0C09:00/INT33D6:00/input/input4
[ 3.496503] audit: type=1130 audit(1581093105.862:7): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-journal-flush comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 3.532451] audit: type=1400 audit(1581093105.899:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=471 comm="apparmor_parser"
[ 3.532949] audit: type=1400 audit(1581093105.899:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=471 comm="apparmor_parser"
[ 3.540975] usb 1-9: new full-speed USB device number 5 using xhci_hcd
[ 3.548206] mc: Linux media interface: v0.10
[ 3.563193] nfc: nfc_init: NFC Core ver 0.1
[ 3.563223] NET: Registered protocol family 39
[ 3.566898] tpm_tis STM7304:00: 2.0 TPM (device-id 0x0, rev-id 78)
[ 3.581715] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[ 3.581942] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[ 3.582007] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[ 3.608225] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[ 3.608593] idma64 idma64.0: Found Intel integrated DMA 64-bit
[ 3.610950] mei_me 0000:00:16.0: enabling device (0004 -> 0006)
[ 3.613322] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[ 3.613325] Non-volatile memory driver v1.3
[ 3.614143] intel_ish_ipc 0000:00:13.0: enabling device (0000 -> 0002)
[ 3.616541] Linux agpgart interface v0.103
[ 3.616968] input: PC Speaker as /devices/platform/pcspkr/input/input5
[ 3.618988] hidraw: raw HID events driver (C) Jiri Kosina
[ 3.627307] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[ 3.627309] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[ 3.627310] RAPL PMU: hw unit of domain package 2^-14 Joules
[ 3.627310] RAPL PMU: hw unit of domain dram 2^-14 Joules
[ 3.627311] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[ 3.627311] RAPL PMU: hw unit of domain psys 2^-14 Joules
[ 3.631862] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[ 3.643205] intel_rapl_common: Found RAPL domain package
[ 3.643207] intel_rapl_common: Found RAPL domain dram
[ 3.643667] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THERMAL_PCI
[ 3.644817] Adding 11718652k swap on /dev/nvme0n1p5.  Priority:-2 extents:1 across:11718652k SSFS
[ 3.649909] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[ 3.659080] audit: type=1130 audit(1581093106.026:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=lvm2-monitor comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 3.659541] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[ 3.659930] idma64 idma64.1: Found Intel integrated DMA 64-bit
[ 3.671235] intel-lpss 0000:00:15.2: enabling device (0000 -> 0002)
[ 3.671682] idma64 idma64.2: Found Intel integrated DMA 64-bit
[ 3.686088] thinkpad_acpi: ThinkPad ACPI Extras v0.26
[ 3.686090] thinkpad_acpi:http://ibm-acpi.sf.net/
[ 3.686091] thinkpad_acpi: ThinkPad BIOS N1ZET79W(1.35 ), EC N1ZHT43W
[ 3.686092] thinkpad_acpi: Lenovo ThinkPad X1 Tablet Gen 3, model 20KKS0PG01
[ 3.686328] usb 1-9: New USB device found, idVendor=8087, idProduct=0a2b, bcdDevice= 0.10
[ 3.686333] usb 1-9: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[ 3.709266] intel_rapl_common: Found RAPL domain package
[ 3.709268] intel_rapl_common: Found RAPL domain core
[ 3.709269] intel_rapl_common: Found RAPL domain uncore
[ 3.709270] intel_rapl_common: Found RAPL domain dram
[ 3.718157] i2c_hid i2c-WCOM511A:00*: i2c-WCOM511A:00 supply vdd not 
found, using dummy regulator*
[ 3.718240] i2c_hid i2c-WCOM511A:00*: i2c-WCOM511A:00 supply vddl not 
found, using dummy regulator*
[ 3.723305] thinkpad_acpi: radio switch found; radios are enabled
[ 3.724114] thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
[ 3.724116] thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
[ 3.756829] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
[ 3.762022] thinkpad_acpi: rfkill switch tpacpi_wwan_sw: radio is unblocked
[ 3.763139] intel-lpss 0000:00:1e.0: enabling device (0000 -> 0002)
[ 3.763576] idma64 idma64.3: Found Intel integrated DMA 64-bit
[ 3.764078] intel-lpss 0000:00:1e.3: enabling device (0000 -> 0002)
[ 3.766016] idma64 idma64.4: Found Intel integrated DMA 64-bit
[ 3.767658] videodev: Linux video capture interface: v2.00
[ 3.769309] resource sanity check*: requesting [mem 
0xfed10000-0xfed15fff], which spans more than pnp 00:06 [mem 
0xfed10000-0xfed13fff]*
[ 3.769319] *caller snb_uncore_imc_init_box+0x74/0xb0 [intel_uncore] 
mapping multiple BARs*
[ 3.779982] thinkpad_acpi: Standard ACPI backlight interface available, not loading native one
[ 3.792009] fuse: init (API version 7.31)
[ 3.792045] *** VALIDATE fuse ***
[ 3.792050] *** VALIDATE fuse ***
[ 3.797755] iTCO_vendor_support: vendor-support=0
[ 3.799915] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[ 3.800248] iTCO_wdt: Found a Intel PCH TCO device (Version=4, TCOBASE=0x0400)
[ 3.800403] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[ 3.820210] thinkpad_acpi: battery 1 registered (start 70, stop 90)
[ 3.820236] battery: new extension: ThinkPad Battery Extension
[ 3.821858] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/input6
[ 3.841728] usbcore: registered new interface driver usbhid
[ 3.841733] usbhid: USB HID core driver
[ 3.857271] dw-apb-uart.3: ttyS1 at MMIO 0x2ffb43e000 (irq = 20, base_baud = 115200) is a 16550A
[ 3.905209] input: WCOM511A:00 056A:511A Touchscreen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input7
[ 3.906068] input: WCOM511A:00 056A:511A as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input8
[ 3.906327] input: WCOM511A:00 056A:511A as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input9
[ 3.907911] input: WCOM511A:00 056A:511A as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input10
[ 3.908803] input: WCOM511A:00 056A:511A Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input11
[ 3.909920] hid-generic 0018:056A:511A.0001: input,hidraw0: I2C HID v1.00 Mouse [WCOM511A:00 056A:511A] on i2c-WCOM511A:00
[ 3.910526] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:17EF:60B5.0002/input/input12
[ 3.927541] Intel(R) Wireless WiFi driver for Linux
[ 3.927545] Copyright(c) 2003- 2015 Intel Corporation
[ 3.945633] iwlwifi 0000:04:00.0: enabling device (0000 -> 0002)
[ 3.967610] hid-generic 0003:17EF:60B5.0002: input,hidraw1: USB HID v1.11 Keyboard [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input0
[ 3.969062] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 System Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input13
[ 3.984669] iwlwifi 0000:04:00.0: Found debug destination: EXTERNAL_DRAM
[ 3.984678] iwlwifi 0000:04:00.0: Found debug configuration: 0
[ 3.986657] iwlwifi 0000:04:00.0: loaded firmware version 36.77d01142.0 op_mode iwlmvm
[ 4.024667] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input14
[ 4.024972] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input15
[ 4.025201] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Wireless Radio Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input16
[ 4.027469] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input17
[ 4.027737] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input18
[ 4.027959] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input19
[ 4.028375] hid-generic 0003:17EF:60B5.0003: input,hiddev0,hidraw2: USB HID v1.11 Device [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input1
[ 4.029726] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input20
[ 4.029984] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Touchpad as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input21
[ 4.030399] hid-generic 0003:17EF:60B5.0004: input,hiddev1,hidraw3: USB HID v1.11 Mouse [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input2
[ 4.489755] ipu3_imgu*: module is from the staging directory, the 
quality is unknown, you have been warned.*
[ 4.506397] usbcore: registered new interface driver qcserial
[ 4.506440] usbserial: USB Serial support registered for Qualcomm USB modem
[ 4.609045] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input23
[ 4.631133] ipu3-imgu 0000:00:05.0: enabling device (0000 -> 0002)
[ 4.633895] ipu3-imgu 0000:00:05.0: device 0x1919 (rev: 0x1)
[ 4.633955] ipu3-imgu 0000:00:05.0: physical base address 0x0000002ffb000000, 4194304 bytes
[ 4.662224] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Touchpad as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input24
[ 4.664474] hid-multitouch 0003:17EF:60B5.0004: input,hiddev1,hidraw0: USB HID v1.11 Mouse [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input2
[ 4.674248] usbcore: registered new interface driver cdc_ncm
[ 4.700291] input: Wacom HID 511A Pen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input26
[ 4.700540] input: Wacom HID 511A Finger as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input27
[ 4.701532] wacom 0018:056A:511A.0001: hidraw3: I2C HID v1.00 Mouse [WCOM511A:00 056A:511A] on i2c-WCOM511A:00
[ 4.708185] uvcvideo: Found UVC 1.00 device Integrated Camera (04ca:706b)
[ 4.719023] uvcvideo 1-8:1.0*: Entity type for entity Realtek Extended 
Controls Unit was not initialized!*
[ 4.719035] uvcvideo 1-8:1.0*: Entity type for entity Extension 4 was 
not initialized!*
[ 4.719040] uvcvideo 1-8:1.0*: Entity type for entity Processing 2 was 
not initialized!*
[ 4.719046] uvcvideo 1-8:1.0*: Entity type for entity Camera 1 was not 
initialized!*
[ 4.719293] input: Integrated Camera: Integrated C as /devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0/input/input29
[ 4.720608] usbcore: registered new interface driver uvcvideo
[ 4.720611] USB Video Class driver (1.1.1)
[ 5.008303] usbcore: registered new interface driver cdc_wdm
[ 5.077465] iwlwifi 0000:04:00.0: Detected Intel(R) Dual Band Wireless AC 8265, REV=0x230
[ 5.079212] ipu3-cio2 0000:00:14.3: enabling device (0000 -> 0002)
[ 5.086640] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 5.087993] iwlwifi 0000:04:00.0: Allocated 0x00400000 bytes for firmware monitor.
[ 5.093413] ipu3-cio2 0000:00:14.3: device 0x9d32 (rev: 0x1)
[ 5.096997] Bluetooth: Core ver 2.22
[ 5.097051] NET: Registered protocol family 31
[ 5.097054] Bluetooth: HCI device and connection manager initialized
[ 5.097064] Bluetooth: HCI socket layer initialized
[ 5.097070] Bluetooth: L2CAP socket layer initialized
[ 5.097082] Bluetooth: SCO socket layer initialized
[ 5.104553] mousedev: PS/2 mouse device common for all mice
[ 5.121126] cdc_mbim 1-2:1.12: cdc-wdm2: USB WDM device
[ 5.121648] cdc_mbim 1-2:1.12 wwan0: register 'cdc_mbim' at usb-0000:00:14.0-2, CDC MBIM, b2:10:6b:7d:00:05
[ 5.121754] usbcore: registered new interface driver cdc_mbim
[ 5.140762] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=2
[ 5.144574] iwlwifi 0000:04:00.0: base HW address: 94:b8:6d:82:b8:c4
[ 5.167950] hid-generic 001F:8087:0AC2.0005: hidraw4: <UNKNOWN> HID v2.00 Device [hid-ishtp 8087:0AC2] on
[ 5.176013] hid-generic 001F:8087:0AC2.0006: hidraw5: <UNKNOWN> HID v2.00 Device [hid-ishtp 8087:0AC2] on
[ 5.221462] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[ 5.224405] thermal thermal_zone10*: failed to read out thermal zone (-61)*
[ 5.251905] iwlwifi 0000:04:00.0 wlp4s0: renamed from wlan0
[ 5.399230] cdc_mbim 1-2:1.12 wwp0s20f0u2i12: renamed from wwan0
[ 5.431643] ipu3-imgu 0000:00:05.0: loaded firmware version irci_irci_ecr-master_20161208_0213_20170112_1500, 17 binaries, 1212984 bytes
[ 5.514895] Bluetooth: hci0: Firmware revision 0.1 build 50 week 12 2019
[ 5.524439] usbcore: registered new interface driver btusb
[ 5.826743] kauditd_printk_skb*: 9 callbacks suppressed*
[ 5.826750] audit: type=1130 audit(1581093108.192:20): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-timesyncd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.891112] audit: type=1130 audit(1581093108.259:21): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=keyboardctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.891162] audit: type=1131 audit(1581093108.259:22): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=keyboardctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.925599] audit: type=1130 audit(1581093108.292:23): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=dbus comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.928972] audit: type=1130 audit(1581093108.296:24): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=cronie comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.968473] audit: type=1130 audit(1581093108.336:25): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=linux-module-cleanup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.968554] audit: type=1131 audit(1581093108.336:26): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=linux-module-cleanup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.064487] audit: type=1130 audit(1581093108.429:27): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=bluetooth comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.064500] audit: type=1130 audit(1581093108.429:28): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=avahi-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.082541] audit: type=1130 audit(1581093108.449:29): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=NetworkManager comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.128174] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[ 6.128181] Bluetooth: BNEP filters: protocol multicast
[ 6.128191] Bluetooth: BNEP socket layer initialized
[ 6.139727] i915 0000:00:02.0: enabling device (0006 -> 0007)
[ 6.141183] checking generic (2fa0000000 1700000) vs hw (2fa0000000 10000000)
[ 6.141189] fb0: switching to inteldrmfb from EFI VGA
[ 6.141817] i915 0000:00:02.0: vgaarb: deactivate vga console
[ 6.152773] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[ 6.152777] [drm] Driver supports precise vblank timestamp query.
[ 6.155749] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=mem
[ 6.157104] [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[ 6.158659] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[ 6.163731] NET: Registered protocol family 38
[ 6.186587] [drm] Initialized i915 1.6.0 20190822 for 0000:00:02.0 on minor 0
[ 6.199545] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[ 6.200580] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input30
[ 6.203349] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[ 6.247729] fbcon: i915drmfb (fb0) is primary device
[ 6.247733] fbcon: Deferring console take-over
[ 6.247743] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[ 6.422706] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC295: line_outs=2 (0x14/0x1b/0x0/0x0/0x0) type:speaker
[ 6.422716] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[ 6.422722] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[ 6.422726] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[ 6.422731] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[ 6.422738] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x19
[ 6.422744] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
[ 6.464554] loop: module loaded
[ 6.526468] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[ 6.714679] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1f.3/sound/card0/input31
[ 6.714827] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input32
[ 6.714956] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input33
[ 6.715093] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input34
[ 6.715215] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input35
[ 6.715337] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input36
[ 6.715452] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input37
[ 6.715669] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input38
[ 7.122244] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 7.257570] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 7.327239] iwlwifi 0000:04:00.0*: FW already configured (0) - 
re-configuring*
[ 7.379214] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 7.516750] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 7.583448] iwlwifi 0000:04:00.0*: FW already configured (0) - 
re-configuring*
[ 11.356957] kauditd_printk_skb*: 23 callbacks suppressed*
[ 11.356961] audit: type=1103 audit(1581093113.722:53): pid=1166 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:setcred grantors=pam_env,pam_permit acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 11.418853] audit: type=1130 audit(1581093113.786:54): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user-runtime-dir@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 11.441022] audit: type=1101 audit(1581093113.806:55): pid=1170 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:accounting grantors=pam_tally2,pam_access,pam_unix,pam_permit,pam_time acct="lightdm" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 11.441233] audit: type=1006 audit(1581093113.809:56): pid=1170 uid=0 subj==unconfined old-auid=4294967295 auid=970 tty=(none) old-ses=4294967295 ses=1 res=1
[ 11.445062] audit: type=1105 audit(1581093113.812:57): pid=1170 uid=0 auid=970 ses=1 subj==unconfined msg='op=PAM:session_open grantors=pam_loginuid,pam_loginuid,pam_keyinit,pam_limits,pam_unix,pam_permit,pam_mail,pam_systemd,pam_env acct="lightdm" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 11.589008] audit: type=1131 audit(1581093113.956:58): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=snapd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 11.652579] audit: type=1130 audit(1581093114.019:59): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 11.671854] audit: type=1105 audit(1581093114.039:60): pid=1166 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:session_open grantors=pam_unix,pam_systemd acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 12.031280] audit: type=1131 audit(1581093114.399:61): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 16.938285] audit: type=1100 audit(1581093119.306:62): pid=1212 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:authentication grantors=pam_tally2,pam_shells,pam_unix,pam_permit,pam_gnome_keyring acct="jogo8307" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 16.947824] audit: type=1101 audit(1581093119.316:63): pid=1212 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:accounting grantors=pam_tally2,pam_access,pam_unix,pam_permit,pam_time acct="jogo8307" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 17.038815] audit: type=1106 audit(1581093119.406:64): pid=1166 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:session_close grantors=pam_unix,pam_systemd acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 17.039070] audit: type=1104 audit(1581093119.406:65): pid=1166 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:setcred grantors=pam_env,pam_permit acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 17.049024] audit: type=1103 audit(1581093119.416:66): pid=1212 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:setcred grantors=pam_tally2,pam_shells,pam_unix,pam_permit,pam_gnome_keyring acct="jogo8307" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 17.049281] audit: type=1006 audit(1581093119.416:67): pid=1212 uid=0 subj==unconfined old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=2 res=1
[ 17.125188] audit: type=1130 audit(1581093119.492:68): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user-runtime-dir@1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 17.145568] audit: type=1101 audit(1581093119.512:69): pid=1222 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:accounting grantors=pam_tally2,pam_access,pam_unix,pam_permit,pam_time acct="jogo8307" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 17.145773] audit: type=1006 audit(1581093119.512:70): pid=1222 uid=0 subj==unconfined old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=3 res=1
[ 17.153642] audit: type=1105 audit(1581093119.519:71): pid=1222 uid=0 auid=1000 ses=3 subj==unconfined msg='op=PAM:session_open grantors=pam_loginuid,pam_loginuid,pam_keyinit,pam_limits,pam_unix,pam_permit,pam_mail,pam_systemd,pam_env acct="jogo8307" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 19.419994] wlp4s0: authenticate with 10:05:ca:d0:16:6f
[ 19.430602] wlp4s0: send auth to 10:05:ca:d0:16:6f (try 1/3)
[ 19.436047] wlp4s0: authenticated
[ 19.437675] wlp4s0: associate with 10:05:ca:d0:16:6f (try 1/3)
[ 19.439190] wlp4s0: RX AssocResp from 10:05:ca:d0:16:6f (capab=0x111 status=0 aid=20)
[ 19.441940] wlp4s0: associated
[ 19.516315] IPv6: ADDRCONF(NETDEV_CHANGE): wlp4s0: link becomes ready
[ 19.532644] wlp4s0: Limiting TX power to 14 dBm as advertised by 10:05:ca:d0:16:6f
[ 20.124374] Bluetooth: RFCOMM TTY layer initialized
[ 20.124389] Bluetooth: RFCOMM socket layer initialized
[ 20.124405] Bluetooth: RFCOMM ver 1.11
[ 22.670151] kauditd_printk_skb*: 6 callbacks suppressed*
[ 22.670157] audit: type=1130 audit(1581093125.036:78): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=udisks2 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 23.526078] audit: type=1130 audit(1581093125.892:79): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=pamac-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 23.544876] audit: type=1131 audit(1581093125.912:80): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=pamac-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 24.255723] audit: type=1130 audit(1581093126.622:81): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=upower comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 24.612983] audit: type=1130 audit(1581093126.979:82): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=blueman-mechanism comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 27.392244] audit: type=1131 audit(1581093129.756:83): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 27.430415] audit: type=1131 audit(1581093129.796:84): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user-runtime-dir@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 27.699332] input: MX Vertical Mouse as /devices/virtual/misc/uhid/0005:046D:B020.0007/input/input39
[ 27.700600] hid-generic 0005:046D:B020.0007: input,hidraw4: BLUETOOTH HID v0.09 Mouse [MX Vertical] on 94:B8:6D:82:B8:C8
[ 31.005816] audit: type=1131 audit(1581093133.372:85): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 37.046697] audit: type=1131 audit(1581093139.419:86): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 44.422410] audit: type=1100 audit(1581093146.893:87): pid=1575 uid=1000 auid=1000 ses=2 subj==unconfined msg='op=PAM:authentication grantors=pam_unix,pam_permit acct="jogo8307" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 44.422889] audit: type=1101 audit(1581093146.893:88): pid=1575 uid=1000 auid=1000 ses=2 subj==unconfined msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="jogo8307" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 44.423544] audit: type=1110 audit(1581093146.897:89): pid=1575 uid=0 auid=1000 ses=2 subj==unconfined msg='op=PAM:setcred grantors=pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 44.432966] audit: type=1105 audit(1581093146.903:90): pid=1575 uid=0 auid=1000 ses=2 subj==unconfined msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'


#####################################################################################################################################################################################################################################################################
#####################################################################################################################################################################################################################################################################
#####################################################################################################################################################################################################################################################################


*[jogo8307@x1tab**~**]$*  sudo dmesg
[ 0.000000] Linux version 5.5.0-2-MANJARO (jogo8307@x1tab) (gcc version 9.2.0 (GCC)) #1 SMP PREEMPT Fri Jan 31 10:59:36 -05 2020
[ 0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.5-x86_64 root=UUID=c9ad2991-8862-4e66-934c-12a746df30f6 rw quiet apparmor=1 security=apparmor resume=UUID=d22f4cd6-54d3-4f6c-ada2-7dc78de3cb4d udev.log_priority=3 mem_sleep_default=deep
[ 0.000000] KERNEL supported cpus:
[ 0.000000]    Intel GenuineIntel
[ 0.000000]    AMD AuthenticAMD
[ 0.000000]    Hygon HygonGenuine
[ 0.000000]    Centaur CentaurHauls
[ 0.000000]    zhaoxin   Shanghai
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[ 0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[ 0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[ 0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[ 0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[ 0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[ 0.000000] BIOS-provided physical RAM map:
[ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usable
[ 0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000009bfff] usable
[ 0.000000] BIOS-e820: [mem 0x000000000009c000-0x000000000009cfff] unusable
[ 0.000000] BIOS-e820: [mem 0x000000000009d000-0x00000000000fffff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001edfcfff] usable
[ 0.000000] BIOS-e820: [mem 0x000000001edfd000-0x000000001ee3dfff] ACPI data
[ 0.000000] BIOS-e820: [mem 0x000000001ee3e000-0x00000000219e2fff] usable
[ 0.000000] BIOS-e820: [mem 0x00000000219e3000-0x00000000219e3fff] ACPI NVS
[ 0.000000] BIOS-e820: [mem 0x00000000219e4000-0x00000000219e4fff] reserved
[ 0.000000] BIOS-e820: [mem 0x00000000219e5000-0x000000004ee58fff] usable
[ 0.000000] BIOS-e820: [mem 0x000000004ee59000-0x000000004ef32fff] type 20
[ 0.000000] BIOS-e820: [mem 0x000000004ef33000-0x000000004ff10fff] reserved
[ 0.000000] BIOS-e820: [mem 0x000000004ff11000-0x000000004ff7efff] ACPI NVS
[ 0.000000] BIOS-e820: [mem 0x000000004ff7f000-0x000000004fffefff] ACPI data
[ 0.000000] BIOS-e820: [mem 0x000000004ffff000-0x000000004fffffff] usable
[ 0.000000] BIOS-e820: [mem 0x0000000050000000-0x0000000057ffffff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000058600000-0x000000005c7fffff] reserved
[ 0.000000] BIOS-e820: [mem 0x00000000f0000000-0x00000000f7ffffff] reserved
[ 0.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff] reserved
[ 0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000002a17fffff] usable
[ 0.000000] NX (Execute Disable) protection: active
[ 0.000000] efi: EFI v2.50 by Lenovo
[ 0.000000] efi:  TPMFinalLog=0x4ff77000  SMBIOS=0x4f0f7000  SMBIOS 3.0=0x4f0f4000  ACPI 2.0=0x1ee3d9c1  ESRT=0x4ef81000
[ 0.000000] SMBIOS 3.0.0 present.
[ 0.000000] DMI: LENOVO 20KKS0PG01/20KKS0PG01, BIOS N1ZET79W(1.35 ) 11/28/2019
[ 0.000000] tsc: Detected 1900.000 MHz processor
[ 0.001841] tsc: Detected 1899.950 MHz TSC
[ 0.001841] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[ 0.001844] e820: remove [mem 0x000a0000-0x000fffff] usable
[ 0.001856] last_pfn = 0x2a1800 max_arch_pfn = 0x400000000
[ 0.001861] MTRR default type: write-back
[ 0.001863] MTRR fixed ranges enabled:
[ 0.001865]    00000-9FFFF write-back
[ 0.001866]    A0000-BFFFF uncachable
[ 0.001867]    C0000-FFFFF write-protect
[ 0.001868] MTRR variable ranges enabled:
[ 0.001871]    0 base 0080000000 mask 7F80000000 uncachable
[ 0.001872]    1 base 0060000000 mask 7FE0000000 uncachable
[ 0.001874]    2 base 005C000000 mask 7FFC000000 uncachable
[ 0.001875]    3 base 005A000000 mask 7FFE000000 uncachable
[ 0.001876]    4 base 2000000000 mask 7000000000 uncachable
[ 0.001877]    5 disabled
[ 0.001878]    6 disabled
[ 0.001879]    7 disabled
[ 0.001880]    8 disabled
[ 0.001880]    9 disabled
[ 0.002759] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[ 0.003201] last_pfn = 0x50000 max_arch_pfn = 0x400000000
[ 0.022607] esrt: Reserving ESRT space from 0x000000004ef81000 to 0x000000004ef810b0.
[ 0.022620] check: Scanning 1 areas for low memory corruption
[ 0.022627] Using GB pages for direct mapping
[ 0.022630] BRK [0x1e2e01000, 0x1e2e01fff] PGTABLE
[ 0.022632] BRK [0x1e2e02000, 0x1e2e02fff] PGTABLE
[ 0.022634] BRK [0x1e2e03000, 0x1e2e03fff] PGTABLE
[ 0.022713] BRK [0x1e2e04000, 0x1e2e04fff] PGTABLE
[ 0.022716] BRK [0x1e2e05000, 0x1e2e05fff] PGTABLE
[ 0.023048] BRK [0x1e2e06000, 0x1e2e06fff] PGTABLE
[ 0.023108] BRK [0x1e2e07000, 0x1e2e07fff] PGTABLE
[ 0.023216] BRK [0x1e2e08000, 0x1e2e08fff] PGTABLE
[ 0.023338] BRK [0x1e2e09000, 0x1e2e09fff] PGTABLE
[ 0.023424] BRK [0x1e2e0a000, 0x1e2e0afff] PGTABLE
[ 0.023546] BRK [0x1e2e0b000, 0x1e2e0bfff] PGTABLE
[ 0.023667] Secure boot could not be determined
[ 0.023669] RAMDISK: [mem 0x369a1000-0x374c7fff]
[ 0.023686] ACPI: Early table checksum verification disabled
[ 0.023690] ACPI: RSDP 0x000000001EE3D9C1 000024 (v02 LENOVO)
[ 0.023698] ACPI: XSDT 0x000000001EE3D89D 000124 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023715] ACPI: UEFI 0x000000001EE2583F 00013E (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023720] ACPI: BGRT 0x000000001EE2597D 000038 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023724] ACPI: FPDT 0x000000001EE259B5 000044 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023728] ACPI: ASF! 0x000000001EE259F9 0000A0 (v32 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023732] ACPI: NHLT 0x000000001EE25A99 00002D (v00 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023736] ACPI: DMAR 0x000000001EE25AC6 0000A8 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023740] ACPI: MSDM 0x000000001EE25B6E 000055 (v03 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023744] ACPI: DBG2 0x000000001EE25BC3 000054 (v00 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023747] ACPI: DBGP 0x000000001EE25C17 000034 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023751] ACPI: SSDT 0x000000001EE25C4B 000544 (v02 LENOVO TbtTypeC 00000000 INTL 20160527)
[ 0.023756] ACPI: SSDT 0x000000001EE2618F 00029F (v02 LENOVO sensrhub 00000000 INTL 20160527)
[ 0.023760] ACPI: SSDT 0x000000001EE2642E 000141 (v02 LENOVO HdaDsp   00000000 INTL 20160527)
[ 0.023764] ACPI: WSMT 0x000000001EE2656F 000028 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023768] ACPI: LPIT 0x000000001EE26597 000094 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023771] ACPI: SSDT 0x000000001EE2662B 000B0A (v02 LENOVO UsbCTabl 00001000 INTL 20160527)
[ 0.023775] ACPI: SSDT 0x000000001EE27135 00056D (v02 LENOVO CtdpB    00001000 INTL 20160527)
[ 0.023780] ACPI: SSDT 0x000000001EE276A2 0017AE (v02 LENOVO CpuSsdt  00003000 INTL 20160527)
[ 0.023784] ACPI: BATB 0x000000001EE28E50 00004A (v02 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023788] ACPI: BOOT 0x000000001EE28E9A 000028 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023792] ACPI: SSDT 0x000000001EE28EC2 0015AE (v02 LENOVO ProjSsdt 00000010 INTL 20160527)
[ 0.023796] ACPI: SSDT 0x000000001EE2A470 002025 (v02 LENOVO RVP7Rtd3 00001000 INTL 20160527)
[ 0.023800] ACPI: ECDT 0x000000001EE2C495 000053 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023804] ACPI: MCFG 0x000000001EE2C4E8 00003C (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023807] ACPI: APIC 0x000000001EE2C524 00012C (v03 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023811] ACPI: HPET 0x000000001EE2C650 000038 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023815] ACPI: SSDT 0x000000001EE2C688 0005C6 (v02 LENOVO PerfTune 00001000 INTL 20160527)
[ 0.023819] ACPI: SSDT 0x000000001EE2CC4E 0030B0 (v02 LENOVO SaSsdt   00003000 INTL 20160527)
[ 0.023823] ACPI: UEFI 0x000000001EE2FCFE 000042 (v01 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023827] ACPI: TPM2 0x000000001EE2FD40 000034 (v03 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023831] ACPI: SSDT 0x000000001EE2FD74 0003DB (v02 LENOVO Tpm2Tabl 00001000 INTL 20160527)
[ 0.023835] ACPI: SSDT 0x000000001EE3014F 00D5B6 (v02 LENOVO DptfTabl 00001000 INTL 20160527)
[ 0.023839] ACPI: FACP 0x000000001EE3D705 0000F4 (v05 LENOVO TP-N1Z   00001230 PTEC 00000002)
[ 0.023845] ACPI: DSDT 0x000000001EDFD000 02883F (v02 LENOVO SKL      00000000 INTL 20200110)
[ 0.023849] ACPI: FACS 0x000000004FF23000 000040
[ 0.023853] ACPI: FACS 0x000000004FF23000 000040
[ 0.023878] ACPI: Local APIC address 0xfee00000
[ 0.024119] No NUMA configuration found
[ 0.024120] Faking a node at [mem 0x0000000000000000-0x00000002a17fffff]
[ 0.024126] NODE_DATA(0) allocated [mem 0x2a17fc000-0x2a17fffff]
[ 0.024161] Zone ranges:
[ 0.024162]    DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[ 0.024164]    DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[ 0.024165]    Normal   [mem 0x0000000100000000-0x00000002a17fffff]
[ 0.024167]    Device   empty
[ 0.024168] Movable zone start for each node
[ 0.024169] Early memory node ranges
[ 0.024170] node 0: [mem 0x0000000000001000-0x0000000000057fff]
[ 0.024172] node 0: [mem 0x0000000000059000-0x000000000009bfff]
[ 0.024173] node 0: [mem 0x0000000000100000-0x000000001edfcfff]
[ 0.024174] node 0: [mem 0x000000001ee3e000-0x00000000219e2fff]
[ 0.024175] node 0: [mem 0x00000000219e5000-0x000000004ee58fff]
[ 0.024176] node 0: [mem 0x000000004ffff000-0x000000004fffffff]
[ 0.024177] node 0: [mem 0x0000000100000000-0x00000002a17fffff]
[ 0.024260] Zeroed struct page in unavailable ranges: 4687 pages
[ 0.024262] Initmem setup node 0 [mem 0x0000000000001000-0x00000002a17fffff]
[ 0.024264] On node 0 totalpages: 2033073
[ 0.024266] DMA zone: 64 pages used for memmap
[ 0.024267] DMA zone: 22 pages reserved
[ 0.024268] DMA zone: 3994 pages, LIFO batch:0
[ 0.024352] DMA32 zone: 4985 pages used for memmap
[ 0.024353] DMA32 zone: 318999 pages, LIFO batch:63
[ 0.037991] Normal zone: 26720 pages used for memmap
[ 0.037992] Normal zone: 1710080 pages, LIFO batch:63
[ 0.074112] Reserving Intel graphics memory at [mem 0x5a800000-0x5c7fffff]
[ 0.074444] ACPI: PM-Timer IO Port: 0x1808
[ 0.074446] ACPI: Local APIC address 0xfee00000
[ 0.074456] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[ 0.074457] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[ 0.074458] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[ 0.074459] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[ 0.074460] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[ 0.074461] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[ 0.074462] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[ 0.074463] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[ 0.074464] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[ 0.074465] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[ 0.074465] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[ 0.074466] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[ 0.074467] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[ 0.074468] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[ 0.074469] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[ 0.074470] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[ 0.074506] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[ 0.074509] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[ 0.074512] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[ 0.074514] ACPI: IRQ0 used by override.
[ 0.074516] ACPI: IRQ9 used by override.
[ 0.074518] Using ACPI (MADT) for SMP configuration information
[ 0.074521] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[ 0.074529] e820: update [mem 0x48b8d000-0x48cecfff] usable ==> reserved
[ 0.074541] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[ 0.074572] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[ 0.074574] PM: Registered nosave memory: [mem 0x00058000-0x00058fff]
[ 0.074577] PM: Registered nosave memory: [mem 0x0009c000-0x0009cfff]
[ 0.074578] PM: Registered nosave memory: [mem 0x0009d000-0x000fffff]
[ 0.074580] PM: Registered nosave memory: [mem 0x1edfd000-0x1ee3dfff]
[ 0.074582] PM: Registered nosave memory: [mem 0x219e3000-0x219e3fff]
[ 0.074583] PM: Registered nosave memory: [mem 0x219e4000-0x219e4fff]
[ 0.074585] PM: Registered nosave memory: [mem 0x48b8d000-0x48cecfff]
[ 0.074588] PM: Registered nosave memory: [mem 0x4ee59000-0x4ef32fff]
[ 0.074588] PM: Registered nosave memory: [mem 0x4ef33000-0x4ff10fff]
[ 0.074589] PM: Registered nosave memory: [mem 0x4ff11000-0x4ff7efff]
[ 0.074590] PM: Registered nosave memory: [mem 0x4ff7f000-0x4fffefff]
[ 0.074592] PM: Registered nosave memory: [mem 0x50000000-0x57ffffff]
[ 0.074593] PM: Registered nosave memory: [mem 0x58000000-0x585fffff]
[ 0.074594] PM: Registered nosave memory: [mem 0x58600000-0x5c7fffff]
[ 0.074595] PM: Registered nosave memory: [mem 0x5c800000-0xefffffff]
[ 0.074596] PM: Registered nosave memory: [mem 0xf0000000-0xf7ffffff]
[ 0.074597] PM: Registered nosave memory: [mem 0xf8000000-0xfe00ffff]
[ 0.074597] PM: Registered nosave memory: [mem 0xfe010000-0xfe010fff]
[ 0.074598] PM: Registered nosave memory: [mem 0xfe011000-0xffffffff]
[ 0.074605] [mem 0x5c800000-0xefffffff] available for PCI devices
[ 0.074608] Booting paravirtualized kernel on bare hardware
[ 0.074613] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[ 0.230015] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:8 nr_node_ids:1
[ 0.230350] percpu: Embedded 57 pages/cpu s196608 r8192 d28672 u262144
[ 0.230361] pcpu-alloc: s196608 r8192 d28672 u262144 alloc=1*2097152
[ 0.230362] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
[ 0.230401] Built 1 zonelists, mobility grouping on. Total pages: 2001282
[ 0.230403] Policy zone: Normal
[ 0.230412] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.5-x86_64 root=UUID=c9ad2991-8862-4e66-934c-12a746df30f6 rw quiet apparmor=1 security=apparmor resume=UUID=d22f4cd6-54d3-4f6c-ada2-7dc78de3cb4d udev.log_priority=3 mem_sleep_default=deep
[ 0.231333] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[ 0.231706] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[ 0.231837] mem auto-init: stack:byref_all, heap alloc:on, heap free:off
[ 0.266791] Memory: 7766936K/8132292K available (12291K kernel code, 1345K rwdata, 4332K rodata, 1660K init, 3380K bss, 365356K reserved, 0K cma-reserved)
[ 0.266993] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[ 0.267010] Kernel/User page tables isolation: enabled
[ 0.267031] ftrace: allocating 38837 entries in 152 pages
[ 0.291731] ftrace: allocated 152 pages with 3 groups
[ 0.291892] rcu: Preemptible hierarchical RCU implementation.
[ 0.291892] rcu: 	RCU dyntick-idle grace-period acceleration is enabled.
[ 0.291894] rcu: 	RCU restricting CPUs from NR_CPUS=320 to nr_cpu_ids=8.
[ 0.291895] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[ 0.291896] 	Tasks RCU enabled.
[ 0.291898] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[ 0.291899] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[ 0.296338] NR_IRQS: 20736, nr_irqs: 2048, preallocated irqs: 16
[ 0.296797] random: get_random_bytes called from start_kernel+0x390/0x56b with crng_init=0
[ 0.296830] Console: colour dummy device 80x25
[ 0.296836] printk: console [tty0] enabled
[ 0.296860] ACPI: Core revision 20191018
[ 0.297375] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[ 0.297481] APIC: Switch to symmetric I/O mode setup
[ 0.297483] DMAR: Host address width 39
[ 0.297485] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[ 0.297495] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 19e2ff0505e
[ 0.297496] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[ 0.297501] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[ 0.297503] DMAR: RMRR base: 0x0000004f45f000 end: 0x0000004f47efff
[ 0.297504] DMAR: RMRR base: 0x0000005a000000 end: 0x0000005c7fffff
[ 0.297507] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[ 0.297508] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[ 0.297509] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[ 0.299235] DMAR-IR: Enabled IRQ remapping in x2apic mode
[ 0.299237] x2apic enabled
[ 0.299255] Switched APIC routing to cluster x2apic.
[ 0.303386] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[ 0.317395] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x36c5f9386c6, max_idle_ns: 881590416379 ns
[ 0.317401] Calibrating delay loop (skipped), value calculated using timer frequency.. 3801.22 BogoMIPS (lpj=6333166)
[ 0.317404] pid_max: default: 32768 minimum: 301
[ 0.323994] LSM: Security Framework initializing
[ 0.324001] Yama: becoming mindful.
[ 0.324034] AppArmor: AppArmor initialized
[ 0.324110] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[ 0.324129] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[ 0.324146] *** VALIDATE tmpfs ***
[ 0.324378] *** VALIDATE proc ***
[ 0.324459] *** VALIDATE cgroup1 ***
[ 0.324461] *** VALIDATE cgroup2 ***
[ 0.324540] mce: CPU0: Thermal monitoring enabled (TM1)
[ 0.324575] process: using mwait in idle threads
[ 0.324580] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[ 0.324581] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[ 0.324585] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[ 0.324587] Spectre V2 : Mitigation: Full generic retpoline
[ 0.324588] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[ 0.324588] Spectre V2 : Enabling Restricted Speculation for firmware calls
[ 0.324590] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[ 0.324591] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[ 0.324593] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[ 0.324597] TAA: Mitigation: Clear CPU buffers
[ 0.324598] MDS: Mitigation: Clear CPU buffers
[ 0.325107] Freeing SMP alternatives memory: 32K
[ 0.327539] TSC deadline timer enabled
[ 0.327548] smpboot: CPU0: Intel(R) Core(TM) i5-8350U CPU @ 1.70GHz (family: 0x6, model: 0x8e, stepping: 0xa)
[ 0.347435] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[ 0.347467] ... version:                4
[ 0.347468] ... bit width:              48
[ 0.347468] ... generic registers:      4
[ 0.347470] ... value mask:             0000ffffffffffff
[ 0.347470] ... max period:             00007fffffffffff
[ 0.347471] ... fixed-purpose events:   3
[ 0.347472] ... event mask:             000000070000000f
[ 0.354082] rcu: Hierarchical SRCU implementation.
[ 0.377712] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[ 0.384094] smp: Bringing up secondary CPUs ...
[ 0.424136] x86: Booting SMP configuration:
[ 0.424138] .... node #0, CPUs:      #1 #2 #3 #4
[ 0.546161] *MDS CPU bug present and SMT on, data leak possible. See 
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for 
more details.*
[ 0.546161] *TAA CPU bug present and SMT on, data leak possible. See 
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/tsx_async_abort.html 
for more details.*
[ 0.584149] *#5 #6 #7*
[ 0.665615] smp: Brought up 1 node, 8 CPUs
[ 0.665615] smpboot: Max logical packages: 1
[ 0.665615] smpboot: Total of 8 processors activated (30411.83 BogoMIPS)
[ 0.667823] devtmpfs: initialized
[ 0.667823] x86/mm: Memory block size: 128MB
[ 0.668609] PM: Registering ACPI NVS region [mem 0x219e3000-0x219e3fff] (4096 bytes)
[ 0.668609] PM: Registering ACPI NVS region [mem 0x4ff11000-0x4ff7efff] (450560 bytes)
[ 0.668609] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[ 0.668609] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[ 0.668609] pinctrl core: initialized pinctrl subsystem
[ 0.668609] PM: RTC time: 16:42:23, date: 2020-02-07
[ 0.668609] thermal_sys: Registered thermal governor 'fair_share'
[ 0.668609] thermal_sys: Registered thermal governor 'bang_bang'
[ 0.668609] thermal_sys: Registered thermal governor 'step_wise'
[ 0.668609] thermal_sys: Registered thermal governor 'user_space'
[ 0.668609] thermal_sys: Registered thermal governor 'power_allocator'
[ 0.668609] NET: Registered protocol family 16
[ 0.668609] audit: initializing netlink subsys (disabled)
[ 0.668609] audit: type=2000 audit(1581093743.369:1): state=initialized audit_enabled=0 res=1
[ 0.668609] cpuidle: using governor ladder
[ 0.668609] cpuidle: using governor menu
[ 0.668609] Simple Boot Flag at 0x47 set to 0x1
[ 0.668609] KVM setup pv remote TLB flush
[ 0.668609] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[ 0.668609] ACPI: bus type PCI registered
[ 0.668609] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[ 0.670760] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000-0xf7ffffff] (base 0xf0000000)
[ 0.670764] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
[ 0.670780] PCI: Using configuration type 1 for base access
[ 0.671581] ENERGY_PERF_BIAS*: Set to 'normal', was 'performance'*
[ 0.672035] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[ 0.672035] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[ 0.674251] ACPI: Added _OSI(Module Device)
[ 0.674252] ACPI: Added _OSI(Processor Device)
[ 0.674254] ACPI: Added _OSI(3.0 _SCP Extensions)
[ 0.674255] ACPI: Added _OSI(Processor Aggregator Device)
[ 0.674256] ACPI: Added _OSI(Linux-Dell-Video)
[ 0.674257] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[ 0.674259] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[ 0.777819] ACPI: 13 ACPI AML tables successfully acquired and loaded
[ 0.781213] ACPI: EC: EC started
[ 0.781214] ACPI: EC: interrupt blocked
[ 0.785553] ACPI: \: Used as first EC
[ 0.785556] ACPI: \: GPE=0x16, IRQ=-1, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[ 0.785556] ACPI: EC: Boot ECDT EC used to handle transactions
[ 0.788942] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[ 0.809974] ACPI: Dynamic OEM Table Load:
[ 0.809985] ACPI: SSDT 0xFFFFA118D7831000 0005AC (v02 PmRef  Cpu0Ist  00003000 INTL 20160527)
[ 0.813211] ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[ 0.814922] ACPI Warning*: \_SB.PCI0.LNK2._HID: Invalid zero-length _HID 
or _CID string (20191018/nsrepair2-507)*
[ 0.815418] ACPI Warning*: \_SB.PCI0.LNK2._CID: Invalid zero-length _HID 
or _CID string (20191018/nsrepair2-507)*
[ 0.816760] ACPI: Dynamic OEM Table Load:
[ 0.816769] ACPI: SSDT 0xFFFFA118D7615C00 0003FF (v02 PmRef  Cpu0Cst  00003001 INTL 20160527)
[ 0.819923] ACPI: Dynamic OEM Table Load:
[ 0.819931] ACPI: SSDT 0xFFFFA118D746B840 0000BA (v02 PmRef  Cpu0Hwp  00003000 INTL 20160527)
[ 0.822914] ACPI: Dynamic OEM Table Load:
[ 0.822922] ACPI: SSDT 0xFFFFA118D7837800 000628 (v02 PmRef  HwpLvt   00003000 INTL 20160527)
[ 0.826621] ACPI: Dynamic OEM Table Load:
[ 0.826631] ACPI: SSDT 0xFFFFA118D7883000 000D14 (v02 PmRef  ApIst    00003000 INTL 20160527)
[ 0.831100] ACPI: Dynamic OEM Table Load:
[ 0.831110] ACPI: SSDT 0xFFFFA118D7582C00 000317 (v02 PmRef  ApHwp    00003000 INTL 20160527)
[ 0.834423] ACPI: Dynamic OEM Table Load:
[ 0.834431] ACPI: SSDT 0xFFFFA118D7611800 00030A (v02 PmRef  ApCst    00003000 INTL 20160527)
[ 0.843858] ACPI: Interpreter enabled
[ 0.843940] ACPI: (supports S0 S3 S4 S5)
[ 0.843943] ACPI: Using IOAPIC for interrupt routing
[ 0.844025] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[ 0.846787] ACPI: Enabled 7 GPEs in block 00 to 7F
[ 0.854630] ACPI: Power Resource [PUBS] (on)
[ 0.877108] ACPI: Power Resource [PAUD] (on)
[ 0.879676] ACPI: Power Resource [WRST] (on)
[ 0.883004] ACPI: Power Resource [PXP] (on)
[ 0.899497] ACPI: Power Resource [PXTC] (on)
[ 1.114188] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-7e])
[ 1.114199] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[ 1.114484] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME AER PCIeCapability]
[ 1.114618] acpi PNP0A08:00: _OSC: not requesting control; platform does not support [PCIeCapability]
[ 1.114621] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR]
[ 1.114622] acpi PNP0A08:00: _OSC: platform willing to grant [LTR]
[ 1.114629] acpi PNP0A08:00: _OSC failed (AE_SUPPORT); disabling ASPM
[ 1.118855] PCI host bridge to bus 0000:00
[ 1.118859] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[ 1.118861] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[ 1.118863] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[ 1.118864] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3fff window]
[ 1.118866] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]
[ 1.118867] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbfff window]
[ 1.118869] pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cffff window]
[ 1.118870] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff window]
[ 1.118872] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff window]
[ 1.118873] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff window]
[ 1.118875] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff window]
[ 1.118876] pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3fff window]
[ 1.118878] pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7fff window]
[ 1.118879] pci_bus 0000:00: root bus resource [mem 0x000e8000-0x000ebfff window]
[ 1.118881] pci_bus 0000:00: root bus resource [mem 0x000ec000-0x000effff window]
[ 1.118882] pci_bus 0000:00: root bus resource [mem 0x000f0000-0x000fffff window]
[ 1.118886] pci_bus 0000:00: root bus resource [mem 0x5c800000-0xefffffff window]
[ 1.118888] pci_bus 0000:00: root bus resource [mem 0x2000000000-0x2fffffffff window]
[ 1.118889] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
[ 1.118891] pci_bus 0000:00: root bus resource [bus 00-7e]
[ 1.118915] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000
[ 1.120876] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000
[ 1.120895] pci 0000:00:02.0: reg 0x10: [mem 0x2ffa000000-0x2ffaffffff 64bit]
[ 1.120905] pci 0000:00:02.0: reg 0x18: [mem 0x2fa0000000-0x2fafffffff 64bit pref]
[ 1.120911] pci 0000:00:02.0: reg 0x20: [io  0xe000-0xe03f]
[ 1.120937] pci 0000:00:02.0: BAR 2: assigned to efifb
[ 1.122477] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[ 1.122497] pci 0000:00:04.0: reg 0x10: [mem 0x2ffb430000-0x2ffb437fff 64bit]
[ 1.124152] pci 0000:00:05.0: [8086:1919] type 00 class 0x048000
[ 1.124169] pci 0000:00:05.0: reg 0x10: [mem 0x2ffb000000-0x2ffb3fffff 64bit]
[ 1.125712] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
[ 1.125732] pci 0000:00:08.0: reg 0x10: [mem 0x2ffb445000-0x2ffb445fff 64bit]
[ 1.127281] pci 0000:00:13.0: [8086:9d35] type 00 class 0x000000
[ 1.127310] pci 0000:00:13.0: reg 0x10: [mem 0x2ffb444000-0x2ffb444fff 64bit]
[ 1.128987] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[ 1.129018] pci 0000:00:14.0: reg 0x10: [mem 0x2ffb420000-0x2ffb42ffff 64bit]
[ 1.129116] pci 0000:00:14.0: PME# supported from D3hot D3cold
[ 1.130855] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[ 1.130882] pci 0000:00:14.2: reg 0x10: [mem 0x2ffb443000-0x2ffb443fff 64bit]
[ 1.132454] pci 0000:00:14.3: [8086:9d32] type 00 class 0x048000
[ 1.132568] pci 0000:00:14.3: reg 0x10: [mem 0x2ffb410000-0x2ffb41ffff 64bit]
[ 1.134513] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[ 1.134778] pci 0000:00:15.0: reg 0x10: [mem 0x2ffb442000-0x2ffb442fff 64bit]
[ 1.137280] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[ 1.137541] pci 0000:00:15.1: reg 0x10: [mem 0x2ffb441000-0x2ffb441fff 64bit]
[ 1.140052] pci 0000:00:15.2: [8086:9d62] type 00 class 0x118000
[ 1.140317] pci 0000:00:15.2: reg 0x10: [mem 0x2ffb440000-0x2ffb440fff 64bit]
[ 1.142766] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[ 1.142816] pci 0000:00:16.0: reg 0x10: [mem 0x2ffb43f000-0x2ffb43ffff 64bit]
[ 1.142962] pci 0000:00:16.0: PME# supported from D3hot
[ 1.144596] pci 0000:00:16.3: [8086:9d3d] type 00 class 0x070002
[ 1.144624] pci 0000:00:16.3: reg 0x10: [io  0xe060-0xe067]
[ 1.144636] pci 0000:00:16.3: reg 0x14: [mem 0xee404000-0xee404fff]
[ 1.146225] pci 0000:00:1c.0: [8086:9d11] type 01 class 0x060400
[ 1.146351] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[ 1.148020] pci 0000:00:1c.3: [8086:9d13] type 01 class 0x060400
[ 1.148144] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[ 1.149803] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
[ 1.149937] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[ 1.151605] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
[ 1.151729] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[ 1.153467] pci 0000:00:1e.0: [8086:9d27] type 00 class 0x118000
[ 1.153733] pci 0000:00:1e.0: reg 0x10: [mem 0x2ffb43e000-0x2ffb43efff 64bit]
[ 1.156252] pci 0000:00:1e.3: [8086:9d2a] type 00 class 0x118000
[ 1.156517] pci 0000:00:1e.3: reg 0x10: [mem 0x2ffb43d000-0x2ffb43dfff 64bit]
[ 1.158976] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100
[ 1.160705] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[ 1.160727] pci 0000:00:1f.2: reg 0x10: [mem 0xee400000-0xee403fff]
[ 1.162382] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380
[ 1.162419] pci 0000:00:1f.3: reg 0x10: [mem 0x2ffb438000-0x2ffb43bfff 64bit]
[ 1.162461] pci 0000:00:1f.3: reg 0x20: [mem 0x2ffb400000-0x2ffb40ffff 64bit]
[ 1.162535] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[ 1.164213] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[ 1.164272] pci 0000:00:1f.4: reg 0x10: [mem 0x2ffb43c000-0x2ffb43c0ff 64bit]
[ 1.164325] pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
[ 1.166131] pci 0000:02:00.0: [10ec:522a] type 00 class 0xff0000
[ 1.166162] pci 0000:02:00.0: reg 0x10: [mem 0xee300000-0xee300fff]
[ 1.166306] pci 0000:02:00.0: supports D1 D2
[ 1.166308] pci 0000:02:00.0: PME# supported from D1 D2 D3hot D3cold
[ 1.166568] pci 0000:00:1c.0: PCI bridge to [bus 02]
[ 1.166574] pci 0000:00:1c.0:   bridge window [mem 0xee300000-0xee3fffff]
[ 1.167060] pci 0000:04:00.0: [8086:24fd] type 00 class 0x028000
[ 1.167163] pci 0000:04:00.0: reg 0x10: [mem 0xee200000-0xee201fff 64bit]
[ 1.167618] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
[ 1.168511] pci 0000:00:1c.3: PCI bridge to [bus 04]
[ 1.168517] pci 0000:00:1c.3:   bridge window [mem 0xee200000-0xee2fffff]
[ 1.168821] pci 0000:05:00.0: [144d:a804] type 00 class 0x010802
[ 1.168855] pci 0000:05:00.0: reg 0x10: [mem 0xee100000-0xee103fff 64bit]
[ 1.169365] pci 0000:00:1c.4: PCI bridge to [bus 05]
[ 1.169370] pci 0000:00:1c.4:   bridge window [mem 0xee100000-0xee1fffff]
[ 1.169447] pci 0000:00:1d.0: PCI bridge to [bus 06-70]
[ 1.169455] pci 0000:00:1d.0:   bridge window [mem 0xc0000000-0xee0fffff]
[ 1.169463] pci 0000:00:1d.0:   bridge window [mem 0x2fb0000000-0x2ff9ffffff 64bit pref]
[ 1.178604] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.178722] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[ 1.178838] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.178952] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.179066] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.179180] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.179298] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.179413] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[ 1.191535] ACPI: EC: interrupt unblocked
[ 1.191565] ACPI: EC: event unblocked
[ 1.191582] ACPI: \_SB_.PCI0.LPCB.EC__: GPE=0x16, IRQ=-1, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[ 1.191584] ACPI: \_SB_.PCI0.LPCB.EC__: Boot DSDT EC used to handle transactions and events
[ 1.191751] iommu: Default domain type: Translated
[ 1.191770] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=mem,locks=none
[ 1.191770] pci 0000:00:02.0: vgaarb: bridge control possible
[ 1.191770] pci 0000:00:02.0: vgaarb: setting as boot device
[ 1.191770] vgaarb: loaded
[ 1.191770] ACPI: bus type USB registered
[ 1.191770] usbcore: registered new interface driver usbfs
[ 1.191770] usbcore: registered new interface driver hub
[ 1.191770] usbcore: registered new device driver usb
[ 1.191770] pps_core: LinuxPPS API ver. 1 registered
[ 1.191770] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti<giometti@linux.it>
[ 1.191770] PTP clock support registered
[ 1.191770] EDAC MC: Ver: 3.0.0
[ 1.191770] Registered efivars operations
[ 1.191770] PCI: Using ACPI for IRQ routing
[ 1.196215] PCI: pci_cache_line_size set to 64 bytes
[ 1.200776] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[ 1.200778] e820: reserve RAM buffer [mem 0x0009c000-0x0009ffff]
[ 1.200779] e820: reserve RAM buffer [mem 0x1edfd000-0x1fffffff]
[ 1.200780] e820: reserve RAM buffer [mem 0x219e3000-0x23ffffff]
[ 1.200781] e820: reserve RAM buffer [mem 0x48b8d000-0x4bffffff]
[ 1.200783] e820: reserve RAM buffer [mem 0x4ee59000-0x4fffffff]
[ 1.200784] e820: reserve RAM buffer [mem 0x2a1800000-0x2a3ffffff]
[ 1.200938] NetLabel: Initializing
[ 1.200939] NetLabel:  domain hash size = 128
[ 1.200940] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[ 1.200968] NetLabel:  unlabeled traffic allowed by default
[ 1.201802] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[ 1.201807] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[ 1.204150] clocksource: Switched to clocksource tsc-early
[ 1.221805] *** VALIDATE bpf ***
[ 1.221946] VFS: Disk quotas dquot_6.6.0
[ 1.221970] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[ 1.222018] *** VALIDATE ramfs ***
[ 1.222022] *** VALIDATE hugetlbfs ***
[ 1.222157] AppArmor: AppArmor Filesystem Enabled
[ 1.222206] pnp: PnP ACPI init
[ 1.222611] system 00:00: [mem 0xfd000000-0xfdabffff] has been reserved
[ 1.222614] system 00:00: [mem 0xfdad0000-0xfdadffff] has been reserved
[ 1.222616] system 00:00: [mem 0xfdb00000-0xfdffffff] has been reserved
[ 1.222618] system 00:00: [mem 0xfe000000-0xfe01ffff] could not be reserved
[ 1.222620] system 00:00: [mem 0xfe036000-0xfe03bfff] has been reserved
[ 1.222622] system 00:00: [mem 0xfe03d000-0xfe3fffff] has been reserved
[ 1.222624] system 00:00: [mem 0xfe420000-0xfe7fffff] has been reserved
[ 1.222631] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.223203] system 00:01: [io  0xff00-0xfffe] has been reserved
[ 1.223208] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.224109] system 00:02: [io  0x0680-0x069f] has been reserved
[ 1.224111] system 00:02: [io  0xffff] has been reserved
[ 1.224113] system 00:02: [io  0xffff] has been reserved
[ 1.224115] system 00:02: [io  0xffff] has been reserved
[ 1.224117] system 00:02: [io  0x1800-0x18fe] has been reserved
[ 1.224119] system 00:02: [io  0x164e-0x164f] has been reserved
[ 1.224124] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.224306] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
[ 1.224380] system 00:04: [io  0x1854-0x1857] has been reserved
[ 1.224385] system 00:04: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[ 1.224416] pnp 00:05: Plug and Play ACPI device, IDs LEN0071 PNP0303 (active)
[ 1.224634] system 00:06: [io  0x1800-0x189f] could not be reserved
[ 1.224636] system 00:06: [io  0x0800-0x087f] has been reserved
[ 1.224638] system 00:06: [io  0x0880-0x08ff] has been reserved
[ 1.224640] system 00:06: [io  0x0900-0x097f] has been reserved
[ 1.224642] system 00:06: [io  0x0980-0x09ff] has been reserved
[ 1.224643] system 00:06: [io  0x0a00-0x0a7f] has been reserved
[ 1.224645] system 00:06: [io  0x0a80-0x0aff] has been reserved
[ 1.224647] system 00:06: [io  0x0b00-0x0b7f] has been reserved
[ 1.224649] system 00:06: [io  0x0b80-0x0bff] has been reserved
[ 1.224651] system 00:06: [io  0x15e0-0x15ef] has been reserved
[ 1.224653] system 00:06: [io  0x1600-0x167f] could not be reserved
[ 1.224654] system 00:06: [io  0x1640-0x165f] could not be reserved
[ 1.224657] system 00:06: [mem 0xf0000000-0xf7ffffff] has been reserved
[ 1.224659] system 00:06: [mem 0xfed10000-0xfed13fff] has been reserved
[ 1.224661] system 00:06: [mem 0xfed18000-0xfed18fff] has been reserved
[ 1.224663] system 00:06: [mem 0xfed19000-0xfed19fff] has been reserved
[ 1.224665] system 00:06: [mem 0xfeb00000-0xfebfffff] has been reserved
[ 1.224667] system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved
[ 1.224669] system 00:06: [mem 0xfed90000-0xfed93fff] could not be reserved
[ 1.224671] system 00:06: [mem 0xeffe0000-0xefffffff] has been reserved
[ 1.224676] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.226783] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.228375] system 00:08: [mem 0xfed10000-0xfed17fff] could not be reserved
[ 1.228378] system 00:08: [mem 0xfed18000-0xfed18fff] has been reserved
[ 1.228380] system 00:08: [mem 0xfed19000-0xfed19fff] has been reserved
[ 1.228382] system 00:08: [mem 0xf0000000-0xf7ffffff] has been reserved
[ 1.228383] system 00:08: [mem 0xfed20000-0xfed3ffff] has been reserved
[ 1.228386] system 00:08: [mem 0xfed90000-0xfed93fff] could not be reserved
[ 1.228388] system 00:08: [mem 0xfed45000-0xfed8ffff] has been reserved
[ 1.228389] system 00:08: [mem 0xff000000-0xffffffff] has been reserved
[ 1.228391] system 00:08: [mem 0xfee00000-0xfeefffff] has been reserved
[ 1.228393] system 00:08: [mem 0xeffe0000-0xefffffff] has been reserved
[ 1.228399] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[ 1.229415] system 00:09: [mem 0x00000000-0x0009ffff] could not be reserved
[ 1.229417] system 00:09: [mem 0x000f0000-0x000fffff] could not be reserved
[ 1.229419] system 00:09: [mem 0x00100000-0x5c7fffff] could not be reserved
[ 1.229422] system 00:09: [mem 0xfec00000-0xfed3ffff] could not be reserved
[ 1.229424] system 00:09: [mem 0xfed4c000-0xffffffff] could not be reserved
[ 1.229428] system 00:09: Plug and Play ACPI device, IDs PNP0c01 (active)
[ 1.229766] pnp: PnP ACPI: found 10 devices
[ 1.236354] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[ 1.236407] pci 0000:00:1d.0: bridge window [io  0x1000-0x0fff] to [bus 06-70] add_size 1000
[ 1.236415] pci 0000:00:1d.0: BAR 13: assigned [io  0x2000-0x2fff]
[ 1.236419] pci 0000:00:1c.0: PCI bridge to [bus 02]
[ 1.236434] pci 0000:00:1c.0:   bridge window [mem 0xee300000-0xee3fffff]
[ 1.236450] pci 0000:00:1c.3: PCI bridge to [bus 04]
[ 1.236457] pci 0000:00:1c.3:   bridge window [mem 0xee200000-0xee2fffff]
[ 1.236467] pci 0000:00:1c.4: PCI bridge to [bus 05]
[ 1.236481] pci 0000:00:1c.4:   bridge window [mem 0xee100000-0xee1fffff]
[ 1.236492] pci 0000:00:1d.0: PCI bridge to [bus 06-70]
[ 1.236498] pci 0000:00:1d.0:   bridge window [io  0x2000-0x2fff]
[ 1.236505] pci 0000:00:1d.0:   bridge window [mem 0xc0000000-0xee0fffff]
[ 1.236512] pci 0000:00:1d.0:   bridge window [mem 0x2fb0000000-0x2ff9ffffff 64bit pref]
[ 1.236521] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[ 1.236523] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[ 1.236525] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[ 1.236526] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff window]
[ 1.236528] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff window]
[ 1.236529] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff window]
[ 1.236531] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff window]
[ 1.236533] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff window]
[ 1.236534] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff window]
[ 1.236536] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff window]
[ 1.236538] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff window]
[ 1.236539] pci_bus 0000:00: resource 15 [mem 0x000e0000-0x000e3fff window]
[ 1.236541] pci_bus 0000:00: resource 16 [mem 0x000e4000-0x000e7fff window]
[ 1.236542] pci_bus 0000:00: resource 17 [mem 0x000e8000-0x000ebfff window]
[ 1.236544] pci_bus 0000:00: resource 18 [mem 0x000ec000-0x000effff window]
[ 1.236546] pci_bus 0000:00: resource 19 [mem 0x000f0000-0x000fffff window]
[ 1.236548] pci_bus 0000:00: resource 20 [mem 0x5c800000-0xefffffff window]
[ 1.236550] pci_bus 0000:00: resource 21 [mem 0x2000000000-0x2fffffffff window]
[ 1.236551] pci_bus 0000:00: resource 22 [mem 0xfd000000-0xfe7fffff window]
[ 1.236554] pci_bus 0000:02: resource 1 [mem 0xee300000-0xee3fffff]
[ 1.236556] pci_bus 0000:04: resource 1 [mem 0xee200000-0xee2fffff]
[ 1.236557] pci_bus 0000:05: resource 1 [mem 0xee100000-0xee1fffff]
[ 1.236559] pci_bus 0000:06: resource 0 [io  0x2000-0x2fff]
[ 1.236561] pci_bus 0000:06: resource 1 [mem 0xc0000000-0xee0fffff]
[ 1.236562] pci_bus 0000:06: resource 2 [mem 0x2fb0000000-0x2ff9ffffff 64bit pref]
[ 1.236909] NET: Registered protocol family 2
[ 1.237115] tcp_listen_portaddr_hash hash table entries: 4096 (order: 4, 65536 bytes, linear)
[ 1.237177] TCP established hash table entries: 65536 (order: 7, 524288 bytes, linear)
[ 1.237378] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[ 1.237504] TCP: Hash tables configured (established 65536 bind 65536)
[ 1.237555] UDP hash table entries: 4096 (order: 5, 131072 bytes, linear)
[ 1.237590] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes, linear)
[ 1.237711] NET: Registered protocol family 1
[ 1.237718] NET: Registered protocol family 44
[ 1.237733] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[ 1.238946] PCI: CLS 0 bytes, default 64
[ 1.238997] Trying to unpack rootfs image as initramfs...
[ 1.447373] Freeing initrd memory: 11420K
[ 1.470836] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[ 1.470839] software IO TLB: mapped [mem 0x43eae000-0x47eae000] (64MB)
[ 1.471156] check: Scanning for low memory corruption every 60 seconds
[ 1.471764] Initialise system trusted keyrings
[ 1.471790] Key type blacklist registered
[ 1.471860] workingset: timestamp_bits=41 max_order=21 bucket_order=0
[ 1.473649] zbud: loaded
[ 1.480927] Key type asymmetric registered
[ 1.480928] Asymmetric key parser 'x509' registered
[ 1.480939] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[ 1.481015] io scheduler mq-deadline registered
[ 1.481017] io scheduler kyber registered
[ 1.481065] io scheduler bfq registered
[ 1.482905] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[ 1.483049] efifb: probing for efifb
[ 1.483095] efifb: showing boot graphics
[ 1.487973] efifb: framebuffer at 0x2fa0000000, using 23552k, total 23552k
[ 1.487975] efifb: mode is 3000x2000x32, linelength=12032, pages=1
[ 1.487976] efifb: scrolling: redraw
[ 1.487978] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[ 1.488038] fbcon: Deferring console take-over
[ 1.488040] fb0: EFI VGA frame buffer device
[ 1.488051] intel_idle: MWAIT substates: 0x11142120
[ 1.488053] intel_idle: v0.4.1 model 0x8E
[ 1.488711] intel_idle: lapic_timer_reliable_states 0xffffffff
[ 1.488886] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
[ 1.490840] ACPI: Lid Switch [LID]
[ 1.490892] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
[ 1.497495] ACPI: Power Button [PWRB]
[ 1.504244] thermal LNXTHERM:00: registered as thermal_zone0
[ 1.504246] ACPI: Thermal Zone [THM0] (52 C)
[ 1.504720] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[ 1.505593] serial 0000:00:16.3: enabling device (0000 -> 0003)
[ 1.526712] 0000:00:16.3: ttyS0 at I/O 0xe060 (irq = 19, base_baud = 115200) is a 16550A
[ 1.527217] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel<jroedel@suse.de>
[ 1.527218] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[ 1.529070] nvme nvme0: pci function 0000:05:00.0
[ 1.529130] usbcore: registered new interface driver usbserial_generic
[ 1.529136] usbserial: USB Serial support registered for generic
[ 1.529354] rtc_cmos 00:03: RTC can wake from S4
[ 1.530184] rtc_cmos 00:03: registered as rtc0
[ 1.530206] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram
[ 1.530319] intel_pstate: Intel P-state driver initializing
[ 1.531365] intel_pstate: HWP enabled
[ 1.531496] ledtrig-cpu: registered to indicate activity on CPUs
[ 1.531588] intel_pmc_core INT33A1:00:  initialized
[ 1.531673] drop_monitor: Initializing network drop monitor service
[ 1.531862] NET: Registered protocol family 10
[ 1.540935] Segment Routing with IPv6
[ 1.540970] NET: Registered protocol family 17
[ 1.541773] RAS: Correctable Errors collector initialized.
[ 1.541861] microcode: sig=0x806ea, pf=0x80, revision=0xca
[ 1.542101] microcode: Microcode Update Driver: v2.2.
[ 1.542106] IPI shorthand broadcast: enabled
[ 1.542113] sched_clock: Marking stable (1541403224, 692912)->(1549841583, -7745447)
[ 1.542261] registered taskstats version 1
[ 1.542271] Loading compiled-in X.509 certificates
[ 1.546808] Loaded X.509 cert 'Build time autogenerated kernel key: f2437d6b731a0910a08bb3f32ecbb71538e16351'
[ 1.546847] zswap: loaded using pool lzo/zbud
[ 1.547150] Key type ._fscrypt registered
[ 1.547151] Key type .fscrypt registered
[ 1.555138] Key type big_key registered
[ 1.555141] AppArmor: AppArmor sha1 policy hashing enabled
[ 1.556889] PM:   Magic number: 8:880:741
[ 1.556977] workqueue writeback: hash matches
[ 1.557157] rtc_cmos 00:03: setting system clock to 2020-02-07T16:42:24 UTC (1581093744)
[ 1.778854] nvme nvme0: 7/0/0 default/read/poll queues
[ 1.797333] nvme0n1: p1 p2 p3 p4 p5 p6 p7
[ 1.801759] Freeing unused decrypted memory: 2040K
[ 1.802521] Freeing unused kernel image (initmem) memory: 1660K
[ 1.831114] Write protecting the kernel read-only data: 20480k
[ 1.832526] Freeing unused kernel image (text/rodata gap) memory: 2044K
[ 1.833421] Freeing unused kernel image (rodata/data gap) memory: 1812K
[ 1.860504] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[ 1.860506] x86/mm: Checking user space page tables
[ 1.876159] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[ 1.876162] Run /init as init process
[ 2.038941] i8042: PNP: PS/2 Controller [PNP0303:KBD] at 0x60,0x64 irq 1
[ 2.038942] i8042*: PNP: PS/2 appears to have AUX port disabled, if this 
is incorrect please boot with i8042.nopnp*
[ 2.039749] serio: i8042 KBD port at 0x60,0x64 irq 1
[ 2.044469] rtsx_pci 0000:02:00.0: enabling device (0000 -> 0002)
[ 2.048877] xhci_hcd 0000:00:14.0: xHCI Host Controller
[ 2.048884] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[ 2.049958] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000081109810
[ 2.049962] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[ 2.050124] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.05
[ 2.050125] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[ 2.050126] usb usb1: Product: xHCI Host Controller
[ 2.050127] usb usb1: Manufacturer: Linux 5.5.0-2-MANJARO xhci-hcd
[ 2.050127] usb usb1: SerialNumber: 0000:00:14.0
[ 2.050237] hub 1-0:1.0: USB hub found
[ 2.050251] hub 1-0:1.0: 12 ports detected
[ 2.050990] xhci_hcd 0000:00:14.0: xHCI Host Controller
[ 2.050993] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[ 2.050995] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[ 2.051021] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.05
[ 2.051022] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[ 2.051023] usb usb2: Product: xHCI Host Controller
[ 2.051024] usb usb2: Manufacturer: Linux 5.5.0-2-MANJARO xhci-hcd
[ 2.051024] usb usb2: SerialNumber: 0000:00:14.0
[ 2.051102] hub 2-0:1.0: USB hub found
[ 2.051113] hub 2-0:1.0: 6 ports detected
[ 2.058803] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input2
[ 2.085571] PM: Image not found (code -22)
[ 2.155190] EXT4-fs (nvme0n1p7): mounted filesystem with ordered data mode. Opts: (null)
[ 2.196178] random: fast init done
[ 2.290431] systemd[1]: systemd 242.153-3-manjaro running in system mode. (+PAM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
[ 2.304736] systemd[1]: Detected architecture x86-64.
[ 2.346795] systemd[1]: Set hostname to <x1tab>.
[ 2.350880] systemd[1]*: Couldn't move remaining userspace processes, 
ignoring: Input/output error*
[ 2.380819] usb 1-1: new full-speed USB device number 2 using xhci_hcd
[ 2.484102] tsc: Refined TSC clocksource calibration: 1896.004 MHz
[ 2.484111] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x36a8da782d4, max_idle_ns: 881590735038 ns
[ 2.484141] clocksource: Switched to clocksource tsc
[ 2.521033] systemd[1]: Listening on udev Control Socket.
[ 2.521181] systemd[1]: Listening on udev Kernel Socket.
[ 2.521261] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[ 2.524994] systemd[1]: Listening on Process Core Dump Socket.
[ 2.525178] systemd[1]: Listening on LVM2 poll daemon socket.
[ 2.525240] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[ 2.533337] usb 1-1: New USB device found, idVendor=17ef, idProduct=60b5, bcdDevice= 0.12
[ 2.533340] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 2.533342] usb 1-1: Product: ThinkPad X1 Tablet Thin Keyboard Gen 3
[ 2.533343] usb 1-1: Manufacturer: Chicony
[ 2.540021] EXT4-fs (nvme0n1p7): re-mounted. Opts: (null)
[ 2.544673] random: lvm: uninitialized urandom read (4 bytes read)
[ 2.553947] random: systemd-random-: uninitialized urandom read (512 bytes read)
[ 2.657414] usb 1-2: new high-speed USB device number 3 using xhci_hcd
[ 2.675737] usb 1-2*: config 1 has an invalid interface number: 12 but 
max is 1*
[ 2.675738] usb 1-2*: config 1 has an invalid interface number: 13 but 
max is 1*
[ 2.675739] usb 1-2*: config 1 has an invalid interface number: 13 but 
max is 1*
[ 2.675740] usb 1-2*: config 1 has no interface number 0*
[ 2.675740] usb 1-2*: config 1 has no interface number 1*
[ 2.676205] usb 1-2: New USB device found, idVendor=1199, idProduct=9079, bcdDevice= 0.06
[ 2.676206] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 2.676207] usb 1-2: Product: Sierra Wireless EM7455 Qualcomm® Snapdragon™ X7 LTE-A
[ 2.676208] usb 1-2: Manufacturer: Sierra Wireless, Incorporated
[ 2.676208] usb 1-2: SerialNumber: LF80552789021022
[ 2.754292] audit: type=1400 audit(1581093745.693:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=349 comm="apparmor_parser"
[ 2.754887] random: crng init done
[ 2.756643] audit: type=1400 audit(1581093745.693:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=349 comm="apparmor_parser"
[ 2.775572] audit: type=1130 audit(1581093745.713:4): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 2.783061] systemd-journald[329]: Received request to flush runtime journal from PID 1
[ 2.792845] audit: type=1130 audit(1581093745.730:5): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-udevd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 2.797421] usb 1-8: new high-speed USB device number 4 using xhci_hcd
[ 2.813780] audit: type=1400 audit(1581093745.750:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=360 comm="apparmor_parser"
[ 2.852930] usb 1-8: New USB device found, idVendor=04ca, idProduct=706b, bcdDevice= 0.23
[ 2.852933] usb 1-8: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[ 2.852935] usb 1-8: Product: Integrated Camera
[ 2.852936] usb 1-8: Manufacturer: 8SSC20F27052L1GZ81E04E4
[ 2.852937] usb 1-8: SerialNumber: 200901010001
[ 2.871498] input: Intel HID events as /devices/platform/INT33D5:00/input/input3
[ 2.882527] input: Intel Virtual Button driver as /devices/pci0000:00/0000:00:1f.0/PNP0C09:00/INT33D6:00/input/input4
[ 2.882772] ACPI: AC Adapter [AC] (on-line)
[ 2.897298] audit: type=1400 audit(1581093745.833:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=396 comm="apparmor_parser"
[ 2.898423] audit: type=1400 audit(1581093745.837:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=396 comm="apparmor_parser"
[ 2.909460] hid: raw HID events driver (C) Jiri Kosina
[ 2.909748] acpi PNP0C14:02*: duplicate WMI GUID 
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)*
[ 2.909914] acpi PNP0C14:03*: duplicate WMI GUID 
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)*
[ 2.910003] acpi PNP0C14:04*: duplicate WMI GUID 
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)*
[ 2.926344] audit: type=1130 audit(1581093745.863:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-journal-flush comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 2.956188] nfc: nfc_init: NFC Core ver 0.1
[ 2.956208] NET: Registered protocol family 39
[ 2.957691] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[ 2.957916] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[ 2.957965] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[ 2.967243] mc: Linux media interface: v0.10
[ 2.977019] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[ 2.977429] usb 1-9: new full-speed USB device number 5 using xhci_hcd
[ 2.978364] tpm_tis STM7304:00: 2.0 TPM (device-id 0x0, rev-id 78)
[ 2.981631] Non-volatile memory driver v1.3
[ 2.981693] idma64 idma64.0: Found Intel integrated DMA 64-bit
[ 2.997507] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[ 2.999024] idma64 idma64.1: Found Intel integrated DMA 64-bit
[ 3.006674] i2c_hid i2c-WCOM511A:00*: i2c-WCOM511A:00 supply vdd not 
found, using dummy regulator*
[ 3.006690] i2c_hid i2c-WCOM511A:00*: i2c-WCOM511A:00 supply vddl not 
found, using dummy regulator*
[ 3.024143] battery: ACPI: Battery Slot [BAT0] (battery present)
[ 3.032214] audit: type=1130 audit(1581093745.970:10): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=lvm2-monitor comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 3.035287] intel_ish_ipc 0000:00:13.0: enabling device (0000 -> 0002)
[ 3.044091] Adding 11718652k swap on /dev/nvme0n1p5.  Priority:-2 extents:1 across:11718652k SSFS
[ 3.051108] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[ 3.051110] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[ 3.051110] RAPL PMU: hw unit of domain package 2^-14 Joules
[ 3.051111] RAPL PMU: hw unit of domain dram 2^-14 Joules
[ 3.051112] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[ 3.051112] RAPL PMU: hw unit of domain psys 2^-14 Joules
[ 3.064050] intel-lpss 0000:00:15.2: enabling device (0000 -> 0002)
[ 3.066408] idma64 idma64.2: Found Intel integrated DMA 64-bit
[ 3.097955] intel-lpss 0000:00:1e.0: enabling device (0000 -> 0002)
[ 3.098241] idma64 idma64.3: Found Intel integrated DMA 64-bit
[ 3.098468] intel-lpss 0000:00:1e.3: enabling device (0000 -> 0002)
[ 3.098711] idma64 idma64.4: Found Intel integrated DMA 64-bit
[ 3.125093] usb 1-9: New USB device found, idVendor=8087, idProduct=0a2b, bcdDevice= 0.10
[ 3.125095] usb 1-9: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[ 3.138261] input: PC Speaker as /devices/platform/pcspkr/input/input5
[ 3.138353] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[ 3.138573] resource sanity check*: requesting [mem 
0xfed10000-0xfed15fff], which spans more than pnp 00:06 [mem 
0xfed10000-0xfed13fff]*
[ 3.138582] *caller snb_uncore_imc_init_box+0x74/0xb0 [intel_uncore] 
mapping multiple BARs*
[ 3.143035] mei_me 0000:00:16.0: enabling device (0004 -> 0006)
[ 3.143421] videodev: Linux video capture interface: v2.00
[ 3.149694] Linux agpgart interface v0.103
[ 3.156002] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[ 3.156130] intel_rapl_common: Found RAPL domain package
[ 3.156132] intel_rapl_common: Found RAPL domain dram
[ 3.156277] thinkpad_acpi: ThinkPad ACPI Extras v0.26
[ 3.156278] thinkpad_acpi:http://ibm-acpi.sf.net/
[ 3.156279] thinkpad_acpi: ThinkPad BIOS N1ZET79W(1.35 ), EC N1ZHT43W
[ 3.156280] thinkpad_acpi: Lenovo ThinkPad X1 Tablet Gen 3, model 20KKS0PG01
[ 3.156470] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THERMAL_PCI
[ 3.157930] thinkpad_acpi: radio switch found; radios are enabled
[ 3.158245] thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
[ 3.158245] thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
[ 3.160761] cryptd: max_cpu_qlen set to 1000
[ 3.161554] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
[ 3.163271] thinkpad_acpi: rfkill switch tpacpi_wwan_sw: radio is unblocked
[ 3.170039] thinkpad_acpi: Standard ACPI backlight interface available, not loading native one
[ 3.179452] fuse: init (API version 7.31)
[ 3.179476] *** VALIDATE fuse ***
[ 3.179480] *** VALIDATE fuse ***
[ 3.182326] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[ 3.205705] thinkpad_acpi: battery 1 registered (start 70, stop 90)
[ 3.205713] battery: new extension: ThinkPad Battery Extension
[ 3.205774] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/input6
[ 3.269801] AVX2 version of gcm_enc/dec engaged.
[ 3.269802] AES CTR mode by8 optimization enabled
[ 3.327097] iTCO_vendor_support: vendor-support=0
[ 3.328596] input: WCOM511A:00 056A:511A Touchscreen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input7
[ 3.328908] intel_rapl_common: Found RAPL domain package
[ 3.328910] intel_rapl_common: Found RAPL domain core
[ 3.328911] intel_rapl_common: Found RAPL domain uncore
[ 3.328912] intel_rapl_common: Found RAPL domain dram
[ 3.332010] input: WCOM511A:00 056A:511A as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input8
[ 3.332092] input: WCOM511A:00 056A:511A as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input9
[ 3.332167] input: WCOM511A:00 056A:511A as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input10
[ 3.332239] input: WCOM511A:00 056A:511A Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input11
[ 3.332625] hid-generic 0018:056A:511A.0001: input,hidraw0: I2C HID v1.00 Mouse [WCOM511A:00 056A:511A] on i2c-WCOM511A:00
[ 3.332806] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:17EF:60B5.0002/input/input12
[ 3.332888] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[ 3.333868] iTCO_wdt: Found a Intel PCH TCO device (Version=4, TCOBASE=0x0400)
[ 3.334344] dw-apb-uart.3: ttyS1 at MMIO 0x2ffb43e000 (irq = 20, base_baud = 115200) is a 16550A
[ 3.334396] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[ 3.337646] ipu3-cio2 0000:00:14.3: enabling device (0000 -> 0002)
[ 3.340861] ipu3_imgu*: module is from the staging directory, the 
quality is unknown, you have been warned.*
[ 3.342571] ipu3-imgu 0000:00:05.0: enabling device (0000 -> 0002)
[ 3.344385] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 System Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input13
[ 3.345054] ipu3-imgu 0000:00:05.0: device 0x1919 (rev: 0x1)
[ 3.345084] ipu3-imgu 0000:00:05.0: physical base address 0x0000002ffb000000, 4194304 bytes
[ 3.347187] ipu3-cio2 0000:00:14.3: device 0x9d32 (rev: 0x1)
[ 3.388066] hid-generic 0003:17EF:60B5.0002: input,hidraw1: USB HID v1.11 Keyboard [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input0
[ 3.444614] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input14
[ 3.445118] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input15
[ 3.445411] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Wireless Radio Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input16
[ 3.446589] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input17
[ 3.446866] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input18
[ 3.447121] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:17EF:60B5.0003/input/input19
[ 3.447594] hid-generic 0003:17EF:60B5.0003: input,hiddev0,hidraw2: USB HID v1.11 Device [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input1
[ 3.477812] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input20
[ 3.478013] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Touchpad as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input21
[ 3.478289] hid-generic 0003:17EF:60B5.0004: input,hiddev1,hidraw3: USB HID v1.11 Mouse [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input2
[ 3.478388] usbcore: registered new interface driver usbhid
[ 3.478390] usbhid: USB HID core driver
[ 3.527166] ipu3-imgu 0000:00:05.0: loaded firmware version irci_irci_ecr-master_20161208_0213_20170112_1500, 17 binaries, 1212984 bytes
[ 3.576575] Intel(R) Wireless WiFi driver for Linux
[ 3.576580] Copyright(c) 2003- 2015 Intel Corporation
[ 3.577233] iwlwifi 0000:04:00.0: enabling device (0000 -> 0002)
[ 3.607702] iwlwifi 0000:04:00.0: Found debug destination: EXTERNAL_DRAM
[ 3.607710] iwlwifi 0000:04:00.0: Found debug configuration: 0
[ 3.609332] iwlwifi 0000:04:00.0: loaded firmware version 36.77d01142.0 op_mode iwlmvm
[ 4.081453] input: Wacom HID 511A Pen as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input23
[ 4.088319] input: Wacom HID 511A Finger as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-WCOM511A:00/0018:056A:511A.0001/input/input24
[ 4.088724] wacom 0018:056A:511A.0001: hidraw0: I2C HID v1.00 Mouse [WCOM511A:00 056A:511A] on i2c-WCOM511A:00
[ 4.196189] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040380
[ 4.308808] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input26
[ 4.309749] input: Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3 Touchpad as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:17EF:60B5.0004/input/input27
[ 4.312771] hid-multitouch 0003:17EF:60B5.0004: input,hiddev1,hidraw3: USB HID v1.11 Mouse [Chicony ThinkPad X1 Tablet Thin Keyboard Gen 3] on usb-0000:00:14.0-1/input2
[ 4.489122] usbcore: registered new interface driver qcserial
[ 4.489154] usbserial: USB Serial support registered for Qualcomm USB modem
[ 4.508295] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: [hid-ish]: enum_devices_done OK, num_hid_devices=2
[ 4.509636] mousedev: PS/2 mouse device common for all mice
[ 4.526625] hid-generic 001F:8087:0AC2.0005: hidraw4: <UNKNOWN> HID v2.00 Device [hid-ishtp 8087:0AC2] on
[ 4.546130] hid-generic 001F:8087:0AC2.0006: hidraw5: <UNKNOWN> HID v2.00 Device [hid-ishtp 8087:0AC2] on
[ 4.716358] uvcvideo: Found UVC 1.00 device Integrated Camera (04ca:706b)
[ 4.725951] uvcvideo 1-8:1.0*: Entity type for entity Realtek Extended 
Controls Unit was not initialized!*
[ 4.725958] uvcvideo 1-8:1.0*: Entity type for entity Extension 4 was 
not initialized!*
[ 4.725964] uvcvideo 1-8:1.0*: Entity type for entity Processing 2 was 
not initialized!*
[ 4.725969] uvcvideo 1-8:1.0*: Entity type for entity Camera 1 was not 
initialized!*
[ 4.726172] input: Integrated Camera: Integrated C as /devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0/input/input29
[ 4.726364] usbcore: registered new interface driver uvcvideo
[ 4.726368] USB Video Class driver (1.1.1)
[ 4.851008] iwlwifi 0000:04:00.0: Detected Intel(R) Dual Band Wireless AC 8265, REV=0x230
[ 4.856225] usbcore: registered new interface driver cdc_ncm
[ 4.864263] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 4.867060] iwlwifi 0000:04:00.0: Allocated 0x00400000 bytes for firmware monitor.
[ 4.930014] iwlwifi 0000:04:00.0: base HW address: 94:b8:6d:82:b8:c4
[ 5.009898] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[ 5.010870] thermal thermal_zone10*: failed to read out thermal zone (-61)*
[ 5.030504] iwlwifi 0000:04:00.0 wlp4s0: renamed from wlan0
[ 5.076313] usbcore: registered new interface driver cdc_wdm
[ 5.146146] Bluetooth: Core ver 2.22
[ 5.146195] NET: Registered protocol family 31
[ 5.146198] Bluetooth: HCI device and connection manager initialized
[ 5.146211] Bluetooth: HCI socket layer initialized
[ 5.146217] Bluetooth: L2CAP socket layer initialized
[ 5.146228] Bluetooth: SCO socket layer initialized
[ 5.194460] cdc_mbim 1-2:1.12: cdc-wdm2: USB WDM device
[ 5.195936] cdc_mbim 1-2:1.12 wwan0: register 'cdc_mbim' at usb-0000:00:14.0-2, CDC MBIM, 46:c9:22:21:12:77
[ 5.196062] usbcore: registered new interface driver cdc_mbim
[ 5.307144] cdc_mbim 1-2:1.12 wwp0s20f0u2i12: renamed from wwan0
[ 5.387847] i915 0000:00:02.0: enabling device (0006 -> 0007)
[ 5.389066] checking generic (2fa0000000 1700000) vs hw (2ffa000000 1000000)
[ 5.389072] checking generic (2fa0000000 1700000) vs hw (2fa0000000 10000000)
[ 5.389076] fb0: switching to inteldrmfb from EFI VGA
[ 5.389355] i915 0000:00:02.0: vgaarb: deactivate vga console
[ 5.392087] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[ 5.392091] [drm] Driver supports precise vblank timestamp query.
[ 5.393560] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=mem
[ 5.395159] [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[ 5.396471] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[ 5.432460] [drm] Initialized i915 1.6.0 20191101 for 0000:00:02.0 on minor 0
[ 5.443396] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[ 5.444470] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input30
[ 5.445083] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[ 5.449531] usbcore: registered new interface driver btusb
[ 5.459694] Bluetooth: hci0: Firmware revision 0.1 build 50 week 12 2019
[ 5.475511] fbcon: i915drmfb (fb0) is primary device
[ 5.475515] fbcon: Deferring console take-over
[ 5.475524] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[ 5.632610] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC295: line_outs=2 (0x14/0x1b/0x0/0x0/0x0) type:speaker
[ 5.632619] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[ 5.632625] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[ 5.632630] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[ 5.632633] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[ 5.632639] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x19
[ 5.632645] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
[ 5.636599] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[ 5.636604] Bluetooth: BNEP filters: protocol multicast
[ 5.636615] Bluetooth: BNEP socket layer initialized
[ 5.663335] NET: Registered protocol family 38
[ 5.696296] kauditd_printk_skb*: 28 callbacks suppressed*
[ 5.696301] audit: type=1130 audit(1581093748.633:39): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=ModemManager comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.738584] loop: module loaded
[ 5.803457] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[ 5.856234] audit: type=1130 audit(1581093748.793:40): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=snapd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 5.923618] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1f.3/sound/card0/input31
[ 5.923828] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input32
[ 5.924055] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input33
[ 5.924762] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input34
[ 5.925045] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input35
[ 5.925266] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input36
[ 5.925475] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input37
[ 5.925720] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input38
[ 5.940311] audit: type=1130 audit(1581093748.877:41): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=org.cups.cupsd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.291953] audit: type=1130 audit(1581093749.230:42): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.372524] audit: type=1130 audit(1581093749.310:43): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.390231] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 6.525786] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 6.595039] iwlwifi 0000:04:00.0*: FW already configured (0) - 
re-configuring*
[ 6.646298] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 6.781987] iwlwifi 0000:04:00.0: Applying debug destination EXTERNAL_DRAM
[ 6.850042] audit: type=1130 audit(1581093749.787:44): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-logind comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.850976] iwlwifi 0000:04:00.0*: FW already configured (0) - 
re-configuring*
[ 6.865094] audit: type=1130 audit(1581093749.803:45): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=lightdm comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.891150] audit: type=1130 audit(1581093749.830:46): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=intel-undervolt comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.891199] audit: type=1131 audit(1581093749.830:47): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=intel-undervolt comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6.927894] audit: type=1130 audit(1581093749.867:48): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=wpa_supplicant comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 10.715931] kauditd_printk_skb*: 4 callbacks suppressed*
[ 10.715935] audit: type=1130 audit(1581093753.653:53): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user-runtime-dir@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 10.735530] audit: type=1101 audit(1581093753.673:54): pid=1149 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:accounting grantors=pam_tally2,pam_access,pam_unix,pam_permit,pam_time acct="lightdm" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 10.735727] audit: type=1006 audit(1581093753.673:55): pid=1149 uid=0 subj==unconfined old-auid=4294967295 auid=970 tty=(none) old-ses=4294967295 ses=1 res=1
[ 10.739099] audit: type=1105 audit(1581093753.677:56): pid=1149 uid=0 auid=970 ses=1 subj==unconfined msg='op=PAM:session_open grantors=pam_loginuid,pam_loginuid,pam_keyinit,pam_limits,pam_unix,pam_permit,pam_mail,pam_systemd,pam_env acct="lightdm" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 10.860663] audit: type=1131 audit(1581093753.797:57): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=snapd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 10.912070] audit: type=1130 audit(1581093753.850:58): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 10.930283] audit: type=1105 audit(1581093753.867:59): pid=1145 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:session_open grantors=pam_unix,pam_systemd acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 16.397223] audit: type=1100 audit(1581093759.333:60): pid=1191 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:authentication grantors=pam_tally2,pam_shells,pam_unix,pam_permit,pam_gnome_keyring acct="jogo8307" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 16.407060] audit: type=1101 audit(1581093759.343:61): pid=1191 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:accounting grantors=pam_tally2,pam_access,pam_unix,pam_permit,pam_time acct="jogo8307" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 16.496797] audit: type=1106 audit(1581093759.433:62): pid=1145 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:session_close grantors=pam_unix,pam_systemd acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 16.496987] audit: type=1104 audit(1581093759.433:63): pid=1145 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:setcred grantors=pam_env,pam_permit acct="lightdm" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 16.506616] audit: type=1103 audit(1581093759.443:64): pid=1191 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:setcred grantors=pam_tally2,pam_shells,pam_unix,pam_permit,pam_gnome_keyring acct="jogo8307" exe="/usr/bin/lightdm" hostname=? addr=? terminal=:0 res=success'
[ 16.506770] audit: type=1006 audit(1581093759.443:65): pid=1191 uid=0 subj==unconfined old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=2 res=1
[ 16.582405] audit: type=1130 audit(1581093759.520:66): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user-runtime-dir@1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 16.600668] audit: type=1101 audit(1581093759.537:67): pid=1201 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='op=PAM:accounting grantors=pam_tally2,pam_access,pam_unix,pam_permit,pam_time acct="jogo8307" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 16.601390] audit: type=1006 audit(1581093759.540:68): pid=1201 uid=0 subj==unconfined old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=3 res=1
[ 16.612763] audit: type=1105 audit(1581093759.550:69): pid=1201 uid=0 auid=1000 ses=3 subj==unconfined msg='op=PAM:session_open grantors=pam_loginuid,pam_loginuid,pam_keyinit,pam_limits,pam_unix,pam_permit,pam_mail,pam_systemd,pam_env acct="jogo8307" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 18.567091] wlp4s0: authenticate with 10:05:ca:d0:16:6f
[ 18.577544] wlp4s0: send auth to 10:05:ca:d0:16:6f (try 1/3)
[ 18.583112] wlp4s0: authenticated
[ 18.584355] wlp4s0: associate with 10:05:ca:d0:16:6f (try 1/3)
[ 18.587767] wlp4s0: RX AssocResp from 10:05:ca:d0:16:6f (capab=0x111 status=0 aid=20)
[ 18.590184] wlp4s0: associated
[ 18.647306] IPv6: ADDRCONF(NETDEV_CHANGE): wlp4s0: link becomes ready
[ 18.680220] wlp4s0: Limiting TX power to 14 dBm as advertised by 10:05:ca:d0:16:6f
[ 19.220783] Bluetooth: RFCOMM TTY layer initialized
[ 19.220797] Bluetooth: RFCOMM socket layer initialized
[ 19.220810] Bluetooth: RFCOMM ver 1.11
[ 21.516566] kauditd_printk_skb*: 6 callbacks suppressed*
[ 21.516572] audit: type=1130 audit(1581093764.453:76): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=udisks2 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 22.577517] audit: type=1130 audit(1581093765.513:77): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=pamac-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 22.593068] audit: type=1131 audit(1581093765.530:78): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=pamac-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 23.065305] audit: type=1130 audit(1581093766.003:79): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=upower comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 23.483904] audit: type=1130 audit(1581093766.420:80): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=blueman-mechanism comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 26.843847] audit: type=1131 audit(1581093769.777:81): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 26.878089] audit: type=1131 audit(1581093769.817:82): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=user-runtime-dir@970 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 30.014958] audit: type=1131 audit(1581093772.953:83): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=NetworkManager-dispatcher comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 35.214861] input: MX Vertical Mouse as /devices/virtual/misc/uhid/0005:046D:B020.0007/input/input39
[ 35.215365] hid-generic 0005:046D:B020.0007: input,hidraw4: BLUETOOTH HID v0.09 Mouse [MX Vertical] on 94:B8:6D:82:B8:C8
[ 36.338955] audit: type=1131 audit(1581093779.266:84): pid=1 uid=0 auid=4294967295 ses=4294967295 subj==unconfined msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 49.907580] audit: type=1100 audit(1581093792.507:85): pid=1571 uid=1000 auid=1000 ses=2 subj==unconfined msg='op=PAM:authentication grantors=pam_unix,pam_permit acct="jogo8307" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 49.908169] audit: type=1101 audit(1581093792.507:86): pid=1571 uid=1000 auid=1000 ses=2 subj==unconfined msg='op=PAM:accounting grantors=pam_unix,pam_permit,pam_time acct="jogo8307" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 49.908864] audit: type=1110 audit(1581093792.507:87): pid=1571 uid=0 auid=1000 ses=2 subj==unconfined msg='op=PAM:setcred grantors=pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[ 49.916258] audit: type=1105 audit(1581093792.514:88): pid=1571 uid=0 auid=1000 ses=2 subj==unconfined msg='op=PAM:session_open grantors=pam_limits,pam_unix,pam_permit acct="root" exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'


On 03/02/2020 08:18, Oliver Neukum wrote:

> Am Dienstag, den 21.01.2020, 20:15 +0000 schrieb bugzilla-
> daemon@bugzilla.kernel.org:
>> goepfert.johannes@gmail.com
> Hi,
>
>
> please report this to
> linux-usb@vger.kernel.org  as a regression with a dmesg of a working and
> a failing kernel.
>
> 	Regards
> 		Oliver
>
>
