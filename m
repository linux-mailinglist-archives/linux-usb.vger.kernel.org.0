Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70E0A80AAE
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2019 13:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbfHDLKK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Aug 2019 07:10:10 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:45707 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfHDLKK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Aug 2019 07:10:10 -0400
Received: by mail-pg1-f172.google.com with SMTP id o13so38218159pgp.12
        for <linux-usb@vger.kernel.org>; Sun, 04 Aug 2019 04:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:message-id:mime-version;
        bh=ewuUwNC+iXuLk8mJFyu5wzzBzCqN6gyT3ZUpnJ3P5KU=;
        b=e2VwSGVqFtKCB+8vsmQPZjSo2/8LlerJ/CS0hUhIWdzbSH6y9GSTVgzTAbxiMOOvuF
         xNB5E6sanwrZm4bz5sYHyp1ATJFi9LWdRSPBxFTCRRhQMTtkAqeouN55NHVlDAdUMQZG
         BTUg/6lXJnCjdjFhL+7Ded+nSnItzklPMv3qLfS9mUw4TRhHz+czhvSHyffMCmMHsacG
         QrdWXSfxmDjvujWyJ+B8Xdf8nc5j5dyT0wGz1R9EQhz8kSyTzTIst2NA/c27rZ1unKRb
         c2gL+1fYc80cHTRNhsmgeIIsu7cbiZ94dUeY8qcrEMgMCvCpgSvPqueURexwe6MOJWMV
         iRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:message-id:mime-version;
        bh=ewuUwNC+iXuLk8mJFyu5wzzBzCqN6gyT3ZUpnJ3P5KU=;
        b=Et+YPsm4fAQz1Ckw7Fxy/LeI/6ucI7ctnqgRlBt38Kdan6aGjy5uW3ehAtlsr3rS15
         7IvTq2c2Wp/4fo/hbnXyyWrZX8IWhD3Z4ztuaq9Yn0n0Ilnz9MY4A2ADoj0CIMLW7W/m
         2dsfwMSuOwlrijbuDxXf4gvNc005lG4sgQCeNbKqktf6eac0R8Z6EsSPrpavz7XI4e0Q
         +vnV/1+N48TVcYK4GRfTYMbLkDQ3Ozv306blwOHAE8k3AlA54W4meZahD6Ycd56QANPV
         J/flAVebn7BC6T5L4Ws7i8ifk+cTksx/0JqLALC4FIU5cDaZi7CdzW+U3ukZX0oTDjHp
         6Xtg==
X-Gm-Message-State: APjAAAV/ktthQkVOCcvxSfOHXgz0Vljx/zhRmXIFCAgMECpuBF+aac3Q
        htU/p94RtB4A7XugY145ySh5BtFXJNRZmg==
X-Google-Smtp-Source: APXvYqy25yHcP867TzNyr9CTA6vsNJ50SxdctU6s8/DLJf1toBfWvx8xIv+UN+BKTkFcMRZEFkRWaw==
X-Received: by 2002:a65:4808:: with SMTP id h8mr130829488pgs.22.1564917005803;
        Sun, 04 Aug 2019 04:10:05 -0700 (PDT)
Received: from [192.168.8.100] (pa49-195-32-20.pa.nsw.optusnet.com.au. [49.195.32.20])
        by smtp.gmail.com with ESMTPSA id j15sm111047880pfn.150.2019.08.04.04.10.02
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 04:10:05 -0700 (PDT)
Date:   Sun, 04 Aug 2019 21:10:00 +1000
From:   Bogdan Vatulya <bogdan.watula@gmail.com>
Subject: dmesg reports issues when using USB device RODE AI-1 Audio Interface
To:     linux-usb@vger.kernel.org
Message-Id: <1564917000.2.1@gmail.com>
X-Mailer: geary/3.32.2
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-9qQy6kMsJjANstjnt41w"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-9qQy6kMsJjANstjnt41w
Content-Type: text/plain; charset=us-ascii; format=flowed

Good day.

I have a USB audio interface RODE AI-1 connected to usb hub.
The device works after booting into the system, however dmesg reports 
tons of issues.
Some of them are

usb 1-6.1.3: device descriptor read/64, error -71
usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
usb 1-6.1.3: hub failed to enable device, error -22

Full dmesg output is attached to the email in the rode-ai-1.txt
The output of lsusb -vt is attached to lsusb-all.txt

Some more information.

The system is Fedora 30 Workstation Edition x64
Kernel is 5.1.20-300.fc30.x86_64

the output of lsusb -vd 19f7:000a (USB device vendor/product id) for 
RODE AI-1 is attached to usb-device-info.txt
the output of lsmod can be found in the attached lsmod.txt

Connecting RODE AI-1 directly to a PC USB gives even more miserable 
results unfortunately.


--=-9qQy6kMsJjANstjnt41w
Content-Type: multipart/mixed; boundary="=-v/Vu7JncjaR3ugxv30an"

--=-v/Vu7JncjaR3ugxv30an
Content-Type: text/plain
Content-Disposition: attachment; filename=rode-ai-1.txt
Content-Transfer-Encoding: quoted-printable

[    0.000000] microcode: microcode updated early to revision 0xcc, date =
=3D 2019-04-01
[    0.000000] Linux version 5.1.20-300.fc30.x86_64 (mockbuild@bkernel04.ph=
x2.fedoraproject.org) (gcc version 9.1.1 20190503 (Red Hat 9.1.1-1) (GCC)) =
#1 SMP Fri Jul 26 15:03:11 UTC 2019
[    0.000000] Command line: BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-5.1.20-300.fc3=
0.x86_64 root=3D/dev/mapper/fedora_localhost--live-root ro rd.driver.blackl=
ist=3Dnouveau modprobe.blacklist=3Dnouveau nvidia-drm.modeset=3D1 resume=3D=
/dev/mapper/fedora_localhost--live-swap rd.lvm.lv=3Dfedora_localhost-live/r=
oot rd.lvm.lv=3Dfedora_localhost-live/swap rhgb quiet
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registe=
rs'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 b=
ytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000000fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000001000-0x0000000000057fff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000008ffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000000090000-0x0000000000090fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000091000-0x000000000009dfff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000000009e000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000083ebbfff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000083ebc000-0x0000000083ebcfff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000083ebd000-0x0000000083ebdfff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000083ebe000-0x000000008ccc5fff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000008ccc6000-0x000000008e42dfff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000008e42e000-0x000000008e470fff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x000000008e471000-0x000000008ec22fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000008ec23000-0x000000008faa1fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000008faa2000-0x000000008fafffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000008fb00000-0x000000008fffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000086effffff] usabl=
e
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0x83677018-0x83696a57] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0x83677018-0x83696a57] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0x83665018-0x83676057] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0x83665018-0x83676057] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0x83f76018-0x83f7de57] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0x83f76018-0x83f7de57] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0x83654018-0x83664c57] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0x83654018-0x83664c57] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x0000000000000f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000001000-0x0000000000057f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000058000-0x0000000000058f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000059000-0x000000000008ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000000090000-0x0000000000090f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000091000-0x000000000009df=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009e000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x00000000836540=
17] usable
[    0.000000] reserve setup_data: [mem 0x0000000083654018-0x0000000083664c=
57] usable
[    0.000000] reserve setup_data: [mem 0x0000000083664c58-0x00000000836650=
17] usable
[    0.000000] reserve setup_data: [mem 0x0000000083665018-0x00000000836760=
57] usable
[    0.000000] reserve setup_data: [mem 0x0000000083676058-0x00000000836770=
17] usable
[    0.000000] reserve setup_data: [mem 0x0000000083677018-0x0000000083696a=
57] usable
[    0.000000] reserve setup_data: [mem 0x0000000083696a58-0x0000000083ebbf=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000083ebc000-0x0000000083ebcf=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000083ebd000-0x0000000083ebdf=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000083ebe000-0x0000000083f760=
17] usable
[    0.000000] reserve setup_data: [mem 0x0000000083f76018-0x0000000083f7de=
57] usable
[    0.000000] reserve setup_data: [mem 0x0000000083f7de58-0x000000008ccc5f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000008ccc6000-0x000000008e42df=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000008e42e000-0x000000008e470f=
ff] ACPI data
[    0.000000] reserve setup_data: [mem 0x000000008e471000-0x000000008ec22f=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000008ec23000-0x000000008faa1f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000008faa2000-0x000000008fafff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000008fb00000-0x000000008fffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000e0000000-0x00000000efffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fe000000-0x00000000fe010f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec00000-0x00000000fec00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000fee00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000086effff=
ff] usable
[    0.000000] efi: EFI v2.50 by American Megatrends
[    0.000000] efi:  ESRT=3D0x8f9acd98  ACPI=3D0x8e43b000  ACPI 2.0=3D0x8e4=
3b000  SMBIOS=3D0x8f9aa000  SMBIOS 3.0=3D0x8f9a9000=20
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: System manufacturer System Product Name/Z170-DELUXE, BI=
OS 3801 03/14/2018
[    0.000000] tsc: Detected 4000.000 MHz processor
[    0.000861] tsc: Detected 4008.000 MHz TSC
[    0.000861] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000861] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000866] last_pfn =3D 0x86f000 max_arch_pfn =3D 0x400000000
[    0.000871] MTRR default type: write-back
[    0.000871] MTRR fixed ranges enabled:
[    0.000872]   00000-9FFFF write-back
[    0.000872]   A0000-BFFFF uncachable
[    0.000872]   C0000-FFFFF write-protect
[    0.000873] MTRR variable ranges enabled:
[    0.000874]   0 base 00C0000000 mask 7FC0000000 uncachable
[    0.000874]   1 base 00A0000000 mask 7FE0000000 uncachable
[    0.000874]   2 base 0090000000 mask 7FF0000000 uncachable
[    0.000875]   3 disabled
[    0.000875]   4 disabled
[    0.000875]   5 disabled
[    0.000875]   6 disabled
[    0.000876]   7 disabled
[    0.000876]   8 disabled
[    0.000876]   9 disabled
[    0.001562] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.001644] last_pfn =3D 0x8fb00 max_arch_pfn =3D 0x400000000
[    0.006171] esrt: Reserving ESRT space from 0x000000008f9acd98 to 0x0000=
00008f9acdd0.
[    0.006178] Using GB pages for direct mapping
[    0.006179] BRK [0x6e0001000, 0x6e0001fff] PGTABLE
[    0.006180] BRK [0x6e0002000, 0x6e0002fff] PGTABLE
[    0.006180] BRK [0x6e0003000, 0x6e0003fff] PGTABLE
[    0.006211] BRK [0x6e0004000, 0x6e0004fff] PGTABLE
[    0.006212] BRK [0x6e0005000, 0x6e0005fff] PGTABLE
[    0.006356] BRK [0x6e0006000, 0x6e0006fff] PGTABLE
[    0.006397] BRK [0x6e0007000, 0x6e0007fff] PGTABLE
[    0.006527] BRK [0x6e0008000, 0x6e0008fff] PGTABLE
[    0.006584] BRK [0x6e0009000, 0x6e0009fff] PGTABLE
[    0.006656] RAMDISK: [mem 0x7e875000-0x7fffdfff]
[    0.006660] ACPI: Early table checksum verification disabled
[    0.006662] ACPI: RSDP 0x000000008E43B000 000024 (v02 ALASKA)
[    0.006663] ACPI: XSDT 0x000000008E43B0A0 0000BC (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006666] ACPI: FACP 0x000000008E465AC0 000114 (v06 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006668] ACPI: DSDT 0x000000008E43B1F8 02A8C5 (v02 ALASKA A M I    01=
072009 INTL 20160422)
[    0.006669] ACPI: FACS 0x000000008EC22C40 000040
[    0.006671] ACPI: APIC 0x000000008E465BD8 0000BC (v03 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006672] ACPI: FPDT 0x000000008E465C98 000044 (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006673] ACPI: DMAR 0x000000008E470348 000088 (v01 INTEL  KBL      00=
000001 INTL 00000001)
[    0.006674] ACPI: MCFG 0x000000008E465D38 00003C (v01 ALASKA A M I    01=
072009 MSFT 00000097)
[    0.006675] ACPI: FIDT 0x000000008E465D78 00009C (v01 ALASKA A M I    01=
072009 AMI  00010013)
[    0.006677] ACPI: SSDT 0x000000008E465E18 003154 (v02 SaSsdt SaSsdt   00=
003000 INTL 20160422)
[    0.006678] ACPI: SSDT 0x000000008E468F70 00253E (v02 PegSsd PegSsdt  00=
001000 INTL 20160422)
[    0.006679] ACPI: HPET 0x000000008E46B4B0 000038 (v01 INTEL  SKL      00=
000001 MSFT 0000005F)
[    0.006680] ACPI: SSDT 0x000000008E46B4E8 000024 (v02 INTEL  OEM_RTD3 00=
001000 INTL 20160422)
[    0.006682] ACPI: SSDT 0x000000008E46B510 000B13 (v02 INTEL  xh_rvp08 00=
000000 INTL 20160422)
[    0.006683] ACPI: UEFI 0x000000008E46C028 000042 (v01 INTEL  EDK2     00=
000002      01000013)
[    0.006684] ACPI: SSDT 0x000000008E46C070 000EDE (v02 CpuRef CpuSsdt  00=
003000 INTL 20160422)
[    0.006685] ACPI: LPIT 0x000000008E46CF50 000094 (v01 INTEL  SKL      00=
000000 MSFT 0000005F)
[    0.006687] ACPI: WSMT 0x000000008E46CFE8 000028 (v01 INTEL  SKL      00=
000000 MSFT 0000005F)
[    0.006688] ACPI: SSDT 0x000000008E46D010 00029F (v02 INTEL  sensrhub 00=
000000 INTL 20160422)
[    0.006689] ACPI: SSDT 0x000000008E46D2B0 003002 (v02 INTEL  PtidDevc 00=
001000 INTL 20160422)
[    0.006690] ACPI: DBGP 0x000000008E4702B8 000034 (v01 INTEL           00=
000002 MSFT 0000005F)
[    0.006692] ACPI: DBG2 0x000000008E4702F0 000054 (v00 INTEL           00=
000002 MSFT 0000005F)
[    0.006695] ACPI: Local APIC address 0xfee00000
[    0.006820] No NUMA configuration found
[    0.006820] Faking a node at [mem 0x0000000000000000-0x000000086effffff]
[    0.006826] NODE_DATA(0) allocated [mem 0x86efd5000-0x86effffff]
[    0.038143] Zone ranges:
[    0.038143]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.038144]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.038145]   Normal   [mem 0x0000000100000000-0x000000086effffff]
[    0.038145]   Device   empty
[    0.038145] Movable zone start for each node
[    0.038147] Early memory node ranges
[    0.038148]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
[    0.038148]   node   0: [mem 0x0000000000059000-0x000000000008ffff]
[    0.038148]   node   0: [mem 0x0000000000091000-0x000000000009dfff]
[    0.038148]   node   0: [mem 0x0000000000100000-0x0000000083ebbfff]
[    0.038149]   node   0: [mem 0x0000000083ebe000-0x000000008ccc5fff]
[    0.038149]   node   0: [mem 0x000000008faa2000-0x000000008fafffff]
[    0.038149]   node   0: [mem 0x0000000100000000-0x000000086effffff]
[    0.038258] Zeroed struct page in unavailable ranges: 13123 pages
[    0.038259] Initmem setup node 0 [mem 0x0000000000001000-0x000000086efff=
fff]
[    0.038260] On node 0 totalpages: 8371389
[    0.038260]   DMA zone: 64 pages used for memmap
[    0.038260]   DMA zone: 21 pages reserved
[    0.038261]   DMA zone: 3995 pages, LIFO batch:0
[    0.038312]   DMA32 zone: 8949 pages used for memmap
[    0.038312]   DMA32 zone: 572706 pages, LIFO batch:63
[    0.046115]   Normal zone: 121792 pages used for memmap
[    0.046115]   Normal zone: 7794688 pages, LIFO batch:63
[    0.138923] ACPI: PM-Timer IO Port: 0x1808
[    0.138924] ACPI: Local APIC address 0xfee00000
[    0.138928] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.138928] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.138929] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.138929] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.138929] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.138929] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.138930] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.138930] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.138955] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
119
[    0.138955] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.138956] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.138957] ACPI: IRQ0 used by override.
[    0.138957] ACPI: IRQ9 used by override.
[    0.138958] Using ACPI (MADT) for SMP configuration information
[    0.138959] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.138961] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.138972] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.138972] PM: Registered nosave memory: [mem 0x00058000-0x00058fff]
[    0.138973] PM: Registered nosave memory: [mem 0x00090000-0x00090fff]
[    0.138974] PM: Registered nosave memory: [mem 0x0009e000-0x000fffff]
[    0.138975] PM: Registered nosave memory: [mem 0x83654000-0x83654fff]
[    0.138975] PM: Registered nosave memory: [mem 0x83664000-0x83664fff]
[    0.138976] PM: Registered nosave memory: [mem 0x83665000-0x83665fff]
[    0.138976] PM: Registered nosave memory: [mem 0x83676000-0x83676fff]
[    0.138977] PM: Registered nosave memory: [mem 0x83677000-0x83677fff]
[    0.138977] PM: Registered nosave memory: [mem 0x83696000-0x83696fff]
[    0.138978] PM: Registered nosave memory: [mem 0x83ebc000-0x83ebcfff]
[    0.138978] PM: Registered nosave memory: [mem 0x83ebd000-0x83ebdfff]
[    0.138979] PM: Registered nosave memory: [mem 0x83f76000-0x83f76fff]
[    0.138980] PM: Registered nosave memory: [mem 0x83f7d000-0x83f7dfff]
[    0.138981] PM: Registered nosave memory: [mem 0x8ccc6000-0x8e42dfff]
[    0.138981] PM: Registered nosave memory: [mem 0x8e42e000-0x8e470fff]
[    0.138981] PM: Registered nosave memory: [mem 0x8e471000-0x8ec22fff]
[    0.138982] PM: Registered nosave memory: [mem 0x8ec23000-0x8faa1fff]
[    0.138982] PM: Registered nosave memory: [mem 0x8fb00000-0x8fffffff]
[    0.138983] PM: Registered nosave memory: [mem 0x90000000-0xdfffffff]
[    0.138983] PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.138983] PM: Registered nosave memory: [mem 0xf0000000-0xfdffffff]
[    0.138983] PM: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.138984] PM: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.138984] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.138984] PM: Registered nosave memory: [mem 0xfec01000-0xfedfffff]
[    0.138984] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.138985] PM: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.138985] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.138986] [mem 0x90000000-0xdfffffff] available for PCI devices
[    0.138986] Booting paravirtualized kernel on bare hardware
[    0.138988] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.206944] random: get_random_bytes called from start_kernel+0x8f/0x512=
 with crng_init=3D0
[    0.206948] setup_percpu: NR_CPUS:1024 nr_cpumask_bits:8 nr_cpu_ids:8 nr=
_node_ids:1
[    0.207032] percpu: Embedded 45 pages/cpu s147456 r8192 d28672 u262144
[    0.207036] pcpu-alloc: s147456 r8192 d28672 u262144 alloc=3D1*2097152
[    0.207036] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.207051] Built 1 zonelists, mobility grouping on.  Total pages: 82405=
63
[    0.207051] Policy zone: Normal
[    0.207052] Kernel command line: BOOT_IMAGE=3D(hd1,gpt2)/vmlinuz-5.1.20-=
300.fc30.x86_64 root=3D/dev/mapper/fedora_localhost--live-root ro rd.driver=
.blacklist=3Dnouveau modprobe.blacklist=3Dnouveau nvidia-drm.modeset=3D1 re=
sume=3D/dev/mapper/fedora_localhost--live-swap rd.lvm.lv=3Dfedora_localhost=
-live/root rd.lvm.lv=3Dfedora_localhost-live/swap rhgb quiet
[    0.249623] Memory: 32689092K/33485556K available (12291K kernel code, 1=
537K rwdata, 4112K rodata, 2216K init, 4620K bss, 796464K reserved, 0K cma-=
reserved)
[    0.249689] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.249692] Kernel/User page tables isolation: enabled
[    0.249699] ftrace: allocating 39315 entries in 154 pages
[    0.258200] rcu: Hierarchical RCU implementation.
[    0.258201] rcu: 	RCU restricting CPUs from NR_CPUS=3D1024 to nr_cpu_ids=
=3D8.
[    0.258201] 	Tasks RCU enabled.
[    0.258201] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.258202] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    0.259540] NR_IRQS: 65792, nr_irqs: 2048, preallocated irqs: 16
[    0.259798] Console: colour dummy device 80x25
[    0.259801] printk: console [tty0] enabled
[    0.259809] ACPI: Core revision 20190215
[    0.260032] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 79635855245 ns
[    0.260061] hpet clockevent registered
[    0.260094] APIC: Switch to symmetric I/O mode setup
[    0.260095] DMAR: Host address width 39
[    0.260096] DMAR: DRHD base: 0x000000fed90000 flags: 0x1
[    0.260099] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap d2008c406604=
62 ecap f050da
[    0.260099] DMAR: RMRR base: 0x0000008d396000 end: 0x0000008d3b5fff
[    0.260100] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed90000 IOMMU 0
[    0.260101] DMAR-IR: HPET id 0 under DRHD base 0xfed90000
[    0.260101] DMAR-IR: Queued invalidation will be enabled to support x2ap=
ic and Intr-remapping.
[    0.261410] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.261410] x2apic enabled
[    0.261422] Switched APIC routing to cluster x2apic.
[    0.265575] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.270069] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x39c5e21a6f1, max_idle_ns: 440795312983 ns
[    0.270076] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 8016.00 BogoMIPS (lpj=3D4008000)
[    0.270077] pid_max: default: 32768 minimum: 301
[    0.273087] LSM: Security Framework initializing
[    0.273093] Yama: becoming mindful.
[    0.273097] SELinux:  Initializing.
[    0.273105] *** VALIDATE SELinux ***
[    0.275287] Dentry cache hash table entries: 4194304 (order: 13, 3355443=
2 bytes)
[    0.276383] Inode-cache hash table entries: 2097152 (order: 12, 16777216=
 bytes)
[    0.276421] Mount-cache hash table entries: 65536 (order: 7, 524288 byte=
s)
[    0.276456] Mountpoint-cache hash table entries: 65536 (order: 7, 524288=
 bytes)
[    0.276530] *** VALIDATE proc ***
[    0.276554] *** VALIDATE cgroup1 ***
[    0.276555] *** VALIDATE cgroup2 ***
[    0.276570] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.276571] ENERGY_PERF_BIAS: View and update with x86_energy_perf_polic=
y(8)
[    0.276579] mce: CPU0: Thermal monitoring enabled (TM1)
[    0.276590] process: using mwait in idle threads
[    0.276591] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.276591] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.276592] Spectre V2 : Mitigation: Full generic retpoline
[    0.276593] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.276593] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    0.276596] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.276596] Spectre V2 : User space: Mitigation: STIBP via seccomp and p=
rctl
[    0.276597] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl and seccomp
[    0.276610] MDS: Mitigation: Clear CPU buffers
[    0.276748] Freeing SMP alternatives memory: 36K
[    0.278108] TSC deadline timer enabled
[    0.278113] smpboot: CPU0: Intel(R) Core(TM) i7-6700K CPU @ 4.00GHz (fam=
ily: 0x6, model: 0x5e, stepping: 0x3)
[    0.278158] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR,=
 full-width counters, Intel PMU driver.
[    0.278162] ... version:                4
[    0.278162] ... bit width:              48
[    0.278163] ... generic registers:      4
[    0.278163] ... value mask:             0000ffffffffffff
[    0.278163] ... max period:             00007fffffffffff
[    0.278163] ... fixed-purpose events:   3
[    0.278164] ... event mask:             000000070000000f
[    0.278184] rcu: Hierarchical SRCU implementation.
[    0.278475] random: crng done (trusting CPU's manufacturer)
[    0.278744] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.278780] smp: Bringing up secondary CPUs ...
[    0.278813] x86: Booting SMP configuration:
[    0.278814] .... node  #0, CPUs:      #1 #2 #3 #4
[    0.282458] MDS CPU bug present and SMT on, data leak possible. See http=
s://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more de=
tails.
[    0.282458]  #5 #6 #7
[    0.283375] smp: Brought up 1 node, 8 CPUs
[    0.283375] smpboot: Max logical packages: 1
[    0.283375] smpboot: Total of 8 processors activated (64128.00 BogoMIPS)
[    0.284461] devtmpfs: initialized
[    0.284461] x86/mm: Memory block size: 128MB
[    0.285440] PM: Registering ACPI NVS region [mem 0x83ebc000-0x83ebcfff] =
(4096 bytes)
[    0.285440] PM: Registering ACPI NVS region [mem 0x8e471000-0x8ec22fff] =
(8069120 bytes)
[    0.285440] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    0.285440] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.285440] pinctrl core: initialized pinctrl subsystem
[    0.285440] PM: RTC time: 08:32:54, date: 2019-08-04
[    0.285440] NET: Registered protocol family 16
[    0.285440] audit: initializing netlink subsys (disabled)
[    0.285440] audit: type=3D2000 audit(1564907574.026:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.285440] cpuidle: using governor menu
[    0.285440] KVM setup pv remote TLB flush
[    0.285440] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it
[    0.285440] ACPI: bus type PCI registered
[    0.285440] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.285440] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000=
-0xefffffff] (base 0xe0000000)
[    0.285440] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E82=
0
[    0.285440] PCI: Using configuration type 1 for base access
[    0.286085] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.286085] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.286085] cryptd: max_cpu_qlen set to 1000
[    0.286097] ACPI: Added _OSI(Module Device)
[    0.286098] ACPI: Added _OSI(Processor Device)
[    0.286098] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.286098] ACPI: Added _OSI(Processor Aggregator Device)
[    0.286099] ACPI: Added _OSI(Linux-Dell-Video)
[    0.286099] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.286100] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.306610] ACPI: 8 ACPI AML tables successfully acquired and loaded
[    0.308517] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.310785] ACPI: Dynamic OEM Table Load:
[    0.310789] ACPI: SSDT 0xFFFF9FB18AE2A000 0007DD (v02 PmRef  Cpu0Ist  00=
003000 INTL 20160422)
[    0.311047] ACPI: \_PR_.CPU0: _OSC native thermal LVT Acked
[    0.311743] ACPI: Dynamic OEM Table Load:
[    0.311745] ACPI: SSDT 0xFFFF9FB18AB5B800 0003FF (v02 PmRef  Cpu0Cst  00=
003001 INTL 20160422)
[    0.311974] ACPI: Dynamic OEM Table Load:
[    0.311975] ACPI: SSDT 0xFFFF9FB18AB55C00 000130 (v02 PmRef  Cpu0Hwp  00=
003000 INTL 20160422)
[    0.312140] ACPI: Dynamic OEM Table Load:
[    0.312142] ACPI: SSDT 0xFFFF9FB18AB55800 0001A4 (v02 PmRef  HwpLvt   00=
003000 INTL 20160422)
[    0.312448] ACPI: Dynamic OEM Table Load:
[    0.312450] ACPI: SSDT 0xFFFF9FB18AE2A800 00065C (v02 PmRef  ApIst    00=
003000 INTL 20160422)
[    0.312779] ACPI: Dynamic OEM Table Load:
[    0.312781] ACPI: SSDT 0xFFFF9FB18AB54600 000197 (v02 PmRef  ApHwp    00=
003000 INTL 20160422)
[    0.312996] ACPI: Dynamic OEM Table Load:
[    0.312997] ACPI: SSDT 0xFFFF9FB18AB56C00 00018A (v02 PmRef  ApCst    00=
003000 INTL 20160422)
[    0.314553] ACPI: EC: EC started
[    0.314554] ACPI: EC: interrupt blocked
[    0.314561] ACPI: \_SB_.PCI0.LPCB.EC0_: Used as first EC
[    0.314562] ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=3D0x16, EC_CMD/EC_SC=3D0x66,=
 EC_DATA=3D0x62
[    0.314562] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle tran=
sactions
[    0.314563] ACPI: Interpreter enabled
[    0.314585] ACPI: (supports S0 S3 S4 S5)
[    0.314586] ACPI: Using IOAPIC for interrupt routing
[    0.314604] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.315147] ACPI: Enabled 9 GPEs in block 00 to 7F
[    0.317680] ACPI: Power Resource [PG00] (on)
[    0.317878] ACPI: Power Resource [PG01] (on)
[    0.318069] ACPI: Power Resource [PG02] (on)
[    0.319185] ACPI: Power Resource [WRST] (on)
[    0.319392] ACPI: Power Resource [WRST] (on)
[    0.319603] ACPI: Power Resource [WRST] (on)
[    0.319811] ACPI: Power Resource [WRST] (on)
[    0.320017] ACPI: Power Resource [WRST] (on)
[    0.320222] ACPI: Power Resource [WRST] (on)
[    0.320427] ACPI: Power Resource [WRST] (on)
[    0.320632] ACPI: Power Resource [WRST] (on)
[    0.320931] ACPI: Power Resource [WRST] (on)
[    0.321135] ACPI: Power Resource [WRST] (on)
[    0.321338] ACPI: Power Resource [WRST] (on)
[    0.321546] ACPI: Power Resource [WRST] (on)
[    0.321754] ACPI: Power Resource [WRST] (on)
[    0.321997] ACPI: Power Resource [WRST] (on)
[    0.322203] ACPI: Power Resource [WRST] (on)
[    0.322408] ACPI: Power Resource [WRST] (on)
[    0.322612] ACPI: Power Resource [WRST] (on)
[    0.323431] ACPI: Power Resource [WRST] (on)
[    0.323634] ACPI: Power Resource [WRST] (on)
[    0.323837] ACPI: Power Resource [WRST] (on)
[    0.331613] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.331616] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    0.331633] acpi PNP0A08:00: _OSC failed (AE_ERROR); disabling ASPM
[    0.332123] PCI host bridge to bus 0000:00
[    0.332124] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window=
]
[    0.332125] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window=
]
[    0.332125] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.332126] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3ff=
f window]
[    0.332126] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7ff=
f window]
[    0.332127] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbff=
f window]
[    0.332127] pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cfff=
f window]
[    0.332128] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3ff=
f window]
[    0.332128] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7ff=
f window]
[    0.332128] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbff=
f window]
[    0.332129] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dfff=
f window]
[    0.332129] pci_bus 0000:00: root bus resource [mem 0x90000000-0xdffffff=
f window]
[    0.332131] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7ffff=
f window]
[    0.332131] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.332135] pci 0000:00:00.0: [8086:191f] type 00 class 0x060000
[    0.332320] pci 0000:00:01.0: [8086:1901] type 01 class 0x060400
[    0.332349] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.332512] pci 0000:00:14.0: [8086:a12f] type 00 class 0x0c0330
[    0.332529] pci 0000:00:14.0: reg 0x10: [mem 0xdfd30000-0xdfd3ffff 64bit=
]
[    0.332579] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.332708] pci 0000:00:16.0: [8086:a13a] type 00 class 0x078000
[    0.332729] pci 0000:00:16.0: reg 0x10: [mem 0xdfd49000-0xdfd49fff 64bit=
]
[    0.332783] pci 0000:00:16.0: PME# supported from D3hot
[    0.332888] pci 0000:00:1b.0: [8086:a167] type 01 class 0x060400
[    0.332943] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.333056] pci 0000:00:1c.0: [8086:a110] type 01 class 0x060400
[    0.333111] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.333203] pci 0000:00:1c.2: [8086:a112] type 01 class 0x060400
[    0.333256] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.333347] pci 0000:00:1c.4: [8086:a114] type 01 class 0x060400
[    0.333400] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.333490] pci 0000:00:1c.6: [8086:a116] type 01 class 0x060400
[    0.333543] pci 0000:00:1c.6: PME# supported from D0 D3hot D3cold
[    0.333632] pci 0000:00:1d.0: [8086:a118] type 01 class 0x060400
[    0.333685] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.333798] pci 0000:00:1f.0: [8086:a145] type 00 class 0x060100
[    0.333959] pci 0000:00:1f.2: [8086:a121] type 00 class 0x058000
[    0.333970] pci 0000:00:1f.2: reg 0x10: [mem 0xdfd44000-0xdfd47fff]
[    0.334070] pci 0000:00:1f.3: [8086:a170] type 00 class 0x040300
[    0.334092] pci 0000:00:1f.3: reg 0x10: [mem 0xdfd40000-0xdfd43fff 64bit=
]
[    0.334112] pci 0000:00:1f.3: reg 0x20: [mem 0xdfd20000-0xdfd2ffff 64bit=
]
[    0.334150] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.334266] pci 0000:00:1f.4: [8086:a123] type 00 class 0x0c0500
[    0.334325] pci 0000:00:1f.4: reg 0x10: [mem 0xdfd48000-0xdfd480ff 64bit=
]
[    0.334394] pci 0000:00:1f.4: reg 0x20: [io  0xf000-0xf01f]
[    0.334545] pci 0000:00:1f.6: [8086:15b8] type 00 class 0x020000
[    0.334567] pci 0000:00:1f.6: reg 0x10: [mem 0xdfd00000-0xdfd1ffff]
[    0.334658] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
[    0.334757] pci 0000:01:00.0: [10de:1b06] type 00 class 0x030000
[    0.334772] pci 0000:01:00.0: reg 0x10: [mem 0xde000000-0xdeffffff]
[    0.334780] pci 0000:01:00.0: reg 0x14: [mem 0xc0000000-0xcfffffff 64bit=
 pref]
[    0.334788] pci 0000:01:00.0: reg 0x1c: [mem 0xd0000000-0xd1ffffff 64bit=
 pref]
[    0.334793] pci 0000:01:00.0: reg 0x24: [io  0xe000-0xe07f]
[    0.334798] pci 0000:01:00.0: reg 0x30: [mem 0xdf000000-0xdf07ffff pref]
[    0.334809] pci 0000:01:00.0: BAR 1: assigned to efifb
[    0.334860] pci 0000:01:00.0: 32.000 Gb/s available PCIe bandwidth, limi=
ted by 2.5 GT/s x16 link at 0000:00:01.0 (capable of 126.016 Gb/s with 8 GT=
/s x16 link)
[    0.334885] pci 0000:01:00.1: [10de:10ef] type 00 class 0x040300
[    0.334895] pci 0000:01:00.1: reg 0x10: [mem 0xdf080000-0xdf083fff]
[    0.334991] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.334992] pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
[    0.334993] pci 0000:00:01.0:   bridge window [mem 0xde000000-0xdf0fffff=
]
[    0.334995] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xd1ffffff=
 64bit pref]
[    0.335046] pci 0000:02:00.0: [144d:a808] type 00 class 0x010802
[    0.335070] pci 0000:02:00.0: reg 0x10: [mem 0xdfc00000-0xdfc03fff 64bit=
]
[    0.335245] pci 0000:00:1b.0: PCI bridge to [bus 02]
[    0.335247] pci 0000:00:1b.0:   bridge window [mem 0xdfc00000-0xdfcfffff=
]
[    0.335302] pci 0000:03:00.0: [1b21:1242] type 00 class 0x0c0330
[    0.335329] pci 0000:03:00.0: reg 0x10: [mem 0xdfb00000-0xdfb07fff 64bit=
]
[    0.335374] pci 0000:03:00.0: enabling Extended Tags
[    0.335439] pci 0000:03:00.0: PME# supported from D3hot D3cold
[    0.335530] pci 0000:00:1c.0: PCI bridge to [bus 03]
[    0.335533] pci 0000:00:1c.0:   bridge window [mem 0xdfb00000-0xdfbfffff=
]
[    0.335588] pci 0000:04:00.0: [1b21:1187] type 01 class 0x060400
[    0.335637] pci 0000:04:00.0: enabling Extended Tags
[    0.335690] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
[    0.335771] pci 0000:00:1c.2: PCI bridge to [bus 04-0c]
[    0.335773] pci 0000:00:1c.2:   bridge window [io  0xb000-0xcfff]
[    0.335774] pci 0000:00:1c.2:   bridge window [mem 0xdf200000-0xdf7fffff=
]
[    0.335816] pci 0000:05:01.0: [1b21:1187] type 01 class 0x060400
[    0.335865] pci 0000:05:01.0: enabling Extended Tags
[    0.335917] pci 0000:05:01.0: PME# supported from D0 D3hot D3cold
[    0.335966] pci 0000:05:02.0: [1b21:1187] type 01 class 0x060400
[    0.336015] pci 0000:05:02.0: enabling Extended Tags
[    0.336067] pci 0000:05:02.0: PME# supported from D0 D3hot D3cold
[    0.336116] pci 0000:05:03.0: [1b21:1187] type 01 class 0x060400
[    0.336165] pci 0000:05:03.0: enabling Extended Tags
[    0.336217] pci 0000:05:03.0: PME# supported from D0 D3hot D3cold
[    0.336264] pci 0000:05:04.0: [1b21:1187] type 01 class 0x060400
[    0.336314] pci 0000:05:04.0: enabling Extended Tags
[    0.336366] pci 0000:05:04.0: PME# supported from D0 D3hot D3cold
[    0.336413] pci 0000:05:05.0: [1b21:1187] type 01 class 0x060400
[    0.336463] pci 0000:05:05.0: enabling Extended Tags
[    0.336514] pci 0000:05:05.0: PME# supported from D0 D3hot D3cold
[    0.336562] pci 0000:05:06.0: [1b21:1187] type 01 class 0x060400
[    0.336612] pci 0000:05:06.0: enabling Extended Tags
[    0.336663] pci 0000:05:06.0: PME# supported from D0 D3hot D3cold
[    0.336711] pci 0000:05:07.0: [1b21:1187] type 01 class 0x060400
[    0.336760] pci 0000:05:07.0: enabling Extended Tags
[    0.336812] pci 0000:05:07.0: PME# supported from D0 D3hot D3cold
[    0.336871] pci 0000:04:00.0: PCI bridge to [bus 05-0c]
[    0.336876] pci 0000:04:00.0:   bridge window [io  0xb000-0xcfff]
[    0.336878] pci 0000:04:00.0:   bridge window [mem 0xdf200000-0xdf7fffff=
]
[    0.336910] pci 0000:05:01.0: PCI bridge to [bus 06]
[    0.336969] pci 0000:07:00.0: [14e4:43a0] type 00 class 0x028000
[    0.337011] pci 0000:07:00.0: reg 0x10: [mem 0xdf400000-0xdf407fff 64bit=
]
[    0.337027] pci 0000:07:00.0: reg 0x18: [mem 0xdf200000-0xdf3fffff 64bit=
]
[    0.337178] pci 0000:07:00.0: supports D1 D2
[    0.337178] pci 0000:07:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.337312] pci 0000:05:02.0: PCI bridge to [bus 07]
[    0.337318] pci 0000:05:02.0:   bridge window [mem 0xdf200000-0xdf4fffff=
]
[    0.337364] pci 0000:08:00.0: [1b21:0612] type 00 class 0x010601
[    0.337391] pci 0000:08:00.0: reg 0x10: [io  0xc050-0xc057]
[    0.337403] pci 0000:08:00.0: reg 0x14: [io  0xc040-0xc043]
[    0.337414] pci 0000:08:00.0: reg 0x18: [io  0xc030-0xc037]
[    0.337425] pci 0000:08:00.0: reg 0x1c: [io  0xc020-0xc023]
[    0.337437] pci 0000:08:00.0: reg 0x20: [io  0xc000-0xc01f]
[    0.337448] pci 0000:08:00.0: reg 0x24: [mem 0xdf700000-0xdf7001ff]
[    0.337589] pci 0000:05:03.0: PCI bridge to [bus 08]
[    0.337593] pci 0000:05:03.0:   bridge window [io  0xc000-0xcfff]
[    0.337596] pci 0000:05:03.0:   bridge window [mem 0xdf700000-0xdf7fffff=
]
[    0.337628] pci 0000:05:04.0: PCI bridge to [bus 09]
[    0.337666] pci 0000:05:05.0: PCI bridge to [bus 0a]
[    0.337728] pci 0000:0b:00.0: [8086:1539] type 00 class 0x020000
[    0.337769] pci 0000:0b:00.0: reg 0x10: [mem 0xdf600000-0xdf61ffff]
[    0.337799] pci 0000:0b:00.0: reg 0x18: [io  0xb000-0xb01f]
[    0.337815] pci 0000:0b:00.0: reg 0x1c: [mem 0xdf620000-0xdf623fff]
[    0.337981] pci 0000:0b:00.0: PME# supported from D0 D3hot D3cold
[    0.338093] pci 0000:05:06.0: PCI bridge to [bus 0b]
[    0.338097] pci 0000:05:06.0:   bridge window [io  0xb000-0xbfff]
[    0.338100] pci 0000:05:06.0:   bridge window [mem 0xdf600000-0xdf6fffff=
]
[    0.338134] pci 0000:05:07.0: PCI bridge to [bus 0c]
[    0.338232] pci 0000:0d:00.0: [1b21:1242] type 00 class 0x0c0330
[    0.338259] pci 0000:0d:00.0: reg 0x10: [mem 0xdfa00000-0xdfa07fff 64bit=
]
[    0.338304] pci 0000:0d:00.0: enabling Extended Tags
[    0.338369] pci 0000:0d:00.0: PME# supported from D3hot D3cold
[    0.338459] pci 0000:00:1c.4: PCI bridge to [bus 0d]
[    0.338462] pci 0000:00:1c.4:   bridge window [mem 0xdfa00000-0xdfafffff=
]
[    0.338517] pci 0000:0e:00.0: [1b21:1242] type 00 class 0x0c0330
[    0.338543] pci 0000:0e:00.0: reg 0x10: [mem 0xdf900000-0xdf907fff 64bit=
]
[    0.338588] pci 0000:0e:00.0: enabling Extended Tags
[    0.338652] pci 0000:0e:00.0: PME# supported from D3hot D3cold
[    0.338741] pci 0000:00:1c.6: PCI bridge to [bus 0e]
[    0.338743] pci 0000:00:1c.6:   bridge window [mem 0xdf900000-0xdf9fffff=
]
[    0.338794] pci 0000:0f:00.0: [144d:a802] type 00 class 0x010802
[    0.338815] pci 0000:0f:00.0: reg 0x10: [mem 0xdf810000-0xdf813fff 64bit=
]
[    0.338821] pci 0000:0f:00.0: reg 0x18: [io  0xd000-0xd0ff]
[    0.338845] pci 0000:0f:00.0: reg 0x30: [mem 0xdf800000-0xdf80ffff pref]
[    0.338977] pci 0000:00:1d.0: PCI bridge to [bus 0f]
[    0.338978] pci 0000:00:1d.0:   bridge window [io  0xd000-0xdfff]
[    0.338980] pci 0000:00:1d.0:   bridge window [mem 0xdf800000-0xdf8fffff=
]
[    0.340107] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.340138] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.340166] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.340194] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.340221] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.340249] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.340277] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.340304] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.340489] ACPI: EC: interrupt unblocked
[    0.340505] ACPI: EC: event unblocked
[    0.340514] ACPI: \_SB_.PCI0.LPCB.EC0_: GPE=3D0x16, EC_CMD/EC_SC=3D0x66,=
 EC_DATA=3D0x62
[    0.340515] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle tran=
sactions and events
[    0.340552] pci 0000:01:00.0: vgaarb: setting as boot VGA device
[    0.340552] pci 0000:01:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.340552] pci 0000:01:00.0: vgaarb: bridge control possible
[    0.340552] vgaarb: loaded
[    0.340552] SCSI subsystem initialized
[    0.340552] libata version 3.00 loaded.
[    0.340552] ACPI: bus type USB registered
[    0.340552] usbcore: registered new interface driver usbfs
[    0.340552] usbcore: registered new interface driver hub
[    0.340552] usbcore: registered new device driver usb
[    0.340552] pps_core: LinuxPPS API ver. 1 registered
[    0.340552] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.340552] PTP clock support registered
[    0.340552] EDAC MC: Ver: 3.0.0
[    0.340552] Registered efivars operations
[    0.361367] PCI: Using ACPI for IRQ routing
[    0.388362] PCI: pci_cache_line_size set to 64 bytes
[    0.388435] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[    0.388436] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.388436] e820: reserve RAM buffer [mem 0x83654018-0x83ffffff]
[    0.388437] e820: reserve RAM buffer [mem 0x83665018-0x83ffffff]
[    0.388437] e820: reserve RAM buffer [mem 0x83677018-0x83ffffff]
[    0.388438] e820: reserve RAM buffer [mem 0x83ebc000-0x83ffffff]
[    0.388438] e820: reserve RAM buffer [mem 0x83f76018-0x83ffffff]
[    0.388438] e820: reserve RAM buffer [mem 0x8ccc6000-0x8fffffff]
[    0.388439] e820: reserve RAM buffer [mem 0x8fb00000-0x8fffffff]
[    0.388439] e820: reserve RAM buffer [mem 0x86f000000-0x86fffffff]
[    0.388480] NetLabel: Initializing
[    0.388480] NetLabel:  domain hash size =3D 128
[    0.388481] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.388488] NetLabel:  unlabeled traffic allowed by default
[    0.388489] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.388489] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.390083] clocksource: Switched to clocksource tsc-early
[    0.396579] VFS: Disk quotas dquot_6.6.0
[    0.396586] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.396599] *** VALIDATE hugetlbfs ***
[    0.396613] pnp: PnP ACPI init
[    0.396750] system 00:00: [io  0x0290-0x029f] has been reserved
[    0.396752] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.396879] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.396879] system 00:01: [io  0xffff] has been reserved
[    0.396880] system 00:01: [io  0xffff] has been reserved
[    0.396880] system 00:01: [io  0xffff] has been reserved
[    0.396881] system 00:01: [io  0x1800-0x18fe] has been reserved
[    0.396882] system 00:01: [io  0x164e-0x164f] has been reserved
[    0.396883] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.396936] system 00:02: [io  0x0800-0x087f] has been reserved
[    0.396937] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.396945] pnp 00:03: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.396967] system 00:04: [io  0x1854-0x1857] has been reserved
[    0.396968] system 00:04: Plug and Play ACPI device, IDs INT3f0d PNP0c02=
 (active)
[    0.397097] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.397097] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.397098] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.397098] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.397099] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.397099] system 00:05: [mem 0xfed90000-0xfed93fff] could not be reser=
ved
[    0.397100] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.397101] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.397101] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reser=
ved
[    0.397102] system 00:05: [mem 0xdffc0000-0xdffdffff] has been reserved
[    0.397103] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.397127] system 00:06: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.397128] system 00:06: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.397128] system 00:06: [mem 0xfdac0000-0xfdacffff] has been reserved
[    0.397129] system 00:06: [mem 0xfdae0000-0xfdaeffff] has been reserved
[    0.397129] system 00:06: [mem 0xfdaf0000-0xfdafffff] has been reserved
[    0.397130] system 00:06: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.397131] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be reser=
ved
[    0.397131] system 00:06: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.397132] system 00:06: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.397132] system 00:06: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.397134] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.397300] system 00:07: [io  0xfe00-0xfefe] has been reserved
[    0.397302] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.397908] system 00:08: [mem 0xfdaf0000-0xfdafffff] has been reserved
[    0.397909] system 00:08: [mem 0xfdae0000-0xfdaeffff] has been reserved
[    0.397909] system 00:08: [mem 0xfdac0000-0xfdacffff] has been reserved
[    0.397910] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    0.398379] pnp: PnP ACPI: found 9 devices
[    0.403430] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.403447] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.403448] pci 0000:00:01.0:   bridge window [io  0xe000-0xefff]
[    0.403449] pci 0000:00:01.0:   bridge window [mem 0xde000000-0xdf0fffff=
]
[    0.403451] pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xd1ffffff=
 64bit pref]
[    0.403452] pci 0000:00:1b.0: PCI bridge to [bus 02]
[    0.403455] pci 0000:00:1b.0:   bridge window [mem 0xdfc00000-0xdfcfffff=
]
[    0.403458] pci 0000:00:1c.0: PCI bridge to [bus 03]
[    0.403460] pci 0000:00:1c.0:   bridge window [mem 0xdfb00000-0xdfbfffff=
]
[    0.403464] pci 0000:05:01.0: PCI bridge to [bus 06]
[    0.403474] pci 0000:05:02.0: PCI bridge to [bus 07]
[    0.403477] pci 0000:05:02.0:   bridge window [mem 0xdf200000-0xdf4fffff=
]
[    0.403484] pci 0000:05:03.0: PCI bridge to [bus 08]
[    0.403485] pci 0000:05:03.0:   bridge window [io  0xc000-0xcfff]
[    0.403489] pci 0000:05:03.0:   bridge window [mem 0xdf700000-0xdf7fffff=
]
[    0.403495] pci 0000:05:04.0: PCI bridge to [bus 09]
[    0.403504] pci 0000:05:05.0: PCI bridge to [bus 0a]
[    0.403514] pci 0000:05:06.0: PCI bridge to [bus 0b]
[    0.403515] pci 0000:05:06.0:   bridge window [io  0xb000-0xbfff]
[    0.403519] pci 0000:05:06.0:   bridge window [mem 0xdf600000-0xdf6fffff=
]
[    0.403525] pci 0000:05:07.0: PCI bridge to [bus 0c]
[    0.403534] pci 0000:04:00.0: PCI bridge to [bus 05-0c]
[    0.403536] pci 0000:04:00.0:   bridge window [io  0xb000-0xcfff]
[    0.403539] pci 0000:04:00.0:   bridge window [mem 0xdf200000-0xdf7fffff=
]
[    0.403545] pci 0000:00:1c.2: PCI bridge to [bus 04-0c]
[    0.403546] pci 0000:00:1c.2:   bridge window [io  0xb000-0xcfff]
[    0.403548] pci 0000:00:1c.2:   bridge window [mem 0xdf200000-0xdf7fffff=
]
[    0.403552] pci 0000:00:1c.4: PCI bridge to [bus 0d]
[    0.403554] pci 0000:00:1c.4:   bridge window [mem 0xdfa00000-0xdfafffff=
]
[    0.403557] pci 0000:00:1c.6: PCI bridge to [bus 0e]
[    0.403559] pci 0000:00:1c.6:   bridge window [mem 0xdf900000-0xdf9fffff=
]
[    0.403563] pci 0000:00:1d.0: PCI bridge to [bus 0f]
[    0.403564] pci 0000:00:1d.0:   bridge window [io  0xd000-0xdfff]
[    0.403566] pci 0000:00:1d.0:   bridge window [mem 0xdf800000-0xdf8fffff=
]
[    0.403570] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.403570] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.403571] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.403571] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff windo=
w]
[    0.403572] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff windo=
w]
[    0.403572] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff windo=
w]
[    0.403573] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff wind=
ow]
[    0.403573] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff wind=
ow]
[    0.403574] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff wind=
ow]
[    0.403574] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff wind=
ow]
[    0.403575] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff wind=
ow]
[    0.403575] pci_bus 0000:00: resource 15 [mem 0x90000000-0xdfffffff wind=
ow]
[    0.403575] pci_bus 0000:00: resource 16 [mem 0xfd000000-0xfe7fffff wind=
ow]
[    0.403576] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
[    0.403576] pci_bus 0000:01: resource 1 [mem 0xde000000-0xdf0fffff]
[    0.403577] pci_bus 0000:01: resource 2 [mem 0xc0000000-0xd1ffffff 64bit=
 pref]
[    0.403577] pci_bus 0000:02: resource 1 [mem 0xdfc00000-0xdfcfffff]
[    0.403578] pci_bus 0000:03: resource 1 [mem 0xdfb00000-0xdfbfffff]
[    0.403578] pci_bus 0000:04: resource 0 [io  0xb000-0xcfff]
[    0.403579] pci_bus 0000:04: resource 1 [mem 0xdf200000-0xdf7fffff]
[    0.403579] pci_bus 0000:05: resource 0 [io  0xb000-0xcfff]
[    0.403580] pci_bus 0000:05: resource 1 [mem 0xdf200000-0xdf7fffff]
[    0.403580] pci_bus 0000:07: resource 1 [mem 0xdf200000-0xdf4fffff]
[    0.403581] pci_bus 0000:08: resource 0 [io  0xc000-0xcfff]
[    0.403581] pci_bus 0000:08: resource 1 [mem 0xdf700000-0xdf7fffff]
[    0.403582] pci_bus 0000:0b: resource 0 [io  0xb000-0xbfff]
[    0.403582] pci_bus 0000:0b: resource 1 [mem 0xdf600000-0xdf6fffff]
[    0.403583] pci_bus 0000:0d: resource 1 [mem 0xdfa00000-0xdfafffff]
[    0.403583] pci_bus 0000:0e: resource 1 [mem 0xdf900000-0xdf9fffff]
[    0.403583] pci_bus 0000:0f: resource 0 [io  0xd000-0xdfff]
[    0.403584] pci_bus 0000:0f: resource 1 [mem 0xdf800000-0xdf8fffff]
[    0.403659] NET: Registered protocol family 2
[    0.403738] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6=
, 262144 bytes)
[    0.403792] TCP established hash table entries: 262144 (order: 9, 209715=
2 bytes)
[    0.403937] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.403992] TCP: Hash tables configured (established 262144 bind 65536)
[    0.404016] UDP hash table entries: 16384 (order: 7, 524288 bytes)
[    0.404056] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes)
[    0.404109] NET: Registered protocol family 1
[    0.404111] NET: Registered protocol family 44
[    0.404247] pci 0000:01:00.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.404558] PCI: CLS 0 bytes, default 64
[    0.404575] Unpacking initramfs...
[    0.601517] Freeing initrd memory: 24100K
[    0.601556] DMAR: [Firmware Bug]: RMRR entry for device 03:00.0 is broke=
n - applying workaround
[    0.601558] DMAR: [Firmware Bug]: RMRR entry for device 0d:00.0 is broke=
n - applying workaround
[    0.601559] DMAR: [Firmware Bug]: RMRR entry for device 0e:00.0 is broke=
n - applying workaround
[    0.609141] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.609145] software IO TLB: mapped [mem 0x7a875000-0x7e875000] (64MB)
[    0.609222] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x39c=
5e21a6f1, max_idle_ns: 440795312983 ns
[    0.609232] clocksource: Switched to clocksource tsc
[    0.610419] Initialise system trusted keyrings
[    0.610424] Key type blacklist registered
[    0.610439] workingset: timestamp_bits=3D36 max_order=3D23 bucket_order=
=3D0
[    0.611035] zbud: loaded
[    0.611411] Platform Keyring initialized
[    0.692402] alg: No test for lzo-rle (lzo-rle-generic)
[    0.692854] alg: No test for lzo-rle (lzo-rle-scomp)
[    0.693317] alg: No test for 842 (842-generic)
[    0.693773] alg: No test for 842 (842-scomp)
[    0.708529] NET: Registered protocol family 38
[    0.708530] Key type asymmetric registered
[    0.708531] Asymmetric key parser 'x509' registered
[    0.708536] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 244)
[    0.708553] io scheduler mq-deadline registered
[    0.708553] io scheduler kyber registered
[    0.708577] io scheduler bfq registered
[    0.708616] atomic64_test: passed for x86-64 platform with CX8 and with =
SSE
[    0.709867] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.709877] efifb: probing for efifb
[    0.709885] efifb: No BGRT, not showing boot graphics
[    0.709886] efifb: framebuffer at 0xc0000000, using 23040k, total 23040k
[    0.709886] efifb: mode is 2560x1440x32, linelength=3D16384, pages=3D1
[    0.709886] efifb: scrolling: redraw
[    0.709887] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.709905] fbcon: Deferring console take-over
[    0.709905] fb0: EFI VGA frame buffer device
[    0.709910] intel_idle: MWAIT substates: 0x142120
[    0.709910] intel_idle: v0.4.1 model 0x5E
[    0.710075] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.710165] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input0
[    0.710168] ACPI: Sleep Button [SLPB]
[    0.710181] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input1
[    0.710184] ACPI: Power Button [PWRB]
[    0.710196] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input2
[    0.710203] ACPI: Power Button [PWRF]
[    0.710782] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.731466] serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115=
200) is a 16550A
[    0.732135] Non-volatile memory driver v1.3
[    0.732145] Linux agpgart interface v0.103
[    0.732552] ahci 0000:08:00.0: version 3.0
[    0.732607] ahci 0000:08:00.0: SSS flag set, parallel bus scan disabled
[    0.732643] ahci 0000:08:00.0: AHCI 0001.0200 32 slots 2 ports 6 Gbps 0x=
3 impl SATA mode
[    0.732644] ahci 0000:08:00.0: flags: 64bit ncq sntf stag led clo pmp pi=
o slum part ccc=20
[    0.732853] scsi host0: ahci
[    0.732952] scsi host1: ahci
[    0.732976] ata1: SATA max UDMA/133 abar m512@0xdf700000 port 0xdf700100=
 irq 17
[    0.732978] ata2: SATA max UDMA/133 abar m512@0xdf700000 port 0xdf700180=
 irq 17
[    0.733010] libphy: Fixed MDIO Bus: probed
[    0.733040] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.733041] ehci-pci: EHCI PCI platform driver
[    0.733046] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.733047] ohci-pci: OHCI PCI platform driver
[    0.733051] uhci_hcd: USB Universal Host Controller Interface driver
[    0.733118] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.733136] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 1
[    0.734187] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x1=
00 quirks 0x0000000001109810
[    0.734190] xhci_hcd 0000:00:14.0: cache line size of 64 is not supporte=
d
[    0.734304] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.01
[    0.734304] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.734305] usb usb1: Product: xHCI Host Controller
[    0.734305] usb usb1: Manufacturer: Linux 5.1.20-300.fc30.x86_64 xhci-hc=
d
[    0.734306] usb usb1: SerialNumber: 0000:00:14.0
[    0.734345] hub 1-0:1.0: USB hub found
[    0.734358] hub 1-0:1.0: 16 ports detected
[    0.735156] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.735171] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 2
[    0.735172] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    0.735189] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.01
[    0.735189] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.735190] usb usb2: Product: xHCI Host Controller
[    0.735190] usb usb2: Manufacturer: Linux 5.1.20-300.fc30.x86_64 xhci-hc=
d
[    0.735190] usb usb2: SerialNumber: 0000:00:14.0
[    0.735226] hub 2-0:1.0: USB hub found
[    0.735235] hub 2-0:1.0: 10 ports detected
[    0.735863] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    0.735882] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus =
number 3
[    0.794609] xhci_hcd 0000:03:00.0: hcc params 0x0200eec1 hci version 0x1=
10 quirks 0x0000000000000010
[    0.794768] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.01
[    0.794768] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.794769] usb usb3: Product: xHCI Host Controller
[    0.794769] usb usb3: Manufacturer: Linux 5.1.20-300.fc30.x86_64 xhci-hc=
d
[    0.794770] usb usb3: SerialNumber: 0000:03:00.0
[    0.794806] hub 3-0:1.0: USB hub found
[    0.794810] hub 3-0:1.0: 2 ports detected
[    0.794860] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    0.794873] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus =
number 4
[    0.794874] xhci_hcd 0000:03:00.0: Host supports USB 3.0 SuperSpeed
[    0.794891] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    0.794899] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.01
[    0.794900] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.794900] usb usb4: Product: xHCI Host Controller
[    0.794901] usb usb4: Manufacturer: Linux 5.1.20-300.fc30.x86_64 xhci-hc=
d
[    0.794901] usb usb4: SerialNumber: 0000:03:00.0
[    0.794933] hub 4-0:1.0: USB hub found
[    0.794936] hub 4-0:1.0: 2 ports detected
[    0.795010] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[    0.795030] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus =
number 5
[    0.853763] xhci_hcd 0000:0d:00.0: hcc params 0x0200eec1 hci version 0x1=
10 quirks 0x0000000000000010
[    0.853949] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.01
[    0.853950] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.853950] usb usb5: Product: xHCI Host Controller
[    0.853950] usb usb5: Manufacturer: Linux 5.1.20-300.fc30.x86_64 xhci-hc=
d
[    0.853951] usb usb5: SerialNumber: 0000:0d:00.0
[    0.854013] hub 5-0:1.0: USB hub found
[    0.854017] hub 5-0:1.0: 2 ports detected
[    0.854065] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[    0.854084] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus =
number 6
[    0.854085] xhci_hcd 0000:0d:00.0: Host supports USB 3.0 SuperSpeed
[    0.854102] usb usb6: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    0.854110] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.01
[    0.854111] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.854111] usb usb6: Product: xHCI Host Controller
[    0.854112] usb usb6: Manufacturer: Linux 5.1.20-300.fc30.x86_64 xhci-hc=
d
[    0.854112] usb usb6: SerialNumber: 0000:0d:00.0
[    0.854176] hub 6-0:1.0: USB hub found
[    0.854180] hub 6-0:1.0: 2 ports detected
[    0.854256] xhci_hcd 0000:0e:00.0: xHCI Host Controller
[    0.854298] xhci_hcd 0000:0e:00.0: new USB bus registered, assigned bus =
number 7
[    0.913024] xhci_hcd 0000:0e:00.0: hcc params 0x0200eec1 hci version 0x1=
10 quirks 0x0000000000000010
[    0.913177] usb usb7: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.01
[    0.913178] usb usb7: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.913178] usb usb7: Product: xHCI Host Controller
[    0.913179] usb usb7: Manufacturer: Linux 5.1.20-300.fc30.x86_64 xhci-hc=
d
[    0.913179] usb usb7: SerialNumber: 0000:0e:00.0
[    0.913323] hub 7-0:1.0: USB hub found
[    0.913327] hub 7-0:1.0: 2 ports detected
[    0.913378] xhci_hcd 0000:0e:00.0: xHCI Host Controller
[    0.913456] xhci_hcd 0000:0e:00.0: new USB bus registered, assigned bus =
number 8
[    0.913458] xhci_hcd 0000:0e:00.0: Host supports USB 3.0 SuperSpeed
[    0.913501] usb usb8: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    0.913509] usb usb8: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.01
[    0.913510] usb usb8: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.913510] usb usb8: Product: xHCI Host Controller
[    0.913511] usb usb8: Manufacturer: Linux 5.1.20-300.fc30.x86_64 xhci-hc=
d
[    0.913511] usb usb8: SerialNumber: 0000:0e:00.0
[    0.913564] hub 8-0:1.0: USB hub found
[    0.913568] hub 8-0:1.0: 2 ports detected
[    0.913616] usbcore: registered new interface driver usbserial_generic
[    0.913617] usbserial: USB Serial support registered for generic
[    0.913628] i8042: PNP: No PS/2 controller found.
[    0.913628] i8042: Probing ports directly.
[    0.916960] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.916962] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.917020] mousedev: PS/2 mouse device common for all mice
[    0.917085] rtc_cmos 00:03: RTC can wake from S4
[    0.917536] rtc_cmos 00:03: registered as rtc0
[    0.917536] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram=
, hpet irqs
[    0.917557] device-mapper: uevent: version 1.0.3
[    0.917609] device-mapper: ioctl: 4.40.0-ioctl (2019-01-18) initialised:=
 dm-devel@redhat.com
[    0.917648] intel_pstate: Intel P-state driver initializing
[    0.918007] intel_pstate: HWP enabled
[    0.918140] hidraw: raw HID events driver (C) Jiri Kosina
[    0.918154] usbcore: registered new interface driver usbhid
[    0.918154] usbhid: USB HID core driver
[    0.918180] resource sanity check: requesting [mem 0xfdffe800-0xfe0007ff=
], which spans more than pnp 00:06 [mem 0xfdb00000-0xfdffffff]
[    0.918182] caller pmc_core_probe+0x94/0x2be mapping multiple BARs
[    0.918191] intel_pmc_core:  initialized
[    0.918216] drop_monitor: Initializing network drop monitor service
[    0.918249] Initializing XFRM netlink socket
[    0.918296] NET: Registered protocol family 10
[    0.920526] Segment Routing with IPv6
[    0.920549] mip6: Mobile IPv6
[    0.920550] NET: Registered protocol family 17
[    0.921008] mce: Using 10 MCE banks
[    0.921014] RAS: Correctable Errors collector initialized.
[    0.921047] microcode: sig=3D0x506e3, pf=3D0x2, revision=3D0xcc
[    0.921075] microcode: Microcode Update Driver: v2.2.
[    0.921080] AVX2 version of gcm_enc/dec engaged.
[    0.921080] AES CTR mode by8 optimization enabled
[    0.942886] sched_clock: Marking stable (943599318, -716237)->(982305269=
, -39422188)
[    0.943012] registered taskstats version 1
[    0.943016] Loading compiled-in X.509 certificates
[    0.960879] Loaded X.509 cert 'Fedora kernel signing key: 7cb6e09318d928=
d9e8100545d815f54e810dd4f0'
[    0.960889] zswap: loaded using pool lzo/zbud
[    0.965376] Key type big_key registered
[    0.967479] Key type encrypted registered
[    0.968723] integrity: Loading X.509 certificate: UEFI:db
[    0.968859] integrity: Loaded X.509 cert 'ASUSTeK MotherBoard SW Key Cer=
tificate: da83b990422ebc8c441f8d8b039a65a2'
[    0.968859] integrity: Loading X.509 certificate: UEFI:db
[    0.968960] integrity: Loaded X.509 cert 'ASUSTeK Notebook SW Key Certif=
icate: b8e581e4df77a5bb4282d5ccfc00c071'
[    0.968961] integrity: Loading X.509 certificate: UEFI:db
[    0.968971] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA =
2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.968971] integrity: Loading X.509 certificate: UEFI:db
[    0.968980] integrity: Loaded X.509 cert 'Microsoft Windows Production P=
CA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.968980] integrity: Loading X.509 certificate: UEFI:db
[    0.969090] integrity: Loaded X.509 cert 'Canonical Ltd. Master Certific=
ate Authority: ad91990bc22ab1f517048c23b6655a268e345a63'
[    0.970445] ima: No TPM chip found, activating TPM-bypass!
[    0.970447] ima: Allocated hash algorithm: sha256
[    0.970450] No architecture policies found
[    0.971181] PM:   Magic number: 15:635:522
[    0.971201] pci 0000:07:00.0: hash matches
[    0.971213] acpi LNXPOWER:06: hash matches
[    0.971369] rtc_cmos 00:03: setting system clock to 2019-08-04T08:32:55 =
UTC (1564907575)
[    1.041385] ata1: SATA link down (SStatus 0 SControl 300)
[    1.069310] usb 2-6: new SuperSpeed Gen 1 USB device number 2 using xhci=
_hcd
[    1.084189] usb 2-6: New USB device found, idVendor=3D05e3, idProduct=3D=
0617, bcdDevice=3D41.43
[    1.084194] usb 2-6: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    1.084197] usb 2-6: Product: USB3.0 Hub
[    1.084199] usb 2-6: Manufacturer: GenesysLogic
[    1.086258] hub 2-6:1.0: USB hub found
[    1.086571] hub 2-6:1.0: 4 ports detected
[    1.196099] usb 1-4: new full-speed USB device number 2 using xhci_hcd
[    1.235148] usb 5-1: new high-speed USB device number 2 using xhci_hcd
[    1.299147] usb 7-2: new full-speed USB device number 2 using xhci_hcd
[    1.325662] usb 1-4: New USB device found, idVendor=3D046d, idProduct=3D=
c52b, bcdDevice=3D24.06
[    1.325669] usb 1-4: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    1.325673] usb 1-4: Product: USB Receiver
[    1.325676] usb 1-4: Manufacturer: Logitech
[    1.353461] ata2: SATA link down (SStatus 0 SControl 300)
[    1.356334] Freeing unused decrypted memory: 2040K
[    1.357284] Freeing unused kernel image memory: 2216K
[    1.363162] Write protecting the kernel read-only data: 20480k
[    1.364551] Freeing unused kernel image memory: 2016K
[    1.365549] Freeing unused kernel image memory: 2032K
[    1.372714] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.372716] rodata_test: all tests were successful
[    1.372717] x86/mm: Checking user space page tables
[    1.377452] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.377453] Run /init as init process
[    1.387507] usb 2-6.1: new SuperSpeed Gen 1 USB device number 3 using xh=
ci_hcd
[    1.405670] usb 2-6.1: New USB device found, idVendor=3D05e3, idProduct=
=3D0617, bcdDevice=3D41.43
[    1.405671] usb 2-6.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    1.405671] usb 2-6.1: Product: USB3.0 Hub
[    1.405672] usb 2-6.1: Manufacturer: GenesysLogic
[    1.409619] hub 2-6.1:1.0: USB hub found
[    1.409944] hub 2-6.1:1.0: 4 ports detected
[    1.426866] usb 5-1: New USB device found, idVendor=3D2109, idProduct=3D=
2811, bcdDevice=3D91.00
[    1.426867] usb 5-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    1.426868] usb 5-1: Product: USB2.0 Hub
[    1.426868] usb 5-1: Manufacturer: VIA Labs, Inc.
[    1.429482] hub 5-1:1.0: USB hub found
[    1.429796] hub 5-1:1.0: 4 ports detected
[    1.439223] systemd[1]: systemd v241-9.gitb67ecf2.fc30 running in system=
 mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYP=
TSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 =
-IDN +PCRE2 default-hierarchy=3Dhybrid)
[    1.451248] systemd[1]: Detected architecture x86-64.
[    1.451250] systemd[1]: Running in initial RAM disk.
[    1.453453] systemd[1]: Set hostname to <attic>.
[    1.479685] systemd[1]: Listening on udev Kernel Socket.
[    1.479747] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.479753] systemd[1]: Reached target Timers.
[    1.479795] systemd[1]: Listening on Journal Socket.
[    1.479844] systemd[1]: Condition check resulted in Load Kernel Modules =
being skipped.
[    1.480984] systemd[1]: Starting Apply Kernel Variables...
[    1.514111] usb 1-6: new high-speed USB device number 3 using xhci_hcd
[    1.540476] usb 6-1: new SuperSpeed Gen 1 USB device number 2 using xhci=
_hcd
[    1.559798] usb 6-1: New USB device found, idVendor=3D2109, idProduct=3D=
8110, bcdDevice=3D91.05
[    1.559798] usb 6-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    1.559799] usb 6-1: Product: USB3.0 Hub
[    1.559800] usb 6-1: Manufacturer: VIA Labs, Inc.
[    1.561263] hub 6-1:1.0: USB hub found
[    1.562038] hub 6-1:1.0: 4 ports detected
[    1.621070] usb 7-2: New USB device found, idVendor=3D08bb, idProduct=3D=
2704, bcdDevice=3D 1.00
[    1.621074] usb 7-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    1.621074] usb 7-2: Product: USB Audio DAC  =20
[    1.621075] usb 7-2: Manufacturer: Burr-Brown from TI             =20
[    1.631862] input: Burr-Brown from TI               USB Audio DAC    as =
/devices/pci0000:00/0000:00:1c.6/0000:0e:00.0/usb7/7-2/7-2:1.2/0003:08BB:27=
04.0004/input/input6
[    1.642279] audit: type=3D1130 audit(1564907576.169:2): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-jour=
nald comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
[    1.645558] usb 1-6: New USB device found, idVendor=3D05e3, idProduct=3D=
0610, bcdDevice=3D41.43
[    1.645559] usb 1-6: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    1.645559] usb 1-6: Product: USB2.0 Hub
[    1.645560] usb 1-6: Manufacturer: GenesysLogic
[    1.646424] hub 1-6:1.0: USB hub found
[    1.646975] hub 1-6:1.0: 4 ports detected
[    1.679329] usb 6-2: new SuperSpeed Gen 1 USB device number 3 using xhci=
_hcd
[    1.683179] hid-generic 0003:08BB:2704.0004: input,hidraw0: USB HID v1.0=
0 Device [Burr-Brown from TI               USB Audio DAC   ] on usb-0000:0e=
:00.0-2/input2
[    1.697570] usb 6-2: New USB device found, idVendor=3D067b, idProduct=3D=
2771, bcdDevice=3D 1.00
[    1.697571] usb 6-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[    1.697571] usb 6-2: Product: USB-SATA Bridge
[    1.697572] usb 6-2: Manufacturer: Prolific Technology Inc.
[    1.697572] usb 6-2: SerialNumber: PROLIFICMP000000059
[    1.718508] audit: type=3D1130 audit(1564907576.245:3): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-udev=
d comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? t=
erminal=3D? res=3Dsuccess'
[    1.723949] usb-storage 6-2:1.0: USB Mass Storage device detected
[    1.723997] scsi host2: usb-storage 6-2:1.0
[    1.724033] usbcore: registered new interface driver usb-storage
[    1.725418] usbcore: registered new interface driver uas
[    1.764080] usb 1-7: new full-speed USB device number 4 using xhci_hcd
[    1.770078] usb 5-1.3: new full-speed USB device number 3 using xhci_hcd
[    1.776196] audit: type=3D1130 audit(1564907576.301:4): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-udev=
-trigger comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? add=
r=3D? terminal=3D? res=3Dsuccess'
[    1.788970] audit: type=3D1130 audit(1564907576.315:5): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dplymouth-sta=
rt comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? =
terminal=3D? res=3Dsuccess'
[    1.794581] dca service started, version 1.12.1
[    1.814677] nvme nvme0: pci function 0000:02:00.0
[    1.814720] nvme nvme1: pci function 0000:0f:00.0
[    1.816575] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.6.=
0-k
[    1.816575] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.818221] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    1.818221] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.818345] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) se=
t to dynamic conservative mode
[    1.844538] pps pps0: new PPS source ptp0
[    1.844539] igb 0000:0b:00.0: added PHC on eth0
[    1.844539] igb 0000:0b:00.0: Intel(R) Gigabit Ethernet Network Connecti=
on
[    1.844540] igb 0000:0b:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 9c:5c:8e:d2:=
b1:6b
[    1.844541] igb 0000:0b:00.0: eth0: PBA No: FFFFFF-0FF
[    1.844541] igb 0000:0b:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 t=
x queue(s)
[    1.845408] igb 0000:0b:00.0 enp11s0: renamed from eth0
[    1.892437] usb 1-7: New USB device found, idVendor=3D0b05, idProduct=3D=
180a, bcdDevice=3D 1.12
[    1.892438] usb 1-7: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[    1.892438] usb 1-7: Product: BCM20702A0
[    1.892439] usb 1-7: Manufacturer: Broadcom Corp
[    1.892439] usb 1-7: SerialNumber: 80A5899E9290
[    1.896919] logitech-djreceiver 0003:046D:C52B.0003: hiddev96,hidraw1: U=
SB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-4/input2
[    1.932816] nvme nvme1: 8/0/0 default/read/poll queues
[    1.935173]  nvme0n1: p1 p2 p3
[    1.939879] usb 5-1.3: New USB device found, idVendor=3D5241, idProduct=
=3D4b59, bcdDevice=3D 0.01
[    1.939879] usb 5-1.3: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[    1.939880] usb 5-1.3: Product: RAMA KOYU
[    1.939881] usb 5-1.3: Manufacturer: RAMA.WORKS
[    1.939881] usb 5-1.3: SerialNumber: 0
[    1.945984] input: RAMA.WORKS RAMA KOYU as /devices/pci0000:00/0000:00:1=
c.4/0000:0d:00.0/usb5/5-1/5-1.3/5-1.3:1.0/0003:5241:4B59.0005/input/input7
[    1.954106] usb 1-6.1: new high-speed USB device number 5 using xhci_hcd
[    1.997403] hid-generic 0003:5241:4B59.0005: input,hidraw2: USB HID v1.1=
1 Keyboard [RAMA.WORKS RAMA KOYU] on usb-0000:0d:00.0-1.3/input0
[    1.998500] input: RAMA.WORKS RAMA KOYU System Control as /devices/pci00=
00:00/0000:00:1c.4/0000:0d:00.0/usb5/5-1/5-1.3/5-1.3:1.2/0003:5241:4B59.000=
6/input/input8
[    2.003574] input: Logitech Unifying Device. Wireless PID:404a Keyboard =
as /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.2/0003:046D:C52B.0003/00=
03:046D:404A.0007/input/input11
[    2.027582] nvme nvme0: missing or invalid SUBNQN field.
[    2.027597] nvme nvme0: Shutdown timeout set to 8 seconds
[    2.035555] usb 1-6.1: New USB device found, idVendor=3D05e3, idProduct=
=3D0610, bcdDevice=3D41.43
[    2.035556] usb 1-6.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    2.035557] usb 1-6.1: Product: USB2.0 Hub
[    2.035557] usb 1-6.1: Manufacturer: GenesysLogic
[    2.036399] hub 1-6.1:1.0: USB hub found
[    2.036973] hub 1-6.1:1.0: 4 ports detected
[    2.038308] nvme nvme0: 8/0/0 default/read/poll queues
[    2.042704]  nvme1n1: p1
[    2.050197] input: RAMA.WORKS RAMA KOYU Consumer Control as /devices/pci=
0000:00/0000:00:1c.4/0000:0d:00.0/usb5/5-1/5-1.3/5-1.3:1.2/0003:5241:4B59.0=
006/input/input9
[    2.050277] input: RAMA.WORKS RAMA KOYU Keyboard as /devices/pci0000:00/=
0000:00:1c.4/0000:0d:00.0/usb5/5-1/5-1.3/5-1.3:1.2/0003:5241:4B59.0006/inpu=
t/input10
[    2.050387] input: Logitech Unifying Device. Wireless PID:404a Mouse as =
/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.2/0003:046D:C52B.0003/0003:=
046D:404A.0007/input/input12
[    2.050529] input: Logitech Unifying Device. Wireless PID:404a Consumer =
Control as /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.2/0003:046D:C52B=
.0003/0003:046D:404A.0007/input/input13
[    2.050647] hid-generic 0003:5241:4B59.0006: input,hidraw3: USB HID v1.1=
1 Keyboard [RAMA.WORKS RAMA KOYU] on usb-0000:0d:00.0-1.3/input2
[    2.050689] input: Logitech Unifying Device. Wireless PID:404a System Co=
ntrol as /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.2/0003:046D:C52B.0=
003/0003:046D:404A.0007/input/input14
[    2.050710] hid-generic 0003:046D:404A.0007: input,hidraw4: USB HID v1.1=
1 Keyboard [Logitech Unifying Device. Wireless PID:404a] on usb-0000:00:14.=
0-4:1
[    2.051444] hid-generic 0003:5241:4B59.0009: hiddev97,hidraw5: USB HID v=
1.11 Device [RAMA.WORKS RAMA KOYU] on usb-0000:0d:00.0-1.3/input1
[    2.057439] input: Logitech MX Anywhere 2 as /devices/pci0000:00/0000:00=
:14.0/usb1/1-4/1-4:1.2/0003:046D:C52B.0003/0003:046D:404A.0008/input/input1=
8
[    2.106228] usb 1-6.4: new full-speed USB device number 6 using xhci_hcd
[    2.116548] logitech-hidpp-device 0003:046D:404A.0008: input,hidraw6: US=
B HID v1.11 Keyboard [Logitech MX Anywhere 2] on usb-0000:00:14.0-4:2
[    2.159689] input: Logitech MX Anywhere 2 as /devices/pci0000:00/0000:00=
:14.0/usb1/1-4/1-4:1.2/0003:046D:C52B.0003/0003:046D:404A.0007/input/input1=
9
[    2.160010] logitech-hidpp-device 0003:046D:404A.0007: input,hidraw4: US=
B HID v1.11 Keyboard [Logitech MX Anywhere 2] on usb-0000:00:14.0-4:1
[    2.185470] usb 1-6.4: New USB device found, idVendor=3D19f7, idProduct=
=3D000a, bcdDevice=3D 1.23
[    2.185473] usb 1-6.4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[    2.185476] usb 1-6.4: Product: RODE AI-1
[    2.185478] usb 1-6.4: Manufacturer: RODE Microphones
[    2.185479] usb 1-6.4: SerialNumber: 7E146491
[    2.192731] hid-generic 0003:19F7:000A.000A: hiddev98,hidraw7: USB HID v=
1.11 Device [RODE Microphones RODE AI-1] on usb-0000:00:14.0-6.4/input3
[    2.227411] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): registered=
 PHC clock
[    2.309928] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) 9c:=
5c:8e:d2:b1:6a
[    2.309933] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connecti=
on
[    2.310012] e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12, PBA No: FFFFFF-0=
FF
[    2.312999] e1000e 0000:00:1f.6 enp0s31f6: renamed from eth0
[    2.316160] usb 1-6.1.1: new high-speed USB device number 7 using xhci_h=
cd
[    2.615552] PM: Image not found (code -22)
[    2.617584] audit: type=3D1130 audit(1564907577.144:6): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-hibe=
rnate-resume@dev-mapper-fedora_localhost\x2d\x2dlive\x2dswap comm=3D"system=
d" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=
=3Dsuccess'
[    2.617608] audit: type=3D1131 audit(1564907577.144:7): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-hibe=
rnate-resume@dev-mapper-fedora_localhost\x2d\x2dlive\x2dswap comm=3D"system=
d" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=
=3Dsuccess'
[    2.629034] audit: type=3D1130 audit(1564907577.155:8): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Ddracut-initq=
ueue comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
[    2.632648] audit: type=3D1130 audit(1564907577.159:9): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-tmpf=
iles-setup comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? a=
ddr=3D? terminal=3D? res=3Dsuccess'
[    2.648357] audit: type=3D1130 audit(1564907577.175:10): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-fsc=
k-root comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=
=3D? terminal=3D? res=3Dsuccess'
[    2.655116] EXT4-fs (dm-0): mounted filesystem with ordered data mode. O=
pts: (null)
[    2.666417] usb 1-6.1.1: New USB device found, idVendor=3D046d, idProduc=
t=3D0826, bcdDevice=3D 0.10
[    2.666419] usb 1-6.1.1: New USB device strings: Mfr=3D0, Product=3D2, S=
erialNumber=3D1
[    2.666421] usb 1-6.1.1: Product: HD Webcam C525
[    2.666422] usb 1-6.1.1: SerialNumber: CD104C90
[    2.733109] usb 1-6.1.3: new high-speed USB device number 8 using xhci_h=
cd
[    2.818411] usb 1-6.1.3: New USB device found, idVendor=3D0bda, idProduc=
t=3D0150, bcdDevice=3D57.13
[    2.818412] usb 1-6.1.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[    2.818413] usb 1-6.1.3: Product: USB2.0-CRW
[    2.818413] usb 1-6.1.3: Manufacturer: Generic
[    2.818414] usb 1-6.1.3: SerialNumber: 20120926571200000
[    2.823077] usb-storage 1-6.1.3:1.0: USB Mass Storage device detected
[    2.823534] scsi host3: usb-storage 1-6.1.3:1.0
[    2.889160] usb 1-6.1.4: new full-speed USB device number 9 using xhci_h=
cd
[    2.969432] usb 1-6.1.4: New USB device found, idVendor=3D054c, idProduc=
t=3D0bb5, bcdDevice=3D 1.00
[    2.969433] usb 1-6.1.4: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[    2.969434] usb 1-6.1.4: Product: MDR-1000X
[    2.969434] usb 1-6.1.4: Manufacturer: Sony
[    2.972980] hid-generic 0003:054C:0BB5.000B: hiddev99,hidraw8: USB HID v=
1.11 Device [Sony MDR-1000X] on usb-0000:00:14.0-6.1.4/input0
[    3.003493] systemd-journald[313]: Received SIGTERM from PID 1 (systemd)=
.
[    3.015222] printk: systemd: 22 output lines suppressed due to ratelimit=
ing
[    3.346539] SELinux:  policy capability network_peer_controls=3D1
[    3.346540] SELinux:  policy capability open_perms=3D1
[    3.346540] SELinux:  policy capability extended_socket_class=3D1
[    3.346540] SELinux:  policy capability always_check_network=3D0
[    3.346541] SELinux:  policy capability cgroup_seclabel=3D1
[    3.346541] SELinux:  policy capability nnp_nosuid_transition=3D1
[    3.360376] systemd[1]: Successfully loaded SELinux policy in 316.193ms.
[    3.388723] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup =
in 16.855ms.
[    3.389933] systemd[1]: systemd v241-10.git511646b.fc30 running in syste=
m mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRY=
PTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2=
 -IDN +PCRE2 default-hierarchy=3Dhybrid)
[    3.402240] systemd[1]: Detected architecture x86-64.
[    3.402742] systemd[1]: Set hostname to <attic>.
[    3.439899] systemd[1]: /usr/lib/systemd/system/gssproxy.service:9: PIDF=
ile=3D references path below legacy directory /var/run/, updating /var/run/=
gssproxy.pid =E2=86=92 /run/gssproxy.pid; please update the unit file accor=
dingly.
[    3.452055] systemd[1]: /usr/lib/systemd/system/sssd.service:11: PIDFile=
=3D references path below legacy directory /var/run/, updating /var/run/sss=
d.pid =E2=86=92 /run/sssd.pid; please update the unit file accordingly.
[    3.452255] systemd[1]: /usr/lib/systemd/system/mdmonitor.service:6: PID=
File=3D references path below legacy directory /var/run/, updating /var/run=
/mdadm/mdadm.pid =E2=86=92 /run/mdadm/mdadm.pid; please update the unit fil=
e accordingly.
[    3.452644] systemd[1]: /usr/lib/systemd/system/iscsid.service:10: PIDFi=
le=3D references path below legacy directory /var/run/, updating /var/run/i=
scsid.pid =E2=86=92 /run/iscsid.pid; please update the unit file accordingl=
y.
[    3.452772] systemd[1]: /usr/lib/systemd/system/iscsiuio.service:12: PID=
File=3D references path below legacy directory /var/run/, updating /var/run=
/iscsiuio.pid =E2=86=92 /run/iscsiuio.pid; please update the unit file acco=
rdingly.
[    3.491716] systemd[1]: initrd-switch-root.service: Succeeded.
[    3.491928] systemd[1]: Stopped Switch Root.
[    3.498859] Adding 16502780k swap on /dev/mapper/fedora_localhost--live-=
swap.  Priority:-2 extents:1 across:16502780k SSFS
[    3.501413] EXT4-fs (dm-0): re-mounted. Opts: (null)
[    3.645566] systemd-journald[727]: Received request to flush runtime jou=
rnal from PID 1
[    3.772755] IPMI message handler: version 39.2
[    3.774305] ipmi device interface
[    3.775985] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    3.786418] bcma-pci-bridge 0000:07:00.0: enabling device (0000 -> 0002)
[    3.786510] bcma-pci-bridge 0000:07:00.0: bus0: Found chip with id 0x436=
0, rev 0x03 and package 0x00
[    3.786541] bcma-pci-bridge 0000:07:00.0: bus0: Core 0 found: ChipCommon=
 (manuf 0x4BF, id 0x800, rev 0x2B, class 0x0)
[    3.786559] bcma-pci-bridge 0000:07:00.0: bus0: Core 1 found: IEEE 802.1=
1 (manuf 0x4BF, id 0x812, rev 0x2A, class 0x0)
[    3.786593] bcma-pci-bridge 0000:07:00.0: bus0: Core 2 found: ARM CR4 (m=
anuf 0x4BF, id 0x83E, rev 0x02, class 0x0)
[    3.786638] bcma-pci-bridge 0000:07:00.0: bus0: Core 3 found: PCIe Gen2 =
(manuf 0x4BF, id 0x83C, rev 0x01, class 0x0)
[    3.786656] bcma-pci-bridge 0000:07:00.0: bus0: Core 4 found: USB 2.0 De=
vice (manuf 0x4BF, id 0x81A, rev 0x11, class 0x0)
[    3.786751] bcma-pci-bridge 0000:07:00.0: bus0: Using fallback SPROM fai=
led (err -2)
[    3.786752] bcma-pci-bridge 0000:07:00.0: bus0: No SPROM available
[    3.789319] bcma-pci-bridge 0000:07:00.0: bus0: Bus registered
[    3.801456] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    3.801490] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    3.838004] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    3.838253] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
[    3.838291] snd_hda_intel 0000:01:00.1: Disabling MSI
[    3.838295] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio clie=
nt
[    3.838505] nvidia: loading out-of-tree module taints kernel.
[    3.838511] nvidia: module license 'NVIDIA' taints kernel.
[    3.838511] Disabling lock debugging due to kernel taint
[    3.843380] nvidia: module verification failed: signature and/or require=
d key missing - tainting kernel
[    3.850093] nvidia-nvlink: Nvlink Core is being initialized, major devic=
e number 511
[    3.850894] media: Linux media interface: v0.10
[    3.854202] nvidia 0000:01:00.0: vgaarb: changed VGA decodes: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
[    3.862854] snd_hda_codec_realtek hdaudioC0D0: ALC1150: SKU not ready 0x=
00000000
[    3.863403] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC1150: l=
ine_outs=3D4 (0x14/0x15/0x16/0x17/0x0) type:line
[    3.863405] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    3.863406] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x1b/0x0/=
0x0/0x0/0x0)
[    3.863406] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
[    3.863407] snd_hda_codec_realtek hdaudioC0D0:    dig-out=3D0x11/0x1e
[    3.863408] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    3.863409] snd_hda_codec_realtek hdaudioC0D0:      Front Mic=3D0x19
[    3.863410] snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=3D0x18
[    3.863411] snd_hda_codec_realtek hdaudioC0D0:      Line=3D0x1a
[    3.865671] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360=
 ms ovfl timer
[    3.865672] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    3.865673] RAPL PMU: hw unit of domain package 2^-14 Joules
[    3.865673] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    3.865673] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    3.865674] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    3.868895] videodev: Linux video capture interface: v2.00
[    3.877091] input: HDA Intel PCH Front Mic as /devices/pci0000:00/0000:0=
0:1f.3/sound/card0/input20
[    3.877303] input: HDA Intel PCH Rear Mic as /devices/pci0000:00/0000:00=
:1f.3/sound/card0/input21
[    3.877343] input: HDA Intel PCH Line as /devices/pci0000:00/0000:00:1f.=
3/sound/card0/input22
[    3.877399] input: HDA Intel PCH Line Out Front as /devices/pci0000:00/0=
000:00:1f.3/sound/card0/input23
[    3.877441] input: HDA Intel PCH Line Out Surround as /devices/pci0000:0=
0/0000:00:1f.3/sound/card0/input24
[    3.877481] input: HDA Intel PCH Line Out CLFE as /devices/pci0000:00/00=
00:00:1f.3/sound/card0/input25
[    3.877530] input: HDA Intel PCH Line Out Side as /devices/pci0000:00/00=
00:00:1f.3/sound/card0/input26
[    3.877584] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input27
[    3.879312] scsi 3:0:0:0: Direct-Access     Generic- Multi-Card       1.=
00 PQ: 0 ANSI: 4
[    3.891889] uvcvideo: Found UVC 1.00 device HD Webcam C525 (046d:0826)
[    3.892291] asus_wmi: ASUS WMI generic driver loaded
[    3.895007] asus_wmi: Initialization: 0x0
[    3.895019] asus_wmi: BIOS WMI version: 0.9
[    3.895036] asus_wmi: SFUN value: 0x0
[    3.895289] input: Eee PC WMI hotkeys as /devices/platform/eeepc-wmi/inp=
ut/input28
[    3.895360] asus_wmi: Number of fans: 1
[    3.957065] uvcvideo 1-6.1.1:1.2: Entity type for entity Extension 5 was=
 not initialized!
[    3.957067] uvcvideo 1-6.1.1:1.2: Entity type for entity Processing 2 wa=
s not initialized!
[    3.957068] uvcvideo 1-6.1.1:1.2: Entity type for entity Camera 1 was no=
t initialized!
[    3.957069] uvcvideo 1-6.1.1:1.2: Entity type for entity Extension 6 was=
 not initialized!
[    3.957070] uvcvideo 1-6.1.1:1.2: Entity type for entity Extension 7 was=
 not initialized!
[    3.957078] uvcvideo 1-6.1.1:1.2: Entity type for entity Extension 8 was=
 not initialized!
[    3.957132] input: HD Webcam C525 as /devices/pci0000:00/0000:00:14.0/us=
b1/1-6/1-6.1/1-6.1.1/1-6.1.1:1.2/input/input29
[    3.957180] usbcore: registered new interface driver uvcvideo
[    3.957181] USB Video Class driver (1.1.1)
[    3.985909] usb 1-6.4: 1:1: cannot get freq at ep 0x82
[    3.994762] intel_rapl: Found RAPL domain package
[    3.994763] intel_rapl: Found RAPL domain core
[    3.994764] intel_rapl: Found RAPL domain dram
[    4.006403] usb 1-6.4: 2:1: cannot get freq at ep 0x3
[    4.020236] iTCO_vendor_support: vendor-support=3D0
[    4.027239] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    4.027351] iTCO_wdt: Found a Intel PCH TCO device (Version=3D4, TCOBASE=
=3D0x0400)
[    4.029833] iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=3D0)
[    4.090540] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    4.090996] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    4.094118] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  430.26  Tue =
Jun  4 17:40:52 CDT 2019
[    4.105205] nvidia-uvm: Loaded the UVM driver in 8 mode, major device nu=
mber 508
[    4.107007] Bluetooth: Core ver 2.22
[    4.107019] NET: Registered protocol family 31
[    4.107020] Bluetooth: HCI device and connection manager initialized
[    4.107022] Bluetooth: HCI socket layer initialized
[    4.107024] Bluetooth: L2CAP socket layer initialized
[    4.107027] Bluetooth: SCO socket layer initialized
[    4.109154] nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver fo=
r UNIX platforms  430.26  Tue Jun  4 17:45:09 CDT 2019
[    4.110583] [drm] [nvidia-drm] [GPU ID 0x00000100] Loading driver
[    4.114046] usbcore: registered new interface driver btusb
[    4.150309] b43-phy0: Broadcom 4360 WLAN found (core revision 42)
[    4.168761] bcma-pci-bridge 0000:07:00.0: bus0: HT force timeout
[    4.178526] input: HDA NVidia HDMI/DP,pcm=3D3 as /devices/pci0000:00/000=
0:00:01.0/0000:01:00.1/sound/card1/input30
[    4.178590] input: HDA NVidia HDMI/DP,pcm=3D7 as /devices/pci0000:00/000=
0:00:01.0/0000:01:00.1/sound/card1/input31
[    4.178635] input: HDA NVidia HDMI/DP,pcm=3D8 as /devices/pci0000:00/000=
0:00:01.0/0000:01:00.1/sound/card1/input32
[    4.178674] input: HDA NVidia HDMI/DP,pcm=3D9 as /devices/pci0000:00/000=
0:00:01.0/0000:01:00.1/sound/card1/input33
[    4.230423] Bluetooth: hci0: BCM: chip id 63
[    4.231423] Bluetooth: hci0: BCM: features 0x07
[    4.247424] Bluetooth: hci0: attic
[    4.248422] Bluetooth: hci0: BCM20702A1 (001.002.014) build 0000
[    4.248516] bluetooth hci0: Direct firmware load for brcm/BCM20702A1-0b0=
5-180a.hcd failed with error -2
[    4.248517] Bluetooth: hci0: BCM: Patch brcm/BCM20702A1-0b05-180a.hcd no=
t found
[    4.289722] bcma-pci-bridge 0000:07:00.0: bus0: PLL enable timeout
[    4.289729] b43-phy0 ERROR: FOUND UNSUPPORTED PHY (Analog 12, Type 11 (A=
C), Revision 1)
[    4.289741] b43: probe of bcma0:1 failed with error -95
[    4.289756] Broadcom 43xx driver loaded [ Features: PNLS ]
[    4.893006] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.893007] [drm] No driver support for vblank timestamp query.
[    5.051670] scsi 2:0:0:0: CD-ROM            HL-DT-ST BD-RE  BE14NU40  1.=
01 PQ: 0 ANSI: 0
[    5.072957] sr 2:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram cd=
/rw xa/form2 cdda tray
[    5.072957] cdrom: Uniform CD-ROM driver Revision: 3.20
[    5.073174] sr 2:0:0:0: Attached scsi CD-ROM sr0
[    5.073245] sr 2:0:0:0: Attached scsi generic sg0 type 5
[    5.073381] sd 3:0:0:0: Attached scsi generic sg1 type 0
[    5.076995] sd 3:0:0:0: [sda] Attached SCSI removable disk
[    5.127143] [drm] Initialized nvidia-drm 0.0.0 20160202 for 0000:01:00.0=
 on minor 0
[    5.221073] snd_hda_codec_hdmi hdaudioC1D0: HDMI: invalid ELD data byte =
21
[    9.128892] kauditd_printk_skb: 47 callbacks suppressed
[    9.128894] audit: type=3D1131 audit(1564907583.655:58): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-rfkill comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    9.611419] usb 1-6.1.1: reset high-speed USB device number 7 using xhci=
_hcd
[   10.222444] usb 1-6.1.1: set resolution quirk: cval->res =3D 384
[   10.223061] usbcore: registered new interface driver snd-usb-audio
[   10.817274] usb 1-6.1.3: USB disconnect, device number 8
[   11.272895] audit: type=3D1130 audit(1564907585.799:59): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-udev-settle comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   11.301725] audit: type=3D1130 audit(1564907585.828:60): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddmraid-activation comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   11.301727] audit: type=3D1131 audit(1564907585.828:61): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddmraid-activation comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   11.318591] audit: type=3D1130 audit(1564907585.845:62): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-fsck@dev-disk-by\x2duuid-DD09\x2dAECD comm=3D"systemd" e=
xe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsu=
ccess'
[   11.319871] audit: type=3D1130 audit(1564907585.846:63): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-fsck@dev-disk-by\x2duuid-84323744\x2def11\x2d4a1e\x2d972=
5\x2dcebc1af094ee comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostnam=
e=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   11.320208] audit: type=3D1130 audit(1564907585.847:64): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-fsck@dev-mapper-fedora_localhost\x2d\x2dlive\x2dhome com=
m=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? termin=
al=3D? res=3Dsuccess'
[   11.326542] EXT4-fs (nvme0n1p2): mounted filesystem with ordered data mo=
de. Opts: (null)
[   11.334354] EXT4-fs (dm-2): mounted filesystem with ordered data mode. O=
pts: (null)
[   11.341256] audit: type=3D1130 audit(1564907585.868:65): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddracut-shutdown comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   11.351238] audit: type=3D1130 audit(1564907585.878:66): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dplymouth-read-write comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   11.351245] audit: type=3D1131 audit(1564907585.878:67): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dplymouth-read-write comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   11.417552] RPC: Registered named UNIX socket transport module.
[   11.417553] RPC: Registered udp transport module.
[   11.417553] RPC: Registered tcp transport module.
[   11.417553] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   11.505493] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   11.505494] Bluetooth: BNEP filters: protocol multicast
[   11.505496] Bluetooth: BNEP socket layer initialized
[   11.820063] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[   12.242911] bridge: filtering via arp/ip/ip6tables is no longer availabl=
e by default. Update your scripts to load br_netfilter if you need this.
[   12.244956] Bridge firewalling registered
[   12.560701] tun: Universal TUN/TAP device driver, 1.6
[   12.574289] virbr0: port 1(virbr0-nic) entered blocking state
[   12.574290] virbr0: port 1(virbr0-nic) entered disabled state
[   12.574323] device virbr0-nic entered promiscuous mode
[   12.659858] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[   12.660389] usb 1-6.1-port3: attempt power cycle
[   12.671052] virbr0: port 1(virbr0-nic) entered blocking state
[   12.671054] virbr0: port 1(virbr0-nic) entered listening state
[   12.703988] virbr0: port 1(virbr0-nic) entered disabled state
[   13.827843] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[   14.545793] kauditd_printk_skb: 180 callbacks suppressed
[   14.545794] audit: type=3D1100 audit(1564907589.073:248): pid=3D1608 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:xdm_t:s0-s=
0:c0.c1023 msg=3D'op=3DPAM:authentication grantors=3Dpam_permit acct=3D"gdm=
" exe=3D"/usr/libexec/gdm-session-worker" hostname=3Dattic addr=3D? termina=
l=3D/dev/tty1 res=3Dsuccess'
[   14.546060] audit: type=3D1101 audit(1564907589.073:249): pid=3D1608 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:xdm_t:s0-s=
0:c0.c1023 msg=3D'op=3DPAM:accounting grantors=3Dpam_permit acct=3D"gdm" ex=
e=3D"/usr/libexec/gdm-session-worker" hostname=3Dattic addr=3D? terminal=3D=
/dev/tty1 res=3Dsuccess'
[   14.547646] audit: type=3D1103 audit(1564907589.075:250): pid=3D1608 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:xdm_t:s0-s=
0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_permit acct=3D"gdm" exe=
=3D"/usr/libexec/gdm-session-worker" hostname=3Dattic addr=3D? terminal=3D/=
dev/tty1 res=3Dsuccess'
[   14.576299] audit: type=3D1130 audit(1564907589.104:251): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Duser-runtime-dir@42 comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.605800] audit: type=3D1101 audit(1564907589.133:252): pid=3D1613 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 =
msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_localuser acct=3D"gdm" e=
xe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsu=
ccess'
[   14.618004] audit: type=3D2300 audit(1564907589.145:253): pid=3D1613 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 =
msg=3D'pam: default-context=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:=
c0.c1023 selected-context=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0=
.c1023 exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? =
res=3Dsuccess'
[   14.618162] audit: type=3D1006 audit(1564907589.146:254): pid=3D1613 uid=
=3D0 subj=3Dsystem_u:system_r:init_t:s0 old-auid=3D4294967295 auid=3D42 tty=
=3D(none) old-ses=3D4294967295 ses=3D1 res=3D1
[   14.618573] audit: type=3D1105 audit(1564907589.146:255): pid=3D1613 uid=
=3D0 auid=3D42 ses=3D1 subj=3Dsystem_u:system_r:init_t:s0 msg=3D'op=3DPAM:s=
ession_open grantors=3Dpam_selinux,pam_selinux,pam_loginuid,pam_keyinit,pam=
_limits,pam_systemd,pam_unix acct=3D"gdm" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.671326] audit: type=3D1130 audit(1564907589.199:256): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Duser@42 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostna=
me=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   14.674980] audit: type=3D1105 audit(1564907589.202:257): pid=3D1608 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:xdm_t:s0-s=
0:c0.c1023 msg=3D'op=3DPAM:session_open grantors=3Dpam_keyinit,pam_keyinit,=
pam_limits,pam_systemd,pam_unix,pam_umask acct=3D"gdm" exe=3D"/usr/libexec/=
gdm-session-worker" hostname=3Dattic addr=3D? terminal=3D/dev/tty1 res=3Dsu=
ccess'
[   14.684104] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[   14.684570] usb 1-6.1-port3: unable to enumerate USB device
[   15.140668] igb 0000:0b:00.0 enp11s0: igb: enp11s0 NIC Link is Up 1000 M=
bps Full Duplex, Flow Control: RX/TX
[   15.347378] IPv6: ADDRCONF(NETDEV_CHANGE): enp11s0: link becomes ready
[   15.583720] usb 1-6.4: 1:1: cannot get freq at ep 0x82
[   15.597129] usb 1-6.1.3: new high-speed USB device number 14 using xhci_=
hcd
[   15.683018] usb 1-6.1.3: New USB device found, idVendor=3D0bda, idProduc=
t=3D0150, bcdDevice=3D57.13
[   15.683019] usb 1-6.1.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[   15.683020] usb 1-6.1.3: Product: USB2.0-CRW
[   15.683020] usb 1-6.1.3: Manufacturer: Generic
[   15.683021] usb 1-6.1.3: SerialNumber: 20120926571200000
[   15.690375] usb-storage 1-6.1.3:1.0: USB Mass Storage device detected
[   15.690534] scsi host3: usb-storage 1-6.1.3:1.0
[   16.741326] scsi 3:0:0:0: Direct-Access     Generic- Multi-Card       1.=
00 PQ: 0 ANSI: 4
[   16.742006] sd 3:0:0:0: Attached scsi generic sg1 type 0
[   16.745705] sd 3:0:0:0: [sda] Attached SCSI removable disk
[   23.013333] kauditd_printk_skb: 21 callbacks suppressed
[   23.013338] audit: type=3D1131 audit(1564907597.541:279): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3DNetworkManager-dispatcher comm=3D"systemd" exe=3D"/usr/lib/syste=
md/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   23.097941] audit: type=3D1130 audit(1564907597.625:280): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3DNetworkManager-wait-online comm=3D"systemd" exe=3D"/usr/lib/syst=
emd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   23.103037] audit: type=3D1130 audit(1564907597.630:281): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Drpc-statd-notify comm=3D"systemd" exe=3D"/usr/lib/systemd/system=
d" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   23.105243] audit: type=3D1130 audit(1564907597.633:282): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3DNetworkManager-dispatcher comm=3D"systemd" exe=3D"/usr/lib/syste=
md/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   24.641022] usb 1-6.1.3: USB disconnect, device number 14
[   24.993311] usb 1-6.1.3: new high-speed USB device number 15 using xhci_=
hcd
[   25.080651] usb 1-6.1.3: New USB device found, idVendor=3D0bda, idProduc=
t=3D0150, bcdDevice=3D57.13
[   25.080652] usb 1-6.1.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[   25.080653] usb 1-6.1.3: Product: USB2.0-CRW
[   25.080654] usb 1-6.1.3: Manufacturer: Generic
[   25.080654] usb 1-6.1.3: SerialNumber: 20120926571200000
[   25.085319] usb-storage 1-6.1.3:1.0: USB Mass Storage device detected
[   25.085879] scsi host3: usb-storage 1-6.1.3:1.0
[   26.149660] scsi 3:0:0:0: Direct-Access     Generic- Multi-Card       1.=
00 PQ: 0 ANSI: 4
[   26.150230] sd 3:0:0:0: Attached scsi generic sg1 type 0
[   26.155065] sd 3:0:0:0: [sda] Attached SCSI removable disk
[   34.272202] audit: type=3D1131 audit(1564907608.541:283): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3DNetworkManager-dispatcher comm=3D"systemd" exe=3D"/usr/lib/syste=
md/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   46.076978] audit: type=3D1131 audit(1564907620.348:284): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-localed comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   46.259344] audit: type=3D1131 audit(1564907620.530:285): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dfprintd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostna=
me=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   46.626653] audit: type=3D1131 audit(1564907620.898:286): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-hostnamed comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   49.493958] audit: type=3D1130 audit(1564907623.765:287): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dfprintd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostna=
me=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   52.591182] audit: type=3D1100 audit(1564907626.862:288): pid=3D2115 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:xdm_t:s0-s=
0:c0.c1023 msg=3D'op=3DPAM:authentication grantors=3Dpam_succeed_if,pam_loc=
aluser,pam_unix,pam_gnome_keyring acct=3D"atticdweller" exe=3D"/usr/libexec=
/gdm-session-worker" hostname=3Dattic addr=3D? terminal=3D/dev/tty1 res=3Ds=
uccess'
[   52.612774] audit: type=3D1101 audit(1564907626.884:289): pid=3D2115 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:xdm_t:s0-s=
0:c0.c1023 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_localuser acc=
t=3D"atticdweller" exe=3D"/usr/libexec/gdm-session-worker" hostname=3Dattic=
 addr=3D? terminal=3D/dev/tty1 res=3Dsuccess'
[   52.614149] audit: type=3D1103 audit(1564907626.885:290): pid=3D2115 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:xdm_t:s0-s=
0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_localuser,pam_unix,pam_gn=
ome_keyring acct=3D"atticdweller" exe=3D"/usr/libexec/gdm-session-worker" h=
ostname=3Dattic addr=3D? terminal=3D/dev/tty1 res=3Dsuccess'
[   52.616465] audit: type=3D1006 audit(1564907626.888:291): pid=3D2115 uid=
=3D0 subj=3Dsystem_u:system_r:xdm_t:s0-s0:c0.c1023 old-auid=3D4294967295 au=
id=3D1000 tty=3D(none) old-ses=3D4294967295 ses=3D2 res=3D1
[   52.630736] audit: type=3D2300 audit(1564907626.902:292): pid=3D2115 uid=
=3D0 auid=3D1000 ses=3D2 subj=3Dsystem_u:system_r:xdm_t:s0-s0:c0.c1023 msg=
=3D'pam: default-context=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.=
c1023 selected-context=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1=
023 exe=3D"/usr/libexec/gdm-session-worker" hostname=3Dattic addr=3D? termi=
nal=3D/dev/tty2 res=3Dsuccess'
[   52.646930] audit: type=3D1130 audit(1564907626.918:293): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Duser-runtime-dir@1000 comm=3D"systemd" exe=3D"/usr/lib/systemd/s=
ystemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   52.673502] audit: type=3D1101 audit(1564907626.945:294): pid=3D2130 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 =
msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_localuser acct=3D"atticd=
weller" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D?=
 res=3Dsuccess'
[   52.685009] audit: type=3D2300 audit(1564907626.956:295): pid=3D2130 uid=
=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 =
msg=3D'pam: default-context=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:=
c0.c1023 selected-context=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0=
.c1023 exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? =
res=3Dsuccess'
[   52.685153] audit: type=3D1006 audit(1564907626.956:296): pid=3D2130 uid=
=3D0 subj=3Dsystem_u:system_r:init_t:s0 old-auid=3D4294967295 auid=3D1000 t=
ty=3D(none) old-ses=3D4294967295 ses=3D3 res=3D1
[   52.685546] audit: type=3D1105 audit(1564907626.957:297): pid=3D2130 uid=
=3D0 auid=3D1000 ses=3D3 subj=3Dsystem_u:system_r:init_t:s0 msg=3D'op=3DPAM=
:session_open grantors=3Dpam_selinux,pam_selinux,pam_loginuid,pam_keyinit,p=
am_limits,pam_systemd,pam_unix acct=3D"atticdweller" exe=3D"/usr/lib/system=
d/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   52.839276] Bluetooth: RFCOMM TTY layer initialized
[   52.839278] Bluetooth: RFCOMM socket layer initialized
[   52.839298] Bluetooth: RFCOMM ver 1.11
[   53.536448] snd_hda_codec_hdmi hdaudioC1D0: HDMI: invalid ELD data byte =
93
[   54.059340] fuse init (API version 7.29)
[   55.072353] rfkill: input handler disabled
[   56.443605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.448606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.453606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.458603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.463629] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.478628] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.483606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.488603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.493601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.498601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.513603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.518640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.523604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.528637] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.533639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.548606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.553609] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.558609] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.563605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.568643] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.583643] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.588603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.593603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.598602] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.603602] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.618609] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.623606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.628609] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.633601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.638608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.653607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.658608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.663639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.668610] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.673606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.688603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.693606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.698603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.703610] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.708639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.723610] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.728661] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.733620] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.738641] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.743642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.758603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.763608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.768638] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.773603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.778603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.793600] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.798636] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.803608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.808642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.813665] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.828678] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.833604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.838623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.843622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.848656] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.863660] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.868603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.873627] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.878640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.883637] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.898657] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.903604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.908604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.913640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.918605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.933644] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.938644] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.943642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.948637] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.953636] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.968656] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.973642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.978622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.983901] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   56.988655] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.003608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.008622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.013622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.018659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.023600] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.038620] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.043626] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.048622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.053620] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.058621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.073608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.078605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.083622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.088635] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.093603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.108612] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.113640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.118607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.123640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.128607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.143608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.148599] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.153839] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.158640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.163608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.178607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.183640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.188640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.193603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.198606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.213640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.218604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.223607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.228627] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.233663] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.248604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.253601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.258625] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.263634] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.268602] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.283624] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.288604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.293599] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.298598] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.303631] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.318603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.323599] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.328634] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.333598] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.338598] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.353603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.358598] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.363634] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.368634] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.373598] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.388656] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.393657] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.398619] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.403620] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.408604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.423605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.428604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.433639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.438638] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.443638] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.458640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.463608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.468608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.473603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.478722] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.493627] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.498606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.503609] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.508622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.513627] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.528624] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.533647] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.538623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.543628] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.548655] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.563608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.568608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.573626] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.578640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.583605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.598643] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.603607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.608605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.613661] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.618659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.633642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.638657] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.643603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.648623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.653686] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.668621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.673609] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.678604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.683649] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.688607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.703639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.708663] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.713624] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.718635] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.723660] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.738631] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.743641] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.748603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.753639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.758642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.773627] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.778641] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.783642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.788622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.793603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.808607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.813603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.818627] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.823629] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.828617] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.843638] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.848657] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.853619] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.858603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.863640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.878659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.883619] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.888655] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.893657] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.898623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.913619] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.918656] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.923624] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.928655] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.933659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.948623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.953621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.958602] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.963601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.968606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.983682] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.988673] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.993640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   57.998644] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.003625] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.018641] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.023639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.028637] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.033726] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.038710] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.053655] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.058754] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.063741] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.068720] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.073738] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.088734] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.093717] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.098747] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.103639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.108703] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.123626] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.128690] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.133661] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.138705] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.143763] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.158709] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.163674] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.168674] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.173649] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.178717] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.193704] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.198651] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.203659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.208642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.213670] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.228602] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.233666] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.238626] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.243663] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.248604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.263623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.268636] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.273601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.278624] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.283663] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.298632] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.303625] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.308607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.313637] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.318621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.333676] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.338659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.343643] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.348652] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.353621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.368714] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.373742] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.378756] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.383722] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.388682] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.403705] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.408702] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.413682] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.418723] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.423760] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.438699] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.443699] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.448688] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.453724] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.458722] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.473653] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.478664] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.483664] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.488678] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.493720] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.508736] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.513693] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.518689] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.523741] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.528695] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.543697] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.548663] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.553736] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.558729] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.563709] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.578757] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.583691] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.588721] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.593721] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.598723] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.613754] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.618715] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.623725] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.628746] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.633684] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.648758] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.653731] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.658700] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.663724] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.668635] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.683633] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.688668] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.693661] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.698621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.703673] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.718609] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.723640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.728600] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.733624] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.738642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.753621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.758607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.763638] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.768621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.773633] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.788655] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.794062] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.798667] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.803645] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.808645] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.823659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.828604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.833612] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.838682] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.843637] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.858604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.863659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.868689] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.873642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.878673] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.893639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.898603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.903605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.908624] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.913623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.928679] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.933642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.938622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.943628] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.948650] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.963604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.968607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.973605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.978604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.983634] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   58.998640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.003657] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.008608] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.013657] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.018623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.033620] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.038626] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.043624] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.048601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.053601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.068607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.073603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.078640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.083602] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.088603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.103600] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.108600] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.113635] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.118601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.123602] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.138638] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.143659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.148619] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.153637] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.158605] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.173642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.178663] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.183625] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.188625] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.193601] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.208761] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.213744] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.218625] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.223624] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.228664] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.243627] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.248623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.253628] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.258657] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.263622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.278633] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.283622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.288649] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.293607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.298623] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.313607] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.318644] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.323646] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.328627] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.333780] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.348640] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.353710] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.358691] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.363693] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.368736] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.383691] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.388659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.393648] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.398756] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.403707] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.418707] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.423642] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.428614] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.433676] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.438676] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.453671] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.458671] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.463639] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.468636] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.473643] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.488707] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.493638] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.498631] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.503665] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.508638] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.523664] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.528636] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.533630] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.538674] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.543610] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.558665] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.563603] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.568622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.573625] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.578660] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.593656] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.598659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.603621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.608658] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.613657] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.628659] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.633620] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.638621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.643622] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.648629] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.663638] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.668637] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.673705] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.678628] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.683738] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.698739] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.703728] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.708720] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.713678] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.718677] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.733684] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.738677] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.743681] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.748682] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.753723] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.768674] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.773641] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.778634] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.783621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.788660] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.803670] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.808614] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.813616] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.818614] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.823643] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.838606] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.843604] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.848653] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.853682] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.858687] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.873651] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.878671] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.883668] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.888670] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.893715] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.908676] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.913677] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.918727] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.923681] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.928683] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.943628] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.948682] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.953653] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.958648] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.963652] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.978666] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.983672] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.988667] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.993655] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   59.998691] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.013690] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.018681] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.023707] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.028679] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.033685] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.048674] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.053676] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.058690] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.063712] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.068683] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.083718] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.088713] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.093680] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.098672] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.103676] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.123673] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.128677] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.133687] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.138675] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.143676] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.158703] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.163725] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.168641] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.173719] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.178710] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.193680] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.198650] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.203654] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.208687] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.213620] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.228630] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.233631] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.238621] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.243616] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   60.248617] usb 1-6.4: 1:1: cannot set freq 48000 to ep 0x82
[   62.015197] kauditd_printk_skb: 16 callbacks suppressed
[   62.015200] audit: type=3D1130 audit(1564907636.286:314): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dbolt comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=
=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   62.400998] audit: type=3D1130 audit(1564907636.672:315): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dfwupd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=
=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   66.197660] audit: type=3D1130 audit(1564907640.469:316): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dflatpak-system-helper comm=3D"systemd" exe=3D"/usr/lib/systemd/s=
ystemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   70.703422] logitech-hidpp-device 0003:046D:404A.0008: HID++ 4.5 device =
connected.
[   70.913424] logitech-hidpp-device 0003:046D:404A.0008: multiplier =3D 8
[   73.595087] audit: type=3D1131 audit(1564907647.866:317): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Duser@42 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostna=
me=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   73.603120] audit: type=3D1131 audit(1564907647.874:318): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Duser-runtime-dir@42 comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   77.324130] audit: type=3D1131 audit(1564907651.595:319): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Drealmd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostnam=
e=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   79.260678] audit: type=3D1131 audit(1564907653.533:320): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dfprintd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostna=
me=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   85.296171] audit: type=3D1131 audit(1564907659.568:321): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-localed comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   85.331321] audit: type=3D1131 audit(1564907659.603:322): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-hostnamed comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[  137.836241] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[  137.901648] usb 1-6.1.3: reset high-speed USB device number 15 using xhc=
i_hcd
[  137.901654] usb 1-6.1.3: hub failed to enable device, error -22
[  138.756429] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[  139.612212] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[  139.614700] usb 1-6.1.3: USB disconnect, device number 15
[  140.532416] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[  141.439528] usb 1-6.1.3: new high-speed USB device number 17 using xhci_=
hcd
[  141.525510] usb 1-6.1.3: New USB device found, idVendor=3D0bda, idProduc=
t=3D0150, bcdDevice=3D57.13
[  141.525517] usb 1-6.1.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[  141.525520] usb 1-6.1.3: Product: USB2.0-CRW
[  141.525522] usb 1-6.1.3: Manufacturer: Generic
[  141.525525] usb 1-6.1.3: SerialNumber: 20120926571200000
[  141.530523] usb-storage 1-6.1.3:1.0: USB Mass Storage device detected
[  141.531360] scsi host3: usb-storage 1-6.1.3:1.0
[  141.889130] usb 1-6.1.3: USB disconnect, device number 17
[  142.852480] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[  142.917557] usb 1-6.1.3: new high-speed USB device number 19 using xhci_=
hcd
[  143.402453] usb 1-6.1.3: device descriptor read/64, error -71
[  143.595563] usb 1-6.1.3: New USB device found, idVendor=3D0bda, idProduc=
t=3D0150, bcdDevice=3D57.13
[  143.595568] usb 1-6.1.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[  143.595571] usb 1-6.1.3: Product: USB2.0-CRW
[  143.595574] usb 1-6.1.3: Manufacturer: Generic
[  143.595576] usb 1-6.1.3: SerialNumber: 20120926571200000
[  143.600768] usb-storage 1-6.1.3:1.0: USB Mass Storage device detected
[  143.601235] scsi host3: usb-storage 1-6.1.3:1.0
[  144.193008] usb 1-6.1.3: USB disconnect, device number 19
[  144.377591] usb 1-6.1.3: new high-speed USB device number 20 using xhci_=
hcd
[  145.220575] usb 1-6.1-port3: Cannot enable. Maybe the USB cable is bad?
[  145.285552] usb 1-6.1.3: new high-speed USB device number 21 using xhci_=
hcd
[  145.371589] usb 1-6.1.3: New USB device found, idVendor=3D0bda, idProduc=
t=3D0150, bcdDevice=3D57.13
[  145.371594] usb 1-6.1.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[  145.371597] usb 1-6.1.3: Product: USB2.0-CRW
[  145.371600] usb 1-6.1.3: Manufacturer: Generic
[  145.371602] usb 1-6.1.3: SerialNumber: 20120926571200000
[  145.379583] usb-storage 1-6.1.3:1.0: USB Mass Storage device detected
[  145.380044] scsi host3: usb-storage 1-6.1.3:1.0
[  146.405904] scsi 3:0:0:0: Direct-Access     Generic- Multi-Card       1.=
00 PQ: 0 ANSI: 4
[  146.406525] sd 3:0:0:0: Attached scsi generic sg1 type 0
[  146.411230] sd 3:0:0:0: [sda] Attached SCSI removable disk
[  606.391121] audit: type=3D1130 audit(1564908180.657:323): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddnf-makecache comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[  606.391127] audit: type=3D1131 audit(1564908180.657:324): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddnf-makecache comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[  716.339304] audit: type=3D1131 audit(1564908290.603:325): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dpackagekit comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hos=
tname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[  793.202494] audit: type=3D1130 audit(1564908367.465:326): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dpackagekit comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hos=
tname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[  913.337768] audit: type=3D1130 audit(1564908487.598:327): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-tmpfiles-clean comm=3D"systemd" exe=3D"/usr/lib/systemd/=
systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[  913.337774] audit: type=3D1131 audit(1564908487.598:328): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-tmpfiles-clean comm=3D"systemd" exe=3D"/usr/lib/systemd/=
systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 1098.330605] audit: type=3D1131 audit(1564908672.589:329): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dpackagekit comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hos=
tname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 1395.388587] audit: type=3D1131 audit(1564908969.644:330): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dflatpak-system-helper comm=3D"systemd" exe=3D"/usr/lib/systemd/s=
ystemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 3615.364776] audit: type=3D1131 audit(1564911189.598:331): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dlvm2-lvmetad comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" h=
ostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 4213.486136] audit: type=3D1130 audit(1564911787.713:332): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddnf-makecache comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 4213.486137] audit: type=3D1131 audit(1564911787.713:333): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddnf-makecache comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 6921.421471] logitech-hidpp-device 0003:046D:404A.0008: multiplier =3D 8
[ 6922.145743] audit: type=3D1130 audit(1564914496.338:334): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dfprintd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostna=
me=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 6925.830250] audit: type=3D1100 audit(1564914500.023:335): pid=3D6228 uid=
=3D0 auid=3D1000 ses=3D2 subj=3Dsystem_u:system_r:xdm_t:s0-s0:c0.c1023 msg=
=3D'op=3DPAM:authentication grantors=3Dpam_succeed_if,pam_localuser,pam_uni=
x,pam_gnome_keyring acct=3D"atticdweller" exe=3D"/usr/libexec/gdm-session-w=
orker" hostname=3Dattic addr=3D? terminal=3D/dev/tty2 res=3Dsuccess'
[ 6925.852042] audit: type=3D1101 audit(1564914500.045:336): pid=3D6228 uid=
=3D0 auid=3D1000 ses=3D2 subj=3Dsystem_u:system_r:xdm_t:s0-s0:c0.c1023 msg=
=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_localuser acct=3D"atticdwel=
ler" exe=3D"/usr/libexec/gdm-session-worker" hostname=3Dattic addr=3D? term=
inal=3D/dev/tty2 res=3Dsuccess'
[ 6925.853260] audit: type=3D1110 audit(1564914500.046:337): pid=3D6228 uid=
=3D0 auid=3D1000 ses=3D2 subj=3Dsystem_u:system_r:xdm_t:s0-s0:c0.c1023 msg=
=3D'op=3DPAM:setcred grantors=3Dpam_localuser,pam_unix,pam_gnome_keyring ac=
ct=3D"atticdweller" exe=3D"/usr/libexec/gdm-session-worker" hostname=3Datti=
c addr=3D? terminal=3D/dev/tty2 res=3Dsuccess'
[ 6952.347078] audit: type=3D1131 audit(1564914526.539:338): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dfprintd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostna=
me=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 7815.502995] audit: type=3D1130 audit(1564915389.685:339): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddnf-makecache comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 7815.502997] audit: type=3D1131 audit(1564915389.685:340): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddnf-makecache comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 7993.367973] audit: type=3D1131 audit(1564915567.547:341): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dfwupd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=
=3D? addr=3D? terminal=3D? res=3Dsuccess'
[ 8034.950322] audit: type=3D1130 audit(1564915609.129:342): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-hostnamed comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
=

--=-v/Vu7JncjaR3ugxv30an
Content-Type: text/plain
Content-Disposition: attachment; filename=lsusb-all.txt

/:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 2: Dev 2, If 0, Class=Audio, Driver=snd-usb-audio, 12M
        ID 08bb:2704 Texas Instruments PCM2704 16-bit stereo audio DAC
    |__ Port 2: Dev 2, If 1, Class=Audio, Driver=snd-usb-audio, 12M
        ID 08bb:2704 Texas Instruments PCM2704 16-bit stereo audio DAC
    |__ Port 2: Dev 2, If 2, Class=Human Interface Device, Driver=usbhid, 12M
        ID 08bb:2704 Texas Instruments PCM2704 16-bit stereo audio DAC
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
        ID 2109:8110 VIA Labs, Inc. Hub
    |__ Port 2: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
        ID 067b:2771 Prolific Technology, Inc. 
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 2109:2811 VIA Labs, Inc. Hub
        |__ Port 3: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid, 12M
            ID 5241:4b59  
        |__ Port 3: Dev 3, If 1, Class=Human Interface Device, Driver=usbhid, 12M
            ID 5241:4b59  
        |__ Port 3: Dev 3, If 2, Class=Human Interface Device, Driver=usbhid, 12M
            ID 5241:4b59  
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 6: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
        ID 05e3:0617 Genesys Logic, Inc. 
        |__ Port 1: Dev 3, If 0, Class=Hub, Driver=hub/4p, 5000M
            ID 05e3:0617 Genesys Logic, Inc. 
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 4: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M
        ID 046d:c52b Logitech, Inc. Unifying Receiver
    |__ Port 4: Dev 2, If 2, Class=Human Interface Device, Driver=usbhid, 12M
        ID 046d:c52b Logitech, Inc. Unifying Receiver
    |__ Port 4: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
        ID 046d:c52b Logitech, Inc. Unifying Receiver
    |__ Port 6: Dev 3, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 05e3:0610 Genesys Logic, Inc. 4-port hub
        |__ Port 4: Dev 6, If 1, Class=Audio, Driver=snd-usb-audio, 12M
            ID 19f7:000a RODE Microphones 
        |__ Port 4: Dev 6, If 2, Class=Audio, Driver=snd-usb-audio, 12M
            ID 19f7:000a RODE Microphones 
        |__ Port 4: Dev 6, If 0, Class=Audio, Driver=snd-usb-audio, 12M
            ID 19f7:000a RODE Microphones 
        |__ Port 4: Dev 6, If 3, Class=Human Interface Device, Driver=usbhid, 12M
            ID 19f7:000a RODE Microphones 
        |__ Port 1: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
            ID 05e3:0610 Genesys Logic, Inc. 4-port hub
            |__ Port 1: Dev 7, If 3, Class=Video, Driver=uvcvideo, 480M
                ID 046d:0826 Logitech, Inc. HD Webcam C525
            |__ Port 1: Dev 7, If 1, Class=Audio, Driver=snd-usb-audio, 480M
                ID 046d:0826 Logitech, Inc. HD Webcam C525
            |__ Port 1: Dev 7, If 2, Class=Video, Driver=uvcvideo, 480M
                ID 046d:0826 Logitech, Inc. HD Webcam C525
            |__ Port 1: Dev 7, If 0, Class=Audio, Driver=snd-usb-audio, 480M
                ID 046d:0826 Logitech, Inc. HD Webcam C525
            |__ Port 4: Dev 9, If 0, Class=Human Interface Device, Driver=usbhid, 12M
                ID 054c:0bb5 Sony Corp. Headset MDR-1000X
            |__ Port 3: Dev 21, If 0, Class=Mass Storage, Driver=usb-storage, 480M
                ID 0bda:0150 Realtek Semiconductor Corp. 
    |__ Port 7: Dev 4, If 0, Class=Vendor Specific Class, Driver=btusb, 12M
        ID 0b05:180a ASUSTek Computer, Inc. Broadcom BCM20702 Single-Chip Bluetooth 4.0 + LE
    |__ Port 7: Dev 4, If 1, Class=Vendor Specific Class, Driver=btusb, 12M
        ID 0b05:180a ASUSTek Computer, Inc. Broadcom BCM20702 Single-Chip Bluetooth 4.0 + LE
    |__ Port 7: Dev 4, If 2, Class=Vendor Specific Class, Driver=btusb, 12M
        ID 0b05:180a ASUSTek Computer, Inc. Broadcom BCM20702 Single-Chip Bluetooth 4.0 + LE
    |__ Port 7: Dev 4, If 3, Class=Application Specific Interface, Driver=, 12M
        ID 0b05:180a ASUSTek Computer, Inc. Broadcom BCM20702 Single-Chip Bluetooth 4.0 + LE

--=-v/Vu7JncjaR3ugxv30an
Content-Type: text/plain
Content-Disposition: attachment; filename=lsmod.txt

Module                  Size  Used by
fuse                  135168  7
rfcomm                 90112  4
xt_CHECKSUM            16384  1
tun                    57344  1
ipt_MASQUERADE         20480  4
xt_addrtype            16384  2
br_netfilter           28672  0
bridge                204800  1 br_netfilter
stp                    16384  1 bridge
llc                    16384  2 bridge,stp
nf_conntrack_netbios_ns    16384  1
nf_conntrack_broadcast    16384  1 nf_conntrack_netbios_ns
xt_CT                  16384  1
ip6t_rpfilter          16384  1
ip6t_REJECT            16384  2
nf_reject_ipv6         20480  1 ip6t_REJECT
ipt_REJECT             16384  4
nf_reject_ipv4         16384  1 ipt_REJECT
xt_conntrack           16384  23
ebtable_nat            16384  1
ip6table_nat           16384  1
ip6table_mangle        16384  1
ip6table_raw           16384  1
ip6table_security      16384  1
iptable_nat            16384  1
nf_nat                 49152  3 ip6table_nat,ipt_MASQUERADE,iptable_nat
iptable_mangle         16384  1
iptable_raw            16384  1
iptable_security       16384  1
nf_conntrack          151552  6 xt_conntrack,nf_nat,ipt_MASQUERADE,nf_conntrack_netbios_ns,nf_conntrack_broadcast,xt_CT
nf_defrag_ipv6         24576  1 nf_conntrack
nf_defrag_ipv4         16384  1 nf_conntrack
libcrc32c              16384  2 nf_conntrack,nf_nat
ip_set                 53248  0
nfnetlink              16384  1 ip_set
ebtable_filter         16384  1
ebtables               40960  2 ebtable_nat,ebtable_filter
ip6table_filter        16384  1
ip6_tables             32768  7 ip6table_filter,ip6table_raw,ip6table_nat,ip6table_mangle,ip6table_security
iptable_filter         16384  1
ip_tables              32768  5 iptable_filter,iptable_security,iptable_raw,iptable_nat,iptable_mangle
cmac                   16384  1
overlay               135168  0
bnep                   28672  2
sunrpc                450560  1
vfat                   20480  1
fat                    86016  1 vfat
mei_hdcp               24576  0
b43                   454656  0
cordic                 16384  1 b43
mac80211              966656  1 b43
btusb                  57344  0
btrtl                  20480  1 btusb
btbcm                  16384  1 btusb
nvidia_drm             57344  5
btintel                28672  1 btusb
nvidia_modeset       1114112  13 nvidia_drm
bluetooth             622592  31 btrtl,btintel,btbcm,bnep,btusb,rfcomm
nvidia_uvm            966656  0
cfg80211              815104  2 b43,mac80211
ecdh_generic           24576  2 bluetooth
ssb                    98304  1 b43
iTCO_wdt               16384  0
iTCO_vendor_support    16384  1 iTCO_wdt
mmc_core              180224  2 b43,ssb
snd_hda_codec_hdmi     65536  1
intel_rapl             28672  0
x86_pkg_temp_thermal    20480  0
intel_powerclamp       20480  0
coretemp               20480  0
kvm_intel             307200  0
kvm                   749568  1 kvm_intel
irqbypass              16384  1 kvm
eeepc_wmi              16384  0
asus_wmi               32768  1 eeepc_wmi
crct10dif_pclmul       16384  1
joydev                 28672  0
uvcvideo              114688  0
sparse_keymap          16384  1 asus_wmi
crc32_pclmul           16384  0
rfkill                 28672  7 asus_wmi,bluetooth,cfg80211
intel_wmi_thunderbolt    20480  0
videobuf2_vmalloc      20480  1 uvcvideo
wmi_bmof               16384  0
videobuf2_memops       20480  1 videobuf2_vmalloc
ghash_clmulni_intel    16384  0
videobuf2_v4l2         28672  1 uvcvideo
videobuf2_common       57344  2 videobuf2_v4l2,uvcvideo
intel_cstate           16384  0
intel_uncore          135168  0
videodev              233472  3 videobuf2_v4l2,uvcvideo,videobuf2_common
intel_rapl_perf        16384  0
snd_hda_codec_realtek   126976  1
snd_hda_codec_generic    90112  1 snd_hda_codec_realtek
ledtrig_audio          16384  2 snd_hda_codec_generic,snd_hda_codec_realtek
media                  61440  4 videodev,videobuf2_v4l2,uvcvideo,videobuf2_common
nvidia              18833408  600 nvidia_uvm,nvidia_modeset
snd_usb_audio         270336  7
snd_hda_intel          49152  7
snd_hda_codec         155648  4 snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec_realtek
snd_hda_core          102400  5 snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek
snd_usbmidi_lib        40960  1 snd_usb_audio
snd_hwdep              16384  2 snd_usb_audio,snd_hda_codec
snd_seq                86016  0
snd_rawmidi            45056  1 snd_usbmidi_lib
drm_kms_helper        217088  1 nvidia_drm
snd_seq_device         16384  2 snd_seq,snd_rawmidi
snd_pcm               118784  5 snd_hda_codec_hdmi,snd_hda_intel,snd_usb_audio,snd_hda_codec,snd_hda_core
i2c_i801               32768  0
drm                   503808  8 drm_kms_helper,nvidia_drm
bcma                   65536  1 b43
snd_timer              40960  2 snd_seq,snd_pcm
snd                    94208  41 snd_hda_codec_generic,snd_seq,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_usb_audio,snd_usbmidi_lib,snd_hda_codec,snd_hda_codec_realtek,snd_timer,snd_pcm,snd_rawmidi
mei_me                 45056  1
ipmi_devintf           20480  0
soundcore              16384  1 snd
mei                   126976  3 mei_hdcp,mei_me
ipmi_msghandler        73728  2 ipmi_devintf,nvidia
pcc_cpufreq            20480  0
acpi_pad               40960  0
hid_logitech_hidpp     49152  0
hid_logitech_dj        24576  0
mxm_wmi                16384  0
e1000e                286720  0
igb                   249856  0
crc32c_intel           24576  7
nvme                   49152  4
serio_raw              20480  0
dca                    16384  1 igb
nvme_core              98304  7 nvme
i2c_algo_bit           16384  1 igb
wmi                    36864  4 intel_wmi_thunderbolt,asus_wmi,wmi_bmof,mxm_wmi
video                  49152  1 asus_wmi
uas                    28672  0
usb_storage            77824  1 uas

--=-v/Vu7JncjaR3ugxv30an
Content-Type: text/plain
Content-Disposition: attachment; filename=usb-device-info.txt


Bus 001 Device 006: ID 19f7:000a RODE Microphones USB Receiver
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        16
  idVendor           0x19f7 RODE Microphones
  idProduct          0x000a 
  bcdDevice            1.23
  iManufacturer           1 
  iProduct                2 
  iSerial                 3 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00fb
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass          1 Audio
      bFunctionSubClass       1 Control Device
      bFunctionProtocol       0 
      iFunction               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              0 
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x003e
        bInCollection           2
        baInterfaceNr(0)        1
        baInterfaceNr(1)        2
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0603 Line Connector
        bAssocTerminal          0
        bNrChannels             1
        wChannelConfig     0x0004
          Center Front (C)
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               1
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 4
        bSourceID               3
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        bmaControls(2)       0x00
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             5
        wTerminalType      0x0603 Line Connector
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0002  1x 2 bytes
        bInterval              32
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                20
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            4 Discrete
        tSamFreq[ 0]        44100
        tSamFreq[ 1]        48000
        tSamFreq[ 2]        88200
        tSamFreq[ 3]        96000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0123  1x 291 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                20
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            4 Discrete
        tSamFreq[ 0]        44100
        tSamFreq[ 1]        48000
        tSamFreq[ 2]        88200
        tSamFreq[ 3]        96000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0246  1x 582 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress         132
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes           17
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Feedback
        wMaxPacketSize     0x0003  1x 3 bytes
        bInterval               1
        bRefresh                5
        bSynchAddress           0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      26
         Report Descriptors: 
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval              32

--=-v/Vu7JncjaR3ugxv30an--

--=-9qQy6kMsJjANstjnt41w--

