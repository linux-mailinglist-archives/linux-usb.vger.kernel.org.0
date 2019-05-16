Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC81C20850
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 15:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfEPNh0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 09:37:26 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:37013 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfEPNh0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 09:37:26 -0400
Received: by mail-wr1-f42.google.com with SMTP id e15so3453323wrs.4
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2019 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language;
        bh=xe0lyMdLLthcHCZs6YsmrnG8gGw9XYCvXKD3D8KzOrw=;
        b=XYSXKhnMjEU4WI9uPn+6MUZg/HNaChMmxWkQ9rds/qmBZ+CulHU9aj+Fl9LO4POkkQ
         IGV8WK9xSQI0j1swIADzmg+ha1r+q5hTTtPFfFiw2cjDa9qWycUKPbeDiIzjz+m3KqKc
         HeL1Wm4OuQgTHSvPDqZ94mKZG0hACSz0Hey271olnKQedAi4x2fN/uVChrKL3CJcZ5sa
         ud+Dn3gUyvequqyjVHWJ/qAluJxX0vOMia8EOJr5B3k6ORfTg+EAfobWV/36unIz3Uvo
         CkC92Ta7QR711uShQWhwmdi/j6+qXUhKl/IgANRZa3v93d5gfTUY2WxwvN7qEPwbmerI
         CX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-language;
        bh=xe0lyMdLLthcHCZs6YsmrnG8gGw9XYCvXKD3D8KzOrw=;
        b=sWZXF5aVeNTzz6B4Mjs8J8T0sY6j0WBHOk5NB+iEZFhFtolffOLlKSHrenXkL+PmM3
         YQMB+Fw1Uiuh8du5uel/GWMPBTnxt8uYIaH8+7OwkZMGAWz2rDmusA+Gj6ReGkHwUYOV
         ULuLI3eZGJLxuOP+JS5NKJKCHfKEH87Bri3JUJ9ATw0DdK+7+cw6LMkwLDkd03lhz63M
         2o7M3y/7joU66RqxSm1tYnqEb2ntYkPA4RhdeToaFlYcQH4VGr3QxCkxWXIS5P00w9AY
         cSHUqbSvBN+CnRSYOSIdL9/CMfHQUZEszA8kSZ/59nhU4DuDmrVOJUhKRF7fYN5iBewi
         ne4g==
X-Gm-Message-State: APjAAAUClQVkS64wwZwImUXW4x7UC6S4fVJBwEg8NEdtfrjPsPoN+ISJ
        o0qLrD38/UDmrev4+0Y0D7bypodIXNo=
X-Google-Smtp-Source: APXvYqywVI55uF+9e165vhI+zfBQ9Bey3mpuJ+ud/2v2PNdIfEjmQRMY0wWnJeOYR81da6mwQfLDCw==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr15405014wrm.193.1558013837967;
        Thu, 16 May 2019 06:37:17 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id i17sm5963100wrr.46.2019.05.16.06.37.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 06:37:16 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Kernel crash with FTDI FT232R on AMD boards.
To:     linux-usb@vger.kernel.org
Message-ID: <11678333-2e1a-8c0f-109f-a1aefa54ef9a@gmail.com>
Date:   Thu, 16 May 2019 15:35:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F1C1EF1AC47912FA9FC3959B"
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------F1C1EF1AC47912FA9FC3959B
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
when I try to read EEPROM memory from FT232R chip (USB to serial 
converter), system crash after a seconds.

1) Configuration
ASUS PRIME A320M-K, latest bios version 4801, default settings.
Ubuntu server 19.04 with kernel 5.1.1-050101-generic: 
https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.1.1/

2) lsusboutput
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 002: ID 04f3:0103 Elan Microelectronics Corp. ActiveJet 
K-2024 Multimedia Keyboard
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 002: ID 0403:6001 Future Technology Devices 
International, Ltd FT232 Serial (UART) IC
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

3) kern.log with IOMMU disabled
https://paste.ee/p/nuCPp

4) Notes
- problem is, when FT232R is connected to USB2.0 port, when is connected 
to USB3 port, this works fine
- another test - same hardware, Debian 9.8 with kernel 4.19 - system 
crash too

-- starosta

--------------F1C1EF1AC47912FA9FC3959B
Content-Type: text/plain; charset=UTF-8;
 name="kern.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="kern.log"

May 16 15:06:45 test-ubnt kernel: [    0.000000] Linux version 5.1.1-0501=
01-generic (kernel@kathleen) (gcc version 8.3.0 (Ubuntu 8.3.0-12ubuntu1))=
 #201905110631 SMP Sat May 11 06:33:50 UTC 2019
May 16 15:06:45 test-ubnt kernel: [    0.000000] Command line: BOOT_IMAGE=
=3D/boot/vmlinuz-5.1.1-050101-generic root=3DUUID=3D91232716-4b81-4e1d-9d=
58-c2ad4d090e93 ro
May 16 15:06:45 test-ubnt kernel: [    0.000000] KERNEL supported cpus:
May 16 15:06:45 test-ubnt kernel: [    0.000000]   Intel GenuineIntel
May 16 15:06:45 test-ubnt kernel: [    0.000000]   AMD AuthenticAMD
May 16 15:06:45 test-ubnt kernel: [    0.000000]   Hygon HygonGenuine
May 16 15:06:45 test-ubnt kernel: [    0.000000]   Centaur CentaurHauls
May 16 15:06:45 test-ubnt kernel: [    0.000000] x86/fpu: Supporting XSAV=
E feature 0x001: 'x87 floating point registers'
May 16 15:06:45 test-ubnt kernel: [    0.000000] x86/fpu: Supporting XSAV=
E feature 0x002: 'SSE registers'
May 16 15:06:45 test-ubnt kernel: [    0.000000] x86/fpu: Supporting XSAV=
E feature 0x004: 'AVX registers'
May 16 15:06:45 test-ubnt kernel: [    0.000000] x86/fpu: xstate_offset[2=
]:  576, xstate_sizes[2]:  256
May 16 15:06:45 test-ubnt kernel: [    0.000000] x86/fpu: Enabled xstate =
features 0x7, context size is 832 bytes, using 'compacted' format.
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-provided physical R=
AM map:
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
0000000000-0x000000000009ffff] usable
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00000a0000-0x00000000000fffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
0000100000-0x0000000009e0ffff] usable
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
0009e10000-0x0000000009ffffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
000a000000-0x000000000a1fffff] usable
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
000a200000-0x000000000a20afff] ACPI NVS
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
000a20b000-0x000000000affffff] usable
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
000b000000-0x000000000b01ffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
000b020000-0x00000000b198bfff] usable
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00b198c000-0x00000000b19a5fff] ACPI data
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00b19a6000-0x00000000ba7f3fff] usable
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00ba7f4000-0x00000000ba8dffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00ba8e0000-0x00000000ba8ecfff] ACPI data
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00ba8ed000-0x00000000ba9eefff] usable
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00ba9ef000-0x00000000bada6fff] ACPI NVS
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00bada7000-0x00000000bbaadfff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00bbaae000-0x00000000bbb4efff] type 20
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00bbb4f000-0x00000000bdffffff] usable
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00be000000-0x00000000dfffffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00f8000000-0x00000000fbffffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fd100000-0x00000000fd1fffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fea00000-0x00000000fea0ffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00feb80000-0x00000000fec01fff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fec10000-0x00000000fec10fff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fec30000-0x00000000fec30fff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fed00000-0x00000000fed00fff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fed40000-0x00000000fed44fff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fed80000-0x00000000fed8ffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fedc2000-0x00000000fedcffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fedd4000-0x00000000fedd5fff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00fee00000-0x00000000feefffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
00ff000000-0x00000000ffffffff] reserved
May 16 15:06:45 test-ubnt kernel: [    0.000000] BIOS-e820: [mem 0x000000=
0100000000-0x000000011f33ffff] usable
May 16 15:06:45 test-ubnt kernel: [    0.000000] NX (Execute Disable) pro=
tection: active
May 16 15:06:45 test-ubnt kernel: [    0.000000] efi: EFI v2.60 by Americ=
an Megatrends
May 16 15:06:45 test-ubnt kernel: [    0.000000] efi:  ACPI 2.0=3D0xb198c=
000  ACPI=3D0xb198c000  SMBIOS=3D0xbba1c000  SMBIOS 3.0=3D0xbba1b000  ESR=
T=3D0xb813e098  MEMATTR=3D0xb7a48018=20
May 16 15:06:45 test-ubnt kernel: [    0.000000] SMBIOS 3.1.1 present.
May 16 15:06:45 test-ubnt kernel: [    0.000000] DMI: System manufacturer=
 System Product Name/PRIME A320M-K, BIOS 4801 04/25/2019
May 16 15:06:45 test-ubnt kernel: [    0.000000] tsc: Fast TSC calibratio=
n using PIT
May 16 15:06:45 test-ubnt kernel: [    0.000000] tsc: Detected 3194.106 M=
Hz processor
May 16 15:06:45 test-ubnt kernel: [    0.001256] e820: update [mem 0x0000=
0000-0x00000fff] usable =3D=3D> reserved
May 16 15:06:45 test-ubnt kernel: [    0.001257] e820: remove [mem 0x000a=
0000-0x000fffff] usable
May 16 15:06:45 test-ubnt kernel: [    0.001267] last_pfn =3D 0x11f340 ma=
x_arch_pfn =3D 0x400000000
May 16 15:06:45 test-ubnt kernel: [    0.001273] MTRR default type: uncac=
hable
May 16 15:06:45 test-ubnt kernel: [    0.001273] MTRR fixed ranges enable=
d:
May 16 15:06:45 test-ubnt kernel: [    0.001274]   00000-9FFFF write-back=

May 16 15:06:45 test-ubnt kernel: [    0.001275]   A0000-BFFFF write-thro=
ugh
May 16 15:06:45 test-ubnt kernel: [    0.001276]   C0000-FFFFF write-prot=
ect
May 16 15:06:45 test-ubnt kernel: [    0.001277] MTRR variable ranges ena=
bled:
May 16 15:06:45 test-ubnt kernel: [    0.001278]   0 base 000000000000 ma=
sk FFFF80000000 write-back
May 16 15:06:45 test-ubnt kernel: [    0.001279]   1 base 000080000000 ma=
sk FFFFC0000000 write-back
May 16 15:06:45 test-ubnt kernel: [    0.001280]   2 base 0000C0000000 ma=
sk FFFFE0000000 write-back
May 16 15:06:45 test-ubnt kernel: [    0.001280]   3 disabled
May 16 15:06:45 test-ubnt kernel: [    0.001281]   4 disabled
May 16 15:06:45 test-ubnt kernel: [    0.001281]   5 disabled
May 16 15:06:45 test-ubnt kernel: [    0.001281]   6 disabled
May 16 15:06:45 test-ubnt kernel: [    0.001282]   7 disabled
May 16 15:06:45 test-ubnt kernel: [    0.001283] TOM2: 0000000120000000 a=
ka 4608M
May 16 15:06:45 test-ubnt kernel: [    0.001800] x86/PAT: Configuration [=
0-7]: WB  WC  UC- UC  WB  WP  UC- WT =20
May 16 15:06:45 test-ubnt kernel: [    0.001959] e820: update [mem 0xe000=
0000-0xffffffff] usable =3D=3D> reserved
May 16 15:06:45 test-ubnt kernel: [    0.001976] last_pfn =3D 0xbe000 max=
_arch_pfn =3D 0x400000000
May 16 15:06:45 test-ubnt kernel: [    0.006142] esrt: Reserving ESRT spa=
ce from 0x00000000b813e098 to 0x00000000b813e0d0.
May 16 15:06:45 test-ubnt kernel: [    0.006154] check: Scanning 1 areas =
for low memory corruption
May 16 15:06:45 test-ubnt kernel: [    0.006164] Using GB pages for direc=
t mapping
May 16 15:06:45 test-ubnt kernel: [    0.006166] BRK [0x51e01000, 0x51e01=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006167] BRK [0x51e02000, 0x51e02=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006168] BRK [0x51e03000, 0x51e03=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006219] BRK [0x51e04000, 0x51e04=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006220] BRK [0x51e05000, 0x51e05=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006338] BRK [0x51e06000, 0x51e06=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006377] BRK [0x51e07000, 0x51e07=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006495] BRK [0x51e08000, 0x51e08=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006537] BRK [0x51e09000, 0x51e09=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006577] BRK [0x51e0a000, 0x51e0a=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006731] BRK [0x51e0b000, 0x51e0b=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.006857] BRK [0x51e0c000, 0x51e0c=
fff] PGTABLE
May 16 15:06:45 test-ubnt kernel: [    0.007180] Secure boot could not be=
 determined
May 16 15:06:45 test-ubnt kernel: [    0.007181] RAMDISK: [mem 0x3081d000=
-0x34405fff]
May 16 15:06:45 test-ubnt kernel: [    0.007195] ACPI: Early table checks=
um verification disabled
May 16 15:06:45 test-ubnt kernel: [    0.007199] ACPI: RSDP 0x00000000B19=
8C000 000024 (v02 ALASKA)
May 16 15:06:45 test-ubnt kernel: [    0.007202] ACPI: XSDT 0x00000000B19=
8C0A0 0000BC (v01 ALASKA A M I    01072009 AMI  00010013)
May 16 15:06:45 test-ubnt kernel: [    0.007207] ACPI: FACP 0x00000000B19=
971E8 000114 (v06 ALASKA A M I    01072009 AMI  00010013)
May 16 15:06:45 test-ubnt kernel: [    0.007212] ACPI: DSDT 0x00000000B19=
8C1F8 00AFEC (v02 ALASKA A M I    01072009 INTL 20120913)
May 16 15:06:45 test-ubnt kernel: [    0.007215] ACPI: FACS 0x00000000BAD=
8FD80 000040
May 16 15:06:45 test-ubnt kernel: [    0.007217] ACPI: APIC 0x00000000B19=
97300 00015E (v03 ALASKA A M I    01072009 AMI  00010013)
May 16 15:06:45 test-ubnt kernel: [    0.007220] ACPI: FPDT 0x00000000B19=
97460 000044 (v01 ALASKA A M I    01072009 AMI  00010013)
May 16 15:06:45 test-ubnt kernel: [    0.007223] ACPI: FIDT 0x00000000B19=
974A8 00009C (v01 ALASKA A M I    01072009 AMI  00010013)
May 16 15:06:45 test-ubnt kernel: [    0.007225] ACPI: SSDT 0x00000000B19=
97548 000060 (v02 ALASKA CPUSSDT  01072009 AMI  01072009)
May 16 15:06:45 test-ubnt kernel: [    0.007228] ACPI: SSDT 0x00000000B19=
A43D0 0010AF (v01 AMD    AmdTable 00000001 INTL 20120913)
May 16 15:06:45 test-ubnt kernel: [    0.007230] ACPI: SSDT 0x00000000B19=
97600 005419 (v02 AMD    AmdTable 00000002 MSFT 02000002)
May 16 15:06:45 test-ubnt kernel: [    0.007233] ACPI: SSDT 0x00000000B19=
9CA20 003087 (v01 AMD    AMD AOD  00000001 INTL 20120913)
May 16 15:06:45 test-ubnt kernel: [    0.007236] ACPI: MCFG 0x00000000B19=
9FAA8 00003C (v01 ALASKA A M I    01072009 MSFT 00010013)
May 16 15:06:45 test-ubnt kernel: [    0.007238] ACPI: HPET 0x00000000B19=
9FAE8 000038 (v01 ALASKA A M I    01072009 AMI  00000005)
May 16 15:06:45 test-ubnt kernel: [    0.007241] ACPI: UEFI 0x00000000B19=
9FB20 000042 (v01                 00000000      00000000)
May 16 15:06:45 test-ubnt kernel: [    0.007243] ACPI: BGRT 0x00000000B19=
9FB68 000038 (v01 ALASKA A M I    01072009 AMI  00010013)
May 16 15:06:45 test-ubnt kernel: [    0.007245] ACPI: SSDT 0x00000000B19=
9FBA0 0008E0 (v01 AMD    AMD CPU  00000001 AMD  00000001)
May 16 15:06:45 test-ubnt kernel: [    0.007248] ACPI: CRAT 0x00000000B19=
A0480 000490 (v01 AMD    AMD CRAT 00000001 AMD  00000001)
May 16 15:06:45 test-ubnt kernel: [    0.007250] ACPI: CDIT 0x00000000B19=
A0910 000029 (v01 AMD    AMD CDIT 00000001 AMD  00000001)
May 16 15:06:45 test-ubnt kernel: [    0.007253] ACPI: SSDT 0x00000000B19=
A0940 000C34 (v01 AMD    AmdTable 00000001 INTL 20120913)
May 16 15:06:45 test-ubnt kernel: [    0.007255] ACPI: SSDT 0x00000000B19=
A1578 0010AC (v01 AMD    AmdTable 00000001 INTL 20120913)
May 16 15:06:45 test-ubnt kernel: [    0.007258] ACPI: SSDT 0x00000000B19=
A2628 001CE5 (v01 AMD    AmdTable 00000001 INTL 20120913)
May 16 15:06:45 test-ubnt kernel: [    0.007260] ACPI: SSDT 0x00000000B19=
A4310 0000BF (v01 AMD    AMD PT   00001000 INTL 20120913)
May 16 15:06:45 test-ubnt kernel: [    0.007267] ACPI: Local APIC address=
 0xfee00000
May 16 15:06:45 test-ubnt kernel: [    0.007399] No NUMA configuration fo=
und
May 16 15:06:45 test-ubnt kernel: [    0.007400] Faking a node at [mem 0x=
0000000000000000-0x000000011f33ffff]
May 16 15:06:45 test-ubnt kernel: [    0.007407] NODE_DATA(0) allocated [=
mem 0x11f315000-0x11f33ffff]
May 16 15:06:45 test-ubnt kernel: [    0.007601] Zone ranges:
May 16 15:06:45 test-ubnt kernel: [    0.007602]   DMA      [mem 0x000000=
0000001000-0x0000000000ffffff]
May 16 15:06:45 test-ubnt kernel: [    0.007603]   DMA32    [mem 0x000000=
0001000000-0x00000000ffffffff]
May 16 15:06:45 test-ubnt kernel: [    0.007604]   Normal   [mem 0x000000=
0100000000-0x000000011f33ffff]
May 16 15:06:45 test-ubnt kernel: [    0.007605]   Device   empty
May 16 15:06:45 test-ubnt kernel: [    0.007606] Movable zone start for e=
ach node
May 16 15:06:45 test-ubnt kernel: [    0.007609] Early memory node ranges=

May 16 15:06:45 test-ubnt kernel: [    0.007610]   node   0: [mem 0x00000=
00000001000-0x000000000009ffff]
May 16 15:06:45 test-ubnt kernel: [    0.007611]   node   0: [mem 0x00000=
00000100000-0x0000000009e0ffff]
May 16 15:06:45 test-ubnt kernel: [    0.007612]   node   0: [mem 0x00000=
0000a000000-0x000000000a1fffff]
May 16 15:06:45 test-ubnt kernel: [    0.007612]   node   0: [mem 0x00000=
0000a20b000-0x000000000affffff]
May 16 15:06:45 test-ubnt kernel: [    0.007613]   node   0: [mem 0x00000=
0000b020000-0x00000000b198bfff]
May 16 15:06:45 test-ubnt kernel: [    0.007614]   node   0: [mem 0x00000=
000b19a6000-0x00000000ba7f3fff]
May 16 15:06:45 test-ubnt kernel: [    0.007615]   node   0: [mem 0x00000=
000ba8ed000-0x00000000ba9eefff]
May 16 15:06:45 test-ubnt kernel: [    0.007615]   node   0: [mem 0x00000=
000bbb4f000-0x00000000bdffffff]
May 16 15:06:45 test-ubnt kernel: [    0.007616]   node   0: [mem 0x00000=
00100000000-0x000000011f33ffff]
May 16 15:06:45 test-ubnt kernel: [    0.007787] Zeroed struct page in un=
available ranges: 13551 pages
May 16 15:06:45 test-ubnt kernel: [    0.007788] Initmem setup node 0 [me=
m 0x0000000000001000-0x000000011f33ffff]
May 16 15:06:45 test-ubnt kernel: [    0.007790] On node 0 totalpages: 90=
0689
May 16 15:06:45 test-ubnt kernel: [    0.007791]   DMA zone: 64 pages use=
d for memmap
May 16 15:06:45 test-ubnt kernel: [    0.007791]   DMA zone: 28 pages res=
erved
May 16 15:06:45 test-ubnt kernel: [    0.007792]   DMA zone: 3999 pages, =
LIFO batch:0
May 16 15:06:45 test-ubnt kernel: [    0.007886]   DMA32 zone: 12014 page=
s used for memmap
May 16 15:06:45 test-ubnt kernel: [    0.007886]   DMA32 zone: 768882 pag=
es, LIFO batch:63
May 16 15:06:45 test-ubnt kernel: [    0.026486]   Normal zone: 1997 page=
s used for memmap
May 16 15:06:45 test-ubnt kernel: [    0.026488]   Normal zone: 127808 pa=
ges, LIFO batch:31
May 16 15:06:45 test-ubnt kernel: [    0.029606] ACPI: PM-Timer IO Port: =
0x808
May 16 15:06:45 test-ubnt kernel: [    0.029610] ACPI: Local APIC address=
 0xfee00000
May 16 15:06:45 test-ubnt kernel: [    0.029618] ACPI: LAPIC_NMI (acpi_id=
[0xff] high edge lint[0x1])
May 16 15:06:45 test-ubnt kernel: [    0.029637] IOAPIC[0]: apic_id 5, ve=
rsion 33, address 0xfec00000, GSI 0-23
May 16 15:06:45 test-ubnt kernel: [    0.029648] IOAPIC[1]: apic_id 6, ve=
rsion 33, address 0xfec01000, GSI 24-55
May 16 15:06:45 test-ubnt kernel: [    0.029650] ACPI: INT_SRC_OVR (bus 0=
 bus_irq 0 global_irq 2 dfl dfl)
May 16 15:06:45 test-ubnt kernel: [    0.029652] ACPI: INT_SRC_OVR (bus 0=
 bus_irq 9 global_irq 9 low level)
May 16 15:06:45 test-ubnt kernel: [    0.029653] ACPI: IRQ0 used by overr=
ide.
May 16 15:06:45 test-ubnt kernel: [    0.029654] ACPI: IRQ9 used by overr=
ide.
May 16 15:06:45 test-ubnt kernel: [    0.029656] Using ACPI (MADT) for SM=
P configuration information
May 16 15:06:45 test-ubnt kernel: [    0.029658] ACPI: HPET id: 0x1022820=
1 base: 0xfed00000
May 16 15:06:45 test-ubnt kernel: [    0.029667] smpboot: Allowing 32 CPU=
s, 28 hotplug CPUs
May 16 15:06:45 test-ubnt kernel: [    0.029704] PM: Registered nosave me=
mory: [mem 0x00000000-0x00000fff]
May 16 15:06:45 test-ubnt kernel: [    0.029706] PM: Registered nosave me=
mory: [mem 0x000a0000-0x000fffff]
May 16 15:06:45 test-ubnt kernel: [    0.029708] PM: Registered nosave me=
mory: [mem 0x09e10000-0x09ffffff]
May 16 15:06:45 test-ubnt kernel: [    0.029709] PM: Registered nosave me=
mory: [mem 0x0a200000-0x0a20afff]
May 16 15:06:45 test-ubnt kernel: [    0.029711] PM: Registered nosave me=
mory: [mem 0x0b000000-0x0b01ffff]
May 16 15:06:45 test-ubnt kernel: [    0.029713] PM: Registered nosave me=
mory: [mem 0xb198c000-0xb19a5fff]
May 16 15:06:45 test-ubnt kernel: [    0.029714] PM: Registered nosave me=
mory: [mem 0xba7f4000-0xba8dffff]
May 16 15:06:45 test-ubnt kernel: [    0.029715] PM: Registered nosave me=
mory: [mem 0xba8e0000-0xba8ecfff]
May 16 15:06:45 test-ubnt kernel: [    0.029717] PM: Registered nosave me=
mory: [mem 0xba9ef000-0xbada6fff]
May 16 15:06:45 test-ubnt kernel: [    0.029718] PM: Registered nosave me=
mory: [mem 0xbada7000-0xbbaadfff]
May 16 15:06:45 test-ubnt kernel: [    0.029718] PM: Registered nosave me=
mory: [mem 0xbbaae000-0xbbb4efff]
May 16 15:06:45 test-ubnt kernel: [    0.029720] PM: Registered nosave me=
mory: [mem 0xbe000000-0xdfffffff]
May 16 15:06:45 test-ubnt kernel: [    0.029721] PM: Registered nosave me=
mory: [mem 0xe0000000-0xf7ffffff]
May 16 15:06:45 test-ubnt kernel: [    0.029721] PM: Registered nosave me=
mory: [mem 0xf8000000-0xfbffffff]
May 16 15:06:45 test-ubnt kernel: [    0.029722] PM: Registered nosave me=
mory: [mem 0xfc000000-0xfd0fffff]
May 16 15:06:45 test-ubnt kernel: [    0.029723] PM: Registered nosave me=
mory: [mem 0xfd100000-0xfd1fffff]
May 16 15:06:45 test-ubnt kernel: [    0.029723] PM: Registered nosave me=
mory: [mem 0xfd200000-0xfe9fffff]
May 16 15:06:45 test-ubnt kernel: [    0.029724] PM: Registered nosave me=
mory: [mem 0xfea00000-0xfea0ffff]
May 16 15:06:45 test-ubnt kernel: [    0.029725] PM: Registered nosave me=
mory: [mem 0xfea10000-0xfeb7ffff]
May 16 15:06:45 test-ubnt kernel: [    0.029725] PM: Registered nosave me=
mory: [mem 0xfeb80000-0xfec01fff]
May 16 15:06:45 test-ubnt kernel: [    0.029726] PM: Registered nosave me=
mory: [mem 0xfec02000-0xfec0ffff]
May 16 15:06:45 test-ubnt kernel: [    0.029727] PM: Registered nosave me=
mory: [mem 0xfec10000-0xfec10fff]
May 16 15:06:45 test-ubnt kernel: [    0.029727] PM: Registered nosave me=
mory: [mem 0xfec11000-0xfec2ffff]
May 16 15:06:45 test-ubnt kernel: [    0.029728] PM: Registered nosave me=
mory: [mem 0xfec30000-0xfec30fff]
May 16 15:06:45 test-ubnt kernel: [    0.029729] PM: Registered nosave me=
mory: [mem 0xfec31000-0xfecfffff]
May 16 15:06:45 test-ubnt kernel: [    0.029729] PM: Registered nosave me=
mory: [mem 0xfed00000-0xfed00fff]
May 16 15:06:45 test-ubnt kernel: [    0.029730] PM: Registered nosave me=
mory: [mem 0xfed01000-0xfed3ffff]
May 16 15:06:45 test-ubnt kernel: [    0.029731] PM: Registered nosave me=
mory: [mem 0xfed40000-0xfed44fff]
May 16 15:06:45 test-ubnt kernel: [    0.029731] PM: Registered nosave me=
mory: [mem 0xfed45000-0xfed7ffff]
May 16 15:06:45 test-ubnt kernel: [    0.029732] PM: Registered nosave me=
mory: [mem 0xfed80000-0xfed8ffff]
May 16 15:06:45 test-ubnt kernel: [    0.029733] PM: Registered nosave me=
mory: [mem 0xfed90000-0xfedc1fff]
May 16 15:06:45 test-ubnt kernel: [    0.029733] PM: Registered nosave me=
mory: [mem 0xfedc2000-0xfedcffff]
May 16 15:06:45 test-ubnt kernel: [    0.029734] PM: Registered nosave me=
mory: [mem 0xfedd0000-0xfedd3fff]
May 16 15:06:45 test-ubnt kernel: [    0.029735] PM: Registered nosave me=
mory: [mem 0xfedd4000-0xfedd5fff]
May 16 15:06:45 test-ubnt kernel: [    0.029735] PM: Registered nosave me=
mory: [mem 0xfedd6000-0xfedfffff]
May 16 15:06:45 test-ubnt kernel: [    0.029736] PM: Registered nosave me=
mory: [mem 0xfee00000-0xfeefffff]
May 16 15:06:45 test-ubnt kernel: [    0.029737] PM: Registered nosave me=
mory: [mem 0xfef00000-0xfeffffff]
May 16 15:06:45 test-ubnt kernel: [    0.029737] PM: Registered nosave me=
mory: [mem 0xff000000-0xffffffff]
May 16 15:06:45 test-ubnt kernel: [    0.029739] [mem 0xe0000000-0xf7ffff=
ff] available for PCI devices
May 16 15:06:45 test-ubnt kernel: [    0.029741] Booting paravirtualized =
kernel on bare hardware
May 16 15:06:45 test-ubnt kernel: [    0.029745] clocksource: refined-jif=
fies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211=
568 ns
May 16 15:06:45 test-ubnt kernel: [    0.029757] random: get_random_bytes=
 called from start_kernel+0x97/0x515 with crng_init=3D0
May 16 15:06:45 test-ubnt kernel: [    0.029779] setup_percpu: NR_CPUS:81=
92 nr_cpumask_bits:32 nr_cpu_ids:32 nr_node_ids:1
May 16 15:06:45 test-ubnt kernel: [    0.031981] percpu: Embedded 47 page=
s/cpu s155648 r8192 d28672 u262144
May 16 15:06:45 test-ubnt kernel: [    0.031995] pcpu-alloc: s155648 r819=
2 d28672 u262144 alloc=3D1*2097152
May 16 15:06:45 test-ubnt kernel: [    0.031996] pcpu-alloc: [0] 00 01 02=
 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15=20
May 16 15:06:45 test-ubnt kernel: [    0.031999] pcpu-alloc: [0] 16 17 18=
 19 20 21 22 23 [0] 24 25 26 27 28 29 30 31=20
May 16 15:06:45 test-ubnt kernel: [    0.032044] Built 1 zonelists, mobil=
ity grouping on.  Total pages: 886586
May 16 15:06:45 test-ubnt kernel: [    0.032045] Policy zone: Normal
May 16 15:06:45 test-ubnt kernel: [    0.032048] Kernel command line: BOO=
T_IMAGE=3D/boot/vmlinuz-5.1.1-050101-generic root=3DUUID=3D91232716-4b81-=
4e1d-9d58-c2ad4d090e93 ro
May 16 15:06:45 test-ubnt kernel: [    0.040994] Calgary: detecting Calga=
ry via BIOS EBDA area
May 16 15:06:45 test-ubnt kernel: [    0.040997] Calgary: Unable to locat=
e Rio Grande table in EBDA - bailing!
May 16 15:06:45 test-ubnt kernel: [    0.051630] Memory: 3304088K/3602756=
K available (14339K kernel code, 2357K rwdata, 4392K rodata, 2584K init, =
5172K bss, 298668K reserved, 0K cma-reserved)
May 16 15:06:45 test-ubnt kernel: [    0.052912] SLUB: HWalign=3D64, Orde=
r=3D0-3, MinObjects=3D0, CPUs=3D32, Nodes=3D1
May 16 15:06:45 test-ubnt kernel: [    0.052936] ftrace: allocating 42046=
 entries in 165 pages
May 16 15:06:45 test-ubnt kernel: [    0.067291] rcu: Hierarchical RCU im=
plementation.
May 16 15:06:45 test-ubnt kernel: [    0.067294] rcu: 	RCU restricting CP=
Us from NR_CPUS=3D8192 to nr_cpu_ids=3D32.
May 16 15:06:45 test-ubnt kernel: [    0.067295] 	Tasks RCU enabled.
May 16 15:06:45 test-ubnt kernel: [    0.067296] rcu: RCU calculated valu=
e of scheduler-enlistment delay is 25 jiffies.
May 16 15:06:45 test-ubnt kernel: [    0.067297] rcu: Adjusting geometry =
for rcu_fanout_leaf=3D16, nr_cpu_ids=3D32
May 16 15:06:45 test-ubnt kernel: [    0.070077] NR_IRQS: 524544, nr_irqs=
: 1224, preallocated irqs: 16
May 16 15:06:45 test-ubnt kernel: [    0.070389] Console: colour dummy de=
vice 80x25
May 16 15:06:45 test-ubnt kernel: [    0.070580] printk: console [tty0] e=
nabled
May 16 15:06:45 test-ubnt kernel: [    0.070642] ACPI: Core revision 2019=
0215
May 16 15:06:45 test-ubnt kernel: [    0.070992] clocksource: hpet: mask:=
 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
May 16 15:06:45 test-ubnt kernel: [    0.071023] hpet clockevent register=
ed
May 16 15:06:45 test-ubnt kernel: [    0.071030] APIC: Switch to symmetri=
c I/O mode setup
May 16 15:06:45 test-ubnt kernel: [    0.071035] Switched APIC routing to=
 physical flat.
May 16 15:06:45 test-ubnt kernel: [    0.072211] ..TIMER: vector=3D0x30 a=
pic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
May 16 15:06:45 test-ubnt kernel: [    0.091032] clocksource: tsc-early: =
mask: 0xffffffffffffffff max_cycles: 0x2e0a89b975c, max_idle_ns: 44079521=
0621 ns
May 16 15:06:45 test-ubnt kernel: [    0.091044] Calibrating delay loop (=
skipped), value calculated using timer frequency.. 6388.21 BogoMIPS (lpj=3D=
12776424)
May 16 15:06:45 test-ubnt kernel: [    0.091048] pid_max: default: 32768 =
minimum: 301
May 16 15:06:45 test-ubnt kernel: [    0.093715] LSM: Security Framework =
initializing
May 16 15:06:45 test-ubnt kernel: [    0.093760] Yama: becoming mindful.
May 16 15:06:45 test-ubnt kernel: [    0.093927] AppArmor: AppArmor initi=
alized
May 16 15:06:45 test-ubnt kernel: [    0.094759] Dentry cache hash table =
entries: 524288 (order: 10, 4194304 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.095238] Inode-cache hash table e=
ntries: 262144 (order: 9, 2097152 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.095327] Mount-cache hash table e=
ntries: 8192 (order: 4, 65536 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.095353] Mountpoint-cache hash ta=
ble entries: 8192 (order: 4, 65536 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.095761] *** VALIDATE proc ***
May 16 15:06:45 test-ubnt kernel: [    0.095852] *** VALIDATE cgroup1 ***=

May 16 15:06:45 test-ubnt kernel: [    0.095855] *** VALIDATE cgroup2 ***=

May 16 15:06:45 test-ubnt kernel: [    0.096052] mce: CPU supports 23 MCE=
 banks
May 16 15:06:45 test-ubnt kernel: [    0.096073] LVT offset 1 assigned fo=
r vector 0xf9
May 16 15:06:45 test-ubnt kernel: [    0.096116] LVT offset 2 assigned fo=
r vector 0xf4
May 16 15:06:45 test-ubnt kernel: [    0.096127] Last level iTLB entries:=
 4KB 1024, 2MB 1024, 4MB 512
May 16 15:06:45 test-ubnt kernel: [    0.096129] Last level dTLB entries:=
 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
May 16 15:06:45 test-ubnt kernel: [    0.096131] Spectre V2 : Mitigation:=
 Full AMD retpoline
May 16 15:06:45 test-ubnt kernel: [    0.096133] Spectre V2 : Spectre v2 =
/ SpectreRSB mitigation: Filling RSB on context switch
May 16 15:06:45 test-ubnt kernel: [    0.096143] Spectre V2 : mitigation:=
 Enabling conditional Indirect Branch Prediction Barrier
May 16 15:06:45 test-ubnt kernel: [    0.096145] Spectre V2 : User space:=
 Vulnerable
May 16 15:06:45 test-ubnt kernel: [    0.096147] Speculative Store Bypass=
: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
May 16 15:06:45 test-ubnt kernel: [    0.096349] Freeing SMP alternatives=
 memory: 36K
May 16 15:06:45 test-ubnt kernel: [    0.103035] smpboot: CPU0: AMD Athlo=
n 200GE with Radeon Vega Graphics (family: 0x17, model: 0x11, stepping: 0=
x0)
May 16 15:06:45 test-ubnt kernel: [    0.103035] Performance Events: Fam1=
7h core perfctr, AMD PMU driver.
May 16 15:06:45 test-ubnt kernel: [    0.103035] ... version:            =
    0
May 16 15:06:45 test-ubnt kernel: [    0.103035] ... bit width:          =
    48
May 16 15:06:45 test-ubnt kernel: [    0.103035] ... generic registers:  =
    6
May 16 15:06:45 test-ubnt kernel: [    0.103035] ... value mask:         =
    0000ffffffffffff
May 16 15:06:45 test-ubnt kernel: [    0.103035] ... max period:         =
    00007fffffffffff
May 16 15:06:45 test-ubnt kernel: [    0.103035] ... fixed-purpose events=
:   0
May 16 15:06:45 test-ubnt kernel: [    0.103035] ... event mask:         =
    000000000000003f
May 16 15:06:45 test-ubnt kernel: [    0.103035] rcu: Hierarchical SRCU i=
mplementation.
May 16 15:06:45 test-ubnt kernel: [    0.103035] random: crng done (trust=
ing CPU's manufacturer)
May 16 15:06:45 test-ubnt kernel: [    0.103035] NMI watchdog: Enabled. P=
ermanently consumes one hw-PMU counter.
May 16 15:06:45 test-ubnt kernel: [    0.103035] smp: Bringing up seconda=
ry CPUs ...
May 16 15:06:45 test-ubnt kernel: [    0.103035] x86: Booting SMP configu=
ration:
May 16 15:06:45 test-ubnt kernel: [    0.103035] .... node  #0, CPUs:    =
    #1  #2  #3
May 16 15:06:45 test-ubnt kernel: [    0.109462] smp: Brought up 1 node, =
4 CPUs
May 16 15:06:45 test-ubnt kernel: [    0.109462] smpboot: Max logical pac=
kages: 8
May 16 15:06:45 test-ubnt kernel: [    0.109462] smpboot: Total of 4 proc=
essors activated (25552.84 BogoMIPS)
May 16 15:06:45 test-ubnt kernel: [    0.111194] devtmpfs: initialized
May 16 15:06:45 test-ubnt kernel: [    0.111194] x86/mm: Memory block siz=
e: 128MB
May 16 15:06:45 test-ubnt kernel: [    0.111588] PM: Registering ACPI NVS=
 region [mem 0x0a200000-0x0a20afff] (45056 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.111588] PM: Registering ACPI NVS=
 region [mem 0xba9ef000-0xbada6fff] (3899392 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.111588] clocksource: jiffies: ma=
sk: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
May 16 15:06:45 test-ubnt kernel: [    0.111588] futex hash table entries=
: 8192 (order: 7, 524288 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.112408] pinctrl core: initialize=
d pinctrl subsystem
May 16 15:06:45 test-ubnt kernel: [    0.112544] PM: RTC time: 13:06:33, =
date: 2019-05-16
May 16 15:06:45 test-ubnt kernel: [    0.113041] NET: Registered protocol=
 family 16
May 16 15:06:45 test-ubnt kernel: [    0.113129] audit: initializing netl=
ink subsys (disabled)
May 16 15:06:45 test-ubnt kernel: [    0.113136] audit: type=3D2000 audit=
(1558011992.040:1): state=3Dinitialized audit_enabled=3D0 res=3D1
May 16 15:06:45 test-ubnt kernel: [    0.113136] EISA bus registered
May 16 15:06:45 test-ubnt kernel: [    0.113136] cpuidle: using governor =
ladder
May 16 15:06:45 test-ubnt kernel: [    0.113136] cpuidle: using governor =
menu
May 16 15:06:45 test-ubnt kernel: [    0.113136] ACPI: bus type PCI regis=
tered
May 16 15:06:45 test-ubnt kernel: [    0.113136] acpiphp: ACPI Hot Plug P=
CI Controller Driver version: 0.5
May 16 15:06:45 test-ubnt kernel: [    0.115198] PCI: MMCONFIG for domain=
 0000 [bus 00-3f] at [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
May 16 15:06:45 test-ubnt kernel: [    0.115204] PCI: MMCONFIG at [mem 0x=
f8000000-0xfbffffff] reserved in E820
May 16 15:06:45 test-ubnt kernel: [    0.115213] PCI: Using configuration=
 type 1 for base access
May 16 15:06:45 test-ubnt kernel: [    0.116522] HugeTLB registered 1.00 =
GiB page size, pre-allocated 0 pages
May 16 15:06:45 test-ubnt kernel: [    0.116522] HugeTLB registered 2.00 =
MiB page size, pre-allocated 0 pages
May 16 15:06:45 test-ubnt kernel: [    0.116522] ACPI: Added _OSI(Module =
Device)
May 16 15:06:45 test-ubnt kernel: [    0.116522] ACPI: Added _OSI(Process=
or Device)
May 16 15:06:45 test-ubnt kernel: [    0.116522] ACPI: Added _OSI(3.0 _SC=
P Extensions)
May 16 15:06:45 test-ubnt kernel: [    0.116522] ACPI: Added _OSI(Process=
or Aggregator Device)
May 16 15:06:45 test-ubnt kernel: [    0.116522] ACPI: Added _OSI(Linux-D=
ell-Video)
May 16 15:06:45 test-ubnt kernel: [    0.116522] ACPI: Added _OSI(Linux-L=
enovo-NV-HDMI-Audio)
May 16 15:06:45 test-ubnt kernel: [    0.116522] ACPI: Added _OSI(Linux-H=
PI-Hybrid-Graphics)
May 16 15:06:45 test-ubnt kernel: [    0.130301] ACPI: 10 ACPI AML tables=
 successfully acquired and loaded
May 16 15:06:45 test-ubnt kernel: [    0.132545] ACPI: [Firmware Bug]: BI=
OS _OSI(Linux) query ignored
May 16 15:06:45 test-ubnt kernel: [    0.134935] ACPI: Interpreter enable=
d
May 16 15:06:45 test-ubnt kernel: [    0.134953] ACPI: (supports S0 S3 S4=
 S5)
May 16 15:06:45 test-ubnt kernel: [    0.134954] ACPI: Using IOAPIC for i=
nterrupt routing
May 16 15:06:45 test-ubnt kernel: [    0.135388] PCI: Using host bridge w=
indows from ACPI; if necessary, use "pci=3Dnocrs" and report a bug
May 16 15:06:45 test-ubnt kernel: [    0.135813] ACPI: Enabled 3 GPEs in =
block 00 to 1F
May 16 15:06:45 test-ubnt kernel: [    0.144699] ACPI: PCI Root Bridge [P=
CI0] (domain 0000 [bus 00-ff])
May 16 15:06:45 test-ubnt kernel: [    0.144707] acpi PNP0A08:00: _OSC: O=
S supports [ExtendedConfig ASPM ClockPM Segments MSI]
May 16 15:06:45 test-ubnt kernel: [    0.144972] acpi PNP0A08:00: _OSC: p=
latform does not support [PCIeHotplug SHPCHotplug PME LTR]
May 16 15:06:45 test-ubnt kernel: [    0.145225] acpi PNP0A08:00: _OSC: O=
S now controls [AER PCIeCapability]
May 16 15:06:45 test-ubnt kernel: [    0.145241] acpi PNP0A08:00: [Firmwa=
re Info]: MMCONFIG for domain 0000 [bus 00-3f] only partially covers this=
 bridge
May 16 15:06:45 test-ubnt kernel: [    0.145661] PCI host bridge to bus 0=
000:00
May 16 15:06:45 test-ubnt kernel: [    0.145665] pci_bus 0000:00: root bu=
s resource [io  0x0000-0x03af window]
May 16 15:06:45 test-ubnt kernel: [    0.145667] pci_bus 0000:00: root bu=
s resource [io  0x03e0-0x0cf7 window]
May 16 15:06:45 test-ubnt kernel: [    0.145670] pci_bus 0000:00: root bu=
s resource [io  0x03b0-0x03df window]
May 16 15:06:45 test-ubnt kernel: [    0.145673] pci_bus 0000:00: root bu=
s resource [io  0x0d00-0xffff window]
May 16 15:06:45 test-ubnt kernel: [    0.145675] pci_bus 0000:00: root bu=
s resource [mem 0x000a0000-0x000bffff window]
May 16 15:06:45 test-ubnt kernel: [    0.145678] pci_bus 0000:00: root bu=
s resource [mem 0x000c0000-0x000dffff window]
May 16 15:06:45 test-ubnt kernel: [    0.145681] pci_bus 0000:00: root bu=
s resource [mem 0xe0000000-0xfec2ffff window]
May 16 15:06:45 test-ubnt kernel: [    0.145684] pci_bus 0000:00: root bu=
s resource [mem 0xfee00000-0xffffffff window]
May 16 15:06:45 test-ubnt kernel: [    0.145687] pci_bus 0000:00: root bu=
s resource [bus 00-ff]
May 16 15:06:45 test-ubnt kernel: [    0.145697] pci 0000:00:00.0: [1022:=
15d0] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.145854] pci 0000:00:01.0: [1022:=
1452] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.145986] pci 0000:00:01.2: [1022:=
15d3] type 01 class 0x060400
May 16 15:06:45 test-ubnt kernel: [    0.146046] pci 0000:00:01.2: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.146116] pci 0000:00:01.2: PME# s=
upported from D0 D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.146274] pci 0000:00:08.0: [1022:=
1452] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.146402] pci 0000:00:08.1: [1022:=
15db] type 01 class 0x060400
May 16 15:06:45 test-ubnt kernel: [    0.146462] pci 0000:00:08.1: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.146527] pci 0000:00:08.1: PME# s=
upported from D0 D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.146640] pci 0000:00:08.2: [1022:=
15dc] type 01 class 0x060400
May 16 15:06:45 test-ubnt kernel: [    0.146699] pci 0000:00:08.2: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.146759] pci 0000:00:08.2: PME# s=
upported from D0 D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.146909] pci 0000:00:14.0: [1022:=
790b] type 00 class 0x0c0500
May 16 15:06:45 test-ubnt kernel: [    0.147097] pci 0000:00:14.3: [1022:=
790e] type 00 class 0x060100
May 16 15:06:45 test-ubnt kernel: [    0.147327] pci 0000:00:18.0: [1022:=
15e8] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.147386] pci 0000:00:18.1: [1022:=
15e9] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.147443] pci 0000:00:18.2: [1022:=
15ea] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.147500] pci 0000:00:18.3: [1022:=
15eb] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.147565] pci 0000:00:18.4: [1022:=
15ec] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.147629] pci 0000:00:18.5: [1022:=
15ed] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.147686] pci 0000:00:18.6: [1022:=
15ee] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.147742] pci 0000:00:18.7: [1022:=
15ef] type 00 class 0x060000
May 16 15:06:45 test-ubnt kernel: [    0.147903] pci 0000:01:00.0: [1022:=
43bc] type 00 class 0x0c0330
May 16 15:06:45 test-ubnt kernel: [    0.147935] pci 0000:01:00.0: reg 0x=
10: [mem 0xfcea0000-0xfcea7fff 64bit]
May 16 15:06:45 test-ubnt kernel: [    0.147986] pci 0000:01:00.0: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.148062] pci 0000:01:00.0: PME# s=
upported from D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.148107] pci 0000:01:00.0: 15.752=
 Gb/s available PCIe bandwidth, limited by 8 GT/s x2 link at 0000:00:01.2=
 (capable of 31.504 Gb/s with 8 GT/s x4 link)
May 16 15:06:45 test-ubnt kernel: [    0.148174] pci 0000:01:00.1: [1022:=
43b8] type 00 class 0x010601
May 16 15:06:45 test-ubnt kernel: [    0.148239] pci 0000:01:00.1: reg 0x=
24: [mem 0xfce80000-0xfce9ffff]
May 16 15:06:45 test-ubnt kernel: [    0.148249] pci 0000:01:00.1: reg 0x=
30: [mem 0xfce00000-0xfce7ffff pref]
May 16 15:06:45 test-ubnt kernel: [    0.148257] pci 0000:01:00.1: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.148311] pci 0000:01:00.1: PME# s=
upported from D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.148394] pci 0000:01:00.2: [1022:=
43b3] type 01 class 0x060400
May 16 15:06:45 test-ubnt kernel: [    0.148456] pci 0000:01:00.2: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.148516] pci 0000:01:00.2: PME# s=
upported from D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.148643] pci 0000:00:01.2: PCI br=
idge to [bus 01-06]
May 16 15:06:45 test-ubnt kernel: [    0.148650] pci 0000:00:01.2:   brid=
ge window [io  0xf000-0xffff]
May 16 15:06:45 test-ubnt kernel: [    0.148652] pci 0000:00:01.2:   brid=
ge window [mem 0xfcd00000-0xfcefffff]
May 16 15:06:45 test-ubnt kernel: [    0.148798] pci 0000:02:04.0: [1022:=
43b4] type 01 class 0x060400
May 16 15:06:45 test-ubnt kernel: [    0.148866] pci 0000:02:04.0: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.148939] pci 0000:02:04.0: PME# s=
upported from D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.149042] pci 0000:02:05.0: [1022:=
43b4] type 01 class 0x060400
May 16 15:06:45 test-ubnt kernel: [    0.149109] pci 0000:02:05.0: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.149183] pci 0000:02:05.0: PME# s=
upported from D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.149287] pci 0000:02:06.0: [1022:=
43b4] type 01 class 0x060400
May 16 15:06:45 test-ubnt kernel: [    0.149354] pci 0000:02:06.0: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.149427] pci 0000:02:06.0: PME# s=
upported from D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.149533] pci 0000:02:07.0: [1022:=
43b4] type 01 class 0x060400
May 16 15:06:45 test-ubnt kernel: [    0.149599] pci 0000:02:07.0: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.149673] pci 0000:02:07.0: PME# s=
upported from D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.149793] pci 0000:01:00.2: PCI br=
idge to [bus 02-06]
May 16 15:06:45 test-ubnt kernel: [    0.149800] pci 0000:01:00.2:   brid=
ge window [io  0xf000-0xffff]
May 16 15:06:45 test-ubnt kernel: [    0.149804] pci 0000:01:00.2:   brid=
ge window [mem 0xfcd00000-0xfcdfffff]
May 16 15:06:45 test-ubnt kernel: [    0.149859] pci 0000:02:04.0: PCI br=
idge to [bus 03]
May 16 15:06:45 test-ubnt kernel: [    0.149922] pci 0000:02:05.0: PCI br=
idge to [bus 04]
May 16 15:06:45 test-ubnt kernel: [    0.150011] pci 0000:05:00.0: [10ec:=
8168] type 00 class 0x020000
May 16 15:06:45 test-ubnt kernel: [    0.150060] pci 0000:05:00.0: reg 0x=
10: [io  0xf000-0xf0ff]
May 16 15:06:45 test-ubnt kernel: [    0.150102] pci 0000:05:00.0: reg 0x=
18: [mem 0xfcd04000-0xfcd04fff 64bit]
May 16 15:06:45 test-ubnt kernel: [    0.150128] pci 0000:05:00.0: reg 0x=
20: [mem 0xfcd00000-0xfcd03fff 64bit]
May 16 15:06:45 test-ubnt kernel: [    0.150294] pci 0000:05:00.0: suppor=
ts D1 D2
May 16 15:06:45 test-ubnt kernel: [    0.150295] pci 0000:05:00.0: PME# s=
upported from D0 D1 D2 D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.150518] pci 0000:02:06.0: PCI br=
idge to [bus 05]
May 16 15:06:45 test-ubnt kernel: [    0.150526] pci 0000:02:06.0:   brid=
ge window [io  0xf000-0xffff]
May 16 15:06:45 test-ubnt kernel: [    0.150529] pci 0000:02:06.0:   brid=
ge window [mem 0xfcd00000-0xfcdfffff]
May 16 15:06:45 test-ubnt kernel: [    0.150592] pci 0000:02:07.0: PCI br=
idge to [bus 06]
May 16 15:06:45 test-ubnt kernel: [    0.150750] pci 0000:07:00.0: [1002:=
15dd] type 00 class 0x030000
May 16 15:06:45 test-ubnt kernel: [    0.150796] pci 0000:07:00.0: reg 0x=
10: [mem 0xe0000000-0xefffffff 64bit pref]
May 16 15:06:45 test-ubnt kernel: [    0.150814] pci 0000:07:00.0: reg 0x=
18: [mem 0xf0000000-0xf01fffff 64bit pref]
May 16 15:06:45 test-ubnt kernel: [    0.150826] pci 0000:07:00.0: reg 0x=
20: [io  0xe000-0xe0ff]
May 16 15:06:45 test-ubnt kernel: [    0.150837] pci 0000:07:00.0: reg 0x=
24: [mem 0xfcc00000-0xfcc7ffff]
May 16 15:06:45 test-ubnt kernel: [    0.150857] pci 0000:07:00.0: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.150875] pci 0000:07:00.0: BAR 0:=
 assigned to efifb
May 16 15:06:45 test-ubnt kernel: [    0.150982] pci 0000:07:00.0: PME# s=
upported from D1 D2 D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.151116] pci 0000:07:00.1: [1002:=
15de] type 00 class 0x040300
May 16 15:06:45 test-ubnt kernel: [    0.151145] pci 0000:07:00.1: reg 0x=
10: [mem 0xfcc88000-0xfcc8bfff]
May 16 15:06:45 test-ubnt kernel: [    0.151217] pci 0000:07:00.1: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.151291] pci 0000:07:00.1: PME# s=
upported from D1 D2 D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.151387] pci 0000:07:00.2: [1022:=
15df] type 00 class 0x108000
May 16 15:06:45 test-ubnt kernel: [    0.151437] pci 0000:07:00.2: reg 0x=
18: [mem 0xfcb00000-0xfcbfffff]
May 16 15:06:45 test-ubnt kernel: [    0.151469] pci 0000:07:00.2: reg 0x=
24: [mem 0xfcc8c000-0xfcc8dfff]
May 16 15:06:45 test-ubnt kernel: [    0.151489] pci 0000:07:00.2: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.151656] pci 0000:07:00.3: [1022:=
15e0] type 00 class 0x0c0330
May 16 15:06:45 test-ubnt kernel: [    0.151691] pci 0000:07:00.3: reg 0x=
10: [mem 0xfca00000-0xfcafffff 64bit]
May 16 15:06:45 test-ubnt kernel: [    0.151753] pci 0000:07:00.3: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.151833] pci 0000:07:00.3: PME# s=
upported from D0 D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.151936] pci 0000:07:00.4: [1022:=
15e1] type 00 class 0x0c0330
May 16 15:06:45 test-ubnt kernel: [    0.151971] pci 0000:07:00.4: reg 0x=
10: [mem 0xfc900000-0xfc9fffff 64bit]
May 16 15:06:45 test-ubnt kernel: [    0.152032] pci 0000:07:00.4: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.152112] pci 0000:07:00.4: PME# s=
upported from D0 D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.152214] pci 0000:07:00.6: [1022:=
15e3] type 00 class 0x040300
May 16 15:06:45 test-ubnt kernel: [    0.152243] pci 0000:07:00.6: reg 0x=
10: [mem 0xfcc80000-0xfcc87fff]
May 16 15:06:45 test-ubnt kernel: [    0.152315] pci 0000:07:00.6: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.152388] pci 0000:07:00.6: PME# s=
upported from D0 D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.152535] pci 0000:00:08.1: PCI br=
idge to [bus 07]
May 16 15:06:45 test-ubnt kernel: [    0.152542] pci 0000:00:08.1:   brid=
ge window [io  0xe000-0xefff]
May 16 15:06:45 test-ubnt kernel: [    0.152545] pci 0000:00:08.1:   brid=
ge window [mem 0xfc900000-0xfccfffff]
May 16 15:06:45 test-ubnt kernel: [    0.152550] pci 0000:00:08.1:   brid=
ge window [mem 0xe0000000-0xf01fffff 64bit pref]
May 16 15:06:45 test-ubnt kernel: [    0.152644] pci 0000:08:00.0: [1022:=
7901] type 00 class 0x010601
May 16 15:06:45 test-ubnt kernel: [    0.152727] pci 0000:08:00.0: reg 0x=
24: [mem 0xfcf00000-0xfcf007ff]
May 16 15:06:45 test-ubnt kernel: [    0.152747] pci 0000:08:00.0: enabli=
ng Extended Tags
May 16 15:06:45 test-ubnt kernel: [    0.152828] pci 0000:08:00.0: PME# s=
upported from D3hot D3cold
May 16 15:06:45 test-ubnt kernel: [    0.152953] pci 0000:00:08.2: PCI br=
idge to [bus 08]
May 16 15:06:45 test-ubnt kernel: [    0.152962] pci 0000:00:08.2:   brid=
ge window [mem 0xfcf00000-0xfcffffff]
May 16 15:06:45 test-ubnt kernel: [    0.153577] ACPI: PCI Interrupt Link=
 [LNKA] (IRQs 4 5 7 10 11 14 15) *0
May 16 15:06:45 test-ubnt kernel: [    0.153648] ACPI: PCI Interrupt Link=
 [LNKB] (IRQs 4 5 7 10 11 14 15) *0
May 16 15:06:45 test-ubnt kernel: [    0.153707] ACPI: PCI Interrupt Link=
 [LNKC] (IRQs 4 5 7 10 11 14 15) *0
May 16 15:06:45 test-ubnt kernel: [    0.153782] ACPI: PCI Interrupt Link=
 [LNKD] (IRQs 4 5 7 10 11 14 15) *0
May 16 15:06:45 test-ubnt kernel: [    0.153849] ACPI: PCI Interrupt Link=
 [LNKE] (IRQs 4 5 7 10 11 14 15) *0
May 16 15:06:45 test-ubnt kernel: [    0.153903] ACPI: PCI Interrupt Link=
 [LNKF] (IRQs 4 5 7 10 11 14 15) *0
May 16 15:06:45 test-ubnt kernel: [    0.153959] ACPI: PCI Interrupt Link=
 [LNKG] (IRQs 4 5 7 10 11 14 15) *0
May 16 15:06:45 test-ubnt kernel: [    0.154013] ACPI: PCI Interrupt Link=
 [LNKH] (IRQs 4 5 7 10 11 14 15) *0
May 16 15:06:45 test-ubnt kernel: [    0.155070] pci 0000:07:00.0: vgaarb=
: setting as boot VGA device
May 16 15:06:45 test-ubnt kernel: [    0.155070] pci 0000:07:00.0: vgaarb=
: VGA device added: decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
May 16 15:06:45 test-ubnt kernel: [    0.155070] pci 0000:07:00.0: vgaarb=
: bridge control possible
May 16 15:06:45 test-ubnt kernel: [    0.155070] vgaarb: loaded
May 16 15:06:45 test-ubnt kernel: [    0.155351] SCSI subsystem initializ=
ed
May 16 15:06:45 test-ubnt kernel: [    0.155363] libata version 3.00 load=
ed.
May 16 15:06:45 test-ubnt kernel: [    0.155363] ACPI: bus type USB regis=
tered
May 16 15:06:45 test-ubnt kernel: [    0.155363] usbcore: registered new =
interface driver usbfs
May 16 15:06:45 test-ubnt kernel: [    0.155363] usbcore: registered new =
interface driver hub
May 16 15:06:45 test-ubnt kernel: [    0.155363] usbcore: registered new =
device driver usb
May 16 15:06:45 test-ubnt kernel: [    0.155363] pps_core: LinuxPPS API v=
er. 1 registered
May 16 15:06:45 test-ubnt kernel: [    0.155363] pps_core: Software ver. =
5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
May 16 15:06:45 test-ubnt kernel: [    0.155363] PTP clock support regist=
ered
May 16 15:06:45 test-ubnt kernel: [    0.155363] EDAC MC: Ver: 3.0.0
May 16 15:06:45 test-ubnt kernel: [    0.155363] Registered efivars opera=
tions
May 16 15:06:45 test-ubnt kernel: [    0.175245] PCI: Using ACPI for IRQ =
routing
May 16 15:06:45 test-ubnt kernel: [    0.179888] PCI: pci_cache_line_size=
 set to 64 bytes
May 16 15:06:45 test-ubnt kernel: [    0.179972] e820: reserve RAM buffer=
 [mem 0x09e10000-0x0bffffff]
May 16 15:06:45 test-ubnt kernel: [    0.179974] e820: reserve RAM buffer=
 [mem 0x0a200000-0x0bffffff]
May 16 15:06:45 test-ubnt kernel: [    0.179974] e820: reserve RAM buffer=
 [mem 0x0b000000-0x0bffffff]
May 16 15:06:45 test-ubnt kernel: [    0.179975] e820: reserve RAM buffer=
 [mem 0xb198c000-0xb3ffffff]
May 16 15:06:45 test-ubnt kernel: [    0.179976] e820: reserve RAM buffer=
 [mem 0xba7f4000-0xbbffffff]
May 16 15:06:45 test-ubnt kernel: [    0.179976] e820: reserve RAM buffer=
 [mem 0xba9ef000-0xbbffffff]
May 16 15:06:45 test-ubnt kernel: [    0.179977] e820: reserve RAM buffer=
 [mem 0xbe000000-0xbfffffff]
May 16 15:06:45 test-ubnt kernel: [    0.179978] e820: reserve RAM buffer=
 [mem 0x11f340000-0x11fffffff]
May 16 15:06:45 test-ubnt kernel: [    0.180111] NetLabel: Initializing
May 16 15:06:45 test-ubnt kernel: [    0.180113] NetLabel:  domain hash s=
ize =3D 128
May 16 15:06:45 test-ubnt kernel: [    0.180114] NetLabel:  protocols =3D=
 UNLABELED CIPSOv4 CALIPSO
May 16 15:06:45 test-ubnt kernel: [    0.180134] NetLabel:  unlabeled tra=
ffic allowed by default
May 16 15:06:45 test-ubnt kernel: [    0.180146] hpet0: at MMIO 0xfed0000=
0, IRQs 2, 8, 0
May 16 15:06:45 test-ubnt kernel: [    0.180146] hpet0: 3 comparators, 32=
-bit 14.318180 MHz counter
May 16 15:06:45 test-ubnt kernel: [    0.181125] clocksource: Switched to=
 clocksource tsc-early
May 16 15:06:45 test-ubnt kernel: [    0.192851] VFS: Disk quotas dquot_6=
=2E6.0
May 16 15:06:45 test-ubnt kernel: [    0.192912] VFS: Dquot-cache hash ta=
ble entries: 512 (order 0, 4096 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.192991] *** VALIDATE hugetlbfs *=
**
May 16 15:06:45 test-ubnt kernel: [    0.193127] AppArmor: AppArmor Files=
ystem Enabled
May 16 15:06:45 test-ubnt kernel: [    0.193166] pnp: PnP ACPI init
May 16 15:06:45 test-ubnt kernel: [    0.193354] system 00:00: [mem 0xf80=
00000-0xfbffffff] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.193362] system 00:00: Plug and P=
lay ACPI device, IDs PNP0c01 (active)
May 16 15:06:45 test-ubnt kernel: [    0.193394] system 00:01: [mem 0xfeb=
80000-0xfebfffff] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.193398] system 00:01: Plug and P=
lay ACPI device, IDs PNP0c02 (active)
May 16 15:06:45 test-ubnt kernel: [    0.193471] system 00:02: [mem 0xc00=
00000-0xdfffffff window] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.193477] system 00:02: Plug and P=
lay ACPI device, IDs PNP0c02 (active)
May 16 15:06:45 test-ubnt kernel: [    0.193636] pnp 00:03: Plug and Play=
 ACPI device, IDs PNP0b00 (active)
May 16 15:06:45 test-ubnt kernel: [    0.193812] system 00:04: [io  0x030=
0-0x030f] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.193815] system 00:04: [io  0x023=
0-0x023f] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.193817] system 00:04: [io  0x029=
0-0x029f] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.193821] system 00:04: Plug and P=
lay ACPI device, IDs PNP0c02 (active)
May 16 15:06:45 test-ubnt kernel: [    0.194155] pnp 00:05: [dma 0 disabl=
ed]
May 16 15:06:45 test-ubnt kernel: [    0.194197] pnp 00:05: Plug and Play=
 ACPI device, IDs PNP0501 (active)
May 16 15:06:45 test-ubnt kernel: [    0.194437] system 00:06: [io  0x04d=
0-0x04d1] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194440] system 00:06: [io  0x040=
b] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194442] system 00:06: [io  0x04d=
6] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194444] system 00:06: [io  0x0c0=
0-0x0c01] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194446] system 00:06: [io  0x0c1=
4] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194448] system 00:06: [io  0x0c5=
0-0x0c51] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194450] system 00:06: [io  0x0c5=
2] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194451] system 00:06: [io  0x0c6=
c] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194453] system 00:06: [io  0x0c6=
f] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194455] system 00:06: [io  0x0cd=
0-0x0cd1] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194457] system 00:06: [io  0x0cd=
2-0x0cd3] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194459] system 00:06: [io  0x0cd=
4-0x0cd5] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194461] system 00:06: [io  0x0cd=
6-0x0cd7] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194463] system 00:06: [io  0x0cd=
8-0x0cdf] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194465] system 00:06: [io  0x080=
0-0x089f] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194467] system 00:06: [io  0x0b0=
0-0x0b0f] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194469] system 00:06: [io  0x0b2=
0-0x0b3f] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194470] system 00:06: [io  0x090=
0-0x090f] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194472] system 00:06: [io  0x091=
0-0x091f] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194475] system 00:06: [mem 0xfec=
00000-0xfec00fff] could not be reserved
May 16 15:06:45 test-ubnt kernel: [    0.194477] system 00:06: [mem 0xfec=
01000-0xfec01fff] could not be reserved
May 16 15:06:45 test-ubnt kernel: [    0.194479] system 00:06: [mem 0xfed=
c0000-0xfedc0fff] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194481] system 00:06: [mem 0xfee=
00000-0xfee00fff] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194484] system 00:06: [mem 0xfed=
80000-0xfed8ffff] could not be reserved
May 16 15:06:45 test-ubnt kernel: [    0.194486] system 00:06: [mem 0xfec=
10000-0xfec10fff] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194488] system 00:06: [mem 0xff0=
00000-0xffffffff] has been reserved
May 16 15:06:45 test-ubnt kernel: [    0.194492] system 00:06: Plug and P=
lay ACPI device, IDs PNP0c02 (active)
May 16 15:06:45 test-ubnt kernel: [    0.195034] pnp: PnP ACPI: found 7 d=
evices
May 16 15:06:45 test-ubnt kernel: [    0.201089] clocksource: acpi_pm: ma=
sk: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
May 16 15:06:45 test-ubnt kernel: [    0.201107] pci 0000:02:04.0: PCI br=
idge to [bus 03]
May 16 15:06:45 test-ubnt kernel: [    0.201122] pci 0000:02:05.0: PCI br=
idge to [bus 04]
May 16 15:06:45 test-ubnt kernel: [    0.201136] pci 0000:02:06.0: PCI br=
idge to [bus 05]
May 16 15:06:45 test-ubnt kernel: [    0.201140] pci 0000:02:06.0:   brid=
ge window [io  0xf000-0xffff]
May 16 15:06:45 test-ubnt kernel: [    0.201146] pci 0000:02:06.0:   brid=
ge window [mem 0xfcd00000-0xfcdfffff]
May 16 15:06:45 test-ubnt kernel: [    0.201156] pci 0000:02:07.0: PCI br=
idge to [bus 06]
May 16 15:06:45 test-ubnt kernel: [    0.201170] pci 0000:01:00.2: PCI br=
idge to [bus 02-06]
May 16 15:06:45 test-ubnt kernel: [    0.201173] pci 0000:01:00.2:   brid=
ge window [io  0xf000-0xffff]
May 16 15:06:45 test-ubnt kernel: [    0.201179] pci 0000:01:00.2:   brid=
ge window [mem 0xfcd00000-0xfcdfffff]
May 16 15:06:45 test-ubnt kernel: [    0.201189] pci 0000:00:01.2: PCI br=
idge to [bus 01-06]
May 16 15:06:45 test-ubnt kernel: [    0.201192] pci 0000:00:01.2:   brid=
ge window [io  0xf000-0xffff]
May 16 15:06:45 test-ubnt kernel: [    0.201197] pci 0000:00:01.2:   brid=
ge window [mem 0xfcd00000-0xfcefffff]
May 16 15:06:45 test-ubnt kernel: [    0.201208] pci 0000:00:08.1: PCI br=
idge to [bus 07]
May 16 15:06:45 test-ubnt kernel: [    0.201216] pci 0000:00:08.1:   brid=
ge window [io  0xe000-0xefff]
May 16 15:06:45 test-ubnt kernel: [    0.201221] pci 0000:00:08.1:   brid=
ge window [mem 0xfc900000-0xfccfffff]
May 16 15:06:45 test-ubnt kernel: [    0.201226] pci 0000:00:08.1:   brid=
ge window [mem 0xe0000000-0xf01fffff 64bit pref]
May 16 15:06:45 test-ubnt kernel: [    0.201234] pci 0000:00:08.2: PCI br=
idge to [bus 08]
May 16 15:06:45 test-ubnt kernel: [    0.201239] pci 0000:00:08.2:   brid=
ge window [mem 0xfcf00000-0xfcffffff]
May 16 15:06:45 test-ubnt kernel: [    0.201250] pci_bus 0000:00: resourc=
e 4 [io  0x0000-0x03af window]
May 16 15:06:45 test-ubnt kernel: [    0.201252] pci_bus 0000:00: resourc=
e 5 [io  0x03e0-0x0cf7 window]
May 16 15:06:45 test-ubnt kernel: [    0.201252] pci_bus 0000:00: resourc=
e 6 [io  0x03b0-0x03df window]
May 16 15:06:45 test-ubnt kernel: [    0.201253] pci_bus 0000:00: resourc=
e 7 [io  0x0d00-0xffff window]
May 16 15:06:45 test-ubnt kernel: [    0.201254] pci_bus 0000:00: resourc=
e 8 [mem 0x000a0000-0x000bffff window]
May 16 15:06:45 test-ubnt kernel: [    0.201255] pci_bus 0000:00: resourc=
e 9 [mem 0x000c0000-0x000dffff window]
May 16 15:06:45 test-ubnt kernel: [    0.201256] pci_bus 0000:00: resourc=
e 10 [mem 0xe0000000-0xfec2ffff window]
May 16 15:06:45 test-ubnt kernel: [    0.201257] pci_bus 0000:00: resourc=
e 11 [mem 0xfee00000-0xffffffff window]
May 16 15:06:45 test-ubnt kernel: [    0.201258] pci_bus 0000:01: resourc=
e 0 [io  0xf000-0xffff]
May 16 15:06:45 test-ubnt kernel: [    0.201259] pci_bus 0000:01: resourc=
e 1 [mem 0xfcd00000-0xfcefffff]
May 16 15:06:45 test-ubnt kernel: [    0.201260] pci_bus 0000:02: resourc=
e 0 [io  0xf000-0xffff]
May 16 15:06:45 test-ubnt kernel: [    0.201260] pci_bus 0000:02: resourc=
e 1 [mem 0xfcd00000-0xfcdfffff]
May 16 15:06:45 test-ubnt kernel: [    0.201262] pci_bus 0000:05: resourc=
e 0 [io  0xf000-0xffff]
May 16 15:06:45 test-ubnt kernel: [    0.201262] pci_bus 0000:05: resourc=
e 1 [mem 0xfcd00000-0xfcdfffff]
May 16 15:06:45 test-ubnt kernel: [    0.201263] pci_bus 0000:07: resourc=
e 0 [io  0xe000-0xefff]
May 16 15:06:45 test-ubnt kernel: [    0.201264] pci_bus 0000:07: resourc=
e 1 [mem 0xfc900000-0xfccfffff]
May 16 15:06:45 test-ubnt kernel: [    0.201265] pci_bus 0000:07: resourc=
e 2 [mem 0xe0000000-0xf01fffff 64bit pref]
May 16 15:06:45 test-ubnt kernel: [    0.201266] pci_bus 0000:08: resourc=
e 1 [mem 0xfcf00000-0xfcffffff]
May 16 15:06:45 test-ubnt kernel: [    0.201490] NET: Registered protocol=
 family 2
May 16 15:06:45 test-ubnt kernel: [    0.201780] tcp_listen_portaddr_hash=
 hash table entries: 2048 (order: 3, 32768 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.201795] TCP established hash tab=
le entries: 32768 (order: 6, 262144 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.201854] TCP bind hash table entr=
ies: 32768 (order: 7, 524288 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.201940] TCP: Hash tables configu=
red (established 32768 bind 32768)
May 16 15:06:45 test-ubnt kernel: [    0.202020] UDP hash table entries: =
2048 (order: 4, 65536 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.202036] UDP-Lite hash table entr=
ies: 2048 (order: 4, 65536 bytes)
May 16 15:06:45 test-ubnt kernel: [    0.202261] NET: Registered protocol=
 family 1
May 16 15:06:45 test-ubnt kernel: [    0.202267] NET: Registered protocol=
 family 44
May 16 15:06:45 test-ubnt kernel: [    0.202437] pci 0000:07:00.0: Video =
device with shadowed ROM at [mem 0x000c0000-0x000dffff]
May 16 15:06:45 test-ubnt kernel: [    0.202749] PCI: CLS 64 bytes, defau=
lt 64
May 16 15:06:45 test-ubnt kernel: [    0.202787] Unpacking initramfs...
May 16 15:06:45 test-ubnt kernel: [    0.963395] Freeing initrd memory: 6=
1348K
May 16 15:06:45 test-ubnt kernel: [    0.963459] PCI-DMA: Using software =
bounce buffering for IO (SWIOTLB)
May 16 15:06:45 test-ubnt kernel: [    0.963462] software IO TLB: mapped =
[mem 0xb362b000-0xb762b000] (64MB)
May 16 15:06:45 test-ubnt kernel: [    0.963539] amd_uncore: AMD NB count=
ers detected
May 16 15:06:45 test-ubnt kernel: [    0.963557] amd_uncore: AMD LLC coun=
ters detected
May 16 15:06:45 test-ubnt kernel: [    0.963752] check: Scanning for low =
memory corruption every 60 seconds
May 16 15:06:45 test-ubnt kernel: [    0.966047] Initialise system truste=
d keyrings
May 16 15:06:45 test-ubnt kernel: [    0.966093] Key type blacklist regis=
tered
May 16 15:06:45 test-ubnt kernel: [    0.966201] workingset: timestamp_bi=
ts=3D36 max_order=3D20 bucket_order=3D0
May 16 15:06:45 test-ubnt kernel: [    0.968201] zbud: loaded
May 16 15:06:45 test-ubnt kernel: [    0.969036] squashfs: version 4.0 (2=
009/01/31) Phillip Lougher
May 16 15:06:45 test-ubnt kernel: [    0.969430] fuse init (API version 7=
=2E29)
May 16 15:06:45 test-ubnt kernel: [    0.969863] Platform Keyring initial=
ized
May 16 15:06:45 test-ubnt kernel: [    1.006078] Key type asymmetric regi=
stered
May 16 15:06:45 test-ubnt kernel: [    1.006084] Asymmetric key parser 'x=
509' registered
May 16 15:06:45 test-ubnt kernel: [    1.006102] Block layer SCSI generic=
 (bsg) driver version 0.4 loaded (major 243)
May 16 15:06:45 test-ubnt kernel: [    1.006179] io scheduler mq-deadline=
 registered
May 16 15:06:45 test-ubnt kernel: [    1.007227] aer 0000:00:01.2:pcie002=
: AER enabled with IRQ 25
May 16 15:06:45 test-ubnt kernel: [    1.008344] shpchp: Standard Hot Plu=
g PCI Controller Driver version: 0.4
May 16 15:06:45 test-ubnt kernel: [    1.008407] efifb: probing for efifb=

May 16 15:06:45 test-ubnt kernel: [    1.008425] efifb: framebuffer at 0x=
e0000000, using 5120k, total 5120k
May 16 15:06:45 test-ubnt kernel: [    1.008427] efifb: mode is 1280x1024=
x32, linelength=3D5120, pages=3D1
May 16 15:06:45 test-ubnt kernel: [    1.008428] efifb: scrolling: redraw=

May 16 15:06:45 test-ubnt kernel: [    1.008430] efifb: Truecolor: size=3D=
8:8:8:8, shift=3D24:16:8:0
May 16 15:06:45 test-ubnt kernel: [    1.010816] Console: switching to co=
lour frame buffer device 160x64
May 16 15:06:45 test-ubnt kernel: [    1.013147] fb0: EFI VGA frame buffe=
r device
May 16 15:06:45 test-ubnt kernel: [    1.013282] input: Power Button as /=
devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
May 16 15:06:45 test-ubnt kernel: [    1.013316] ACPI: Power Button [PWRB=
]
May 16 15:06:45 test-ubnt kernel: [    1.013369] input: Power Button as /=
devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
May 16 15:06:45 test-ubnt kernel: [    1.013408] ACPI: Power Button [PWRF=
]
May 16 15:06:45 test-ubnt kernel: [    1.013456] Monitor-Mwait will be us=
ed to enter C-1 state
May 16 15:06:45 test-ubnt kernel: [    1.014141] Serial: 8250/16550 drive=
r, 32 ports, IRQ sharing enabled
May 16 15:06:45 test-ubnt kernel: [    1.035100] 00:05: ttyS0 at I/O 0x3f=
8 (irq =3D 4, base_baud =3D 115200) is a 16550A
May 16 15:06:45 test-ubnt kernel: [    1.036828] Linux agpgart interface =
v0.103
May 16 15:06:45 test-ubnt kernel: [    1.041289] loop: module loaded
May 16 15:06:45 test-ubnt kernel: [    1.041578] libphy: Fixed MDIO Bus: =
probed
May 16 15:06:45 test-ubnt kernel: [    1.041596] tun: Universal TUN/TAP d=
evice driver, 1.6
May 16 15:06:45 test-ubnt kernel: [    1.041669] PPP generic driver versi=
on 2.4.2
May 16 15:06:45 test-ubnt kernel: [    1.041747] ehci_hcd: USB 2.0 'Enhan=
ced' Host Controller (EHCI) Driver
May 16 15:06:45 test-ubnt kernel: [    1.041770] ehci-pci: EHCI PCI platf=
orm driver
May 16 15:06:45 test-ubnt kernel: [    1.041796] ehci-platform: EHCI gene=
ric platform driver
May 16 15:06:45 test-ubnt kernel: [    1.041826] ohci_hcd: USB 1.1 'Open'=
 Host Controller (OHCI) Driver
May 16 15:06:45 test-ubnt kernel: [    1.041845] ohci-pci: OHCI PCI platf=
orm driver
May 16 15:06:45 test-ubnt kernel: [    1.041865] ohci-platform: OHCI gene=
ric platform driver
May 16 15:06:45 test-ubnt kernel: [    1.041884] uhci_hcd: USB Universal =
Host Controller Interface driver
May 16 15:06:45 test-ubnt kernel: [    1.042051] xhci_hcd 0000:01:00.0: x=
HCI Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.042077] xhci_hcd 0000:01:00.0: n=
ew USB bus registered, assigned bus number 1
May 16 15:06:45 test-ubnt kernel: [    1.097470] xhci_hcd 0000:01:00.0: h=
cc params 0x0200ef81 hci version 0x110 quirks 0x0000000008000410
May 16 15:06:45 test-ubnt kernel: [    1.097715] usb usb1: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 5.01
May 16 15:06:45 test-ubnt kernel: [    1.097743] usb usb1: New USB device=
 strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
May 16 15:06:45 test-ubnt kernel: [    1.097764] usb usb1: Product: xHCI =
Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.097779] usb usb1: Manufacturer: =
Linux 5.1.1-050101-generic xhci-hcd
May 16 15:06:45 test-ubnt kernel: [    1.097799] usb usb1: SerialNumber: =
0000:01:00.0
May 16 15:06:45 test-ubnt kernel: [    1.097952] hub 1-0:1.0: USB hub fou=
nd
May 16 15:06:45 test-ubnt kernel: [    1.097983] hub 1-0:1.0: 9 ports det=
ected
May 16 15:06:45 test-ubnt kernel: [    1.103678] xhci_hcd 0000:01:00.0: x=
HCI Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.103705] xhci_hcd 0000:01:00.0: n=
ew USB bus registered, assigned bus number 2
May 16 15:06:45 test-ubnt kernel: [    1.103728] xhci_hcd 0000:01:00.0: H=
ost supports USB 3.10 Enhanced SuperSpeed
May 16 15:06:45 test-ubnt kernel: [    1.103780] usb usb2: We don't know =
the algorithms for LPM for this host, disabling LPM.
May 16 15:06:45 test-ubnt kernel: [    1.103827] usb usb2: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0003, bcdDevice=3D 5.01
May 16 15:06:45 test-ubnt kernel: [    1.103851] usb usb2: New USB device=
 strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
May 16 15:06:45 test-ubnt kernel: [    1.103872] usb usb2: Product: xHCI =
Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.103887] usb usb2: Manufacturer: =
Linux 5.1.1-050101-generic xhci-hcd
May 16 15:06:45 test-ubnt kernel: [    1.103907] usb usb2: SerialNumber: =
0000:01:00.0
May 16 15:06:45 test-ubnt kernel: [    1.104029] hub 2-0:1.0: USB hub fou=
nd
May 16 15:06:45 test-ubnt kernel: [    1.104875] hub 2-0:1.0: 3 ports det=
ected
May 16 15:06:45 test-ubnt kernel: [    1.107717] xhci_hcd 0000:07:00.3: x=
HCI Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.108731] xhci_hcd 0000:07:00.3: n=
ew USB bus registered, assigned bus number 3
May 16 15:06:45 test-ubnt kernel: [    1.109832] xhci_hcd 0000:07:00.3: h=
cc params 0x0270ffe5 hci version 0x110 quirks 0x0000000840000410
May 16 15:06:45 test-ubnt kernel: [    1.110962] usb usb3: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 5.01
May 16 15:06:45 test-ubnt kernel: [    1.111819] usb usb3: New USB device=
 strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
May 16 15:06:45 test-ubnt kernel: [    1.112686] usb usb3: Product: xHCI =
Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.113542] usb usb3: Manufacturer: =
Linux 5.1.1-050101-generic xhci-hcd
May 16 15:06:45 test-ubnt kernel: [    1.114378] usb usb3: SerialNumber: =
0000:07:00.3
May 16 15:06:45 test-ubnt kernel: [    1.115332] hub 3-0:1.0: USB hub fou=
nd
May 16 15:06:45 test-ubnt kernel: [    1.116163] hub 3-0:1.0: 4 ports det=
ected
May 16 15:06:45 test-ubnt kernel: [    1.117181] xhci_hcd 0000:07:00.3: x=
HCI Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.118005] xhci_hcd 0000:07:00.3: n=
ew USB bus registered, assigned bus number 4
May 16 15:06:45 test-ubnt kernel: [    1.118833] xhci_hcd 0000:07:00.3: H=
ost supports USB 3.10 Enhanced SuperSpeed
May 16 15:06:45 test-ubnt kernel: [    1.119711] usb usb4: We don't know =
the algorithms for LPM for this host, disabling LPM.
May 16 15:06:45 test-ubnt kernel: [    1.120553] usb usb4: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0003, bcdDevice=3D 5.01
May 16 15:06:45 test-ubnt kernel: [    1.121382] usb usb4: New USB device=
 strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
May 16 15:06:45 test-ubnt kernel: [    1.122216] usb usb4: Product: xHCI =
Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.123042] usb usb4: Manufacturer: =
Linux 5.1.1-050101-generic xhci-hcd
May 16 15:06:45 test-ubnt kernel: [    1.123870] usb usb4: SerialNumber: =
0000:07:00.3
May 16 15:06:45 test-ubnt kernel: [    1.124769] hub 4-0:1.0: USB hub fou=
nd
May 16 15:06:45 test-ubnt kernel: [    1.125592] hub 4-0:1.0: 4 ports det=
ected
May 16 15:06:45 test-ubnt kernel: [    1.126967] xhci_hcd 0000:07:00.4: x=
HCI Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.127794] xhci_hcd 0000:07:00.4: n=
ew USB bus registered, assigned bus number 5
May 16 15:06:45 test-ubnt kernel: [    1.128748] xhci_hcd 0000:07:00.4: h=
cc params 0x0260ffe5 hci version 0x110 quirks 0x0000000840000410
May 16 15:06:45 test-ubnt kernel: [    1.129759] usb usb5: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0002, bcdDevice=3D 5.01
May 16 15:06:45 test-ubnt kernel: [    1.130586] usb usb5: New USB device=
 strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
May 16 15:06:45 test-ubnt kernel: [    1.131407] usb usb5: Product: xHCI =
Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.132217] usb usb5: Manufacturer: =
Linux 5.1.1-050101-generic xhci-hcd
May 16 15:06:45 test-ubnt kernel: [    1.133028] usb usb5: SerialNumber: =
0000:07:00.4
May 16 15:06:45 test-ubnt kernel: [    1.133947] hub 5-0:1.0: USB hub fou=
nd
May 16 15:06:45 test-ubnt kernel: [    1.134745] hub 5-0:1.0: 1 port dete=
cted
May 16 15:06:45 test-ubnt kernel: [    1.135620] xhci_hcd 0000:07:00.4: x=
HCI Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.136417] xhci_hcd 0000:07:00.4: n=
ew USB bus registered, assigned bus number 6
May 16 15:06:45 test-ubnt kernel: [    1.137218] xhci_hcd 0000:07:00.4: H=
ost supports USB 3.10 Enhanced SuperSpeed
May 16 15:06:45 test-ubnt kernel: [    1.138040] usb usb6: We don't know =
the algorithms for LPM for this host, disabling LPM.
May 16 15:06:45 test-ubnt kernel: [    1.138861] usb usb6: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0003, bcdDevice=3D 5.01
May 16 15:06:45 test-ubnt kernel: [    1.139674] usb usb6: New USB device=
 strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
May 16 15:06:45 test-ubnt kernel: [    1.140491] usb usb6: Product: xHCI =
Host Controller
May 16 15:06:45 test-ubnt kernel: [    1.141297] usb usb6: Manufacturer: =
Linux 5.1.1-050101-generic xhci-hcd
May 16 15:06:45 test-ubnt kernel: [    1.142110] usb usb6: SerialNumber: =
0000:07:00.4
May 16 15:06:45 test-ubnt kernel: [    1.143029] hub 6-0:1.0: USB hub fou=
nd
May 16 15:06:45 test-ubnt kernel: [    1.143848] hub 6-0:1.0: 1 port dete=
cted
May 16 15:06:45 test-ubnt kernel: [    1.144746] i8042: PNP: No PS/2 cont=
roller found.
May 16 15:06:45 test-ubnt kernel: [    1.145633] mousedev: PS/2 mouse dev=
ice common for all mice
May 16 15:06:45 test-ubnt kernel: [    1.146544] rtc_cmos 00:03: RTC can =
wake from S4
May 16 15:06:45 test-ubnt kernel: [    1.147647] rtc_cmos 00:03: register=
ed as rtc0
May 16 15:06:45 test-ubnt kernel: [    1.148438] rtc_cmos 00:03: alarms u=
p to one month, y3k, 114 bytes nvram, hpet irqs
May 16 15:06:45 test-ubnt kernel: [    1.149230] i2c /dev entries driver
May 16 15:06:45 test-ubnt kernel: [    1.150082] device-mapper: uevent: v=
ersion 1.0.3
May 16 15:06:45 test-ubnt kernel: [    1.150964] device-mapper: ioctl: 4.=
40.0-ioctl (2019-01-18) initialised: dm-devel@redhat.com
May 16 15:06:45 test-ubnt kernel: [    1.151792] platform eisa.0: Probing=
 EISA bus 0
May 16 15:06:45 test-ubnt kernel: [    1.152593] platform eisa.0: EISA: C=
annot allocate resource for mainboard
May 16 15:06:45 test-ubnt kernel: [    1.153402] platform eisa.0: Cannot =
allocate resource for EISA slot 1
May 16 15:06:45 test-ubnt kernel: [    1.154207] platform eisa.0: Cannot =
allocate resource for EISA slot 2
May 16 15:06:45 test-ubnt kernel: [    1.155008] platform eisa.0: Cannot =
allocate resource for EISA slot 3
May 16 15:06:45 test-ubnt kernel: [    1.155799] platform eisa.0: Cannot =
allocate resource for EISA slot 4
May 16 15:06:45 test-ubnt kernel: [    1.156575] platform eisa.0: Cannot =
allocate resource for EISA slot 5
May 16 15:06:45 test-ubnt kernel: [    1.157337] platform eisa.0: Cannot =
allocate resource for EISA slot 6
May 16 15:06:45 test-ubnt kernel: [    1.158088] platform eisa.0: Cannot =
allocate resource for EISA slot 7
May 16 15:06:45 test-ubnt kernel: [    1.158827] platform eisa.0: Cannot =
allocate resource for EISA slot 8
May 16 15:06:45 test-ubnt kernel: [    1.159554] platform eisa.0: EISA: D=
etected 0 cards
May 16 15:06:45 test-ubnt kernel: [    1.160356] ledtrig-cpu: registered =
to indicate activity on CPUs
May 16 15:06:45 test-ubnt kernel: [    1.161086] EFI Variables Facility v=
0.08 2004-May-17
May 16 15:06:45 test-ubnt kernel: [    1.181609] NET: Registered protocol=
 family 10
May 16 15:06:45 test-ubnt kernel: [    1.187568] Segment Routing with IPv=
6
May 16 15:06:45 test-ubnt kernel: [    1.188336] NET: Registered protocol=
 family 17
May 16 15:06:45 test-ubnt kernel: [    1.189114] Key type dns_resolver re=
gistered
May 16 15:06:45 test-ubnt kernel: [    1.190231] RAS: Correctable Errors =
collector initialized.
May 16 15:06:45 test-ubnt kernel: [    1.191181] microcode: CPU0: patch_l=
evel=3D0x0810100b
May 16 15:06:45 test-ubnt kernel: [    1.192086] microcode: CPU1: patch_l=
evel=3D0x0810100b
May 16 15:06:45 test-ubnt kernel: [    1.192802] microcode: CPU2: patch_l=
evel=3D0x0810100b
May 16 15:06:45 test-ubnt kernel: [    1.193531] microcode: CPU3: patch_l=
evel=3D0x0810100b
May 16 15:06:45 test-ubnt kernel: [    1.194247] microcode: Microcode Upd=
ate Driver: v2.2.
May 16 15:06:45 test-ubnt kernel: [    1.194270] sched_clock: Marking sta=
ble (1193534064, 709665)->(1309490838, -115247109)
May 16 15:06:45 test-ubnt kernel: [    1.195851] registered taskstats ver=
sion 1
May 16 15:06:45 test-ubnt kernel: [    1.196570] Loading compiled-in X.50=
9 certificates
May 16 15:06:45 test-ubnt kernel: [    1.198705] Loaded X.509 cert 'Build=
 time autogenerated kernel key: 6ecf29bd3d40e744e4b97e010ded343d6af06d5e'=

May 16 15:06:45 test-ubnt kernel: [    1.199468] zswap: loaded using pool=
 lzo/zbud
May 16 15:06:45 test-ubnt kernel: [    1.205237] Key type big_key registe=
red
May 16 15:06:45 test-ubnt kernel: [    1.208208] Key type encrypted regis=
tered
May 16 15:06:45 test-ubnt kernel: [    1.208916] AppArmor: AppArmor sha1 =
policy hashing enabled
May 16 15:06:45 test-ubnt kernel: [    1.210306] integrity: Loading X.509=
 certificate: UEFI:db
May 16 15:06:45 test-ubnt kernel: [    1.212009] integrity: Loaded X.509 =
cert 'ASUSTeK MotherBoard SW Key Certificate: da83b990422ebc8c441f8d8b039=
a65a2'
May 16 15:06:45 test-ubnt kernel: [    1.212740] integrity: Loading X.509=
 certificate: UEFI:db
May 16 15:06:45 test-ubnt kernel: [    1.213675] integrity: Loaded X.509 =
cert 'ASUSTeK Notebook SW Key Certificate: b8e581e4df77a5bb4282d5ccfc00c0=
71'
May 16 15:06:45 test-ubnt kernel: [    1.214424] integrity: Loading X.509=
 certificate: UEFI:db
May 16 15:06:45 test-ubnt kernel: [    1.215215] integrity: Loaded X.509 =
cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed52=
2988a1bd4'
May 16 15:06:45 test-ubnt kernel: [    1.215976] integrity: Loading X.509=
 certificate: UEFI:db
May 16 15:06:45 test-ubnt kernel: [    1.216746] integrity: Loaded X.509 =
cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f=
9ae17c55af53'
May 16 15:06:45 test-ubnt kernel: [    1.217515] integrity: Loading X.509=
 certificate: UEFI:db
May 16 15:06:45 test-ubnt kernel: [    1.218453] integrity: Loaded X.509 =
cert 'Canonical Ltd. Master Certificate Authority: ad91990bc22ab1f517048c=
23b6655a268e345a63'
May 16 15:06:45 test-ubnt kernel: [    1.219474] Couldn't get size: 0x800=
000000000000e
May 16 15:06:45 test-ubnt kernel: [    1.220258] Couldn't get UEFI MokLis=
tRT
May 16 15:06:45 test-ubnt kernel: [    1.223573] ima: No TPM chip found, =
activating TPM-bypass!
May 16 15:06:45 test-ubnt kernel: [    1.224386] ima: Allocated hash algo=
rithm: sha1
May 16 15:06:45 test-ubnt kernel: [    1.225184] No architecture policies=
 found
May 16 15:06:45 test-ubnt kernel: [    1.225982] evm: Initialising EVM ex=
tended attributes:
May 16 15:06:45 test-ubnt kernel: [    1.226770] evm: security.selinux
May 16 15:06:45 test-ubnt kernel: [    1.227556] evm: security.SMACK64
May 16 15:06:45 test-ubnt kernel: [    1.228319] evm: security.SMACK64EXE=
C
May 16 15:06:45 test-ubnt kernel: [    1.229077] evm: security.SMACK64TRA=
NSMUTE
May 16 15:06:45 test-ubnt kernel: [    1.229825] evm: security.SMACK64MMA=
P
May 16 15:06:45 test-ubnt kernel: [    1.230556] evm: security.apparmor
May 16 15:06:45 test-ubnt kernel: [    1.231286] evm: security.ima
May 16 15:06:45 test-ubnt kernel: [    1.232009] evm: security.capability=

May 16 15:06:45 test-ubnt kernel: [    1.232731] evm: HMAC attrs: 0x1
May 16 15:06:45 test-ubnt kernel: [    1.234209] PM:   Magic number: 3:63=
8:129
May 16 15:06:45 test-ubnt kernel: [    1.234935] nvmem cmos_nvram0: hash =
matches
May 16 15:06:45 test-ubnt kernel: [    1.235675] event_source kprobe: has=
h matches
May 16 15:06:45 test-ubnt kernel: [    1.236434] acpi device:04: hash mat=
ches
May 16 15:06:45 test-ubnt kernel: [    1.237149] acpi PNP0C02:01: hash ma=
tches
May 16 15:06:45 test-ubnt kernel: [    1.237918] rtc_cmos 00:03: setting =
system clock to 2019-05-16T13:06:34 UTC (1558011994)
May 16 15:06:45 test-ubnt kernel: [    1.238814] acpi_cpufreq: overriding=
 BIOS provided _PSD data
May 16 15:06:45 test-ubnt kernel: [    1.241060] Freeing unused decrypted=
 memory: 2040K
May 16 15:06:45 test-ubnt kernel: [    1.242331] Freeing unused kernel im=
age memory: 2584K
May 16 15:06:45 test-ubnt kernel: [    1.259060] Write protecting the ker=
nel read-only data: 22528k
May 16 15:06:45 test-ubnt kernel: [    1.260608] Freeing unused kernel im=
age memory: 2012K
May 16 15:06:45 test-ubnt kernel: [    1.261962] Freeing unused kernel im=
age memory: 1752K
May 16 15:06:45 test-ubnt kernel: [    1.273349] x86/mm: Checked W+X mapp=
ings: passed, no W+X pages found.
May 16 15:06:45 test-ubnt kernel: [    1.274121] Run /init as init proces=
s
May 16 15:06:45 test-ubnt kernel: [    1.409953] ahci 0000:01:00.1: versi=
on 3.0
May 16 15:06:45 test-ubnt kernel: [    1.410128] ahci 0000:01:00.1: SSS f=
lag set, parallel bus scan disabled
May 16 15:06:45 test-ubnt kernel: [    1.411105] ahci 0000:01:00.1: AHCI =
0001.0301 32 slots 8 ports 6 Gbps 0x33 impl SATA mode
May 16 15:06:45 test-ubnt kernel: [    1.411277] acpi PNP0C14:01: duplica=
te WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on P=
NP0C14:00)
May 16 15:06:45 test-ubnt kernel: [    1.412011] ahci 0000:01:00.1: flags=
: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds=
 apst=20
May 16 15:06:45 test-ubnt kernel: [    1.419366] piix4_smbus 0000:00:14.0=
: SMBus Host Controller at 0xb00, revision 0
May 16 15:06:45 test-ubnt kernel: [    1.420237] piix4_smbus 0000:00:14.0=
: Using register 0x02 for SMBus port selection
May 16 15:06:45 test-ubnt kernel: [    1.422298] scsi host0: ahci
May 16 15:06:45 test-ubnt kernel: [    1.423517] usb 1-9: new full-speed =
USB device number 2 using xhci_hcd
May 16 15:06:45 test-ubnt kernel: [    1.426185] cryptd: max_cpu_qlen set=
 to 1000
May 16 15:06:45 test-ubnt kernel: [    1.426833] libphy: r8169: probed
May 16 15:06:45 test-ubnt kernel: [    1.428827] r8169 0000:05:00.0 eth0:=
 RTL8168h/8111h, 18:31:bf:b5:f9:b0, XID 541, IRQ 51
May 16 15:06:45 test-ubnt kernel: [    1.430219] r8169 0000:05:00.0 eth0:=
 jumbo features [frames: 9200 bytes, tx checksumming: ko]
May 16 15:06:45 test-ubnt kernel: [    1.431392] scsi host1: ahci
May 16 15:06:45 test-ubnt kernel: [    1.433921] scsi host2: ahci
May 16 15:06:45 test-ubnt kernel: [    1.435478] scsi host3: ahci
May 16 15:06:45 test-ubnt kernel: [    1.436767] scsi host4: ahci
May 16 15:06:45 test-ubnt kernel: [    1.440352] scsi host5: ahci
May 16 15:06:45 test-ubnt kernel: [    1.441895] scsi host6: ahci
May 16 15:06:45 test-ubnt kernel: [    1.444669] scsi host7: ahci
May 16 15:06:45 test-ubnt kernel: [    1.445706] ata1: SATA max UDMA/133 =
abar m131072@0xfce80000 port 0xfce80100 irq 50
May 16 15:06:45 test-ubnt kernel: [    1.446878] ata2: SATA max UDMA/133 =
abar m131072@0xfce80000 port 0xfce80180 irq 50
May 16 15:06:45 test-ubnt kernel: [    1.448113] ata3: DUMMY
May 16 15:06:45 test-ubnt kernel: [    1.449154] ata4: DUMMY
May 16 15:06:45 test-ubnt kernel: [    1.450181] ata5: SATA max UDMA/133 =
abar m131072@0xfce80000 port 0xfce80300 irq 50
May 16 15:06:45 test-ubnt kernel: [    1.451275] ata6: SATA max UDMA/133 =
abar m131072@0xfce80000 port 0xfce80380 irq 50
May 16 15:06:45 test-ubnt kernel: [    1.452299] ata7: DUMMY
May 16 15:06:45 test-ubnt kernel: [    1.453224] ata8: DUMMY
May 16 15:06:45 test-ubnt kernel: [    1.455079] usb 3-3: new low-speed U=
SB device number 2 using xhci_hcd
May 16 15:06:45 test-ubnt kernel: [    1.461549] AVX2 version of gcm_enc/=
dec engaged.
May 16 15:06:45 test-ubnt kernel: [    1.462757] AES CTR mode by8 optimiz=
ation enabled
May 16 15:06:45 test-ubnt kernel: [    1.464708] ahci 0000:08:00.0: AHCI =
0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
May 16 15:06:45 test-ubnt kernel: [    1.465891] ahci 0000:08:00.0: flags=
: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part=20
May 16 15:06:45 test-ubnt kernel: [    1.469408] AMD-Vi: AMD IOMMUv2 driv=
er by Joerg Roedel <jroedel@suse.de>
May 16 15:06:45 test-ubnt kernel: [    1.470375] AMD-Vi: AMD IOMMUv2 func=
tionality not available on this system
May 16 15:06:45 test-ubnt kernel: [    1.475179] scsi host8: ahci
May 16 15:06:45 test-ubnt kernel: [    1.476285] ata9: SATA max UDMA/133 =
abar m2048@0xfcf00000 port 0xfcf00100 irq 53
May 16 15:06:45 test-ubnt kernel: [    1.499884] r8169 0000:05:00.0 enp5s=
0: renamed from eth0
May 16 15:06:45 test-ubnt kernel: [    1.516162] [drm] amdgpu kernel mode=
setting enabled.
May 16 15:06:45 test-ubnt kernel: [    1.517032] Parsing CRAT table with =
1 nodes
May 16 15:06:45 test-ubnt kernel: [    1.517892] Creating topology SYSFS =
entries
May 16 15:06:45 test-ubnt kernel: [    1.518641] Topology: Add APU node [=
0x0:0x0]
May 16 15:06:45 test-ubnt kernel: [    1.519371] Finished initializing to=
pology
May 16 15:06:45 test-ubnt kernel: [    1.520191] checking generic (e00000=
00 500000) vs hw (e0000000 10000000)
May 16 15:06:45 test-ubnt kernel: [    1.520192] fb0: switching to amdgpu=
drmfb from EFI VGA
May 16 15:06:45 test-ubnt kernel: [    1.520946] Console: switching to co=
lour dummy device 80x25
May 16 15:06:45 test-ubnt kernel: [    1.521022] amdgpu 0000:07:00.0: vga=
arb: deactivate vga console
May 16 15:06:45 test-ubnt kernel: [    1.521375] [drm] initializing kerne=
l modesetting (RAVEN 0x1002:0x15DD 0x1043:0x876B 0xCB).
May 16 15:06:45 test-ubnt kernel: [    1.521391] [drm] register mmio base=
: 0xFCC00000
May 16 15:06:45 test-ubnt kernel: [    1.521392] [drm] register mmio size=
: 524288
May 16 15:06:45 test-ubnt kernel: [    1.521418] [drm] add ip block numbe=
r 0 <soc15_common>
May 16 15:06:45 test-ubnt kernel: [    1.521420] [drm] add ip block numbe=
r 1 <gmc_v9_0>
May 16 15:06:45 test-ubnt kernel: [    1.521422] [drm] add ip block numbe=
r 2 <vega10_ih>
May 16 15:06:45 test-ubnt kernel: [    1.521424] [drm] add ip block numbe=
r 3 <psp>
May 16 15:06:45 test-ubnt kernel: [    1.521426] [drm] add ip block numbe=
r 4 <gfx_v9_0>
May 16 15:06:45 test-ubnt kernel: [    1.521428] [drm] add ip block numbe=
r 5 <sdma_v4_0>
May 16 15:06:45 test-ubnt kernel: [    1.521430] [drm] add ip block numbe=
r 6 <powerplay>
May 16 15:06:45 test-ubnt kernel: [    1.521431] [drm] add ip block numbe=
r 7 <dm>
May 16 15:06:45 test-ubnt kernel: [    1.521433] [drm] add ip block numbe=
r 8 <vcn_v1_0>
May 16 15:06:45 test-ubnt kernel: [    1.521480] [drm] VCN decode is enab=
led in VM mode
May 16 15:06:45 test-ubnt kernel: [    1.521482] [drm] VCN encode is enab=
led in VM mode
May 16 15:06:45 test-ubnt kernel: [    1.521483] [drm] VCN jpeg decode is=
 enabled in VM mode
May 16 15:06:45 test-ubnt kernel: [    1.542896] [drm] BIOS signature inc=
orrect 0 0
May 16 15:06:45 test-ubnt kernel: [    1.542942] ATOM BIOS: 113-RAVEN-113=

May 16 15:06:45 test-ubnt kernel: [    1.543000] [drm] vm size is 262144 =
GB, 4 levels, block size is 9-bit, fragment size is 9-bit
May 16 15:06:45 test-ubnt kernel: [    1.543014] amdgpu 0000:07:00.0: VRA=
M: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
May 16 15:06:45 test-ubnt kernel: [    1.543018] amdgpu 0000:07:00.0: GAR=
T: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
May 16 15:06:45 test-ubnt kernel: [    1.543021] amdgpu 0000:07:00.0: AGP=
: 267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
May 16 15:06:45 test-ubnt kernel: [    1.543029] [drm] Detected VRAM RAM=3D=
512M, BAR=3D512M
May 16 15:06:45 test-ubnt kernel: [    1.543031] [drm] RAM width 64bits D=
DR4
May 16 15:06:45 test-ubnt kernel: [    1.543102] [TTM] Zone  kernel: Avai=
lable graphics memory: 1724138 kiB
May 16 15:06:45 test-ubnt kernel: [    1.543105] [TTM] Initializing pool =
allocator
May 16 15:06:45 test-ubnt kernel: [    1.543109] [TTM] Initializing DMA p=
ool allocator
May 16 15:06:45 test-ubnt kernel: [    1.543143] [drm] amdgpu: 512M of VR=
AM memory ready
May 16 15:06:45 test-ubnt kernel: [    1.543145] [drm] amdgpu: 2525M of G=
TT memory ready.
May 16 15:06:45 test-ubnt kernel: [    1.543158] [drm] GART: num cpu page=
s 262144, num gpu pages 262144
May 16 15:06:45 test-ubnt kernel: [    1.543298] [drm] PCIE GART of 1024M=
 enabled (table at 0x000000F400500000).
May 16 15:06:45 test-ubnt kernel: [    1.544479] [drm] use_doorbell being=
 set to: [true]
May 16 15:06:45 test-ubnt kernel: [    1.544645] [drm] Found VCN firmware=
 Version: 1.73 Family ID: 18
May 16 15:06:45 test-ubnt kernel: [    1.544649] [drm] PSP loading VCN fi=
rmware
May 16 15:06:45 test-ubnt kernel: [    1.565098] [drm] reserve 0x400000 f=
rom 0xf400800000 for PSP TMR SIZE
May 16 15:06:45 test-ubnt kernel: [    1.628815] usb 3-3: New USB device =
found, idVendor=3D04f3, idProduct=3D0103, bcdDevice=3D 1.07
May 16 15:06:45 test-ubnt kernel: [    1.628821] usb 3-3: New USB device =
strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
May 16 15:06:45 test-ubnt kernel: [    1.654226] hidraw: raw HID events d=
river (C) Jiri Kosina
May 16 15:06:45 test-ubnt kernel: [    1.667886] usbcore: registered new =
interface driver usbhid
May 16 15:06:45 test-ubnt kernel: [    1.667890] usbhid: USB HID core dri=
ver
May 16 15:06:45 test-ubnt kernel: [    1.670345] input: HID 04f3:0103 as =
/devices/pci0000:00/0000:00:08.1/0000:07:00.3/usb3/3-3/3-3:1.0/0003:04F3:=
0103.0001/input/input2
May 16 15:06:45 test-ubnt kernel: [    1.670443] hid-generic 0003:04F3:01=
03.0001: input,hidraw0: USB HID v1.11 Keyboard [HID 04f3:0103] on usb-000=
0:07:00.3-3/input0
May 16 15:06:45 test-ubnt kernel: [    1.670630] input: HID 04f3:0103 Con=
sumer Control as /devices/pci0000:00/0000:00:08.1/0000:07:00.3/usb3/3-3/3=
-3:1.1/0003:04F3:0103.0002/input/input3
May 16 15:06:45 test-ubnt kernel: [    1.670694] input: HID 04f3:0103 Sys=
tem Control as /devices/pci0000:00/0000:00:08.1/0000:07:00.3/usb3/3-3/3-3=
:1.1/0003:04F3:0103.0002/input/input4
May 16 15:06:45 test-ubnt kernel: [    1.670746] hid-generic 0003:04F3:01=
03.0002: input,hidraw1: USB HID v1.11 Device [HID 04f3:0103] on usb-0000:=
07:00.3-3/input1
May 16 15:06:45 test-ubnt kernel: [    1.769540] [drm] DM_PPLIB: values f=
or F clock
May 16 15:06:45 test-ubnt kernel: [    1.769544] [drm] DM_PPLIB:	 400000 =
in kHz
May 16 15:06:45 test-ubnt kernel: [    1.769546] [drm] DM_PPLIB:	 933000 =
in kHz
May 16 15:06:45 test-ubnt kernel: [    1.769548] [drm] DM_PPLIB:	 1067000=
 in kHz
May 16 15:06:45 test-ubnt kernel: [    1.769549] [drm] DM_PPLIB:	 1200000=
 in kHz
May 16 15:06:45 test-ubnt kernel: [    1.769552] [drm] DM_PPLIB: values f=
or DCF clock
May 16 15:06:45 test-ubnt kernel: [    1.769553] [drm] DM_PPLIB:	 300000 =
in kHz
May 16 15:06:45 test-ubnt kernel: [    1.769555] [drm] DM_PPLIB:	 600000 =
in kHz
May 16 15:06:45 test-ubnt kernel: [    1.769556] [drm] DM_PPLIB:	 626000 =
in kHz
May 16 15:06:45 test-ubnt kernel: [    1.769558] [drm] DM_PPLIB:	 654000 =
in kHz
May 16 15:06:45 test-ubnt kernel: [    1.769812] [drm:construct [amdgpu]]=
 *ERROR* construct: Invalid Connector ObjectID from Adapter Service for c=
onnector index:1! type 0 expected 3
May 16 15:06:45 test-ubnt kernel: [    1.769882] [drm:construct [amdgpu]]=
 *ERROR* construct: Invalid Connector ObjectID from Adapter Service for c=
onnector index:2! type 0 expected 3
May 16 15:06:45 test-ubnt kernel: [    1.773714] [drm] Display Core initi=
alized with v3.2.17!
May 16 15:06:45 test-ubnt kernel: [    1.789390] ata9: SATA link down (SS=
tatus 0 SControl 300)
May 16 15:06:45 test-ubnt kernel: [    1.798570] [drm] SADs count is: -2,=
 don't need to read it
May 16 15:06:45 test-ubnt kernel: [    1.798577] usb 1-9: New USB device =
found, idVendor=3D0403, idProduct=3D6001, bcdDevice=3D 6.00
May 16 15:06:45 test-ubnt kernel: [    1.798581] usb 1-9: New USB device =
strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
May 16 15:06:45 test-ubnt kernel: [    1.798584] usb 1-9: Product: FT232R=
 USB UART
May 16 15:06:45 test-ubnt kernel: [    1.798586] usb 1-9: Manufacturer: F=
TDI
May 16 15:06:45 test-ubnt kernel: [    1.798588] usb 1-9: SerialNumber: A=
I040DQ2
May 16 15:06:45 test-ubnt kernel: [    1.810355] [drm] Supports vblank ti=
mestamp caching Rev 2 (21.10.2013).
May 16 15:06:45 test-ubnt kernel: [    1.810358] [drm] Driver supports pr=
ecise vblank timestamp query.
May 16 15:06:45 test-ubnt kernel: [    1.823077] [drm] VCN decode and enc=
ode initialized successfully(under SPG Mode).
May 16 15:06:45 test-ubnt kernel: [    1.824101] kfd kfd: Allocated 39690=
56 bytes on gart
May 16 15:06:45 test-ubnt kernel: [    1.824124] Topology: Add APU node [=
0x15dd:0x1002]
May 16 15:06:45 test-ubnt kernel: [    1.824155] kfd kfd: error getting i=
ommu info. is the iommu enabled?
May 16 15:06:45 test-ubnt kernel: [    1.824157] kfd kfd: Error initializ=
ing iommuv2
May 16 15:06:45 test-ubnt kernel: [    1.824178] Creating topology SYSFS =
entries
May 16 15:06:45 test-ubnt kernel: [    1.824283] kfd kfd: device 1002:15d=
d NOT added due to errors
May 16 15:06:45 test-ubnt kernel: [    1.825199] [drm] fb mappable at 0xC=
0C00000
May 16 15:06:45 test-ubnt kernel: [    1.825201] [drm] vram apper at 0xC0=
000000
May 16 15:06:45 test-ubnt kernel: [    1.825203] [drm] size 5242880
May 16 15:06:45 test-ubnt kernel: [    1.825204] [drm] fb depth is 24
May 16 15:06:45 test-ubnt kernel: [    1.825206] [drm]    pitch is 5120
May 16 15:06:45 test-ubnt kernel: [    1.825283] fbcon: amdgpudrmfb (fb0)=
 is primary device
May 16 15:06:45 test-ubnt kernel: [    1.847770] Console: switching to co=
lour frame buffer device 160x64
May 16 15:06:45 test-ubnt kernel: [    1.850298] amdgpu 0000:07:00.0: fb0=
: amdgpudrmfb frame buffer device
May 16 15:06:45 test-ubnt kernel: [    1.863180] amdgpu 0000:07:00.0: rin=
g gfx uses VM inv eng 0 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863250] amdgpu 0000:07:00.0: rin=
g comp_1.0.0 uses VM inv eng 1 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863305] amdgpu 0000:07:00.0: rin=
g comp_1.1.0 uses VM inv eng 4 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863344] amdgpu 0000:07:00.0: rin=
g comp_1.2.0 uses VM inv eng 5 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863384] amdgpu 0000:07:00.0: rin=
g comp_1.3.0 uses VM inv eng 6 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863423] amdgpu 0000:07:00.0: rin=
g comp_1.0.1 uses VM inv eng 7 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863461] amdgpu 0000:07:00.0: rin=
g comp_1.1.1 uses VM inv eng 8 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863500] amdgpu 0000:07:00.0: rin=
g comp_1.2.1 uses VM inv eng 9 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863539] amdgpu 0000:07:00.0: rin=
g comp_1.3.1 uses VM inv eng 10 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863578] amdgpu 0000:07:00.0: rin=
g kiq_2.1.0 uses VM inv eng 11 on hub 0
May 16 15:06:45 test-ubnt kernel: [    1.863617] amdgpu 0000:07:00.0: rin=
g sdma0 uses VM inv eng 0 on hub 1
May 16 15:06:45 test-ubnt kernel: [    1.863653] amdgpu 0000:07:00.0: rin=
g vcn_dec uses VM inv eng 1 on hub 1
May 16 15:06:45 test-ubnt kernel: [    1.863690] amdgpu 0000:07:00.0: rin=
g vcn_enc0 uses VM inv eng 4 on hub 1
May 16 15:06:45 test-ubnt kernel: [    1.863728] amdgpu 0000:07:00.0: rin=
g vcn_enc1 uses VM inv eng 5 on hub 1
May 16 15:06:45 test-ubnt kernel: [    1.863766] amdgpu 0000:07:00.0: rin=
g vcn_jpeg uses VM inv eng 6 on hub 1
May 16 15:06:45 test-ubnt kernel: [    1.878420] [drm] Initialized amdgpu=
 3.30.0 20150101 for 0000:07:00.0 on minor 0
May 16 15:06:45 test-ubnt kernel: [    1.935101] ata1: SATA link up 6.0 G=
bps (SStatus 133 SControl 300)
May 16 15:06:45 test-ubnt kernel: [    1.935569] ata1.00: ATA-9: M4-CT128=
M4SSD2, 070H, max UDMA/100
May 16 15:06:45 test-ubnt kernel: [    1.935612] ata1.00: 250069680 secto=
rs, multi 16: LBA48 NCQ (depth 32), AA
May 16 15:06:45 test-ubnt kernel: [    1.936129] ata1.00: configured for =
UDMA/100
May 16 15:06:45 test-ubnt kernel: [    1.936393] scsi 0:0:0:0: Direct-Acc=
ess     ATA      M4-CT128M4SSD2   070H PQ: 0 ANSI: 5
May 16 15:06:45 test-ubnt kernel: [    1.936658] sd 0:0:0:0: Attached scs=
i generic sg0 type 0
May 16 15:06:45 test-ubnt kernel: [    1.936752] sd 0:0:0:0: [sda] 250069=
680 512-byte logical blocks: (128 GB/119 GiB)
May 16 15:06:45 test-ubnt kernel: [    1.936806] sd 0:0:0:0: [sda] Write =
Protect is off
May 16 15:06:45 test-ubnt kernel: [    1.936829] sd 0:0:0:0: [sda] Mode S=
ense: 00 3a 00 00
May 16 15:06:45 test-ubnt kernel: [    1.936866] sd 0:0:0:0: [sda] Write =
cache: enabled, read cache: enabled, doesn't support DPO or FUA
May 16 15:06:45 test-ubnt kernel: [    1.938629]  sda: sda1 sda2
May 16 15:06:45 test-ubnt kernel: [    1.939277] sd 0:0:0:0: [sda] Attach=
ed SCSI disk
May 16 15:06:45 test-ubnt kernel: [    1.987052] tsc: Refined TSC clockso=
urce calibration: 3193.998 MHz
May 16 15:06:45 test-ubnt kernel: [    1.987085] clocksource: tsc: mask: =
0xffffffffffffffff max_cycles: 0x2e0a244aeba, max_idle_ns: 440795290469 n=
s
May 16 15:06:45 test-ubnt kernel: [    1.987157] clocksource: Switched to=
 clocksource tsc
May 16 15:06:45 test-ubnt kernel: [    2.250029] ata2: SATA link down (SS=
tatus 0 SControl 300)
May 16 15:06:45 test-ubnt kernel: [    2.564289] ata5: SATA link down (SS=
tatus 0 SControl 300)
May 16 15:06:45 test-ubnt kernel: [    2.878400] ata6: SATA link down (SS=
tatus 0 SControl 300)
May 16 15:06:45 test-ubnt kernel: [    3.059047] raid6: avx2x4   gen() 20=
646 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.127045] raid6: avx2x4   xor() 11=
255 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.195046] raid6: avx2x2   gen() 20=
256 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.263045] raid6: avx2x2   xor() 13=
140 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.331046] raid6: avx2x1   gen() 15=
346 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.399046] raid6: avx2x1   xor() 12=
124 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.467048] raid6: sse2x4   gen() 14=
604 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.535046] raid6: sse2x4   xor()  8=
275 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.603046] raid6: sse2x2   gen() 14=
085 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.671047] raid6: sse2x2   xor()  9=
195 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.739045] raid6: sse2x1   gen()  6=
954 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.807047] raid6: sse2x1   xor()  6=
769 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.807656] raid6: using algorithm a=
vx2x4 gen() 20646 MB/s
May 16 15:06:45 test-ubnt kernel: [    3.808269] raid6: .... xor() 11255 =
MB/s, rmw enabled
May 16 15:06:45 test-ubnt kernel: [    3.808879] raid6: using avx2x2 reco=
very algorithm
May 16 15:06:45 test-ubnt kernel: [    3.810285] xor: automatically using=
 best checksumming function   avx      =20
May 16 15:06:45 test-ubnt kernel: [    3.811755] async_tx: api initialize=
d (async)
May 16 15:06:45 test-ubnt kernel: [    3.852759] Btrfs loaded, crc32c=3Dc=
rc32c-intel
May 16 15:06:45 test-ubnt kernel: [    3.884951] EXT4-fs (sda2): mounted =
filesystem with ordered data mode. Opts: (null)
May 16 15:06:45 test-ubnt kernel: [    4.278540] Loading iSCSI transport =
class v2.0-870.
May 16 15:06:45 test-ubnt kernel: [    4.286126] iscsi: registered transp=
ort (tcp)
May 16 15:06:45 test-ubnt kernel: [    4.299120] EXT4-fs (sda2): re-mount=
ed. Opts: (null)
May 16 15:06:45 test-ubnt kernel: [    4.320782] iscsi: registered transp=
ort (iser)
May 16 15:06:45 test-ubnt kernel: [    4.446039] Adding 3513340k swap on =
/swap.img.  Priority:-2 extents:5 across:3800060k SSFS
May 16 15:06:45 test-ubnt kernel: [    4.649090] usbcore: registered new =
interface driver usbserial_generic
May 16 15:06:45 test-ubnt kernel: [    4.649098] usbserial: USB Serial su=
pport registered for generic
May 16 15:06:45 test-ubnt kernel: [    4.654142] usbcore: registered new =
interface driver ftdi_sio
May 16 15:06:45 test-ubnt kernel: [    4.654152] usbserial: USB Serial su=
pport registered for FTDI USB Serial Device
May 16 15:06:45 test-ubnt kernel: [    4.654226] ftdi_sio 1-9:1.0: FTDI U=
SB Serial Device converter detected
May 16 15:06:45 test-ubnt kernel: [    4.654265] usb 1-9: Detected FT232R=
L
May 16 15:06:45 test-ubnt kernel: [    4.661905] usb 1-9: FTDI USB Serial=
 Device converter now attached to ttyUSB0
May 16 15:06:45 test-ubnt kernel: [    4.692018] asus_wmi: ASUS WMI gener=
ic driver loaded
May 16 15:06:45 test-ubnt kernel: [    4.695597] asus_wmi: Initialization=
: 0x0
May 16 15:06:45 test-ubnt kernel: [    4.695652] asus_wmi: BIOS WMI versi=
on: 0.9
May 16 15:06:45 test-ubnt kernel: [    4.695894] asus_wmi: SFUN value: 0x=
0
May 16 15:06:45 test-ubnt kernel: [    4.696696] input: Eee PC WMI hotkey=
s as /devices/platform/eeepc-wmi/input/input5
May 16 15:06:45 test-ubnt kernel: [    4.697062] asus_wmi: Number of fans=
: 1
May 16 15:06:45 test-ubnt kernel: [    4.705312] snd_hda_intel 0000:07:00=
=2E1: Handle vga_switcheroo audio client
May 16 15:06:45 test-ubnt kernel: [    4.716577] input: HD-Audio Generic =
HDMI/DP,pcm=3D3 as /devices/pci0000:00/0000:00:08.1/0000:07:00.1/sound/ca=
rd0/input6
May 16 15:06:45 test-ubnt kernel: [    4.744141] snd_hda_codec_realtek hd=
audioC1D0: autoconfig for ALC887-VD: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0)=
 type:line
May 16 15:06:45 test-ubnt kernel: [    4.744143] snd_hda_codec_realtek hd=
audioC1D0:    speaker_outs=3D0 (0x0/0x0/0x0/0x0/0x0)
May 16 15:06:45 test-ubnt kernel: [    4.744145] snd_hda_codec_realtek hd=
audioC1D0:    hp_outs=3D1 (0x1b/0x0/0x0/0x0/0x0)
May 16 15:06:45 test-ubnt kernel: [    4.744146] snd_hda_codec_realtek hd=
audioC1D0:    mono: mono_out=3D0x0
May 16 15:06:45 test-ubnt kernel: [    4.744147] snd_hda_codec_realtek hd=
audioC1D0:    dig-out=3D0x11/0x0
May 16 15:06:45 test-ubnt kernel: [    4.744148] snd_hda_codec_realtek hd=
audioC1D0:    inputs:
May 16 15:06:45 test-ubnt kernel: [    4.744150] snd_hda_codec_realtek hd=
audioC1D0:      Front Mic=3D0x19
May 16 15:06:45 test-ubnt kernel: [    4.744151] snd_hda_codec_realtek hd=
audioC1D0:      Rear Mic=3D0x18
May 16 15:06:45 test-ubnt kernel: [    4.744153] snd_hda_codec_realtek hd=
audioC1D0:      Line=3D0x1a
May 16 15:06:45 test-ubnt kernel: [    4.763918] input: HD-Audio Generic =
Front Mic as /devices/pci0000:00/0000:00:08.1/0000:07:00.6/sound/card1/in=
put7
May 16 15:06:45 test-ubnt kernel: [    4.763970] input: HD-Audio Generic =
Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:07:00.6/sound/card1/inp=
ut8
May 16 15:06:45 test-ubnt kernel: [    4.764023] input: HD-Audio Generic =
Line as /devices/pci0000:00/0000:00:08.1/0000:07:00.6/sound/card1/input9
May 16 15:06:45 test-ubnt kernel: [    4.764075] input: HD-Audio Generic =
Line Out as /devices/pci0000:00/0000:00:08.1/0000:07:00.6/sound/card1/inp=
ut10
May 16 15:06:45 test-ubnt kernel: [    4.764126] input: HD-Audio Generic =
Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:07:00.6/sound/ca=
rd1/input11
May 16 15:06:45 test-ubnt kernel: [    4.857894] kvm: disabled by bios
May 16 15:06:45 test-ubnt kernel: [    4.863215] MCE: In-kernel MCE decod=
ing enabled.
May 16 15:06:45 test-ubnt kernel: [    4.865443] EDAC amd64: Node 0: DRAM=
 ECC disabled.
May 16 15:06:45 test-ubnt kernel: [    4.865446] EDAC amd64: ECC disabled=
 in the BIOS or no ECC capability, module will not load.
May 16 15:06:45 test-ubnt kernel: [    4.865446]  Either enable ECC check=
ing or force module loading by setting 'ecc_enable_override'.
May 16 15:06:45 test-ubnt kernel: [    4.865446]  (Note that use of the o=
verride may cause unknown side effects.)
May 16 15:06:45 test-ubnt kernel: [    4.916109] EDAC amd64: Node 0: DRAM=
 ECC disabled.
May 16 15:06:45 test-ubnt kernel: [    4.916111] EDAC amd64: ECC disabled=
 in the BIOS or no ECC capability, module will not load.
May 16 15:06:45 test-ubnt kernel: [    4.916111]  Either enable ECC check=
ing or force module loading by setting 'ecc_enable_override'.
May 16 15:06:45 test-ubnt kernel: [    4.916111]  (Note that use of the o=
verride may cause unknown side effects.)
May 16 15:06:45 test-ubnt kernel: [    4.986980] alua: device handler reg=
istered
May 16 15:06:45 test-ubnt kernel: [    4.987980] emc: device handler regi=
stered
May 16 15:06:45 test-ubnt kernel: [    4.988880] rdac: device handler reg=
istered
May 16 15:06:45 test-ubnt kernel: [    5.044373] FAT-fs (sda1): Volume wa=
s not properly unmounted. Some data may be corrupt. Please run fsck.
May 16 15:06:45 test-ubnt kernel: [    5.182845] audit: type=3D1400 audit=
(1558011998.437:2): apparmor=3D"STATUS" operation=3D"profile_load" profil=
e=3D"unconfined" name=3D"/usr/lib/snapd/snap-confine" pid=3D693 comm=3D"a=
pparmor_parser"
May 16 15:06:45 test-ubnt kernel: [    5.182849] audit: type=3D1400 audit=
(1558011998.437:3): apparmor=3D"STATUS" operation=3D"profile_load" profil=
e=3D"unconfined" name=3D"/usr/lib/snapd/snap-confine//mount-namespace-cap=
ture-helper" pid=3D693 comm=3D"apparmor_parser"
May 16 15:06:45 test-ubnt kernel: [    5.182951] audit: type=3D1400 audit=
(1558011998.437:4): apparmor=3D"STATUS" operation=3D"profile_load" profil=
e=3D"unconfined" name=3D"/usr/bin/man" pid=3D695 comm=3D"apparmor_parser"=

May 16 15:06:45 test-ubnt kernel: [    5.182953] audit: type=3D1400 audit=
(1558011998.437:5): apparmor=3D"STATUS" operation=3D"profile_load" profil=
e=3D"unconfined" name=3D"man_filter" pid=3D695 comm=3D"apparmor_parser"
May 16 15:06:45 test-ubnt kernel: [    5.182954] audit: type=3D1400 audit=
(1558011998.437:6): apparmor=3D"STATUS" operation=3D"profile_load" profil=
e=3D"unconfined" name=3D"man_groff" pid=3D695 comm=3D"apparmor_parser"
May 16 15:06:45 test-ubnt kernel: [    5.188094] audit: type=3D1400 audit=
(1558011998.445:7): apparmor=3D"STATUS" operation=3D"profile_load" profil=
e=3D"unconfined" name=3D"nvidia_modprobe" pid=3D691 comm=3D"apparmor_pars=
er"
May 16 15:06:45 test-ubnt kernel: [    5.188097] audit: type=3D1400 audit=
(1558011998.445:8): apparmor=3D"STATUS" operation=3D"profile_load" profil=
e=3D"unconfined" name=3D"nvidia_modprobe//kmod" pid=3D691 comm=3D"apparmo=
r_parser"
May 16 15:06:45 test-ubnt kernel: [    5.190216] audit: type=3D1400 audit=
(1558011998.445:9): apparmor=3D"STATUS" operation=3D"profile_load" profil=
e=3D"unconfined" name=3D"/usr/sbin/tcpdump" pid=3D697 comm=3D"apparmor_pa=
rser"
May 16 15:06:45 test-ubnt kernel: [    5.194706] audit: type=3D1400 audit=
(1558011998.449:10): apparmor=3D"STATUS" operation=3D"profile_load" profi=
le=3D"unconfined" name=3D"/sbin/dhclient" pid=3D694 comm=3D"apparmor_pars=
er"
May 16 15:06:45 test-ubnt kernel: [    5.194709] audit: type=3D1400 audit=
(1558011998.449:11): apparmor=3D"STATUS" operation=3D"profile_load" profi=
le=3D"unconfined" name=3D"/usr/lib/NetworkManager/nm-dhcp-client.action" =
pid=3D694 comm=3D"apparmor_parser"
May 16 15:06:45 test-ubnt kernel: [    5.815144] Generic Realtek PHY r816=
9-500:00: attached PHY driver [Generic Realtek PHY] (mii_bus:phy_addr=3Dr=
8169-500:00, irq=3DIGNORE)
May 16 15:06:45 test-ubnt kernel: [    5.930312] r8169 0000:05:00.0 enp5s=
0: Link is Down
May 16 15:06:45 test-ubnt kernel: [    9.579961] r8169 0000:05:00.0 enp5s=
0: Link is Up - 1Gbps/Full - flow control off
May 16 15:06:45 test-ubnt kernel: [    9.579978] IPv6: ADDRCONF(NETDEV_CH=
ANGE): enp5s0: link becomes ready
May 16 15:07:03 test-ubnt kernel: [   30.042564] usbserial: USB Serial de=
registering driver FTDI USB Serial Device
May 16 15:07:03 test-ubnt kernel: [   30.042759] ftdi_sio ttyUSB0: FTDI U=
SB Serial Device converter now disconnected from ttyUSB0
May 16 15:07:03 test-ubnt kernel: [   30.042792] usbcore: deregistering i=
nterface driver ftdi_sio
May 16 15:07:03 test-ubnt kernel: [   30.042842] ftdi_sio 1-9:1.0: device=
 disconnected
May 16 15:07:54 test-ubnt kernel: [   81.751630] xhci_hcd 0000:01:00.0: W=
ARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
May 16 15:07:54 test-ubnt kernel: [   81.990340] general protection fault=
: 0000 [#1] SMP NOPTI
May 16 15:07:54 test-ubnt kernel: [   81.993345] CPU: 3 PID: 1058 Comm: r=
eadua Not tainted 5.1.1-050101-generic #201905110631
May 16 15:07:54 test-ubnt kernel: [   81.996509] Hardware name: System ma=
nufacturer System Product Name/PRIME A320M-K, BIOS 4801 04/25/2019
May 16 15:07:54 test-ubnt kernel: [   81.998598] RIP: 0010:__kmalloc+0xa5=
/0x220
May 16 15:07:54 test-ubnt kernel: [   82.000379] Code: 65 49 8b 50 08 65 =
4c 03 05 90 c5 d8 54 4d 8b 38 4d 85 ff 0f 84 2e 01 00 00 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 f8 4c 01 fb <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 74 bd
May 16 15:07:54 test-ubnt kernel: [   82.004031] RSP: 0018:ffffb415c0f1fc=
d0 EFLAGS: 00010202
May 16 15:07:54 test-ubnt kernel: [   82.005847] RAX: 74536432697a6001 RB=
X: 74536432697a6001 RCX: 0000000000004a47
May 16 15:07:54 test-ubnt kernel: [   82.007654] RDX: 0000000000004a46 RS=
I: 0000000000000cc0 RDI: 00000000000281a0
May 16 15:07:54 test-ubnt kernel: [   82.009463] RBP: ffffb415c0f1fd00 R0=
8: ffff9e259aee81a0 R09: ffff9e259a806b80
May 16 15:07:54 test-ubnt kernel: [   82.011277] R10: ffff9e258ac616f0 R1=
1: ffff9e2591f3a400 R12: 0000000000000cc0
May 16 15:07:54 test-ubnt kernel: [   82.013085] R13: 0000000000001000 R1=
4: ffff9e259a806b80 R15: 74536432697a6001
May 16 15:07:54 test-ubnt kernel: [   82.014878] FS:  0000000000000000(00=
00) GS:ffff9e259aec0000(0063) knlGS:00000000f6bbeb40
May 16 15:07:54 test-ubnt kernel: [   82.016670] CS:  0010 DS: 002b ES: 0=
02b CR0: 0000000080050033
May 16 15:07:54 test-ubnt kernel: [   82.018450] CR2: 00000000f7d23eac CR=
3: 0000000115b2c000 CR4: 00000000003406e0
May 16 15:07:54 test-ubnt kernel: [   82.020233] Call Trace:
May 16 15:07:54 test-ubnt kernel: [   82.021995]  ? proc_do_submiturb+0xa=
f1/0xc70
May 16 15:07:54 test-ubnt kernel: [   82.023748]  proc_do_submiturb+0xaf1=
/0xc70
May 16 15:07:54 test-ubnt kernel: [   82.025486]  proc_submiturb_compat+0=
x81/0xb0
May 16 15:07:54 test-ubnt kernel: [   82.027226]  usbdev_do_ioctl+0x930/0=
xd70
May 16 15:07:54 test-ubnt kernel: [   82.028964]  ? call_rwsem_wake+0x1b/=
0x30
May 16 15:07:54 test-ubnt kernel: [   82.030681]  ? _copy_from_user+0x3e/=
0x60
May 16 15:07:54 test-ubnt kernel: [   82.032359]  usbdev_compat_ioctl+0x1=
0/0x20
May 16 15:07:54 test-ubnt kernel: [   82.034002]  __ia32_compat_sys_ioctl=
+0x13d/0x230
May 16 15:07:54 test-ubnt kernel: [   82.035609]  do_fast_syscall_32+0x9b=
/0x210
May 16 15:07:54 test-ubnt kernel: [   82.037178]  entry_SYSCALL_compat_af=
ter_hwframe+0x45/0x4d
May 16 15:07:54 test-ubnt kernel: [   82.038718] RIP: 0023:0xf7f7a929
May 16 15:07:54 test-ubnt kernel: [   82.040217] Code: 85 d2 74 02 89 0a =
5b 5d c3 8b 04 24 c3 8b 14 24 c3 8b 34 24 c3 8b 3c 24 c3 90 90 90 90 90 9=
0 90 90 51 52 55 89 cd 0f 05 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 =
00 00 00 8d b4 26 00 00 00 00
May 16 15:07:54 test-ubnt kernel: [   82.043232] RSP: 002b:00000000f6bbe1=
c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
May 16 15:07:54 test-ubnt kernel: [   82.044708] RAX: ffffffffffffffda RB=
X: 0000000000000008 RCX: 00000000802c550a
May 16 15:07:54 test-ubnt kernel: [   82.046154] RDX: 00000000f5a00660 RS=
I: 0000000000000081 RDI: 0000000056dc6a80
May 16 15:07:54 test-ubnt kernel: [   82.047564] RBP: 00000000f6bbe238 R0=
8: 0000000000000000 R09: 0000000000000000
May 16 15:07:54 test-ubnt kernel: [   82.048937] R10: 0000000000000000 R1=
1: 0000000000000000 R12: 0000000000000000
May 16 15:07:54 test-ubnt kernel: [   82.050267] R13: 0000000000000000 R1=
4: 0000000000000000 R15: 0000000000000000
May 16 15:07:54 test-ubnt kernel: [   82.051555] Modules linked in: nls_i=
so8859_1 dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua edac_mce_amd =
ccp kvm irqbypass snd_hda_codec_realtek snd_hda_codec_generic ledtrig_aud=
io crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi ghash_clmulni_intel s=
nd_hda_intel snd_hda_codec eeepc_wmi snd_hda_core asus_wmi sparse_keymap =
wmi_bmof k10temp snd_hwdep snd_pcm snd_timer snd input_leds joydev usbser=
ial soundcore mac_hid sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_core is=
csi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables x_tables aut=
ofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov async_memcpy as=
ync_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath li=
near hid_generic usbhid hid amdgpu chash gpu_sched amd_iommu_v2 i2c_algo_=
bit aesni_intel ttm aes_x86_64 crypto_simd drm_kms_helper cryptd glue_hel=
per syscopyarea sysfillrect sysimgblt i2c_piix4 fb_sys_fops drm r8169 ahc=
i realtek libahci wmi video gpio_amdpt gpio_generic [last unloaded: ftdi_=
sio]
May 16 15:07:54 test-ubnt kernel: [   82.060732] ---[ end trace 0f9fef913=
19fb2b2 ]---
May 16 15:07:54 test-ubnt kernel: [   82.062293] RIP: 0010:__kmalloc+0xa5=
/0x220
May 16 15:07:54 test-ubnt kernel: [   82.063549] Code: 65 49 8b 50 08 65 =
4c 03 05 90 c5 d8 54 4d 8b 38 4d 85 ff 0f 84 2e 01 00 00 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 f8 4c 01 fb <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 74 bd
May 16 15:07:54 test-ubnt kernel: [   82.066164] RSP: 0018:ffffb415c0f1fc=
d0 EFLAGS: 00010202
May 16 15:07:54 test-ubnt kernel: [   82.067483] RAX: 74536432697a6001 RB=
X: 74536432697a6001 RCX: 0000000000004a47
May 16 15:07:54 test-ubnt kernel: [   82.068784] RDX: 0000000000004a46 RS=
I: 0000000000000cc0 RDI: 00000000000281a0
May 16 15:07:55 test-ubnt kernel: [   82.070094] RBP: ffffb415c0f1fd00 R0=
8: ffff9e259aee81a0 R09: ffff9e259a806b80
May 16 15:07:55 test-ubnt kernel: [   82.071386] R10: ffff9e258ac616f0 R1=
1: ffff9e2591f3a400 R12: 0000000000000cc0
May 16 15:07:55 test-ubnt kernel: [   82.072707] R13: 0000000000001000 R1=
4: ffff9e259a806b80 R15: 74536432697a6001
May 16 15:07:55 test-ubnt kernel: [   82.074146] FS:  0000000000000000(00=
00) GS:ffff9e259aec0000(0063) knlGS:00000000f6bbeb40
May 16 15:07:55 test-ubnt kernel: [   82.076119] CS:  0010 DS: 002b ES: 0=
02b CR0: 0000000080050033
May 16 15:07:55 test-ubnt kernel: [   82.078081] CR2: 00000000f7d23eac CR=
3: 0000000115b2c000 CR4: 00000000003406e0
May 16 15:08:51 test-ubnt kernel: [  138.171155] general protection fault=
: 0000 [#2] SMP NOPTI
May 16 15:08:51 test-ubnt kernel: [  138.173331] CPU: 3 PID: 1062 Comm: s=
ystemd-udevd Tainted: G      D           5.1.1-050101-generic #2019051106=
31
May 16 15:08:51 test-ubnt kernel: [  138.175709] Hardware name: System ma=
nufacturer System Product Name/PRIME A320M-K, BIOS 4801 04/25/2019
May 16 15:08:51 test-ubnt kernel: [  138.178238] RIP: 0010:kmem_cache_all=
oc_trace+0x85/0x1d0
May 16 15:08:51 test-ubnt kernel: [  138.180420] Code: 65 49 8b 50 08 65 =
4c 03 05 10 cc d8 54 4d 8b 30 4d 85 f6 0f 84 00 01 00 00 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 f0 4c 01 f3 <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 74 bd
May 16 15:08:51 test-ubnt kernel: [  138.182236] RSP: 0018:ffffb415c1807c=
50 EFLAGS: 00010202
May 16 15:08:51 test-ubnt kernel: [  138.183149] RAX: 74536432697a6001 RB=
X: 74536432697a6001 RCX: 0000000000004a47
May 16 15:08:51 test-ubnt kernel: [  138.184063] RDX: 0000000000004a46 RS=
I: 0000000000000dc0 RDI: 00000000000281a0
May 16 15:08:51 test-ubnt kernel: [  138.184972] RBP: ffffb415c1807c88 R0=
8: ffff9e259aee81a0 R09: ffff9e259a806b80
May 16 15:08:51 test-ubnt kernel: [  138.185881] R10: 0000000000006469 R1=
1: 0000000000000002 R12: ffff9e259a806b80
May 16 15:08:51 test-ubnt kernel: [  138.186787] R13: 0000000000000dc0 R1=
4: 74536432697a6001 R15: ffffffffab3549d3
May 16 15:08:51 test-ubnt kernel: [  138.187692] FS:  00007f8333a878c0(00=
00) GS:ffff9e259aec0000(0000) knlGS:0000000000000000
May 16 15:08:51 test-ubnt kernel: [  138.188608] CS:  0010 DS: 0000 ES: 0=
000 CR0: 0000000080050033
May 16 15:08:51 test-ubnt kernel: [  138.189527] CR2: 00007ffd4908efc0 CR=
3: 0000000033e8c000 CR4: 00000000003406e0
May 16 15:08:51 test-ubnt kernel: [  138.190456] Call Trace:
May 16 15:08:51 test-ubnt kernel: [  138.191389]  ? current_time+0x46/0x8=
0
May 16 15:08:51 test-ubnt kernel: [  138.192544]  kernfs_iop_get_link+0x4=
3/0x1f0
May 16 15:08:51 test-ubnt kernel: [  138.194494]  ? touch_atime+0x33/0xe0=

May 16 15:08:51 test-ubnt kernel: [  138.196357]  trailing_symlink+0x1be/=
0x260
May 16 15:08:51 test-ubnt kernel: [  138.198215]  path_lookupat.isra.45+0=
x79/0x220
May 16 15:08:51 test-ubnt kernel: [  138.200073]  filename_lookup.part.61=
+0xa0/0x170
May 16 15:08:51 test-ubnt kernel: [  138.201926]  ? strncpy_from_user+0x5=
6/0x1b0
May 16 15:08:51 test-ubnt kernel: [  138.203744]  user_path_at_empty+0x3e=
/0x50
May 16 15:08:51 test-ubnt kernel: [  138.205509]  do_faccessat+0xa7/0x240=

May 16 15:08:51 test-ubnt kernel: [  138.207256]  __x64_sys_access+0x1b/0=
x20
May 16 15:08:51 test-ubnt kernel: [  138.208985]  do_syscall_64+0x5a/0x11=
0
May 16 15:08:51 test-ubnt kernel: [  138.210712]  entry_SYSCALL_64_after_=
hwframe+0x44/0xa9
May 16 15:08:51 test-ubnt kernel: [  138.212455] RIP: 0033:0x7f8333d0a0e7=

May 16 15:08:51 test-ubnt kernel: [  138.214194] Code: 77 01 c3 48 8b 15 =
a9 6d 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 0=
0 00 00 66 90 b8 15 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 =
79 6d 0d 00 f7 d8 64 89 02 b8
May 16 15:08:51 test-ubnt kernel: [  138.217835] RSP: 002b:00007ffd4908e3=
b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000015
May 16 15:08:51 test-ubnt kernel: [  138.219616] RAX: ffffffffffffffda RB=
X: 00007ffd4908e490 RCX: 00007f8333d0a0e7
May 16 15:08:51 test-ubnt kernel: [  138.221354] RDX: 0000000000000002 RS=
I: 0000000000000000 RDI: 00007ffd4908e3c0
May 16 15:08:51 test-ubnt kernel: [  138.223059] RBP: 00007ffd4908f4d0 R0=
8: 0000000000000000 R09: 002f7373616c632f
May 16 15:08:51 test-ubnt kernel: [  138.224702] R10: 00005599712ca4e0 R1=
1: 0000000000000246 R12: 00007ffd4908f505
May 16 15:08:51 test-ubnt kernel: [  138.226295] R13: 00007ffd4908e4a8 R1=
4: 00007ffd4908f501 R15: 00007ffd4908e4a8
May 16 15:08:51 test-ubnt kernel: [  138.227844] Modules linked in: nls_i=
so8859_1 dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua edac_mce_amd =
ccp kvm irqbypass snd_hda_codec_realtek snd_hda_codec_generic ledtrig_aud=
io crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi ghash_clmulni_intel s=
nd_hda_intel snd_hda_codec eeepc_wmi snd_hda_core asus_wmi sparse_keymap =
wmi_bmof k10temp snd_hwdep snd_pcm snd_timer snd input_leds joydev usbser=
ial soundcore mac_hid sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_core is=
csi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables x_tables aut=
ofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov async_memcpy as=
ync_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath li=
near hid_generic usbhid hid amdgpu chash gpu_sched amd_iommu_v2 i2c_algo_=
bit aesni_intel ttm aes_x86_64 crypto_simd drm_kms_helper cryptd glue_hel=
per syscopyarea sysfillrect sysimgblt i2c_piix4 fb_sys_fops drm r8169 ahc=
i realtek libahci wmi video gpio_amdpt gpio_generic [last unloaded: ftdi_=
sio]
May 16 15:08:51 test-ubnt kernel: [  138.239801] ---[ end trace 0f9fef913=
19fb2b3 ]---
May 16 15:08:51 test-ubnt kernel: [  138.242038] RIP: 0010:__kmalloc+0xa5=
/0x220
May 16 15:08:51 test-ubnt kernel: [  138.243818] Code: 65 49 8b 50 08 65 =
4c 03 05 90 c5 d8 54 4d 8b 38 4d 85 ff 0f 84 2e 01 00 00 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 f8 4c 01 fb <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 74 bd
May 16 15:08:51 test-ubnt kernel: [  138.247536] RSP: 0018:ffffb415c0f1fc=
d0 EFLAGS: 00010202
May 16 15:08:51 test-ubnt kernel: [  138.249384] RAX: 74536432697a6001 RB=
X: 74536432697a6001 RCX: 0000000000004a47
May 16 15:08:51 test-ubnt kernel: [  138.251232] RDX: 0000000000004a46 RS=
I: 0000000000000cc0 RDI: 00000000000281a0
May 16 15:08:51 test-ubnt kernel: [  138.253087] RBP: ffffb415c0f1fd00 R0=
8: ffff9e259aee81a0 R09: ffff9e259a806b80
May 16 15:08:51 test-ubnt kernel: [  138.254956] R10: ffff9e258ac616f0 R1=
1: ffff9e2591f3a400 R12: 0000000000000cc0
May 16 15:08:51 test-ubnt kernel: [  138.256857] R13: 0000000000001000 R1=
4: ffff9e259a806b80 R15: 74536432697a6001
May 16 15:08:51 test-ubnt kernel: [  138.258767] FS:  00007f8333a878c0(00=
00) GS:ffff9e259aec0000(0000) knlGS:0000000000000000
May 16 15:08:51 test-ubnt kernel: [  138.260728] CS:  0010 DS: 0000 ES: 0=
000 CR0: 0000000080050033
May 16 15:08:51 test-ubnt kernel: [  138.262696] CR2: 00007ffd4908efc0 CR=
3: 0000000033e8c000 CR4: 00000000003406e0
May 16 15:08:51 test-ubnt kernel: [  138.266791] general protection fault=
: 0000 [#3] SMP NOPTI
May 16 15:08:51 test-ubnt kernel: [  138.267831] CPU: 3 PID: 728 Comm: kw=
orker/3:2 Tainted: G      D           5.1.1-050101-generic #201905110631
May 16 15:08:51 test-ubnt kernel: [  138.268889] Hardware name: System ma=
nufacturer System Product Name/PRIME A320M-K, BIOS 4801 04/25/2019
May 16 15:08:51 test-ubnt kernel: [  138.269961] Workqueue: memcg_kmem_ca=
che memcg_kmem_cache_create_func
May 16 15:08:51 test-ubnt kernel: [  138.271048] RIP: 0010:kmem_cache_all=
oc_trace+0x85/0x1d0
May 16 15:08:51 test-ubnt kernel: [  138.272128] Code: 65 49 8b 50 08 65 =
4c 03 05 10 cc d8 54 4d 8b 30 4d 85 f6 0f 84 00 01 00 00 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 f0 4c 01 f3 <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 74 bd
May 16 15:08:51 test-ubnt kernel: [  138.274364] RSP: 0018:ffffb415c10ffc=
50 EFLAGS: 00010202
May 16 15:08:51 test-ubnt kernel: [  138.275485] RAX: 74536432697a6001 RB=
X: 74536432697a6001 RCX: 0000000000004a47
May 16 15:08:51 test-ubnt kernel: [  138.276594] RDX: 0000000000004a46 RS=
I: 0000000000000dc0 RDI: 00000000000281a0
May 16 15:08:51 test-ubnt kernel: [  138.277693] RBP: ffffb415c10ffc88 R0=
8: ffff9e259aee81a0 R09: ffff9e259a806b80
May 16 15:08:51 test-ubnt kernel: [  138.278778] R10: ffff9e258e9f8178 R1=
1: ffff9e259a83deb0 R12: ffff9e259a806b80
May 16 15:08:51 test-ubnt kernel: [  138.279842] R13: 0000000000000dc0 R1=
4: 74536432697a6001 R15: ffffffffaba2dc8c
May 16 15:08:51 test-ubnt kernel: [  138.280902] FS:  0000000000000000(00=
00) GS:ffff9e259aec0000(0000) knlGS:0000000000000000
May 16 15:08:51 test-ubnt kernel: [  138.281963] CS:  0010 DS: 0000 ES: 0=
000 CR0: 0000000080050033
May 16 15:08:51 test-ubnt kernel: [  138.283026] CR2: 00007ffd0bb96bd8 CR=
3: 0000000033f2c000 CR4: 00000000003406e0
May 16 15:08:51 test-ubnt kernel: [  138.284089] Call Trace:
May 16 15:08:51 test-ubnt kernel: [  138.285150]  kobject_uevent_env+0xbc=
/0x7c0
May 16 15:08:51 test-ubnt kernel: [  138.286210]  ? internal_create_group=
+0x268/0x360
May 16 15:08:51 test-ubnt kernel: [  138.287266]  kobject_uevent+0xb/0x10=

May 16 15:08:51 test-ubnt kernel: [  138.288309]  sysfs_slab_add+0x1fa/0x=
2f0
May 16 15:08:51 test-ubnt kernel: [  138.289346]  __kmem_cache_create+0x1=
25/0x150
May 16 15:08:51 test-ubnt kernel: [  138.290377]  ? _cond_resched+0x19/0x=
30
May 16 15:08:51 test-ubnt kernel: [  138.291409]  ? kmem_cache_alloc+0x15=
c/0x1c0
May 16 15:08:51 test-ubnt kernel: [  138.292440]  create_cache+0xcf/0x1e0=

May 16 15:08:51 test-ubnt kernel: [  138.293469]  memcg_create_kmem_cache=
+0x102/0x130
May 16 15:08:51 test-ubnt kernel: [  138.294502]  memcg_kmem_cache_create=
_func+0x20/0x70
May 16 15:08:51 test-ubnt kernel: [  138.295544]  process_one_work+0x20f/=
0x410
May 16 15:08:51 test-ubnt kernel: [  138.296576]  worker_thread+0x34/0x40=
0
May 16 15:08:51 test-ubnt kernel: [  138.297605]  kthread+0x120/0x140
May 16 15:08:51 test-ubnt kernel: [  138.298631]  ? process_one_work+0x41=
0/0x410
May 16 15:08:51 test-ubnt kernel: [  138.299662]  ? __kthread_parkme+0x70=
/0x70
May 16 15:08:51 test-ubnt kernel: [  138.300690]  ret_from_fork+0x22/0x40=

May 16 15:08:51 test-ubnt kernel: [  138.301718] Modules linked in: nls_i=
so8859_1 dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua edac_mce_amd =
ccp kvm irqbypass snd_hda_codec_realtek snd_hda_codec_generic ledtrig_aud=
io crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi ghash_clmulni_intel s=
nd_hda_intel snd_hda_codec eeepc_wmi snd_hda_core asus_wmi sparse_keymap =
wmi_bmof k10temp snd_hwdep snd_pcm snd_timer snd input_leds joydev usbser=
ial soundcore mac_hid sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_core is=
csi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables x_tables aut=
ofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov async_memcpy as=
ync_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath li=
near hid_generic usbhid hid amdgpu chash gpu_sched amd_iommu_v2 i2c_algo_=
bit aesni_intel ttm aes_x86_64 crypto_simd drm_kms_helper cryptd glue_hel=
per syscopyarea sysfillrect sysimgblt i2c_piix4 fb_sys_fops drm r8169 ahc=
i realtek libahci wmi video gpio_amdpt gpio_generic [last unloaded: ftdi_=
sio]
May 16 15:08:51 test-ubnt kernel: [  138.309577] ---[ end trace 0f9fef913=
19fb2b4 ]---
May 16 15:08:51 test-ubnt kernel: [  138.310794] RIP: 0010:__kmalloc+0xa5=
/0x220
May 16 15:08:51 test-ubnt kernel: [  138.311942] Code: 65 49 8b 50 08 65 =
4c 03 05 90 c5 d8 54 4d 8b 38 4d 85 ff 0f 84 2e 01 00 00 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 f8 4c 01 fb <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 74 bd
May 16 15:08:51 test-ubnt kernel: [  138.314307] RSP: 0018:ffffb415c0f1fc=
d0 EFLAGS: 00010202
May 16 15:08:51 test-ubnt kernel: [  138.315461] RAX: 74536432697a6001 RB=
X: 74536432697a6001 RCX: 0000000000004a47
May 16 15:08:51 test-ubnt kernel: [  138.316603] RDX: 0000000000004a46 RS=
I: 0000000000000cc0 RDI: 00000000000281a0
May 16 15:08:51 test-ubnt kernel: [  138.318102] RBP: ffffb415c0f1fd00 R0=
8: ffff9e259aee81a0 R09: ffff9e259a806b80
May 16 15:08:51 test-ubnt kernel: [  138.320083] R10: ffff9e258ac616f0 R1=
1: ffff9e2591f3a400 R12: 0000000000000cc0
May 16 15:08:51 test-ubnt kernel: [  138.322016] R13: 0000000000001000 R1=
4: ffff9e259a806b80 R15: 74536432697a6001
May 16 15:08:51 test-ubnt kernel: [  138.323910] FS:  0000000000000000(00=
00) GS:ffff9e259aec0000(0000) knlGS:0000000000000000
May 16 15:08:51 test-ubnt kernel: [  138.325699] CS:  0010 DS: 0000 ES: 0=
000 CR0: 0000000080050033
May 16 15:08:51 test-ubnt kernel: [  138.326768] CR2: 00007ffd0bb96bd8 CR=
3: 0000000033f2c000 CR4: 00000000003406e0
May 16 15:08:51 test-ubnt kernel: [  138.859421] general protection fault=
: 0000 [#4] SMP NOPTI
May 16 15:08:51 test-ubnt kernel: [  138.860960] CPU: 3 PID: 1069 Comm: s=
shd Tainted: G      D           5.1.1-050101-generic #201905110631
May 16 15:08:51 test-ubnt kernel: [  138.862946] Hardware name: System ma=
nufacturer System Product Name/PRIME A320M-K, BIOS 4801 04/25/2019
May 16 15:08:51 test-ubnt kernel: [  138.864412] RIP: 0010:__kmalloc_node=
_track_caller+0x182/0x2b0
May 16 15:08:51 test-ubnt kernel: [  138.865868] Code: 46 0b 04 0f 84 0d =
ff ff ff 4c 89 f7 e8 f7 b6 01 00 49 89 c1 e9 fd fe ff ff 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 d0 4c 01 d3 <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 0f 84
May 16 15:08:51 test-ubnt kernel: [  138.869016] RSP: 0018:ffffb415c126ba=
b8 EFLAGS: 00010202
May 16 15:08:51 test-ubnt kernel: [  138.870523] RAX: 74536432697a6001 RB=
X: 74536432697a6001 RCX: 0000000000004a47
May 16 15:08:51 test-ubnt kernel: [  138.872023] RDX: 0000000000004a46 RS=
I: 0000000000082cc0 RDI: 00000000000281a0
May 16 15:08:51 test-ubnt kernel: [  138.873509] RBP: ffffb415c126baf0 R0=
8: ffff9e259aee81a0 R09: ffff9e259a806b80
May 16 15:08:51 test-ubnt kernel: [  138.874999] R10: 74536432697a6001 R1=
1: 0000000000000000 R12: 0000000000082cc0
May 16 15:08:51 test-ubnt kernel: [  138.876482] R13: 0000000000001000 R1=
4: ffff9e259a806b80 R15: 00000000ffffffff
May 16 15:08:51 test-ubnt kernel: [  138.877956] FS:  00007f2d6dba7e40(00=
00) GS:ffff9e259aec0000(0000) knlGS:0000000000000000
May 16 15:08:51 test-ubnt kernel: [  138.879427] CS:  0010 DS: 0000 ES: 0=
000 CR0: 0000000080050033
May 16 15:08:51 test-ubnt kernel: [  138.880881] CR2: 00007f2d6ded5930 CR=
3: 0000000033fe0000 CR4: 00000000003406e0
May 16 15:08:51 test-ubnt kernel: [  138.882344] Call Trace:
May 16 15:08:51 test-ubnt kernel: [  138.883778]  ? __alloc_skb+0x87/0x1d=
0
May 16 15:08:51 test-ubnt kernel: [  138.885175]  __kmalloc_reserve.isra.=
53+0x31/0x90
May 16 15:08:51 test-ubnt kernel: [  138.886567]  ? __alloc_skb+0x5b/0x1d=
0
May 16 15:08:51 test-ubnt kernel: [  138.887949]  __alloc_skb+0x87/0x1d0
May 16 15:08:51 test-ubnt kernel: [  138.889321]  netlink_dump+0x11c/0x38=
0
May 16 15:08:51 test-ubnt kernel: [  138.890685]  __netlink_dump_start+0x=
177/0x1e0
May 16 15:08:51 test-ubnt kernel: [  138.892058]  ? rtnl_xdp_prog_skb+0x7=
0/0x70
May 16 15:08:51 test-ubnt kernel: [  138.893420]  rtnetlink_rcv_msg+0x2b7=
/0x300
May 16 15:08:51 test-ubnt kernel: [  138.894776]  ? rtnl_xdp_prog_skb+0x7=
0/0x70
May 16 15:08:51 test-ubnt kernel: [  138.896118]  ? rtnl_calcit.isra.32+0=
x100/0x100
May 16 15:08:51 test-ubnt kernel: [  138.897450]  netlink_rcv_skb+0x4f/0x=
120
May 16 15:08:51 test-ubnt kernel: [  138.898774]  rtnetlink_rcv+0x15/0x20=

May 16 15:08:51 test-ubnt kernel: [  138.900093]  netlink_unicast+0x19f/0=
x260
May 16 15:08:51 test-ubnt kernel: [  138.901413]  netlink_sendmsg+0x20d/0=
x3c0
May 16 15:08:51 test-ubnt kernel: [  138.902728]  sock_sendmsg+0x3e/0x50
May 16 15:08:51 test-ubnt kernel: [  138.904042]  __sys_sendto+0x114/0x1a=
0
May 16 15:08:51 test-ubnt kernel: [  138.905354]  ? fd_install+0x25/0x30
May 16 15:08:51 test-ubnt kernel: [  138.906661]  ? __sys_socket+0x98/0xf=
0
May 16 15:08:51 test-ubnt kernel: [  138.907972]  __x64_sys_sendto+0x28/0=
x30
May 16 15:08:51 test-ubnt kernel: [  138.909279]  do_syscall_64+0x5a/0x11=
0
May 16 15:08:51 test-ubnt kernel: [  138.910584]  entry_SYSCALL_64_after_=
hwframe+0x44/0xa9
May 16 15:08:51 test-ubnt kernel: [  138.911899] RIP: 0033:0x7f2d6df91007=

May 16 15:08:51 test-ubnt kernel: [  138.913206] Code: 64 89 02 48 c7 c0 =
ff ff ff ff eb b6 0f 1f 80 00 00 00 00 48 8d 05 d9 b3 0c 00 41 89 ca 8b 0=
0 85 c0 75 10 b8 2c 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 71 c3 41 57 4d =
89 c7 41 56 41 89 ce 41 55 49
May 16 15:08:51 test-ubnt kernel: [  138.915953] RSP: 002b:00007ffe0e094c=
48 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
May 16 15:08:51 test-ubnt kernel: [  138.917352] RAX: ffffffffffffffda RB=
X: 00007ffe0e095d30 RCX: 00007f2d6df91007
May 16 15:08:51 test-ubnt kernel: [  138.918765] RDX: 0000000000000014 RS=
I: 00007ffe0e095d30 RDI: 0000000000000003
May 16 15:08:51 test-ubnt kernel: [  138.920176] RBP: 00007ffe0e095d80 R0=
8: 00007ffe0e095cd4 R09: 000000000000000c
May 16 15:08:51 test-ubnt kernel: [  138.921553] R10: 0000000000000000 R1=
1: 0000000000000246 R12: 00007ffe0e095cd4
May 16 15:08:51 test-ubnt kernel: [  138.922899] R13: 0000000000000000 R1=
4: 00007ffe0e095f10 R15: 0000000000000003
May 16 15:08:51 test-ubnt kernel: [  138.924209] Modules linked in: nls_i=
so8859_1 dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua edac_mce_amd =
ccp kvm irqbypass snd_hda_codec_realtek snd_hda_codec_generic ledtrig_aud=
io crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi ghash_clmulni_intel s=
nd_hda_intel snd_hda_codec eeepc_wmi snd_hda_core asus_wmi sparse_keymap =
wmi_bmof k10temp snd_hwdep snd_pcm snd_timer snd input_leds joydev usbser=
ial soundcore mac_hid sch_fq_codel ib_iser rdma_cm iw_cm ib_cm ib_core is=
csi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi ip_tables x_tables aut=
ofs4 btrfs zstd_compress raid10 raid456 async_raid6_recov async_memcpy as=
ync_pq async_xor async_tx xor raid6_pq libcrc32c raid1 raid0 multipath li=
near hid_generic usbhid hid amdgpu chash gpu_sched amd_iommu_v2 i2c_algo_=
bit aesni_intel ttm aes_x86_64 crypto_simd drm_kms_helper cryptd glue_hel=
per syscopyarea sysfillrect sysimgblt i2c_piix4 fb_sys_fops drm r8169 ahc=
i realtek libahci wmi video gpio_amdpt gpio_generic [last unloaded: ftdi_=
sio]
May 16 15:08:51 test-ubnt kernel: [  138.933725] ---[ end trace 0f9fef913=
19fb2b5 ]---
May 16 15:08:51 test-ubnt kernel: [  138.935772] RIP: 0010:__kmalloc+0xa5=
/0x220
May 16 15:08:51 test-ubnt kernel: [  138.937427] Code: 65 49 8b 50 08 65 =
4c 03 05 90 c5 d8 54 4d 8b 38 4d 85 ff 0f 84 2e 01 00 00 41 8b 59 20 49 8=
b 39 48 8d 4a 01 4c 89 f8 4c 01 fb <48> 33 1b 49 33 99 38 01 00 00 65 48 =
0f c7 0f 0f 94 c0 84 c0 74 bd
May 16 15:08:51 test-ubnt kernel: [  138.940437] RSP: 0018:ffffb415c0f1fc=
d0 EFLAGS: 00010202
May 16 15:08:51 test-ubnt kernel: [  138.941995] RAX: 74536432697a6001 RB=
X: 74536432697a6001 RCX: 0000000000004a47
May 16 15:08:51 test-ubnt kernel: [  138.943518] RDX: 0000000000004a46 RS=
I: 0000000000000cc0 RDI: 00000000000281a0
May 16 15:08:51 test-ubnt kernel: [  138.945010] RBP: ffffb415c0f1fd00 R0=
8: ffff9e259aee81a0 R09: ffff9e259a806b80
May 16 15:08:51 test-ubnt kernel: [  138.946511] R10: ffff9e258ac616f0 R1=
1: ffff9e2591f3a400 R12: 0000000000000cc0
May 16 15:08:51 test-ubnt kernel: [  138.948031] R13: 0000000000001000 R1=
4: ffff9e259a806b80 R15: 74536432697a6001
May 16 15:08:51 test-ubnt kernel: [  138.949561] FS:  00007f2d6dba7e40(00=
00) GS:ffff9e259aec0000(0000) knlGS:0000000000000000
May 16 15:08:51 test-ubnt kernel: [  138.951075] CS:  0010 DS: 0000 ES: 0=
000 CR0: 0000000080050033
May 16 15:08:51 test-ubnt kernel: [  138.952588] CR2: 00007f2d6ded5930 CR=
3: 0000000033fe0000 CR4: 00000000003406e0

--------------F1C1EF1AC47912FA9FC3959B--
